(declare-const b Real)
(assert (is_int (- (/ (/ (+ 3.0 b) (+ (- (- 3.0)) 2.0)) (/ (+ 3.0 b) (+ (- (- 3.0)) 2.0))) b)))
(assert (< (- 2.0) b))
(check-sat)
