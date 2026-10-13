; Converting one from FP(14,3) to FP(13,3) gives round a 15-bit sigma
; and a 14-bit sig_ext shift operand.
(set-logic QF_FP)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 13 3) (fp #b0 #b0111111111111 #b00))
(declare-fun x () (_ FloatingPoint 14 3))
(assert (and
  (fp.eq x (fp #b0 #b01111111111111 #b00))
  (not (= ((_ to_fp 13 3) RNE x) one))))
(check-sat-using qffp)
