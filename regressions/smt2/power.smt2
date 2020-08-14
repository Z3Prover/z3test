(declare-const a Int)
(declare-const b Int)

(simplify (<= (+ (* a a) (* b b b)) -1))
(simplify (<= (+ (* a a) (* b b b b)) -1))
(simplify (<= (+ (* a a) (* b b b b)) 0))
(simplify (>= (+ (* -1 a a) (* -2 b b)) 1))
(simplify (>= (+ (* -1 a a) (* -2 b b)) 0))
