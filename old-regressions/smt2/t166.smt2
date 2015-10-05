
; Copyright (c) 2015 Microsoft Corporation
(set-option :smt.macro-finder true)
(set-option :produce-models true)
(declare-fun f (Int Int) Int)
(assert (forall ((x Int) (y Int)) (= (f x y) (+ (* 2 x) (* 3 y) 10))))
(check-sat)
(get-model)
(eval (f 10 20))
(eval (f 20 10))

(reset)

(declare-fun f (Int Int Int Int) Int)
(assert (forall ((x1 Int) (x2 Int) (x3 Int) (x4 Int)) (= (f x1 x2 x3 x4) (+ x1 (* 2 x2) (ite (> x4 10) 1 0) 1))))
(check-sat)
(eval (f 1 1 100 0))
(eval (f 1 1 0 0))
(eval (f 1 1 100 10))
(eval (f 1 1 0 11))
(eval (f 3 1 0 11))
(eval (f 3 2 0 11))
(eval (f 3 2 0 100))
(eval (f 3 2 10000 100))
(eval (f 3 2 10000 (- 100)))


