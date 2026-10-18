# SMT-LIB 2025 proof-checker sample

This fixed cohort contains **225 unchanged benchmarks: 25 per logic** from
QF_UF, QF_AX, QF_LIA, QF_LRA, QF_IDL, QF_UFLIA, QF_AUFLIA, AUFLIA, and UFLIA.
All selected inputs have an upstream `(set-info :status unsat)` annotation.
That annotation is not a proof: evaluation must distinguish certified
refutations, unsupported/partial proofs, solver unknowns, and resource errors.

## Source and selection

The source is the SMT-LIB contributors' **SMT-LIB release 2025
(non-incremental benchmarks)**, Zenodo record
[16740866](https://zenodo.org/records/16740866),
DOI [10.5281/zenodo.16740866](https://doi.org/10.5281/zenodo.16740866).
The Zenodo record identifies the release license as
[Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/).
Original authorship, source, copyright, and license metadata inside each
benchmark are preserved byte-for-byte.

Reconstructed on October 18, 2026, using the release's nine corresponding
`.tar.zst` archives. Each complete archive was checked against its published
size and MD5 before selection. Independently for each logic, collect regular
`.smt2` archive members with an UNSAT status annotation and select:

```python
random.Random(42).sample(sorted(unsat_member_paths), 25)
```

Sorting is case-sensitive POSIX archive-path order; the random generator is
reset for each logic. This is a **reduced, newly reconstructed cohort**, not
the historical 900-file/100-per-logic manifest and not necessarily its first
25 entries per logic. No benchmark contents were changed.

`manifest.json` pins all 225 paths and SHA-256 hashes, original archive member
paths, file sizes, and the upstream archive URLs, sizes, MD5 and SHA-256 hashes.
It also records the seed, sample size, and reconstruction Python version.
No archive download or resampling is needed during CI.

## Evaluation

Z3's `pulse-checker-regressions.yml` builds its native extracted F* checker
and evaluates this directory in addition to `regressions/proofs`. The harness
verifies manifest membership and all input hashes first, then records
per-file/per-logic outcomes and available solve/marshal/check timings.
Only obligation-free `ACCEPT` refutations count as proof-checking successes.
