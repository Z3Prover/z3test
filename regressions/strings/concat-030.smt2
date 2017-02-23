(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const y String)
(declare-const m String)
(declare-const n String)

(assert (= (str.++ x y) (str.++ m n) ) )
(assert (= (str.len m) 1 ) )
(assert (= (str.len n) 0 ) )

(check-sat)
(get-model)