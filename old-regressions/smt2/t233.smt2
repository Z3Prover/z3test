
; Copyright (c) 2015 Microsoft Corporation

(declare-const x Real)
(declare-const y Real)
(declare-const z Real)

(assert (= (/ x y) z))

(apply purify-arith)

(apply (! purify-arith :complete false))

(assert (= (^ x (/ 2. 3.)) y))

(apply purify-arith)

(assert (= (^ x (/ 3. 2.)) z))

(apply purify-arith)
