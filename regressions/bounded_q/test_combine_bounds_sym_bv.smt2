
(define-sort W () (_ BitVec 8))
(declare-fun p (W) Bool)
(declare-fun a () W)

(assert (forall ((x W)) (=> (and (bvugt x #x00) (bvult x a) (bvult x #x05)) (p x))))

(apply (! expand_bounded_quantifiers :max-instances 10))

