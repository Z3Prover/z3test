; Converting signed 15-bit BV 1 to FP(13,3) uses a 15-bit shift count on a 14-bit value.
(set-logic QF_FPBV)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 13 3) (fp #b0 #b0111111111111 #b00))
(declare-fun x () (_ BitVec 15))
(assert (and
  (bvsle x (_ bv1 15))
  (bvsge x (_ bv1 15))
  (not (= ((_ to_fp 13 3) RNE x) one))))
(check-sat-using qffp)
