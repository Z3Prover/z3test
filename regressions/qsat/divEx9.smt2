; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)

(assert 
(forall ( (x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int))
	(exists ((y Int))(
and (and (
< (div x1 4) (div y 2)
) (
>= (+ (+ (+ (+ (+ (div x5 3) (div x4 4)) (div x1 2)) (div x3 2)) (div x2 4)) 4 ) (div y 2)
)) (
= (+ (+ (+ (+ (div x1 2) (div x3 3)) (div x4 3)) (div x2 3)) 4 ) (div y 4)
)
))))
(check-sat)
