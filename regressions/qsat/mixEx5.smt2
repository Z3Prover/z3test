; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (and (
< (div y 2) (+ (+ (* 3 x1) (* (- 5) x2)) 2 )
) (
> (div y 2) (+ (+ (+ (div x3 3) (* (- 3) x4)) (div x2 2)) (* 5 x1))
)) (
not (= (div y 4) (+ (* (- 4) x1) 1 ))
)
))))
(check-sat)
