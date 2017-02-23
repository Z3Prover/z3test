(set-logic QF_S)
(set-info :status sat)

(declare-const X String)
(declare-const Y String)
(declare-const V String)

(assert (= (str.++ X Y) (str.++ "abc" V)))

(check-sat)
