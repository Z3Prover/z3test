(set-logic HORN)

(declare-fun P1 (Int) Bool)
(declare-fun P2 (Int  Int) Bool)
(declare-fun P3 (Int  Int) Bool)
(declare-fun P4 (Int  Int  Int  Int) Bool)
(declare-fun P5 (Int  Int) Bool)
(declare-fun P6 (Int  Int  Int) Bool)

(assert (not (exists ((x0 Int)) (P1 x0))))

(assert (forall ((x0 Int) (x1 Int)) (=> (P2 x1 0) (P1 x0))))

(assert (forall ((x0 Int) (x4 Int) (x3 Int) (x1 Int) (x2 Int))
  (=> (and (P3 x3 x4)
           (P6 1 x1 x2)
           (= x0 10000))
      (P2 x0 x4))))
      
(assert (forall ((x3 Int) (x4 Int) (var16 Int))
  (=> (and (P4 x3 var16 0 x4)
           (P5 x3 var16)
           (<= 1 var16))
      (P3 x3 x4))))
      
(assert (forall ((x3 Int) (x4 Int) (x1 Int) (x2 Int) (x0 Int))
  (=> (and (P6 1 x0 x4) (= x3 0))
      (P4 x3 x4 x1 x2))))
      
(assert (forall ((x0 Int) (x2 Int) (x1 Int))
  (=> (and (= x0 0)) (P5 x0 x2))))
  
(assert (forall ((x1 Int) (x2 Int) (x0 Int))
  (=> (and (= x0 0)) (P6 x1 x2 x0))))

(exit)
