; The supremum sqrt(2) is not attained. Prove both the strict upper bound
; and that feasible values approach it, then report sqrt(2) - epsilon.
(declare-const x Real)
(assert (< (* x x) 2.0))
(maximize x)
(check-sat)
(get-objectives)
