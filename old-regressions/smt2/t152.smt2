
; Copyright (c) 2015 Microsoft Corporation
(set-option :auto-config true)
(set-option :produce-models true)
(set-logic QF_UFBV)
(declare-fun A ((_ BitVec 32)) (_ BitVec 32))
(assert (= (A (_ bv0 32)) (_ bv1 32)) )
(check-sat)
(get-model)

(reset)


(set-logic QF_UFBV)
(declare-fun A ((_ BitVec 32)) (_ BitVec 32))
(assert (= (A (_ bv0 32)) (_ bv1 32)) )
(assert (= (A (_ bv1 32)) (_ bv2 32)) )
(assert (= (A (_ bv2 32)) (_ bv2 32)) )
(assert (= (A (_ bv3 32)) (_ bv0 32)) )
(check-sat)
(get-model)
(eval (= (A (_ bv0 32)) (_ bv1 32)) )
(eval (= (A (_ bv1 32)) (_ bv2 32)) )
(eval (= (A (_ bv2 32)) (_ bv2 32)) )
(eval (= (A (_ bv3 32)) (_ bv0 32)) )

(reset)

(set-option :auto-config false)
(set-logic QF_UFBV)
(declare-fun A ((_ BitVec 32)) (_ BitVec 32))
(assert (= (A (_ bv0 32)) (_ bv1 32)) )
(assert (= (A (_ bv1 32)) (_ bv2 32)) )
(assert (= (A (_ bv2 32)) (_ bv2 32)) )
(assert (= (A (_ bv3 32)) (_ bv0 32)) )
(check-sat)
(get-model)
