(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const bv Bool)

(assert (= bv (str.contains x "efk" ) ) )
(assert (= x "efk" ) )


(check-sat)
(get-model)
