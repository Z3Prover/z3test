
; Copyright (c) 2015 Microsoft Corporation


(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun q1 (Int Int) Bool)
(declare-fun q2 (Int Int) Bool)
(declare-fun q3 (Int Int) Bool)
(declare-fun r (Int Int) Bool)
(define-const M Int 4)
(define-fun B ((x Int)) Bool (and (<= 0 x) (<= x M)))

(assert (forall ((x1 Int) (x2 Int) (x3 Int) (x4 Int))
                (=> (and (B x1) (B x2) (B x3) (B x4))
                    (or (q1 x4 x2) (q2 x4 x3) (q3 x1 x2)))))

(apply miniscope)
;; (apply (then miniscope expand_bounded_quantifiers))
;; (apply (! expand_bounded_quantifiers :max-instances 10000))
