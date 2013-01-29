

(declare-const a Int)
(declare-fun p (Int Int) Bool)

(assert (forall ((x Int) (y Int)) 
			(=> 
				(and
					(>= x 0) (<= x a)
					(>= y 0) (<= y 10))
				(p x y))))

(apply (then nnf normalize_bounded_quantifiers (! expand_bounded_quantifiers :domain 2 :max-instances 15)))