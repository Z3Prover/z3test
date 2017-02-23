(set-logic QF_S)
(set-info :status unsat)

(declare-const x String)
(declare-const y String)

(assert (= x "abc"))
(assert (= x y))
(assert (= "def" y))

(check-sat)
