(set-logic QF_S)
(set-info :status sat)
(declare-const x String)

(assert (str.contains x "efg" ) )
(assert (str.contains x "ef" ) )

(check-sat)
(get-model)
