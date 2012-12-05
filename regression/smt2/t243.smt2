

(declare-const a Real)
(declare-const b Real)

(push)
;; -(a - 1)^2 >= 0
(assert (>= (+ (* (- 1.) (^ a 2.)) (* 2. a)) 1.))
(apply factor)
(pop)

(push)
;; -(a - 1)^2 > 0
(assert (> (+ (* (- 1.) (^ a 2.)) (* 2. a)) 1.))
(apply factor)
(pop)

(push)
;; -(a - 1)^2 < 0
(assert (< (+ (* (- 1.) (^ a 2.)) (* 2. a)) 1.))
(apply factor)
(pop)

(push)
;; -(a - 1)^2 <= 0
(assert (<= (+ (* (- 1.) (^ a 2.)) (* 2. a)) 1.))
(apply factor)
(pop)