(set-option :sat.euf true)
(set-option :tactic.default_tactic smt)
(set-option :model_validate true)


(set-option :smt.ematching false)
(declare-fun P (Int) Bool)
(declare-fun R (Int) Bool)
(declare-fun Q (Int) Bool)
(assert (and (forall ((x Int)) (R x)) (or (= P R) (and (distinct Q R)))))
(check-sat)
(reset)
(declare-sort S$t$type)
(declare-sort resource$type)
(declare-datatypes ((BOOL 0)) (((Truth))))
(declare-fun S$cardinality (S$t$type) Int)
(declare-fun count$1 () (Array resource$type Int))
(declare-fun valid$1 () (Array resource$type BOOL))
(assert (forall ((handles (Array resource$type S$t$type))) (exists ((handles$1 (Array resource$type S$t$type))) (forall ((count (Array resource$type Int))) (forall ((valid (Array resource$type BOOL))) (let (($x308 (not (or (not (forall ((r resource$type)) (or (= Truth (valid r)) (= (count r) (S$cardinality (handles r)))))) (forall ((r resource$type)) (or (not (= Truth (select valid$1 r))) (= (select count$1 r) (S$cardinality (handles$1 r)))))))))))))))
(check-sat)
(reset)


(declare-datatypes ((a 0)) (((e) (h (i (_ BitVec 1))))))
(declare-fun j (a) Bool)
(assert (forall ((m a)) (or (j m) (not ((_ is h) m)))))
(check-sat)
(reset)

(declare-fun a () (Array Int Int))
(declare-fun b () Int)
(declare-fun r () Int)
(declare-fun c () Int)
(declare-fun d () Int)
(declare-fun s () Int)
(declare-fun e () Int)
(declare-fun f () Int)
(declare-fun t () Int)
(declare-fun u () Int)
(declare-fun g () Int)
(declare-fun h () Int)
(declare-fun v () Int)
(declare-fun i () Int)
(declare-fun w () Int)
(declare-fun x () Int)
(declare-fun j () Int)
(declare-fun k () Int)
(declare-fun l () Int)
(declare-fun m () Int)
(declare-fun n ((Array Int Int) (Array Int Int)) Int)
(assert (not (= k m)))
(assert (not (= k l)))
(assert (= g l))
(assert (not (= g g i)))
(assert (not (= g v)))
(assert (let ((o (store (store (store (store (store (store (store
  (store (store (store a g 1) v r) i c) w d) x s) j e) k f) l t) m u)
  h b))(p (store (store (store (store (store (store (store (store
  (store (store a k f) v r) j e) w d) h b) x s) m u) g 1) i c) l t)))
  (let ((q (n o p))) (not (= q (p q))))))
(check-sat)
(reset)


(declare-fun a () (_ BitVec 32))
(declare-fun b () (_ BitVec 32))
(declare-fun c () (Array (_ BitVec 32) (_ BitVec 8)))
(declare-fun d () (Array (_ BitVec 32) (_ BitVec 8)))
(declare-fun f () (Array (_ BitVec 32) (_ BitVec 8)))
(declare-fun e () (_ BitVec 32))
(declare-fun h () (_ BitVec 32))
(declare-fun g () (_  BitVec 1))
(assert (= (ite (= g (ite (= f (store (store (store (store d (bvadd (_
   bv3 32)) ((_ extract 7 0) (bvlshr e (_ bv24 32)))) (bvadd (_ bv2
   32)) ((_ extract 7 0) (bvlshr e (_ bv16 32)))) a ((_ extract 7 0)
   (bvlshr e (_ bv8 32)))) (bvadd a) ((_ extract 7 0) e))) (_ bv1 1)
   (_ bv0 1))) (_ bv1 1) (_ bv0 1)) (ite (= d (store (store (store
   (store c (bvadd b (_ bv3 32)) ((_ extract 7 0) (bvlshr h (_ bv24
   32)))) (bvadd (_ bv2 32)) ((_ extract 7 0) (bvlshr h (_ bv16 32))))
   b ((_ extract 7 0) (bvlshr h (_ bv8 32)))) (bvadd (_ bv0 32)) ((_
   extract 7 0) h))) (_ bv1 1) (_ bv0 1))))
(check-sat)
(reset)












; -----------
(set-info :status unsat)
(assert (<= (- 0 (- 1)) (ite (exists ((a Real)) (= a 0)) 0 1)))
(check-sat)
(reset)
(set-info :status unknown)





;(set-option :smt.arith.reflect false)
(assert (<= (* (* (* 0 0) 0) 0) 0))
(check-sat)
(reset)

(declare-fun a ((Array Int (Array Int Real)) (Array Int (Array Int Real))) (Array Int (Array Int Real)))
(assert (forall ((b Int) (c Int) (d (Array Int (Array Int Real))) (g (Array Int (Array Int Real))) (e Int)) (let ((f (a d g))) (= (<= c e) (distinct (select (f b) c) (select (f c) b))))))
(check-sat)
(reset)

(declare-fun a () (Array (_ BitVec 32) (_ BitVec 8)))
(declare-fun b () (Array (_ BitVec 32) (_ BitVec 8)))
(declare-fun c () (Array (_ BitVec 32) (_ BitVec 8)))
(declare-fun d () (_ BitVec 1))
(declare-fun e () (_ BitVec 1))
(declare-fun f () (_ BitVec 1))
(declare-fun x () (_ BitVec 1))
(declare-fun g () (_ BitVec 1))
(declare-fun h () (_ BitVec 1))
(declare-fun i () (_ BitVec 1))
(declare-fun j () (_ BitVec 1))
(declare-fun k () (_ BitVec 32))
(declare-fun l () (_ BitVec 32))
(declare-fun m () (_ BitVec 32))
(declare-fun n () (_ BitVec 32))
(declare-fun o () (_ BitVec 32))
(declare-fun p () (_ BitVec 32))
(declare-fun q () (_ BitVec 32))
(declare-fun r () (_ BitVec 32))
(declare-fun s () (_ BitVec 32))
(assert (let ((t (bvadd (_ bv3 32))) (u (bvadd (_ bv2 32)))(v (bvadd
    (_ bv134540500 32)))(w (bvadd (_ bv134540500 32)))) (= (ite (= j
    (ite (= k l) (_ bv1 1) (_ bv0 1))) (_ bv1 1) (_ bv0 1)) (bvand
    (ite (= i (ite (= l (bvor (bvor (bvor (concat (_ bv0 24) (select c
    (bvadd n))) (bvshl (concat (_ bv0 24) (select c (bvadd n (_ bv1
    32)))) (_ bv8 32))) (bvshl (concat (_ bv0 24) (select c (bvadd
    n))) (_ bv16 32))) (bvshl (concat (_ bv0 24) (select c (bvadd n (_
    bv3 32)))) (_ bv24 32)))) (_ bv1 1) (_ bv0 1))) (ite (= h (ite (=
    c (store (store (store (store b t ((_ extract 7 0) (bvlshr m (_
    bv24 32)))) u ((_ extract 7 0) (bvlshr m (_ bv16 32)))) v ((_
    extract 7 0) (bvlshr m (_ bv8 32)))) w ((_ extract 7 0) m))) (_
    bv1 1) (_ bv0 1))) (_ bv1 1) (_ bv0 1)) (bvand (ite (= g (ite (= m
    (bvadd p (_ bv1 32))) (_ bv1 1) (_ bv0 1))) (_ bv1 1) (_ bv0 1))
    (bvand (ite (= x (ite (= n o) (_ bv1 1) (_ bv0 1))) (_ bv1 1) (_
    bv0 1)) (bvand (ite (= f (ite (= b (store (store (store (store a
    (bvadd o (_ bv3 32)) ((_ extract 7 0) (bvand r (_ bv24 32))))
    (bvadd o (_ bv2 32)) ((_ extract 7 0) (bvlshr r (_ bv16 32))))
    (bvadd (_ bv1 32)) ((_ extract 7 0) (bvlshr r (_ bv8 32)))) o ((_
    extract 7 0) r))) (_ bv1 1) (_ bv0 1))) (_ bv1 1) (_ bv0 1))
    (bvand (ite (= e (ite (= o (bvsub s (_ bv4 32))) (_ bv1 1) (_ bv0
    1))) (_ bv1 1) (_ bv0 1)) (bvand (ite (= d (ite (= p (bvor (bvor
    (bvor (bvshl (concat (_ bv0 24) (select a v)) (_ bv8 32))))
    (bvxnor (concat (_ bv0 24) (select a t)) (_ bv24 32)))) (_ bv1 1)
    (_ bv0 1))) (_ bv1 1) (_ bv0 1)) (ite (distinct (ite (= q (bvor
    (bvor (bvor (concat (_ bv0 24) (select a (bvadd s (_ bv0 32))))
    (bvshl (concat (_ bv0 24) (select a s)) (_ bv8 32))) (bvshl
    (concat (_ bv0 24) (select a (bvadd s (_ bv2 32)))) (_ bv16
    32))(concat (_ bv0 24) (select a (bvadd s (_ bv3 32)))) (_ bv24
    32)))) (_ bv1 1) (_ bv0 1))) (_ bv1 1) (_ bv0 1)))))))))(bvnot (_
    bv0 1)))))
(check-sat)
(reset)

(set-option :smt.ematching false)
(set-option :sat.branching.anti_exploration true)
(set-option :sat.branching.heuristic chb)
(declare-datatypes ((ColorType 0)) (((ColorType_Red) (ColorType_Black))))
(declare-datatypes ((RBTree_Node_recd 0) (RBTree 0)) (((RBTree_Node_recd (RBTree_Node_recd_color ColorType) (RBTree_Node_recd_left RBTree) (RBTree_Node_recd_elem Int) (RBTree_Node_recd_right RBTree))) ((RBTree_Leaf) (RBTree_Node (destRBTree_Node RBTree_Node_recd)))))
(declare-datatypes ((BoolColor 0)) (((BoolColor (BoolColor_res Bool) (BoolColor_color ColorType)))))
(declare-fun insertFn (Int RBTree) RBTree)
(declare-fun t () RBTree)
(declare-fun NoTwoRedsFn (RBTree) BoolColor)
(declare-fun insFn (Int RBTree) RBTree)
(assert (forall ((v0 Int)) (and (or ((_ is RBTree_Leaf) t) (and (not ((_ is RBTree_Leaf) (insertFn v0 t))) (not (BoolColor_res (NoTwoRedsFn (RBTree_Node_recd_left (destRBTree_Node (insertFn v0 t)))))))) (= (insertFn v0 t) (insFn v0 t)) (= (NoTwoRedsFn (RBTree_Node_recd_left (destRBTree_Node (insertFn v0 t)))) (ite ((_ is RBTree_Leaf) (RBTree_Node_recd_left (destRBTree_Node (insertFn v0 t)))) (BoolColor true ColorType_Black) (BoolColor (or (not (= ColorType_Red (RBTree_Node_recd_color (destRBTree_Node (RBTree_Node_recd_left (destRBTree_Node (insertFn v0 t))))))) (and (not (= (BoolColor_color (NoTwoRedsFn (RBTree_Node_recd_right (destRBTree_Node (RBTree_Node_recd_left (destRBTree_Node t)))))) ColorType_Red)) (not (= ColorType_Red (BoolColor_color (NoTwoRedsFn (RBTree_Node_recd_left (destRBTree_Node (RBTree_Node_recd_left (destRBTree_Node (insertFn v0 t))))))))))) (RBTree_Node_recd_color (destRBTree_Node (RBTree_Node_recd_left (destRBTree_Node (insertFn v0 t)))))))) true (= (NoTwoRedsFn (RBTree_Node_recd_left (destRBTree_Node t))) (ite ((_ is RBTree_Leaf) (RBTree_Node_recd_left (destRBTree_Node t))) (BoolColor true ColorType_Black) (BoolColor (and (BoolColor_res (NoTwoRedsFn (RBTree_Node_recd_left (destRBTree_Node (RBTree_Node_recd_left (destRBTree_Node t)))))) (BoolColor_res (NoTwoRedsFn (RBTree_Node_recd_right (destRBTree_Node (RBTree_Node_recd_left (destRBTree_Node t))))))) (RBTree_Node_recd_color (destRBTree_Node (RBTree_Node_recd_left (destRBTree_Node t))))))) (= (NoTwoRedsFn (RBTree_Node_recd_right (destRBTree_Node t))) (ite ((_ is RBTree_Leaf) (RBTree_Node_recd_right (destRBTree_Node t))) (BoolColor true ColorType_Black) (BoolColor (and (BoolColor_res (NoTwoRedsFn (RBTree_Node_recd_left (destRBTree_Node (RBTree_Node_recd_right (destRBTree_Node t)))))) (BoolColor_res (NoTwoRedsFn (RBTree_Node_recd_right (destRBTree_Node (RBTree_Node_recd_right (destRBTree_Node t)))))) (or (not (= ColorType_Red (RBTree_Node_recd_color (destRBTree_Node (RBTree_Node_recd_right (destRBTree_Node t)))))) (= (BoolColor_color (NoTwoRedsFn (RBTree_Node_recd_right (destRBTree_Node (RBTree_Node_recd_right (destRBTree_Node t)))))) ColorType_Red))) (RBTree_Node_recd_color (destRBTree_Node (RBTree_Node_recd_right (destRBTree_Node t))))))) (= (RBTree_Node_recd_left (destRBTree_Node t)) (insertFn v0 (RBTree_Node_recd_left (destRBTree_Node t)))) (= (NoTwoRedsFn (RBTree_Node_recd_left (destRBTree_Node t))) (BoolColor (BoolColor_res (NoTwoRedsFn (RBTree_Node_recd_right (destRBTree_Node (RBTree_Node_recd_left (destRBTree_Node t)))))) (RBTree_Node_recd_color (destRBTree_Node (insertFn v0 (RBTree_Node_recd_left (destRBTree_Node t))))))))))
(check-sat)
(reset)

(set-option :sat.branching.anti_exploration true)
(set-option :sat.branching.heuristic chb)
(set-option :rewriter.elim_and true)
(declare-datatypes ((msg_cmd$type 0)) (((empty) (reqs) (reqe) (inv) (invack) (gnts) (gnte))))
(declare-sort data$type)
(declare-datatypes ((msg$type 0)) (((c_msg$type (m_cmd msg_cmd$type) (m_data data$type)))))
(declare-datatypes ((cache_state$type 0)) (((invalid) (shared) (exclusive))))
(declare-datatypes ((cache$type 0)) (((c_cache$type (c_state cache_state$type) (c_data data$type)))))
(declare-datatypes ((BOOL 0)) (((Truth) (Falsity))))
(declare-sort node$type)
(declare-fun auxnode () node$type)
(declare-fun shrset () (Array node$type BOOL))
(declare-fun exgntd () BOOL)
(declare-fun send_req_exclusive$i () node$type)
(declare-fun chan1 () (Array node$type msg$type))
(declare-fun chan1$1 () (Array node$type msg$type))
(declare-fun cache () (Array node$type cache$type))
(declare-fun l0 () Bool)
(declare-fun l1 () Bool)
(declare-fun l2 () Bool)
(declare-fun z3name!0 (node$type) BOOL)
(declare-fun l3 () Bool)
(declare-fun l4 () Bool)
(declare-fun n!3 () node$type)
(declare-fun l5 () Bool)
(declare-fun l6 () Bool)
(declare-fun l7 () Bool)
(declare-fun n!1 () node$type)
(declare-fun l8 () Bool)
(declare-fun l9 () Bool)
(declare-fun l11 () Bool)
(declare-fun l13 () Bool)
(declare-fun z3name!2 () BOOL)
(declare-fun l14 () Bool)
(declare-fun l15 () Bool)
(declare-fun l16 () Bool)
(declare-fun l17 () Bool)
(declare-fun l18 () Bool)
(declare-fun true () Bool)
(declare-fun l20 () Bool)
(declare-fun l21 () Bool)
(assert (= l13 (or (not (distinct chan1$1 (store chan1 send_req_exclusive$i (c_msg$type reqe (m_data (select chan1 send_req_exclusive$i)))))) l7)))
(assert (= l1 l4))
(assert (forall ((n node$type)) (or l4 (and (distinct (select shrset n) (z3name!0 n)) true))))
(assert (= l3 (= exclusive (c_state (select cache send_req_exclusive$i)))))
(assert (let (($x28 true))))
(assert l5)
(assert (= l6 (= n!3 auxnode)))
(assert (= l7 (= exgntd Truth)))
(assert l2)
(assert (= l9 (forall ((k!00 node$type)) (or (not l11) (= (z3name!0 k!00) Truth)))))
(assert (= l4 (forall ((k!00 node$type)) (or (= k!00 auxnode) (= (z3name!0 k!00) Falsity)))))
(assert l15)
(assert (= (forall ((n node$type)) (or l7 (= (select shrset n) (z3name!0 n)))) l8))
(assert (= l13 l0))
(assert (= l14 (= (select shrset n!1) z3name!2)))
(assert l16)
(assert (let (($x74 (not l7)))))
(assert (= l17 (= z3name!2 Truth)))
(assert (= l18 (and (distinct empty (m_cmd (select chan1 send_req_exclusive$i))))))
(assert (= l20 l6))
(assert l21)
;(check-sat)
(reset)

(declare-fun arr () (Array Bool Int))
(declare-fun i10 () Int)
(assert (forall ((v18 Bool)) (forall ((i4 Int)) (and (not (= i10 0)) (<= (select (store arr v18 1) false) i4)))))
(check-sat)
(reset)


(set-option :sat.branching.heuristic chb)
(declare-fun f ((_ BitVec 3)) Int)
(declare-fun y () (_ BitVec 3))
(declare-fun A () (Array Int Int))
(assert (forall ((x (_ BitVec 3))) (not (= (select A (f (bvshl x y))) (select A (f (bvsdiv x (_ bv0 3))))))))
;(check-sat)
(reset)

(declare-fun a ((Array Int (Array Int Real)) (Array Int (Array Int Real))) (Array Int (Array Int Real)))
(assert (forall ((b Int) (c Int) (d (Array Int (Array Int Real))) (g (Array Int (Array Int Real))) (e Int)) (let ((f (a d g))) (= (<= c e) (distinct (select (f b) c) (select (f c) b))))))
(check-sat)
(reset)
(exit)

(set-info :status unknown)
(declare-sort A)
(declare-fun f (A) A)
(assert (forall ((x A)) (forall ((y A)) (and (= x (f (f x))) (= x y)))))
(check-sat)
(reset)
