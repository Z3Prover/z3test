

(declare-fun p (Int Int) Bool)


(assert (forall ((x Int) (y Int))
			(=> 
				(and 
					(>= x 0) (<= x 600)
					(>= y 595) (<= y x))
				(p x y))))

(apply (then minimize_bounded_quantifiers expand_bounded_quantifiers))