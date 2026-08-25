; Deep negative underflow in FP(2,8) rounds to -0 except under RTN.
; RTN returns the negative minimum subnormal.
(set-logic QF_FP)
(set-info :status unsat)
(define-sort FP28 () (_ FloatingPoint 2 8))
(define-fun bad-div ((rm RoundingMode) (x FP28) (y FP28) (want FP28)) Bool
  (not (= (fp.div rm x y) want)))
(define-fun bad-all-modes ((x FP28) (y FP28)) Bool
  (or
    (bad-div RNE x y (_ -zero 2 8))
    (bad-div RNA x y (_ -zero 2 8))
    (bad-div RTP x y (_ -zero 2 8))
    (bad-div RTN x y (fp #b1 #b00 #b0000001))
    (bad-div RTZ x y (_ -zero 2 8))))
(declare-fun numerator () FP28)
(assert (and
  (fp.eq numerator (fp #b1 #b00 #b0000001))
  (bad-all-modes numerator (fp #b0 #b10 #b1111111))))
(check-sat-using qffp)
