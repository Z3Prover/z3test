(set-logic QF_S)
(set-info :status sat)
(declare-const a String)
(declare-const b String)

(assert (or (= (str.++ a b) "te" )  (= (str.++ b a) "te" ) ) )
(assert (= b "t" ) )

(check-sat)
(get-model)