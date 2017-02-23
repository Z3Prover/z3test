(set-logic QF_S)
(set-info :status sat)
(declare-const str String)
(declare-const x String)
(declare-const var2 Int)
(declare-const var3 Int)

(assert (= "*" (str.at str var2) ) )
(assert (= var2 3))


(check-sat)
(get-model)
