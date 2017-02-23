(set-logic QF_S)
(set-info :status sat)

(declare-const x String)
(declare-const y String)

(assert (= (str.++ x y) ""))

(check-sat)
