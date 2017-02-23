(set-logic QF_S)
(set-info :status sat)
(declare-const x1 String)
(declare-const x2 String)
(declare-const x3 String)
(declare-const y String)

(assert (= y (str.++ x1 (str.++ x2 x3) ) ) )
(assert (= x2 "abc" ) )
(assert (= (str.len x1) 1) )
(assert (= (str.len y) 4) )


(check-sat)
(get-model)
