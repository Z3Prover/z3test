; Copyright (c) 2015 Microsoft Corporation
; Test satisfiability with models for finite sets

(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(declare-const v (FiniteSet Int))
(declare-const x Int)

(assert (= s (set.union t u v)))
(assert (set.in x t))
(check-sat)
(get-model)
