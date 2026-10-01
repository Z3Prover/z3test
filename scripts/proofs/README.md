# Proof regression matrix

`proof_matrix.py` measures proof production and checking across Z3's different
proof paths. It solves each benchmark without proofs to record the expected
result, then re-solves it in each parameter cell and applies that cell's
checking method:

| Cell | Configuration and checking method |
| --- | --- |
| `smt-clause-log` | `sat.smt=true` with `solver.proof.log`; replayed through the built-in checker (`proof_cmds` / `euf_proof_checker`) |
| `smt-clause-log-nopp` | The same with `solve-eqs`, `propagate-values`, and `elim-unconstrained` disabled, because the clause log does not cover contradictions found by preprocessing |
| `legacy-proof-object` | `sat.smt=false` with `produce-proofs`; the proof object is inventoried by rule and theory-lemma kind |
| `legacy-clause-proof` | `sat.smt=false` with `smt.clause_proof`; the proof trail is inventoried (no checker yet) |
| `arith-validate` | `smt.arith.validate` self-validation inside `theory_lra` |

Every (benchmark, cell) record carries one failure class: `verified`,
`unverified-fallback`, `checker-rejected`, `no-proof`, `not-applicable`,
`disagree`, `crash`, `timeout`, or `no-checker`. A self-checker fallback to the
SMT solver is counted as `unverified-fallback`, never as `verified`. Clause-log
records also carry the hint names, the checker's per-hint hit and miss counts,
and the number of fallbacks. `arith-validate` is a solver self-validation
diagnostic, not independent certification, even when its status is `verified`.
Missing SMT logic declarations are labeled `logic_unknown`, separately from a
solver result of `unknown`.

From the z3test repository root, using a separately built Z3 executable:

```sh
python3 scripts/proofs/proof_matrix.py --z3 /path/to/z3 --timeout 30 \
    --benchmark-root . --out results.jsonl regressions/proofs/canaries/*.txt
```

Inputs may be SMT-LIB files, directories, or `.txt` lists of paths. Options that
would change the proof configuration, and `get-proof`/`get-model`/`get-unsat-core`
queries, are stripped from the input; the runner controls them. Benchmarks
should contain a single `check-sat` and no `push`/`pop`. The summary table is
printed per logic and cell. JSON records are appended to `--out`.

A `.txt` list holds one benchmark per line. Relative entries are resolved next
to the list file first and then against `--benchmark-root`. An entry may carry
`cell=status` annotations naming a known failure, for example:

```text
regressions/smt2/t8.smt2  smt-clause-log=checker-rejected
```

The exit status is 1 for `checker-rejected`, `disagree`, or `crash`, except for
annotated known failures. A known failure that reproduces is reported but does
not fail the run; one that stops reproducing is reported as a stale annotation
so it can be removed. Only these three failure classes may be annotated.

`regressions/proofs/canaries/` contains the per-logic lists and minimized
regressions, including `array_axiom_log.smt2` from Z3Prover/z3#10922 and
`real_numeral_farkas.smt2` from Z3Prover/z3#10954. The lists use existing
`regressions/smt2/` inputs without copying them.

## Runner tests and CI

```sh
Z3_EXE=/absolute/path/to/z3 python3 -m unittest discover \
    -s scripts/proofs -p test_proof_matrix.py -v
```

Classification, list-parsing, and repository-path tests need no Z3 bindings or
binary. End-to-end tests use `Z3_EXE` or `z3` on `PATH` and are skipped if neither
is available. The optional Lean integration is skipped without its consumer;
the Lean exporter and reconstructor are not part of this repository.

The workflow lives in `Z3Prover/z3`, not here. It clones z3test and runs these
tests against the binary it just built in the Linux CMake test configurations.
Its `releaseClang` configuration additionally runs all canary lists.
