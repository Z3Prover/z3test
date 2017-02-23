(set-logic QF_S)
(set-info :status sat)

(declare-const x String)

(assert (= (str.len x) 3))

(check-sat)
