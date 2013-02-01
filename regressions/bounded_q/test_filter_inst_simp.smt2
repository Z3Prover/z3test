
(declare-fun f (Int Int) Int)


(assert (forall ((x Int) (y Int))
			(or
				(not (>= x 0)) 
				(not (<= x 3))
				(not (>= y 0))
				(not (<= y (ite (= x 2) 50000 2)))
				(= (f x y) (f 2 y))
				)))

(apply (! expand_bounded_quantifiers :filter_instances true))