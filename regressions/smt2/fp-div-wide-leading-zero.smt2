; The FP(2,8) minimum subnormal needs a 3-bit leading-zero count; divided by itself, it is one.
(set-logic QF_FP)
(set-info :status unsat)
(declare-fun x () (_ FloatingPoint 2 8))
(assert (and
  (fp.eq x (fp #b0 #b00 #b0000001))
  (not (= (fp.div RNE x x) (fp #b0 #b01 #b0000000)))))
(check-sat-using qffp)
