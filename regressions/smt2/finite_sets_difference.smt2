; Copyright (c) 2015 Microsoft Corporation
; Test finite set difference operations

(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)

; Test difference with empty set: A \ ∅ = A
(assert (= (set.difference s (as set.empty (FiniteSet Int))) s))
(apply simplify)

(reset)

; Test difference with self: A \ A = ∅
(declare-const s (FiniteSet Int))

(assert (= (set.difference s s) (as set.empty (FiniteSet Int))))
(apply simplify)

(reset)

; Test difference membership
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)

(assert (set.in x (set.difference s t)))
(assert (set.in x t))
(check-sat)

(reset)

; Test difference with singleton
(declare-const x Int)
(declare-const y Int)

(assert (set.in x (set.difference (set.singleton x) (set.singleton y))))
(assert (not (= x y)))
(check-sat)
