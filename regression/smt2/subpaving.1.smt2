

(declare-const x Real)
(declare-const y Real)
(declare-const z Real)

(to-subpaving (+ x (* 2.0 y) (* x y) (+ x y)))
(echo "")
(to-subpaving (* (^ (* 2.0 x) 2.0) y (* 3.5 x)))
(echo "")
(to-subpaving (+ (* 1.5 x) (* (/ 1.0 3.0) y) (* (/ 1.0 6.0) z) 3.0))
(echo "")
(to-subpaving (* (+ 1.5 x y) x z))
(echo "")
(to-subpaving (* (^ (* x y) 2.0) x y))
(echo "")
(to-subpaving (+ 1.5 x 0.5 y))

(echo "done")

