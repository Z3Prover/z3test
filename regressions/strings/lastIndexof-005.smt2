(set-logic QF_S)
(set-info :status sat)
(declare-const i Int)
(declare-const X String)

(assert (= i (str.lastindexof X "abcd") ) )
(assert (= X "abcd1234abc" ) )

(check-sat)
(get-model)
