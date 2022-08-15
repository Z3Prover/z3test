; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)
(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (and (and (
>= (+ (+ (+ (+ (div x5 4) (div x4 3)) (* 5 x1)) (* 3 x3)) (div x2 3)) (* (- 3) y)
) (
> (+ (+ (+ (+ (div x5 4) (div x1 3)) (div x4 3)) (div x2 3)) (* 3 x3)) (div y 4)
)) (
< (+ (div x1 4) (div x2 4)) (* (- 3) y)
)) (and (
not (= (+ (+ (+ (* (- 5) x2) (* (- 3) x1)) (div x3 3)) 4 ) (* (- 5) y))
) (
>= (+ (+ (+ (+ (* 5 x3) (* (- 5) x5)) (div x1 3)) (* (- 4) x2)) (div x4 2)) (* 4 y)
))
))))
(check-sat)
