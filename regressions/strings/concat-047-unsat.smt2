(set-logic QF_S)
(set-info :status unsat)
(declare-const x String)
(declare-const y String)
(declare-const z String)

(assert (= (str.++ x y) (str.++ "abc" z) ) )
(assert (= (str.len x) 2 ) )
(assert (= (str.len y) 4 ) )
(assert (= (str.len z) 1 ) )

(check-sat)
(get-model)