(set-logic QF_S)
(set-info :status unsat)

(assert (= "abc" "def"))
(check-sat)
