; Declare a Nat datatype with a subterm predicate named 'is-subterm'
(declare-datatype Nat
  ((zero)
   (succ (prev Nat)))
   :subterm is-subterm)

(declare-const x Nat)
(declare-const y Nat)
(declare-const z Nat)

; Basic usage: z is a subterm of succ(succ(zero))
(assert (is-subterm z (succ (succ zero))))

; Test propagation:
; If (is-subterm z (succ zero)), then by expansion z must be (succ zero) or z must be zero.
(assert (is-subterm x (succ y)))
(assert (not (is-subterm y x)))

; Check for satisfiability
(check-sat)
(get-model)

; Test conflict:
; If we say zero is a subterm of succ(succ(zero)), that's true.
; But if we say (succ zero) is a subterm of zero, that should be a conflict
; (after the theory is fully implemented).
(push)
(assert (is-subterm (succ zero) zero))
(check-sat)
(pop)