
(set-info :status sat)
(assert (forall ( (x1 Int) (x2 Int)) (exists ((y Int)) (or (<= (mod y 3) x2) (> (mod y 2) x2)))))
(check-sat)
