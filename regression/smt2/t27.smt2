

(simplify (distinct 0 1 2 3 4 5 6))
(declare-fun a () Int)
(simplify (distinct 0 1 2 3 a 4 5 6))
(simplify (distinct a 0 1 2 3 4 5 6))
(simplify (distinct 0 1 2 3 4 5 6 a))

