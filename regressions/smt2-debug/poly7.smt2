
(set-logic QF_NRA) 
(declare-const x Real)
(declare-const y Real)

(poly/isolate-roots (+ x y 1) y 2)
(poly/isolate-roots (+ x y 1))
(poly/isolate-roots (+ x y 1) y (root-obj (+ (^ x 5) (* (- 1) x) (- 1)) 1))
(poly/isolate-roots (+ (* x x x) y 1) y (root-obj (+ (^ x 5) (* (- 1) x) (- 1)) 1))
(set-option :pp.decimal true)
(poly/isolate-roots (+ (* x x x) y 1) y (root-obj (+ (^ x 5) (* (- 1) x) (- 1)) 1))
(display (root-obj (+ (^ x 5) (* (- 1) x) (- 1)) 1))

(poly/isolate-roots (+ x y) y y)
(poly/isolate-roots (+ x y) 1 1)

(declare-const a Real)
(declare-const b Real)

(display (root-obj (+ (* 2 (^ x 2)) (* 3 x) (- 3)) 1))
(display (root-obj (- (^ x 2) 2) 1))

