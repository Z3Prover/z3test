

(declare-const a1 (Array Int Int))
(declare-const a2 (Array Int Int))
(declare-const a3 (Array Int Int))
(declare-const v0 Int)
(declare-const v1 Int)
(declare-const v2 Int)

(simplify (store (store (store a1 2 v2) 0 v0) 1 v1))
(simplify (store (store (store a1 2 v2) 0 v0) 1 v1)
                 :sort-store true)

(declare-const i Int)

(simplify (select (store (store (store a1 2 v2) 0 v0) 1 v1) i))
(simplify (select (store (store (store a1 2 v2) 0 v0) 1 v1) i)
                 :expand-select-store true)
(simplify (select (store (store (store a1 2 v2) 0 v0) 1 v1) i)
                 :sort-store true
                 :expand-select-store true)
