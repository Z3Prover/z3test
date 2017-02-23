(set-logic QF_S)
(set-info :status sat)

(declare-const Y String)
(declare-const V String)

(assert (= (str.++ "abc" Y) (str.++ "abcd" V)))

(check-sat)
