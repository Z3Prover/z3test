(set-logic QF_S)
(set-info :status sat)
(declare-const i Int)
(declare-const X String)

(assert (= i (str.indexof "a" "ab") ) )


(check-sat)
(get-model)
