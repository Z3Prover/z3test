; FP(6,3) has an 8-bit division exponent and a 7-bit normalization distance.
(set-logic QF_FP)
(set-info :status unsat)
(declare-fun x () (_ FloatingPoint 6 3))
(assert (and
  (fp.eq x (fp #b0 #b011111 #b00))
  (not (= (fp.div RNE x x) (fp #b0 #b011111 #b00)))))
(check-sat-using qffp)
