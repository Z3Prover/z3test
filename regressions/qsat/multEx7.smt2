; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (and (
<= (* 5 y) (+ (+ (* (- 4) x1) (* 4 x2)) 4 )
) (
< (+ (+ (+ (* (- 5) x3) (* 5 x2)) (* (- 3) x1)) 3 ) (* (- 3) y)
)) (
>= (* 3 y) (+ (* (- 4) x2) (* (- 5) x1))
)
))))
(check-sat)
