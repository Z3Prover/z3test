; Z3 invocation started by F*
; F* version: 2026.05.24~dev -- commit hash: 90ca721898f7e29162c03e6babe46f9c1f09fbc9-dirty
; Z3 version (according to F*): 4.17.0

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

(declare-fun Prims.__cache_version_number__ () Term)
(declare-fun Prims.int () Term)
(declare-fun Prims.l_Forall (Universe Term Term) Term)
(declare-fun Prims.l_True () Term)
(declare-fun Prims.l_and (Term Term) Term)
(declare-fun Prims.l_imp (Term Term) Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_post (Universe Term) Term)
(declare-fun Prims.pure_post_ (Universe Term Term) Term)
(declare-fun Prims.pure_pre () Term)
(declare-fun Prims.pure_wp_ (Universe Term) Term)
(declare-fun Prims.pure_wp_monotonic0 (Universe Term Term) Term)
(declare-fun Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2 (Universe Term) Term)
(declare-fun Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6 (Universe Term) Term)
(declare-fun Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 (Term Universe) Term)
(declare-fun Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8 (Term Term Universe) Term)
; interpretation_Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2
;;; Fact-ids: Name Prims.pure_wp_monotonic0; Namespace Prims
(assert
 (! ;; def=Prims.fst(264,69-300,25); use=Prims.fst(300,9-300,26)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2 @u1 @x2))
     (and
      ;; def=Prims.fst(264,69-300,25); use=Prims.fst(300,9-300,26)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 (Prims.pure_post @u1 @x2)) (HasType (ApplyTT @x0 @x3) Prims.prop))
        :pattern ((ApplyTT @x0 @x3))
        :qid Prims_interpretation_Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2 @u1 @x2)))
    :qid Prims_interpretation_Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2))
  :named Prims_interpretation_Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2))
; interpretation_Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6
;;; Fact-ids: Name Prims.pure_wp'; Namespace Prims
(assert
 (! ;; def=Prims.fst(291,25-291,48); use=Prims.fst(291,25-291,48)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6 @u1 @x2))
     (and
      ;; def=Prims.fst(291,25-291,48); use=Prims.fst(291,25-291,48)
      (forall ((@x3 Term))
       (! (implies
         (HasType @x3 (Prims.pure_post @u1 @x2))
         (HasType (ApplyTT @x0 @x3) Prims.pure_pre))
        :pattern ((ApplyTT @x0 @x3))
        :qid Prims_interpretation_Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6 @u1 @x2)))
    :qid Prims_interpretation_Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6))
  :named Prims_interpretation_Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6))
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
; Equation for Prims.pure_wp_monotonic0
;;; Fact-ids: Name Prims.pure_wp_monotonic0; Namespace Prims
(assert
 (! ;; def=Prims.fst(299,4-299,22); use=Prims.fst(299,4-299,22)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (Prims.pure_wp_monotonic0 @u0 @x1 @x2)
     (WithInterp
      (Prims.l_Forall
       @u0
       (Prims.pure_post @u0 @x1)
       (WithType
        ;; def=Prims.fst(300,9-300,75); use=Prims.fst(300,9-300,75)
        (Tm_lambda
         (Prims.pure_post @u0 @x1)
         ;; def=Prims.fst(300,9-300,75); use=Prims.fst(300,9-300,75)
         (lambda ((@x3 Term))
          (Prims.l_Forall
           @u0
           (Prims.pure_post @u0 @x1)
           (WithType
            ;; def=Prims.fst(300,9-300,75); use=Prims.fst(300,9-300,75)
            (Tm_lambda
             (Prims.pure_post @u0 @x1)
             ;; def=Prims.fst(300,9-300,75); use=Prims.fst(300,9-300,75)
             (lambda ((@x4 Term))
              (Prims.l_imp
               (WithInterp
                (Prims.l_Forall
                 @u0
                 @x1
                 (WithType
                  ;; def=Prims.fst(300,28-300,55); use=Prims.fst(300,28-300,55)
                  (Tm_lambda
                   @x1
                   ;; def=Prims.fst(300,28-300,55); use=Prims.fst(300,28-300,55)
                   (lambda ((@x5 Term)) (Prims.l_imp (ApplyTT @x3 @x5) (ApplyTT @x4 @x5))))
                  (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u0)))
                ;; def=Prims.fst(300,28-300,55); use=Prims.fst(300,28-300,55)
                (forall ((@x5 Term))
                 (! (implies
                   (and
                    (HasType @x5 @x1)
                    ;; def=Prims.fst(300,43-300,46); use=Prims.fst(300,43-300,46)
                    (Valid
                     ;; def=Prims.fst(300,43-300,46); use=Prims.fst(300,43-300,46)
                     (ApplyTT @x3 @x5)))
                   ;; def=Prims.fst(300,51-300,54); use=Prims.fst(300,51-300,54)
                   (Valid
                    ;; def=Prims.fst(300,51-300,54); use=Prims.fst(300,51-300,54)
                    (ApplyTT @x4 @x5)))
                  :qid defn_equation_Prims.pure_wp_monotonic0.1)))
               (Prims.l_imp (ApplyTT @x2 @x3) (ApplyTT @x2 @x4)))))
            (Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2 @u0 @x1)))))
        (Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2 @u0 @x1)))
      ;; def=Prims.fst(300,2-300,75); use=Prims.fst(300,2-300,75)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and
          (HasType @x3 (Prims.pure_post @u0 @x1))
          (HasType @x4 (Prims.pure_post @u0 @x1))
          ;; def=Prims.fst(300,28-300,55); use=Prims.fst(300,28-300,55)
          (forall ((@x5 Term))
           (! (implies
             (and
              (HasType @x5 @x1)
              ;; def=Prims.fst(300,43-300,46); use=Prims.fst(300,43-300,46)
              (Valid
               ;; def=Prims.fst(300,43-300,46); use=Prims.fst(300,43-300,46)
               (ApplyTT @x3 @x5)))
             ;; def=Prims.fst(300,51-300,54); use=Prims.fst(300,51-300,54)
             (Valid
              ;; def=Prims.fst(300,51-300,54); use=Prims.fst(300,51-300,54)
              (ApplyTT @x4 @x5)))
            :qid defn_equation_Prims.pure_wp_monotonic0.3))
          ;; def=Prims.fst(300,61-300,65); use=Prims.fst(300,61-300,65)
          (Valid
           ;; def=Prims.fst(300,61-300,65); use=Prims.fst(300,61-300,65)
           (ApplyTT @x2 @x3)))
         ;; def=Prims.fst(300,70-300,74); use=Prims.fst(300,70-300,74)
         (Valid
          ;; def=Prims.fst(300,70-300,74); use=Prims.fst(300,70-300,74)
          (ApplyTT @x2 @x4)))
        :qid defn_equation_Prims.pure_wp_monotonic0.2))))
    :pattern ((Prims.pure_wp_monotonic0 @u0 @x1 @x2))
    :qid defn_equation_Prims.pure_wp_monotonic0))
  :named defn_equation_Prims.pure_wp_monotonic0))
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
; Equation for Prims.pure_pre
;;; Fact-ids: Name Prims.pure_pre; Namespace Prims
(assert
 (! (= Prims.pure_pre Prims.prop) :named equation_Prims.pure_pre))
; Equation for Prims.pure_wp'
;;; Fact-ids: Name Prims.pure_wp'; Namespace Prims
(assert
 (! ;; def=Prims.fst(291,4-291,12); use=Prims.fst(291,4-291,12)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (Prims.pure_wp_ @u0 @x1) (Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6 @u0 @x1))
    :pattern ((Prims.pure_wp_ @u0 @x1))
    :qid equation_Prims.pure_wp_))
  :named equation_Prims.pure_wp_))
; Equation for Prims.pure_wp_monotonic0
;;; Fact-ids: Name Prims.pure_wp_monotonic0; Namespace Prims
(assert
 (! ;; def=Prims.fst(299,4-299,22); use=Prims.fst(299,4-299,22)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (Valid (Prims.pure_wp_monotonic0 @u0 @x1 @x2))
     ;; def=Prims.fst(300,2-300,75); use=Prims.fst(300,2-300,75)
     (forall ((@x3 Term) (@x4 Term))
      (! (implies
        (and
         (HasType @x3 (Prims.pure_post @u0 @x1))
         (HasType @x4 (Prims.pure_post @u0 @x1))
         ;; def=Prims.fst(300,28-300,55); use=Prims.fst(300,28-300,55)
         (forall ((@x5 Term))
          (! (implies
            (and
             (HasType @x5 @x1)
             ;; def=Prims.fst(300,43-300,46); use=Prims.fst(300,43-300,46)
             (Valid
              ;; def=Prims.fst(300,43-300,46); use=Prims.fst(300,43-300,46)
              (ApplyTT @x3 @x5)))
            ;; def=Prims.fst(300,51-300,54); use=Prims.fst(300,51-300,54)
            (Valid
             ;; def=Prims.fst(300,51-300,54); use=Prims.fst(300,51-300,54)
             (ApplyTT @x4 @x5)))
           :qid equation_Prims.pure_wp_monotonic0.2))
         ;; def=Prims.fst(300,61-300,65); use=Prims.fst(300,61-300,65)
         (Valid
          ;; def=Prims.fst(300,61-300,65); use=Prims.fst(300,61-300,65)
          (ApplyTT @x2 @x3)))
        ;; def=Prims.fst(300,70-300,74); use=Prims.fst(300,70-300,74)
        (Valid
         ;; def=Prims.fst(300,70-300,74); use=Prims.fst(300,70-300,74)
         (ApplyTT @x2 @x4)))
       :qid equation_Prims.pure_wp_monotonic0.1)))
    :pattern ((Prims.pure_wp_monotonic0 @u0 @x1 @x2))
    :qid equation_Prims.pure_wp_monotonic0))
  :named equation_Prims.pure_wp_monotonic0))
; function token typing
;;; Fact-ids: Name Prims.__cache_version_number__; Namespace Prims
(assert
 (! (HasType Prims.__cache_version_number__ Prims.int)
  :named function_token_typing_Prims.__cache_version_number__))
; function token typing
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert
 (! (HasType Prims.l_True Prims.prop) :named function_token_typing_Prims.l_True))
; function token typing
;;; Fact-ids: Name Prims.prop; Namespace Prims
(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named function_token_typing_Prims.prop))
; function token typing
;;; Fact-ids: Name Prims.pure_pre; Namespace Prims
(assert
 (! (HasType Prims.pure_pre (Tm_type U_zero)) :named function_token_typing_Prims.pure_pre))
; kinding_Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2
;;; Fact-ids: Name Prims.pure_wp_monotonic0; Namespace Prims
(assert
 (! ;; def=Prims.fst(264,69-300,25); use=Prims.fst(300,9-300,26)
  (forall ((@u0 Universe) (@x1 Term))
   (! (HasType (Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2 @u0 @x1) (Tm_type @u0))
    :pattern ((HasType (Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2 @u0 @x1) (Tm_type @u0)))
    :qid kinding_Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2))
  :named kinding_Tm_arrow_06b7d8f2bbc1c825f638f46503c551f2))
; kinding_Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6
;;; Fact-ids: Name Prims.pure_wp'; Namespace Prims
(assert
 (! ;; def=Prims.fst(291,25-291,48); use=Prims.fst(291,25-291,48)
  (forall ((@u0 Universe) (@x1 Term))
   (! (HasType (Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6 @u0 @x1) (Tm_type @u0))
    :pattern ((HasType (Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6 @u0 @x1) (Tm_type @u0)))
    :qid kinding_Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6))
  :named kinding_Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6))
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
; /\ interpretation
;;; Fact-ids: Name Prims.l_and; Namespace Prims
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (iff (and (Valid @x0) (Valid @x1)) (Valid (Prims.l_and @x0 @x1)))
    :pattern ((Prims.l_and @x0 @x1))
    :qid l_and-interp))
  :named l_and-interp))
; ==> interpretation
;;; Fact-ids: Name Prims.l_imp; Namespace Prims
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (iff (implies (Valid @x0) (Valid @x1)) (Valid (Prims.l_imp @x0 @x1)))
    :pattern ((Prims.l_imp @x0 @x1))
    :qid l_imp-interp))
  :named l_imp-interp))
; True interpretation
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert (! (Valid Prims.l_True) :named true_interp))
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
;;; Fact-ids: Name Prims.l_and; Namespace Prims
(assert
 (! ;; def=Prims.fst(172,11-172,16); use=Prims.fst(172,11-172,16)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.prop) (implies (Valid @x0) (HasType @x1 Prims.prop)))
     (HasType (Prims.l_and @x0 @x1) Prims.prop))
    :pattern ((Prims.l_and @x0 @x1))
    :qid typing_Prims.l_and))
  :named typing_Prims.l_and))
; free var typing
;;; Fact-ids: Name Prims.l_imp; Namespace Prims
(assert
 (! ;; def=Prims.fst(186,11-186,16); use=Prims.fst(186,11-186,16)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.prop) (implies (Valid @x0) (HasType @x1 Prims.prop)))
     (HasType (Prims.l_imp @x0 @x1) Prims.prop))
    :pattern ((Prims.l_imp @x0 @x1))
    :qid typing_Prims.l_imp))
  :named typing_Prims.l_imp))
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
;;; Fact-ids: Name Prims.pure_pre; Namespace Prims
(assert
 (! (HasType Prims.pure_pre (Tm_type U_zero)) :named typing_Prims.pure_pre))
; free var typing
;;; Fact-ids: Name Prims.pure_wp'; Namespace Prims
(assert
 (! ;; def=Prims.fst(291,4-291,12); use=Prims.fst(291,4-291,12)
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies (HasType @x1 (Tm_type @u0)) (HasType (Prims.pure_wp_ @u0 @x1) (Tm_type @u0)))
    :pattern ((Prims.pure_wp_ @u0 @x1))
    :qid typing_Prims.pure_wp_))
  :named typing_Prims.pure_wp_))
; free var typing
;;; Fact-ids: Name Prims.pure_wp_monotonic0; Namespace Prims
(assert
 (! ;; def=Prims.fst(299,4-299,22); use=Prims.fst(299,4-299,22)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (Prims.pure_wp_ @u0 @x1)))
     (HasType (Prims.pure_wp_monotonic0 @u0 @x1 @x2) Prims.prop))
    :pattern ((Prims.pure_wp_monotonic0 @u0 @x1 @x2))
    :qid typing_Prims.pure_wp_monotonic0))
  :named typing_Prims.pure_wp_monotonic0))
(push) ;; push{1
; universe local constant
(declare-fun uu___54 () Universe)
(declare-fun label_1 () Bool)


; Encoding query formula : forall (a: Type) (pre: Prims.pure_pre) (post: Prims.pure_post' a pre).
;   (* - Could not prove post-condition *)
;   Prims.pure_wp_monotonic0 a (fun p -> pre /\ (forall (a: _: a{pre}). post a ==> p a))
; Context: While encoding a query
; While typechecking the top-level declaration `let div_hoare_to_wp`
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
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 (Tm_type uu___54))
       (HasType @x1 Prims.pure_pre)
       (HasType @x2 (Prims.pure_post_ uu___54 @x0 @x1)))
      ;; def=FStar.Pervasives.fsti(255,54-255,77); use=FStar.Pervasives.fsti(264,39-264,72)
      (or
       label_1
       ;; def=FStar.Pervasives.fsti(255,54-255,77); use=FStar.Pervasives.fsti(264,39-264,72)
       (Valid
        ;; def=FStar.Pervasives.fsti(255,54-255,77); use=FStar.Pervasives.fsti(264,39-264,72)
        (Prims.pure_wp_monotonic0
         uu___54
         @x0
         (WithType
          ;; def=FStar.Pervasives.fsti(264,39-264,72); use=FStar.Pervasives.fsti(264,39-264,72)
          (Tm_lambda
           (Prims.pure_post uu___54 @x0)
           ;; def=FStar.Pervasives.fsti(264,39-264,72); use=FStar.Pervasives.fsti(264,39-264,72)
           (lambda ((@x3 Term))
            (Prims.l_and
             @x1
             (WithInterp
              (Prims.l_Forall
               uu___54
               ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,2-264,72)
               (Tm_refinement
                @x0
                ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,2-264,72)
                (lambda ((@x4 Term))
                 ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                 (Valid
                  ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                  @x1)))
               (WithType
                ;; def=FStar.Pervasives.fsti(264,46-264,72); use=FStar.Pervasives.fsti(264,46-264,72)
                (Tm_lambda
                 ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                 (Tm_refinement
                  @x0
                  ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                  (lambda ((@x4 Term))
                   ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                   (Valid
                    ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                    @x1)))
                 ;; def=FStar.Pervasives.fsti(264,46-264,72); use=FStar.Pervasives.fsti(264,46-264,72)
                 (lambda ((@x4 Term)) (Prims.l_imp (ApplyTT @x2 @x4) (ApplyTT @x3 @x4))))
                (Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8 @x0 @x1 uu___54)))
              ;; def=FStar.Pervasives.fsti(264,46-264,72); use=FStar.Pervasives.fsti(264,46-264,72)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                  (HasType
                   @x4
                   ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                   (Tm_refinement
                    @x0
                    ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                    (lambda ((@x5 Term))
                     ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                     (Valid
                      ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                      @x1))))
                  ;; def=FStar.Pervasives.fsti(264,57-264,63); use=FStar.Pervasives.fsti(264,57-264,63)
                  (Valid
                   ;; def=FStar.Pervasives.fsti(264,57-264,63); use=FStar.Pervasives.fsti(264,57-264,63)
                   (ApplyTT @x2 @x4)))
                 ;; def=FStar.Pervasives.fsti(264,68-264,71); use=FStar.Pervasives.fsti(264,68-264,71)
                 (Valid
                  ;; def=FStar.Pervasives.fsti(264,68-264,71); use=FStar.Pervasives.fsti(264,68-264,71)
                  (ApplyTT @x3 @x4)))
                :qid @query.1))))))
          (Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6 uu___54 @x0))))))
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

; QUERY ID: (FStar.Pervasives.div_hoare_to_wp, 1)
; STATUS: unknown because canceled
; Z3 invocation started by F*
; F* version: 2026.05.24~dev -- commit hash: 90ca721898f7e29162c03e6babe46f9c1f09fbc9-dirty
; Z3 version (according to F*): 4.17.0

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
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 (Tm_type uu___54))
       (HasType @x1 Prims.pure_pre)
       (HasType @x2 (Prims.pure_post_ uu___54 @x0 @x1)))
      ;; def=FStar.Pervasives.fsti(255,54-255,77); use=FStar.Pervasives.fsti(264,39-264,72)
      (or
       label_1
       ;; def=FStar.Pervasives.fsti(255,54-255,77); use=FStar.Pervasives.fsti(264,39-264,72)
       (Valid
        ;; def=FStar.Pervasives.fsti(255,54-255,77); use=FStar.Pervasives.fsti(264,39-264,72)
        (Prims.pure_wp_monotonic0
         uu___54
         @x0
         (WithType
          ;; def=FStar.Pervasives.fsti(264,39-264,72); use=FStar.Pervasives.fsti(264,39-264,72)
          (Tm_lambda
           (Prims.pure_post uu___54 @x0)
           ;; def=FStar.Pervasives.fsti(264,39-264,72); use=FStar.Pervasives.fsti(264,39-264,72)
           (lambda ((@x3 Term))
            (Prims.l_and
             @x1
             (WithInterp
              (Prims.l_Forall
               uu___54
               ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,2-264,72)
               (Tm_refinement
                @x0
                ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,2-264,72)
                (lambda ((@x4 Term))
                 ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                 (Valid
                  ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                  @x1)))
               (WithType
                ;; def=FStar.Pervasives.fsti(264,46-264,72); use=FStar.Pervasives.fsti(264,46-264,72)
                (Tm_lambda
                 ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                 (Tm_refinement
                  @x0
                  ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                  (lambda ((@x4 Term))
                   ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                   (Valid
                    ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                    @x1)))
                 ;; def=FStar.Pervasives.fsti(264,46-264,72); use=FStar.Pervasives.fsti(264,46-264,72)
                 (lambda ((@x4 Term)) (Prims.l_imp (ApplyTT @x2 @x4) (ApplyTT @x3 @x4))))
                (Tm_arrow_fa00356eac8553dcbdc9a6e3f4eea2b8 @x0 @x1 uu___54)))
              ;; def=FStar.Pervasives.fsti(264,46-264,72); use=FStar.Pervasives.fsti(264,46-264,72)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                  (HasType
                   @x4
                   ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                   (Tm_refinement
                    @x0
                    ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(264,54-264,55)
                    (lambda ((@x5 Term))
                     ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                     (Valid
                      ;; def=FStar.Pervasives.fsti(263,32-263,35); use=FStar.Pervasives.fsti(263,65-263,68)
                      @x1))))
                  ;; def=FStar.Pervasives.fsti(264,57-264,63); use=FStar.Pervasives.fsti(264,57-264,63)
                  (Valid
                   ;; def=FStar.Pervasives.fsti(264,57-264,63); use=FStar.Pervasives.fsti(264,57-264,63)
                   (ApplyTT @x2 @x4)))
                 ;; def=FStar.Pervasives.fsti(264,68-264,71); use=FStar.Pervasives.fsti(264,68-264,71)
                 (Valid
                  ;; def=FStar.Pervasives.fsti(264,68-264,71); use=FStar.Pervasives.fsti(264,68-264,71)
                  (ApplyTT @x3 @x4)))
                :qid @query.1))))))
          (Tm_arrow_d15ca2fd8c86ad6cfc361060ea85a5d6 uu___54 @x0))))))
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

