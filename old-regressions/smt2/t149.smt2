
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)
(declare-sort S 0)
(declare-datatypes (T) ((lst nil (cons (car T) (cdr lst)))))
(declare-const l1 (lst S))
(declare-const l2 (lst S))
(assert (distinct l1 l2))
(check-sat)
(get-model)