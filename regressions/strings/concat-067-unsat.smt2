(set-logic QF_S)
(set-info :status unsat)
(declare-const X String)
(declare-const Y String)
(declare-const I String)
(declare-const J String)

(assert (= (str.++ X "a" ) (str.++ I (str.++ "c" J) ) ) )
(assert (= (str.len X) 0 ) )

(check-sat)
(get-model)