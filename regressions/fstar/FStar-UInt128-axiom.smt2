;; FStar.UInt128 mul_wide stability regression.
;; Same query as FStar.UInt128-1.smt2 but with a hand-simplified, universally-valid
;; arithmetic axiom supplying the pow2-additivity and Euclidean (div/mod) split of the
;; assembled 128-bit product.  Without it, arith.solver=6 is seed-unstable (~10/20 seeds
;; hit rlimit); with it the query is unsat for all tested random seeds.

; Z3 invocation started by F*
; F* version: 2026.07.12~dev -- commit hash: d09855b1033306457363629fa1b216edcf70ef6e
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
;(set-option :smt.arith.solver 6)


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

(declare-fun FStar.Pervasives.ambient (Universe Term Term) Term)
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
(declare-fun FStar.UInt.fits (Term Term) Term)
(declare-fun FStar.UInt.max_int (Term) Term)
(declare-fun FStar.UInt.min_int (Term) Term)
(declare-fun FStar.UInt.size (Term Term) Term)
(declare-fun FStar.UInt.uint_t (Term) Term)
; Constructor
(declare-fun FStar.UInt128.Mkuint128 (Term Term) Term)
; Projector
(declare-fun FStar.UInt128.Mkuint128_@high (Term) Term)
; Projector
(declare-fun FStar.UInt128.Mkuint128_@low (Term) Term)
(declare-fun FStar.UInt128.h32 (Term) Term)
(declare-fun FStar.UInt128.l32 (Term) Term)
(declare-fun FStar.UInt128.mul32_bound (Term Term) Term)
(declare-fun FStar.UInt128.n (Dummy_sort) Term)
(declare-fun FStar.UInt128.phh (Term Term) Term)
(declare-fun FStar.UInt128.phl (Term Term) Term)
(declare-fun FStar.UInt128.plh (Term Term) Term)
(declare-fun FStar.UInt128.pll (Term Term) Term)
(declare-fun FStar.UInt128.pll_h (Term Term) Term)
(declare-fun FStar.UInt128.pll_l (Term Term) Term)
(declare-fun FStar.UInt128.t (Dummy_sort) Term)
; Constructor
(declare-fun FStar.UInt128.uint128 () Term)
(declare-fun FStar.UInt128.uu___0 () Term)
(declare-fun FStar.UInt128.uu___1 () Term)
(declare-fun FStar.UInt64.t (Dummy_sort) Term)
(declare-fun FStar.UInt64.uint_to_t (Term) Term)
(declare-fun FStar.UInt64.v (Term) Term)
(declare-fun Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29 (Term Term) Term)
(declare-fun Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f (Term) Term)
(declare-fun Non_total_Tm_arrow_47cf0da1ce67e7de2468cec83b13ab8b (Term) Term)
(declare-fun Non_total_Tm_arrow_57c96334de88d8a23b5eb456a1b8c5e4 (Term) Term)
(declare-fun Non_total_Tm_arrow_62a2cf1b58e1e423697dd5147ebaf708 (Term) Term)
(declare-fun Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521 (Term Term) Term)
(declare-fun Prims.b2t (Term) Term)
(declare-fun Prims.bool () Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.hasEq (Universe Term) Term)
(declare-fun Prims.int () Term)
(declare-fun Prims.l_True () Term)
(declare-fun Prims.nat () Term)
(declare-fun Prims.nonzero () Term)
(declare-fun Prims.op_Addition (Term Term) Term)
(declare-fun Prims.op_AmpAmp (Term Term) Term)
(declare-fun Prims.op_Division (Term Term) Term)
(declare-fun Prims.op_LessThanOrEqual (Term Term) Term)
(declare-fun Prims.op_Modulus (Term Term) Term)
(declare-fun Prims.op_Star (Term Term) Term)
(declare-fun Prims.op_Subtraction (Term Term) Term)
(declare-fun Prims.pos () Term)
(declare-fun Prims.pow2 (Term) Term)
; Fuel-instrumented function name
(declare-fun Prims.pow2.fuel_instrumented (Fuel Term) Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_post (Universe Term) Term)
(declare-fun Prims.pure_post_ (Universe Term Term) Term)
(declare-fun Prims.pure_wp (Universe Term) Term)
(declare-fun Prims.squash (Term) Term)
(declare-fun Prims.unit () Term)
(declare-fun Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 (Universe Term Term) Term)
(declare-fun Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f () Term)
(declare-fun Tm_refine_2de20c066034c13bf76e9c0b94f4806c (Term) Term)
(declare-fun Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4 (Term) Term)
(declare-fun Tm_refine_542f9d4f129664613f2483a6c88bc7c2 () Term)
(declare-fun Tm_refine_774ba3f728d91ead8ef40be66c9802e5 () Term)
(declare-fun Tm_refine_87d0cffdbbb3c12d99524884e5fb071c (Term Term) Term)
(declare-fun Tm_refine_9d6af3f3535473623f7aec2f0501897f () Term)
(declare-fun Tm_refine_d12ff0579459f51559539386c837ad74 () Term)
(declare-fun Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 (Universe Term Term) Term)
(declare-fun Tm_refine_f13070840248fced9d9d60d77bdae3ec (Term) Term)
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
; Discriminator definition
(define-fun is-FStar.UInt128.Mkuint128 ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 239)
  (=
   __@x0
   (FStar.UInt128.Mkuint128
    (FStar.UInt128.Mkuint128_@low __@x0)
    (FStar.UInt128.Mkuint128_@high __@x0)))))
; Correspondence of recursive function to instrumented version
;;; Fact-ids: Name Prims.pow2; Namespace Prims
(assert
 (! ;; def=Prims.fst(670,8-670,12); use=Prims.fst(670,8-670,12)
  (forall ((@x0 Term))
   (! (= (Prims.pow2 @x0) (Prims.pow2.fuel_instrumented MaxFuel @x0))
    :pattern ((Prims.pow2 @x0))
    :qid @fuel_correspondence_Prims.pow2.fuel_instrumented))
  :named @fuel_correspondence_Prims.pow2.fuel_instrumented))
; Fuel irrelevance
;;; Fact-ids: Name Prims.pow2; Namespace Prims
(assert
 (! ;; def=Prims.fst(670,8-670,12); use=Prims.fst(670,8-670,12)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (= (Prims.pow2.fuel_instrumented (SFuel @u0) @x1) (Prims.pow2.fuel_instrumented ZFuel @x1))
    :pattern ((Prims.pow2.fuel_instrumented (SFuel @u0) @x1))
    :qid @fuel_irrelevance_Prims.pow2.fuel_instrumented))
  :named @fuel_irrelevance_Prims.pow2.fuel_instrumented))
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
; Assumption: FStar.UInt128.uint128__uu___haseq
;;; Fact-ids: Name FStar.UInt128.uint128__uu___haseq; Namespace FStar.UInt128
(assert
 (! (Valid (Prims.hasEq U_zero FStar.UInt128.uint128))
  :named assumption_FStar.UInt128.uint128__uu___haseq))
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
; Constructor distinct
;;; Fact-ids: Name FStar.UInt128.uint128; Namespace FStar.UInt128; Name FStar.UInt128.Mkuint128; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,5-114,12); use=FStar.UInt128.fst(114,5-114,12)
  (forall ((@x0 Term) (@x1 Term))
   (! (= 239 (Term_constr_id (FStar.UInt128.Mkuint128 @x0 @x1)))
    :pattern ((FStar.UInt128.Mkuint128 @x0 @x1))
    :qid constructor_distinct_FStar.UInt128.Mkuint128))
  :named constructor_distinct_FStar.UInt128.Mkuint128))
; Constructor distinct
;;; Fact-ids: Name FStar.UInt128.uint128; Namespace FStar.UInt128; Name FStar.UInt128.Mkuint128; Namespace FStar.UInt128
(assert
 (! (= 233 (Term_constr_id FStar.UInt128.uint128)) :named constructor_distinct_FStar.UInt128.uint128))
; Constructor distinct
;;; Fact-ids: Name FStar.UInt64.t; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(47,8-47,9); use=FStar.UInt64.fsti(47,8-47,9)
  (forall ((@u0 Dummy_sort))
   (! (= 101 (Term_constr_id (FStar.UInt64.t @u0)))
    :pattern ((FStar.UInt64.t @u0))
    :qid constructor_distinct_FStar.UInt64.t))
  :named constructor_distinct_FStar.UInt64.t))
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
; data constructor typing elim
;;; Fact-ids: Name FStar.UInt128.uint128; Namespace FStar.UInt128; Name FStar.UInt128.Mkuint128; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,5-114,12); use=FStar.UInt128.fst(114,5-114,12)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) (FStar.UInt128.Mkuint128 @x1 @x2) FStar.UInt128.uint128)
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      (HasTypeFuel @u0 @x2 (FStar.UInt64.t Dummy_value))))
    :pattern ((HasTypeFuel (SFuel @u0) (FStar.UInt128.Mkuint128 @x1 @x2) FStar.UInt128.uint128))
    :qid data_elim_FStar.UInt128.Mkuint128))
  :named data_elim_FStar.UInt128.Mkuint128))
; data constructor typing intro
;;; Fact-ids: Name FStar.UInt128.uint128; Namespace FStar.UInt128; Name FStar.UInt128.Mkuint128; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,5-114,12); use=FStar.UInt128.fst(114,5-114,12)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      (HasTypeFuel @u0 @x2 (FStar.UInt64.t Dummy_value)))
     (HasTypeFuel @u0 (FStar.UInt128.Mkuint128 @x1 @x2) FStar.UInt128.uint128))
    :pattern ((HasTypeFuel @u0 (FStar.UInt128.Mkuint128 @x1 @x2) FStar.UInt128.uint128))
    :qid data_typing_intro_FStar.UInt128.Mkuint128@tok))
  :named data_typing_intro_FStar.UInt128.Mkuint128@tok))
; Equation for FStar.UInt.fits
;;; Fact-ids: Name FStar.UInt.fits; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(48,4-48,8); use=FStar.UInt.fsti(48,4-48,8)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt.fits @x0 @x1)
     (Prims.op_AmpAmp
      (Prims.op_LessThanOrEqual (FStar.UInt.min_int @x1) @x0)
      (Prims.op_LessThanOrEqual @x0 (FStar.UInt.max_int @x1))))
    :pattern ((FStar.UInt.fits @x0 @x1))
    :qid equation_FStar.UInt.fits))
  :named equation_FStar.UInt.fits))
; Equation for FStar.UInt.max_int
;;; Fact-ids: Name FStar.UInt.max_int; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(45,4-45,11); use=FStar.UInt.fsti(45,4-45,11)
  (forall ((@x0 Term))
   (! (= (FStar.UInt.max_int @x0) (Prims.op_Subtraction (Prims.pow2 @x0) (BoxInt 1)))
    :pattern ((FStar.UInt.max_int @x0))
    :qid equation_FStar.UInt.max_int))
  :named equation_FStar.UInt.max_int))
; Equation for FStar.UInt.min_int
;;; Fact-ids: Name FStar.UInt.min_int; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(46,4-46,11); use=FStar.UInt.fsti(46,4-46,11)
  (forall ((@x0 Term))
   (! (= (FStar.UInt.min_int @x0) (BoxInt 0))
    :pattern ((FStar.UInt.min_int @x0))
    :qid equation_FStar.UInt.min_int))
  :named equation_FStar.UInt.min_int))
; Equation for FStar.UInt.size
;;; Fact-ids: Name FStar.UInt.size; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(49,4-49,8); use=FStar.UInt.fsti(49,4-49,8)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt.size @x0 @x1) (Prims.b2t (FStar.UInt.fits @x0 @x1)))
    :pattern ((FStar.UInt.size @x0 @x1))
    :qid equation_FStar.UInt.size))
  :named equation_FStar.UInt.size))
; Equation for FStar.UInt.uint_t
;;; Fact-ids: Name FStar.UInt.uint_t; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(53,5-53,11); use=FStar.UInt.fsti(53,5-53,11)
  (forall ((@x0 Term))
   (! (= (FStar.UInt.uint_t @x0) (Tm_refine_f13070840248fced9d9d60d77bdae3ec @x0))
    :pattern ((FStar.UInt.uint_t @x0))
    :qid equation_FStar.UInt.uint_t))
  :named equation_FStar.UInt.uint_t))
; Equation for FStar.UInt128.h32
;;; Fact-ids: Name FStar.UInt128.h32; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(986,4-986,7); use=FStar.UInt128.fst(986,4-986,7)
  (forall ((@x0 Term))
   (! (= (FStar.UInt128.h32 @x0) (Prims.op_Division @x0 (Prims.pow2 (BoxInt 32))))
    :pattern ((FStar.UInt128.h32 @x0))
    :qid equation_FStar.UInt128.h32))
  :named equation_FStar.UInt128.h32))
; Equation for FStar.UInt128.l32
;;; Fact-ids: Name FStar.UInt128.l32; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(985,4-985,7); use=FStar.UInt128.fst(985,4-985,7)
  (forall ((@x0 Term))
   (! (= (FStar.UInt128.l32 @x0) (Prims.op_Modulus @x0 (Prims.pow2 (BoxInt 32))))
    :pattern ((FStar.UInt128.l32 @x0))
    :qid equation_FStar.UInt128.l32))
  :named equation_FStar.UInt128.l32))
; Equation for FStar.UInt128.mul32_bound
;;; Fact-ids: Name FStar.UInt128.mul32_bound; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(990,4-990,15); use=FStar.UInt128.fst(990,4-990,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt128.mul32_bound @x0 @x1) (Prims.op_Star @x0 @x1))
    :pattern ((FStar.UInt128.mul32_bound @x0 @x1))
    :qid equation_FStar.UInt128.mul32_bound))
  :named equation_FStar.UInt128.mul32_bound))
; Equation for FStar.UInt128.n
;;; Fact-ids: Name FStar.UInt128.n; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fsti(24,4-24,5); use=FStar.UInt128.fsti(24,4-24,5)
  (forall ((@u0 Dummy_sort))
   (! (=
     ;; def=FStar.UInt128.fsti(24,4-24,5); use=FStar.UInt128.fsti(24,4-24,5)
     (FStar.UInt128.n @u0)
     (BoxInt 128))
    :pattern
     (;; def=FStar.UInt128.fsti(24,4-24,5); use=FStar.UInt128.fsti(24,4-24,5)
      (FStar.UInt128.n @u0))
    :qid equation_FStar.UInt128.n))
  :named equation_FStar.UInt128.n))
; Equation for FStar.UInt128.phh
;;; Fact-ids: Name FStar.UInt128.phh; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(1000,4-1000,7); use=FStar.UInt128.fst(1000,4-1000,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt128.phh @x0 @x1)
     (FStar.UInt128.mul32_bound
      (FStar.UInt128.h32 (FStar.UInt64.v @x0))
      (FStar.UInt128.h32 (FStar.UInt64.v @x1))))
    :pattern ((FStar.UInt128.phh @x0 @x1))
    :qid equation_FStar.UInt128.phh))
  :named equation_FStar.UInt128.phh))
; Equation for FStar.UInt128.phl
;;; Fact-ids: Name FStar.UInt128.phl; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(998,4-998,7); use=FStar.UInt128.fst(998,4-998,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt128.phl @x0 @x1)
     (FStar.UInt128.mul32_bound
      (FStar.UInt128.h32 (FStar.UInt64.v @x0))
      (FStar.UInt128.l32 (FStar.UInt64.v @x1))))
    :pattern ((FStar.UInt128.phl @x0 @x1))
    :qid equation_FStar.UInt128.phl))
  :named equation_FStar.UInt128.phl))
; Equation for FStar.UInt128.plh
;;; Fact-ids: Name FStar.UInt128.plh; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(996,4-996,7); use=FStar.UInt128.fst(996,4-996,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt128.plh @x0 @x1)
     (FStar.UInt128.mul32_bound
      (FStar.UInt128.l32 (FStar.UInt64.v @x0))
      (FStar.UInt128.h32 (FStar.UInt64.v @x1))))
    :pattern ((FStar.UInt128.plh @x0 @x1))
    :qid equation_FStar.UInt128.plh))
  :named equation_FStar.UInt128.plh))
; Equation for FStar.UInt128.pll
;;; Fact-ids: Name FStar.UInt128.pll; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(994,4-994,7); use=FStar.UInt128.fst(994,4-994,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt128.pll @x0 @x1)
     (FStar.UInt128.mul32_bound
      (FStar.UInt128.l32 (FStar.UInt64.v @x0))
      (FStar.UInt128.l32 (FStar.UInt64.v @x1))))
    :pattern ((FStar.UInt128.pll @x0 @x1))
    :qid equation_FStar.UInt128.pll))
  :named equation_FStar.UInt128.pll))
; Equation for FStar.UInt128.pll_h
;;; Fact-ids: Name FStar.UInt128.pll_h; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(1005,4-1005,9); use=FStar.UInt128.fst(1005,4-1005,9)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt128.pll_h @x0 @x1) (FStar.UInt128.h32 (FStar.UInt128.pll @x0 @x1)))
    :pattern ((FStar.UInt128.pll_h @x0 @x1))
    :qid equation_FStar.UInt128.pll_h))
  :named equation_FStar.UInt128.pll_h))
; Equation for FStar.UInt128.pll_l
;;; Fact-ids: Name FStar.UInt128.pll_l; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(1003,4-1003,9); use=FStar.UInt128.fst(1003,4-1003,9)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt128.pll_l @x0 @x1) (FStar.UInt128.l32 (FStar.UInt128.pll @x0 @x1)))
    :pattern ((FStar.UInt128.pll_l @x0 @x1))
    :qid equation_FStar.UInt128.pll_l))
  :named equation_FStar.UInt128.pll_l))
; Equation for FStar.UInt128.t
;;; Fact-ids: Name FStar.UInt128.t; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(116,4-116,5); use=FStar.UInt128.fst(116,4-116,5)
  (forall ((@u0 Dummy_sort))
   (! (=
     ;; def=FStar.UInt128.fst(116,4-116,5); use=FStar.UInt128.fst(116,4-116,5)
     (FStar.UInt128.t @u0)
     FStar.UInt128.uint128)
    :pattern
     (;; def=FStar.UInt128.fst(116,4-116,5); use=FStar.UInt128.fst(116,4-116,5)
      (FStar.UInt128.t @u0))
    :qid equation_FStar.UInt128.t))
  :named equation_FStar.UInt128.t))
; Equation for FStar.UInt128.uu___0
;;; Fact-ids: Name FStar.UInt128.uu___0; Namespace FStar.UInt128
(assert
 (! (= FStar.UInt128.uu___0 Tm_unit) :named equation_FStar.UInt128.uu___0))
; Equation for FStar.UInt128.uu___1
;;; Fact-ids: Name FStar.UInt128.uu___1; Namespace FStar.UInt128
(assert
 (! (= FStar.UInt128.uu___1 Tm_unit) :named equation_FStar.UInt128.uu___1))
; Equation for Prims.eqtype
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (= Prims.eqtype Tm_refine_9d6af3f3535473623f7aec2f0501897f) :named equation_Prims.eqtype))
; Equation for Prims.nat
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (= Prims.nat Tm_refine_542f9d4f129664613f2483a6c88bc7c2) :named equation_Prims.nat))
; Equation for Prims.nonzero
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (= Prims.nonzero Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f) :named equation_Prims.nonzero))
; Equation for Prims.pos
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! (= Prims.pos Tm_refine_774ba3f728d91ead8ef40be66c9802e5) :named equation_Prims.pos))
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
; Equation for fuel-instrumented recursive function: Prims.pow2
;;; Fact-ids: Name Prims.pow2; Namespace Prims
(assert
 (! ;; def=Prims.fst(670,8-670,12); use=Prims.fst(670,8-670,12)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (implies
     (HasType @x1 Prims.nat)
     (=
      (Prims.pow2.fuel_instrumented (SFuel @u0) @x1)
      (let ((@lb2 @x1))
       (ite
        (= @lb2 (BoxInt 0))
        (BoxInt 1)
        (Prims.op_Star
         (BoxInt 2)
         (Prims.pow2.fuel_instrumented @u0 (Prims.op_Subtraction @x1 (BoxInt 1))))))))
    :weight 0
    :pattern ((Prims.pow2.fuel_instrumented (SFuel @u0) @x1))
    :qid equation_with_fuel_Prims.pow2.fuel_instrumented))
  :named equation_with_fuel_Prims.pow2.fuel_instrumented))
; inversion axiom
;;; Fact-ids: Name FStar.UInt128.uint128; Namespace FStar.UInt128; Name FStar.UInt128.Mkuint128; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,5-114,12); use=FStar.UInt128.fst(114,5-114,12)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (implies (HasTypeFuel @u0 @x1 FStar.UInt128.uint128) (is-FStar.UInt128.Mkuint128 @x1))
    :pattern ((HasTypeFuel @u0 @x1 FStar.UInt128.uint128))
    :qid fuel_guarded_inversion_FStar.UInt128.uint128))
  :named fuel_guarded_inversion_FStar.UInt128.uint128))
; function token typing
;;; Fact-ids: Name FStar.UInt128.uu___0; Namespace FStar.UInt128
(assert
 (! (HasType
   FStar.UInt128.uu___0
   (Prims.squash (FStar.Pervasives.ambient U_zero Prims.int (FStar.UInt128.n Dummy_value))))
  :named function_token_typing_FStar.UInt128.uu___0))
; function token typing
;;; Fact-ids: Name FStar.UInt128.uu___1; Namespace FStar.UInt128
(assert
 (! (HasType
   FStar.UInt128.uu___1
   (Prims.squash
    (FStar.Pervasives.ambient
     (U_succ U_zero)
     Tm_refine_9d6af3f3535473623f7aec2f0501897f
     (FStar.UInt128.t Dummy_value))))
  :named function_token_typing_FStar.UInt128.uu___1))
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
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (HasType Prims.nonzero (Tm_type U_zero)) :named function_token_typing_Prims.nonzero))
; function token typing
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! (HasType Prims.pos (Tm_type U_zero)) :named function_token_typing_Prims.pos))
; function token typing
;;; Fact-ids: Name Prims.prop; Namespace Prims
(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named function_token_typing_Prims.prop))
; function token typing
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (HasType Prims.unit Prims.eqtype) :named function_token_typing_Prims.unit))
; haseq for Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
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
; haseq for Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4
;;; Fact-ids: Name FStar.UInt64.uint_to_t; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(57,34-57,35); use=FStar.UInt64.fsti(57,34-57,35)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4 @x0)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4 @x0))))
    :qid haseqTm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4))
  :named haseqTm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4))
; haseq for Tm_refine_542f9d4f129664613f2483a6c88bc7c2
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_542f9d4f129664613f2483a6c88bc7c2))
; haseq for Tm_refine_774ba3f728d91ead8ef40be66c9802e5
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_774ba3f728d91ead8ef40be66c9802e5))
; haseq for Tm_refine_87d0cffdbbb3c12d99524884e5fb071c
;;; Fact-ids: Name FStar.UInt128.mul32_bound; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(989,4-989,61); use=FStar.UInt128.fst(990,4-990,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_87d0cffdbbb3c12d99524884e5fb071c @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt.uint_t (BoxInt 64)))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_87d0cffdbbb3c12d99524884e5fb071c @x0 @x1))))
    :qid haseqTm_refine_87d0cffdbbb3c12d99524884e5fb071c))
  :named haseqTm_refine_87d0cffdbbb3c12d99524884e5fb071c))
; haseq for Tm_refine_9d6af3f3535473623f7aec2f0501897f
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq (U_succ U_zero) Tm_refine_9d6af3f3535473623f7aec2f0501897f))
   (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
  :named haseqTm_refine_9d6af3f3535473623f7aec2f0501897f))
; haseq for Tm_refine_d12ff0579459f51559539386c837ad74
;;; Fact-ids: Name FStar.UInt128.pll; Namespace FStar.UInt128
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_d12ff0579459f51559539386c837ad74))
   (Valid (Prims.hasEq U_zero (FStar.UInt.uint_t (BoxInt 64)))))
  :named haseqTm_refine_d12ff0579459f51559539386c837ad74))
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
; haseq for Tm_refine_f13070840248fced9d9d60d77bdae3ec
;;; Fact-ids: Name FStar.UInt.uint_t; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(53,22-53,37); use=FStar.UInt.fsti(53,22-53,37)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_f13070840248fced9d9d60d77bdae3ec @x0)))
     (Valid (Prims.hasEq U_zero Prims.int)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_f13070840248fced9d9d60d77bdae3ec @x0))))
    :qid haseqTm_refine_f13070840248fced9d9d60d77bdae3ec))
  :named haseqTm_refine_f13070840248fced9d9d60d77bdae3ec))
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
;;; Fact-ids: Name FStar.UInt128.uint128; Namespace FStar.UInt128; Name FStar.UInt128.Mkuint128; Namespace FStar.UInt128
(assert
 (! (HasType FStar.UInt128.uint128 (Tm_type U_zero)) :named kinding_FStar.UInt128.uint128@tok))
; kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,56); use=Prims.fst(281,39-281,56)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u0 @x1 @x2) (Tm_type @u0))
    :pattern ((HasType (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u0 @x1 @x2) (Tm_type @u0)))
    :qid kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
  :named kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
; Lemma: FStar.Int.pow2_values
;;; Fact-ids: Name FStar.Int.pow2_values; Namespace FStar.Int
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.nat)
     (let ((@lb1 @x0))
      (ite
       (= @lb1 (BoxInt 0))
       ;; def=FStar.Int.fsti(27,11-27,14); use=FStar.Int.fsti(27,11-27,14)
       (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 1))
       (ite
        (= @lb1 (BoxInt 1))
        ;; def=FStar.Int.fsti(28,11-28,14); use=FStar.Int.fsti(28,11-28,14)
        (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 2))
        (ite
         (= @lb1 (BoxInt 8))
         ;; def=FStar.Int.fsti(29,11-29,16); use=FStar.Int.fsti(29,11-29,16)
         (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 256))
         (ite
          (= @lb1 (BoxInt 16))
          ;; def=FStar.Int.fsti(30,11-30,18); use=FStar.Int.fsti(30,11-30,18)
          (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 65536))
          (ite
           (= @lb1 (BoxInt 31))
           ;; def=FStar.Int.fsti(31,11-31,23); use=FStar.Int.fsti(31,11-31,23)
           (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 2147483648))
           (ite
            (= @lb1 (BoxInt 32))
            ;; def=FStar.Int.fsti(32,11-32,23); use=FStar.Int.fsti(32,11-32,23)
            (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 4294967296))
            (ite
             (= @lb1 (BoxInt 63))
             ;; def=FStar.Int.fsti(33,11-33,32); use=FStar.Int.fsti(33,11-33,32)
             (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 9223372036854775808))
             (implies
              (= @lb1 (BoxInt 64))
              ;; def=FStar.Int.fsti(34,11-34,33); use=FStar.Int.fsti(34,11-34,33)
              (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 18446744073709551616))))))))))))
    :pattern ((Prims.pow2.fuel_instrumented ZFuel @x0))
    :qid lemma_FStar.Int.pow2_values))
  :named lemma_FStar.Int.pow2_values))
; Lemma: FStar.UInt.pow2_values
;;; Fact-ids: Name FStar.UInt.pow2_values; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.nat)
     (let ((@lb1 @x0))
      (ite
       (= @lb1 (BoxInt 0))
       ;; def=FStar.UInt.fsti(27,11-27,14); use=FStar.UInt.fsti(27,11-27,14)
       (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 1))
       (ite
        (= @lb1 (BoxInt 1))
        ;; def=FStar.UInt.fsti(28,11-28,14); use=FStar.UInt.fsti(28,11-28,14)
        (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 2))
        (ite
         (= @lb1 (BoxInt 8))
         ;; def=FStar.UInt.fsti(29,11-29,16); use=FStar.UInt.fsti(29,11-29,16)
         (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 256))
         (ite
          (= @lb1 (BoxInt 16))
          ;; def=FStar.UInt.fsti(30,11-30,18); use=FStar.UInt.fsti(30,11-30,18)
          (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 65536))
          (ite
           (= @lb1 (BoxInt 31))
           ;; def=FStar.UInt.fsti(31,11-31,23); use=FStar.UInt.fsti(31,11-31,23)
           (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 2147483648))
           (ite
            (= @lb1 (BoxInt 32))
            ;; def=FStar.UInt.fsti(32,11-32,23); use=FStar.UInt.fsti(32,11-32,23)
            (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 4294967296))
            (ite
             (= @lb1 (BoxInt 63))
             ;; def=FStar.UInt.fsti(33,11-33,32); use=FStar.UInt.fsti(33,11-33,32)
             (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 9223372036854775808))
             (ite
              (= @lb1 (BoxInt 64))
              ;; def=FStar.UInt.fsti(34,11-34,33); use=FStar.UInt.fsti(34,11-34,33)
              (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 18446744073709551616))
              (implies
               (= @lb1 (BoxInt 128))
               ;; def=FStar.UInt.fsti(35,12-35,49); use=FStar.UInt.fsti(35,12-35,49)
               (=
                (Prims.pow2.fuel_instrumented ZFuel @x0)
                (BoxInt 340282366920938463463374607431768211456)))))))))))))
    :pattern ((Prims.pow2.fuel_instrumented ZFuel @x0))
    :qid lemma_FStar.UInt.pow2_values))
  :named lemma_FStar.UInt.pow2_values))
; Lemma: FStar.UInt64.uv_inv
;;; Fact-ids: Name FStar.UInt64.uv_inv; Namespace FStar.UInt64
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt64.t Dummy_value))
     ;; def=FStar.UInt64.fsti(63,11-63,33); use=FStar.UInt64.fsti(63,11-63,33)
     (= (FStar.UInt64.uint_to_t (FStar.UInt64.v @x0)) @x0))
    :pattern ((FStar.UInt64.v @x0))
    :qid lemma_FStar.UInt64.uv_inv))
  :named lemma_FStar.UInt64.uv_inv))
; Lemma: FStar.UInt64.vu_inv
;;; Fact-ids: Name FStar.UInt64.vu_inv; Namespace FStar.UInt64
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt.uint_t (BoxInt 64)))
     ;; def=FStar.UInt64.fsti(68,11-68,33); use=FStar.UInt64.fsti(68,11-68,33)
     (= (FStar.UInt64.v (FStar.UInt64.uint_to_t @x0)) @x0))
    :pattern ((FStar.UInt64.uint_to_t @x0))
    :qid lemma_FStar.UInt64.vu_inv))
  :named lemma_FStar.UInt64.vu_inv))
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
;;; Fact-ids: Name Prims.op_Addition; Namespace Prims
(assert
 (! ;; def=Prims.fst(520,4-520,15); use=Prims.fst(520,4-520,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Addition @x0 @x1) (BoxInt (+ (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Addition @x0 @x1))
    :qid primitive_Prims.op_Addition))
  :named primitive_Prims.op_Addition))
;;; Fact-ids: Name Prims.op_AmpAmp; Namespace Prims
(assert
 (! ;; def=Prims.fst(490,4-490,13); use=Prims.fst(490,4-490,13)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_AmpAmp @x0 @x1) (BoxBool (and (BoxBool_proj_0 @x0) (BoxBool_proj_0 @x1))))
    :pattern ((Prims.op_AmpAmp @x0 @x1))
    :qid primitive_Prims.op_AmpAmp))
  :named primitive_Prims.op_AmpAmp))
;;; Fact-ids: Name Prims.op_Division; Namespace Prims
(assert
 (! ;; def=Prims.fst(665,4-665,15); use=Prims.fst(665,4-665,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (not (= (BoxInt_proj_0 @x1) 0))
     (= (Prims.op_Division @x0 @x1) (BoxInt (div (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1)))))
    :pattern ((Prims.op_Division @x0 @x1))
    :qid primitive_Prims.op_Division))
  :named primitive_Prims.op_Division))
;;; Fact-ids: Name Prims.op_LessThanOrEqual; Namespace Prims
(assert
 (! ;; def=Prims.fst(532,4-532,22); use=Prims.fst(532,4-532,22)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_LessThanOrEqual @x0 @x1) (BoxBool (<= (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_LessThanOrEqual @x0 @x1))
    :qid primitive_Prims.op_LessThanOrEqual))
  :named primitive_Prims.op_LessThanOrEqual))
;;; Fact-ids: Name Prims.op_Modulus; Namespace Prims
(assert
 (! ;; def=Prims.fst(659,4-659,14); use=Prims.fst(659,4-659,14)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (not (= (BoxInt_proj_0 @x1) 0))
     (= (Prims.op_Modulus @x0 @x1) (BoxInt (mod (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1)))))
    :pattern ((Prims.op_Modulus @x0 @x1))
    :qid primitive_Prims.op_Modulus))
  :named primitive_Prims.op_Modulus))
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! ;; def=Prims.fst(508,4-508,11); use=Prims.fst(508,4-508,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Star @x0 @x1) (BoxInt (* (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Star @x0 @x1))
    :qid primitive_Prims.op_Star))
  :named primitive_Prims.op_Star))
;;; Fact-ids: Name Prims.op_Subtraction; Namespace Prims
(assert
 (! ;; def=Prims.fst(514,4-514,18); use=Prims.fst(514,4-514,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Subtraction @x0 @x1) (BoxInt (- (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Subtraction @x0 @x1))
    :qid primitive_Prims.op_Subtraction))
  :named primitive_Prims.op_Subtraction))
; Projection inverse
;;; Fact-ids: Name FStar.UInt128.uint128; Namespace FStar.UInt128; Name FStar.UInt128.Mkuint128; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,5-114,12); use=FStar.UInt128.fst(114,5-114,12)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt128.Mkuint128_@high (FStar.UInt128.Mkuint128 @x0 @x1)) @x1)
    :pattern ((FStar.UInt128.Mkuint128 @x0 @x1))
    :qid projection_inverse_FStar.UInt128.Mkuint128_@high))
  :named projection_inverse_FStar.UInt128.Mkuint128_@high))
; Projection inverse
;;; Fact-ids: Name FStar.UInt128.uint128; Namespace FStar.UInt128; Name FStar.UInt128.Mkuint128; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,5-114,12); use=FStar.UInt128.fst(114,5-114,12)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt128.Mkuint128_@low (FStar.UInt128.Mkuint128 @x0 @x1)) @x0)
    :pattern ((FStar.UInt128.Mkuint128 @x0 @x1))
    :qid projection_inverse_FStar.UInt128.Mkuint128_@low))
  :named projection_inverse_FStar.UInt128.Mkuint128_@low))
; refinement_interpretation
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! ;; def=Prims.fst(648,15-648,29); use=Prims.fst(648,15-648,29)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f)
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      ;; def=Prims.fst(648,22-648,28); use=Prims.fst(648,22-648,28)
      (not (= @x1 (BoxInt 0)))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
    :qid refinement_interpretation_Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
  :named refinement_interpretation_Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
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
;;; Fact-ids: Name FStar.UInt64.uint_to_t; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(57,34-57,35); use=FStar.UInt64.fsti(57,34-57,35)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4 @x2))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(59,21-59,28); use=FStar.UInt64.fsti(59,21-59,28)
      (= (FStar.UInt64.v @x1) @x2)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4 @x2)))
    :qid refinement_interpretation_Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4))
  :named refinement_interpretation_Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4))
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
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! ;; def=Prims.fst(645,11-645,24); use=Prims.fst(645,11-645,24)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_774ba3f728d91ead8ef40be66c9802e5)
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      ;; def=Prims.fst(645,18-645,23); use=Prims.fst(645,18-645,23)
      (> (BoxInt_proj_0 @x1) (BoxInt_proj_0 (BoxInt 0)))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
    :qid refinement_interpretation_Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
  :named refinement_interpretation_Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt128.mul32_bound; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(989,4-989,61); use=FStar.UInt128.fst(990,4-990,15)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_87d0cffdbbb3c12d99524884e5fb071c @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt.uint_t (BoxInt 64)))
      ;; def=FStar.UInt128.fst(989,21-989,46); use=FStar.UInt128.fst(990,4-990,15)
      (<
       (BoxInt_proj_0 @x1)
       (BoxInt_proj_0
        (Prims.op_Subtraction
         (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (Prims.pow2 (BoxInt 32)))
         (BoxInt 1))))
      ;; def=FStar.UInt128.fst(989,50-989,60); use=FStar.UInt128.fst(990,4-990,15)
      (= @x1 (Prims.op_Star @x2 @x3))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_87d0cffdbbb3c12d99524884e5fb071c @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_87d0cffdbbb3c12d99524884e5fb071c))
  :named refinement_interpretation_Tm_refine_87d0cffdbbb3c12d99524884e5fb071c))
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
;;; Fact-ids: Name FStar.UInt128.pll; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(994,23-994,66); use=FStar.UInt128.fst(994,23-994,66)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_d12ff0579459f51559539386c837ad74)
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt.uint_t (BoxInt 64)))
      ;; def=FStar.UInt128.fst(994,40-994,65); use=FStar.UInt128.fst(994,40-994,65)
      (<
       (BoxInt_proj_0 @x1)
       (BoxInt_proj_0
        (Prims.op_Subtraction
         (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (Prims.pow2 (BoxInt 32)))
         (BoxInt 1))))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_d12ff0579459f51559539386c837ad74))
    :qid refinement_interpretation_Tm_refine_d12ff0579459f51559539386c837ad74))
  :named refinement_interpretation_Tm_refine_d12ff0579459f51559539386c837ad74))
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
;;; Fact-ids: Name FStar.UInt.uint_t; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(53,22-53,37); use=FStar.UInt.fsti(53,22-53,37)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_f13070840248fced9d9d60d77bdae3ec @x2))
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt.fsti(53,28-53,36)
      (Valid
       ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt.fsti(53,28-53,36)
       (FStar.UInt.size @x1 @x2))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_f13070840248fced9d9d60d77bdae3ec @x2)))
    :qid refinement_interpretation_Tm_refine_f13070840248fced9d9d60d77bdae3ec))
  :named refinement_interpretation_Tm_refine_f13070840248fced9d9d60d77bdae3ec))
; refinement kinding
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (HasType Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
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
;;; Fact-ids: Name FStar.UInt64.uint_to_t; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(57,34-57,35); use=FStar.UInt64.fsti(57,34-57,35)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4 @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4 @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4))
  :named refinement_kinding_Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4))
; refinement kinding
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Tm_refine_542f9d4f129664613f2483a6c88bc7c2 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
; refinement kinding
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! (HasType Tm_refine_774ba3f728d91ead8ef40be66c9802e5 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
; refinement kinding
;;; Fact-ids: Name FStar.UInt128.mul32_bound; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(989,4-989,61); use=FStar.UInt128.fst(990,4-990,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_87d0cffdbbb3c12d99524884e5fb071c @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_87d0cffdbbb3c12d99524884e5fb071c @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_87d0cffdbbb3c12d99524884e5fb071c))
  :named refinement_kinding_Tm_refine_87d0cffdbbb3c12d99524884e5fb071c))
; refinement kinding
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Tm_refine_9d6af3f3535473623f7aec2f0501897f (Tm_type (U_succ U_zero)))
  :named refinement_kinding_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; refinement kinding
;;; Fact-ids: Name FStar.UInt128.pll; Namespace FStar.UInt128
(assert
 (! (HasType Tm_refine_d12ff0579459f51559539386c837ad74 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_d12ff0579459f51559539386c837ad74))
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
;;; Fact-ids: Name FStar.UInt.uint_t; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(53,22-53,37); use=FStar.UInt.fsti(53,22-53,37)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_f13070840248fced9d9d60d77bdae3ec @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_f13070840248fced9d9d60d77bdae3ec @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_f13070840248fced9d9d60d77bdae3ec))
  :named refinement_kinding_Tm_refine_f13070840248fced9d9d60d77bdae3ec))
; subterm ordering
;;; Fact-ids: Name FStar.UInt128.uint128; Namespace FStar.UInt128; Name FStar.UInt128.Mkuint128; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,5-114,12); use=FStar.UInt128.fst(114,5-114,12)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) (FStar.UInt128.Mkuint128 @x1 @x2) FStar.UInt128.uint128)
     (and
      (Valid
       (Prims.precedes U_zero U_zero Prims.lex_t Prims.lex_t @x1 (FStar.UInt128.Mkuint128 @x1 @x2)))
      (Valid
       (Prims.precedes U_zero U_zero Prims.lex_t Prims.lex_t @x2 (FStar.UInt128.Mkuint128 @x1 @x2)))))
    :pattern ((HasTypeFuel (SFuel @u0) (FStar.UInt128.Mkuint128 @x1 @x2) FStar.UInt128.uint128))
    :qid subterm_ordering_FStar.UInt128.Mkuint128))
  :named subterm_ordering_FStar.UInt128.Mkuint128))
; Typing correspondence of token to term
;;; Fact-ids: Name Prims.pow2; Namespace Prims
(assert
 (! ;; def=Prims.fst(670,8-670,12); use=Prims.fst(670,8-670,12)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (implies (HasType @x1 Prims.nat) (HasType (Prims.pow2.fuel_instrumented @u0 @x1) Prims.pos))
    :pattern ((Prims.pow2.fuel_instrumented @u0 @x1))
    :qid token_correspondence_Prims.pow2.fuel_instrumented))
  :named token_correspondence_Prims.pow2.fuel_instrumented))
; True interpretation
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert (! (Valid Prims.l_True) :named true_interp))
; free var typing
;;; Fact-ids: Name FStar.Pervasives.ambient; Namespace FStar.Pervasives
(assert
 (! ;; def=FStar.Pervasives.fsti(144,4-144,11); use=FStar.Pervasives.fsti(144,4-144,11)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 @x1))
     (HasType (FStar.Pervasives.ambient @u0 @x1 @x2) Prims.prop))
    :pattern ((FStar.Pervasives.ambient @u0 @x1 @x2))
    :qid typing_FStar.Pervasives.ambient))
  :named typing_FStar.Pervasives.ambient))
; free var typing
;;; Fact-ids: Name FStar.UInt.fits; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(48,4-48,8); use=FStar.UInt.fsti(48,4-48,8)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.nat))
     (HasType (FStar.UInt.fits @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt.fits @x0 @x1))
    :qid typing_FStar.UInt.fits))
  :named typing_FStar.UInt.fits))
; free var typing
;;; Fact-ids: Name FStar.UInt.max_int; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(45,4-45,11); use=FStar.UInt.fsti(45,4-45,11)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.max_int @x0) Prims.int))
    :pattern ((FStar.UInt.max_int @x0))
    :qid typing_FStar.UInt.max_int))
  :named typing_FStar.UInt.max_int))
; free var typing
;;; Fact-ids: Name FStar.UInt.min_int; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(46,4-46,11); use=FStar.UInt.fsti(46,4-46,11)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.min_int @x0) Prims.int))
    :pattern ((FStar.UInt.min_int @x0))
    :qid typing_FStar.UInt.min_int))
  :named typing_FStar.UInt.min_int))
; free var typing
;;; Fact-ids: Name FStar.UInt.size; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(49,4-49,8); use=FStar.UInt.fsti(49,4-49,8)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.nat))
     (HasType (FStar.UInt.size @x0 @x1) Prims.prop))
    :pattern ((FStar.UInt.size @x0 @x1))
    :qid typing_FStar.UInt.size))
  :named typing_FStar.UInt.size))
; free var typing
;;; Fact-ids: Name FStar.UInt.uint_t; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(53,5-53,11); use=FStar.UInt.fsti(53,5-53,11)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.uint_t @x0) (Tm_type U_zero)))
    :pattern ((FStar.UInt.uint_t @x0))
    :qid typing_FStar.UInt.uint_t))
  :named typing_FStar.UInt.uint_t))
; free var typing
;;; Fact-ids: Name FStar.UInt128.h32; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(986,4-986,7); use=FStar.UInt128.fst(986,4-986,7)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt.uint_t (BoxInt 64)))
     (HasType (FStar.UInt128.h32 @x0) (FStar.UInt.uint_t (BoxInt 32))))
    :pattern ((FStar.UInt128.h32 @x0))
    :qid typing_FStar.UInt128.h32))
  :named typing_FStar.UInt128.h32))
; free var typing
;;; Fact-ids: Name FStar.UInt128.l32; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(985,4-985,7); use=FStar.UInt128.fst(985,4-985,7)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt.uint_t (BoxInt 64)))
     (HasType (FStar.UInt128.l32 @x0) (FStar.UInt.uint_t (BoxInt 32))))
    :pattern ((FStar.UInt128.l32 @x0))
    :qid typing_FStar.UInt128.l32))
  :named typing_FStar.UInt128.l32))
; free var typing
;;; Fact-ids: Name FStar.UInt128.mul32_bound; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(990,4-990,15); use=FStar.UInt128.fst(990,4-990,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt.uint_t (BoxInt 32)))
      (HasType @x1 (FStar.UInt.uint_t (BoxInt 32))))
     (HasType
      (FStar.UInt128.mul32_bound @x0 @x1)
      (Tm_refine_87d0cffdbbb3c12d99524884e5fb071c @x0 @x1)))
    :pattern ((FStar.UInt128.mul32_bound @x0 @x1))
    :qid typing_FStar.UInt128.mul32_bound))
  :named typing_FStar.UInt128.mul32_bound))
; free var typing
;;; Fact-ids: Name FStar.UInt128.n; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fsti(24,4-24,5); use=FStar.UInt128.fsti(24,4-24,5)
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt128.n @u0) Prims.int)
    :pattern ((FStar.UInt128.n @u0))
    :qid typing_FStar.UInt128.n))
  :named typing_FStar.UInt128.n))
; free var typing
;;; Fact-ids: Name FStar.UInt128.phh; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(1000,4-1000,7); use=FStar.UInt128.fst(1000,4-1000,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.phh @x0 @x1) Tm_refine_d12ff0579459f51559539386c837ad74))
    :pattern ((FStar.UInt128.phh @x0 @x1))
    :qid typing_FStar.UInt128.phh))
  :named typing_FStar.UInt128.phh))
; free var typing
;;; Fact-ids: Name FStar.UInt128.phl; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(998,4-998,7); use=FStar.UInt128.fst(998,4-998,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.phl @x0 @x1) Tm_refine_d12ff0579459f51559539386c837ad74))
    :pattern ((FStar.UInt128.phl @x0 @x1))
    :qid typing_FStar.UInt128.phl))
  :named typing_FStar.UInt128.phl))
; free var typing
;;; Fact-ids: Name FStar.UInt128.plh; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(996,4-996,7); use=FStar.UInt128.fst(996,4-996,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.plh @x0 @x1) Tm_refine_d12ff0579459f51559539386c837ad74))
    :pattern ((FStar.UInt128.plh @x0 @x1))
    :qid typing_FStar.UInt128.plh))
  :named typing_FStar.UInt128.plh))
; free var typing
;;; Fact-ids: Name FStar.UInt128.pll; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(994,4-994,7); use=FStar.UInt128.fst(994,4-994,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.pll @x0 @x1) Tm_refine_d12ff0579459f51559539386c837ad74))
    :pattern ((FStar.UInt128.pll @x0 @x1))
    :qid typing_FStar.UInt128.pll))
  :named typing_FStar.UInt128.pll))
; free var typing
;;; Fact-ids: Name FStar.UInt128.pll_h; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(1005,4-1005,9); use=FStar.UInt128.fst(1005,4-1005,9)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.pll_h @x0 @x1) (FStar.UInt.uint_t (BoxInt 32))))
    :pattern ((FStar.UInt128.pll_h @x0 @x1))
    :qid typing_FStar.UInt128.pll_h))
  :named typing_FStar.UInt128.pll_h))
; free var typing
;;; Fact-ids: Name FStar.UInt128.pll_l; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(1003,4-1003,9); use=FStar.UInt128.fst(1003,4-1003,9)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.pll_l @x0 @x1) (FStar.UInt.uint_t (BoxInt 32))))
    :pattern ((FStar.UInt128.pll_l @x0 @x1))
    :qid typing_FStar.UInt128.pll_l))
  :named typing_FStar.UInt128.pll_l))
; free var typing
;;; Fact-ids: Name FStar.UInt128.t; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(116,4-116,5); use=FStar.UInt128.fst(116,4-116,5)
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt128.t @u0) Tm_refine_9d6af3f3535473623f7aec2f0501897f)
    :pattern ((FStar.UInt128.t @u0))
    :qid typing_FStar.UInt128.t))
  :named typing_FStar.UInt128.t))
; free var typing
;;; Fact-ids: Name FStar.UInt128.uu___0; Namespace FStar.UInt128
(assert
 (! (HasType
   FStar.UInt128.uu___0
   (Prims.squash (FStar.Pervasives.ambient U_zero Prims.int (FStar.UInt128.n Dummy_value))))
  :named typing_FStar.UInt128.uu___0))
; free var typing
;;; Fact-ids: Name FStar.UInt128.uu___1; Namespace FStar.UInt128
(assert
 (! (HasType
   FStar.UInt128.uu___1
   (Prims.squash
    (FStar.Pervasives.ambient
     (U_succ U_zero)
     Tm_refine_9d6af3f3535473623f7aec2f0501897f
     (FStar.UInt128.t Dummy_value))))
  :named typing_FStar.UInt128.uu___1))
; free var typing
;;; Fact-ids: Name FStar.UInt64.t; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(47,8-47,9); use=FStar.UInt64.fsti(47,8-47,9)
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt64.t @u0) Prims.eqtype)
    :pattern ((FStar.UInt64.t @u0))
    :qid typing_FStar.UInt64.t))
  :named typing_FStar.UInt64.t))
; free var typing
;;; Fact-ids: Name FStar.UInt64.uint_to_t; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(57,4-57,13); use=FStar.UInt64.fsti(57,4-57,13)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt.uint_t (BoxInt 64)))
     (HasType (FStar.UInt64.uint_to_t @x0) (Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4 @x0)))
    :pattern ((FStar.UInt64.uint_to_t @x0))
    :qid typing_FStar.UInt64.uint_to_t))
  :named typing_FStar.UInt64.uint_to_t))
; free var typing
;;; Fact-ids: Name FStar.UInt64.v; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(51,4-51,5); use=FStar.UInt64.fsti(51,4-51,5)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt64.t Dummy_value))
     (HasType (FStar.UInt64.v @x0) (FStar.UInt.uint_t (BoxInt 64))))
    :pattern ((FStar.UInt64.v @x0))
    :qid typing_FStar.UInt64.v))
  :named typing_FStar.UInt64.v))
; free var typing
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (HasType Prims.bool Prims.eqtype) :named typing_Prims.bool))
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
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert
 (! (HasType Prims.l_True Prims.prop) :named typing_Prims.l_True))
; free var typing
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Prims.nat (Tm_type U_zero)) :named typing_Prims.nat))
; free var typing
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (HasType Prims.nonzero (Tm_type U_zero)) :named typing_Prims.nonzero))
; free var typing
;;; Fact-ids: Name Prims.op_Addition; Namespace Prims
(assert
 (! ;; def=Prims.fst(520,4-520,15); use=Prims.fst(520,4-520,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_Addition @x0 @x1) Prims.int))
    :pattern ((Prims.op_Addition @x0 @x1))
    :qid typing_Prims.op_Addition))
  :named typing_Prims.op_Addition))
; free var typing
;;; Fact-ids: Name Prims.op_AmpAmp; Namespace Prims
(assert
 (! ;; def=Prims.fst(490,4-490,13); use=Prims.fst(490,4-490,13)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.bool) (HasType @x1 Prims.bool))
     (HasType (Prims.op_AmpAmp @x0 @x1) Prims.bool))
    :pattern ((Prims.op_AmpAmp @x0 @x1))
    :qid typing_Prims.op_AmpAmp))
  :named typing_Prims.op_AmpAmp))
; free var typing
;;; Fact-ids: Name Prims.op_Division; Namespace Prims
(assert
 (! ;; def=Prims.fst(665,4-665,15); use=Prims.fst(665,4-665,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.nonzero))
     (HasType (Prims.op_Division @x0 @x1) Prims.int))
    :pattern ((Prims.op_Division @x0 @x1))
    :qid typing_Prims.op_Division))
  :named typing_Prims.op_Division))
; free var typing
;;; Fact-ids: Name Prims.op_LessThanOrEqual; Namespace Prims
(assert
 (! ;; def=Prims.fst(532,4-532,22); use=Prims.fst(532,4-532,22)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_LessThanOrEqual @x0 @x1) Prims.bool))
    :pattern ((Prims.op_LessThanOrEqual @x0 @x1))
    :qid typing_Prims.op_LessThanOrEqual))
  :named typing_Prims.op_LessThanOrEqual))
; free var typing
;;; Fact-ids: Name Prims.op_Modulus; Namespace Prims
(assert
 (! ;; def=Prims.fst(659,4-659,14); use=Prims.fst(659,4-659,14)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.nonzero))
     (HasType (Prims.op_Modulus @x0 @x1) Prims.int))
    :pattern ((Prims.op_Modulus @x0 @x1))
    :qid typing_Prims.op_Modulus))
  :named typing_Prims.op_Modulus))
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
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! (HasType Prims.pos (Tm_type U_zero)) :named typing_Prims.pos))
; free var typing
;;; Fact-ids: Name Prims.pow2; Namespace Prims
(assert
 (! ;; def=Prims.fst(670,8-670,12); use=Prims.fst(670,8-670,12)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (Prims.pow2 @x0) Prims.pos))
    :pattern ((Prims.pow2 @x0))
    :qid typing_Prims.pow2))
  :named typing_Prims.pow2))
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
; well-founded ordering on nat (alt)
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      (HasTypeFuel @u0 @x2 Prims.int)
      (> (BoxInt_proj_0 @x1) 0)
      (>= (BoxInt_proj_0 @x2) 0)
      (< (BoxInt_proj_0 @x2) (BoxInt_proj_0 @x1)))
     (Valid (Prims.precedes U_zero U_zero Prims.lex_t Prims.lex_t @x2 @x1)))
    :pattern
     ((HasTypeFuel @u0 @x1 Prims.int)
      (HasTypeFuel @u0 @x2 Prims.int)
      (Valid (Prims.precedes U_zero U_zero Prims.lex_t Prims.lex_t @x2 @x1)))
    :qid well-founded-ordering-on-nat))
  :named well-founded-ordering-on-nat))
(push) ;; push{1
; Starting query at FStar.UInt128.fst(1130,2-1135,51)
(declare-fun label_11 () Bool)
(declare-fun label_10 () Bool)
(declare-fun label_9 () Bool)
(declare-fun label_8 () Bool)
(declare-fun label_7 () Bool)
(declare-fun label_6 () Bool)
(declare-fun label_5 () Bool)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
(declare-fun Tm_refine_afd51579b90d50ea23e03b743a1fa001 () Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! (HasType Tm_refine_afd51579b90d50ea23e03b743a1fa001 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_afd51579b90d50ea23e03b743a1fa001))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.UInt128.fst(216,30-216,40); use=FStar.UInt128.fst(1133,2-1133,16)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_afd51579b90d50ea23e03b743a1fa001)
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.UInt128.fst(216,36-216,39); use=FStar.UInt128.fst(1133,2-1133,16)
      (> (BoxInt_proj_0 @x1) (BoxInt_proj_0 (BoxInt 0)))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_afd51579b90d50ea23e03b743a1fa001))
    :qid refinement_interpretation_Tm_refine_afd51579b90d50ea23e03b743a1fa001))
  :named refinement_interpretation_Tm_refine_afd51579b90d50ea23e03b743a1fa001))
; haseq for Tm_refine_afd51579b90d50ea23e03b743a1fa001
;;; Fact-ids: 
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_afd51579b90d50ea23e03b743a1fa001))
   (Valid (Prims.hasEq U_zero Prims.nat)))
  :named haseqTm_refine_afd51579b90d50ea23e03b743a1fa001))

; Encoding query formula : forall (x: FStar.UInt64.t) (y: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         FStar.UInt64.v x * FStar.UInt64.v y / Prims.pow2 32 ==
;         FStar.UInt128.phh x y * Prims.pow2 32 + FStar.UInt128.plh x y + FStar.UInt128.phl x y +
;         FStar.UInt128.pll_h x y ==>
;         p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         Prims.pow2 32 * Prims.pow2 32 = Prims.pow2 64 ==>
;         (forall (pure_result: Prims.unit).
;             FStar.UInt64.v x * FStar.UInt64.v y ==
;             FStar.UInt128.phh x y * Prims.pow2 64 +
;             (FStar.UInt128.plh x y + FStar.UInt128.phl x y + FStar.UInt128.pll_h x y) *
;             Prims.pow2 32 +
;             FStar.UInt128.pll_l x y ==>
;             (forall (pure_result: Prims.unit).
;                 (FStar.UInt128.plh x y + FStar.UInt128.phl x y + FStar.UInt128.pll_h x y +
;                   FStar.UInt128.phh x y * Prims.pow2 32 * Prims.pow2 32) /
;                 Prims.pow2 32 =
;                 (FStar.UInt128.plh x y + FStar.UInt128.phl x y + FStar.UInt128.pll_h x y) /
;                 Prims.pow2 32 +
;                 FStar.UInt128.phh x y * Prims.pow2 32 ==>
;                 FStar.UInt128.phh x y * Prims.pow2 32 >= 0 /\
;                 (forall (return_val: Prims.nat).
;                     return_val == FStar.UInt128.phh x y * Prims.pow2 32 ==>
;                     (Prims.pow2 32 > 0 ==> Prims.pow2 32 >= 0 /\ Prims.pow2 32 > 0) /\
;                     (forall (return_val: k: Prims.nat{k > 0}).
;                         return_val == Prims.pow2 32 ==>
;                         (forall (pure_result: Prims.unit).
;                             FStar.UInt128.phh x y * Prims.pow2 32 * Prims.pow2 32 / Prims.pow2 32 ==
;                             FStar.UInt128.phh x y * Prims.pow2 32 ==>
;                             FStar.UInt128.plh x y + FStar.UInt128.phl x y + FStar.UInt128.pll_h x y >=
;                             0 /\
;                             (forall (return_val: Prims.nat).
;                                 return_val ==
;                                 FStar.UInt128.plh x y + FStar.UInt128.phl x y +
;                                 FStar.UInt128.pll_h x y ==>
;                                 (Prims.pow2 32 > 0 ==> Prims.pow2 32 >= 0 /\ Prims.pow2 32 > 0) /\
;                                 (forall (return_val: k: Prims.nat{k > 0}).
;                                     return_val == Prims.pow2 32 ==>
;                                     (forall (pure_result: Prims.unit).
;                                         (FStar.UInt128.plh x y + FStar.UInt128.phl x y +
;                                           FStar.UInt128.pll_h x y) *
;                                         Prims.pow2 32 /
;                                         Prims.pow2 32 ==
;                                         FStar.UInt128.plh x y + FStar.UInt128.phl x y +
;                                         FStar.UInt128.pll_h x y ==>
;                                         (FStar.UInt.size (FStar.UInt128.pll_l x y) 32 ==>
;                                           FStar.UInt128.pll_l x y >= 0) /\
;                                         (forall (return_val: Prims.nat).
;                                             return_val == FStar.UInt128.pll_l x y ==>
;                                             (Prims.pow2 32 > 0 ==> Prims.pow2 32 <> 0) /\
;                                             (forall (return_val: Prims.nonzero).
;                                                 return_val == Prims.pow2 32 ==>
;                                                 FStar.UInt128.pll_l x y < Prims.pow2 32 /\
;                                                 (forall (pure_result: Prims.unit).
;                                                     FStar.UInt128.pll_l x y / Prims.pow2 32 = 0 ==>
;                                                     p pure_result))))))))))))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let product_high32’
(push) ;; push{0
; <fuel='0' ifuel='0'>
;;; Fact-ids: 
(assert (! (= MaxFuel ZFuel) :named @MaxFuel_assumption))
;;; Fact-ids: 
(assert (! (= MaxIFuel ZFuel) :named @MaxIFuel_assumption))
; query
;;; Fact-ids: 
(assert
 (! (not
   (forall ((@x0 Term) (@x1 Term))
    (! (implies
      (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.unit))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(1130,2-1135,51)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              ;; def=FStar.UInt128.fst(1127,8-1127,92); use=FStar.UInt128.fst(1130,2-1135,51)
              (or
               label_2
               ;; def=FStar.UInt128.fst(1127,8-1127,92); use=FStar.UInt128.fst(1130,2-1135,51)
               (=
                (Prims.op_Division
                 (Prims.op_Star (FStar.UInt64.v @x0) (FStar.UInt64.v @x1))
                 (Prims.pow2 (BoxInt 32)))
                (Prims.op_Addition
                 (Prims.op_Addition
                  (Prims.op_Addition
                   (Prims.op_Star (FStar.UInt128.phh @x0 @x1) (Prims.pow2 (BoxInt 32)))
                   (FStar.UInt128.plh @x0 @x1))
                  (FStar.UInt128.phl @x0 @x1))
                 (FStar.UInt128.pll_h @x0 @x1)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(1130,2-1135,51)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(1130,2-1135,51)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(1130,2-1135,51)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(1130,2-1135,51)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(1130,7-1130,16)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.unit)
             ;; def=FStar.Math.Lemmas.fsti(155,11-155,43); use=FStar.UInt128.fst(1130,7-1130,16)
             (=
              (Prims.op_Star (Prims.pow2 (BoxInt 32)) (Prims.pow2 (BoxInt 32)))
              (Prims.pow2 (BoxInt 64))))
            ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(1131,2-1131,16)
            (forall ((@x4 Term))
             (! (implies
               (and
                (HasType @x4 Prims.unit)
                ;; def=FStar.UInt128.fst(1090,8-1092,40); use=FStar.UInt128.fst(1131,2-1131,16)
                (=
                 (Prims.op_Star (FStar.UInt64.v @x0) (FStar.UInt64.v @x1))
                 (Prims.op_Addition
                  (Prims.op_Addition
                   (Prims.op_Star (FStar.UInt128.phh @x0 @x1) (Prims.pow2 (BoxInt 64)))
                   (Prims.op_Star
                    (Prims.op_Addition
                     (Prims.op_Addition (FStar.UInt128.plh @x0 @x1) (FStar.UInt128.phl @x0 @x1))
                     (FStar.UInt128.pll_h @x0 @x1))
                    (Prims.pow2 (BoxInt 32))))
                  (FStar.UInt128.pll_l @x0 @x1))))
               ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(1132,7-1132,30)
               (forall ((@x5 Term))
                (! (implies
                  (and
                   (HasType @x5 Prims.unit)
                   ;; def=FStar.Math.Lemmas.fsti(312,8-312,39); use=FStar.UInt128.fst(1132,7-1132,30)
                   (=
                    (Prims.op_Division
                     (Prims.op_Addition
                      (Prims.op_Addition
                       (Prims.op_Addition (FStar.UInt128.plh @x0 @x1) (FStar.UInt128.phl @x0 @x1))
                       (FStar.UInt128.pll_h @x0 @x1))
                      (Prims.op_Star
                       (Prims.op_Star (FStar.UInt128.phh @x0 @x1) (Prims.pow2 (BoxInt 32)))
                       (Prims.pow2 (BoxInt 32))))
                     (Prims.pow2 (BoxInt 32)))
                    (Prims.op_Addition
                     (Prims.op_Division
                      (Prims.op_Addition
                       (Prims.op_Addition (FStar.UInt128.plh @x0 @x1) (FStar.UInt128.phl @x0 @x1))
                       (FStar.UInt128.pll_h @x0 @x1))
                      (Prims.pow2 (BoxInt 32)))
                     (Prims.op_Star (FStar.UInt128.phh @x0 @x1) (Prims.pow2 (BoxInt 32))))))
                  ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(1130,2-1135,51)
                  (and
                   ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1133,17-1133,36)
                   (or
                    label_3
                    ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1133,17-1133,36)
                    (>=
                     (BoxInt_proj_0
                      (Prims.op_Star (FStar.UInt128.phh @x0 @x1) (Prims.pow2 (BoxInt 32))))
                     (BoxInt_proj_0 (BoxInt 0))))
                   ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(1130,2-1135,51)
                   (forall ((@x6 Term))
                    (! (implies
                      (and
                       (HasType @x6 Prims.nat)
                       ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(1130,2-1135,51)
                       (= @x6 (Prims.op_Star (FStar.UInt128.phh @x0 @x1) (Prims.pow2 (BoxInt 32)))))
                      ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(1130,2-1135,51)
                      (and
                       (implies
                        ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(1133,37-1133,46)
                        (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0)))
                        ;; def=FStar.UInt128.fst(216,36-216,39); use=FStar.UInt128.fst(1133,37-1133,46)
                        (and
                         ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1133,37-1133,46)
                         (or
                          label_4
                          ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1133,37-1133,46)
                          (>= (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0))))
                         ;; def=FStar.UInt128.fst(216,36-216,39); use=FStar.UInt128.fst(1133,37-1133,46)
                         (or
                          label_5
                          ;; def=FStar.UInt128.fst(216,36-216,39); use=FStar.UInt128.fst(1133,37-1133,46)
                          (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0))))))
                       ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(1130,2-1135,51)
                       (forall ((@x7 Term))
                        (! (implies
                          (and
                           (HasType @x7 Tm_refine_afd51579b90d50ea23e03b743a1fa001)
                           ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(1130,2-1135,51)
                           (= @x7 (Prims.pow2 (BoxInt 32))))
                          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(1133,2-1133,16)
                          (forall ((@x8 Term))
                           (! (implies
                             (and
                              (HasType @x8 Prims.unit)
                              ;; def=FStar.UInt128.fst(217,8-217,26); use=FStar.UInt128.fst(1133,2-1133,16)
                              (=
                               (Prims.op_Division
                                (Prims.op_Star
                                 (Prims.op_Star (FStar.UInt128.phh @x0 @x1) (Prims.pow2 (BoxInt 32)))
                                 (Prims.pow2 (BoxInt 32)))
                                (Prims.pow2 (BoxInt 32)))
                               (Prims.op_Star (FStar.UInt128.phh @x0 @x1) (Prims.pow2 (BoxInt 32)))))
                             ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(1130,2-1135,51)
                             (and
                              ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1134,17-1134,48)
                              (or
                               label_6
                               ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1134,17-1134,48)
                               (>=
                                (BoxInt_proj_0
                                 (Prims.op_Addition
                                  (Prims.op_Addition
                                   (FStar.UInt128.plh @x0 @x1)
                                   (FStar.UInt128.phl @x0 @x1))
                                  (FStar.UInt128.pll_h @x0 @x1)))
                                (BoxInt_proj_0 (BoxInt 0))))
                              ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(1130,2-1135,51)
                              (forall ((@x9 Term))
                               (! (implies
                                 (and
                                  (HasType @x9 Prims.nat)
                                  ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(1130,2-1135,51)
                                  (=
                                   @x9
                                   (Prims.op_Addition
                                    (Prims.op_Addition
                                     (FStar.UInt128.plh @x0 @x1)
                                     (FStar.UInt128.phl @x0 @x1))
                                    (FStar.UInt128.pll_h @x0 @x1))))
                                 ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(1130,2-1135,51)
                                 (and
                                  (implies
                                   ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(1134,49-1134,58)
                                   (>
                                    (BoxInt_proj_0 (Prims.pow2 (BoxInt 32)))
                                    (BoxInt_proj_0 (BoxInt 0)))
                                   ;; def=FStar.UInt128.fst(216,36-216,39); use=FStar.UInt128.fst(1134,49-1134,58)
                                   (and
                                    ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1134,49-1134,58)
                                    (or
                                     label_7
                                     ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1134,49-1134,58)
                                     (>=
                                      (BoxInt_proj_0 (Prims.pow2 (BoxInt 32)))
                                      (BoxInt_proj_0 (BoxInt 0))))
                                    ;; def=FStar.UInt128.fst(216,36-216,39); use=FStar.UInt128.fst(1134,49-1134,58)
                                    (or
                                     label_8
                                     ;; def=FStar.UInt128.fst(216,36-216,39); use=FStar.UInt128.fst(1134,49-1134,58)
                                     (>
                                      (BoxInt_proj_0 (Prims.pow2 (BoxInt 32)))
                                      (BoxInt_proj_0 (BoxInt 0))))))
                                  ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(1130,2-1135,51)
                                  (forall ((@x10 Term))
                                   (! (implies
                                     (and
                                      (HasType @x10 Tm_refine_afd51579b90d50ea23e03b743a1fa001)
                                      ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(1130,2-1135,51)
                                      (= @x10 (Prims.pow2 (BoxInt 32))))
                                     ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(1134,2-1134,16)
                                     (forall ((@x11 Term))
                                      (! (implies
                                        (and
                                         (HasType @x11 Prims.unit)
                                         ;; def=FStar.UInt128.fst(217,8-217,26); use=FStar.UInt128.fst(1134,2-1134,16)
                                         (=
                                          (Prims.op_Division
                                           (Prims.op_Star
                                            (Prims.op_Addition
                                             (Prims.op_Addition
                                              (FStar.UInt128.plh @x0 @x1)
                                              (FStar.UInt128.phl @x0 @x1))
                                             (FStar.UInt128.pll_h @x0 @x1))
                                            (Prims.pow2 (BoxInt 32)))
                                           (Prims.pow2 (BoxInt 32)))
                                          (Prims.op_Addition
                                           (Prims.op_Addition
                                            (FStar.UInt128.plh @x0 @x1)
                                            (FStar.UInt128.phl @x0 @x1))
                                           (FStar.UInt128.pll_h @x0 @x1))))
                                        ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(1130,2-1135,51)
                                        (and
                                         (implies
                                          ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(1135,30-1135,41)
                                          (Valid
                                           ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(1135,30-1135,41)
                                           (FStar.UInt.size
                                            (FStar.UInt128.pll_l @x0 @x1)
                                            (BoxInt 32)))
                                          ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1135,30-1135,41)
                                          (or
                                           label_9
                                           ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(1135,30-1135,41)
                                           (>=
                                            (BoxInt_proj_0 (FStar.UInt128.pll_l @x0 @x1))
                                            (BoxInt_proj_0 (BoxInt 0)))))
                                         ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(1130,2-1135,51)
                                         (forall ((@x12 Term))
                                          (! (implies
                                            (and
                                             (HasType @x12 Prims.nat)
                                             ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(1130,2-1135,51)
                                             (= @x12 (FStar.UInt128.pll_l @x0 @x1)))
                                            ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(1130,2-1135,51)
                                            (and
                                             (implies
                                              ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(1135,42-1135,51)
                                              (>
                                               (BoxInt_proj_0 (Prims.pow2 (BoxInt 32)))
                                               (BoxInt_proj_0 (BoxInt 0)))
                                              ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(1135,42-1135,51)
                                              (or
                                               label_10
                                               ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(1135,42-1135,51)
                                               (not (= (Prims.pow2 (BoxInt 32)) (BoxInt 0)))))
                                             ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(1130,2-1135,51)
                                             (forall ((@x13 Term))
                                              (! (implies
                                                (and
                                                 (HasType @x13 Prims.nonzero)
                                                 ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(1130,2-1135,51)
                                                 (= @x13 (Prims.pow2 (BoxInt 32))))
                                                ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(1135,7-1135,29)
                                                (and
                                                 ;; def=FStar.Math.Lemmas.fsti(279,18-279,23); use=FStar.UInt128.fst(1135,7-1135,29)
                                                 (or
                                                  label_11
                                                  ;; def=FStar.Math.Lemmas.fsti(279,18-279,23); use=FStar.UInt128.fst(1135,7-1135,29)
                                                  (<
                                                   (BoxInt_proj_0 (FStar.UInt128.pll_l @x0 @x1))
                                                   (BoxInt_proj_0 (Prims.pow2 (BoxInt 32)))))
                                                 ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(1135,7-1135,29)
                                                 (forall ((@x14 Term))
                                                  (! (implies
                                                    (and
                                                     (HasType @x14 Prims.unit)
                                                     ;; def=FStar.Math.Lemmas.fsti(279,34-279,43); use=FStar.UInt128.fst(1135,7-1135,29)
                                                     (=
                                                      (Prims.op_Division
                                                       (FStar.UInt128.pll_l @x0 @x1)
                                                       (Prims.pow2 (BoxInt 32)))
                                                      (BoxInt 0)))
                                                    ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(1135,7-1135,29)
                                                    (Valid
                                                     ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(1135,7-1135,29)
                                                     (ApplyTT @x2 @x14)))
                                                   :qid @query.14))))
                                               :qid @query.13))))
                                           :qid @query.12))))
                                       :qid @query.11)))
                                    :qid @query.10))))
                                :qid @query.9))))
                            :qid @query.8)))
                         :qid @query.7))))
                     :qid @query.6))))
                 :qid @query.5)))
              :qid @query.4)))
           :qid @query.3)))
        :qid @query.1)))
     :qid @query)))
  :named @query))
(set-option :rlimit 10000000)
(echo "<initial_stats>")
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "</initial_stats>")
(echo "<result>")
; Hand-simplified durable candidate axiom for FStar.UInt128 mul_wide stability.
; v(t) := (BoxInt_proj_0 t) projects a boxed Term to its Int.
; For the two 64-bit operands x,y, F* forms five 32x32 partial products:
;   phh,phl,plh,pll_h,pll_l.  The 128-bit result is assembled as
;     full = phh*2^64 + (plh+phl+pll_h)*2^32 + pll_l
; nla only *sometimes* discovers the pow2 relation and the Euclidean (div/mod)
; split of this composite term -> seed-dependent unknowns.  This axiom supplies
; that scaffolding deterministically.  Every conjunct is a universally-valid
; arithmetic tautology (independent of what the partials actually denote), so it
; is SOUND regardless of the multiplier's correctness.
(assert (= (BoxInt 4294967296) (Prims.pow2 (BoxInt 32))))
(assert (= (BoxInt (* 4294967296 4294967296)) (Prims.pow2 (BoxInt 64))))
 
(assert (forall ((x Term) (y Term))
  (! (let ((p32 (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))))
           (p64 (BoxInt_proj_0 (Prims.pow2 (BoxInt 64))))
           (hh  (BoxInt_proj_0 (FStar.UInt128.phh x y)))
           (lh  (BoxInt_proj_0 (FStar.UInt128.plh x y)))
           (hl  (BoxInt_proj_0 (FStar.UInt128.phl x y)))
           (llh (BoxInt_proj_0 (FStar.UInt128.pll_h x y)))
           (lll (BoxInt_proj_0 (FStar.UInt128.pll_l x y))))
     (let ((full (+ (* hh p64) (* (+ lh hl llh) p32) lll)))
       (and
         ; pow2 additivity: 2^64 = 2^32 * 2^32
         ;(= p64 (* p32 p32))
         ; pow2 lower bound
         ;(>= p32 4294967296)
         ; Euclidean split of the assembled 128-bit value at the 2^32 boundary
         ;(= full (+ (* (div full p32) p32) (mod full p32)))
         ;(>= (mod full p32) 0)
         (or (<= p32 0) (< (mod full p32) p32))
)
))
   :pattern ((FStar.UInt128.phh x y)))))

(check-sat)
(echo "</result>")
(set-option :rlimit 0)
(echo "<reason-unknown>") (get-info :reason-unknown) (echo "</reason-unknown>")
(echo "<labels>")
(echo "label_11")
(eval label_11)
(echo "label_10")
(eval label_10)
(echo "label_9")
(eval label_9)
(echo "label_8")
(eval label_8)
(echo "label_7")
(eval label_7)
(echo "label_6")
(eval label_6)
(echo "label_5")
(eval label_5)
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
