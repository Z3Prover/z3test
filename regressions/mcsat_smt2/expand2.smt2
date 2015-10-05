
; Copyright (c) 2015 Microsoft Corporation


(declare-fun f (Int) Int)
(declare-fun g (Int) Int)
(declare-const a Int)
(declare-const b Int)

(assert (forall ((x Int)) (= (f x) (g x))))
(assert (forall ((x Int)) (= (g x) (f x))))
(assert (> (f a) 0))
(assert (= (f (f b)) 0))

(apply expand-macros :print-model-converter true)