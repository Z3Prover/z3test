; FP(2,16) division needs a right shift of 6.
; The cap sbits + 2 = 18 must not wrap to 2 in sigma's 4 bits.
(set-logic QF_FP)
(set-info :status unsat)
(declare-fun numerator () (_ FloatingPoint 2 16))
(assert (and
  (fp.eq numerator (fp #b0 #b00 #b000000010000000))
  (not (fp.eq
    (fp.div RNE numerator (fp #b0 #b00 #b100000000000000))
    (fp #b0 #b00 #b000000100000000)))))
(check-sat-using qffp)
