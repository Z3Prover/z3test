
; Copyright (c) 2015 Microsoft Corporation

(declare-fun f (Int) Int)
(declare-const a (Array Int Int))
(declare-fun g (Int) Int)
(declare-const c Int)

(assert (= a (_ as-array f)))
(push)
(assert (forall ((x Int)) (= (f x) x)))
(assert (forall ((x Int)) (= (g x) x)))
(assert (> (g c) 0))

(apply (then simplify expand-macros) :print-model-converter true)
