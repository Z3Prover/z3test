(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ z "b") (str.++ x y) ) )
(assert (= z "") )

(check-sat)
(get-model)