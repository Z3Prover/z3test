(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ "abc" x) (str.++ "abc" y) ) )
(assert (= (str.len x) 1 ) )

(check-sat)
(get-model)