

(define-sort C () (_ BitVec 8))
(define-sort W () (_ BitVec 16))
(declare-const a1 W)
(declare-const a2 W)
(declare-const a3 W)
(declare-const a4 W)
(declare-const c1 C)
(declare-const c2 C)
(declare-const c3 C)
(declare-const c4 C)

(simplify (= (concat a1 a2) (concat (concat c1 c2) (concat c3 #x00))))
(simplify (= (bvudiv a1 #x0004) (concat c1 c2)))
(simplify (= (concat (concat a1 c1) (concat c2 a2)) (concat c3 (concat a3 a4) c4)))
