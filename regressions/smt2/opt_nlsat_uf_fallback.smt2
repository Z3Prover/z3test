; an uninterpreted function puts the problem outside the nlsat fragment:
; the nlsat-cell engine declines and the objective falls back to bisection
(declare-const x Real)
(declare-fun f (Real) Real)
(assert (<= (* x x) 2.0))
(assert (<= (f x) 5.0))
(maximize x)
(check-sat)
(get-objectives)
