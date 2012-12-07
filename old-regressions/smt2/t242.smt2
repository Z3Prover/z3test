

(declare-const a Int)
(declare-const b Int)

(poly/factor (- (+ (* (- 16) a) (* (- 4) a a) (* 4 b b) (* 4 a b b) (* a a b b)) 16))

(assert (= (+ (* (- 16) a) (* (- 4) a a) (* 4 b b) (* 4 a b b) (* a a b b)) 16))

(apply (and-then simplify factor simplify))
(apply (and-then simplify (! factor :split-factors false) simplify))

(reset)

(declare-const a Int)
(declare-const b Int)

(assert (>= (+ (* (- 16) a) (* (- 4) a a) (* 4 b b) (* 4 a b b) (* a a b b)) 16))

(apply (and-then simplify factor simplify))
(apply (and-then simplify (! factor :split-factors false) simplify))
