; Every point (x, y) with x + y = 1000 and x, y >= 0 is Pareto-optimal for
; maximizing 10x and y. The front lies far from the first models, so each
; check-sat must still reach a point of the segment, distinct from the points
; returned before, instead of climbing toward it by small steps.
(set-option :opt.priority pareto)
(declare-const x Real)
(declare-const y Real)
(assert (and (<= 0.0 x) (<= 0.0 y) (<= (+ x y) 1000.0)))
(maximize (* 10.0 x))
(maximize y)
(check-sat)
(get-objectives)
(check-sat)
(get-objectives)
(check-sat)
(get-objectives)
