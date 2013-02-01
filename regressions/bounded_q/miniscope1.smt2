

(declare-fun p (Int Real) Bool)
(declare-fun q (Int) Bool)
(declare-fun r (Int Bool) Bool)

(assert (forall ((x Int) (y Real)) (=> (q x) (exists ((z Bool)) (and (p x y) (r x z))))))

(apply miniscope)
