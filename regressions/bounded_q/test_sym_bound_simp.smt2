
; Copyright (c) 2015 Microsoft Corporation


(declare-const a Int)
(declare-fun p (Int) Bool)

(assert (forall ((x Int)) 
                (=> 
                 (and
                  (>= x 0) (<= x a))
                 (p x))))

(apply (! expand_bounded_quantifiers :domain 4))