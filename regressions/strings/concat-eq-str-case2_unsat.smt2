(set-logic QF_S)
(set-info :status unsat)

(declare-const X String)

(assert (= (str.++ X "def") "abcdeffoo"))

(check-sat)
