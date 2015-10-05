
; Copyright (c) 2015 Microsoft Corporation


(declare-const a1 Int)
(declare-const a2 Int)
(declare-const a3 Int)
(declare-const a4 Int)

(set-option :produce-models true)

(assert (<= (- a1 a2) 3))
(assert (<= 4 (- a2 a3)))
(assert (<= (- a4 a2) 4))

(apply (and-then simplify solve-eqs fix-dl-var normalize-bounds) :print-model-converter true)

(assert (<= a4 0))

(apply (and-then simplify solve-eqs fix-dl-var normalize-bounds) :print-model-converter true)

(reset)

(declare-const a1 Int)
(declare-const a2 Int)
(declare-const a3 Int)
(declare-const a4 Int)
(declare-fun f (Int) Int)

(assert (<= (- a1 a2) 3))
(assert (<= a2 a3))
(assert (<= a1 a3))
(assert (= (f (+ a1 2)) (+ a2 3)))
(assert (= (f (f a2)) (+ a2 3)))
(assert (<= (f (+ a1 2)) (+ a2 3)))
(assert (<= (- (f (+ a1 2)) (f (+ a2 3))) 5))

(apply (and-then (! simplify :arith-lhs true) solve-eqs fix-dl-var normalize-bounds) :print-model-converter true)

(push)
(assert (= (f 10) a2))
(apply (and-then (! simplify :arith-lhs true) solve-eqs fix-dl-var normalize-bounds) :print-model-converter true)
(pop)

(push)
(assert (= (f a1) 0))
(apply (and-then (! simplify :arith-lhs true) solve-eqs fix-dl-var normalize-bounds) :print-model-converter true)
(pop)

(push)
(assert (= (- (f a1) (f a2)) 0))
(apply (and-then (! simplify :arith-lhs true) solve-eqs fix-dl-var normalize-bounds) :print-model-converter true)
(pop)

(reset)

(declare-const a1 Real)
(declare-const a2 Real)
(declare-const a3 Real)
(declare-const a4 Real)

(set-option :produce-models true)

(assert (<= (- a1 a2) 3.0))
(assert (<= 4.0 (- a2 a3)))
(assert (<= (- a4 a2) 4.0))

(apply (and-then simplify solve-eqs fix-dl-var normalize-bounds) :print-model-converter true)

