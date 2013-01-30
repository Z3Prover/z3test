

(declare-datatypes (T) (
	(Pair (mk-Pair (first T) (second Int)))))
(declare-fun p ((Pair (Pair Int))) Bool)

(assert (forall ((x (Pair (Pair Int)))) 
			(=>
				(and (>= (first (first x)) 0) (<= (first (first x)) 12)
					 (>= (second (first x)) 3) (<= (second (first x)) 4)
				     (>= (second x) 1) (<= (second x) 2)
					 
					 )
				(p x))))

(apply (then nnf split_datatype_quantifiers split_datatype_quantifiers simplify expand_bounded_quantifiers))