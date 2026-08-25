; FP(13,3): round's sigma is 15 bits and its sig_ext shift operand is 14 bits: FP conversion.
(set-logic QF_FP)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 13 3) (fp #b0 #b0111111111111 #b00))
(declare-fun x () (_ FloatingPoint 14 3))
(assert (and
  (fp.eq x (fp #b0 #b01111111111111 #b00))
  (not (= ((_ to_fp 13 3) RNE x) one))))
(check-sat-using qffp)
