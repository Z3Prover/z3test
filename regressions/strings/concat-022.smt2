(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ x y) z ) )
(assert (or (= z "abcdef") (= z "aaaa") (= z "bbbb") ) )
(assert (or (= x "e") (= x "f") (= x "abcde") ) )

(check-sat)
(get-model)