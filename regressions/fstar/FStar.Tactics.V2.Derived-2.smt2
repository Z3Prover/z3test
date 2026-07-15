; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: 59acb559e163534be88d7782cc13f923ea472296
; Z3 version (according to F*): 4.17.1

(set-option :global-decls false)
(set-option :smt.mbqi false)
(set-option :auto_config false)
(set-option :produce-unsat-cores true)
(set-option :model true)
(set-option :smt.case_split 3)
(set-option :smt.relevancy 2)
(set-option :rewriter.enable_der false)
(set-option :rewriter.sort_disjunctions false)
(set-option :pi.decompose_patterns false)
(set-option :smt.arith.solver 6)
(set-option :smt.random-seed 0)


(declare-sort FString)
(declare-fun FString_constr_id (FString) Int)

(declare-sort Term)
(declare-sort Universe)
(declare-fun U_zero () Universe)
(declare-fun U_succ (Universe) Universe)
(declare-fun ulevel ((Universe)) Int)
(declare-fun Univ (Int) Universe)
(assert (= (ulevel U_zero) 0))
(assert (forall ((u Universe)) (! (= (ulevel (U_succ u)) (+ 1 (ulevel u))) :pattern ((ulevel (U_succ u))))))
(assert (forall ((u Universe)) (! (>= (ulevel u) 0) :pattern ((ulevel u)))))
(assert (forall ((u Universe)) (! (= (Univ (ulevel u)) u) :pattern ((ulevel u)))))
(assert (forall ((i Int)) (! (implies (>= i 0) (= (ulevel (Univ i)) i)) :pattern ((Univ i)))))
(declare-fun U_max (Universe Universe) Universe)
(assert (forall ((u1 Universe) (u2 Universe))
(! (= (U_max u1 u2)
(ite (<= (ulevel u1) (ulevel u2)) u2 u1))
:pattern ((U_max u1 u2)))))
(declare-fun U_unif (Int) Universe)
(declare-fun U_unknown () Universe)
(declare-fun Term_constr_id (Term) Int)
(declare-sort Dummy_sort)
(declare-fun Dummy_value () Dummy_sort)
(declare-datatypes () ((Fuel 
(ZFuel) 
(SFuel (prec Fuel)))))
(declare-fun MaxIFuel () Fuel)
(declare-fun MaxFuel () Fuel)
(declare-fun PreType (Term) Term)
(declare-fun Valid (Term) Bool)
(declare-fun HasTypeFuel (Fuel Term Term) Bool)
(define-fun HasTypeZ ((x Term) (t Term)) Bool
(HasTypeFuel ZFuel x t))
(define-fun HasType ((x Term) (t Term)) Bool
(HasTypeFuel MaxIFuel x t))
(declare-fun IsTotFun (Term) Bool)

                ;;fuel irrelevance
(assert (forall ((f Fuel) (x Term) (t Term))
(! (= (HasTypeFuel (SFuel f) x t)
(HasTypeZ x t))
:pattern ((HasTypeFuel (SFuel f) x t)))))
(declare-fun NoHoist (Term Bool) Bool)
;;no-hoist
(assert (forall ((dummy Term) (b Bool))
(! (= (NoHoist dummy b) b)
:pattern ((NoHoist dummy b)))))
(define-fun  IsTyped ((x Term)) Bool
(exists ((t Term)) (HasTypeZ x t)))
(declare-fun ApplyTF (Term Fuel) Term)
(declare-fun ApplyTT (Term Term) Term)
(declare-fun Prec (Term Term) Bool)
(assert (forall ((x Term) (y Term) (z Term))
(! (implies (and (Prec x y) (Prec y z)) (Prec x z))
:pattern ((Prec x z) (Prec x y)))))
(assert (forall ((x Term) (y Term))
(implies (Prec x y)
(not (Prec y x)))))
(declare-fun Closure (Term) Term)
(declare-fun ConsTerm (Term Term) Term)
(declare-fun ConsFuel (Fuel Term) Term)
(declare-fun Tm_uvar (Int) Term)
(define-fun Reify ((x Term)) Term x)
(declare-fun Prims.precedes (Universe Universe Term Term Term Term) Term)
(declare-fun Range_const (Int) Term)
(declare-fun _mul (Int Int) Int)
(declare-fun _div (Int Int) Int)
(declare-fun _mod (Int Int) Int)
(declare-fun __uu__PartialApp () Term)
(assert (forall ((x Int) (y Int)) (! (= (_mul x y) (* x y)) :pattern ((_mul x y)))))
(assert (forall ((x Int) (y Int)) (! (= (_div x y) (div x y)) :pattern ((_div x y)))))
(assert (forall ((x Int) (y Int)) (! (= (_mod x y) (mod x y)) :pattern ((_mod x y)))))
(declare-fun _rmul (Real Real) Real)
(declare-fun _rdiv (Real Real) Real)
(assert (forall ((x Real) (y Real)) (! (= (_rmul x y) (* x y)) :pattern ((_rmul x y)))))
(assert (forall ((x Real) (y Real)) (! (= (_rdiv x y) (/ x y)) :pattern ((_rdiv x y)))))
(define-fun Unreachable () Bool false); <start constructor FString_const>
; Constructor
(declare-fun FString_const (Int) FString)
; Constructor distinct
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Int))
   (! (= 0 (FString_constr_id (FString_const @u0)))
    :pattern ((FString_const @u0))
    :qid constructor_distinct_FString_const))
  :named constructor_distinct_FString_const))
; Projector
(declare-fun FString_const_proj_0 (FString) Int)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Int))
   (! (= (FString_const_proj_0 (FString_const @u0)) @u0)
    :pattern ((FString_const @u0))
    :qid projection_inverse_FString_const_proj_0))
  :named projection_inverse_FString_const_proj_0))
; Discriminator definition
(define-fun is-FString_const ((__@u0 FString)) Bool
 (and (= (FString_constr_id __@u0) 0) (= __@u0 (FString_const (FString_const_proj_0 __@u0)))))
; </end constructor FString_const>
; <start constructor Tm_type>
; Constructor
(declare-fun Tm_type (Universe) Term)
; Constructor distinct
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Universe))
   (! (= 2 (Term_constr_id (Tm_type @u0)))
    :pattern ((Tm_type @u0))
    :qid constructor_distinct_Tm_type))
  :named constructor_distinct_Tm_type))
; Projector
(declare-fun Tm_type_0 (Term) Universe)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Universe))
   (! (= (Tm_type_0 (Tm_type @u0)) @u0) :pattern ((Tm_type @u0)) :qid projection_inverse_Tm_type_0))
  :named projection_inverse_Tm_type_0))
; Discriminator definition
(define-fun is-Tm_type ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 2) (= __@x0 (Tm_type (Tm_type_0 __@x0)))))
; </end constructor Tm_type>
; <start constructor Tm_arrow>
; Constructor
(declare-fun Tm_arrow (Int) Term)
; Constructor distinct
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Int))
   (! (= 3 (Term_constr_id (Tm_arrow @u0)))
    :pattern ((Tm_arrow @u0))
    :qid constructor_distinct_Tm_arrow))
  :named constructor_distinct_Tm_arrow))
; Projector
(declare-fun Tm_arrow_id (Term) Int)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Int))
   (! (= (Tm_arrow_id (Tm_arrow @u0)) @u0)
    :pattern ((Tm_arrow @u0))
    :qid projection_inverse_Tm_arrow_id))
  :named projection_inverse_Tm_arrow_id))
; Discriminator definition
(define-fun is-Tm_arrow ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 3) (= __@x0 (Tm_arrow (Tm_arrow_id __@x0)))))
; </end constructor Tm_arrow>
; <start constructor Tm_unit>
; Constructor
(declare-fun Tm_unit () Term)
; Constructor distinct
;;; Fact-ids: 
(assert (! (= 6 (Term_constr_id Tm_unit)) :named constructor_distinct_Tm_unit))
; Discriminator definition
(define-fun is-Tm_unit ((__@x0 Term)) Bool (and (= (Term_constr_id __@x0) 6) (= __@x0 Tm_unit)))
; </end constructor Tm_unit>
; <start constructor BoxInt>
; Constructor
(declare-fun BoxInt (Int) Term)
; Constructor distinct
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Int))
   (! (= 7 (Term_constr_id (BoxInt @u0))) :pattern ((BoxInt @u0)) :qid constructor_distinct_BoxInt))
  :named constructor_distinct_BoxInt))
; Projector
(declare-fun BoxInt_proj_0 (Term) Int)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Int))
   (! (= (BoxInt_proj_0 (BoxInt @u0)) @u0)
    :pattern ((BoxInt @u0))
    :qid projection_inverse_BoxInt_proj_0))
  :named projection_inverse_BoxInt_proj_0))
; Discriminator definition
(define-fun is-BoxInt ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 7) (= __@x0 (BoxInt (BoxInt_proj_0 __@x0)))))
; </end constructor BoxInt>
; <start constructor BoxBool>
; Constructor
(declare-fun BoxBool (Bool) Term)
; Constructor distinct
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Bool))
   (! (= 8 (Term_constr_id (BoxBool @u0)))
    :pattern ((BoxBool @u0))
    :qid constructor_distinct_BoxBool))
  :named constructor_distinct_BoxBool))
; Projector
(declare-fun BoxBool_proj_0 (Term) Bool)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Bool))
   (! (= (BoxBool_proj_0 (BoxBool @u0)) @u0)
    :pattern ((BoxBool @u0))
    :qid projection_inverse_BoxBool_proj_0))
  :named projection_inverse_BoxBool_proj_0))
; Discriminator definition
(define-fun is-BoxBool ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 8) (= __@x0 (BoxBool (BoxBool_proj_0 __@x0)))))
; </end constructor BoxBool>
; <start constructor BoxString>
; Constructor
(declare-fun BoxString (FString) Term)
; Constructor distinct
;;; Fact-ids: 
(assert
 (! (forall ((@u0 FString))
   (! (= 9 (Term_constr_id (BoxString @u0)))
    :pattern ((BoxString @u0))
    :qid constructor_distinct_BoxString))
  :named constructor_distinct_BoxString))
; Projector
(declare-fun BoxString_proj_0 (Term) FString)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@u0 FString))
   (! (= (BoxString_proj_0 (BoxString @u0)) @u0)
    :pattern ((BoxString @u0))
    :qid projection_inverse_BoxString_proj_0))
  :named projection_inverse_BoxString_proj_0))
; Discriminator definition
(define-fun is-BoxString ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 9) (= __@x0 (BoxString (BoxString_proj_0 __@x0)))))
; </end constructor BoxString>
; <start constructor BoxReal>
; Constructor
(declare-fun BoxReal (Real) Term)
; Constructor distinct
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Real))
   (! (= 10 (Term_constr_id (BoxReal @u0)))
    :pattern ((BoxReal @u0))
    :qid constructor_distinct_BoxReal))
  :named constructor_distinct_BoxReal))
; Projector
(declare-fun BoxReal_proj_0 (Term) Real)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Real))
   (! (= (BoxReal_proj_0 (BoxReal @u0)) @u0)
    :pattern ((BoxReal @u0))
    :qid projection_inverse_BoxReal_proj_0))
  :named projection_inverse_BoxReal_proj_0))
; Discriminator definition
(define-fun is-BoxReal ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 10) (= __@x0 (BoxReal (BoxReal_proj_0 __@x0)))))
; </end constructor BoxReal>
; <start constructor LexCons>
; Constructor
(declare-fun LexCons (Term Term Term) Term)
; Constructor distinct
;;; Fact-ids: 
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= 11 (Term_constr_id (LexCons @x0 @x1 @x2)))
    :pattern ((LexCons @x0 @x1 @x2))
    :qid constructor_distinct_LexCons))
  :named constructor_distinct_LexCons))
; Projector
(declare-fun LexCons_0 (Term) Term)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (LexCons_0 (LexCons @x0 @x1 @x2)) @x0)
    :pattern ((LexCons @x0 @x1 @x2))
    :qid projection_inverse_LexCons_0))
  :named projection_inverse_LexCons_0))
; Projector
(declare-fun LexCons_1 (Term) Term)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (LexCons_1 (LexCons @x0 @x1 @x2)) @x1)
    :pattern ((LexCons @x0 @x1 @x2))
    :qid projection_inverse_LexCons_1))
  :named projection_inverse_LexCons_1))
; Projector
(declare-fun LexCons_2 (Term) Term)
; Projection inverse
;;; Fact-ids: 
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (LexCons_2 (LexCons @x0 @x1 @x2)) @x2)
    :pattern ((LexCons @x0 @x1 @x2))
    :qid projection_inverse_LexCons_2))
  :named projection_inverse_LexCons_2))
; Discriminator definition
(define-fun is-LexCons ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 11)
  (= __@x0 (LexCons (LexCons_0 __@x0) (LexCons_1 __@x0) (LexCons_2 __@x0)))))
; </end constructor LexCons>
(declare-fun Prims.precedes@tok (Universe Universe) Term)
(assert
(forall ((u0 Universe) (u1 Universe) (@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
(! (= (ApplyTT (ApplyTT (ApplyTT (ApplyTT (Prims.precedes@tok u0 u1) @x0) @x1) @x2) @x3)
(Prims.precedes u0 u1 @x0 @x1 @x2 @x3))
:pattern ((ApplyTT (ApplyTT (ApplyTT (ApplyTT (Prims.precedes@tok u0 u1) @x0) @x1) @x2) @x3)))))

(define-fun is-Prims.LexCons ((t Term)) Bool 
(is-LexCons t))
(declare-fun Prims.lex_t () Term)
(declare-fun LexTop () Term)
(assert (forall ((u0 Universe) (u1 Universe) (t1 Term) (t2 Term) (x1 Term) (x2 Term) (y1 Term) (y2 Term))
(iff (Valid (Prims.precedes u0 u1 Prims.lex_t Prims.lex_t (LexCons t1 x1 x2) (LexCons t2 y1 y2)))
(or (Valid (Prims.precedes u0 u1 t1 t2 x1 y1))
(and (= x1 y1)
(Valid (Prims.precedes u0 u1 Prims.lex_t Prims.lex_t x2 y2)))))))
(assert (forall ((u0 Universe) (u1 Universe) (t1 Term) (t2 Term) (e1 Term) (e2 Term))
(! (iff (Valid (Prims.precedes u0 u1 t1 t2 e1 e2))
(Valid (Prims.precedes U_zero U_zero Prims.lex_t Prims.lex_t e1 e2)))
:pattern (Prims.precedes u0 u1 t1 t2 e1 e2))))
(assert (forall ((u0 Universe) (u1 Universe) (t1 Term) (t2 Term))
(! (iff (Valid (Prims.precedes u0 u1 Prims.lex_t Prims.lex_t t1 t2)) 
(Prec t1 t2))
:pattern ((Prims.precedes u0 u1 Prims.lex_t Prims.lex_t t1 t2)))))
(assert (forall ((u Universe) (t Term))
(! (iff (HasType (Tm_type u) t)
(= t (Tm_type (U_succ u))))
:pattern ((HasType (Tm_type u) t)))))

; Constructor
(declare-fun FStar.Pervasives.Inl (Universe Universe Term Term Term) Term)
; Projector
(declare-fun FStar.Pervasives.Inl_@0 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Inl_@1 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Inl_@a (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Inl_@b (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Inl_@v (Term) Term)
; Constructor
(declare-fun FStar.Pervasives.Inr (Universe Universe Term Term Term) Term)
; Projector
(declare-fun FStar.Pervasives.Inr_@0 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Inr_@1 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Inr_@a (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Inr_@b (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Inr_@v (Term) Term)
; Constructor
(declare-fun FStar.Pervasives.either (Universe Universe Term Term) Term)
; token
(declare-fun FStar.Pervasives.either@tok (Universe Universe) Term)
(declare-fun FStar.Pervasives.uu___is_Inl (Universe Universe Term Term Term) Term)
(declare-fun FStar.Pervasives.uu___is_Inr (Universe Universe Term Term Term) Term)
(declare-fun FStar.Range.range () Term)
; Constructor
(declare-fun FStar.Stubs.Tactics.Common.NotAListLiteral () Term)
; Constructor base
(declare-fun FStar.Stubs.Tactics.Common.NotAListLiteral@base () Term)
; Constructor
(declare-fun FStar.Stubs.Tactics.Common.SKIP () Term)
; Constructor base
(declare-fun FStar.Stubs.Tactics.Common.SKIP@base () Term)
; Constructor
(declare-fun FStar.Stubs.Tactics.Common.Stop () Term)
; Constructor base
(declare-fun FStar.Stubs.Tactics.Common.Stop@base () Term)
; Constructor
(declare-fun FStar.Tactics.V2.Derived.Goal_not_trivial () Term)
; Constructor base
(declare-fun FStar.Tactics.V2.Derived.Goal_not_trivial@base () Term)
(declare-fun Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29 (Term Term) Term)
(declare-fun Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f (Term) Term)
(declare-fun Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521 (Term Term) Term)
(declare-fun Non_total_Tm_arrow_f0d7bc7829d8ad82e7e2f9a7c72f2a73 (Term) Term)
; Constructor
(declare-fun Prims.Cons (Universe Term Term Term) Term)
; Projector
(declare-fun Prims.Cons_@0 (Term) Universe)
; Projector
(declare-fun Prims.Cons_@a (Term) Term)
; Projector
(declare-fun Prims.Cons_@hd (Term) Term)
; Projector
(declare-fun Prims.Cons_@tl (Term) Term)
; Constructor
(declare-fun Prims.Nil (Universe Term) Term)
; Projector
(declare-fun Prims.Nil_@0 (Term) Universe)
; Projector
(declare-fun Prims.Nil_@a (Term) Term)
(declare-fun Prims.bool () Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.exn () Term)
(declare-fun Prims.guard_free (Term) Term)
(declare-fun Prims.hasEq (Universe Term) Term)
; Constructor
(declare-fun Prims.list (Universe Term) Term)
; token
(declare-fun Prims.list@tok (Universe) Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_wp (Universe Term) Term)
(declare-fun Prims.unit () Term)
(declare-fun Tm_refine_9d6af3f3535473623f7aec2f0501897f () Term)
; Discriminator definition
(define-fun is-FStar.Pervasives.Inl ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 448)
  (=
   __@x0
   (FStar.Pervasives.Inl
    (FStar.Pervasives.Inl_@0 __@x0)
    (FStar.Pervasives.Inl_@1 __@x0)
    (FStar.Pervasives.Inl_@a __@x0)
    (FStar.Pervasives.Inl_@b __@x0)
    (FStar.Pervasives.Inl_@v __@x0)))))
; Discriminator definition
(define-fun is-FStar.Pervasives.Inr ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 453)
  (=
   __@x0
   (FStar.Pervasives.Inr
    (FStar.Pervasives.Inr_@0 __@x0)
    (FStar.Pervasives.Inr_@1 __@x0)
    (FStar.Pervasives.Inr_@a __@x0)
    (FStar.Pervasives.Inr_@b __@x0)
    (FStar.Pervasives.Inr_@v __@x0)))))
; Discriminator definition
(define-fun is-FStar.Stubs.Tactics.Common.NotAListLiteral ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 102) (= __@x0 FStar.Stubs.Tactics.Common.NotAListLiteral)))
; Discriminator definition
(define-fun is-FStar.Stubs.Tactics.Common.SKIP ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 117) (= __@x0 FStar.Stubs.Tactics.Common.SKIP)))
; Discriminator definition
(define-fun is-FStar.Stubs.Tactics.Common.Stop ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 121) (= __@x0 FStar.Stubs.Tactics.Common.Stop)))
; Discriminator definition
(define-fun is-FStar.Tactics.V2.Derived.Goal_not_trivial ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 115) (= __@x0 FStar.Tactics.V2.Derived.Goal_not_trivial)))
; Discriminator definition
(define-fun is-Prims.Cons ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 346)
  (=
   __@x0
   (Prims.Cons
    (Prims.Cons_@0 __@x0)
    (Prims.Cons_@a __@x0)
    (Prims.Cons_@hd __@x0)
    (Prims.Cons_@tl __@x0)))))
; Discriminator definition
(define-fun is-Prims.Nil ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 341) (= __@x0 (Prims.Nil (Prims.Nil_@0 __@x0) (Prims.Nil_@a __@x0)))))
; Assumption: FStar.Pervasives.either__uu___haseq
;;; Fact-ids: Name FStar.Pervasives.either__uu___haseq; Namespace FStar.Pervasives
(assert
 (! (forall ((@u0 Universe) (@u1 Universe))
   (! (forall ((@x2 Term) (@x3 Term))
     (! (implies
       (and
        (HasType @x2 (Tm_type @u0))
        (HasType @x3 (Tm_type @u1))
        (Valid (Prims.hasEq @u0 @x2))
        (Valid (Prims.hasEq @u1 @x3)))
       (Valid (Prims.hasEq (U_max @u0 @u1) (FStar.Pervasives.either @u0 @u1 @x2 @x3))))
      :pattern ((Prims.hasEq (U_max @u0 @u1) (FStar.Pervasives.either @u0 @u1 @x2 @x3)))
      :qid assumption_FStar.Pervasives.either__uu___haseq.1))
    :qid assumption_FStar.Pervasives.either__uu___haseq))
  :named assumption_FStar.Pervasives.either__uu___haseq))
; Assumption: Prims.list__uu___haseq
;;; Fact-ids: Name Prims.list__uu___haseq; Namespace Prims
(assert
 (! (forall ((@u0 Universe))
   (! (forall ((@x1 Term))
     (! (implies
       (and (HasType @x1 (Tm_type @u0)) (Valid (Prims.hasEq @u0 @x1)))
       (Valid (Prims.hasEq @u0 (Prims.list @u0 @x1))))
      :pattern ((Prims.hasEq @u0 (Prims.list @u0 @x1)))
      :qid assumption_Prims.list__uu___haseq.1))
    :qid assumption_Prims.list__uu___haseq))
  :named assumption_Prims.list__uu___haseq))
; bool inversion
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (forall ((@u0 Fuel) (@x1 Term))
   (! (implies (HasTypeFuel @u0 @x1 Prims.bool) (is-BoxBool @x1))
    :pattern ((HasTypeFuel @u0 @x1 Prims.bool))
    :qid bool_inversion))
  :named bool_inversion))
; bool typing
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (forall ((@u0 Bool))
   (! (HasType (BoxBool @u0) Prims.bool) :pattern ((BoxBool @u0)) :qid bool_typing))
  :named bool_typing))
; Constructor base
;;; Fact-ids: Name FStar.Stubs.Tactics.Common.NotAListLiteral; Namespace FStar.Stubs.Tactics.Common
(assert
 (! (implies
   (is-FStar.Stubs.Tactics.Common.NotAListLiteral FStar.Stubs.Tactics.Common.NotAListLiteral)
   (= FStar.Stubs.Tactics.Common.NotAListLiteral FStar.Stubs.Tactics.Common.NotAListLiteral@base))
  :named constructor_base_FStar.Stubs.Tactics.Common.NotAListLiteral))
; Constructor base
;;; Fact-ids: Name FStar.Stubs.Tactics.Common.SKIP; Namespace FStar.Stubs.Tactics.Common
(assert
 (! (implies
   (is-FStar.Stubs.Tactics.Common.SKIP FStar.Stubs.Tactics.Common.SKIP)
   (= FStar.Stubs.Tactics.Common.SKIP FStar.Stubs.Tactics.Common.SKIP@base))
  :named constructor_base_FStar.Stubs.Tactics.Common.SKIP))
; Constructor base
;;; Fact-ids: Name FStar.Stubs.Tactics.Common.Stop; Namespace FStar.Stubs.Tactics.Common
(assert
 (! (implies
   (is-FStar.Stubs.Tactics.Common.Stop FStar.Stubs.Tactics.Common.Stop)
   (= FStar.Stubs.Tactics.Common.Stop FStar.Stubs.Tactics.Common.Stop@base))
  :named constructor_base_FStar.Stubs.Tactics.Common.Stop))
; Constructor base
;;; Fact-ids: Name FStar.Tactics.V2.Derived.Goal_not_trivial; Namespace FStar.Tactics.V2.Derived
(assert
 (! (implies
   (is-FStar.Tactics.V2.Derived.Goal_not_trivial FStar.Tactics.V2.Derived.Goal_not_trivial)
   (= FStar.Tactics.V2.Derived.Goal_not_trivial FStar.Tactics.V2.Derived.Goal_not_trivial@base))
  :named constructor_base_FStar.Tactics.V2.Derived.Goal_not_trivial))
; Constructor distinct
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= 448 (Term_constr_id (FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4)))
    :pattern ((FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4))
    :qid constructor_distinct_FStar.Pervasives.Inl))
  :named constructor_distinct_FStar.Pervasives.Inl))
; Constructor distinct
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= 453 (Term_constr_id (FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4)))
    :pattern ((FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4))
    :qid constructor_distinct_FStar.Pervasives.Inr))
  :named constructor_distinct_FStar.Pervasives.Inr))
; Constructor distinct
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(584,5-584,11); use=FStar.Pervasives.fsti(584,5-584,11)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (= 441 (Term_constr_id (FStar.Pervasives.either @u0 @u1 @x2 @x3)))
    :pattern ((FStar.Pervasives.either @u0 @u1 @x2 @x3))
    :qid constructor_distinct_FStar.Pervasives.either))
  :named constructor_distinct_FStar.Pervasives.either))
; Constructor distinct
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(578,4-578,8); use=Prims.fst(578,4-578,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= 346 (Term_constr_id (Prims.Cons @u0 @x1 @x2 @x3)))
    :pattern ((Prims.Cons @u0 @x1 @x2 @x3))
    :qid constructor_distinct_Prims.Cons))
  :named constructor_distinct_Prims.Cons))
; Constructor distinct
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(577,4-577,7); use=Prims.fst(577,4-577,7)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 341 (Term_constr_id (Prims.Nil @u0 @x1)))
    :pattern ((Prims.Nil @u0 @x1))
    :qid constructor_distinct_Prims.Nil))
  :named constructor_distinct_Prims.Nil))
; Constructor distinct
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (= 107 (Term_constr_id Prims.bool)) :named constructor_distinct_Prims.bool))
; Constructor distinct
;;; Fact-ids: Name Prims.exn; Namespace Prims
(assert
 (! (= 329 (Term_constr_id Prims.exn)) :named constructor_distinct_Prims.exn))
; Constructor distinct
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(576,5-576,9); use=Prims.fst(576,5-576,9)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 334 (Term_constr_id (Prims.list @u0 @x1)))
    :pattern ((Prims.list @u0 @x1))
    :qid constructor_distinct_Prims.list))
  :named constructor_distinct_Prims.list))
; Constructor distinct
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (= 125 (Term_constr_id Prims.unit)) :named constructor_distinct_Prims.unit))
; data constructor typing elim
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall
    ((@u0 Fuel) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Inl @u1 @u2 @x3 @x4 @x5)
      (FStar.Pervasives.either @u1 @u2 @x6 @x7))
     (and
      (HasTypeFuel @u0 @x6 (Tm_type @u1))
      (HasTypeFuel @u0 @x7 (Tm_type @u2))
      (HasTypeFuel @u0 @x5 @x6)))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Inl @u1 @u2 @x3 @x4 @x5)
       (FStar.Pervasives.either @u1 @u2 @x6 @x7)))
    :qid data_elim_FStar.Pervasives.Inl))
  :named data_elim_FStar.Pervasives.Inl))
; data constructor typing elim
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall
    ((@u0 Fuel) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Inr @u1 @u2 @x3 @x4 @x5)
      (FStar.Pervasives.either @u1 @u2 @x6 @x7))
     (and
      (HasTypeFuel @u0 @x6 (Tm_type @u1))
      (HasTypeFuel @u0 @x7 (Tm_type @u2))
      (HasTypeFuel @u0 @x5 @x7)))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Inr @u1 @u2 @x3 @x4 @x5)
       (FStar.Pervasives.either @u1 @u2 @x6 @x7)))
    :qid data_elim_FStar.Pervasives.Inr))
  :named data_elim_FStar.Pervasives.Inr))
; data constructor typing elim
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(578,4-578,8); use=Prims.fst(578,4-578,8)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) (Prims.Cons @u1 @x2 @x3 @x4) (Prims.list @u1 @x5))
     (and
      (HasTypeFuel @u0 @x5 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 @x5)
      (HasTypeFuel @u0 @x4 (Prims.list @u1 @x5))))
    :pattern ((HasTypeFuel (SFuel @u0) (Prims.Cons @u1 @x2 @x3 @x4) (Prims.list @u1 @x5)))
    :qid data_elim_Prims.Cons))
  :named data_elim_Prims.Cons))
; data constructor typing elim
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(577,4-577,7); use=Prims.fst(577,4-577,7)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) (Prims.Nil @u1 @x2) (Prims.list @u1 @x3))
     (HasTypeFuel @u0 @x3 (Tm_type @u1)))
    :pattern ((HasTypeFuel (SFuel @u0) (Prims.Nil @u1 @x2) (Prims.list @u1 @x3)))
    :qid data_elim_Prims.Nil))
  :named data_elim_Prims.Nil))
; data constructor typing intro
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall ((@u0 Fuel) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x3 (Tm_type @u1))
      (HasTypeFuel @u0 @x4 (Tm_type @u2))
      (HasTypeFuel @u0 @x5 @x3))
     (HasTypeFuel
      @u0
      (FStar.Pervasives.Inl @u1 @u2 @x3 @x4 @x5)
      (FStar.Pervasives.either @u1 @u2 @x3 @x4)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Pervasives.Inl @u1 @u2 @x3 @x4 @x5)
       (FStar.Pervasives.either @u1 @u2 @x3 @x4)))
    :qid data_typing_intro_FStar.Pervasives.Inl@tok))
  :named data_typing_intro_FStar.Pervasives.Inl@tok))
; data constructor typing intro
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall ((@u0 Fuel) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x3 (Tm_type @u1))
      (HasTypeFuel @u0 @x4 (Tm_type @u2))
      (HasTypeFuel @u0 @x5 @x4))
     (HasTypeFuel
      @u0
      (FStar.Pervasives.Inr @u1 @u2 @x3 @x4 @x5)
      (FStar.Pervasives.either @u1 @u2 @x3 @x4)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Pervasives.Inr @u1 @u2 @x3 @x4 @x5)
       (FStar.Pervasives.either @u1 @u2 @x3 @x4)))
    :qid data_typing_intro_FStar.Pervasives.Inr@tok))
  :named data_typing_intro_FStar.Pervasives.Inr@tok))
; data constructor typing intro
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(578,4-578,8); use=Prims.fst(578,4-578,8)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x2 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 @x2)
      (HasTypeFuel @u0 @x4 (Prims.list @u1 @x2)))
     (HasTypeFuel @u0 (Prims.Cons @u1 @x2 @x3 @x4) (Prims.list @u1 @x2)))
    :pattern ((HasTypeFuel @u0 (Prims.Cons @u1 @x2 @x3 @x4) (Prims.list @u1 @x2)))
    :qid data_typing_intro_Prims.Cons@tok))
  :named data_typing_intro_Prims.Cons@tok))
; data constructor typing intro
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(577,4-577,7); use=Prims.fst(577,4-577,7)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term))
   (! (implies
     (HasTypeFuel @u0 @x2 (Tm_type @u1))
     (HasTypeFuel @u0 (Prims.Nil @u1 @x2) (Prims.list @u1 @x2)))
    :pattern ((HasTypeFuel @u0 (Prims.Nil @u1 @x2) (Prims.list @u1 @x2)))
    :qid data_typing_intro_Prims.Nil@tok))
  :named data_typing_intro_Prims.Nil@tok))
; Discriminator equation
;;; Fact-ids: Name FStar.Pervasives.uu___is_Inl; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.uu___is_Inl @u0 @u1 @x2 @x3 @x4) (BoxBool (is-FStar.Pervasives.Inl @x4)))
    :pattern ((FStar.Pervasives.uu___is_Inl @u0 @u1 @x2 @x3 @x4))
    :qid disc_equation_FStar.Pervasives.Inl))
  :named disc_equation_FStar.Pervasives.Inl))
; Discriminator equation
;;; Fact-ids: Name FStar.Pervasives.uu___is_Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.uu___is_Inr @u0 @u1 @x2 @x3 @x4) (BoxBool (is-FStar.Pervasives.Inr @x4)))
    :pattern ((FStar.Pervasives.uu___is_Inr @u0 @u1 @x2 @x3 @x4))
    :qid disc_equation_FStar.Pervasives.Inr))
  :named disc_equation_FStar.Pervasives.Inr))
; Equation for Prims.eqtype
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (= Prims.eqtype Tm_refine_9d6af3f3535473623f7aec2f0501897f) :named equation_Prims.eqtype))
; fresh token
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! (forall ((@u0 Universe) (@u1 Universe))
   (! (= 442 (Term_constr_id (FStar.Pervasives.either@tok @u0 @u1)))
    :pattern ((FStar.Pervasives.either@tok @u0 @u1))
    :qid fresh_token_FStar.Pervasives.either@tok))
  :named fresh_token_FStar.Pervasives.either@tok))
; fresh token
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! (forall ((@u0 Universe))
   (! (= 335 (Term_constr_id (Prims.list@tok @u0)))
    :pattern ((Prims.list@tok @u0))
    :qid fresh_token_Prims.list@tok))
  :named fresh_token_Prims.list@tok))
; inversion axiom
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(584,5-584,11); use=FStar.Pervasives.fsti(584,5-584,11)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@u3 Universe) (@x4 Term) (@x5 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) @x1 (FStar.Pervasives.either @u2 @u3 @x4 @x5))
     (or
      (and
       (is-FStar.Pervasives.Inl @x1)
       (= @u2 (FStar.Pervasives.Inl_@0 @x1))
       (= @u3 (FStar.Pervasives.Inl_@1 @x1))
       (= @x4 (FStar.Pervasives.Inl_@a @x1))
       (= @x5 (FStar.Pervasives.Inl_@b @x1)))
      (and
       (is-FStar.Pervasives.Inr @x1)
       (= @u2 (FStar.Pervasives.Inr_@0 @x1))
       (= @u3 (FStar.Pervasives.Inr_@1 @x1))
       (= @x4 (FStar.Pervasives.Inr_@a @x1))
       (= @x5 (FStar.Pervasives.Inr_@b @x1)))))
    :pattern ((HasTypeFuel (SFuel @u0) @x1 (FStar.Pervasives.either @u2 @u3 @x4 @x5)))
    :qid fuel_guarded_inversion_FStar.Pervasives.either))
  :named fuel_guarded_inversion_FStar.Pervasives.either))
; inversion axiom
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(576,5-576,9); use=Prims.fst(576,5-576,9)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) @x1 (Prims.list @u2 @x3))
     (or
      (and (is-Prims.Nil @x1) (= @u2 (Prims.Nil_@0 @x1)) (= @x3 (Prims.Nil_@a @x1)))
      (and (is-Prims.Cons @x1) (= @u2 (Prims.Cons_@0 @x1)) (= @x3 (Prims.Cons_@a @x1)))))
    :pattern ((HasTypeFuel (SFuel @u0) @x1 (Prims.list @u2 @x3)))
    :qid fuel_guarded_inversion_Prims.list))
  :named fuel_guarded_inversion_Prims.list))
; function token typing
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (HasType Prims.bool Prims.eqtype) :named function_token_typing_Prims.bool))
; function token typing
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named function_token_typing_Prims.eqtype))
; function token typing
;;; Fact-ids: Name Prims.exn; Namespace Prims
(assert
 (! (HasType Prims.exn (Tm_type U_zero)) :named function_token_typing_Prims.exn))
; function token typing
;;; Fact-ids: Name Prims.prop; Namespace Prims
(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named function_token_typing_Prims.prop))
; function token typing
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (HasType Prims.unit Prims.eqtype) :named function_token_typing_Prims.unit))
; haseq for Tm_refine_9d6af3f3535473623f7aec2f0501897f
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq (U_succ U_zero) Tm_refine_9d6af3f3535473623f7aec2f0501897f))
   (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
  :named haseqTm_refine_9d6af3f3535473623f7aec2f0501897f))
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! (and
   ;; def=FStar.Pervasives.fsti(584,5-584,11); use=FStar.Pervasives.fsti(584,5-584,11)
   (forall ((@u0 Universe) (@u1 Universe))
    (! (IsTotFun (FStar.Pervasives.either@tok @u0 @u1))
     :pattern ((FStar.Pervasives.either@tok @u0 @u1))
     :qid kinding_FStar.Pervasives.either@tok))
   ;; def=FStar.Pervasives.fsti(584,5-584,11); use=FStar.Pervasives.fsti(584,5-584,11)
   (forall ((@u0 Universe) (@u1 Universe) (@x2 Term))
    (! (IsTotFun (ApplyTT (FStar.Pervasives.either@tok @u0 @u1) @x2))
     :pattern ((ApplyTT (FStar.Pervasives.either@tok @u0 @u1) @x2))
     :qid kinding_FStar.Pervasives.either@tok.1))
   ;; def=FStar.Pervasives.fsti(584,5-584,11); use=FStar.Pervasives.fsti(584,5-584,11)
   (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
    (! (implies
      (and (HasType @x2 (Tm_type @u0)) (HasType @x3 (Tm_type @u1)))
      (HasType (FStar.Pervasives.either @u0 @u1 @x2 @x3) (Tm_type (U_max @u0 @u1))))
     :pattern ((FStar.Pervasives.either @u0 @u1 @x2 @x3))
     :qid kinding_FStar.Pervasives.either@tok.2)))
  :named kinding_FStar.Pervasives.either@tok))
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! (and
   ;; def=Prims.fst(576,5-576,9); use=Prims.fst(576,5-576,9)
   (forall ((@u0 Universe))
    (! (IsTotFun (Prims.list@tok @u0)) :pattern ((Prims.list@tok @u0)) :qid kinding_Prims.list@tok))
   ;; def=Prims.fst(576,5-576,9); use=Prims.fst(576,5-576,9)
   (forall ((@u0 Universe) (@x1 Term))
    (! (implies (HasType @x1 (Tm_type @u0)) (HasType (Prims.list @u0 @x1) (Tm_type @u0)))
     :pattern ((Prims.list @u0 @x1))
     :qid kinding_Prims.list@tok.1)))
  :named kinding_Prims.list@tok))
; Typing for non-total arrows
;;; Fact-ids: Name FStar.Tactics.Effect.tac; Namespace FStar.Tactics.Effect
(assert
 (! ;; def=FStar.Tactics.Effect.fsti(178,16-178,19); use=FStar.Tactics.Effect.fsti(178,22-178,32)
  (forall ((@u0 Universe) (@u1 Universe))
   (! ;; def=FStar.Tactics.Effect.fsti(178,16-178,19); use=FStar.Tactics.Effect.fsti(178,22-178,32)
    (forall ((@x2 Term) (@x3 Term))
     (! (implies
       (and (HasType @x2 (Tm_type @u0)) (HasType @x3 (Tm_type @u1)))
       (HasType (Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29 @x2 @x3) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29 @x2 @x3) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29))
  :named non_total_function_typing_Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29))
; Typing for non-total arrows
;;; Fact-ids: Name FStar.Tactics.Effect.tac_repr; Namespace FStar.Tactics.Effect
(assert
 (! ;; def=FStar.Tactics.Effect.fsti(36,14-37,16); use=FStar.Tactics.Effect.fsti(37,2-37,24)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Tactics.Effect.fsti(36,14-37,16); use=FStar.Tactics.Effect.fsti(37,2-37,24)
    (forall ((@x1 Term))
     (! (implies
       (HasType @x1 (Tm_type @u0))
       (HasType (Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f @x1) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f @x1) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f))
  :named non_total_function_typing_Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f))
; Typing for non-total arrows
;;; Fact-ids: Name FStar.Tactics.Effect.lift_div_tac; Namespace FStar.Tactics.Effect
(assert
 (! ;; def=FStar.Tactics.Effect.fsti(138,18-138,48); use=FStar.Tactics.Effect.fsti(138,44-138,57)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Tactics.Effect.fsti(138,18-138,48); use=FStar.Tactics.Effect.fsti(138,44-138,57)
    (forall ((@x1 Term) (@x2 Term))
     (! (implies
       (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (Prims.pure_wp @u0 @x1)))
       (HasType (Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521 @x1 @x2) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521 @x1 @x2) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521))
  :named non_total_function_typing_Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521))
; Typing for non-total arrows
;;; Fact-ids: Name FStar.Tactics.V2.Derived.op_Less_Bar_Greater; Namespace FStar.Tactics.V2.Derived
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(474,13-476,27); use=FStar.Tactics.V2.Derived.fst(474,25-477,8)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Tactics.V2.Derived.fst(474,13-476,27); use=FStar.Tactics.V2.Derived.fst(474,25-477,8)
    (forall ((@x1 Term))
     (! (implies
       (HasType @x1 (Tm_type @u0))
       (HasType (Non_total_Tm_arrow_f0d7bc7829d8ad82e7e2f9a7c72f2a73 @x1) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_f0d7bc7829d8ad82e7e2f9a7c72f2a73 @x1) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_f0d7bc7829d8ad82e7e2f9a7c72f2a73.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_f0d7bc7829d8ad82e7e2f9a7c72f2a73))
  :named non_total_function_typing_Non_total_Tm_arrow_f0d7bc7829d8ad82e7e2f9a7c72f2a73))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inl_@0 (FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4)) @u0)
    :pattern ((FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inl_@0))
  :named projection_inverse_FStar.Pervasives.Inl_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inl_@1 (FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4)) @u1)
    :pattern ((FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inl_@1))
  :named projection_inverse_FStar.Pervasives.Inl_@1))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inl_@a (FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4)) @x2)
    :pattern ((FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inl_@a))
  :named projection_inverse_FStar.Pervasives.Inl_@a))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inl_@b (FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4)) @x3)
    :pattern ((FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inl_@b))
  :named projection_inverse_FStar.Pervasives.Inl_@b))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inl_@v (FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4)) @x4)
    :pattern ((FStar.Pervasives.Inl @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inl_@v))
  :named projection_inverse_FStar.Pervasives.Inl_@v))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inr_@0 (FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4)) @u0)
    :pattern ((FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inr_@0))
  :named projection_inverse_FStar.Pervasives.Inr_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inr_@1 (FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4)) @u1)
    :pattern ((FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inr_@1))
  :named projection_inverse_FStar.Pervasives.Inr_@1))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inr_@a (FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4)) @x2)
    :pattern ((FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inr_@a))
  :named projection_inverse_FStar.Pervasives.Inr_@a))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inr_@b (FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4)) @x3)
    :pattern ((FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inr_@b))
  :named projection_inverse_FStar.Pervasives.Inr_@b))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Pervasives.Inr_@v (FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4)) @x4)
    :pattern ((FStar.Pervasives.Inr @u0 @u1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.Pervasives.Inr_@v))
  :named projection_inverse_FStar.Pervasives.Inr_@v))
; Projection inverse
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(578,4-578,8); use=Prims.fst(578,4-578,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= (Prims.Cons_@0 (Prims.Cons @u0 @x1 @x2 @x3)) @u0)
    :pattern ((Prims.Cons @u0 @x1 @x2 @x3))
    :qid projection_inverse_Prims.Cons_@0))
  :named projection_inverse_Prims.Cons_@0))
; Projection inverse
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(578,4-578,8); use=Prims.fst(578,4-578,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= (Prims.Cons_@a (Prims.Cons @u0 @x1 @x2 @x3)) @x1)
    :pattern ((Prims.Cons @u0 @x1 @x2 @x3))
    :qid projection_inverse_Prims.Cons_@a))
  :named projection_inverse_Prims.Cons_@a))
; Projection inverse
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(578,4-578,8); use=Prims.fst(578,4-578,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= (Prims.Cons_@hd (Prims.Cons @u0 @x1 @x2 @x3)) @x2)
    :pattern ((Prims.Cons @u0 @x1 @x2 @x3))
    :qid projection_inverse_Prims.Cons_@hd))
  :named projection_inverse_Prims.Cons_@hd))
; Projection inverse
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(578,4-578,8); use=Prims.fst(578,4-578,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= (Prims.Cons_@tl (Prims.Cons @u0 @x1 @x2 @x3)) @x3)
    :pattern ((Prims.Cons @u0 @x1 @x2 @x3))
    :qid projection_inverse_Prims.Cons_@tl))
  :named projection_inverse_Prims.Cons_@tl))
; Projection inverse
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(577,4-577,7); use=Prims.fst(577,4-577,7)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (Prims.Nil_@0 (Prims.Nil @u0 @x1)) @u0)
    :pattern ((Prims.Nil @u0 @x1))
    :qid projection_inverse_Prims.Nil_@0))
  :named projection_inverse_Prims.Nil_@0))
; Projection inverse
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(577,4-577,7); use=Prims.fst(577,4-577,7)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (Prims.Nil_@a (Prims.Nil @u0 @x1)) @x1)
    :pattern ((Prims.Nil @u0 @x1))
    :qid projection_inverse_Prims.Nil_@a))
  :named projection_inverse_Prims.Nil_@a))
; refinement_interpretation
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! ;; def=Prims.fst(90,14-90,31); use=Prims.fst(90,14-90,31)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_9d6af3f3535473623f7aec2f0501897f)
     (and
      (HasTypeFuel @u0 @x1 (Tm_type U_zero))
      ;; def=Prims.fst(90,23-90,30); use=Prims.fst(90,23-90,30)
      (Valid
       ;; def=Prims.fst(90,23-90,30); use=Prims.fst(90,23-90,30)
       (Prims.hasEq U_zero @x1))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_9d6af3f3535473623f7aec2f0501897f))
    :qid refinement_interpretation_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
  :named refinement_interpretation_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; refinement kinding
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Tm_refine_9d6af3f3535473623f7aec2f0501897f (Tm_type (U_succ U_zero)))
  :named refinement_kinding_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; subterm ordering
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall
    ((@u0 Fuel) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Inl @u1 @u2 @x3 @x4 @x5)
      (FStar.Pervasives.either @u1 @u2 @x6 @x7))
     (Valid
      (Prims.precedes
       U_zero
       U_zero
       Prims.lex_t
       Prims.lex_t
       @x5
       (FStar.Pervasives.Inl @u1 @u2 @x3 @x4 @x5))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Inl @u1 @u2 @x3 @x4 @x5)
       (FStar.Pervasives.either @u1 @u2 @x6 @x7)))
    :qid subterm_ordering_FStar.Pervasives.Inl))
  :named subterm_ordering_FStar.Pervasives.Inl))
; subterm ordering
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall
    ((@u0 Fuel) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Inr @u1 @u2 @x3 @x4 @x5)
      (FStar.Pervasives.either @u1 @u2 @x6 @x7))
     (Valid
      (Prims.precedes
       U_zero
       U_zero
       Prims.lex_t
       Prims.lex_t
       @x5
       (FStar.Pervasives.Inr @u1 @u2 @x3 @x4 @x5))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Inr @u1 @u2 @x3 @x4 @x5)
       (FStar.Pervasives.either @u1 @u2 @x6 @x7)))
    :qid subterm_ordering_FStar.Pervasives.Inr))
  :named subterm_ordering_FStar.Pervasives.Inr))
; subterm ordering
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(578,4-578,8); use=Prims.fst(578,4-578,8)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) (Prims.Cons @u1 @x2 @x3 @x4) (Prims.list @u1 @x5))
     (and
      (Valid (Prims.precedes U_zero U_zero Prims.lex_t Prims.lex_t @x3 (Prims.Cons @u1 @x2 @x3 @x4)))
      (Valid (Prims.precedes U_zero U_zero Prims.lex_t Prims.lex_t @x4 (Prims.Cons @u1 @x2 @x3 @x4)))))
    :pattern ((HasTypeFuel (SFuel @u0) (Prims.Cons @u1 @x2 @x3 @x4) (Prims.list @u1 @x5)))
    :qid subterm_ordering_Prims.Cons))
  :named subterm_ordering_Prims.Cons))
; name-token correspondence
;;; Fact-ids: Name FStar.Pervasives.either; Namespace FStar.Pervasives; Name FStar.Pervasives.Inl; Namespace FStar.Pervasives; Name FStar.Pervasives.Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(584,5-584,11); use=FStar.Pervasives.fsti(584,5-584,11)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (=
     (ApplyTT (ApplyTT (FStar.Pervasives.either@tok @u0 @u1) @x2) @x3)
     (FStar.Pervasives.either @u0 @u1 @x2 @x3))
    :pattern ((ApplyTT (ApplyTT (FStar.Pervasives.either@tok @u0 @u1) @x2) @x3))
    :pattern ((FStar.Pervasives.either @u0 @u1 @x2 @x3))
    :qid token_correspondence_FStar.Pervasives.either@tok))
  :named token_correspondence_FStar.Pervasives.either@tok))
; name-token correspondence
;;; Fact-ids: Name Prims.list; Namespace Prims; Name Prims.Nil; Namespace Prims; Name Prims.Cons; Namespace Prims
(assert
 (! ;; def=Prims.fst(576,5-576,9); use=Prims.fst(576,5-576,9)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (ApplyTT (Prims.list@tok @u0) @x1) (Prims.list @u0 @x1))
    :pattern ((ApplyTT (Prims.list@tok @u0) @x1))
    :pattern ((Prims.list @u0 @x1))
    :qid token_correspondence_Prims.list@tok))
  :named token_correspondence_Prims.list@tok))
; free var typing
;;; Fact-ids: Name FStar.Pervasives.uu___is_Inl; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(585,4-585,7); use=FStar.Pervasives.fsti(585,4-585,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Pervasives.either @u0 @u1 @x2 @x3)))
     (HasType (FStar.Pervasives.uu___is_Inl @u0 @u1 @x2 @x3 @x4) Prims.bool))
    :pattern ((FStar.Pervasives.uu___is_Inl @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.Pervasives.uu___is_Inl))
  :named typing_FStar.Pervasives.uu___is_Inl))
; free var typing
;;; Fact-ids: Name FStar.Pervasives.uu___is_Inr; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(586,4-586,7); use=FStar.Pervasives.fsti(586,4-586,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Pervasives.either @u0 @u1 @x2 @x3)))
     (HasType (FStar.Pervasives.uu___is_Inr @u0 @u1 @x2 @x3 @x4) Prims.bool))
    :pattern ((FStar.Pervasives.uu___is_Inr @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.Pervasives.uu___is_Inr))
  :named typing_FStar.Pervasives.uu___is_Inr))
; free var typing
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (HasType Prims.bool Prims.eqtype) :named typing_Prims.bool))
; free var typing
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named typing_Prims.eqtype))
; free var typing
;;; Fact-ids: Name Prims.exn; Namespace Prims
(assert
 (! (HasType Prims.exn (Tm_type U_zero)) :named typing_Prims.exn))
; free var typing
;;; Fact-ids: Name Prims.guard_free; Namespace Prims
(assert
 (! ;; def=Prims.fst(312,5-312,15); use=Prims.fst(312,5-312,15)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.prop) (HasType (Prims.guard_free @x0) Prims.prop))
    :pattern ((Prims.guard_free @x0))
    :qid typing_Prims.guard_free))
  :named typing_Prims.guard_free))
; free var typing
;;; Fact-ids: Name Prims.hasEq; Namespace Prims
(assert
 (! ;; def=Prims.fst(86,5-86,10); use=Prims.fst(86,5-86,10)
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies (HasType @x1 (Tm_type @u0)) (HasType (Prims.hasEq @u0 @x1) Prims.prop))
    :pattern ((Prims.hasEq @u0 @x1))
    :qid typing_Prims.hasEq))
  :named typing_Prims.hasEq))
; free var typing
;;; Fact-ids: Name Prims.prop; Namespace Prims
(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named typing_Prims.prop))
; free var typing
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (HasType Prims.unit Prims.eqtype) :named typing_Prims.unit))
; Range_const typing
;;; Fact-ids: Name FStar.Range.range; Namespace FStar.Range
(assert
 (! (HasTypeZ (Range_const 1) FStar.Range.range) :named typing_range_const))
; unit inversion
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (forall ((@u0 Fuel) (@x1 Term))
   (! (implies (HasTypeFuel @u0 @x1 Prims.unit) (= @x1 Tm_unit))
    :pattern ((HasTypeFuel @u0 @x1 Prims.unit))
    :qid unit_inversion))
  :named unit_inversion))
; unit typing
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (HasType Tm_unit Prims.unit) :named unit_typing))
(push) ;; push{1
; Starting query at FStar.Tactics.V2.Derived.fst(483,4-485,28)
; universe local constant
(declare-fun uu___334 () Universe)
; Uninterpreted function symbol for impure function
(declare-fun FStar.Tactics.V2.Derived.repeat (Universe Term Term) Term)
; Uninterpreted name for impure function
(declare-fun FStar.Tactics.V2.Derived.repeat@tok (Universe) Term)
(declare-fun label_1 () Bool)
(declare-fun Non_total_Tm_arrow_b8418e20429e991bebb2a717b53cc81f (Term) Term)
; Typing for non-total arrows
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(482,17-482,34); use=FStar.Tactics.V2.Derived.fst(482,30-482,43)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Tactics.V2.Derived.fst(482,17-482,34); use=FStar.Tactics.V2.Derived.fst(482,30-482,43)
    (forall ((@x1 Term))
     (! (implies
       (HasType @x1 (Tm_type @u0))
       (HasType (Non_total_Tm_arrow_b8418e20429e991bebb2a717b53cc81f @x1) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_b8418e20429e991bebb2a717b53cc81f @x1) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_b8418e20429e991bebb2a717b53cc81f.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_b8418e20429e991bebb2a717b53cc81f))
  :named non_total_function_typing_Non_total_Tm_arrow_b8418e20429e991bebb2a717b53cc81f))
(declare-fun Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 (Universe Term) Term)
; kinding_Tm_arrow_a1c23f05d4ee72892690ac239bf26df3
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(482,51-482,59); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
  (forall ((@u0 Universe) (@x1 Term))
   (! (HasType (Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 @u0 @x1) (Tm_type @u0))
    :pattern ((HasType (Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 @u0 @x1) (Tm_type @u0)))
    :qid kinding_Tm_arrow_a1c23f05d4ee72892690ac239bf26df3))
  :named kinding_Tm_arrow_a1c23f05d4ee72892690ac239bf26df3))
; pretyping
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(482,51-482,59); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 @u2 @x3))
     (is-Tm_arrow (PreType @x1)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 @u2 @x3)))
    :qid FStar.Tactics.V2.Derived_pre_typing_Tm_arrow_a1c23f05d4ee72892690ac239bf26df3))
  :named FStar.Tactics.V2.Derived_pre_typing_Tm_arrow_a1c23f05d4ee72892690ac239bf26df3))
; interpretation_Tm_arrow_a1c23f05d4ee72892690ac239bf26df3
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(482,51-482,59); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 @u1 @x2))
     (and
      ;; def=FStar.Tactics.V2.Derived.fst(482,51-482,59); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 (Prims.list @u1 @x2)) (HasType (ApplyTT @x0 @x3) Prims.prop))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Tactics.V2.Derived_interpretation_Tm_arrow_a1c23f05d4ee72892690ac239bf26df3.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 @u1 @x2)))
    :qid FStar.Tactics.V2.Derived_interpretation_Tm_arrow_a1c23f05d4ee72892690ac239bf26df3))
  :named FStar.Tactics.V2.Derived_interpretation_Tm_arrow_a1c23f05d4ee72892690ac239bf26df3))
(declare-fun Tm_refine_a9a2148d67136e3f8f1a114a5ded974b (Universe Term Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.Effect.fsti(117,31-117,61); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_a9a2148d67136e3f8f1a114a5ded974b @u0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_a9a2148d67136e3f8f1a114a5ded974b @u0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_a9a2148d67136e3f8f1a114a5ded974b))
  :named refinement_kinding_Tm_refine_a9a2148d67136e3f8f1a114a5ded974b))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.Effect.fsti(117,31-117,61); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_a9a2148d67136e3f8f1a114a5ded974b @u2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Tactics.Effect.fsti(117,31-117,61); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
      (forall ((@x5 Term))
       (! (implies
         (HasType @x5 (Prims.list @u2 @x3))
         ;; def=FStar.Tactics.Effect.fsti(117,53-117,60); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
         (Valid
          ;; def=FStar.Tactics.Effect.fsti(117,53-117,60); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
          (ApplyTT @x4 @x5)))
        :qid refinement_interpretation_Tm_refine_a9a2148d67136e3f8f1a114a5ded974b.1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_a9a2148d67136e3f8f1a114a5ded974b @u2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_a9a2148d67136e3f8f1a114a5ded974b))
  :named refinement_interpretation_Tm_refine_a9a2148d67136e3f8f1a114a5ded974b))
; haseq for Tm_refine_a9a2148d67136e3f8f1a114a5ded974b
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.Effect.fsti(117,31-117,61); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_a9a2148d67136e3f8f1a114a5ded974b @u0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_a9a2148d67136e3f8f1a114a5ded974b @u0 @x1 @x2))))
    :qid haseqTm_refine_a9a2148d67136e3f8f1a114a5ded974b))
  :named haseqTm_refine_a9a2148d67136e3f8f1a114a5ded974b))

(declare-fun Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e (Universe Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.Effect.fsti(56,24-56,83); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
  (forall ((@u0 Universe) (@x1 Term))
   (! (HasType (Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e @u0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e @u0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e))
  :named refinement_kinding_Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.Effect.fsti(56,24-56,83); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e @u2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Tactics.Effect.fsti(56,24-56,83); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
      (forall ((@x4 Term))
       (! ;; def=FStar.Tactics.Effect.fsti(56,79-56,82); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
        (Valid
         ;; def=FStar.Tactics.Effect.fsti(56,79-56,82); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
         (ApplyTT @x3 @x4))
        :pattern ((ApplyTT @x3 @x4))
        :qid refinement_interpretation_Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e.1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e @u2 @x3)))
    :qid refinement_interpretation_Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e))
  :named refinement_interpretation_Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e))
; haseq for Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.Effect.fsti(56,24-56,83); use=FStar.Tactics.V2.Derived.fst(483,4-485,28)
  (forall ((@u0 Universe) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e @u0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e @u0 @x1))))
    :qid haseqTm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e))
  :named haseqTm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e))


(declare-fun Tm_refine_1f35ea430b5c424e8ca89536d2519ef8 (Universe Term Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(483,10-483,17); use=FStar.Tactics.V2.Derived.fst(483,10-483,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_1f35ea430b5c424e8ca89536d2519ef8 @u0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_1f35ea430b5c424e8ca89536d2519ef8 @u0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_1f35ea430b5c424e8ca89536d2519ef8))
  :named refinement_kinding_Tm_refine_1f35ea430b5c424e8ca89536d2519ef8))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(483,10-483,17); use=FStar.Tactics.V2.Derived.fst(483,10-483,17)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_1f35ea430b5c424e8ca89536d2519ef8 @u2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Tactics.V2.Derived.fst(483,10-483,17); use=FStar.Tactics.V2.Derived.fst(483,10-483,17)
      (not
       ;; def=FStar.Tactics.V2.Derived.fst(483,10-483,17); use=FStar.Tactics.V2.Derived.fst(483,10-483,17)
       (BoxBool_proj_0 (FStar.Pervasives.uu___is_Inl U_zero @u2 Prims.exn @x3 @x4)))
      ;; def=FStar.Tactics.V2.Derived.fst(483,10-483,17); use=FStar.Tactics.V2.Derived.fst(483,10-483,17)
      (not
       ;; def=FStar.Tactics.V2.Derived.fst(483,10-483,17); use=FStar.Tactics.V2.Derived.fst(483,10-483,17)
       (BoxBool_proj_0 (FStar.Pervasives.uu___is_Inr U_zero @u2 Prims.exn @x3 @x4)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_1f35ea430b5c424e8ca89536d2519ef8 @u2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_1f35ea430b5c424e8ca89536d2519ef8))
  :named refinement_interpretation_Tm_refine_1f35ea430b5c424e8ca89536d2519ef8))
; haseq for Tm_refine_1f35ea430b5c424e8ca89536d2519ef8
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(483,10-483,17); use=FStar.Tactics.V2.Derived.fst(483,10-483,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_1f35ea430b5c424e8ca89536d2519ef8 @u0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_1f35ea430b5c424e8ca89536d2519ef8 @u0 @x1 @x2))))
    :qid haseqTm_refine_1f35ea430b5c424e8ca89536d2519ef8))
  :named haseqTm_refine_1f35ea430b5c424e8ca89536d2519ef8))
; Encoding query formula : forall (a: Type) (t: (_: Prims.unit -> FStar.Tactics.Effect.Tac a))
;   (p: (_: Prims.list a -> Prims.prop)) (_: Prims.squash (forall (r: Prims.list a). p r))
;   (k: (_: Prims.list a -> Prims.prop))
;   (_: Prims.squash (forall (r: Prims.list a). {:pattern Prims.guard_free (k r)} k r))
;   (r: FStar.Pervasives.either Prims.exn a) (k: (_: Prims.list a -> Prims.prop))
;   (_: Prims.squash (forall (r: Prims.list a). {:pattern Prims.guard_free (k r)} k r))
;   (_: Prims.squash (~(Inl? r) /\ ~(Inr? r))).
;   (* - Patterns are incomplete *) Prims.l_False
; Context: While encoding a query
; While typechecking the top-level declaration ‘let rec repeat’
(push) ;; push{0
; <fuel='2' ifuel='1'>
;;; Fact-ids: 
(assert (! (= MaxFuel (SFuel (SFuel ZFuel))) :named @MaxFuel_assumption))
;;; Fact-ids: 
(assert (! (= MaxIFuel (SFuel ZFuel)) :named @MaxIFuel_assumption))
; query
;;; Fact-ids: 
(assert
 (! (not
   (forall
     ((@x0 Term)
      (@x1 Term)
      (@x2 Term)
      (@x3 Term)
      (@x4 Term)
      (@x5 Term)
      (@x6 Term)
      (@x7 Term)
      (@x8 Term)
      (@x9 Term))
    (! (implies
      (and
       (HasType @x0 (Tm_type uu___334))
       (HasType @x1 (Non_total_Tm_arrow_b8418e20429e991bebb2a717b53cc81f @x0))
       (HasType @x2 (Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 uu___334 @x0))
       (HasType @x3 (Tm_refine_a9a2148d67136e3f8f1a114a5ded974b uu___334 @x0 @x2))
       (HasType @x4 (Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 uu___334 @x0))
       (HasType @x5 (Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e uu___334 @x4))
       (HasType @x6 (FStar.Pervasives.either U_zero uu___334 Prims.exn @x0))
       (HasType @x7 (Tm_arrow_a1c23f05d4ee72892690ac239bf26df3 uu___334 @x0))
       (HasType @x8 (Tm_refine_757d1b83b4b8a8a6fda30f526e9b3c1e uu___334 @x7))
       (HasType @x9 (Tm_refine_1f35ea430b5c424e8ca89536d2519ef8 uu___334 @x0 @x6)))
      label_1)
     :qid @query)))
  :named @query))
(set-option :rlimit 2500000)
(echo "<initial_stats>")
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "</initial_stats>")
(echo "<result>")
(check-sat)
(echo "</result>")
(set-option :rlimit 0)
(echo "<reason-unknown>") (get-info :reason-unknown) (echo "</reason-unknown>")
(echo "<labels>")
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop
