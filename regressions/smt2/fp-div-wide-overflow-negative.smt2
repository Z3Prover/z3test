; FP(2,8) negative overflow selects infinity or max finite by rounding mode.
(set-logic QF_FP)
(set-info :status unsat)
(define-sort FP28 () (_ FloatingPoint 2 8))
(define-fun bad-div ((rm RoundingMode) (x FP28) (y FP28) (want FP28)) Bool
  (not (= (fp.div rm x y) want)))
(define-fun bad-all-modes ((x FP28) (y FP28)) Bool
  (or
    (bad-div RNE x y (_ -oo 2 8))
    (bad-div RNA x y (_ -oo 2 8))
    (bad-div RTP x y (fp #b1 #b10 #b1111111))
    (bad-div RTN x y (_ -oo 2 8))
    (bad-div RTZ x y (fp #b1 #b10 #b1111111))))
(declare-fun denominator () FP28)
(assert (and
  (fp.eq denominator (fp #b0 #b00 #b0000001))
  (bad-all-modes (fp #b1 #b10 #b1111111) denominator)))
(check-sat-using qffp)
