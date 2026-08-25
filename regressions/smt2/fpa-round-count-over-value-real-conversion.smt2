; FP(13,3) gives round a 15-bit sigma and a 14-bit shifted value: Real conversion.
(set-logic ALL)
(set-info :status unsat)
(define-fun one () (_ FloatingPoint 13 3) (fp #b0 #b0111111111111 #b00))
(declare-fun x () Real)
(assert (and (<= x 1.0) (>= x 1.0)))
(assert (not (= ((_ to_fp 13 3) RNE x) one)))
(check-sat-using qffp)
