(set-logic QF_S)
(set-info :status unsat)

(declare-const X String)

(assert (= (str.++ "abc" X) "zyxabcdef"))

(check-sat)