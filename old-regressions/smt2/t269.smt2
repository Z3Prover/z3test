
(set-option :produce-models true)
(declare-const a (_ BitVec 32))
(declare-const b (_ BitVec 32))

(assert (bvsle (bvneg #x00000002) a))
(assert (bvsle a #x00000002))
(assert (= (bvadd a b) #x0000000a))

(apply (and-then simplify reduce-bv-size) :print-model-converter true)

(assert (bvsle (bvneg #x00000005) b))
(assert (bvsle b #x00000005))
(apply (and-then simplify reduce-bv-size) :print-model-converter true)
