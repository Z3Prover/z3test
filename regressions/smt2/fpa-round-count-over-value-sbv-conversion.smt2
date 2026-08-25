; FP(13,3): round's sigma is 15 bits and its sig_ext shift operand is 14 bits: signed BV conversion.
(set-logic QF_FPBV)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 13 3) (fp #b0 #b0111111111111 #b00))
(declare-fun x () (_ BitVec 15))
(assert (and
  (bvsle x (_ bv1 15))
  (bvsge x (_ bv1 15))
  (not (= ((_ to_fp 13 3) RNE x) one))))
(check-sat-using qffp)
