
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)
(declare-const a (List Int))
(declare-fun p (Int) Bool)

(assert (p (head a)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----------")

(set-option :produce-models true)
(declare-const a (List Int))
(declare-fun p ((List Int)) Bool)

(assert (p (tail a)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----------")

(set-option :produce-models true)
(declare-const a (List Int))
(declare-fun p (Int) Bool)
(declare-fun q ((List Int)) Bool)

(assert (p (head a)))
(assert (q a))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----------")

(set-option :produce-models true)
(declare-const a (List Int))
(declare-fun p ((List Int)) Bool)
(declare-fun q ((List Int)) Bool)

(assert (p (tail a)))
(assert (q a))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----------")