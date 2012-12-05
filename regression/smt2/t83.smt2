
(set-option :produce-models true)

(declare-const a Int)
(declare-const b Int)

(assert (= a b))
(check-sat)
(get-model)