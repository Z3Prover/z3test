(set-logic QF_S)
(set-info :status sat)
(declare-const x1 String)
(declare-const y2 String)
(declare-const x2 String)


(assert (= (str.++ x1 (str.++ "ef" y2)) (str.++ "abc" x2)) )
(assert (= (str.len x1) 4) )

(check-sat)
(get-model)