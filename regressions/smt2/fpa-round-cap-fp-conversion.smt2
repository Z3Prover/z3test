; FP(2,16) cap 18 cannot fit in sigma's four bits; exact 2^-6 shifts by five.
(set-logic QF_FP)
(set-info :status unsat)
(declare-fun x () (_ FloatingPoint 8 24))
(assert (and
  (fp.eq x (fp #b0 #b01111001 (_ bv0 23)))
  (not (=
    ((_ to_fp 2 16) RNE x)
    (fp #b0 #b00 (_ bv512 15))))))
(check-sat-using qffp)
