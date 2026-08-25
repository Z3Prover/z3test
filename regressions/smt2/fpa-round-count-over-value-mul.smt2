; FP(13,3) gives round a 15-bit sigma and a 14-bit shifted value: multiplication.
(set-logic QF_FP)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 13 3) (fp #b0 #b0111111111111 #b00))
(declare-fun x () (_ FloatingPoint 13 3))
(assert (and (fp.eq x one) (not (= (fp.mul RNE x x) one))))
(check-sat-using qffp)
