

(declare-datatypes () (
	(Enum A B C D (E (es Int)) F)
))
(declare-fun p (Enum Int) Bool)

(assert (forall ((x Int) (e Enum)) 
			(=>
				(and (>= x 0) (<= x 2))
				(p e x))))

(apply (then nnf split_datatype_quantifiers simplify expand_bounded_quantifiers))