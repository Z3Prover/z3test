
; Copyright (c) 2015 Microsoft Corporation


(set-option :produce-models true)
(declare-const a (Array Int Int))
(declare-const i Int)
(declare-fun p (Int) Bool)

(assert (>= (select a i) 0))
(assert (p i))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "----")

(set-option :produce-models true)
(declare-const a (Array Int Int))
(declare-const i Int)
(declare-fun p (Int) Bool)
(declare-fun q ((Array Int Int)) Bool)

(assert (>= (select a i) 0))
(assert (p i))
(assert (q a))

(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "----")

(set-option :produce-models true)
(declare-const a (Array Int Int))
(declare-const i Int)
(declare-fun p (Int) Bool)
(declare-fun q ((Array Int Int)) Bool)
(declare-const v Int)

(assert (q (store a i v)))
(assert (p i))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "----")

(set-option :produce-models true)
(declare-const a (Array Int Int))
(declare-const i Int)
(declare-fun p (Int) Bool)
(declare-fun q ((Array Int Int)) Bool)
(declare-const v Int)

(assert (q (store a i v)))
(assert (p i))
(assert (p v))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "----")
