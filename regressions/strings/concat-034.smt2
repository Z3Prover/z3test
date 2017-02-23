(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)


(assert (= (str.++ (str.++ x "b") y) (str.++ z "abc") ) )


(check-sat)
(get-model)