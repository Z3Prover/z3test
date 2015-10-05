
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-fun f (Int Int) Int)

(assert (and
         (= x (f (+ y 1) (+ y 1)))
         (= z 0)
         (= (+ y z) 1)
         (>= (f (+ y 1) 0) 0)))

(apply (and-then simplify solve-eqs) :print-model-converter true)
