

(declare-fun f (Int Bool Real) Bool)

(assert (select (select ((_ curry 1) (_ as-array f)) 10 true) 1.2))

(apply (then simplify elim_array simplify) :print-model-converter true)
