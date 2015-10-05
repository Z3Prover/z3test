
; Copyright (c) 2015 Microsoft Corporation

(set-option :pp.max-depth 100)
(declare-const x Real)
(declare-const y Real)

(poly/factor (+ (* (- 1.) (^ x 2.)) (* (- 1.) (^ y 2.)) 1.))
