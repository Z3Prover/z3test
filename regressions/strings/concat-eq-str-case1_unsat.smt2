(set-logic QF_S)
(set-info :status unsat)

(assert (= (str.++ "abc" "xyz") "abcfoo"))

(check-sat)
