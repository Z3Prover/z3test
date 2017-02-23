(set-logic QF_S)
(set-info :status unsat)

(declare-const x String)
(declare-const y String)

(assert (= (str.++ x y) ""))
(assert (not (= x "")))

(check-sat)
