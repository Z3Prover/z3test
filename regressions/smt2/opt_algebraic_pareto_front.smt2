; pareto front with irrational coordinates: x^2 = 2, y = -x has exactly the two
; incomparable points (sqrt2, -sqrt2) and (-sqrt2, sqrt2); the third check-sat
; exhausts the front. The dominance constraints compare against decimal-rounded
; bounds of the isolating interval of the algebraic model value.
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
