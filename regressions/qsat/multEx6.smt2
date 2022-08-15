; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (and (and (
>= (+ (+ (* 4 x1) (* (- 4) x2)) (* (- 4) x3)) (* (- 3) y)
) (
> (* (- 3) x1) (* (- 3) y)
)) (
> (+ (* (- 4) x1) (* (- 3) x2)) (* 5 y)
)) (and (
< (+ (* (- 4) x1) 4 ) (* 3 y)
) (
< (+ (+ (+ (+ (* 5 x2) (* (- 3) x1)) (* 3 x4)) (* (- 4) x3)) 2 ) (* 3 y)
))
))))
(check-sat)
