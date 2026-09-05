; pareto front with irrational coordinates: x^2 = 2, y = -x has exactly the two
; incomparable points (sqrt2, -sqrt2) and (-sqrt2, sqrt2); the third check-sat
; exhausts the front. The problem is pure NRA, so the loop runs on the
; nlsat-backed pareto solver and the dominance constraints compare each
; objective against its exact algebraic model value; the reported intervals
; are 12-decimal-digit brackets of those values.
(set-option :opt.priority pareto)
(declare-const x Real)
(declare-const y Real)
(assert (= (* x x) 2))
(assert (= y (- x)))
(maximize x)
(maximize y)
(check-sat)
(get-objectives)
(check-sat)
(get-objectives)
(check-sat)
