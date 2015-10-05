
; Copyright (c) 2015 Microsoft Corporation

(set-option :numeral-as-real true)

(define-fun sqrt ((x Real)) Real
  (^ x (/ 1 2)))

(define-fun cbrt ((x Real)) Real
  (^ x (/ 1 3)))

(simplify (= (+ (sqrt 2) (sqrt 3) (sqrt 5))
             (sqrt (+ 10 (* 2 (sqrt 15)) (* 4 (sqrt (+ 4 (sqrt 15))))))))

(simplify (+ (sqrt 2) (sqrt 3) (sqrt 5)))
(simplify (sqrt (+ 10 (* 2 (sqrt 15)) (* 4 (sqrt (+ 4 (sqrt 15)))))))

(simplify (/ (sqrt 7)
             (sqrt (+ 5 (* 2 (sqrt 6))))))

(simplify (/ (+ (sqrt 18) (sqrt 27))
             (sqrt (+ 5 (* 2 (sqrt 6))))))

;; Some systems encode subsets of the algebraic numbers as elements of the extension field Q(\theta).
;; Example (\theta, (c_0, ..., c_n)) represents the number c_n*\theta^n + ... + c_0 where c_i's are integers
;; Suppose \theta is cbrt(3). Then, we can encode (cbrt(3), (1, 2, 3)) in Z3 as:
(simplify (+ (* 3 (^ (cbrt 3) 2)) (* 2 (cbrt 3)) 1))

(simplify (/ (sqrt (+ (root-obj (+ (^ x 3) (* (- 7) x) (- 2)) 3) 1))
             (+ (* 3 (^ (cbrt 3) 2)) (* 2 (cbrt 3)) 1)))

(simplify (/ (root-obj (+ (^ x 5) (* 11 x) 1) 1)
             (+ (* 3 (^ (cbrt 3) 2)) (* 2 (cbrt 3)) 1)))


