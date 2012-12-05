
(declare-const a (_ BitVec 8))
(declare-const b (_ BitVec 8))
(declare-fun p (Bool) Bool)

(assert (p (bvule a (bvadd #x01 b))))
(assert (bvule a (bvadd #x01 b)))
(set-option :produce-models true)
(apply elim-uncnstr :print-model-converter true)

