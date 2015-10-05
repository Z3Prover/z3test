
; Copyright (c) 2015 Microsoft Corporation


(set-option :produce-proofs true)

(simplify (+ 3 2))
(echo "--------")
(declare-const b Bool)
(simplify (and (> (+ 3 2) 0) b)
          :print-proofs true)
(echo "--------")
(declare-fun p (Int) Bool)
(simplify (forall ((x Int)) 
                  (p (+ x 2 3)))
          :print-proofs true)
(echo "--------")
(declare-const a (Array Int Int))
(simplify (select (store (store a 0 10) 1 11) 2)
          :print-proofs true) 