
; Copyright (c) 2015 Microsoft Corporation
(assert 
  (forall ((x Bool) (y Bool))
      (exists ((z Bool)) (and (= x z) y))))

(check-sat-using qsat)
(reset)

(assert 
  (forall ((x Bool))
      (exists ((z Bool)) (= x z))))

(check-sat-using qsat)
(reset)

(assert (forall ((x Bool)) true))
(apply qe2)
(reset)

(assert (exists ((x Bool)) true))
(apply qe2)
(reset)

(assert (forall ((x Bool)) false))
(apply qe2)
(reset)

(assert (exists ((x Bool)) false))
(apply qe2)
(reset)


;(declare-const x Bool)
;(assert (exists ((y Bool)) (= x y)))
