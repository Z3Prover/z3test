(set-info :status sat)

(declare-const X String)
(declare-const S String)
(declare-const Pos Int)
(declare-const Len Int)

(assert (= S "abcdef"))
(assert (or (= Pos 0) (= Pos 1) (= Pos 2)))
(assert (= Len 2))
(assert (= X (str.substr S Pos Len)))

(check-sat)
