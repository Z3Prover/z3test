(set-logic QF_S)
(set-info :status sat)

(declare-const x String)
(declare-const y String)

(assert (= x "abc"))
(assert (= x y))
(assert (= "abc" y))

(check-sat)