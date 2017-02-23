(set-logic QF_S)
(set-info :status unsat)

(declare-const X String)
(declare-const Y String)

(assert (= X Y))
(assert (not (= (str.len X) (str.len Y))))

(check-sat)
