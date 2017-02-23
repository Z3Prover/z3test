(set-logic QF_S)
(set-info :status sat)
(declare-const a String)
(declare-const b String)
(declare-const z String)

(assert (= (str.++ "test" (str.++ a "num") ) "testhellonum"))

(check-sat)
(get-model)