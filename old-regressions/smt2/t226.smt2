

(declare-const x Int)
(declare-const y Int)

(simplify (rem x (+ x 1)))
(simplify (rem x y))
(simplify (rem x 0))
(simplify (rem x (+ x 1))
          :elim-rem true)
(simplify (rem x y)
          :elim-rem true)
(simplify (rem x 0)
          :elim-rem true)
