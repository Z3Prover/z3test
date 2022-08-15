; copied from aeval https://github.com/grigoryfedyukovich/aeval/

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (
not (= (div y 4) (div x1 2))
) (
<= (+ (+ (+ (div x1 3) (div x4 3)) (div x3 4)) (div x2 4)) (div y 2)
)
))))
(check-sat)
