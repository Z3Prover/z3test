


(set-option :produce-models true)
(declare-const x (_ BitVec 4))
(declare-const y (_ BitVec 4))
(assert (= (bvmul x y) (bvnot (bvmul x y))))
(apply elim-uncnstr :print-model-converter true)
