
; Copyright (c) 2015 Microsoft Corporation

(set-option :pp.max-depth 100)
(declare-fun q (Int) Bool)
(declare-fun f (Int) Int)


(assert (forall ((z Int)) (=> (and (< (f z) z) (>= 3 z)) (not (q z)))))


(apply normalize_bounded_quantifiers)

