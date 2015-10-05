
; Copyright (c) 2015 Microsoft Corporation


(declare-fun f (Int) Int)
(declare-fun p (Int Int) Bool)

(assert (forall ((x Int))
                (! (> (f x) x)
                   :pattern ((f x))
                   )))

(assert (forall ((x Int) (y Int) (z Int))
                (! (=> (and (p x y) (p y z))
                       (p x z))
                   :pattern ((p x y) (p y z))
                   :pattern ((p x y) (p x z)))))

(apply simplify)

(apply elim_patterns)