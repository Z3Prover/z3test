; Interesting test for subterm feature
(declare-datatype Nat
  ((zero)
   (succ (prev Nat)))
   :subterm is-subterm)

(declare-const x Nat)
(declare-const y Nat)
(declare-const z Nat)

; x is a subterm of y
(assert (is-subterm x y))
; y is a subterm of succ(succ(zero))
(assert (is-subterm y (succ (succ zero))))

; We want to see if it can find a model where they are all distinct
(assert (not (= x y)))
(assert (not (= y (succ (succ zero)))))

(check-sat)
(get-model)

; Now test transitivity-like behavior:
; if x is a subterm of y, and y is succ(zero), then x must be succ(zero) or zero.
(push)
(assert (= y (succ zero)))
(assert (not (= x (succ zero))))
(assert (not (= x zero)))
(check-sat) ; Should be UNSAT
(pop)

; Test conflict with constructor
(push)
(assert (is-subterm (succ x) zero))
(check-sat) ; Should be UNSAT because zero has no subterms other than itself
(pop)
