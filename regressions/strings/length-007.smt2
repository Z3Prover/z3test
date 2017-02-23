(set-logic QF_S)
(set-info :status sat)
(declare-const x1 String)
(declare-const x2 String)
(declare-const y1 String)
(declare-const y2 String)

(assert (= (str.++ x1 x2) "testhello") )
(assert (= (str.len x1) 1) )
(assert (= (str.++ y1 y2) "testhello") )
(assert (= (str.len y2) 5) )


(check-sat)
(get-model)
