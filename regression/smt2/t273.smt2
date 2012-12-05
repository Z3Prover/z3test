
(set-option :pp.max-depth 100)
(declare-const a Int)
(declare-const b Int)

(assert (= (+ (* 3 a) (* 6 b)) 21))

(apply (and-then simplify nla2bv))

(assert (and (<= 1 a) (<= a 3)))
(assert (and (<= 2 b) (<= b 12)))

(apply (and-then simplify nla2bv))

(set-option :produce-models true)

(apply (and-then simplify nla2bv) :print-model-converter true)
