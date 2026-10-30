; Optimization under hard constraints that quantify over linear arithmetic.
; The quantifiers are eliminated before optimization, so the optima are exact.

; forall y >= 0. x <= y + 1 holds exactly when x <= 1.
(push)
(declare-const x Real)
(assert (forall ((y Real)) (=> (>= y 0.0) (<= x (+ y 1.0)))))
(maximize x)
(check-sat)
(get-objectives)
(get-value (x))
(pop)

; exists y. x <= 2 y and y <= 3 holds exactly when x <= 6.
(push)
(declare-const x Real)
(assert (exists ((y Real)) (and (<= x (* 2.0 y)) (<= y 3.0))))
(maximize x)
(check-sat)
(get-objectives)
(pop)

; Every window [y + n, y + k] of integers contains a multiple of 4 exactly
; when k - n >= 3.
(push)
(declare-const n Int)
(declare-const k Int)
(assert (<= 0 n 10))
(assert (<= 0 k 10))
(assert (forall ((y Int)) (exists ((z Int)) (and (<= (+ y n) z) (<= z (+ y k)) (= (mod z 4) 0)))))
(minimize (- k n))
(check-sat)
(get-objectives)
(pop)
