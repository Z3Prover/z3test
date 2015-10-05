
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)
(declare-const x Real)
(declare-const y Real)
(declare-const z Real)

(assert (= (^ x (- (/ 3. 2.))) y))

(apply purify-arith :print-model-converter true)
