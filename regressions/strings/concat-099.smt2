(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const n String)

(assert (= (str.++ "abc" n ) (str.++ x y ) ) ) 
(assert (= (str.len x) 5 ) )

(check-sat)
(get-model)