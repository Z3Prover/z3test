(set-logic QF_S)
(set-info :status sat)
(declare-const X String)
(declare-const Y String)
(declare-const I String)
(declare-const J String)

(assert (= (str.++ X Y) (str.++ I (str.++ "c" J) ) ) )
(assert (> (str.len X) 0) )
(assert (> (str.len Y) 1) )

(check-sat)
(get-model)