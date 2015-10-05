
; Copyright (c) 2015 Microsoft Corporation



(define-sort C () (_ BitVec 4))

(declare-const c1 C)
(declare-const c2 C)
(declare-const c3 C)
(declare-const c4 C)

(simplify (concat #x0 #x0 ((_ extract 3 2) c1) ((_ extract 1 0) c1)))

(simplify ((_ extract 13 2) (concat c1 c2 c3 c4)))
(simplify ((_ extract 14 12) (concat c1 c2 c3 c4)))
(simplify ((_ extract 15 12) (concat c1 c2 c3 c4)))
(simplify ((_ extract 15 13) (concat c1 c2 c3 c4)))
(simplify ((_ extract 14 12) (concat c1 c2 c3 c4)))
(simplify ((_ extract 14 10) (concat c1 c2 c3 c4)))
(simplify ((_ extract 14 10) (concat c1 (concat c2 c3) c4)))
(simplify ((_ extract 14 8) (concat c1 c2 c3 c4)))
(simplify ((_ extract 15 8) (concat c1 c2 c3 c4)))
(simplify ((_ extract 13 8) (concat c1 c2 c3 c4)))
(simplify ((_ extract 13 8) (concat ((_ extract 3 1) c1) c2 c3 c4)))

(simplify ((_ extract 3 0) #xa0))
(simplify ((_ extract 6 0) #xf0))
(simplify ((_ extract 7 4) #xf0))

(simplify (concat #x0f (concat #x0f c1)))