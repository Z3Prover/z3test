
(define-sort W () (_ BitVec 8))
(declare-fun p (W) Bool)


(assert (forall ((x W)) (=> (and (bvugt x #x00) (bvult x #xfc) (bvult x #x05)) (p x))))


(apply (then simplify nnf (! expand_bounded_quantifiers :max-instances 10)))

