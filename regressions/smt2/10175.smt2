; Regression for Z3 issue #10175.
(set-logic QF_FP)
; pre-wrap control: exact quotient is 2.0.
(push)
(declare-fun d_2_4 () (_ FloatingPoint 2 4))
(assert (fp.eq d_2_4 (fp #b0 #b00 #b001)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b00 #b010) d_2_4)
  (fp #b0 #b10 #b000))))
(check-sat)
(pop)
; first wrapped count: exact quotient is 2.0.
(push)
(declare-fun d_2_5 () (_ FloatingPoint 2 5))
(assert (fp.eq d_2_5 (fp #b0 #b00 #b0001)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b00 #b0010) d_2_5)
  (fp #b0 #b10 #b0000))))
(check-sat)
(pop)
; reported format: exact quotient is 2.0.
(push)
(declare-fun d_2_6 () (_ FloatingPoint 2 6))
(assert (fp.eq d_2_6 (fp #b0 #b00 #b00010)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b00 #b00100) d_2_6)
  (fp #b0 #b10 #b00000))))
(check-sat)
(pop)
; largest format covered by ebits+2 exponent workspace: exact quotient is 2.0.
(push)
(declare-fun d_2_7 () (_ FloatingPoint 2 7))
(assert (fp.eq d_2_7 (fp #b0 #b00 #b000100)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b00 #b001000) d_2_7)
  (fp #b0 #b10 #b000000))))
(check-sat)
(pop)
; FP(2,7) upper exponent endpoint: max finite / min subnormal = 254.
(push)
(declare-fun d_2_7_upper () (_ FloatingPoint 2 7))
(assert (fp.eq d_2_7_upper (fp #b0 #b00 #b000001)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b10 #b111111) d_2_7_upper)
  (fp #b0 #b10 #b111111))))
(check-sat)
(pop)
; FP(2,7) lower exponent endpoint: min subnormal / max finite = 1/254.
(push)
(declare-fun d_2_7_lower () (_ FloatingPoint 2 7))
(assert (fp.eq d_2_7_lower (fp #b0 #b10 #b111111)))
(assert (not (fp.eq
  (fp.div RTP (fp #b0 #b00 #b000001) d_2_7_lower)
  (fp #b0 #b00 #b000001))))
(check-sat)
(pop)
; pre-wrap control: exact quotient is 2.0.
(push)
(declare-fun d_3_8 () (_ FloatingPoint 3 8))
(assert (fp.eq d_3_8 (fp #b0 #b000 #b0000001)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b000 #b0000010) d_3_8)
  (fp #b0 #b100 #b0000000))))
(check-sat)
(pop)
; first wrapped count: exact quotient is 2.0.
(push)
(declare-fun d_3_9 () (_ FloatingPoint 3 9))
(assert (fp.eq d_3_9 (fp #b0 #b000 #b00000001)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b000 #b00000010) d_3_9)
  (fp #b0 #b100 #b00000000))))
(check-sat)
(pop)
; wider format: exact quotient is 2.0.
(push)
(declare-fun d_3_11 () (_ FloatingPoint 3 11))
(assert (fp.eq d_3_11 (fp #b0 #b000 #b0000000100)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b000 #b0000001000) d_3_11)
  (fp #b0 #b100 #b0000000000))))
(check-sat)
(pop)
; pre-wrap control: exact quotient is 2.0.
(push)
(declare-fun d_4_16 () (_ FloatingPoint 4 16))
(assert (fp.eq d_4_16 (fp #b0 #b0000 #b000000000000001)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b0000 #b000000000000010) d_4_16)
  (fp #b0 #b1000 #b000000000000000))))
(check-sat)
(pop)
; first wrapped count: exact quotient is 2.0.
(push)
(declare-fun d_4_17 () (_ FloatingPoint 4 17))
(assert (fp.eq d_4_17 (fp #b0 #b0000 #b0000000000000001)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b0000 #b0000000000000010) d_4_17)
  (fp #b0 #b1000 #b0000000000000000))))
(check-sat)
(pop)
; wider format: exact quotient is 2.0.
(push)
(declare-fun d_4_19 () (_ FloatingPoint 4 19))
(assert (fp.eq d_4_19 (fp #b0 #b0000 #b000000000000000100)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b0000 #b000000000000001000) d_4_19)
  (fp #b0 #b1000 #b000000000000000000))))
(check-sat)
(pop)
; Reported negative-overflow case: -3.25 / 1/16 = -52 in FP(2,6).
(push)
(declare-fun d_rtz () (_ FloatingPoint 2 6))
(assert (fp.eq d_rtz (fp #b0 #b00 #b00010)))
(assert (fp.eq (fp.div RTZ (fp #b1 #b10 #b10100) d_rtz) (_ -oo 2 6)))
(check-sat)
(pop)
(push)
(declare-fun d_rtn () (_ FloatingPoint 2 6))
(assert (fp.eq d_rtn (fp #b0 #b00 #b00010)))
(assert (fp.eq (fp.div RTN (fp #b1 #b10 #b10100) d_rtn) (_ -oo 2 6)))
(check-sat)
(pop)
