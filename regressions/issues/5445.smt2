(set-option :sat.euf true)
(set-option :tactic.default_tactic smt)
(set-option :model_validate true)

(assert (forall ((x Int) (y Int)) (not (= y (* 2 x)))))
(check-sat)
(reset)

(assert (forall ((x Int) (y Int)) (= y (* 2 x))))
(check-sat)
(reset)

(declare-fun a () Real)
(declare-fun b () Real)
(declare-fun c () Real)
(declare-fun d () Real)
(declare-fun e () Real)
(declare-fun f () Real)
(declare-fun i () Real)
(assert (distinct (= c 0 0 e 0 f d)))
(assert
 (not
  (exists ((g Real))
   (=>
    (distinct
     (not
      (exists ((h Real))
       (=> (= c 0) (= (= (= h 0) (= 0 c)) (= b 0)))))
     (= 0 i a))
    (= 0 d)))))
(check-sat)
(reset)

(declare-fun a () Real)
(assert
 (exists ((b Real))
  (forall ((c Real))
   (exists ((d Real))
    (>=
     (*
      (ite
       (exists ((b Real))
        (forall ((c Real))
         (exists ((d Real))
          (< (+ (* 68 c) a) 0 (* d b)))))
       (* 68 c) 3)
      (/ 2 (* 2 d)) d 2 b d)
     1)))))
(check-sat)
(reset)


