; Copyright (c) 2015 Microsoft Corporation
; Test finite set intersection operations

(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(declare-const x Int)

; Test intersection with empty set
(assert (= (set.intersect s (as set.empty (FiniteSet Int))) (as set.empty (FiniteSet Int))))
(apply simplify)

(reset)

; Test intersection membership
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)

(assert (set.in x (set.intersect s t)))
(assert (not (set.in x s)))
(check-sat)

(reset)

; Test intersection idempotence: A ∩ A = A
(declare-const s (FiniteSet Int))

(assert (not (= (set.intersect s s) s)))
(apply simplify)

(reset)

; Test intersection with singleton
(declare-const x Int)
(declare-const y Int)

(assert (= (set.intersect (set.singleton x) (set.singleton y)) (as set.empty (FiniteSet Int))))
(assert (not (= x y)))
(apply simplify)
