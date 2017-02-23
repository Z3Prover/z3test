(set-logic QF_S)
(set-info :status sat)
(declare-const x1 String)
(declare-const x2 String)
(declare-const y String)


(assert (= y (str.++ (str.++ x1 "b" ) (str.++ "a" x2) ) ) )



(check-sat)
(get-model)