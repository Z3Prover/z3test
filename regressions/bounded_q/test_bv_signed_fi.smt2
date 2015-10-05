
; Copyright (c) 2015 Microsoft Corporation
(define-sort W () (_ BitVec 8))
(declare-fun p (W) Bool)


(assert (forall ((x W)) 
			(=> (and (bvsgt x #x95) (bvsle x #x05)) 
				(or (= ((_ extract 6 6) x) #b1)  (p x))

				)))


(apply (then simplify nnf (! expand_bounded_quantifiers :filter-instances true)))

