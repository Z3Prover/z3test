(set-logic QF_S)
(set-info :status sat)
(declare-const a String)

(assert (= (str.++ a "") "num" ) )

(check-sat)
(get-model)