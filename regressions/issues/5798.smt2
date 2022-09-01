(declare-fun r () (Array Bool Bool))
(declare-fun r6 () Int)
(assert (and (select r true) (not (select r (= (abs r6) (abs (abs r6)))))))
(check-sat)