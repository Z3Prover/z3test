; copied from aeval https://github.com/grigoryfedyukovich/aeval/

(assert 
(forall ( (x1 Int) (x2 Int))
	(exists ((y Int))(
and (
not (= (+ (div x1 4) 2 ) (div y 3))
) (
= (div y 2) (+ (div x1 2) (div x2 3))
)
))))
(check-sat)
