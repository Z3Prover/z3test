

(declare-const x Real)

(simplify (^ (^ x 2.0) 4.0))

(simplify (^ (^ (+ x 1.0) 2.0) 4.0))


(simplify (^ (^ (+ x 1.0) 2.0) 2.0)
          :expand-power true)

(simplify (^ (^ (+ x 1.0) 2.0) 2.0)
          :expand-power true
          :som true)

(simplify (^ (+ x 2.0) (/ 3.0 2.0))
          :expand-power true)
