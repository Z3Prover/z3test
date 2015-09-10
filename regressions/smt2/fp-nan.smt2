(set-info :status sat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

(declare-fun X () (_ FloatingPoint 11 53))
(assert (= X (_ NaN 11 53)))

(check-sat)
(exit)
