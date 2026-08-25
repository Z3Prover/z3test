; FP(13,3): round's sigma is 15 bits and its sig_ext shift operand is 14 bits: square root.
(set-logic QF_FP)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 13 3) (fp #b0 #b0111111111111 #b00))
(declare-fun x () (_ FloatingPoint 13 3))
(assert (and (fp.eq x one) (not (= (fp.sqrt RNE x) one))))
(check-sat-using qffp)
