; minimize x s.t. x^2 >= 4, i.e. x <= -2 or x >= 2: unbounded below. Exercises
; the same unboundedness proof through objective negation and reports -oo.
(declare-const x Real)
(assert (>= (* x x) 4.0))
(minimize x)
(check-sat)
(get-objectives)
