
; Copyright (c) 2015 Microsoft Corporation
(set-option :auto-config true)
(set-option :produce-models true)
(declare-fun x () Int)
(declare-fun y () Int)
(assert (> x y))
(check-sat)
(get-model)
(exit)