; disjunction of two nonlinear regions: the optimum 5^(1/3) lies in the branch b = false
(declare-const x Real)
(declare-const b Bool)
(assert (or (and b (<= (* x x) 2.0)) (and (not b) (<= (* x x x) 5.0) (>= x 0.0))))
(maximize x)
(check-sat)
(get-objectives)
(get-value (x b))
