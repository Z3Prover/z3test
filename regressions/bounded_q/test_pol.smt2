(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun a () Int)

(assert (iff 
         (forall ((x Int)) (=> (and (>= x 0) (<= x 1)) (p x)))
         (p a)))

(apply expand_bounded_quantifiers)

