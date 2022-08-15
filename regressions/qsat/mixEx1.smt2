; copied from aeval https://github.com/grigoryfedyukovich/aeval/

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (and (
> (+ (+ (+ (div x1 3) (div x4 4)) (* 4 x3)) (* (- 4) x2)) (* 5 y)
) (
not (= (+ (* 3 x2) (* 5 x1)) (div y 2))
)) (and (
<= (div y 4) (+ (div x1 4) 3 )
) (
<= (+ (+ (div x1 3) (div x3 4)) (div x2 2)) (* (- 3) y)
))
))))
(check-sat)
