
; Copyright (c) 2015 Microsoft Corporation


(declare-datatypes () (
	(Enum A B C D E F)
))
(declare-fun p (Enum Int) Bool)

(assert (forall ((x Int) (e Enum)) 
			(=>
                         (and (>= x 0) (<= x 2))
                         (p e x))))

(apply (then split_datatype_quantifiers expand_bounded_quantifiers))