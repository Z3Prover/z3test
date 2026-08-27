; maximize x s.t. x^2 < 2: the supremum sqrt(2) is not attained; nlsat proves it
; as an upper bound (prove_supremum) and the result is a tight interval below sqrt(2)
(declare-const x Real)
(assert (< (* x x) 2.0))
(maximize x)
(check-sat)
(get-objectives)
