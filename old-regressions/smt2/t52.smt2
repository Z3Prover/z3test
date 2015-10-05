
; Copyright (c) 2015 Microsoft Corporation

(define-sort W () (_ BitVec 8))

(declare-const c1 W)
(declare-const c2 W)
(declare-const c3 W)

(simplify (bvslt c1 c2))
(simplify (bvsle c1 c2))
(simplify (bvsge c1 c2))
(simplify (bvsgt c1 c2))

(simplify (bvult c1 c2))
(simplify (bvule c1 c2))
(simplify (bvuge c1 c2))
(simplify (bvugt c1 c2))
