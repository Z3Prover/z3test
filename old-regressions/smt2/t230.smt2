
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)
(set-option :produce-proofs true)

(declare-const x Real)
(declare-const y Int)
(declare-const z Real)
(declare-const w Real)
(declare-fun f (Real) Real)

(assert (= (+ (* x x x x x x) (* z z z)) 3.))
(assert (= (f (* x x)) 10.))
(assert (= (* y y) 2))
(assert (= (f (^ (f 0.) 15.)) 3.))
(assert (= (f (^ (f 0.) 3.)) 10.))
(assert (< (^ w 20.) 10.))
(assert (> (^ w 3.) 1.))

(apply degree-shift :print-model-converter true)