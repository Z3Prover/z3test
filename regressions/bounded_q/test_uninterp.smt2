
(declare-sort U 0)
(declare-fun p (U U Int) Bool)



(assert (forall ((x U) (y U) (z Int)) 
			(=> (and (>= z 0) (< z 5))
			(p x y z))))

(apply expand_bounded_quantifiers)