

(define-sort W () (_ BitVec 8))
(declare-fun pw (W W) Bool)
(declare-fun p (Int Int) Bool)

 (assert (forall ((x W) (y W))
			(=> 
				(and 
					(bvule x y)
					(bvuge y #x00) (bvule y #x05))
				(pw x y))))

(apply (then nnf expand_bounded_quantifiers))