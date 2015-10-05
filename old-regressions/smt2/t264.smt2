
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)
(set-option :pp.max-depth 100)
(declare-const p1 Bool)
(declare-const p2 Bool)
(declare-const p3 Bool)
(declare-const a Real)
(declare-const b Real)
(declare-const c Real)

(assert (or (not p1) (not p2) (= a 0.0)))
(assert (or p1 (not p2) (= a 1.0)))
(assert (or (not p1) p2 (= a 3.0)))
(assert (or p1 p2 (= a 4.0)))

(assert (= (+ a b) 20.0))
(assert (= (+ a c) 10.0))

(apply (and-then recover-01 simplify) :print-model-converter true)

(reset)

(set-option :produce-models true)
(set-option :pp.max-depth 100)
(declare-const p1 Bool)
(declare-const p2 Bool)
(declare-const p3 Bool)
(declare-const a Real)
(declare-const b Real)
(declare-const c Real)

(assert (= (+ a b) 20.0))
(assert (= (+ a c) 10.0))

(apply (and-then recover-01 simplify) :print-model-converter true)

(assert (or (not p1) (not p2) (= a 4.0)))
(assert (or p1 (not p2) (= a 1.0)))
(assert (or (not p1) p2 (= a 3.0)))
(assert (or p1 p2 (= a 0.0)))

(apply (and-then recover-01 simplify) :print-model-converter true)

(reset)
(set-option :produce-proofs true)
(apply recover-01)

(reset)
(set-option :produce-proofs false)
(set-option :produce-unsat-cores true)
(apply recover-01)
