
; Copyright (c) 2015 Microsoft Corporation

(define-sort W () (_ BitVec 8))

(declare-const c1 W)
(declare-const c2 W)
(declare-const c3 W)

(simplify ((_ rotate_left 3) c1))
(simplify ((_ rotate_left 8) c1))
(simplify ((_ rotate_left 16) c1))
(simplify ((_ rotate_left 0) c1))
(simplify ((_ rotate_left 2) #b11010))
(simplify ((_ rotate_left 5) c1))

(simplify ((_ rotate_right 3) c1))
(simplify ((_ rotate_right 5) c1))

(simplify (ext_rotate_left c1 #x03))
(simplify (ext_rotate_left c1 c2))
(simplify (ext_rotate_right c1 #x03))
(simplify (ext_rotate_right c1 c2))

