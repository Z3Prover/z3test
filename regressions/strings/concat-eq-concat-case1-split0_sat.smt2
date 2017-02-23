(set-logic QF_S)
(set-info :status sat)

(declare-const X String)
(declare-const Y String)
(declare-const U String)
(declare-const V String)

(assert (= (str.len X) 2))
(assert (= (str.len U) 3))

(assert (= (str.++ X Y) (str.++ U V)))

(check-sat)
