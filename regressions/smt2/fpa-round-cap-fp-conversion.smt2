; Converting 2^-6 to FP(2,16) needs a right shift of 5.
; The cap sbits + 2 = 18 must not wrap to 2 in sigma's 4 bits.
(set-logic QF_FP)
(set-info :status unsat)
(declare-fun x () (_ FloatingPoint 8 24))
(assert (and
  (fp.eq x (fp #b0 #b01111001 (_ bv0 23)))
  (not (=
    ((_ to_fp 2 16) RNE x)
    (fp #b0 #b00 (_ bv512 15))))))
(check-sat-using qffp)
