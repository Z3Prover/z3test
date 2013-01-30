(define-sort W () (_ BitVec 8))
(declare-fun p (Int Int) Bool)
(declare-fun q (Int) Bool)
(declare-fun a () Int)
(declare-fun b () Int)

(assert (forall ((x Int) (y Int)) 
                (=> (and 
                     (>= x 0) (<= x a)
                     (>= y 0) (<= y (+ (* 3 x) b)))
                    (p x y))
                ))

(apply expand_bounded_quantifiers)