

(declare-const x Real)
(declare-const y Real)

(assert (> x (asin y)))
(assert (> (* x x) (asin y)))
(assert (= y (acos x)))
(assert (= (+ y 1.0) (atan x)))

(apply (then simplify purify-arith simplify))
(apply (then simplify (! purify-arith :complete false) simplify))