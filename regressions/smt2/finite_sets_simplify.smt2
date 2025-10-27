(simplify (= (set.union (set.singleton 1) (set.singleton 2)) (set.singleton 1)))
; false

(simplify (= (set.union (set.singleton 1) (set.singleton 2)) (set.singleton 2)))
; false

(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const u (FiniteSet Int))

(simplify (= (set.union s t u) (set.union u t s)))
; true 
(simplify (= (set.union s t) (set.union s u)))

; not simplified

(simplify (= (set.union s (set.singleton 1)) (set.union (set.singleton 2) s)))
; not simplified

(declare-const x Int)

(simplify (set.in x (set.singleton 1)))
; x = 1

(simplify (set.in x (as set.empty (FiniteSet Int))))
; false

(simplify (set.in x (set.range 1 6)))

(simplify (set.size (set.range 1 6)))
; 6

(simplify (set.size (set.range x (+ x 10))))
; 11

(simplify (set.size (as set.empty (FiniteSet Int))))
; 0

(simplify (set.size (set.singleton 11)))
; 1

; Test set.intersect operations
(simplify (set.intersect (set.singleton 1) (set.singleton 1)))
; {1}

(simplify (set.intersect (set.singleton 1) (set.singleton 2)))
; empty

(simplify (set.intersect s (as set.empty (FiniteSet Int))))
; empty

(simplify (set.intersect s s))
; s

(simplify (= (set.intersect s t) (set.intersect t s)))
; true

(simplify (= (set.intersect s t u) (set.intersect u t s)))
; true

(simplify (set.in x (set.intersect (set.singleton 1) (set.singleton 2))))
; false

(simplify (set.in 5 (set.intersect (set.range 1 10) (set.range 3 8))))
; true

(simplify (set.size (set.intersect (set.singleton 1) (set.singleton 1))))
; 1

; Test set.difference operations
(simplify (set.difference (set.singleton 1) (set.singleton 2)))
; {1}

(simplify (set.difference (set.singleton 1) (set.singleton 1)))
; empty

(simplify (set.difference s (as set.empty (FiniteSet Int))))
; s

(simplify (set.difference s s))
; empty

(simplify (set.difference (as set.empty (FiniteSet Int)) s))
; empty

(simplify (set.in x (set.difference (set.singleton 1) (set.singleton 2))))

(simplify (set.in 1 (set.difference (set.singleton 1) (set.singleton 2))))
; true

(simplify (set.in x (set.difference s s)))
; false

(simplify (set.size (set.difference (set.singleton 1) (set.singleton 2))))
; 1

; Test set.subset operations
(simplify (set.subset s s))
; true

(simplify (set.subset (as set.empty (FiniteSet Int)) s))
; true

(simplify (set.subset s (as set.empty (FiniteSet Int))))

(simplify (set.subset (set.singleton 1) (set.union (set.singleton 1) (set.singleton 2))))
; true

(simplify (set.subset (set.union s t) s))

(simplify (set.subset s (set.union s t)))
; true

(simplify (set.subset (set.intersect s t) s))
; true

(simplify (set.subset (set.singleton 1) (set.range 1 10)))
; true

(simplify (set.subset (set.range 3 5) (set.range 1 10)))
; true

; Test combinations and nested operations
(simplify (set.union (set.intersect s t) (set.difference s t)))
; s

(simplify (set.intersect (set.union s t) (set.union t s)))
; union of s and t

(simplify (set.size (set.union (set.singleton 1) (set.singleton 2))))
; 2

(simplify (set.size (set.difference (set.range 1 10) (set.singleton 5))))
; 9

(simplify (set.in x (set.union (set.intersect s t) (set.difference s t))))

(simplify (= (set.difference s t) (set.difference s (set.intersect s t))))
; true

(simplify (= (set.union s (set.intersect s t)) s))
; true

(simplify (= (set.intersect s (set.union s t)) s))
; true

; Test more intersection properties
(simplify (set.size (set.intersect (set.singleton 1) (set.singleton 2))))
; 0

(simplify (set.size (set.intersect (as set.empty (FiniteSet Int)) s)))
; 0

; Test more difference properties  
(simplify (set.size (set.difference s (set.union s t))))
; 0

(simplify (set.in 2 (set.difference (set.range 1 5) (set.singleton 1))))
; true

; Test subset with empty set
(simplify (set.subset (set.intersect s t) t))
; true

; Test De Morgan's laws for sets
(simplify (= (set.difference s (set.union t u)) 
             (set.intersect (set.difference s t) (set.difference s u))))
; true

; Test more range operations with other set operations
(simplify (set.in 5 (set.union (set.range 1 5) (set.range 5 10))))
; true

(simplify (set.in 0 (set.intersect (set.range 1 10) (set.range 5 15))))
; false

(simplify (set.subset (set.range 3 7) (set.range 1 10)))
; true

; Test idempotence of union and intersect with themselves
(simplify (= (set.union s (set.union s t)) (set.union s t)))
; true

(simplify (= (set.intersect s (set.intersect s t)) (set.intersect s t)))
; true