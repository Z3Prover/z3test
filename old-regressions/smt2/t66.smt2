
; Copyright (c) 2015 Microsoft Corporation


(declare-const x Int)

(assert (>= x 0))
(assert (iff (and (>= x 1)
                  (not (or (not (and (>= x 2)
                                     (>= x 5)))
                           (>= x 3))))
                  true))
(assert (>= x 100))
(apply simplify)
