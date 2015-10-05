
; Copyright (c) 2015 Microsoft Corporation


(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(simplify (<= (+ x 2) 3)
          :arith-lhs true)

(simplify (>= (+ x 2) 3)
          :arith-lhs true)

(simplify (>= (+ x y 2) 3)
          :arith-lhs true)

(simplify (<= (+ x y 2) 3)
          :arith-lhs true)

(simplify (< (+ x y 2) 3)
          :arith-lhs true)

(simplify (> (+ x y 2) 3)
          :arith-lhs true)

(simplify (<= 3 (+ x 2))
          :arith-lhs true)

(simplify (>= 3 (+ x 2))
          :arith-lhs true)

(simplify (>= 3 (+ x y 2))
          :arith-lhs true)

(simplify (<= 3 (+ x y 2))
          :arith-lhs true)

(echo "----")

(simplify (<= (+ z x 3) (+ x 2))
          :arith-lhs true)

(simplify (>= (+ z x 3) (+ x 2))
          :arith-lhs true)

(simplify (>= (+ z x 3) (+ x y 2))
          :arith-lhs true)

(simplify (<= (+ z x 3) (+ x y 2))
          :arith-lhs true)
