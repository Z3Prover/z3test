
(set-option :produce-models true)
(set-option :pp.max-depth 100)
(declare-fun f (Int Int Int) Int)
(declare-const a Int)
(declare-const b Int)

(assert (= (f a 0 0) 0))
(assert (= (f a 0 1) 1))
(assert (= (f a 1 1) 2))
(assert (= (f a 1 2) 3))
(apply reduce-args :print-model-converter true)

(assert (= (f a 0 b) 10))
(apply reduce-args :print-model-converter true)

(assert (= (f a b b) 10))
(apply reduce-args :print-model-converter true)
