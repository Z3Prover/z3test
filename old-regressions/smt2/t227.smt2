
; Copyright (c) 2015 Microsoft Corporation


(declare-fun p (Int) Bool)
(declare-fun q (Int Int) Bool)

(push)
(assert (not (forall ((x Int)) (=> (p x) (exists ((y Int)) (q x y))))))
(apply nnf)
(apply (! nnf :skolemize false))
(pop)


(push)
(assert (iff (forall ((x Int)) (! (p x) :pattern (p x)))
             (exists ((x Int) (y Int)) (q x y))))
(apply nnf)
(apply (! nnf :skolemize false))
(pop)



