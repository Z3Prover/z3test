#!/usr/bin/env python3
"""Failure-path checks for the acceptance runner; no Z3 build is required."""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

from run_tests import execute, native_groups

RUNNER = Path(__file__).with_name('run_tests.py')


@unittest.skipUnless(os.name == 'posix', 'runner supports Linux/macOS')
class RunnerTests(unittest.TestCase):
    def test_nonzero_exit_and_diagnostic_are_preserved(self):
        with tempfile.TemporaryDirectory() as temp:
            out = Path(temp)
            result = execute('failure', [sys.executable, '-c',
                             'import sys; print("intentional failure"); sys.exit(7)'],
                             dict(os.environ), out, 10)
            self.assertEqual(result['status'], 'failed')
            self.assertEqual(result['returncode'], 7)
            self.assertIn('intentional failure', (out / 'failure.log').read_text())

    def test_native_group_requires_named_completion(self):
        with tempfile.TemporaryDirectory() as temp:
            out = Path(temp)
            for output, expected in [('PASS', 'failed'),
                                     ('(test other :time 0.01)', 'failed'),
                                     ('(test ff_domain :time 0.01)', 'passed')]:
                result = execute('native-ff_domain', [sys.executable, '-c',
                                 'print(' + repr(output) + ')'], dict(os.environ), out, 10)
                self.assertEqual(result['status'], expected)

    def test_native_groups_match_source(self):
        with tempfile.TemporaryDirectory() as temp:
            source = Path(temp)
            self.assertNotIn('ff_solver', native_groups(source))
            self.assertNotIn('ff_domain', native_groups(source))
            tests = source / 'src' / 'test'
            tests.mkdir(parents=True)
            for name in ('ff_solver', 'ff_domain'):
                (tests / (name + '.cpp')).touch()
            self.assertIn('ff_solver', native_groups(source))
            self.assertIn('ff_domain', native_groups(source))

    def test_timeout_is_failure(self):
        with tempfile.TemporaryDirectory() as temp:
            result = execute('timeout', [sys.executable, '-c', 'import time; time.sleep(60)'],
                             dict(os.environ), Path(temp), 0.1)
            self.assertEqual(result['status'], 'timeout')
            self.assertLess(result['seconds'], 10)

    def test_wrong_build_fails_before_running_suites(self):
        with tempfile.TemporaryDirectory() as temp:
            out = Path(temp) / 'logs'
            result = subprocess.run([sys.executable, str(RUNNER), '--build', temp,
                                     '--out', str(out)], capture_output=True, text=True, timeout=20)
            self.assertNotEqual(result.returncode, 0)
            summary = json.loads((out / 'summary.json').read_text())
            self.assertEqual(len(summary['results']), 1)
            self.assertEqual(summary['results'][0]['status'], 'failed')

    def test_missing_checkers_cannot_silently_pass(self):
        with tempfile.TemporaryDirectory() as temp:
            result = subprocess.run([sys.executable, str(RUNNER), '--build', temp,
                                     '--out', str(Path(temp) / 'logs'), '--suite', 'proofs'],
                                    capture_output=True, text=True, timeout=10)
            self.assertEqual(result.returncode, 2)
            self.assertIn('require --carcara and --ffpacheck', result.stderr)


if __name__ == '__main__':
    unittest.main()
