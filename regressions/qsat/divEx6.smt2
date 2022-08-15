; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (
= (+ (+ (+ (+ (div x5 2) (div x4 2)) (div x1 4)) (div x3 4)) (div x2 3)) (div y 2)
) (
= (+ (+ (+ (+ (+ (div x5 4) (div x1 2)) (div x4 3)) (div x2 3)) (div x3 3)) 1 ) (div y 2)
)
))))
(check-sat)
