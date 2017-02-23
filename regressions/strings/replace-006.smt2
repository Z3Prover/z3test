(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)

(assert (= y (str.replace x "efg" "abcd")  ) )
(assert (= x "efg") )

(check-sat)
(get-model)