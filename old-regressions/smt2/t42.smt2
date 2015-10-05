
; Copyright (c) 2015 Microsoft Corporation

(declare-const a Int)
(declare-const b Int)
(declare-const r Real)
(declare-const s Real)

(simplify (<= (- a) 3))

(simplify (<= (* 2.0 r) 3.0))
(simplify (>= (* 2.0 r) 3.0))
(simplify (>= (- (* 2.0 r)) 3.0))
(simplify (<= (- (* 2.0 r)) 3.0))
(simplify (= (- (* 2.0 r)) 3.0))

(simplify (<= (* 2 (- a)) 3))
(simplify (<= (* 2 (- a)) 4))
(simplify (<= (* 4 (- a)) 4))
(simplify (<= (* 4 (- a)) (- 4)))

(simplify (<= (* 2 (- a)) 3))
(simplify (<= (* 2 (- a)) 4))
(simplify (<= (* 4 (- a)) 4))
(simplify (<= (* 4 (- a)) (- 4)))

(simplify (>= (* 2 (- a)) 3))
(simplify (>= (* 2 (- a)) 4))
(simplify (>= (* 4 (- a)) 4))
(simplify (>= (* 4 (- a)) (- 4)))


(simplify (<= (* 2 a) 3))
(simplify (<= (* 2 a) 4))
(simplify (<= (* 4 a) 4))
(simplify (<= (* 4 a) (- 4)))

(simplify (>= (* 2 a) 3))
(simplify (>= (* 2 a) 4))
(simplify (>= (* 4 a) 4))
(simplify (>= (* 4 a) (- 4)))

(simplify (>= (+ (* 2 (- a)) b) (+ 3 b)))
