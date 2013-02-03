
(define-sort W () (_ BitVec 8))
(declare-fun p (W W) Bool)


(assert (forall ((x W) (y W))
                (=> 
                 (and 
                  (bvule x #x55)
                  (bvuge y #x53) (bvule y x))
                 (p x y))))

(apply (then minimize_bounded_quantifiers expand_bounded_quantifiers))