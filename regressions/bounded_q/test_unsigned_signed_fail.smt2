
(set-option :pp.max-depth 1000)
(define-sort W () (_ BitVec 8))
(declare-fun p (W) Bool)
(declare-fun b () W)

(assert (forall ((x W)) 
	(=> (and (bvugt x #x01) (bvslt x #x05)) (p x))))


(apply expand_bounded_quantifiers)

