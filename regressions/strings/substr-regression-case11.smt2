(set-info :status sat)

(declare-const X String)
(declare-const S String)
(declare-const Pos Int)
(declare-const Len Int)

(assert (= S "abcdef"))
(assert (< Len 0))
(assert (= X (str.substr S Pos Len)))

(check-sat)
