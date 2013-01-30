(declare-fun p (Int) Bool)
(declare-fun a () Int)

(assert (forall ((x Int)) (=> (and (not (< x 0)) (<= x a) (not (> x 60))) (p x))))

(apply (! expand_bounded_quantifiers :max-instances 1000))

