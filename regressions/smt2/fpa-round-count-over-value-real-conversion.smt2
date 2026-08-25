; Converting Real 1.0 to FP(13,3) uses a 15-bit shift count on a 14-bit value.
(set-logic QF_FPLRA)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 13 3) (fp #b0 #b0111111111111 #b00))
(declare-fun x () Real)
(assert (and (<= x 1.0) (>= x 1.0)))
(assert (not (= ((_ to_fp 13 3) RNE x) one)))
(check-sat-using qffp)
