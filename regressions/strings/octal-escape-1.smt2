(set-info :status sat)

(declare-const X String)

(assert (= X "a"))

(assert (or (= X "\141") (= X "\101")))
(check-sat)
