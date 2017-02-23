(set-logic QF_S)
(set-info :status sat)
(declare-const x String)


(assert (= (str.++ x "b" ) (str.++ "a" x) ) )



(check-sat)
(get-model)