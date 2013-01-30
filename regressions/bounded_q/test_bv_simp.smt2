(define-sort W () (_ BitVec 8))
(declare-fun qw (W W) Bool)

(assert (forall ((x W) (y W)) 
                (=> (and 
                     (bvuge x #x00) (bvule x (bvsub y #x01))
                     (bvuge y #x01) (bvule y #x04))
                    (qw x y))
		))

(apply expand_bounded_quantifiers)