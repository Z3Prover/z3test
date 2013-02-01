(define-sort W () (_ BitVec 8))
(declare-fun p (W) Bool)


(assert (forall ((x W)) 
			(=> (and (bvsgt x #xf5) (bvsle x #x05)) 
				(p x))))


(apply (then simplify nnf expand_bounded_quantifiers))

