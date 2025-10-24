; Copyright (c) 2015 Microsoft Corporation
; Test elim-uncnstr2 tactic with finite sets

(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(declare-const x Int)
(assert (= (set.union s t) u))
(apply elim-uncnstr2)
