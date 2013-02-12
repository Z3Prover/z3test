

(declare-fun f (Int) Int)
(declare-const a Int)
(declare-const b Int)

(assert (forall ((x Int)) (= (f x) (+ x 1))))
(assert (> (f a) 0))
(assert (= (f (f b)) 0))

(apply expand-macros)