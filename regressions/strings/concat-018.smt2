(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ x y) "testHello" ) )
(assert (= (str.++ y z) "low" ) )
(assert (not (= y "" ) ) )

(check-sat)
(get-model)