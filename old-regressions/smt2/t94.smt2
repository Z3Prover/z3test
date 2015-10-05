
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)
(declare-const a (List Int))
(declare-const v Int)
(declare-fun p ((List Int)) Bool)

(assert (p (insert v a)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----------")

(set-option :produce-models true)
(declare-const a (List Int))
(declare-const v Int)
(declare-fun p ((List Int)) Bool)

(assert (p (insert v a)))
(assert (p a))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----------")

(set-option :produce-models true)
(declare-fun p ((List Int)) Bool)
(assert (p nil))
(apply elim-uncnstr :print-model-converter true)
(echo "-----------")

