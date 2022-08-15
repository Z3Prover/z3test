; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status sat)
(assert 
(forall ( (x1 Int) (x2 Int))
	(exists ((y Int))(
and (
not (= (* (- 3) x1) (* 3 y))
) (
< (+ (* (- 3) x1) (* 5 x2)) (* 3 y)
)
))))
(check-sat)
