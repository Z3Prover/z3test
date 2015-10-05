
; Copyright (c) 2015 Microsoft Corporation



(define-sort C () (_ BitVec 4))

(declare-const c1 C)
(declare-const c2 C)
(declare-const c3 C)
(declare-const c4 C)

(simplify ((_ repeat 0) c1))
(simplify ((_ repeat 2) c1))
(simplify ((_ repeat 1) c1))
(simplify ((_ repeat 3) c1))
(simplify ((_ repeat 3) #b01))


(simplify ((_ sign_extend 0) c1))
(simplify ((_ sign_extend 2) c1))
(simplify ((_ sign_extend 2) #b101))
(simplify ((_ sign_extend 3) c2))

(simplify ((_ zero_extend 0) c1))
(simplify ((_ zero_extend 10) c1))
(simplify ((_ zero_extend 4) #xa))
