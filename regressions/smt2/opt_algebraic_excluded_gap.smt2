; maximize x s.t. x^2 < 4 and x != 1: the rightmost infeasible interval [2,oo) starts
; closed, with a gap to the excluded point 1; the supremum 2 is not attained
(declare-const x Real)
(assert (< (* x x) 4.0))
(assert (not (= x 1.0)))
(maximize x)
(check-sat)
(get-objectives)
