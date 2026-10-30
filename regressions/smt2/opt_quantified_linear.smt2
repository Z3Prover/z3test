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

; z = 0 is a witness for every x, so the maximum is 10. mod by a negative
; numeral must not turn the constraint into false.
(push)
(declare-const x Int)
(assert (<= 0 x 10))
(assert (exists ((z Int)) (and (<= 0 z) (<= z x) (= (mod z -3) 0))))
(maximize x)
(check-sat)
(get-objectives)
(pop)

; Every window [y, y + x] contains a multiple of 3 exactly when x >= 2.
(push)
(declare-const x Int)
(assert (<= 0 x 10))
(assert (forall ((y Int)) (exists ((z Int)) (and (<= y z) (<= z (+ y x)) (= (mod z -3) 0)))))
(minimize x)
(check-sat)
(get-objectives)
(pop)

; The right side is at least 10 and mod is at most 2, so the constraint
; holds for every a in [0, 5].
(push)
(declare-const a Int)
(assert (<= 0 a 5))
(assert (exists ((y0 Int)) (and (<= -3 y0 (+ a 3))
  (forall ((y1 Int)) (=> (<= -3 y1 (+ a 3)) (distinct (mod (+ y0 -1) 3) (+ y1 (* 2 a) 13)))))))
(maximize a)
(check-sat)
(get-objectives)
(pop)

; The coefficient (- 1) is a numeral: forall y >= 0. x - y <= 7 holds
; exactly when x <= 7.
(push)
(declare-const x Real)
(assert (forall ((y Real)) (=> (>= y 0.0) (<= (+ x (* (- 1.0) y)) 7.0))))
(maximize x)
(check-sat)
(get-objectives)
(pop)
