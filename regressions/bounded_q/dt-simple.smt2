
; Copyright (c) 2015 Microsoft Corporation


(declare-datatypes () ((D (DA) (DB))))
(declare-fun p (Int D) Bool)


(assert (forall ((x Int) (d D))
                (=> 
                 (and 
                  (>= x 2) (<= x 10))
                 (p x d))))

(apply (then split_datatype_quantifiers expand_bounded_quantifiers))