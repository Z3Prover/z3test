(declare-fun a () Int)
(declare-fun b () Int)

(declare-fun pow256 () Int)
(assert (= pow256 115792089237316195423570985008687907853269984665640564039457584007913129639936))

(define-fun b2i ((x Bool)) Int (ite x 1 0))

(assert (and (<= 0 a) (< a pow256)))
(assert (and (<= 0 b) (< b pow256)))

(define-fun chop ((x Int)) Int (mod x pow256))

(assert
  (not
    (=
      (< (+ a b) pow256)
      (not (= (chop (+ (b2i (= b 0)) (b2i (> (chop (+ a b)) a)))) 0)) ; timeout
     ;(not (=       (+ (b2i (= b 0)) (b2i (> (chop (+ a b)) a)))  0)) ; unsat w/o chop
    )
  )
)

(check-sat) ; 