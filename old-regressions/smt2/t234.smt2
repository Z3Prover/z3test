
; Copyright (c) 2015 Microsoft Corporation

(declare-const x Real)
(declare-const y Real)
(declare-const z Real)

(assert (= (^ x 0.) y))
(assert (= (^ z 0.) y))

(apply purify-arith)

(apply (! purify-arith :complete false))


