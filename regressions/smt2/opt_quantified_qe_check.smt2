; Optimization under quantified linear integer constraints on which the qe
; tactic returns a non-equivalent formula. Such an elimination must be
; rejected, so the constraint is kept and the optimum stays correct.

; a = b = -4 satisfies the constraint (q = -1, r2 = 5, q3 = -3, r = 0), so
; the minimum of a + b is -8. The qe tactic alone drops a = -4.
(push)
(declare-const a Int)
(declare-const b Int)
(assert (<= -4 a 4))
(assert (<= -4 b 4))
(assert (exists ((y Int) (q Int) (r2 Int) (q3 Int) (r Int))
  (and (<= 0 y 1)
       (= (+ a 3) (+ (* 6 q) r2)) (<= 0 r2) (< r2 6)
       (= (+ q (* 2 a)) (+ (* 3 q3) r)) (<= 0 r) (< r 3)
       (<= (+ r (* 3 b)) 5))))
(minimize (+ a b))
(check-sat)
(get-objectives)
(get-value (a b))
(pop)

; The same constraint written with div and mod; the minimum is again -8.
(push)
(declare-const a Int)
(declare-const b Int)
(assert (<= -4 a 4))
(assert (<= -4 b 4))
(assert (exists ((y Int)) (and (<= 0 y 1) (<= (+ (mod (+ (div (+ a 3) 6) (* 2 a)) 3) (* 3 b)) 5))))
(minimize (+ a b))
(check-sat)
(get-objectives)
(get-value (a b))
(pop)
