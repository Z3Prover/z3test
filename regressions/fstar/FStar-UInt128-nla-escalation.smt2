;; =============================================================================
;; FStar.UInt128 mul_wide -- distilled arith.solver=2 vs arith.solver=6 gap.
;;
;; Companion to FStar-UInt128-divergence.smt2.  The divergence probe isolated the
;; pure product-SIGN fact (sum of non-negative scaled partials cannot be < 0),
;; which arith.solver=6 now discharges as fast as solver=2.  This probe isolates
;; the RESIDUAL gap still visible in FStar-UInt128-axiom.smt2 and FStar.UInt128-1.smt2.
;;
;; ---------------------------------------------------------------------------
;; The obligation
;; ---------------------------------------------------------------------------
;; A single cross-term product bound:
;;
;;      0 <= x < p ,  0 <= y < p ,  p >= 2^32       (p is SYMBOLIC: no numeral UB)
;;      x*y >= p*p                                   (negated goal)
;;
;; This is UNSAT: x*y <= (p-1)*(p-1) < p*p.  A one-line Positivstellensatz
;; certificate exists,
;;
;;      p*p - x*y = p*(p - y) + y*(p - x)  >= 0 ,
;;
;; because p >= 0, p - y > 0, y >= 0, p - x > 0.
;;
;; ---------------------------------------------------------------------------
;; Why the two solvers differ
;; ---------------------------------------------------------------------------
;; solver=2 (theory_arith, integer simplex): closes in ~2 final checks by
;;   interval bound propagation over the linearized product term -- no algebraic
;;   engine is invoked.
;;
;; solver=6 (theory_lra + nla): the product x*y over variables whose upper bound
;;   is the SYMBOLIC constant p (not a numeral) cannot be bounded by interval
;;   multiplication -- there is no numeric range to multiply.  nla therefore
;;   escalates through its algebraic pipeline
;;
;;        Horner cross-nested forms  ->  Grobner basis  ->  bounded NLSAT (nra)
;;
;;   to certify the cross-monomial comparison x*y < p*p.  On this family the
;;   upper layers are largely WASTED work: the closing certificate here is found
;;   by bounded NLSAT, and the speculative Grobner/Horner rounds only add cost.
;;
;; ---------------------------------------------------------------------------
;; Measurements (this file, deterministic :rlimit-count)
;; ---------------------------------------------------------------------------
;;   solver=2 : rlimit ~1.5K , 2 final-checks , NO grobner / NO nlsat
;;   solver=6 : rlimit ~5.5K , grobner-calls 14 , nra-calls 5 , nlsat-stages 17
;;
;;   solver=6 facet ablation (what actually closes it):
;;     smt.arith.nl.grobner=false -> rlimit ~5.5K unchanged  (Grobner was wasted)
;;     smt.arith.nl.nra=false     -> rlimit ~28K  (5x: without NLSAT, Grobner
;;                                                 must grind 55 calls)
;;   => bounded NLSAT is the efficient closer; Grobner/Horner are speculative
;;      overhead.  Because Horner/Grobner are wall-clock heavy but rlimit-cheap,
;;      solver=6 shows the rlimit-vs-wall-clock inversion seen on the full query:
;;
;;     FStar-UInt128-axiom.smt2 : s2 0.35s (rlimit 3.7M) | s6 0.60s (rlimit 164K)
;;                                s6 smt.arith.nl.grobner=false -> 0.32s (parity)
;;                                                            (53 Grobner calls
;;                                                             removed)
;;     FStar.UInt128-1.smt2     : s2 0.19s (rlimit 1.2M) | s6 2.53s (rlimit 456K)
;;                                s6 smt.arith.nl.grobner=false -> 0.70s
;;                                                            (87 Grobner calls
;;                                                             removed)
;;
;; ---------------------------------------------------------------------------
;; Crossover caveat (why solver=6 is not simply "worse")
;; ---------------------------------------------------------------------------
;; The gap is specific to the LOW-nonlinearity regime that dominates these F*
;; queries (few product terms, closed by sign/interval reasoning).  With MANY
;; symbolic cross-terms the direction inverts: four independent products summed
;; against 4*p*p makes solver=2's simplex blow up (~16.7M rlimit, ~2.1K final
;; checks, ~2.2s) while solver=6's nla closes it in ~55K rlimit / ~0.27s.  The
;; improvement target is thus to AVOID/THROTTLE the speculative Grobner+Horner
;; rounds when a problem is already refutable by cheap bound reasoning, not to
;; disable nla.
;; =============================================================================

(set-option :auto_config false)
(set-option :smt.mbqi false)
(set-option :produce-unsat-cores false)

(declare-const p Int)
;; p models 2^32: symbolic, only a lower bound is exposed (as Prims.pow2 with
;; hi = +inf in the real F* encoding).
(assert (>= p 4294967296))

(declare-const x Int)
(declare-const y Int)
(assert (>= x 0))
(assert (>= y 0))
(assert (< x p))
(assert (< y p))

;; Negated goal: a cross-term product reaches its own symbolic square bound.
(assert (>= (* x y) (* p p)))

(check-sat)
