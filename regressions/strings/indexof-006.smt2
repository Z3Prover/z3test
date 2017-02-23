(set-logic QF_S)
(set-info :status sat)
(declare-const i Int)

(assert (= i (str.indexof "abcdefg" "hh") ) )

(check-sat)
(get-model)
