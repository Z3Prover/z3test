; Copyright (c) 2015 Microsoft Corporation
; Test unsatisfiability with finite sets

(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(declare-const x Int)

(assert (= s (set.union t u)))
(assert (set.in x t))
(assert (not (set.in x s)))
(check-sat)
