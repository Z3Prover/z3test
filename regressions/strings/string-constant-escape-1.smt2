(set-info :status sat)

(declare-const X String)

(assert (or (= X "abc\ndef") (= X "def\nabc")))
(assert (= (str.len X) 7))

(check-sat)

