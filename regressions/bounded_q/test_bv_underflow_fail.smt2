
; Copyright (c) 2015 Microsoft Corporation
(define-sort W () (_ BitVec 8))
(declare-fun qw (W W) Bool)


; fails since (bvsub y #x01) can be very large (underflow)
(assert (forall ((x W) (y W)) 
                (=> (and 
                     (bvuge x #x00) (bvule x (bvsub y #x01))
                     (bvuge y #x00) (bvule y #x04))
                    (qw x y))
		))

(apply expand_bounded_quantifiers)
(apply (! expand_bounded_quantifiers :max-instances 10000))