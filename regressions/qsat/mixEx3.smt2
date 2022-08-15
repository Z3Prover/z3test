; copied from aeval https://github.com/grigoryfedyukovich/aeval/

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (
<= (+ (* (- 4) x1) (div x2 2)) (* (- 5) y)
) (
> (+ (+ (+ (* 5 x3) (div x2 4)) (div x1 4)) 1 ) (div y 4)
)
))))
(check-sat)
