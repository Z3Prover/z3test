
(declare-const x Real)
(declare-const y Real)
(assert (> (+ (^ x 2.0) (^ y 2.0)) 2.0))
(check-sat)

(reset)

(declare-const y Real)
(assert (= y (root-obj (- (^ x 2) 2) 1)))
(check-sat)

(reset)
(set-option :auto-config true)

(declare-const x Real)
(declare-const y Real)
(assert (> (+ (^ x 2.0) (^ y 2.0)) 2.0))
(check-sat)
(get-model)

(reset)
(set-option :auto-config true)

(declare-const y Real)
(assert (= y (root-obj (- (^ x 2) 2) 1)))
(check-sat)
(get-model)

