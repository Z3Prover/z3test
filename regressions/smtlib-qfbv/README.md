# Fixed small QF_BV proof-checker corpus

This cohort contains **300 unchanged QF_BV benchmarks**, each at most **8 KiB**,
with an upstream `(set-info :status unsat)` annotation. The annotation is not
a proof: only an obligation-free checker `ACCEPT` certifies a refutation.

## Source and selection

The source is the SMT-LIB contributors' **SMT-LIB 2025 non-incremental release**,
[Zenodo record 16740866](https://zenodo.org/records/16740866),
DOI [10.5281/zenodo.16740866](https://doi.org/10.5281/zenodo.16740866),
licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
Original authorship, source, copyright, and license metadata are preserved
byte-for-byte inside each benchmark.

The complete `QF_BV.tar.zst` archive was downloaded once and checked against its
pinned compressed size and SHA-256 hash. Selection considers regular `.smt2`
members with an UNSAT annotation and a size of at most 8192 bytes. With fixed
seed `pulse-qfbv-300-v1`, choose the 300 lowest SHA-256 priorities of:

```text
seed NUL QF_BV NUL relative-POSIX-path
```

Here `NUL` is a zero byte and relative paths start with `QF_BV/`.
Selection is independent of archive traversal order and does not use solver
or checker outcomes. The selected inputs have distinct SHA-256 hashes.
`manifest.json` records the source archive URL and hashes, seed, size bound,
original member paths, and individual file sizes and SHA-256 hashes.

## Evaluation

Z3's `pulse-checker-regressions.yml` copies this fixed corpus from its recorded
z3test revision. It verifies exact manifest membership and all input hashes
before running the native OCaml checker. Cherry replays the identical inputs
from the OCaml report artifact. Neither backend downloads or resamples the
large QF_BV archive in CI. The workflow requires exactly 300 cases and reports
`ACCEPT`, `PARTIAL`, `REJECT`, unknowns, and resource errors separately.
