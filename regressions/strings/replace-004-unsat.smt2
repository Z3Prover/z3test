(set-logic QF_S)
(set-info :status unsat)
(declare-const x String)
(declare-const y String)


(assert (= y (str.replace "mn_efg_k" "efg" "abcd")  ) )
(assert (= y "ab"  ) )

(check-sat)
(get-model)