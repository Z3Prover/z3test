

(declare-const a Int)
(declare-fun p (Int) Bool)

(assert (forall ((x Int)) 
			(=> 
				(and
					(>= x 0) (<= x a))
				(p x))))

(apply (then nnf normalize_bounded_quantifiers (! expand_bounded_quantifiers :domain 4)))