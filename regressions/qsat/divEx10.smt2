; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)

(assert 
(forall ( (x1 Int) (x2 Int))
	(exists ((y Int))(
and (
not (= (+ (div x1 2) 3 ) (div y 4))
) (
= (div y 2) (+ (div x1 4) 4 )
)
))))
(check-sat)
