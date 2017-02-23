(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ "abefef" x) (str.++ y "efefghi") ) )
(assert (= (str.len y) 2) )

(check-sat)
(get-model)