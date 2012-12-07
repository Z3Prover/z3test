


(define-sort W () (_ BitVec 8))

(declare-const c1 W)
(declare-const c2 W)
(declare-const c3 W)

(simplify (bvor c1 c2 c1))

(simplify (bvor c1 c2 c1 c1))

(simplify (bvor c1 c2 c1 c2 c1 c2 c3))

(simplify (bvor c1 c2 (bvnot c1) c2 c1 c2 c3))

(simplify (bvor (bvnot c1) c2 (bvnot c1) c2 c3))

(simplify (bvor #xf0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0
                       #x0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a))

(simplify (bvor #b11001100110011
                       #b01010101010101))

(simplify (bvxor #b11001100110011
                        #b01010101010101))

(simplify (bvor #x00 c1 c2 c1 c1))

(simplify (bvor #x00 c1))
(simplify (bvor c1 c1 c1))
(simplify (bvor c1 c2 c1))

(declare-fun f (W W) W)
(simplify (let ((x (bvor c1 c2))
                       (y (bvor c2 c3)))
                   (f (bvor x y) (bvor x y))))

