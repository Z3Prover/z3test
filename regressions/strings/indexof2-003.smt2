(set-logic QF_S)
(set-info :status sat)
(declare-const i1 Int)
(declare-const i2 Int)

(assert (= i1 (Indexof2 "abc" "b" i2) ) )
(assert (> i2 1))

(check-sat)
(get-model)
