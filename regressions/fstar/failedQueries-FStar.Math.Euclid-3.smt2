; Z3 invocation started by F*
; F* version: 2026.07.19~dev -- commit hash: 2eb93aa9cc4a7989370947336fbacf4736c88edf
; Z3 version (according to F*): 5.0.0

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
;(set-option :smt.arith.solver 2)


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

(declare-fun FStar.Math.Euclid.divides (Term Term) Term)
(declare-fun FStar.Math.Euclid.egcd (Term Term Term Term Term Term Term Term) Term)
; Fuel-instrumented function name
(declare-fun
 FStar.Math.Euclid.egcd.fuel_instrumented
 (Fuel Term Term Term Term Term Term Term Term)
 Term)
(declare-fun FStar.Math.Euclid.is_gcd (Term Term Term) Term)
; Constructor
(declare-fun
 FStar.Pervasives.Native.Mktuple3
 (Universe Universe Universe Term Term Term Term Term Term)
 Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple3_@0 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple3_@1 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple3_@2 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple3_@_1 (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple3_@_2 (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple3_@_3 (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple3_@_a (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple3_@_b (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple3_@_c (Term) Term)
; Constructor
(declare-fun FStar.Pervasives.Native.tuple3 (Universe Universe Universe Term Term Term) Term)
; token
(declare-fun FStar.Pervasives.Native.tuple3@tok (Universe Universe Universe) Term)
(declare-fun FStar.Range.range (Dummy_sort) Term)
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
(declare-fun Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29 (Term Term) Term)
(declare-fun Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f (Term) Term)
(declare-fun Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521 (Term Term) Term)
(declare-fun Prims.b2t (Term) Term)
(declare-fun Prims.bool () Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.guard_free (Term) Term)
(declare-fun Prims.hasEq (Universe Term) Term)
(declare-fun Prims.int () Term)
(declare-fun Prims.l_Exists (Universe Term Term) Term)
(declare-fun Prims.l_Forall (Universe Term Term) Term)
(declare-fun Prims.l_True () Term)
(declare-fun Prims.l_and (Term Term) Term)
(declare-fun Prims.l_imp (Term Term) Term)
(declare-fun Prims.nonzero () Term)
(declare-fun Prims.op_Addition (Term Term) Term)
(declare-fun Prims.op_Division (Term Term) Term)
(declare-fun Prims.op_Equality (Term Term Term) Term)
(declare-fun Prims.op_GreaterThanOrEqual (Term Term) Term)
(declare-fun Prims.op_Minus (Term) Term)
(declare-fun Prims.op_Star (Term Term) Term)
(declare-fun Prims.op_Subtraction (Term Term) Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_post (Universe Term) Term)
(declare-fun Prims.pure_post_ (Universe Term Term) Term)
(declare-fun Prims.pure_wp (Universe Term) Term)
(declare-fun Prims.unit () Term)
(declare-fun Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16 (Term Term Term) Term)
(declare-fun Tm_abs_b2c7e29a54bff76378d49ec8780b76c8 (Term Term) Term)
(declare-fun Tm_arrow_3a9c22ddc54716caa0276c05e792d97e () Term)
(declare-fun Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 (Term Universe) Term)
(declare-fun Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 (Universe Term Term) Term)
(declare-fun Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f () Term)
(declare-fun Tm_refine_678fb0cfd8e24ebf946515ca269d757b (Term Term) Term)
(declare-fun Tm_refine_9d6af3f3535473623f7aec2f0501897f () Term)
(declare-fun Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 (Universe Term Term) Term)
; Discriminator definition
(define-fun is-FStar.Pervasives.Native.Mktuple3 ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 153)
  (=
   __@x0
   (FStar.Pervasives.Native.Mktuple3
    (FStar.Pervasives.Native.Mktuple3_@0 __@x0)
    (FStar.Pervasives.Native.Mktuple3_@1 __@x0)
    (FStar.Pervasives.Native.Mktuple3_@2 __@x0)
    (FStar.Pervasives.Native.Mktuple3_@_a __@x0)
    (FStar.Pervasives.Native.Mktuple3_@_b __@x0)
    (FStar.Pervasives.Native.Mktuple3_@_c __@x0)
    (FStar.Pervasives.Native.Mktuple3_@_1 __@x0)
    (FStar.Pervasives.Native.Mktuple3_@_2 __@x0)
    (FStar.Pervasives.Native.Mktuple3_@_3 __@x0)))))
; Discriminator definition
(define-fun is-FStar.Stubs.Tactics.Common.NotAListLiteral ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 102) (= __@x0 FStar.Stubs.Tactics.Common.NotAListLiteral)))
; Discriminator definition
(define-fun is-FStar.Stubs.Tactics.Common.SKIP ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 117) (= __@x0 FStar.Stubs.Tactics.Common.SKIP)))
; Discriminator definition
(define-fun is-FStar.Stubs.Tactics.Common.Stop ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 121) (= __@x0 FStar.Stubs.Tactics.Common.Stop)))
; Correspondence of recursive function to instrumented version
;;; Fact-ids: Name FStar.Math.Euclid.egcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fst(156,8-156,12); use=FStar.Math.Euclid.fst(156,8-156,12)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (FStar.Math.Euclid.egcd @x0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)
     (FStar.Math.Euclid.egcd.fuel_instrumented MaxFuel @x0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :pattern ((FStar.Math.Euclid.egcd @x0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid @fuel_correspondence_FStar.Math.Euclid.egcd.fuel_instrumented))
  :named @fuel_correspondence_FStar.Math.Euclid.egcd.fuel_instrumented))
; Fuel irrelevance
;;; Fact-ids: Name FStar.Math.Euclid.egcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fst(156,8-156,12); use=FStar.Math.Euclid.fst(156,8-156,12)
  (forall
    ((@u0 Fuel)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Math.Euclid.egcd.fuel_instrumented (SFuel @u0) @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)
     (FStar.Math.Euclid.egcd.fuel_instrumented ZFuel @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :pattern
     ((FStar.Math.Euclid.egcd.fuel_instrumented (SFuel @u0) @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid @fuel_irrelevance_FStar.Math.Euclid.egcd.fuel_instrumented))
  :named @fuel_irrelevance_FStar.Math.Euclid.egcd.fuel_instrumented))
; interpretation_Tm_arrow_3a9c22ddc54716caa0276c05e792d97e
;;; Fact-ids: Name FStar.Math.Euclid.divides; Namespace FStar.Math.Euclid
(assert
 (! ;; def=Prims.fst(477,69-508,16); use=FStar.Math.Euclid.fsti(11,38-11,39)
  (forall ((@x0 Term))
   (! (iff
     (HasTypeZ @x0 Tm_arrow_3a9c22ddc54716caa0276c05e792d97e)
     (and
      ;; def=Prims.fst(477,69-508,16); use=FStar.Math.Euclid.fsti(11,38-11,39)
      (forall ((@x1 Term))
       (! (implies (HasType @x1 Prims.int) (HasType (ApplyTT @x0 @x1) Prims.prop))
        :pattern ((ApplyTT @x0 @x1))
        :qid FStar.Math.Euclid_interpretation_Tm_arrow_3a9c22ddc54716caa0276c05e792d97e.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 Tm_arrow_3a9c22ddc54716caa0276c05e792d97e))
    :qid FStar.Math.Euclid_interpretation_Tm_arrow_3a9c22ddc54716caa0276c05e792d97e))
  :named FStar.Math.Euclid_interpretation_Tm_arrow_3a9c22ddc54716caa0276c05e792d97e))
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
; Assumption: FStar.Pervasives.Native.tuple3__uu___haseq
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3__uu___haseq; Namespace FStar.Pervasives.Native
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe))
   (! (forall ((@x3 Term) (@x4 Term) (@x5 Term))
     (! (implies
       (and
        (HasType @x3 (Tm_type @u0))
        (HasType @x4 (Tm_type @u1))
        (HasType @x5 (Tm_type @u2))
        (Valid (Prims.hasEq @u0 @x3))
        (Valid (Prims.hasEq @u1 @x4))
        (Valid (Prims.hasEq @u2 @x5)))
       (Valid
        (Prims.hasEq
         (U_max (U_max @u0 @u2) @u1)
         (FStar.Pervasives.Native.tuple3 @u0 @u1 @u2 @x3 @x4 @x5))))
      :pattern
       ((Prims.hasEq
         (U_max (U_max @u0 @u2) @u1)
         (FStar.Pervasives.Native.tuple3 @u0 @u1 @u2 @x3 @x4 @x5)))
      :qid assumption_FStar.Pervasives.Native.tuple3__uu___haseq.1))
    :qid assumption_FStar.Pervasives.Native.tuple3__uu___haseq))
  :named assumption_FStar.Pervasives.Native.tuple3__uu___haseq))
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
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (= 153 (Term_constr_id (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)))
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid constructor_distinct_FStar.Pervasives.Native.Mktuple3))
  :named constructor_distinct_FStar.Pervasives.Native.Mktuple3))
; Constructor distinct
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,5-60,11); use=FStar.Pervasives.Native.fst(60,5-60,11)
  (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (= 146 (Term_constr_id (FStar.Pervasives.Native.tuple3 @u0 @u1 @u2 @x3 @x4 @x5)))
    :pattern ((FStar.Pervasives.Native.tuple3 @u0 @u1 @u2 @x3 @x4 @x5))
    :qid constructor_distinct_FStar.Pervasives.Native.tuple3))
  :named constructor_distinct_FStar.Pervasives.Native.tuple3))
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
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@u2 Universe)
     (@u3 Universe)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term)
     (@x9 Term)
     (@x10 Term)
     (@x11 Term)
     (@x12 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Native.Mktuple3 @u1 @u2 @u3 @x4 @x5 @x6 @x7 @x8 @x9)
      (FStar.Pervasives.Native.tuple3 @u1 @u2 @u3 @x10 @x11 @x12))
     (and
      (HasTypeFuel @u0 @x10 (Tm_type @u1))
      (HasTypeFuel @u0 @x11 (Tm_type @u2))
      (HasTypeFuel @u0 @x12 (Tm_type @u3))
      (HasTypeFuel @u0 @x7 @x10)
      (HasTypeFuel @u0 @x8 @x11)
      (HasTypeFuel @u0 @x9 @x12)))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Native.Mktuple3 @u1 @u2 @u3 @x4 @x5 @x6 @x7 @x8 @x9)
       (FStar.Pervasives.Native.tuple3 @u1 @u2 @u3 @x10 @x11 @x12)))
    :qid data_elim_FStar.Pervasives.Native.Mktuple3))
  :named data_elim_FStar.Pervasives.Native.Mktuple3))
; data constructor typing intro
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@u2 Universe)
     (@u3 Universe)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term)
     (@x9 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x4 (Tm_type @u1))
      (HasTypeFuel @u0 @x5 (Tm_type @u2))
      (HasTypeFuel @u0 @x6 (Tm_type @u3))
      (HasTypeFuel @u0 @x7 @x4)
      (HasTypeFuel @u0 @x8 @x5)
      (HasTypeFuel @u0 @x9 @x6))
     (HasTypeFuel
      @u0
      (FStar.Pervasives.Native.Mktuple3 @u1 @u2 @u3 @x4 @x5 @x6 @x7 @x8 @x9)
      (FStar.Pervasives.Native.tuple3 @u1 @u2 @u3 @x4 @x5 @x6)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Pervasives.Native.Mktuple3 @u1 @u2 @u3 @x4 @x5 @x6 @x7 @x8 @x9)
       (FStar.Pervasives.Native.tuple3 @u1 @u2 @u3 @x4 @x5 @x6)))
    :qid data_typing_intro_FStar.Pervasives.Native.Mktuple3@tok))
  :named data_typing_intro_FStar.Pervasives.Native.Mktuple3@tok))
; Equation for FStar.Math.Euclid.divides
;;; Fact-ids: Name FStar.Math.Euclid.divides; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(11,4-11,11); use=FStar.Math.Euclid.fsti(11,4-11,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.Math.Euclid.divides @x0 @x1)
     (Prims.l_Exists U_zero Prims.int (Tm_abs_b2c7e29a54bff76378d49ec8780b76c8 @x1 @x0)))
    :pattern ((FStar.Math.Euclid.divides @x0 @x1))
    :qid defn_equation_FStar.Math.Euclid.divides))
  :named defn_equation_FStar.Math.Euclid.divides))
; Equation for FStar.Math.Euclid.is_gcd
;;; Fact-ids: Name FStar.Math.Euclid.is_gcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(54,4-54,10); use=FStar.Math.Euclid.fsti(54,4-54,10)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Math.Euclid.is_gcd @x0 @x1 @x2)
     (Prims.l_and
      (Prims.l_and (FStar.Math.Euclid.divides @x2 @x0) (FStar.Math.Euclid.divides @x2 @x1))
      (Prims.l_Forall U_zero Prims.int (Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16 @x0 @x1 @x2))))
    :pattern ((FStar.Math.Euclid.is_gcd @x0 @x1 @x2))
    :qid defn_equation_FStar.Math.Euclid.is_gcd))
  :named defn_equation_FStar.Math.Euclid.is_gcd))
; Equation for FStar.Math.Euclid.divides
;;; Fact-ids: Name FStar.Math.Euclid.divides; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(11,4-11,11); use=FStar.Math.Euclid.fsti(11,4-11,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (Valid (FStar.Math.Euclid.divides @x0 @x1))
     ;; def=FStar.Math.Euclid.fsti(11,31-11,50); use=FStar.Math.Euclid.fsti(11,31-11,50)
     (exists ((@x2 Term))
      (! (and
        (HasType @x2 Prims.int)
        ;; def=FStar.Math.Euclid.fsti(11,41-11,50); use=FStar.Math.Euclid.fsti(11,41-11,50)
        (= @x1 (Prims.op_Star @x2 @x0)))
       :qid equation_FStar.Math.Euclid.divides.1)))
    :pattern ((FStar.Math.Euclid.divides @x0 @x1))
    :qid equation_FStar.Math.Euclid.divides))
  :named equation_FStar.Math.Euclid.divides))
; Equation for FStar.Math.Euclid.is_gcd
;;; Fact-ids: Name FStar.Math.Euclid.is_gcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(54,4-54,10); use=FStar.Math.Euclid.fsti(54,4-54,10)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (Valid (FStar.Math.Euclid.is_gcd @x0 @x1 @x2))
     ;; def=FStar.Math.Euclid.fsti(55,2-57,64); use=FStar.Math.Euclid.fsti(55,2-57,64)
     (and
      ;; def=FStar.Math.Euclid.fsti(55,2-55,15); use=FStar.Math.Euclid.fsti(55,2-55,15)
      (Valid
       ;; def=FStar.Math.Euclid.fsti(55,2-55,15); use=FStar.Math.Euclid.fsti(55,2-55,15)
       (FStar.Math.Euclid.divides @x2 @x0))
      ;; def=FStar.Math.Euclid.fsti(56,2-56,15); use=FStar.Math.Euclid.fsti(56,2-56,15)
      (Valid
       ;; def=FStar.Math.Euclid.fsti(56,2-56,15); use=FStar.Math.Euclid.fsti(56,2-56,15)
       (FStar.Math.Euclid.divides @x2 @x1))
      ;; def=FStar.Math.Euclid.fsti(57,2-57,64); use=FStar.Math.Euclid.fsti(57,2-57,64)
      (forall ((@x3 Term))
       (! (implies
         (and
          (HasType @x3 Prims.int)
          ;; def=FStar.Math.Euclid.fsti(57,14-57,27); use=FStar.Math.Euclid.fsti(57,14-57,27)
          (Valid
           ;; def=FStar.Math.Euclid.fsti(57,14-57,27); use=FStar.Math.Euclid.fsti(57,14-57,27)
           (FStar.Math.Euclid.divides @x3 @x0))
          ;; def=FStar.Math.Euclid.fsti(57,31-57,44); use=FStar.Math.Euclid.fsti(57,31-57,44)
          (Valid
           ;; def=FStar.Math.Euclid.fsti(57,31-57,44); use=FStar.Math.Euclid.fsti(57,31-57,44)
           (FStar.Math.Euclid.divides @x3 @x1)))
         ;; def=FStar.Math.Euclid.fsti(57,50-57,63); use=FStar.Math.Euclid.fsti(57,50-57,63)
         (Valid
          ;; def=FStar.Math.Euclid.fsti(57,50-57,63); use=FStar.Math.Euclid.fsti(57,50-57,63)
          (FStar.Math.Euclid.divides @x3 @x2)))
        :qid equation_FStar.Math.Euclid.is_gcd.1))))
    :pattern ((FStar.Math.Euclid.is_gcd @x0 @x1 @x2))
    :qid equation_FStar.Math.Euclid.is_gcd))
  :named equation_FStar.Math.Euclid.is_gcd))
; Equation for Prims.eqtype
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (= Prims.eqtype Tm_refine_9d6af3f3535473623f7aec2f0501897f) :named equation_Prims.eqtype))
; Equation for Prims.nonzero
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (= Prims.nonzero Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f) :named equation_Prims.nonzero))
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
; Equation for fuel-instrumented recursive function: FStar.Math.Euclid.egcd
;;; Fact-ids: Name FStar.Math.Euclid.egcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fst(156,8-156,12); use=FStar.Math.Euclid.fst(156,8-156,12)
  (forall
    ((@u0 Fuel)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (implies
     (and
      (HasType @x1 Prims.int)
      (HasType @x2 Prims.int)
      (HasType @x3 Prims.int)
      (HasType @x4 Prims.int)
      (HasType @x5 Prims.int)
      (HasType @x6 Prims.int)
      (HasType @x7 Prims.int)
      (HasType @x8 Prims.int)
      ;; def=FStar.Math.Euclid.fst(145,12-145,19); use=FStar.Math.Euclid.fst(156,8-156,12)
      (>= (BoxInt_proj_0 @x8) (BoxInt_proj_0 (BoxInt 0)))
      ;; def=FStar.Math.Euclid.fst(146,12-146,32); use=FStar.Math.Euclid.fst(156,8-156,12)
      (= (Prims.op_Addition (Prims.op_Star @x3 @x1) (Prims.op_Star @x4 @x2)) @x5)
      ;; def=FStar.Math.Euclid.fst(147,12-147,32); use=FStar.Math.Euclid.fst(156,8-156,12)
      (= (Prims.op_Addition (Prims.op_Star @x6 @x1) (Prims.op_Star @x7 @x2)) @x8)
      ;; def=FStar.Math.Euclid.fst(148,12-148,55); use=FStar.Math.Euclid.fst(156,8-156,12)
      (forall ((@x9 Term))
       (! (implies
         (and
          (HasType @x9 Prims.int)
          ;; def=FStar.Math.Euclid.fst(148,23-148,37); use=FStar.Math.Euclid.fst(156,8-156,12)
          (Valid
           ;; def=FStar.Math.Euclid.fst(148,23-148,37); use=FStar.Math.Euclid.fst(156,8-156,12)
           (FStar.Math.Euclid.is_gcd @x5 @x8 @x9)))
         ;; def=FStar.Math.Euclid.fst(148,42-148,54); use=FStar.Math.Euclid.fst(156,8-156,12)
         (Valid
          ;; def=FStar.Math.Euclid.fst(148,42-148,54); use=FStar.Math.Euclid.fst(156,8-156,12)
          (FStar.Math.Euclid.is_gcd @x1 @x2 @x9)))
        :qid equation_with_fuel_FStar.Math.Euclid.egcd.fuel_instrumented.1)))
     (=
      (FStar.Math.Euclid.egcd.fuel_instrumented (SFuel @u0) @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)
      (let ((@lb9 (Prims.op_Equality Prims.int @x8 (BoxInt 0))))
       (ite
        (= @lb9 (BoxBool true))
        (FStar.Pervasives.Native.Mktuple3
         U_zero
         U_zero
         U_zero
         Prims.int
         Prims.int
         Prims.int
         @x3
         @x4
         @x5)
        (FStar.Math.Euclid.egcd.fuel_instrumented
         @u0
         @x1
         @x2
         @x6
         @x7
         @x8
         (Prims.op_Subtraction @x3 (Prims.op_Star (Prims.op_Division @x5 @x8) @x6))
         (Prims.op_Subtraction @x4 (Prims.op_Star (Prims.op_Division @x5 @x8) @x7))
         (Prims.op_Subtraction @x5 (Prims.op_Star (Prims.op_Division @x5 @x8) @x8)))))))
    :weight 0
    :pattern
     ((FStar.Math.Euclid.egcd.fuel_instrumented (SFuel @u0) @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid equation_with_fuel_FStar.Math.Euclid.egcd.fuel_instrumented))
  :named equation_with_fuel_FStar.Math.Euclid.egcd.fuel_instrumented))
; fresh token
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe))
   (! (= 147 (Term_constr_id (FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2)))
    :pattern ((FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2))
    :qid fresh_token_FStar.Pervasives.Native.tuple3@tok))
  :named fresh_token_FStar.Pervasives.Native.tuple3@tok))
; inversion axiom
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,5-60,11); use=FStar.Pervasives.Native.fst(60,5-60,11)
  (forall
    ((@u0 Fuel)
     (@x1 Term)
     (@u2 Universe)
     (@u3 Universe)
     (@u4 Universe)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (FStar.Pervasives.Native.tuple3 @u2 @u3 @u4 @x5 @x6 @x7))
     (and
      (is-FStar.Pervasives.Native.Mktuple3 @x1)
      (= @u2 (FStar.Pervasives.Native.Mktuple3_@0 @x1))
      (= @u3 (FStar.Pervasives.Native.Mktuple3_@1 @x1))
      (= @u4 (FStar.Pervasives.Native.Mktuple3_@2 @x1))
      (= @x5 (FStar.Pervasives.Native.Mktuple3_@_a @x1))
      (= @x6 (FStar.Pervasives.Native.Mktuple3_@_b @x1))
      (= @x7 (FStar.Pervasives.Native.Mktuple3_@_c @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (FStar.Pervasives.Native.tuple3 @u2 @u3 @u4 @x5 @x6 @x7)))
    :qid fuel_guarded_inversion_FStar.Pervasives.Native.tuple3))
  :named fuel_guarded_inversion_FStar.Pervasives.Native.tuple3))
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
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (HasType Prims.nonzero (Tm_type U_zero)) :named function_token_typing_Prims.nonzero))
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
; haseq for Tm_refine_678fb0cfd8e24ebf946515ca269d757b
;;; Fact-ids: Name FStar.Math.Euclid.egcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fst(144,44-144,61); use=FStar.Math.Euclid.fst(156,8-156,12)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid
      (Prims.hasEq
       (U_max (U_max U_zero U_zero) U_zero)
       (Tm_refine_678fb0cfd8e24ebf946515ca269d757b @x0 @x1)))
     (Valid
      (Prims.hasEq
       (U_max (U_max U_zero U_zero) U_zero)
       (FStar.Pervasives.Native.tuple3 U_zero U_zero U_zero Prims.int Prims.int Prims.int))))
    :pattern
     ((Valid
       (Prims.hasEq
        (U_max (U_max U_zero U_zero) U_zero)
        (Tm_refine_678fb0cfd8e24ebf946515ca269d757b @x0 @x1))))
    :qid haseqTm_refine_678fb0cfd8e24ebf946515ca269d757b))
  :named haseqTm_refine_678fb0cfd8e24ebf946515ca269d757b))
; haseq for Tm_refine_9d6af3f3535473623f7aec2f0501897f
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq (U_succ U_zero) Tm_refine_9d6af3f3535473623f7aec2f0501897f))
   (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
  :named haseqTm_refine_9d6af3f3535473623f7aec2f0501897f))
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
; interpretation_Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16
;;; Fact-ids: Name FStar.Math.Euclid.is_gcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(57,2-57,64); use=FStar.Math.Euclid.fsti(57,2-57,64)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (ApplyTT (Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16 @x1 @x2 @x3) @x0)
     (Prims.l_imp
      (Prims.l_and (FStar.Math.Euclid.divides @x0 @x1) (FStar.Math.Euclid.divides @x0 @x2))
      (FStar.Math.Euclid.divides @x0 @x3)))
    :pattern ((ApplyTT (Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16 @x1 @x2 @x3) @x0))
    :qid interpretation_Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16))
  :named interpretation_Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16))
; interpretation_Tm_abs_b2c7e29a54bff76378d49ec8780b76c8
;;; Fact-ids: Name FStar.Math.Euclid.divides; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(11,31-11,50); use=FStar.Math.Euclid.fsti(11,31-11,50)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (ApplyTT (Tm_abs_b2c7e29a54bff76378d49ec8780b76c8 @x1 @x2) @x0)
     (Prims.b2t (Prims.op_Equality Prims.int @x1 (Prims.op_Star @x0 @x2))))
    :pattern ((ApplyTT (Tm_abs_b2c7e29a54bff76378d49ec8780b76c8 @x1 @x2) @x0))
    :qid interpretation_Tm_abs_b2c7e29a54bff76378d49ec8780b76c8))
  :named interpretation_Tm_abs_b2c7e29a54bff76378d49ec8780b76c8))
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! (and
   ;; def=FStar.Pervasives.Native.fst(60,5-60,11); use=FStar.Pervasives.Native.fst(60,5-60,11)
   (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe))
    (! (IsTotFun (FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2))
     :pattern ((FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2))
     :qid kinding_FStar.Pervasives.Native.tuple3@tok))
   ;; def=FStar.Pervasives.Native.fst(60,5-60,11); use=FStar.Pervasives.Native.fst(60,5-60,11)
   (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe) (@x3 Term))
    (! (IsTotFun (ApplyTT (FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2) @x3))
     :pattern ((ApplyTT (FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2) @x3))
     :qid kinding_FStar.Pervasives.Native.tuple3@tok.1))
   ;; def=FStar.Pervasives.Native.fst(60,5-60,11); use=FStar.Pervasives.Native.fst(60,5-60,11)
   (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term))
    (! (IsTotFun (ApplyTT (ApplyTT (FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2) @x3) @x4))
     :pattern ((ApplyTT (ApplyTT (FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2) @x3) @x4))
     :qid kinding_FStar.Pervasives.Native.tuple3@tok.2))
   ;; def=FStar.Pervasives.Native.fst(60,5-60,11); use=FStar.Pervasives.Native.fst(60,5-60,11)
   (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
    (! (implies
      (and (HasType @x3 (Tm_type @u0)) (HasType @x4 (Tm_type @u1)) (HasType @x5 (Tm_type @u2)))
      (HasType
       (FStar.Pervasives.Native.tuple3 @u0 @u1 @u2 @x3 @x4 @x5)
       (Tm_type (U_max (U_max @u0 @u2) @u1))))
     :pattern ((FStar.Pervasives.Native.tuple3 @u0 @u1 @u2 @x3 @x4 @x5))
     :qid kinding_FStar.Pervasives.Native.tuple3@tok.3)))
  :named kinding_FStar.Pervasives.Native.tuple3@tok))
; kinding_Tm_arrow_3a9c22ddc54716caa0276c05e792d97e
;;; Fact-ids: Name FStar.Math.Euclid.divides; Namespace FStar.Math.Euclid
(assert
 (! (HasType Tm_arrow_3a9c22ddc54716caa0276c05e792d97e (Tm_type U_zero))
  :named kinding_Tm_arrow_3a9c22ddc54716caa0276c05e792d97e))
; kinding_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45
;;; Fact-ids: Name Prims.l_Forall; Namespace Prims
(assert
 (! ;; def=Prims.fst(264,22-264,73); use=Prims.fst(264,59-264,73)
  (forall ((@x0 Term) (@u1 Universe))
   (! (HasType (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1) (Tm_type @u1)))
    :qid kinding_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45))
  :named kinding_Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45))
; kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,56); use=Prims.fst(281,39-281,56)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u0 @x1 @x2) (Tm_type @u0))
    :pattern ((HasType (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u0 @x1 @x2) (Tm_type @u0)))
    :qid kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
  :named kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
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
;;; Fact-ids: Name FStar.Math.Euclid.is_gcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(57,2-57,64); use=FStar.Math.Euclid.fsti(57,2-57,64)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.l_Forall U_zero Prims.int (Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16 @x0 @x1 @x2)))
     ;; def=FStar.Math.Euclid.fsti(57,2-57,64); use=FStar.Math.Euclid.fsti(57,2-57,64)
     (forall ((@x3 Term))
      (! (implies
        (and
         (HasType @x3 Prims.int)
         ;; def=FStar.Math.Euclid.fsti(57,14-57,27); use=FStar.Math.Euclid.fsti(57,14-57,27)
         (Valid
          ;; def=FStar.Math.Euclid.fsti(57,14-57,27); use=FStar.Math.Euclid.fsti(57,14-57,27)
          (FStar.Math.Euclid.divides @x3 @x0))
         ;; def=FStar.Math.Euclid.fsti(57,31-57,44); use=FStar.Math.Euclid.fsti(57,31-57,44)
         (Valid
          ;; def=FStar.Math.Euclid.fsti(57,31-57,44); use=FStar.Math.Euclid.fsti(57,31-57,44)
          (FStar.Math.Euclid.divides @x3 @x1)))
        ;; def=FStar.Math.Euclid.fsti(57,50-57,63); use=FStar.Math.Euclid.fsti(57,50-57,63)
        (Valid
         ;; def=FStar.Math.Euclid.fsti(57,50-57,63); use=FStar.Math.Euclid.fsti(57,50-57,63)
         (FStar.Math.Euclid.divides @x3 @x2)))
       :qid l_quant_interp_360b3abe6acf5b69f6a2bdb94bdd8860.1)))
    :pattern
     ((Valid (Prims.l_Forall U_zero Prims.int (Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16 @x0 @x1 @x2))))
    :qid l_quant_interp_360b3abe6acf5b69f6a2bdb94bdd8860))
  :named l_quant_interp_360b3abe6acf5b69f6a2bdb94bdd8860))
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name FStar.Math.Euclid.divides; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(11,31-11,50); use=FStar.Math.Euclid.fsti(11,31-11,50)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.l_Exists U_zero Prims.int (Tm_abs_b2c7e29a54bff76378d49ec8780b76c8 @x0 @x1)))
     ;; def=FStar.Math.Euclid.fsti(11,31-11,50); use=FStar.Math.Euclid.fsti(11,31-11,50)
     (exists ((@x2 Term))
      (! (and
        (HasType @x2 Prims.int)
        ;; def=FStar.Math.Euclid.fsti(11,41-11,50); use=FStar.Math.Euclid.fsti(11,41-11,50)
        (= @x0 (Prims.op_Star @x2 @x1)))
       :qid l_quant_interp_b2ad115c370c22c125d3754b4fe55e4c.1)))
    :pattern
     ((Valid (Prims.l_Exists U_zero Prims.int (Tm_abs_b2c7e29a54bff76378d49ec8780b76c8 @x0 @x1))))
    :qid l_quant_interp_b2ad115c370c22c125d3754b4fe55e4c))
  :named l_quant_interp_b2ad115c370c22c125d3754b4fe55e4c))
; Lemma: FStar.Math.Euclid.divides_reflexive
;;; Fact-ids: Name FStar.Math.Euclid.divides_reflexive; Namespace FStar.Math.Euclid
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.int)
     ;; def=FStar.Math.Euclid.fsti(13,38-13,53); use=FStar.Math.Euclid.fst(30,4-30,21)
     (Valid
      ;; def=FStar.Math.Euclid.fsti(13,38-13,53); use=FStar.Math.Euclid.fst(30,4-30,21)
      (FStar.Math.Euclid.divides @x0 @x0)))
    :pattern ((FStar.Math.Euclid.divides @x0 @x0))
    :qid lemma_FStar.Math.Euclid.divides_reflexive))
  :named lemma_FStar.Math.Euclid.divides_reflexive))
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
;;; Fact-ids: Name Prims.op_Addition; Namespace Prims
(assert
 (! ;; def=Prims.fst(520,4-520,15); use=Prims.fst(520,4-520,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Addition @x0 @x1) (BoxInt (+ (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Addition @x0 @x1))
    :qid primitive_Prims.op_Addition))
  :named primitive_Prims.op_Addition))
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
;;; Fact-ids: Name Prims.op_Equality; Namespace Prims
(assert
 (! ;; def=Prims.fst(556,4-556,15); use=Prims.fst(556,4-556,15)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (Prims.op_Equality @x0 @x1 @x2) (BoxBool (= @x1 @x2)))
    :pattern ((Prims.op_Equality @x0 @x1 @x2))
    :qid primitive_Prims.op_Equality))
  :named primitive_Prims.op_Equality))
;;; Fact-ids: Name Prims.op_GreaterThanOrEqual; Namespace Prims
(assert
 (! ;; def=Prims.fst(544,4-544,25); use=Prims.fst(544,4-544,25)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (Prims.op_GreaterThanOrEqual @x0 @x1)
     (BoxBool (>= (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_GreaterThanOrEqual @x0 @x1))
    :qid primitive_Prims.op_GreaterThanOrEqual))
  :named primitive_Prims.op_GreaterThanOrEqual))
;;; Fact-ids: Name Prims.op_Minus; Namespace Prims
(assert
 (! ;; def=Prims.fst(526,4-526,12); use=Prims.fst(526,4-526,12)
  (forall ((@x0 Term))
   (! (= (Prims.op_Minus @x0) (BoxInt (- (BoxInt_proj_0 @x0))))
    :pattern ((Prims.op_Minus @x0))
    :qid primitive_Prims.op_Minus))
  :named primitive_Prims.op_Minus))
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
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple3_@0
      (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     @u0)
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple3_@0))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple3_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple3_@1
      (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     @u1)
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple3_@1))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple3_@1))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple3_@2
      (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     @u2)
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple3_@2))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple3_@2))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple3_@_1
      (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x6)
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple3_@_1))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple3_@_1))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple3_@_2
      (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x7)
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple3_@_2))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple3_@_2))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple3_@_3
      (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x8)
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple3_@_3))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple3_@_3))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple3_@_a
      (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x3)
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple3_@_a))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple3_@_a))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple3_@_b
      (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x4)
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple3_@_b))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple3_@_b))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Universe)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple3_@_c
      (FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x5)
    :pattern ((FStar.Pervasives.Native.Mktuple3 @u0 @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple3_@_c))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple3_@_c))
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
;;; Fact-ids: Name FStar.Math.Euclid.egcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fst(144,44-144,61); use=FStar.Math.Euclid.fst(156,8-156,12)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_678fb0cfd8e24ebf946515ca269d757b @x2 @x3))
     (and
      (HasTypeFuel
       @u0
       @x1
       (FStar.Pervasives.Native.tuple3 U_zero U_zero U_zero Prims.int Prims.int Prims.int))
      (let ((@lb4 @x1))
       ;; def=FStar.Math.Euclid.fst(149,29-149,62); use=FStar.Math.Euclid.fst(156,8-156,12)
       (and
        ;; def=FStar.Math.Euclid.fst(149,29-149,46); use=FStar.Math.Euclid.fst(156,8-156,12)
        (=
         (Prims.op_Addition
          (Prims.op_Star (FStar.Pervasives.Native.Mktuple3_@_1 @lb4) @x2)
          (Prims.op_Star (FStar.Pervasives.Native.Mktuple3_@_2 @lb4) @x3))
         (FStar.Pervasives.Native.Mktuple3_@_3 @lb4))
        ;; def=FStar.Math.Euclid.fst(149,50-149,62); use=FStar.Math.Euclid.fst(156,8-156,12)
        (Valid
         ;; def=FStar.Math.Euclid.fst(149,50-149,62); use=FStar.Math.Euclid.fst(156,8-156,12)
         (FStar.Math.Euclid.is_gcd @x2 @x3 (FStar.Pervasives.Native.Mktuple3_@_3 @lb4)))))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_678fb0cfd8e24ebf946515ca269d757b @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_678fb0cfd8e24ebf946515ca269d757b))
  :named refinement_interpretation_Tm_refine_678fb0cfd8e24ebf946515ca269d757b))
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
; refinement kinding
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (HasType Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
; refinement kinding
;;; Fact-ids: Name FStar.Math.Euclid.egcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fst(144,44-144,61); use=FStar.Math.Euclid.fst(156,8-156,12)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType
     (Tm_refine_678fb0cfd8e24ebf946515ca269d757b @x0 @x1)
     (Tm_type (U_max (U_max U_zero U_zero) U_zero)))
    :pattern
     ((HasType
       (Tm_refine_678fb0cfd8e24ebf946515ca269d757b @x0 @x1)
       (Tm_type (U_max (U_max U_zero U_zero) U_zero))))
    :qid refinement_kinding_Tm_refine_678fb0cfd8e24ebf946515ca269d757b))
  :named refinement_kinding_Tm_refine_678fb0cfd8e24ebf946515ca269d757b))
; refinement kinding
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Tm_refine_9d6af3f3535473623f7aec2f0501897f (Tm_type (U_succ U_zero)))
  :named refinement_kinding_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; refinement kinding
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=Prims.fst(281,39-281,48)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 @u0 @x1 @x2) (Tm_type @u0))
    :pattern ((HasType (Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 @u0 @x1 @x2) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81))
  :named refinement_kinding_Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81))
; subterm ordering
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,25-60,33); use=FStar.Pervasives.Native.fst(60,25-60,33)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@u2 Universe)
     (@u3 Universe)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term)
     (@x9 Term)
     (@x10 Term)
     (@x11 Term)
     (@x12 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Native.Mktuple3 @u1 @u2 @u3 @x4 @x5 @x6 @x7 @x8 @x9)
      (FStar.Pervasives.Native.tuple3 @u1 @u2 @u3 @x10 @x11 @x12))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x7
        (FStar.Pervasives.Native.Mktuple3 @u1 @u2 @u3 @x4 @x5 @x6 @x7 @x8 @x9)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x8
        (FStar.Pervasives.Native.Mktuple3 @u1 @u2 @u3 @x4 @x5 @x6 @x7 @x8 @x9)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x9
        (FStar.Pervasives.Native.Mktuple3 @u1 @u2 @u3 @x4 @x5 @x6 @x7 @x8 @x9)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Native.Mktuple3 @u1 @u2 @u3 @x4 @x5 @x6 @x7 @x8 @x9)
       (FStar.Pervasives.Native.tuple3 @u1 @u2 @u3 @x10 @x11 @x12)))
    :qid subterm_ordering_FStar.Pervasives.Native.Mktuple3))
  :named subterm_ordering_FStar.Pervasives.Native.Mktuple3))
; Typing correspondence of token to term
;;; Fact-ids: Name FStar.Math.Euclid.egcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fst(156,8-156,12); use=FStar.Math.Euclid.fst(156,8-156,12)
  (forall
    ((@u0 Fuel)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (implies
     (and
      (HasType @x1 Prims.int)
      (HasType @x2 Prims.int)
      (HasType @x3 Prims.int)
      (HasType @x4 Prims.int)
      (HasType @x5 Prims.int)
      (HasType @x6 Prims.int)
      (HasType @x7 Prims.int)
      (HasType @x8 Prims.int)
      ;; def=FStar.Math.Euclid.fst(145,12-145,19); use=FStar.Math.Euclid.fst(156,8-156,12)
      (>= (BoxInt_proj_0 @x8) (BoxInt_proj_0 (BoxInt 0)))
      ;; def=FStar.Math.Euclid.fst(146,12-146,32); use=FStar.Math.Euclid.fst(156,8-156,12)
      (= (Prims.op_Addition (Prims.op_Star @x3 @x1) (Prims.op_Star @x4 @x2)) @x5)
      ;; def=FStar.Math.Euclid.fst(147,12-147,32); use=FStar.Math.Euclid.fst(156,8-156,12)
      (= (Prims.op_Addition (Prims.op_Star @x6 @x1) (Prims.op_Star @x7 @x2)) @x8)
      ;; def=FStar.Math.Euclid.fst(148,12-148,55); use=FStar.Math.Euclid.fst(156,8-156,12)
      (forall ((@x9 Term))
       (! (implies
         (and
          (HasType @x9 Prims.int)
          ;; def=FStar.Math.Euclid.fst(148,23-148,37); use=FStar.Math.Euclid.fst(156,8-156,12)
          (Valid
           ;; def=FStar.Math.Euclid.fst(148,23-148,37); use=FStar.Math.Euclid.fst(156,8-156,12)
           (FStar.Math.Euclid.is_gcd @x5 @x8 @x9)))
         ;; def=FStar.Math.Euclid.fst(148,42-148,54); use=FStar.Math.Euclid.fst(156,8-156,12)
         (Valid
          ;; def=FStar.Math.Euclid.fst(148,42-148,54); use=FStar.Math.Euclid.fst(156,8-156,12)
          (FStar.Math.Euclid.is_gcd @x1 @x2 @x9)))
        :qid token_correspondence_FStar.Math.Euclid.egcd.fuel_instrumented.1)))
     (HasType
      (FStar.Math.Euclid.egcd.fuel_instrumented @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)
      (Tm_refine_678fb0cfd8e24ebf946515ca269d757b @x1 @x2)))
    :pattern ((FStar.Math.Euclid.egcd.fuel_instrumented @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid token_correspondence_FStar.Math.Euclid.egcd.fuel_instrumented))
  :named token_correspondence_FStar.Math.Euclid.egcd.fuel_instrumented))
; name-token correspondence
;;; Fact-ids: Name FStar.Pervasives.Native.tuple3; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple3; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(60,5-60,11); use=FStar.Pervasives.Native.fst(60,5-60,11)
  (forall ((@u0 Universe) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (ApplyTT (ApplyTT (ApplyTT (FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2) @x3) @x4) @x5)
     (FStar.Pervasives.Native.tuple3 @u0 @u1 @u2 @x3 @x4 @x5))
    :pattern
     ((ApplyTT (ApplyTT (ApplyTT (FStar.Pervasives.Native.tuple3@tok @u0 @u1 @u2) @x3) @x4) @x5))
    :pattern ((FStar.Pervasives.Native.tuple3 @u0 @u1 @u2 @x3 @x4 @x5))
    :qid token_correspondence_FStar.Pervasives.Native.tuple3@tok))
  :named token_correspondence_FStar.Pervasives.Native.tuple3@tok))
; True interpretation
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert (! (Valid Prims.l_True) :named true_interp))
; free var typing
;;; Fact-ids: Name FStar.Math.Euclid.divides; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(11,4-11,11); use=FStar.Math.Euclid.fsti(11,4-11,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (FStar.Math.Euclid.divides @x0 @x1) Prims.prop))
    :pattern ((FStar.Math.Euclid.divides @x0 @x1))
    :qid typing_FStar.Math.Euclid.divides))
  :named typing_FStar.Math.Euclid.divides))
; free var typing
;;; Fact-ids: Name FStar.Math.Euclid.egcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fst(156,8-156,12); use=FStar.Math.Euclid.fst(156,8-156,12)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (implies
     (and
      ;; def=FStar.Math.Euclid.fst(145,12-145,19); use=FStar.Math.Euclid.fst(156,8-156,12)
      (>= (BoxInt_proj_0 @x7) (BoxInt_proj_0 (BoxInt 0)))
      ;; def=FStar.Math.Euclid.fst(146,12-146,32); use=FStar.Math.Euclid.fst(156,8-156,12)
      (= (Prims.op_Addition (Prims.op_Star @x2 @x0) (Prims.op_Star @x3 @x1)) @x4)
      ;; def=FStar.Math.Euclid.fst(147,12-147,32); use=FStar.Math.Euclid.fst(156,8-156,12)
      (= (Prims.op_Addition (Prims.op_Star @x5 @x0) (Prims.op_Star @x6 @x1)) @x7)
      ;; def=FStar.Math.Euclid.fst(148,12-148,55); use=FStar.Math.Euclid.fst(156,8-156,12)
      (forall ((@x8 Term))
       (! (implies
         (and
          (HasType @x8 Prims.int)
          ;; def=FStar.Math.Euclid.fst(148,23-148,37); use=FStar.Math.Euclid.fst(156,8-156,12)
          (Valid
           ;; def=FStar.Math.Euclid.fst(148,23-148,37); use=FStar.Math.Euclid.fst(156,8-156,12)
           (FStar.Math.Euclid.is_gcd @x4 @x7 @x8)))
         ;; def=FStar.Math.Euclid.fst(148,42-148,54); use=FStar.Math.Euclid.fst(156,8-156,12)
         (Valid
          ;; def=FStar.Math.Euclid.fst(148,42-148,54); use=FStar.Math.Euclid.fst(156,8-156,12)
          (FStar.Math.Euclid.is_gcd @x0 @x1 @x8)))
        :qid typing_FStar.Math.Euclid.egcd.1))
      (HasType @x0 Prims.int)
      (HasType @x1 Prims.int)
      (HasType @x2 Prims.int)
      (HasType @x3 Prims.int)
      (HasType @x4 Prims.int)
      (HasType @x5 Prims.int)
      (HasType @x6 Prims.int)
      (HasType @x7 Prims.int))
     (HasType
      (FStar.Math.Euclid.egcd @x0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)
      (Tm_refine_678fb0cfd8e24ebf946515ca269d757b @x0 @x1)))
    :pattern ((FStar.Math.Euclid.egcd @x0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid typing_FStar.Math.Euclid.egcd))
  :named typing_FStar.Math.Euclid.egcd))
; free var typing
;;; Fact-ids: Name FStar.Math.Euclid.is_gcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(54,4-54,10); use=FStar.Math.Euclid.fsti(54,4-54,10)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int) (HasType @x2 Prims.int))
     (HasType (FStar.Math.Euclid.is_gcd @x0 @x1 @x2) Prims.prop))
    :pattern ((FStar.Math.Euclid.is_gcd @x0 @x1 @x2))
    :qid typing_FStar.Math.Euclid.is_gcd))
  :named typing_FStar.Math.Euclid.is_gcd))
; free var typing
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (HasType Prims.bool Prims.eqtype) :named typing_Prims.bool))
; free var typing
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named typing_Prims.eqtype))
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
;;; Fact-ids: Name Prims.op_Equality; Namespace Prims
(assert
 (! ;; def=Prims.fst(556,4-556,15); use=Prims.fst(556,4-556,15)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.eqtype) (HasType @x1 @x0) (HasType @x2 @x0))
     (HasType (Prims.op_Equality @x0 @x1 @x2) Prims.bool))
    :pattern ((Prims.op_Equality @x0 @x1 @x2))
    :qid typing_Prims.op_Equality))
  :named typing_Prims.op_Equality))
; free var typing
;;; Fact-ids: Name Prims.op_GreaterThanOrEqual; Namespace Prims
(assert
 (! ;; def=Prims.fst(544,4-544,25); use=Prims.fst(544,4-544,25)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_GreaterThanOrEqual @x0 @x1) Prims.bool))
    :pattern ((Prims.op_GreaterThanOrEqual @x0 @x1))
    :qid typing_Prims.op_GreaterThanOrEqual))
  :named typing_Prims.op_GreaterThanOrEqual))
; free var typing
;;; Fact-ids: Name Prims.op_Minus; Namespace Prims
(assert
 (! ;; def=Prims.fst(526,4-526,12); use=Prims.fst(526,4-526,12)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.int) (HasType (Prims.op_Minus @x0) Prims.int))
    :pattern ((Prims.op_Minus @x0))
    :qid typing_Prims.op_Minus))
  :named typing_Prims.op_Minus))
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
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (HasType Prims.unit Prims.eqtype) :named typing_Prims.unit))
; typing_Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16
;;; Fact-ids: Name FStar.Math.Euclid.is_gcd; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(57,2-57,64); use=FStar.Math.Euclid.fsti(57,2-57,64)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (HasType
     (Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16 @x0 @x1 @x2)
     Tm_arrow_3a9c22ddc54716caa0276c05e792d97e)
    :pattern ((Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16 @x0 @x1 @x2))
    :qid typing_Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16))
  :named typing_Tm_abs_9e03c5eb0211fb354c3dcdde66ceff16))
; typing_Tm_abs_b2c7e29a54bff76378d49ec8780b76c8
;;; Fact-ids: Name FStar.Math.Euclid.divides; Namespace FStar.Math.Euclid
(assert
 (! ;; def=FStar.Math.Euclid.fsti(11,31-11,50); use=FStar.Math.Euclid.fsti(11,31-11,50)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType
     (Tm_abs_b2c7e29a54bff76378d49ec8780b76c8 @x0 @x1)
     Tm_arrow_3a9c22ddc54716caa0276c05e792d97e)
    :pattern ((Tm_abs_b2c7e29a54bff76378d49ec8780b76c8 @x0 @x1))
    :qid typing_Tm_abs_b2c7e29a54bff76378d49ec8780b76c8))
  :named typing_Tm_abs_b2c7e29a54bff76378d49ec8780b76c8))
; Range_const typing
;;; Fact-ids: Name FStar.Range.range; Namespace FStar.Range
(assert
 (! (HasTypeZ (Range_const 1) (FStar.Range.range Dummy_value)) :named typing_range_const))
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
; Starting query at FStar.Math.Euclid.fst(192,2-204,3)
(declare-fun label_1 () Bool)
(declare-fun Tm_refine_d4cc7906977c75c5a24e6e95be7f228f (Term Term Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(409,36-409,97); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_d4cc7906977c75c5a24e6e95be7f228f @x0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_d4cc7906977c75c5a24e6e95be7f228f @x0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_d4cc7906977c75c5a24e6e95be7f228f))
  :named refinement_kinding_Tm_refine_d4cc7906977c75c5a24e6e95be7f228f))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(409,36-409,97); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_d4cc7906977c75c5a24e6e95be7f228f @x2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(409,36-409,97); use=FStar.Math.Euclid.fst(192,2-204,3)
      (forall ((@x5 Term))
       (! (implies
         (and
          (HasType
           @x5
           (FStar.Pervasives.Native.tuple3 U_zero U_zero U_zero Prims.int Prims.int Prims.int))
          (let ((@lb6 @x5))
           ;; def=FStar.Math.Euclid.fsti(98,29-98,62); use=FStar.Math.Euclid.fst(192,2-204,3)
           (and
            ;; def=FStar.Math.Euclid.fsti(98,29-98,46); use=FStar.Math.Euclid.fst(192,2-204,3)
            (=
             (Prims.op_Addition
              (Prims.op_Star (FStar.Pervasives.Native.Mktuple3_@_1 @lb6) @x2)
              (Prims.op_Star (FStar.Pervasives.Native.Mktuple3_@_2 @lb6) @x3))
             (FStar.Pervasives.Native.Mktuple3_@_3 @lb6))
            ;; def=FStar.Math.Euclid.fsti(98,50-98,62); use=FStar.Math.Euclid.fst(192,2-204,3)
            (Valid
             ;; def=FStar.Math.Euclid.fsti(98,50-98,62); use=FStar.Math.Euclid.fst(192,2-204,3)
             (FStar.Math.Euclid.is_gcd @x2 @x3 (FStar.Pervasives.Native.Mktuple3_@_3 @lb6))))))
         ;; def=Prims.fst(409,83-409,96); use=FStar.Math.Euclid.fst(192,2-204,3)
         (Valid
          ;; def=Prims.fst(409,83-409,96); use=FStar.Math.Euclid.fst(192,2-204,3)
          (ApplyTT @x4 @x5)))
        :qid refinement_interpretation_Tm_refine_d4cc7906977c75c5a24e6e95be7f228f.1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_d4cc7906977c75c5a24e6e95be7f228f @x2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_d4cc7906977c75c5a24e6e95be7f228f))
  :named refinement_interpretation_Tm_refine_d4cc7906977c75c5a24e6e95be7f228f))
; haseq for Tm_refine_d4cc7906977c75c5a24e6e95be7f228f
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(409,36-409,97); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_d4cc7906977c75c5a24e6e95be7f228f @x0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_d4cc7906977c75c5a24e6e95be7f228f @x0 @x1 @x2))))
    :qid haseqTm_refine_d4cc7906977c75c5a24e6e95be7f228f))
  :named haseqTm_refine_d4cc7906977c75c5a24e6e95be7f228f))
(declare-fun Tm_refine_7c254472969fde82fc5a525aed43ac7d (Term Term Term Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(368,29-368,90); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_7c254472969fde82fc5a525aed43ac7d @x0 @x1 @x2 @x3) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_7c254472969fde82fc5a525aed43ac7d @x0 @x1 @x2 @x3) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_7c254472969fde82fc5a525aed43ac7d))
  :named refinement_kinding_Tm_refine_7c254472969fde82fc5a525aed43ac7d))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(368,29-368,90); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_7c254472969fde82fc5a525aed43ac7d @x2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(368,29-368,90); use=FStar.Math.Euclid.fst(192,2-204,3)
      (forall ((@x6 Term))
       (! ;; def=Prims.fst(368,75-368,89); use=FStar.Math.Euclid.fst(192,2-204,3)
        (implies
         ;; def=Prims.fst(432,77-432,90); use=FStar.Math.Euclid.fst(192,2-204,3)
         (implies
          ;; def=FStar.Math.Euclid.fst(192,2-204,3); use=FStar.Math.Euclid.fst(192,2-204,3)
          (=
           @x6
           (let ((@lb7 (Prims.op_GreaterThanOrEqual @x3 (BoxInt 0))))
            (ite
             (= @lb7 (BoxBool true))
             (FStar.Math.Euclid.egcd @x2 @x3 (BoxInt 1) (BoxInt 0) @x2 (BoxInt 0) (BoxInt 1) @x3)
             (let
               ((@lb8
                 (FStar.Math.Euclid.egcd
                  @x2
                  @x3
                  (BoxInt 1)
                  (BoxInt 0)
                  @x2
                  (BoxInt 0)
                  (BoxInt -1)
                  (Prims.op_Minus @x3))))
              (FStar.Math.Euclid.egcd
               @x2
               @x3
               (BoxInt 1)
               (BoxInt 0)
               @x2
               (BoxInt 0)
               (BoxInt -1)
               (Prims.op_Minus @x3))))))
          ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
          (forall ((@x7 Term))
           (! (implies
             (and
              (HasType
               @x7
               (FStar.Pervasives.Native.tuple3 U_zero U_zero U_zero Prims.int Prims.int Prims.int))
              ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
              (= @x7 @x6))
             ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
             (Valid
              ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
              (ApplyTT @x4 @x7)))
            :qid refinement_interpretation_Tm_refine_7c254472969fde82fc5a525aed43ac7d.2)))
         ;; def=Prims.fst(368,86-368,89); use=FStar.Math.Euclid.fst(192,2-204,3)
         (Valid
          ;; def=Prims.fst(368,86-368,89); use=FStar.Math.Euclid.fst(192,2-204,3)
          (ApplyTT @x5 @x6)))
        :pattern ((ApplyTT @x5 @x6))
        :qid refinement_interpretation_Tm_refine_7c254472969fde82fc5a525aed43ac7d.1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_7c254472969fde82fc5a525aed43ac7d @x2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_7c254472969fde82fc5a525aed43ac7d))
  :named refinement_interpretation_Tm_refine_7c254472969fde82fc5a525aed43ac7d))
; haseq for Tm_refine_7c254472969fde82fc5a525aed43ac7d
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(368,29-368,90); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_7c254472969fde82fc5a525aed43ac7d @x0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid (Prims.hasEq U_zero (Tm_refine_7c254472969fde82fc5a525aed43ac7d @x0 @x1 @x2 @x3))))
    :qid haseqTm_refine_7c254472969fde82fc5a525aed43ac7d))
  :named haseqTm_refine_7c254472969fde82fc5a525aed43ac7d))
(declare-fun Tm_refine_c779995ca3160945f42d4e2f6549f3fc (Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(355,19-355,21); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_c779995ca3160945f42d4e2f6549f3fc @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_c779995ca3160945f42d4e2f6549f3fc @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_c779995ca3160945f42d4e2f6549f3fc))
  :named refinement_kinding_Tm_refine_c779995ca3160945f42d4e2f6549f3fc))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(355,19-355,21); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_c779995ca3160945f42d4e2f6549f3fc @x2))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(355,19-355,21); use=FStar.Math.Euclid.fst(192,2-204,3)
      (not
       ;; def=FStar.Math.Euclid.fst(192,5-192,11); use=FStar.Math.Euclid.fst(192,5-192,11)
       (= (Prims.op_GreaterThanOrEqual @x2 (BoxInt 0)) (BoxBool true)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_c779995ca3160945f42d4e2f6549f3fc @x2)))
    :qid refinement_interpretation_Tm_refine_c779995ca3160945f42d4e2f6549f3fc))
  :named refinement_interpretation_Tm_refine_c779995ca3160945f42d4e2f6549f3fc))
; haseq for Tm_refine_c779995ca3160945f42d4e2f6549f3fc
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(355,19-355,21); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_c779995ca3160945f42d4e2f6549f3fc @x0)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_c779995ca3160945f42d4e2f6549f3fc @x0))))
    :qid haseqTm_refine_c779995ca3160945f42d4e2f6549f3fc))
  :named haseqTm_refine_c779995ca3160945f42d4e2f6549f3fc))
(declare-fun Tm_refine_300ca30db2aa7c186f53ab8aedc80a04 (Term Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Math.Euclid.fst(192,5-204,3); use=FStar.Math.Euclid.fst(192,5-204,3)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_300ca30db2aa7c186f53ab8aedc80a04 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_300ca30db2aa7c186f53ab8aedc80a04 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_300ca30db2aa7c186f53ab8aedc80a04))
  :named refinement_kinding_Tm_refine_300ca30db2aa7c186f53ab8aedc80a04))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Math.Euclid.fst(192,5-204,3); use=FStar.Math.Euclid.fst(192,5-204,3)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_300ca30db2aa7c186f53ab8aedc80a04 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Math.Euclid.fst(192,5-204,3); use=FStar.Math.Euclid.fst(192,5-204,3)
      (= (Prims.op_GreaterThanOrEqual @x2 (BoxInt 0)) @x3)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_300ca30db2aa7c186f53ab8aedc80a04 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_300ca30db2aa7c186f53ab8aedc80a04))
  :named refinement_interpretation_Tm_refine_300ca30db2aa7c186f53ab8aedc80a04))
; haseq for Tm_refine_300ca30db2aa7c186f53ab8aedc80a04
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Math.Euclid.fst(192,5-204,3); use=FStar.Math.Euclid.fst(192,5-204,3)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_300ca30db2aa7c186f53ab8aedc80a04 @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_300ca30db2aa7c186f53ab8aedc80a04 @x0 @x1))))
    :qid haseqTm_refine_300ca30db2aa7c186f53ab8aedc80a04))
  :named haseqTm_refine_300ca30db2aa7c186f53ab8aedc80a04))
(declare-fun Tm_refine_a6067f4b71e7ed6992015387a11d9232 (Term Term Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Math.Euclid.fst(195,24-195,56); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_a6067f4b71e7ed6992015387a11d9232 @x0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_a6067f4b71e7ed6992015387a11d9232 @x0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_a6067f4b71e7ed6992015387a11d9232))
  :named refinement_kinding_Tm_refine_a6067f4b71e7ed6992015387a11d9232))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Math.Euclid.fst(195,24-195,56); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_a6067f4b71e7ed6992015387a11d9232 @x2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Math.Euclid.fst(195,24-195,56); use=FStar.Math.Euclid.fst(192,2-204,3)
      (implies
       ;; def=FStar.Math.Euclid.fst(195,24-195,39); use=FStar.Math.Euclid.fst(192,2-204,3)
       (Valid
        ;; def=FStar.Math.Euclid.fst(195,24-195,39); use=FStar.Math.Euclid.fst(192,2-204,3)
        (FStar.Math.Euclid.is_gcd @x2 (Prims.op_Minus @x3) @x4))
       ;; def=FStar.Math.Euclid.fst(195,44-195,56); use=FStar.Math.Euclid.fst(192,2-204,3)
       (Valid
        ;; def=FStar.Math.Euclid.fst(195,44-195,56); use=FStar.Math.Euclid.fst(192,2-204,3)
        (FStar.Math.Euclid.is_gcd @x2 @x3 @x4)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_a6067f4b71e7ed6992015387a11d9232 @x2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_a6067f4b71e7ed6992015387a11d9232))
  :named refinement_interpretation_Tm_refine_a6067f4b71e7ed6992015387a11d9232))
; haseq for Tm_refine_a6067f4b71e7ed6992015387a11d9232
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Math.Euclid.fst(195,24-195,56); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_a6067f4b71e7ed6992015387a11d9232 @x0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_a6067f4b71e7ed6992015387a11d9232 @x0 @x1 @x2))))
    :qid haseqTm_refine_a6067f4b71e7ed6992015387a11d9232))
  :named haseqTm_refine_a6067f4b71e7ed6992015387a11d9232))
(declare-fun Tm_arrow_9ee503e088bd858875d95fd61473a29f (Term Term) Term)
; kinding_Tm_arrow_9ee503e088bd858875d95fd61473a29f
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Math.Euclid.fsti(54,18-54,21); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_arrow_9ee503e088bd858875d95fd61473a29f @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_arrow_9ee503e088bd858875d95fd61473a29f @x0 @x1) (Tm_type U_zero)))
    :qid kinding_Tm_arrow_9ee503e088bd858875d95fd61473a29f))
  :named kinding_Tm_arrow_9ee503e088bd858875d95fd61473a29f))
; pretyping
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Math.Euclid.fsti(54,18-54,21); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (Tm_arrow_9ee503e088bd858875d95fd61473a29f @x2 @x3))
     (is-Tm_arrow (PreType @x1)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_arrow_9ee503e088bd858875d95fd61473a29f @x2 @x3)))
    :qid FStar.Math.Euclid_pre_typing_Tm_arrow_9ee503e088bd858875d95fd61473a29f))
  :named FStar.Math.Euclid_pre_typing_Tm_arrow_9ee503e088bd858875d95fd61473a29f))
; interpretation_Tm_arrow_9ee503e088bd858875d95fd61473a29f
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Math.Euclid.fsti(54,18-54,21); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_9ee503e088bd858875d95fd61473a29f @x1 @x2))
     (and
      ;; def=FStar.Math.Euclid.fsti(54,18-54,21); use=FStar.Math.Euclid.fst(192,2-204,3)
      (forall ((@x3 Term))
       (! (implies
         (HasType @x3 Prims.int)
         (HasType (ApplyTT @x0 @x3) (Tm_refine_a6067f4b71e7ed6992015387a11d9232 @x1 @x2 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Math.Euclid_interpretation_Tm_arrow_9ee503e088bd858875d95fd61473a29f.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_9ee503e088bd858875d95fd61473a29f @x1 @x2)))
    :qid FStar.Math.Euclid_interpretation_Tm_arrow_9ee503e088bd858875d95fd61473a29f))
  :named FStar.Math.Euclid_interpretation_Tm_arrow_9ee503e088bd858875d95fd61473a29f))
(declare-fun Tm_refine_760c5e70adce122a95cd106d0e0c6598 (Term Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Classical.Sugar.fsti(109,16-109,31); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_760c5e70adce122a95cd106d0e0c6598 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_760c5e70adce122a95cd106d0e0c6598 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_760c5e70adce122a95cd106d0e0c6598))
  :named refinement_kinding_Tm_refine_760c5e70adce122a95cd106d0e0c6598))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Classical.Sugar.fsti(109,16-109,31); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_760c5e70adce122a95cd106d0e0c6598 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Classical.Sugar.fsti(109,16-109,31); use=FStar.Math.Euclid.fst(192,2-204,3)
      (forall ((@x4 Term))
       (! (implies
         (and
          (HasType @x4 Prims.int)
          ;; def=FStar.Math.Euclid.fst(195,24-195,39); use=FStar.Math.Euclid.fst(192,2-204,3)
          (Valid
           ;; def=FStar.Math.Euclid.fst(195,24-195,39); use=FStar.Math.Euclid.fst(192,2-204,3)
           (FStar.Math.Euclid.is_gcd @x2 (Prims.op_Minus @x3) @x4)))
         ;; def=FStar.Math.Euclid.fst(195,44-195,56); use=FStar.Math.Euclid.fst(192,2-204,3)
         (Valid
          ;; def=FStar.Math.Euclid.fst(195,44-195,56); use=FStar.Math.Euclid.fst(192,2-204,3)
          (FStar.Math.Euclid.is_gcd @x2 @x3 @x4)))
        :qid refinement_interpretation_Tm_refine_760c5e70adce122a95cd106d0e0c6598.1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_760c5e70adce122a95cd106d0e0c6598 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_760c5e70adce122a95cd106d0e0c6598))
  :named refinement_interpretation_Tm_refine_760c5e70adce122a95cd106d0e0c6598))
; haseq for Tm_refine_760c5e70adce122a95cd106d0e0c6598
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Classical.Sugar.fsti(109,16-109,31); use=FStar.Math.Euclid.fst(192,2-204,3)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_760c5e70adce122a95cd106d0e0c6598 @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_760c5e70adce122a95cd106d0e0c6598 @x0 @x1))))
    :qid haseqTm_refine_760c5e70adce122a95cd106d0e0c6598))
  :named haseqTm_refine_760c5e70adce122a95cd106d0e0c6598))

; Encoding query formula : forall (a: Prims.int) (b: Prims.int) (p: Prims.pure_post (Prims.int & Prims.int & Prims.int))
;   (_:
;   Prims.squash (forall (pure_result: Prims.int & Prims.int & Prims.int).
;         (let r, s, d = pure_result in
;           r * a + s * b = d /\ FStar.Math.Euclid.is_gcd a b d) ==>
;         p pure_result)) (k: Prims.pure_post (Prims.int & Prims.int & Prims.int))
;   (_:
;   Prims.squash (forall (x: Prims.int & Prims.int & Prims.int). {:pattern Prims.guard_free (k x)}
;         (x ==
;           (match b >= 0 with
;             | true -> FStar.Math.Euclid.egcd a b 1 0 a 0 1 b
;             | _ ->
;               (FStar.Math.Euclid.egcd a b 1 0 a 0 -1 (- b);
;                 FStar.Math.Euclid.egcd a b 1 0 a 0 -1 (- b))
;               <:
;               Prims.int & Prims.int & Prims.int) ==>
;           (forall (return_val: Prims.int & Prims.int & Prims.int). return_val == x ==> p return_val)
;         ) ==>
;         k x)) (_: Prims.squash (~(b >= 0 = true))) (b: Prims.bool) (_: Prims.squash (b >= 0 == b))
;   (any_result:
;   (x: Prims.int
;       -> Prims.squash (FStar.Math.Euclid.is_gcd a (- b) x ==> FStar.Math.Euclid.is_gcd a b x)))
;   (any_result:
;   Prims.squash (forall (x: Prims.int).
;         FStar.Math.Euclid.is_gcd a (- b) x ==> FStar.Math.Euclid.is_gcd a b x))
;   (any_result:
;   Prims.squash (forall (x: Prims.int).
;         FStar.Math.Euclid.is_gcd a (- b) x ==> FStar.Math.Euclid.is_gcd a b x)).
;   (* - Could not prove post-condition *) 0 * a + -1 * b = - b
; Context: While encoding a query
; While typechecking the top-level declaration ‘let euclid_gcd’
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
       (HasType @x0 Prims.int)
       (HasType @x1 Prims.int)
       (HasType
        @x2
        (Prims.pure_post
         U_zero
         (FStar.Pervasives.Native.tuple3 U_zero U_zero U_zero Prims.int Prims.int Prims.int)))
       (HasType @x3 (Tm_refine_d4cc7906977c75c5a24e6e95be7f228f @x0 @x1 @x2))
       (HasType
        @x4
        (Prims.pure_post
         U_zero
         (FStar.Pervasives.Native.tuple3 U_zero U_zero U_zero Prims.int Prims.int Prims.int)))
       (HasType @x5 (Tm_refine_7c254472969fde82fc5a525aed43ac7d @x0 @x1 @x2 @x4))
       (HasType @x6 (Tm_refine_c779995ca3160945f42d4e2f6549f3fc @x1))
       (HasType @x7 Prims.bool)
       (HasType @x8 (Tm_refine_300ca30db2aa7c186f53ab8aedc80a04 @x1 @x7))
       (HasType @x9 (Tm_arrow_9ee503e088bd858875d95fd61473a29f @x0 @x1))
       (HasType @x10 (Tm_refine_760c5e70adce122a95cd106d0e0c6598 @x0 @x1))
       (HasType @x11 (Tm_refine_760c5e70adce122a95cd106d0e0c6598 @x0 @x1)))
      ;; def=FStar.Math.Euclid.fst(147,12-147,32); use=FStar.Math.Euclid.fst(200,14-200,18)
      (or
       label_1
       ;; def=FStar.Math.Euclid.fst(147,12-147,32); use=FStar.Math.Euclid.fst(200,14-200,18)
       (=
        (Prims.op_Addition (Prims.op_Star (BoxInt 0) @x0) (Prims.op_Star (BoxInt -1) @x1))
        (Prims.op_Minus @x1))))
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
