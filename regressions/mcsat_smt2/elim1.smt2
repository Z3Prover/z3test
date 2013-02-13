
(declare-fun f (Int) Int)
(declare-const a (Array Int Int))
(declare-fun g (Int) Int)
(declare-const c Int)

(assert (forall ((x Int)) (= (f x) x)))
(assert (= a (_ as-array f)))
(assert (forall ((x Int)) (= (g x) x)))
(assert (> (f c) 0))

(apply (then simplify expand-macros) :print-model-converter true)
