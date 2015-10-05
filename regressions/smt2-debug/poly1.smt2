
; Copyright (c) 2015 Microsoft Corporation

(declare-const x Int)
(declare-const y Int)

(poly/factor (* (+ x y) (+ (^ x 2) (* (- 2) x ) 1) (+ 3 x)))

(to-poly (* (+ (^ x 5) (* (- 1) x) (- 1)) (^ (+ (^ x 2) 1) 2)))

(poly/factor
 (+ (^ x 9)      
    (* 2 (^ x 7))
    (* (- 2) (^ x 3))
    (* (- 1) x)
    (* (- 1) (^ x 4))
    (* (- 2) (^ x 2))
    (- 1)))
 