
; Copyright (c) 2015 Microsoft Corporation

(declare-const x Real)
(declare-const y Real)
(declare-const z Real)

(assert (= (^ x (- (/ 3. 2.))) y))

(apply purify-arith)

(apply (! purify-arith :expand-power true))

(apply (! purify-arith :expand-power true :complete false))
