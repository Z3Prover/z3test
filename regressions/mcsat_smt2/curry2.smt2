

(declare-fun f (Int Real Bool) Int)

(simplify (uncurry ((_ curry 1) (_ as-array f))))
(simplify (uncurry ((_ curry 2) (_ as-array f))))

(declare-const A (Array Int (Array Real Int Int)))

(dbg-sort (uncurry A))
(simplify ((_ curry 1) (uncurry A)))
(dbg-sort ((_ curry 1) (uncurry A)))
(simplify ((_ curry 2) (uncurry A)))
(dbg-sort ((_ curry 2) (uncurry A)))
(display (= A ((_ curry 2) (uncurry A))))

(declare-const B (Array Int Real Bool (Array Real Int Int)))
(dbg-sort B)
(dbg-sort (uncurry B))
(simplify ((_ curry 1) (uncurry B)))
(simplify ((_ curry 2) (uncurry B)))
(simplify ((_ curry 3) (uncurry B)))
(simplify ((_ curry 4) (uncurry B)))
(simplify ((_ curry 5) (uncurry B)))
(dbg-sort ((_ curry 4) (uncurry B)))
