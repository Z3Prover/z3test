; FP(12,3) is the boundary where round's sigma and sig_ext shift operand are both 14 bits.
(set-logic QF_FP)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 12 3) (fp #b0 #b011111111111 #b00))
(declare-fun x () (_ FloatingPoint 12 3))
(assert (and (fp.eq x one) (not (= (fp.mul RNE x x) one))))
(check-sat-using qffp)
