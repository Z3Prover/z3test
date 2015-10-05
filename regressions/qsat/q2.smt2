
; Copyright (c) 2015 Microsoft Corporation
(declare-const x Bool)
(assert  (exists ((y Bool)) (and (or x y) (not y))))
(apply qe2)
(reset)


(declare-const x Bool)
(assert  (exists ((y Bool)) (and (or x y) y)))
(apply qe2)
(reset)

(declare-const x Bool)
(assert  (exists ((y Bool)) (and (or x y) (or (not x) (not y)))))
(apply qe2)
(reset)

(declare-const x Bool)
(declare-const z Bool)
(assert  (exists ((y Bool)) (and (or x y) (or z (not y)))))
(apply qe2)
(reset)

(declare-const x Bool)
(declare-const z Bool)
(assert  (exists ((y Bool)) (and (or x y) (or z y))))
(apply qe2)
(reset)

(declare-const x Bool)
(declare-const z Bool)
(assert  (exists ((y Bool)) (and (or (not x) y) (or z y) (or (not y) x))))
(apply qe2)
(reset)
