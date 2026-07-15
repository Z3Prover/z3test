; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: 69b8cc32208bb17791440003d237f0046745eb72
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

(declare-fun FStar.FunctionalExtensionality.feq (Universe Universe Term Term Term Term) Term)
(declare-fun FStar.FunctionalExtensionality.is_restricted (Universe Universe Term Term Term) Term)
(declare-fun FStar.FunctionalExtensionality.on_domain (Universe Universe Term Term Term) Term)
(declare-fun FStar.FunctionalExtensionality.restricted_t (Universe Universe Term Term) Term)
(declare-fun FStar.Ghost.erased (Universe Term) Term)
(declare-fun FStar.Ghost.hide (Universe Term Term) Term)
(declare-fun FStar.Ghost.reveal (Universe Term Term) Term)
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
(declare-fun Non_total_Tm_arrow_05711733c0e43976df18159280e0d41a (Term Term Term Term Term) Term)
(declare-fun Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29 (Term Term) Term)
(declare-fun Non_total_Tm_arrow_35307e3181c6aec9900a4df266436813 (Term Term Term Term Term) Term)
(declare-fun Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f (Term) Term)
(declare-fun Non_total_Tm_arrow_47cf0da1ce67e7de2468cec83b13ab8b (Term) Term)
(declare-fun Non_total_Tm_arrow_57c96334de88d8a23b5eb456a1b8c5e4 (Term) Term)
(declare-fun Non_total_Tm_arrow_62a2cf1b58e1e423697dd5147ebaf708 (Term) Term)
(declare-fun Non_total_Tm_arrow_7aac0931ac08e504a9cdb249a2380aa6 (Term Term Term Term Term) Term)
(declare-fun Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521 (Term Term) Term)
(declare-fun Prims.b2t (Term) Term)
(declare-fun Prims.bool () Term)
(declare-fun Prims.eq2 (Universe Term Term Term) Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.hasEq (Universe Term) Term)
(declare-fun Prims.int () Term)
(declare-fun Prims.l_Exists (Universe Term Term) Term)
(declare-fun Prims.l_Forall (Universe Term Term) Term)
(declare-fun Prims.l_True () Term)
(declare-fun Prims.l_and (Term Term) Term)
(declare-fun Prims.l_imp (Term Term) Term)
(declare-fun Prims.nat () Term)
(declare-fun Prims.op_GreaterThan (Term Term) Term)
(declare-fun Prims.op_Subtraction (Term Term) Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_post (Universe Term) Term)
(declare-fun Prims.pure_post_ (Universe Term Term) Term)
(declare-fun Prims.pure_wp (Universe Term) Term)
(declare-fun Prims.squash (Term) Term)
(declare-fun Prims.unit () Term)
(declare-fun Pulse.Lib.Loc.loc_id () Term)
(declare-fun PulseCore.BaseHeapSig.mem (Universe) Term)
(declare-fun PulseCore.Heap2.heap (Universe) Term)
(declare-fun PulseCore.IndirectionTheorySep.age1_ (Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.hereditary (Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.implies (Term Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.later (Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.later@tok () Term)
(declare-fun PulseCore.IndirectionTheorySep.later_pred (Term Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.later_pred@tok () Term)
(declare-fun PulseCore.IndirectionTheorySep.max (Term Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.mem_le (Term Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.mem_le@tok () Term)
(declare-fun PulseCore.IndirectionTheorySep.mem_pred_affine (Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.mk_slprop (Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.op_exists_Star (Universe Term Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.op_exists_Star@tok (Universe) Term)
(declare-fun PulseCore.IndirectionTheorySep.slprop () Term)
(declare-fun PulseCore.IndirectionTheorySep.slprop_ok (Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.slprop_ok_ (Term) Term)
(declare-fun PulseCore.IndirectionTheorySep.timeless (Term) Term)
(declare-fun PulseCore.KnotInstantiation.age_to_ (Term Term) Term)
(declare-fun PulseCore.KnotInstantiation.credits_ (Term) Term)
(declare-fun PulseCore.KnotInstantiation.current_loc_ (Term) Term)
(declare-fun PulseCore.KnotInstantiation.level_ (Term) Term)
(declare-fun PulseCore.KnotInstantiation.mem_pred () Term)
(declare-fun PulseCore.KnotInstantiation.premem () Term)
(declare-fun PulseCore.KnotInstantiation.timeless_heap_of (Term) Term)
(declare-fun PulseCore.MemoryAlt.mem (Universe) Term)
(declare-fun PulseCore.Semantics.__proj__Mkstate__item__pred (Universe Term) Term)
; Constructor
(declare-fun PulseCore.Semantics.action (Universe Universe Term Term) Term)
(declare-fun PulseCore.Semantics.post (Universe Universe Term Term) Term)
; Constructor
(declare-fun PulseCore.Semantics.state (Universe) Term)
(declare-fun Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e (Universe Term Term) Term)
(declare-fun Tm_abs_489879e33d44f3d4936acefa7efa4b56 () Term)
(declare-fun Tm_abs_494f67d3d2785ac4e7adad79c0124d7d (Term Term) Term)
(declare-fun Tm_abs_5f339e803bb418ce6f0d13ad44b64b52 (Term) Term)
(declare-fun Tm_abs_7358bb1256b6e64970c6650590cbe31b (Term Universe Term) Term)
(declare-fun Tm_abs_98df6468e5274e80202c23c067d93953 (Term) Term)
(declare-fun Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 (Term Universe Term Term) Term)
(declare-fun Tm_abs_a75cec2915107c0935a4203c94bd84c7 (Term Universe Universe Term Term Term) Term)
(declare-fun Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5 (Term Term) Term)
(declare-fun
 Tm_arrow_188e938e0b17c6ab4b011bd2241afc94
 (Term Universe Universe Term Term Universe)
 Term)
(declare-fun Tm_arrow_21228a5f7cc560451f99b21cf6295dbc () Term)
(declare-fun Tm_arrow_505f8adb466dc430d209c7de298af914 (Term Term Universe Universe) Term)
(declare-fun Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef () Term)
(declare-fun Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa (Term Universe Universe) Term)
(declare-fun Tm_arrow_71d208da69e8cfea945dbf406ab689bd () Term)
(declare-fun Tm_arrow_723cf278d9f5b7b5212a5f92ca976294 () Term)
(declare-fun Tm_arrow_966e7a3cdea4a9083a74fff1fb478068 (Term Universe Term Universe) Term)
(declare-fun Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03 () Term)
(declare-fun Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 (Term Universe) Term)
(declare-fun Tm_arrow_ec3e994bdc546940e36859549984c665 (Term Universe) Term)
(declare-fun Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 (Universe Term Term) Term)
(declare-fun Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc (Universe) Term)
(declare-fun Tm_refine_006f502666b42ae7b238ae3f195b8c19 (Term) Term)
(declare-fun
 Tm_refine_0d9045a140507851cf3260e4f727453c
 (Universe Universe Universe Term Term Term Term)
 Term)
(declare-fun Tm_refine_2de20c066034c13bf76e9c0b94f4806c (Term) Term)
(declare-fun Tm_refine_542f9d4f129664613f2483a6c88bc7c2 () Term)
(declare-fun Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4 () Term)
(declare-fun Tm_refine_7b079aec204a306b131c0098fd4913a1 () Term)
(declare-fun Tm_refine_9d6af3f3535473623f7aec2f0501897f () Term)
(declare-fun Tm_refine_a94de11175d00fdbbdf07b37c09f231c (Universe Universe Term Term) Term)
(declare-fun Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 (Universe Term Term) Term)
(declare-fun Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f (Term Term) Term)
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
 (and (= (Term_constr_id __@x0) 112) (= __@x0 FStar.Tactics.V2.Derived.Goal_not_trivial)))
; kick_partial_app
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.reveal_mem_le; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (Valid (ApplyTT __uu__PartialApp PulseCore.IndirectionTheorySep.mem_le@tok))
  :named @kick_partial_app_24e56d7de53fac6c798e90949227d3c3))
; kick_partial_app
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.timeless_intro; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (Valid (ApplyTT __uu__PartialApp PulseCore.IndirectionTheorySep.later@tok))
  :named @kick_partial_app_c6fe40f2067df29ee5f0669167ea8246))
; kick_partial_app
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (Valid (ApplyTT __uu__PartialApp PulseCore.IndirectionTheorySep.later_pred@tok))
  :named @kick_partial_app_e9be7e06225156bfcedded808187662f))
; interpretation_Tm_arrow_505f8adb466dc430d209c7de298af914
;;; Fact-ids: Name FStar.FunctionalExtensionality.arrow; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(41,11-41,56); use=FStar.FunctionalExtensionality.fsti(41,42-41,56)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe) (@u4 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x1 @x2 @u3 @u4))
     (and
      ;; def=FStar.FunctionalExtensionality.fsti(41,11-41,56); use=FStar.FunctionalExtensionality.fsti(41,42-41,56)
      (forall ((@x5 Term))
       (! (implies (HasType @x5 @x1) (HasType (ApplyTT @x0 @x5) (ApplyTT @x2 @x5)))
        :pattern ((ApplyTT @x0 @x5))
        :qid
         FStar.FunctionalExtensionality_interpretation_Tm_arrow_505f8adb466dc430d209c7de298af914.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x1 @x2 @u3 @u4)))
    :qid FStar.FunctionalExtensionality_interpretation_Tm_arrow_505f8adb466dc430d209c7de298af914))
  :named FStar.FunctionalExtensionality_interpretation_Tm_arrow_505f8adb466dc430d209c7de298af914))
; interpretation_Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa
;;; Fact-ids: Name Prims.dtuple2; Namespace Prims; Name Prims.Mkdtuple2; Namespace Prims
(assert
 (! ;; def=Prims.fst(471,14-471,42); use=Prims.fst(471,28-471,42)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@u3 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x1 @u2 @u3))
     (and
      ;; def=Prims.fst(471,14-471,42); use=Prims.fst(471,28-471,42)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 @x1) (HasType (ApplyTT @x0 @x4) (Tm_type @u2)))
        :pattern ((ApplyTT @x0 @x4))
        :qid Prims_interpretation_Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x1 @u2 @u3)))
    :qid Prims_interpretation_Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa))
  :named Prims_interpretation_Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa))
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
; interpretation_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,56); use=Prims.fst(281,39-281,56)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u1 @x2 @x3))
     (and
      ;; def=Prims.fst(281,39-281,56); use=Prims.fst(281,39-281,56)
      (forall ((@x4 Term))
       (! (implies
         (HasType @x4 (Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 @u1 @x2 @x3))
         (HasType (ApplyTT @x0 @x4) Prims.prop))
        :pattern ((ApplyTT @x0 @x4))
        :qid Prims_interpretation_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u1 @x2 @x3)))
    :qid Prims_interpretation_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
  :named Prims_interpretation_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
; interpretation_Tm_arrow_21228a5f7cc560451f99b21cf6295dbc
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later_pred; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(558,19-558,45); use=PulseCore.IndirectionTheorySep.fst(558,19-558,45)
  (forall ((@x0 Term))
   (! (iff
     (HasTypeZ @x0 Tm_arrow_21228a5f7cc560451f99b21cf6295dbc)
     (and
      ;; def=PulseCore.IndirectionTheorySep.fst(558,19-558,45); use=PulseCore.IndirectionTheorySep.fst(558,19-558,45)
      (forall ((@x1 Term) (@x2 Term))
       (! (implies
         (and
          (HasType @x1 PulseCore.IndirectionTheorySep.slprop)
          (HasType @x2 PulseCore.KnotInstantiation.premem))
         (HasType (ApplyTT (ApplyTT @x0 @x1) @x2) Prims.prop))
        :pattern ((ApplyTT (ApplyTT @x0 @x1) @x2))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_21228a5f7cc560451f99b21cf6295dbc.1))
      (IsTotFun @x0)
      ;; def=PulseCore.IndirectionTheorySep.fst(558,19-558,45); use=PulseCore.IndirectionTheorySep.fst(558,19-558,45)
      (forall ((@x1 Term))
       (! (implies (HasType @x1 PulseCore.IndirectionTheorySep.slprop) (IsTotFun (ApplyTT @x0 @x1)))
        :pattern ((ApplyTT @x0 @x1))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_21228a5f7cc560451f99b21cf6295dbc.2))))
    :pattern ((HasTypeZ @x0 Tm_arrow_21228a5f7cc560451f99b21cf6295dbc))
    :qid PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_21228a5f7cc560451f99b21cf6295dbc))
  :named PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_21228a5f7cc560451f99b21cf6295dbc))
; interpretation_Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_le'; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(33,18-33,32); use=PulseCore.IndirectionTheorySep.fst(33,18-33,32)
  (forall ((@x0 Term))
   (! (iff
     (HasTypeZ @x0 Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef)
     (and
      ;; def=PulseCore.IndirectionTheorySep.fst(33,18-33,32); use=PulseCore.IndirectionTheorySep.fst(33,18-33,32)
      (forall ((@x1 Term) (@x2 Term))
       (! (implies
         (and
          (HasType @x1 PulseCore.KnotInstantiation.premem)
          (HasType @x2 PulseCore.KnotInstantiation.premem))
         (HasType (ApplyTT (ApplyTT @x0 @x1) @x2) Prims.prop))
        :pattern ((ApplyTT (ApplyTT @x0 @x1) @x2))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef.1))
      (IsTotFun @x0)
      ;; def=PulseCore.IndirectionTheorySep.fst(33,18-33,32); use=PulseCore.IndirectionTheorySep.fst(33,18-33,32)
      (forall ((@x1 Term))
       (! (implies (HasType @x1 PulseCore.KnotInstantiation.premem) (IsTotFun (ApplyTT @x0 @x1)))
        :pattern ((ApplyTT @x0 @x1))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef.2))))
    :pattern ((HasTypeZ @x0 Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef))
    :qid PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef))
  :named PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef))
; interpretation_Tm_arrow_723cf278d9f5b7b5212a5f92ca976294
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fsti(190,13-190,29); use=PulseCore.IndirectionTheorySep.fst(560,4-560,9)
  (forall ((@x0 Term))
   (! (iff
     (HasTypeZ @x0 Tm_arrow_723cf278d9f5b7b5212a5f92ca976294)
     (and
      ;; def=PulseCore.IndirectionTheorySep.fsti(190,13-190,29); use=PulseCore.IndirectionTheorySep.fst(560,4-560,9)
      (forall ((@x1 Term))
       (! (implies
         (HasType @x1 PulseCore.IndirectionTheorySep.slprop)
         (HasType (ApplyTT @x0 @x1) PulseCore.IndirectionTheorySep.slprop))
        :pattern ((ApplyTT @x0 @x1))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_723cf278d9f5b7b5212a5f92ca976294.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 Tm_arrow_723cf278d9f5b7b5212a5f92ca976294))
    :qid PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_723cf278d9f5b7b5212a5f92ca976294))
  :named PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_723cf278d9f5b7b5212a5f92ca976294))
; interpretation_Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(43,24-43,38); use=PulseCore.IndirectionTheorySep.fst(43,24-43,38)
  (forall ((@x0 Term))
   (! (iff
     (HasTypeZ @x0 Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
     (and
      ;; def=PulseCore.IndirectionTheorySep.fst(43,24-43,38); use=PulseCore.IndirectionTheorySep.fst(43,24-43,38)
      (forall ((@x1 Term))
       (! (implies
         (HasType @x1 PulseCore.KnotInstantiation.premem)
         (HasType (ApplyTT @x0 @x1) Prims.prop))
        :pattern ((ApplyTT @x0 @x1))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03))
    :qid PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03))
  :named PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03))
; interpretation_Tm_arrow_ec3e994bdc546940e36859549984c665
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fsti(61,18-61,44); use=PulseCore.IndirectionTheorySep.fsti(61,33-61,34)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_ec3e994bdc546940e36859549984c665 @x1 @u2))
     (and
      ;; def=PulseCore.IndirectionTheorySep.fsti(61,18-61,44); use=PulseCore.IndirectionTheorySep.fsti(61,33-61,34)
      (forall ((@x3 Term))
       (! (implies
         (HasType @x3 @x1)
         (HasType (ApplyTT @x0 @x3) PulseCore.IndirectionTheorySep.slprop))
        :pattern ((ApplyTT @x0 @x3))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_ec3e994bdc546940e36859549984c665.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_ec3e994bdc546940e36859549984c665 @x1 @u2)))
    :qid PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_ec3e994bdc546940e36859549984c665))
  :named PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_ec3e994bdc546940e36859549984c665))
; interpretation_Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fsti(61,18-61,54); use=PulseCore.IndirectionTheorySep.fsti(61,33-61,34)
  (forall ((@x0 Term) (@u1 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc @u1))
     (and
      ;; def=PulseCore.IndirectionTheorySep.fsti(61,18-61,54); use=PulseCore.IndirectionTheorySep.fsti(61,33-61,34)
      (forall ((@x2 Term) (@x3 Term))
       (! (implies
         (and
          (HasType @x2 (Tm_type @u1))
          (HasType @x3 (Tm_arrow_ec3e994bdc546940e36859549984c665 @x2 @u1)))
         (HasType (ApplyTT (ApplyTT @x0 @x2) @x3) PulseCore.IndirectionTheorySep.slprop))
        :pattern ((ApplyTT (ApplyTT @x0 @x2) @x3))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc.1))
      (IsTotFun @x0)
      ;; def=PulseCore.IndirectionTheorySep.fsti(61,18-61,54); use=PulseCore.IndirectionTheorySep.fsti(61,33-61,34)
      (forall ((@x2 Term))
       (! (implies (HasType @x2 (Tm_type @u1)) (IsTotFun (ApplyTT @x0 @x2)))
        :pattern ((ApplyTT @x0 @x2))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc @u1)))
    :qid PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc))
  :named PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc))
; interpretation_Tm_arrow_71d208da69e8cfea945dbf406ab689bd
;;; Fact-ids: Name PulseCore.KnotInstantiation.mem_pred; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=PulseCore.KnotInstantiation.fsti(49,26-49,32); use=PulseCore.KnotInstantiation.fsti(49,26-49,36)
  (forall ((@x0 Term))
   (! (iff
     (HasTypeZ @x0 Tm_arrow_71d208da69e8cfea945dbf406ab689bd)
     (and
      ;; def=PulseCore.KnotInstantiation.fsti(49,26-49,32); use=PulseCore.KnotInstantiation.fsti(49,26-49,36)
      (forall ((@x1 Term))
       (! (implies
         (HasType @x1 PulseCore.KnotInstantiation.premem)
         (HasType (ApplyTT @x0 @x1) (Tm_type U_zero)))
        :pattern ((ApplyTT @x0 @x1))
        :qid PulseCore.KnotInstantiation_interpretation_Tm_arrow_71d208da69e8cfea945dbf406ab689bd.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 Tm_arrow_71d208da69e8cfea945dbf406ab689bd))
    :qid PulseCore.KnotInstantiation_interpretation_Tm_arrow_71d208da69e8cfea945dbf406ab689bd))
  :named PulseCore.KnotInstantiation_interpretation_Tm_arrow_71d208da69e8cfea945dbf406ab689bd))
; b2t def
;;; Fact-ids: Name Prims.b2t; Namespace Prims
(assert
 (! ;; def=Prims.fst(165,4-165,7); use=Prims.fst(165,4-165,7)
  (forall ((@x0 Term))
   (! (= (Valid (Prims.b2t @x0)) (BoxBool_proj_0 @x0)) :pattern ((Prims.b2t @x0)) :qid b2t_def))
  :named b2t_def))
; b2t typing
;;; Fact-ids: Name Prims.b2t; Namespace Prims
(assert
 (! ;; def=Prims.fst(165,4-165,7); use=Prims.fst(165,4-165,7)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.bool) (HasType (Prims.b2t @x0) Prims.prop))
    :pattern ((Prims.b2t @x0))
    :qid b2t_typing))
  :named b2t_typing))
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
;;; Fact-ids: Name FStar.Ghost.erased; Namespace FStar.Ghost
(assert
 (! ;; def=FStar.Ghost.fsti(49,4-49,10); use=FStar.Ghost.fsti(49,4-49,10)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 103 (Term_constr_id (FStar.Ghost.erased @u0 @x1)))
    :pattern ((FStar.Ghost.erased @u0 @x1))
    :qid constructor_distinct_FStar.Ghost.erased))
  :named constructor_distinct_FStar.Ghost.erased))
; Constructor distinct
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (= 107 (Term_constr_id Prims.bool)) :named constructor_distinct_Prims.bool))
; Constructor distinct
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (= 298 (Term_constr_id Prims.int)) :named constructor_distinct_Prims.int))
; Constructor distinct
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (= 125 (Term_constr_id Prims.unit)) :named constructor_distinct_Prims.unit))
; Equation for FStar.FunctionalExtensionality.feq
;;; Fact-ids: Name FStar.FunctionalExtensionality.feq; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(48,4-48,7); use=FStar.FunctionalExtensionality.fsti(48,4-48,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.FunctionalExtensionality.feq @u0 @u1 @x2 @x3 @x4 @x5)
     (Prims.l_Forall @u0 @x2 (Tm_abs_a75cec2915107c0935a4203c94bd84c7 @x2 @u0 @u1 @x3 @x4 @x5)))
    :pattern ((FStar.FunctionalExtensionality.feq @u0 @u1 @x2 @x3 @x4 @x5))
    :qid defn_equation_FStar.FunctionalExtensionality.feq))
  :named defn_equation_FStar.FunctionalExtensionality.feq))
; Equation for PulseCore.IndirectionTheorySep.hereditary
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.hereditary; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(57,4-57,14); use=PulseCore.IndirectionTheorySep.fst(57,4-57,14)
  (forall ((@x0 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.hereditary @x0)
     (Prims.l_Forall
      (U_succ (U_succ (U_succ (U_succ U_zero))))
      PulseCore.KnotInstantiation.premem
      (Tm_abs_98df6468e5274e80202c23c067d93953 @x0)))
    :pattern ((PulseCore.IndirectionTheorySep.hereditary @x0))
    :qid defn_equation_PulseCore.IndirectionTheorySep.hereditary))
  :named defn_equation_PulseCore.IndirectionTheorySep.hereditary))
; Equation for PulseCore.IndirectionTheorySep.implies
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.implies; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(587,4-587,11); use=PulseCore.IndirectionTheorySep.fst(587,4-587,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.implies @x0 @x1)
     (Prims.l_Forall
      (U_succ (U_succ (U_succ (U_succ U_zero))))
      PulseCore.KnotInstantiation.premem
      (Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5 @x0 @x1)))
    :pattern ((PulseCore.IndirectionTheorySep.implies @x0 @x1))
    :qid defn_equation_PulseCore.IndirectionTheorySep.implies))
  :named defn_equation_PulseCore.IndirectionTheorySep.implies))
; Equation for PulseCore.IndirectionTheorySep.later_pred
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later_pred; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(558,4-558,14); use=PulseCore.IndirectionTheorySep.fst(558,4-558,14)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.later_pred @x0 @x1)
     (Prims.l_imp
      (Prims.b2t (Prims.op_GreaterThan (PulseCore.KnotInstantiation.level_ @x1) (BoxInt 0)))
      (ApplyTT @x0 (PulseCore.IndirectionTheorySep.age1_ @x1))))
    :pattern ((PulseCore.IndirectionTheorySep.later_pred @x0 @x1))
    :qid defn_equation_PulseCore.IndirectionTheorySep.later_pred))
  :named defn_equation_PulseCore.IndirectionTheorySep.later_pred))
; Equation for PulseCore.IndirectionTheorySep.mem_pred_affine
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(43,4-43,19); use=PulseCore.IndirectionTheorySep.fst(43,4-43,19)
  (forall ((@x0 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.mem_pred_affine @x0)
     (Prims.l_Forall
      (U_succ (U_succ (U_succ (U_succ U_zero))))
      PulseCore.KnotInstantiation.premem
      (Tm_abs_5f339e803bb418ce6f0d13ad44b64b52 @x0)))
    :pattern ((PulseCore.IndirectionTheorySep.mem_pred_affine @x0))
    :qid defn_equation_PulseCore.IndirectionTheorySep.mem_pred_affine))
  :named defn_equation_PulseCore.IndirectionTheorySep.mem_pred_affine))
; Equation for PulseCore.IndirectionTheorySep.slprop_ok'
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop_ok'; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(60,4-60,14); use=PulseCore.IndirectionTheorySep.fst(60,4-60,14)
  (forall ((@x0 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.slprop_ok_ @x0)
     (Prims.l_and
      (PulseCore.IndirectionTheorySep.hereditary @x0)
      (PulseCore.IndirectionTheorySep.mem_pred_affine @x0)))
    :pattern ((PulseCore.IndirectionTheorySep.slprop_ok_ @x0))
    :qid defn_equation_PulseCore.IndirectionTheorySep.slprop_ok_))
  :named defn_equation_PulseCore.IndirectionTheorySep.slprop_ok_))
; Eq2 interpretation
;;; Fact-ids: Name Prims.eq2; Namespace Prims
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff (= @x2 @x3) (Valid (Prims.eq2 @u0 @x1 @x2 @x3)))
    :pattern ((Prims.eq2 @u0 @x1 @x2 @x3))
    :qid eq2-interp))
  :named eq2-interp))
; Equation for FStar.FunctionalExtensionality.feq
;;; Fact-ids: Name FStar.FunctionalExtensionality.feq; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(48,4-48,7); use=FStar.FunctionalExtensionality.fsti(48,4-48,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (Valid (FStar.FunctionalExtensionality.feq @u0 @u1 @x2 @x3 @x4 @x5))
     ;; def=FStar.FunctionalExtensionality.fsti(48,56-48,100); use=FStar.FunctionalExtensionality.fsti(48,56-48,100)
     (forall ((@x6 Term))
      (! (implies
        (HasType @x6 @x2)
        ;; def=FStar.FunctionalExtensionality.fsti(48,90-48,100); use=FStar.FunctionalExtensionality.fsti(48,90-48,100)
        (= (ApplyTT @x4 @x6) (ApplyTT @x5 @x6)))
       :pattern ((ApplyTT @x4 @x6))
       :pattern ((ApplyTT @x5 @x6))
       :qid equation_FStar.FunctionalExtensionality.feq.1)))
    :pattern ((FStar.FunctionalExtensionality.feq @u0 @u1 @x2 @x3 @x4 @x5))
    :qid equation_FStar.FunctionalExtensionality.feq))
  :named equation_FStar.FunctionalExtensionality.feq))
; Equation for FStar.FunctionalExtensionality.is_restricted
;;; Fact-ids: Name FStar.FunctionalExtensionality.is_restricted; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(94,4-94,17); use=FStar.FunctionalExtensionality.fsti(94,4-94,17)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.FunctionalExtensionality.is_restricted @u0 @u1 @x2 @x3 @x4)
     (Prims.eq2
      (U_max @u1 @u0)
      (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1)
      (FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x4)
      @x4))
    :pattern ((FStar.FunctionalExtensionality.is_restricted @u0 @u1 @x2 @x3 @x4))
    :qid equation_FStar.FunctionalExtensionality.is_restricted))
  :named equation_FStar.FunctionalExtensionality.is_restricted))
; Equation for FStar.FunctionalExtensionality.restricted_t
;;; Fact-ids: Name FStar.FunctionalExtensionality.restricted_t; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(102,4-102,16); use=FStar.FunctionalExtensionality.fsti(102,4-102,16)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.FunctionalExtensionality.restricted_t @u0 @u1 @x2 @x3)
     (Tm_refine_a94de11175d00fdbbdf07b37c09f231c @u0 @u1 @x2 @x3))
    :pattern ((FStar.FunctionalExtensionality.restricted_t @u0 @u1 @x2 @x3))
    :qid equation_FStar.FunctionalExtensionality.restricted_t))
  :named equation_FStar.FunctionalExtensionality.restricted_t))
; Equation for Prims.eqtype
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (= Prims.eqtype Tm_refine_9d6af3f3535473623f7aec2f0501897f) :named equation_Prims.eqtype))
; Equation for Prims.nat
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (= Prims.nat Tm_refine_542f9d4f129664613f2483a6c88bc7c2) :named equation_Prims.nat))
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
   (! (= (Prims.pure_post_ @u0 @x1 @x2) (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u0 @x2 @x1))
    :pattern ((Prims.pure_post_ @u0 @x1 @x2))
    :qid equation_Prims.pure_post_))
  :named equation_Prims.pure_post_))
; Equation for Prims.squash
;;; Fact-ids: Name Prims.squash; Namespace Prims
(assert
 (! ;; def=Prims.fst(134,5-134,11); use=Prims.fst(134,5-134,11)
  (forall ((@x0 Term))
   (! (= (Prims.squash @x0) (Tm_refine_2de20c066034c13bf76e9c0b94f4806c @x0))
    :pattern ((Prims.squash @x0))
    :qid equation_Prims.squash))
  :named equation_Prims.squash))
; Equation for PulseCore.BaseHeapSig.mem
;;; Fact-ids: Name PulseCore.BaseHeapSig.mem; Namespace PulseCore.BaseHeapSig
(assert
 (! ;; def=PulseCore.BaseHeapSig.fsti(9,5-9,8); use=PulseCore.BaseHeapSig.fsti(9,5-9,8)
  (forall ((@u0 Universe))
   (! (= (PulseCore.BaseHeapSig.mem @u0) (PulseCore.Heap2.heap @u0))
    :pattern ((PulseCore.BaseHeapSig.mem @u0))
    :qid equation_PulseCore.BaseHeapSig.mem))
  :named equation_PulseCore.BaseHeapSig.mem))
; Equation for PulseCore.IndirectionTheorySep.age1_
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.age1_; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(53,4-53,9); use=PulseCore.IndirectionTheorySep.fst(53,4-53,9)
  (forall ((@x0 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.age1_ @x0)
     (PulseCore.KnotInstantiation.age_to_
      @x0
      (FStar.Ghost.hide
       U_zero
       Prims.nat
       (PulseCore.IndirectionTheorySep.max
        (BoxInt 0)
        (Prims.op_Subtraction (PulseCore.KnotInstantiation.level_ @x0) (BoxInt 1))))))
    :pattern ((PulseCore.IndirectionTheorySep.age1_ @x0))
    :qid equation_PulseCore.IndirectionTheorySep.age1_))
  :named equation_PulseCore.IndirectionTheorySep.age1_))
; Equation for PulseCore.IndirectionTheorySep.hereditary
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.hereditary; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(57,4-57,14); use=PulseCore.IndirectionTheorySep.fst(57,4-57,14)
  (forall ((@x0 Term))
   (! (=
     (Valid (PulseCore.IndirectionTheorySep.hereditary @x0))
     ;; def=PulseCore.IndirectionTheorySep.fst(58,2-58,31); use=PulseCore.IndirectionTheorySep.fst(58,2-58,31)
     (forall ((@x1 Term))
      (! (implies
        (and
         (HasType @x1 PulseCore.KnotInstantiation.premem)
         ;; def=PulseCore.IndirectionTheorySep.fst(58,12-58,15); use=PulseCore.IndirectionTheorySep.fst(58,12-58,15)
         (Valid
          ;; def=PulseCore.IndirectionTheorySep.fst(58,12-58,15); use=PulseCore.IndirectionTheorySep.fst(58,12-58,15)
          (ApplyTT @x0 @x1)))
        ;; def=PulseCore.IndirectionTheorySep.fst(58,20-58,31); use=PulseCore.IndirectionTheorySep.fst(58,20-58,31)
        (Valid
         ;; def=PulseCore.IndirectionTheorySep.fst(58,20-58,31); use=PulseCore.IndirectionTheorySep.fst(58,20-58,31)
         (ApplyTT @x0 (PulseCore.IndirectionTheorySep.age1_ @x1))))
       :qid equation_PulseCore.IndirectionTheorySep.hereditary.1)))
    :pattern ((PulseCore.IndirectionTheorySep.hereditary @x0))
    :qid equation_PulseCore.IndirectionTheorySep.hereditary))
  :named equation_PulseCore.IndirectionTheorySep.hereditary))
; Equation for PulseCore.IndirectionTheorySep.implies
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.implies; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(587,4-587,11); use=PulseCore.IndirectionTheorySep.fst(587,4-587,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (Valid (PulseCore.IndirectionTheorySep.implies @x0 @x1))
     ;; def=PulseCore.IndirectionTheorySep.fst(588,2-588,52); use=PulseCore.IndirectionTheorySep.fst(588,2-588,52)
     (forall ((@x2 Term))
      (! (implies
        (and
         (HasType @x2 PulseCore.KnotInstantiation.premem)
         ;; def=PulseCore.IndirectionTheorySep.fst(588,22-588,34); use=PulseCore.IndirectionTheorySep.fst(588,22-588,34)
         (> (BoxInt_proj_0 (PulseCore.KnotInstantiation.level_ @x2)) (BoxInt_proj_0 (BoxInt 0)))
         ;; def=PulseCore.IndirectionTheorySep.fst(588,40-588,43); use=PulseCore.IndirectionTheorySep.fst(588,40-588,43)
         (Valid
          ;; def=PulseCore.IndirectionTheorySep.fst(588,40-588,43); use=PulseCore.IndirectionTheorySep.fst(588,40-588,43)
          (ApplyTT @x0 @x2)))
        ;; def=PulseCore.IndirectionTheorySep.fst(588,48-588,51); use=PulseCore.IndirectionTheorySep.fst(588,48-588,51)
        (Valid
         ;; def=PulseCore.IndirectionTheorySep.fst(588,48-588,51); use=PulseCore.IndirectionTheorySep.fst(588,48-588,51)
         (ApplyTT @x1 @x2)))
       :qid equation_PulseCore.IndirectionTheorySep.implies.1)))
    :pattern ((PulseCore.IndirectionTheorySep.implies @x0 @x1))
    :qid equation_PulseCore.IndirectionTheorySep.implies))
  :named equation_PulseCore.IndirectionTheorySep.implies))
; Equation for PulseCore.IndirectionTheorySep.later
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(560,4-560,9); use=PulseCore.IndirectionTheorySep.fst(560,4-560,9)
  (forall ((@x0 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.later @x0)
     (PulseCore.IndirectionTheorySep.mk_slprop
      (ApplyTT PulseCore.IndirectionTheorySep.later_pred@tok @x0)))
    :pattern ((PulseCore.IndirectionTheorySep.later @x0))
    :qid equation_PulseCore.IndirectionTheorySep.later))
  :named equation_PulseCore.IndirectionTheorySep.later))
; Equation for PulseCore.IndirectionTheorySep.later_pred
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later_pred; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(558,4-558,14); use=PulseCore.IndirectionTheorySep.fst(558,4-558,14)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (Valid (PulseCore.IndirectionTheorySep.later_pred @x0 @x1))
     ;; def=PulseCore.IndirectionTheorySep.fst(559,2-559,30); use=PulseCore.IndirectionTheorySep.fst(559,2-559,30)
     (implies
      ;; def=PulseCore.IndirectionTheorySep.fst(559,2-559,14); use=PulseCore.IndirectionTheorySep.fst(559,2-559,14)
      (> (BoxInt_proj_0 (PulseCore.KnotInstantiation.level_ @x1)) (BoxInt_proj_0 (BoxInt 0)))
      ;; def=PulseCore.IndirectionTheorySep.fst(559,19-559,30); use=PulseCore.IndirectionTheorySep.fst(559,19-559,30)
      (Valid
       ;; def=PulseCore.IndirectionTheorySep.fst(559,19-559,30); use=PulseCore.IndirectionTheorySep.fst(559,19-559,30)
       (ApplyTT @x0 (PulseCore.IndirectionTheorySep.age1_ @x1)))))
    :pattern ((PulseCore.IndirectionTheorySep.later_pred @x0 @x1))
    :qid equation_PulseCore.IndirectionTheorySep.later_pred))
  :named equation_PulseCore.IndirectionTheorySep.later_pred))
; Equation for PulseCore.IndirectionTheorySep.max
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.max; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(46,4-46,7); use=PulseCore.IndirectionTheorySep.fst(46,4-46,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.max @x0 @x1)
     (let ((@lb2 (Prims.op_GreaterThan @x0 @x1))) (ite (= @lb2 (BoxBool true)) @x0 @x1)))
    :pattern ((PulseCore.IndirectionTheorySep.max @x0 @x1))
    :qid equation_PulseCore.IndirectionTheorySep.max))
  :named equation_PulseCore.IndirectionTheorySep.max))
; Equation for PulseCore.IndirectionTheorySep.mem_pred_affine
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(43,4-43,19); use=PulseCore.IndirectionTheorySep.fst(43,4-43,19)
  (forall ((@x0 Term))
   (! (=
     (Valid (PulseCore.IndirectionTheorySep.mem_pred_affine @x0))
     ;; def=PulseCore.IndirectionTheorySep.fst(44,2-44,39); use=PulseCore.IndirectionTheorySep.fst(44,2-44,39)
     (forall ((@x1 Term) (@x2 Term))
      (! (implies
        (and
         (HasType @x1 PulseCore.KnotInstantiation.premem)
         (HasType @x2 PulseCore.KnotInstantiation.premem)
         ;; def=PulseCore.IndirectionTheorySep.fst(44,14-44,24); use=PulseCore.IndirectionTheorySep.fst(44,14-44,24)
         (Valid
          ;; def=PulseCore.IndirectionTheorySep.fst(44,14-44,24); use=PulseCore.IndirectionTheorySep.fst(44,14-44,24)
          (PulseCore.IndirectionTheorySep.mem_le @x1 @x2))
         ;; def=PulseCore.IndirectionTheorySep.fst(44,28-44,31); use=PulseCore.IndirectionTheorySep.fst(44,28-44,31)
         (Valid
          ;; def=PulseCore.IndirectionTheorySep.fst(44,28-44,31); use=PulseCore.IndirectionTheorySep.fst(44,28-44,31)
          (ApplyTT @x0 @x1)))
        ;; def=PulseCore.IndirectionTheorySep.fst(44,36-44,39); use=PulseCore.IndirectionTheorySep.fst(44,36-44,39)
        (Valid
         ;; def=PulseCore.IndirectionTheorySep.fst(44,36-44,39); use=PulseCore.IndirectionTheorySep.fst(44,36-44,39)
         (ApplyTT @x0 @x2)))
       :qid equation_PulseCore.IndirectionTheorySep.mem_pred_affine.1)))
    :pattern ((PulseCore.IndirectionTheorySep.mem_pred_affine @x0))
    :qid equation_PulseCore.IndirectionTheorySep.mem_pred_affine))
  :named equation_PulseCore.IndirectionTheorySep.mem_pred_affine))
; Equation for PulseCore.IndirectionTheorySep.mk_slprop
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mk_slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(108,4-108,13); use=PulseCore.IndirectionTheorySep.fst(108,4-108,13)
  (forall ((@x0 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.mk_slprop @x0)
     (FStar.FunctionalExtensionality.on_domain
      (U_succ (U_succ (U_succ (U_succ U_zero))))
      U_zero
      PulseCore.KnotInstantiation.premem
      Tm_abs_489879e33d44f3d4936acefa7efa4b56
      @x0))
    :pattern ((PulseCore.IndirectionTheorySep.mk_slprop @x0))
    :qid equation_PulseCore.IndirectionTheorySep.mk_slprop))
  :named equation_PulseCore.IndirectionTheorySep.mk_slprop))
; Equation for PulseCore.IndirectionTheorySep.op_exists_Star
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(415,5-415,12); use=PulseCore.IndirectionTheorySep.fst(415,5-415,12)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.op_exists_Star @u0 @x1 @x2)
     (FStar.FunctionalExtensionality.on_domain
      (U_succ (U_succ (U_succ (U_succ U_zero))))
      U_zero
      PulseCore.KnotInstantiation.premem
      Tm_abs_489879e33d44f3d4936acefa7efa4b56
      (Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e @u0 @x1 @x2)))
    :pattern ((PulseCore.IndirectionTheorySep.op_exists_Star @u0 @x1 @x2))
    :qid equation_PulseCore.IndirectionTheorySep.op_exists_Star))
  :named equation_PulseCore.IndirectionTheorySep.op_exists_Star))
; Equation for PulseCore.IndirectionTheorySep.slprop
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (= PulseCore.IndirectionTheorySep.slprop Tm_refine_7b079aec204a306b131c0098fd4913a1)
  :named equation_PulseCore.IndirectionTheorySep.slprop))
; Equation for PulseCore.IndirectionTheorySep.slprop_ok'
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop_ok'; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(60,4-60,14); use=PulseCore.IndirectionTheorySep.fst(60,4-60,14)
  (forall ((@x0 Term))
   (! (=
     (Valid (PulseCore.IndirectionTheorySep.slprop_ok_ @x0))
     ;; def=PulseCore.IndirectionTheorySep.fst(60,44-60,77); use=PulseCore.IndirectionTheorySep.fst(60,44-60,77)
     (and
      ;; def=PulseCore.IndirectionTheorySep.fst(60,44-60,56); use=PulseCore.IndirectionTheorySep.fst(60,44-60,56)
      (Valid
       ;; def=PulseCore.IndirectionTheorySep.fst(60,44-60,56); use=PulseCore.IndirectionTheorySep.fst(60,44-60,56)
       (PulseCore.IndirectionTheorySep.hereditary @x0))
      ;; def=PulseCore.IndirectionTheorySep.fst(60,60-60,77); use=PulseCore.IndirectionTheorySep.fst(60,60-60,77)
      (Valid
       ;; def=PulseCore.IndirectionTheorySep.fst(60,60-60,77); use=PulseCore.IndirectionTheorySep.fst(60,60-60,77)
       (PulseCore.IndirectionTheorySep.mem_pred_affine @x0))))
    :pattern ((PulseCore.IndirectionTheorySep.slprop_ok_ @x0))
    :qid equation_PulseCore.IndirectionTheorySep.slprop_ok_))
  :named equation_PulseCore.IndirectionTheorySep.slprop_ok_))
; Equation for PulseCore.IndirectionTheorySep.timeless
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.timeless; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fsti(203,4-203,12); use=PulseCore.IndirectionTheorySep.fsti(203,4-203,12)
  (forall ((@x0 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.timeless @x0)
     (PulseCore.IndirectionTheorySep.implies (PulseCore.IndirectionTheorySep.later @x0) @x0))
    :pattern ((PulseCore.IndirectionTheorySep.timeless @x0))
    :qid equation_PulseCore.IndirectionTheorySep.timeless))
  :named equation_PulseCore.IndirectionTheorySep.timeless))
; Equation for PulseCore.KnotInstantiation.mem_pred
;;; Fact-ids: Name PulseCore.KnotInstantiation.mem_pred; Namespace PulseCore.KnotInstantiation
(assert
 (! (=
   PulseCore.KnotInstantiation.mem_pred
   (FStar.FunctionalExtensionality.restricted_t
    (U_succ (U_succ (U_succ (U_succ U_zero))))
    U_zero
    PulseCore.KnotInstantiation.premem
    Tm_abs_489879e33d44f3d4936acefa7efa4b56))
  :named equation_PulseCore.KnotInstantiation.mem_pred))
; Equation for PulseCore.MemoryAlt.mem
;;; Fact-ids: Name PulseCore.MemoryAlt.mem; Namespace PulseCore.MemoryAlt
(assert
 (! ;; def=PulseCore.MemoryAlt.fsti(26,4-26,7); use=PulseCore.MemoryAlt.fsti(26,4-26,7)
  (forall ((@u0 Universe))
   (! (= (PulseCore.MemoryAlt.mem @u0) (PulseCore.BaseHeapSig.mem (U_succ (U_succ (U_succ @u0)))))
    :pattern ((PulseCore.MemoryAlt.mem @u0))
    :qid equation_PulseCore.MemoryAlt.mem))
  :named equation_PulseCore.MemoryAlt.mem))
; function token typing
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (HasType Prims.bool Prims.eqtype) :named function_token_typing_Prims.bool))
; function token typing
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named function_token_typing_Prims.eqtype))
; function token typing
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (HasType Prims.int Prims.eqtype) :named function_token_typing_Prims.int))
; function token typing
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert
 (! (HasType Prims.l_True Prims.prop) :named function_token_typing_Prims.l_True))
; function token typing
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Prims.nat (Tm_type U_zero)) :named function_token_typing_Prims.nat))
; function token typing
;;; Fact-ids: Name Prims.prop; Namespace Prims
(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named function_token_typing_Prims.prop))
; function token typing
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (HasType Prims.unit Prims.eqtype) :named function_token_typing_Prims.unit))
; function token typing
;;; Fact-ids: Name Pulse.Lib.Loc.loc_id; Namespace Pulse.Lib.Loc
(assert
 (! (HasType Pulse.Lib.Loc.loc_id (Tm_type U_zero))
  :named function_token_typing_Pulse.Lib.Loc.loc_id))
; function token typing
;;; Fact-ids: Name PulseCore.BaseHeapSig.mem; Namespace PulseCore.BaseHeapSig
(assert
 (! ;; def=PulseCore.BaseHeapSig.fsti(9,5-9,8); use=PulseCore.BaseHeapSig.fsti(9,5-9,8)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.BaseHeapSig.mem @u0) (Tm_type (U_succ @u0)))
    :pattern ((PulseCore.BaseHeapSig.mem @u0))
    :qid function_token_typing_PulseCore.BaseHeapSig.mem))
  :named function_token_typing_PulseCore.BaseHeapSig.mem))
; function token typing
;;; Fact-ids: Name PulseCore.Heap2.heap; Namespace PulseCore.Heap2
(assert
 (! ;; def=PulseCore.Heap2.fsti(42,4-42,8); use=PulseCore.Heap2.fsti(42,4-42,8)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.Heap2.heap @u0) (Tm_type (U_succ @u0)))
    :pattern ((PulseCore.Heap2.heap @u0))
    :qid function_token_typing_PulseCore.Heap2.heap))
  :named function_token_typing_PulseCore.Heap2.heap))
; function token typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(560,4-560,9); use=PulseCore.IndirectionTheorySep.fst(560,4-560,9)
  (forall ((@x0 Term))
   (! (and
     (NoHoist
      @x0
      (HasType PulseCore.IndirectionTheorySep.later@tok Tm_arrow_723cf278d9f5b7b5212a5f92ca976294))
     ;; def=PulseCore.IndirectionTheorySep.fst(560,4-560,9); use=PulseCore.IndirectionTheorySep.fst(560,4-560,9)
     (forall ((@x1 Term))
      (! (=
        (ApplyTT PulseCore.IndirectionTheorySep.later@tok @x1)
        (PulseCore.IndirectionTheorySep.later @x1))
       :pattern ((PulseCore.IndirectionTheorySep.later @x1))
       :qid function_token_typing_PulseCore.IndirectionTheorySep.later.1)))
    :pattern ((ApplyTT @x0 PulseCore.IndirectionTheorySep.later@tok))
    :qid function_token_typing_PulseCore.IndirectionTheorySep.later))
  :named function_token_typing_PulseCore.IndirectionTheorySep.later))
; function token typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later_pred; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(558,4-558,14); use=PulseCore.IndirectionTheorySep.fst(558,4-558,14)
  (forall ((@x0 Term))
   (! (and
     (NoHoist
      @x0
      (HasType
       PulseCore.IndirectionTheorySep.later_pred@tok
       Tm_arrow_21228a5f7cc560451f99b21cf6295dbc))
     ;; def=PulseCore.IndirectionTheorySep.fst(558,4-558,14); use=PulseCore.IndirectionTheorySep.fst(558,4-558,14)
     (forall ((@x1 Term) (@x2 Term))
      (! (=
        (ApplyTT (ApplyTT PulseCore.IndirectionTheorySep.later_pred@tok @x1) @x2)
        (PulseCore.IndirectionTheorySep.later_pred @x1 @x2))
       :pattern ((PulseCore.IndirectionTheorySep.later_pred @x1 @x2))
       :qid function_token_typing_PulseCore.IndirectionTheorySep.later_pred.1)))
    :pattern ((ApplyTT @x0 PulseCore.IndirectionTheorySep.later_pred@tok))
    :qid function_token_typing_PulseCore.IndirectionTheorySep.later_pred))
  :named function_token_typing_PulseCore.IndirectionTheorySep.later_pred))
; function token typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_le; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(40,24-40,30); use=PulseCore.IndirectionTheorySep.fst(40,24-40,30)
  (forall ((@x0 Term))
   (! (and
     (NoHoist
      @x0
      (HasType PulseCore.IndirectionTheorySep.mem_le@tok Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef))
     ;; def=PulseCore.IndirectionTheorySep.fst(40,24-40,30); use=PulseCore.IndirectionTheorySep.fst(40,24-40,30)
     (forall ((@x1 Term) (@x2 Term))
      (! (=
        (ApplyTT (ApplyTT PulseCore.IndirectionTheorySep.mem_le@tok @x1) @x2)
        (PulseCore.IndirectionTheorySep.mem_le @x1 @x2))
       :pattern ((PulseCore.IndirectionTheorySep.mem_le @x1 @x2))
       :qid function_token_typing_PulseCore.IndirectionTheorySep.mem_le.1)))
    :pattern ((ApplyTT @x0 PulseCore.IndirectionTheorySep.mem_le@tok))
    :qid function_token_typing_PulseCore.IndirectionTheorySep.mem_le))
  :named function_token_typing_PulseCore.IndirectionTheorySep.mem_le))
; function token typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(415,5-415,12); use=PulseCore.IndirectionTheorySep.fst(415,5-415,12)
  (forall ((@u0 Universe))
   (! (HasType
     (PulseCore.IndirectionTheorySep.op_exists_Star@tok @u0)
     (Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc @u0))
    :pattern ((PulseCore.IndirectionTheorySep.op_exists_Star@tok @u0))
    :qid function_token_typing_PulseCore.IndirectionTheorySep.op_exists_Star))
  :named function_token_typing_PulseCore.IndirectionTheorySep.op_exists_Star))
; function token typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (HasType
   PulseCore.IndirectionTheorySep.slprop
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named function_token_typing_PulseCore.IndirectionTheorySep.slprop))
; function token typing
;;; Fact-ids: Name PulseCore.KnotInstantiation.mem_pred; Namespace PulseCore.KnotInstantiation
(assert
 (! (HasType
   PulseCore.KnotInstantiation.mem_pred
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named function_token_typing_PulseCore.KnotInstantiation.mem_pred))
; function token typing
;;; Fact-ids: Name PulseCore.KnotInstantiation.premem; Namespace PulseCore.KnotInstantiation
(assert
 (! (HasType PulseCore.KnotInstantiation.premem (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named function_token_typing_PulseCore.KnotInstantiation.premem))
; function token typing
;;; Fact-ids: Name PulseCore.MemoryAlt.mem; Namespace PulseCore.MemoryAlt
(assert
 (! ;; def=PulseCore.MemoryAlt.fsti(26,4-26,7); use=PulseCore.MemoryAlt.fsti(26,4-26,7)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.MemoryAlt.mem @u0) (Tm_type (U_succ (U_succ (U_succ (U_succ @u0))))))
    :pattern ((PulseCore.MemoryAlt.mem @u0))
    :qid function_token_typing_PulseCore.MemoryAlt.mem))
  :named function_token_typing_PulseCore.MemoryAlt.mem))
; haseq for Tm_refine_006f502666b42ae7b238ae3f195b8c19
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.age1_; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(53,24-53,63); use=PulseCore.IndirectionTheorySep.fst(53,24-53,63)
  (forall ((@x0 Term))
   (! (iff
     (Valid
      (Prims.hasEq
       (U_succ (U_succ (U_succ (U_succ U_zero))))
       (Tm_refine_006f502666b42ae7b238ae3f195b8c19 @x0)))
     (Valid
      (Prims.hasEq (U_succ (U_succ (U_succ (U_succ U_zero)))) PulseCore.KnotInstantiation.premem)))
    :pattern
     ((Valid
       (Prims.hasEq
        (U_succ (U_succ (U_succ (U_succ U_zero))))
        (Tm_refine_006f502666b42ae7b238ae3f195b8c19 @x0))))
    :qid haseqTm_refine_006f502666b42ae7b238ae3f195b8c19))
  :named haseqTm_refine_006f502666b42ae7b238ae3f195b8c19))
; haseq for Tm_refine_2de20c066034c13bf76e9c0b94f4806c
;;; Fact-ids: Name Prims.squash; Namespace Prims
(assert
 (! ;; def=Prims.fst(134,32-134,42); use=Prims.fst(134,32-134,42)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_2de20c066034c13bf76e9c0b94f4806c @x0)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_2de20c066034c13bf76e9c0b94f4806c @x0))))
    :qid haseqTm_refine_2de20c066034c13bf76e9c0b94f4806c))
  :named haseqTm_refine_2de20c066034c13bf76e9c0b94f4806c))
; haseq for Tm_refine_542f9d4f129664613f2483a6c88bc7c2
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_542f9d4f129664613f2483a6c88bc7c2))
; haseq for Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mk_slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (iff
   (Valid
    (Prims.hasEq
     (U_succ (U_succ (U_succ (U_succ U_zero))))
     Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4))
   (Valid
    (Prims.hasEq
     (U_succ (U_succ (U_succ (U_succ U_zero))))
     Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)))
  :named haseqTm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4))
; haseq for Tm_refine_7b079aec204a306b131c0098fd4913a1
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (iff
   (Valid
    (Prims.hasEq
     (U_succ (U_succ (U_succ (U_succ U_zero))))
     Tm_refine_7b079aec204a306b131c0098fd4913a1))
   (Valid
    (Prims.hasEq (U_succ (U_succ (U_succ (U_succ U_zero)))) PulseCore.KnotInstantiation.mem_pred)))
  :named haseqTm_refine_7b079aec204a306b131c0098fd4913a1))
; haseq for Tm_refine_9d6af3f3535473623f7aec2f0501897f
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq (U_succ U_zero) Tm_refine_9d6af3f3535473623f7aec2f0501897f))
   (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
  :named haseqTm_refine_9d6af3f3535473623f7aec2f0501897f))
; haseq for Tm_refine_a94de11175d00fdbbdf07b37c09f231c
;;; Fact-ids: Name FStar.FunctionalExtensionality.restricted_t; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(102,46-102,78); use=FStar.FunctionalExtensionality.fsti(102,46-102,78)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid
      (Prims.hasEq (U_max @u1 @u0) (Tm_refine_a94de11175d00fdbbdf07b37c09f231c @u0 @u1 @x2 @x3)))
     (Valid
      (Prims.hasEq (U_max @u1 @u0) (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1))))
    :pattern
     ((Valid
       (Prims.hasEq (U_max @u1 @u0) (Tm_refine_a94de11175d00fdbbdf07b37c09f231c @u0 @u1 @x2 @x3))))
    :qid haseqTm_refine_a94de11175d00fdbbdf07b37c09f231c))
  :named haseqTm_refine_a94de11175d00fdbbdf07b37c09f231c))
; haseq for Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=Prims.fst(281,39-281,48)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 @u0 @x1 @x2)))
     (Valid (Prims.hasEq @u0 @x2)))
    :pattern ((Valid (Prims.hasEq @u0 (Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 @u0 @x1 @x2))))
    :qid haseqTm_refine_d79dab86b7f5fc89b7215ab23d0f2c81))
  :named haseqTm_refine_d79dab86b7f5fc89b7215ab23d0f2c81))
; haseq for Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f
;;; Fact-ids: Name PulseCore.KnotInstantiation.age_to_; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=PulseCore.KnotInstantiation.fsti(99,4-99,145); use=PulseCore.KnotInstantiation.fsti(99,4-99,145)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid
      (Prims.hasEq
       (U_succ (U_succ (U_succ (U_succ U_zero))))
       (Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f @x0 @x1)))
     (Valid
      (Prims.hasEq (U_succ (U_succ (U_succ (U_succ U_zero)))) PulseCore.KnotInstantiation.premem)))
    :pattern
     ((Valid
       (Prims.hasEq
        (U_succ (U_succ (U_succ (U_succ U_zero))))
        (Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f @x0 @x1))))
    :qid haseqTm_refine_ebd2ddbc11eaf26155605ca04ae4611f))
  :named haseqTm_refine_ebd2ddbc11eaf26155605ca04ae4611f))
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
; interpretation_Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(418,4-418,23); use=PulseCore.IndirectionTheorySep.fst(418,4-418,23)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (=
     (ApplyTT (Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e @u1 @x2 @x3) @x0)
     (Prims.l_Exists @u1 @x2 (Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 @x2 @u1 @x3 @x0)))
    :pattern ((ApplyTT (Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e @u1 @x2 @x3) @x0))
    :qid interpretation_Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e))
  :named interpretation_Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e))
; interpretation_Tm_abs_489879e33d44f3d4936acefa7efa4b56
;;; Fact-ids: Name PulseCore.KnotInstantiation.mem_pred; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(111,34-111,35); use=PulseCore.KnotInstantiation.fsti(49,33-49,36)
  (forall ((@x0 Term))
   (! (= (ApplyTT Tm_abs_489879e33d44f3d4936acefa7efa4b56 @x0) Prims.prop)
    :pattern ((ApplyTT Tm_abs_489879e33d44f3d4936acefa7efa4b56 @x0))
    :qid interpretation_Tm_abs_489879e33d44f3d4936acefa7efa4b56))
  :named interpretation_Tm_abs_489879e33d44f3d4936acefa7efa4b56))
; interpretation_Tm_abs_494f67d3d2785ac4e7adad79c0124d7d
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(44,11-44,39); use=PulseCore.IndirectionTheorySep.fst(44,11-44,39)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (ApplyTT (Tm_abs_494f67d3d2785ac4e7adad79c0124d7d @x1 @x2) @x0)
     (Prims.l_imp
      (Prims.l_and (PulseCore.IndirectionTheorySep.mem_le @x1 @x0) (ApplyTT @x2 @x1))
      (ApplyTT @x2 @x0)))
    :pattern ((ApplyTT (Tm_abs_494f67d3d2785ac4e7adad79c0124d7d @x1 @x2) @x0))
    :qid interpretation_Tm_abs_494f67d3d2785ac4e7adad79c0124d7d))
  :named interpretation_Tm_abs_494f67d3d2785ac4e7adad79c0124d7d))
; interpretation_Tm_abs_5f339e803bb418ce6f0d13ad44b64b52
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(44,11-44,39); use=PulseCore.IndirectionTheorySep.fst(44,11-44,39)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (ApplyTT (Tm_abs_5f339e803bb418ce6f0d13ad44b64b52 @x1) @x0)
     (Prims.l_Forall
      (U_succ (U_succ (U_succ (U_succ U_zero))))
      PulseCore.KnotInstantiation.premem
      (Tm_abs_494f67d3d2785ac4e7adad79c0124d7d @x0 @x1)))
    :pattern ((ApplyTT (Tm_abs_5f339e803bb418ce6f0d13ad44b64b52 @x1) @x0))
    :qid interpretation_Tm_abs_5f339e803bb418ce6f0d13ad44b64b52))
  :named interpretation_Tm_abs_5f339e803bb418ce6f0d13ad44b64b52))
; interpretation_Tm_abs_7358bb1256b6e64970c6650590cbe31b
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later_exists; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fsti(211,28-211,31); use=PulseCore.IndirectionTheorySep.fst(658,4-658,16)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (= (ApplyTT (Tm_abs_7358bb1256b6e64970c6650590cbe31b @x1 @u2 @x3) @x0) (ApplyTT @x3 @x0))
    :pattern ((ApplyTT (Tm_abs_7358bb1256b6e64970c6650590cbe31b @x1 @u2 @x3) @x0))
    :qid interpretation_Tm_abs_7358bb1256b6e64970c6650590cbe31b))
  :named interpretation_Tm_abs_7358bb1256b6e64970c6650590cbe31b))
; interpretation_Tm_abs_98df6468e5274e80202c23c067d93953
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.hereditary; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(58,2-58,31); use=PulseCore.IndirectionTheorySep.fst(58,2-58,31)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (ApplyTT (Tm_abs_98df6468e5274e80202c23c067d93953 @x1) @x0)
     (Prims.l_imp (ApplyTT @x1 @x0) (ApplyTT @x1 (PulseCore.IndirectionTheorySep.age1_ @x0))))
    :pattern ((ApplyTT (Tm_abs_98df6468e5274e80202c23c067d93953 @x1) @x0))
    :qid interpretation_Tm_abs_98df6468e5274e80202c23c067d93953))
  :named interpretation_Tm_abs_98df6468e5274e80202c23c067d93953))
; interpretation_Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2
;;; Fact-ids: Name FStar.Pervasives.pure_bind_wp; Namespace FStar.Pervasives
(assert
 (! ;; def=Prims.fst(335,38-335,57); use=FStar.Pervasives.fsti(197,2-197,15)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (=
     (ApplyTT (Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 @x1 @u2 @x3 @x4) @x0)
     (ApplyTT (ApplyTT @x3 @x0) @x4))
    :pattern ((ApplyTT (Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 @x1 @u2 @x3 @x4) @x0))
    :qid interpretation_Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2))
  :named interpretation_Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2))
; interpretation_Tm_abs_a75cec2915107c0935a4203c94bd84c7
;;; Fact-ids: Name FStar.FunctionalExtensionality.feq; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(48,56-48,100); use=FStar.FunctionalExtensionality.fsti(48,56-48,100)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@u3 Universe) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (ApplyTT (Tm_abs_a75cec2915107c0935a4203c94bd84c7 @x1 @u2 @u3 @x4 @x5 @x6) @x0)
     (Prims.eq2 @u3 (ApplyTT @x4 @x0) (ApplyTT @x5 @x0) (ApplyTT @x6 @x0)))
    :pattern ((ApplyTT (Tm_abs_a75cec2915107c0935a4203c94bd84c7 @x1 @u2 @u3 @x4 @x5 @x6) @x0))
    :qid interpretation_Tm_abs_a75cec2915107c0935a4203c94bd84c7))
  :named interpretation_Tm_abs_a75cec2915107c0935a4203c94bd84c7))
; interpretation_Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.implies; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(588,2-588,52); use=PulseCore.IndirectionTheorySep.fst(588,2-588,52)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (ApplyTT (Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5 @x1 @x2) @x0)
     (Prims.l_imp
      (Prims.b2t (Prims.op_GreaterThan (PulseCore.KnotInstantiation.level_ @x0) (BoxInt 0)))
      (Prims.l_imp (ApplyTT @x1 @x0) (ApplyTT @x2 @x0))))
    :pattern ((ApplyTT (Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5 @x1 @x2) @x0))
    :qid interpretation_Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5))
  :named interpretation_Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5))
; kinding_Tm_arrow_21228a5f7cc560451f99b21cf6295dbc
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later_pred; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (HasType
   Tm_arrow_21228a5f7cc560451f99b21cf6295dbc
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named kinding_Tm_arrow_21228a5f7cc560451f99b21cf6295dbc))
; kinding_Tm_arrow_505f8adb466dc430d209c7de298af914
;;; Fact-ids: Name FStar.FunctionalExtensionality.arrow; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(41,11-41,56); use=FStar.FunctionalExtensionality.fsti(41,42-41,56)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@u3 Universe))
   (! (HasType (Tm_arrow_505f8adb466dc430d209c7de298af914 @x0 @x1 @u2 @u3) (Tm_type (U_max @u3 @u2)))
    :pattern
     ((HasType (Tm_arrow_505f8adb466dc430d209c7de298af914 @x0 @x1 @u2 @u3) (Tm_type (U_max @u3 @u2))))
    :qid kinding_Tm_arrow_505f8adb466dc430d209c7de298af914))
  :named kinding_Tm_arrow_505f8adb466dc430d209c7de298af914))
; kinding_Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_le'; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (HasType
   Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named kinding_Tm_arrow_551ed30a1a0342d0b42c6db5467bfeef))
; kinding_Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa
;;; Fact-ids: Name Prims.dtuple2; Namespace Prims; Name Prims.Mkdtuple2; Namespace Prims
(assert
 (! ;; def=Prims.fst(471,14-471,42); use=Prims.fst(471,28-471,42)
  (forall ((@x0 Term) (@u1 Universe) (@u2 Universe))
   (! (HasType
     (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x0 @u1 @u2)
     (Tm_type (U_max @u2 (U_succ @u1))))
    :pattern
     ((HasType
       (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x0 @u1 @u2)
       (Tm_type (U_max @u2 (U_succ @u1)))))
    :qid kinding_Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa))
  :named kinding_Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa))
; kinding_Tm_arrow_71d208da69e8cfea945dbf406ab689bd
;;; Fact-ids: Name PulseCore.KnotInstantiation.mem_pred; Namespace PulseCore.KnotInstantiation
(assert
 (! (HasType
   Tm_arrow_71d208da69e8cfea945dbf406ab689bd
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named kinding_Tm_arrow_71d208da69e8cfea945dbf406ab689bd))
; kinding_Tm_arrow_723cf278d9f5b7b5212a5f92ca976294
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (HasType
   Tm_arrow_723cf278d9f5b7b5212a5f92ca976294
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named kinding_Tm_arrow_723cf278d9f5b7b5212a5f92ca976294))
; kinding_Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (HasType
   Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named kinding_Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03))
; kinding_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45
;;; Fact-ids: Name Prims.l_Forall; Namespace Prims
(assert
 (! ;; def=Prims.fst(264,22-264,73); use=Prims.fst(264,59-264,73)
  (forall ((@x0 Term) (@u1 Universe))
   (! (HasType (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1) (Tm_type @u1)))
    :qid kinding_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45))
  :named kinding_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45))
; kinding_Tm_arrow_ec3e994bdc546940e36859549984c665
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fsti(61,18-61,44); use=PulseCore.IndirectionTheorySep.fsti(61,33-61,34)
  (forall ((@x0 Term) (@u1 Universe))
   (! (HasType
     (Tm_arrow_ec3e994bdc546940e36859549984c665 @x0 @u1)
     (Tm_type (U_max (U_succ (U_succ (U_succ (U_succ U_zero)))) @u1)))
    :pattern
     ((HasType
       (Tm_arrow_ec3e994bdc546940e36859549984c665 @x0 @u1)
       (Tm_type (U_max (U_succ (U_succ (U_succ (U_succ U_zero)))) @u1))))
    :qid kinding_Tm_arrow_ec3e994bdc546940e36859549984c665))
  :named kinding_Tm_arrow_ec3e994bdc546940e36859549984c665))
; kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,56); use=Prims.fst(281,39-281,56)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u0 @x1 @x2) (Tm_type @u0))
    :pattern ((HasType (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u0 @x1 @x2) (Tm_type @u0)))
    :qid kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
  :named kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
; kinding_Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fsti(61,18-61,54); use=PulseCore.IndirectionTheorySep.fsti(61,33-61,34)
  (forall ((@u0 Universe))
   (! (HasType
     (Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc @u0)
     (Tm_type (U_max (U_succ (U_succ (U_succ (U_succ U_zero)))) (U_succ @u0))))
    :pattern
     ((HasType
       (Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc @u0)
       (Tm_type (U_max (U_succ (U_succ (U_succ (U_succ U_zero)))) (U_succ @u0)))))
    :qid kinding_Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc))
  :named kinding_Tm_arrow_fc76f49116d6d4aba41c85a56ea47edc))
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
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(44,2-44,39); use=PulseCore.IndirectionTheorySep.fst(44,2-44,39)
  (forall ((@x0 Term))
   (! (iff
     (Valid
      (Prims.l_Forall
       (U_succ (U_succ (U_succ (U_succ U_zero))))
       PulseCore.KnotInstantiation.premem
       (Tm_abs_5f339e803bb418ce6f0d13ad44b64b52 @x0)))
     ;; def=PulseCore.IndirectionTheorySep.fst(44,2-44,39); use=PulseCore.IndirectionTheorySep.fst(44,2-44,39)
     (forall ((@x1 Term) (@x2 Term))
      (! (implies
        (and
         (HasType @x1 PulseCore.KnotInstantiation.premem)
         (HasType @x2 PulseCore.KnotInstantiation.premem)
         ;; def=PulseCore.IndirectionTheorySep.fst(44,14-44,24); use=PulseCore.IndirectionTheorySep.fst(44,14-44,24)
         (Valid
          ;; def=PulseCore.IndirectionTheorySep.fst(44,14-44,24); use=PulseCore.IndirectionTheorySep.fst(44,14-44,24)
          (PulseCore.IndirectionTheorySep.mem_le @x1 @x2))
         ;; def=PulseCore.IndirectionTheorySep.fst(44,28-44,31); use=PulseCore.IndirectionTheorySep.fst(44,28-44,31)
         (Valid
          ;; def=PulseCore.IndirectionTheorySep.fst(44,28-44,31); use=PulseCore.IndirectionTheorySep.fst(44,28-44,31)
          (ApplyTT @x0 @x1)))
        ;; def=PulseCore.IndirectionTheorySep.fst(44,36-44,39); use=PulseCore.IndirectionTheorySep.fst(44,36-44,39)
        (Valid
         ;; def=PulseCore.IndirectionTheorySep.fst(44,36-44,39); use=PulseCore.IndirectionTheorySep.fst(44,36-44,39)
         (ApplyTT @x0 @x2)))
       :qid l_quant_interp_4949e4e616a21514f35fb73766f5c199.1)))
    :pattern
     ((Valid
       (Prims.l_Forall
        (U_succ (U_succ (U_succ (U_succ U_zero))))
        PulseCore.KnotInstantiation.premem
        (Tm_abs_5f339e803bb418ce6f0d13ad44b64b52 @x0))))
    :qid l_quant_interp_4949e4e616a21514f35fb73766f5c199))
  :named l_quant_interp_4949e4e616a21514f35fb73766f5c199))
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(418,4-418,23); use=PulseCore.IndirectionTheorySep.fst(418,4-418,23)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.l_Exists @u0 @x1 (Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 @x1 @u0 @x2 @x3)))
     ;; def=PulseCore.IndirectionTheorySep.fst(418,4-418,23); use=PulseCore.IndirectionTheorySep.fst(418,4-418,23)
     (exists ((@x4 Term))
      (! (and
        (HasType @x4 @x1)
        ;; def=PulseCore.IndirectionTheorySep.fst(418,18-418,23); use=PulseCore.IndirectionTheorySep.fst(418,18-418,23)
        (Valid
         ;; def=PulseCore.IndirectionTheorySep.fst(418,18-418,23); use=PulseCore.IndirectionTheorySep.fst(418,18-418,23)
         (ApplyTT (ApplyTT @x2 @x4) @x3)))
       :qid l_quant_interp_8971d191a27ec3f5860632d22361a71a.1)))
    :pattern
     ((Valid (Prims.l_Exists @u0 @x1 (Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 @x1 @u0 @x2 @x3))))
    :qid l_quant_interp_8971d191a27ec3f5860632d22361a71a))
  :named l_quant_interp_8971d191a27ec3f5860632d22361a71a))
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.hereditary; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(58,2-58,31); use=PulseCore.IndirectionTheorySep.fst(58,2-58,31)
  (forall ((@x0 Term))
   (! (iff
     (Valid
      (Prims.l_Forall
       (U_succ (U_succ (U_succ (U_succ U_zero))))
       PulseCore.KnotInstantiation.premem
       (Tm_abs_98df6468e5274e80202c23c067d93953 @x0)))
     ;; def=PulseCore.IndirectionTheorySep.fst(58,2-58,31); use=PulseCore.IndirectionTheorySep.fst(58,2-58,31)
     (forall ((@x1 Term))
      (! (implies
        (and
         (HasType @x1 PulseCore.KnotInstantiation.premem)
         ;; def=PulseCore.IndirectionTheorySep.fst(58,12-58,15); use=PulseCore.IndirectionTheorySep.fst(58,12-58,15)
         (Valid
          ;; def=PulseCore.IndirectionTheorySep.fst(58,12-58,15); use=PulseCore.IndirectionTheorySep.fst(58,12-58,15)
          (ApplyTT @x0 @x1)))
        ;; def=PulseCore.IndirectionTheorySep.fst(58,20-58,31); use=PulseCore.IndirectionTheorySep.fst(58,20-58,31)
        (Valid
         ;; def=PulseCore.IndirectionTheorySep.fst(58,20-58,31); use=PulseCore.IndirectionTheorySep.fst(58,20-58,31)
         (ApplyTT @x0 (PulseCore.IndirectionTheorySep.age1_ @x1))))
       :qid l_quant_interp_9eb0b9500596406f4c8b2e291a7c4c7a.1)))
    :pattern
     ((Valid
       (Prims.l_Forall
        (U_succ (U_succ (U_succ (U_succ U_zero))))
        PulseCore.KnotInstantiation.premem
        (Tm_abs_98df6468e5274e80202c23c067d93953 @x0))))
    :qid l_quant_interp_9eb0b9500596406f4c8b2e291a7c4c7a))
  :named l_quant_interp_9eb0b9500596406f4c8b2e291a7c4c7a))
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name FStar.FunctionalExtensionality.feq; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(48,56-48,100); use=FStar.FunctionalExtensionality.fsti(48,56-48,100)
  (forall ((@u0 Universe) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (Valid
      (Prims.l_Forall @u0 @x1 (Tm_abs_a75cec2915107c0935a4203c94bd84c7 @x1 @u0 @u2 @x3 @x4 @x5)))
     ;; def=FStar.FunctionalExtensionality.fsti(48,56-48,100); use=FStar.FunctionalExtensionality.fsti(48,56-48,100)
     (forall ((@x6 Term))
      (! (implies
        (HasType @x6 @x1)
        ;; def=FStar.FunctionalExtensionality.fsti(48,90-48,100); use=FStar.FunctionalExtensionality.fsti(48,90-48,100)
        (= (ApplyTT @x4 @x6) (ApplyTT @x5 @x6)))
       :pattern ((ApplyTT @x4 @x6))
       :pattern ((ApplyTT @x5 @x6))
       :qid l_quant_interp_c0211bcd945ae3d133dc3b3c96eb9f97.1)))
    :pattern
     ((Valid
       (Prims.l_Forall @u0 @x1 (Tm_abs_a75cec2915107c0935a4203c94bd84c7 @x1 @u0 @u2 @x3 @x4 @x5))))
    :qid l_quant_interp_c0211bcd945ae3d133dc3b3c96eb9f97))
  :named l_quant_interp_c0211bcd945ae3d133dc3b3c96eb9f97))
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.implies; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(588,2-588,52); use=PulseCore.IndirectionTheorySep.fst(588,2-588,52)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid
      (Prims.l_Forall
       (U_succ (U_succ (U_succ (U_succ U_zero))))
       PulseCore.KnotInstantiation.premem
       (Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5 @x0 @x1)))
     ;; def=PulseCore.IndirectionTheorySep.fst(588,2-588,52); use=PulseCore.IndirectionTheorySep.fst(588,2-588,52)
     (forall ((@x2 Term))
      (! (implies
        (and
         (HasType @x2 PulseCore.KnotInstantiation.premem)
         ;; def=PulseCore.IndirectionTheorySep.fst(588,22-588,34); use=PulseCore.IndirectionTheorySep.fst(588,22-588,34)
         (> (BoxInt_proj_0 (PulseCore.KnotInstantiation.level_ @x2)) (BoxInt_proj_0 (BoxInt 0)))
         ;; def=PulseCore.IndirectionTheorySep.fst(588,40-588,43); use=PulseCore.IndirectionTheorySep.fst(588,40-588,43)
         (Valid
          ;; def=PulseCore.IndirectionTheorySep.fst(588,40-588,43); use=PulseCore.IndirectionTheorySep.fst(588,40-588,43)
          (ApplyTT @x0 @x2)))
        ;; def=PulseCore.IndirectionTheorySep.fst(588,48-588,51); use=PulseCore.IndirectionTheorySep.fst(588,48-588,51)
        (Valid
         ;; def=PulseCore.IndirectionTheorySep.fst(588,48-588,51); use=PulseCore.IndirectionTheorySep.fst(588,48-588,51)
         (ApplyTT @x1 @x2)))
       :qid l_quant_interp_d9728d145afd3577730ff19e560f512a.1)))
    :pattern
     ((Valid
       (Prims.l_Forall
        (U_succ (U_succ (U_succ (U_succ U_zero))))
        PulseCore.KnotInstantiation.premem
        (Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5 @x0 @x1))))
    :qid l_quant_interp_d9728d145afd3577730ff19e560f512a))
  :named l_quant_interp_d9728d145afd3577730ff19e560f512a))
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name FStar.Pervasives.pure_close_wp; Namespace FStar.Pervasives
(assert
 (! ;; def=Prims.fst(381,28-381,49); use=FStar.Pervasives.fsti(212,2-212,16)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.l_Forall @u0 @x1 (Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 @x1 @u0 @x2 @x3)))
     ;; def=Prims.fst(381,28-381,49); use=FStar.Pervasives.fsti(212,2-212,16)
     (forall ((@x4 Term))
      (! (implies
        (HasType @x4 @x1)
        ;; def=Prims.fst(381,43-381,49); use=FStar.Pervasives.fsti(212,2-212,16)
        (Valid
         ;; def=Prims.fst(381,43-381,49); use=FStar.Pervasives.fsti(212,2-212,16)
         (ApplyTT (ApplyTT @x2 @x4) @x3)))
       :qid l_quant_interp_e435bbd583dd1d9a3bdc6769d75cb37f.1)))
    :pattern
     ((Valid (Prims.l_Forall @u0 @x1 (Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 @x1 @u0 @x2 @x3))))
    :qid l_quant_interp_e435bbd583dd1d9a3bdc6769d75cb37f))
  :named l_quant_interp_e435bbd583dd1d9a3bdc6769d75cb37f))
; Lemma: FStar.FunctionalExtensionality.extensionality
;;; Fact-ids: Name FStar.FunctionalExtensionality.extensionality; Namespace FStar.FunctionalExtensionality
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x2 @u1 @u0))
      (HasType @x4 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1))
      (HasType @x5 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1)))
     ;; def=FStar.FunctionalExtensionality.fsti(133,21-133,72); use=FStar.FunctionalExtensionality.fsti(133,21-133,72)
     (iff
      ;; def=FStar.FunctionalExtensionality.fsti(133,22-133,35); use=FStar.FunctionalExtensionality.fsti(133,22-133,35)
      (Valid
       ;; def=FStar.FunctionalExtensionality.fsti(133,22-133,35); use=FStar.FunctionalExtensionality.fsti(133,22-133,35)
       (FStar.FunctionalExtensionality.feq @u0 @u1 @x2 @x3 @x4 @x5))
      ;; def=FStar.FunctionalExtensionality.fsti(133,41-133,71); use=FStar.FunctionalExtensionality.fsti(133,41-133,71)
      (=
       (FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x4)
       (FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x5))))
    :pattern ((FStar.FunctionalExtensionality.feq @u0 @u1 @x2 @x3 @x4 @x5))
    :qid lemma_FStar.FunctionalExtensionality.extensionality))
  :named lemma_FStar.FunctionalExtensionality.extensionality))
; Lemma: FStar.FunctionalExtensionality.feq_on_domain
;;; Fact-ids: Name FStar.FunctionalExtensionality.feq_on_domain; Namespace FStar.FunctionalExtensionality
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x2 @u1 @u0))
      (HasType @x4 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1)))
     ;; def=FStar.FunctionalExtensionality.fsti(80,12-80,35); use=FStar.FunctionalExtensionality.fsti(80,12-80,35)
     (Valid
      ;; def=FStar.FunctionalExtensionality.fsti(80,12-80,35); use=FStar.FunctionalExtensionality.fsti(80,12-80,35)
      (FStar.FunctionalExtensionality.feq
       @u0
       @u1
       @x2
       @x3
       (FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x4)
       @x4)))
    :pattern ((FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x4))
    :qid lemma_FStar.FunctionalExtensionality.feq_on_domain))
  :named lemma_FStar.FunctionalExtensionality.feq_on_domain))
; Lemma: FStar.FunctionalExtensionality.idempotence_on_domain
;;; Fact-ids: Name FStar.FunctionalExtensionality.idempotence_on_domain; Namespace FStar.FunctionalExtensionality
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x2 @u1 @u0))
      (HasType @x4 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1)))
     ;; def=FStar.FunctionalExtensionality.fsti(84,12-84,58); use=FStar.FunctionalExtensionality.fsti(84,12-84,58)
     (=
      (FStar.FunctionalExtensionality.on_domain
       @u0
       @u1
       @x2
       @x3
       (FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x4))
      (FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x4)))
    :pattern
     ((FStar.FunctionalExtensionality.on_domain
       @u0
       @u1
       @x2
       @x3
       (FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x4)))
    :qid lemma_FStar.FunctionalExtensionality.idempotence_on_domain))
  :named lemma_FStar.FunctionalExtensionality.idempotence_on_domain))
; Lemma: FStar.Ghost.hide_reveal
;;; Fact-ids: Name FStar.Ghost.hide_reveal; Namespace FStar.Ghost
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Ghost.erased @u0 @x1)))
     ;; def=FStar.Ghost.fsti(58,21-58,43); use=FStar.Ghost.fsti(58,21-58,43)
     (= (FStar.Ghost.hide @u0 @x1 (FStar.Ghost.reveal @u0 @x1 @x2)) @x2))
    :pattern ((FStar.Ghost.reveal @u0 @x1 @x2))
    :qid lemma_FStar.Ghost.hide_reveal))
  :named lemma_FStar.Ghost.hide_reveal))
; Lemma: FStar.Ghost.reveal_hide
;;; Fact-ids: Name FStar.Ghost.reveal_hide; Namespace FStar.Ghost
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 @x1))
     ;; def=FStar.Ghost.fsti(60,51-60,73); use=FStar.Ghost.fsti(60,51-60,73)
     (= (FStar.Ghost.reveal @u0 @x1 (FStar.Ghost.hide @u0 @x1 @x2)) @x2))
    :pattern ((FStar.Ghost.hide @u0 @x1 @x2))
    :qid lemma_FStar.Ghost.reveal_hide))
  :named lemma_FStar.Ghost.reveal_hide))
; Lemma: PulseCore.IndirectionTheorySep.age_to_age_to
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.age_to_age_to; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 PulseCore.KnotInstantiation.premem)
      (HasType @x1 (FStar.Ghost.erased U_zero Prims.nat))
      (HasType @x2 (FStar.Ghost.erased U_zero Prims.nat))
      ;; def=PulseCore.IndirectionTheorySep.fst(49,20-49,26); use=PulseCore.IndirectionTheorySep.fst(49,20-49,26)
      (<=
       (BoxInt_proj_0 (FStar.Ghost.reveal U_zero Prims.nat @x2))
       (BoxInt_proj_0 (FStar.Ghost.reveal U_zero Prims.nat @x1))))
     ;; def=PulseCore.IndirectionTheorySep.fst(49,37-49,75); use=PulseCore.IndirectionTheorySep.fst(49,37-49,75)
     (=
      (PulseCore.KnotInstantiation.age_to_ (PulseCore.KnotInstantiation.age_to_ @x0 @x1) @x2)
      (PulseCore.KnotInstantiation.age_to_ @x0 @x2)))
    :pattern
     ((PulseCore.KnotInstantiation.age_to_ (PulseCore.KnotInstantiation.age_to_ @x0 @x1) @x2))
    :qid lemma_PulseCore.IndirectionTheorySep.age_to_age_to))
  :named lemma_PulseCore.IndirectionTheorySep.age_to_age_to))
; Lemma: PulseCore.KnotInstantiation.level_age_to_
;;; Fact-ids: Name PulseCore.KnotInstantiation.level_age_to_; Namespace PulseCore.KnotInstantiation
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 PulseCore.KnotInstantiation.premem)
      (HasType @x1 (FStar.Ghost.erased U_zero Prims.nat)))
     ;; def=PulseCore.KnotInstantiation.fsti(106,10-106,44); use=PulseCore.KnotInstantiation.fsti(106,10-106,44)
     (=
      (PulseCore.KnotInstantiation.level_ (PulseCore.KnotInstantiation.age_to_ @x0 @x1))
      (FStar.Ghost.reveal U_zero Prims.nat @x1)))
    :pattern ((PulseCore.KnotInstantiation.level_ (PulseCore.KnotInstantiation.age_to_ @x0 @x1)))
    :qid lemma_PulseCore.KnotInstantiation.level_age_to_))
  :named lemma_PulseCore.KnotInstantiation.level_age_to_))
; Typing for non-total arrows
;;; Fact-ids: Name PulseCore.Semantics.m; Namespace PulseCore.Semantics; Name PulseCore.Semantics.Ret; Namespace PulseCore.Semantics; Name PulseCore.Semantics.Act; Namespace PulseCore.Semantics; Name PulseCore.Semantics.Par; Namespace PulseCore.Semantics
(assert
 (! ;; def=PulseCore.Semantics.fst(136,7-138,40); use=PulseCore.Semantics.fst(138,11-138,40)
  (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe))
   (! ;; def=PulseCore.Semantics.fst(136,7-138,40); use=PulseCore.Semantics.fst(138,11-138,40)
    (forall ((@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
     (! (implies
       (and
        (HasType @x3 (Tm_type @u0))
        (HasType @x4 (PulseCore.Semantics.state @u1))
        (HasType @x5 (Tm_type @u2))
        (HasType @x6 (PulseCore.Semantics.action @u1 @u0 @x4 @x3))
        (HasType @x7 (PulseCore.Semantics.post @u1 @u2 @x4 @x5)))
       (HasType
        (Non_total_Tm_arrow_05711733c0e43976df18159280e0d41a @x3 @x4 @x5 @x6 @x7)
        (Tm_type U_unknown)))
      :pattern
       ((HasType
         (Non_total_Tm_arrow_05711733c0e43976df18159280e0d41a @x3 @x4 @x5 @x6 @x7)
         (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_05711733c0e43976df18159280e0d41a.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_05711733c0e43976df18159280e0d41a))
  :named non_total_function_typing_Non_total_Tm_arrow_05711733c0e43976df18159280e0d41a))
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
;;; Fact-ids: Name PulseCore.Semantics.__proj__Act__item__k; Namespace PulseCore.Semantics
(assert
 (! ;; def=PulseCore.Semantics.fst(133,4-138,40); use=PulseCore.Semantics.fst(133,4-138,40)
  (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe))
   (! ;; def=PulseCore.Semantics.fst(133,4-138,40); use=PulseCore.Semantics.fst(133,4-138,40)
    (forall ((@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
     (! (implies
       (and
        (HasType @x3 (PulseCore.Semantics.state @u0))
        (HasType @x4 (Tm_type @u1))
        (HasType @x5 (PulseCore.Semantics.__proj__Mkstate__item__pred @u0 @x3))
        (HasType @x6 (PulseCore.Semantics.post @u0 @u1 @x3 @x4))
        (HasType @x7 (Tm_refine_0d9045a140507851cf3260e4f727453c @u0 @u1 @u2 @x3 @x4 @x5 @x6)))
       (HasType
        (Non_total_Tm_arrow_35307e3181c6aec9900a4df266436813 @x3 @x4 @x5 @x6 @x7)
        (Tm_type U_unknown)))
      :pattern
       ((HasType
         (Non_total_Tm_arrow_35307e3181c6aec9900a4df266436813 @x3 @x4 @x5 @x6 @x7)
         (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_35307e3181c6aec9900a4df266436813.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_35307e3181c6aec9900a4df266436813))
  :named non_total_function_typing_Non_total_Tm_arrow_35307e3181c6aec9900a4df266436813))
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
;;; Fact-ids: Name FStar.Tactics.V2.Derived.discard; Namespace FStar.Tactics.V2.Derived
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(513,19-513,33); use=FStar.Tactics.V2.Derived.fst(513,19-513,33)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Tactics.V2.Derived.fst(513,19-513,33); use=FStar.Tactics.V2.Derived.fst(513,19-513,33)
    (forall ((@x1 Term))
     (! (implies
       (HasType @x1 (Tm_type @u0))
       (HasType (Non_total_Tm_arrow_47cf0da1ce67e7de2468cec83b13ab8b @x1) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_47cf0da1ce67e7de2468cec83b13ab8b @x1) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_47cf0da1ce67e7de2468cec83b13ab8b.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_47cf0da1ce67e7de2468cec83b13ab8b))
  :named non_total_function_typing_Non_total_Tm_arrow_47cf0da1ce67e7de2468cec83b13ab8b))
; Typing for non-total arrows
;;; Fact-ids: Name FStar.Tactics.V2.Derived.op_Less_Bar_Greater; Namespace FStar.Tactics.V2.Derived
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(474,13-476,27); use=FStar.Tactics.V2.Derived.fst(474,25-477,8)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Tactics.V2.Derived.fst(474,13-476,27); use=FStar.Tactics.V2.Derived.fst(474,25-477,8)
    (forall ((@x1 Term))
     (! (implies
       (HasType @x1 (Tm_type @u0))
       (HasType (Non_total_Tm_arrow_57c96334de88d8a23b5eb456a1b8c5e4 @x1) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_57c96334de88d8a23b5eb456a1b8c5e4 @x1) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_57c96334de88d8a23b5eb456a1b8c5e4.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_57c96334de88d8a23b5eb456a1b8c5e4))
  :named non_total_function_typing_Non_total_Tm_arrow_57c96334de88d8a23b5eb456a1b8c5e4))
; Typing for non-total arrows
;;; Fact-ids: Name FStar.Tactics.MApply.termable; Namespace FStar.Tactics.MApply; Name FStar.Tactics.MApply.Mktermable; Namespace FStar.Tactics.MApply
(assert
 (! ;; def=FStar.Tactics.MApply.fsti(10,16-11,25); use=FStar.Tactics.MApply.fsti(11,12-11,25)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Tactics.MApply.fsti(10,16-11,25); use=FStar.Tactics.MApply.fsti(11,12-11,25)
    (forall ((@x1 Term))
     (! (implies
       (HasType @x1 (Tm_type @u0))
       (HasType (Non_total_Tm_arrow_62a2cf1b58e1e423697dd5147ebaf708 @x1) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_62a2cf1b58e1e423697dd5147ebaf708 @x1) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_62a2cf1b58e1e423697dd5147ebaf708.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_62a2cf1b58e1e423697dd5147ebaf708))
  :named non_total_function_typing_Non_total_Tm_arrow_62a2cf1b58e1e423697dd5147ebaf708))
; Typing for non-total arrows
;;; Fact-ids: Name PulseCore.PartialNondeterministicHoareStateMonad.bind; Namespace PulseCore.PartialNondeterministicHoareStateMonad
(assert
 (! ;; def=PulseCore.PartialNondeterministicHoareStateMonad.fsti(52,8-59,48); use=PulseCore.PartialNondeterministicHoareStateMonad.fsti(59,12-59,48)
  (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe))
   (! ;; def=PulseCore.PartialNondeterministicHoareStateMonad.fsti(52,8-59,48); use=PulseCore.PartialNondeterministicHoareStateMonad.fsti(59,12-59,48)
    (forall ((@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
     (! (implies
       (and
        (HasType @x3 (Tm_type @u0))
        (HasType @x4 (Tm_type @u1))
        (HasType @x5 (Tm_type @u2))
        (HasType @x6 (Tm_arrow_966e7a3cdea4a9083a74fff1fb478068 @x3 @u1 @x4 @u0))
        (HasType @x7 (Tm_arrow_188e938e0b17c6ab4b011bd2241afc94 @x3 @u1 @u2 @x4 @x5 @u0)))
       (HasType
        (Non_total_Tm_arrow_7aac0931ac08e504a9cdb249a2380aa6 @x3 @x4 @x5 @x6 @x7)
        (Tm_type U_unknown)))
      :pattern
       ((HasType
         (Non_total_Tm_arrow_7aac0931ac08e504a9cdb249a2380aa6 @x3 @x4 @x5 @x6 @x7)
         (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_7aac0931ac08e504a9cdb249a2380aa6.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_7aac0931ac08e504a9cdb249a2380aa6))
  :named non_total_function_typing_Non_total_Tm_arrow_7aac0931ac08e504a9cdb249a2380aa6))
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
;;; Fact-ids: Name Prims.op_GreaterThan; Namespace Prims
(assert
 (! ;; def=Prims.fst(538,4-538,18); use=Prims.fst(538,4-538,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_GreaterThan @x0 @x1) (BoxBool (> (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_GreaterThan @x0 @x1))
    :qid primitive_Prims.op_GreaterThan))
  :named primitive_Prims.op_GreaterThan))
;;; Fact-ids: Name Prims.op_Subtraction; Namespace Prims
(assert
 (! ;; def=Prims.fst(514,4-514,18); use=Prims.fst(514,4-514,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Subtraction @x0 @x1) (BoxInt (- (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Subtraction @x0 @x1))
    :qid primitive_Prims.op_Subtraction))
  :named primitive_Prims.op_Subtraction))
; refinement_interpretation
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.age1_; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(53,24-53,63); use=PulseCore.IndirectionTheorySep.fst(53,24-53,63)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_006f502666b42ae7b238ae3f195b8c19 @x2))
     (and
      (HasTypeFuel @u0 @x1 PulseCore.KnotInstantiation.premem)
      ;; def=PulseCore.IndirectionTheorySep.fst(53,36-53,61); use=PulseCore.IndirectionTheorySep.fst(53,36-53,61)
      (implies
       ;; def=PulseCore.IndirectionTheorySep.fst(53,36-53,49); use=PulseCore.IndirectionTheorySep.fst(53,36-53,49)
       (= (PulseCore.KnotInstantiation.level_ @x2) (BoxInt 0))
       ;; def=PulseCore.IndirectionTheorySep.fst(53,54-53,61); use=PulseCore.IndirectionTheorySep.fst(53,54-53,61)
       (= @x1 @x2))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_006f502666b42ae7b238ae3f195b8c19 @x2)))
    :qid refinement_interpretation_Tm_refine_006f502666b42ae7b238ae3f195b8c19))
  :named refinement_interpretation_Tm_refine_006f502666b42ae7b238ae3f195b8c19))
; refinement_interpretation
;;; Fact-ids: Name Prims.squash; Namespace Prims
(assert
 (! ;; def=Prims.fst(134,32-134,42); use=Prims.fst(134,32-134,42)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_2de20c066034c13bf76e9c0b94f4806c @x2))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(134,13-134,14); use=Prims.fst(134,40-134,41)
      (Valid
       ;; def=Prims.fst(134,13-134,14); use=Prims.fst(134,40-134,41)
       @x2)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_2de20c066034c13bf76e9c0b94f4806c @x2)))
    :qid refinement_interpretation_Tm_refine_2de20c066034c13bf76e9c0b94f4806c))
  :named refinement_interpretation_Tm_refine_2de20c066034c13bf76e9c0b94f4806c))
; refinement_interpretation
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! ;; def=Prims.fst(642,11-642,25); use=Prims.fst(642,11-642,25)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_542f9d4f129664613f2483a6c88bc7c2)
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      ;; def=Prims.fst(642,18-642,24); use=Prims.fst(642,18-642,24)
      (>= (BoxInt_proj_0 @x1) (BoxInt_proj_0 (BoxInt 0)))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
    :qid refinement_interpretation_Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
  :named refinement_interpretation_Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
; refinement_interpretation
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mk_slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(108,14-108,50); use=PulseCore.IndirectionTheorySep.fst(108,14-108,50)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4)
     (and
      (HasTypeFuel @u0 @x1 Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
      ;; def=PulseCore.IndirectionTheorySep.fst(108,35-108,47); use=PulseCore.IndirectionTheorySep.fst(108,35-108,47)
      (Valid
       ;; def=PulseCore.IndirectionTheorySep.fst(108,35-108,47); use=PulseCore.IndirectionTheorySep.fst(108,35-108,47)
       (PulseCore.IndirectionTheorySep.slprop_ok_ @x1))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4))
    :qid refinement_interpretation_Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4))
  :named refinement_interpretation_Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4))
; refinement_interpretation
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(107,13-107,39); use=PulseCore.IndirectionTheorySep.fst(107,13-107,39)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_7b079aec204a306b131c0098fd4913a1)
     (and
      (HasTypeFuel @u0 @x1 PulseCore.KnotInstantiation.mem_pred)
      ;; def=PulseCore.IndirectionTheorySep.fst(107,26-107,37); use=PulseCore.IndirectionTheorySep.fst(107,26-107,37)
      (Valid
       ;; def=PulseCore.IndirectionTheorySep.fst(107,26-107,37); use=PulseCore.IndirectionTheorySep.fst(107,26-107,37)
       (PulseCore.IndirectionTheorySep.slprop_ok @x1))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_7b079aec204a306b131c0098fd4913a1))
    :qid refinement_interpretation_Tm_refine_7b079aec204a306b131c0098fd4913a1))
  :named refinement_interpretation_Tm_refine_7b079aec204a306b131c0098fd4913a1))
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
; refinement_interpretation
;;; Fact-ids: Name FStar.FunctionalExtensionality.restricted_t; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(102,46-102,78); use=FStar.FunctionalExtensionality.fsti(102,46-102,78)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@u3 Universe) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_a94de11175d00fdbbdf07b37c09f231c @u2 @u3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x4 @x5 @u2 @u3))
      ;; def=FStar.FunctionalExtensionality.fsti(102,60-102,77); use=FStar.FunctionalExtensionality.fsti(102,60-102,77)
      (Valid
       ;; def=FStar.FunctionalExtensionality.fsti(102,60-102,77); use=FStar.FunctionalExtensionality.fsti(102,60-102,77)
       (FStar.FunctionalExtensionality.is_restricted @u2 @u3 @x4 @x5 @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_a94de11175d00fdbbdf07b37c09f231c @u2 @u3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_a94de11175d00fdbbdf07b37c09f231c))
  :named refinement_interpretation_Tm_refine_a94de11175d00fdbbdf07b37c09f231c))
; refinement_interpretation
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=Prims.fst(281,39-281,48)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 @u2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 @x4)
      ;; def=Prims.fst(281,26-281,29); use=Prims.fst(281,44-281,47)
      (Valid
       ;; def=Prims.fst(281,26-281,29); use=Prims.fst(281,44-281,47)
       @x3)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 @u2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81))
  :named refinement_interpretation_Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81))
; refinement_interpretation
;;; Fact-ids: Name PulseCore.KnotInstantiation.age_to_; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=PulseCore.KnotInstantiation.fsti(99,4-99,145); use=PulseCore.KnotInstantiation.fsti(99,4-99,145)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 PulseCore.KnotInstantiation.premem)
      ;; def=PulseCore.KnotInstantiation.fsti(99,15-99,39); use=PulseCore.KnotInstantiation.fsti(99,15-99,39)
      (= (PulseCore.KnotInstantiation.credits_ @x1) (PulseCore.KnotInstantiation.credits_ @x2))
      ;; def=PulseCore.KnotInstantiation.fsti(99,43-99,75); use=PulseCore.KnotInstantiation.fsti(99,43-99,75)
      (=
       (PulseCore.KnotInstantiation.current_loc_ @x1)
       (PulseCore.KnotInstantiation.current_loc_ @x2))
      ;; def=PulseCore.KnotInstantiation.fsti(99,79-99,119); use=PulseCore.KnotInstantiation.fsti(99,79-99,119)
      (=
       (PulseCore.KnotInstantiation.timeless_heap_of @x1)
       (PulseCore.KnotInstantiation.timeless_heap_of @x2))
      ;; def=PulseCore.KnotInstantiation.fsti(99,123-99,143); use=PulseCore.KnotInstantiation.fsti(99,123-99,143)
      (= (PulseCore.KnotInstantiation.level_ @x1) (FStar.Ghost.reveal U_zero Prims.nat @x3))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f))
  :named refinement_interpretation_Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f))
; refinement kinding
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.age1_; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(53,24-53,63); use=PulseCore.IndirectionTheorySep.fst(53,24-53,63)
  (forall ((@x0 Term))
   (! (HasType
     (Tm_refine_006f502666b42ae7b238ae3f195b8c19 @x0)
     (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
    :pattern
     ((HasType
       (Tm_refine_006f502666b42ae7b238ae3f195b8c19 @x0)
       (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero)))))))
    :qid refinement_kinding_Tm_refine_006f502666b42ae7b238ae3f195b8c19))
  :named refinement_kinding_Tm_refine_006f502666b42ae7b238ae3f195b8c19))
; refinement kinding
;;; Fact-ids: Name Prims.squash; Namespace Prims
(assert
 (! ;; def=Prims.fst(134,32-134,42); use=Prims.fst(134,32-134,42)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_2de20c066034c13bf76e9c0b94f4806c @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_2de20c066034c13bf76e9c0b94f4806c @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_2de20c066034c13bf76e9c0b94f4806c))
  :named refinement_kinding_Tm_refine_2de20c066034c13bf76e9c0b94f4806c))
; refinement kinding
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Tm_refine_542f9d4f129664613f2483a6c88bc7c2 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
; refinement kinding
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mk_slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (HasType
   Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named refinement_kinding_Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4))
; refinement kinding
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (HasType
   Tm_refine_7b079aec204a306b131c0098fd4913a1
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named refinement_kinding_Tm_refine_7b079aec204a306b131c0098fd4913a1))
; refinement kinding
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Tm_refine_9d6af3f3535473623f7aec2f0501897f (Tm_type (U_succ U_zero)))
  :named refinement_kinding_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; refinement kinding
;;; Fact-ids: Name FStar.FunctionalExtensionality.restricted_t; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(102,46-102,78); use=FStar.FunctionalExtensionality.fsti(102,46-102,78)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (HasType
     (Tm_refine_a94de11175d00fdbbdf07b37c09f231c @u0 @u1 @x2 @x3)
     (Tm_type (U_max @u1 @u0)))
    :pattern
     ((HasType
       (Tm_refine_a94de11175d00fdbbdf07b37c09f231c @u0 @u1 @x2 @x3)
       (Tm_type (U_max @u1 @u0))))
    :qid refinement_kinding_Tm_refine_a94de11175d00fdbbdf07b37c09f231c))
  :named refinement_kinding_Tm_refine_a94de11175d00fdbbdf07b37c09f231c))
; refinement kinding
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=Prims.fst(281,39-281,48)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 @u0 @x1 @x2) (Tm_type @u0))
    :pattern ((HasType (Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 @u0 @x1 @x2) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81))
  :named refinement_kinding_Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81))
; refinement kinding
;;; Fact-ids: Name PulseCore.KnotInstantiation.age_to_; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=PulseCore.KnotInstantiation.fsti(99,4-99,145); use=PulseCore.KnotInstantiation.fsti(99,4-99,145)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType
     (Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f @x0 @x1)
     (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
    :pattern
     ((HasType
       (Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f @x0 @x1)
       (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero)))))))
    :qid refinement_kinding_Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f))
  :named refinement_kinding_Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f))
; Name-token correspondence
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(560,4-560,9); use=PulseCore.IndirectionTheorySep.fst(560,4-560,9)
  (forall ((@x0 Term))
   (! (=
     (ApplyTT PulseCore.IndirectionTheorySep.later@tok @x0)
     (PulseCore.IndirectionTheorySep.later @x0))
    :pattern ((ApplyTT PulseCore.IndirectionTheorySep.later@tok @x0))
    :qid token_correspondence_PulseCore.IndirectionTheorySep.later))
  :named token_correspondence_PulseCore.IndirectionTheorySep.later))
; Name-token correspondence
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later_pred; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(558,4-558,14); use=PulseCore.IndirectionTheorySep.fst(558,4-558,14)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (ApplyTT (ApplyTT PulseCore.IndirectionTheorySep.later_pred@tok @x0) @x1)
     (PulseCore.IndirectionTheorySep.later_pred @x0 @x1))
    :pattern ((ApplyTT (ApplyTT PulseCore.IndirectionTheorySep.later_pred@tok @x0) @x1))
    :qid token_correspondence_PulseCore.IndirectionTheorySep.later_pred))
  :named token_correspondence_PulseCore.IndirectionTheorySep.later_pred))
; Name-token correspondence
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_le; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(40,24-40,30); use=PulseCore.IndirectionTheorySep.fst(40,24-40,30)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (ApplyTT (ApplyTT PulseCore.IndirectionTheorySep.mem_le@tok @x0) @x1)
     (PulseCore.IndirectionTheorySep.mem_le @x0 @x1))
    :pattern ((ApplyTT (ApplyTT PulseCore.IndirectionTheorySep.mem_le@tok @x0) @x1))
    :qid token_correspondence_PulseCore.IndirectionTheorySep.mem_le))
  :named token_correspondence_PulseCore.IndirectionTheorySep.mem_le))
; Name-token correspondence
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(415,5-415,12); use=PulseCore.IndirectionTheorySep.fst(415,5-415,12)
  (forall ((@u0 Universe))
   (! ;; def=PulseCore.IndirectionTheorySep.fst(415,5-415,12); use=PulseCore.IndirectionTheorySep.fst(415,5-415,12)
    (forall ((@x1 Term) (@x2 Term))
     (! (=
       (ApplyTT (ApplyTT (PulseCore.IndirectionTheorySep.op_exists_Star@tok @u0) @x1) @x2)
       (PulseCore.IndirectionTheorySep.op_exists_Star @u0 @x1 @x2))
      :pattern ((ApplyTT (ApplyTT (PulseCore.IndirectionTheorySep.op_exists_Star@tok @u0) @x1) @x2))
      :pattern ((PulseCore.IndirectionTheorySep.op_exists_Star @u0 @x1 @x2))
      :qid token_correspondence_PulseCore.IndirectionTheorySep.op_exists_Star.1))
    :pattern ((PulseCore.IndirectionTheorySep.op_exists_Star@tok @u0))
    :qid token_correspondence_PulseCore.IndirectionTheorySep.op_exists_Star))
  :named token_correspondence_PulseCore.IndirectionTheorySep.op_exists_Star))
; True interpretation
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert (! (Valid Prims.l_True) :named true_interp))
; free var typing
;;; Fact-ids: Name FStar.FunctionalExtensionality.feq; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(48,4-48,7); use=FStar.FunctionalExtensionality.fsti(48,4-48,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x2 @u1 @u0))
      (HasType @x4 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1))
      (HasType @x5 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1)))
     (HasType (FStar.FunctionalExtensionality.feq @u0 @u1 @x2 @x3 @x4 @x5) Prims.prop))
    :pattern ((FStar.FunctionalExtensionality.feq @u0 @u1 @x2 @x3 @x4 @x5))
    :qid typing_FStar.FunctionalExtensionality.feq))
  :named typing_FStar.FunctionalExtensionality.feq))
; free var typing
;;; Fact-ids: Name FStar.FunctionalExtensionality.is_restricted; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(94,4-94,17); use=FStar.FunctionalExtensionality.fsti(94,4-94,17)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x2 @u1 @u0))
      (HasType @x4 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1)))
     (HasType (FStar.FunctionalExtensionality.is_restricted @u0 @u1 @x2 @x3 @x4) Prims.prop))
    :pattern ((FStar.FunctionalExtensionality.is_restricted @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.FunctionalExtensionality.is_restricted))
  :named typing_FStar.FunctionalExtensionality.is_restricted))
; free var typing
;;; Fact-ids: Name FStar.FunctionalExtensionality.on_domain; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(74,4-74,13); use=FStar.FunctionalExtensionality.fsti(74,4-74,13)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x2 @u1 @u0))
      (HasType @x4 (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1)))
     (HasType
      (FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x4)
      (Tm_arrow_505f8adb466dc430d209c7de298af914 @x2 @x3 @u0 @u1)))
    :pattern ((FStar.FunctionalExtensionality.on_domain @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.FunctionalExtensionality.on_domain))
  :named typing_FStar.FunctionalExtensionality.on_domain))
; free var typing
;;; Fact-ids: Name FStar.FunctionalExtensionality.restricted_t; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(102,4-102,16); use=FStar.FunctionalExtensionality.fsti(102,4-102,16)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_arrow_5b1c7f3f701f4c9bd877a4f9b4ec1dfa @x2 @u1 @u0)))
     (HasType
      (FStar.FunctionalExtensionality.restricted_t @u0 @u1 @x2 @x3)
      (Tm_type (U_max @u1 @u0))))
    :pattern ((FStar.FunctionalExtensionality.restricted_t @u0 @u1 @x2 @x3))
    :qid typing_FStar.FunctionalExtensionality.restricted_t))
  :named typing_FStar.FunctionalExtensionality.restricted_t))
; free var typing
;;; Fact-ids: Name FStar.Ghost.erased; Namespace FStar.Ghost
(assert
 (! ;; def=FStar.Ghost.fsti(49,4-49,10); use=FStar.Ghost.fsti(49,4-49,10)
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies (HasType @x1 (Tm_type @u0)) (HasType (FStar.Ghost.erased @u0 @x1) (Tm_type @u0)))
    :pattern ((FStar.Ghost.erased @u0 @x1))
    :qid typing_FStar.Ghost.erased))
  :named typing_FStar.Ghost.erased))
; free var typing
;;; Fact-ids: Name FStar.Ghost.hide; Namespace FStar.Ghost
(assert
 (! ;; def=FStar.Ghost.fsti(55,4-55,8); use=FStar.Ghost.fsti(55,4-55,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 @x1))
     (HasType (FStar.Ghost.hide @u0 @x1 @x2) (FStar.Ghost.erased @u0 @x1)))
    :pattern ((FStar.Ghost.hide @u0 @x1 @x2))
    :qid typing_FStar.Ghost.hide))
  :named typing_FStar.Ghost.hide))
; free var typing
;;; Fact-ids: Name FStar.Ghost.reveal; Namespace FStar.Ghost
(assert
 (! ;; def=FStar.Ghost.fsti(53,4-53,10); use=FStar.Ghost.fsti(53,4-53,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Ghost.erased @u0 @x1)))
     (HasType (FStar.Ghost.reveal @u0 @x1 @x2) @x1))
    :pattern ((FStar.Ghost.reveal @u0 @x1 @x2))
    :qid typing_FStar.Ghost.reveal))
  :named typing_FStar.Ghost.reveal))
; free var typing
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (HasType Prims.bool Prims.eqtype) :named typing_Prims.bool))
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
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (HasType Prims.int Prims.eqtype) :named typing_Prims.int))
; free var typing
;;; Fact-ids: Name Prims.l_Exists; Namespace Prims
(assert
 (! ;; def=Prims.fst(477,11-477,19); use=Prims.fst(477,11-477,19)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x1 @u0)))
     (HasType (Prims.l_Exists @u0 @x1 @x2) Prims.prop))
    :pattern ((Prims.l_Exists @u0 @x1 @x2))
    :qid typing_Prims.l_Exists))
  :named typing_Prims.l_Exists))
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
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Prims.nat (Tm_type U_zero)) :named typing_Prims.nat))
; free var typing
;;; Fact-ids: Name Prims.op_GreaterThan; Namespace Prims
(assert
 (! ;; def=Prims.fst(538,4-538,18); use=Prims.fst(538,4-538,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_GreaterThan @x0 @x1) Prims.bool))
    :pattern ((Prims.op_GreaterThan @x0 @x1))
    :qid typing_Prims.op_GreaterThan))
  :named typing_Prims.op_GreaterThan))
; free var typing
;;; Fact-ids: Name Prims.op_Subtraction; Namespace Prims
(assert
 (! ;; def=Prims.fst(514,4-514,18); use=Prims.fst(514,4-514,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_Subtraction @x0 @x1) Prims.int))
    :pattern ((Prims.op_Subtraction @x0 @x1))
    :qid typing_Prims.op_Subtraction))
  :named typing_Prims.op_Subtraction))
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
; free var typing
;;; Fact-ids: Name Pulse.Lib.Loc.loc_id; Namespace Pulse.Lib.Loc
(assert
 (! (HasType Pulse.Lib.Loc.loc_id (Tm_type U_zero)) :named typing_Pulse.Lib.Loc.loc_id))
; free var typing
;;; Fact-ids: Name PulseCore.BaseHeapSig.mem; Namespace PulseCore.BaseHeapSig
(assert
 (! ;; def=PulseCore.BaseHeapSig.fsti(9,5-9,8); use=PulseCore.BaseHeapSig.fsti(9,5-9,8)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.BaseHeapSig.mem @u0) (Tm_type (U_succ @u0)))
    :pattern ((PulseCore.BaseHeapSig.mem @u0))
    :qid typing_PulseCore.BaseHeapSig.mem))
  :named typing_PulseCore.BaseHeapSig.mem))
; free var typing
;;; Fact-ids: Name PulseCore.Heap2.heap; Namespace PulseCore.Heap2
(assert
 (! ;; def=PulseCore.Heap2.fsti(42,4-42,8); use=PulseCore.Heap2.fsti(42,4-42,8)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.Heap2.heap @u0) (Tm_type (U_succ @u0)))
    :pattern ((PulseCore.Heap2.heap @u0))
    :qid typing_PulseCore.Heap2.heap))
  :named typing_PulseCore.Heap2.heap))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.age1_; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(53,4-53,9); use=PulseCore.IndirectionTheorySep.fst(53,4-53,9)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 PulseCore.KnotInstantiation.premem)
     (HasType
      (PulseCore.IndirectionTheorySep.age1_ @x0)
      (Tm_refine_006f502666b42ae7b238ae3f195b8c19 @x0)))
    :pattern ((PulseCore.IndirectionTheorySep.age1_ @x0))
    :qid typing_PulseCore.IndirectionTheorySep.age1_))
  :named typing_PulseCore.IndirectionTheorySep.age1_))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.hereditary; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(57,4-57,14); use=PulseCore.IndirectionTheorySep.fst(57,4-57,14)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
     (HasType (PulseCore.IndirectionTheorySep.hereditary @x0) Prims.prop))
    :pattern ((PulseCore.IndirectionTheorySep.hereditary @x0))
    :qid typing_PulseCore.IndirectionTheorySep.hereditary))
  :named typing_PulseCore.IndirectionTheorySep.hereditary))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.implies; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(587,4-587,11); use=PulseCore.IndirectionTheorySep.fst(587,4-587,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 PulseCore.IndirectionTheorySep.slprop)
      (HasType @x1 PulseCore.IndirectionTheorySep.slprop))
     (HasType (PulseCore.IndirectionTheorySep.implies @x0 @x1) Prims.prop))
    :pattern ((PulseCore.IndirectionTheorySep.implies @x0 @x1))
    :qid typing_PulseCore.IndirectionTheorySep.implies))
  :named typing_PulseCore.IndirectionTheorySep.implies))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(560,4-560,9); use=PulseCore.IndirectionTheorySep.fst(560,4-560,9)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 PulseCore.IndirectionTheorySep.slprop)
     (HasType (PulseCore.IndirectionTheorySep.later @x0) PulseCore.IndirectionTheorySep.slprop))
    :pattern ((PulseCore.IndirectionTheorySep.later @x0))
    :qid typing_PulseCore.IndirectionTheorySep.later))
  :named typing_PulseCore.IndirectionTheorySep.later))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later_pred; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(558,4-558,14); use=PulseCore.IndirectionTheorySep.fst(558,4-558,14)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 PulseCore.IndirectionTheorySep.slprop)
      (HasType @x1 PulseCore.KnotInstantiation.premem))
     (HasType (PulseCore.IndirectionTheorySep.later_pred @x0 @x1) Prims.prop))
    :pattern ((PulseCore.IndirectionTheorySep.later_pred @x0 @x1))
    :qid typing_PulseCore.IndirectionTheorySep.later_pred))
  :named typing_PulseCore.IndirectionTheorySep.later_pred))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.max; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(46,4-46,7); use=PulseCore.IndirectionTheorySep.fst(46,4-46,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (PulseCore.IndirectionTheorySep.max @x0 @x1) Prims.int))
    :pattern ((PulseCore.IndirectionTheorySep.max @x0 @x1))
    :qid typing_PulseCore.IndirectionTheorySep.max))
  :named typing_PulseCore.IndirectionTheorySep.max))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_le; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(40,24-40,30); use=PulseCore.IndirectionTheorySep.fst(40,24-40,30)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 PulseCore.KnotInstantiation.premem)
      (HasType @x1 PulseCore.KnotInstantiation.premem))
     (HasType (PulseCore.IndirectionTheorySep.mem_le @x0 @x1) Prims.prop))
    :pattern ((PulseCore.IndirectionTheorySep.mem_le @x0 @x1))
    :qid typing_PulseCore.IndirectionTheorySep.mem_le))
  :named typing_PulseCore.IndirectionTheorySep.mem_le))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(43,4-43,19); use=PulseCore.IndirectionTheorySep.fst(43,4-43,19)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
     (HasType (PulseCore.IndirectionTheorySep.mem_pred_affine @x0) Prims.prop))
    :pattern ((PulseCore.IndirectionTheorySep.mem_pred_affine @x0))
    :qid typing_PulseCore.IndirectionTheorySep.mem_pred_affine))
  :named typing_PulseCore.IndirectionTheorySep.mem_pred_affine))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mk_slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(108,4-108,13); use=PulseCore.IndirectionTheorySep.fst(108,4-108,13)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Tm_refine_6d6d23c2b65f3e0e09fac71f27fc91f4)
     (HasType (PulseCore.IndirectionTheorySep.mk_slprop @x0) PulseCore.IndirectionTheorySep.slprop))
    :pattern ((PulseCore.IndirectionTheorySep.mk_slprop @x0))
    :qid typing_PulseCore.IndirectionTheorySep.mk_slprop))
  :named typing_PulseCore.IndirectionTheorySep.mk_slprop))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(415,5-415,12); use=PulseCore.IndirectionTheorySep.fst(415,5-415,12)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (Tm_arrow_ec3e994bdc546940e36859549984c665 @x1 @u0)))
     (HasType
      (PulseCore.IndirectionTheorySep.op_exists_Star @u0 @x1 @x2)
      PulseCore.IndirectionTheorySep.slprop))
    :pattern ((PulseCore.IndirectionTheorySep.op_exists_Star @u0 @x1 @x2))
    :qid typing_PulseCore.IndirectionTheorySep.op_exists_Star))
  :named typing_PulseCore.IndirectionTheorySep.op_exists_Star))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop; Namespace PulseCore.IndirectionTheorySep
(assert
 (! (HasType
   PulseCore.IndirectionTheorySep.slprop
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named typing_PulseCore.IndirectionTheorySep.slprop))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop_ok; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(61,24-61,33); use=PulseCore.IndirectionTheorySep.fst(61,24-61,33)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 PulseCore.KnotInstantiation.mem_pred)
     (HasType (PulseCore.IndirectionTheorySep.slprop_ok @x0) Prims.prop))
    :pattern ((PulseCore.IndirectionTheorySep.slprop_ok @x0))
    :qid typing_PulseCore.IndirectionTheorySep.slprop_ok))
  :named typing_PulseCore.IndirectionTheorySep.slprop_ok))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.slprop_ok'; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(60,4-60,14); use=PulseCore.IndirectionTheorySep.fst(60,4-60,14)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
     (HasType (PulseCore.IndirectionTheorySep.slprop_ok_ @x0) Prims.prop))
    :pattern ((PulseCore.IndirectionTheorySep.slprop_ok_ @x0))
    :qid typing_PulseCore.IndirectionTheorySep.slprop_ok_))
  :named typing_PulseCore.IndirectionTheorySep.slprop_ok_))
; free var typing
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.timeless; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fsti(203,4-203,12); use=PulseCore.IndirectionTheorySep.fsti(203,4-203,12)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 PulseCore.IndirectionTheorySep.slprop)
     (HasType (PulseCore.IndirectionTheorySep.timeless @x0) Prims.prop))
    :pattern ((PulseCore.IndirectionTheorySep.timeless @x0))
    :qid typing_PulseCore.IndirectionTheorySep.timeless))
  :named typing_PulseCore.IndirectionTheorySep.timeless))
; free var typing
;;; Fact-ids: Name PulseCore.KnotInstantiation.age_to_; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=PulseCore.KnotInstantiation.fsti(98,4-98,11); use=PulseCore.KnotInstantiation.fsti(98,4-98,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 PulseCore.KnotInstantiation.premem)
      (HasType @x1 (FStar.Ghost.erased U_zero Prims.nat)))
     (HasType
      (PulseCore.KnotInstantiation.age_to_ @x0 @x1)
      (Tm_refine_ebd2ddbc11eaf26155605ca04ae4611f @x0 @x1)))
    :pattern ((PulseCore.KnotInstantiation.age_to_ @x0 @x1))
    :qid typing_PulseCore.KnotInstantiation.age_to_))
  :named typing_PulseCore.KnotInstantiation.age_to_))
; free var typing
;;; Fact-ids: Name PulseCore.KnotInstantiation.credits_; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=PulseCore.KnotInstantiation.fsti(55,4-55,12); use=PulseCore.KnotInstantiation.fsti(55,4-55,12)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 PulseCore.KnotInstantiation.premem)
     (HasType (PulseCore.KnotInstantiation.credits_ @x0) Prims.nat))
    :pattern ((PulseCore.KnotInstantiation.credits_ @x0))
    :qid typing_PulseCore.KnotInstantiation.credits_))
  :named typing_PulseCore.KnotInstantiation.credits_))
; free var typing
;;; Fact-ids: Name PulseCore.KnotInstantiation.current_loc_; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=PulseCore.KnotInstantiation.fsti(56,4-56,16); use=PulseCore.KnotInstantiation.fsti(56,4-56,16)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 PulseCore.KnotInstantiation.premem)
     (HasType (PulseCore.KnotInstantiation.current_loc_ @x0) Pulse.Lib.Loc.loc_id))
    :pattern ((PulseCore.KnotInstantiation.current_loc_ @x0))
    :qid typing_PulseCore.KnotInstantiation.current_loc_))
  :named typing_PulseCore.KnotInstantiation.current_loc_))
; free var typing
;;; Fact-ids: Name PulseCore.KnotInstantiation.level_; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=PulseCore.KnotInstantiation.fsti(54,4-54,10); use=PulseCore.KnotInstantiation.fsti(54,4-54,10)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 PulseCore.KnotInstantiation.premem)
     (HasType (PulseCore.KnotInstantiation.level_ @x0) Prims.nat))
    :pattern ((PulseCore.KnotInstantiation.level_ @x0))
    :qid typing_PulseCore.KnotInstantiation.level_))
  :named typing_PulseCore.KnotInstantiation.level_))
; free var typing
;;; Fact-ids: Name PulseCore.KnotInstantiation.mem_pred; Namespace PulseCore.KnotInstantiation
(assert
 (! (HasType
   PulseCore.KnotInstantiation.mem_pred
   (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named typing_PulseCore.KnotInstantiation.mem_pred))
; free var typing
;;; Fact-ids: Name PulseCore.KnotInstantiation.premem; Namespace PulseCore.KnotInstantiation
(assert
 (! (HasType PulseCore.KnotInstantiation.premem (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named typing_PulseCore.KnotInstantiation.premem))
; free var typing
;;; Fact-ids: Name PulseCore.KnotInstantiation.timeless_heap_of; Namespace PulseCore.KnotInstantiation
(assert
 (! ;; def=PulseCore.KnotInstantiation.fsti(57,4-57,20); use=PulseCore.KnotInstantiation.fsti(57,4-57,20)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 PulseCore.KnotInstantiation.premem)
     (HasType (PulseCore.KnotInstantiation.timeless_heap_of @x0) (PulseCore.MemoryAlt.mem U_zero)))
    :pattern ((PulseCore.KnotInstantiation.timeless_heap_of @x0))
    :qid typing_PulseCore.KnotInstantiation.timeless_heap_of))
  :named typing_PulseCore.KnotInstantiation.timeless_heap_of))
; free var typing
;;; Fact-ids: Name PulseCore.MemoryAlt.mem; Namespace PulseCore.MemoryAlt
(assert
 (! ;; def=PulseCore.MemoryAlt.fsti(26,4-26,7); use=PulseCore.MemoryAlt.fsti(26,4-26,7)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.MemoryAlt.mem @u0) (Tm_type (U_succ (U_succ (U_succ (U_succ @u0))))))
    :pattern ((PulseCore.MemoryAlt.mem @u0))
    :qid typing_PulseCore.MemoryAlt.mem))
  :named typing_PulseCore.MemoryAlt.mem))
; typing_Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.op_exists_Star; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(418,4-418,23); use=PulseCore.IndirectionTheorySep.fst(418,4-418,23)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType
     (Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e @u0 @x1 @x2)
     Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
    :pattern ((Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e @u0 @x1 @x2))
    :qid typing_Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e))
  :named typing_Tm_abs_3d5c000d6a45802ab635f1b657cb4a0e))
; typing_Tm_abs_489879e33d44f3d4936acefa7efa4b56
;;; Fact-ids: Name PulseCore.KnotInstantiation.mem_pred; Namespace PulseCore.KnotInstantiation
(assert
 (! (HasType Tm_abs_489879e33d44f3d4936acefa7efa4b56 Tm_arrow_71d208da69e8cfea945dbf406ab689bd)
  :named typing_Tm_abs_489879e33d44f3d4936acefa7efa4b56))
; typing_Tm_abs_494f67d3d2785ac4e7adad79c0124d7d
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(44,11-44,39); use=PulseCore.IndirectionTheorySep.fst(44,11-44,39)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType
     (Tm_abs_494f67d3d2785ac4e7adad79c0124d7d @x0 @x1)
     Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
    :pattern ((Tm_abs_494f67d3d2785ac4e7adad79c0124d7d @x0 @x1))
    :qid typing_Tm_abs_494f67d3d2785ac4e7adad79c0124d7d))
  :named typing_Tm_abs_494f67d3d2785ac4e7adad79c0124d7d))
; typing_Tm_abs_5f339e803bb418ce6f0d13ad44b64b52
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.mem_pred_affine; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(44,11-44,39); use=PulseCore.IndirectionTheorySep.fst(44,11-44,39)
  (forall ((@x0 Term))
   (! (HasType
     (Tm_abs_5f339e803bb418ce6f0d13ad44b64b52 @x0)
     Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
    :pattern ((Tm_abs_5f339e803bb418ce6f0d13ad44b64b52 @x0))
    :qid typing_Tm_abs_5f339e803bb418ce6f0d13ad44b64b52))
  :named typing_Tm_abs_5f339e803bb418ce6f0d13ad44b64b52))
; typing_Tm_abs_7358bb1256b6e64970c6650590cbe31b
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.later_exists; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fsti(211,28-211,31); use=PulseCore.IndirectionTheorySep.fst(658,4-658,16)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (HasType
     (Tm_abs_7358bb1256b6e64970c6650590cbe31b @x0 @u1 @x2)
     (Tm_arrow_ec3e994bdc546940e36859549984c665 @x0 @u1))
    :pattern ((Tm_abs_7358bb1256b6e64970c6650590cbe31b @x0 @u1 @x2))
    :qid typing_Tm_abs_7358bb1256b6e64970c6650590cbe31b))
  :named typing_Tm_abs_7358bb1256b6e64970c6650590cbe31b))
; typing_Tm_abs_98df6468e5274e80202c23c067d93953
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.hereditary; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(58,2-58,31); use=PulseCore.IndirectionTheorySep.fst(58,2-58,31)
  (forall ((@x0 Term))
   (! (HasType
     (Tm_abs_98df6468e5274e80202c23c067d93953 @x0)
     Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
    :pattern ((Tm_abs_98df6468e5274e80202c23c067d93953 @x0))
    :qid typing_Tm_abs_98df6468e5274e80202c23c067d93953))
  :named typing_Tm_abs_98df6468e5274e80202c23c067d93953))
; typing_Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2
;;; Fact-ids: Name FStar.Pervasives.pure_bind_wp; Namespace FStar.Pervasives
(assert
 (! ;; def=Prims.fst(335,38-335,57); use=FStar.Pervasives.fsti(197,2-197,15)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (HasType
     (Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 @x0 @u1 @x2 @x3)
     (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1))
    :pattern ((Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2 @x0 @u1 @x2 @x3))
    :qid typing_Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2))
  :named typing_Tm_abs_a2073cecc2fa0580dd5eb4af3a9baed2))
; typing_Tm_abs_a75cec2915107c0935a4203c94bd84c7
;;; Fact-ids: Name FStar.FunctionalExtensionality.feq; Namespace FStar.FunctionalExtensionality
(assert
 (! ;; def=FStar.FunctionalExtensionality.fsti(48,56-48,100); use=FStar.FunctionalExtensionality.fsti(48,56-48,100)
  (forall ((@x0 Term) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (HasType
     (Tm_abs_a75cec2915107c0935a4203c94bd84c7 @x0 @u1 @u2 @x3 @x4 @x5)
     (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1))
    :pattern ((Tm_abs_a75cec2915107c0935a4203c94bd84c7 @x0 @u1 @u2 @x3 @x4 @x5))
    :qid typing_Tm_abs_a75cec2915107c0935a4203c94bd84c7))
  :named typing_Tm_abs_a75cec2915107c0935a4203c94bd84c7))
; typing_Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5
;;; Fact-ids: Name PulseCore.IndirectionTheorySep.implies; Namespace PulseCore.IndirectionTheorySep
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(588,2-588,52); use=PulseCore.IndirectionTheorySep.fst(588,2-588,52)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType
     (Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5 @x0 @x1)
     Tm_arrow_df3cb7230d47a871982f8bfcf0ec9d03)
    :pattern ((Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5 @x0 @x1))
    :qid typing_Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5))
  :named typing_Tm_abs_bf74b2ad8e4ef24067ef4175560ef5b5))
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
; Starting query at PulseCore.IndirectionTheorySep.fst(663,2-664,61)
; universe local constant
(declare-fun uu___63 () Universe)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)




(declare-fun Tm_refine_e10517becd0f2e125b84de54b430354a (Universe Term Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(592,36-592,74); use=PulseCore.IndirectionTheorySep.fst(663,2-663,16)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType
     (Tm_refine_e10517becd0f2e125b84de54b430354a @u0 @x1 @x2)
     (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
    :pattern
     ((HasType
       (Tm_refine_e10517becd0f2e125b84de54b430354a @u0 @x1 @x2)
       (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero)))))))
    :qid refinement_kinding_Tm_refine_e10517becd0f2e125b84de54b430354a))
  :named refinement_kinding_Tm_refine_e10517becd0f2e125b84de54b430354a))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(592,36-592,74); use=PulseCore.IndirectionTheorySep.fst(663,2-663,16)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_e10517becd0f2e125b84de54b430354a @u2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 PulseCore.KnotInstantiation.premem)
      ;; def=PulseCore.IndirectionTheorySep.fst(592,47-592,59); use=PulseCore.IndirectionTheorySep.fst(663,2-663,16)
      (> (BoxInt_proj_0 (PulseCore.KnotInstantiation.level_ @x1)) (BoxInt_proj_0 (BoxInt 0)))
      ;; def=PulseCore.IndirectionTheorySep.fst(592,63-592,72); use=PulseCore.IndirectionTheorySep.fst(663,2-663,16)
      (Valid
       ;; def=PulseCore.IndirectionTheorySep.fst(592,63-592,72); use=PulseCore.IndirectionTheorySep.fst(663,2-663,16)
       (ApplyTT
        (ApplyTT
         PulseCore.IndirectionTheorySep.later@tok
         (PulseCore.IndirectionTheorySep.op_exists_Star
          @u2
          @x3
          (Tm_abs_7358bb1256b6e64970c6650590cbe31b @x3 @u2 @x4)))
        @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_e10517becd0f2e125b84de54b430354a @u2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_e10517becd0f2e125b84de54b430354a))
  :named refinement_interpretation_Tm_refine_e10517becd0f2e125b84de54b430354a))
; haseq for Tm_refine_e10517becd0f2e125b84de54b430354a
;;; Fact-ids: 
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(592,36-592,74); use=PulseCore.IndirectionTheorySep.fst(663,2-663,16)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid
      (Prims.hasEq
       (U_succ (U_succ (U_succ (U_succ U_zero))))
       (Tm_refine_e10517becd0f2e125b84de54b430354a @u0 @x1 @x2)))
     (Valid
      (Prims.hasEq (U_succ (U_succ (U_succ (U_succ U_zero)))) PulseCore.KnotInstantiation.premem)))
    :pattern
     ((Valid
       (Prims.hasEq
        (U_succ (U_succ (U_succ (U_succ U_zero))))
        (Tm_refine_e10517becd0f2e125b84de54b430354a @u0 @x1 @x2))))
    :qid haseqTm_refine_e10517becd0f2e125b84de54b430354a))
  :named haseqTm_refine_e10517becd0f2e125b84de54b430354a))



; kick_partial_app
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (PulseCore.IndirectionTheorySep.op_exists_Star @u0 @x1 @x2)
     (ApplyTT (ApplyTT (PulseCore.IndirectionTheorySep.op_exists_Star@tok @u0) @x1) @x2))
    :pattern ((PulseCore.IndirectionTheorySep.op_exists_Star @u0 @x1 @x2))
    :qid @kick_partial_app_bb80d230ce1fbb9a11470998223474bb))
  :named @kick_partial_app_bb80d230ce1fbb9a11470998223474bb))








(declare-fun Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b (Universe Term Term) Term)
; kinding_Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b
;;; Fact-ids: 
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(592,36-592,90); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType
     (Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b @u0 @x1 @x2)
     (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
    :pattern
     ((HasType
       (Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b @u0 @x1 @x2)
       (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero)))))))
    :qid kinding_Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b))
  :named kinding_Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b))
; pretyping
;;; Fact-ids: 
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(592,36-592,90); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b @u2 @x3 @x4))
     (is-Tm_arrow (PreType @x1)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b @u2 @x3 @x4)))
    :qid PulseCore.IndirectionTheorySep_pre_typing_Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b))
  :named PulseCore.IndirectionTheorySep_pre_typing_Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b))
; interpretation_Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b
;;; Fact-ids: 
(assert
 (! ;; def=PulseCore.IndirectionTheorySep.fst(592,36-592,90); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b @u1 @x2 @x3))
     (and
      ;; def=PulseCore.IndirectionTheorySep.fst(592,36-592,90); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
      (forall ((@x4 Term))
       (! (implies
         (HasType @x4 (Tm_refine_e10517becd0f2e125b84de54b430354a @u1 @x2 @x3))
         (HasType
          (ApplyTT @x0 @x4)
          (Prims.squash
           (ApplyTT
            (ApplyTT
             (ApplyTT (PulseCore.IndirectionTheorySep.op_exists_Star@tok @u1) @x2)
             (Tm_abs_7358bb1256b6e64970c6650590cbe31b @x2 @u1 @x3))
            @x4))))
        :pattern ((ApplyTT @x0 @x4))
        :qid
         PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b @u1 @x2 @x3)))
    :qid PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b))
  :named PulseCore.IndirectionTheorySep_interpretation_Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b))






; Encoding query formula : forall (t: Type) (f: (_: t -> PulseCore.IndirectionTheorySep.slprop)).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (x: t). PulseCore.IndirectionTheorySep.timeless (f x)) /\
;     (forall (pure_result: Prims.unit).
;         PulseCore.IndirectionTheorySep.timeless (exists* (x: t). f x) ==> p pure_result) ==>
;     (forall (m:
;         PulseCore.KnotInstantiation.premem
;           { PulseCore.KnotInstantiation.level_ m > 0 /\
;             PulseCore.IndirectionTheorySep.later (exists* (x: t). f x) m }).
;         (* - Could not prove post-condition *)
;         ((exists (x: t). f x m) <==> (exists (x: t). PulseCore.IndirectionTheorySep.later (f x) m)) /\
;         (forall (pure_result: Prims.unit).
;             ((exists (x: t). f x m) <==>
;               (exists (x: t). PulseCore.IndirectionTheorySep.later (f x) m)) ==>
;             (exists . m))) /\
;     (forall (any_result:
;         (
;               m:
;                 PulseCore.KnotInstantiation.premem
;                   { PulseCore.KnotInstantiation.level_ m > 0 /\
;                     PulseCore.IndirectionTheorySep.later (exists* (x: t). f x) m }
;             -> Prims.squash (exists . m)))
;         (any_result: Prims.squash (PulseCore.IndirectionTheorySep.timeless (exists* (x: t). f x)))
;         (any_result: Prims.squash (PulseCore.IndirectionTheorySep.timeless (exists* (x: t). f x))).
;         p any_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let timeless_exists’
(push) ;; push{0
; <fuel='8' ifuel='2'>
;;; Fact-ids: 
(assert
 (! (= MaxFuel (SFuel (SFuel (SFuel (SFuel (SFuel (SFuel (SFuel (SFuel ZFuel)))))))))
  :named @MaxFuel_assumption))
;;; Fact-ids: 
(assert (! (= MaxIFuel (SFuel (SFuel ZFuel))) :named @MaxIFuel_assumption))
; query
;;; Fact-ids: 
(assert
 (! (not
   (forall ((@x0 Term) (@x1 Term))
    (! (implies
      (and
       (HasType @x0 (Tm_type uu___63))
       (HasType @x1 (Tm_arrow_ec3e994bdc546940e36859549984c665 @x0 uu___63)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.unit))
          ;; def=PulseCore.IndirectionTheorySep.fst(662,20-662,44); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
          (forall ((@x3 Term))
           (! (implies
             (HasType @x3 @x0)
             ;; def=PulseCore.IndirectionTheorySep.fst(662,30-662,44); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
             (Valid
              ;; def=PulseCore.IndirectionTheorySep.fst(662,30-662,44); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
              (PulseCore.IndirectionTheorySep.timeless (ApplyTT @x1 @x3))))
            :qid @query.2))
          ;; def=Prims.fst(409,36-409,97); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              ;; def=PulseCore.IndirectionTheorySep.fst(662,55-662,80); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
              (or
               label_2
               ;; def=PulseCore.IndirectionTheorySep.fst(662,55-662,80); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
               (Valid
                ;; def=PulseCore.IndirectionTheorySep.fst(662,55-662,80); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
                (PulseCore.IndirectionTheorySep.timeless
                 (PulseCore.IndirectionTheorySep.op_exists_Star
                  uu___63
                  @x0
                  (Tm_abs_7358bb1256b6e64970c6650590cbe31b @x0 uu___63 @x1))))))
             ;; def=Prims.fst(409,83-409,96); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
               (ApplyTT @x2 @x3)))
            :qid @query.3)))
         ;; def=Prims.fst(427,77-427,89); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
         (and
          ;; def=PulseCore.IndirectionTheorySep.fst(663,2-664,61); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
          (forall ((@x3 Term))
           (! (implies
             (HasType @x3 (Tm_refine_e10517becd0f2e125b84de54b430354a uu___63 @x0 @x1))
             ;; def=Prims.fst(409,29-409,97); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
             (and
              ;; def=PulseCore.IndirectionTheorySep.fst(664,11-664,61); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
              (or
               label_3
               ;; def=PulseCore.IndirectionTheorySep.fst(664,11-664,61); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
               (iff
                ;; def=PulseCore.IndirectionTheorySep.fst(664,11-664,30); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                (exists ((@x4 Term))
                 (! (and
                   (HasType @x4 @x0)
                   ;; def=PulseCore.IndirectionTheorySep.fst(664,22-664,29); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                   (Valid
                    ;; def=PulseCore.IndirectionTheorySep.fst(664,22-664,29); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                    (ApplyTT (ApplyTT @x1 @x4) @x3)))
                  :qid @query.5))
                ;; def=PulseCore.IndirectionTheorySep.fst(664,36-664,61); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                (exists ((@x4 Term))
                 (! (and
                   (HasType @x4 @x0)
                   ;; def=PulseCore.IndirectionTheorySep.fst(664,47-664,60); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                   (Valid
                    ;; def=PulseCore.IndirectionTheorySep.fst(664,47-664,60); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                    (ApplyTT
                     (ApplyTT PulseCore.IndirectionTheorySep.later@tok (ApplyTT @x1 @x4))
                     @x3)))
                  :qid @query.6))))
              ;; def=Prims.fst(409,36-409,97); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  (HasType @x4 Prims.unit)
                  ;; def=PulseCore.IndirectionTheorySep.fst(664,11-664,61); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                  (iff
                   ;; def=PulseCore.IndirectionTheorySep.fst(664,11-664,30); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                   (exists ((@x5 Term))
                    (! (and
                      (HasType @x5 @x0)
                      ;; def=PulseCore.IndirectionTheorySep.fst(664,22-664,29); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                      (Valid
                       ;; def=PulseCore.IndirectionTheorySep.fst(664,22-664,29); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                       (ApplyTT (ApplyTT @x1 @x5) @x3)))
                     :qid @query.8))
                   ;; def=PulseCore.IndirectionTheorySep.fst(664,36-664,61); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                   (exists ((@x5 Term))
                    (! (and
                      (HasType @x5 @x0)
                      ;; def=PulseCore.IndirectionTheorySep.fst(664,47-664,60); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                      (Valid
                       ;; def=PulseCore.IndirectionTheorySep.fst(664,47-664,60); use=PulseCore.IndirectionTheorySep.fst(664,4-664,10)
                       (ApplyTT
                        (ApplyTT PulseCore.IndirectionTheorySep.later@tok (ApplyTT @x1 @x5))
                        @x3)))
                     :qid @query.9))))
                 ;; def=PulseCore.IndirectionTheorySep.fst(592,85-592,90); use=PulseCore.IndirectionTheorySep.fst(664,4-664,61)
                 (or
                  label_4
                  ;; def=PulseCore.IndirectionTheorySep.fst(592,85-592,90); use=PulseCore.IndirectionTheorySep.fst(664,4-664,61)
                  (Valid
                   ;; def=PulseCore.IndirectionTheorySep.fst(592,85-592,90); use=PulseCore.IndirectionTheorySep.fst(664,4-664,61)
                   (ApplyTT
                    (ApplyTT
                     (ApplyTT (PulseCore.IndirectionTheorySep.op_exists_Star@tok uu___63) @x0)
                     (Tm_abs_7358bb1256b6e64970c6650590cbe31b @x0 uu___63 @x1))
                    @x3))))
                :qid @query.7))))
            :qid @query.4))
          ;; def=Prims.fst(419,66-419,102); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
          (forall ((@x3 Term))
           (! (implies
             (HasType @x3 (Tm_arrow_9b561d7fdaabe678c6dcde0c9bc6fc2b uu___63 @x0 @x1))
             ;; def=Prims.fst(419,66-419,102); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
             (forall ((@x4 Term))
              (! (implies
                (HasType
                 @x4
                 (Prims.squash
                  (PulseCore.IndirectionTheorySep.timeless
                   (PulseCore.IndirectionTheorySep.op_exists_Star
                    uu___63
                    @x0
                    (Tm_abs_7358bb1256b6e64970c6650590cbe31b @x0 uu___63 @x1)))))
                ;; def=Prims.fst(419,66-419,102); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
                (forall ((@x5 Term))
                 (! (implies
                   (HasType
                    @x5
                    (Prims.squash
                     (PulseCore.IndirectionTheorySep.timeless
                      (PulseCore.IndirectionTheorySep.op_exists_Star
                       uu___63
                       @x0
                       (Tm_abs_7358bb1256b6e64970c6650590cbe31b @x0 uu___63 @x1)))))
                   ;; def=Prims.fst(419,90-419,102); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
                   (Valid
                    ;; def=Prims.fst(419,90-419,102); use=PulseCore.IndirectionTheorySep.fst(663,2-664,61)
                    (ApplyTT @x2 @x5)))
                  :qid @query.12)))
               :qid @query.11)))
            :qid @query.10))))
        :qid @query.1)))
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
(echo "label_4")
(eval label_4)
(echo "label_3")
(eval label_3)
(echo "label_2")
(eval label_2)
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop
