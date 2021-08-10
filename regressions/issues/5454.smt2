(set-option :sat.euf true)
(set-option :tactic.default_tactic smt)
(set-option :model_validate true)


(declare-fun a () Real)
(declare-fun b () Real)
(declare-fun c () Real)
(declare-fun d () Real)
(assert
 (forall ((e Real))
  (or (<= c (* a c))
   (and (< 0.0 (/ 2.0 e))
    (=
     (forall ((e Real))
      (not (forall ((e Real)) (< 0.0 d))))
     (=>
      (and (< 0.0 d)
       (forall ((e Real)) (< 0.0 (/ 2.0 e b))))
      (forall ((e Real)) (= a 0.0))))))))
(assert (forall ((f Real)) (> 0.0 (* a c))))
(check-sat)
(reset)

(declare-fun a () Int)
(assert (<= (- a a) 0 (div a 0)))
(check-sat)
(reset)




(declare-fun symmetric ((Array Int (Array Int Real)) Int) Bool)
(assert (forall ((?n Int) (?a (Array Int (Array Int Real)))) 
   (= (symmetric ?a ?n) (forall ((?i Int) (?j Int)) (or (< 1 ?j) (not (= ?i ?n)) (= (select (?a ?i) ?j) (select (?a ?j) ?i)))))))
(check-sat)
(reset)
(exit)

(declare-fun RM2 () RoundingMode)
(assert (= RM2 RM2))
(check-sat)
(reset)


(set-option :sat.branching.heuristic chb)
(declare-fun A () (Array (_ FloatingPoint 2 3) (_ FloatingPoint 2 2)))
(declare-fun A2 () (Array (_ FloatingPoint 2 3) (_ FloatingPoint 2 2)))
(assert (and (not (= A A2)) (= (select A (_ +oo 2 3)) (select A (_ -oo 2 3)))))
(check-sat)
(reset)

(exit)
(declare-fun y () Int)
(declare-fun c () (Seq Int))
(declare-fun b () (Seq Int))
(assert (forall ((x Int)) (and (= (seq.nth c y) (seq.nth c 0)) (not (= (seq.nth c x) (seq.nth b x))))))
(check-sat)
(reset)
