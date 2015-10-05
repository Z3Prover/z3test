
; Copyright (c) 2015 Microsoft Corporation


(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-fun f (Int Int) Int)
(declare-fun p (Bool) Bool)
(declare-fun q (Int) Bool)

(assert (= x 10))
(assert (= y (+ x 20)))
(assert (= z y))
(assert (>= (f 0 0) 0))
(assert (= (f x z) 0))
(assert (or (p (>= (f 0 0) 0)) (= (f 1 1) 0)))
(assert (q 0))
(assert (not (q 1)))
(assert (or (p (q 0)) (p (q 1))))

(apply propagate-values)

