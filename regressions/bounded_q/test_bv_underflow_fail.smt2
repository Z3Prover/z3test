(define-sort W () (_ BitVec 8))
(declare-fun qw (W W) Bool)


; fails since (bvsub y #x01) can be very large (underflow)
(assert (forall ((x W) (y W)) 
			(implies
				(and 
					(bvuge x #x00) (bvule x (bvsub y #x01))
					(bvuge y #x00) (bvule y #x04))
				(qw x y))
		))


(apply (then nnf expand_bounded_quantifiers))