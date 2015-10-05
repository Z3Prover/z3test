
; Copyright (c) 2015 Microsoft Corporation


(declare-const x Int)
(declare-const y Int)
(declare-const c Int)

(set-option :produce-models true)

(assert (>= c 0))
(assert (= 0 (ite (= c 2) x y)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")


(declare-const x Int)
(declare-const y Int)
(declare-const p Bool)
(set-option :produce-models true)

(assert (>= x 0))
(assert (= 0 (ite p x y)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")

(declare-const x Int)
(declare-const y Int)
(declare-const p Bool)
(set-option :produce-models true)

(assert (>= y 0))
(assert (= 0 (ite p x y)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")

(declare-const x Int)
(declare-const y Int)
(declare-const p Bool)
(set-option :produce-models true)

(assert (>= y 0))
(assert (>= x 0))
(assert (= 0 (ite p x y)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")


(declare-const x Int)
(declare-const y Int)
(declare-const p Bool)
(declare-const q Bool)
(set-option :produce-models true)

(assert (>= y 0))
(assert (or p q))
(assert (= 0 (ite p x y)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")

(declare-const x Int)
(declare-const y Int)
(declare-const p Bool)
(declare-const q Bool)
(set-option :produce-models true)

(assert (>= x 0))
(assert (or p q))
(assert (= 0 (ite p x y)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")
