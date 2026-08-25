; FP(2,2) division must not construct an empty quotient-bit extract.
(set-logic QF_FP)
(set-info :status unsat)
(declare-fun x () (_ FloatingPoint 2 2))
(assert (and
  (fp.eq x (fp #b0 #b01 #b0))
  (not (= (fp.div RNE x x) (fp #b0 #b01 #b0)))))
(check-sat-using qffp)
