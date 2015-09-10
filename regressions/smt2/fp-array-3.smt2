(set-info :status sat)

(declare-fun A () (Array Int (_ FloatingPoint 53 11)))

(assert (fp.lt (select A 1) (select A 0)))

(check-sat)
(exit)
