(define-sort W () (_ BitVec 5))
(declare-fun p (W) Bool)


(assert (forall ((x W)) (p x)))

(apply (then expand_bounded_quantifiers))