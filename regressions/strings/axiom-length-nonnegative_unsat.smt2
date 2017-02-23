(set-logic QF_S)
(set-info :status unsat)

(declare-const X String)

(assert (= (str.len X) -1))

(check-sat)
