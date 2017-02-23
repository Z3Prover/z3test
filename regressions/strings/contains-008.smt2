(set-logic QF_S)
(set-info :status sat)
(declare-const x String)
(declare-const bv Bool)

(assert (= bv (str.contains "abcdefg" x ) ) )
(assert bv )


(check-sat)
(get-model)
