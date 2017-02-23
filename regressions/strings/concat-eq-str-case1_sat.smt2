(set-logic QF_S)
(set-info :status sat)

(assert (= (str.++ "abc" "xyz") "abcxyz"))

(check-sat)
