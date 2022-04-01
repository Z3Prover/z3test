(set-logic HORN)

(declare-fun P (Int  Int  Int) Bool)
(declare-fun Q (Int  Int) Bool)
(declare-fun R (Int  Int  Int) Bool)

(assert (forall ((x Int) (y Int) (z Int))
  (=> (and (Q x y) (= z 0) (<= 1 y))
      (P x y z))))

(assert (forall ((x Int) (y Int) (z Int))
  (=> (and (R 1 z y) (= x 0)) (Q x y))))

(assert (forall ((x Int) (y Int) (z Int))
  (=> (and (>= x (+ y))) (R x y z))))

(exit)
