(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ "ab" x) (str.++ y "k_ghi") ) )

(check-sat)
(get-model)