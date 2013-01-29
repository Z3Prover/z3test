(declare-fun p (Int Int) Bool)


(assert (forall ((x Int))
			(=> (>= x 0) (<= x 5)
				(forall ((y Int)) 
					(=> (>= y 0) (<= y 5)
						(p x y))))))


(apply (then simplify nnf expand_bounded_quantifiers))



