(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const Y3 String)
(declare-const Y4 String)


(assert (= (str.++ x "abc") (str.++ "ef" y) ) )
(assert (= (str.++ y Y3) (str.++ Y4 x) ) )


(check-sat)
(get-model)