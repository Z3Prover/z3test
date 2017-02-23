(set-logic QF_S)
(set-info :status unsat)

(declare-const X String)
(declare-const Y String)

(assert (= (str.++ X Y) "abcdef"))

(assert (or (= X "ab") (= X "abc")))
(assert (or (= Y "bcdef") (= Y "ef")))

(check-sat)