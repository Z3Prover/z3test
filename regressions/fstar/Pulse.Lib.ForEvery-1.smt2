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

; Constructor
(declare-fun FStar.Bijection.Mkbijection (Universe Universe Term Term Term Term Term Term) Term)
; Projector
(declare-fun FStar.Bijection.Mkbijection_@0 (Term) Universe)
; Projector
(declare-fun FStar.Bijection.Mkbijection_@1 (Term) Universe)
; Projector
(declare-fun FStar.Bijection.Mkbijection_@a (Term) Term)
; Projector
(declare-fun FStar.Bijection.Mkbijection_@b (Term) Term)
; Projector
(declare-fun FStar.Bijection.Mkbijection_@left (Term) Term)
; Projector
(declare-fun FStar.Bijection.Mkbijection_@left_right (Term) Term)
; Projector
(declare-fun FStar.Bijection.Mkbijection_@right (Term) Term)
; Projector
(declare-fun FStar.Bijection.Mkbijection_@right_left (Term) Term)
(declare-fun FStar.Bijection.__proj__Mkbijection__item__left (Universe Universe Term Term Term) Term)
(declare-fun FStar.Bijection.__proj__Mkbijection__item__left@tok (Universe Universe) Term)
(declare-fun
 FStar.Bijection.__proj__Mkbijection__item__left_right
 (Universe Universe Term Term Term)
 Term)
(declare-fun FStar.Bijection.__proj__Mkbijection__item__left_right@tok (Universe Universe) Term)
(declare-fun
 FStar.Bijection.__proj__Mkbijection__item__right
 (Universe Universe Term Term Term)
 Term)
(declare-fun FStar.Bijection.__proj__Mkbijection__item__right@tok (Universe Universe) Term)
(declare-fun
 FStar.Bijection.__proj__Mkbijection__item__right_left
 (Universe Universe Term Term Term)
 Term)
(declare-fun FStar.Bijection.__proj__Mkbijection__item__right_left@tok (Universe Universe) Term)
(declare-fun FStar.Bijection.bij_sym (Universe Universe Term Term Term) Term)
; Constructor
(declare-fun FStar.Bijection.bijection (Universe Universe Term Term) Term)
; token
(declare-fun FStar.Bijection.bijection@tok (Universe Universe) Term)
(declare-fun FStar.Bijection.op_Equals_Tilde (Universe Universe Term Term) Term)
(declare-fun FStar.Bijection.op_Greater_Greater (Universe Universe Term Term Term Term) Term)
(declare-fun FStar.Bijection.op_Less_Less (Universe Universe Term Term Term Term) Term)
(declare-fun FStar.Fin.fin (Term) Term)
; Constructor
(declare-fun FStar.Pervasives.Native.Mktuple2 (Universe Universe Term Term Term Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple2_@0 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple2_@1 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple2_@_1 (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple2_@_2 (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple2_@_a (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Mktuple2_@_b (Term) Term)
(declare-fun
 FStar.Pervasives.Native.__proj__Mktuple2__item___1
 (Universe Universe Term Term Term)
 Term)
(declare-fun
 FStar.Pervasives.Native.__proj__Mktuple2__item___2
 (Universe Universe Term Term Term)
 Term)
; Constructor
(declare-fun FStar.Pervasives.Native.tuple2 (Universe Universe Term Term) Term)
; token
(declare-fun FStar.Pervasives.Native.tuple2@tok (Universe Universe) Term)
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
(declare-fun Non_total_Tm_arrow_47cf0da1ce67e7de2468cec83b13ab8b (Term) Term)
(declare-fun Non_total_Tm_arrow_57c96334de88d8a23b5eb456a1b8c5e4 (Term) Term)
(declare-fun Non_total_Tm_arrow_62a2cf1b58e1e423697dd5147ebaf708 (Term) Term)
(declare-fun Non_total_Tm_arrow_7e78837dcb1f142ad47da22490524d1e (Term Term Term) Term)
(declare-fun Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521 (Term Term) Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.hasEq (Universe Term) Term)
(declare-fun Prims.int () Term)
(declare-fun Prims.nat () Term)
(declare-fun Prims.nonzero () Term)
(declare-fun Prims.op_Addition (Term Term) Term)
(declare-fun Prims.op_Division (Term Term) Term)
(declare-fun Prims.op_Modulus (Term Term) Term)
(declare-fun Prims.op_Star (Term Term) Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_wp (Universe Term) Term)
(declare-fun Prims.squash (Term) Term)
(declare-fun Prims.unit () Term)
(declare-fun Pulse.Lib.Core.emp (Dummy_sort) Term)
(declare-fun Pulse.Lib.Core.slprop () Term)
(declare-fun Pulse.Lib.Core.timeless (Term) Term)
(declare-fun Pulse.Lib.Core.timeless_emp () Term)
(declare-fun Tm_abs_02dcd51cd1db8468db6f164cc37f6abb (Term Term) Term)
(declare-fun Tm_abs_716795d33592764ee9cf62a80672da9a (Term Term) Term)
(declare-fun Tm_abs_92db0263ba330856acce3e8323d339a2 (Term Term) Term)
(declare-fun Tm_abs_93184d47a541ad3b3f97af2a43d7cb12 (Term Term) Term)
(declare-fun Tm_arrow_060ca3b8637c2d96c521210b38e0612a (Universe Universe) Term)
(declare-fun Tm_arrow_0f35761274ca69a14275931c21a813bb (Term Term) Term)
(declare-fun Tm_arrow_1be4c7045871ee049c09a677875e1d62 (Universe Universe) Term)
(declare-fun Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556 (Term) Term)
(declare-fun Tm_arrow_627bcf56012300e4469ebee878e555ad (Term Universe Universe Term Term) Term)
(declare-fun Tm_arrow_639fb86eafca03dd3a88807b06edb60c (Term Universe Universe Term Term) Term)
(declare-fun Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e (Universe Universe) Term)
(declare-fun Tm_arrow_8f4d0c93d793badb913a85a0bb821c13 (Term Universe) Term)
(declare-fun Tm_arrow_96427c7f0a998147608e7515990a5dc6 (Term Term) Term)
(declare-fun Tm_arrow_a2587164785c2b25dd61bca17ad55db6 (Term Term) Term)
(declare-fun Tm_arrow_a98aab798ae82be87b51dadd06053d91 (Term Term) Term)
(declare-fun Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777 (Term Universe Term Term) Term)
(declare-fun Tm_arrow_d56333a8396b1b84e7de7c0febdd324e (Universe Universe) Term)
(declare-fun Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd (Term Term Universe Universe) Term)
(declare-fun Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f () Term)
(declare-fun Tm_refine_2de20c066034c13bf76e9c0b94f4806c (Term) Term)
(declare-fun Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069 (Universe Universe Term Term Term Term) Term)
(declare-fun Tm_refine_542f9d4f129664613f2483a6c88bc7c2 () Term)
(declare-fun Tm_refine_64547470e4c037d472bbb742ab28412c (Term Term Term) Term)
(declare-fun Tm_refine_686a9abe504e09f7b6e412e0739db40c (Term Term Term) Term)
(declare-fun Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004 (Universe Universe Term Term Term Term) Term)
(declare-fun Tm_refine_9d6af3f3535473623f7aec2f0501897f () Term)
(declare-fun Tm_refine_a828023d3a7e4668dd6296b4c3d57fed (Term) Term)
(declare-fun Tm_refine_eaaf716b226d372cea862801f854423f (Universe Term Term Term) Term)
; Discriminator definition
(define-fun is-FStar.Bijection.Mkbijection ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 158)
  (=
   __@x0
   (FStar.Bijection.Mkbijection
    (FStar.Bijection.Mkbijection_@0 __@x0)
    (FStar.Bijection.Mkbijection_@1 __@x0)
    (FStar.Bijection.Mkbijection_@a __@x0)
    (FStar.Bijection.Mkbijection_@b __@x0)
    (FStar.Bijection.Mkbijection_@right __@x0)
    (FStar.Bijection.Mkbijection_@left __@x0)
    (FStar.Bijection.Mkbijection_@left_right __@x0)
    (FStar.Bijection.Mkbijection_@right_left __@x0)))))
; Discriminator definition
(define-fun is-FStar.Pervasives.Native.Mktuple2 ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 132)
  (=
   __@x0
   (FStar.Pervasives.Native.Mktuple2
    (FStar.Pervasives.Native.Mktuple2_@0 __@x0)
    (FStar.Pervasives.Native.Mktuple2_@1 __@x0)
    (FStar.Pervasives.Native.Mktuple2_@_a __@x0)
    (FStar.Pervasives.Native.Mktuple2_@_b __@x0)
    (FStar.Pervasives.Native.Mktuple2_@_1 __@x0)
    (FStar.Pervasives.Native.Mktuple2_@_2 __@x0)))))
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
;;; Fact-ids: Name FStar.Bijection.bij_either; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_073fa755d4b6c313ef308275c3dcff5f))
  :named @kick_partial_app_073fa755d4b6c313ef308275c3dcff5f))
; kick_partial_app
;;; Fact-ids: Name FStar.Enumerable.to_nat; Namespace FStar.Enumerable
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_09fd9888f5c335e399d29f7abf846b3b))
  :named @kick_partial_app_09fd9888f5c335e399d29f7abf846b3b))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_either; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_0cf4102e83696e9a37d4f46e21348c73))
  :named @kick_partial_app_0cf4102e83696e9a37d4f46e21348c73))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.op_Greater_Greater; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_13b62c593a5cace42ddf9f91fda97fff))
  :named @kick_partial_app_13b62c593a5cace42ddf9f91fda97fff))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_prod; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_29f4033e7df43188c61d8f741893f757))
  :named @kick_partial_app_29f4033e7df43188c61d8f741893f757))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_erase; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_39f935255f9fda3aaa91e409d95b3e8d))
  :named @kick_partial_app_39f935255f9fda3aaa91e409d95b3e8d))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.inv_lemma_pat; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_4316ab8ecde6abd792ec6df072a97de7))
  :named @kick_partial_app_4316ab8ecde6abd792ec6df072a97de7))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.inj_bij; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_445d9b8ef5247fc3e6b75903fb42aea6))
  :named @kick_partial_app_445d9b8ef5247fc3e6b75903fb42aea6))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_5f2aef756e3632cf3ef25e1412a4ac5f))
  :named @kick_partial_app_5f2aef756e3632cf3ef25e1412a4ac5f))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.inj_bij'; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_69fd3e1c1f664907e723c58030a0ab9c))
  :named @kick_partial_app_69fd3e1c1f664907e723c58030a0ab9c))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_6b5463c054fe722a38881b638af8b715))
  :named @kick_partial_app_6b5463c054fe722a38881b638af8b715))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_either; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_6c26f8e0dfe6fd8363f5cd006e4bc913))
  :named @kick_partial_app_6c26f8e0dfe6fd8363f5cd006e4bc913))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_prod; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_742309c605f0faf0616f9314c9730a46))
  :named @kick_partial_app_742309c605f0faf0616f9314c9730a46))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_inv_fwd; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_76890e74e0eaa9a11d4de0ca59c45f48))
  :named @kick_partial_app_76890e74e0eaa9a11d4de0ca59c45f48))
; kick_partial_app
;;; Fact-ids: Name FStar.Enumerable.of_nat; Namespace FStar.Enumerable
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_88176854e11fdce5c8a326d38643f9ba))
  :named @kick_partial_app_88176854e11fdce5c8a326d38643f9ba))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.op_Less_Less; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_88ace8e4b90cd42ee1719bd8f44dd1da))
  :named @kick_partial_app_88ace8e4b90cd42ee1719bd8f44dd1da))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_prod; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_900a16f4cce308e5ac3f1943e60801d1))
  :named @kick_partial_app_900a16f4cce308e5ac3f1943e60801d1))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_comp; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right_left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right_left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right_left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_977ac522ac734075410c0f5669c89ba9))
  :named @kick_partial_app_977ac522ac734075410c0f5669c89ba9))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_prod; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_a347e84707d5e0563a0b2f8fc9608d61))
  :named @kick_partial_app_a347e84707d5e0563a0b2f8fc9608d61))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_erase; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_afce528130b6ecaea50d9fa42cf9c6e9))
  :named @kick_partial_app_afce528130b6ecaea50d9fa42cf9c6e9))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.inv_lemma_pat; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_b7277bd0436ecf161112fa9b1b21db63))
  :named @kick_partial_app_b7277bd0436ecf161112fa9b1b21db63))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.cbij; Namespace FStar.Bijection; Name FStar.Bijection.Mkcbij; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_b85e73222f3b0e2b7de6e03cf8b7a63e))
  :named @kick_partial_app_b85e73222f3b0e2b7de6e03cf8b7a63e))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_comp; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left_right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left_right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left_right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_dcc65a5b843974082f4b339f4dc84485))
  :named @kick_partial_app_dcc65a5b843974082f4b339f4dc84485))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_inv_fwd; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_e199b1e847d7621ede35884e219f200e))
  :named @kick_partial_app_e199b1e847d7621ede35884e219f200e))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.bij_either; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_e4396345f94cee79d1437121532df99f))
  :named @kick_partial_app_e4396345f94cee79d1437121532df99f))
; kick_partial_app
;;; Fact-ids: Name FStar.Bijection.cbij; Namespace FStar.Bijection; Name FStar.Bijection.Mkcbij; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_fb6ee1892ff4f0c168cd2cd494e7e9cf))
  :named @kick_partial_app_fb6ee1892ff4f0c168cd2cd494e7e9cf))
; interpretation_Tm_arrow_060ca3b8637c2d96c521210b38e0612a
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
  (forall ((@x0 Term) (@u1 Universe) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_060ca3b8637c2d96c521210b38e0612a @u1 @u2))
     (and
      ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
      (forall ((@x3 Term) (@x4 Term) (@x5 Term))
       (! (implies
         (and
          (HasType @x3 (Tm_type @u1))
          (HasType @x4 (Tm_type @u2))
          (HasType @x5 (FStar.Bijection.bijection @u1 @u2 @x3 @x4)))
         (HasType
          (ApplyTT (ApplyTT (ApplyTT @x0 @x3) @x4) @x5)
          (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x3 @x4 @u1 @u2)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT @x0 @x3) @x4) @x5))
        :qid FStar.Bijection_interpretation_Tm_arrow_060ca3b8637c2d96c521210b38e0612a.1))
      (IsTotFun @x0)
      ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 (Tm_type @u1)) (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Bijection_interpretation_Tm_arrow_060ca3b8637c2d96c521210b38e0612a.2))
      ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and (HasType @x3 (Tm_type @u1)) (HasType @x4 (Tm_type @u2)))
         (IsTotFun (ApplyTT (ApplyTT @x0 @x3) @x4)))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid FStar.Bijection_interpretation_Tm_arrow_060ca3b8637c2d96c521210b38e0612a.3))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_060ca3b8637c2d96c521210b38e0612a @u1 @u2)))
    :qid FStar.Bijection_interpretation_Tm_arrow_060ca3b8637c2d96c521210b38e0612a))
  :named FStar.Bijection_interpretation_Tm_arrow_060ca3b8637c2d96c521210b38e0612a))
; interpretation_Tm_arrow_0f35761274ca69a14275931c21a813bb
;;; Fact-ids: Name FStar.Bijection.prod_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(142,31-142,63); use=FStar.Bijection.fsti(142,31-142,63)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_0f35761274ca69a14275931c21a813bb @x1 @x2))
     (and
      ;; def=FStar.Bijection.fsti(142,31-142,63); use=FStar.Bijection.fsti(142,31-142,63)
      (forall ((@x3 Term))
       (! (implies
         (HasType
          @x3
          (FStar.Pervasives.Native.tuple2 U_zero U_zero (FStar.Fin.fin @x1) (FStar.Fin.fin @x2)))
         (HasType (ApplyTT @x0 @x3) (FStar.Fin.fin (Prims.op_Star @x1 @x2))))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Bijection_interpretation_Tm_arrow_0f35761274ca69a14275931c21a813bb.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_0f35761274ca69a14275931c21a813bb @x1 @x2)))
    :qid FStar.Bijection_interpretation_Tm_arrow_0f35761274ca69a14275931c21a813bb))
  :named FStar.Bijection_interpretation_Tm_arrow_0f35761274ca69a14275931c21a813bb))
; interpretation_Tm_arrow_1be4c7045871ee049c09a677875e1d62
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
  (forall ((@x0 Term) (@u1 Universe) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_1be4c7045871ee049c09a677875e1d62 @u1 @u2))
     (and
      ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
      (forall ((@x3 Term) (@x4 Term) (@x5 Term))
       (! (implies
         (and
          (HasType @x3 (Tm_type @u1))
          (HasType @x4 (Tm_type @u2))
          (HasType @x5 (FStar.Bijection.bijection @u1 @u2 @x3 @x4)))
         (HasType
          (ApplyTT (ApplyTT (ApplyTT @x0 @x3) @x4) @x5)
          (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x4 @x3 @u2 @u1)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT @x0 @x3) @x4) @x5))
        :qid FStar.Bijection_interpretation_Tm_arrow_1be4c7045871ee049c09a677875e1d62.1))
      (IsTotFun @x0)
      ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 (Tm_type @u1)) (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Bijection_interpretation_Tm_arrow_1be4c7045871ee049c09a677875e1d62.2))
      ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and (HasType @x3 (Tm_type @u1)) (HasType @x4 (Tm_type @u2)))
         (IsTotFun (ApplyTT (ApplyTT @x0 @x3) @x4)))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid FStar.Bijection_interpretation_Tm_arrow_1be4c7045871ee049c09a677875e1d62.3))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_1be4c7045871ee049c09a677875e1d62 @u1 @u2)))
    :qid FStar.Bijection_interpretation_Tm_arrow_1be4c7045871ee049c09a677875e1d62))
  :named FStar.Bijection_interpretation_Tm_arrow_1be4c7045871ee049c09a677875e1d62))
; interpretation_Tm_arrow_627bcf56012300e4469ebee878e555ad
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,16-25,50); use=FStar.Bijection.fsti(16,16-25,50)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@u3 Universe) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_627bcf56012300e4469ebee878e555ad @x1 @u2 @u3 @x4 @x5))
     (and
      ;; def=FStar.Bijection.fsti(16,16-25,50); use=FStar.Bijection.fsti(16,16-25,50)
      (forall ((@x6 Term))
       (! (implies
         (HasType @x6 @x1)
         (HasType
          (ApplyTT @x0 @x6)
          (Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004 @u2 @u3 @x1 @x4 @x5 @x6)))
        :pattern ((ApplyTT @x0 @x6))
        :qid FStar.Bijection_interpretation_Tm_arrow_627bcf56012300e4469ebee878e555ad.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_627bcf56012300e4469ebee878e555ad @x1 @u2 @u3 @x4 @x5)))
    :qid FStar.Bijection_interpretation_Tm_arrow_627bcf56012300e4469ebee878e555ad))
  :named FStar.Bijection_interpretation_Tm_arrow_627bcf56012300e4469ebee878e555ad))
; interpretation_Tm_arrow_639fb86eafca03dd3a88807b06edb60c
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,18-26,50); use=FStar.Bijection.fsti(16,18-26,50)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@u3 Universe) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_639fb86eafca03dd3a88807b06edb60c @x1 @u2 @u3 @x4 @x5))
     (and
      ;; def=FStar.Bijection.fsti(16,18-26,50); use=FStar.Bijection.fsti(16,18-26,50)
      (forall ((@x6 Term))
       (! (implies
         (HasType @x6 @x1)
         (HasType
          (ApplyTT @x0 @x6)
          (Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069 @u2 @u3 @x4 @x1 @x5 @x6)))
        :pattern ((ApplyTT @x0 @x6))
        :qid FStar.Bijection_interpretation_Tm_arrow_639fb86eafca03dd3a88807b06edb60c.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_639fb86eafca03dd3a88807b06edb60c @x1 @u2 @u3 @x4 @x5)))
    :qid FStar.Bijection_interpretation_Tm_arrow_639fb86eafca03dd3a88807b06edb60c))
  :named FStar.Bijection_interpretation_Tm_arrow_639fb86eafca03dd3a88807b06edb60c))
; interpretation_Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-26,50); use=FStar.Bijection.fsti(16,5-26,50)
  (forall ((@x0 Term) (@u1 Universe) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e @u1 @u2))
     (and
      ;; def=FStar.Bijection.fsti(16,5-26,50); use=FStar.Bijection.fsti(16,5-26,50)
      (forall ((@x3 Term) (@x4 Term) (@x5 Term))
       (! (implies
         (and
          (HasType @x3 (Tm_type @u1))
          (HasType @x4 (Tm_type @u2))
          (HasType @x5 (FStar.Bijection.bijection @u1 @u2 @x3 @x4)))
         (HasType
          (ApplyTT (ApplyTT (ApplyTT @x0 @x3) @x4) @x5)
          (Tm_arrow_639fb86eafca03dd3a88807b06edb60c @x4 @u2 @u1 @x3 @x5)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT @x0 @x3) @x4) @x5))
        :qid FStar.Bijection_interpretation_Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e.1))
      (IsTotFun @x0)
      ;; def=FStar.Bijection.fsti(16,5-26,50); use=FStar.Bijection.fsti(16,5-26,50)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 (Tm_type @u1)) (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Bijection_interpretation_Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e.2))
      ;; def=FStar.Bijection.fsti(16,5-26,50); use=FStar.Bijection.fsti(16,5-26,50)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and (HasType @x3 (Tm_type @u1)) (HasType @x4 (Tm_type @u2)))
         (IsTotFun (ApplyTT (ApplyTT @x0 @x3) @x4)))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid FStar.Bijection_interpretation_Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e.3))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e @u1 @u2)))
    :qid FStar.Bijection_interpretation_Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e))
  :named FStar.Bijection_interpretation_Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e))
; interpretation_Tm_arrow_96427c7f0a998147608e7515990a5dc6
;;; Fact-ids: Name FStar.Bijection.prod_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(148,30-148,62); use=FStar.Bijection.fsti(148,30-148,62)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_96427c7f0a998147608e7515990a5dc6 @x1 @x2))
     (and
      ;; def=FStar.Bijection.fsti(148,30-148,62); use=FStar.Bijection.fsti(148,30-148,62)
      (forall ((@x3 Term))
       (! (implies
         (HasType @x3 (FStar.Fin.fin (Prims.op_Star @x1 @x2)))
         (HasType
          (ApplyTT @x0 @x3)
          (FStar.Pervasives.Native.tuple2 U_zero U_zero (FStar.Fin.fin @x1) (FStar.Fin.fin @x2))))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Bijection_interpretation_Tm_arrow_96427c7f0a998147608e7515990a5dc6.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_96427c7f0a998147608e7515990a5dc6 @x1 @x2)))
    :qid FStar.Bijection_interpretation_Tm_arrow_96427c7f0a998147608e7515990a5dc6))
  :named FStar.Bijection_interpretation_Tm_arrow_96427c7f0a998147608e7515990a5dc6))
; interpretation_Tm_arrow_a2587164785c2b25dd61bca17ad55db6
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,22-152,68); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_a2587164785c2b25dd61bca17ad55db6 @x1 @x2))
     (and
      ;; def=FStar.Bijection.fsti(26,22-152,68); use=FStar.Bijection.fsti(154,2-157,29)
      (forall ((@x3 Term))
       (! (implies
         (HasType @x3 (FStar.Fin.fin (Prims.op_Star @x1 @x2)))
         (HasType (ApplyTT @x0 @x3) (Tm_refine_686a9abe504e09f7b6e412e0739db40c @x1 @x2 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Bijection_interpretation_Tm_arrow_a2587164785c2b25dd61bca17ad55db6.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_a2587164785c2b25dd61bca17ad55db6 @x1 @x2)))
    :qid FStar.Bijection_interpretation_Tm_arrow_a2587164785c2b25dd61bca17ad55db6))
  :named FStar.Bijection_interpretation_Tm_arrow_a2587164785c2b25dd61bca17ad55db6))
; interpretation_Tm_arrow_a98aab798ae82be87b51dadd06053d91
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,22-152,51); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_a98aab798ae82be87b51dadd06053d91 @x1 @x2))
     (and
      ;; def=FStar.Bijection.fsti(25,22-152,51); use=FStar.Bijection.fsti(154,2-157,29)
      (forall ((@x3 Term))
       (! (implies
         (HasType
          @x3
          (FStar.Pervasives.Native.tuple2 U_zero U_zero (FStar.Fin.fin @x1) (FStar.Fin.fin @x2)))
         (HasType (ApplyTT @x0 @x3) (Tm_refine_64547470e4c037d472bbb742ab28412c @x1 @x2 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Bijection_interpretation_Tm_arrow_a98aab798ae82be87b51dadd06053d91.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_a98aab798ae82be87b51dadd06053d91 @x1 @x2)))
    :qid FStar.Bijection_interpretation_Tm_arrow_a98aab798ae82be87b51dadd06053d91))
  :named FStar.Bijection_interpretation_Tm_arrow_a98aab798ae82be87b51dadd06053d91))
; interpretation_Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,16-25,50); use=FStar.Bijection.fsti(25,17-25,50)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777 @x1 @u2 @x3 @x4))
     (and
      ;; def=FStar.Bijection.fsti(16,16-25,50); use=FStar.Bijection.fsti(25,17-25,50)
      (forall ((@x5 Term))
       (! (implies
         (HasType @x5 @x1)
         (HasType (ApplyTT @x0 @x5) (Tm_refine_eaaf716b226d372cea862801f854423f @u2 @x3 @x4 @x5)))
        :pattern ((ApplyTT @x0 @x5))
        :qid FStar.Bijection_interpretation_Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777 @x1 @u2 @x3 @x4)))
    :qid FStar.Bijection_interpretation_Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777))
  :named FStar.Bijection_interpretation_Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777))
; interpretation_Tm_arrow_d56333a8396b1b84e7de7c0febdd324e
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-25,50); use=FStar.Bijection.fsti(16,5-25,50)
  (forall ((@x0 Term) (@u1 Universe) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_d56333a8396b1b84e7de7c0febdd324e @u1 @u2))
     (and
      ;; def=FStar.Bijection.fsti(16,5-25,50); use=FStar.Bijection.fsti(16,5-25,50)
      (forall ((@x3 Term) (@x4 Term) (@x5 Term))
       (! (implies
         (and
          (HasType @x3 (Tm_type @u1))
          (HasType @x4 (Tm_type @u2))
          (HasType @x5 (FStar.Bijection.bijection @u1 @u2 @x3 @x4)))
         (HasType
          (ApplyTT (ApplyTT (ApplyTT @x0 @x3) @x4) @x5)
          (Tm_arrow_627bcf56012300e4469ebee878e555ad @x3 @u1 @u2 @x4 @x5)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT @x0 @x3) @x4) @x5))
        :qid FStar.Bijection_interpretation_Tm_arrow_d56333a8396b1b84e7de7c0febdd324e.1))
      (IsTotFun @x0)
      ;; def=FStar.Bijection.fsti(16,5-25,50); use=FStar.Bijection.fsti(16,5-25,50)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 (Tm_type @u1)) (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Bijection_interpretation_Tm_arrow_d56333a8396b1b84e7de7c0febdd324e.2))
      ;; def=FStar.Bijection.fsti(16,5-25,50); use=FStar.Bijection.fsti(16,5-25,50)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and (HasType @x3 (Tm_type @u1)) (HasType @x4 (Tm_type @u2)))
         (IsTotFun (ApplyTT (ApplyTT @x0 @x3) @x4)))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid FStar.Bijection_interpretation_Tm_arrow_d56333a8396b1b84e7de7c0febdd324e.3))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_d56333a8396b1b84e7de7c0febdd324e @u1 @u2)))
    :qid FStar.Bijection_interpretation_Tm_arrow_d56333a8396b1b84e7de7c0febdd324e))
  :named FStar.Bijection_interpretation_Tm_arrow_d56333a8396b1b84e7de7c0febdd324e))
; interpretation_Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd
;;; Fact-ids: Name FStar.List.Tot.Base.map_gtot; Namespace FStar.List.Tot.Base
(assert
 (! ;; def=FStar.List.Tot.Base.fst(208,14-208,18); use=FStar.List.Tot.Base.fst(208,22-208,33)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe) (@u4 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x1 @x2 @u3 @u4))
     ;; def=FStar.List.Tot.Base.fst(208,14-208,18); use=FStar.List.Tot.Base.fst(208,22-208,33)
     (forall ((@x5 Term))
      (! (implies (HasType @x5 @x1) (HasType (ApplyTT @x0 @x5) @x2))
       :pattern ((ApplyTT @x0 @x5))
       :qid FStar.List.Tot.Base_interpretation_Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd.1)))
    :pattern ((HasTypeZ @x0 (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x1 @x2 @u3 @u4)))
    :qid FStar.List.Tot.Base_interpretation_Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd))
  :named FStar.List.Tot.Base_interpretation_Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd))
; interpretation_Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556
;;; Fact-ids: Name Pulse.Lib.ForEvery.pad_f; Namespace Pulse.Lib.ForEvery
(assert
 (! ;; def=Pulse.Lib.ForEvery.fsti(753,7-753,23); use=Pulse.Lib.ForEvery.fsti(753,7-753,23)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556 @x1))
     (and
      ;; def=Pulse.Lib.ForEvery.fsti(753,7-753,23); use=Pulse.Lib.ForEvery.fsti(753,7-753,23)
      (forall ((@x2 Term))
       (! (implies
         (HasType @x2 (FStar.Fin.fin @x1))
         (HasType (ApplyTT @x0 @x2) Pulse.Lib.Core.slprop))
        :pattern ((ApplyTT @x0 @x2))
        :qid Pulse.Lib.ForEvery_interpretation_Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556 @x1)))
    :qid Pulse.Lib.ForEvery_interpretation_Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556))
  :named Pulse.Lib.ForEvery_interpretation_Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556))
; Assumption: FStar.Pervasives.Native.tuple2__uu___haseq
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2__uu___haseq; Namespace FStar.Pervasives.Native
(assert
 (! (forall ((@u0 Universe) (@u1 Universe))
   (! (forall ((@x2 Term) (@x3 Term))
     (! (implies
       (and
        (HasType @x2 (Tm_type @u0))
        (HasType @x3 (Tm_type @u1))
        (Valid (Prims.hasEq @u0 @x2))
        (Valid (Prims.hasEq @u1 @x3)))
       (Valid (Prims.hasEq (U_max @u0 @u1) (FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3))))
      :pattern ((Prims.hasEq (U_max @u0 @u1) (FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3)))
      :qid assumption_FStar.Pervasives.Native.tuple2__uu___haseq.1))
    :qid assumption_FStar.Pervasives.Native.tuple2__uu___haseq))
  :named assumption_FStar.Pervasives.Native.tuple2__uu___haseq))
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
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= 158 (Term_constr_id (FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7)))
    :pattern ((FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid constructor_distinct_FStar.Bijection.Mkbijection))
  :named constructor_distinct_FStar.Bijection.Mkbijection))
; Constructor distinct
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (= 141 (Term_constr_id (FStar.Bijection.bijection @u0 @u1 @x2 @x3)))
    :pattern ((FStar.Bijection.bijection @u0 @u1 @x2 @x3))
    :qid constructor_distinct_FStar.Bijection.bijection))
  :named constructor_distinct_FStar.Bijection.bijection))
; Constructor distinct
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (= 132 (Term_constr_id (FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5)))
    :pattern ((FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
    :qid constructor_distinct_FStar.Pervasives.Native.Mktuple2))
  :named constructor_distinct_FStar.Pervasives.Native.Mktuple2))
; Constructor distinct
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,5-54,11); use=FStar.Pervasives.Native.fst(54,5-54,11)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (= 125 (Term_constr_id (FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3)))
    :pattern ((FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3))
    :qid constructor_distinct_FStar.Pervasives.Native.tuple2))
  :named constructor_distinct_FStar.Pervasives.Native.tuple2))
; Constructor distinct
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (= 298 (Term_constr_id Prims.int)) :named constructor_distinct_Prims.int))
; Constructor distinct
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (= 125 (Term_constr_id Prims.unit)) :named constructor_distinct_Prims.unit))
; data constructor typing elim
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term)
     (@x9 Term)
     (@x10 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)
      (FStar.Bijection.bijection @u1 @u2 @x9 @x10))
     (and
      (HasTypeFuel @u0 @x9 (Tm_type @u1))
      (HasTypeFuel @u0 @x10 (Tm_type @u2))
      (HasTypeFuel @u0 @x5 (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x9 @x10 @u1 @u2))
      (HasTypeFuel @u0 @x6 (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x10 @x9 @u2 @u1))
      (HasTypeFuel @u0 @x7 (Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777 @x9 @u1 @x6 @x5))
      (HasTypeFuel @u0 @x8 (Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777 @x10 @u2 @x5 @x6))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)
       (FStar.Bijection.bijection @u1 @u2 @x9 @x10)))
    :qid data_elim_FStar.Bijection.Mkbijection))
  :named data_elim_FStar.Bijection.Mkbijection))
; data constructor typing elim
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Native.Mktuple2 @u1 @u2 @x3 @x4 @x5 @x6)
      (FStar.Pervasives.Native.tuple2 @u1 @u2 @x7 @x8))
     (and
      (HasTypeFuel @u0 @x7 (Tm_type @u1))
      (HasTypeFuel @u0 @x8 (Tm_type @u2))
      (HasTypeFuel @u0 @x5 @x7)
      (HasTypeFuel @u0 @x6 @x8)))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Native.Mktuple2 @u1 @u2 @x3 @x4 @x5 @x6)
       (FStar.Pervasives.Native.tuple2 @u1 @u2 @x7 @x8)))
    :qid data_elim_FStar.Pervasives.Native.Mktuple2))
  :named data_elim_FStar.Pervasives.Native.Mktuple2))
; data constructor typing intro
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x3 (Tm_type @u1))
      (HasTypeFuel @u0 @x4 (Tm_type @u2))
      (HasTypeFuel @u0 @x5 (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x3 @x4 @u1 @u2))
      (HasTypeFuel @u0 @x6 (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x4 @x3 @u2 @u1))
      (HasTypeFuel @u0 @x7 (Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777 @x3 @u1 @x6 @x5))
      (HasTypeFuel @u0 @x8 (Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777 @x4 @u2 @x5 @x6)))
     (HasTypeFuel
      @u0
      (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)
      (FStar.Bijection.bijection @u1 @u2 @x3 @x4)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)
       (FStar.Bijection.bijection @u1 @u2 @x3 @x4)))
    :qid data_typing_intro_FStar.Bijection.Mkbijection@tok))
  :named data_typing_intro_FStar.Bijection.Mkbijection@tok))
; data constructor typing intro
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall ((@u0 Fuel) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x3 (Tm_type @u1))
      (HasTypeFuel @u0 @x4 (Tm_type @u2))
      (HasTypeFuel @u0 @x5 @x3)
      (HasTypeFuel @u0 @x6 @x4))
     (HasTypeFuel
      @u0
      (FStar.Pervasives.Native.Mktuple2 @u1 @u2 @x3 @x4 @x5 @x6)
      (FStar.Pervasives.Native.tuple2 @u1 @u2 @x3 @x4)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Pervasives.Native.Mktuple2 @u1 @u2 @x3 @x4 @x5 @x6)
       (FStar.Pervasives.Native.tuple2 @u1 @u2 @x3 @x4)))
    :qid data_typing_intro_FStar.Pervasives.Native.Mktuple2@tok))
  :named data_typing_intro_FStar.Pervasives.Native.Mktuple2@tok))
; Equation for FStar.Bijection.bij_sym
;;; Fact-ids: Name FStar.Bijection.bij_sym; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(66,4-66,11); use=FStar.Bijection.fsti(66,4-66,11)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.bij_sym @u0 @u1 @x2 @x3 @x4)
     (FStar.Bijection.Mkbijection
      @u1
      @u0
      @x3
      @x2
      (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
      (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
      (FStar.Bijection.__proj__Mkbijection__item__right_left @u0 @u1 @x2 @x3 @x4)
      (FStar.Bijection.__proj__Mkbijection__item__left_right @u0 @u1 @x2 @x3 @x4)))
    :pattern ((FStar.Bijection.bij_sym @u0 @u1 @x2 @x3 @x4))
    :qid equation_FStar.Bijection.bij_sym))
  :named equation_FStar.Bijection.bij_sym))
; Equation for FStar.Bijection.op_Equals_Tilde
;;; Fact-ids: Name FStar.Bijection.op_Equals_Tilde; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(30,6-30,8); use=FStar.Bijection.fsti(30,6-30,8)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3)
     (FStar.Bijection.bijection @u0 @u1 @x2 @x3))
    :pattern ((FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3))
    :qid equation_FStar.Bijection.op_Equals_Tilde))
  :named equation_FStar.Bijection.op_Equals_Tilde))
; Equation for FStar.Bijection.op_Greater_Greater
;;; Fact-ids: Name FStar.Bijection.op_Greater_Greater; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(51,7-51,8); use=FStar.Bijection.fsti(51,7-51,8)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Bijection.op_Greater_Greater @u0 @u1 @x2 @x3 @x4 @x5)
     (ApplyTT
      (ApplyTT
       (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
       @x5)
      @x4))
    :pattern ((FStar.Bijection.op_Greater_Greater @u0 @u1 @x2 @x3 @x4 @x5))
    :qid equation_FStar.Bijection.op_Greater_Greater))
  :named equation_FStar.Bijection.op_Greater_Greater))
; Equation for FStar.Bijection.op_Less_Less
;;; Fact-ids: Name FStar.Bijection.op_Less_Less; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(52,6-52,8); use=FStar.Bijection.fsti(52,6-52,8)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Bijection.op_Less_Less @u0 @u1 @x2 @x3 @x4 @x5)
     (ApplyTT
      (ApplyTT
       (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
       @x5)
      @x4))
    :pattern ((FStar.Bijection.op_Less_Less @u0 @u1 @x2 @x3 @x4 @x5))
    :qid equation_FStar.Bijection.op_Less_Less))
  :named equation_FStar.Bijection.op_Less_Less))
; Equation for FStar.Fin.fin
;;; Fact-ids: Name FStar.Fin.fin; Namespace FStar.Fin
(assert
 (! ;; def=FStar.Fin.fsti(40,4-40,7); use=FStar.Fin.fsti(40,4-40,7)
  (forall ((@x0 Term))
   (! (= (FStar.Fin.fin @x0) (Tm_refine_a828023d3a7e4668dd6296b4c3d57fed @x0))
    :pattern ((FStar.Fin.fin @x0))
    :qid equation_FStar.Fin.fin))
  :named equation_FStar.Fin.fin))
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
; Equation for Prims.squash
;;; Fact-ids: Name Prims.squash; Namespace Prims
(assert
 (! ;; def=Prims.fst(134,5-134,11); use=Prims.fst(134,5-134,11)
  (forall ((@x0 Term))
   (! (= (Prims.squash @x0) (Tm_refine_2de20c066034c13bf76e9c0b94f4806c @x0))
    :pattern ((Prims.squash @x0))
    :qid equation_Prims.squash))
  :named equation_Prims.squash))
; fresh token
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe))
   (! (= 142 (Term_constr_id (FStar.Bijection.bijection@tok @u0 @u1)))
    :pattern ((FStar.Bijection.bijection@tok @u0 @u1))
    :qid fresh_token_FStar.Bijection.bijection@tok))
  :named fresh_token_FStar.Bijection.bijection@tok))
; fresh token
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! (forall ((@u0 Universe) (@u1 Universe))
   (! (= 126 (Term_constr_id (FStar.Pervasives.Native.tuple2@tok @u0 @u1)))
    :pattern ((FStar.Pervasives.Native.tuple2@tok @u0 @u1))
    :qid fresh_token_FStar.Pervasives.Native.tuple2@tok))
  :named fresh_token_FStar.Pervasives.Native.tuple2@tok))
; inversion axiom
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@u3 Universe) (@x4 Term) (@x5 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (FStar.Bijection.bijection @u2 @u3 @x4 @x5))
     (and
      (is-FStar.Bijection.Mkbijection @x1)
      (= @u2 (FStar.Bijection.Mkbijection_@0 @x1))
      (= @u3 (FStar.Bijection.Mkbijection_@1 @x1))
      (= @x4 (FStar.Bijection.Mkbijection_@a @x1))
      (= @x5 (FStar.Bijection.Mkbijection_@b @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (FStar.Bijection.bijection @u2 @u3 @x4 @x5)))
    :qid fuel_guarded_inversion_FStar.Bijection.bijection))
  :named fuel_guarded_inversion_FStar.Bijection.bijection))
; inversion axiom
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,5-54,11); use=FStar.Pervasives.Native.fst(54,5-54,11)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@u3 Universe) (@x4 Term) (@x5 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (FStar.Pervasives.Native.tuple2 @u2 @u3 @x4 @x5))
     (and
      (is-FStar.Pervasives.Native.Mktuple2 @x1)
      (= @u2 (FStar.Pervasives.Native.Mktuple2_@0 @x1))
      (= @u3 (FStar.Pervasives.Native.Mktuple2_@1 @x1))
      (= @x4 (FStar.Pervasives.Native.Mktuple2_@_a @x1))
      (= @x5 (FStar.Pervasives.Native.Mktuple2_@_b @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (FStar.Pervasives.Native.tuple2 @u2 @u3 @x4 @x5)))
    :qid fuel_guarded_inversion_FStar.Pervasives.Native.tuple2))
  :named fuel_guarded_inversion_FStar.Pervasives.Native.tuple2))
; function token typing
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(20,2-20,6); use=FStar.Bijection.fsti(20,2-20,6)
  (forall ((@u0 Universe) (@u1 Universe))
   (! (HasType
     (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1)
     (Tm_arrow_1be4c7045871ee049c09a677875e1d62 @u0 @u1))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1))
    :qid function_token_typing_FStar.Bijection.__proj__Mkbijection__item__left))
  :named function_token_typing_FStar.Bijection.__proj__Mkbijection__item__left))
; function token typing
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,2-25,12); use=FStar.Bijection.fsti(25,2-25,12)
  (forall ((@u0 Universe) (@u1 Universe))
   (! (HasType
     (FStar.Bijection.__proj__Mkbijection__item__left_right@tok @u0 @u1)
     (Tm_arrow_d56333a8396b1b84e7de7c0febdd324e @u0 @u1))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left_right@tok @u0 @u1))
    :qid function_token_typing_FStar.Bijection.__proj__Mkbijection__item__left_right))
  :named function_token_typing_FStar.Bijection.__proj__Mkbijection__item__left_right))
; function token typing
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(19,2-19,7); use=FStar.Bijection.fsti(19,2-19,7)
  (forall ((@u0 Universe) (@u1 Universe))
   (! (HasType
     (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1)
     (Tm_arrow_060ca3b8637c2d96c521210b38e0612a @u0 @u1))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1))
    :qid function_token_typing_FStar.Bijection.__proj__Mkbijection__item__right))
  :named function_token_typing_FStar.Bijection.__proj__Mkbijection__item__right))
; function token typing
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,2-26,12); use=FStar.Bijection.fsti(26,2-26,12)
  (forall ((@u0 Universe) (@u1 Universe))
   (! (HasType
     (FStar.Bijection.__proj__Mkbijection__item__right_left@tok @u0 @u1)
     (Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e @u0 @u1))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right_left@tok @u0 @u1))
    :qid function_token_typing_FStar.Bijection.__proj__Mkbijection__item__right_left))
  :named function_token_typing_FStar.Bijection.__proj__Mkbijection__item__right_left))
; function token typing
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named function_token_typing_Prims.eqtype))
; function token typing
;;; Fact-ids: Name Prims.int; Namespace Prims
(assert
 (! (HasType Prims.int Prims.eqtype) :named function_token_typing_Prims.int))
; function token typing
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Prims.nat (Tm_type U_zero)) :named function_token_typing_Prims.nat))
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
; function token typing
;;; Fact-ids: Name Pulse.Lib.Core.slprop; Namespace Pulse.Lib.Core
(assert
 (! (HasType Pulse.Lib.Core.slprop (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named function_token_typing_Pulse.Lib.Core.slprop))
; function token typing
;;; Fact-ids: Name Pulse.Lib.Core.timeless_emp; Namespace Pulse.Lib.Core
(assert
 (! (HasType
   Pulse.Lib.Core.timeless_emp
   (Prims.squash (Pulse.Lib.Core.timeless (Pulse.Lib.Core.emp Dummy_value))))
  :named function_token_typing_Pulse.Lib.Core.timeless_emp))
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
; haseq for Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(26,29-26,50)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (Valid
      (Prims.hasEq U_zero (Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069 @u0 @u1 @x2 @x3 @x4 @x5)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid
       (Prims.hasEq U_zero (Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069 @u0 @u1 @x2 @x3 @x4 @x5))))
    :qid haseqTm_refine_47ff2679a8a8ffdeaaf000fbb76d8069))
  :named haseqTm_refine_47ff2679a8a8ffdeaaf000fbb76d8069))
; haseq for Tm_refine_542f9d4f129664613f2483a6c88bc7c2
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_542f9d4f129664613f2483a6c88bc7c2))
; haseq for Tm_refine_64547470e4c037d472bbb742ab28412c
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_64547470e4c037d472bbb742ab28412c @x0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_64547470e4c037d472bbb742ab28412c @x0 @x1 @x2))))
    :qid haseqTm_refine_64547470e4c037d472bbb742ab28412c))
  :named haseqTm_refine_64547470e4c037d472bbb742ab28412c))
; haseq for Tm_refine_686a9abe504e09f7b6e412e0739db40c
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_686a9abe504e09f7b6e412e0739db40c @x0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_686a9abe504e09f7b6e412e0739db40c @x0 @x1 @x2))))
    :qid haseqTm_refine_686a9abe504e09f7b6e412e0739db40c))
  :named haseqTm_refine_686a9abe504e09f7b6e412e0739db40c))
; haseq for Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(25,29-25,50)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (Valid
      (Prims.hasEq U_zero (Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004 @u0 @u1 @x2 @x3 @x4 @x5)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid
       (Prims.hasEq U_zero (Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004 @u0 @u1 @x2 @x3 @x4 @x5))))
    :qid haseqTm_refine_6c374fb37c3a2e5ba384f4dc8b772004))
  :named haseqTm_refine_6c374fb37c3a2e5ba384f4dc8b772004))
; haseq for Tm_refine_9d6af3f3535473623f7aec2f0501897f
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq (U_succ U_zero) Tm_refine_9d6af3f3535473623f7aec2f0501897f))
   (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
  :named haseqTm_refine_9d6af3f3535473623f7aec2f0501897f))
; haseq for Tm_refine_a828023d3a7e4668dd6296b4c3d57fed
;;; Fact-ids: Name FStar.Fin.fin; Namespace FStar.Fin
(assert
 (! ;; def=FStar.Fin.fsti(40,19-40,43); use=FStar.Fin.fsti(40,19-40,43)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_a828023d3a7e4668dd6296b4c3d57fed @x0)))
     (Valid (Prims.hasEq U_zero Prims.int)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_a828023d3a7e4668dd6296b4c3d57fed @x0))))
    :qid haseqTm_refine_a828023d3a7e4668dd6296b4c3d57fed))
  :named haseqTm_refine_a828023d3a7e4668dd6296b4c3d57fed))
; haseq for Tm_refine_eaaf716b226d372cea862801f854423f
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(25,29-25,50)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_eaaf716b226d372cea862801f854423f @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid (Prims.hasEq U_zero (Tm_refine_eaaf716b226d372cea862801f854423f @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_eaaf716b226d372cea862801f854423f))
  :named haseqTm_refine_eaaf716b226d372cea862801f854423f))
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
; interpretation_Tm_abs_02dcd51cd1db8468db6f164cc37f6abb
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(157,25-157,27); use=FStar.Bijection.fsti(157,25-157,27)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (ApplyTT (Tm_abs_02dcd51cd1db8468db6f164cc37f6abb @x1 @x2) @x0) Tm_unit)
    :pattern ((ApplyTT (Tm_abs_02dcd51cd1db8468db6f164cc37f6abb @x1 @x2) @x0))
    :qid interpretation_Tm_abs_02dcd51cd1db8468db6f164cc37f6abb))
  :named interpretation_Tm_abs_02dcd51cd1db8468db6f164cc37f6abb))
; interpretation_Tm_abs_716795d33592764ee9cf62a80672da9a
;;; Fact-ids: Name FStar.Bijection.prod_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(144,12-144,32); use=FStar.Bijection.fsti(144,12-144,32)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (ApplyTT (Tm_abs_716795d33592764ee9cf62a80672da9a @x1 @x2) @x0)
     (Prims.op_Addition
      (Prims.op_Star
       (FStar.Pervasives.Native.__proj__Mktuple2__item___1
        U_zero
        U_zero
        (FStar.Fin.fin @x1)
        (FStar.Fin.fin @x2)
        @x0)
       @x2)
      (FStar.Pervasives.Native.__proj__Mktuple2__item___2
       U_zero
       U_zero
       (FStar.Fin.fin @x1)
       (FStar.Fin.fin @x2)
       @x0)))
    :pattern ((ApplyTT (Tm_abs_716795d33592764ee9cf62a80672da9a @x1 @x2) @x0))
    :qid interpretation_Tm_abs_716795d33592764ee9cf62a80672da9a))
  :named interpretation_Tm_abs_716795d33592764ee9cf62a80672da9a))
; interpretation_Tm_abs_92db0263ba330856acce3e8323d339a2
;;; Fact-ids: Name FStar.Bijection.prod_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(149,11-149,27); use=FStar.Bijection.fsti(149,11-149,27)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (ApplyTT (Tm_abs_92db0263ba330856acce3e8323d339a2 @x1 @x2) @x0)
     (FStar.Pervasives.Native.Mktuple2
      U_zero
      U_zero
      (FStar.Fin.fin @x1)
      (FStar.Fin.fin @x2)
      (Prims.op_Division @x0 @x2)
      (Prims.op_Modulus @x0 @x2)))
    :pattern ((ApplyTT (Tm_abs_92db0263ba330856acce3e8323d339a2 @x1 @x2) @x0))
    :qid interpretation_Tm_abs_92db0263ba330856acce3e8323d339a2))
  :named interpretation_Tm_abs_92db0263ba330856acce3e8323d339a2))
; interpretation_Tm_abs_93184d47a541ad3b3f97af2a43d7cb12
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(156,25-156,27); use=FStar.Bijection.fsti(156,25-156,27)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (ApplyTT (Tm_abs_93184d47a541ad3b3f97af2a43d7cb12 @x1 @x2) @x0) Tm_unit)
    :pattern ((ApplyTT (Tm_abs_93184d47a541ad3b3f97af2a43d7cb12 @x1 @x2) @x0))
    :qid interpretation_Tm_abs_93184d47a541ad3b3f97af2a43d7cb12))
  :named interpretation_Tm_abs_93184d47a541ad3b3f97af2a43d7cb12))
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! (and
   ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
   (forall ((@u0 Universe) (@u1 Universe))
    (! (IsTotFun (FStar.Bijection.bijection@tok @u0 @u1))
     :pattern ((FStar.Bijection.bijection@tok @u0 @u1))
     :qid kinding_FStar.Bijection.bijection@tok))
   ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
   (forall ((@u0 Universe) (@u1 Universe) (@x2 Term))
    (! (IsTotFun (ApplyTT (FStar.Bijection.bijection@tok @u0 @u1) @x2))
     :pattern ((ApplyTT (FStar.Bijection.bijection@tok @u0 @u1) @x2))
     :qid kinding_FStar.Bijection.bijection@tok.1))
   ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
   (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
    (! (implies
      (and (HasType @x2 (Tm_type @u0)) (HasType @x3 (Tm_type @u1)))
      (HasType (FStar.Bijection.bijection @u0 @u1 @x2 @x3) (Tm_type (U_max @u0 @u1))))
     :pattern ((FStar.Bijection.bijection @u0 @u1 @x2 @x3))
     :qid kinding_FStar.Bijection.bijection@tok.2)))
  :named kinding_FStar.Bijection.bijection@tok))
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! (and
   ;; def=FStar.Pervasives.Native.fst(54,5-54,11); use=FStar.Pervasives.Native.fst(54,5-54,11)
   (forall ((@u0 Universe) (@u1 Universe))
    (! (IsTotFun (FStar.Pervasives.Native.tuple2@tok @u0 @u1))
     :pattern ((FStar.Pervasives.Native.tuple2@tok @u0 @u1))
     :qid kinding_FStar.Pervasives.Native.tuple2@tok))
   ;; def=FStar.Pervasives.Native.fst(54,5-54,11); use=FStar.Pervasives.Native.fst(54,5-54,11)
   (forall ((@u0 Universe) (@u1 Universe) (@x2 Term))
    (! (IsTotFun (ApplyTT (FStar.Pervasives.Native.tuple2@tok @u0 @u1) @x2))
     :pattern ((ApplyTT (FStar.Pervasives.Native.tuple2@tok @u0 @u1) @x2))
     :qid kinding_FStar.Pervasives.Native.tuple2@tok.1))
   ;; def=FStar.Pervasives.Native.fst(54,5-54,11); use=FStar.Pervasives.Native.fst(54,5-54,11)
   (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
    (! (implies
      (and (HasType @x2 (Tm_type @u0)) (HasType @x3 (Tm_type @u1)))
      (HasType (FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3) (Tm_type (U_max @u0 @u1))))
     :pattern ((FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3))
     :qid kinding_FStar.Pervasives.Native.tuple2@tok.2)))
  :named kinding_FStar.Pervasives.Native.tuple2@tok))
; kinding_Tm_arrow_060ca3b8637c2d96c521210b38e0612a
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
  (forall ((@u0 Universe) (@u1 Universe))
   (! (HasType
     (Tm_arrow_060ca3b8637c2d96c521210b38e0612a @u0 @u1)
     (Tm_type (U_max (U_succ @u0) (U_succ @u1))))
    :pattern
     ((HasType
       (Tm_arrow_060ca3b8637c2d96c521210b38e0612a @u0 @u1)
       (Tm_type (U_max (U_succ @u0) (U_succ @u1)))))
    :qid kinding_Tm_arrow_060ca3b8637c2d96c521210b38e0612a))
  :named kinding_Tm_arrow_060ca3b8637c2d96c521210b38e0612a))
; kinding_Tm_arrow_0f35761274ca69a14275931c21a813bb
;;; Fact-ids: Name FStar.Bijection.prod_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(142,31-142,63); use=FStar.Bijection.fsti(142,31-142,63)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_arrow_0f35761274ca69a14275931c21a813bb @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_arrow_0f35761274ca69a14275931c21a813bb @x0 @x1) (Tm_type U_zero)))
    :qid kinding_Tm_arrow_0f35761274ca69a14275931c21a813bb))
  :named kinding_Tm_arrow_0f35761274ca69a14275931c21a813bb))
; kinding_Tm_arrow_1be4c7045871ee049c09a677875e1d62
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,26); use=FStar.Bijection.fsti(16,5-16,26)
  (forall ((@u0 Universe) (@u1 Universe))
   (! (HasType
     (Tm_arrow_1be4c7045871ee049c09a677875e1d62 @u0 @u1)
     (Tm_type (U_max (U_succ @u0) (U_succ @u1))))
    :pattern
     ((HasType
       (Tm_arrow_1be4c7045871ee049c09a677875e1d62 @u0 @u1)
       (Tm_type (U_max (U_succ @u0) (U_succ @u1)))))
    :qid kinding_Tm_arrow_1be4c7045871ee049c09a677875e1d62))
  :named kinding_Tm_arrow_1be4c7045871ee049c09a677875e1d62))
; kinding_Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556
;;; Fact-ids: Name Pulse.Lib.ForEvery.pad_f; Namespace Pulse.Lib.ForEvery
(assert
 (! ;; def=Pulse.Lib.ForEvery.fsti(753,7-753,23); use=Pulse.Lib.ForEvery.fsti(753,7-753,23)
  (forall ((@x0 Term))
   (! (HasType
     (Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556 @x0)
     (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
    :pattern
     ((HasType
       (Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556 @x0)
       (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero)))))))
    :qid kinding_Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556))
  :named kinding_Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556))
; kinding_Tm_arrow_627bcf56012300e4469ebee878e555ad
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,16-25,50); use=FStar.Bijection.fsti(16,16-25,50)
  (forall ((@x0 Term) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (HasType (Tm_arrow_627bcf56012300e4469ebee878e555ad @x0 @u1 @u2 @x3 @x4) (Tm_type @u1))
    :pattern
     ((HasType (Tm_arrow_627bcf56012300e4469ebee878e555ad @x0 @u1 @u2 @x3 @x4) (Tm_type @u1)))
    :qid kinding_Tm_arrow_627bcf56012300e4469ebee878e555ad))
  :named kinding_Tm_arrow_627bcf56012300e4469ebee878e555ad))
; kinding_Tm_arrow_639fb86eafca03dd3a88807b06edb60c
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,18-26,50); use=FStar.Bijection.fsti(16,18-26,50)
  (forall ((@x0 Term) (@u1 Universe) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (HasType (Tm_arrow_639fb86eafca03dd3a88807b06edb60c @x0 @u1 @u2 @x3 @x4) (Tm_type @u1))
    :pattern
     ((HasType (Tm_arrow_639fb86eafca03dd3a88807b06edb60c @x0 @u1 @u2 @x3 @x4) (Tm_type @u1)))
    :qid kinding_Tm_arrow_639fb86eafca03dd3a88807b06edb60c))
  :named kinding_Tm_arrow_639fb86eafca03dd3a88807b06edb60c))
; kinding_Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-26,50); use=FStar.Bijection.fsti(16,5-26,50)
  (forall ((@u0 Universe) (@u1 Universe))
   (! (HasType
     (Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e @u0 @u1)
     (Tm_type (U_max (U_succ @u0) (U_succ @u1))))
    :pattern
     ((HasType
       (Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e @u0 @u1)
       (Tm_type (U_max (U_succ @u0) (U_succ @u1)))))
    :qid kinding_Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e))
  :named kinding_Tm_arrow_7e2f3121fc8515c5f33b8c4173de207e))
; kinding_Tm_arrow_96427c7f0a998147608e7515990a5dc6
;;; Fact-ids: Name FStar.Bijection.prod_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(148,30-148,62); use=FStar.Bijection.fsti(148,30-148,62)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_arrow_96427c7f0a998147608e7515990a5dc6 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_arrow_96427c7f0a998147608e7515990a5dc6 @x0 @x1) (Tm_type U_zero)))
    :qid kinding_Tm_arrow_96427c7f0a998147608e7515990a5dc6))
  :named kinding_Tm_arrow_96427c7f0a998147608e7515990a5dc6))
; kinding_Tm_arrow_a2587164785c2b25dd61bca17ad55db6
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,22-152,68); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_arrow_a2587164785c2b25dd61bca17ad55db6 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_arrow_a2587164785c2b25dd61bca17ad55db6 @x0 @x1) (Tm_type U_zero)))
    :qid kinding_Tm_arrow_a2587164785c2b25dd61bca17ad55db6))
  :named kinding_Tm_arrow_a2587164785c2b25dd61bca17ad55db6))
; kinding_Tm_arrow_a98aab798ae82be87b51dadd06053d91
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,22-152,51); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_arrow_a98aab798ae82be87b51dadd06053d91 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_arrow_a98aab798ae82be87b51dadd06053d91 @x0 @x1) (Tm_type U_zero)))
    :qid kinding_Tm_arrow_a98aab798ae82be87b51dadd06053d91))
  :named kinding_Tm_arrow_a98aab798ae82be87b51dadd06053d91))
; kinding_Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,16-25,50); use=FStar.Bijection.fsti(25,17-25,50)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777 @x0 @u1 @x2 @x3) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777 @x0 @u1 @x2 @x3) (Tm_type @u1)))
    :qid kinding_Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777))
  :named kinding_Tm_arrow_c2aa84fb1808b6cf77429a98bf2ed777))
; kinding_Tm_arrow_d56333a8396b1b84e7de7c0febdd324e
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-25,50); use=FStar.Bijection.fsti(16,5-25,50)
  (forall ((@u0 Universe) (@u1 Universe))
   (! (HasType
     (Tm_arrow_d56333a8396b1b84e7de7c0febdd324e @u0 @u1)
     (Tm_type (U_max (U_succ @u0) (U_succ @u1))))
    :pattern
     ((HasType
       (Tm_arrow_d56333a8396b1b84e7de7c0febdd324e @u0 @u1)
       (Tm_type (U_max (U_succ @u0) (U_succ @u1)))))
    :qid kinding_Tm_arrow_d56333a8396b1b84e7de7c0febdd324e))
  :named kinding_Tm_arrow_d56333a8396b1b84e7de7c0febdd324e))
; kinding_Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd
;;; Fact-ids: Name FStar.List.Tot.Base.map_gtot; Namespace FStar.List.Tot.Base
(assert
 (! ;; def=FStar.List.Tot.Base.fst(208,14-208,18); use=FStar.List.Tot.Base.fst(208,22-208,33)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@u3 Universe))
   (! (HasType
     (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x0 @x1 @u2 @u3)
     (Tm_type (U_max @u3 @u2)))
    :pattern
     ((HasType
       (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x0 @x1 @u2 @u3)
       (Tm_type (U_max @u3 @u2))))
    :qid kinding_Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd))
  :named kinding_Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd))
; Lemma: FStar.Bijection.bij_inv_bk
;;; Fact-ids: Name FStar.Bijection.bij_inv_bk; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3))
      (HasType @x5 @x3))
     ;; def=FStar.Bijection.fsti(37,10-37,35); use=FStar.Bijection.fsti(37,10-37,35)
     (=
      @x5
      (ApplyTT
       (ApplyTT
        (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
        @x4)
       (ApplyTT
        (ApplyTT
         (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
         @x4)
        @x5))))
    :pattern
     ((ApplyTT
       (ApplyTT
        (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
        @x4)
       @x5))
    :qid lemma_FStar.Bijection.bij_inv_bk))
  :named lemma_FStar.Bijection.bij_inv_bk))
; Lemma: FStar.Bijection.bij_inv_fwd
;;; Fact-ids: Name FStar.Bijection.bij_inv_fwd; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3))
      (HasType @x5 @x2))
     ;; def=FStar.Bijection.fsti(33,10-33,35); use=FStar.Bijection.fsti(33,10-33,35)
     (=
      @x5
      (ApplyTT
       (ApplyTT
        (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
        @x4)
       (ApplyTT
        (ApplyTT
         (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
         @x4)
        @x5))))
    :pattern
     ((ApplyTT
       (ApplyTT
        (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
        @x4)
       @x5))
    :qid lemma_FStar.Bijection.bij_inv_fwd))
  :named lemma_FStar.Bijection.bij_inv_fwd))
; Lemma: FStar.Bijection.inv_lemma_pat
;;; Fact-ids: Name FStar.Bijection.inv_lemma_pat; Namespace FStar.Bijection
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3))
      (HasType @x5 @x2)
      (HasType @x6 @x3))
     ;; def=FStar.Bijection.fsti(55,10-55,44); use=FStar.Bijection.fsti(55,10-55,44)
     (iff
      ;; def=FStar.Bijection.fsti(55,11-55,24); use=FStar.Bijection.fsti(55,11-55,24)
      (= (FStar.Bijection.op_Greater_Greater @u0 @u1 @x2 @x3 @x5 @x4) @x6)
      ;; def=FStar.Bijection.fsti(55,30-55,43); use=FStar.Bijection.fsti(55,30-55,43)
      (= @x5 (FStar.Bijection.op_Less_Less @u0 @u1 @x2 @x3 @x6 @x4))))
    :pattern
     ((ApplyTT
       (ApplyTT
        (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
        @x4)
       @x5)
      (ApplyTT
       (ApplyTT
        (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
        @x4)
       @x6))
    :qid lemma_FStar.Bijection.inv_lemma_pat))
  :named lemma_FStar.Bijection.inv_lemma_pat))
; Lemma: Pulse.Lib.ForEvery.timeless_emp
;;; Fact-ids: Name Pulse.Lib.ForEvery.timeless_emp; Namespace Pulse.Lib.ForEvery
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (and
      (HasType @x0 Pulse.Lib.Core.slprop)
      ;; def=Pulse.Lib.ForEvery.fst(14,12-14,18); use=Pulse.Lib.ForEvery.fst(14,12-14,18)
      (= @x0 (Pulse.Lib.Core.emp Dummy_value)))
     ;; def=Pulse.Lib.ForEvery.fst(15,11-15,21); use=Pulse.Lib.ForEvery.fst(15,11-15,21)
     (Valid
      ;; def=Pulse.Lib.ForEvery.fst(15,11-15,21); use=Pulse.Lib.ForEvery.fst(15,11-15,21)
      (Pulse.Lib.Core.timeless @x0)))
    :pattern ((Pulse.Lib.Core.timeless @x0))
    :qid lemma_Pulse.Lib.ForEvery.timeless_emp))
  :named lemma_Pulse.Lib.ForEvery.timeless_emp))
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
;;; Fact-ids: Name Pulse.Lib.Core.hide_div; Namespace Pulse.Lib.Core
(assert
 (! ;; def=Pulse.Lib.Core.fsti(261,30-261,57); use=Pulse.Lib.Core.fsti(261,30-261,57)
  (forall ((@u0 Universe))
   (! ;; def=Pulse.Lib.Core.fsti(261,30-261,57); use=Pulse.Lib.Core.fsti(261,30-261,57)
    (forall ((@x1 Term) (@x2 Term) (@x3 Term))
     (! (implies
       (and
        (HasType @x1 (Tm_type @u0))
        (HasType @x2 Pulse.Lib.Core.slprop)
        (HasType @x3 (Tm_arrow_8f4d0c93d793badb913a85a0bb821c13 @x1 @u0)))
       (HasType
        (Non_total_Tm_arrow_7e78837dcb1f142ad47da22490524d1e @x1 @x2 @x3)
        (Tm_type U_unknown)))
      :pattern
       ((HasType
         (Non_total_Tm_arrow_7e78837dcb1f142ad47da22490524d1e @x1 @x2 @x3)
         (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_7e78837dcb1f142ad47da22490524d1e.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_7e78837dcb1f142ad47da22490524d1e))
  :named non_total_function_typing_Non_total_Tm_arrow_7e78837dcb1f142ad47da22490524d1e))
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
; Projector equation
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(20,2-20,6); use=FStar.Bijection.fsti(20,2-20,6)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (FStar.Bijection.Mkbijection_@left @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid proj_equation_FStar.Bijection.Mkbijection_@left))
  :named proj_equation_FStar.Bijection.Mkbijection_@left))
; Projector equation
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,2-25,12); use=FStar.Bijection.fsti(25,2-25,12)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left_right @u0 @u1 @x2 @x3 @x4)
     (FStar.Bijection.Mkbijection_@left_right @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left_right @u0 @u1 @x2 @x3 @x4))
    :qid proj_equation_FStar.Bijection.Mkbijection_@left_right))
  :named proj_equation_FStar.Bijection.Mkbijection_@left_right))
; Projector equation
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(19,2-19,7); use=FStar.Bijection.fsti(19,2-19,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
     (FStar.Bijection.Mkbijection_@right @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid proj_equation_FStar.Bijection.Mkbijection_@right))
  :named proj_equation_FStar.Bijection.Mkbijection_@right))
; Projector equation
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,2-26,12); use=FStar.Bijection.fsti(26,2-26,12)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__right_left @u0 @u1 @x2 @x3 @x4)
     (FStar.Bijection.Mkbijection_@right_left @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right_left @u0 @u1 @x2 @x3 @x4))
    :qid proj_equation_FStar.Bijection.Mkbijection_@right_left))
  :named proj_equation_FStar.Bijection.Mkbijection_@right_left))
; Projector equation
;;; Fact-ids: Name FStar.Pervasives.Native.__proj__Mktuple2__item___1; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,33-54,35); use=FStar.Pervasives.Native.fst(54,33-54,35)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Pervasives.Native.__proj__Mktuple2__item___1 @u0 @u1 @x2 @x3 @x4)
     (FStar.Pervasives.Native.Mktuple2_@_1 @x4))
    :pattern ((FStar.Pervasives.Native.__proj__Mktuple2__item___1 @u0 @u1 @x2 @x3 @x4))
    :qid proj_equation_FStar.Pervasives.Native.Mktuple2_@_1))
  :named proj_equation_FStar.Pervasives.Native.Mktuple2_@_1))
; Projector equation
;;; Fact-ids: Name FStar.Pervasives.Native.__proj__Mktuple2__item___2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,43-54,45); use=FStar.Pervasives.Native.fst(54,43-54,45)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Pervasives.Native.__proj__Mktuple2__item___2 @u0 @u1 @x2 @x3 @x4)
     (FStar.Pervasives.Native.Mktuple2_@_2 @x4))
    :pattern ((FStar.Pervasives.Native.__proj__Mktuple2__item___2 @u0 @u1 @x2 @x3 @x4))
    :qid proj_equation_FStar.Pervasives.Native.Mktuple2_@_2))
  :named proj_equation_FStar.Pervasives.Native.Mktuple2_@_2))
; Projection inverse
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (FStar.Bijection.Mkbijection_@0 (FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
     @u0)
    :pattern ((FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.Bijection.Mkbijection_@0))
  :named projection_inverse_FStar.Bijection.Mkbijection_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (FStar.Bijection.Mkbijection_@1 (FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
     @u1)
    :pattern ((FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.Bijection.Mkbijection_@1))
  :named projection_inverse_FStar.Bijection.Mkbijection_@1))
; Projection inverse
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (FStar.Bijection.Mkbijection_@a (FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
     @x2)
    :pattern ((FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.Bijection.Mkbijection_@a))
  :named projection_inverse_FStar.Bijection.Mkbijection_@a))
; Projection inverse
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (FStar.Bijection.Mkbijection_@b (FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
     @x3)
    :pattern ((FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.Bijection.Mkbijection_@b))
  :named projection_inverse_FStar.Bijection.Mkbijection_@b))
; Projection inverse
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (FStar.Bijection.Mkbijection_@left
      (FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
     @x5)
    :pattern ((FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.Bijection.Mkbijection_@left))
  :named projection_inverse_FStar.Bijection.Mkbijection_@left))
; Projection inverse
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (FStar.Bijection.Mkbijection_@left_right
      (FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
     @x6)
    :pattern ((FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.Bijection.Mkbijection_@left_right))
  :named projection_inverse_FStar.Bijection.Mkbijection_@left_right))
; Projection inverse
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (FStar.Bijection.Mkbijection_@right
      (FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
     @x4)
    :pattern ((FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.Bijection.Mkbijection_@right))
  :named projection_inverse_FStar.Bijection.Mkbijection_@right))
; Projection inverse
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (FStar.Bijection.Mkbijection_@right_left
      (FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
     @x7)
    :pattern ((FStar.Bijection.Mkbijection @u0 @u1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.Bijection.Mkbijection_@right_left))
  :named projection_inverse_FStar.Bijection.Mkbijection_@right_left))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple2_@0 (FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
     @u0)
    :pattern ((FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple2_@0))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple2_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple2_@1 (FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
     @u1)
    :pattern ((FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple2_@1))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple2_@1))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple2_@_1
      (FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
     @x4)
    :pattern ((FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple2_@_1))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple2_@_1))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple2_@_2
      (FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
     @x5)
    :pattern ((FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple2_@_2))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple2_@_2))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple2_@_a
      (FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
     @x2)
    :pattern ((FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple2_@_a))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple2_@_a))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Pervasives.Native.Mktuple2_@_b
      (FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
     @x3)
    :pattern ((FStar.Pervasives.Native.Mktuple2 @u0 @u1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Pervasives.Native.Mktuple2_@_b))
  :named projection_inverse_FStar.Pervasives.Native.Mktuple2_@_b))
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
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(26,29-26,50)
  (forall
    ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@u3 Universe) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069 @u2 @u3 @x4 @x5 @x6 @x7))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(26,29-26,50)
      (=
       (ApplyTT
        (ApplyTT
         (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u3 @u2) @x4) @x5)
         @x6)
        (ApplyTT
         (ApplyTT
          (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u3 @u2) @x4) @x5)
          @x6)
         @x7))
       @x7)))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069 @u2 @u3 @x4 @x5 @x6 @x7)))
    :qid refinement_interpretation_Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069))
  :named refinement_interpretation_Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069))
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
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_64547470e4c037d472bbb742ab28412c @x2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(154,2-157,29)
      (=
       (ApplyTT
        (Tm_abs_92db0263ba330856acce3e8323d339a2 @x2 @x3)
        (ApplyTT (Tm_abs_716795d33592764ee9cf62a80672da9a @x2 @x3) @x4))
       @x4)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_64547470e4c037d472bbb742ab28412c @x2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_64547470e4c037d472bbb742ab28412c))
  :named refinement_interpretation_Tm_refine_64547470e4c037d472bbb742ab28412c))
; refinement_interpretation
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_686a9abe504e09f7b6e412e0739db40c @x2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(154,2-157,29)
      (=
       (ApplyTT
        (Tm_abs_716795d33592764ee9cf62a80672da9a @x2 @x3)
        (ApplyTT (Tm_abs_92db0263ba330856acce3e8323d339a2 @x2 @x3) @x4))
       @x4)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_686a9abe504e09f7b6e412e0739db40c @x2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_686a9abe504e09f7b6e412e0739db40c))
  :named refinement_interpretation_Tm_refine_686a9abe504e09f7b6e412e0739db40c))
; refinement_interpretation
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(25,29-25,50)
  (forall
    ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@u3 Universe) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004 @u2 @u3 @x4 @x5 @x6 @x7))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(25,29-25,50)
      (=
       (ApplyTT
        (ApplyTT
         (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u2 @u3) @x4) @x5)
         @x6)
        (ApplyTT
         (ApplyTT
          (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u2 @u3) @x4) @x5)
          @x6)
         @x7))
       @x7)))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004 @u2 @u3 @x4 @x5 @x6 @x7)))
    :qid refinement_interpretation_Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004))
  :named refinement_interpretation_Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004))
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
;;; Fact-ids: Name FStar.Fin.fin; Namespace FStar.Fin
(assert
 (! ;; def=FStar.Fin.fsti(40,19-40,43); use=FStar.Fin.fsti(40,19-40,43)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_a828023d3a7e4668dd6296b4c3d57fed @x2))
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      ;; def=FStar.Fin.fsti(40,27-40,33); use=FStar.Fin.fsti(40,27-40,33)
      (<= (BoxInt_proj_0 (BoxInt 0)) (BoxInt_proj_0 @x1))
      ;; def=FStar.Fin.fsti(40,37-40,42); use=FStar.Fin.fsti(40,37-40,42)
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 @x2))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_a828023d3a7e4668dd6296b4c3d57fed @x2)))
    :qid refinement_interpretation_Tm_refine_a828023d3a7e4668dd6296b4c3d57fed))
  :named refinement_interpretation_Tm_refine_a828023d3a7e4668dd6296b4c3d57fed))
; refinement_interpretation
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(25,29-25,50)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_eaaf716b226d372cea862801f854423f @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(25,29-25,50)
      (= (ApplyTT @x3 (ApplyTT @x4 @x5)) @x5)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_eaaf716b226d372cea862801f854423f @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_eaaf716b226d372cea862801f854423f))
  :named refinement_interpretation_Tm_refine_eaaf716b226d372cea862801f854423f))
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
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(26,29-26,50)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (HasType (Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069 @u0 @u1 @x2 @x3 @x4 @x5) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069 @u0 @u1 @x2 @x3 @x4 @x5) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069))
  :named refinement_kinding_Tm_refine_47ff2679a8a8ffdeaaf000fbb76d8069))
; refinement kinding
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Tm_refine_542f9d4f129664613f2483a6c88bc7c2 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
; refinement kinding
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_64547470e4c037d472bbb742ab28412c @x0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_64547470e4c037d472bbb742ab28412c @x0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_64547470e4c037d472bbb742ab28412c))
  :named refinement_kinding_Tm_refine_64547470e4c037d472bbb742ab28412c))
; refinement kinding
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(154,2-157,29)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_686a9abe504e09f7b6e412e0739db40c @x0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_686a9abe504e09f7b6e412e0739db40c @x0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_686a9abe504e09f7b6e412e0739db40c))
  :named refinement_kinding_Tm_refine_686a9abe504e09f7b6e412e0739db40c))
; refinement kinding
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(25,29-25,50)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (HasType (Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004 @u0 @u1 @x2 @x3 @x4 @x5) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004 @u0 @u1 @x2 @x3 @x4 @x5) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004))
  :named refinement_kinding_Tm_refine_6c374fb37c3a2e5ba384f4dc8b772004))
; refinement kinding
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Tm_refine_9d6af3f3535473623f7aec2f0501897f (Tm_type (U_succ U_zero)))
  :named refinement_kinding_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; refinement kinding
;;; Fact-ids: Name FStar.Fin.fin; Namespace FStar.Fin
(assert
 (! ;; def=FStar.Fin.fsti(40,19-40,43); use=FStar.Fin.fsti(40,19-40,43)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_a828023d3a7e4668dd6296b4c3d57fed @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_a828023d3a7e4668dd6296b4c3d57fed @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_a828023d3a7e4668dd6296b4c3d57fed))
  :named refinement_kinding_Tm_refine_a828023d3a7e4668dd6296b4c3d57fed))
; refinement kinding
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(25,29-25,50)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_eaaf716b226d372cea862801f854423f @u0 @x1 @x2 @x3) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_eaaf716b226d372cea862801f854423f @u0 @x1 @x2 @x3) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_eaaf716b226d372cea862801f854423f))
  :named refinement_kinding_Tm_refine_eaaf716b226d372cea862801f854423f))
; subterm ordering
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term)
     (@x9 Term)
     (@x10 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)
      (FStar.Bijection.bijection @u1 @u2 @x9 @x10))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x5
        (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x6
        (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x7
        (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x8
        (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Bijection.Mkbijection @u1 @u2 @x3 @x4 @x5 @x6 @x7 @x8)
       (FStar.Bijection.bijection @u1 @u2 @x9 @x10)))
    :qid subterm_ordering_FStar.Bijection.Mkbijection))
  :named subterm_ordering_FStar.Bijection.Mkbijection))
; subterm ordering
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,22-54,30); use=FStar.Pervasives.Native.fst(54,22-54,30)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Native.Mktuple2 @u1 @u2 @x3 @x4 @x5 @x6)
      (FStar.Pervasives.Native.tuple2 @u1 @u2 @x7 @x8))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x5
        (FStar.Pervasives.Native.Mktuple2 @u1 @u2 @x3 @x4 @x5 @x6)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x6
        (FStar.Pervasives.Native.Mktuple2 @u1 @u2 @x3 @x4 @x5 @x6)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Native.Mktuple2 @u1 @u2 @x3 @x4 @x5 @x6)
       (FStar.Pervasives.Native.tuple2 @u1 @u2 @x7 @x8)))
    :qid subterm_ordering_FStar.Pervasives.Native.Mktuple2))
  :named subterm_ordering_FStar.Pervasives.Native.Mktuple2))
; Name-token correspondence
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(20,2-20,6); use=FStar.Bijection.fsti(20,2-20,6)
  (forall ((@u0 Universe) (@u1 Universe))
   (! ;; def=FStar.Bijection.fsti(20,2-20,6); use=FStar.Bijection.fsti(20,2-20,6)
    (forall ((@x2 Term) (@x3 Term) (@x4 Term))
     (! (=
       (ApplyTT
        (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
        @x4)
       (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
      :pattern
       ((ApplyTT
         (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
         @x4))
      :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
      :qid token_correspondence_FStar.Bijection.__proj__Mkbijection__item__left.1))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1))
    :qid token_correspondence_FStar.Bijection.__proj__Mkbijection__item__left))
  :named token_correspondence_FStar.Bijection.__proj__Mkbijection__item__left))
; Name-token correspondence
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,2-25,12); use=FStar.Bijection.fsti(25,2-25,12)
  (forall ((@u0 Universe) (@u1 Universe))
   (! ;; def=FStar.Bijection.fsti(25,2-25,12); use=FStar.Bijection.fsti(25,2-25,12)
    (forall ((@x2 Term) (@x3 Term) (@x4 Term))
     (! (=
       (ApplyTT
        (ApplyTT
         (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left_right@tok @u0 @u1) @x2)
         @x3)
        @x4)
       (FStar.Bijection.__proj__Mkbijection__item__left_right @u0 @u1 @x2 @x3 @x4))
      :pattern
       ((ApplyTT
         (ApplyTT
          (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left_right@tok @u0 @u1) @x2)
          @x3)
         @x4))
      :pattern ((FStar.Bijection.__proj__Mkbijection__item__left_right @u0 @u1 @x2 @x3 @x4))
      :qid token_correspondence_FStar.Bijection.__proj__Mkbijection__item__left_right.1))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left_right@tok @u0 @u1))
    :qid token_correspondence_FStar.Bijection.__proj__Mkbijection__item__left_right))
  :named token_correspondence_FStar.Bijection.__proj__Mkbijection__item__left_right))
; Name-token correspondence
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(19,2-19,7); use=FStar.Bijection.fsti(19,2-19,7)
  (forall ((@u0 Universe) (@u1 Universe))
   (! ;; def=FStar.Bijection.fsti(19,2-19,7); use=FStar.Bijection.fsti(19,2-19,7)
    (forall ((@x2 Term) (@x3 Term) (@x4 Term))
     (! (=
       (ApplyTT
        (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
        @x4)
       (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
      :pattern
       ((ApplyTT
         (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1) @x2) @x3)
         @x4))
      :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
      :qid token_correspondence_FStar.Bijection.__proj__Mkbijection__item__right.1))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right@tok @u0 @u1))
    :qid token_correspondence_FStar.Bijection.__proj__Mkbijection__item__right))
  :named token_correspondence_FStar.Bijection.__proj__Mkbijection__item__right))
; Name-token correspondence
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,2-26,12); use=FStar.Bijection.fsti(26,2-26,12)
  (forall ((@u0 Universe) (@u1 Universe))
   (! ;; def=FStar.Bijection.fsti(26,2-26,12); use=FStar.Bijection.fsti(26,2-26,12)
    (forall ((@x2 Term) (@x3 Term) (@x4 Term))
     (! (=
       (ApplyTT
        (ApplyTT
         (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right_left@tok @u0 @u1) @x2)
         @x3)
        @x4)
       (FStar.Bijection.__proj__Mkbijection__item__right_left @u0 @u1 @x2 @x3 @x4))
      :pattern
       ((ApplyTT
         (ApplyTT
          (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__right_left@tok @u0 @u1) @x2)
          @x3)
         @x4))
      :pattern ((FStar.Bijection.__proj__Mkbijection__item__right_left @u0 @u1 @x2 @x3 @x4))
      :qid token_correspondence_FStar.Bijection.__proj__Mkbijection__item__right_left.1))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right_left@tok @u0 @u1))
    :qid token_correspondence_FStar.Bijection.__proj__Mkbijection__item__right_left))
  :named token_correspondence_FStar.Bijection.__proj__Mkbijection__item__right_left))
; name-token correspondence
;;; Fact-ids: Name FStar.Bijection.bijection; Namespace FStar.Bijection; Name FStar.Bijection.Mkbijection; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(16,5-16,14); use=FStar.Bijection.fsti(16,5-16,14)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (=
     (ApplyTT (ApplyTT (FStar.Bijection.bijection@tok @u0 @u1) @x2) @x3)
     (FStar.Bijection.bijection @u0 @u1 @x2 @x3))
    :pattern ((ApplyTT (ApplyTT (FStar.Bijection.bijection@tok @u0 @u1) @x2) @x3))
    :pattern ((FStar.Bijection.bijection @u0 @u1 @x2 @x3))
    :qid token_correspondence_FStar.Bijection.bijection@tok))
  :named token_correspondence_FStar.Bijection.bijection@tok))
; name-token correspondence
;;; Fact-ids: Name FStar.Pervasives.Native.tuple2; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Mktuple2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,5-54,11); use=FStar.Pervasives.Native.fst(54,5-54,11)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (=
     (ApplyTT (ApplyTT (FStar.Pervasives.Native.tuple2@tok @u0 @u1) @x2) @x3)
     (FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3))
    :pattern ((ApplyTT (ApplyTT (FStar.Pervasives.Native.tuple2@tok @u0 @u1) @x2) @x3))
    :pattern ((FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3))
    :qid token_correspondence_FStar.Pervasives.Native.tuple2@tok))
  :named token_correspondence_FStar.Pervasives.Native.tuple2@tok))
; free var typing
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(20,2-20,6); use=FStar.Bijection.fsti(20,2-20,6)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Bijection.bijection @u0 @u1 @x2 @x3)))
     (HasType
      (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
      (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x3 @x2 @u1 @u0)))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.Bijection.__proj__Mkbijection__item__left))
  :named typing_FStar.Bijection.__proj__Mkbijection__item__left))
; free var typing
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__left_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(25,2-25,12); use=FStar.Bijection.fsti(25,2-25,12)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Bijection.bijection @u0 @u1 @x2 @x3)))
     (HasType
      (FStar.Bijection.__proj__Mkbijection__item__left_right @u0 @u1 @x2 @x3 @x4)
      (Tm_arrow_627bcf56012300e4469ebee878e555ad @x2 @u0 @u1 @x3 @x4)))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left_right @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.Bijection.__proj__Mkbijection__item__left_right))
  :named typing_FStar.Bijection.__proj__Mkbijection__item__left_right))
; free var typing
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(19,2-19,7); use=FStar.Bijection.fsti(19,2-19,7)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Bijection.bijection @u0 @u1 @x2 @x3)))
     (HasType
      (FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4)
      (Tm_ghost_arrow_3308f8dd0442925c6fc200fae307debd @x2 @x3 @u0 @u1)))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.Bijection.__proj__Mkbijection__item__right))
  :named typing_FStar.Bijection.__proj__Mkbijection__item__right))
; free var typing
;;; Fact-ids: Name FStar.Bijection.__proj__Mkbijection__item__right_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(26,2-26,12); use=FStar.Bijection.fsti(26,2-26,12)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Bijection.bijection @u0 @u1 @x2 @x3)))
     (HasType
      (FStar.Bijection.__proj__Mkbijection__item__right_left @u0 @u1 @x2 @x3 @x4)
      (Tm_arrow_639fb86eafca03dd3a88807b06edb60c @x3 @u1 @u0 @x2 @x4)))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__right_left @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.Bijection.__proj__Mkbijection__item__right_left))
  :named typing_FStar.Bijection.__proj__Mkbijection__item__right_left))
; free var typing
;;; Fact-ids: Name FStar.Bijection.bij_sym; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(66,4-66,11); use=FStar.Bijection.fsti(66,4-66,11)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3)))
     (HasType
      (FStar.Bijection.bij_sym @u0 @u1 @x2 @x3 @x4)
      (FStar.Bijection.op_Equals_Tilde @u1 @u0 @x3 @x2)))
    :pattern ((FStar.Bijection.bij_sym @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.Bijection.bij_sym))
  :named typing_FStar.Bijection.bij_sym))
; free var typing
;;; Fact-ids: Name FStar.Bijection.op_Equals_Tilde; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(30,6-30,8); use=FStar.Bijection.fsti(30,6-30,8)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (implies
     (and (HasType @x2 (Tm_type @u0)) (HasType @x3 (Tm_type @u1)))
     (HasType (FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3) (Tm_type (U_max @u1 @u0))))
    :pattern ((FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3))
    :qid typing_FStar.Bijection.op_Equals_Tilde))
  :named typing_FStar.Bijection.op_Equals_Tilde))
; free var typing
;;; Fact-ids: Name FStar.Bijection.op_Greater_Greater; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(51,7-51,8); use=FStar.Bijection.fsti(51,7-51,8)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 @x2)
      (HasType @x5 (FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3)))
     (HasType (FStar.Bijection.op_Greater_Greater @u0 @u1 @x2 @x3 @x4 @x5) @x3))
    :pattern ((FStar.Bijection.op_Greater_Greater @u0 @u1 @x2 @x3 @x4 @x5))
    :qid typing_FStar.Bijection.op_Greater_Greater))
  :named typing_FStar.Bijection.op_Greater_Greater))
; free var typing
;;; Fact-ids: Name FStar.Bijection.op_Less_Less; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(52,6-52,8); use=FStar.Bijection.fsti(52,6-52,8)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 @x3)
      (HasType @x5 (FStar.Bijection.op_Equals_Tilde @u0 @u1 @x2 @x3)))
     (HasType (FStar.Bijection.op_Less_Less @u0 @u1 @x2 @x3 @x4 @x5) @x2))
    :pattern ((FStar.Bijection.op_Less_Less @u0 @u1 @x2 @x3 @x4 @x5))
    :qid typing_FStar.Bijection.op_Less_Less))
  :named typing_FStar.Bijection.op_Less_Less))
; free var typing
;;; Fact-ids: Name FStar.Fin.fin; Namespace FStar.Fin
(assert
 (! ;; def=FStar.Fin.fsti(40,4-40,7); use=FStar.Fin.fsti(40,4-40,7)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.int) (HasType (FStar.Fin.fin @x0) (Tm_type U_zero)))
    :pattern ((FStar.Fin.fin @x0))
    :qid typing_FStar.Fin.fin))
  :named typing_FStar.Fin.fin))
; free var typing
;;; Fact-ids: Name FStar.Pervasives.Native.__proj__Mktuple2__item___1; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,33-54,35); use=FStar.Pervasives.Native.fst(54,33-54,35)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3)))
     (HasType (FStar.Pervasives.Native.__proj__Mktuple2__item___1 @u0 @u1 @x2 @x3 @x4) @x2))
    :pattern ((FStar.Pervasives.Native.__proj__Mktuple2__item___1 @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.Pervasives.Native.__proj__Mktuple2__item___1))
  :named typing_FStar.Pervasives.Native.__proj__Mktuple2__item___1))
; free var typing
;;; Fact-ids: Name FStar.Pervasives.Native.__proj__Mktuple2__item___2; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(54,43-54,45); use=FStar.Pervasives.Native.fst(54,43-54,45)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (FStar.Pervasives.Native.tuple2 @u0 @u1 @x2 @x3)))
     (HasType (FStar.Pervasives.Native.__proj__Mktuple2__item___2 @u0 @u1 @x2 @x3 @x4) @x3))
    :pattern ((FStar.Pervasives.Native.__proj__Mktuple2__item___2 @u0 @u1 @x2 @x3 @x4))
    :qid typing_FStar.Pervasives.Native.__proj__Mktuple2__item___2))
  :named typing_FStar.Pervasives.Native.__proj__Mktuple2__item___2))
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
;;; Fact-ids: Name Prims.prop; Namespace Prims
(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named typing_Prims.prop))
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
;;; Fact-ids: Name Pulse.Lib.Core.emp; Namespace Pulse.Lib.Core
(assert
 (! ;; def=Pulse.Lib.Core.fsti(77,4-77,7); use=Pulse.Lib.Core.fsti(77,4-77,7)
  (forall ((@u0 Dummy_sort))
   (! (HasType (Pulse.Lib.Core.emp @u0) Pulse.Lib.Core.slprop)
    :pattern ((Pulse.Lib.Core.emp @u0))
    :qid typing_Pulse.Lib.Core.emp))
  :named typing_Pulse.Lib.Core.emp))
; free var typing
;;; Fact-ids: Name Pulse.Lib.Core.slprop; Namespace Pulse.Lib.Core
(assert
 (! (HasType Pulse.Lib.Core.slprop (Tm_type (U_succ (U_succ (U_succ (U_succ U_zero))))))
  :named typing_Pulse.Lib.Core.slprop))
; free var typing
;;; Fact-ids: Name Pulse.Lib.Core.timeless; Namespace Pulse.Lib.Core
(assert
 (! ;; def=Pulse.Lib.Core.fsti(73,4-73,12); use=Pulse.Lib.Core.fsti(73,4-73,12)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Pulse.Lib.Core.slprop)
     (HasType (Pulse.Lib.Core.timeless @x0) Prims.prop))
    :pattern ((Pulse.Lib.Core.timeless @x0))
    :qid typing_Pulse.Lib.Core.timeless))
  :named typing_Pulse.Lib.Core.timeless))
; free var typing
;;; Fact-ids: Name Pulse.Lib.Core.timeless_emp; Namespace Pulse.Lib.Core
(assert
 (! (HasType
   Pulse.Lib.Core.timeless_emp
   (Prims.squash (Pulse.Lib.Core.timeless (Pulse.Lib.Core.emp Dummy_value))))
  :named typing_Pulse.Lib.Core.timeless_emp))
; typing_Tm_abs_02dcd51cd1db8468db6f164cc37f6abb
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(157,25-157,27); use=FStar.Bijection.fsti(157,25-157,27)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType
     (Tm_abs_02dcd51cd1db8468db6f164cc37f6abb @x0 @x1)
     (Tm_arrow_a98aab798ae82be87b51dadd06053d91 @x0 @x1))
    :pattern ((Tm_abs_02dcd51cd1db8468db6f164cc37f6abb @x0 @x1))
    :qid typing_Tm_abs_02dcd51cd1db8468db6f164cc37f6abb))
  :named typing_Tm_abs_02dcd51cd1db8468db6f164cc37f6abb))
; typing_Tm_abs_716795d33592764ee9cf62a80672da9a
;;; Fact-ids: Name FStar.Bijection.prod_right; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(144,12-144,32); use=FStar.Bijection.fsti(144,12-144,32)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType
     (Tm_abs_716795d33592764ee9cf62a80672da9a @x0 @x1)
     (Tm_arrow_0f35761274ca69a14275931c21a813bb @x0 @x1))
    :pattern ((Tm_abs_716795d33592764ee9cf62a80672da9a @x0 @x1))
    :qid typing_Tm_abs_716795d33592764ee9cf62a80672da9a))
  :named typing_Tm_abs_716795d33592764ee9cf62a80672da9a))
; typing_Tm_abs_92db0263ba330856acce3e8323d339a2
;;; Fact-ids: Name FStar.Bijection.prod_left; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(149,11-149,27); use=FStar.Bijection.fsti(149,11-149,27)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType
     (Tm_abs_92db0263ba330856acce3e8323d339a2 @x0 @x1)
     (Tm_arrow_96427c7f0a998147608e7515990a5dc6 @x0 @x1))
    :pattern ((Tm_abs_92db0263ba330856acce3e8323d339a2 @x0 @x1))
    :qid typing_Tm_abs_92db0263ba330856acce3e8323d339a2))
  :named typing_Tm_abs_92db0263ba330856acce3e8323d339a2))
; typing_Tm_abs_93184d47a541ad3b3f97af2a43d7cb12
;;; Fact-ids: Name FStar.Bijection.bij_nat_prod; Namespace FStar.Bijection
(assert
 (! ;; def=FStar.Bijection.fsti(156,25-156,27); use=FStar.Bijection.fsti(156,25-156,27)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType
     (Tm_abs_93184d47a541ad3b3f97af2a43d7cb12 @x0 @x1)
     (Tm_arrow_a2587164785c2b25dd61bca17ad55db6 @x0 @x1))
    :pattern ((Tm_abs_93184d47a541ad3b3f97af2a43d7cb12 @x0 @x1))
    :qid typing_Tm_abs_93184d47a541ad3b3f97af2a43d7cb12))
  :named typing_Tm_abs_93184d47a541ad3b3f97af2a43d7cb12))
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
; Starting query at Pulse.Lib.ForEvery.fsti(354,19-354,33)
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
(declare-fun Tm_refine_b22acbf9af2a82235afc644243acbc3a (Term Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=Pulse.Lib.ForEvery.fst(1496,13-1496,40); use=Pulse.Lib.ForEvery.fst(1496,13-1496,40)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_b22acbf9af2a82235afc644243acbc3a @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_b22acbf9af2a82235afc644243acbc3a @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_b22acbf9af2a82235afc644243acbc3a))
  :named refinement_kinding_Tm_refine_b22acbf9af2a82235afc644243acbc3a))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=Pulse.Lib.ForEvery.fst(1496,13-1496,40); use=Pulse.Lib.ForEvery.fst(1496,13-1496,40)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_b22acbf9af2a82235afc644243acbc3a @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=Pulse.Lib.ForEvery.fst(1496,27-1496,29); use=Pulse.Lib.ForEvery.fst(1496,27-1496,29)
      (= @x2 (Prims.op_Star @x3 @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_b22acbf9af2a82235afc644243acbc3a @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_b22acbf9af2a82235afc644243acbc3a))
  :named refinement_interpretation_Tm_refine_b22acbf9af2a82235afc644243acbc3a))
; haseq for Tm_refine_b22acbf9af2a82235afc644243acbc3a
;;; Fact-ids: 
(assert
 (! ;; def=Pulse.Lib.ForEvery.fst(1496,13-1496,40); use=Pulse.Lib.ForEvery.fst(1496,13-1496,40)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_b22acbf9af2a82235afc644243acbc3a @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_b22acbf9af2a82235afc644243acbc3a @x0 @x1))))
    :qid haseqTm_refine_b22acbf9af2a82235afc644243acbc3a))
  :named haseqTm_refine_b22acbf9af2a82235afc644243acbc3a))



















; kick_partial_app
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT (ApplyTT (FStar.Bijection.__proj__Mkbijection__item__left@tok @u0 @u1) @x2) @x3)
      @x4))
    :pattern ((FStar.Bijection.__proj__Mkbijection__item__left @u0 @u1 @x2 @x3 @x4))
    :qid @kick_partial_app_1fe67c1addf605b081224c73ac8f6b80))
  :named @kick_partial_app_1fe67c1addf605b081224c73ac8f6b80))
; Encoding query formula : forall (n: Prims.nat)
;   (d1: Prims.nat)
;   (d2: Prims.nat{n == d1 * d2})
;   (p: (_: FStar.Fin.fin n -> Pulse.Lib.Core.slprop))
;   (__: Prims.unit)
;   (__: Prims.unit)
;   (y: FStar.Fin.fin d1 & FStar.Fin.fin d2).
;   (forall (_: FStar.Fin.fin d1 & FStar.Fin.fin d2).
;       0 <= _._1 * d2 + _._2 /\ _._1 * d2 + _._2 < d1 * d2) /\
;   (forall (i: FStar.Fin.fin (d1 * d2)).
;       (d2 >= 0 /\ n == d1 * d2 ==> d2 <> 0) /\ (0 <= i / d2) /\ (i / d2 < d1) /\
;       (0 <= i % d2) /\ (i % d2 < d2)) /\
;   ((forall (x: FStar.Fin.fin d1 & FStar.Fin.fin d2).
;       ((x._1 * d2 + x._2) / d2, (x._1 * d2 + x._2) % d2) == x) /\
;   (forall (y: FStar.Fin.fin (d1 * d2)). (y / d2, y % d2)._1 * d2 + (y / d2, y % d2)._2 == y)) /\
;   p ((FStar.Bijection.bij_sym (FStar.Bijection.Mkbijection (fun xy -> xy._1 * d2 + xy._2)
;               (fun i -> i / d2, i % d2)
;               (fun _ -> ())
;               (fun _ -> ())))
;         .left y) ==
;   p (y._1 * d2 + y._2)
; Context: While encoding a query
; While running primitive Pulse.Main.check_pulse_after_desugar (plugin)
; While normalizing a term
; While running splice with a tactic
; While typechecking the top-level declaration ‘%splice_t[Pulse.Lib.ForEvery.forevery_factor] (...)’
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
   (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
    (! (implies
      (and
       (HasType @x0 Prims.nat)
       (HasType @x1 Prims.nat)
       (HasType @x2 (Tm_refine_b22acbf9af2a82235afc644243acbc3a @x0 @x1))
       (HasType @x3 (Tm_arrow_5fc0d63e20ab3bb1ad6368a6fba20556 @x0))
       (HasType @x4 Prims.unit)
       (HasType @x5 Prims.unit)
       (HasType
        @x6
        (FStar.Pervasives.Native.tuple2 U_zero U_zero (FStar.Fin.fin @x1) (FStar.Fin.fin @x2))))
      ;; def=Pulse.Lib.ForEvery.fst(1505,55-1505,71); use=Pulse.Lib.ForEvery.fst(1504,2-1505,20)
      (and
       (forall ((@x7 Term))
        (! (implies
          (HasType
           @x7
           (FStar.Pervasives.Native.tuple2 U_zero U_zero (FStar.Fin.fin @x1) (FStar.Fin.fin @x2)))
          ;; def=FStar.Fin.fsti(40,27-40,42); use=FStar.Fin.fsti(40,27-40,42)
          (and
           ;; def=FStar.Fin.fsti(40,27-40,33); use=FStar.Fin.fsti(40,27-40,33)
           (or
            label_1
            ;; def=FStar.Fin.fsti(40,27-40,33); use=FStar.Fin.fsti(40,27-40,33)
            (<=
             (BoxInt_proj_0 (BoxInt 0))
             (BoxInt_proj_0
              (Prims.op_Addition
               (Prims.op_Star
                (FStar.Pervasives.Native.__proj__Mktuple2__item___1
                 U_zero
                 U_zero
                 (FStar.Fin.fin @x1)
                 (FStar.Fin.fin @x2)
                 @x7)
                @x2)
               (FStar.Pervasives.Native.__proj__Mktuple2__item___2
                U_zero
                U_zero
                (FStar.Fin.fin @x1)
                (FStar.Fin.fin @x2)
                @x7)))))
           ;; def=FStar.Fin.fsti(40,37-40,42); use=FStar.Fin.fsti(40,37-40,42)
           (or
            label_2
            ;; def=FStar.Fin.fsti(40,37-40,42); use=FStar.Fin.fsti(40,37-40,42)
            (<
             (BoxInt_proj_0
              (Prims.op_Addition
               (Prims.op_Star
                (FStar.Pervasives.Native.__proj__Mktuple2__item___1
                 U_zero
                 U_zero
                 (FStar.Fin.fin @x1)
                 (FStar.Fin.fin @x2)
                 @x7)
                @x2)
               (FStar.Pervasives.Native.__proj__Mktuple2__item___2
                U_zero
                U_zero
                (FStar.Fin.fin @x1)
                (FStar.Fin.fin @x2)
                @x7)))
             (BoxInt_proj_0 (Prims.op_Star @x1 @x2))))))
         :qid @query.1))
       (forall ((@x7 Term))
        (! (implies
          (HasType @x7 (FStar.Fin.fin (Prims.op_Star @x1 @x2)))
          ;; def=FStar.Fin.fsti(40,27-40,42); use=FStar.Fin.fsti(40,27-40,42)
          (and
           (implies
            ;; def=Pulse.Lib.ForEvery.fst(1496,27-1496,29); use=Pulse.Lib.ForEvery.fst(1504,45-1504,47)
            (and
             ;; def=Prims.fst(642,18-642,24); use=Prims.fst(642,18-642,24)
             (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
             ;; def=Pulse.Lib.ForEvery.fst(1496,27-1496,29); use=Pulse.Lib.ForEvery.fst(1504,45-1504,47)
             (= @x0 (Prims.op_Star @x1 @x2)))
            ;; def=Prims.fst(648,22-648,28); use=Prims.fst(648,22-648,28)
            (or
             label_3
             ;; def=Prims.fst(648,22-648,28); use=Prims.fst(648,22-648,28)
             (not (= @x2 (BoxInt 0)))))
           ;; def=FStar.Fin.fsti(40,27-40,33); use=FStar.Fin.fsti(40,27-40,33)
           (or
            label_4
            ;; def=FStar.Fin.fsti(40,27-40,33); use=FStar.Fin.fsti(40,27-40,33)
            (<= (BoxInt_proj_0 (BoxInt 0)) (BoxInt_proj_0 (Prims.op_Division @x7 @x2))))
           ;; def=FStar.Fin.fsti(40,37-40,42); use=FStar.Fin.fsti(40,37-40,42)
           (or
            label_5
            ;; def=FStar.Fin.fsti(40,37-40,42); use=FStar.Fin.fsti(40,37-40,42)
            (< (BoxInt_proj_0 (Prims.op_Division @x7 @x2)) (BoxInt_proj_0 @x1)))
           ;; def=FStar.Fin.fsti(40,27-40,33); use=FStar.Fin.fsti(40,27-40,33)
           (or
            label_6
            ;; def=FStar.Fin.fsti(40,27-40,33); use=FStar.Fin.fsti(40,27-40,33)
            (<= (BoxInt_proj_0 (BoxInt 0)) (BoxInt_proj_0 (Prims.op_Modulus @x7 @x2))))
           ;; def=FStar.Fin.fsti(40,37-40,42); use=FStar.Fin.fsti(40,37-40,42)
           (or
            label_7
            ;; def=FStar.Fin.fsti(40,37-40,42); use=FStar.Fin.fsti(40,37-40,42)
            (< (BoxInt_proj_0 (Prims.op_Modulus @x7 @x2)) (BoxInt_proj_0 @x2)))))
         :qid @query.2))
       (forall ((@x7 Term))
        (! (implies
          (HasType
           @x7
           (FStar.Pervasives.Native.tuple2 U_zero U_zero (FStar.Fin.fin @x1) (FStar.Fin.fin @x2)))
          ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(154,2-157,29)
          (or
           label_8
           ;; def=FStar.Bijection.fsti(25,29-25,50); use=FStar.Bijection.fsti(154,2-157,29)
           (=
            (FStar.Pervasives.Native.Mktuple2
             U_zero
             U_zero
             (FStar.Fin.fin @x1)
             (FStar.Fin.fin @x2)
             (Prims.op_Division
              (Prims.op_Addition
               (Prims.op_Star
                (FStar.Pervasives.Native.__proj__Mktuple2__item___1
                 U_zero
                 U_zero
                 (FStar.Fin.fin @x1)
                 (FStar.Fin.fin @x2)
                 @x7)
                @x2)
               (FStar.Pervasives.Native.__proj__Mktuple2__item___2
                U_zero
                U_zero
                (FStar.Fin.fin @x1)
                (FStar.Fin.fin @x2)
                @x7))
              @x2)
             (Prims.op_Modulus
              (Prims.op_Addition
               (Prims.op_Star
                (FStar.Pervasives.Native.__proj__Mktuple2__item___1
                 U_zero
                 U_zero
                 (FStar.Fin.fin @x1)
                 (FStar.Fin.fin @x2)
                 @x7)
                @x2)
               (FStar.Pervasives.Native.__proj__Mktuple2__item___2
                U_zero
                U_zero
                (FStar.Fin.fin @x1)
                (FStar.Fin.fin @x2)
                @x7))
              @x2))
            @x7)))
         :qid @query.3))
       (forall ((@x7 Term))
        (! (implies
          (HasType @x7 (FStar.Fin.fin (Prims.op_Star @x1 @x2)))
          ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(154,2-157,29)
          (or
           label_9
           ;; def=FStar.Bijection.fsti(26,29-26,50); use=FStar.Bijection.fsti(154,2-157,29)
           (=
            (Prims.op_Addition
             (Prims.op_Star
              (FStar.Pervasives.Native.__proj__Mktuple2__item___1
               U_zero
               U_zero
               (FStar.Fin.fin @x1)
               (FStar.Fin.fin @x2)
               (FStar.Pervasives.Native.Mktuple2
                U_zero
                U_zero
                (FStar.Fin.fin @x1)
                (FStar.Fin.fin @x2)
                (Prims.op_Division @x7 @x2)
                (Prims.op_Modulus @x7 @x2)))
              @x2)
             (FStar.Pervasives.Native.__proj__Mktuple2__item___2
              U_zero
              U_zero
              (FStar.Fin.fin @x1)
              (FStar.Fin.fin @x2)
              (FStar.Pervasives.Native.Mktuple2
               U_zero
               U_zero
               (FStar.Fin.fin @x1)
               (FStar.Fin.fin @x2)
               (Prims.op_Division @x7 @x2)
               (Prims.op_Modulus @x7 @x2))))
            @x7)))
         :qid @query.4))
       ;; def=Pulse.Lib.ForEvery.fst(1505,55-1505,71); use=Pulse.Lib.ForEvery.fst(1504,2-1505,20)
       (or
        label_10
        ;; def=Pulse.Lib.ForEvery.fst(1505,55-1505,71); use=Pulse.Lib.ForEvery.fst(1504,2-1505,20)
        (=
         (ApplyTT
          @x3
          (ApplyTT
           (ApplyTT
            (ApplyTT
             (ApplyTT
              (FStar.Bijection.__proj__Mkbijection__item__left@tok U_zero U_zero)
              (FStar.Fin.fin (Prims.op_Star @x1 @x2)))
             (FStar.Pervasives.Native.tuple2 U_zero U_zero (FStar.Fin.fin @x1) (FStar.Fin.fin @x2)))
            (FStar.Bijection.bij_sym
             U_zero
             U_zero
             (FStar.Pervasives.Native.tuple2 U_zero U_zero (FStar.Fin.fin @x1) (FStar.Fin.fin @x2))
             (FStar.Fin.fin (Prims.op_Star @x1 @x2))
             (FStar.Bijection.Mkbijection
              U_zero
              U_zero
              (FStar.Pervasives.Native.tuple2 U_zero U_zero (FStar.Fin.fin @x1) (FStar.Fin.fin @x2))
              (FStar.Fin.fin (Prims.op_Star @x1 @x2))
              (Tm_abs_716795d33592764ee9cf62a80672da9a @x1 @x2)
              (Tm_abs_92db0263ba330856acce3e8323d339a2 @x1 @x2)
              (Tm_abs_02dcd51cd1db8468db6f164cc37f6abb @x1 @x2)
              (Tm_abs_93184d47a541ad3b3f97af2a43d7cb12 @x1 @x2))))
           @x6))
         (ApplyTT
          @x3
          (Prims.op_Addition
           (Prims.op_Star
            (FStar.Pervasives.Native.__proj__Mktuple2__item___1
             U_zero
             U_zero
             (FStar.Fin.fin @x1)
             (FStar.Fin.fin @x2)
             @x6)
            @x2)
           (FStar.Pervasives.Native.__proj__Mktuple2__item___2
            U_zero
            U_zero
            (FStar.Fin.fin @x1)
            (FStar.Fin.fin @x2)
            @x6)))))))
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
