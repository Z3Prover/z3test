# Proof regression matrix

`proof_matrix.py` measures proof production and checking across Z3's different
proof paths. It solves each benchmark without proofs to record the expected
result, then re-solves it in each parameter cell and applies that cell's
checking method:

| Cell | Configuration and checking method |
| --- | --- |
| `smt-clause-log` | `sat.smt=true` with `solver.proof.log`; replayed through the built-in checker (`proof_cmds` / `euf_proof_checker`) |
| `smt-clause-log-nopp` | The same with `solve-eqs`, `propagate-values`, `elim-unconstrained`, and `bound-simplifier` disabled; with `--lean`, reconstruct and Lean-check the saved log for Boolean/QF_LRA inputs |
| `legacy-proof-object` | `sat.smt=false` with `produce-proofs`; inventoried by default, or produced and Lean-checked through the matching Python bindings with `--lean` |
| `legacy-clause-proof` | `sat.smt=false` with `smt.clause_proof`; the proof trail is inventoried (no checker yet) |
| `arith-validate` | `smt.arith.validate` self-validation inside `theory_lra` |

Every (benchmark, cell) record carries one status: `verified`, `lean-verified`,
`diagnostic`, `unsupported`,
`unverified-fallback`, `checker-rejected`, `no-proof`, `not-applicable`,
`disagree`, `crash`, `timeout`, or `no-checker`. A self-checker fallback to the
SMT solver is counted as `unverified-fallback`, never as `verified`. Native
clause-log records also carry the hint names, the checker's per-hint hit and
miss counts, and the number of fallbacks. `arith-validate` reports `diagnostic`, not
`verified`, when self-validation succeeds on an unsat run. `verified` describes
native checker acceptance, not a Lean proof or certification of preprocessing
outside the clause log. Only `lean-verified` denotes Lean certification.
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
Requested Lean certification is stricter and cannot be waived by annotations.

`regressions/proofs/canaries/` contains the per-logic lists and minimized
regressions, including `array_axiom_log.smt2` from Z3Prover/z3#10922 and
`real_numeral_farkas.smt2` from Z3Prover/z3#10954. The lists use existing
`regressions/smt2/` inputs without copying them.

## Lean certification

`--lean` is an option of this Python runner, not the Z3 executable. It requires
the `legacy-proof-object` or `smt-clause-log-nopp` cell, a Z3 checkout containing
the native exporter and reconstructor (introduced in Z3Prover/z3#11017), and a matching CMake build
with Python bindings and a shared library. The clause-log cell additionally
requires `examples/python/proof_clause_log.py` and the QF_LRA Lean reconstructor.
The implementation supports POSIX hosts with `z3`, `libz3.so` or `libz3.dylib`, and `python/z3/` together
under the build directory. It rejects missing or mismatched dependencies
rather than using a system-installed Python package.

```sh
python3 scripts/proofs/proof_matrix.py \
    --z3 /path/to/z3/build/z3 --z3-source /path/to/z3 \
    --lean --cells legacy-proof-object \
    --lean-artifacts /path/to/artifacts --out results.jsonl \
    regressions/proofs/lean/boolean_*.smt2 \
    regressions/proofs/lean/unit_resolution.smt2

python3 scripts/proofs/proof_matrix.py \
    --z3 /path/to/z3/build/z3 --z3-source /path/to/z3 \
    --lean --cells smt-clause-log-nopp \
    --lean-artifacts /path/to/artifacts --out results.jsonl \
    regressions/proofs/lean/lra_*.smt2
```

`--z3-source` locates the tools and pinned Lean workspace without copying files
between repositories. Preflight checks the executable/library version and
builds the Lean workspace. Missing tools, bindings, or Lean are configuration
errors. `proof_lean.py` is the binding-dependent subprocess adapter, not a
replacement exporter or Lean implementation.

For the legacy cell, one isolated Python process uses that build's native library,
enables proofs before creating the context, sets `sat.smt=false`, solves once,
and serializes that solver's proof. For the clause-log cell, the producer runs
the executable once with `sat.smt=true` and the four preprocessing passes
disabled, retains its `clause.log`, and rebuilds that exact log into the native
certificate format using the source checkout's replayer. `bound_simplifier`
must be disabled too because it runs solve-eqs internally. A second isolated
process reads the saved certificate and original input and invokes the Lean reconstructor; it never
runs solver search. The proof-free reference run remains separate.

The Lean cell validates the **original** input, without stripping its commands
or replacing undecodable text. It currently supports the exporter's
single-query propositional snapshots, plus linear real arithmetic in the
clause-log cell. Unsupported commands, options, theories,
or proof shapes are explicit failures, not silently changed problems.

Each cell gets a fresh directory below `--lean-artifacts`, retaining
`input.smt2`, the unverified `certificate.json` when available, and
`checked.lean` only after successful checking. The clause-log cell also retains
the actual `solver.smt2` invocation and `clause.log`. JSON records include source
and certificate hashes, the checked Lean file's hash, certificate byte size,
DAG rule counts, native statistics for the legacy cell, and producer
paths/version/parameters. The clause-log cell records the log path, hash, and
inference count and identifies its producer interface as `smt2` rather than `z3py`.
The `time` field measures the actual producer subprocess, `solve_time` the
native check, and `check_time` reconstruction and Lean checking. No timing or
rule inventory is borrowed from a second executable proof run. The native
JSON remains explicitly unverified; the checked Lean artifact is separate.

With `--lean`, every selected `legacy-proof-object` or `smt-clause-log-nopp`
cell must be `lean-verified` for exit status zero. Sat/unknown, unsupported inputs, missing evidence, timeouts, and
rejections therefore fail the requested certification, even if a benchmark
annotation would normally waive that failure. Other cells retain their usual
classification and known-failure policy. A run collecting no benchmarks also
fails. The checking budget is 600 seconds per cell; `--timeout` bounds
production. On timeout the subprocess group, including Lean, is terminated.

Lean proves that the encoded original assertions imply False. Parsing and
SMT-to-Lean statement translation remain trusted frontend components; this
does not certify SAT or provide a formally verified SMT-LIB parser.
The arithmetic reconstructor encodes Real as Rat, justified only for linear
constraints with rational coefficients. Arithmetic proofs may depend on Lean's
three standard axioms through its Rat library.

## Runner tests and CI

```sh
Z3_EXE=/absolute/path/to/z3 python3 -m unittest discover \
    -s scripts/proofs -p 'test_proof*.py' -v
```

Classification, list-parsing, and repository-path tests need no Z3 bindings or
binary. End-to-end tests use `Z3_EXE` or `z3` on `PATH` and are skipped if neither
is available. Real Lean handoff tests additionally require `Z3_SOURCE`:

```sh
Z3_EXE=/path/to/z3/build/z3 Z3_SOURCE=/path/to/z3 \
    python3 -m unittest discover -s scripts/proofs -p 'test_proof*.py' -v
```

Without those explicit variables the real Lean tests are skipped, but gate
classification tests still run. QF_LRA integration tests are also skipped for
older Z3 checkouts that do not contain `proof_clause_log.py`, so the existing
Boolean CI can use this runner before the arithmetic exporter lands. Once the
exporter is present, a broken installation fails instead of skipping.
Explicitly requesting the clause-log Lean cell always requires its exporter;
the CLI never silently falls back. The exporter and reconstructor remain in
the Z3 checkout.

The workflow lives in `Z3Prover/z3`, not here. It clones z3test and runs these
tests against the binary it just built in the Linux CMake test configurations.
Its `releaseClang` configuration additionally runs all canary lists.
