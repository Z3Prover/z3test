
; Copyright (c) 2015 Microsoft Corporation
(define-sort W () (_ BitVec 8))
(declare-fun p (W) Bool)

(push)
(assert (forall ((x W)) 
                (=> (and (bvsgt x (bvneg #x05)) (bvsle x #x05)) 
                    (p x))))


(apply expand_bounded_quantifiers)

(pop)

(assert (forall ((x W)) 
                (=> (and (bvsge x (bvneg #x05)) (bvsle x #x05)) 
                    (p x))))

(apply expand_bounded_quantifiers)
