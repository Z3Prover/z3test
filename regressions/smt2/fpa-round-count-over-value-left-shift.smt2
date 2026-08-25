; FP(16,3) multiplication reaches the left-shift branch with an 18-bit count and a 14-bit value.
(set-logic QF_FP)
(set-info :status unsat)
(define-fun half () (_ FloatingPoint 16 3) (fp #b0 #b0111111111111110 #b00))
(define-fun quarter () (_ FloatingPoint 16 3) (fp #b0 #b0111111111111101 #b00))
(declare-fun x () (_ FloatingPoint 16 3))
(assert (and (fp.eq x half) (not (= (fp.mul RNE x x) quarter))))
(check-sat-using qffp)
