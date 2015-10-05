
; Copyright (c) 2015 Microsoft Corporation


(set-logic QF_FPA)
(define-sort FPN () (_ FP 11 53))
(declare-const x FPN)
(assert (= x ((_ asFloat 11 53) roundNearestTiesToEven (/ 1.0 2.0))))
(apply simplify)
