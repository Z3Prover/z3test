; Copyright (c) 2015 Microsoft Corporation
; Comprehensive tests for finite set operations

; Test 1: Basic union operation - union idempotence
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)
(assert (not (= s t)))
(assert (= (set.union s s) t))
(check-sat)

(reset)

; Test 2: Empty set cannot equal singleton
(declare-const x Int)
(assert (= (as set.empty (FiniteSet Int)) (set.singleton x)))
(check-sat)

(reset)

; Test 3: Unconstrained variable elimination with union
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(declare-const x Int)
(assert (= (set.union s t) u))
(check-sat)

(reset)

; Test 4: Unsatisfiability - element in subset but not in union
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(declare-const x Int)
(assert (= s (set.union t u)))
(assert (set.in x t))
(assert (not (set.in x s)))
(check-sat)

(reset)

; Test 5: Satisfiability with variadic union
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(declare-const v (FiniteSet Int))
(declare-const x Int)
(assert (= s (set.union t u v)))
(assert (set.in x t))
(check-sat)

(reset)

; Test 6: Push/pop operations
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(declare-const v (FiniteSet Int))
(declare-const x Int)
(push)
(assert (= s (set.union t u v)))
(assert (set.in x t))
(check-sat)
(pop)

(reset)

; Test 7: Intersection with empty set
(declare-const s (FiniteSet Int))
(assert (not (= (set.intersect s (as set.empty (FiniteSet Int))) (as set.empty (FiniteSet Int)))))
(check-sat)

(reset)

; Test 8: Intersection membership
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)
(assert (set.in x (set.intersect s t)))
(assert (not (set.in x s)))
(check-sat)

(reset)

; Test 9: Intersection idempotence: A ∩ A = A
(declare-const s (FiniteSet Int))
(assert (not (= (set.intersect s s) s)))
(check-sat)

(reset)

; Test 10: Intersection with singleton - different elements
(declare-const x Int)
(declare-const y Int)
(assert (not (= (set.intersect (set.singleton x) (set.singleton y)) (as set.empty (FiniteSet Int)))))
(assert (not (= x y)))
(check-sat)

(reset)

; Test 11: Difference with empty set: A \ ∅ = A
(declare-const s (FiniteSet Int))
(assert (not (= (set.difference s (as set.empty (FiniteSet Int))) s)))
(check-sat)

(reset)

; Test 12: Difference with self: A \ A = ∅
(declare-const s (FiniteSet Int))
(assert (not (= (set.difference s s) (as set.empty (FiniteSet Int)))))
(check-sat)

(reset)

; Test 13: Difference membership
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)
(assert (set.in x (set.difference s t)))
(assert (set.in x t))
(check-sat)

(reset)

; Test 14: Difference with singleton
(declare-const x Int)
(declare-const y Int)
(assert (set.in x (set.difference (set.singleton x) (set.singleton y))))
(assert (not (= x y)))
(check-sat)

(reset)

; Test 15: Subset reflexivity: A ⊆ A
(declare-const s (FiniteSet Int))
(assert (set.subset s s))
(check-sat)

(reset)

; Test 16: Empty set is subset of all sets: ∅ ⊆ A
(declare-const s (FiniteSet Int))
(assert (set.subset (as set.empty (FiniteSet Int)) s))
(check-sat)

(reset)

; Test 17: Subset transitivity
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))
(assert (set.subset s t))
(assert (set.subset t u))
(assert (not (set.subset s u)))
(check-sat)

(reset)

; Test 18: Subset and union: A ⊆ (A ∪ B)
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(assert (not (set.subset s (set.union s t))))
(check-sat)

(reset)

; Test 19: Subset with membership
(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)
(assert (set.subset s t))
(assert (set.in x s))
(assert (not (set.in x t)))
(check-sat)

(reset)

; Test 20: Distributivity of union over intersection: A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))
(declare-const c (FiniteSet Int))
(assert (not (= (set.union a (set.intersect b c))
                (set.intersect (set.union a b) (set.union a c)))))
(check-sat)

(reset)

; Test 21: Distributivity of intersection over union: A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))
(declare-const c (FiniteSet Int))
(assert (not (= (set.intersect a (set.union b c))
                (set.union (set.intersect a b) (set.intersect a c)))))
(check-sat)

(reset)

; Test 22: Absorption law: A ∪ (A ∩ B) = A
(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))
(assert (not (= (set.union a (set.intersect a b)) a)))
(check-sat)

(reset)

; Test 23: Absorption law: A ∩ (A ∪ B) = A
(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))
(assert (not (= (set.intersect a (set.union a b)) a)))
(check-sat)

(reset)

; Test 24: Difference with intersection: A \ (B ∩ C) ⊇ (A \ B) ∪ (A \ C)
(declare-const a (FiniteSet Int))
(declare-const b (FiniteSet Int))
(declare-const c (FiniteSet Int))
(assert (not (set.subset (set.union (set.difference a b) (set.difference a c))
                          (set.difference a (set.intersect b c)))))
(check-sat)

(reset)

; Test 25: Range membership
(declare-const x Int)
(declare-const y Int)
(assert (= x 5))
(assert (= y 10))
(assert (set.in 7 (set.range x y)))
(check-sat)

(reset)

; Test 26: Range bounds - element less than lower bound
(declare-const x Int)
(declare-const y Int)
(assert (= x 5))
(assert (= y 10))
(assert (set.in 3 (set.range x y)))
(check-sat)

(reset)

; Test 27: Range bounds - element equal to upper bound (exclusive)
(declare-const x Int)
(declare-const y Int)
(assert (= x 5))
(assert (= y 10))
(assert (set.in 10 (set.range x y)))
(check-sat)

(reset)

; Test 28: Range with arithmetic constraints
(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(assert (< x y))
(assert (= z (+ x 1)))
(assert (set.in z (set.range x y)))
(check-sat)

(reset)

; Test 29: Empty range
(declare-const x Int)
(assert (not (= (set.range x x) (as set.empty (FiniteSet Int)))))
(check-sat)

(reset)

; Test 30: Range union
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(assert (< a b))
(assert (< b c))
(assert (set.subset (set.union (set.range a b) (set.range b c)) (set.range a c)))
(check-sat)

(reset)

; Test 31: Range intersection
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(assert (<= a b))
(assert (<= b c))
(assert (<= c d))
(assert (= (set.intersect (set.range a c) (set.range b d)) (set.range b c)))
(check-sat)
