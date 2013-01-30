

(define-sort W () (_ BitVec 4))
(define-sort W1 () (_ BitVec 2))
(define-sort W2 () (_ BitVec 1))
(declare-fun p (W1 W Int W2) Bool)


(assert (forall ((x W1) (y W) (z Int) (u W2))
			(=> 
                         (and 
                          (>= z 16) (<= z 17)
                          (bvule y #x5))
                         (p x y z u))))

(apply expand_bounded_quantifiers)