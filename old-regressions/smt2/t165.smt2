
; Copyright (c) 2015 Microsoft Corporation
(set-option :smt.mbqi true)
(set-option :produce-models true)
(declare-fun s1 ((_ BitVec 16)) (_ BitVec 16))
(assert (forall ((s0 (_ BitVec 16))) (bvuge s0 (s1 s0))))
(check-sat)
(get-model)
(eval (s1 #x0000))
(eval (s1 #x0010))
