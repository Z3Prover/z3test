(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)


(assert (= y (str.replace "mn_efgefg_k" "efg" "abcd")  ) )


(check-sat)
(get-model)