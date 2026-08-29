; maximize x s.t. x^3 - 3x + 1 <= 0: optimum is the largest root of the cubic, 1.5320888...
(declare-const x Real)
(assert (<= (+ (* x x x) (* (- 3.0) x) 1.0) 0.0))
(maximize x)
(check-sat)
(get-objectives)
