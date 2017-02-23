(set-logic QF_S)
(set-info :status sat)

(declare-const X String)

(assert (= (str.++ X "def") "abcdef"))

(check-sat)
