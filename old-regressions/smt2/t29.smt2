
; Copyright (c) 2015 Microsoft Corporation



(display (forall ((x Int)) (! (< x 0) :no-pattern (< x 0))))
(display (forall ((x Int)) (! (< x 0) :no-pattern (< x 0) :no-pattern (> x 0))))
