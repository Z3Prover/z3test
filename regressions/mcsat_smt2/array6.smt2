
; Copyright (c) 2015 Microsoft Corporation


(declare-const A1 (Array Int (Array Bool Int)))
(declare-const A2 (Array Int (Array Bool Int)))
(declare-const A3 (Array Int (Array Bool Int)))
(declare-const b Bool)
(declare-const c Int)
(declare-const B (Array Bool Int))

(assert (= A1 (ite b (store A2 c B) A3)))
(assert (forall ((x Int) (y Int) (z Bool)) (=> (<= x y) (<= (select (select A1 x) z) (select (select A1 y) z)))))


(apply (then simplify elim_array simplify) :print-model-converter true)
