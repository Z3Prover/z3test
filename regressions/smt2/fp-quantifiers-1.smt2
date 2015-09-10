(set-info :status sat)

(assert (forall ((x (_ FloatingPoint 5 11)))
		  (exists ((y (_ FloatingPoint 5 11)))
			(=> (= x y) (fp.eq x y)))))

(check-sat)

