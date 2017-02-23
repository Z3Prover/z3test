(set-logic QF_S)
(set-info :status unsat)
(declare-const i Int)
(declare-const X String)

(assert (= i (str.indexof X "ab") ) )
(assert (= i 0 ) )
(assert (= (str.len X) 0 ) )


(check-sat)
(get-model)
