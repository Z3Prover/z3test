
; Copyright (c) 2015 Microsoft Corporation

(declare-const a (_ BitVec 16))
(declare-const b (_ BitVec 16))

(simplify (bvmul a b))
(simplify (bvmul b a))
(simplify (= (bvmul a b) (bvmul b a)))
(simplify (= (bvmul a b) (bvadd #x0000 (bvmul b a))))
