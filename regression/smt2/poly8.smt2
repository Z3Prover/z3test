
(set-option :pp.max-depth 100)
(declare-const skoX Real)
(poly/factor (+ (* 90000000.0 skoX) (* (- 29.0) skoX skoX skoX)))
(poly/factor (+ (* (- 90000000.0) skoX) (* 29.0 skoX skoX skoX)))

(push)
(assert (> (+ (* 90000000.0 skoX) (* (- 29.0) skoX skoX skoX)) 0.0))
(apply (and-then simplify factor))
(pop)

(push)
(assert (> (+ (* (- 90000000.0) skoX) (* 29.0 skoX skoX skoX)) 0.0))
(apply (and-then simplify factor))
(pop)
