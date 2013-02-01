
(declare-sort U 0)
(declare-fun p (U U Int) Bool)
(declare-fun a () U)
(declare-fun b () U)
(declare-fun c () U)
(declare-fun d () U)

(assert (forall ((x U)) (or (= x a) (= x d))))
(assert (forall ((x U)) (or (= x a) (= x b) (= x c))))
(assert (forall ((x U) (y U) (z Int)) 
			(=> (and (>= z 0) (< z 5))
			(p x y z))))

(apply expand_bounded_quantifiers)