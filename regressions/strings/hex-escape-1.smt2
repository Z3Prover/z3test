(set-info :status sat)

(declare-const X String)

(assert (= X "a"))

(assert (or (= X "\x61") (= X "\x41")))
(check-sat)

