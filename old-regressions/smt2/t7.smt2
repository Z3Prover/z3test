
; Copyright (c) 2015 Microsoft Corporation


(define-sort Set (T) (Array T Bool))

(declare-const s1 (Set T))
(declare-const s1 (Set (List Int)))
(declare-const s2)
(declare-const s2 (Set (List Int)))
(declare-const s3 (Set (List Int)))
(assert (distinct s1 s2 s3))
(set-option :produce-models true)
(assert (= s1 ((_ map and) s2 s3)))
(assert (distinct s1 ((as const (Set (List Int))) false)))
(set-option :model-compact true)
(check-sat)
(get-value (s1 s2))
(get-value ((select s1 nil) (select s2 nil)))
