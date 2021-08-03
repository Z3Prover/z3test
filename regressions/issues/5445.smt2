(set-option :sat.euf true)
(set-option :tactic.default_tactic smt)
(set-option :model_validate true)


(set-info :status sat)
(declare-fun r (Int Int) Bool)
(assert
 (forall ((z Int) (u Int) )(! (let (($x16 (r u z)))
 (let (($x14 (< (* 3 u) 11)))
 (let (($x11 (>= u 0)))
 (let (($x10 (< z 3)))
 (let (($x8 (> z 0)))
 (let (($x15 (and $x8 $x10 $x11 $x14)))
 (xor $x15 $x16))))))) :qid k!4))
 )
(check-sat)
(reset)

(set-info :status unknown)
(declare-fun v2 () Bool)
(declare-fun v6 () Bool)
(declare-fun arr () (Array Bool Bool))
(assert (select arr (and (and (= arr (store arr v2 v6)) (= (store arr v2 v6) arr)) (not (and (= arr (store arr v2 v6)) (= (store arr v2 v6) arr))))))
(apply sat-preprocess)
(reset)

(declare-const x Bool)
(declare-fun n () Real)
(assert (and (forall ((j Real)) (and x (> 1.0 (+ j (* j (- n))))))))
;(check-sat)
(reset)


(exit)

(set-info :status unsat)
(assert (forall ((s (_ BitVec 3))) (= s (bvor s (bvand (bvnot s) (_ bv1 3))))))
(check-sat)
(reset)

(set-info :status unsat)
(declare-sort U)
(assert (not (=> (and (forall ((x U)) false)) false)))
(check-sat)
(reset)

(set-info :status unsat)
(declare-fun s () (Array Int Bool))
(declare-fun s1 () (Array Int Bool))
(assert (distinct ((_ map and) s1 s) ((_ map not) ((_ map or) ((_ map not) s1) ((_ map not) s)))))
(check-sat)
(reset)


(set-info :status sat)
(declare-fun A () (Set Int))
(declare-fun D () (Set Int))
(assert (= D (setminus A D)))
(check-sat-using (then simplify smt))
(reset)

(set-info :status sat)
(assert (forall ((a Real)) (exists ((b Real)) (= b (* a b)))))
(check-sat)
(reset)


(set-info :status unknown)
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

(set-info :status unsat)
(assert (forall ((x Int) (y Int)) (not (= y (* 2 x)))))
(check-sat)
(reset)

(set-info :status unsat)
(assert (forall ((x Int) (y Int)) (= y (* 2 x))))
(check-sat)
(reset)


(exit)

; these (after fixes) take long time or are not directly relevant for sat.euf:

(set-option :rewriter.flat false)
(set-option :rewriter.hoist_mul true)
(set-option :nlsat.inline_vars true)
(declare-fun a () Real)
(declare-fun b () Real)
(declare-fun c () Real)
(assert (> (+ (* b (+ (* a (/ (- 1) 6)) (* b b a (/ 1 120))))) (* a (* a (+ (/ 27 a))))))
(assert (> (* b (- (* b (* b (/ 1 120))) (/ 1 6))) a c))
(assert (> c 0))
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

(set-option :rewriter.eq2ineq true)
(declare-fun new-h (Int) Int)
(assert (forall ((n Int)) (exists ((p Int)) (and (= 0 p) (not (forall ((x1 Int) (x2 Int)) (let (($x41 (= (new-h x1) (new-h x2))))))) (forall ((x1 Int) (x2 Int)) (or (>= x1 x2) (= (new-h x2) (new-h (new-h x1)))))))))
(check-sat)
(set-option :rewriter.eq2ineq false)
(reset)

(set-info :status unsat)
(declare-const x Bool)
(declare-fun n () Real)
(assert (and (forall ((j Real)) (and x (> 1.0 (+ j (* j (- n))))))))
(check-sat)
(set-info :status unknown)
(reset)

