(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const i Int)

(assert (= (str.len "abcd") i) )
(assert (> (str.len x) (+ i 1) ) )

(check-sat)
(get-model)
