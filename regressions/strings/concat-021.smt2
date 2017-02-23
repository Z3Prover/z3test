(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ x y) z ) )
(assert (= z "abcdef" ) )
(assert (or (= x "abc") (= x "abcd") (= x "abcdef") ) )

(check-sat)
(get-model)