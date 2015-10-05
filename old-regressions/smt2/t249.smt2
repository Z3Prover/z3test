
; Copyright (c) 2015 Microsoft Corporation

(set-option :enable-assertions false)
(set-option :produce-models true)
(declare-fun q (Int) Bool)
(define-fun p1 ((z Int) (y Int)) Bool
  (ite (q y) (= z 0) (= z 1)))
(declare-const a Int)
(declare-const b Bool)
(assert (p1 a b)) ;; << TYPE ERROR b must be an Int
