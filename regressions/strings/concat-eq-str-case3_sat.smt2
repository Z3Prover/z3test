(set-logic QF_S)
(set-info :status sat)

(declare-const X String)

(assert (= (str.++ "abc" X) "abcdef"))

(check-sat)