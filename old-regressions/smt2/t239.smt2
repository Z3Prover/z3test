
(set-option :produce-models true)
(declare-const x Real)
(declare-const y Real)
(declare-const z Real)

(assert (= (/ 1. x) y))
(assert (not (= x 0.)))

(apply purify-arith :print-model-converter true)
(apply (and-then purify-arith propagate-values) :print-model-converter true)
