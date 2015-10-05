
; Copyright (c) 2015 Microsoft Corporation


(declare-fun f ((Array Int Bool)) Int)

(assert (forall ((A (Array Int Bool))) (= (f (store A 0 true)) 0)))

(apply (then simplify elim_array simplify) :print-model-converter true)

