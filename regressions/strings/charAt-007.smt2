(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const i Int)


(assert (= "b" (str.at x i) ) )

(assert (and (>= i 4) (< i (str.len x))))

(assert (< (str.len x) 7))

(assert (> (str.len x) 2))


(check-sat)
(get-model)
