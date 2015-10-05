
; Copyright (c) 2015 Microsoft Corporation


(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)

(simplify (<= (+ 3 (* 2 a)) 0)
                 :gcd-rounding true)

(simplify (<= (+ 3 (* 2 a)) (* 4 b))
                 :gcd-rounding true)

(simplify (<= (+ 3 (* 2 a)) (+ 2 (* 4 b) (* 6 c)))
                 :gcd-rounding true)

(simplify (>= (+ 3 (* 2 a)) (+ 2 (* 4 b) (* 6 c)))
                 :gcd-rounding true)

(simplify (>= (+ 6 (* 2 a)) (+ 1 (* 4 b) (* 6 c)))
                 :gcd-rounding true)

(simplify (<= (+ 6 (* 2 a)) (+ 1 (* 4 b) (* 6 c)))
                 :gcd-rounding true)

(simplify (<= (+ 6 (* 2 a)) (+ 1 (* 3 b) (* 6 c)))
                 :gcd-rounding true)

(simplify (<= (* 2 a) 3)
                 :gcd-rounding true)

(simplify (>= (* 2 a) 3)
                 :gcd-rounding true)

(simplify (<= 3 (* 2 a))
                 :gcd-rounding true)

(simplify (>= 3 (* 2 a))
                 :gcd-rounding true)

