
(set-option :pp.max-depth 100)
(set-option :produce-models true)

(declare-const x Int)
(declare-const y Int)

(assert (= x (+ y 1)))

(apply (and-then simplify solve-eqs) :print-model-converter true)
(echo "----")

(declare-const z Int)

(assert (>= y (+ x z)))

(apply (and-then simplify solve-eqs) :print-model-converter true)
(echo "----")

(reset)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-fun f (Int) Int)

(assert (ite (> x 0) (= y (+ z 1)) (= y (+ z 2))))
(assert (>= (f y) 0))

(apply (and-then simplify solve-eqs) :print-model-converter true)
(echo "----")



