
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)

(declare-const a Int)
(declare-const b Int)
(declare-fun f (Int) Int)
(assert (= a (f b)))
(push)
(check-sat)
(get-model)
(eval (= a (f b)))