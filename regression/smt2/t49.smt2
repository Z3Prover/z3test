


(define-sort W () (_ BitVec 8))

(declare-const c1 W)
(declare-const c2 W)
(declare-const c3 W)

(simplify (bvxor c1 c2 c1))

(simplify (bvxor c1 c2 c1 c1))

(simplify (bvxor c1 c2 c1 c2 c1 c2 c3))

(simplify (bvxor c1 c2 (bvnot c1) c2 c1 c2 c3))

(simplify (bvxor #x00 c1))
(simplify (bvxor c1 #xff))
(simplify (bvxor c1 #xf0 #x0f))
(simplify (bvxor #xa0 c1 #x0a))

(simplify (bvxor #xf0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
                        #x0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a))
(declare-fun f (W W) W)
(simplify (let ((x (bvxor c1 c2))
                       (y (bvxor c2 c3)))
                   (f (bvxor x y) (bvxor x y))))
(simplify (bvxor c1 (bvnot c2) c3))
(simplify (bvxor c1 (bvnot c2) c3 c2 (bvnot c2)))
(simplify (bvxor c1 (bvnot c2) c3 (bvnot c2) c2))
(simplify (bvxor c1 c1))
(simplify (bvxor c1 #xfa c2))
(simplify (bvxor c1 #xfa c2))
(simplify (bvxor c1 #xfa c2 c1))
(simplify (bvxor c1 (bvxor c1 c2 c3)))