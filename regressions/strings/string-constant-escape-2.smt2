(set-info :status sat)

(declare-const X String)

(assert (or (= X "abc""def") (= X "def""abc")))
(assert (= (str.len X) 7))

(check-sat)

