
; Copyright (c) 2015 Microsoft Corporation

(declare-const x Int)
(declare-const y Int)

(poly/factor (+ (^ x 2) (- 1)))

(poly/factor (+ (* (- 2) (^ x 2)) 2))

(declare-const z Int)

(poly/factor (* (+ x (* (- 1) (^ y 3)))
                (+ x (^ z 3) 2)))

(poly/factor (* (+ (* (+ (^ z 3) 1) x) (^ y 3))
                (+ x (^ y 3) 2)))

(poly/factor (* (- 3) (+ (* (+ (^ z 3) 1) x) (^ y 3))
                (+ x (^ y 3) 2)))

(poly/factor (+ (^ y 6)
                (* 2 x (^ y 3))
                (* (- 5) z x (^ y 3))
                (* (- 2) (^ y 3))
                (* (- 15) (^ x 2))
                (* 15 z (^ x 2))
                (* 6 x)
                (* (- 3) (^ z 3) x (^ y 3))
                (* (- 15) (^ z 3) (^ x 2))
                (* 15 (^ z 4) (^ x 2))
                (* 6 (^ z 3) x)))
