; Copyright (c) 2015 Microsoft Corporation
; Test finite set subset operations

(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))

; Test subset reflexivity: A ⊆ A
(assert (set.subset s s))
(check-sat)

(reset)

; Test empty set is subset of all sets: ∅ ⊆ A
(declare-const s (FiniteSet Int))

(assert (set.subset (as set.empty (FiniteSet Int)) s))
(check-sat)

(reset)

; Test subset transitivity
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))

(assert (set.subset s t))
(assert (set.subset t u))
(assert (not (set.subset s u)))
(check-sat)

(reset)

; Test subset and union: A ⊆ (A ∪ B)
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))

(assert (not (set.subset s (set.union s t))))
(apply simplify)

(reset)

; Test subset with membership
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)

(assert (set.subset s t))
(assert (set.in x s))
(assert (not (set.in x t)))
(check-sat)
