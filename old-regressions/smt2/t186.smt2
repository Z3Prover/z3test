
; Copyright (c) 2015 Microsoft Corporation


(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun f (Int Real) Bool)
(declare-fun q (Int Bool) Bool)

(push)
(assert (or (= (p 10) (p 11)) (q 10 (forall ((x Int)) (f x 2.0)))))
(apply nnf)
(echo "----")
(apply snf)
(pop)

