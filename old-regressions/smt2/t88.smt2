
; Copyright (c) 2015 Microsoft Corporation


(set-option :produce-models true)
(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert (>= y 0))
(assert (>= z 0))
(assert (= (+ y x (* 2 z)) 20))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")

(set-option :produce-models true)
(declare-const x Real)
(declare-const y Real)
(declare-const z Real)

(assert (>= y 0.0))
(assert (>= z 0.0))
(assert (= (+ y x (* 2.0 z)) 20.0))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")

(set-option :produce-models true)
(declare-const x (_ BitVec 8))
(declare-const y (_ BitVec 4))
(declare-const z (_ BitVec 4))
(declare-fun f ((_ BitVec 16)) Int)
(declare-fun g ((_ BitVec 16)) Real)
(declare-const x1 Int)
(declare-const x2 Int)
(declare-const y1 Real)
(declare-const y2 Real)
(declare-const a1 (_ BitVec 8))
(declare-const a2 (_ BitVec 8))
(declare-fun h ((_ BitVec 8)) Int)

(assert (= (h (bvmul #x03 a1)) 0))
(assert (= (* x1 x2) 20))
(assert (= (* 10.0 y1) (g #x0001)))

(assert (= (f (concat x y z)) 0))
(apply elim-uncnstr :print-model-converter true)
(reset)

(simplify (bvmul #xab #x03))
(reset)
(echo "-----")

(set-option :produce-models true)
(declare-const x (_ BitVec 8))
(declare-fun p ((_ BitVec 5)) Bool)
(assert (p ((_ extract 6 2) x)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")

(set-option :produce-models true)
(declare-const x (_ BitVec 8))
(declare-fun p ((_ BitVec 5)) Bool)
(assert (p ((_ extract 4 0) x)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")


(set-option :produce-models true)
(declare-const x (_ BitVec 8))
(declare-fun p ((_ BitVec 5)) Bool)
(assert (p ((_ extract 7 3) x)))
(apply elim-uncnstr :print-model-converter true)
(reset)
(echo "-----")
