
; Copyright (c) 2015 Microsoft Corporation


(declare-const A1 (Array Int (Array Bool Int)))
(declare-const A2 (Array Int (Array Bool Int)))
(declare-const B (Array Bool Int))
(declare-const C (Array Bool Int))
(declare-const a Int)

(assert (= (store B true a) ((_ map (+ (Int Int) Int)) (select (store A1 a C) 0) (select A1 1))))

(apply (then simplify elim_array simplify) :print-model-converter true)
