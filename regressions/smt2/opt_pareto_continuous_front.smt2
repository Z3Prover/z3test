; Every point (x, y) with x + y = 1 and x, y >= 0 is Pareto-optimal for
; maximizing x and y, so the front is a continuous segment. A climb that only
; asks for a dominating model can take ever smaller steps toward the segment
; without reaching it. Each check-sat must return a point of the segment that
; differs from the points returned before.
(set-option :opt.priority pareto)
(declare-const x Real)
(declare-const y Real)
(assert (and (<= 0.0 x) (<= 0.0 y) (<= (+ x y) 1.0)))
(maximize x)
(maximize y)
(check-sat)
(get-objectives)
(check-sat)
(get-objectives)
(check-sat)
(get-objectives)
