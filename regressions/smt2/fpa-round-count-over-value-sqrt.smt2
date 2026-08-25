; FP(13,3) square root uses a 15-bit shift count on a 14-bit value.
(set-logic QF_FP)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 13 3) (fp #b0 #b0111111111111 #b00))
(declare-fun x () (_ FloatingPoint 13 3))
(assert (and (fp.eq x one) (not (= (fp.sqrt RNE x) one))))
(check-sat-using qffp)
