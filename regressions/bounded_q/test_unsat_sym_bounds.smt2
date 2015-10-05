
; Copyright (c) 2015 Microsoft Corporation


(declare-fun p (Int Int) Bool)
(declare-fun a () Int)

(assert (forall ((x Int) (y Int))
			(=> 
                         (and 
                          (>= x 2) (<= x (- a))
                          (>= y 0) (<= y a))
                         (p x y))))

(apply (then minimize_bounded_quantifiers expand_bounded_quantifiers))
(apply (then expand_bounded_quantifiers simplify))