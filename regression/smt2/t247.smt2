
(declare-const a Int)
(declare-const b Int)

(simplify (= (^ (+ a 1) 100) 0))

(simplify (= (* (^ a 3) (^ b 2)) 0))

(simplify (> (* (^ a 3) (^ b 2)) 0))

(simplify (> (* (^ a 3) a (^ b 8)) 0))

(simplify (> (* (^ a 3) (^ a 4) (^ b 8)) 0))

(simplify (> (* (^ a 3) a (^ b 8)) 0)
          :mul-to-power true)

(simplify (> (* (^ a 3) (^ a 4) (^ b 8)) 0)
          :mul-to-power true)

(simplify (>= (* (^ a 3) (^ a 4) (^ b 8)) 0)
          :mul-to-power true)

(simplify (>= (^ (+ a 1) 0) 0))

(simplify (>= (^ (+ a 1) (- 4)) 0))

(declare-const x Real)
(simplify (>= (^ (+ x 1.) 4.) 0.))
(simplify (>= (^ (+ x 1.) (- 4.)) 0.))


(simplify (= 0 (^ (+ a 1) 100)))

(simplify (= 0 (* (^ a 3) (^ b 2))))

(simplify (> 0 (* (^ a 3) (^ b 2))))

(simplify (> 0 (* (^ a 3) a (^ b 8))))

(simplify (>= 0. (^ (+ x 1.) 4.)))
(simplify (>= 0. (^ (+ x 1.) (- 4.))))

