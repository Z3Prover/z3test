; The disconnected feasible set is (-2, 1/2] union [3/2, 2).
; Its supremum is 2 and its infimum is -2; neither is attained.
(declare-const x Real)
(assert (< (* x x) 4.0))
(assert (>= (* (- x 1.0) (- x 1.0)) 0.25))
(maximize x)
(check-sat)
(get-objectives)

(reset)
(declare-const x Real)
(assert (< (* x x) 4.0))
(assert (>= (* (- x 1.0) (- x 1.0)) 0.25))
(minimize x)
(check-sat)
(get-objectives)

(reset)
; x+y>1 implies x^2+y^2>1/2, and x=y can approach 1/2 from above.
; Give this multivariable certificate more work than the default budget.
(set-option :opt.optsmt_bisect_rounds 8)
(set-option :opt.optsmt_nlsat_supremum_rlimit 1000000)
(declare-const x Real)
(declare-const y Real)
(assert (> (+ x y) 1.0))
(minimize (+ (* x x) (* y y)))
(check-sat)
(get-objectives)
