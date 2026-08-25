; FP(16,3): round's sigma is 18 bits and its sig_ext shift operand is 14 bits; tiny product shifts right.
(set-logic QF_FP)
(set-info :status unsat)
(define-fun min-sub () (_ FloatingPoint 16 3) (fp #b0 #b0000000000000000 #b01))
(declare-fun x () (_ FloatingPoint 16 3))
(assert (and
  (fp.eq x min-sub)
  (not (= (fp.mul RNE x x) (_ +zero 16 3)))))
(check-sat-using qffp)
