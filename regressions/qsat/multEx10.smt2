; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status sat)

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (
< (+ (+ (* (- 4) x1) (* (- 4) x2)) (* (- 4) x3)) (* (- 5) y)
) (
not (= (* 4 y) (+ (* 3 x1) (* 4 x2)))
)
))))
(check-sat)
