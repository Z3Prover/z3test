;; Copyright (c) 2015 Microsoft Corporation

(set-info :status sat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

; satisfiable for all c1, c2, c3 according to FP theory description
; (see note about conversions to other sorts)

(declare-fun c1 () (_ BitVec 1))
(declare-fun c2 () (_ BitVec 8))
(declare-fun c3 () (_ BitVec 23))

(assert (= (fp.to_real (_ NaN 8 24)) (fp.to_real (fp c1 c2 c3))))

(check-sat)
(check-sat-using smt)
(exit)
