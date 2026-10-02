"""Lean handoff tests; real replay requires Z3_SOURCE and Z3_EXE."""
import json
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
_INPUT = "(declare-const p Bool)\r\n(assert p)\r\n(assert (not p))\r\n(check-sat)\r\n"


class TestLeanGate(unittest.TestCase):
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
                list(proof_matrix.run_benchmark("unused", path, ["legacy-proof-object"], 30, Checker()))
        self.assertEqual(seen, [source])


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

    def test_cli_requires_real_certification_and_retains_artifacts(self):
        for source, exit_code in ((_INPUT, 0), ("(assert true)(check-sat)", 1)):
            with self.subTest(exit_code=exit_code), tempfile.TemporaryDirectory() as temporary:
                root = Path(temporary)
                path = root / "input.smt2"
                path.write_text(source)
                out = root / "results.jsonl"
                proc = subprocess.run(
                    [sys.executable, proof_matrix.__file__, "--z3", _Z3, "--z3-source", _SOURCE,
                     "--lean", "--lean-artifacts", str(root / "artifacts"),
                     "--cells", "legacy-proof-object", "--out", str(out), str(path)],
                    capture_output=True, text=True, timeout=120)
                self.assertEqual(proc.returncode, exit_code, proc.stdout + proc.stderr)
                record = json.loads(out.read_text().splitlines()[1])
                self.assertEqual(record["checker"], "lean")
                if exit_code == 0:
                    self.assertEqual(record["status"], "lean-verified")
                    self.assertTrue(Path(record["lean_proof"]).is_file())


if __name__ == "__main__":
    unittest.main()
