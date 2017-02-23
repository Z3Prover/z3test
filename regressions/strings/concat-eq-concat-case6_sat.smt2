(set-logic QF_S)
(set-info :status sat)

(declare-const Y String)
(declare-const U String)

(assert (= (str.++ "abc" Y) (str.++ U "bcd")))

(check-sat)
