; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)
(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (and (and (
< (+ (+ (+ (+ (div x1 2) (* (- 4) x4)) (* (- 5) x3)) (div x2 2)) 2 ) (div y 4)
) (
>= (* (- 5) y) (+ (div x2 2) (* 3 x1))
)) (
>= (div y 3) (+ (+ (+ (+ (div x1 2) (* 3 x3)) (* 4 x4)) (* (- 3) x2)) 2 )
)) (and (
> (+ (+ (div x3 4) (* (- 5) x1)) (* 4 x2)) (div y 4)
) (
= (+ (+ (div x2 3) (* (- 3) x1)) 1 ) (div y 2)
))
))))
(check-sat)
