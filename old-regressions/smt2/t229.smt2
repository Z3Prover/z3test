

(declare-const x Real)
(declare-const y Real)
(declare-const z Real)

(simplify (+ 1.0 (* 4.0 x) (* 6.0 x x) (* 4.0 x x x) (* x x x x)))

(simplify (+ 1.0 (* 4.0 x) (* 6.0 x x) (* 4.0 x x x) (* x x x x))
          :mul-to-power true)

(simplify (+ 1.0 (* 4.0 x) (* 6.0 x x) (* 4.0 x x x) (* x x x x))
          :expand-power true
          :mul-to-power true)

(simplify (* x x y y z z z z)
          :mul-to-power true)

(simplify (* x x (+ y 1.) (+ y 1.) z z z)
          :mul-to-power true)

(simplify (* x x (+ y 1.) (+ y 1.) z z z))

(simplify (* (^ x 2.) (+ z 2.) (^ x 3.) (^ z 2.) (+ y 1.) (+ y 1.) z z (+ z 1.) z (^ x 5.))
          :mul-to-power true)

(simplify (* (^ x y) (^ x 2.))
          :mul-to-power true)

(simplify (* x (^ x y) (^ x 2.))
          :mul-to-power true)

(simplify (* x (^ x y) (^ x 2.) (^ x y))
          :mul-to-power true)

(simplify (* (^ x 0.) (^ x 2.))
          :mul-to-power true)

(simplify (* (^ y 3.) (^ x 2.) y x (^ y 2.))
          :mul-to-power true)

(simplify (* (+ y 1.) (+ x 1.) (^ (+ y 1.) 3.)))

(simplify (* (+ y 1.) (+ x 1.) (^ (+ y 1.) 3.))
          :mul-to-power true)

(simplify (* (+ y 1.) 2. (+ x 1.) 4. (^ (+ y 1.) 3.))
          :mul-to-power true)

(simplify (* x x (+ y 1.) 2. (+ y 1.) z z z)
          :mul-to-power true)
