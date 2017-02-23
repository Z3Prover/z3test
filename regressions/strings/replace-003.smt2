(set-logic QF_S)
(set-info :status sat)
(declare-const y String)
(declare-const z String)

(assert (= z "mn_efg_k") )
(assert (= y (str.replace "mn_efg_k" "gfe" "abcd")  ) )

(check-sat)
(get-model)