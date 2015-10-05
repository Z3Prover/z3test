
; Copyright (c) 2015 Microsoft Corporation

(declare-const x Real)
(declare-const y Real)

(simplify (^ (* x y) (- 3.)))

(simplify (^ (^ x 2.) 3.))

(simplify (^ (^ x (- 2.)) 3.))

(simplify (^ (^ x (- 2.)) (- 3.))) ;; it is x^6 only if x != 0

(simplify (^ (^ x 2.) (- 3.)))

(simplify (^ (^ x 2.) y))

(simplify (^ (^ x 2.) (/ 1. 2.))) ;; TODO: --> abs(x)

(simplify (^ (^ x (/ 1. 2.)) 2.))

(simplify (^ (^ x y) 2.))

(simplify (^ x (/ 2. 3.)))

(simplify (^ x (/ 2. 3.))
          :expand-power true)
