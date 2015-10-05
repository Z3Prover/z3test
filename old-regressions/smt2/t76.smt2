
; Copyright (c) 2015 Microsoft Corporation
(set-option :produce-models true)

(declare-const x1 Int)
(declare-const x2 Int)
(declare-const x3 Int)
(declare-const x4 Int)
(declare-const x5 Int)
(declare-const x6 Int)
(declare-const x7 Int)
(declare-fun f (Int Int) Int)

(assert (= x5 (f (+ x4 1) (+ x4 1))))
(assert (= x1 (+ x2 1)))
(assert (= x2 (+ x3 1)))
(assert (= x4 (+ x1 1)))
(assert (= x3 (+ x5 1)))
(assert (= x6 (+ (f x6 0) 1)))
(assert (= x7 (+ (f x2 x2) 1)))

(apply (and-then simplify solve-eqs) :print-model-converter true)


(reset)
(echo "----")

(declare-const x1 Int)
(assert (>= x1 0))
(apply (and-then simplify solve-eqs) :print-model-converter true)
