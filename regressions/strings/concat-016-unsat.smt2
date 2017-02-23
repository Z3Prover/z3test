(set-logic QF_S)
(set-info :status unsat)
(declare-const a String)

(assert (= (str.++ "tesk" a) "testhello" ) )

(check-sat)
(get-model)