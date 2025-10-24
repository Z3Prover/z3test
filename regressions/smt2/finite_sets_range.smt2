; Copyright (c) 2015 Microsoft Corporation
; Test finite set range operations with arithmetic

(declare-const x Int)
(declare-const y Int)

; Test range membership
(assert (= x 5))
(assert (= y 10))
(assert (set.in 7 (set.range x y)))
(check-sat)

(reset)

; Test range bounds - element less than lower bound
(declare-const x Int)
(declare-const y Int)

(assert (= x 5))
(assert (= y 10))
(assert (set.in 3 (set.range x y)))
(check-sat)

(reset)

; Test range bounds - element equal to upper bound (exclusive)
(declare-const x Int)
(declare-const y Int)

(assert (= x 5))
(assert (= y 10))
(assert (set.in 10 (set.range x y)))
(check-sat)

(reset)

; Test range with arithmetic constraints
(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert (< x y))
(assert (= z (+ x 1)))
(assert (set.in z (set.range x y)))
(check-sat)

(reset)

; Test empty range
(declare-const x Int)

(assert (= (set.range x x) (as set.empty (FiniteSet Int))))
(apply simplify)

(reset)

; Test range union
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (< a b))
(assert (< b c))
(assert (set.subset (set.union (set.range a b) (set.range b c)) (set.range a c)))
(check-sat)

(reset)

; Test range intersection
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)

(assert (<= a b))
(assert (<= b c))
(assert (<= c d))
(assert (= (set.intersect (set.range a c) (set.range b d)) (set.range b c)))
(check-sat)
