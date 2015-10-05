
; Copyright (c) 2015 Microsoft Corporation

(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun f (Int Real) Bool)
(declare-fun q (Int Bool) Bool)
(declare-fun sk_hack (Bool) Bool)

(push)
(assert (= (p 0) (exists ((x Int)) (! (f x 2.0) :pattern (sk_hack (p x)) :pattern (sk_hack (q x true)) :pattern (f x 2.0)))))
(apply (! nnf :nnf-sk-hack true))
(pop)

