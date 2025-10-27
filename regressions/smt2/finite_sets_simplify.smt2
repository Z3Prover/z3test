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