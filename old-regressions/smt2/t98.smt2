
; Copyright (c) 2015 Microsoft Corporation


(set-option :pp.flat-assoc false)
(set-option :pp.max-depth 20)

(declare-const a (_ BitVec 8))
(declare-const b (_ BitVec 8))
(declare-const c (_ BitVec 8))
(declare-const d (_ BitVec 8))
(declare-const e (_ BitVec 8))
(declare-fun p ((_ BitVec 8) (_ BitVec 8)) Bool)

(assert (p (bvadd #x01 a c e b d)
           (bvadd #x10 d c a e b)))
(apply (and-then simplify max-bv-sharing))
(reset)
(echo "----")

(declare-const a (_ BitVec 8))
(declare-const b (_ BitVec 8))
(declare-const c (_ BitVec 8))
(declare-const d (_ BitVec 8))
(declare-const e (_ BitVec 8))
(declare-fun p ((_ BitVec 8) (_ BitVec 8)) Bool)

(assert (p (bvadd a c e b d)
           (bvadd #x10 d c a e b)))
(apply (and-then simplify max-bv-sharing))
(reset)
(echo "----")

(declare-const a (_ BitVec 8))
(declare-const b (_ BitVec 8))
(declare-const c (_ BitVec 8))
(declare-const d (_ BitVec 8))
(declare-const e (_ BitVec 8))
(declare-fun p ((_ BitVec 8) (_ BitVec 8)) Bool)

(assert (p (bvadd #x01 a c #x02 e b a d)
           (bvadd #x10 d c a e b)))
(apply (and-then simplify max-bv-sharing))
(reset)
(echo "----")

(declare-const a (_ BitVec 8))
(declare-const b (_ BitVec 8))
(declare-const c (_ BitVec 8))
(declare-const d (_ BitVec 8))
(declare-const e (_ BitVec 8))
(declare-fun p ((_ BitVec 8) (_ BitVec 8)) Bool)

(assert (p (bvmul #x01 a c e b d)
           (bvmul #x10 d c a e b)))
(apply (and-then simplify max-bv-sharing))
(reset)
(echo "----")

(declare-const a (_ BitVec 8))
(declare-const b (_ BitVec 8))
(declare-const c (_ BitVec 8))
(declare-const d (_ BitVec 8))
(declare-const e (_ BitVec 8))
(declare-fun p ((_ BitVec 8) (_ BitVec 8)) Bool)

(assert (p (bvmul #x01 a c)
           (bvmul #x10 c a d)))
(apply (and-then simplify max-bv-sharing))
(reset)
(echo "----")

(declare-const a (_ BitVec 8))
(declare-const b (_ BitVec 8))
(declare-const c (_ BitVec 8))
(declare-const d (_ BitVec 8))
(declare-const e (_ BitVec 8))
(declare-fun p ((_ BitVec 8) (_ BitVec 8)) Bool)

(assert (p (bvor #x01 a c e b d)
           (bvor #x10 d c a e b)))
(apply (and-then simplify max-bv-sharing))
(reset)
(echo "----")

(declare-const a (_ BitVec 8))
(declare-const b (_ BitVec 8))
(declare-const c (_ BitVec 8))
(declare-const d (_ BitVec 8))
(declare-const e (_ BitVec 8))
(declare-fun p ((_ BitVec 8) (_ BitVec 8)) Bool)

(assert (p (bvxor #x01 a c e b d)
           (bvxor #x10 d c a e b)))
(apply (and-then simplify max-bv-sharing))
(reset)
(echo "----")

