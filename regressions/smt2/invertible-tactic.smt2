; Copyright (c) 2018 Microsoft Corporation
; unit tests for reduce-invertible tactic

(set-option :model_validate true)
(declare-const x (_ BitVec 32))
(declare-const y (_ BitVec 32))
(declare-const z (_ BitVec 32))
(assert (= (bvadd x y) (bvadd y z z)))
(apply reduce-invertible)
(reset)


(assert (forall ((b (_ BitVec 8))) (exists ((a (_ BitVec 8))) (= a b))))
(apply reduce-invertible)
(reset)

(declare-const x (_ BitVec 4))
(declare-const y (_ BitVec 4))
(declare-const z (_ BitVec 4))


(assert (= (bvmul x y) (bvmul y z z)))
(apply reduce-invertible)
(reset)

(declare-const x (_ BitVec 4))
(declare-const y (_ BitVec 4))
(declare-const z (_ BitVec 4))

(assert (= (bvxor x y) (bvmul y z z)))
(apply reduce-invertible)
(check-sat-using (then reduce-invertible smt))
(reset)

