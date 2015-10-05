
; Copyright (c) 2015 Microsoft Corporation


(declare-const b Int)
(declare-const a Int)
(declare-fun f (Int Int) Int)

(dbg-lt a b)
(dbg-lt b a)
(dbg-lt (f a (f b a)) (f a (f a b)))
(dbg-lt (f a (f a a)) (f a (f b b)))
(declare-const c Real)
(dbg-lt a c)

(declare-fun f (Int Int) Real)

(declare-sort A)

(declare-fun f (Int Int) A)

(dbg-lt ((as f Int) a a) ((as f Real) a a))
(dbg-lt ((as f Int) a a) ((as f A) a a))
(dbg-lt ((as f A) a a) ((as f Int) a a))

(declare-fun g (Int Int) Int)

(dbg-lt (g a (g a (g a (g a a)))) (g a (g a (g b a))))
(dbg-lt (g a (g a (g a (g a a)))) (g a (g a (g a (g b a)))))
(dbg-lt 0 1)
(dbg-lt 10 2)
(dbg-lt (- 10) 2)
(dbg-lt 1 10000)

(simplify (= (forall ((x Int)) (< x 0))
             (forall ((y Int)) (< y 0))))

(dbg-lt (forall ((x Int)) (< x 0)) (forall ((y Int)) (< y 0)))
(dbg-lt (forall ((x Int)) (! (< x 0) :pattern ((< x 0)))) (forall ((y Int)) (< y 0)))
(dbg-lt (forall ((y Int)) (< y 0)) (forall ((x Int)) (! (< x 0) :pattern ((< x 0)))))
