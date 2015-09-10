(set-logic QF_FPBV)
(set-info :status sat)

; floats
(declare-const x (_ FloatingPoint 11 53))
(declare-const y (_ FloatingPoint 11 53))
(declare-const r (_ FloatingPoint 11 53))
(declare-const k (_ FloatingPoint 8 24))

(assert 
 (and 
  (= x ((_ to_fp 11 53) roundTowardZero 0.5 0))
  (= y ((_ to_fp 11 53) roundTowardZero 0.5 0))
  (= r (fp.add roundTowardZero x y))
  (= k (fp #b1 #b11111111 #b00000000000000000000001))
 ))

(check-sat)

