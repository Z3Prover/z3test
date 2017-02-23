(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const m String)
(declare-const n String)

(declare-const i Int)

(assert (= (str.++ m n) (str.++ x y) ) )
(assert (= (str.len x) i ) )
(assert (= (str.len y) 1 ) )

(check-sat)
(get-model)