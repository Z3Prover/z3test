(declare-sort S 0)
(declare-sort T 0)

(declare-datatypes () ((Pair (mk-Pair (first Int) (second Int)))
                       (Unit (mk-Unit))
                       
))

(declare-fun p (Int Pair) Bool)

(assert (forall ((y Int))
	(or (not (>= y 0)) (not (<= y 3))
            (forall ((x Pair) (z Int)) 
                    (=>
                     (and (>= z 0) (< z 4)
                          (>= (first x) 0) (<= (first x) 2)
                          (>= (second x) 1) (<= (second x) 2))
                     (p y x))))))

(apply (then split_datatype_quantifiers expand_bounded_quantifiers))