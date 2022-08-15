; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (and (
<= (* (- 4) y) (+ (+ (+ (* 4 x1) (* (- 5) x2)) (* (- 3) x3)) 4 )
) (
not (= (+ (+ (+ (* (- 3) x3) (* 3 x1)) (* (- 5) x2)) (* 4 x4)) (* 5 y))
)) (and (
= (+ (* (- 4) x2) (* 3 x1)) (* 3 y)
) (
< (+ (+ (+ (* (- 3) x2) (* (- 5) x3)) (* 4 x1)) (* (- 3) x4)) (* 4 y)
))
))))
(check-sat)
