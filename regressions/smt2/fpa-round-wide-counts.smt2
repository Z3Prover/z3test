; Every reachable non-division caller of round at its first wide-count format.
(set-logic ALL)
(set-option :model_validate true)

(define-sort FP133 () (_ FloatingPoint 13 3))
(define-fun one-13-3 () FP133 (fp #b0 #b0111111111111 #b00))

; Multiplication.
(push 1)
(assert (not (= (fp.mul RNE one-13-3 one-13-3) one-13-3)))
(check-sat)
(pop 1)

; Square root.
(push 1)
(assert (not (= (fp.sqrt RNE one-13-3) one-13-3)))
(check-sat)
(pop 1)

; Conversion from a different floating-point sort.
(push 1)
(assert (not (=
  ((_ to_fp 13 3) RNE
    (fp #b0 #b01111111111111 #b00))
  one-13-3)))
(check-sat)
(pop 1)

; Conversion from a symbolic Real keeps the non-numeral path reachable.
(push 1)
(declare-fun real-one () Real)
(assert (= real-one 1.0))
(assert (not (= ((_ to_fp 13 3) RNE real-one) one-13-3)))
(check-sat)
(pop 1)

; Signed and unsigned BV sources are wide enough to reach round.
(push 1)
(assert (not (= ((_ to_fp 13 3) RNE (_ bv1 15)) one-13-3)))
(check-sat)
(pop 1)
(push 1)
(assert (not (= ((_ to_fp_unsigned 13 3) RNE (_ bv1 15)) one-13-3)))
(check-sat)
(pop 1)

; Fitting-width control preserves the legacy round branch.
(push 1)
(assert (not (=
  (fp.mul RNE
    (fp #b0 #b011111111111 #b00)
    (fp #b0 #b011111111111 #b00))
  (fp #b0 #b011111111111 #b00))))
(check-sat)
(pop 1)
