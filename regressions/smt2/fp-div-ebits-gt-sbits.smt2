; General fp.div coverage for exponent widths greater than significand widths.
(set-logic ALL)
(set-option :model_validate true)

(define-sort FP43 () (_ FloatingPoint 4 3))
(declare-fun x43 () FP43)
(declare-fun y43 () FP43)
(define-fun bad-div-43 ((rm RoundingMode) (x FP43) (y FP43) (want FP43)) Bool
  (not (= (fp.div rm x y) want)))
(define-fun bad-all-modes-43
  ((x FP43) (y FP43) (rne FP43) (rna FP43) (rtp FP43) (rtn FP43) (rtz FP43)) Bool
  (or
    (bad-div-43 RNE x y rne)
    (bad-div-43 RNA x y rna)
    (bad-div-43 RTP x y rtp)
    (bad-div-43 RTN x y rtn)
    (bad-div-43 RTZ x y rtz)))

(define-fun p-one-43 () FP43 (fp #b0 #b0111 #b00))
(define-fun n-one-43 () FP43 (fp #b1 #b0111 #b00))
(define-fun p-two-43 () FP43 (fp #b0 #b1000 #b00))
(define-fun p-three-43 () FP43 (fp #b0 #b1000 #b10))
(define-fun p-min-sub-43 () FP43 (fp #b0 #b0000 #b01))
(define-fun n-min-sub-43 () FP43 (fp #b1 #b0000 #b01))
(define-fun p-max-43 () FP43 (fp #b0 #b1110 #b11))
(define-fun n-max-43 () FP43 (fp #b1 #b1110 #b11))
(define-fun p-seven-eighths-43 () FP43 (fp #b0 #b0110 #b11))
(define-fun p-five-fourths-43 () FP43 (fp #b0 #b0111 #b01))

; Exact values below one, above one, and from normalized denormals.
(push 1)
(assert (and
  (= x43 p-one-43)
  (= y43 p-two-43)
  (bad-all-modes-43 x43 y43
    (fp #b0 #b0110 #b00) (fp #b0 #b0110 #b00) (fp #b0 #b0110 #b00)
    (fp #b0 #b0110 #b00) (fp #b0 #b0110 #b00))))
(check-sat)
(pop 1)
(push 1)
(assert (and
  (= x43 p-two-43)
  (= y43 p-one-43)
  (bad-all-modes-43 x43 y43
    (fp #b0 #b1000 #b00) (fp #b0 #b1000 #b00) (fp #b0 #b1000 #b00)
    (fp #b0 #b1000 #b00) (fp #b0 #b1000 #b00))))
(check-sat)
(pop 1)
(push 1)
(assert (and
  (= x43 p-min-sub-43)
  (= y43 p-min-sub-43)
  (bad-all-modes-43 x43 y43 p-one-43 p-one-43 p-one-43 p-one-43 p-one-43)))
(check-sat)
(pop 1)

; Inexact values exercise sign-sensitive directed rounding.
(push 1)
(assert (and
  (= x43 p-one-43)
  (= y43 p-three-43)
  (bad-all-modes-43 x43 y43
    (fp #b0 #b0101 #b01) (fp #b0 #b0101 #b01) (fp #b0 #b0101 #b10)
    (fp #b0 #b0101 #b01) (fp #b0 #b0101 #b01))))
(check-sat)
(pop 1)
(push 1)
(assert (and
  (= x43 n-one-43)
  (= y43 p-three-43)
  (bad-all-modes-43 x43 y43
    (fp #b1 #b0101 #b01) (fp #b1 #b0101 #b01) (fp #b1 #b0101 #b01)
    (fp #b1 #b0101 #b10) (fp #b1 #b0101 #b01))))
(check-sat)
(pop 1)

; Half of the minimum subnormal distinguishes ties-to-even from ties-to-away.
(push 1)
(assert (and
  (= x43 p-min-sub-43)
  (= y43 p-two-43)
  (bad-all-modes-43 x43 y43
    (_ +zero 4 3) p-min-sub-43 p-min-sub-43 (_ +zero 4 3) (_ +zero 4 3))))
(check-sat)
(pop 1)
(push 1)
(assert (and
  (= x43 n-min-sub-43)
  (= y43 p-two-43)
  (bad-all-modes-43 x43 y43
    (_ -zero 4 3) n-min-sub-43 (_ -zero 4 3) n-min-sub-43 (_ -zero 4 3))))
(check-sat)
(pop 1)

; Exact 256 overflows FP(4,3); directed modes select infinity or max finite.
(push 1)
(assert (and
  (= x43 p-max-43)
  (= y43 p-seven-eighths-43)
  (bad-all-modes-43 x43 y43
    (_ +oo 4 3) (_ +oo 4 3) (_ +oo 4 3) p-max-43 p-max-43)))
(check-sat)
(pop 1)
(push 1)
(assert (and
  (= x43 n-max-43)
  (= y43 p-seven-eighths-43)
  (bad-all-modes-43 x43 y43
    (_ -oo 4 3) (_ -oo 4 3) n-max-43 (_ -oo 4 3) n-max-43)))
(check-sat)
(pop 1)

; Exact 1/320 lies between zero and the minimum subnormal.
(push 1)
(assert (and
  (= x43 p-min-sub-43)
  (= y43 p-five-fourths-43)
  (bad-all-modes-43 x43 y43
    p-min-sub-43 p-min-sub-43 p-min-sub-43 (_ +zero 4 3) (_ +zero 4 3))))
(check-sat)
(pop 1)
(push 1)
(assert (and
  (= x43 n-min-sub-43)
  (= y43 p-five-fourths-43)
  (bad-all-modes-43 x43 y43
    n-min-sub-43 n-min-sub-43 (_ -zero 4 3) n-min-sub-43 (_ -zero 4 3))))
(check-sat)
(pop 1)

; Minimum precision and correction-width boundaries.
(declare-fun x22 () (_ FloatingPoint 2 2))
(push 1)
(assert (and
  (= x22 (fp #b0 #b01 #b0))
  (not (= (fp.div RNE x22 x22) (fp #b0 #b01 #b0)))))
(check-sat)
(pop 1)
(declare-fun x32 () (_ FloatingPoint 3 2))
(push 1)
(assert (and
  (= x32 (fp #b0 #b011 #b0))
  (not (= (fp.div RNE x32 x32) (fp #b0 #b011 #b0)))))
(check-sat)
(pop 1)
(push 1)
(assert (and
  (= x43 p-one-43)
  (= y43 p-one-43)
  (not (= (fp.div RNE x43 y43) p-one-43))))
(check-sat)
(pop 1)
(declare-fun x53 () (_ FloatingPoint 5 3))
(push 1)
(assert (and
  (= x53 (fp #b0 #b01111 #b00))
  (not (= (fp.div RNE x53 x53) (fp #b0 #b01111 #b00)))))
(check-sat)
(pop 1)
(declare-fun x63 () (_ FloatingPoint 6 3))
(push 1)
(assert (and
  (= x63 (fp #b0 #b011111 #b00))
  (not (= (fp.div RNE x63 x63) (fp #b0 #b011111 #b00)))))
(check-sat)
(pop 1)

; First round-width crossing and its fitting-width control.
(declare-fun x133 () (_ FloatingPoint 13 3))
(declare-fun y133 () (_ FloatingPoint 13 3))
(push 1)
(assert (and
  (= x133 (fp #b0 #b0111111111111 #b00))
  (= y133 (fp #b0 #b0111111111111 #b00))
  (not (= (fp.div RNE x133 y133) (fp #b0 #b0111111111111 #b00)))))
(check-sat)
(pop 1)
(push 1)
(assert (and
  (= x133 (fp #b0 #b1111111111110 #b11))
  (= y133 (fp #b0 #b0000000000000 #b01))
  (not (= (fp.div RTZ x133 y133) (fp #b0 #b1111111111110 #b11)))))
(check-sat)
(pop 1)
(push 1)
(assert (and
  (= x133 (fp #b0 #b0000000000000 #b01))
  (= y133 (fp #b0 #b1111111111110 #b11))
  (not (= (fp.div RTP x133 y133) (fp #b0 #b0000000000000 #b01)))))
(check-sat)
(pop 1)
(declare-fun x123 () (_ FloatingPoint 12 3))
(push 1)
(assert (and
  (= x123 (fp #b0 #b011111111111 #b00))
  (not (= (fp.div RNE x123 x123) (fp #b0 #b011111111111 #b00)))))
(check-sat)
(pop 1)

; Widest accepted exponent and minimum internal/C-API significand controls.
(declare-fun x632 () (_ FloatingPoint 63 2))
(push 1)
(assert (and
  (= x632
    (fp #b0 #b011111111111111111111111111111111111111111111111111111111111111 #b0))
  (not (= (fp.div RNE x632 x632)
    (fp #b0 #b011111111111111111111111111111111111111111111111111111111111111 #b0)))))
(check-sat)
(pop 1)
(declare-fun x633 () (_ FloatingPoint 63 3))
(push 1)
(assert (and
  (= x633
    (fp #b0 #b011111111111111111111111111111111111111111111111111111111111111 #b00))
  (not (= (fp.div RNE x633 x633)
    (fp #b0 #b011111111111111111111111111111111111111111111111111111111111111 #b00)))))
(check-sat)
(pop 1)

; Existing exceptional-result guards remain dominant over eager finite construction.
(push 1)
(assert (and (= x43 (_ NaN 4 3)) (= y43 p-one-43)
  (not (fp.isNaN (fp.div RNE x43 y43)))))
(check-sat)
(pop 1)
(push 1)
(assert (and (= x43 p-one-43) (= y43 (_ NaN 4 3))
  (not (fp.isNaN (fp.div RNE x43 y43)))))
(check-sat)
(pop 1)
(push 1)
(assert (and (= x43 (_ +oo 4 3)) (= y43 (_ -oo 4 3))
  (not (fp.isNaN (fp.div RNE x43 y43)))))
(check-sat)
(pop 1)
(push 1)
(assert (and (= x43 p-one-43) (= y43 (_ +oo 4 3))
  (not (= (fp.div RNE x43 y43) (_ +zero 4 3)))))
(check-sat)
(pop 1)
(push 1)
(assert (and (= x43 p-one-43) (= y43 (_ -oo 4 3))
  (not (= (fp.div RNE x43 y43) (_ -zero 4 3)))))
(check-sat)
(pop 1)
(push 1)
(assert (and (= x43 p-one-43) (= y43 (_ +zero 4 3))
  (not (= (fp.div RNE x43 y43) (_ +oo 4 3)))))
(check-sat)
(pop 1)
(push 1)
(assert (and (= x43 p-one-43) (= y43 (_ -zero 4 3))
  (not (= (fp.div RNE x43 y43) (_ -oo 4 3)))))
(check-sat)
(pop 1)
(push 1)
(assert (and (= x43 (_ +zero 4 3)) (= y43 p-one-43)
  (not (= (fp.div RNE x43 y43) (_ +zero 4 3)))))
(check-sat)
(pop 1)
(push 1)
(assert (and (= x43 (_ -zero 4 3)) (= y43 p-one-43)
  (not (= (fp.div RNE x43 y43) (_ -zero 4 3)))))
(check-sat)
(pop 1)
(push 1)
(assert (and (= x43 (_ +zero 4 3)) (= y43 (_ -zero 4 3))
  (not (fp.isNaN (fp.div RNE x43 y43)))))
(check-sat)
(pop 1)
