(set-logic QF_NIA)
(set-option :model_validate true)
(set-option :model true)
;(set-option :smt.arith.min true)
(declare-const v0 Bool)
(declare-const v1 Bool)
(declare-const v2 Bool)
(declare-const v3 Bool)
(declare-const v4 Bool)
(declare-const v5 Bool)
(declare-const v6 Bool)
(declare-const v7 Bool)
(declare-const v8 Bool)
(declare-const v9 Bool)
(declare-const v10 Bool)
(declare-const v11 Bool)
(declare-const v12 Bool)
(declare-const v13 Bool)
(declare-const i1 Int)
(declare-const i2 Int)
(declare-const i3 Int)
(declare-const i5 Int)
(declare-const v14 Bool)
(declare-const v15 Bool)
(declare-const v16 Bool)
(declare-const v17 Bool)
(declare-const v18 Bool)
(declare-const i6 Int)
(declare-const v19 Bool)
(declare-const i7 Int)
(declare-const v20 Bool)
(assert (or v8 (xor v3 v5 v13 v8 (=> v14 v12)) (xor v3 v5 v13 v8 (=> v14 v12)) v6 (distinct i2 (- i2)) v16 (= v5 v0 v14) (> (abs i3) 113)))
(assert (or (xor v2 v5 v13 v6 (not v1)) v8 (xor v2 v5 v13 v6 (not v1)) v17 (= v4 v8 v15 v9 v15) v2))
(assert (or v13 (= v5 v0 v14)))
(assert (or (=> v14 v12) v2 (distinct (- i1) 113)))
(assert-soft (or v2))
(assert-soft (or v5 (distinct (- i1) 113) (> (abs i3) 113) v16))
(assert-soft (or (= v5 v0 v14) (= v5 v0 v14) v6 (xor v2 v5 v13 v6 (not v1)) (> (abs i3) 113) (<= 57 i5) (= v4 v8 v15 v9 v15) (xor v2 v5 v13 v6 (not v1))))
(assert-soft (or (xor v2 v5 v13 v6 (not v1))))
(assert (or v5 (= v5 v0 v14)))
(assert (or (=> v14 v12) v16))
(assert-soft (or (= v5 v0 v14) v8))
(assert-soft (or (= v5 v0 v14)))
(assert (or v19 v13 v3))
(assert (or (= v4 v8 v15 v9 v15)))
(assert (or v3 v16 (= v4 v8 v15 v9 v15)))
(assert (or (< i1 11) v6))
(assert-soft (or v10))
(assert-soft (or (xor v2 v5 v13 v6 (not v1)) (= v4 v8 v15 v9 v15) v2 v17 v2 v16 (xor v2 v5 v13 v6 (not v1)) v5 v17))
(assert (or (= v4 v8 v15 v9 v15) v5 v16 (distinct i2 (- i2)) v19 (distinct i2 (- i2)) v10 v16 (> (abs i3) 113) v13 (distinct i2 (- i2)) (xor v3 v5 v13 v8 (=> v14 v12)) v19))
(assert (or (<= 57 i5) (xor v3 v5 v13 v8 (=> v14 v12)) (xor v2 v5 v13 v6 (not v1))))
(assert-soft (or v2 v19 (xor v3 v5 v13 v8 (=> v14 v12)) (xor v2 v5 v13 v6 (not v1))))
(assert (or (> (abs i3) 113) (distinct i2 (- i2)) v19 (< i1 11) v16))
(assert-soft (or (= v5 v0 v14) (= v5 v0 v14) v13 (<= 57 i5) v2 (= v4 v8 v15 v9 v15) (distinct (- i1) 113) (= v4 v8 v15 v9 v15) v17))
(assert (or (= v5 v0 v14)))
(assert (or v19))
(assert-soft (or v8 v8 v16 (= v4 v8 v15 v9 v15)))
(assert-soft (or (= v5 v0 v14) (=> v14 v12) v8 (> (abs i3) 113) (= v5 v0 v14) (=> v14 v12) (xor v3 v5 v13 v8 (=> v14 v12))))
(assert (or (> (abs i3) 113)))
(assert (or (= v5 v0 v14) (=> v14 v12) v6))
(assert (or (= v4 v8 v15 v9 v15) v8))
(assert (or v10))
(assert (or (distinct i2 (- i2)) (< i1 11)))
(assert (or (<= 57 i5) (> (abs i3) 113)))
(assert (or v2 (> (abs i3) 113)))
(assert (or (distinct (- i1) 113) (=> v14 v12)))
(assert (or (distinct (- i1) 113) (= v5 v0 v14) (distinct (- i1) 113) v8 v16 (distinct (- i1) 113) v19))
(assert (or v3))
(assert (or (xor v3 v5 v13 v8 (=> v14 v12)) (= v5 v0 v14)))
(assert (or (= v5 v0 v14) v10))
(assert (or (xor v3 v5 v13 v8 (=> v14 v12))))
(assert (or (<= 57 i5)))
(assert-soft (or (= v4 v8 v15 v9 v15) (= v4 v8 v15 v9 v15) v3 (< i1 11) v2 (distinct (- i1) 113)))
(assert-soft (or v13 (< i1 11) (xor v3 v5 v13 v8 (=> v14 v12)) v3 v13 v17))
(assert (or (> (abs i3) 113) v10 (=> v14 v12)))
(assert (or v3 v10))
(assert-soft (or v16))
(assert (or (xor v2 v5 v13 v6 (not v1)) v10 v8 (=> v14 v12)))
(assert (or v16 (xor v3 v5 v13 v8 (=> v14 v12)) v10 (xor v2 v5 v13 v6 (not v1)) (= v4 v8 v15 v9 v15)))
(assert (or (distinct i2 (- i2)) v3 v5 (= v5 v0 v14) v2))
(assert (or (< i1 11)))
(assert-soft (or (<= 57 i5)))
(assert (or v16))
(assert (or (= v5 v0 v14) v16 (> (abs i3) 113)))
(assert-soft (or v2))
(assert (or v17))
(assert-soft (or (> (abs i3) 113)))
(assert (or (distinct i2 (- i2))))
(assert (or v2))
(check-sat)
(exit)
