(set-logic QF_LIA)
(set-option :model_validate true)
(set-option :model true)
(declare-const v0 Bool)
(declare-const v1 Bool)
(declare-const v2 Bool)
(declare-const v6 Bool)
(declare-const v7 Bool)
(declare-const v8 Bool)
(declare-const v9 Bool)
(declare-const v11 Bool)
(declare-const v13 Bool)
(declare-const v14 Bool)
(declare-const i2 Int)
(declare-const v16 Bool)
(declare-const i4 Int)
(declare-const v20 Bool)
(assert (or v14 (<= 75 i2) (= i4 13)))
(assert (or (= i4 13) (or v0 v6 v11 v16 v16 v16 (xor v9 v9 v13 v14) (distinct v6 v7 v9 v13 v8 v2 v16 v8) (<= 75 13) (xor v9 v9 v13 v14)) v20))
(assert-soft (or (<= 75 i2) (or v0 v6 v11 v16 v16 v16 (xor v9 v9 v13 v14) (distinct v6 v7 v9 v13 v8 v2 v16 v8) (<= 75 13) (xor v9 v9 v13 v14)) v14))
(assert-soft (or (= i4 13) (or v0 v6 v11 v16 v16 v16 (xor v9 v9 v13 v14) (distinct v6 v7 v9 v13 v8 v2 v16 v8) (<= 75 13) (xor v9 v9 v13 v14)) v20))
(assert (or (<= 75 i2) v20 v20))
(check-sat)