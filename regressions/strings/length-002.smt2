(set-logic QF_S)
(set-info :status sat)
(declare-const x String)

(assert (or (= x "f") (= x "abcd") ) )
(assert (> (str.len x) 3) )
(assert (< (str.len x) 5) )

(check-sat)
(get-model)
