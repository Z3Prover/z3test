; A positive irrational infimum: sqrt(2) + epsilon.
(declare-const x Real)
(assert (> (* x x) 2.0))
(assert (> x 0.0))
(minimize x)
(check-sat)
(get-objectives)

(reset)
; A negative irrational supremum: -sqrt(2) - epsilon.
(declare-const x Real)
(assert (> (* x x) 2.0))
(assert (< x 0.0))
(maximize x)
(check-sat)
(get-objectives)

(reset)
; Scaling and shifting preserve the exact finite part of the open bound.
(declare-const x Real)
(assert (< (* x x) 2.0))
(maximize (+ (* 2.0 x) 3.0))
(check-sat)
(get-objectives)

(reset)
; A non-quadratic algebraic limit: cubert(2) - epsilon.
(declare-const x Real)
(assert (< (* x x x) 2.0))
(maximize x)
(check-sat)
(get-objectives)
