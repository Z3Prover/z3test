; Every reachable non-division caller of round at its first wide-count format.
(set-logic ALL)
(set-option :model_validate true)

(define-sort FP133 () (_ FloatingPoint 13 3))
(define-fun one-13-3 () FP133 (fp #b0 #b0111111111111 #b00))
(declare-fun x13-3 () FP133)

; Multiplication.
(push 1)
(assert (and
  (= x13-3 one-13-3)
  (not (= (fp.mul RNE x13-3 x13-3) one-13-3))))
(check-sat)
(pop 1)

; Square root.
(push 1)
(assert (and
  (= x13-3 one-13-3)
  (not (= (fp.sqrt RNE x13-3) one-13-3))))
(check-sat)
(pop 1)

; Conversion from a different floating-point sort.
(declare-fun x14-3 () (_ FloatingPoint 14 3))
(push 1)
(assert (and
  (= x14-3 (fp #b0 #b01111111111111 #b00))
  (not (= ((_ to_fp 13 3) RNE x14-3) one-13-3))))
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
(declare-fun sbv-one () (_ BitVec 15))
(push 1)
(assert (and
  (= sbv-one (_ bv1 15))
  (not (= ((_ to_fp 13 3) RNE sbv-one) one-13-3))))
(check-sat)
(pop 1)
(declare-fun ubv-one () (_ BitVec 15))
(push 1)
(assert (and
  (= ubv-one (_ bv1 15))
  (not (= ((_ to_fp_unsigned 13 3) RNE ubv-one) one-13-3))))
(check-sat)
(pop 1)

; Fitting-width control preserves the legacy round branch.
(declare-fun x12-3 () (_ FloatingPoint 12 3))
(push 1)
(assert (and
  (= x12-3 (fp #b0 #b011111111111 #b00))
  (not (=
    (fp.mul RNE x12-3 x12-3)
    (fp #b0 #b011111111111 #b00)))))
(check-sat)
(pop 1)
