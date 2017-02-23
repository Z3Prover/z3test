(set-logic QF_S)
(set-info :status sat)
(declare-const get_fileName String)
(declare-const name0 String)
(declare-const i Int)


(assert (= i (str.indexof get_fileName  ".php") ) )
(assert (> i 0 ) )
(assert (= (+ i 4) (str.len get_fileName) ) )
; (assert (= name0 "efg" ) )


(check-sat)
(get-model)
