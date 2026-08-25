; At sbits=2, fp.div must not construct the empty excess-quotient extract.
(set-logic QF_FP)
(set-info :status unsat)
(declare-fun x () (_ FloatingPoint 2 2))
(assert (and
  (fp.eq x (fp #b0 #b01 #b0))
  (not (= (fp.div RNE x x) (fp #b0 #b01 #b0)))))
(check-sat-using qffp)
