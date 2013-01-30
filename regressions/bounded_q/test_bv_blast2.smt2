(define-sort W () (_ BitVec 16))
(declare-fun p (W) Bool)

(assert (forall ((x W)) (p x)))

(apply (! expand_bounded_quantifiers :max-instances 100000))