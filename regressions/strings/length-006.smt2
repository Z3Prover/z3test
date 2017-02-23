(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)

(assert (= (str.len (str.++ x y)) 1) )

(check-sat)
(get-model)

