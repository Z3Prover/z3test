(set-logic QF_S)
(set-info :status sat)
(declare-const X String)
(declare-const ts0 String)
(declare-const ts1 String)
(declare-const ts2 String)

(assert (= X (str.++ ts0 (str.++ "abc" ts2 ) ) ) )
(assert (= X "abc") )


(check-sat)
(get-model)