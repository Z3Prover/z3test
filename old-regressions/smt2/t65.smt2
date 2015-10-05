
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-proofs true)

(declare-const x Int)

(assert (>= x 0))
(assert (= x 3))
(assert (and (>= x 1)
             (not (or (not (and (>= x 2)
                                (>= x 5)))
                      (>= x 3)))))

(apply simplify)

