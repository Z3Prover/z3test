; Copyright (c) 2015 Microsoft Corporation
; Test distributivity properties of set operations

(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))
(declare-const c (FiniteSet Int))

; Test distributivity of union over intersection: A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
(assert (not (= (set.union a (set.intersect b c))
                (set.intersect (set.union a b) (set.union a c)))))
(apply simplify)

(reset)

; Test distributivity of intersection over union: A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))
(declare-const c (FiniteSet Int))

(assert (not (= (set.intersect a (set.union b c))
                (set.union (set.intersect a b) (set.intersect a c)))))
(apply simplify)

(reset)

; Test absorption law: A ∪ (A ∩ B) = A
(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))

(assert (not (= (set.union a (set.intersect a b)) a)))
(apply simplify)

(reset)

; Test absorption law: A ∩ (A ∪ B) = A
(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))

(assert (not (= (set.intersect a (set.union a b)) a)))
(apply simplify)

(reset)

; Test difference with intersection: A \ (B ∩ C) ⊇ (A \ B) ∪ (A \ C)
(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))
(declare-const c (FiniteSet Int))

(assert (not (set.subset (set.union (set.difference a b) (set.difference a c))
                          (set.difference a (set.intersect b c)))))
(apply simplify)
