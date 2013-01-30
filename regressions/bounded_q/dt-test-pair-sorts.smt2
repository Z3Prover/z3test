
(define-sort W () (_ BitVec 8))
(declare-datatypes () ((Pair (mk-Pair (first Int) (second Int)))))
(declare-fun p (Pair Int Int W) Bool)

(assert (forall ((y Int) (x Pair) (z Int) (b W)) 
			(=>
				(and (bvule b #x02)
				     (> y 30) (< y 33)
					 (>= z 30) (< z 32)
					 (>= (first x) 11) (<= (first x) 12)
				     (>= (second x) 1) (<= (second x) 2))
				(p x y z b))))

(apply (then nnf split_datatype_quantifiers (! simplify :ule-split false :arith-lhs true) expand_bounded_quantifiers))