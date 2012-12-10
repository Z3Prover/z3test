
(declare-const x Real)

(poly/isolate-roots (+ (^ x 7.0)
                       (* (- 1.0) (^ x 3.0))
                       (* (- 1.0) (^ x 2.0))
                       (* (- 2.0) (^ x 5.0))
                       (* 2.0 x)
                       2.0))

(set-option :pp.decimal true)

(poly/isolate-roots (+ (^ x 7.0)
                       (* (- 1.0) (^ x 3.0))
                       (* (- 1.0) (^ x 2.0))
                       (* (- 2.0) (^ x 5.0))
                       (* 2.0 x)
                       2.0))
