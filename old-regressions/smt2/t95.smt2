
; Copyright (c) 2015 Microsoft Corporation

(set-option :produce-models true)
(set-option :pp.max-depth 100)

(declare-const x (_ BitVec 2))
(declare-const y (_ BitVec 2))
(declare-const z (_ BitVec 4))

(assert (= z (concat x y)))
(apply bv1-blast :print-model-converter true)
(reset)
(echo "----")

(declare-const x (_ BitVec 1))
(declare-const y (_ BitVec 1))
(declare-const z (_ BitVec 2))

(assert (= z (concat x y)))
(apply bv1-blast :print-model-converter true)
(reset)
(echo "----")

(declare-const x (_ BitVec 4))
(declare-const z (_ BitVec 2))

(assert (= z ((_ extract 2 1) x)))      
(apply bv1-blast :print-model-converter true)
(reset)
(echo "----")

(declare-const x (_ BitVec 4))
(declare-const z (_ BitVec 3))

(assert (= z ((_ extract 3 1) x)))      
(apply bv1-blast :print-model-converter true)
(reset)
(echo "----")


(declare-const x (_ BitVec 2))
(declare-const y (_ BitVec 2))
(declare-const z (_ BitVec 2))
(declare-const c Bool)

(assert (= z (ite c x y)))
(apply bv1-blast :print-model-converter true)
(reset)
(echo "----")

(declare-const x (_ BitVec 2))
(declare-fun f ((_ BitVec 2)) (_ BitVec 2))

(assert (= x (f x)))
(apply bv1-blast :print-model-converter true)
(reset)
(echo "----")

(declare-const x (_ BitVec 2))
(declare-fun f ((_ BitVec 2)) (_ BitVec 2))

(assert (= x (f (f x))))
(apply bv1-blast :print-model-converter true)
(reset)
(echo "----")

(declare-const x (_ BitVec 2))
(declare-const y (_ BitVec 2))

(assert (= x (bvor x y)))
(apply bv1-blast :print-model-converter true)
(apply (or-else bv1-blast 
                skip)
       :print-model-converter true)
(reset)
(echo "----")

(declare-fun f ((_ BitVec 2)) (_ BitVec 2))

(assert (forall ((x (_ BitVec 2))) (= (f x) x)))
(apply bv1-blast :print-model-converter true)
(apply (or-else bv1-blast
                skip)
       :print-model-converter true)
(reset)
(echo "----")
