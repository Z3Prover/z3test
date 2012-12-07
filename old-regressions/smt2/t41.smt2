

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)

(simplify (= 3 (* 2 a))
                 :gcd-rounding true)

(simplify (= 3 (* 2 a)))

(simplify (= (* 2 a) 3)
                 :gcd-rounding true)

(simplify (= (* 2 a) 4)
                 :gcd-rounding true)

(simplify (= (* 2 a) (+ a a a a a 4))
                 :gcd-rounding true)
(simplify (= (* 2 a) (+ a a a a a a 4))
                 :gcd-rounding true)
(simplify (= (+ (* 2 a) 4) (+ a a a a a a))
                 :gcd-rounding true)
(simplify (= (+ (* 2 a) 4) (+ a a a a a a))
                 :gcd-rounding true
                 :arith-lhs true)
