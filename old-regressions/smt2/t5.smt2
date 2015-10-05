
; Copyright (c) 2015 Microsoft Corporation

(set-option :print-success true)

(declare-datatypes (T) ((Stream (seq (val T) (rest Stream)))))

(declare-const s (Stream Int))

(declare-datatypes (T) ((Tree (leaf (val T)) (node (children TreeList)))
                        (TreeList (nil) (cons (car Tree) (cdr TreeList)))))

(declare-const t1 (Tree Int))
(declare-const t2 (Tree Int))
(declare-const t3 (Tree (Tree Int)))
(declare-const t4 (Tree (Tree Int)))

(set-option :produce-models true)

(assert (distinct t3 t4))
(assert (is-node t3))
(assert (is-node t4))
(check-sat)
(get-model)

(reset)

(declare-const t1 (Tree Int))
(assert (= t3 t4))

(define-sort Set (T) (Array T Bool))

(define-fun Z () (Set Int) ((as const (Set Int)) true))

(declare-const s (Set Int))

(assert (= s (store Z 10 false)))
(get-model)
(check-sat)
(get-model)
