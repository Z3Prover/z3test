(set-option :model_validate true)
(set-info :status unsat)

(declare-const x (_ FloatingPoint 8 24))
(declare-fun f ((_ FloatingPoint 8 24)) Bool)

(assert (not
	(=
		(f (fp.add RNE x (_ +zero 8 24)))
		(f (fp.add RNE (_ +zero 8 24) x))
)))

(check-sat)
