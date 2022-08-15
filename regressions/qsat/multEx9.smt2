; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (and (
< (* 5 y) (+ (+ (+ (+ (* (- 5) x1) (* (- 5) x4)) (* (- 3) x3)) (* (- 5) x2)) 3 )
) (
< (+ (+ (+ (* 3 x2) (* (- 5) x1)) (* 5 x3)) 1 ) (* 4 y)
)) (
>= (* (- 4) y) (+ (* 4 x1) 2 )
)
))))
(check-sat)
