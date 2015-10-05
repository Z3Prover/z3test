
; Copyright (c) 2015 Microsoft Corporation


(declare-const A1 (Array Int (Array Bool Int)))
(declare-const A2 (Array Int (Array Bool Int)))
(declare-const B (Array Bool Int))

(assert (= A1 (store A2 0 B)))

(apply (then simplify elim_array simplify) :print-model-converter true)
