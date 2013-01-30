(define-sort W () (_ BitVec 8))
(declare-fun qw (W W) Bool)


; fails since (bvadd y #x01) can be very small (overflow)
(assert (forall ((x W) (y W)) 
			(implies
				(and 
                                 (bvuge x (bvadd y #x01)) (bvule x #xfd)
                                 (bvuge y #xfa))
				(qw x y))
                        ))

(apply expand_bounded_quantifiers)
(apply (! expand_bounded_quantifiers :max-instances 10000))