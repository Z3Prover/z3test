"""Lean handoff tests; real replay requires Z3_SOURCE and Z3_EXE."""
import json
import importlib
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parent))
import proof_lean
import proof_matrix

_SOURCE = os.environ.get("Z3_SOURCE")
_Z3 = os.environ.get("Z3_EXE")
_CLAUSE_LOG = _SOURCE and (Path(_SOURCE) / "examples" / "python" / "proof_clause_log.py").is_file()
_INPUT = "(declare-const p Bool)\r\n(assert p)\r\n(assert (not p))\r\n(check-sat)\r\n"


class TestLeanGate(unittest.TestCase):
    def test_real_lra_benchmark_retains_the_upstream_input(self):
        path = (Path(__file__).resolve().parents[2] / "regressions" / "proofs" / "lean"
                / "real" / "lra_lassoranker.smt2")
        data = path.read_bytes()
        self.assertEqual(proof_lean.digest(data),
                         "98d82ddb9c67d108fb2c5f0725924d6277ab8faee96adbc3d894be53c36be6a2")
        self.assertEqual(data.count(b"(assert "), 105)
        self.assertEqual(data.count(b"(declare-fun "), 1463)
        self.assertIn(b"(set-logic QF_LRA)", data)
        self.assertIn(b"(set-info :status unsat)", data)

    def test_real_benchmark_is_outside_the_automatic_lean_corpus(self):
        corpus = Path(__file__).resolve().parents[2] / "regressions" / "proofs" / "lean"
        automatic = (set(corpus.glob("boolean_*.smt2")) | set(corpus.glob("lra_*.smt2"))
                     | {corpus / "unit_resolution.smt2"})
        self.assertEqual(len(automatic), 14)
        self.assertNotIn(corpus / "real" / "lra_lassoranker.smt2", automatic)

    def test_requested_certification_cannot_be_skipped_or_annotated_away(self):
        for status in ("verified", "diagnostic", "unverified-fallback", "unsupported", "no-proof",
                       "no-checker", "timeout", "not-applicable", "checker-rejected", "crash"):
            with self.subTest(status=status):
                record = {"checker": "lean", "status": status, "known_failure": True}
                self.assertEqual(proof_matrix.failures([record]), [record])
        self.assertEqual(proof_matrix.failures([{"checker": "lean", "status": "lean-verified"}]), [])

    def test_configuration_is_explicit(self):
        for options in (["--lean"], ["--lean", "--cells", "arith-validate"]):
            result = subprocess.run([sys.executable, proof_matrix.__file__, *options, "unused.smt2"],
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 2)
            self.assertIn("--lean requires", result.stderr)

    def test_worker_errors_are_not_successful_replies(self):
        for stdout, code in (("{}", 1), ("not json", 0), ("[]", 0)):
            with self.assertRaises(ValueError):
                proof_lean._reply(subprocess.CompletedProcess([], code, stdout, "worker failure"))

    def test_lean_cell_does_not_run_another_executable_proof(self):
        with patch.object(proof_matrix, "run_z3", side_effect=AssertionError("second producer")):
            class Checker:
                def run(self, source, timeout, record):
                    return dict(record, status="lean-verified", original=source)
            record = proof_matrix.cell_legacy_proof_object("unused", _INPUT, 30, {}, Checker())
        self.assertEqual(record["original"], _INPUT)

    def test_original_source_not_stripped_is_passed_to_lean(self):
        seen = []
        class Checker:
            def run(self, source, timeout, record):
                seen.append(source)
                return dict(record, status="unsupported")
        source = "(set-option :sat.smt true)\n" + _INPUT
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "input.smt2"
            with path.open("w", newline="") as stream:
                stream.write(source)
            fake = {"stdout": "unsat\n", "stderr": "", "code": 0, "timeout": False, "time": 0}
            with patch.object(proof_matrix, "run_z3", return_value=fake):
                cells = ["legacy-proof-object", "smt-clause-log-nopp"]
                checkers = {cell: Checker() for cell in cells}
                records = list(proof_matrix.run_benchmark("unused", path, cells, 30, checkers))
        self.assertEqual(seen, [source, source])
        self.assertEqual([record["status"] for record in records[1:]], ["unsupported", "unsupported"])

    def test_clause_log_cell_selects_the_clause_log_producer(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "input.smt2"
            path.write_text(_INPUT)
            class Checker:
                def run(self, source, timeout, record):
                    return dict(record, checker="lean", status="lean-verified")
            fake = {"stdout": "unsat\n", "stderr": "", "code": 0, "timeout": False, "time": 0}
            with patch.object(sys, "argv", [
                proof_matrix.__file__, "--lean", "--cells", "smt-clause-log-nopp",
                "--z3-source", directory, "--lean-artifacts", directory, str(path),
            ]), patch.object(proof_matrix, "LeanChecker", return_value=Checker()) as factory, \
                    patch.object(proof_matrix, "run_z3", return_value=fake):
                self.assertEqual(proof_matrix.main(), 0)
            self.assertEqual(factory.call_args.kwargs, {"core": "clause-log", "check_timeout": 600})


@unittest.skipUnless(_SOURCE and _Z3, "set Z3_SOURCE and Z3_EXE for real Lean replay")
class TestLeanIntegration(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temporary = tempfile.TemporaryDirectory()
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.checker = proof_lean.LeanChecker(_SOURCE, _Z3, cls.temporary.name)

    def run_cell(self, source=_INPUT, expected="unsat"):
        return self.checker.run(source, 30,
                                proof_matrix.base_record("input.smt2", "logic_unknown",
                                                         "legacy-proof-object", expected))

    def test_exact_artifact_and_original_input_survive_replay(self):
        record = self.run_cell()
        self.assertEqual(record["status"], "lean-verified", record)
        directory = Path(record["artifacts"])
        self.assertEqual((directory / "input.smt2").read_bytes(), _INPUT.encode())
        certificate_bytes = Path(record["certificate"]).read_bytes()
        certificate = json.loads(certificate_bytes)
        self.assertEqual(certificate["source_smt2"], _INPUT)
        self.assertEqual(certificate["rule_counts"], record["rules"])
        self.assertEqual(certificate["verification"], "unverified")
        self.assertEqual(proof_lean.digest(certificate_bytes), record["certificate_sha256"])
        self.assertEqual(len(certificate_bytes), record["proof_size"])
        self.assertEqual(proof_lean.digest(Path(record["lean_proof"]).read_bytes()), record["lean_sha256"])
        self.assertEqual(record["producer"]["interface"], "z3py")
        self.assertFalse(record["producer"]["parameters"]["sat.smt"])
        self.assertIn("solve_time", record)
        self.assertIn("check_time", record)

    def test_producer_solves_once_and_checker_never_solves(self):
        z3, exporter, consumer, _ = proof_lean._load(Path(_SOURCE).resolve(), Path(_Z3).resolve())
        original_check = z3.Solver.check
        calls = []
        def counted(solver, *args, **kwargs):
            calls.append(solver)
            return original_check(solver, *args, **kwargs)
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            with patch.object(z3.Solver, "check", counted):
                produced = proof_lean.produce(z3, exporter, _INPUT, directory, 30)
            self.assertEqual(produced["status"], "produced")
            self.assertEqual(len(calls), 1)
            with patch.object(z3.Solver, "check", side_effect=AssertionError("checker solver call")), \
                    patch.object(exporter, "export_certificate", side_effect=AssertionError("re-export")):
                checked = proof_lean.check(consumer, _INPUT, directory)
            self.assertEqual(checked["status"], "lean-verified")

    def test_unsupported_semantics_sat_and_mismatched_results_are_not_certified(self):
        cases = [
            ("(declare-const x Int)(assert (> x 0))(assert (< x 0))(check-sat)", "unsat", "unsupported"),
            (_INPUT + "(check-sat)", "unsat", "unsupported"),
            ("(set-option :sat.smt true)" + _INPUT, "unsat", "unsupported"),
            ("(assert true)(check-sat)", "sat", "not-applicable"),
            ("(assert true)(check-sat)", "unsat", "disagree"),
        ]
        for source, expected, status in cases:
            with self.subTest(status=status, source=source):
                record = self.run_cell(source, expected)
                self.assertEqual(record["status"], status, record)
                self.assertEqual(proof_matrix.failures([record]), [record])
                self.assertNotIn("lean_proof", record)

    def test_changed_input_and_tampered_certificates_are_rejected(self):
        for target in ("input", "certificate"):
            with self.subTest(target=target), tempfile.TemporaryDirectory() as temporary:
                directory = Path(temporary)
                (directory / "input.smt2").write_text(_INPUT, newline="")
                produced = proof_lean._reply(self.checker._call("produce", directory, 30))
                self.assertEqual(produced["status"], "produced")
                if target == "input":
                    (directory / "input.smt2").write_text("(assert true)(check-sat)")
                else:
                    path = directory / "certificate.json"
                    certificate = json.loads(path.read_text())
                    certificate["proof"] = certificate["assertions"][0]
                    path.write_text(json.dumps(certificate))
                checked = proof_lean._reply(self.checker._call("check", directory))
                self.assertEqual(checked["status"], "checker-rejected")
                self.assertFalse((directory / "checked.lean").exists())

    def test_timeout_and_worker_crash_do_not_certify(self):
        for failure, status in ((subprocess.TimeoutExpired("producer", 30), "timeout"),
                                (ValueError("worker crashed"), "crash")):
            with patch.object(self.checker, "_call", side_effect=failure):
                record = self.run_cell()
            self.assertEqual(record["status"], status)
            self.assertEqual(proof_matrix.failures([record]), [record])

    def test_valid_but_changed_artifact_is_not_the_measured_certificate(self):
        call = self.checker._call
        def change_certificate(action, directory=None, timeout=600):
            if action == "check":
                with (directory / "certificate.json").open("a") as stream:
                    stream.write("\n")
            return call(action, directory, timeout)
        with patch.object(self.checker, "_call", side_effect=change_certificate):
            record = self.run_cell()
        self.assertEqual(record["status"], "checker-rejected", record)
        self.assertIn("changed during Lean checking", record["error"])
        self.assertFalse((Path(record["artifacts"]) / "checked.lean").exists())

    def test_checker_errors_and_timeouts_do_not_certify(self):
        call = self.checker._call
        for failure, expected in ((subprocess.TimeoutExpired("checker", 600), "timeout"),
                                  (ValueError("Lean failed"), "checker-rejected")):
            def fail_check(action, directory=None, timeout=600):
                if action == "check":
                    raise failure
                return call(action, directory, timeout)
            with patch.object(self.checker, "_call", side_effect=fail_check):
                record = self.run_cell()
            self.assertEqual(record["status"], expected)
            self.assertTrue(Path(record["certificate"]).is_file())
            self.assertNotIn("lean_proof", record)

    def test_explicit_checking_budget_is_enforced(self):
        call = self.checker._call
        timeouts = []
        def fail_check(action, directory=None, timeout=600):
            if action == "check":
                timeouts.append(timeout)
                raise subprocess.TimeoutExpired("checker", timeout)
            return call(action, directory, timeout)
        with patch.object(self.checker, "check_timeout", 45), \
                patch.object(self.checker, "_call", side_effect=fail_check):
            record = self.run_cell()
        self.assertEqual(timeouts, [45])
        self.assertEqual(record["status"], "timeout")
        self.assertEqual(record["check_time"], 45)

    def test_cli_requires_real_certification_and_retains_artifacts(self):
        cases = [
            ("legacy-proof-object", _INPUT, 0),
            ("legacy-proof-object", "(assert true)(check-sat)", 1),
        ]
        if _CLAUSE_LOG:
            cases += [
                ("smt-clause-log-nopp",
                 "(declare-const x Real)(assert (> x 1.0))(assert (< x 0.0))(check-sat)", 0),
                ("smt-clause-log-nopp", "(assert true)(check-sat)", 1),
            ]
        for cell, source, exit_code in cases:
            with self.subTest(cell=cell, exit_code=exit_code), tempfile.TemporaryDirectory() as temporary:
                root = Path(temporary)
                path = root / "input.smt2"
                path.write_text(source)
                out = root / "results.jsonl"
                proc = subprocess.run(
                    [sys.executable, proof_matrix.__file__, "--z3", _Z3, "--z3-source", _SOURCE,
                     "--lean", "--lean-artifacts", str(root / "artifacts"),
                     "--cells", cell, "--out", str(out), str(path)],
                    capture_output=True, text=True, timeout=120)
                self.assertEqual(proc.returncode, exit_code, proc.stdout + proc.stderr)
                record = json.loads(out.read_text().splitlines()[1])
                self.assertEqual(record["checker"], "lean")
                if exit_code == 0:
                    self.assertEqual(record["status"], "lean-verified")
                    self.assertTrue(Path(record["lean_proof"]).is_file())


@unittest.skipUnless(_SOURCE and _Z3, "set Z3_SOURCE and Z3_EXE for real Lean replay")
@unittest.skipUnless(_CLAUSE_LOG, "the Z3 checkout needs the clause-log exporter for QF_LRA replay")
class TestClauseLogLeanIntegration(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temporary = tempfile.TemporaryDirectory()
        cls.addClassCleanup(cls.temporary.cleanup)
        cls.checker = proof_lean.LeanChecker(_SOURCE, _Z3, cls.temporary.name, core="clause-log")

    def run_cell(self, source, expected="unsat"):
        return self.checker.run(source, 30,
                                proof_matrix.base_record("input.smt2", "QF_LRA",
                                                         "smt-clause-log-nopp", expected))

    def test_qf_lra_corpus_is_lean_certified(self):
        corpus = Path(__file__).resolve().parents[2] / "regressions" / "proofs" / "lean"
        inputs = sorted(corpus.glob("lra_*.smt2"))
        self.assertEqual(len(inputs), 8)
        for path in inputs:
            with self.subTest(input=path.name):
                source = proof_lean.read_source(path)
                record = self.run_cell(source)
                self.assertEqual(record["status"], "lean-verified", record)
                directory = Path(record["artifacts"])
                self.assertEqual((directory / "input.smt2").read_bytes(), source.encode())
                certificate = json.loads(Path(record["certificate"]).read_text())
                self.assertEqual(certificate["source_smt2"], source)
                self.assertEqual(certificate["fragment"], "qf_lra")
                self.assertEqual(certificate["rule_counts"], record["rules"])
                self.assertEqual(proof_lean.digest(Path(record["certificate"]).read_bytes()),
                                 record["certificate_sha256"])
                self.assertEqual(proof_lean.digest(Path(record["clause_log"]).read_bytes()),
                                 record["clause_log_sha256"])
                self.assertEqual(record["producer"]["interface"], "smt2")
                self.assertTrue(record["producer"]["parameters"]["sat.smt"])
                self.assertFalse(record["producer"]["parameters"]["smt.bound_simplifier"])

    def test_clause_log_is_produced_once_and_checker_does_not_reexport(self):
        z3, exporter, consumer, _ = proof_lean._load(Path(_SOURCE).resolve(), Path(_Z3).resolve(), "clause-log")
        source = ("(declare-const x Real)(assert (> x 1.0))(assert (< x 0.0))(check-sat)")
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            with patch.object(proof_lean.subprocess, "run", wraps=subprocess.run) as run:
                produced = proof_lean.produce_clause_log(z3, exporter, source, directory, 30, _Z3)
            self.assertEqual(produced["status"], "produced")
            self.assertEqual(run.call_count, 1)
            with patch.object(z3.Solver, "check", side_effect=AssertionError("checker solver call")), \
                    patch.object(exporter, "export_clause_log_certificate", side_effect=AssertionError("re-export")):
                checked = proof_lean.check(consumer, source, directory)
            self.assertEqual(checked["status"], "lean-verified")

    def test_reduction_retains_the_exact_raw_and_core_logs(self):
        z3, exporter, consumer, _ = proof_lean._load(Path(_SOURCE).resolve(), Path(_Z3).resolve(), "clause-log")
        replay = importlib.import_module("proof_clause_log")
        if not hasattr(replay, "trim_clause_log"):
            self.skipTest("the Z3 checkout does not provide large-log reduction")
        corpus = Path(__file__).resolve().parents[2] / "regressions" / "proofs" / "lean"
        source = proof_lean.read_source(corpus / "lra_farkas.smt2")
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            with patch.object(replay, "_TRIM_THRESHOLD", 0):
                produced = proof_lean.produce_clause_log(z3, exporter, source, directory, 30, _Z3)
            self.assertEqual(produced["status"], "produced", produced)
            self.assertEqual(proof_lean.digest(Path(produced["clause_log"]).read_bytes()),
                             produced["clause_log_sha256"])
            self.assertEqual(proof_lean.digest(Path(produced["trimmed_log"]).read_bytes()),
                             produced["trimmed_log_sha256"])
            self.assertIn("(deps ", Path(produced["trimmed_log"]).read_text())
            self.assertGreater(produced["trimmed_inferences"], 0)
            self.assertEqual(proof_lean.check(consumer, source, directory)["status"], "lean-verified")

    def test_satisfied_clause_does_not_create_a_spurious_trimmed_conflict(self):
        z3, exporter, consumer, _ = proof_lean._load(Path(_SOURCE).resolve(), Path(_Z3).resolve(), "clause-log")
        replay = importlib.import_module("proof_clause_log")
        if not hasattr(replay, "trim_clause_log"):
            self.skipTest("the Z3 checkout does not provide large-log reduction")
        path = (Path(__file__).resolve().parents[2] / "regressions" / "proofs" / "lean"
                / "real" / "trim_satisfied_clause.proof")
        source = ("(declare-const p Bool)(declare-const q Bool)(declare-const r Bool)"
                  "(assert p)(assert (not q))(assert (or p q r))(assert (not r))(assert (not p))")
        with patch.object(replay, "_TRIM_THRESHOLD", 0):
            core = replay.trim_clause_log(_Z3, path.read_text(), 30)
        self.assertIn("(assume (not p)", core)
        self.assertNotIn("(assume (not r)", core)
        context = z3.Context()
        assertions, fragment = exporter.parse_assertions(source, context)
        certificate = replay.build_certificate(source, fragment, assertions, core, context)
        with tempfile.TemporaryDirectory() as temporary:
            consumer.check_and_write(source, certificate, Path(temporary) / "checked.lean")

    def test_unsupported_sat_and_disagreement_are_not_certified(self):
        for source, expected, status in [
            ("(declare-const x Int)(assert (> x 0))(assert (< x 0))", "unsat", "unsupported"),
            ("(declare-const x Real)(assert (= (* x x) 2.0))", "sat", "unsupported"),
            ("(declare-const x Real)(assert (> x 0.0))", "sat", "not-applicable"),
            ("(declare-const x Real)(assert (> x 0.0))", "unsat", "disagree"),
            (_INPUT + "(check-sat)", "unsat", "unsupported"),
        ]:
            with self.subTest(source=source):
                record = self.run_cell(source, expected)
                self.assertEqual(record["status"], status, record)
                self.assertEqual(proof_matrix.failures([record]), [record])
                self.assertNotIn("lean_proof", record)

    def test_changed_input_and_tampered_certificates_are_rejected(self):
        source = "(declare-const x Real)(assert (> x 1.0))(assert (< x 0.0))"
        for target in ("input", "certificate"):
            with self.subTest(target=target), tempfile.TemporaryDirectory() as temporary:
                directory = Path(temporary)
                (directory / "input.smt2").write_text(source)
                produced = proof_lean._reply(self.checker._call("produce", directory, 30))
                self.assertEqual(produced["status"], "produced")
                if target == "input":
                    (directory / "input.smt2").write_text("(assert true)")
                else:
                    path = directory / "certificate.json"
                    certificate = json.loads(path.read_text())
                    certificate["proof"] = certificate["assertions"][0]
                    path.write_text(json.dumps(certificate))
                checked = proof_lean._reply(self.checker._call("check", directory))
                self.assertEqual(checked["status"], "checker-rejected")
                self.assertFalse((directory / "checked.lean").exists())

    def test_solver_errors_timeouts_and_missing_logs_are_not_certified(self):
        z3, exporter, _, _ = proof_lean._load(Path(_SOURCE).resolve(), Path(_Z3).resolve(), "clause-log")
        for result, status in [
            (subprocess.TimeoutExpired("z3", 30), "timeout"),
            (subprocess.CompletedProcess([], 1, "", "solver failed"), "crash"),
            (subprocess.CompletedProcess([], 0, '(error "bad option")\nunsat\n', ""), "crash"),
            (subprocess.CompletedProcess([], 0, "unsat\n", ""), "no-proof"),
            (subprocess.CompletedProcess([], 0, "unknown\n", ""), "not-applicable"),
        ]:
            with self.subTest(status=status), tempfile.TemporaryDirectory() as temporary:
                if isinstance(result, Exception):
                    mock = patch.object(proof_lean.subprocess, "run", side_effect=result)
                else:
                    mock = patch.object(proof_lean.subprocess, "run", return_value=result)
                with mock:
                    report = proof_lean.produce_clause_log(
                        z3, exporter, "(assert false)", Path(temporary), 30, _Z3)
                self.assertEqual(report["status"], status, report)
                self.assertFalse((Path(temporary) / "certificate.json").exists())


if __name__ == "__main__":
    unittest.main()
