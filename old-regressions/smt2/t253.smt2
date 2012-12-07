


(define-sort Double () (_ FP 11 53))
(declare-const a Double)
(declare-const b Real)
(display (= a (as NaN Double)))
(display (< a a))
(display (+ roundNearestTiesToEven ((_ asFloat 11 53) roundNearestTiesToEven 0.12) a))
(display (< b 1.0))
(display (+ b b))
