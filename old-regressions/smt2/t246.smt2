
; Copyright (c) 2015 Microsoft Corporation


(declare-const a Int)
(declare-const b Int)

(push)
(assert (> 1 0))
(apply factor)
(pop)

(push)
(assert (> a 1))
(assert (> a (+ b 1)))
(apply factor)
(pop)

(push)
(assert (> a 1))
(assert (> (^ (- a (+ b 1)) 3) 0))
(apply factor)
(pop)


(push)
(assert (> a 1))
(assert (> (* (^ (- a (+ b 1)) 3) (^ a 2)) 0))
(apply factor)
(pop)
