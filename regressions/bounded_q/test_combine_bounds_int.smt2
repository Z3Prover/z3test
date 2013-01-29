(declare-fun p (Int) Bool)
(declare-fun a () Int)

(assert (forall ((x Int)) (=> (and (not (< x 0)) (<= x a) (not (> x 60))) (p x))))


(apply (then (! simplify :arith-lhs true) nnf (! expand_bounded_quantifiers :max-instances 10)))

