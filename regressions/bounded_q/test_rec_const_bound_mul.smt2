
(declare-fun a () Int)
(declare-fun p (Int) Bool)

(assert (forall ((x Int))
			(=> (and (> x 0) (<= x (* 2 (ite (> a 11) 11 a))))
				(p x))))

(apply expand_bounded_quantifiers)