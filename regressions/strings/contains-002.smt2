(set-logic QF_S)
(set-info :status sat)
(declare-const x String)

(assert (not (str.contains x "efg" ) ) )

(check-sat)
(get-model)
