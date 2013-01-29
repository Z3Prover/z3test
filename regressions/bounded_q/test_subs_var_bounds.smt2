

(define-sort W () (_ BitVec 8))
(declare-fun p (Int Int Int) Bool)


(assert (forall ((x Int) (y Int) (z Int)) 
			(implies
				(and 
					(>= x 10) (<= x 11)
					(>= y x) (<= y 12)
					(>= z (+ x y)) (<= z 25))
				(p x y z))
		))

(apply (then simplify nnf expand_bounded_quantifiers))
