
; Copyright (c) 2015 Microsoft Corporation

(declare-sort U 0)
(declare-sort V 0)
(declare-sort W 0)
(declare-fun p (U V W) Bool)
(declare-fun a () V)

(assert (forall ((x V)) (= x a)))


(assert (forall ((x U) (y V) (z W)) 
			(p x y z)))

(apply expand_bounded_quantifiers)