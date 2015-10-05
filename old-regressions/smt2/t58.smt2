
; Copyright (c) 2015 Microsoft Corporation




(define-sort B () (_ BitVec 1))
(declare-const c1 B)
(declare-const c2 B)
(declare-const c3 B)
(declare-const b Bool)

(set-option :pp.max-depth 100)

(simplify (= (bvor (bvand c1 (bvnot c2)) (ite b c3 (bvand c1 c2)))
             #b0)
          :bit2bool false)

(simplify (= (bvor (bvand c1 (bvnot c2)) (ite b c3 (bvand c1 c2)))
             #b0)
          :bit2bool true)

(define-sort C () (_ BitVec 8))
(declare-const a1 C)
(declare-const a2 C)


(simplify (= (bvor (bvnot a1) a2) #xf0)
          :blast-eq-value true)
