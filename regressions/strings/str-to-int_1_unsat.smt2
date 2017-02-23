(set-info :status unsat)

(declare-const S String)

(assert (or (= S "1") (= S "2") (= S "3")))
(assert (= 9 (str.to-int S)))

(check-sat)
(get-model)

