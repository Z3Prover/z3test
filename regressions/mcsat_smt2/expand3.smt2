

(declare-fun f (Int) Int)
(declare-fun g (Int) Int)
(declare-fun h (Int) Int)
(declare-const a Int)
(declare-const b Int)

(set-option :pp.max-depth 100)
(assert (forall ((x Int)) (= (f x) (+ (g x) 1))))
(assert (forall ((x Int)) (= (g x) (+ (h x) 1))))
(assert (forall ((x Int)) (= (h x) (f (f x)))))
(assert (= (+ (f a) (h a)) 0))

(apply expand-macros :print-model-converter true)