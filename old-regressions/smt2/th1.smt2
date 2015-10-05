
; Copyright (c) 2015 Microsoft Corporation


(set-option :auto-config true)
(set-option :display-installed-theories true)
(declare-fun f (Int) Int)
(declare-const x Int)
(assert (= x 0))
(assert (= (f x) (f 1)))
(check-sat)

(reset)

(set-option :auto-config true)
(set-option :display-installed-theories true)
(declare-fun f (Int) Int)
(declare-const A (Array Int Int))
(declare-const x Int)
(assert (= x 0))
(assert (= (f x) (f 1)))
(check-sat)

(reset)

(set-option :auto-config true)
(set-option :display-installed-theories true)
(declare-fun f (Int) Int)
(declare-const A (Array Int Int))
(declare-const x Int)
(assert (= x 0))
(assert (= (select A x) 0))
(assert (= (f x) (f 1)))
(check-sat)

(reset)

(set-option :auto-config true)
(set-option :display-installed-theories true)
(declare-fun f (Int) Int)
(declare-const A (Array Int Int))
(declare-const x Int)
(declare-const y Int)
(assert (or (<= x 10) (>= x 20)))
(assert (or (<= y x)  (>= y (+ x 1))))
(check-sat)

