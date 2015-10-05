
; Copyright (c) 2015 Microsoft Corporation


(declare-fun a () (Array Int Int))
(declare-fun i () Int)
(declare-fun v () Int)
(declare-fun f (Int Int) Int)

(simplify (select ((as const (Array Int Int)) 10) i))

(simplify (let ((a1 (store (store (store (store a 2 20) 3 30) 4 40) 5 50)))
                   (f (select a1 3) (f (select a1 5) (select a1 2)))))

(simplify (select (store a i v) i))

(declare-fun b () (Array Int Int Int))
(declare-fun j () Int)

(simplify (select (store b i j v) i j))
(simplify (select (store b i j v) j i))

(declare-fun w1 () Int)
(declare-fun w2 () Int)

(simplify (store (store b i j v) i j w1))
(simplify (store (store (store b i j v) i j w1) i j w2))
(simplify (store (store (store b i j v) j i w1) i j w2))

(simplify (store b i j (select b i j)))
(simplify (store a i (select a i)))
(simplify (store a i (select a j)))
(simplify (store b i j (select b j i)))


