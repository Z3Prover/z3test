
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-unsat-cores true)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-fun f (Int) Int)

(assert (! (= (f 0) 1) :named a1))
(assert (! (= (f (+ (f 0) 1)) 10) :named a2))
(assert (= x 20))
(assert (= (f (+ x (f 0) (f 2))) 3))
(assert (= (f (+ x (f 0))) 3))

(apply (and-then simplify (! propagate-values :max-rounds 10)) :print-dependencies true)
