​; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: c6168e73da96b23a68fc1c24b3e6cf09be260b2a-dirty
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
(set-option :smt.ho_matching true)


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
(define-fun Unreachable () Bool false)
(declare-fun Tm_refinement (Term (=> Term Bool)) Term)
(assert (forall ((x Term) (base Term) (f (=> Term Bool)))
                  (! (iff (and (HasType x base) (select f x))
                          (HasType x (Tm_refinement base f)))
                  :pattern ((HasType x (Tm_refinement base f)))
                  :qid refine_interpretation)))
(assert (forall ((t Term) (base Term) (f (=> Term Bool)))
                  (! (iff (HasType base t)
                          (HasType (Tm_refinement base f) t))
                  :pattern ((HasType (Tm_refinement base f) t))
                  :qid refine_typing)))
(declare-fun Tm_lambda (Term (=> Term Term)) Term)
(assert (forall ((t Term) (f (=> Term Term)) (x Term))
                  (! (implies (HasTypeFuel ZFuel x t)
                              (= (ApplyTT (Tm_lambda t f) x)
                                 (select f x)))
                  :pattern ((ApplyTT (Tm_lambda t f) x))
                  :qid beta_reduction)))
(declare-fun WithType (Term Term) Term)
(assert (forall ((t Term) (ty Term))
                        (! (and (HasType (WithType t ty) ty)
                                (= (WithType t ty) t))
                          :pattern ((WithType t ty)))))
(declare-fun WithInterp (Term Bool) Term)
(assert (forall ((t Term) (interp Bool))
                        (! (and (= (Valid t) interp)
                                (= (WithInterp t interp) t))
                          :pattern ((WithInterp t interp)))))
; <start constructor FString_const>
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
(declare-fun HO_MonoidMul.Monoid (Universe Term Term Term Term Term Term) Term)
; Projector
(declare-fun HO_MonoidMul.Monoid_@0 (Term) Universe)
; Projector
(declare-fun HO_MonoidMul.Monoid_@a (Term) Term)
; Projector
(declare-fun HO_MonoidMul.Monoid_@associativity (Term) Term)
; Projector
(declare-fun HO_MonoidMul.Monoid_@left_unitality (Term) Term)
; Projector
(declare-fun HO_MonoidMul.Monoid_@mult (Term) Term)
; Projector
(declare-fun HO_MonoidMul.Monoid_@right_unitality (Term) Term)
; Projector
(declare-fun HO_MonoidMul.Monoid_@unit (Term) Term)
(declare-fun HO_MonoidMul.__proj__Monoid__item__mult (Universe Term Term) Term)
(declare-fun HO_MonoidMul.__proj__Monoid__item__unit (Universe Term Term) Term)
(declare-fun HO_MonoidMul.associativity_lemma (Universe Term Term) Term)
(declare-fun HO_MonoidMul.left_unitality_lemma (Universe Term Term Term) Term)
; Constructor
(declare-fun HO_MonoidMul.monoid (Universe Term) Term)
; token
(declare-fun HO_MonoidMul.monoid@tok (Universe) Term)
(declare-fun HO_MonoidMul.right_unitality_lemma (Universe Term Term Term) Term)
(declare-fun Prims.eq2 (Universe Term Term Term) Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.hasEq (Universe Term) Term)
(declare-fun Prims.l_Forall (Universe Term Term) Term)
(declare-fun Prims.l_True () Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_post (Universe Term) Term)
(declare-fun Prims.pure_post_ (Universe Term Term) Term)
(declare-fun Prims.squash (Term) Term)
(declare-fun Prims.unit () Term)
; _: a -> _: a -> a
(declare-fun Tm_arrow_d64d4275ed8e577d65d5c1671754751b (Term Universe) Term)
; _: a -> Prims.GTot prop
(declare-fun Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 (Term Universe) Term)
; _: a{pre} -> prop
(declare-fun Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8 (Term Term Universe) Term)
; Discriminator definition
(define-fun is-HO_MonoidMul.Monoid ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 144)
  (=
   __@x0
   (HO_MonoidMul.Monoid
    (HO_MonoidMul.Monoid_@0 __@x0)
    (HO_MonoidMul.Monoid_@a __@x0)
    (HO_MonoidMul.Monoid_@unit __@x0)
    (HO_MonoidMul.Monoid_@mult __@x0)
    (HO_MonoidMul.Monoid_@right_unitality __@x0)
    (HO_MonoidMul.Monoid_@left_unitality __@x0)
    (HO_MonoidMul.Monoid_@associativity __@x0)))))
; interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b
;;; Fact-ids: Name HO_MonoidMul.right_unitality_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(3,27-3,28); use=HO_MonoidMul.fst(3,50-3,61)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u2))
     (and
      ;; def=HO_MonoidMul.fst(3,27-3,28); use=HO_MonoidMul.fst(3,50-3,61)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and (HasType @x3 @x1) (HasType @x4 @x1))
         (HasType (ApplyTT (ApplyTT @x0 @x3) @x4) @x1))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid HO_MonoidMul_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b.1))
      (IsTotFun @x0)
      ;; def=HO_MonoidMul.fst(3,27-3,28); use=HO_MonoidMul.fst(3,50-3,61)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 @x1) (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid HO_MonoidMul_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u2)))
    :qid HO_MonoidMul_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
  :named HO_MonoidMul_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
; interpretation_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45
;;; Fact-ids: Name Prims.l_Forall; Namespace Prims
(assert
 (! ;; def=Prims.fst(264,22-264,73); use=Prims.fst(264,59-264,73)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u2))
     (and
      ;; def=Prims.fst(264,22-264,73); use=Prims.fst(264,59-264,73)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 @x1) (HasType (ApplyTT @x0 @x3) Prims.prop))
        :pattern ((ApplyTT @x0 @x3))
        :qid Prims_interpretation_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u2)))
    :qid Prims_interpretation_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45))
  :named Prims_interpretation_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45))
; interpretation_Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,56); use=Prims.fst(281,39-281,56)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8 @x1 @x2 @u3))
     (and
      ;; def=Prims.fst(281,39-281,56); use=Prims.fst(281,39-281,56)
      (forall ((@x4 Term))
       (! (implies
         ;; def=Prims.fst(281,39-281,48); use=Prims.fst(281,39-281,48)
         (HasType
          @x4
          ;; def=Prims.fst(281,39-281,48); use=Prims.fst(281,39-281,48)
          (Tm_refinement
           @x1
           ;; def=Prims.fst(281,39-281,48); use=Prims.fst(281,39-281,48)
           (lambda ((@x5 Term))
            ;; def=Prims.fst(281,26-281,29); use=Prims.fst(281,44-281,47)
            (Valid
             ;; def=Prims.fst(281,26-281,29); use=Prims.fst(281,44-281,47)
             @x2))))
         (HasType (ApplyTT @x0 @x4) Prims.prop))
        :pattern ((ApplyTT @x0 @x4))
        :qid Prims_interpretation_Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8 @x1 @x2 @u3)))
    :qid Prims_interpretation_Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8))
  :named Prims_interpretation_Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8))
; Assumption: HO_MonoidMul.monoid__uu___haseq
;;; Fact-ids: Name HO_MonoidMul.monoid__uu___haseq; Namespace HO_MonoidMul
(assert
 (! (forall ((@u0 Universe))
   (! (forall ((@x1 Term))
     (! (implies
       (and
        (HasType @x1 (Tm_type @u0))
        (forall ((@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
         (! (implies
           (and
            (HasType @x2 @x1)
            (HasType @x3 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0))
            (HasType @x4 (Prims.squash (HO_MonoidMul.right_unitality_lemma @u0 @x1 @x2 @x3)))
            (HasType @x5 (Prims.squash (HO_MonoidMul.left_unitality_lemma @u0 @x1 @x2 @x3)))
            (HasType @x6 (Prims.squash (HO_MonoidMul.associativity_lemma @u0 @x1 @x3))))
           (and
            (Valid (Prims.hasEq @u0 @x1))
            (Valid (Prims.hasEq @u0 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
            (Valid
             (Prims.hasEq U_zero (Prims.squash (HO_MonoidMul.right_unitality_lemma @u0 @x1 @x2 @x3))))
            (Valid
             (Prims.hasEq U_zero (Prims.squash (HO_MonoidMul.left_unitality_lemma @u0 @x1 @x2 @x3))))
            (Valid
             (Prims.hasEq U_zero (Prims.squash (HO_MonoidMul.associativity_lemma @u0 @x1 @x3))))))
          :qid assumption_HO_MonoidMul.monoid__uu___haseq.2)))
       (Valid (Prims.hasEq @u0 (HO_MonoidMul.monoid @u0 @x1))))
      :pattern ((Prims.hasEq @u0 (HO_MonoidMul.monoid @u0 @x1)))
      :qid assumption_HO_MonoidMul.monoid__uu___haseq.1))
    :qid assumption_HO_MonoidMul.monoid__uu___haseq))
  :named assumption_HO_MonoidMul.monoid__uu___haseq))
; Constructor distinct
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (= 144 (Term_constr_id (HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6)))
    :pattern ((HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid constructor_distinct_HO_MonoidMul.Monoid))
  :named constructor_distinct_HO_MonoidMul.Monoid))
; Constructor distinct
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(13,5-13,11); use=HO_MonoidMul.fst(13,5-13,11)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 135 (Term_constr_id (HO_MonoidMul.monoid @u0 @x1)))
    :pattern ((HO_MonoidMul.monoid @u0 @x1))
    :qid constructor_distinct_HO_MonoidMul.monoid))
  :named constructor_distinct_HO_MonoidMul.monoid))
; Constructor distinct
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (= 124 (Term_constr_id Prims.unit)) :named constructor_distinct_Prims.unit))
; data constructor typing elim
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
      (HO_MonoidMul.monoid @u1 @x8))
     (and
      (HasTypeFuel @u0 @x8 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 @x8)
      (HasTypeFuel @u0 @x4 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x8 @u1))
      (HasTypeFuel @u0 @x5 (Prims.squash (HO_MonoidMul.right_unitality_lemma @u1 @x8 @x3 @x4)))
      (HasTypeFuel @u0 @x6 (Prims.squash (HO_MonoidMul.left_unitality_lemma @u1 @x8 @x3 @x4)))
      (HasTypeFuel @u0 @x7 (Prims.squash (HO_MonoidMul.associativity_lemma @u1 @x8 @x4)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
       (HO_MonoidMul.monoid @u1 @x8)))
    :qid data_elim_HO_MonoidMul.Monoid))
  :named data_elim_HO_MonoidMul.Monoid))
; data constructor typing intro
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall
    ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x2 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 @x2)
      (HasTypeFuel @u0 @x4 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x2 @u1))
      (HasTypeFuel @u0 @x5 (Prims.squash (HO_MonoidMul.right_unitality_lemma @u1 @x2 @x3 @x4)))
      (HasTypeFuel @u0 @x6 (Prims.squash (HO_MonoidMul.left_unitality_lemma @u1 @x2 @x3 @x4)))
      (HasTypeFuel @u0 @x7 (Prims.squash (HO_MonoidMul.associativity_lemma @u1 @x2 @x4))))
     (HasTypeFuel
      @u0
      (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
      (HO_MonoidMul.monoid @u1 @x2)))
    :pattern
     ((HasTypeFuel
       @u0
       (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
       (HO_MonoidMul.monoid @u1 @x2)))
    :qid data_typing_intro_HO_MonoidMul.Monoid@tok))
  :named data_typing_intro_HO_MonoidMul.Monoid@tok))
; Equation for HO_MonoidMul.associativity_lemma
;;; Fact-ids: Name HO_MonoidMul.associativity_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(9,4-9,23); use=HO_MonoidMul.fst(9,4-9,23)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (HO_MonoidMul.associativity_lemma @u0 @x1 @x2)
     (WithInterp
      (Prims.l_Forall
       @u0
       @x1
       (WithType
        ;; def=HO_MonoidMul.fst(10,9-10,64); use=HO_MonoidMul.fst(10,9-10,64)
        (Tm_lambda
         @x1
         ;; def=HO_MonoidMul.fst(10,9-10,64); use=HO_MonoidMul.fst(10,9-10,64)
         (lambda ((@x3 Term))
          (Prims.l_Forall
           @u0
           @x1
           (WithType
            ;; def=HO_MonoidMul.fst(10,9-10,64); use=HO_MonoidMul.fst(10,9-10,64)
            (Tm_lambda
             @x1
             ;; def=HO_MonoidMul.fst(10,9-10,64); use=HO_MonoidMul.fst(10,9-10,64)
             (lambda ((@x4 Term))
              (Prims.l_Forall
               @u0
               @x1
               (WithType
                ;; def=HO_MonoidMul.fst(10,9-10,64); use=HO_MonoidMul.fst(10,9-10,64)
                (Tm_lambda
                 @x1
                 ;; def=HO_MonoidMul.fst(10,9-10,64); use=HO_MonoidMul.fst(10,9-10,64)
                 (lambda ((@x5 Term))
                  (Prims.eq2
                   @u0
                   @x1
                   (ApplyTT (ApplyTT @x2 (ApplyTT (ApplyTT @x2 @x3) @x4)) @x5)
                   (ApplyTT (ApplyTT @x2 @x3) (ApplyTT (ApplyTT @x2 @x4) @x5)))))
                (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u0)))))
            (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u0)))))
        (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u0)))
      ;; def=HO_MonoidMul.fst(10,2-10,64); use=HO_MonoidMul.fst(10,2-10,64)
      (forall ((@x3 Term) (@x4 Term) (@x5 Term))
       (! (implies
         (and (HasType @x3 @x1) (HasType @x4 @x1) (HasType @x5 @x1))
         ;; def=HO_MonoidMul.fst(10,20-10,64); use=HO_MonoidMul.fst(10,20-10,64)
         (=
          (ApplyTT (ApplyTT @x2 (ApplyTT (ApplyTT @x2 @x3) @x4)) @x5)
          (ApplyTT (ApplyTT @x2 @x3) (ApplyTT (ApplyTT @x2 @x4) @x5))))
        :qid defn_equation_HO_MonoidMul.associativity_lemma.1))))
    :pattern ((HO_MonoidMul.associativity_lemma @u0 @x1 @x2))
    :qid defn_equation_HO_MonoidMul.associativity_lemma))
  :named defn_equation_HO_MonoidMul.associativity_lemma))
; Equation for HO_MonoidMul.left_unitality_lemma
;;; Fact-ids: Name HO_MonoidMul.left_unitality_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(6,4-6,24); use=HO_MonoidMul.fst(6,4-6,24)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (HO_MonoidMul.left_unitality_lemma @u0 @x1 @x2 @x3)
     (WithInterp
      (Prims.l_Forall
       @u0
       @x1
       (WithType
        ;; def=HO_MonoidMul.fst(7,2-7,34); use=HO_MonoidMul.fst(7,2-7,34)
        (Tm_lambda
         @x1
         ;; def=HO_MonoidMul.fst(7,2-7,34); use=HO_MonoidMul.fst(7,2-7,34)
         (lambda ((@x4 Term)) (Prims.eq2 @u0 @x1 (ApplyTT (ApplyTT @x3 @x2) @x4) @x4)))
        (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u0)))
      ;; def=HO_MonoidMul.fst(7,2-7,34); use=HO_MonoidMul.fst(7,2-7,34)
      (forall ((@x4 Term))
       (! (implies
         (HasType @x4 @x1)
         ;; def=HO_MonoidMul.fst(7,16-7,34); use=HO_MonoidMul.fst(7,16-7,34)
         (= (ApplyTT (ApplyTT @x3 @x2) @x4) @x4))
        :qid defn_equation_HO_MonoidMul.left_unitality_lemma.1))))
    :pattern ((HO_MonoidMul.left_unitality_lemma @u0 @x1 @x2 @x3))
    :qid defn_equation_HO_MonoidMul.left_unitality_lemma))
  :named defn_equation_HO_MonoidMul.left_unitality_lemma))
; Equation for HO_MonoidMul.right_unitality_lemma
;;; Fact-ids: Name HO_MonoidMul.right_unitality_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(3,4-3,25); use=HO_MonoidMul.fst(3,4-3,25)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (HO_MonoidMul.right_unitality_lemma @u0 @x1 @x2 @x3)
     (WithInterp
      (Prims.l_Forall
       @u0
       @x1
       (WithType
        ;; def=HO_MonoidMul.fst(4,2-4,34); use=HO_MonoidMul.fst(4,2-4,34)
        (Tm_lambda
         @x1
         ;; def=HO_MonoidMul.fst(4,2-4,34); use=HO_MonoidMul.fst(4,2-4,34)
         (lambda ((@x4 Term)) (Prims.eq2 @u0 @x1 (ApplyTT (ApplyTT @x3 @x4) @x2) @x4)))
        (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u0)))
      ;; def=HO_MonoidMul.fst(4,2-4,34); use=HO_MonoidMul.fst(4,2-4,34)
      (forall ((@x4 Term))
       (! (implies
         (HasType @x4 @x1)
         ;; def=HO_MonoidMul.fst(4,16-4,34); use=HO_MonoidMul.fst(4,16-4,34)
         (= (ApplyTT (ApplyTT @x3 @x4) @x2) @x4))
        :qid defn_equation_HO_MonoidMul.right_unitality_lemma.1))))
    :pattern ((HO_MonoidMul.right_unitality_lemma @u0 @x1 @x2 @x3))
    :qid defn_equation_HO_MonoidMul.right_unitality_lemma))
  :named defn_equation_HO_MonoidMul.right_unitality_lemma))
; Eq2 interpretation
;;; Fact-ids: Name Prims.eq2; Namespace Prims
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff (= @x2 @x3) (Valid (Prims.eq2 @u0 @x1 @x2 @x3)))
    :pattern ((Prims.eq2 @u0 @x1 @x2 @x3))
    :qid eq2-interp))
  :named eq2-interp))
; Equation for HO_MonoidMul.associativity_lemma
;;; Fact-ids: Name HO_MonoidMul.associativity_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(9,4-9,23); use=HO_MonoidMul.fst(9,4-9,23)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (Valid (HO_MonoidMul.associativity_lemma @u0 @x1 @x2))
     ;; def=HO_MonoidMul.fst(10,2-10,64); use=HO_MonoidMul.fst(10,2-10,64)
     (forall ((@x3 Term) (@x4 Term) (@x5 Term))
      (! (implies
        (and (HasType @x3 @x1) (HasType @x4 @x1) (HasType @x5 @x1))
        ;; def=HO_MonoidMul.fst(10,20-10,64); use=HO_MonoidMul.fst(10,20-10,64)
        (=
         (ApplyTT (ApplyTT @x2 (ApplyTT (ApplyTT @x2 @x3) @x4)) @x5)
         (ApplyTT (ApplyTT @x2 @x3) (ApplyTT (ApplyTT @x2 @x4) @x5))))
       :qid equation_HO_MonoidMul.associativity_lemma.1)))
    :pattern ((HO_MonoidMul.associativity_lemma @u0 @x1 @x2))
    :qid equation_HO_MonoidMul.associativity_lemma))
  :named equation_HO_MonoidMul.associativity_lemma))
; Equation for HO_MonoidMul.left_unitality_lemma
;;; Fact-ids: Name HO_MonoidMul.left_unitality_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(6,4-6,24); use=HO_MonoidMul.fst(6,4-6,24)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (Valid (HO_MonoidMul.left_unitality_lemma @u0 @x1 @x2 @x3))
     ;; def=HO_MonoidMul.fst(7,2-7,34); use=HO_MonoidMul.fst(7,2-7,34)
     (forall ((@x4 Term))
      (! (implies
        (HasType @x4 @x1)
        ;; def=HO_MonoidMul.fst(7,16-7,34); use=HO_MonoidMul.fst(7,16-7,34)
        (= (ApplyTT (ApplyTT @x3 @x2) @x4) @x4))
       :qid equation_HO_MonoidMul.left_unitality_lemma.1)))
    :pattern ((HO_MonoidMul.left_unitality_lemma @u0 @x1 @x2 @x3))
    :qid equation_HO_MonoidMul.left_unitality_lemma))
  :named equation_HO_MonoidMul.left_unitality_lemma))
; Equation for HO_MonoidMul.right_unitality_lemma
;;; Fact-ids: Name HO_MonoidMul.right_unitality_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(3,4-3,25); use=HO_MonoidMul.fst(3,4-3,25)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (Valid (HO_MonoidMul.right_unitality_lemma @u0 @x1 @x2 @x3))
     ;; def=HO_MonoidMul.fst(4,2-4,34); use=HO_MonoidMul.fst(4,2-4,34)
     (forall ((@x4 Term))
      (! (implies
        (HasType @x4 @x1)
        ;; def=HO_MonoidMul.fst(4,16-4,34); use=HO_MonoidMul.fst(4,16-4,34)
        (= (ApplyTT (ApplyTT @x3 @x4) @x2) @x4))
       :qid equation_HO_MonoidMul.right_unitality_lemma.1)))
    :pattern ((HO_MonoidMul.right_unitality_lemma @u0 @x1 @x2 @x3))
    :qid equation_HO_MonoidMul.right_unitality_lemma))
  :named equation_HO_MonoidMul.right_unitality_lemma))
; Equation for Prims.eqtype
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (=
   Prims.eqtype
   ;; def=Prims.fst(90,14-90,31); use=Prims.fst(90,14-90,31)
   (Tm_refinement
    (Tm_type U_zero)
    ;; def=Prims.fst(90,14-90,31); use=Prims.fst(90,14-90,31)
    (lambda ((@x0 Term))
     ;; def=Prims.fst(90,23-90,30); use=Prims.fst(90,23-90,30)
     (Valid
      ;; def=Prims.fst(90,23-90,30); use=Prims.fst(90,23-90,30)
      (Prims.hasEq U_zero @x0)))))
  :named equation_Prims.eqtype))
; Equation for Prims.pure_post
;;; Fact-ids: Name Prims.pure_post; Namespace Prims
(assert
 (! ;; def=Prims.fst(282,4-282,13); use=Prims.fst(282,4-282,13)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (Prims.pure_post @u0 @x1) (Prims.pure_post_ @u0 @x1 Prims.l_True))
    :pattern ((Prims.pure_post @u0 @x1))
    :qid equation_Prims.pure_post))
  :named equation_Prims.pure_post))
; Equation for Prims.pure_post'
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,4-281,14); use=Prims.fst(281,4-281,14)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (Prims.pure_post_ @u0 @x1 @x2) (Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8 @x1 @x2 @u0))
    :pattern ((Prims.pure_post_ @u0 @x1 @x2))
    :qid equation_Prims.pure_post_))
  :named equation_Prims.pure_post_))
; Equation for Prims.squash
;;; Fact-ids: Name Prims.squash; Namespace Prims
(assert
 (! ;; def=Prims.fst(134,5-134,11); use=Prims.fst(134,5-134,11)
  (forall ((@x0 Term))
   (! (=
     (Prims.squash @x0)
     ;; def=Prims.fst(134,32-134,42); use=Prims.fst(134,32-134,42)
     (Tm_refinement
      Prims.unit
      ;; def=Prims.fst(134,32-134,42); use=Prims.fst(134,32-134,42)
      (lambda ((@x1 Term))
       ;; def=Prims.fst(134,13-134,14); use=Prims.fst(134,40-134,41)
       (Valid
        ;; def=Prims.fst(134,13-134,14); use=Prims.fst(134,40-134,41)
        @x0))))
    :pattern ((Prims.squash @x0))
    :qid equation_Prims.squash))
  :named equation_Prims.squash))
; fresh token
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! (forall ((@u0 Universe))
   (! (= 136 (Term_constr_id (HO_MonoidMul.monoid@tok @u0)))
    :pattern ((HO_MonoidMul.monoid@tok @u0))
    :qid fresh_token_HO_MonoidMul.monoid@tok))
  :named fresh_token_HO_MonoidMul.monoid@tok))
; inversion axiom
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(13,5-13,11); use=HO_MonoidMul.fst(13,5-13,11)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (HO_MonoidMul.monoid @u2 @x3))
     (and
      (is-HO_MonoidMul.Monoid @x1)
      (= @u2 (HO_MonoidMul.Monoid_@0 @x1))
      (= @x3 (HO_MonoidMul.Monoid_@a @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (HO_MonoidMul.monoid @u2 @x3)))
    :qid fuel_guarded_inversion_HO_MonoidMul.monoid))
  :named fuel_guarded_inversion_HO_MonoidMul.monoid))
; function token typing
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named function_token_typing_Prims.eqtype))
; function token typing
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert
 (! (HasType Prims.l_True Prims.prop) :named function_token_typing_Prims.l_True))
; function token typing
;;; Fact-ids: Name Prims.prop; Namespace Prims
(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named function_token_typing_Prims.prop))
; function token typing
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (HasType Prims.unit Prims.eqtype) :named function_token_typing_Prims.unit))
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! (and
   ;; def=HO_MonoidMul.fst(13,5-13,11); use=HO_MonoidMul.fst(13,5-13,11)
   (forall ((@u0 Universe))
    (! (IsTotFun (HO_MonoidMul.monoid@tok @u0))
     :pattern ((HO_MonoidMul.monoid@tok @u0))
     :qid kinding_HO_MonoidMul.monoid@tok))
   ;; def=HO_MonoidMul.fst(13,5-13,11); use=HO_MonoidMul.fst(13,5-13,11)
   (forall ((@u0 Universe) (@x1 Term))
    (! (implies (HasType @x1 (Tm_type @u0)) (HasType (HO_MonoidMul.monoid @u0 @x1) (Tm_type @u0)))
     :pattern ((HO_MonoidMul.monoid @u0 @x1))
     :qid kinding_HO_MonoidMul.monoid@tok.1)))
  :named kinding_HO_MonoidMul.monoid@tok))
; kinding_Tm_arrow_d64d4275ed8e577d65d5c1671754751b
;;; Fact-ids: Name HO_MonoidMul.right_unitality_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(3,27-3,28); use=HO_MonoidMul.fst(3,50-3,61)
  (forall ((@x0 Term) (@u1 Universe))
   (! (HasType (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x0 @u1) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x0 @u1) (Tm_type @u1)))
    :qid kinding_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
  :named kinding_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
; kinding_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45
;;; Fact-ids: Name Prims.l_Forall; Namespace Prims
(assert
 (! ;; def=Prims.fst(264,22-264,73); use=Prims.fst(264,59-264,73)
  (forall ((@x0 Term) (@u1 Universe))
   (! (HasType (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1) (Tm_type @u1)))
    :qid kinding_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45))
  :named kinding_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45))
; kinding_Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,56); use=Prims.fst(281,39-281,56)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (HasType (Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8 @x0 @x1 @u2) (Tm_type @u2))
    :pattern ((HasType (Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8 @x0 @x1 @u2) (Tm_type @u2)))
    :qid kinding_Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8))
  :named kinding_Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8))
; Projector equation
;;; Fact-ids: Name HO_MonoidMul.__proj__Monoid__item__mult; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(16,4-16,8); use=HO_MonoidMul.fst(16,4-16,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (HO_MonoidMul.__proj__Monoid__item__mult @u0 @x1 @x2) (HO_MonoidMul.Monoid_@mult @x2))
    :pattern ((HO_MonoidMul.__proj__Monoid__item__mult @u0 @x1 @x2))
    :qid proj_equation_HO_MonoidMul.Monoid_@mult))
  :named proj_equation_HO_MonoidMul.Monoid_@mult))
; Projector equation
;;; Fact-ids: Name HO_MonoidMul.__proj__Monoid__item__unit; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(15,4-15,8); use=HO_MonoidMul.fst(15,4-15,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (HO_MonoidMul.__proj__Monoid__item__unit @u0 @x1 @x2) (HO_MonoidMul.Monoid_@unit @x2))
    :pattern ((HO_MonoidMul.__proj__Monoid__item__unit @u0 @x1 @x2))
    :qid proj_equation_HO_MonoidMul.Monoid_@unit))
  :named proj_equation_HO_MonoidMul.Monoid_@unit))
; Projection inverse
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (= (HO_MonoidMul.Monoid_@0 (HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6)) @u0)
    :pattern ((HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_HO_MonoidMul.Monoid_@0))
  :named projection_inverse_HO_MonoidMul.Monoid_@0))
; Projection inverse
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (= (HO_MonoidMul.Monoid_@a (HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6)) @x1)
    :pattern ((HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_HO_MonoidMul.Monoid_@a))
  :named projection_inverse_HO_MonoidMul.Monoid_@a))
; Projection inverse
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (= (HO_MonoidMul.Monoid_@associativity (HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6)) @x6)
    :pattern ((HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_HO_MonoidMul.Monoid_@associativity))
  :named projection_inverse_HO_MonoidMul.Monoid_@associativity))
; Projection inverse
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (= (HO_MonoidMul.Monoid_@left_unitality (HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6)) @x5)
    :pattern ((HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_HO_MonoidMul.Monoid_@left_unitality))
  :named projection_inverse_HO_MonoidMul.Monoid_@left_unitality))
; Projection inverse
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (= (HO_MonoidMul.Monoid_@mult (HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6)) @x3)
    :pattern ((HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_HO_MonoidMul.Monoid_@mult))
  :named projection_inverse_HO_MonoidMul.Monoid_@mult))
; Projection inverse
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (HO_MonoidMul.Monoid_@right_unitality (HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
     @x4)
    :pattern ((HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_HO_MonoidMul.Monoid_@right_unitality))
  :named projection_inverse_HO_MonoidMul.Monoid_@right_unitality))
; Projection inverse
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (= (HO_MonoidMul.Monoid_@unit (HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6)) @x2)
    :pattern ((HO_MonoidMul.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_HO_MonoidMul.Monoid_@unit))
  :named projection_inverse_HO_MonoidMul.Monoid_@unit))
; subterm ordering
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(14,4-14,10); use=HO_MonoidMul.fst(14,4-14,10)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
      (HO_MonoidMul.monoid @u1 @x8))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x3
        (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x4
        (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x5
        (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x6
        (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x7
        (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (HO_MonoidMul.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
       (HO_MonoidMul.monoid @u1 @x8)))
    :qid subterm_ordering_HO_MonoidMul.Monoid))
  :named subterm_ordering_HO_MonoidMul.Monoid))
; name-token correspondence
;;; Fact-ids: Name HO_MonoidMul.monoid; Namespace HO_MonoidMul; Name HO_MonoidMul.Monoid; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(13,5-13,11); use=HO_MonoidMul.fst(13,5-13,11)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (ApplyTT (HO_MonoidMul.monoid@tok @u0) @x1) (HO_MonoidMul.monoid @u0 @x1))
    :pattern ((ApplyTT (HO_MonoidMul.monoid@tok @u0) @x1))
    :pattern ((HO_MonoidMul.monoid @u0 @x1))
    :qid token_correspondence_HO_MonoidMul.monoid@tok))
  :named token_correspondence_HO_MonoidMul.monoid@tok))
; True interpretation
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert (! (Valid Prims.l_True) :named true_interp))
; free var typing
;;; Fact-ids: Name HO_MonoidMul.__proj__Monoid__item__mult; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(16,4-16,8); use=HO_MonoidMul.fst(16,4-16,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (HO_MonoidMul.monoid @u0 @x1)))
     (HasType
      (HO_MonoidMul.__proj__Monoid__item__mult @u0 @x1 @x2)
      (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
    :pattern ((HO_MonoidMul.__proj__Monoid__item__mult @u0 @x1 @x2))
    :qid typing_HO_MonoidMul.__proj__Monoid__item__mult))
  :named typing_HO_MonoidMul.__proj__Monoid__item__mult))
; free var typing
;;; Fact-ids: Name HO_MonoidMul.__proj__Monoid__item__unit; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(15,4-15,8); use=HO_MonoidMul.fst(15,4-15,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (HO_MonoidMul.monoid @u0 @x1)))
     (HasType (HO_MonoidMul.__proj__Monoid__item__unit @u0 @x1 @x2) @x1))
    :pattern ((HO_MonoidMul.__proj__Monoid__item__unit @u0 @x1 @x2))
    :qid typing_HO_MonoidMul.__proj__Monoid__item__unit))
  :named typing_HO_MonoidMul.__proj__Monoid__item__unit))
; free var typing
;;; Fact-ids: Name HO_MonoidMul.associativity_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(9,4-9,23); use=HO_MonoidMul.fst(9,4-9,23)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
     (HasType (HO_MonoidMul.associativity_lemma @u0 @x1 @x2) Prims.prop))
    :pattern ((HO_MonoidMul.associativity_lemma @u0 @x1 @x2))
    :qid typing_HO_MonoidMul.associativity_lemma))
  :named typing_HO_MonoidMul.associativity_lemma))
; free var typing
;;; Fact-ids: Name HO_MonoidMul.left_unitality_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(6,4-6,24); use=HO_MonoidMul.fst(6,4-6,24)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 @x1)
      (HasType @x3 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
     (HasType (HO_MonoidMul.left_unitality_lemma @u0 @x1 @x2 @x3) Prims.prop))
    :pattern ((HO_MonoidMul.left_unitality_lemma @u0 @x1 @x2 @x3))
    :qid typing_HO_MonoidMul.left_unitality_lemma))
  :named typing_HO_MonoidMul.left_unitality_lemma))
; free var typing
;;; Fact-ids: Name HO_MonoidMul.right_unitality_lemma; Namespace HO_MonoidMul
(assert
 (! ;; def=HO_MonoidMul.fst(3,4-3,25); use=HO_MonoidMul.fst(3,4-3,25)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 @x1)
      (HasType @x3 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
     (HasType (HO_MonoidMul.right_unitality_lemma @u0 @x1 @x2 @x3) Prims.prop))
    :pattern ((HO_MonoidMul.right_unitality_lemma @u0 @x1 @x2 @x3))
    :qid typing_HO_MonoidMul.right_unitality_lemma))
  :named typing_HO_MonoidMul.right_unitality_lemma))
; free var typing
;;; Fact-ids: Name Prims.eq2; Namespace Prims
(assert
 (! ;; def=Prims.fst(160,11-160,14); use=Prims.fst(160,11-160,14)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 @x1) (HasType @x3 @x1))
     (HasType (Prims.eq2 @u0 @x1 @x2 @x3) Prims.prop))
    :pattern ((Prims.eq2 @u0 @x1 @x2 @x3))
    :qid typing_Prims.eq2))
  :named typing_Prims.eq2))
; free var typing
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named typing_Prims.eqtype))
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
;;; Fact-ids: Name Prims.l_Forall; Namespace Prims
(assert
 (! ;; def=Prims.fst(264,11-264,19); use=Prims.fst(264,11-264,19)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u0)))
     (HasType (Prims.l_Forall @u0 @x1 @x2) Prims.prop))
    :pattern ((Prims.l_Forall @u0 @x1 @x2))
    :qid typing_Prims.l_Forall))
  :named typing_Prims.l_Forall))
; free var typing
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert
 (! (HasType Prims.l_True Prims.prop) :named typing_Prims.l_True))
; free var typing
;;; Fact-ids: Name Prims.prop; Namespace Prims
(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named typing_Prims.prop))
; free var typing
;;; Fact-ids: Name Prims.pure_post; Namespace Prims
(assert
 (! ;; def=Prims.fst(282,4-282,13); use=Prims.fst(282,4-282,13)
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies (HasType @x1 (Tm_type @u0)) (HasType (Prims.pure_post @u0 @x1) (Tm_type @u0)))
    :pattern ((Prims.pure_post @u0 @x1))
    :qid typing_Prims.pure_post))
  :named typing_Prims.pure_post))
; free var typing
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,4-281,14); use=Prims.fst(281,4-281,14)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 Prims.prop))
     (HasType (Prims.pure_post_ @u0 @x1 @x2) (Tm_type @u0)))
    :pattern ((Prims.pure_post_ @u0 @x1 @x2))
    :qid typing_Prims.pure_post_))
  :named typing_Prims.pure_post_))
; free var typing
;;; Fact-ids: Name Prims.squash; Namespace Prims
(assert
 (! ;; def=Prims.fst(134,5-134,11); use=Prims.fst(134,5-134,11)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.prop) (HasType (Prims.squash @x0) (Tm_type U_zero)))
    :pattern ((Prims.squash @x0))
    :qid typing_Prims.squash))
  :named typing_Prims.squash))
; free var typing
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (HasType Prims.unit Prims.eqtype) :named typing_Prims.unit))
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
; universe local constant
(declare-fun uu___174 () Universe)
(declare-fun label_1 () Bool)

; Encoding query formula : forall (a: Type)
;   (unit: a)
;   (mult: (_: a -> _: a -> a))
;   (p: Prims.pure_post (HO_MonoidMul.monoid a))
;   (_:
;   Prims.squash (HO_MonoidMul.right_unitality_lemma a unit mult /\
;       HO_MonoidMul.left_unitality_lemma a unit mult /\ HO_MonoidMul.associativity_lemma a mult /\
;       (forall (pure_result: HO_MonoidMul.monoid a).
;           pure_result.unit == unit /\ pure_result.mult == mult ==> p pure_result))).
;   (* - Subtyping check failed\n  - Expected type Prims.squash (right_unitality_lemma a unit mult)\n    got type Prims.unit *)
;   HO_MonoidMul.right_unitality_lemma a unit mult
; Context: While encoding a query
; While typechecking the top-level declaration ‘let intro_monoid’
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
   (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
    (! (implies
      (and
       (HasType @x0 (Tm_type uu___174))
       (HasType @x1 @x0)
       (HasType @x2 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x0 uu___174))
       (HasType @x3 (Prims.pure_post uu___174 (HO_MonoidMul.monoid uu___174 @x0)))
       (HasType @x4 Prims.unit)
       ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.right_unitality_lemma uu___174 @x0 @x1 @x2))
       ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.left_unitality_lemma uu___174 @x0 @x1 @x2))
       ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.associativity_lemma uu___174 @x0 @x2))
       ;; def=Prims.fst(409,36-409,97); use=HO_MonoidMul.fst(28,4-28,29)
       (forall ((@x5 Term))
        (! (implies
          (and
           (HasType @x5 (HO_MonoidMul.monoid uu___174 @x0))
           ;; def=HO_MonoidMul.fst(27,23-27,45); use=HO_MonoidMul.fst(28,4-28,29)
           (= (HO_MonoidMul.__proj__Monoid__item__unit uu___174 @x0 @x5) @x1)
           ;; def=HO_MonoidMul.fst(27,49-27,71); use=HO_MonoidMul.fst(28,4-28,29)
           (= (HO_MonoidMul.__proj__Monoid__item__mult uu___174 @x0 @x5) @x2))
          ;; def=Prims.fst(409,83-409,96); use=HO_MonoidMul.fst(28,4-28,29)
          (Valid
           ;; def=Prims.fst(409,83-409,96); use=HO_MonoidMul.fst(28,4-28,29)
           (ApplyTT @x3 @x5)))
         :qid @query.1)))
      ;; def=HO_MonoidMul.fst(17,27-17,62); use=HO_MonoidMul.fst(28,21-28,23)
      (or
       label_1
       ;; def=HO_MonoidMul.fst(17,27-17,62); use=HO_MonoidMul.fst(28,21-28,23)
       (Valid
        ;; def=HO_MonoidMul.fst(17,27-17,62); use=HO_MonoidMul.fst(28,21-28,23)
        (HO_MonoidMul.right_unitality_lemma uu___174 @x0 @x1 @x2))))
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
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "<labels>")
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (HO_MonoidMul.intro_monoid, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: c6168e73da96b23a68fc1c24b3e6cf09be260b2a-dirty
; Z3 version (according to F*): 4.17.1

(pop) ;; 1}pop
(push) ;; push{1
; universe local constant
(declare-fun uu___174 () Universe)
(declare-fun label_1 () Bool)

; Encoding query formula : forall (a: Type)
;   (unit: a)
;   (mult: (_: a -> _: a -> a))
;   (p: Prims.pure_post (HO_MonoidMul.monoid a))
;   (_:
;   Prims.squash (HO_MonoidMul.right_unitality_lemma a unit mult /\
;       HO_MonoidMul.left_unitality_lemma a unit mult /\ HO_MonoidMul.associativity_lemma a mult /\
;       (forall (pure_result: HO_MonoidMul.monoid a).
;           pure_result.unit == unit /\ pure_result.mult == mult ==> p pure_result)))
;   (any_result: Prims.unit).
;   (* - Subtyping check failed\n  - Expected type Prims.squash (left_unitality_lemma a unit mult)\n    got type Prims.unit *)
;   HO_MonoidMul.left_unitality_lemma a unit mult
; Context: While encoding a query
; While typechecking the top-level declaration ‘let intro_monoid’
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
   (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
    (! (implies
      (and
       (HasType @x0 (Tm_type uu___174))
       (HasType @x1 @x0)
       (HasType @x2 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x0 uu___174))
       (HasType @x3 (Prims.pure_post uu___174 (HO_MonoidMul.monoid uu___174 @x0)))
       (HasType @x4 Prims.unit)
       ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.right_unitality_lemma uu___174 @x0 @x1 @x2))
       ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.left_unitality_lemma uu___174 @x0 @x1 @x2))
       ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.associativity_lemma uu___174 @x0 @x2))
       ;; def=Prims.fst(409,36-409,97); use=HO_MonoidMul.fst(28,4-28,29)
       (forall ((@x6 Term))
        (! (implies
          (and
           (HasType @x6 (HO_MonoidMul.monoid uu___174 @x0))
           ;; def=HO_MonoidMul.fst(27,23-27,45); use=HO_MonoidMul.fst(28,4-28,29)
           (= (HO_MonoidMul.__proj__Monoid__item__unit uu___174 @x0 @x6) @x1)
           ;; def=HO_MonoidMul.fst(27,49-27,71); use=HO_MonoidMul.fst(28,4-28,29)
           (= (HO_MonoidMul.__proj__Monoid__item__mult uu___174 @x0 @x6) @x2))
          ;; def=Prims.fst(409,83-409,96); use=HO_MonoidMul.fst(28,4-28,29)
          (Valid
           ;; def=Prims.fst(409,83-409,96); use=HO_MonoidMul.fst(28,4-28,29)
           (ApplyTT @x3 @x6)))
         :qid @query.1))
       (HasType @x5 Prims.unit))
      ;; def=HO_MonoidMul.fst(18,26-18,60); use=HO_MonoidMul.fst(28,24-28,26)
      (or
       label_1
       ;; def=HO_MonoidMul.fst(18,26-18,60); use=HO_MonoidMul.fst(28,24-28,26)
       (Valid
        ;; def=HO_MonoidMul.fst(18,26-18,60); use=HO_MonoidMul.fst(28,24-28,26)
        (HO_MonoidMul.left_unitality_lemma uu___174 @x0 @x1 @x2))))
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
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "<labels>")
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (HO_MonoidMul.intro_monoid, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: c6168e73da96b23a68fc1c24b3e6cf09be260b2a-dirty
; Z3 version (according to F*): 4.17.1

(pop) ;; 1}pop
(push) ;; push{1
; universe local constant
(declare-fun uu___174 () Universe)
(declare-fun label_1 () Bool)

; Encoding query formula : forall (a: Type)
;   (unit: a)
;   (mult: (_: a -> _: a -> a))
;   (p: Prims.pure_post (HO_MonoidMul.monoid a))
;   (_:
;   Prims.squash (HO_MonoidMul.right_unitality_lemma a unit mult /\
;       HO_MonoidMul.left_unitality_lemma a unit mult /\ HO_MonoidMul.associativity_lemma a mult /\
;       (forall (pure_result: HO_MonoidMul.monoid a).
;           pure_result.unit == unit /\ pure_result.mult == mult ==> p pure_result)))
;   (any_result: Prims.unit)
;   (any_result: Prims.unit).
;   (* - Subtyping check failed\n  - Expected type Prims.squash (associativity_lemma a mult) got type Prims.unit *)
;   HO_MonoidMul.associativity_lemma a mult
; Context: While encoding a query
; While typechecking the top-level declaration ‘let intro_monoid’
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
   (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
    (! (implies
      (and
       (HasType @x0 (Tm_type uu___174))
       (HasType @x1 @x0)
       (HasType @x2 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x0 uu___174))
       (HasType @x3 (Prims.pure_post uu___174 (HO_MonoidMul.monoid uu___174 @x0)))
       (HasType @x4 Prims.unit)
       ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.right_unitality_lemma uu___174 @x0 @x1 @x2))
       ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.left_unitality_lemma uu___174 @x0 @x1 @x2))
       ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.associativity_lemma uu___174 @x0 @x2))
       ;; def=Prims.fst(409,36-409,97); use=HO_MonoidMul.fst(28,4-28,29)
       (forall ((@x7 Term))
        (! (implies
          (and
           (HasType @x7 (HO_MonoidMul.monoid uu___174 @x0))
           ;; def=HO_MonoidMul.fst(27,23-27,45); use=HO_MonoidMul.fst(28,4-28,29)
           (= (HO_MonoidMul.__proj__Monoid__item__unit uu___174 @x0 @x7) @x1)
           ;; def=HO_MonoidMul.fst(27,49-27,71); use=HO_MonoidMul.fst(28,4-28,29)
           (= (HO_MonoidMul.__proj__Monoid__item__mult uu___174 @x0 @x7) @x2))
          ;; def=Prims.fst(409,83-409,96); use=HO_MonoidMul.fst(28,4-28,29)
          (Valid
           ;; def=Prims.fst(409,83-409,96); use=HO_MonoidMul.fst(28,4-28,29)
           (ApplyTT @x3 @x7)))
         :qid @query.1))
       (HasType @x5 Prims.unit)
       (HasType @x6 Prims.unit))
      ;; def=HO_MonoidMul.fst(19,25-19,53); use=HO_MonoidMul.fst(28,27-28,29)
      (or
       label_1
       ;; def=HO_MonoidMul.fst(19,25-19,53); use=HO_MonoidMul.fst(28,27-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(19,25-19,53); use=HO_MonoidMul.fst(28,27-28,29)
        (HO_MonoidMul.associativity_lemma uu___174 @x0 @x2))))
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
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "<labels>")
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (HO_MonoidMul.intro_monoid, 3)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: c6168e73da96b23a68fc1c24b3e6cf09be260b2a-dirty
; Z3 version (according to F*): 4.17.1

(pop) ;; 1}pop
(push) ;; push{1
; universe local constant
(declare-fun uu___174 () Universe)
(declare-fun label_1 () Bool)

; Encoding query formula : forall (a: Type) (unit: a) (mult: (_: a -> _: a -> a)) (p: Prims.pure_post (HO_MonoidMul.monoid a))
;   (_:
;   Prims.squash (HO_MonoidMul.right_unitality_lemma a unit mult /\
;       HO_MonoidMul.left_unitality_lemma a unit mult /\ HO_MonoidMul.associativity_lemma a mult /\
;       (forall (pure_result: HO_MonoidMul.monoid a).
;           pure_result.unit == unit /\ pure_result.mult == mult ==> p pure_result)))
;   (any_result: Prims.unit) (any_result: Prims.unit) (any_result: Prims.unit)
;   (any_result: HO_MonoidMul.monoid a)
;   (_: Prims.squash (any_result == HO_MonoidMul.Monoid unit mult () () ()))
;   (return_val: HO_MonoidMul.monoid a) (_: Prims.squash (return_val == any_result)).
;   (* - Could not prove post-condition *) p return_val
; Context: While encoding a query
; While typechecking the top-level declaration ‘let intro_monoid’
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
      (@x9 Term)
      (@x10 Term)
      (@x11 Term))
    (! (implies
      (and
       (HasType @x0 (Tm_type uu___174))
       (HasType @x1 @x0)
       (HasType @x2 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x0 uu___174))
       (HasType @x3 (Prims.pure_post uu___174 (HO_MonoidMul.monoid uu___174 @x0)))
       (HasType @x4 Prims.unit)
       ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.right_unitality_lemma uu___174 @x0 @x1 @x2))
       ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.left_unitality_lemma uu___174 @x0 @x1 @x2))
       ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(28,4-28,29)
       (Valid
        ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(28,4-28,29)
        (HO_MonoidMul.associativity_lemma uu___174 @x0 @x2))
       ;; def=Prims.fst(409,36-409,97); use=HO_MonoidMul.fst(28,4-28,29)
       (forall ((@x12 Term))
        (! (implies
          (and
           (HasType @x12 (HO_MonoidMul.monoid uu___174 @x0))
           ;; def=HO_MonoidMul.fst(27,23-27,45); use=HO_MonoidMul.fst(28,4-28,29)
           (= (HO_MonoidMul.__proj__Monoid__item__unit uu___174 @x0 @x12) @x1)
           ;; def=HO_MonoidMul.fst(27,49-27,71); use=HO_MonoidMul.fst(28,4-28,29)
           (= (HO_MonoidMul.__proj__Monoid__item__mult uu___174 @x0 @x12) @x2))
          ;; def=Prims.fst(409,83-409,96); use=HO_MonoidMul.fst(28,4-28,29)
          (Valid
           ;; def=Prims.fst(409,83-409,96); use=HO_MonoidMul.fst(28,4-28,29)
           (ApplyTT @x3 @x12)))
         :qid @query.1))
       (HasType @x5 Prims.unit)
       (HasType @x6 Prims.unit)
       (HasType @x7 Prims.unit)
       (HasType @x8 (HO_MonoidMul.monoid uu___174 @x0))
       (HasType @x9 Prims.unit)
       ;; def=HO_MonoidMul.fst(23,9-28,29); use=HO_MonoidMul.fst(28,4-28,29)
       (= @x8 (HO_MonoidMul.Monoid uu___174 @x0 @x1 @x2 Tm_unit Tm_unit Tm_unit))
       (HasType @x10 (HO_MonoidMul.monoid uu___174 @x0))
       (HasType @x11 Prims.unit)
       ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
       (= @x10 @x8))
      ;; def=Prims.fst(322,46-322,58); use=HO_MonoidMul.fst(28,4-28,29)
      (or
       label_1
       ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
       (Valid
        ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
        (ApplyTT @x3 @x10))))
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
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "<labels>")
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (HO_MonoidMul.intro_monoid, 4)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: c6168e73da96b23a68fc1c24b3e6cf09be260b2a-dirty
; Z3 version (according to F*): 4.17.1

(pop) ;; 1}pop
(declare-fun Prims.int () Term)
(declare-fun Prims.op_Star (Term Term) Term)
(declare-fun Prims.op_Star@tok () Term)
; _: int -> _: int -> int
(declare-fun Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623 () Term)
; interpretation_Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! ;; def=Prims.fst(508,13-508,34); use=Prims.fst(508,13-508,34)
  (forall ((@x0 Term))
   (! (iff
     (HasTypeZ @x0 Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623)
     (and
      ;; def=Prims.fst(508,13-508,34); use=Prims.fst(508,13-508,34)
      (forall ((@x1 Term) (@x2 Term))
       (! (implies
         (and (HasType @x1 Prims.int) (HasType @x2 Prims.int))
         (HasType (ApplyTT (ApplyTT @x0 @x1) @x2) Prims.int))
        :pattern ((ApplyTT (ApplyTT @x0 @x1) @x2))
        :qid Prims_interpretation_Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623.1))
      (IsTotFun @x0)
      ;; def=Prims.fst(508,13-508,34); use=Prims.fst(508,13-508,34)
      (forall ((@x1 Term))
       (! (implies (HasType @x1 Prims.int) (IsTotFun (ApplyTT @x0 @x1)))
        :pattern ((ApplyTT @x0 @x1))
        :qid Prims_interpretation_Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623.2))))
    :pattern ((HasTypeZ @x0 Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623))
    :qid Prims_interpretation_Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623))
  :named Prims_interpretation_Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623))
; Constructor distinct
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (= 290 (Term_constr_id Prims.int)) :named constructor_distinct_Prims.int))
; function token typing
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (HasType Prims.int Prims.eqtype) :named function_token_typing_Prims.int))
; function token typing
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! ;; def=Prims.fst(508,4-508,11); use=Prims.fst(508,4-508,11)
  (forall ((@x0 Term))
   (! (and
     (NoHoist @x0 (HasType Prims.op_Star@tok Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623))
     ;; def=Prims.fst(508,4-508,11); use=Prims.fst(508,4-508,11)
     (forall ((@x1 Term) (@x2 Term))
      (! (= (ApplyTT (ApplyTT Prims.op_Star@tok @x1) @x2) (Prims.op_Star @x1 @x2))
       :pattern ((Prims.op_Star @x1 @x2))
       :qid function_token_typing_Prims.op_Star.1)))
    :pattern ((ApplyTT @x0 Prims.op_Star@tok))
    :qid function_token_typing_Prims.op_Star))
  :named function_token_typing_Prims.op_Star))
; int inversion
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (forall ((@u0 Fuel) (@x1 Term))
   (! (implies (HasTypeFuel @u0 @x1 Prims.int) (is-BoxInt @x1))
    :pattern ((HasTypeFuel @u0 @x1 Prims.int))
    :qid int_inversion))
  :named int_inversion))
; int typing
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (forall ((@u0 Int)) (! (HasType (BoxInt @u0) Prims.int) :pattern ((BoxInt @u0)) :qid int_typing))
  :named int_typing))
; kinding_Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! (HasType Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623 (Tm_type U_zero))
  :named kinding_Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623))
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! ;; def=Prims.fst(508,4-508,11); use=Prims.fst(508,4-508,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Star @x0 @x1) (BoxInt (* (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Star @x0 @x1))
    :qid primitive_Prims.op_Star))
  :named primitive_Prims.op_Star))
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! (IsTotFun Prims.op_Star@tok) :named primitive_tot_fun_Prims.op_Star))
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! ;; def=Prims.fst(508,4-508,11); use=Prims.fst(508,4-508,11)
  (forall ((@x0 Term))
   (! (IsTotFun (ApplyTT Prims.op_Star@tok @x0))
    :pattern ((ApplyTT Prims.op_Star@tok @x0))
    :qid primitive_tot_fun_Prims.op_Star.1))
  :named primitive_tot_fun_Prims.op_Star.1))
; Name-token correspondence
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! ;; def=Prims.fst(508,4-508,11); use=Prims.fst(508,4-508,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (ApplyTT (ApplyTT Prims.op_Star@tok @x0) @x1) (Prims.op_Star @x0 @x1))
    :pattern ((ApplyTT (ApplyTT Prims.op_Star@tok @x0) @x1))
    :qid token_correspondence_Prims.op_Star))
  :named token_correspondence_Prims.op_Star))
; free var typing
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (HasType Prims.int Prims.eqtype) :named typing_Prims.int))
; free var typing
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! ;; def=Prims.fst(508,4-508,11); use=Prims.fst(508,4-508,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_Star @x0 @x1) Prims.int))
    :pattern ((Prims.op_Star @x0 @x1))
    :qid typing_Prims.op_Star))
  :named typing_Prims.op_Star))
(push) ;; push{1
(declare-fun label_1 () Bool)
; kick_partial_app
;;; Fact-ids: 
(assert
 (! (Valid (ApplyTT __uu__PartialApp Prims.op_Star@tok))
  :named @kick_partial_app_1dfe2940aab437e3a51b0ac4a69b8081))
; Encoding query formula : HO_MonoidMul.right_unitality_lemma Prims.int 1 Prims.op_Star
; Context: While encoding a query
; While checking for top-level effects
; While typechecking the top-level declaration ‘let int_mul_monoid’
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
   ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(31,2-31,14)
   (or
    label_1
    ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(31,2-31,14)
    (Valid
     ;; def=HO_MonoidMul.fst(24,15-24,48); use=HO_MonoidMul.fst(31,2-31,14)
     (HO_MonoidMul.right_unitality_lemma U_zero Prims.int (BoxInt 1) Prims.op_Star@tok))))
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
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "<labels>")
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (HO_MonoidMul.int_mul_monoid, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: c6168e73da96b23a68fc1c24b3e6cf09be260b2a-dirty
; Z3 version (according to F*): 4.17.1

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; kick_partial_app
;;; Fact-ids: 
(assert
 (! (Valid (ApplyTT __uu__PartialApp Prims.op_Star@tok))
  :named @kick_partial_app_1dfe2940aab437e3a51b0ac4a69b8081))
; Encoding query formula : HO_MonoidMul.left_unitality_lemma Prims.int 1 Prims.op_Star
; Context: While encoding a query
; While checking for top-level effects
; While typechecking the top-level declaration ‘let int_mul_monoid’
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
   ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(31,2-31,14)
   (or
    label_1
    ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(31,2-31,14)
    (Valid
     ;; def=HO_MonoidMul.fst(25,15-25,47); use=HO_MonoidMul.fst(31,2-31,14)
     (HO_MonoidMul.left_unitality_lemma U_zero Prims.int (BoxInt 1) Prims.op_Star@tok))))
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
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "<labels>")
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (HO_MonoidMul.int_mul_monoid, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: c6168e73da96b23a68fc1c24b3e6cf09be260b2a-dirty
; Z3 version (according to F*): 4.17.1

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; kick_partial_app
;;; Fact-ids: 
(assert
 (! (Valid (ApplyTT __uu__PartialApp Prims.op_Star@tok))
  :named @kick_partial_app_1dfe2940aab437e3a51b0ac4a69b8081))
; Encoding query formula : HO_MonoidMul.associativity_lemma Prims.int Prims.op_Star
; Context: While encoding a query
; While checking for top-level effects
; While typechecking the top-level declaration ‘let int_mul_monoid’
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
   ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(31,2-31,14)
   (or
    label_1
    ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(31,2-31,14)
    (Valid
     ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(31,2-31,14)
     (HO_MonoidMul.associativity_lemma U_zero Prims.int Prims.op_Star@tok))))
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
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "<labels>")
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (HO_MonoidMul.int_mul_monoid, 3)
; STATUS: unknown because canceled
; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: c6168e73da96b23a68fc1c24b3e6cf09be260b2a-dirty
; Z3 version (according to F*): 4.17.1

(push) ;; push{0
; <fuel='2' ifuel='2'>
;;; Fact-ids: 
(assert (! (= MaxFuel (SFuel (SFuel ZFuel))) :named @MaxFuel_assumption))
;;; Fact-ids: 
(assert (! (= MaxIFuel (SFuel (SFuel ZFuel))) :named @MaxIFuel_assumption))
; query
;;; Fact-ids: 
(assert
 (! (not
   ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(31,2-31,14)
   (or
    label_1
    ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(31,2-31,14)
    (Valid
     ;; def=HO_MonoidMul.fst(26,15-26,41); use=HO_MonoidMul.fst(31,2-31,14)
     (HO_MonoidMul.associativity_lemma U_zero Prims.int Prims.op_Star@tok))))
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
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "<labels>")
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop
