

(set-option :produce-models true)
(declare-const x (_ BitVec 8))
(declare-const y (_ BitVec 8))

(assert (bvsle x #x0a))
(assert (bvsle y x))

(apply elim-uncnstr :print-model-converter true)
(reset)

(set-option :produce-models true)
(declare-const x (_ BitVec 8))
(declare-const y (_ BitVec 8))

(assert (bvsle x #x0a))
(assert (bvsle x y))

(apply elim-uncnstr :print-model-converter true)
(reset)

(set-option :produce-models true)
(declare-const x (_ BitVec 8))
(declare-const y (_ BitVec 8))

(assert (bvsle x #x0a))
(assert (bvule y x))

(apply elim-uncnstr :print-model-converter true)
(reset)

(set-option :produce-models true)
(declare-const x (_ BitVec 8))
(declare-const y (_ BitVec 8))

(assert (bvsle x #x0a))
(assert (bvule x y))

(apply elim-uncnstr :print-model-converter true)
(reset)

(declare-const x (_ BitVec 8))
(simplify (bvsle x #x7f))
