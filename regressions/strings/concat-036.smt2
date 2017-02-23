(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ x y) (str.++ z "abc") ) )
(assert (= (str.len z) 0 ) )

(check-sat)
(get-model)