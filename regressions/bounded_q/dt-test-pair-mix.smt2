
; Copyright (c) 2015 Microsoft Corporation
(declare-sort U 0)

(declare-datatypes () ((D 
                        (E) 
                        (F (f1 U) (f2 Int)) 
                        (G (first Int) (second Int)))))
(declare-fun p (D) Bool)

(assert (forall ((x D)) 
                (=>
                 (and (is-G x)
                      (>= (first x) 4) (<= (first x) 12)
                      (>= (second x) 1) (<= (second x) 2))
                 (p x))))

(apply (then split_datatype_quantifiers expand_bounded_quantifiers))