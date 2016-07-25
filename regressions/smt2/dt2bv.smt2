(declare-datatypes () ((PartID (P1) (P0) (P3))))
(declare-fun n3_p () PartID)
(declare-fun n2_p () PartID)
(declare-fun n1_p () PartID)
(declare-fun n0_p () PartID)
(declare-fun imbalance () Int)
(assert (let ((a!1 (+ 0
              (ite (= n0_p P0) 1 0)
              (ite (= n1_p P0) 1 0)
              (ite (= n2_p P0) 1 0)
              (ite (= n3_p P0) 1 0)))
      (a!2 (+ 0
              (ite (= n0_p P1) 1 0)
              (ite (= n1_p P1) 1 0)
              (ite (= n2_p P1) 1 0)
              (ite (= n3_p P1) 1 0))))
(let ((a!3 (- (ite (and true (>= a!1 a!2)) a!1 a!2)
              (ite (and true (<= a!1 a!2)) a!1 a!2))))
  (= imbalance a!3))))

(assert (is-P1 n0_p))
(assert (is-P3 n0_p))

(assert (forall ((x PartID) (y Int) (z Bool))
    (=> z (= x P0))))

(apply dt2bv)