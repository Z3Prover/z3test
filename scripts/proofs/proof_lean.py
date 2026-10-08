"""Isolated native certificate production and Lean checking for proof_matrix."""
import argparse
import builtins
import ctypes
import hashlib
import importlib
import io
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import subprocess
import sys
import tempfile
import time
import warnings


def digest(data):
    return hashlib.sha256(data).hexdigest()


def read_source(path):
    with Path(path).open(encoding="utf-8", newline="") as stream:
        return stream.read()


def _reply(proc):
    if proc.returncode:
        raise ValueError((proc.stderr + proc.stdout)[-2000:] or
                         "Lean worker exited with code %d" % proc.returncode)
    reply = json.loads(proc.stdout)
    if not isinstance(reply, dict):
        raise ValueError("invalid Lean worker response")
    return reply


def _run(command, timeout):
    with subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                          text=True, start_new_session=True) as proc:
        try:
            stdout, stderr = proc.communicate(timeout=timeout)
        except subprocess.TimeoutExpired:
            try:
                os.killpg(proc.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
            proc.communicate()
            raise
        return subprocess.CompletedProcess(command, proc.returncode, stdout, stderr)


class LeanChecker:
    def __init__(self, source, executable, artifacts, core="legacy", check_timeout=600):
        if os.name != "posix":
            raise ValueError("--lean currently requires a POSIX host and a CMake build")
        self.source = Path(source).resolve()
        resolved = shutil.which(str(executable))
        if resolved is None:
            raise ValueError("Z3 executable not found: %s" % executable)
        self.executable = Path(resolved).resolve()
        self.artifacts = Path(artifacts).resolve()
        if not math.isfinite(check_timeout) or check_timeout <= 0:
            raise ValueError("--lean-timeout must be finite and positive")
        self.check_timeout = check_timeout
        self.command = [sys.executable, "-I", "-S", str(Path(__file__).resolve()),
                        str(self.source), str(self.executable), "--core", core]
        try:
            self.producer = _reply(self._call("probe"))
            proc = _run([str(self.source / "scripts" / "check_lean.sh")], 600)
            if proc.returncode:
                raise ValueError((proc.stderr + proc.stdout)[-2000:])
        except (OSError, ValueError, subprocess.TimeoutExpired) as error:
            raise ValueError("cannot configure --lean: %s" % error) from error

    def _call(self, action, directory=None, timeout=600):
        command = self.command + [action]
        if directory is not None:
            command += [str(directory), "--timeout", str(timeout)]
        return _run(command, timeout)

    def run(self, source, timeout, record):
        record.update(checker="lean", result=None)
        if not math.isfinite(timeout) or timeout <= 0:
            raise ValueError("--timeout must be finite and positive")
        self.artifacts.mkdir(parents=True, exist_ok=True)
        directory = Path(tempfile.mkdtemp(prefix="proof-", dir=self.artifacts))
        with (directory / "input.smt2").open("w", encoding="utf-8", newline="") as stream:
            stream.write(source)
        record["artifacts"] = str(directory)
        record["input_sha256"] = digest(source.encode("utf-8"))
        start = time.perf_counter()
        try:
            produced = _reply(self._call("produce", directory, timeout))
            record["time"] = round(time.perf_counter() - start, 6)
            record.update(produced)
            if produced.get("producer") != self.producer:
                raise ValueError("producer identity changed after preflight")
            if (record["status"] in ("produced", "not-applicable")
                    and record["expected"] in ("sat", "unsat") and record["result"] != record["expected"]):
                record.update(status="disagree", error="result differs from the proof-free run")
                return record
            if record["status"] != "produced":
                return record
            certificate = directory / "certificate.json"
            certificate_bytes = certificate.read_bytes()
            record["proof_size"] = len(certificate_bytes)
            record["certificate_sha256"] = digest(certificate_bytes)
            record["certificate"] = str(certificate)
        except subprocess.TimeoutExpired:
            record.update(status="timeout", time=timeout, error="native certificate production timed out")
            return record
        except (OSError, ValueError) as error:
            record.update(status="crash", time=round(time.perf_counter() - start, 6), error=str(error))
            return record

        start = time.perf_counter()
        try:
            checked = _reply(self._call("check", directory, self.check_timeout))
            record["check_time"] = round(time.perf_counter() - start, 6)
            if checked["status"] != "lean-verified":
                record.update(status=checked["status"], error=checked["error"])
                return record
            if (checked["certificate_sha256"] != record["certificate_sha256"]
                    or digest(certificate.read_bytes()) != record["certificate_sha256"]
                    or checked["input_sha256"] != record["input_sha256"]
                    or digest((directory / "input.smt2").read_bytes()) != record["input_sha256"]):
                (directory / "checked.lean").unlink(missing_ok=True)
                raise ValueError("input or certificate changed during Lean checking")
            record.update(status="lean-verified", lean_proof=str(directory / "checked.lean"),
                          lean_sha256=checked["lean_sha256"])
        except subprocess.TimeoutExpired:
            record.update(status="timeout", check_time=self.check_timeout, error="Lean checking timed out")
        except (OSError, ValueError) as error:
            record.update(status="checker-rejected", error=str(error))
        return record


def _load(source, executable, core="legacy"):
    """Select only the source tools and the executable's sibling CMake bindings."""
    build = executable.parent
    bindings = build / "python"
    suffix = "dll" if sys.platform == "win32" else "dylib" if sys.platform == "darwin" else "so"
    library = build / ("libz3." + suffix)
    required = [bindings / "z3" / "__init__.py", library, source / "scripts" / "check_lean.sh",
                source / "lean" / "lean-toolchain"]
    examples = source / "examples" / "python"
    required += [examples / (name + ".py") for name in ("proof_certificate", "proof_to_lean")]
    if core == "clause-log":
        required.append(examples / "proof_clause_log.py")
    for path in required:
        if not path.is_file():
            raise ValueError("required Lean/CMake build file not found: %s" % path)
    # The binding loader consults this before system library directories.
    ctypes.CDLL(str(library))
    builtins.Z3_LIB_DIRS = [str(build)]
    sys.path[:0] = [str(examples), str(bindings)]
    z3 = importlib.import_module("z3")
    exporter = importlib.import_module("proof_certificate")
    consumer = importlib.import_module("proof_to_lean")
    modules = [(z3, bindings / "z3" / "__init__.py"),
               (exporter, examples / "proof_certificate.py"),
               (consumer, examples / "proof_to_lean.py")]
    if core == "clause-log":
        modules.append((importlib.import_module("proof_clause_log"), examples / "proof_clause_log.py"))
    for module, path in modules:
        if Path(module.__file__).resolve() != path.resolve():
            raise ValueError("loaded unexpected module: %s" % module.__file__)
    proc = subprocess.run([str(executable), "--version"], capture_output=True, text=True,
                          check=True, timeout=30)
    version = re.search(r"version (\d+)\.(\d+)\.(\d+)(?:\.(\d+))?", proc.stdout)
    commit = re.search(r"build hashcode ([0-9a-f]+)", proc.stdout)
    if (version is None or tuple(int(n or 0) for n in version.groups()) != z3.get_version()
            or (commit and commit.group(1) not in z3.get_full_version().split())):
        raise ValueError("Z3 executable and Python library versions do not match")
    identity = {"interface": "z3py", "executable": str(executable),
                "bindings": str(bindings), "library": str(library.resolve()),
                "z3_version": z3.get_full_version(),
                "parameters": {"sat.smt": False, "produce-proofs": True}}
    if core == "clause-log":
        identity.update(interface="smt2", parameters={
            "sat.smt": True, "solver.proof.log": "clause.log", "smt.solve_eqs": False,
            "smt.propagate_values": False, "smt.elim_unconstrained": False, "smt.bound_simplifier": False,
        })
    return z3, exporter, consumer, identity


def produce(z3, exporter, source, directory, timeout):
    z3.set_param("sat.smt", False)
    context = z3.Context(proof=True)
    try:
        assertions = exporter.parse_propositional_assertions(source, context)
    except exporter.ProofExportError as error:
        return {"result": None, "status": "unsupported", "error": str(error)}
    solver = z3.Solver(ctx=context)
    solver.set(timeout=max(1, int(timeout * 1000)))
    solver.add(assertions)
    start = time.perf_counter()
    result = solver.check()
    report = {"result": str(result), "solve_time": time.perf_counter() - start,
              "statistics": {key: value for key, value in solver.statistics()},
              "timeout_ms": max(1, int(timeout * 1000))}
    if result != z3.unsat:
        report["status"] = "not-applicable"
        if result == z3.unknown:
            report["error"] = solver.reason_unknown()
            if report["error"] == "timeout":
                report["status"] = "timeout"
        return report
    try:
        certificate = exporter._certificate_from_proof(source, assertions, solver.proof())
    except exporter.ProofExportError as error:
        return dict(report, status="unsupported", error=str(error))
    return _save_certificate(certificate, directory, report)


def _save_certificate(certificate, directory, report):
    with (directory / "certificate.json").open("x", encoding="utf-8") as stream:
        json.dump(certificate, stream, indent=2, sort_keys=True)
        stream.write("\n")
    return dict(report, status="produced", rules=certificate["rule_counts"])


def produce_clause_log(z3, exporter, source, directory, timeout, executable):
    """Reconstruct the retained log from a single executable run."""
    context = z3.Context()
    try:
        assertions, fragment = exporter.parse_assertions(source, context)
        assertion_text = exporter._assertion_commands(source)
    except exporter.ProofExportError as error:
        return {"result": None, "status": "unsupported", "error": str(error)}
    options = '(set-option :sat.smt true)\n(set-option :solver.proof.log "clause.log")\n'
    (directory / "solver.smt2").write_text(
        options + exporter._NO_PREPROCESSING + assertion_text + "\n(check-sat)\n", encoding="utf-8")
    start = time.perf_counter()
    try:
        proc = subprocess.run([str(executable), "solver.smt2"], cwd=directory,
                              capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        return {"result": None, "status": "timeout", "solve_time": time.perf_counter() - start,
                "error": "clause-log solver timed out"}
    results = re.findall(r"^(sat|unsat|unknown)\s*$", proc.stdout, re.MULTILINE)
    report = {"result": results[0] if len(results) == 1 else None,
              "solve_time": time.perf_counter() - start, "fragment": fragment}
    if proc.returncode or "(error" in proc.stdout or len(results) != 1:
        return dict(report, status="crash", error=(proc.stderr + proc.stdout)[-2000:])
    if report["result"] != "unsat":
        return dict(report, status="not-applicable")
    log = directory / "clause.log"
    if not log.is_file():
        return dict(report, status="no-proof", error="the solver did not write a clause log")
    data = log.read_bytes()
    report.update(clause_log=str(log), clause_log_sha256=digest(data),
                  log_inferences=data.count(b"(infer"))
    replay = importlib.import_module("proof_clause_log")
    try:
        text = data.decode("utf-8")
        if hasattr(replay, "trim_clause_log"):
            start = time.perf_counter()
            with warnings.catch_warnings(record=True) as diagnostics:
                warnings.simplefilter("always")
                core = replay.trim_clause_log(executable, text, timeout)
            report["trim_time"] = time.perf_counter() - start
            if diagnostics:
                path = directory / "trimming-diagnostics.txt"
                path.write_text("\n".join(str(w.message) for w in diagnostics), encoding="utf-8")
                report["trim_diagnostics"] = str(path)
            if core != text:
                path = directory / "clause-core.log"
                path.write_text(core, encoding="utf-8")
                report.update(trimmed_log=str(path), trimmed_log_sha256=digest(path.read_bytes()),
                              trimmed_inferences=core.count("(infer"))
                text = core
        certificate = replay.build_certificate(source, fragment, assertions, text, context)
    except subprocess.TimeoutExpired:
        return dict(report, status="timeout", error="native proof trimming timed out")
    except exporter.ProofExportError as error:
        return dict(report, status="unsupported", error=str(error))
    return _save_certificate(certificate, directory, report)


def check(consumer, source, directory):
    certificate_bytes = (directory / "certificate.json").read_bytes()
    certificate = consumer.load_certificate(io.StringIO(certificate_bytes.decode("utf-8")))
    output = directory / "checked.lean"
    try:
        consumer.check_and_write(source, certificate, output)
    except consumer.ReconstructionError as error:
        return {"status": "checker-rejected", "error": str(error)}
    except subprocess.CalledProcessError as error:
        return {"status": "checker-rejected", "error": (error.stdout + error.stderr)[-2000:]}
    return {"status": "lean-verified", "certificate_sha256": digest(certificate_bytes),
            "input_sha256": digest(source.encode("utf-8")), "lean_sha256": digest(output.read_bytes())}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("executable", type=Path)
    parser.add_argument("action", choices=("probe", "produce", "check"))
    parser.add_argument("directory", type=Path, nargs="?")
    parser.add_argument("--timeout", type=float, default=600)
    parser.add_argument("--core", choices=("legacy", "clause-log"), default="legacy")
    args = parser.parse_args()
    try:
        z3, exporter, consumer, identity = _load(args.source, args.executable, args.core)
        if args.action == "probe":
            report = identity
        else:
            if args.directory is None:
                raise ValueError("an artifact directory is required")
            source = read_source(args.directory / "input.smt2")
            if args.action == "produce":
                if args.core == "clause-log":
                    report = produce_clause_log(z3, exporter, source, args.directory, args.timeout, args.executable)
                else:
                    report = produce(z3, exporter, source, args.directory, args.timeout)
                report["producer"] = identity
            else:
                report = check(consumer, source, args.directory)
        json.dump(report, sys.stdout)
        sys.stdout.write("\n")
    except (ImportError, OSError, ValueError, subprocess.SubprocessError) as error:
        parser.exit(2, "Lean worker: %s\n" % error)


if __name__ == "__main__":
    main()
