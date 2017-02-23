(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)

(assert (= "efg" (str.substr x 1 3) ) )
(assert (= (str.len x) 4) )


(check-sat)
(get-model)
