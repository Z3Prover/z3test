; Copyright (c) 2015 Microsoft Corporation
; Test push/pop operations with finite sets

(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(declare-const v (FiniteSet Int))
(declare-const x Int)

(push)
(assert (= s (set.union t u v)))
(assert (set.in x t))
(check-sat)
(get-model)
(get-info :all-statistics)
