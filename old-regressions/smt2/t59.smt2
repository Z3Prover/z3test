
; Copyright (c) 2015 Microsoft Corporation


(declare-const a Int)
(declare-const b Int)
(simplify (= (+ a 1) 0))
(simplify (= (- a 2) 0))
(simplify (= (+ a (- 2)) 0))
(simplify (= 0 (+ a 1)))
(simplify (= 0 (- a 2)))
(simplify (= 0 (+ a (- 2))))
(simplify (= (+ a 1) b))
(simplify (= (+ a (- 1)) b))
(simplify (= (+ a (- 1)) (+ b 2)))
(simplify (= (+ a 4) (+ b 2)))
(simplify (= 4 a))
(simplify (= (- 4) a))
(simplify (= a (- 4)))
(simplify (= a 4))
(echo "----")
(simplify (= (+ a 1) 2))
(simplify (= (- a 2) 2))
(simplify (= (+ a (- 2)) 2))
(simplify (= 2 (+ a 1)))
(simplify (= 2 (- a 2)))
(simplify (= 2 (+ a (- 2))))
(echo "----")
(simplify (= (+ (* 2 a) b 2) (+ a 3)))
(simplify (= (+ a 3) (+ (* 2 a) b 2)))
(echo "----")


