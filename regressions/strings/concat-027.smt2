(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const m String)
(declare-const n String)

(assert (= (str.++ m n) (str.++ x y)  ) )
(assert (= (str.len x) 1 ) )
(assert (= (str.len y) 0 ) )

(check-sat)
(get-model)