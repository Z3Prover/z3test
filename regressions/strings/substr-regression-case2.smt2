(set-info :status sat)

(declare-const X String)
(declare-const S String)
(declare-const Pos Int)
(declare-const Len Int)

(assert (= S "abcdef"))
(assert (= Pos 3))
(assert (> Len 6))
(assert (= X (str.substr S Pos Len)))

(check-sat)
