; Copyright (c) 2015 Microsoft Corporation
; Test basic finite set operations

(declare-const s (FiniteSet Int))
(declare-const t (FiniteSet Int))
(declare-const x Int)
(assert (not (= s t)))
(assert (= (set.union s s) t))
(apply simplify)

(reset)

(declare-const x Int)
(assert (= (as set.empty (FiniteSet Int)) (set.singleton x)))
(apply simplify)
