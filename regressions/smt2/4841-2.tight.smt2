(set-logic QF_FP)
(declare-fun X () (_ FloatingPoint 11 53))
(declare-fun Y () (_ FloatingPoint 9 53))
(declare-fun XR () (_ FloatingPoint 9 53))
(assert (fp.lt (_ +zero 11 53) X))
(assert (fp.lt X (fp #b0 #b00000000000 #x0000000000002)))
(assert (= Y XR))
(assert (= XR ((_ to_fp 9 53) RNE X)))
(assert (= Y (_ +oo 9 53)))
(check-sat)