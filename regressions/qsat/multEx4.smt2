; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status sat)

(assert 
(forall ( (x1 Int) (x2 Int))
	(exists ((y Int))(
and (
>= (* 3 y) (+ (+ (* (- 4) x1) (* 5 x2)) 1 )
) (
> (+ (+ (* 5 x1) (* (- 5) x2)) 4 ) (* (- 3) y)
)
))))
(check-sat)
