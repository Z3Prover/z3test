
(declare-fun a () Int)
(declare-fun p (Int Int) Bool)

(assert (forall ((y Int) (x Int))
			(=> (and (> y 0) (< y 4) (> x 0) (<= x (ite (<= a y) a y)))
				(p x y))))

(apply expand_bounded_quantifiers)