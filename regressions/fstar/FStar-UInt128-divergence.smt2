;; FStar.UInt128 mul_wide -- distilled solver-divergence probe.
;;
;; Derived from FStar-UInt128-axiom.smt2 by adding auxiliary axioms that isolate
;; the arithmetic core of the mul_wide obligation (assembled 32x32 partial
;; products scaled by powers of 2^32) while stripping the deep quantifier chain
;; that dominates the full query.  The surviving obligation is a pure nonlinear
;; *sign* fact: the top-scaled partial products are all non-negative, so their
;; sum cannot be negative.
;;
;; This fact is exactly the kind arith.solver=2 discharges eagerly in one round
;; of interval bound propagation (every monomial phh*2^64k gets a >=0 bound as
;; soon as phh>=0 is known), but arith.solver=6's reactive per-monomial nla
;; propagation only tightens the monomials currently in m_to_refine, so it churns
;; through many final checks -- escalating to bounded nlsat -- before closing.
;;
;; Measured: solver=2 uses <= 5 final checks; solver=6 uses > 20 (typically ~60).
;; Use it to narrow in on why solver=6 fails to derive the product-sign bounds
;; that solver=2 lands immediately.

(set-option :auto_config false)
(set-option :smt.mbqi false)
(set-option :produce-unsat-cores false)

(declare-sort Term 0)
(declare-fun BoxInt (Int) Term)
(declare-fun BoxInt_proj_0 (Term) Int)
(declare-fun Prims.pow2 (Term) Term)
(declare-fun FStar.UInt128.phh (Term Term) Term)
(declare-fun FStar.UInt128.plh (Term Term) Term)
(declare-fun FStar.UInt128.phl (Term Term) Term)
(declare-fun FStar.UInt128.pll_h (Term Term) Term)
(declare-fun FStar.UInt128.pll_l (Term Term) Term)

;; p32 := 2^32 as an Int; only its lower bound is exposed (as in the real query,
;; where the divisor is the fuel-instrumented Prims.pow2 with hi = +inf).
(define-fun p32 () Int (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))))
(assert (>= p32 4294967296))

;; typing_FStar.UInt128.phh (and friends): every 32x32 partial product is a nat.
;; This is the only sign information available; it arrives via a quantified
;; refinement-typing axiom, exactly as in the F* encoding.
(assert (forall ((x Term) (y Term))
  (! (>= (BoxInt_proj_0 (FStar.UInt128.phh x y)) 0)
     :pattern ((FStar.UInt128.phh x y)))))

;; lo(x,y) := phh(x,y) * 2^32 * 2^32   (= phh * 2^64), a degree-3 monomial.
;; hi(x,y) := lo(x,y) * 2^32 * 2^32     (= phh * 2^128), a degree-5 monomial.
;; The two-level chain mirrors how mul_wide re-scales the high partial across the
;; 2^32 boundary twice.  nla must walk the chain lo -> hi bounding each product;
;; solver=2 does it by interval multiplication in one shot.
(declare-fun lo (Term Term) Int)
(declare-fun hi (Term Term) Int)
(assert (forall ((x Term) (y Term))
  (! (= (lo x y)
        (* (BoxInt_proj_0 (FStar.UInt128.phh x y)) p32 p32))
     :pattern ((lo x y)))))
(assert (forall ((x Term) (y Term))
  (! (= (hi x y) (* (lo x y) p32 p32))
     :pattern ((hi x y)))))

;; Eight distinct operand pairs (skolem operands of eight mul_wide call sites).
(declare-const a0 Term)(declare-const a1 Term)(declare-const a2 Term)(declare-const a3 Term)
(declare-const a4 Term)(declare-const a5 Term)(declare-const a6 Term)(declare-const a7 Term)
(declare-const b0 Term)(declare-const b1 Term)(declare-const b2 Term)(declare-const b3 Term)
(declare-const b4 Term)(declare-const b5 Term)(declare-const b6 Term)(declare-const b7 Term)

;; Negated goal: the sum of the (non-negative) top-scaled partials is negative.
;; UNSAT, refutable purely by product-sign bounds.
(assert (< (+ (hi a0 b0) (hi a1 b1) (hi a2 b2) (hi a3 b3)
              (hi a4 b4) (hi a5 b5) (hi a6 b6) (hi a7 b7)) 0))

(check-sat)
