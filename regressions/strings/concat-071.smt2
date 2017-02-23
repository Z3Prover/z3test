(set-logic QF_S)
(set-info :status sat)
(declare-const x1 String)
(declare-const x2 String)
(declare-const y1 String)
(declare-const y2 String)

(assert (= (str.++ x1 (str.++ "abc" x2 ) ) (str.++ y1 (str.++ "ef" y2) ) ) )
;(assert (= (str.len X) 0 ) )

(check-sat)
(get-model)