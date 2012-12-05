
(set-option :produce-models true)


(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-fun p (Int) Bool)

(assert (= x (+ y z)))
(assert (= (- x z) 2))
(assert (p y))

(apply (and-then simplify solve-eqs) :print-model-converter true)
