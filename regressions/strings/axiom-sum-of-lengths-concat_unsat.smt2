(set-logic QF_S)
(set-info :status unsat)

(declare-const X String)
(declare-const Y String)

(assert (= (str.len (str.++ X Y)) 6))
(assert (= (str.len X) 2))
(assert (= (str.len Y) 3))

(check-sat)
