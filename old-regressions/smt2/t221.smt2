
; Copyright (c) 2015 Microsoft Corporation


(set-option :produce-unsat-cores true)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-const w Int)
(declare-fun f (Int) Int)

(assert (! (= x (+ y 1)) :named a1))
(assert (! (= z (+ x 1)) :named a2))
(assert (! (>= y 0) :named a3))
(assert (<= z 10))
(assert (<= (f (+ x 1)) 0))
(assert (<= (f y) 2))
(assert (<= (f z) 3))
(assert (! (> (* w w) 4) :named a4))
(apply (and-then simplify solve-eqs) :print-dependencies true)
