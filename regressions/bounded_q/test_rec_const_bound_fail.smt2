
(declare-fun a () Int)
(declare-fun p (Int) Bool)

(assert (forall ((x Int))
			(=> (and (> x 0) (<= x (ite (> a 15) 5 a)))
				(p x))))

(apply expand_bounded_quantifiers)