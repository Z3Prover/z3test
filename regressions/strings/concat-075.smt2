(set-logic QF_S)
(set-info :status sat)
(declare-const x1 String)
(declare-const x2 String)
(declare-const x3 String)
(declare-const y2 String)
(declare-const m2 String)

(assert (= (str.++ "ef" y2) (str.++ x1 x2)) )
(assert(= (str.++ x3 (str.++ "ce" m2)) (str.++ "ef" y2)) )


(check-sat)
(get-model)