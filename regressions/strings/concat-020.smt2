(set-logic QF_S)
(set-info :status sat)
(declare-const a String)
(declare-const b String)

(assert (= (str.++ a b) "" ) )

(check-sat)
(get-model)