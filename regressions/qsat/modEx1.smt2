
; copied from aeval https://github.com/grigoryfedyukovich/aeval/
(set-info :status unsat)
(assert 
(forall ( (x1 Int) (x2 Int))
	(exists ((y Int))
(and (<= (mod y 3) x2) (> (mod y 2) x1)))))
(check-sat)
