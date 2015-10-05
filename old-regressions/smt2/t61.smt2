
; Copyright (c) 2015 Microsoft Corporation


(define-sort B () (_ BitVec 1))
(define-sort W () (_ BitVec 16))
(declare-const a1 B)
(declare-const a2 B)
(declare-const c1 W)

(simplify (iff (= a1 #b1) (bvsle c1 #x0000)))
(simplify (= (= a1 #b1) (bvsle c1 #x0000)))
(simplify (iff (= a1 #b0) (bvsle c1 #x0000)))
(simplify (= (= a1 #b0) (bvsle c1 #x0000)))

