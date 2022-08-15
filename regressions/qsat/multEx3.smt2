; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status sat)

(assert 
(forall ( (x1 Int) (x2 Int))
	(exists ((y Int))(
and (
not (= (+ (+ (* 4 x1) (* 3 x2)) 4 ) (* (- 5) y))
) (
= (* 5 y) (* 5 x1)
)
))))
(check-sat)
