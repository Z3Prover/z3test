; Exact quotient across a wrapped denormal count.
(set-logic QF_FP)
(push)
(declare-fun d_2_8 () (_ FloatingPoint 2 8))
(assert (fp.eq d_2_8 (fp #b0 #b00 #b0001000)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b00 #b0010000) d_2_8)
  (fp #b0 #b10 #b0000000))))
(check-sat)
(pop)
; Exponent above the rounder's signed workspace: max finite / min subnormal.
(push)
(declare-fun d_2_8_upper () (_ FloatingPoint 2 8))
(assert (fp.eq d_2_8_upper (fp #b0 #b00 #b0000001)))
(assert (not (fp.eq
  (fp.div RTZ (fp #b0 #b10 #b1111111) d_2_8_upper)
  (fp #b0 #b10 #b1111111))))
(check-sat)
(pop)
; Exponent below the rounder's signed workspace: min subnormal / max finite.
(push)
(declare-fun d_2_8_lower () (_ FloatingPoint 2 8))
(assert (fp.eq d_2_8_lower (fp #b0 #b10 #b1111111)))
(assert (not (fp.eq
  (fp.div RTP (fp #b0 #b00 #b0000001) d_2_8_lower)
  (fp #b0 #b00 #b0000001))))
(check-sat)
