; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
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
(set-option :smt.arith.solver 6)

(declare-sort FString)
(declare-fun FString_constr_id (FString) Int)

(declare-sort Term)
(declare-sort Universe)
(declare-fun U_zero () Universe)
(declare-fun U_succ (Universe) Universe)
(declare-fun ulevel (Universe) Int)
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

(declare-fun FStar.BitVector.bv_t (Term) Term)
(declare-fun FStar.BitVector.shift_left_vec (Term Term Term) Term)
(declare-fun FStar.BitVector.shift_right_vec (Term Term Term) Term)
(declare-fun FStar.BitVector.zero_vec (Term) Term)
(declare-fun FStar.Pervasives.ambient (Universe Term Term) Term)
(declare-fun FStar.Range.range (Dummy_sort) Term)
(declare-fun FStar.Seq.Base.append (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.create (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.empty (Universe Term) Term)
(declare-fun FStar.Seq.Base.equal (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.index (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.length (Universe Term Term) Term)
(declare-fun FStar.Seq.Base.seq (Universe Term) Term)
(declare-fun FStar.Seq.Base.slice (Universe Term Term Term Term) Term)
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
(declare-fun FStar.UInt.eq (Term Term Term) Term)
(declare-fun FStar.UInt.fits (Term Term) Term)
(declare-fun FStar.UInt.from_vec (Term Term) Term)
; Fuel-instrumented function name
(declare-fun FStar.UInt.from_vec.fuel_instrumented (Fuel Term Term) Term)
(declare-fun FStar.UInt.max_int (Term) Term)
(declare-fun FStar.UInt.min_int (Term) Term)
(declare-fun FStar.UInt.shift_left (Term Term Term) Term)
(declare-fun FStar.UInt.shift_right (Term Term Term) Term)
(declare-fun FStar.UInt.size (Term Term) Term)
(declare-fun FStar.UInt.to_vec (Term Term) Term)
; Fuel-instrumented function name
(declare-fun FStar.UInt.to_vec.fuel_instrumented (Fuel Term Term) Term)
(declare-fun FStar.UInt.uint_t (Term) Term)
(declare-fun FStar.UInt.zero (Term) Term)
; Constructor
(declare-fun FStar.UInt128.Mkuint128 (Term Term) Term)
; Projector
(declare-fun FStar.UInt128.Mkuint128_@high (Term) Term)
; Projector
(declare-fun FStar.UInt128.Mkuint128_@low (Term) Term)
(declare-fun FStar.UInt128.__proj__Mkuint128__item__high (Term) Term)
(declare-fun FStar.UInt128.__proj__Mkuint128__item__low (Term) Term)
(declare-fun FStar.UInt128.add_u64_shift_right (Term Term Term) Term)
(declare-fun FStar.UInt128.add_u64_shift_right_respec (Term Term Term) Term)
(declare-fun FStar.UInt128.n (Dummy_sort) Term)
(declare-fun FStar.UInt128.t (Dummy_sort) Term)
(declare-fun FStar.UInt128.u32_64 (Dummy_sort) Term)
; Constructor
(declare-fun FStar.UInt128.uint128 () Term)
(declare-fun FStar.UInt128.uu___0 () Term)
(declare-fun FStar.UInt128.uu___1 () Term)
(declare-fun FStar.UInt128.v (Term) Term)
(declare-fun FStar.UInt32.eq (Term Term) Term)
(declare-fun FStar.UInt32.sub (Term Term) Term)
(declare-fun FStar.UInt32.t (Dummy_sort) Term)
(declare-fun FStar.UInt32.uint_to_t (Term) Term)
(declare-fun FStar.UInt32.v (Term) Term)
(declare-fun FStar.UInt64.add (Term Term) Term)
(declare-fun FStar.UInt64.shift_left (Term Term) Term)
(declare-fun FStar.UInt64.shift_right (Term Term) Term)
(declare-fun FStar.UInt64.t (Dummy_sort) Term)
(declare-fun FStar.UInt64.uint_to_t (Term) Term)
(declare-fun FStar.UInt64.v (Term) Term)
(declare-fun Non_total_Tm_arrow_0aa324f1db4c35f76a40454090139c29 (Term Term) Term)
(declare-fun Non_total_Tm_arrow_15e2c9ae87c8b5c6934f77f6ee8fc00d (Term) Term)
(declare-fun Non_total_Tm_arrow_3ea58bbb4f338d65779a343cd70a270f (Term) Term)
(declare-fun Non_total_Tm_arrow_62a2cf1b58e1e423697dd5147ebaf708 (Term) Term)
(declare-fun Non_total_Tm_arrow_c4f8561b166975cfab30c09a71185d2d (Term) Term)
(declare-fun Non_total_Tm_arrow_da9712c41bd4800828fa87c1bc605521 (Term Term) Term)
(declare-fun Prims.b2t (Term) Term)
(declare-fun Prims.bool () Term)
(declare-fun Prims.eq2 (Universe Term Term Term) Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.hasEq (Universe Term) Term)
(declare-fun Prims.int () Term)
(declare-fun Prims.l_True () Term)
(declare-fun Prims.nat () Term)
(declare-fun Prims.nonzero () Term)
(declare-fun Prims.op_Addition (Term Term) Term)
(declare-fun Prims.op_AmpAmp (Term Term) Term)
(declare-fun Prims.op_Division (Term Term) Term)
(declare-fun Prims.op_Equality (Term Term Term) Term)
(declare-fun Prims.op_GreaterThanOrEqual (Term Term) Term)
(declare-fun Prims.op_LessThan (Term Term) Term)
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
; _: a{pre} -> prop
(declare-fun Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 (Universe Term Term) Term)
(declare-fun Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0 (Term Term) Term)
(declare-fun Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f () Term)
(declare-fun Tm_refine_0ce91af3d6762ea7d913b870f9e33a01 (Universe Term) Term)
(declare-fun Tm_refine_0ea1fba779ad5718e28476faeef94d56 (Term) Term)
(declare-fun Tm_refine_150c87740acaa31f788a9e84dd5820c2 (Term) Term)
(declare-fun Tm_refine_160fe7faad9a466b3cae8455bac5be60 (Universe Term Term) Term)
(declare-fun Tm_refine_1628fa8159c35bdaa68f121a383a6a00 (Universe Term Term) Term)
(declare-fun Tm_refine_1ba8fd8bb363097813064c67740b2de5 (Term Term Term) Term)
(declare-fun Tm_refine_2de20c066034c13bf76e9c0b94f4806c (Term) Term)
(declare-fun Tm_refine_34425c23b534b8a294f8f063dd9faa4b (Term Term) Term)
(declare-fun Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8 (Term Term) Term)
(declare-fun Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71 (Term Term Term) Term)
(declare-fun Tm_refine_444061fd0bd0053c4f27fa233082c9ca (Universe Term Term Term) Term)
(declare-fun Tm_refine_48c1b5b4c02ad49f0760911a9d4b1fb4 (Term) Term)
(declare-fun Tm_refine_542f9d4f129664613f2483a6c88bc7c2 () Term)
(declare-fun Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13 (Universe Term Term Term) Term)
(declare-fun Tm_refine_6ccf0869e6825997ab860bb25791c11f (Term Term) Term)
(declare-fun Tm_refine_774ba3f728d91ead8ef40be66c9802e5 () Term)
(declare-fun Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d (Term) Term)
(declare-fun Tm_refine_9d6af3f3535473623f7aec2f0501897f () Term)
(declare-fun Tm_refine_aa4b3d268075d84252df525db1f85524 (Term Term) Term)
(declare-fun Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0 (Universe Term Term Term) Term)
(declare-fun Tm_refine_bc552b2c624e2add758b3ac761c0c563 (Term Term) Term)
(declare-fun Tm_refine_c0ec47abc53a2509e744dad22ccf8191 (Term Term) Term)
(declare-fun Tm_refine_c1424615841f28cac7fc34e92b7ff33c (Term) Term)
(declare-fun Tm_refine_c666da6bc448e4fc799131c9359c6383 (Term Term Term) Term)
(declare-fun Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d () Term)
(declare-fun Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 (Universe Term Term) Term)
(declare-fun Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66 () Term)
(declare-fun Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826 (Term Term) Term)
(declare-fun Tm_refine_ebf0af240d826e12ec6c1570ad81631c (Term Term) Term)
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
;;; Fact-ids: Name FStar.UInt.from_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(185,8-185,16); use=FStar.UInt.fsti(185,8-185,16)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt.from_vec @x0 @x1) (FStar.UInt.from_vec.fuel_instrumented MaxFuel @x0 @x1))
    :pattern ((FStar.UInt.from_vec @x0 @x1))
    :qid @fuel_correspondence_FStar.UInt.from_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.UInt.from_vec.fuel_instrumented))
; Correspondence of recursive function to instrumented version
;;; Fact-ids: Name FStar.UInt.to_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(181,8-181,14); use=FStar.UInt.fsti(181,8-181,14)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt.to_vec @x0 @x1) (FStar.UInt.to_vec.fuel_instrumented MaxFuel @x0 @x1))
    :pattern ((FStar.UInt.to_vec @x0 @x1))
    :qid @fuel_correspondence_FStar.UInt.to_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.UInt.to_vec.fuel_instrumented))
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
;;; Fact-ids: Name FStar.UInt.from_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(185,8-185,16); use=FStar.UInt.fsti(185,8-185,16)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.from_vec.fuel_instrumented (SFuel @u0) @x1 @x2)
     (FStar.UInt.from_vec.fuel_instrumented ZFuel @x1 @x2))
    :pattern ((FStar.UInt.from_vec.fuel_instrumented (SFuel @u0) @x1 @x2))
    :qid @fuel_irrelevance_FStar.UInt.from_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.UInt.from_vec.fuel_instrumented))
; Fuel irrelevance
;;; Fact-ids: Name FStar.UInt.to_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(181,8-181,14); use=FStar.UInt.fsti(181,8-181,14)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.to_vec.fuel_instrumented (SFuel @u0) @x1 @x2)
     (FStar.UInt.to_vec.fuel_instrumented ZFuel @x1 @x2))
    :pattern ((FStar.UInt.to_vec.fuel_instrumented (SFuel @u0) @x1 @x2))
    :qid @fuel_irrelevance_FStar.UInt.to_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.UInt.to_vec.fuel_instrumented))
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
;;; Fact-ids: Name FStar.Seq.Base.seq; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(23,8-23,11); use=FStar.Seq.Base.fsti(23,8-23,11)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 103 (Term_constr_id (FStar.Seq.Base.seq @u0 @x1)))
    :pattern ((FStar.Seq.Base.seq @u0 @x1))
    :qid constructor_distinct_FStar.Seq.Base.seq))
  :named constructor_distinct_FStar.Seq.Base.seq))
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
;;; Fact-ids: Name FStar.UInt32.t; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(47,8-47,9); use=FStar.UInt32.fsti(47,8-47,9)
  (forall ((@u0 Dummy_sort))
   (! (= 101 (Term_constr_id (FStar.UInt32.t @u0)))
    :pattern ((FStar.UInt32.t @u0))
    :qid constructor_distinct_FStar.UInt32.t))
  :named constructor_distinct_FStar.UInt32.t))
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
; Eq2 interpretation
;;; Fact-ids: Name Prims.eq2; Namespace Prims
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff (= @x2 @x3) (Valid (Prims.eq2 @u0 @x1 @x2 @x3)))
    :pattern ((Prims.eq2 @u0 @x1 @x2 @x3))
    :qid eq2-interp))
  :named eq2-interp))
; Equation for FStar.BitVector.bv_t
;;; Fact-ids: Name FStar.BitVector.bv_t; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(31,5-31,9); use=FStar.BitVector.fsti(31,5-31,9)
  (forall ((@x0 Term))
   (! (= (FStar.BitVector.bv_t @x0) (Tm_refine_150c87740acaa31f788a9e84dd5820c2 @x0))
    :pattern ((FStar.BitVector.bv_t @x0))
    :qid equation_FStar.BitVector.bv_t))
  :named equation_FStar.BitVector.bv_t))
; Equation for FStar.BitVector.shift_left_vec
;;; Fact-ids: Name FStar.BitVector.shift_left_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(132,4-132,18); use=FStar.BitVector.fsti(132,4-132,18)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.BitVector.shift_left_vec @x0 @x1 @x2)
     (let ((@lb3 (Prims.op_GreaterThanOrEqual @x2 @x0)))
      (ite
       (= @lb3 (BoxBool true))
       (FStar.BitVector.zero_vec @x0)
       (let ((@lb4 (Prims.op_Equality Prims.int @x2 (BoxInt 0))))
        (ite
         (= @lb4 (BoxBool true))
         @x1
         (FStar.Seq.Base.append
          U_zero
          Prims.bool
          (FStar.Seq.Base.slice U_zero Prims.bool @x1 @x2 @x0)
          (FStar.BitVector.zero_vec @x2)))))))
    :pattern ((FStar.BitVector.shift_left_vec @x0 @x1 @x2))
    :qid equation_FStar.BitVector.shift_left_vec))
  :named equation_FStar.BitVector.shift_left_vec))
; Equation for FStar.BitVector.shift_right_vec
;;; Fact-ids: Name FStar.BitVector.shift_right_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(146,4-146,19); use=FStar.BitVector.fsti(146,4-146,19)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.BitVector.shift_right_vec @x0 @x1 @x2)
     (let ((@lb3 (Prims.op_GreaterThanOrEqual @x2 @x0)))
      (ite
       (= @lb3 (BoxBool true))
       (FStar.BitVector.zero_vec @x0)
       (let ((@lb4 (Prims.op_Equality Prims.int @x2 (BoxInt 0))))
        (ite
         (= @lb4 (BoxBool true))
         @x1
         (FStar.Seq.Base.append
          U_zero
          Prims.bool
          (FStar.BitVector.zero_vec @x2)
          (FStar.Seq.Base.slice U_zero Prims.bool @x1 (BoxInt 0) (Prims.op_Subtraction @x0 @x2))))))))
    :pattern ((FStar.BitVector.shift_right_vec @x0 @x1 @x2))
    :qid equation_FStar.BitVector.shift_right_vec))
  :named equation_FStar.BitVector.shift_right_vec))
; Equation for FStar.BitVector.zero_vec
;;; Fact-ids: Name FStar.BitVector.zero_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(36,4-36,12); use=FStar.BitVector.fsti(36,4-36,12)
  (forall ((@x0 Term))
   (! (=
     (FStar.BitVector.zero_vec @x0)
     (FStar.Seq.Base.create U_zero Prims.bool @x0 (BoxBool false)))
    :pattern ((FStar.BitVector.zero_vec @x0))
    :qid equation_FStar.BitVector.zero_vec))
  :named equation_FStar.BitVector.zero_vec))
; Equation for FStar.UInt.eq
;;; Fact-ids: Name FStar.UInt.eq; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(165,4-165,6); use=FStar.UInt.fsti(165,4-165,6)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (FStar.UInt.eq @x0 @x1 @x2) (Prims.op_Equality (FStar.UInt.uint_t @x0) @x1 @x2))
    :pattern ((FStar.UInt.eq @x0 @x1 @x2))
    :qid equation_FStar.UInt.eq))
  :named equation_FStar.UInt.eq))
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
; Equation for FStar.UInt.shift_left
;;; Fact-ids: Name FStar.UInt.shift_left; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(448,4-448,14); use=FStar.UInt.fsti(448,4-448,14)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.shift_left @x0 @x1 @x2)
     (FStar.UInt.from_vec @x0 (FStar.BitVector.shift_left_vec @x0 (FStar.UInt.to_vec @x0 @x1) @x2)))
    :pattern ((FStar.UInt.shift_left @x0 @x1 @x2))
    :qid equation_FStar.UInt.shift_left))
  :named equation_FStar.UInt.shift_left))
; Equation for FStar.UInt.shift_right
;;; Fact-ids: Name FStar.UInt.shift_right; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(451,4-451,15); use=FStar.UInt.fsti(451,4-451,15)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.shift_right @x0 @x1 @x2)
     (FStar.UInt.from_vec @x0 (FStar.BitVector.shift_right_vec @x0 (FStar.UInt.to_vec @x0 @x1) @x2)))
    :pattern ((FStar.UInt.shift_right @x0 @x1 @x2))
    :qid equation_FStar.UInt.shift_right))
  :named equation_FStar.UInt.shift_right))
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
; Equation for FStar.UInt.zero
;;; Fact-ids: Name FStar.UInt.zero; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(57,4-57,8); use=FStar.UInt.fsti(57,4-57,8)
  (forall ((@x0 Term))
   (! (= (FStar.UInt.zero @x0) (BoxInt 0))
    :pattern ((FStar.UInt.zero @x0))
    :qid equation_FStar.UInt.zero))
  :named equation_FStar.UInt.zero))
; Equation for FStar.UInt128.add_u64_shift_right
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(726,4-726,23); use=FStar.UInt128.fst(726,4-726,23)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt128.add_u64_shift_right @x0 @x1 @x2)
     (FStar.UInt64.add
      (FStar.UInt64.shift_right @x1 @x2)
      (FStar.UInt64.shift_left @x0 (FStar.UInt32.sub (FStar.UInt128.u32_64 Dummy_value) @x2))))
    :pattern ((FStar.UInt128.add_u64_shift_right @x0 @x1 @x2))
    :qid equation_FStar.UInt128.add_u64_shift_right))
  :named equation_FStar.UInt128.add_u64_shift_right))
; Equation for FStar.UInt128.add_u64_shift_right_respec
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right_respec; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(751,4-751,30); use=FStar.UInt128.fst(751,4-751,30)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt128.add_u64_shift_right_respec @x0 @x1 @x2)
     (FStar.UInt128.add_u64_shift_right @x0 @x1 @x2))
    :pattern ((FStar.UInt128.add_u64_shift_right_respec @x0 @x1 @x2))
    :qid equation_FStar.UInt128.add_u64_shift_right_respec))
  :named equation_FStar.UInt128.add_u64_shift_right_respec))
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
; Equation for FStar.UInt128.u32_64
;;; Fact-ids: Name FStar.UInt128.u32_64; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(527,12-527,18); use=FStar.UInt128.fst(527,12-527,18)
  (forall ((@u0 Dummy_sort))
   (! (=
     ;; def=FStar.UInt128.fst(527,12-527,18); use=FStar.UInt128.fst(527,12-527,18)
     (FStar.UInt128.u32_64 @u0)
     (FStar.UInt32.uint_to_t (BoxInt 64)))
    :pattern
     (;; def=FStar.UInt128.fst(527,12-527,18); use=FStar.UInt128.fst(527,12-527,18)
      (FStar.UInt128.u32_64 @u0))
    :qid equation_FStar.UInt128.u32_64))
  :named equation_FStar.UInt128.u32_64))
; Equation for FStar.UInt128.uu___0
;;; Fact-ids: Name FStar.UInt128.uu___0; Namespace FStar.UInt128
(assert
 (! (= FStar.UInt128.uu___0 Tm_unit) :named equation_FStar.UInt128.uu___0))
; Equation for FStar.UInt128.uu___1
;;; Fact-ids: Name FStar.UInt128.uu___1; Namespace FStar.UInt128
(assert
 (! (= FStar.UInt128.uu___1 Tm_unit) :named equation_FStar.UInt128.uu___1))
; Equation for FStar.UInt128.v
;;; Fact-ids: Name FStar.UInt128.v; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(122,4-122,5); use=FStar.UInt128.fst(122,4-122,5)
  (forall ((@x0 Term))
   (! (=
     (FStar.UInt128.v @x0)
     (Prims.op_Addition
      (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0))
      (Prims.op_Star
       (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
       (Prims.pow2 (BoxInt 64)))))
    :pattern ((FStar.UInt128.v @x0))
    :qid equation_FStar.UInt128.v))
  :named equation_FStar.UInt128.v))
; Equation for FStar.UInt32.eq
;;; Fact-ids: Name FStar.UInt32.eq; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(234,4-234,6); use=FStar.UInt32.fsti(234,4-234,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt32.eq @x0 @x1)
     (FStar.UInt.eq (BoxInt 32) (FStar.UInt32.v @x0) (FStar.UInt32.v @x1)))
    :pattern ((FStar.UInt32.eq @x0 @x1))
    :qid equation_FStar.UInt32.eq))
  :named equation_FStar.UInt32.eq))
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
; Equation for fuel-instrumented recursive function: FStar.UInt.from_vec
;;; Fact-ids: Name FStar.UInt.from_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(185,8-185,16); use=FStar.UInt.fsti(185,8-185,16)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.nat) (HasType @x2 (FStar.BitVector.bv_t @x1)))
     (=
      (FStar.UInt.from_vec.fuel_instrumented (SFuel @u0) @x1 @x2)
      (let ((@lb3 (Prims.op_Equality Prims.int @x1 (BoxInt 0))))
       (ite
        (= @lb3 (BoxBool true))
        (BoxInt 0)
        (Prims.op_Addition
         (Prims.op_Star
          (BoxInt 2)
          (FStar.UInt.from_vec.fuel_instrumented
           @u0
           (Prims.op_Subtraction @x1 (BoxInt 1))
           (FStar.Seq.Base.slice
            U_zero
            Prims.bool
            @x2
            (BoxInt 0)
            (Prims.op_Subtraction @x1 (BoxInt 1)))))
         (let
           ((@lb4 (FStar.Seq.Base.index U_zero Prims.bool @x2 (Prims.op_Subtraction @x1 (BoxInt 1)))))
          (ite (= @lb4 (BoxBool true)) (BoxInt 1) (BoxInt 0))))))))
    :weight 0
    :pattern ((FStar.UInt.from_vec.fuel_instrumented (SFuel @u0) @x1 @x2))
    :qid equation_with_fuel_FStar.UInt.from_vec.fuel_instrumented))
  :named equation_with_fuel_FStar.UInt.from_vec.fuel_instrumented))
; Equation for fuel-instrumented recursive function: FStar.UInt.to_vec
;;; Fact-ids: Name FStar.UInt.to_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(181,8-181,14); use=FStar.UInt.fsti(181,8-181,14)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.nat) (HasType @x2 (FStar.UInt.uint_t @x1)))
     (=
      (FStar.UInt.to_vec.fuel_instrumented (SFuel @u0) @x1 @x2)
      (let ((@lb3 (Prims.op_Equality Prims.int @x1 (BoxInt 0))))
       (ite
        (= @lb3 (BoxBool true))
        (FStar.Seq.Base.empty U_zero Prims.bool)
        (FStar.Seq.Base.append
         U_zero
         Prims.bool
         (FStar.UInt.to_vec.fuel_instrumented
          @u0
          (Prims.op_Subtraction @x1 (BoxInt 1))
          (Prims.op_Division @x2 (BoxInt 2)))
         (FStar.Seq.Base.create
          U_zero
          Prims.bool
          (BoxInt 1)
          (Prims.op_Equality Prims.int (Prims.op_Modulus @x2 (BoxInt 2)) (BoxInt 1))))))))
    :weight 0
    :pattern ((FStar.UInt.to_vec.fuel_instrumented (SFuel @u0) @x1 @x2))
    :qid equation_with_fuel_FStar.UInt.to_vec.fuel_instrumented))
  :named equation_with_fuel_FStar.UInt.to_vec.fuel_instrumented))
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
; haseq for Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0
;;; Fact-ids: Name FStar.UInt64.shift_right; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(207,42-207,43); use=FStar.UInt64.fsti(207,42-207,43)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0 @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0 @x0 @x1))))
    :qid haseqTm_refine_0556f625b89f1ac99fd21e82e26fe9e0))
  :named haseqTm_refine_0556f625b89f1ac99fd21e82e26fe9e0))
; haseq for Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
; haseq for Tm_refine_0ce91af3d6762ea7d913b870f9e33a01
;;; Fact-ids: Name FStar.Seq.Base.empty; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(46,26-46,49); use=FStar.Seq.Base.fsti(46,26-46,49)
  (forall ((@u0 Universe) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_0ce91af3d6762ea7d913b870f9e33a01 @u0 @x1)))
     (Valid (Prims.hasEq @u0 (FStar.Seq.Base.seq @u0 @x1))))
    :pattern ((Valid (Prims.hasEq @u0 (Tm_refine_0ce91af3d6762ea7d913b870f9e33a01 @u0 @x1))))
    :qid haseqTm_refine_0ce91af3d6762ea7d913b870f9e33a01))
  :named haseqTm_refine_0ce91af3d6762ea7d913b870f9e33a01))
; haseq for Tm_refine_0ea1fba779ad5718e28476faeef94d56
;;; Fact-ids: Name FStar.UInt32.uint_to_t; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(57,34-57,35); use=FStar.UInt32.fsti(57,34-57,35)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_0ea1fba779ad5718e28476faeef94d56 @x0)))
     (Valid (Prims.hasEq U_zero (FStar.UInt32.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_0ea1fba779ad5718e28476faeef94d56 @x0))))
    :qid haseqTm_refine_0ea1fba779ad5718e28476faeef94d56))
  :named haseqTm_refine_0ea1fba779ad5718e28476faeef94d56))
; haseq for Tm_refine_150c87740acaa31f788a9e84dd5820c2
;;; Fact-ids: Name FStar.BitVector.bv_t; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(31,21-31,51); use=FStar.BitVector.fsti(31,21-31,51)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_150c87740acaa31f788a9e84dd5820c2 @x0)))
     (Valid (Prims.hasEq U_zero (FStar.Seq.Base.seq U_zero Prims.bool))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_150c87740acaa31f788a9e84dd5820c2 @x0))))
    :qid haseqTm_refine_150c87740acaa31f788a9e84dd5820c2))
  :named haseqTm_refine_150c87740acaa31f788a9e84dd5820c2))
; haseq for Tm_refine_160fe7faad9a466b3cae8455bac5be60
;;; Fact-ids: Name FStar.Seq.Base.index; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(32,34-32,53); use=FStar.Seq.Base.fsti(32,34-32,53)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2))))
    :qid haseqTm_refine_160fe7faad9a466b3cae8455bac5be60))
  :named haseqTm_refine_160fe7faad9a466b3cae8455bac5be60))
; haseq for Tm_refine_1628fa8159c35bdaa68f121a383a6a00
;;; Fact-ids: Name FStar.Seq.Properties.seq_find_aux; Namespace FStar.Seq.Properties
(assert
 (! ;; def=FStar.Seq.Properties.fsti(382,59-382,89); use=FStar.Seq.Properties.fsti(382,59-382,89)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_1628fa8159c35bdaa68f121a383a6a00 @u0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_1628fa8159c35bdaa68f121a383a6a00 @u0 @x1 @x2))))
    :qid haseqTm_refine_1628fa8159c35bdaa68f121a383a6a00))
  :named haseqTm_refine_1628fa8159c35bdaa68f121a383a6a00))
; haseq for Tm_refine_1ba8fd8bb363097813064c67740b2de5
;;; Fact-ids: Name FStar.Seq.Properties.slice_slice; Namespace FStar.Seq.Properties
(assert
 (! ;; def=FStar.Seq.Properties.fsti(625,2-625,40); use=FStar.Seq.Properties.fsti(625,2-625,40)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_1ba8fd8bb363097813064c67740b2de5 @x0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_1ba8fd8bb363097813064c67740b2de5 @x0 @x1 @x2))))
    :qid haseqTm_refine_1ba8fd8bb363097813064c67740b2de5))
  :named haseqTm_refine_1ba8fd8bb363097813064c67740b2de5))
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
; haseq for Tm_refine_34425c23b534b8a294f8f063dd9faa4b
;;; Fact-ids: Name FStar.BitVector.shift_right_vec_lemma_1; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(150,59-150,83); use=FStar.BitVector.fsti(150,59-150,83)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_34425c23b534b8a294f8f063dd9faa4b @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_34425c23b534b8a294f8f063dd9faa4b @x0 @x1))))
    :qid haseqTm_refine_34425c23b534b8a294f8f063dd9faa4b))
  :named haseqTm_refine_34425c23b534b8a294f8f063dd9faa4b))
; haseq for Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(158,88-158,104); use=FStar.Seq.Base.fsti(158,88-158,104)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8 @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8 @x0 @x1))))
    :qid haseqTm_refine_35a0739c434508f48d0bb1d5cd5df9e8))
  :named haseqTm_refine_35a0739c434508f48d0bb1d5cd5df9e8))
; haseq for Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(726,71-726,76); use=FStar.UInt128.fst(726,71-726,76)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71 @x0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71 @x0 @x1 @x2))))
    :qid haseqTm_refine_3db1592cca4a22ddebe9f4b0b1b82a71))
  :named haseqTm_refine_3db1592cca4a22ddebe9f4b0b1b82a71))
; haseq for Tm_refine_444061fd0bd0053c4f27fa233082c9ca
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_app2; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(153,57-153,107); use=FStar.Seq.Base.fsti(153,57-153,107)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_444061fd0bd0053c4f27fa233082c9ca @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern
     ((Valid (Prims.hasEq U_zero (Tm_refine_444061fd0bd0053c4f27fa233082c9ca @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_444061fd0bd0053c4f27fa233082c9ca))
  :named haseqTm_refine_444061fd0bd0053c4f27fa233082c9ca))
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
; haseq for Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13
;;; Fact-ids: Name FStar.Seq.Base.slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(64,43-64,73); use=FStar.Seq.Base.fsti(64,43-64,73)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13 @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern
     ((Valid (Prims.hasEq U_zero (Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13 @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13))
  :named haseqTm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13))
; haseq for Tm_refine_6ccf0869e6825997ab860bb25791c11f
;;; Fact-ids: Name FStar.BitVector.shift_left_vec_lemma_1; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(136,58-136,87); use=FStar.BitVector.fsti(136,58-136,87)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_6ccf0869e6825997ab860bb25791c11f @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_6ccf0869e6825997ab860bb25791c11f @x0 @x1))))
    :qid haseqTm_refine_6ccf0869e6825997ab860bb25791c11f))
  :named haseqTm_refine_6ccf0869e6825997ab860bb25791c11f))
; haseq for Tm_refine_774ba3f728d91ead8ef40be66c9802e5
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_774ba3f728d91ead8ef40be66c9802e5))
; haseq for Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d
;;; Fact-ids: Name FStar.UInt.index_to_vec_ones; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(430,41-430,54); use=FStar.UInt.fsti(430,41-430,54)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d @x0)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d @x0))))
    :qid haseqTm_refine_7e0b9b2dbca36eab00de093c1b701c6d))
  :named haseqTm_refine_7e0b9b2dbca36eab00de093c1b701c6d))
; haseq for Tm_refine_9d6af3f3535473623f7aec2f0501897f
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq (U_succ U_zero) Tm_refine_9d6af3f3535473623f7aec2f0501897f))
   (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
  :named haseqTm_refine_9d6af3f3535473623f7aec2f0501897f))
; haseq for Tm_refine_aa4b3d268075d84252df525db1f85524
;;; Fact-ids: Name FStar.UInt32.sub; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(115,27-115,28); use=FStar.UInt32.fsti(115,27-115,28)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_aa4b3d268075d84252df525db1f85524 @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt32.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_aa4b3d268075d84252df525db1f85524 @x0 @x1))))
    :qid haseqTm_refine_aa4b3d268075d84252df525db1f85524))
  :named haseqTm_refine_aa4b3d268075d84252df525db1f85524))
; haseq for Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(158,54-158,84); use=FStar.Seq.Base.fsti(158,54-158,84)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0 @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern
     ((Valid (Prims.hasEq U_zero (Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0 @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_b9ca4cf05147d86d6eff56ccafdd09d0))
  :named haseqTm_refine_b9ca4cf05147d86d6eff56ccafdd09d0))
; haseq for Tm_refine_bc552b2c624e2add758b3ac761c0c563
;;; Fact-ids: Name FStar.UInt64.add; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(87,27-87,28); use=FStar.UInt64.fsti(87,27-87,28)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_bc552b2c624e2add758b3ac761c0c563 @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_bc552b2c624e2add758b3ac761c0c563 @x0 @x1))))
    :qid haseqTm_refine_bc552b2c624e2add758b3ac761c0c563))
  :named haseqTm_refine_bc552b2c624e2add758b3ac761c0c563))
; haseq for Tm_refine_c0ec47abc53a2509e744dad22ccf8191
;;; Fact-ids: Name FStar.BitVector.shift_right_vec_lemma_2; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(155,59-155,84); use=FStar.BitVector.fsti(155,59-155,84)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_c0ec47abc53a2509e744dad22ccf8191 @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_c0ec47abc53a2509e744dad22ccf8191 @x0 @x1))))
    :qid haseqTm_refine_c0ec47abc53a2509e744dad22ccf8191))
  :named haseqTm_refine_c0ec47abc53a2509e744dad22ccf8191))
; haseq for Tm_refine_c1424615841f28cac7fc34e92b7ff33c
;;; Fact-ids: Name FStar.Seq.Base.init_aux; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(36,41-36,57); use=FStar.Seq.Base.fsti(36,41-36,57)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0))))
    :qid haseqTm_refine_c1424615841f28cac7fc34e92b7ff33c))
  :named haseqTm_refine_c1424615841f28cac7fc34e92b7ff33c))
; haseq for Tm_refine_c666da6bc448e4fc799131c9359c6383
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right_respec; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(751,77-751,82); use=FStar.UInt128.fst(751,77-751,82)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_c666da6bc448e4fc799131c9359c6383 @x0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_c666da6bc448e4fc799131c9359c6383 @x0 @x1 @x2))))
    :qid haseqTm_refine_c666da6bc448e4fc799131c9359c6383))
  :named haseqTm_refine_c666da6bc448e4fc799131c9359c6383))
; haseq for Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_left; Namespace FStar.UInt128
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
   (Valid (Prims.hasEq U_zero (FStar.UInt32.t Dummy_value))))
  :named haseqTm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
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
; haseq for Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66
;;; Fact-ids: Name FStar.UInt128.u32_64; Namespace FStar.UInt128
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66))
   (Valid (Prims.hasEq U_zero (FStar.UInt32.t Dummy_value))))
  :named haseqTm_refine_e1d24c158e7f5ef1f6415367ebc96e66))
; haseq for Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826
;;; Fact-ids: Name FStar.BitVector.shift_left_vec_lemma_2; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(141,58-141,86); use=FStar.BitVector.fsti(141,58-141,86)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826 @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.nat)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826 @x0 @x1))))
    :qid haseqTm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826))
  :named haseqTm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826))
; haseq for Tm_refine_ebf0af240d826e12ec6c1570ad81631c
;;; Fact-ids: Name FStar.UInt64.shift_left; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(212,41-212,42); use=FStar.UInt64.fsti(212,41-212,42)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_ebf0af240d826e12ec6c1570ad81631c @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_ebf0af240d826e12ec6c1570ad81631c @x0 @x1))))
    :qid haseqTm_refine_ebf0af240d826e12ec6c1570ad81631c))
  :named haseqTm_refine_ebf0af240d826e12ec6c1570ad81631c))
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
; Lemma: FStar.BitVector.shift_left_vec_lemma_1
;;; Fact-ids: Name FStar.BitVector.shift_left_vec_lemma_1; Namespace FStar.BitVector
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 Prims.nat)
      (HasType @x3 (Tm_refine_6ccf0869e6825997ab860bb25791c11f @x0 @x2)))
     ;; def=FStar.BitVector.fsti(137,21-137,60); use=FStar.BitVector.fsti(137,21-137,60)
     (=
      (FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_left_vec @x0 @x1 @x2) @x3)
      (BoxBool false)))
    :pattern
     ((FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_left_vec @x0 @x1 @x2) @x3))
    :qid lemma_FStar.BitVector.shift_left_vec_lemma_1))
  :named lemma_FStar.BitVector.shift_left_vec_lemma_1))
; Lemma: FStar.BitVector.shift_left_vec_lemma_2
;;; Fact-ids: Name FStar.BitVector.shift_left_vec_lemma_2; Namespace FStar.BitVector
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 Prims.nat)
      (HasType @x3 (Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826 @x0 @x2)))
     ;; def=FStar.BitVector.fsti(142,21-142,70); use=FStar.BitVector.fsti(142,21-142,70)
     (=
      (FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_left_vec @x0 @x1 @x2) @x3)
      (FStar.Seq.Base.index U_zero Prims.bool @x1 (Prims.op_Addition @x3 @x2))))
    :pattern
     ((FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_left_vec @x0 @x1 @x2) @x3))
    :qid lemma_FStar.BitVector.shift_left_vec_lemma_2))
  :named lemma_FStar.BitVector.shift_left_vec_lemma_2))
; Lemma: FStar.BitVector.shift_right_vec_lemma_1
;;; Fact-ids: Name FStar.BitVector.shift_right_vec_lemma_1; Namespace FStar.BitVector
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 Prims.nat)
      (HasType @x3 (Tm_refine_34425c23b534b8a294f8f063dd9faa4b @x0 @x2)))
     ;; def=FStar.BitVector.fsti(151,21-151,61); use=FStar.BitVector.fsti(151,21-151,61)
     (=
      (FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_right_vec @x0 @x1 @x2) @x3)
      (BoxBool false)))
    :pattern
     ((FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_right_vec @x0 @x1 @x2) @x3))
    :qid lemma_FStar.BitVector.shift_right_vec_lemma_1))
  :named lemma_FStar.BitVector.shift_right_vec_lemma_1))
; Lemma: FStar.BitVector.shift_right_vec_lemma_2
;;; Fact-ids: Name FStar.BitVector.shift_right_vec_lemma_2; Namespace FStar.BitVector
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 Prims.nat)
      (HasType @x3 (Tm_refine_c0ec47abc53a2509e744dad22ccf8191 @x0 @x2)))
     ;; def=FStar.BitVector.fsti(156,21-156,71); use=FStar.BitVector.fsti(156,21-156,71)
     (=
      (FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_right_vec @x0 @x1 @x2) @x3)
      (FStar.Seq.Base.index U_zero Prims.bool @x1 (Prims.op_Subtraction @x3 @x2))))
    :pattern
     ((FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_right_vec @x0 @x1 @x2) @x3))
    :qid lemma_FStar.BitVector.shift_right_vec_lemma_2))
  :named lemma_FStar.BitVector.shift_right_vec_lemma_2))
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
; Lemma: FStar.Seq.Base.hasEq_lemma
;;; Fact-ids: Name FStar.Seq.Base.hasEq_lemma; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      ;; def=FStar.Seq.Base.fsti(163,43-163,52); use=FStar.Seq.Base.fsti(163,43-163,52)
      (Valid
       ;; def=FStar.Seq.Base.fsti(163,43-163,52); use=FStar.Seq.Base.fsti(163,43-163,52)
       (Prims.hasEq @u0 @x1)))
     ;; def=FStar.Seq.Base.fsti(163,63-163,78); use=FStar.Seq.Base.fsti(163,63-163,78)
     (Valid
      ;; def=FStar.Seq.Base.fsti(163,63-163,78); use=FStar.Seq.Base.fsti(163,63-163,78)
      (Prims.hasEq @u0 (FStar.Seq.Base.seq @u0 @x1))))
    :pattern ((Prims.hasEq @u0 (FStar.Seq.Base.seq @u0 @x1)))
    :qid lemma_FStar.Seq.Base.hasEq_lemma))
  :named lemma_FStar.Seq.Base.hasEq_lemma))
; Lemma: FStar.Seq.Base.lemma_create_len
;;; Fact-ids: Name FStar.Seq.Base.lemma_create_len; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 Prims.nat) (HasType @x3 @x1))
     ;; def=FStar.Seq.Base.fsti(94,11-94,36); use=FStar.Seq.Base.fsti(94,11-94,36)
     (= (FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.create @u0 @x1 @x2 @x3)) @x2))
    :pattern ((FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.create @u0 @x1 @x2 @x3)))
    :qid lemma_FStar.Seq.Base.lemma_create_len))
  :named lemma_FStar.Seq.Base.lemma_create_len))
; Lemma: FStar.Seq.Base.lemma_eq_elim
;;; Fact-ids: Name FStar.Seq.Base.lemma_eq_elim; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      ;; def=FStar.Seq.Base.fsti(188,15-188,28); use=FStar.Seq.Base.fsti(188,15-188,28)
      (Valid
       ;; def=FStar.Seq.Base.fsti(188,15-188,28); use=FStar.Seq.Base.fsti(188,15-188,28)
       (FStar.Seq.Base.equal @u0 @x1 @x2 @x3)))
     ;; def=FStar.Seq.Base.fsti(189,14-189,22); use=FStar.Seq.Base.fsti(189,14-189,22)
     (= @x2 @x3))
    :pattern ((FStar.Seq.Base.equal @u0 @x1 @x2 @x3))
    :qid lemma_FStar.Seq.Base.lemma_eq_elim))
  :named lemma_FStar.Seq.Base.lemma_eq_elim))
; Lemma: FStar.Seq.Base.lemma_eq_intro
;;; Fact-ids: Name FStar.Seq.Base.lemma_eq_intro; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      ;; def=FStar.Seq.Base.fsti(177,16-177,37); use=FStar.Seq.Base.fsti(177,16-177,37)
      (= (FStar.Seq.Base.length @u0 @x1 @x2) (FStar.Seq.Base.length @u0 @x1 @x3))
      ;; def=FStar.Seq.Base.fsti(178,18-178,114); use=FStar.Seq.Base.fsti(178,18-178,114)
      (forall ((@x4 Term))
       (! (implies
         (HasType @x4 (Tm_refine_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2))
         ;; def=FStar.Seq.Base.fsti(178,87-178,113); use=FStar.Seq.Base.fsti(178,87-178,113)
         (= (FStar.Seq.Base.index @u0 @x1 @x2 @x4) (FStar.Seq.Base.index @u0 @x1 @x3 @x4)))
        :pattern ((FStar.Seq.Base.index @u0 @x1 @x2 @x4) (FStar.Seq.Base.index @u0 @x1 @x3 @x4))
        :qid lemma_FStar.Seq.Base.lemma_eq_intro.1)))
     ;; def=FStar.Seq.Base.fsti(179,14-179,27); use=FStar.Seq.Base.fsti(179,14-179,27)
     (Valid
      ;; def=FStar.Seq.Base.fsti(179,14-179,27); use=FStar.Seq.Base.fsti(179,14-179,27)
      (FStar.Seq.Base.equal @u0 @x1 @x2 @x3)))
    :pattern ((FStar.Seq.Base.equal @u0 @x1 @x2 @x3))
    :qid lemma_FStar.Seq.Base.lemma_eq_intro))
  :named lemma_FStar.Seq.Base.lemma_eq_intro))
; Lemma: FStar.Seq.Base.lemma_eq_refl
;;; Fact-ids: Name FStar.Seq.Base.lemma_eq_refl; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      ;; def=FStar.Seq.Base.fsti(183,15-183,25); use=FStar.Seq.Base.fsti(183,15-183,25)
      (= @x2 @x3))
     ;; def=FStar.Seq.Base.fsti(184,14-184,27); use=FStar.Seq.Base.fsti(184,14-184,27)
     (Valid
      ;; def=FStar.Seq.Base.fsti(184,14-184,27); use=FStar.Seq.Base.fsti(184,14-184,27)
      (FStar.Seq.Base.equal @u0 @x1 @x2 @x3)))
    :pattern ((FStar.Seq.Base.equal @u0 @x1 @x2 @x3))
    :qid lemma_FStar.Seq.Base.lemma_eq_refl))
  :named lemma_FStar.Seq.Base.lemma_eq_refl))
; Lemma: FStar.Seq.Base.lemma_index_app1
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_app1; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x4 (Tm_refine_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2)))
     ;; def=FStar.Seq.Base.fsti(150,11-150,49); use=FStar.Seq.Base.fsti(150,11-150,49)
     (=
      (FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3) @x4)
      (FStar.Seq.Base.index @u0 @x1 @x2 @x4)))
    :pattern ((FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3) @x4))
    :qid lemma_FStar.Seq.Base.lemma_index_app1))
  :named lemma_FStar.Seq.Base.lemma_index_app1))
; Lemma: FStar.Seq.Base.lemma_index_app2
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_app2; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x4 (Tm_refine_444061fd0bd0053c4f27fa233082c9ca @u0 @x1 @x2 @x3)))
     ;; def=FStar.Seq.Base.fsti(155,11-155,63); use=FStar.Seq.Base.fsti(155,11-155,63)
     (=
      (FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3) @x4)
      (FStar.Seq.Base.index
       @u0
       @x1
       @x3
       (Prims.op_Subtraction @x4 (FStar.Seq.Base.length @u0 @x1 @x2)))))
    :pattern ((FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3) @x4))
    :qid lemma_FStar.Seq.Base.lemma_index_app2))
  :named lemma_FStar.Seq.Base.lemma_index_app2))
; Lemma: FStar.Seq.Base.lemma_index_create
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_create; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.nat)
      (HasType @x3 @x1)
      (HasType @x4 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x2)))
     ;; def=FStar.Seq.Base.fsti(135,11-135,38); use=FStar.Seq.Base.fsti(135,11-135,38)
     (= (FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.create @u0 @x1 @x2 @x3) @x4) @x3))
    :pattern ((FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.create @u0 @x1 @x2 @x3) @x4))
    :qid lemma_FStar.Seq.Base.lemma_index_create))
  :named lemma_FStar.Seq.Base.lemma_index_create))
; Lemma: FStar.Seq.Base.lemma_index_slice
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_slice; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 Prims.nat)
      (HasType @x4 (Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0 @u0 @x3 @x1 @x2))
      (HasType @x5 (Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8 @x4 @x3)))
     ;; def=FStar.Seq.Base.fsti(160,11-160,53); use=FStar.Seq.Base.fsti(160,11-160,53)
     (=
      (FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4) @x5)
      (FStar.Seq.Base.index @u0 @x1 @x2 (Prims.op_Addition @x5 @x3))))
    :pattern ((FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4) @x5))
    :qid lemma_FStar.Seq.Base.lemma_index_slice))
  :named lemma_FStar.Seq.Base.lemma_index_slice))
; Lemma: FStar.Seq.Base.lemma_len_append
;;; Fact-ids: Name FStar.Seq.Base.lemma_len_append; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1)))
     ;; def=FStar.Seq.Base.fsti(124,11-124,58); use=FStar.Seq.Base.fsti(124,11-124,58)
     (=
      (FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3))
      (Prims.op_Addition (FStar.Seq.Base.length @u0 @x1 @x2) (FStar.Seq.Base.length @u0 @x1 @x3))))
    :pattern ((FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3)))
    :qid lemma_FStar.Seq.Base.lemma_len_append))
  :named lemma_FStar.Seq.Base.lemma_len_append))
; Lemma: FStar.Seq.Base.lemma_len_slice
;;; Fact-ids: Name FStar.Seq.Base.lemma_len_slice; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 Prims.nat)
      (HasType @x4 (Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13 @u0 @x3 @x1 @x2)))
     ;; def=FStar.Seq.Base.fsti(129,11-129,41); use=FStar.Seq.Base.fsti(129,11-129,41)
     (=
      (FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4))
      (Prims.op_Subtraction @x4 @x3)))
    :pattern ((FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4)))
    :qid lemma_FStar.Seq.Base.lemma_len_slice))
  :named lemma_FStar.Seq.Base.lemma_len_slice))
; Lemma: FStar.Seq.Properties.slice_is_empty
;;; Fact-ids: Name FStar.Seq.Properties.slice_is_empty; Namespace FStar.Seq.Properties
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (Tm_refine_1628fa8159c35bdaa68f121a383a6a00 @u0 @x1 @x2)))
     ;; def=FStar.Seq.Properties.fsti(608,11-608,37); use=FStar.Seq.Properties.fsti(608,11-608,37)
     (= (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x3) (FStar.Seq.Base.empty @u0 @x1)))
    :pattern ((FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x3))
    :qid lemma_FStar.Seq.Properties.slice_is_empty))
  :named lemma_FStar.Seq.Properties.slice_is_empty))
; Lemma: FStar.Seq.Properties.slice_length
;;; Fact-ids: Name FStar.Seq.Properties.slice_length; Namespace FStar.Seq.Properties
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Seq.Base.seq @u0 @x1)))
     ;; def=FStar.Seq.Properties.fsti(616,11-616,38); use=FStar.Seq.Properties.fsti(616,11-616,38)
     (= (FStar.Seq.Base.slice @u0 @x1 @x2 (BoxInt 0) (FStar.Seq.Base.length @u0 @x1 @x2)) @x2))
    :pattern ((FStar.Seq.Base.slice @u0 @x1 @x2 (BoxInt 0) (FStar.Seq.Base.length @u0 @x1 @x2)))
    :qid lemma_FStar.Seq.Properties.slice_length))
  :named lemma_FStar.Seq.Properties.slice_length))
; Lemma: FStar.Seq.Properties.slice_slice
;;; Fact-ids: Name FStar.Seq.Properties.slice_slice; Namespace FStar.Seq.Properties
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 Prims.nat)
      (HasType @x4 (Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0 @u0 @x3 @x1 @x2))
      (HasType @x5 Prims.nat)
      (HasType @x6 (Tm_refine_1ba8fd8bb363097813064c67740b2de5 @x5 @x4 @x3)))
     ;; def=FStar.Seq.Properties.fsti(628,11-628,71); use=FStar.Seq.Properties.fsti(628,11-628,71)
     (=
      (FStar.Seq.Base.slice @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4) @x5 @x6)
      (FStar.Seq.Base.slice @u0 @x1 @x2 (Prims.op_Addition @x3 @x5) (Prims.op_Addition @x3 @x6))))
    :pattern ((FStar.Seq.Base.slice @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4) @x5 @x6))
    :qid lemma_FStar.Seq.Properties.slice_slice))
  :named lemma_FStar.Seq.Properties.slice_slice))
; Lemma: FStar.UInt.index_to_vec_ones
;;; Fact-ids: Name FStar.UInt.index_to_vec_ones; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d @x0))
      (HasType @x2 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.UInt.fsti(432,17-434,68); use=FStar.UInt.fsti(432,17-434,68)
     (and
      ;; def=FStar.UInt.fsti(432,18-432,34); use=FStar.UInt.fsti(432,18-432,34)
      (<=
       (BoxInt_proj_0 (Prims.pow2.fuel_instrumented ZFuel @x1))
       (BoxInt_proj_0 (Prims.pow2.fuel_instrumented ZFuel @x0)))
      ;; def=FStar.UInt.fsti(433,10-433,67); use=FStar.UInt.fsti(433,10-433,67)
      (implies
       ;; def=FStar.UInt.fsti(433,11-433,20); use=FStar.UInt.fsti(433,11-433,20)
       (< (BoxInt_proj_0 @x2) (BoxInt_proj_0 (Prims.op_Subtraction @x0 @x1)))
       ;; def=FStar.UInt.fsti(433,25-433,66); use=FStar.UInt.fsti(433,25-433,66)
       (=
        (FStar.Seq.Base.index
         U_zero
         Prims.bool
         (FStar.UInt.to_vec.fuel_instrumented
          ZFuel
          @x0
          (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel @x1) (BoxInt 1)))
         @x2)
        (BoxBool false)))
      ;; def=FStar.UInt.fsti(434,10-434,67); use=FStar.UInt.fsti(434,10-434,67)
      (implies
       ;; def=FStar.UInt.fsti(434,11-434,21); use=FStar.UInt.fsti(434,11-434,21)
       (<= (BoxInt_proj_0 (Prims.op_Subtraction @x0 @x1)) (BoxInt_proj_0 @x2))
       ;; def=FStar.UInt.fsti(434,26-434,66); use=FStar.UInt.fsti(434,26-434,66)
       (=
        (FStar.Seq.Base.index
         U_zero
         Prims.bool
         (FStar.UInt.to_vec.fuel_instrumented
          ZFuel
          @x0
          (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel @x1) (BoxInt 1)))
         @x2)
        (BoxBool true)))))
    :pattern
     ((FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.UInt.to_vec.fuel_instrumented
        ZFuel
        @x0
        (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel @x1) (BoxInt 1)))
       @x2))
    :qid lemma_FStar.UInt.index_to_vec_ones))
  :named lemma_FStar.UInt.index_to_vec_ones))
; Lemma: FStar.UInt.inverse_aux
;;; Fact-ids: Name FStar.UInt.inverse_aux; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.nat)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.UInt.fsti(196,33-196,78); use=FStar.UInt.fsti(196,33-196,78)
     (=
      (FStar.Seq.Base.index U_zero Prims.bool @x1 @x2)
      (FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.UInt.to_vec.fuel_instrumented
        ZFuel
        @x0
        (FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 @x1))
       @x2)))
    :pattern
     ((FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.UInt.to_vec.fuel_instrumented
        ZFuel
        @x0
        (FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 @x1))
       @x2))
    :qid lemma_FStar.UInt.inverse_aux))
  :named lemma_FStar.UInt.inverse_aux))
; Lemma: FStar.UInt.inverse_num_lemma
;;; Fact-ids: Name FStar.UInt.inverse_num_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.nat) (HasType @x1 (FStar.UInt.uint_t @x0)))
     ;; def=FStar.UInt.fsti(204,33-204,60); use=FStar.UInt.fsti(204,33-204,60)
     (=
      @x1
      (FStar.UInt.from_vec.fuel_instrumented
       ZFuel
       @x0
       (FStar.UInt.to_vec.fuel_instrumented ZFuel @x0 @x1))))
    :pattern
     ((FStar.UInt.from_vec.fuel_instrumented
       ZFuel
       @x0
       (FStar.UInt.to_vec.fuel_instrumented ZFuel @x0 @x1)))
    :qid lemma_FStar.UInt.inverse_num_lemma))
  :named lemma_FStar.UInt.inverse_num_lemma))
; Lemma: FStar.UInt.inverse_vec_lemma
;;; Fact-ids: Name FStar.UInt.inverse_vec_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.nat) (HasType @x1 (FStar.BitVector.bv_t @x0)))
     ;; def=FStar.UInt.fsti(200,33-200,66); use=FStar.UInt.fsti(200,33-200,66)
     (Valid
      ;; def=FStar.UInt.fsti(200,33-200,66); use=FStar.UInt.fsti(200,33-200,66)
      (FStar.Seq.Base.equal
       U_zero
       Prims.bool
       @x1
       (FStar.UInt.to_vec.fuel_instrumented
        ZFuel
        @x0
        (FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 @x1)))))
    :pattern
     ((FStar.UInt.to_vec.fuel_instrumented
       ZFuel
       @x0
       (FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 @x1)))
    :qid lemma_FStar.UInt.inverse_vec_lemma))
  :named lemma_FStar.UInt.inverse_vec_lemma))
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
; Lemma: FStar.UInt.shift_left_value_lemma
;;; Fact-ids: Name FStar.UInt.shift_left_value_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)) (HasType @x2 Prims.nat))
     ;; def=FStar.UInt.fsti(553,17-553,58); use=FStar.UInt.fsti(553,17-553,58)
     (=
      (FStar.UInt.shift_left @x0 @x1 @x2)
      (Prims.op_Modulus
       (Prims.op_Star @x1 (Prims.pow2.fuel_instrumented ZFuel @x2))
       (Prims.pow2.fuel_instrumented ZFuel @x0))))
    :pattern ((FStar.UInt.shift_left @x0 @x1 @x2))
    :qid lemma_FStar.UInt.shift_left_value_lemma))
  :named lemma_FStar.UInt.shift_left_value_lemma))
; Lemma: FStar.UInt.shift_right_value_lemma
;;; Fact-ids: Name FStar.UInt.shift_right_value_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)) (HasType @x2 Prims.nat))
     ;; def=FStar.UInt.fsti(570,17-570,48); use=FStar.UInt.fsti(570,17-570,48)
     (=
      (FStar.UInt.shift_right @x0 @x1 @x2)
      (Prims.op_Division @x1 (Prims.pow2.fuel_instrumented ZFuel @x2))))
    :pattern ((FStar.UInt.shift_right @x0 @x1 @x2))
    :qid lemma_FStar.UInt.shift_right_value_lemma))
  :named lemma_FStar.UInt.shift_right_value_lemma))
; Lemma: FStar.UInt.zero_from_vec_lemma
;;; Fact-ids: Name FStar.UInt.zero_from_vec_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.pos)
     ;; def=FStar.UInt.fsti(242,33-242,64); use=FStar.UInt.fsti(242,33-242,64)
     (=
      (FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 (FStar.BitVector.zero_vec @x0))
      (FStar.UInt.zero @x0)))
    :pattern ((FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 (FStar.BitVector.zero_vec @x0)))
    :qid lemma_FStar.UInt.zero_from_vec_lemma))
  :named lemma_FStar.UInt.zero_from_vec_lemma))
; Lemma: FStar.UInt.zero_to_vec_lemma
;;; Fact-ids: Name FStar.UInt.zero_to_vec_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.UInt.fsti(238,33-238,82); use=FStar.UInt.fsti(238,33-238,82)
     (=
      (FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.UInt.to_vec.fuel_instrumented ZFuel @x0 (FStar.UInt.zero @x0))
       @x1)
      (FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.zero_vec @x0) @x1)))
    :pattern
     ((FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.UInt.to_vec.fuel_instrumented ZFuel @x0 (FStar.UInt.zero @x0))
       @x1))
    :qid lemma_FStar.UInt.zero_to_vec_lemma))
  :named lemma_FStar.UInt.zero_to_vec_lemma))
; Lemma: FStar.UInt32.uv_inv
;;; Fact-ids: Name FStar.UInt32.uv_inv; Namespace FStar.UInt32
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt32.t Dummy_value))
     ;; def=FStar.UInt32.fsti(63,11-63,33); use=FStar.UInt32.fsti(63,11-63,33)
     (= (FStar.UInt32.uint_to_t (FStar.UInt32.v @x0)) @x0))
    :pattern ((FStar.UInt32.v @x0))
    :qid lemma_FStar.UInt32.uv_inv))
  :named lemma_FStar.UInt32.uv_inv))
; Lemma: FStar.UInt32.vu_inv
;;; Fact-ids: Name FStar.UInt32.vu_inv; Namespace FStar.UInt32
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt.uint_t (BoxInt 32)))
     ;; def=FStar.UInt32.fsti(68,11-68,33); use=FStar.UInt32.fsti(68,11-68,33)
     (= (FStar.UInt32.v (FStar.UInt32.uint_to_t @x0)) @x0))
    :pattern ((FStar.UInt32.uint_to_t @x0))
    :qid lemma_FStar.UInt32.vu_inv))
  :named lemma_FStar.UInt32.vu_inv))
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
;;; Fact-ids: Name FStar.Tactics.V2.Derived.op_Less_Bar_Greater; Namespace FStar.Tactics.V2.Derived
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(474,13-476,27); use=FStar.Tactics.V2.Derived.fst(474,25-477,8)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Tactics.V2.Derived.fst(474,13-476,27); use=FStar.Tactics.V2.Derived.fst(474,25-477,8)
    (forall ((@x1 Term))
     (! (implies
       (HasType @x1 (Tm_type @u0))
       (HasType (Non_total_Tm_arrow_15e2c9ae87c8b5c6934f77f6ee8fc00d @x1) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_15e2c9ae87c8b5c6934f77f6ee8fc00d @x1) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_15e2c9ae87c8b5c6934f77f6ee8fc00d.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_15e2c9ae87c8b5c6934f77f6ee8fc00d))
  :named non_total_function_typing_Non_total_Tm_arrow_15e2c9ae87c8b5c6934f77f6ee8fc00d))
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
;;; Fact-ids: Name FStar.Tactics.V2.Derived.discard; Namespace FStar.Tactics.V2.Derived
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(513,19-513,33); use=FStar.Tactics.V2.Derived.fst(513,19-513,33)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Tactics.V2.Derived.fst(513,19-513,33); use=FStar.Tactics.V2.Derived.fst(513,19-513,33)
    (forall ((@x1 Term))
     (! (implies
       (HasType @x1 (Tm_type @u0))
       (HasType (Non_total_Tm_arrow_c4f8561b166975cfab30c09a71185d2d @x1) (Tm_type U_unknown)))
      :pattern
       ((HasType (Non_total_Tm_arrow_c4f8561b166975cfab30c09a71185d2d @x1) (Tm_type U_unknown)))
      :qid non_total_function_typing_Non_total_Tm_arrow_c4f8561b166975cfab30c09a71185d2d.1))
    :qid non_total_function_typing_Non_total_Tm_arrow_c4f8561b166975cfab30c09a71185d2d))
  :named non_total_function_typing_Non_total_Tm_arrow_c4f8561b166975cfab30c09a71185d2d))
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
;;; Fact-ids: Name Prims.op_LessThan; Namespace Prims
(assert
 (! ;; def=Prims.fst(550,4-550,15); use=Prims.fst(550,4-550,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_LessThan @x0 @x1) (BoxBool (< (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_LessThan @x0 @x1))
    :qid primitive_Prims.op_LessThan))
  :named primitive_Prims.op_LessThan))
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
; Projector equation
;;; Fact-ids: Name FStar.UInt128.__proj__Mkuint128__item__high; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,36-114,40); use=FStar.UInt128.fst(114,36-114,40)
  (forall ((@x0 Term))
   (! (= (FStar.UInt128.__proj__Mkuint128__item__high @x0) (FStar.UInt128.Mkuint128_@high @x0))
    :pattern ((FStar.UInt128.__proj__Mkuint128__item__high @x0))
    :qid proj_equation_FStar.UInt128.Mkuint128_@high))
  :named proj_equation_FStar.UInt128.Mkuint128_@high))
; Projector equation
;;; Fact-ids: Name FStar.UInt128.__proj__Mkuint128__item__low; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,24-114,27); use=FStar.UInt128.fst(114,24-114,27)
  (forall ((@x0 Term))
   (! (= (FStar.UInt128.__proj__Mkuint128__item__low @x0) (FStar.UInt128.Mkuint128_@low @x0))
    :pattern ((FStar.UInt128.__proj__Mkuint128__item__low @x0))
    :qid proj_equation_FStar.UInt128.Mkuint128_@low))
  :named proj_equation_FStar.UInt128.Mkuint128_@low))
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
;;; Fact-ids: Name FStar.UInt64.shift_right; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(207,42-207,43); use=FStar.UInt64.fsti(207,42-207,43)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(209,21-209,68); use=FStar.UInt64.fsti(209,21-209,68)
      (=
       (FStar.UInt.shift_right (BoxInt 64) (FStar.UInt64.v @x2) (FStar.UInt32.v @x3))
       (FStar.UInt64.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0))
  :named refinement_interpretation_Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0))
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
;;; Fact-ids: Name FStar.Seq.Base.empty; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(46,26-46,49); use=FStar.Seq.Base.fsti(46,26-46,49)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_0ce91af3d6762ea7d913b870f9e33a01 @u2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.Seq.Base.seq @u2 @x3))
      ;; def=FStar.Seq.Base.fsti(46,37-46,47); use=FStar.Seq.Base.fsti(46,37-46,47)
      (= (FStar.Seq.Base.length @u2 @x3 @x1) (BoxInt 0))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_0ce91af3d6762ea7d913b870f9e33a01 @u2 @x3)))
    :qid refinement_interpretation_Tm_refine_0ce91af3d6762ea7d913b870f9e33a01))
  :named refinement_interpretation_Tm_refine_0ce91af3d6762ea7d913b870f9e33a01))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt32.uint_to_t; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(57,34-57,35); use=FStar.UInt32.fsti(57,34-57,35)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_0ea1fba779ad5718e28476faeef94d56 @x2))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      ;; def=FStar.UInt32.fsti(59,21-59,28); use=FStar.UInt32.fsti(59,21-59,28)
      (= (FStar.UInt32.v @x1) @x2)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_0ea1fba779ad5718e28476faeef94d56 @x2)))
    :qid refinement_interpretation_Tm_refine_0ea1fba779ad5718e28476faeef94d56))
  :named refinement_interpretation_Tm_refine_0ea1fba779ad5718e28476faeef94d56))
; refinement_interpretation
;;; Fact-ids: Name FStar.BitVector.bv_t; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(31,21-31,51); use=FStar.BitVector.fsti(31,21-31,51)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_150c87740acaa31f788a9e84dd5820c2 @x2))
     (and
      (HasTypeFuel @u0 @x1 (FStar.Seq.Base.seq U_zero Prims.bool))
      ;; def=FStar.BitVector.fsti(31,36-31,50); use=FStar.BitVector.fsti(31,36-31,50)
      (= (FStar.Seq.Base.length U_zero Prims.bool @x1) @x2)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_150c87740acaa31f788a9e84dd5820c2 @x2)))
    :qid refinement_interpretation_Tm_refine_150c87740acaa31f788a9e84dd5820c2))
  :named refinement_interpretation_Tm_refine_150c87740acaa31f788a9e84dd5820c2))
; refinement_interpretation
;;; Fact-ids: Name FStar.Seq.Base.index; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(32,34-32,53); use=FStar.Seq.Base.fsti(32,34-32,53)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_160fe7faad9a466b3cae8455bac5be60 @u2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.Seq.Base.fsti(32,40-32,52); use=FStar.Seq.Base.fsti(32,40-32,52)
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 (FStar.Seq.Base.length @u2 @x3 @x4)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_160fe7faad9a466b3cae8455bac5be60 @u2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_160fe7faad9a466b3cae8455bac5be60))
  :named refinement_interpretation_Tm_refine_160fe7faad9a466b3cae8455bac5be60))
; refinement_interpretation
;;; Fact-ids: Name FStar.Seq.Properties.seq_find_aux; Namespace FStar.Seq.Properties
(assert
 (! ;; def=FStar.Seq.Properties.fsti(382,59-382,89); use=FStar.Seq.Properties.fsti(382,59-382,89)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_1628fa8159c35bdaa68f121a383a6a00 @u2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.Seq.Properties.fsti(382,68-382,87); use=FStar.Seq.Properties.fsti(382,68-382,87)
      (<= (BoxInt_proj_0 @x1) (BoxInt_proj_0 (FStar.Seq.Base.length @u2 @x3 @x4)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_1628fa8159c35bdaa68f121a383a6a00 @u2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_1628fa8159c35bdaa68f121a383a6a00))
  :named refinement_interpretation_Tm_refine_1628fa8159c35bdaa68f121a383a6a00))
; refinement_interpretation
;;; Fact-ids: Name FStar.Seq.Properties.slice_slice; Namespace FStar.Seq.Properties
(assert
 (! ;; def=FStar.Seq.Properties.fsti(625,2-625,40); use=FStar.Seq.Properties.fsti(625,2-625,40)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_1ba8fd8bb363097813064c67740b2de5 @x2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.Seq.Properties.fsti(625,12-625,20); use=FStar.Seq.Properties.fsti(625,12-625,20)
      (<= (BoxInt_proj_0 @x2) (BoxInt_proj_0 @x1))
      ;; def=FStar.Seq.Properties.fsti(625,24-625,37); use=FStar.Seq.Properties.fsti(625,24-625,37)
      (<= (BoxInt_proj_0 @x1) (BoxInt_proj_0 (Prims.op_Subtraction @x3 @x4)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_1ba8fd8bb363097813064c67740b2de5 @x2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_1ba8fd8bb363097813064c67740b2de5))
  :named refinement_interpretation_Tm_refine_1ba8fd8bb363097813064c67740b2de5))
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
;;; Fact-ids: Name FStar.BitVector.shift_right_vec_lemma_1; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(150,59-150,83); use=FStar.BitVector.fsti(150,59-150,83)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_34425c23b534b8a294f8f063dd9faa4b @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      (BoxBool_proj_0 (Prims.op_LessThan @x1 @x2))
      (BoxBool_proj_0 (Prims.op_LessThan @x1 @x3))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_34425c23b534b8a294f8f063dd9faa4b @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_34425c23b534b8a294f8f063dd9faa4b))
  :named refinement_interpretation_Tm_refine_34425c23b534b8a294f8f063dd9faa4b))
; refinement_interpretation
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(158,88-158,104); use=FStar.Seq.Base.fsti(158,88-158,104)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.Seq.Base.fsti(158,94-158,103); use=FStar.Seq.Base.fsti(158,94-158,103)
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 (Prims.op_Subtraction @x2 @x3)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8))
  :named refinement_interpretation_Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(726,71-726,76); use=FStar.UInt128.fst(726,71-726,76)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71 @x2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(728,21-729,69); use=FStar.UInt128.fst(728,21-729,69)
      (=
       (FStar.UInt64.v @x1)
       (Prims.op_Addition
        (Prims.op_Division (FStar.UInt64.v @x2) (Prims.pow2 (FStar.UInt32.v @x3)))
        (Prims.op_Modulus
         (Prims.op_Star
          (FStar.UInt64.v @x4)
          (Prims.pow2 (Prims.op_Subtraction (BoxInt 64) (FStar.UInt32.v @x3))))
         (Prims.pow2 (BoxInt 64)))))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71 @x2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71))
  :named refinement_interpretation_Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71))
; refinement_interpretation
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_app2; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(153,57-153,107); use=FStar.Seq.Base.fsti(153,57-153,107)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_444061fd0bd0053c4f27fa233082c9ca @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.Seq.Base.fsti(153,63-153,88); use=FStar.Seq.Base.fsti(153,63-153,88)
      (<
       (BoxInt_proj_0 @x1)
       (BoxInt_proj_0
        (Prims.op_Addition (FStar.Seq.Base.length @u2 @x3 @x4) (FStar.Seq.Base.length @u2 @x3 @x5))))
      ;; def=FStar.Seq.Base.fsti(153,92-153,106); use=FStar.Seq.Base.fsti(153,92-153,106)
      (<= (BoxInt_proj_0 (FStar.Seq.Base.length @u2 @x3 @x4)) (BoxInt_proj_0 @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_444061fd0bd0053c4f27fa233082c9ca @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_444061fd0bd0053c4f27fa233082c9ca))
  :named refinement_interpretation_Tm_refine_444061fd0bd0053c4f27fa233082c9ca))
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
;;; Fact-ids: Name FStar.Seq.Base.slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(64,43-64,73); use=FStar.Seq.Base.fsti(64,43-64,73)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13 @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      (BoxBool_proj_0 (Prims.op_LessThanOrEqual @x3 @x1))
      (BoxBool_proj_0 (Prims.op_LessThanOrEqual @x1 (FStar.Seq.Base.length @u2 @x4 @x5)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13 @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13))
  :named refinement_interpretation_Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13))
; refinement_interpretation
;;; Fact-ids: Name FStar.BitVector.shift_left_vec_lemma_1; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(136,58-136,87); use=FStar.BitVector.fsti(136,58-136,87)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_6ccf0869e6825997ab860bb25791c11f @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      (BoxBool_proj_0 (Prims.op_LessThan @x1 @x2))
      (BoxBool_proj_0 (Prims.op_GreaterThanOrEqual @x1 (Prims.op_Subtraction @x2 @x3)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_6ccf0869e6825997ab860bb25791c11f @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_6ccf0869e6825997ab860bb25791c11f))
  :named refinement_interpretation_Tm_refine_6ccf0869e6825997ab860bb25791c11f))
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
;;; Fact-ids: Name FStar.UInt.index_to_vec_ones; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(430,41-430,54); use=FStar.UInt.fsti(430,41-430,54)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d @x2))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.UInt.fsti(430,47-430,53); use=FStar.UInt.fsti(430,47-430,53)
      (<= (BoxInt_proj_0 @x1) (BoxInt_proj_0 @x2))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d @x2)))
    :qid refinement_interpretation_Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d))
  :named refinement_interpretation_Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d))
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
;;; Fact-ids: Name FStar.UInt32.sub; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(115,27-115,28); use=FStar.UInt32.fsti(115,27-115,28)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_aa4b3d268075d84252df525db1f85524 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      ;; def=FStar.UInt32.fsti(117,21-117,36); use=FStar.UInt32.fsti(117,21-117,36)
      (= (Prims.op_Subtraction (FStar.UInt32.v @x2) (FStar.UInt32.v @x3)) (FStar.UInt32.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_aa4b3d268075d84252df525db1f85524 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_aa4b3d268075d84252df525db1f85524))
  :named refinement_interpretation_Tm_refine_aa4b3d268075d84252df525db1f85524))
; refinement_interpretation
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(158,54-158,84); use=FStar.Seq.Base.fsti(158,54-158,84)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0 @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.Seq.Base.fsti(158,60-158,66); use=FStar.Seq.Base.fsti(158,60-158,66)
      (<= (BoxInt_proj_0 @x3) (BoxInt_proj_0 @x1))
      ;; def=FStar.Seq.Base.fsti(158,70-158,83); use=FStar.Seq.Base.fsti(158,70-158,83)
      (<= (BoxInt_proj_0 @x1) (BoxInt_proj_0 (FStar.Seq.Base.length @u2 @x4 @x5)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0 @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0))
  :named refinement_interpretation_Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.add; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(87,27-87,28); use=FStar.UInt64.fsti(87,27-87,28)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_bc552b2c624e2add758b3ac761c0c563 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(89,21-89,36); use=FStar.UInt64.fsti(89,21-89,36)
      (= (Prims.op_Addition (FStar.UInt64.v @x2) (FStar.UInt64.v @x3)) (FStar.UInt64.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_bc552b2c624e2add758b3ac761c0c563 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_bc552b2c624e2add758b3ac761c0c563))
  :named refinement_interpretation_Tm_refine_bc552b2c624e2add758b3ac761c0c563))
; refinement_interpretation
;;; Fact-ids: Name FStar.BitVector.shift_right_vec_lemma_2; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(155,59-155,84); use=FStar.BitVector.fsti(155,59-155,84)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_c0ec47abc53a2509e744dad22ccf8191 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      (BoxBool_proj_0 (Prims.op_LessThan @x1 @x2))
      (BoxBool_proj_0 (Prims.op_GreaterThanOrEqual @x1 @x3))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_c0ec47abc53a2509e744dad22ccf8191 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_c0ec47abc53a2509e744dad22ccf8191))
  :named refinement_interpretation_Tm_refine_c0ec47abc53a2509e744dad22ccf8191))
; refinement_interpretation
;;; Fact-ids: Name FStar.Seq.Base.init_aux; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(36,41-36,57); use=FStar.Seq.Base.fsti(36,41-36,57)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x2))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.Seq.Base.fsti(36,48-36,55); use=FStar.Seq.Base.fsti(36,48-36,55)
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 @x2))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x2)))
    :qid refinement_interpretation_Tm_refine_c1424615841f28cac7fc34e92b7ff33c))
  :named refinement_interpretation_Tm_refine_c1424615841f28cac7fc34e92b7ff33c))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right_respec; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(751,77-751,82); use=FStar.UInt128.fst(751,77-751,82)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_c666da6bc448e4fc799131c9359c6383 @x2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(753,21-754,74); use=FStar.UInt128.fst(753,21-754,74)
      (=
       (FStar.UInt64.v @x1)
       (Prims.op_Addition
        (Prims.op_Division (FStar.UInt64.v @x2) (Prims.pow2 (FStar.UInt32.v @x3)))
        (Prims.op_Modulus
         (Prims.op_Division
          (Prims.op_Star (FStar.UInt64.v @x4) (Prims.pow2 (BoxInt 64)))
          (Prims.pow2 (FStar.UInt32.v @x3)))
         (Prims.pow2 (BoxInt 64)))))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_c666da6bc448e4fc799131c9359c6383 @x2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_c666da6bc448e4fc799131c9359c6383))
  :named refinement_interpretation_Tm_refine_c666da6bc448e4fc799131c9359c6383))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_left; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(551,38-551,62); use=FStar.UInt128.fst(551,38-551,62)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d)
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      ;; def=FStar.UInt128.fst(551,48-551,60); use=FStar.UInt128.fst(551,48-551,60)
      (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 64)))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
    :qid refinement_interpretation_Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
  :named refinement_interpretation_Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
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
;;; Fact-ids: Name FStar.UInt128.u32_64; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(527,20-527,42); use=FStar.UInt128.fst(527,20-527,42)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66)
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      ;; def=FStar.UInt128.fst(527,28-527,41); use=FStar.UInt128.fst(527,28-527,41)
      (= (FStar.UInt32.v @x1) (BoxInt 64))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66))
    :qid refinement_interpretation_Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66))
  :named refinement_interpretation_Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66))
; refinement_interpretation
;;; Fact-ids: Name FStar.BitVector.shift_left_vec_lemma_2; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(141,58-141,86); use=FStar.BitVector.fsti(141,58-141,86)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      (BoxBool_proj_0 (Prims.op_LessThan @x1 @x2))
      (BoxBool_proj_0 (Prims.op_LessThan @x1 (Prims.op_Subtraction @x2 @x3)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826))
  :named refinement_interpretation_Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.shift_left; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(212,41-212,42); use=FStar.UInt64.fsti(212,41-212,42)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_ebf0af240d826e12ec6c1570ad81631c @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(214,21-214,67); use=FStar.UInt64.fsti(214,21-214,67)
      (=
       (FStar.UInt.shift_left (BoxInt 64) (FStar.UInt64.v @x2) (FStar.UInt32.v @x3))
       (FStar.UInt64.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_ebf0af240d826e12ec6c1570ad81631c @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_ebf0af240d826e12ec6c1570ad81631c))
  :named refinement_interpretation_Tm_refine_ebf0af240d826e12ec6c1570ad81631c))
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
;;; Fact-ids: Name FStar.UInt64.shift_right; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(207,42-207,43); use=FStar.UInt64.fsti(207,42-207,43)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0))
  :named refinement_kinding_Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0))
; refinement kinding
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (HasType Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
; refinement kinding
;;; Fact-ids: Name FStar.Seq.Base.empty; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(46,26-46,49); use=FStar.Seq.Base.fsti(46,26-46,49)
  (forall ((@u0 Universe) (@x1 Term))
   (! (HasType (Tm_refine_0ce91af3d6762ea7d913b870f9e33a01 @u0 @x1) (Tm_type @u0))
    :pattern ((HasType (Tm_refine_0ce91af3d6762ea7d913b870f9e33a01 @u0 @x1) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_0ce91af3d6762ea7d913b870f9e33a01))
  :named refinement_kinding_Tm_refine_0ce91af3d6762ea7d913b870f9e33a01))
; refinement kinding
;;; Fact-ids: Name FStar.UInt32.uint_to_t; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(57,34-57,35); use=FStar.UInt32.fsti(57,34-57,35)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_0ea1fba779ad5718e28476faeef94d56 @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_0ea1fba779ad5718e28476faeef94d56 @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_0ea1fba779ad5718e28476faeef94d56))
  :named refinement_kinding_Tm_refine_0ea1fba779ad5718e28476faeef94d56))
; refinement kinding
;;; Fact-ids: Name FStar.BitVector.bv_t; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(31,21-31,51); use=FStar.BitVector.fsti(31,21-31,51)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_150c87740acaa31f788a9e84dd5820c2 @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_150c87740acaa31f788a9e84dd5820c2 @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_150c87740acaa31f788a9e84dd5820c2))
  :named refinement_kinding_Tm_refine_150c87740acaa31f788a9e84dd5820c2))
; refinement kinding
;;; Fact-ids: Name FStar.Seq.Base.index; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(32,34-32,53); use=FStar.Seq.Base.fsti(32,34-32,53)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_160fe7faad9a466b3cae8455bac5be60))
  :named refinement_kinding_Tm_refine_160fe7faad9a466b3cae8455bac5be60))
; refinement kinding
;;; Fact-ids: Name FStar.Seq.Properties.seq_find_aux; Namespace FStar.Seq.Properties
(assert
 (! ;; def=FStar.Seq.Properties.fsti(382,59-382,89); use=FStar.Seq.Properties.fsti(382,59-382,89)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_1628fa8159c35bdaa68f121a383a6a00 @u0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_1628fa8159c35bdaa68f121a383a6a00 @u0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_1628fa8159c35bdaa68f121a383a6a00))
  :named refinement_kinding_Tm_refine_1628fa8159c35bdaa68f121a383a6a00))
; refinement kinding
;;; Fact-ids: Name FStar.Seq.Properties.slice_slice; Namespace FStar.Seq.Properties
(assert
 (! ;; def=FStar.Seq.Properties.fsti(625,2-625,40); use=FStar.Seq.Properties.fsti(625,2-625,40)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_1ba8fd8bb363097813064c67740b2de5 @x0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_1ba8fd8bb363097813064c67740b2de5 @x0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_1ba8fd8bb363097813064c67740b2de5))
  :named refinement_kinding_Tm_refine_1ba8fd8bb363097813064c67740b2de5))
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
;;; Fact-ids: Name FStar.BitVector.shift_right_vec_lemma_1; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(150,59-150,83); use=FStar.BitVector.fsti(150,59-150,83)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_34425c23b534b8a294f8f063dd9faa4b @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_34425c23b534b8a294f8f063dd9faa4b @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_34425c23b534b8a294f8f063dd9faa4b))
  :named refinement_kinding_Tm_refine_34425c23b534b8a294f8f063dd9faa4b))
; refinement kinding
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(158,88-158,104); use=FStar.Seq.Base.fsti(158,88-158,104)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8))
  :named refinement_kinding_Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8))
; refinement kinding
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(726,71-726,76); use=FStar.UInt128.fst(726,71-726,76)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71 @x0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71 @x0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71))
  :named refinement_kinding_Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71))
; refinement kinding
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_app2; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(153,57-153,107); use=FStar.Seq.Base.fsti(153,57-153,107)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_444061fd0bd0053c4f27fa233082c9ca @u0 @x1 @x2 @x3) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_444061fd0bd0053c4f27fa233082c9ca @u0 @x1 @x2 @x3) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_444061fd0bd0053c4f27fa233082c9ca))
  :named refinement_kinding_Tm_refine_444061fd0bd0053c4f27fa233082c9ca))
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
;;; Fact-ids: Name FStar.Seq.Base.slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(64,43-64,73); use=FStar.Seq.Base.fsti(64,43-64,73)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13 @u0 @x1 @x2 @x3) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13 @u0 @x1 @x2 @x3) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13))
  :named refinement_kinding_Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13))
; refinement kinding
;;; Fact-ids: Name FStar.BitVector.shift_left_vec_lemma_1; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(136,58-136,87); use=FStar.BitVector.fsti(136,58-136,87)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_6ccf0869e6825997ab860bb25791c11f @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_6ccf0869e6825997ab860bb25791c11f @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_6ccf0869e6825997ab860bb25791c11f))
  :named refinement_kinding_Tm_refine_6ccf0869e6825997ab860bb25791c11f))
; refinement kinding
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! (HasType Tm_refine_774ba3f728d91ead8ef40be66c9802e5 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
; refinement kinding
;;; Fact-ids: Name FStar.UInt.index_to_vec_ones; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(430,41-430,54); use=FStar.UInt.fsti(430,41-430,54)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d))
  :named refinement_kinding_Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d))
; refinement kinding
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Tm_refine_9d6af3f3535473623f7aec2f0501897f (Tm_type (U_succ U_zero)))
  :named refinement_kinding_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; refinement kinding
;;; Fact-ids: Name FStar.UInt32.sub; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(115,27-115,28); use=FStar.UInt32.fsti(115,27-115,28)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_aa4b3d268075d84252df525db1f85524 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_aa4b3d268075d84252df525db1f85524 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_aa4b3d268075d84252df525db1f85524))
  :named refinement_kinding_Tm_refine_aa4b3d268075d84252df525db1f85524))
; refinement kinding
;;; Fact-ids: Name FStar.Seq.Base.lemma_index_slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(158,54-158,84); use=FStar.Seq.Base.fsti(158,54-158,84)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0 @u0 @x1 @x2 @x3) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0 @u0 @x1 @x2 @x3) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0))
  :named refinement_kinding_Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.add; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(87,27-87,28); use=FStar.UInt64.fsti(87,27-87,28)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_bc552b2c624e2add758b3ac761c0c563 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_bc552b2c624e2add758b3ac761c0c563 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_bc552b2c624e2add758b3ac761c0c563))
  :named refinement_kinding_Tm_refine_bc552b2c624e2add758b3ac761c0c563))
; refinement kinding
;;; Fact-ids: Name FStar.BitVector.shift_right_vec_lemma_2; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(155,59-155,84); use=FStar.BitVector.fsti(155,59-155,84)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_c0ec47abc53a2509e744dad22ccf8191 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_c0ec47abc53a2509e744dad22ccf8191 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_c0ec47abc53a2509e744dad22ccf8191))
  :named refinement_kinding_Tm_refine_c0ec47abc53a2509e744dad22ccf8191))
; refinement kinding
;;; Fact-ids: Name FStar.Seq.Base.init_aux; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(36,41-36,57); use=FStar.Seq.Base.fsti(36,41-36,57)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_c1424615841f28cac7fc34e92b7ff33c))
  :named refinement_kinding_Tm_refine_c1424615841f28cac7fc34e92b7ff33c))
; refinement kinding
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right_respec; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(751,77-751,82); use=FStar.UInt128.fst(751,77-751,82)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_c666da6bc448e4fc799131c9359c6383 @x0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_c666da6bc448e4fc799131c9359c6383 @x0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_c666da6bc448e4fc799131c9359c6383))
  :named refinement_kinding_Tm_refine_c666da6bc448e4fc799131c9359c6383))
; refinement kinding
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_left; Namespace FStar.UInt128
(assert
 (! (HasType Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
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
;;; Fact-ids: Name FStar.UInt128.u32_64; Namespace FStar.UInt128
(assert
 (! (HasType Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66))
; refinement kinding
;;; Fact-ids: Name FStar.BitVector.shift_left_vec_lemma_2; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(141,58-141,86); use=FStar.BitVector.fsti(141,58-141,86)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826))
  :named refinement_kinding_Tm_refine_e8e1ad4b2203cd724d5b8b2dba0a5826))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.shift_left; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(212,41-212,42); use=FStar.UInt64.fsti(212,41-212,42)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_ebf0af240d826e12ec6c1570ad81631c @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_ebf0af240d826e12ec6c1570ad81631c @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_ebf0af240d826e12ec6c1570ad81631c))
  :named refinement_kinding_Tm_refine_ebf0af240d826e12ec6c1570ad81631c))
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
;;; Fact-ids: Name FStar.UInt.from_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(185,8-185,16); use=FStar.UInt.fsti(185,8-185,16)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.nat) (HasType @x2 (FStar.BitVector.bv_t @x1)))
     (HasType (FStar.UInt.from_vec.fuel_instrumented @u0 @x1 @x2) (FStar.UInt.uint_t @x1)))
    :pattern ((FStar.UInt.from_vec.fuel_instrumented @u0 @x1 @x2))
    :qid token_correspondence_FStar.UInt.from_vec.fuel_instrumented))
  :named token_correspondence_FStar.UInt.from_vec.fuel_instrumented))
; Typing correspondence of token to term
;;; Fact-ids: Name FStar.UInt.to_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(181,8-181,14); use=FStar.UInt.fsti(181,8-181,14)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.nat) (HasType @x2 (FStar.UInt.uint_t @x1)))
     (HasType (FStar.UInt.to_vec.fuel_instrumented @u0 @x1 @x2) (FStar.BitVector.bv_t @x1)))
    :pattern ((FStar.UInt.to_vec.fuel_instrumented @u0 @x1 @x2))
    :qid token_correspondence_FStar.UInt.to_vec.fuel_instrumented))
  :named token_correspondence_FStar.UInt.to_vec.fuel_instrumented))
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
;;; Fact-ids: Name FStar.BitVector.bv_t; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(31,5-31,9); use=FStar.BitVector.fsti(31,5-31,9)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.BitVector.bv_t @x0) (Tm_type U_zero)))
    :pattern ((FStar.BitVector.bv_t @x0))
    :qid typing_FStar.BitVector.bv_t))
  :named typing_FStar.BitVector.bv_t))
; free var typing
;;; Fact-ids: Name FStar.BitVector.shift_left_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(132,4-132,18); use=FStar.BitVector.fsti(132,4-132,18)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.BitVector.bv_t @x0)) (HasType @x2 Prims.nat))
     (HasType (FStar.BitVector.shift_left_vec @x0 @x1 @x2) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.shift_left_vec @x0 @x1 @x2))
    :qid typing_FStar.BitVector.shift_left_vec))
  :named typing_FStar.BitVector.shift_left_vec))
; free var typing
;;; Fact-ids: Name FStar.BitVector.shift_right_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(146,4-146,19); use=FStar.BitVector.fsti(146,4-146,19)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.BitVector.bv_t @x0)) (HasType @x2 Prims.nat))
     (HasType (FStar.BitVector.shift_right_vec @x0 @x1 @x2) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.shift_right_vec @x0 @x1 @x2))
    :qid typing_FStar.BitVector.shift_right_vec))
  :named typing_FStar.BitVector.shift_right_vec))
; free var typing
;;; Fact-ids: Name FStar.BitVector.zero_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(36,4-36,12); use=FStar.BitVector.fsti(36,4-36,12)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.pos)
     (HasType (FStar.BitVector.zero_vec @x0) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.zero_vec @x0))
    :qid typing_FStar.BitVector.zero_vec))
  :named typing_FStar.BitVector.zero_vec))
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
;;; Fact-ids: Name FStar.Seq.Base.append; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(58,4-58,10); use=FStar.Seq.Base.fsti(58,4-58,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1)))
     (HasType (FStar.Seq.Base.append @u0 @x1 @x2 @x3) (FStar.Seq.Base.seq @u0 @x1)))
    :pattern ((FStar.Seq.Base.append @u0 @x1 @x2 @x3))
    :qid typing_FStar.Seq.Base.append))
  :named typing_FStar.Seq.Base.append))
; free var typing
;;; Fact-ids: Name FStar.Seq.Base.create; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(34,4-34,10); use=FStar.Seq.Base.fsti(34,4-34,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 Prims.nat) (HasType @x3 @x1))
     (HasType (FStar.Seq.Base.create @u0 @x1 @x2 @x3) (FStar.Seq.Base.seq @u0 @x1)))
    :pattern ((FStar.Seq.Base.create @u0 @x1 @x2 @x3))
    :qid typing_FStar.Seq.Base.create))
  :named typing_FStar.Seq.Base.create))
; free var typing
;;; Fact-ids: Name FStar.Seq.Base.empty; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(46,4-46,9); use=FStar.Seq.Base.fsti(46,4-46,9)
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies
     (HasType @x1 (Tm_type @u0))
     (HasType (FStar.Seq.Base.empty @u0 @x1) (Tm_refine_0ce91af3d6762ea7d913b870f9e33a01 @u0 @x1)))
    :pattern ((FStar.Seq.Base.empty @u0 @x1))
    :qid typing_FStar.Seq.Base.empty))
  :named typing_FStar.Seq.Base.empty))
; free var typing
;;; Fact-ids: Name FStar.Seq.Base.equal; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(166,4-166,9); use=FStar.Seq.Base.fsti(166,4-166,9)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1)))
     (HasType (FStar.Seq.Base.equal @u0 @x1 @x2 @x3) Prims.prop))
    :pattern ((FStar.Seq.Base.equal @u0 @x1 @x2 @x3))
    :qid typing_FStar.Seq.Base.equal))
  :named typing_FStar.Seq.Base.equal))
; free var typing
;;; Fact-ids: Name FStar.Seq.Base.index; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(32,4-32,9); use=FStar.Seq.Base.fsti(32,4-32,9)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (Tm_refine_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2)))
     (HasType (FStar.Seq.Base.index @u0 @x1 @x2 @x3) @x1))
    :pattern ((FStar.Seq.Base.index @u0 @x1 @x2 @x3))
    :qid typing_FStar.Seq.Base.index))
  :named typing_FStar.Seq.Base.index))
; free var typing
;;; Fact-ids: Name FStar.Seq.Base.length; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(26,4-26,10); use=FStar.Seq.Base.fsti(26,4-26,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Seq.Base.seq @u0 @x1)))
     (HasType (FStar.Seq.Base.length @u0 @x1 @x2) Prims.nat))
    :pattern ((FStar.Seq.Base.length @u0 @x1 @x2))
    :qid typing_FStar.Seq.Base.length))
  :named typing_FStar.Seq.Base.length))
; free var typing
;;; Fact-ids: Name FStar.Seq.Base.seq; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(23,8-23,11); use=FStar.Seq.Base.fsti(23,8-23,11)
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies (HasType @x1 (Tm_type @u0)) (HasType (FStar.Seq.Base.seq @u0 @x1) (Tm_type @u0)))
    :pattern ((FStar.Seq.Base.seq @u0 @x1))
    :qid typing_FStar.Seq.Base.seq))
  :named typing_FStar.Seq.Base.seq))
; free var typing
;;; Fact-ids: Name FStar.Seq.Base.slice; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(64,4-64,9); use=FStar.Seq.Base.fsti(64,4-64,9)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 Prims.nat)
      (HasType @x4 (Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13 @u0 @x3 @x1 @x2)))
     (HasType (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4) (FStar.Seq.Base.seq @u0 @x1)))
    :pattern ((FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4))
    :qid typing_FStar.Seq.Base.slice))
  :named typing_FStar.Seq.Base.slice))
; free var typing
;;; Fact-ids: Name FStar.UInt.eq; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(165,4-165,6); use=FStar.UInt.fsti(165,4-165,6)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.nat)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.eq @x0 @x1 @x2) Prims.bool))
    :pattern ((FStar.UInt.eq @x0 @x1 @x2))
    :qid typing_FStar.UInt.eq))
  :named typing_FStar.UInt.eq))
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
;;; Fact-ids: Name FStar.UInt.from_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(185,8-185,16); use=FStar.UInt.fsti(185,8-185,16)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.nat) (HasType @x1 (FStar.BitVector.bv_t @x0)))
     (HasType (FStar.UInt.from_vec @x0 @x1) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.from_vec @x0 @x1))
    :qid typing_FStar.UInt.from_vec))
  :named typing_FStar.UInt.from_vec))
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
;;; Fact-ids: Name FStar.UInt.shift_left; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(448,4-448,14); use=FStar.UInt.fsti(448,4-448,14)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)) (HasType @x2 Prims.nat))
     (HasType (FStar.UInt.shift_left @x0 @x1 @x2) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.shift_left @x0 @x1 @x2))
    :qid typing_FStar.UInt.shift_left))
  :named typing_FStar.UInt.shift_left))
; free var typing
;;; Fact-ids: Name FStar.UInt.shift_right; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(451,4-451,15); use=FStar.UInt.fsti(451,4-451,15)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)) (HasType @x2 Prims.nat))
     (HasType (FStar.UInt.shift_right @x0 @x1 @x2) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.shift_right @x0 @x1 @x2))
    :qid typing_FStar.UInt.shift_right))
  :named typing_FStar.UInt.shift_right))
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
;;; Fact-ids: Name FStar.UInt.to_vec; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(181,8-181,14); use=FStar.UInt.fsti(181,8-181,14)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.nat) (HasType @x1 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.to_vec @x0 @x1) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.UInt.to_vec @x0 @x1))
    :qid typing_FStar.UInt.to_vec))
  :named typing_FStar.UInt.to_vec))
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
;;; Fact-ids: Name FStar.UInt.zero; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(57,4-57,8); use=FStar.UInt.fsti(57,4-57,8)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.zero @x0) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.zero @x0))
    :qid typing_FStar.UInt.zero))
  :named typing_FStar.UInt.zero))
; free var typing
;;; Fact-ids: Name FStar.UInt128.__proj__Mkuint128__item__high; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,36-114,40); use=FStar.UInt128.fst(114,36-114,40)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 FStar.UInt128.uint128)
     (HasType (FStar.UInt128.__proj__Mkuint128__item__high @x0) (FStar.UInt64.t Dummy_value)))
    :pattern ((FStar.UInt128.__proj__Mkuint128__item__high @x0))
    :qid typing_FStar.UInt128.__proj__Mkuint128__item__high))
  :named typing_FStar.UInt128.__proj__Mkuint128__item__high))
; free var typing
;;; Fact-ids: Name FStar.UInt128.__proj__Mkuint128__item__low; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(114,24-114,27); use=FStar.UInt128.fst(114,24-114,27)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 FStar.UInt128.uint128)
     (HasType (FStar.UInt128.__proj__Mkuint128__item__low @x0) (FStar.UInt64.t Dummy_value)))
    :pattern ((FStar.UInt128.__proj__Mkuint128__item__low @x0))
    :qid typing_FStar.UInt128.__proj__Mkuint128__item__low))
  :named typing_FStar.UInt128.__proj__Mkuint128__item__low))
; free var typing
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(726,4-726,23); use=FStar.UInt128.fst(726,4-726,23)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      ;; def=FStar.UInt128.fst(727,12-727,26); use=FStar.UInt128.fst(727,12-727,26)
      (not (= (FStar.UInt32.v @x2) (BoxInt 0)))
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt64.t Dummy_value))
      (HasType @x2 Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
     (HasType
      (FStar.UInt128.add_u64_shift_right @x0 @x1 @x2)
      (Tm_refine_3db1592cca4a22ddebe9f4b0b1b82a71 @x1 @x2 @x0)))
    :pattern ((FStar.UInt128.add_u64_shift_right @x0 @x1 @x2))
    :qid typing_FStar.UInt128.add_u64_shift_right))
  :named typing_FStar.UInt128.add_u64_shift_right))
; free var typing
;;; Fact-ids: Name FStar.UInt128.add_u64_shift_right_respec; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(751,4-751,30); use=FStar.UInt128.fst(751,4-751,30)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      ;; def=FStar.UInt128.fst(752,12-752,26); use=FStar.UInt128.fst(752,12-752,26)
      (not (= (FStar.UInt32.v @x2) (BoxInt 0)))
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt64.t Dummy_value))
      (HasType @x2 Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
     (HasType
      (FStar.UInt128.add_u64_shift_right_respec @x0 @x1 @x2)
      (Tm_refine_c666da6bc448e4fc799131c9359c6383 @x1 @x2 @x0)))
    :pattern ((FStar.UInt128.add_u64_shift_right_respec @x0 @x1 @x2))
    :qid typing_FStar.UInt128.add_u64_shift_right_respec))
  :named typing_FStar.UInt128.add_u64_shift_right_respec))
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
;;; Fact-ids: Name FStar.UInt128.t; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(116,4-116,5); use=FStar.UInt128.fst(116,4-116,5)
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt128.t @u0) Tm_refine_9d6af3f3535473623f7aec2f0501897f)
    :pattern ((FStar.UInt128.t @u0))
    :qid typing_FStar.UInt128.t))
  :named typing_FStar.UInt128.t))
; free var typing
;;; Fact-ids: Name FStar.UInt128.u32_64; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(527,12-527,18); use=FStar.UInt128.fst(527,12-527,18)
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt128.u32_64 @u0) Tm_refine_e1d24c158e7f5ef1f6415367ebc96e66)
    :pattern ((FStar.UInt128.u32_64 @u0))
    :qid typing_FStar.UInt128.u32_64))
  :named typing_FStar.UInt128.u32_64))
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
;;; Fact-ids: Name FStar.UInt128.v; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(122,4-122,5); use=FStar.UInt128.fst(122,4-122,5)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt128.t Dummy_value))
     (HasType (FStar.UInt128.v @x0) (FStar.UInt.uint_t (FStar.UInt128.n Dummy_value))))
    :pattern ((FStar.UInt128.v @x0))
    :qid typing_FStar.UInt128.v))
  :named typing_FStar.UInt128.v))
; free var typing
;;; Fact-ids: Name FStar.UInt32.eq; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(234,4-234,6); use=FStar.UInt32.fsti(234,4-234,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt32.t Dummy_value)) (HasType @x1 (FStar.UInt32.t Dummy_value)))
     (HasType (FStar.UInt32.eq @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt32.eq @x0 @x1))
    :qid typing_FStar.UInt32.eq))
  :named typing_FStar.UInt32.eq))
; free var typing
;;; Fact-ids: Name FStar.UInt32.sub; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(115,4-115,7); use=FStar.UInt32.fsti(115,4-115,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      ;; def=FStar.UInt32.fsti(116,12-116,32); use=FStar.UInt32.fsti(116,12-116,32)
      (Valid
       ;; def=FStar.UInt32.fsti(116,12-116,32); use=FStar.UInt32.fsti(116,12-116,32)
       (FStar.UInt.size (Prims.op_Subtraction (FStar.UInt32.v @x0) (FStar.UInt32.v @x1)) (BoxInt 32)))
      (HasType @x0 (FStar.UInt32.t Dummy_value))
      (HasType @x1 (FStar.UInt32.t Dummy_value)))
     (HasType (FStar.UInt32.sub @x0 @x1) (Tm_refine_aa4b3d268075d84252df525db1f85524 @x0 @x1)))
    :pattern ((FStar.UInt32.sub @x0 @x1))
    :qid typing_FStar.UInt32.sub))
  :named typing_FStar.UInt32.sub))
; free var typing
;;; Fact-ids: Name FStar.UInt32.t; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(47,8-47,9); use=FStar.UInt32.fsti(47,8-47,9)
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt32.t @u0) Prims.eqtype)
    :pattern ((FStar.UInt32.t @u0))
    :qid typing_FStar.UInt32.t))
  :named typing_FStar.UInt32.t))
; free var typing
;;; Fact-ids: Name FStar.UInt32.uint_to_t; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(57,4-57,13); use=FStar.UInt32.fsti(57,4-57,13)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt.uint_t (BoxInt 32)))
     (HasType (FStar.UInt32.uint_to_t @x0) (Tm_refine_0ea1fba779ad5718e28476faeef94d56 @x0)))
    :pattern ((FStar.UInt32.uint_to_t @x0))
    :qid typing_FStar.UInt32.uint_to_t))
  :named typing_FStar.UInt32.uint_to_t))
; free var typing
;;; Fact-ids: Name FStar.UInt32.v; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(51,4-51,5); use=FStar.UInt32.fsti(51,4-51,5)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt32.t Dummy_value))
     (HasType (FStar.UInt32.v @x0) (FStar.UInt.uint_t (BoxInt 32))))
    :pattern ((FStar.UInt32.v @x0))
    :qid typing_FStar.UInt32.v))
  :named typing_FStar.UInt32.v))
; free var typing
;;; Fact-ids: Name FStar.UInt64.add; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(87,4-87,7); use=FStar.UInt64.fsti(87,4-87,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      ;; def=FStar.UInt64.fsti(88,12-88,32); use=FStar.UInt64.fsti(88,12-88,32)
      (Valid
       ;; def=FStar.UInt64.fsti(88,12-88,32); use=FStar.UInt64.fsti(88,12-88,32)
       (FStar.UInt.size (Prims.op_Addition (FStar.UInt64.v @x0) (FStar.UInt64.v @x1)) (BoxInt 64)))
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.add @x0 @x1) (Tm_refine_bc552b2c624e2add758b3ac761c0c563 @x0 @x1)))
    :pattern ((FStar.UInt64.add @x0 @x1))
    :qid typing_FStar.UInt64.add))
  :named typing_FStar.UInt64.add))
; free var typing
;;; Fact-ids: Name FStar.UInt64.shift_left; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(212,4-212,14); use=FStar.UInt64.fsti(212,4-212,14)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      ;; def=FStar.UInt64.fsti(213,12-213,28); use=FStar.UInt64.fsti(213,12-213,28)
      (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 64)))
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt32.t Dummy_value)))
     (HasType (FStar.UInt64.shift_left @x0 @x1) (Tm_refine_ebf0af240d826e12ec6c1570ad81631c @x0 @x1)))
    :pattern ((FStar.UInt64.shift_left @x0 @x1))
    :qid typing_FStar.UInt64.shift_left))
  :named typing_FStar.UInt64.shift_left))
; free var typing
;;; Fact-ids: Name FStar.UInt64.shift_right; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(207,4-207,15); use=FStar.UInt64.fsti(207,4-207,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      ;; def=FStar.UInt64.fsti(208,12-208,28); use=FStar.UInt64.fsti(208,12-208,28)
      (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 64)))
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt32.t Dummy_value)))
     (HasType
      (FStar.UInt64.shift_right @x0 @x1)
      (Tm_refine_0556f625b89f1ac99fd21e82e26fe9e0 @x0 @x1)))
    :pattern ((FStar.UInt64.shift_right @x0 @x1))
    :qid typing_FStar.UInt64.shift_right))
  :named typing_FStar.UInt64.shift_right))
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
;;; Fact-ids: Name Prims.op_LessThan; Namespace Prims
(assert
 (! ;; def=Prims.fst(550,4-550,15); use=Prims.fst(550,4-550,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_LessThan @x0 @x1) Prims.bool))
    :pattern ((Prims.op_LessThan @x0 @x1))
    :qid typing_Prims.op_LessThan))
  :named typing_Prims.op_LessThan))
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
(declare-fun label_14 () Bool)
(declare-fun label_13 () Bool)
(declare-fun label_12 () Bool)
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

; Encoding query formula : forall (a: FStar.UInt128.t) (s: FStar.UInt32.t{FStar.UInt32.v s < 64}).
;   (forall (r: FStar.UInt128.t).
;       (* - Could not prove post-condition *)
;       (FStar.UInt.size (FStar.UInt32.v s) 32 ==> FStar.UInt32.v s >= 0) /\
;       (forall (return_val: Prims.nat).
;           return_val == FStar.UInt32.v s ==>
;           (forall (any_result: Prims.pos).
;               Prims.pow2 (FStar.UInt32.v s) == any_result ==>
;               Prims.pow2 (FStar.UInt32.v s) > 0 ==> Prims.pow2 (FStar.UInt32.v s) <> 0))) /\
;   (forall (p: Prims.pure_post FStar.UInt128.t).
;       (forall (pure_result: FStar.UInt128.t).
;           FStar.UInt128.v pure_result == FStar.UInt128.v a / Prims.pow2 (FStar.UInt32.v s) ==>
;           p pure_result) ==>
;       (forall (k: Prims.pure_post FStar.UInt128.t).
;           (forall (x: FStar.UInt128.t). {:pattern Prims.guard_free (k x)}
;               (x ==
;                 (match FStar.UInt32.eq s (0ul <: FStar.UInt32.t) with
;                   | true -> a
;                   | _ ->
;                     FStar.UInt128.Mkuint128
;                       (FStar.UInt128.add_u64_shift_right_respec a.high a.low s)
;                       (FStar.UInt64.shift_right a.high s)) ==>
;                 (forall (return_val: FStar.UInt128.t). return_val == x ==> p return_val)) ==>
;               k x) ==>
;           (FStar.UInt32.eq s (0ul <: FStar.UInt32.t) == true ==>
;             (forall (any_result: FStar.UInt128.t). k any_result)) /\
;           (~(FStar.UInt32.eq s (0ul <: FStar.UInt32.t) = true) ==>
;             (forall (b: Prims.bool).
;                 FStar.UInt32.eq s (0ul <: FStar.UInt32.t) == b ==>
;                 FStar.UInt32.v s <> 0 /\
;                 (forall (pure_result: FStar.UInt64.t).
;                     FStar.UInt64.v pure_result ==
;                     FStar.UInt64.v a.low / Prims.pow2 (FStar.UInt32.v s) +
;                     FStar.UInt64.v a.high * Prims.pow2 64 / Prims.pow2 (FStar.UInt32.v s) %
;                     Prims.pow2 64 ==>
;                     FStar.UInt128.add_u64_shift_right_respec a.high a.low s == pure_result ==>
;                     FStar.UInt32.v s < 64 /\
;                     (forall (pure_result: FStar.UInt64.t).
;                         FStar.UInt.shift_right (FStar.UInt64.v a.high) (FStar.UInt32.v s) =
;                         FStar.UInt64.v pure_result ==>
;                         FStar.UInt64.shift_right a.high s == pure_result ==>
;                         (forall (any_result: FStar.UInt128.uint128).
;                             FStar.UInt128.Mkuint128
;                               (FStar.UInt128.add_u64_shift_right_respec a.high a.low s)
;                               (FStar.UInt64.shift_right a.high s) ==
;                             any_result ==>
;                             (forall (b: FStar.UInt.uint_t 64).
;                                 FStar.UInt64.v a.high == b ==>
;                                 (forall (b: FStar.UInt.uint_t 64).
;                                     FStar.UInt64.v a.low == b ==>
;                                     (forall (b: FStar.UInt.uint_t 32).
;                                         FStar.UInt32.v s == b ==>
;                                         (FStar.UInt.size b 32 ==> b >= 0 /\ b < 64) /\
;                                         (forall (any_result: FStar.UInt.uint_t 32).
;                                             b == any_result ==>
;                                             (forall (pure_result: Prims.unit).
;                                                 b * Prims.pow2 (64 - b) ==
;                                                 b / Prims.pow2 b * Prims.pow2 64 +
;                                                 b * Prims.pow2 64 / Prims.pow2 b % Prims.pow2 64 ==>
;                                                 64 - b >= 0 /\
;                                                 (forall (return_val: Prims.nat).
;                                                     return_val == 64 - b ==>
;                                                     (forall (any_result: Prims.pos).
;                                                         Prims.pow2 (64 - b) == any_result ==>
;                                                         (forall (return_val: Prims.pos).
;                                                             return_val == Prims.pow2 (64 - b) ==>
;                                                             Prims.pow2 (64 - b) == return_val ==>
;                                                             (forall (any_result: Prims.int).
;                                                                 b * Prims.pow2 (64 - b) ==
;                                                                 any_result ==>
;                                                                 (FStar.UInt.size b 32 ==> b >= 0) /\
;                                                                 (forall (any_result:
;                                                                     FStar.UInt.uint_t 32).
;                                                                     b == any_result ==>
;                                                                     (forall (any_result: Prims.pos).
;                                                                         Prims.pow2 b == any_result ==>
;                                                                         (Prims.pow2 b > 0 ==>
;                                                                           Prims.pow2 b <> 0) /\
;                                                                         (forall (return_val:
;                                                                             Prims.nonzero).
;                                                                             return_val ==
;                                                                             Prims.pow2 b ==>
;                                                                             Prims.pow2 b ==
;                                                                             return_val ==>
;                                                                             (forall (any_result:
;                                                                                 Prims.int).
;                                                                                 b / Prims.pow2 b ==
;                                                                                 any_result ==>
;                                                                                 (forall (any_result:
;                                                                                     Prims.int).
;                                                                                     b *
;                                                                                     Prims.pow2 (64 -
;                                                                                         b) +
;                                                                                     b / Prims.pow2 b ==
;                                                                                     any_result ==>
;                                                                                     (forall (any_result:
;                                                                                         Prims.prop).
;                                                                                         FStar.UInt128.v
;                                                                                           any_result ==
;                                                                                         b *
;                                                                                         Prims.pow2 (64 -
;                                                                                             b) +
;                                                                                         b /
;                                                                                         Prims.pow2 b ==
;                                                                                         any_result ==>
;                                                                                         FStar.UInt128.v
;                                                                                           any_result ==
;                                                                                         b *
;                                                                                         Prims.pow2 (64 -
;                                                                                             b) +
;                                                                                         b /
;                                                                                         Prims.pow2 b /\
;                                                                                         (forall (pure_result:
;                                                                                             Prims.unit)
;                                                                                           .
;                                                                                             FStar.UInt128.v
;                                                                                               any_result
;                                                                                              ==
;                                                                                             b *
;                                                                                             Prims.pow2
;                                                                                               (64 -
;                                                                                                 b) +
;                                                                                             b /
;                                                                                             Prims.pow2
;                                                                                               b ==>
;                                                                                             (FStar.UInt.size
;                                                                                                 b
;                                                                                                 32 ==>
;                                                                                               b >= 0 /\
;                                                                                               b < 64
;                                                                                             ) /\
;                                                                                             (forall (any_result:
;                                                                                                 FStar.UInt.uint_t
;                                                                                                   32)
;                                                                                               .
;                                                                                                 b ==
;                                                                                                 any_result ==>
;                                                                                                 (forall
;                                                                                                     (pure_result:
;                                                                                                     Prims.unit)
;                                                                                                   .
;                                                                                                     FStar.UInt128.v
;                                                                                                       a
;                                                                                                      /
;                                                                                                     Prims.pow2
;                                                                                                       b
;                                                                                                      ==
;                                                                                                     FStar.UInt64.v
;                                                                                                       a
;                                                                                                         .low
;                                                                                                      /
;                                                                                                     Prims.pow2
;                                                                                                       b
;                                                                                                      +
;                                                                                                     FStar.UInt64.v
;                                                                                                       a
;                                                                                                         .high
;                                                                                                      *
;                                                                                                     Prims.pow2
;                                                                                                       (
;                                                                                                         64 -
;                                                                                                         b
;                                                                                                       )
;                                                                                                      ==>
;                                                                                                     (
;                                                                                                       forall
;                                                                                                         (any_result:
;                                                                                                         FStar.UInt128.t)
;                                                                                                       .
;                                                                                                         k
;                                                                                                           any_result
; 
;                                                                                                     )
;                                                                                                 ))))
;                                                                                 ))))))))))))))))))))
;   )
; Context: While encoding a query
; While typechecking the top-level declaration ‘let shift_right_small’
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
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
       (forall ((@x2 Term))
        (! (implies
          (HasType @x2 (FStar.UInt128.t Dummy_value))
          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
          (and
           (implies
            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(792,2-802,3)
            (Valid
             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(792,2-802,3)
             (FStar.UInt.size (FStar.UInt32.v @x1) (BoxInt 32)))
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(791,39-791,48)
            (or
             label_1
             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(792,2-802,3)
             (>= (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 0)))))
           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
           (forall ((@x3 Term))
            (! (implies
              (and
               (HasType @x3 Prims.nat)
               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
               (= @x3 (FStar.UInt32.v @x1)))
              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  (HasType @x4 Prims.pos)
                  ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(792,2-802,3)
                  (= (Prims.pow2 (FStar.UInt32.v @x1)) @x4)
                  ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(792,2-802,3)
                  (> (BoxInt_proj_0 (Prims.pow2 (FStar.UInt32.v @x1))) (BoxInt_proj_0 (BoxInt 0))))
                 ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(791,34-791,48)
                 (or
                  label_2
                  ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(792,2-802,3)
                  (not (= (Prims.pow2 (FStar.UInt32.v @x1)) (BoxInt 0)))))
                :qid @query.3)))
             :qid @query.2))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(792,2-802,3)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_3 (HasType @x3 (FStar.UInt128.t Dummy_value)))
               ;; def=FStar.UInt128.fst(791,21-791,48); use=FStar.UInt128.fst(792,2-802,3)
               (or
                label_4
                ;; def=FStar.UInt128.fst(791,21-791,48); use=FStar.UInt128.fst(792,2-802,3)
                (=
                 (FStar.UInt128.v @x3)
                 (Prims.op_Division (FStar.UInt128.v @x0) (Prims.pow2 (FStar.UInt32.v @x1))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
                (ApplyTT @x2 @x3)))
             :qid @query.5)))
          ;; def=Prims.fst(368,4-368,99); use=FStar.UInt128.fst(792,2-802,3)
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
              ;; def=Prims.fst(368,4-368,99); use=FStar.UInt128.fst(792,2-802,3)
              (forall ((@x4 Term))
               (! (implies
                 (implies
                  ;; def=FStar.UInt128.fst(789,61-802,3); use=FStar.UInt128.fst(792,2-802,3)
                  (=
                   @x4
                   (let ((@lb5 (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0)))))
                    (ite
                     (= @lb5 (BoxBool true))
                     @x0
                     (FStar.UInt128.Mkuint128
                      (FStar.UInt128.add_u64_shift_right_respec
                       (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                       (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                       @x1)
                      (FStar.UInt64.shift_right
                       (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                       @x1)))))
                  ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
                  (forall ((@x5 Term))
                   (! (implies
                     (and
                      (HasType @x5 (FStar.UInt128.t Dummy_value))
                      ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                      (= @x5 @x4))
                     ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                     (Valid
                      ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                      (ApplyTT @x2 @x5)))
                    :qid @query.8)))
                 ;; def=Prims.fst(368,86-368,89); use=FStar.UInt128.fst(792,2-802,3)
                 (Valid
                  ;; def=Prims.fst(368,86-368,89); use=FStar.UInt128.fst(792,2-802,3)
                  (ApplyTT @x3 @x4)))
                :weight 0
                :pattern ((ApplyTT @x3 @x4))
                :qid @query.7)))
             ;; def=Prims.fst(355,2-355,39); use=FStar.UInt128.fst(792,2-802,3)
             (and
              (implies
               ;; def=FStar.UInt128.fst(792,5-792,17); use=FStar.UInt128.fst(792,5-792,17)
               (= (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0))) (BoxBool true))
               ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
               (forall ((@x4 Term))
                (! (implies
                  (HasType @x4 (FStar.UInt128.t Dummy_value))
                  ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                  (Valid
                   ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                   (ApplyTT @x3 @x4)))
                 :qid @query.9)))
              (implies
               ;; def=Prims.fst(355,19-355,21); use=FStar.UInt128.fst(792,2-802,3)
               (not
                ;; def=FStar.UInt128.fst(792,5-792,17); use=FStar.UInt128.fst(792,5-792,17)
                (= (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0))) (BoxBool true)))
               ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
               (forall ((@x4 Term))
                (! (implies
                  (and
                   (HasType @x4 Prims.bool)
                   ;; def=FStar.UInt128.fst(792,5-802,3); use=FStar.UInt128.fst(792,5-802,3)
                   (= (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0))) @x4))
                  ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(794,18-794,44)
                  (and
                   ;; def=FStar.UInt128.fst(752,12-752,26); use=FStar.UInt128.fst(794,18-794,44)
                   (or
                    label_5
                    ;; def=FStar.UInt128.fst(752,12-752,26); use=FStar.UInt128.fst(794,18-794,44)
                    (not (= (FStar.UInt32.v @x1) (BoxInt 0))))
                   ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(794,18-794,44)
                   (forall ((@x5 Term))
                    (! (implies
                      (and
                       (HasType @x5 (FStar.UInt64.t Dummy_value))
                       ;; def=FStar.UInt128.fst(753,21-754,74); use=FStar.UInt128.fst(794,18-794,44)
                       (=
                        (FStar.UInt64.v @x5)
                        (Prims.op_Addition
                         (Prims.op_Division
                          (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0))
                          (Prims.pow2 (FStar.UInt32.v @x1)))
                         (Prims.op_Modulus
                          (Prims.op_Division
                           (Prims.op_Star
                            (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                            (Prims.pow2 (BoxInt 64)))
                           (Prims.pow2 (FStar.UInt32.v @x1)))
                          (Prims.pow2 (BoxInt 64)))))
                       ;; def=FStar.UInt128.fst(114,24-794,59); use=FStar.UInt128.fst(792,2-802,3)
                       (=
                        (FStar.UInt128.add_u64_shift_right_respec
                         (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                         (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                         @x1)
                        @x5))
                      ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(795,23-795,34)
                      (and
                       ;; def=FStar.UInt64.fsti(208,12-208,28); use=FStar.UInt128.fst(795,23-795,34)
                       (or
                        label_6
                        ;; def=FStar.UInt64.fsti(208,12-208,28); use=FStar.UInt128.fst(795,23-795,34)
                        (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 64))))
                       ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(795,23-795,34)
                       (forall ((@x6 Term))
                        (! (implies
                          (and
                           (HasType @x6 (FStar.UInt64.t Dummy_value))
                           ;; def=FStar.UInt64.fsti(209,21-209,68); use=FStar.UInt128.fst(795,23-795,34)
                           (=
                            (FStar.UInt.shift_right
                             (BoxInt 64)
                             (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                             (FStar.UInt32.v @x1))
                            (FStar.UInt64.v @x6))
                           ;; def=FStar.UInt128.fst(114,36-795,43); use=FStar.UInt128.fst(792,2-802,3)
                           (=
                            (FStar.UInt64.shift_right
                             (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                             @x1)
                            @x6))
                          ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                          (forall ((@x7 Term))
                           (! (implies
                             (and
                              (HasType @x7 FStar.UInt128.uint128)
                              ;; def=FStar.UInt128.fst(794,6-795,44); use=FStar.UInt128.fst(794,6-795,44)
                              (=
                               (FStar.UInt128.Mkuint128
                                (FStar.UInt128.add_u64_shift_right_respec
                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                 (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                                 @x1)
                                (FStar.UInt64.shift_right
                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                 @x1))
                               @x7))
                             ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
                             (forall ((@x8 Term))
                              (! (implies
                                (and
                                 (HasType @x8 (FStar.UInt.uint_t (BoxInt 64)))
                                 ;; def=FStar.UInt128.fst(796,6-796,24); use=FStar.UInt128.fst(796,6-796,24)
                                 (=
                                  (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                                  @x8))
                                ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
                                (forall ((@x9 Term))
                                 (! (implies
                                   (and
                                    (HasType @x9 (FStar.UInt.uint_t (BoxInt 64)))
                                    ;; def=FStar.UInt128.fst(797,6-797,23); use=FStar.UInt128.fst(797,6-797,23)
                                    (=
                                     (FStar.UInt64.v
                                      (FStar.UInt128.__proj__Mkuint128__item__low @x0))
                                     @x9))
                                   ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
                                   (forall ((@x10 Term))
                                    (! (implies
                                      (and
                                       (HasType @x10 (FStar.UInt.uint_t (BoxInt 32)))
                                       ;; def=FStar.UInt128.fst(798,6-798,17); use=FStar.UInt128.fst(798,6-798,17)
                                       (= (FStar.UInt32.v @x1) @x10))
                                      ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                      (and
                                       (implies
                                        ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(799,30-799,31)
                                        (Valid
                                         ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(799,30-799,31)
                                         (FStar.UInt.size @x10 (BoxInt 32)))
                                        ;; def=FStar.UInt128.fst(771,58-771,64); use=FStar.UInt128.fst(799,30-799,31)
                                        (and
                                         ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(799,30-799,31)
                                         (or
                                          label_7
                                          ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(799,30-799,31)
                                          (>= (BoxInt_proj_0 @x10) (BoxInt_proj_0 (BoxInt 0))))
                                         ;; def=FStar.UInt128.fst(771,58-771,64); use=FStar.UInt128.fst(799,30-799,31)
                                         (or
                                          label_8
                                          ;; def=FStar.UInt128.fst(771,58-771,64); use=FStar.UInt128.fst(799,30-799,31)
                                          (< (BoxInt_proj_0 @x10) (BoxInt_proj_0 (BoxInt 64))))))
                                       ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                       (forall ((@x11 Term))
                                        (! (implies
                                          (and
                                           (HasType @x11 (FStar.UInt.uint_t (BoxInt 32)))
                                           ;; def=FStar.UInt128.fst(771,52-798,7); use=FStar.UInt128.fst(792,2-802,3)
                                           (= @x10 @x11))
                                          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(799,2-799,25)
                                          (forall ((@x12 Term))
                                           (! (implies
                                             (and
                                              (HasType @x12 Prims.unit)
                                              ;; def=FStar.UInt128.fst(772,8-772,88); use=FStar.UInt128.fst(799,2-799,25)
                                              (=
                                               (Prims.op_Star
                                                @x8
                                                (Prims.pow2 (Prims.op_Subtraction (BoxInt 64) @x10)))
                                               (Prims.op_Addition
                                                (Prims.op_Star
                                                 (Prims.op_Division @x8 (Prims.pow2 @x10))
                                                 (Prims.pow2 (BoxInt 64)))
                                                (Prims.op_Modulus
                                                 (Prims.op_Division
                                                  (Prims.op_Star @x8 (Prims.pow2 (BoxInt 64)))
                                                  (Prims.pow2 @x10))
                                                 (Prims.pow2 (BoxInt 64))))))
                                             ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                             (and
                                              ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,28-800,34)
                                              (or
                                               label_9
                                               ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,28-800,34)
                                               (>=
                                                (BoxInt_proj_0
                                                 (Prims.op_Subtraction (BoxInt 64) @x10))
                                                (BoxInt_proj_0 (BoxInt 0))))
                                              ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
                                              (forall ((@x13 Term))
                                               (! (implies
                                                 (and
                                                  (HasType @x13 Prims.nat)
                                                  ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
                                                  (= @x13 (Prims.op_Subtraction (BoxInt 64) @x10)))
                                                 ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                 (forall ((@x14 Term))
                                                  (! (implies
                                                    (and
                                                     (HasType @x14 Prims.pos)
                                                     ;; def=Prims.fst(670,28-670,31); use=FStar.UInt128.fst(800,23-800,34)
                                                     (=
                                                      (Prims.pow2
                                                       (Prims.op_Subtraction (BoxInt 64) @x10))
                                                      @x14))
                                                    ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
                                                    (forall ((@x15 Term))
                                                     (! (implies
                                                       (and
                                                        (HasType @x15 Prims.pos)
                                                        ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
                                                        (=
                                                         @x15
                                                         (Prims.pow2
                                                          (Prims.op_Subtraction (BoxInt 64) @x10)))
                                                        ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                        (=
                                                         (Prims.pow2
                                                          (Prims.op_Subtraction (BoxInt 64) @x10))
                                                         @x15))
                                                       ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                       (forall ((@x16 Term))
                                                        (! (implies
                                                          (and
                                                           (HasType @x16 Prims.int)
                                                           ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                           (=
                                                            (Prims.op_Star
                                                             @x8
                                                             (Prims.pow2
                                                              (Prims.op_Subtraction (BoxInt 64) @x10)))
                                                            @x16))
                                                          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                                          (and
                                                           (implies
                                                            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(800,48-800,49)
                                                            (Valid
                                                             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(800,48-800,49)
                                                             (FStar.UInt.size @x10 (BoxInt 32)))
                                                            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,48-800,49)
                                                            (or
                                                             label_10
                                                             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,48-800,49)
                                                             (>=
                                                              (BoxInt_proj_0 @x10)
                                                              (BoxInt_proj_0 (BoxInt 0)))))
                                                           ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                           (forall ((@x17 Term))
                                                            (! (implies
                                                              (and
                                                               (HasType
                                                                @x17
                                                                (FStar.UInt.uint_t (BoxInt 32)))
                                                               ;; def=Prims.fst(670,14-670,15); use=FStar.UInt128.fst(792,2-802,3)
                                                               (= @x10 @x17))
                                                              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                              (forall ((@x18 Term))
                                                               (! (implies
                                                                 (and
                                                                  (HasType @x18 Prims.pos)
                                                                  ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(800,41-800,49)
                                                                  (= (Prims.pow2 @x10) @x18))
                                                                 ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                                                 (and
                                                                  (implies
                                                                   ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(800,43-800,49)
                                                                   (>
                                                                    (BoxInt_proj_0 (Prims.pow2 @x10))
                                                                    (BoxInt_proj_0 (BoxInt 0)))
                                                                   ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(800,43-800,49)
                                                                   (or
                                                                    label_11
                                                                    ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(800,43-800,49)
                                                                    (not
                                                                     (= (Prims.pow2 @x10) (BoxInt 0)))))
                                                                  ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
                                                                  (forall ((@x19 Term))
                                                                   (! (implies
                                                                     (and
                                                                      (HasType @x19 Prims.nonzero)
                                                                      ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
                                                                      (= @x19 (Prims.pow2 @x10))
                                                                      ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                                      (= (Prims.pow2 @x10) @x19))
                                                                     ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                     (forall ((@x20 Term))
                                                                      (! (implies
                                                                        (and
                                                                         (HasType @x20 Prims.int)
                                                                         ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                                         (=
                                                                          (Prims.op_Division
                                                                           @x9
                                                                           (Prims.pow2 @x10))
                                                                          @x20))
                                                                        ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                        (forall ((@x21 Term))
                                                                         (! (implies
                                                                           (and
                                                                            (HasType @x21 Prims.int)
                                                                            ;; def=Prims.fst(160,48-160,49); use=FStar.UInt128.fst(792,2-802,3)
                                                                            (=
                                                                             (Prims.op_Addition
                                                                              (Prims.op_Star
                                                                               @x8
                                                                               (Prims.pow2
                                                                                (Prims.op_Subtraction
                                                                                 (BoxInt 64)
                                                                                 @x10)))
                                                                              (Prims.op_Division
                                                                               @x9
                                                                               (Prims.pow2 @x10)))
                                                                             @x21))
                                                                           ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                           (forall ((@x22 Term))
                                                                            (! (implies
                                                                              (and
                                                                               (HasType
                                                                                @x22
                                                                                Prims.prop)
                                                                               ;; def=Prims.fst(620,13-620,14); use=FStar.UInt128.fst(792,2-802,3)
                                                                               (=
                                                                                (Prims.eq2
                                                                                 U_zero
                                                                                 Prims.int
                                                                                 (FStar.UInt128.v
                                                                                  @x7)
                                                                                 (Prims.op_Addition
                                                                                  (Prims.op_Star
                                                                                   @x8
                                                                                   (Prims.pow2
                                                                                    (Prims.op_Subtraction
                                                                                     (BoxInt 64)
                                                                                     @x10)))
                                                                                  (Prims.op_Division
                                                                                   @x9
                                                                                   (Prims.pow2 @x10))))
                                                                                @x22))
                                                                              ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(800,2-800,8)
                                                                              (and
                                                                               ;; def=FStar.UInt128.fst(800,9-800,50); use=FStar.UInt128.fst(800,2-800,8)
                                                                               (or
                                                                                label_12
                                                                                ;; def=FStar.UInt128.fst(800,9-800,50); use=FStar.UInt128.fst(800,2-800,8)
                                                                                (=
                                                                                 (FStar.UInt128.v
                                                                                  @x7)
                                                                                 (Prims.op_Addition
                                                                                  (Prims.op_Star
                                                                                   @x8
                                                                                   (Prims.pow2
                                                                                    (Prims.op_Subtraction
                                                                                     (BoxInt 64)
                                                                                     @x10)))
                                                                                  (Prims.op_Division
                                                                                   @x9
                                                                                   (Prims.pow2 @x10)))))
                                                                               ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(800,2-800,8)
                                                                               (forall ((@x23 Term))
                                                                                (! (implies
                                                                                  (and
                                                                                   (HasType
                                                                                    @x23
                                                                                    Prims.unit)
                                                                                   ;; def=FStar.UInt128.fst(800,9-800,50); use=FStar.UInt128.fst(800,2-800,8)
                                                                                   (=
                                                                                    (FStar.UInt128.v
                                                                                     @x7)
                                                                                    (Prims.op_Addition
                                                                                     (Prims.op_Star
                                                                                      @x8
                                                                                      (Prims.pow2
                                                                                       (Prims.op_Subtraction
                                                                                        (BoxInt 64)
                                                                                        @x10)))
                                                                                     (Prims.op_Division
                                                                                      @x9
                                                                                      (Prims.pow2
                                                                                       @x10)))))
                                                                                  ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                                                                  (and
                                                                                   (implies
                                                                                    ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(801,18-801,19)
                                                                                    (Valid
                                                                                     ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(801,18-801,19)
                                                                                     (FStar.UInt.size
                                                                                      @x10
                                                                                      (BoxInt 32)))
                                                                                    ;; def=FStar.UInt128.fst(781,32-781,38); use=FStar.UInt128.fst(801,18-801,19)
                                                                                    (and
                                                                                     ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(801,18-801,19)
                                                                                     (or
                                                                                      label_13
                                                                                      ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(801,18-801,19)
                                                                                      (>=
                                                                                       (BoxInt_proj_0
                                                                                        @x10)
                                                                                       (BoxInt_proj_0
                                                                                        (BoxInt 0))))
                                                                                     ;; def=FStar.UInt128.fst(781,32-781,38); use=FStar.UInt128.fst(801,18-801,19)
                                                                                     (or
                                                                                      label_14
                                                                                      ;; def=FStar.UInt128.fst(781,32-781,38); use=FStar.UInt128.fst(801,18-801,19)
                                                                                      (<
                                                                                       (BoxInt_proj_0
                                                                                        @x10)
                                                                                       (BoxInt_proj_0
                                                                                        (BoxInt 64))))))
                                                                                   ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                   (forall
                                                                                     ((@x24 Term))
                                                                                    (! (implies
                                                                                      (and
                                                                                       (HasType
                                                                                        @x24
                                                                                        (FStar.UInt.uint_t
                                                                                         (BoxInt 32)))
                                                                                       ;; def=FStar.UInt128.fst(781,26-798,7); use=FStar.UInt128.fst(792,2-802,3)
                                                                                       (= @x10 @x24))
                                                                                      ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(801,2-801,15)
                                                                                      (forall
                                                                                        ((@x25 Term))
                                                                                       (! (implies
                                                                                         (and
                                                                                          (HasType
                                                                                           @x25
                                                                                           Prims.unit)
                                                                                          ;; def=FStar.UInt128.fst(782,8-782,77); use=FStar.UInt128.fst(801,2-801,15)
                                                                                          (=
                                                                                           (Prims.op_Division
                                                                                            (FStar.UInt128.v
                                                                                             @x0)
                                                                                            (Prims.pow2
                                                                                             @x10))
                                                                                           (Prims.op_Addition
                                                                                            (Prims.op_Division
                                                                                             (FStar.UInt64.v
                                                                                              (FStar.UInt128.__proj__Mkuint128__item__low
                                                                                               @x0))
                                                                                             (Prims.pow2
                                                                                              @x10))
                                                                                            (Prims.op_Star
                                                                                             (FStar.UInt64.v
                                                                                              (FStar.UInt128.__proj__Mkuint128__item__high
                                                                                               @x0))
                                                                                             (Prims.pow2
                                                                                              (Prims.op_Subtraction
                                                                                               (BoxInt
                                                                                                64)
                                                                                               @x10))))))
                                                                                         ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                         (forall
                                                                                           ((@x26
                                                                                             Term))
                                                                                          (! (implies
                                                                                            (HasType
                                                                                             @x26
                                                                                             (FStar.UInt128.t
                                                                                              Dummy_value))
                                                                                            ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                            (Valid
                                                                                             ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                             (ApplyTT
                                                                                              @x3
                                                                                              @x26)))
                                                                                           :qid
                                                                                            @query.32)))
                                                                                        :qid
                                                                                         @query.31)))
                                                                                     :qid @query.30))))
                                                                                 :qid @query.29))))
                                                                             :qid @query.28)))
                                                                          :qid @query.27)))
                                                                       :qid @query.26)))
                                                                    :qid @query.25))))
                                                                :qid @query.24)))
                                                             :qid @query.23))))
                                                         :qid @query.22)))
                                                      :qid @query.21)))
                                                   :qid @query.20)))
                                                :qid @query.19))))
                                            :qid @query.18)))
                                         :qid @query.17))))
                                     :qid @query.16)))
                                  :qid @query.15)))
                               :qid @query.14)))
                            :qid @query.13)))
                         :qid @query.12))))
                     :qid @query.11))))
                 :qid @query.10)))))
            :qid @query.6)))
         :qid @query.4))))
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
(echo "label_14")
(echo "label_13")
(echo "label_12")
(echo "label_11")
(echo "label_10")
(echo "label_9")
(echo "label_8")
(echo "label_7")
(echo "label_6")
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.shift_right_small, 1)
; STATUS: unknown because canceled
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

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
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
       (forall ((@x2 Term))
        (! (implies
          (HasType @x2 (FStar.UInt128.t Dummy_value))
          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
          (and
           (implies
            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(792,2-802,3)
            (Valid
             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(792,2-802,3)
             (FStar.UInt.size (FStar.UInt32.v @x1) (BoxInt 32)))
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(791,39-791,48)
            (or
             label_1
             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(792,2-802,3)
             (>= (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 0)))))
           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
           (forall ((@x3 Term))
            (! (implies
              (and
               (HasType @x3 Prims.nat)
               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
               (= @x3 (FStar.UInt32.v @x1)))
              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  (HasType @x4 Prims.pos)
                  ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(792,2-802,3)
                  (= (Prims.pow2 (FStar.UInt32.v @x1)) @x4)
                  ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(792,2-802,3)
                  (> (BoxInt_proj_0 (Prims.pow2 (FStar.UInt32.v @x1))) (BoxInt_proj_0 (BoxInt 0))))
                 ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(791,34-791,48)
                 (or
                  label_2
                  ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(792,2-802,3)
                  (not (= (Prims.pow2 (FStar.UInt32.v @x1)) (BoxInt 0)))))
                :qid @query.3)))
             :qid @query.2))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(792,2-802,3)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_3 (HasType @x3 (FStar.UInt128.t Dummy_value)))
               ;; def=FStar.UInt128.fst(791,21-791,48); use=FStar.UInt128.fst(792,2-802,3)
               (or
                label_4
                ;; def=FStar.UInt128.fst(791,21-791,48); use=FStar.UInt128.fst(792,2-802,3)
                (=
                 (FStar.UInt128.v @x3)
                 (Prims.op_Division (FStar.UInt128.v @x0) (Prims.pow2 (FStar.UInt32.v @x1))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
                (ApplyTT @x2 @x3)))
             :qid @query.5)))
          ;; def=Prims.fst(368,4-368,99); use=FStar.UInt128.fst(792,2-802,3)
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
              ;; def=Prims.fst(368,4-368,99); use=FStar.UInt128.fst(792,2-802,3)
              (forall ((@x4 Term))
               (! (implies
                 (implies
                  ;; def=FStar.UInt128.fst(789,61-802,3); use=FStar.UInt128.fst(792,2-802,3)
                  (=
                   @x4
                   (let ((@lb5 (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0)))))
                    (ite
                     (= @lb5 (BoxBool true))
                     @x0
                     (FStar.UInt128.Mkuint128
                      (FStar.UInt128.add_u64_shift_right_respec
                       (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                       (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                       @x1)
                      (FStar.UInt64.shift_right
                       (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                       @x1)))))
                  ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
                  (forall ((@x5 Term))
                   (! (implies
                     (and
                      (HasType @x5 (FStar.UInt128.t Dummy_value))
                      ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                      (= @x5 @x4))
                     ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                     (Valid
                      ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                      (ApplyTT @x2 @x5)))
                    :qid @query.8)))
                 ;; def=Prims.fst(368,86-368,89); use=FStar.UInt128.fst(792,2-802,3)
                 (Valid
                  ;; def=Prims.fst(368,86-368,89); use=FStar.UInt128.fst(792,2-802,3)
                  (ApplyTT @x3 @x4)))
                :weight 0
                :pattern ((ApplyTT @x3 @x4))
                :qid @query.7)))
             ;; def=Prims.fst(355,2-355,39); use=FStar.UInt128.fst(792,2-802,3)
             (and
              (implies
               ;; def=FStar.UInt128.fst(792,5-792,17); use=FStar.UInt128.fst(792,5-792,17)
               (= (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0))) (BoxBool true))
               ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
               (forall ((@x4 Term))
                (! (implies
                  (HasType @x4 (FStar.UInt128.t Dummy_value))
                  ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                  (Valid
                   ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                   (ApplyTT @x3 @x4)))
                 :qid @query.9)))
              (implies
               ;; def=Prims.fst(355,19-355,21); use=FStar.UInt128.fst(792,2-802,3)
               (not
                ;; def=FStar.UInt128.fst(792,5-792,17); use=FStar.UInt128.fst(792,5-792,17)
                (= (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0))) (BoxBool true)))
               ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
               (forall ((@x4 Term))
                (! (implies
                  (and
                   (HasType @x4 Prims.bool)
                   ;; def=FStar.UInt128.fst(792,5-802,3); use=FStar.UInt128.fst(792,5-802,3)
                   (= (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0))) @x4))
                  ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(794,18-794,44)
                  (and
                   ;; def=FStar.UInt128.fst(752,12-752,26); use=FStar.UInt128.fst(794,18-794,44)
                   (or
                    label_5
                    ;; def=FStar.UInt128.fst(752,12-752,26); use=FStar.UInt128.fst(794,18-794,44)
                    (not (= (FStar.UInt32.v @x1) (BoxInt 0))))
                   ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(794,18-794,44)
                   (forall ((@x5 Term))
                    (! (implies
                      (and
                       (HasType @x5 (FStar.UInt64.t Dummy_value))
                       ;; def=FStar.UInt128.fst(753,21-754,74); use=FStar.UInt128.fst(794,18-794,44)
                       (=
                        (FStar.UInt64.v @x5)
                        (Prims.op_Addition
                         (Prims.op_Division
                          (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0))
                          (Prims.pow2 (FStar.UInt32.v @x1)))
                         (Prims.op_Modulus
                          (Prims.op_Division
                           (Prims.op_Star
                            (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                            (Prims.pow2 (BoxInt 64)))
                           (Prims.pow2 (FStar.UInt32.v @x1)))
                          (Prims.pow2 (BoxInt 64)))))
                       ;; def=FStar.UInt128.fst(114,24-794,59); use=FStar.UInt128.fst(792,2-802,3)
                       (=
                        (FStar.UInt128.add_u64_shift_right_respec
                         (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                         (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                         @x1)
                        @x5))
                      ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(795,23-795,34)
                      (and
                       ;; def=FStar.UInt64.fsti(208,12-208,28); use=FStar.UInt128.fst(795,23-795,34)
                       (or
                        label_6
                        ;; def=FStar.UInt64.fsti(208,12-208,28); use=FStar.UInt128.fst(795,23-795,34)
                        (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 64))))
                       ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(795,23-795,34)
                       (forall ((@x6 Term))
                        (! (implies
                          (and
                           (HasType @x6 (FStar.UInt64.t Dummy_value))
                           ;; def=FStar.UInt64.fsti(209,21-209,68); use=FStar.UInt128.fst(795,23-795,34)
                           (=
                            (FStar.UInt.shift_right
                             (BoxInt 64)
                             (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                             (FStar.UInt32.v @x1))
                            (FStar.UInt64.v @x6))
                           ;; def=FStar.UInt128.fst(114,36-795,43); use=FStar.UInt128.fst(792,2-802,3)
                           (=
                            (FStar.UInt64.shift_right
                             (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                             @x1)
                            @x6))
                          ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                          (forall ((@x7 Term))
                           (! (implies
                             (and
                              (HasType @x7 FStar.UInt128.uint128)
                              ;; def=FStar.UInt128.fst(794,6-795,44); use=FStar.UInt128.fst(794,6-795,44)
                              (=
                               (FStar.UInt128.Mkuint128
                                (FStar.UInt128.add_u64_shift_right_respec
                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                 (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                                 @x1)
                                (FStar.UInt64.shift_right
                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                 @x1))
                               @x7))
                             ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
                             (forall ((@x8 Term))
                              (! (implies
                                (and
                                 (HasType @x8 (FStar.UInt.uint_t (BoxInt 64)))
                                 ;; def=FStar.UInt128.fst(796,6-796,24); use=FStar.UInt128.fst(796,6-796,24)
                                 (=
                                  (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                                  @x8))
                                ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
                                (forall ((@x9 Term))
                                 (! (implies
                                   (and
                                    (HasType @x9 (FStar.UInt.uint_t (BoxInt 64)))
                                    ;; def=FStar.UInt128.fst(797,6-797,23); use=FStar.UInt128.fst(797,6-797,23)
                                    (=
                                     (FStar.UInt64.v
                                      (FStar.UInt128.__proj__Mkuint128__item__low @x0))
                                     @x9))
                                   ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
                                   (forall ((@x10 Term))
                                    (! (implies
                                      (and
                                       (HasType @x10 (FStar.UInt.uint_t (BoxInt 32)))
                                       ;; def=FStar.UInt128.fst(798,6-798,17); use=FStar.UInt128.fst(798,6-798,17)
                                       (= (FStar.UInt32.v @x1) @x10))
                                      ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                      (and
                                       (implies
                                        ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(799,30-799,31)
                                        (Valid
                                         ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(799,30-799,31)
                                         (FStar.UInt.size @x10 (BoxInt 32)))
                                        ;; def=FStar.UInt128.fst(771,58-771,64); use=FStar.UInt128.fst(799,30-799,31)
                                        (and
                                         ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(799,30-799,31)
                                         (or
                                          label_7
                                          ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(799,30-799,31)
                                          (>= (BoxInt_proj_0 @x10) (BoxInt_proj_0 (BoxInt 0))))
                                         ;; def=FStar.UInt128.fst(771,58-771,64); use=FStar.UInt128.fst(799,30-799,31)
                                         (or
                                          label_8
                                          ;; def=FStar.UInt128.fst(771,58-771,64); use=FStar.UInt128.fst(799,30-799,31)
                                          (< (BoxInt_proj_0 @x10) (BoxInt_proj_0 (BoxInt 64))))))
                                       ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                       (forall ((@x11 Term))
                                        (! (implies
                                          (and
                                           (HasType @x11 (FStar.UInt.uint_t (BoxInt 32)))
                                           ;; def=FStar.UInt128.fst(771,52-798,7); use=FStar.UInt128.fst(792,2-802,3)
                                           (= @x10 @x11))
                                          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(799,2-799,25)
                                          (forall ((@x12 Term))
                                           (! (implies
                                             (and
                                              (HasType @x12 Prims.unit)
                                              ;; def=FStar.UInt128.fst(772,8-772,88); use=FStar.UInt128.fst(799,2-799,25)
                                              (=
                                               (Prims.op_Star
                                                @x8
                                                (Prims.pow2 (Prims.op_Subtraction (BoxInt 64) @x10)))
                                               (Prims.op_Addition
                                                (Prims.op_Star
                                                 (Prims.op_Division @x8 (Prims.pow2 @x10))
                                                 (Prims.pow2 (BoxInt 64)))
                                                (Prims.op_Modulus
                                                 (Prims.op_Division
                                                  (Prims.op_Star @x8 (Prims.pow2 (BoxInt 64)))
                                                  (Prims.pow2 @x10))
                                                 (Prims.pow2 (BoxInt 64))))))
                                             ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                             (and
                                              ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,28-800,34)
                                              (or
                                               label_9
                                               ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,28-800,34)
                                               (>=
                                                (BoxInt_proj_0
                                                 (Prims.op_Subtraction (BoxInt 64) @x10))
                                                (BoxInt_proj_0 (BoxInt 0))))
                                              ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
                                              (forall ((@x13 Term))
                                               (! (implies
                                                 (and
                                                  (HasType @x13 Prims.nat)
                                                  ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
                                                  (= @x13 (Prims.op_Subtraction (BoxInt 64) @x10)))
                                                 ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                 (forall ((@x14 Term))
                                                  (! (implies
                                                    (and
                                                     (HasType @x14 Prims.pos)
                                                     ;; def=Prims.fst(670,28-670,31); use=FStar.UInt128.fst(800,23-800,34)
                                                     (=
                                                      (Prims.pow2
                                                       (Prims.op_Subtraction (BoxInt 64) @x10))
                                                      @x14))
                                                    ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
                                                    (forall ((@x15 Term))
                                                     (! (implies
                                                       (and
                                                        (HasType @x15 Prims.pos)
                                                        ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
                                                        (=
                                                         @x15
                                                         (Prims.pow2
                                                          (Prims.op_Subtraction (BoxInt 64) @x10)))
                                                        ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                        (=
                                                         (Prims.pow2
                                                          (Prims.op_Subtraction (BoxInt 64) @x10))
                                                         @x15))
                                                       ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                       (forall ((@x16 Term))
                                                        (! (implies
                                                          (and
                                                           (HasType @x16 Prims.int)
                                                           ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                           (=
                                                            (Prims.op_Star
                                                             @x8
                                                             (Prims.pow2
                                                              (Prims.op_Subtraction (BoxInt 64) @x10)))
                                                            @x16))
                                                          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                                          (and
                                                           (implies
                                                            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(800,48-800,49)
                                                            (Valid
                                                             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(800,48-800,49)
                                                             (FStar.UInt.size @x10 (BoxInt 32)))
                                                            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,48-800,49)
                                                            (or
                                                             label_10
                                                             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,48-800,49)
                                                             (>=
                                                              (BoxInt_proj_0 @x10)
                                                              (BoxInt_proj_0 (BoxInt 0)))))
                                                           ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                           (forall ((@x17 Term))
                                                            (! (implies
                                                              (and
                                                               (HasType
                                                                @x17
                                                                (FStar.UInt.uint_t (BoxInt 32)))
                                                               ;; def=Prims.fst(670,14-670,15); use=FStar.UInt128.fst(792,2-802,3)
                                                               (= @x10 @x17))
                                                              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                              (forall ((@x18 Term))
                                                               (! (implies
                                                                 (and
                                                                  (HasType @x18 Prims.pos)
                                                                  ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(800,41-800,49)
                                                                  (= (Prims.pow2 @x10) @x18))
                                                                 ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                                                 (and
                                                                  (implies
                                                                   ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(800,43-800,49)
                                                                   (>
                                                                    (BoxInt_proj_0 (Prims.pow2 @x10))
                                                                    (BoxInt_proj_0 (BoxInt 0)))
                                                                   ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(800,43-800,49)
                                                                   (or
                                                                    label_11
                                                                    ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(800,43-800,49)
                                                                    (not
                                                                     (= (Prims.pow2 @x10) (BoxInt 0)))))
                                                                  ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
                                                                  (forall ((@x19 Term))
                                                                   (! (implies
                                                                     (and
                                                                      (HasType @x19 Prims.nonzero)
                                                                      ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
                                                                      (= @x19 (Prims.pow2 @x10))
                                                                      ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                                      (= (Prims.pow2 @x10) @x19))
                                                                     ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                     (forall ((@x20 Term))
                                                                      (! (implies
                                                                        (and
                                                                         (HasType @x20 Prims.int)
                                                                         ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                                         (=
                                                                          (Prims.op_Division
                                                                           @x9
                                                                           (Prims.pow2 @x10))
                                                                          @x20))
                                                                        ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                        (forall ((@x21 Term))
                                                                         (! (implies
                                                                           (and
                                                                            (HasType @x21 Prims.int)
                                                                            ;; def=Prims.fst(160,48-160,49); use=FStar.UInt128.fst(792,2-802,3)
                                                                            (=
                                                                             (Prims.op_Addition
                                                                              (Prims.op_Star
                                                                               @x8
                                                                               (Prims.pow2
                                                                                (Prims.op_Subtraction
                                                                                 (BoxInt 64)
                                                                                 @x10)))
                                                                              (Prims.op_Division
                                                                               @x9
                                                                               (Prims.pow2 @x10)))
                                                                             @x21))
                                                                           ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                           (forall ((@x22 Term))
                                                                            (! (implies
                                                                              (and
                                                                               (HasType
                                                                                @x22
                                                                                Prims.prop)
                                                                               ;; def=Prims.fst(620,13-620,14); use=FStar.UInt128.fst(792,2-802,3)
                                                                               (=
                                                                                (Prims.eq2
                                                                                 U_zero
                                                                                 Prims.int
                                                                                 (FStar.UInt128.v
                                                                                  @x7)
                                                                                 (Prims.op_Addition
                                                                                  (Prims.op_Star
                                                                                   @x8
                                                                                   (Prims.pow2
                                                                                    (Prims.op_Subtraction
                                                                                     (BoxInt 64)
                                                                                     @x10)))
                                                                                  (Prims.op_Division
                                                                                   @x9
                                                                                   (Prims.pow2 @x10))))
                                                                                @x22))
                                                                              ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(800,2-800,8)
                                                                              (and
                                                                               ;; def=FStar.UInt128.fst(800,9-800,50); use=FStar.UInt128.fst(800,2-800,8)
                                                                               (or
                                                                                label_12
                                                                                ;; def=FStar.UInt128.fst(800,9-800,50); use=FStar.UInt128.fst(800,2-800,8)
                                                                                (=
                                                                                 (FStar.UInt128.v
                                                                                  @x7)
                                                                                 (Prims.op_Addition
                                                                                  (Prims.op_Star
                                                                                   @x8
                                                                                   (Prims.pow2
                                                                                    (Prims.op_Subtraction
                                                                                     (BoxInt 64)
                                                                                     @x10)))
                                                                                  (Prims.op_Division
                                                                                   @x9
                                                                                   (Prims.pow2 @x10)))))
                                                                               ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(800,2-800,8)
                                                                               (forall ((@x23 Term))
                                                                                (! (implies
                                                                                  (and
                                                                                   (HasType
                                                                                    @x23
                                                                                    Prims.unit)
                                                                                   ;; def=FStar.UInt128.fst(800,9-800,50); use=FStar.UInt128.fst(800,2-800,8)
                                                                                   (=
                                                                                    (FStar.UInt128.v
                                                                                     @x7)
                                                                                    (Prims.op_Addition
                                                                                     (Prims.op_Star
                                                                                      @x8
                                                                                      (Prims.pow2
                                                                                       (Prims.op_Subtraction
                                                                                        (BoxInt 64)
                                                                                        @x10)))
                                                                                     (Prims.op_Division
                                                                                      @x9
                                                                                      (Prims.pow2
                                                                                       @x10)))))
                                                                                  ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                                                                  (and
                                                                                   (implies
                                                                                    ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(801,18-801,19)
                                                                                    (Valid
                                                                                     ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(801,18-801,19)
                                                                                     (FStar.UInt.size
                                                                                      @x10
                                                                                      (BoxInt 32)))
                                                                                    ;; def=FStar.UInt128.fst(781,32-781,38); use=FStar.UInt128.fst(801,18-801,19)
                                                                                    (and
                                                                                     ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(801,18-801,19)
                                                                                     (or
                                                                                      label_13
                                                                                      ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(801,18-801,19)
                                                                                      (>=
                                                                                       (BoxInt_proj_0
                                                                                        @x10)
                                                                                       (BoxInt_proj_0
                                                                                        (BoxInt 0))))
                                                                                     ;; def=FStar.UInt128.fst(781,32-781,38); use=FStar.UInt128.fst(801,18-801,19)
                                                                                     (or
                                                                                      label_14
                                                                                      ;; def=FStar.UInt128.fst(781,32-781,38); use=FStar.UInt128.fst(801,18-801,19)
                                                                                      (<
                                                                                       (BoxInt_proj_0
                                                                                        @x10)
                                                                                       (BoxInt_proj_0
                                                                                        (BoxInt 64))))))
                                                                                   ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                   (forall
                                                                                     ((@x24 Term))
                                                                                    (! (implies
                                                                                      (and
                                                                                       (HasType
                                                                                        @x24
                                                                                        (FStar.UInt.uint_t
                                                                                         (BoxInt 32)))
                                                                                       ;; def=FStar.UInt128.fst(781,26-798,7); use=FStar.UInt128.fst(792,2-802,3)
                                                                                       (= @x10 @x24))
                                                                                      ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(801,2-801,15)
                                                                                      (forall
                                                                                        ((@x25 Term))
                                                                                       (! (implies
                                                                                         (and
                                                                                          (HasType
                                                                                           @x25
                                                                                           Prims.unit)
                                                                                          ;; def=FStar.UInt128.fst(782,8-782,77); use=FStar.UInt128.fst(801,2-801,15)
                                                                                          (=
                                                                                           (Prims.op_Division
                                                                                            (FStar.UInt128.v
                                                                                             @x0)
                                                                                            (Prims.pow2
                                                                                             @x10))
                                                                                           (Prims.op_Addition
                                                                                            (Prims.op_Division
                                                                                             (FStar.UInt64.v
                                                                                              (FStar.UInt128.__proj__Mkuint128__item__low
                                                                                               @x0))
                                                                                             (Prims.pow2
                                                                                              @x10))
                                                                                            (Prims.op_Star
                                                                                             (FStar.UInt64.v
                                                                                              (FStar.UInt128.__proj__Mkuint128__item__high
                                                                                               @x0))
                                                                                             (Prims.pow2
                                                                                              (Prims.op_Subtraction
                                                                                               (BoxInt
                                                                                                64)
                                                                                               @x10))))))
                                                                                         ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                         (forall
                                                                                           ((@x26
                                                                                             Term))
                                                                                          (! (implies
                                                                                            (HasType
                                                                                             @x26
                                                                                             (FStar.UInt128.t
                                                                                              Dummy_value))
                                                                                            ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                            (Valid
                                                                                             ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                             (ApplyTT
                                                                                              @x3
                                                                                              @x26)))
                                                                                           :qid
                                                                                            @query.32)))
                                                                                        :qid
                                                                                         @query.31)))
                                                                                     :qid @query.30))))
                                                                                 :qid @query.29))))
                                                                             :qid @query.28)))
                                                                          :qid @query.27)))
                                                                       :qid @query.26)))
                                                                    :qid @query.25))))
                                                                :qid @query.24)))
                                                             :qid @query.23))))
                                                         :qid @query.22)))
                                                      :qid @query.21)))
                                                   :qid @query.20)))
                                                :qid @query.19))))
                                            :qid @query.18)))
                                         :qid @query.17))))
                                     :qid @query.16)))
                                  :qid @query.15)))
                               :qid @query.14)))
                            :qid @query.13)))
                         :qid @query.12))))
                     :qid @query.11))))
                 :qid @query.10)))))
            :qid @query.6)))
         :qid @query.4))))
     :qid @query)))
  :named @query))
(set-option :rlimit 5000000)
(echo "<initial_stats>")
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "</initial_stats>")
(echo "<result>")
(check-sat)
(echo "</result>")
(set-option :rlimit 0)
(echo "<reason-unknown>") (get-info :reason-unknown) (echo "</reason-unknown>")
(echo "<labels>")
(echo "label_14")
(echo "label_13")
(echo "label_12")
(echo "label_11")
(echo "label_10")
(echo "label_9")
(echo "label_8")
(echo "label_7")
(echo "label_6")
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.shift_right_small, 1)
; STATUS: unknown because canceled
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

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
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
       (forall ((@x2 Term))
        (! (implies
          (HasType @x2 (FStar.UInt128.t Dummy_value))
          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
          (and
           (implies
            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(792,2-802,3)
            (Valid
             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(792,2-802,3)
             (FStar.UInt.size (FStar.UInt32.v @x1) (BoxInt 32)))
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(791,39-791,48)
            (or
             label_1
             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(792,2-802,3)
             (>= (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 0)))))
           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
           (forall ((@x3 Term))
            (! (implies
              (and
               (HasType @x3 Prims.nat)
               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
               (= @x3 (FStar.UInt32.v @x1)))
              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  (HasType @x4 Prims.pos)
                  ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(792,2-802,3)
                  (= (Prims.pow2 (FStar.UInt32.v @x1)) @x4)
                  ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(792,2-802,3)
                  (> (BoxInt_proj_0 (Prims.pow2 (FStar.UInt32.v @x1))) (BoxInt_proj_0 (BoxInt 0))))
                 ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(791,34-791,48)
                 (or
                  label_2
                  ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(792,2-802,3)
                  (not (= (Prims.pow2 (FStar.UInt32.v @x1)) (BoxInt 0)))))
                :qid @query.3)))
             :qid @query.2))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(792,2-802,3)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_3 (HasType @x3 (FStar.UInt128.t Dummy_value)))
               ;; def=FStar.UInt128.fst(791,21-791,48); use=FStar.UInt128.fst(792,2-802,3)
               (or
                label_4
                ;; def=FStar.UInt128.fst(791,21-791,48); use=FStar.UInt128.fst(792,2-802,3)
                (=
                 (FStar.UInt128.v @x3)
                 (Prims.op_Division (FStar.UInt128.v @x0) (Prims.pow2 (FStar.UInt32.v @x1))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(792,2-802,3)
                (ApplyTT @x2 @x3)))
             :qid @query.5)))
          ;; def=Prims.fst(368,4-368,99); use=FStar.UInt128.fst(792,2-802,3)
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
              ;; def=Prims.fst(368,4-368,99); use=FStar.UInt128.fst(792,2-802,3)
              (forall ((@x4 Term))
               (! (implies
                 (implies
                  ;; def=FStar.UInt128.fst(789,61-802,3); use=FStar.UInt128.fst(792,2-802,3)
                  (=
                   @x4
                   (let ((@lb5 (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0)))))
                    (ite
                     (= @lb5 (BoxBool true))
                     @x0
                     (FStar.UInt128.Mkuint128
                      (FStar.UInt128.add_u64_shift_right_respec
                       (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                       (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                       @x1)
                      (FStar.UInt64.shift_right
                       (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                       @x1)))))
                  ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
                  (forall ((@x5 Term))
                   (! (implies
                     (and
                      (HasType @x5 (FStar.UInt128.t Dummy_value))
                      ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                      (= @x5 @x4))
                     ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                     (Valid
                      ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                      (ApplyTT @x2 @x5)))
                    :qid @query.8)))
                 ;; def=Prims.fst(368,86-368,89); use=FStar.UInt128.fst(792,2-802,3)
                 (Valid
                  ;; def=Prims.fst(368,86-368,89); use=FStar.UInt128.fst(792,2-802,3)
                  (ApplyTT @x3 @x4)))
                :weight 0
                :pattern ((ApplyTT @x3 @x4))
                :qid @query.7)))
             ;; def=Prims.fst(355,2-355,39); use=FStar.UInt128.fst(792,2-802,3)
             (and
              (implies
               ;; def=FStar.UInt128.fst(792,5-792,17); use=FStar.UInt128.fst(792,5-792,17)
               (= (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0))) (BoxBool true))
               ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
               (forall ((@x4 Term))
                (! (implies
                  (HasType @x4 (FStar.UInt128.t Dummy_value))
                  ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                  (Valid
                   ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                   (ApplyTT @x3 @x4)))
                 :qid @query.9)))
              (implies
               ;; def=Prims.fst(355,19-355,21); use=FStar.UInt128.fst(792,2-802,3)
               (not
                ;; def=FStar.UInt128.fst(792,5-792,17); use=FStar.UInt128.fst(792,5-792,17)
                (= (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0))) (BoxBool true)))
               ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
               (forall ((@x4 Term))
                (! (implies
                  (and
                   (HasType @x4 Prims.bool)
                   ;; def=FStar.UInt128.fst(792,5-802,3); use=FStar.UInt128.fst(792,5-802,3)
                   (= (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0))) @x4))
                  ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(794,18-794,44)
                  (and
                   ;; def=FStar.UInt128.fst(752,12-752,26); use=FStar.UInt128.fst(794,18-794,44)
                   (or
                    label_5
                    ;; def=FStar.UInt128.fst(752,12-752,26); use=FStar.UInt128.fst(794,18-794,44)
                    (not (= (FStar.UInt32.v @x1) (BoxInt 0))))
                   ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(794,18-794,44)
                   (forall ((@x5 Term))
                    (! (implies
                      (and
                       (HasType @x5 (FStar.UInt64.t Dummy_value))
                       ;; def=FStar.UInt128.fst(753,21-754,74); use=FStar.UInt128.fst(794,18-794,44)
                       (=
                        (FStar.UInt64.v @x5)
                        (Prims.op_Addition
                         (Prims.op_Division
                          (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0))
                          (Prims.pow2 (FStar.UInt32.v @x1)))
                         (Prims.op_Modulus
                          (Prims.op_Division
                           (Prims.op_Star
                            (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                            (Prims.pow2 (BoxInt 64)))
                           (Prims.pow2 (FStar.UInt32.v @x1)))
                          (Prims.pow2 (BoxInt 64)))))
                       ;; def=FStar.UInt128.fst(114,24-794,59); use=FStar.UInt128.fst(792,2-802,3)
                       (=
                        (FStar.UInt128.add_u64_shift_right_respec
                         (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                         (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                         @x1)
                        @x5))
                      ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(795,23-795,34)
                      (and
                       ;; def=FStar.UInt64.fsti(208,12-208,28); use=FStar.UInt128.fst(795,23-795,34)
                       (or
                        label_6
                        ;; def=FStar.UInt64.fsti(208,12-208,28); use=FStar.UInt128.fst(795,23-795,34)
                        (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 64))))
                       ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(795,23-795,34)
                       (forall ((@x6 Term))
                        (! (implies
                          (and
                           (HasType @x6 (FStar.UInt64.t Dummy_value))
                           ;; def=FStar.UInt64.fsti(209,21-209,68); use=FStar.UInt128.fst(795,23-795,34)
                           (=
                            (FStar.UInt.shift_right
                             (BoxInt 64)
                             (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                             (FStar.UInt32.v @x1))
                            (FStar.UInt64.v @x6))
                           ;; def=FStar.UInt128.fst(114,36-795,43); use=FStar.UInt128.fst(792,2-802,3)
                           (=
                            (FStar.UInt64.shift_right
                             (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                             @x1)
                            @x6))
                          ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                          (forall ((@x7 Term))
                           (! (implies
                             (and
                              (HasType @x7 FStar.UInt128.uint128)
                              ;; def=FStar.UInt128.fst(794,6-795,44); use=FStar.UInt128.fst(794,6-795,44)
                              (=
                               (FStar.UInt128.Mkuint128
                                (FStar.UInt128.add_u64_shift_right_respec
                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                 (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                                 @x1)
                                (FStar.UInt64.shift_right
                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                 @x1))
                               @x7))
                             ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
                             (forall ((@x8 Term))
                              (! (implies
                                (and
                                 (HasType @x8 (FStar.UInt.uint_t (BoxInt 64)))
                                 ;; def=FStar.UInt128.fst(796,6-796,24); use=FStar.UInt128.fst(796,6-796,24)
                                 (=
                                  (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                                  @x8))
                                ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
                                (forall ((@x9 Term))
                                 (! (implies
                                   (and
                                    (HasType @x9 (FStar.UInt.uint_t (BoxInt 64)))
                                    ;; def=FStar.UInt128.fst(797,6-797,23); use=FStar.UInt128.fst(797,6-797,23)
                                    (=
                                     (FStar.UInt64.v
                                      (FStar.UInt128.__proj__Mkuint128__item__low @x0))
                                     @x9))
                                   ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(792,2-802,3)
                                   (forall ((@x10 Term))
                                    (! (implies
                                      (and
                                       (HasType @x10 (FStar.UInt.uint_t (BoxInt 32)))
                                       ;; def=FStar.UInt128.fst(798,6-798,17); use=FStar.UInt128.fst(798,6-798,17)
                                       (= (FStar.UInt32.v @x1) @x10))
                                      ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                      (and
                                       (implies
                                        ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(799,30-799,31)
                                        (Valid
                                         ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(799,30-799,31)
                                         (FStar.UInt.size @x10 (BoxInt 32)))
                                        ;; def=FStar.UInt128.fst(771,58-771,64); use=FStar.UInt128.fst(799,30-799,31)
                                        (and
                                         ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(799,30-799,31)
                                         (or
                                          label_7
                                          ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(799,30-799,31)
                                          (>= (BoxInt_proj_0 @x10) (BoxInt_proj_0 (BoxInt 0))))
                                         ;; def=FStar.UInt128.fst(771,58-771,64); use=FStar.UInt128.fst(799,30-799,31)
                                         (or
                                          label_8
                                          ;; def=FStar.UInt128.fst(771,58-771,64); use=FStar.UInt128.fst(799,30-799,31)
                                          (< (BoxInt_proj_0 @x10) (BoxInt_proj_0 (BoxInt 64))))))
                                       ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                       (forall ((@x11 Term))
                                        (! (implies
                                          (and
                                           (HasType @x11 (FStar.UInt.uint_t (BoxInt 32)))
                                           ;; def=FStar.UInt128.fst(771,52-798,7); use=FStar.UInt128.fst(792,2-802,3)
                                           (= @x10 @x11))
                                          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(799,2-799,25)
                                          (forall ((@x12 Term))
                                           (! (implies
                                             (and
                                              (HasType @x12 Prims.unit)
                                              ;; def=FStar.UInt128.fst(772,8-772,88); use=FStar.UInt128.fst(799,2-799,25)
                                              (=
                                               (Prims.op_Star
                                                @x8
                                                (Prims.pow2 (Prims.op_Subtraction (BoxInt 64) @x10)))
                                               (Prims.op_Addition
                                                (Prims.op_Star
                                                 (Prims.op_Division @x8 (Prims.pow2 @x10))
                                                 (Prims.pow2 (BoxInt 64)))
                                                (Prims.op_Modulus
                                                 (Prims.op_Division
                                                  (Prims.op_Star @x8 (Prims.pow2 (BoxInt 64)))
                                                  (Prims.pow2 @x10))
                                                 (Prims.pow2 (BoxInt 64))))))
                                             ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                             (and
                                              ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,28-800,34)
                                              (or
                                               label_9
                                               ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,28-800,34)
                                               (>=
                                                (BoxInt_proj_0
                                                 (Prims.op_Subtraction (BoxInt 64) @x10))
                                                (BoxInt_proj_0 (BoxInt 0))))
                                              ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
                                              (forall ((@x13 Term))
                                               (! (implies
                                                 (and
                                                  (HasType @x13 Prims.nat)
                                                  ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
                                                  (= @x13 (Prims.op_Subtraction (BoxInt 64) @x10)))
                                                 ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                 (forall ((@x14 Term))
                                                  (! (implies
                                                    (and
                                                     (HasType @x14 Prims.pos)
                                                     ;; def=Prims.fst(670,28-670,31); use=FStar.UInt128.fst(800,23-800,34)
                                                     (=
                                                      (Prims.pow2
                                                       (Prims.op_Subtraction (BoxInt 64) @x10))
                                                      @x14))
                                                    ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
                                                    (forall ((@x15 Term))
                                                     (! (implies
                                                       (and
                                                        (HasType @x15 Prims.pos)
                                                        ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
                                                        (=
                                                         @x15
                                                         (Prims.pow2
                                                          (Prims.op_Subtraction (BoxInt 64) @x10)))
                                                        ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                        (=
                                                         (Prims.pow2
                                                          (Prims.op_Subtraction (BoxInt 64) @x10))
                                                         @x15))
                                                       ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                       (forall ((@x16 Term))
                                                        (! (implies
                                                          (and
                                                           (HasType @x16 Prims.int)
                                                           ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                           (=
                                                            (Prims.op_Star
                                                             @x8
                                                             (Prims.pow2
                                                              (Prims.op_Subtraction (BoxInt 64) @x10)))
                                                            @x16))
                                                          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                                          (and
                                                           (implies
                                                            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(800,48-800,49)
                                                            (Valid
                                                             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(800,48-800,49)
                                                             (FStar.UInt.size @x10 (BoxInt 32)))
                                                            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,48-800,49)
                                                            (or
                                                             label_10
                                                             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(800,48-800,49)
                                                             (>=
                                                              (BoxInt_proj_0 @x10)
                                                              (BoxInt_proj_0 (BoxInt 0)))))
                                                           ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                           (forall ((@x17 Term))
                                                            (! (implies
                                                              (and
                                                               (HasType
                                                                @x17
                                                                (FStar.UInt.uint_t (BoxInt 32)))
                                                               ;; def=Prims.fst(670,14-670,15); use=FStar.UInt128.fst(792,2-802,3)
                                                               (= @x10 @x17))
                                                              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                              (forall ((@x18 Term))
                                                               (! (implies
                                                                 (and
                                                                  (HasType @x18 Prims.pos)
                                                                  ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(800,41-800,49)
                                                                  (= (Prims.pow2 @x10) @x18))
                                                                 ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                                                 (and
                                                                  (implies
                                                                   ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(800,43-800,49)
                                                                   (>
                                                                    (BoxInt_proj_0 (Prims.pow2 @x10))
                                                                    (BoxInt_proj_0 (BoxInt 0)))
                                                                   ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(800,43-800,49)
                                                                   (or
                                                                    label_11
                                                                    ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(800,43-800,49)
                                                                    (not
                                                                     (= (Prims.pow2 @x10) (BoxInt 0)))))
                                                                  ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(792,2-802,3)
                                                                  (forall ((@x19 Term))
                                                                   (! (implies
                                                                     (and
                                                                      (HasType @x19 Prims.nonzero)
                                                                      ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(792,2-802,3)
                                                                      (= @x19 (Prims.pow2 @x10))
                                                                      ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                                      (= (Prims.pow2 @x10) @x19))
                                                                     ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                     (forall ((@x20 Term))
                                                                      (! (implies
                                                                        (and
                                                                         (HasType @x20 Prims.int)
                                                                         ;; def=FStar.UInt128.fst(792,2-802,3); use=FStar.UInt128.fst(792,2-802,3)
                                                                         (=
                                                                          (Prims.op_Division
                                                                           @x9
                                                                           (Prims.pow2 @x10))
                                                                          @x20))
                                                                        ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                        (forall ((@x21 Term))
                                                                         (! (implies
                                                                           (and
                                                                            (HasType @x21 Prims.int)
                                                                            ;; def=Prims.fst(160,48-160,49); use=FStar.UInt128.fst(792,2-802,3)
                                                                            (=
                                                                             (Prims.op_Addition
                                                                              (Prims.op_Star
                                                                               @x8
                                                                               (Prims.pow2
                                                                                (Prims.op_Subtraction
                                                                                 (BoxInt 64)
                                                                                 @x10)))
                                                                              (Prims.op_Division
                                                                               @x9
                                                                               (Prims.pow2 @x10)))
                                                                             @x21))
                                                                           ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                           (forall ((@x22 Term))
                                                                            (! (implies
                                                                              (and
                                                                               (HasType
                                                                                @x22
                                                                                Prims.prop)
                                                                               ;; def=Prims.fst(620,13-620,14); use=FStar.UInt128.fst(792,2-802,3)
                                                                               (=
                                                                                (Prims.eq2
                                                                                 U_zero
                                                                                 Prims.int
                                                                                 (FStar.UInt128.v
                                                                                  @x7)
                                                                                 (Prims.op_Addition
                                                                                  (Prims.op_Star
                                                                                   @x8
                                                                                   (Prims.pow2
                                                                                    (Prims.op_Subtraction
                                                                                     (BoxInt 64)
                                                                                     @x10)))
                                                                                  (Prims.op_Division
                                                                                   @x9
                                                                                   (Prims.pow2 @x10))))
                                                                                @x22))
                                                                              ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(800,2-800,8)
                                                                              (and
                                                                               ;; def=FStar.UInt128.fst(800,9-800,50); use=FStar.UInt128.fst(800,2-800,8)
                                                                               (or
                                                                                label_12
                                                                                ;; def=FStar.UInt128.fst(800,9-800,50); use=FStar.UInt128.fst(800,2-800,8)
                                                                                (=
                                                                                 (FStar.UInt128.v
                                                                                  @x7)
                                                                                 (Prims.op_Addition
                                                                                  (Prims.op_Star
                                                                                   @x8
                                                                                   (Prims.pow2
                                                                                    (Prims.op_Subtraction
                                                                                     (BoxInt 64)
                                                                                     @x10)))
                                                                                  (Prims.op_Division
                                                                                   @x9
                                                                                   (Prims.pow2 @x10)))))
                                                                               ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(800,2-800,8)
                                                                               (forall ((@x23 Term))
                                                                                (! (implies
                                                                                  (and
                                                                                   (HasType
                                                                                    @x23
                                                                                    Prims.unit)
                                                                                   ;; def=FStar.UInt128.fst(800,9-800,50); use=FStar.UInt128.fst(800,2-800,8)
                                                                                   (=
                                                                                    (FStar.UInt128.v
                                                                                     @x7)
                                                                                    (Prims.op_Addition
                                                                                     (Prims.op_Star
                                                                                      @x8
                                                                                      (Prims.pow2
                                                                                       (Prims.op_Subtraction
                                                                                        (BoxInt 64)
                                                                                        @x10)))
                                                                                     (Prims.op_Division
                                                                                      @x9
                                                                                      (Prims.pow2
                                                                                       @x10)))))
                                                                                  ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(792,2-802,3)
                                                                                  (and
                                                                                   (implies
                                                                                    ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(801,18-801,19)
                                                                                    (Valid
                                                                                     ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(801,18-801,19)
                                                                                     (FStar.UInt.size
                                                                                      @x10
                                                                                      (BoxInt 32)))
                                                                                    ;; def=FStar.UInt128.fst(781,32-781,38); use=FStar.UInt128.fst(801,18-801,19)
                                                                                    (and
                                                                                     ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(801,18-801,19)
                                                                                     (or
                                                                                      label_13
                                                                                      ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(801,18-801,19)
                                                                                      (>=
                                                                                       (BoxInt_proj_0
                                                                                        @x10)
                                                                                       (BoxInt_proj_0
                                                                                        (BoxInt 0))))
                                                                                     ;; def=FStar.UInt128.fst(781,32-781,38); use=FStar.UInt128.fst(801,18-801,19)
                                                                                     (or
                                                                                      label_14
                                                                                      ;; def=FStar.UInt128.fst(781,32-781,38); use=FStar.UInt128.fst(801,18-801,19)
                                                                                      (<
                                                                                       (BoxInt_proj_0
                                                                                        @x10)
                                                                                       (BoxInt_proj_0
                                                                                        (BoxInt 64))))))
                                                                                   ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                   (forall
                                                                                     ((@x24 Term))
                                                                                    (! (implies
                                                                                      (and
                                                                                       (HasType
                                                                                        @x24
                                                                                        (FStar.UInt.uint_t
                                                                                         (BoxInt 32)))
                                                                                       ;; def=FStar.UInt128.fst(781,26-798,7); use=FStar.UInt128.fst(792,2-802,3)
                                                                                       (= @x10 @x24))
                                                                                      ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(801,2-801,15)
                                                                                      (forall
                                                                                        ((@x25 Term))
                                                                                       (! (implies
                                                                                         (and
                                                                                          (HasType
                                                                                           @x25
                                                                                           Prims.unit)
                                                                                          ;; def=FStar.UInt128.fst(782,8-782,77); use=FStar.UInt128.fst(801,2-801,15)
                                                                                          (=
                                                                                           (Prims.op_Division
                                                                                            (FStar.UInt128.v
                                                                                             @x0)
                                                                                            (Prims.pow2
                                                                                             @x10))
                                                                                           (Prims.op_Addition
                                                                                            (Prims.op_Division
                                                                                             (FStar.UInt64.v
                                                                                              (FStar.UInt128.__proj__Mkuint128__item__low
                                                                                               @x0))
                                                                                             (Prims.pow2
                                                                                              @x10))
                                                                                            (Prims.op_Star
                                                                                             (FStar.UInt64.v
                                                                                              (FStar.UInt128.__proj__Mkuint128__item__high
                                                                                               @x0))
                                                                                             (Prims.pow2
                                                                                              (Prims.op_Subtraction
                                                                                               (BoxInt
                                                                                                64)
                                                                                               @x10))))))
                                                                                         ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                         (forall
                                                                                           ((@x26
                                                                                             Term))
                                                                                          (! (implies
                                                                                            (HasType
                                                                                             @x26
                                                                                             (FStar.UInt128.t
                                                                                              Dummy_value))
                                                                                            ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                            (Valid
                                                                                             ;; def=Prims.fst(419,90-419,102); use=FStar.UInt128.fst(792,2-802,3)
                                                                                             (ApplyTT
                                                                                              @x3
                                                                                              @x26)))
                                                                                           :qid
                                                                                            @query.32)))
                                                                                        :qid
                                                                                         @query.31)))
                                                                                     :qid @query.30))))
                                                                                 :qid @query.29))))
                                                                             :qid @query.28)))
                                                                          :qid @query.27)))
                                                                       :qid @query.26)))
                                                                    :qid @query.25))))
                                                                :qid @query.24)))
                                                             :qid @query.23))))
                                                         :qid @query.22)))
                                                      :qid @query.21)))
                                                   :qid @query.20)))
                                                :qid @query.19))))
                                            :qid @query.18)))
                                         :qid @query.17))))
                                     :qid @query.16)))
                                  :qid @query.15)))
                               :qid @query.14)))
                            :qid @query.13)))
                         :qid @query.12))))
                     :qid @query.11))))
                 :qid @query.10)))))
            :qid @query.6)))
         :qid @query.4))))
     :qid @query)))
  :named @query))
(set-option :rlimit 10000000)
(echo "<initial_stats>")
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "</initial_stats>")
(echo "<result>")
(check-sat)
(echo "</result>")
(set-option :rlimit 0)
(echo "<reason-unknown>") (get-info :reason-unknown) (echo "</reason-unknown>")
(echo "<labels>")
(echo "label_14")
(echo "label_13")
(echo "label_12")
(echo "label_11")
(echo "label_10")
(echo "label_9")
(echo "label_8")
(echo "label_7")
(echo "label_6")
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.shift_right_small, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun Tm_refine_a2a071dd127b029ef35393f42269ee33 () Term)
; haseq for Tm_refine_a2a071dd127b029ef35393f42269ee33
;;; Fact-ids: Name FStar.UInt128.shift_left_large; Namespace FStar.UInt128
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_a2a071dd127b029ef35393f42269ee33))
   (Valid (Prims.hasEq U_zero (FStar.UInt32.t Dummy_value))))
  :named haseqTm_refine_a2a071dd127b029ef35393f42269ee33))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt128.shift_left_large; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(704,30-704,69); use=FStar.UInt128.fst(708,4-708,20)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_a2a071dd127b029ef35393f42269ee33)
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      ;; def=FStar.UInt128.fst(704,38-704,51); use=FStar.UInt128.fst(708,4-708,20)
      (>= (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 64)))
      ;; def=FStar.UInt128.fst(704,55-704,68); use=FStar.UInt128.fst(708,4-708,20)
      (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 128)))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_a2a071dd127b029ef35393f42269ee33))
    :qid refinement_interpretation_Tm_refine_a2a071dd127b029ef35393f42269ee33))
  :named refinement_interpretation_Tm_refine_a2a071dd127b029ef35393f42269ee33))
; refinement kinding
;;; Fact-ids: Name FStar.UInt128.shift_left_large; Namespace FStar.UInt128
(assert
 (! (HasType Tm_refine_a2a071dd127b029ef35393f42269ee33 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_a2a071dd127b029ef35393f42269ee33))
(push) ;; push{1
(declare-fun label_23 () Bool)
(declare-fun label_22 () Bool)
(declare-fun label_21 () Bool)
(declare-fun label_20 () Bool)
(declare-fun label_19 () Bool)
(declare-fun label_18 () Bool)
(declare-fun label_17 () Bool)
(declare-fun label_16 () Bool)
(declare-fun label_15 () Bool)
(declare-fun label_14 () Bool)
(declare-fun label_13 () Bool)
(declare-fun label_12 () Bool)
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
 (! ;; def=FStar.UInt128.fst(211,27-211,39); use=FStar.UInt128.fst(811,2-811,13)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_afd51579b90d50ea23e03b743a1fa001)
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.UInt128.fst(211,34-211,38); use=FStar.UInt128.fst(811,2-811,13)
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

; Encoding query formula : forall (a: FStar.UInt128.t) (s: FStar.UInt32.t{FStar.UInt32.v s >= 64 /\ FStar.UInt32.v s < 128}).
;   (forall (r: FStar.UInt128.t).
;       (* - Could not prove post-condition *)
;       (FStar.UInt.size (FStar.UInt32.v s) 32 ==> FStar.UInt32.v s >= 0) /\
;       (forall (return_val: Prims.nat).
;           return_val == FStar.UInt32.v s ==>
;           (forall (any_result: Prims.pos).
;               Prims.pow2 (FStar.UInt32.v s) == any_result ==>
;               Prims.pow2 (FStar.UInt32.v s) > 0 ==> Prims.pow2 (FStar.UInt32.v s) <> 0))) /\
;   (forall (p: Prims.pure_post FStar.UInt128.t).
;       (forall (pure_result: FStar.UInt128.t).
;           FStar.UInt128.v pure_result == FStar.UInt128.v a / Prims.pow2 (FStar.UInt32.v s) ==>
;           p pure_result) ==>
;       FStar.UInt.size (FStar.UInt32.v s - FStar.UInt32.v FStar.UInt128.u32_64) 32 /\
;       (forall (pure_result: FStar.UInt32.t).
;           FStar.UInt32.v s - FStar.UInt32.v FStar.UInt128.u32_64 = FStar.UInt32.v pure_result ==>
;           FStar.UInt32.sub s FStar.UInt128.u32_64 == pure_result ==>
;           FStar.UInt32.v (FStar.UInt32.sub s FStar.UInt128.u32_64) < 64 /\
;           (forall (pure_result: FStar.UInt64.t).
;               FStar.UInt.shift_right (FStar.UInt64.v a.high)
;                 (FStar.UInt32.v (FStar.UInt32.sub s FStar.UInt128.u32_64)) =
;               FStar.UInt64.v pure_result ==>
;               FStar.UInt64.shift_right a.high (FStar.UInt32.sub s FStar.UInt128.u32_64) ==
;               pure_result ==>
;               FStar.UInt.size 0 64 /\
;               (forall (any_result: Prims.int).
;                   0 == any_result ==>
;                   (forall (pure_result: FStar.UInt64.t).
;                       FStar.UInt64.v pure_result = 0 ==>
;                       0uL == pure_result ==>
;                       (forall (any_result: FStar.UInt128.uint128).
;                           FStar.UInt128.Mkuint128
;                             (FStar.UInt64.shift_right a.high
;                                 (FStar.UInt32.sub s FStar.UInt128.u32_64)) 0uL ==
;                           any_result ==>
;                           (forall (b: FStar.UInt.uint_t 32).
;                               FStar.UInt32.v s == b ==>
;                               b - 64 >= 0 /\
;                               (forall (return_val: Prims.nat).
;                                   return_val == b - 64 ==>
;                                   (forall (pure_result: Prims.unit).
;                                       Prims.pow2 64 * Prims.pow2 (b - 64) =
;                                       Prims.pow2 (64 + (b - 64)) ==>
;                                       (FStar.UInt.size (FStar.UInt128.v a) FStar.UInt128.n ==>
;                                         FStar.UInt128.v a >= 0) /\
;                                       (forall (return_val: Prims.nat).
;                                           return_val == FStar.UInt128.v a ==>
;                                           (Prims.pow2 64 > 0 ==>
;                                             Prims.pow2 64 >= 0 /\ Prims.pow2 64 > 0) /\
;                                           (forall (return_val: m1: Prims.nat{m1 > 0}).
;                                               return_val == Prims.pow2 64 ==>
;                                               b - 64 >= 0 /\
;                                               (forall (return_val: Prims.nat).
;                                                   return_val == b - 64 ==>
;                                                   (forall (any_result: Prims.pos).
;                                                       Prims.pow2 (b - 64) == any_result ==>
;                                                       (Prims.pow2 (b - 64) > 0 ==>
;                                                         Prims.pow2 (b - 64) >= 0 /\
;                                                         Prims.pow2 (b - 64) > 0) /\
;                                                       (forall (return_val: m2: Prims.nat{m2 > 0}).
;                                                           return_val == Prims.pow2 (b - 64) ==>
;                                                           Prims.pow2 (b - 64) == return_val ==>
;                                                           (forall (pure_result: Prims.unit).
;                                                               FStar.UInt128.v a /
;                                                               (Prims.pow2 64 * Prims.pow2 (b - 64)) ==
;                                                               FStar.UInt128.v a / Prims.pow2 64 /
;                                                               Prims.pow2 (b - 64) ==>
;                                                               (FStar.UInt.size b 32 ==> b >= 0) /\
;                                                               (forall (any_result:
;                                                                   FStar.UInt.uint_t 32).
;                                                                   b == any_result ==>
;                                                                   (forall (any_result: Prims.pos).
;                                                                       Prims.pow2 b == any_result ==>
;                                                                       (Prims.pow2 b > 0 ==>
;                                                                         Prims.pow2 b <> 0) /\
;                                                                       (forall (return_val:
;                                                                           Prims.nonzero).
;                                                                           return_val == Prims.pow2 b ==>
;                                                                           Prims.pow2 b == return_val ==>
;                                                                           (forall (any_result:
;                                                                               Prims.int).
;                                                                               FStar.UInt128.v a /
;                                                                               Prims.pow2 b ==
;                                                                               any_result ==>
;                                                                               (Prims.pow2 64 > 0 ==>
;                                                                                 Prims.pow2 64 <> 0) /\
;                                                                               (forall (return_val:
;                                                                                   Prims.nonzero).
;                                                                                   return_val ==
;                                                                                   Prims.pow2 64 ==>
;                                                                                   (forall (any_result:
;                                                                                       Prims.int).
;                                                                                       FStar.UInt128.v
;                                                                                         a /
;                                                                                       Prims.pow2 64 ==
;                                                                                       any_result ==>
;                                                                                       b - 64 >= 0 /\
;                                                                                       (forall (return_val:
;                                                                                           Prims.nat)
;                                                                                         .
;                                                                                           return_val ==
;                                                                                           b - 64 ==>
;                                                                                           (forall (any_result:
;                                                                                               Prims.pos)
;                                                                                             .
;                                                                                               Prims.pow2
;                                                                                                 (b -
;                                                                                                   64
;                                                                                                 ) ==
;                                                                                               any_result ==>
;                                                                                               (Prims.pow2
;                                                                                                   (b -
;                                                                                                     64
;                                                                                                   ) >
;                                                                                                 0 ==>
;                                                                                                 Prims.pow2
;                                                                                                   (b -
;                                                                                                     64
;                                                                                                   ) <>
;                                                                                                 0) /\
;                                                                                               (forall
;                                                                                                   (return_val:
;                                                                                                   Prims.nonzero)
;                                                                                                 .
;                                                                                                   return_val ==
;                                                                                                   Prims.pow2
;                                                                                                     (
;                                                                                                       b -
;                                                                                                       64
;                                                                                                     )
;                                                                                                    ==>
;                                                                                                   Prims.pow2
;                                                                                                     (
;                                                                                                       b -
;                                                                                                       64
;                                                                                                     )
;                                                                                                    ==
;                                                                                                   return_val ==>
;                                                                                                   (forall
;                                                                                                       (any_result:
;                                                                                                       Prims.int)
;                                                                                                     .
;                                                                                                       FStar.UInt128.v
;                                                                                                         a
;                                                                                                        /
;                                                                                                       Prims.pow2
;                                                                                                         64
;                                                                                                        /
;                                                                                                       Prims.pow2
;                                                                                                         (
;                                                                                                           b -
;                                                                                                           64
;                                                                                                         )
;                                                                                                        ==
;                                                                                                       any_result ==>
;                                                                                                       (
;                                                                                                         forall
;                                                                                                           (any_result:
;                                                                                                           Prims.prop)
;                                                                                                         .
;                                                                                                           FStar.UInt128.v
;                                                                                                             a
;                                                                                                            /
;                                                                                                           Prims.pow2
;                                                                                                             b
;                                                                                                            ==
;                                                                                                           FStar.UInt128.v
;                                                                                                             a
;                                                                                                            /
;                                                                                                           Prims.pow2
;                                                                                                             64
;                                                                                                            /
;                                                                                                           Prims.pow2
;                                                                                                             (
;                                                                                                               b -
;                                                                                                               64
;                                                                                                             )
;                                                                                                            ==
;                                                                                                           any_result ==>
;                                                                                                           FStar.UInt128.v
;                                                                                                             a
;                                                                                                            /
;                                                                                                           Prims.pow2
;                                                                                                             b
;                                                                                                            ==
;                                                                                                           FStar.UInt128.v
;                                                                                                             a
;                                                                                                            /
;                                                                                                           Prims.pow2
;                                                                                                             64
;                                                                                                            /
;                                                                                                           Prims.pow2
;                                                                                                             (
;                                                                                                               b -
;                                                                                                               64
;                                                                                                             )
;                                                                                                            /\
;                                                                                                           (
;                                                                                                             forall
;                                                                                                               (pure_result:
;                                                                                                               Prims.unit)
;                                                                                                             .
;                                                                                                               FStar.UInt128.v
;                                                                                                                 a
;                                                                                                                /
;                                                                                                               Prims.pow2
;                                                                                                                 b
;                                                                                                                ==
;                                                                                                               FStar.UInt128.v
;                                                                                                                 a
;                                                                                                                /
;                                                                                                               Prims.pow2
;                                                                                                                 64
;                                                                                                                /
;                                                                                                               Prims.pow2
;                                                                                                                 (
;                                                                                                                   b -
;                                                                                                                   64
;                                                                                                                 )
;                                                                                                                ==>
;                                                                                                               (
;                                                                                                                 FStar.UInt.size
;                                                                                                                   (
;                                                                                                                     FStar.UInt64.v
;                                                                                                                       a
;                                                                                                                         .low
; 
;                                                                                                                   )
;                                                                                                                   64
;                                                                                                                  ==>
;                                                                                                                 FStar.UInt64.v
;                                                                                                                   a
;                                                                                                                     .low
;                                                                                                                  >=
;                                                                                                                 0
;                                                                                                               ) /\
;                                                                                                               (
;                                                                                                                 forall
;                                                                                                                   (return_val:
;                                                                                                                   Prims.nat)
;                                                                                                                 .
;                                                                                                                   return_val ==
;                                                                                                                   FStar.UInt64.v
;                                                                                                                     a
;                                                                                                                       .low
;                                                                                                                    ==>
;                                                                                                                   (
;                                                                                                                     FStar.UInt.size
;                                                                                                                       (
;                                                                                                                         FStar.UInt64.v
;                                                                                                                           a
;                                                                                                                             .high
; 
;                                                                                                                       )
;                                                                                                                       64
;                                                                                                                      ==>
;                                                                                                                     FStar.UInt64.v
;                                                                                                                       a
;                                                                                                                         .high
;                                                                                                                      >=
;                                                                                                                     0
;                                                                                                                   ) /\
;                                                                                                                   (
;                                                                                                                     forall
;                                                                                                                       (return_val:
;                                                                                                                       Prims.nat)
;                                                                                                                     .
;                                                                                                                       return_val ==
;                                                                                                                       FStar.UInt64.v
;                                                                                                                         a
;                                                                                                                           .high
;                                                                                                                        ==>
;                                                                                                                       FStar.UInt64.v
;                                                                                                                         a
;                                                                                                                           .low
;                                                                                                                        <
;                                                                                                                       Prims.pow2
;                                                                                                                         64
;                                                                                                                        /\
;                                                                                                                       (
;                                                                                                                         forall
;                                                                                                                           (pure_result:
;                                                                                                                           Prims.unit)
;                                                                                                                         .
;                                                                                                                           (
;                                                                                                                             FStar.UInt64.v
;                                                                                                                               a
;                                                                                                                                 .low
;                                                                                                                              +
;                                                                                                                             FStar.UInt64.v
;                                                                                                                               a
;                                                                                                                                 .high
;                                                                                                                              *
;                                                                                                                             Prims.pow2
;                                                                                                                               64
; 
;                                                                                                                           ) /
;                                                                                                                           Prims.pow2
;                                                                                                                             64
;                                                                                                                            ==
;                                                                                                                           FStar.UInt64.v
;                                                                                                                             a
;                                                                                                                               .high
;                                                                                                                            ==>
;                                                                                                                           (
;                                                                                                                             forall
;                                                                                                                               (any_result:
;                                                                                                                               FStar.UInt128.t)
;                                                                                                                             .
;                                                                                                                               any_result ==
;                                                                                                                               FStar.UInt128.Mkuint128
;                                                                                                                                 (
;                                                                                                                                   FStar.UInt64.shift_right
;                                                                                                                                     a
;                                                                                                                                       .high
;                                                                                                                                     (
;                                                                                                                                       FStar.UInt32.sub
;                                                                                                                                         s
;                                                                                                                                         FStar.UInt128.u32_64
; 
;                                                                                                                                     )
; 
;                                                                                                                                 )
;                                                                                                                                 0uL ==>
;                                                                                                                               (
;                                                                                                                                 forall
;                                                                                                                                   (return_val:
;                                                                                                                                   FStar.UInt128.t)
;                                                                                                                                 .
;                                                                                                                                   return_val ==
;                                                                                                                                   any_result ==>
;                                                                                                                                   p
;                                                                                                                                     return_val
; 
;                                                                                                                               )
;                                                                                                                           )
;                                                                                                                       )
;                                                                                                                   )
;                                                                                                               )
;                                                                                                           )
;                                                                                                       )
;                                                                                                   ))
;                                                                                           ))))))))))
;                                                   )))))))))))))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let shift_right_large’
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
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 Tm_refine_a2a071dd127b029ef35393f42269ee33))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.UInt128.fst(806,52-814,3); use=FStar.UInt128.fst(806,52-814,3)
       (forall ((@x2 Term))
        (! (implies
          (HasType @x2 (FStar.UInt128.t Dummy_value))
          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
          (and
           (implies
            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(806,52-814,3)
            (Valid
             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(806,52-814,3)
             (FStar.UInt.size (FStar.UInt32.v @x1) (BoxInt 32)))
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(806,39-806,48)
            (or
             label_1
             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(806,52-814,3)
             (>= (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 0)))))
           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
           (forall ((@x3 Term))
            (! (implies
              (and
               (HasType @x3 Prims.nat)
               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
               (= @x3 (FStar.UInt32.v @x1)))
              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  (HasType @x4 Prims.pos)
                  ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(806,52-814,3)
                  (= (Prims.pow2 (FStar.UInt32.v @x1)) @x4)
                  ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(806,52-814,3)
                  (> (BoxInt_proj_0 (Prims.pow2 (FStar.UInt32.v @x1))) (BoxInt_proj_0 (BoxInt 0))))
                 ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(806,34-806,48)
                 (or
                  label_2
                  ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(806,52-814,3)
                  (not (= (Prims.pow2 (FStar.UInt32.v @x1)) (BoxInt 0)))))
                :qid @query.3)))
             :qid @query.2))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(806,52-814,3)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_3 (HasType @x3 (FStar.UInt128.t Dummy_value)))
               ;; def=FStar.UInt128.fst(806,21-806,48); use=FStar.UInt128.fst(806,52-814,3)
               (or
                label_4
                ;; def=FStar.UInt128.fst(806,21-806,48); use=FStar.UInt128.fst(806,52-814,3)
                (=
                 (FStar.UInt128.v @x3)
                 (Prims.op_Division (FStar.UInt128.v @x0) (Prims.pow2 (FStar.UInt32.v @x1))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(806,52-814,3)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(806,52-814,3)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(806,52-814,3)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(806,52-814,3)
                (ApplyTT @x2 @x3)))
             :qid @query.5)))
          ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(808,46-808,49)
          (and
           ;; def=FStar.UInt32.fsti(116,12-116,32); use=FStar.UInt128.fst(808,46-808,49)
           (or
            label_5
            ;; def=FStar.UInt32.fsti(116,12-116,32); use=FStar.UInt128.fst(808,46-808,49)
            (Valid
             ;; def=FStar.UInt32.fsti(116,12-116,32); use=FStar.UInt128.fst(808,46-808,49)
             (FStar.UInt.size
              (Prims.op_Subtraction
               (FStar.UInt32.v @x1)
               (FStar.UInt32.v (FStar.UInt128.u32_64 Dummy_value)))
              (BoxInt 32))))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(808,46-808,49)
           (forall ((@x3 Term))
            (! (implies
              (and
               (HasType @x3 (FStar.UInt32.t Dummy_value))
               ;; def=FStar.UInt32.fsti(117,21-117,36); use=FStar.UInt128.fst(808,46-808,49)
               (=
                (Prims.op_Subtraction
                 (FStar.UInt32.v @x1)
                 (FStar.UInt32.v (FStar.UInt128.u32_64 Dummy_value)))
                (FStar.UInt32.v @x3))
               ;; def=FStar.UInt64.fsti(207,23-207,24); use=FStar.UInt128.fst(806,52-814,3)
               (= (FStar.UInt32.sub @x1 (FStar.UInt128.u32_64 Dummy_value)) @x3))
              ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(808,22-808,33)
              (and
               ;; def=FStar.UInt64.fsti(208,12-208,28); use=FStar.UInt128.fst(808,22-808,33)
               (or
                label_6
                ;; def=FStar.UInt64.fsti(208,12-208,28); use=FStar.UInt128.fst(808,22-808,33)
                (<
                 (BoxInt_proj_0
                  (FStar.UInt32.v (FStar.UInt32.sub @x1 (FStar.UInt128.u32_64 Dummy_value))))
                 (BoxInt_proj_0 (BoxInt 64))))
               ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(808,22-808,33)
               (forall ((@x4 Term))
                (! (implies
                  (and
                   (HasType @x4 (FStar.UInt64.t Dummy_value))
                   ;; def=FStar.UInt64.fsti(209,21-209,68); use=FStar.UInt128.fst(808,22-808,33)
                   (=
                    (FStar.UInt.shift_right
                     (BoxInt 64)
                     (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                     (FStar.UInt32.v (FStar.UInt32.sub @x1 (FStar.UInt128.u32_64 Dummy_value))))
                    (FStar.UInt64.v @x4))
                   ;; def=FStar.UInt128.fst(114,24-808,59); use=FStar.UInt128.fst(806,52-814,3)
                   (=
                    (FStar.UInt64.shift_right
                     (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                     (FStar.UInt32.sub @x1 (FStar.UInt128.u32_64 Dummy_value)))
                    @x4))
                  ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                  (and
                   ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(807,33-807,34)
                   (or
                    label_7
                    ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(807,33-807,34)
                    (Valid
                     ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(807,33-807,34)
                     (FStar.UInt.size (BoxInt 0) (BoxInt 64))))
                   ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                   (forall ((@x5 Term))
                    (! (implies
                      (and
                       (HasType @x5 Prims.int)
                       ;; def=FStar.UInt64.fsti(57,15-57,16); use=FStar.UInt128.fst(806,52-814,3)
                       (= (BoxInt 0) @x5))
                      ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(807,23-807,32)
                      (forall ((@x6 Term))
                       (! (implies
                         (and
                          (HasType @x6 (FStar.UInt64.t Dummy_value))
                          ;; def=FStar.UInt64.fsti(59,21-59,28); use=FStar.UInt128.fst(807,23-807,32)
                          (= (FStar.UInt64.v @x6) (BoxInt 0))
                          ;; def=FStar.UInt128.fst(114,36-807,34); use=FStar.UInt128.fst(806,52-814,3)
                          (= (FStar.UInt64.uint_to_t (BoxInt 0)) @x6))
                         ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                         (forall ((@x7 Term))
                          (! (implies
                            (and
                             (HasType @x7 FStar.UInt128.uint128)
                             ;; def=FStar.UInt128.fst(807,6-808,60); use=FStar.UInt128.fst(807,6-808,60)
                             (=
                              (FStar.UInt128.Mkuint128
                               (FStar.UInt64.shift_right
                                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                (FStar.UInt32.sub @x1 (FStar.UInt128.u32_64 Dummy_value)))
                               (FStar.UInt64.uint_to_t (BoxInt 0)))
                              @x7))
                            ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(806,52-814,3)
                            (forall ((@x8 Term))
                             (! (implies
                               (and
                                (HasType @x8 (FStar.UInt.uint_t (BoxInt 32)))
                                ;; def=FStar.UInt128.fst(809,6-809,17); use=FStar.UInt128.fst(809,6-809,17)
                                (= (FStar.UInt32.v @x1) @x8))
                               ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                               (and
                                ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(810,20-810,28)
                                (or
                                 label_8
                                 ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(810,20-810,28)
                                 (>=
                                  (BoxInt_proj_0 (Prims.op_Subtraction @x8 (BoxInt 64)))
                                  (BoxInt_proj_0 (BoxInt 0))))
                                ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                (forall ((@x9 Term))
                                 (! (implies
                                   (and
                                    (HasType @x9 Prims.nat)
                                    ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                    (= @x9 (Prims.op_Subtraction @x8 (BoxInt 64))))
                                   ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(810,7-810,16)
                                   (forall ((@x10 Term))
                                    (! (implies
                                      (and
                                       (HasType @x10 Prims.unit)
                                       ;; def=FStar.Math.Lemmas.fsti(155,11-155,43); use=FStar.UInt128.fst(810,7-810,16)
                                       (=
                                        (Prims.op_Star
                                         (Prims.pow2 (BoxInt 64))
                                         (Prims.pow2 (Prims.op_Subtraction @x8 (BoxInt 64))))
                                        (Prims.pow2
                                         (Prims.op_Addition
                                          (BoxInt 64)
                                          (Prims.op_Subtraction @x8 (BoxInt 64))))))
                                      ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                      (and
                                       (implies
                                        ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(811,14-811,19)
                                        (Valid
                                         ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(811,14-811,19)
                                         (FStar.UInt.size
                                          (FStar.UInt128.v @x0)
                                          (FStar.UInt128.n Dummy_value)))
                                        ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(811,14-811,19)
                                        (or
                                         label_9
                                         ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(811,14-811,19)
                                         (>=
                                          (BoxInt_proj_0 (FStar.UInt128.v @x0))
                                          (BoxInt_proj_0 (BoxInt 0)))))
                                       ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                       (forall ((@x11 Term))
                                        (! (implies
                                          (and
                                           (HasType @x11 Prims.nat)
                                           ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                           (= @x11 (FStar.UInt128.v @x0)))
                                          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                          (and
                                           (implies
                                            ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(811,20-811,29)
                                            (>
                                             (BoxInt_proj_0 (Prims.pow2 (BoxInt 64)))
                                             (BoxInt_proj_0 (BoxInt 0)))
                                            ;; def=FStar.UInt128.fst(211,34-211,38); use=FStar.UInt128.fst(811,20-811,29)
                                            (and
                                             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(811,20-811,29)
                                             (or
                                              label_10
                                              ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(811,20-811,29)
                                              (>=
                                               (BoxInt_proj_0 (Prims.pow2 (BoxInt 64)))
                                               (BoxInt_proj_0 (BoxInt 0))))
                                             ;; def=FStar.UInt128.fst(211,34-211,38); use=FStar.UInt128.fst(811,20-811,29)
                                             (or
                                              label_11
                                              ;; def=FStar.UInt128.fst(211,34-211,38); use=FStar.UInt128.fst(811,20-811,29)
                                              (>
                                               (BoxInt_proj_0 (Prims.pow2 (BoxInt 64)))
                                               (BoxInt_proj_0 (BoxInt 0))))))
                                           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                           (forall ((@x12 Term))
                                            (! (implies
                                              (and
                                               (HasType
                                                @x12
                                                Tm_refine_afd51579b90d50ea23e03b743a1fa001)
                                               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                               (= @x12 (Prims.pow2 (BoxInt 64))))
                                              ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                              (and
                                               ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(811,36-811,44)
                                               (or
                                                label_12
                                                ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(811,36-811,44)
                                                (>=
                                                 (BoxInt_proj_0
                                                  (Prims.op_Subtraction @x8 (BoxInt 64)))
                                                 (BoxInt_proj_0 (BoxInt 0))))
                                               ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                               (forall ((@x13 Term))
                                                (! (implies
                                                  (and
                                                   (HasType @x13 Prims.nat)
                                                   ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                                   (= @x13 (Prims.op_Subtraction @x8 (BoxInt 64))))
                                                  ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                                                  (forall ((@x14 Term))
                                                   (! (implies
                                                     (and
                                                      (HasType @x14 Prims.pos)
                                                      ;; def=FStar.UInt128.fst(211,43-811,45); use=FStar.UInt128.fst(811,2-811,45)
                                                      (=
                                                       (Prims.pow2
                                                        (Prims.op_Subtraction @x8 (BoxInt 64)))
                                                       @x14))
                                                     ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                                     (and
                                                      (implies
                                                       ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(811,30-811,45)
                                                       (>
                                                        (BoxInt_proj_0
                                                         (Prims.pow2
                                                          (Prims.op_Subtraction @x8 (BoxInt 64))))
                                                        (BoxInt_proj_0 (BoxInt 0)))
                                                       ;; def=FStar.UInt128.fst(211,50-211,54); use=FStar.UInt128.fst(811,30-811,45)
                                                       (and
                                                        ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(811,30-811,45)
                                                        (or
                                                         label_13
                                                         ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(811,30-811,45)
                                                         (>=
                                                          (BoxInt_proj_0
                                                           (Prims.pow2
                                                            (Prims.op_Subtraction @x8 (BoxInt 64))))
                                                          (BoxInt_proj_0 (BoxInt 0))))
                                                        ;; def=FStar.UInt128.fst(211,50-211,54); use=FStar.UInt128.fst(811,30-811,45)
                                                        (or
                                                         label_14
                                                         ;; def=FStar.UInt128.fst(211,50-211,54); use=FStar.UInt128.fst(811,30-811,45)
                                                         (>
                                                          (BoxInt_proj_0
                                                           (Prims.pow2
                                                            (Prims.op_Subtraction @x8 (BoxInt 64))))
                                                          (BoxInt_proj_0 (BoxInt 0))))))
                                                      ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                                      (forall ((@x15 Term))
                                                       (! (implies
                                                         (and
                                                          (HasType
                                                           @x15
                                                           Tm_refine_afd51579b90d50ea23e03b743a1fa001)
                                                          ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                                          (=
                                                           @x15
                                                           (Prims.pow2
                                                            (Prims.op_Subtraction @x8 (BoxInt 64))))
                                                          ;; def=FStar.UInt128.fst(211,43-811,45); use=FStar.UInt128.fst(806,52-814,3)
                                                          (=
                                                           (Prims.pow2
                                                            (Prims.op_Subtraction @x8 (BoxInt 64)))
                                                           @x15))
                                                         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(811,2-811,13)
                                                         (forall ((@x16 Term))
                                                          (! (implies
                                                            (and
                                                             (HasType @x16 Prims.unit)
                                                             ;; def=FStar.UInt128.fst(212,8-212,38); use=FStar.UInt128.fst(811,2-811,13)
                                                             (=
                                                              (Prims.op_Division
                                                               (FStar.UInt128.v @x0)
                                                               (Prims.op_Star
                                                                (Prims.pow2 (BoxInt 64))
                                                                (Prims.pow2
                                                                 (Prims.op_Subtraction
                                                                  @x8
                                                                  (BoxInt 64)))))
                                                              (Prims.op_Division
                                                               (Prims.op_Division
                                                                (FStar.UInt128.v @x0)
                                                                (Prims.pow2 (BoxInt 64)))
                                                               (Prims.pow2
                                                                (Prims.op_Subtraction
                                                                 @x8
                                                                 (BoxInt 64))))))
                                                            ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                                            (and
                                                             (implies
                                                              ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(812,21-812,22)
                                                              (Valid
                                                               ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(812,21-812,22)
                                                               (FStar.UInt.size @x8 (BoxInt 32)))
                                                              ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(812,21-812,22)
                                                              (or
                                                               label_15
                                                               ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(812,21-812,22)
                                                               (>=
                                                                (BoxInt_proj_0 @x8)
                                                                (BoxInt_proj_0 (BoxInt 0)))))
                                                             ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                                                             (forall ((@x17 Term))
                                                              (! (implies
                                                                (and
                                                                 (HasType
                                                                  @x17
                                                                  (FStar.UInt.uint_t (BoxInt 32)))
                                                                 ;; def=Prims.fst(670,14-670,15); use=FStar.UInt128.fst(806,52-814,3)
                                                                 (= @x8 @x17))
                                                                ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                                                                (forall ((@x18 Term))
                                                                 (! (implies
                                                                   (and
                                                                    (HasType @x18 Prims.pos)
                                                                    ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(812,14-812,22)
                                                                    (= (Prims.pow2 @x8) @x18))
                                                                   ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                                                   (and
                                                                    (implies
                                                                     ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(812,16-812,22)
                                                                     (>
                                                                      (BoxInt_proj_0
                                                                       (Prims.pow2 @x8))
                                                                      (BoxInt_proj_0 (BoxInt 0)))
                                                                     ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(812,16-812,22)
                                                                     (or
                                                                      label_16
                                                                      ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(812,16-812,22)
                                                                      (not
                                                                       (=
                                                                        (Prims.pow2 @x8)
                                                                        (BoxInt 0)))))
                                                                    ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                                                    (forall ((@x19 Term))
                                                                     (! (implies
                                                                       (and
                                                                        (HasType @x19 Prims.nonzero)
                                                                        ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                                                        (= @x19 (Prims.pow2 @x8))
                                                                        ;; def=FStar.UInt128.fst(806,52-814,3); use=FStar.UInt128.fst(806,52-814,3)
                                                                        (= (Prims.pow2 @x8) @x19))
                                                                       ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                                                                       (forall ((@x20 Term))
                                                                        (! (implies
                                                                          (and
                                                                           (HasType @x20 Prims.int)
                                                                           ;; def=Prims.fst(160,41-160,42); use=FStar.UInt128.fst(806,52-814,3)
                                                                           (=
                                                                            (Prims.op_Division
                                                                             (FStar.UInt128.v @x0)
                                                                             (Prims.pow2 @x8))
                                                                            @x20))
                                                                          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                                                          (and
                                                                           (implies
                                                                            ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(812,32-812,39)
                                                                            (>
                                                                             (BoxInt_proj_0
                                                                              (Prims.pow2
                                                                               (BoxInt 64)))
                                                                             (BoxInt_proj_0
                                                                              (BoxInt 0)))
                                                                            ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(812,32-812,39)
                                                                            (or
                                                                             label_17
                                                                             ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(812,32-812,39)
                                                                             (not
                                                                              (=
                                                                               (Prims.pow2
                                                                                (BoxInt 64))
                                                                               (BoxInt 0)))))
                                                                           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                                                           (forall ((@x21 Term))
                                                                            (! (implies
                                                                              (and
                                                                               (HasType
                                                                                @x21
                                                                                Prims.nonzero)
                                                                               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                                                               (=
                                                                                @x21
                                                                                (Prims.pow2
                                                                                 (BoxInt 64))))
                                                                              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                                                                              (forall ((@x22 Term))
                                                                               (! (implies
                                                                                 (and
                                                                                  (HasType
                                                                                   @x22
                                                                                   Prims.int)
                                                                                  ;; def=FStar.UInt128.fst(806,52-814,3); use=FStar.UInt128.fst(806,52-814,3)
                                                                                  (=
                                                                                   (Prims.op_Division
                                                                                    (FStar.UInt128.v
                                                                                     @x0)
                                                                                    (Prims.pow2
                                                                                     (BoxInt 64)))
                                                                                   @x22))
                                                                                 ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                                                                 (and
                                                                                  ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(812,47-812,55)
                                                                                  (or
                                                                                   label_18
                                                                                   ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(812,47-812,55)
                                                                                   (>=
                                                                                    (BoxInt_proj_0
                                                                                     (Prims.op_Subtraction
                                                                                      @x8
                                                                                      (BoxInt 64)))
                                                                                    (BoxInt_proj_0
                                                                                     (BoxInt 0))))
                                                                                  ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                                                                  (forall
                                                                                    ((@x23 Term))
                                                                                   (! (implies
                                                                                     (and
                                                                                      (HasType
                                                                                       @x23
                                                                                       Prims.nat)
                                                                                      ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                                                                      (=
                                                                                       @x23
                                                                                       (Prims.op_Subtraction
                                                                                        @x8
                                                                                        (BoxInt 64))))
                                                                                     ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                                                                                     (forall
                                                                                       ((@x24 Term))
                                                                                      (! (implies
                                                                                        (and
                                                                                         (HasType
                                                                                          @x24
                                                                                          Prims.pos)
                                                                                         ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(812,40-812,55)
                                                                                         (=
                                                                                          (Prims.pow2
                                                                                           (Prims.op_Subtraction
                                                                                            @x8
                                                                                            (BoxInt
                                                                                             64)))
                                                                                          @x24))
                                                                                        ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                                                                        (and
                                                                                         (implies
                                                                                          ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(812,42-812,55)
                                                                                          (>
                                                                                           (BoxInt_proj_0
                                                                                            (Prims.pow2
                                                                                             (Prims.op_Subtraction
                                                                                              @x8
                                                                                              (BoxInt
                                                                                               64))))
                                                                                           (BoxInt_proj_0
                                                                                            (BoxInt
                                                                                             0)))
                                                                                          ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(812,42-812,55)
                                                                                          (or
                                                                                           label_19
                                                                                           ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(812,42-812,55)
                                                                                           (not
                                                                                            (=
                                                                                             (Prims.pow2
                                                                                              (Prims.op_Subtraction
                                                                                               @x8
                                                                                               (BoxInt
                                                                                                64)))
                                                                                             (BoxInt
                                                                                              0)))))
                                                                                         ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                                                                         (forall
                                                                                           ((@x25
                                                                                             Term))
                                                                                          (! (implies
                                                                                            (and
                                                                                             (HasType
                                                                                              @x25
                                                                                              Prims.nonzero)
                                                                                             ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                                                                             (=
                                                                                              @x25
                                                                                              (Prims.pow2
                                                                                               (Prims.op_Subtraction
                                                                                                @x8
                                                                                                (BoxInt
                                                                                                 64))))
                                                                                             ;; def=FStar.UInt128.fst(806,52-814,3); use=FStar.UInt128.fst(806,52-814,3)
                                                                                             (=
                                                                                              (Prims.pow2
                                                                                               (Prims.op_Subtraction
                                                                                                @x8
                                                                                                (BoxInt
                                                                                                 64)))
                                                                                              @x25))
                                                                                            ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                                                                                            (forall
                                                                                              ((@x26
                                                                                                Term))
                                                                                             (! (implies
                                                                                               (and
                                                                                                (HasType
                                                                                                 @x26
                                                                                                 Prims.int)
                                                                                                ;; def=Prims.fst(160,48-160,49); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                (=
                                                                                                 (Prims.op_Division
                                                                                                  (Prims.op_Division
                                                                                                   (FStar.UInt128.v
                                                                                                    @x0)
                                                                                                   (Prims.pow2
                                                                                                    (BoxInt
                                                                                                     64)))
                                                                                                  (Prims.pow2
                                                                                                   (Prims.op_Subtraction
                                                                                                    @x8
                                                                                                    (BoxInt
                                                                                                     64))))
                                                                                                 @x26))
                                                                                               ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                                                                                               (forall
                                                                                                 ((@x27
                                                                                                   Term))
                                                                                                (! (implies
                                                                                                  (and
                                                                                                   (HasType
                                                                                                    @x27
                                                                                                    Prims.prop)
                                                                                                   ;; def=Prims.fst(620,13-620,14); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                   (=
                                                                                                    (Prims.eq2
                                                                                                     U_zero
                                                                                                     Prims.int
                                                                                                     (Prims.op_Division
                                                                                                      (FStar.UInt128.v
                                                                                                       @x0)
                                                                                                      (Prims.pow2
                                                                                                       @x8))
                                                                                                     (Prims.op_Division
                                                                                                      (Prims.op_Division
                                                                                                       (FStar.UInt128.v
                                                                                                        @x0)
                                                                                                       (Prims.pow2
                                                                                                        (BoxInt
                                                                                                         64)))
                                                                                                      (Prims.pow2
                                                                                                       (Prims.op_Subtraction
                                                                                                        @x8
                                                                                                        (BoxInt
                                                                                                         64)))))
                                                                                                    @x27))
                                                                                                  ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(812,2-812,8)
                                                                                                  (and
                                                                                                   ;; def=FStar.UInt128.fst(812,9-812,56); use=FStar.UInt128.fst(812,2-812,8)
                                                                                                   (or
                                                                                                    label_20
                                                                                                    ;; def=FStar.UInt128.fst(812,9-812,56); use=FStar.UInt128.fst(812,2-812,8)
                                                                                                    (=
                                                                                                     (Prims.op_Division
                                                                                                      (FStar.UInt128.v
                                                                                                       @x0)
                                                                                                      (Prims.pow2
                                                                                                       @x8))
                                                                                                     (Prims.op_Division
                                                                                                      (Prims.op_Division
                                                                                                       (FStar.UInt128.v
                                                                                                        @x0)
                                                                                                       (Prims.pow2
                                                                                                        (BoxInt
                                                                                                         64)))
                                                                                                      (Prims.pow2
                                                                                                       (Prims.op_Subtraction
                                                                                                        @x8
                                                                                                        (BoxInt
                                                                                                         64))))))
                                                                                                   ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(812,2-812,8)
                                                                                                   (forall
                                                                                                     ((@x28
                                                                                                       Term))
                                                                                                    (! (implies
                                                                                                      (and
                                                                                                       (HasType
                                                                                                        @x28
                                                                                                        Prims.unit)
                                                                                                       ;; def=FStar.UInt128.fst(812,9-812,56); use=FStar.UInt128.fst(812,2-812,8)
                                                                                                       (=
                                                                                                        (Prims.op_Division
                                                                                                         (FStar.UInt128.v
                                                                                                          @x0)
                                                                                                         (Prims.pow2
                                                                                                          @x8))
                                                                                                        (Prims.op_Division
                                                                                                         (Prims.op_Division
                                                                                                          (FStar.UInt128.v
                                                                                                           @x0)
                                                                                                          (Prims.pow2
                                                                                                           (BoxInt
                                                                                                            64)))
                                                                                                         (Prims.pow2
                                                                                                          (Prims.op_Subtraction
                                                                                                           @x8
                                                                                                           (BoxInt
                                                                                                            64))))))
                                                                                                      ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                      (and
                                                                                                       (implies
                                                                                                        ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(813,20-813,33)
                                                                                                        (Valid
                                                                                                         ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(813,20-813,33)
                                                                                                         (FStar.UInt.size
                                                                                                          (FStar.UInt64.v
                                                                                                           (FStar.UInt128.__proj__Mkuint128__item__low
                                                                                                            @x0))
                                                                                                          (BoxInt
                                                                                                           64)))
                                                                                                        ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(813,20-813,33)
                                                                                                        (or
                                                                                                         label_21
                                                                                                         ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(813,20-813,33)
                                                                                                         (>=
                                                                                                          (BoxInt_proj_0
                                                                                                           (FStar.UInt64.v
                                                                                                            (FStar.UInt128.__proj__Mkuint128__item__low
                                                                                                             @x0)))
                                                                                                          (BoxInt_proj_0
                                                                                                           (BoxInt
                                                                                                            0)))))
                                                                                                       ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                       (forall
                                                                                                         ((@x29
                                                                                                           Term))
                                                                                                        (! (implies
                                                                                                          (and
                                                                                                           (HasType
                                                                                                            @x29
                                                                                                            Prims.nat)
                                                                                                           ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                           (=
                                                                                                            @x29
                                                                                                            (FStar.UInt64.v
                                                                                                             (FStar.UInt128.__proj__Mkuint128__item__low
                                                                                                              @x0))))
                                                                                                          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                          (and
                                                                                                           (implies
                                                                                                            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(813,34-813,48)
                                                                                                            (Valid
                                                                                                             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(813,34-813,48)
                                                                                                             (FStar.UInt.size
                                                                                                              (FStar.UInt64.v
                                                                                                               (FStar.UInt128.__proj__Mkuint128__item__high
                                                                                                                @x0))
                                                                                                              (BoxInt
                                                                                                               64)))
                                                                                                            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(813,34-813,48)
                                                                                                            (or
                                                                                                             label_22
                                                                                                             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(813,34-813,48)
                                                                                                             (>=
                                                                                                              (BoxInt_proj_0
                                                                                                               (FStar.UInt64.v
                                                                                                                (FStar.UInt128.__proj__Mkuint128__item__high
                                                                                                                 @x0)))
                                                                                                              (BoxInt_proj_0
                                                                                                               (BoxInt
                                                                                                                0)))))
                                                                                                           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                           (forall
                                                                                                             ((@x30
                                                                                                               Term))
                                                                                                            (! (implies
                                                                                                              (and
                                                                                                               (HasType
                                                                                                                @x30
                                                                                                                Prims.nat)
                                                                                                               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                               (=
                                                                                                                @x30
                                                                                                                (FStar.UInt64.v
                                                                                                                 (FStar.UInt128.__proj__Mkuint128__item__high
                                                                                                                  @x0))))
                                                                                                              ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(813,2-813,19)
                                                                                                              (and
                                                                                                               ;; def=FStar.UInt128.fst(571,18-571,25); use=FStar.UInt128.fst(813,2-813,19)
                                                                                                               (or
                                                                                                                label_23
                                                                                                                ;; def=FStar.UInt128.fst(571,18-571,25); use=FStar.UInt128.fst(813,2-813,19)
                                                                                                                (<
                                                                                                                 (BoxInt_proj_0
                                                                                                                  (FStar.UInt64.v
                                                                                                                   (FStar.UInt128.__proj__Mkuint128__item__low
                                                                                                                    @x0)))
                                                                                                                 (BoxInt_proj_0
                                                                                                                  (Prims.pow2
                                                                                                                   (BoxInt
                                                                                                                    64)))))
                                                                                                               ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(813,2-813,19)
                                                                                                               (forall
                                                                                                                 ((@x31
                                                                                                                   Term))
                                                                                                                (! (implies
                                                                                                                  (and
                                                                                                                   (HasType
                                                                                                                    @x31
                                                                                                                    Prims.unit)
                                                                                                                   ;; def=FStar.UInt128.fst(572,17-572,39); use=FStar.UInt128.fst(813,2-813,19)
                                                                                                                   (=
                                                                                                                    (Prims.op_Division
                                                                                                                     (Prims.op_Addition
                                                                                                                      (FStar.UInt64.v
                                                                                                                       (FStar.UInt128.__proj__Mkuint128__item__low
                                                                                                                        @x0))
                                                                                                                      (Prims.op_Star
                                                                                                                       (FStar.UInt64.v
                                                                                                                        (FStar.UInt128.__proj__Mkuint128__item__high
                                                                                                                         @x0))
                                                                                                                       (Prims.pow2
                                                                                                                        (BoxInt
                                                                                                                         64))))
                                                                                                                     (Prims.pow2
                                                                                                                      (BoxInt
                                                                                                                       64)))
                                                                                                                    (FStar.UInt64.v
                                                                                                                     (FStar.UInt128.__proj__Mkuint128__item__high
                                                                                                                      @x0))))
                                                                                                                  ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                                  (forall
                                                                                                                    ((@x32
                                                                                                                      Term))
                                                                                                                   (! (implies
                                                                                                                     (and
                                                                                                                      (HasType
                                                                                                                       @x32
                                                                                                                       (FStar.UInt128.t
                                                                                                                        Dummy_value))
                                                                                                                      ;; def=FStar.UInt128.fst(804,79-814,3); use=FStar.UInt128.fst(806,52-814,3)
                                                                                                                      (=
                                                                                                                       @x32
                                                                                                                       (FStar.UInt128.Mkuint128
                                                                                                                        (FStar.UInt64.shift_right
                                                                                                                         (FStar.UInt128.__proj__Mkuint128__item__high
                                                                                                                          @x0)
                                                                                                                         (FStar.UInt32.sub
                                                                                                                          @x1
                                                                                                                          (FStar.UInt128.u32_64
                                                                                                                           Dummy_value)))
                                                                                                                        (FStar.UInt64.uint_to_t
                                                                                                                         (BoxInt
                                                                                                                          0)))))
                                                                                                                     ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
                                                                                                                     (forall
                                                                                                                       ((@x33
                                                                                                                         Term))
                                                                                                                      (! (implies
                                                                                                                        (and
                                                                                                                         (HasType
                                                                                                                          @x33
                                                                                                                          (FStar.UInt128.t
                                                                                                                           Dummy_value))
                                                                                                                         ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                                                                                                                         (=
                                                                                                                          @x33
                                                                                                                          @x32))
                                                                                                                        ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                                                                                                                        (Valid
                                                                                                                         ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                                                                                                                         (ApplyTT
                                                                                                                          @x2
                                                                                                                          @x33)))
                                                                                                                       :qid
                                                                                                                        @query.36)))
                                                                                                                    :qid
                                                                                                                     @query.35)))
                                                                                                                 :qid
                                                                                                                  @query.34))))
                                                                                                             :qid
                                                                                                              @query.33))))
                                                                                                         :qid
                                                                                                          @query.32))))
                                                                                                     :qid
                                                                                                      @query.31))))
                                                                                                 :qid
                                                                                                  @query.30)))
                                                                                              :qid
                                                                                               @query.29)))
                                                                                           :qid
                                                                                            @query.28))))
                                                                                       :qid
                                                                                        @query.27)))
                                                                                    :qid @query.26))))
                                                                                :qid @query.25)))
                                                                             :qid @query.24))))
                                                                         :qid @query.23)))
                                                                      :qid @query.22))))
                                                                  :qid @query.21)))
                                                               :qid @query.20))))
                                                           :qid @query.19)))
                                                        :qid @query.18))))
                                                    :qid @query.17)))
                                                 :qid @query.16))))
                                             :qid @query.15))))
                                         :qid @query.14))))
                                     :qid @query.13)))
                                  :qid @query.12))))
                              :qid @query.11)))
                           :qid @query.10)))
                        :qid @query.9)))
                     :qid @query.8))))
                 :qid @query.7))))
             :qid @query.6))))
         :qid @query.4))))
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
(echo "label_23")
(echo "label_22")
(echo "label_21")
(echo "label_20")
(echo "label_19")
(echo "label_18")
(echo "label_17")
(echo "label_16")
(echo "label_15")
(echo "label_14")
(echo "label_13")
(echo "label_12")
(echo "label_11")
(echo "label_10")
(echo "label_9")
(echo "label_8")
(echo "label_7")
(echo "label_6")
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.shift_right_large, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
(declare-fun Tm_refine_d134ed00e775830ccf7f9949f994a918 (Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=FStar.UInt128.fsti(101,19-101,44)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_d134ed00e775830ccf7f9949f994a918 @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_d134ed00e775830ccf7f9949f994a918 @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_d134ed00e775830ccf7f9949f994a918))
  :named refinement_kinding_Tm_refine_d134ed00e775830ccf7f9949f994a918))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=FStar.UInt128.fsti(101,19-101,44)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_d134ed00e775830ccf7f9949f994a918 @x2))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt128.t Dummy_value))
      ;; def=FStar.UInt128.fsti(102,12-102,25); use=FStar.UInt128.fsti(101,38-101,42)
      (< (BoxInt_proj_0 (FStar.UInt32.v @x2)) (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_d134ed00e775830ccf7f9949f994a918 @x2)))
    :qid refinement_interpretation_Tm_refine_d134ed00e775830ccf7f9949f994a918))
  :named refinement_interpretation_Tm_refine_d134ed00e775830ccf7f9949f994a918))
; haseq for Tm_refine_d134ed00e775830ccf7f9949f994a918
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=FStar.UInt128.fsti(101,19-101,44)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_d134ed00e775830ccf7f9949f994a918 @x0)))
     (Valid (Prims.hasEq U_zero (FStar.UInt128.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_d134ed00e775830ccf7f9949f994a918 @x0))))
    :qid haseqTm_refine_d134ed00e775830ccf7f9949f994a918))
  :named haseqTm_refine_d134ed00e775830ccf7f9949f994a918))
; Encoding query formula : forall (a: FStar.UInt128.t)
;   (s: FStar.UInt32.t)
;   (c: _: FStar.UInt128.t{FStar.UInt32.v s < FStar.UInt128.n}).
;   (* - Could not prove post-condition *)
;   (FStar.UInt.size (FStar.UInt32.v s) 32 ==> FStar.UInt32.v s >= 0) /\
;   (forall (return_val: Prims.nat).
;       return_val == FStar.UInt32.v s ==>
;       (forall (any_result: Prims.pos).
;           Prims.pow2 (FStar.UInt32.v s) == any_result ==>
;           Prims.pow2 (FStar.UInt32.v s) > 0 ==> Prims.pow2 (FStar.UInt32.v s) <> 0))
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.shift_right’
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
   ;; def=FStar.UInt128.fsti(101,0-103,56); use=FStar.UInt128.fsti(101,0-103,56)
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 (FStar.UInt32.t Dummy_value))
       (HasType @x2 (Tm_refine_d134ed00e775830ccf7f9949f994a918 @x1)))
      ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fsti(101,19-101,44)
      (and
       (implies
        ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(101,19-101,44)
        (Valid
         ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(101,19-101,44)
         (FStar.UInt.size (FStar.UInt32.v @x1) (BoxInt 32)))
        ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(103,40-103,52)
        (or
         label_1
         ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(101,19-101,44)
         (>= (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 0)))))
       ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fsti(101,19-101,44)
       (forall ((@x3 Term))
        (! (implies
          (and
           (HasType @x3 Prims.nat)
           ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fsti(101,19-101,44)
           (= @x3 (FStar.UInt32.v @x1)))
          ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fsti(101,19-101,44)
          (forall ((@x4 Term))
           (! (implies
             (and
              (HasType @x4 Prims.pos)
              ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fsti(101,19-101,44)
              (= (Prims.pow2 (FStar.UInt32.v @x1)) @x4)
              ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fsti(101,19-101,44)
              (> (BoxInt_proj_0 (Prims.pow2 (FStar.UInt32.v @x1))) (BoxInt_proj_0 (BoxInt 0))))
             ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fsti(103,34-103,53)
             (or
              label_2
              ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fsti(101,19-101,44)
              (not (= (Prims.pow2 (FStar.UInt32.v @x1)) (BoxInt 0)))))
            :qid @query.2)))
         :qid @query.1))))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.shift_right, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt.lt (Term Term Term) Term)
(declare-fun FStar.UInt128.shift_right_large (Term Term) Term)
(declare-fun FStar.UInt128.shift_right_small (Term Term) Term)
(declare-fun FStar.UInt32.lt (Term Term) Term)
(declare-fun Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330 (Term Term) Term)
; Equation for FStar.UInt.lt
;;; Fact-ids: Name FStar.UInt.lt; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(169,4-169,6); use=FStar.UInt.fsti(169,4-169,6)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (FStar.UInt.lt @x0 @x1 @x2) (Prims.op_LessThan @x1 @x2))
    :pattern ((FStar.UInt.lt @x0 @x1 @x2))
    :qid equation_FStar.UInt.lt))
  :named equation_FStar.UInt.lt))
; Equation for FStar.UInt128.shift_right_large
;;; Fact-ids: Name FStar.UInt128.shift_right_large; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(804,4-804,21); use=FStar.UInt128.fst(804,4-804,21)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt128.shift_right_large @x0 @x1)
     (FStar.UInt128.Mkuint128
      (FStar.UInt64.shift_right
       (FStar.UInt128.__proj__Mkuint128__item__high @x0)
       (FStar.UInt32.sub @x1 (FStar.UInt128.u32_64 Dummy_value)))
      (FStar.UInt64.uint_to_t (BoxInt 0))))
    :pattern ((FStar.UInt128.shift_right_large @x0 @x1))
    :qid equation_FStar.UInt128.shift_right_large))
  :named equation_FStar.UInt128.shift_right_large))
; Equation for FStar.UInt128.shift_right_small
;;; Fact-ids: Name FStar.UInt128.shift_right_small; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(789,4-789,21); use=FStar.UInt128.fst(789,4-789,21)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt128.shift_right_small @x0 @x1)
     (let ((@lb2 (FStar.UInt32.eq @x1 (FStar.UInt32.uint_to_t (BoxInt 0)))))
      (ite
       (= @lb2 (BoxBool true))
       @x0
       (FStar.UInt128.Mkuint128
        (FStar.UInt128.add_u64_shift_right_respec
         (FStar.UInt128.__proj__Mkuint128__item__high @x0)
         (FStar.UInt128.__proj__Mkuint128__item__low @x0)
         @x1)
        (FStar.UInt64.shift_right (FStar.UInt128.__proj__Mkuint128__item__high @x0) @x1)))))
    :pattern ((FStar.UInt128.shift_right_small @x0 @x1))
    :qid equation_FStar.UInt128.shift_right_small))
  :named equation_FStar.UInt128.shift_right_small))
; Equation for FStar.UInt32.lt
;;; Fact-ids: Name FStar.UInt32.lt; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(246,4-246,6); use=FStar.UInt32.fsti(246,4-246,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt32.lt @x0 @x1)
     (FStar.UInt.lt (BoxInt 32) (FStar.UInt32.v @x0) (FStar.UInt32.v @x1)))
    :pattern ((FStar.UInt32.lt @x0 @x1))
    :qid equation_FStar.UInt32.lt))
  :named equation_FStar.UInt32.lt))
; haseq for Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330
;;; Fact-ids: Name FStar.UInt128.shift_right_small; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(789,61-789,62); use=FStar.UInt128.fst(789,61-789,62)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330 @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt128.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330 @x0 @x1))))
    :qid haseqTm_refine_ae880c61bd89ebe8bd4cc06ccf657330))
  :named haseqTm_refine_ae880c61bd89ebe8bd4cc06ccf657330))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt128.shift_right_small; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(789,61-789,62); use=FStar.UInt128.fst(789,61-789,62)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt128.t Dummy_value))
      ;; def=FStar.UInt128.fst(791,21-791,48); use=FStar.UInt128.fst(791,21-791,48)
      (=
       (FStar.UInt128.v @x1)
       (Prims.op_Division (FStar.UInt128.v @x2) (Prims.pow2 (FStar.UInt32.v @x3))))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330))
  :named refinement_interpretation_Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330))
; refinement kinding
;;; Fact-ids: Name FStar.UInt128.shift_right_small; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(789,61-789,62); use=FStar.UInt128.fst(789,61-789,62)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330))
  :named refinement_kinding_Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330))
; free var typing
;;; Fact-ids: Name FStar.UInt.lt; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(169,4-169,6); use=FStar.UInt.fsti(169,4-169,6)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.nat)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.lt @x0 @x1 @x2) Prims.bool))
    :pattern ((FStar.UInt.lt @x0 @x1 @x2))
    :qid typing_FStar.UInt.lt))
  :named typing_FStar.UInt.lt))
; free var typing
;;; Fact-ids: Name FStar.UInt128.shift_right_large; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(804,4-804,21); use=FStar.UInt128.fst(804,4-804,21)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt128.t Dummy_value))
      (HasType @x1 Tm_refine_a2a071dd127b029ef35393f42269ee33))
     (HasType
      (FStar.UInt128.shift_right_large @x0 @x1)
      (Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330 @x0 @x1)))
    :pattern ((FStar.UInt128.shift_right_large @x0 @x1))
    :qid typing_FStar.UInt128.shift_right_large))
  :named typing_FStar.UInt128.shift_right_large))
; free var typing
;;; Fact-ids: Name FStar.UInt128.shift_right_small; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(789,4-789,21); use=FStar.UInt128.fst(789,4-789,21)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt128.t Dummy_value))
      (HasType @x1 Tm_refine_c7f8db3067cf5005a8929a372c0e9e9d))
     (HasType
      (FStar.UInt128.shift_right_small @x0 @x1)
      (Tm_refine_ae880c61bd89ebe8bd4cc06ccf657330 @x0 @x1)))
    :pattern ((FStar.UInt128.shift_right_small @x0 @x1))
    :qid typing_FStar.UInt128.shift_right_small))
  :named typing_FStar.UInt128.shift_right_small))
; free var typing
;;; Fact-ids: Name FStar.UInt32.lt; Namespace FStar.UInt32
(assert
 (! ;; def=FStar.UInt32.fsti(246,4-246,6); use=FStar.UInt32.fsti(246,4-246,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt32.t Dummy_value)) (HasType @x1 (FStar.UInt32.t Dummy_value)))
     (HasType (FStar.UInt32.lt @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt32.lt @x0 @x1))
    :qid typing_FStar.UInt32.lt))
  :named typing_FStar.UInt32.lt))
(push) ;; push{1
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
(declare-fun Tm_refine_a3347afabe0e4a76525639a139c42aca (Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=FStar.UInt128.fst(819,2-821,30)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_a3347afabe0e4a76525639a139c42aca @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_a3347afabe0e4a76525639a139c42aca @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_a3347afabe0e4a76525639a139c42aca))
  :named refinement_kinding_Tm_refine_a3347afabe0e4a76525639a139c42aca))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=FStar.UInt128.fst(819,2-821,30)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_a3347afabe0e4a76525639a139c42aca @x2))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt128.t Dummy_value))
      ;; def=FStar.UInt128.fst(817,12-817,27); use=FStar.UInt128.fst(819,2-821,30)
      (< (BoxInt_proj_0 (FStar.UInt32.v @x2)) (BoxInt_proj_0 (BoxInt 128)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_a3347afabe0e4a76525639a139c42aca @x2)))
    :qid refinement_interpretation_Tm_refine_a3347afabe0e4a76525639a139c42aca))
  :named refinement_interpretation_Tm_refine_a3347afabe0e4a76525639a139c42aca))
; haseq for Tm_refine_a3347afabe0e4a76525639a139c42aca
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=FStar.UInt128.fst(819,2-821,30)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_a3347afabe0e4a76525639a139c42aca @x0)))
     (Valid (Prims.hasEq U_zero (FStar.UInt128.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_a3347afabe0e4a76525639a139c42aca @x0))))
    :qid haseqTm_refine_a3347afabe0e4a76525639a139c42aca))
  :named haseqTm_refine_a3347afabe0e4a76525639a139c42aca))
; Encoding query formula : forall (a: FStar.UInt128.t) (s: FStar.UInt32.t).
;   (forall (r: _: FStar.UInt128.t{FStar.UInt32.v s < 128}).
;       (* - Could not prove post-condition *)
;       (FStar.UInt.size (FStar.UInt32.v s) 32 ==> FStar.UInt32.v s >= 0) /\
;       (forall (return_val: Prims.nat).
;           return_val == FStar.UInt32.v s ==>
;           (forall (any_result: Prims.pos).
;               Prims.pow2 (FStar.UInt32.v s) == any_result ==>
;               Prims.pow2 (FStar.UInt32.v s) > 0 ==> Prims.pow2 (FStar.UInt32.v s) <> 0))) /\
;   (forall (p: Prims.pure_post FStar.UInt128.t).
;       FStar.UInt32.v s < 128 /\
;       (forall (pure_result: FStar.UInt128.t).
;           FStar.UInt128.v pure_result == FStar.UInt128.v a / Prims.pow2 (FStar.UInt32.v s) ==>
;           p pure_result) ==>
;       (forall (k: Prims.pure_post FStar.UInt128.t).
;           (forall (x: FStar.UInt128.t). {:pattern Prims.guard_free (k x)}
;               (x ==
;                 (match FStar.UInt32.lt s FStar.UInt128.u32_64 with
;                   | true -> FStar.UInt128.shift_right_small a s
;                   | _ -> FStar.UInt128.shift_right_large a s) ==>
;                 (forall (return_val: FStar.UInt128.t). return_val == x ==> p return_val)) ==>
;               k x) ==>
;           (FStar.UInt32.lt s FStar.UInt128.u32_64 == true ==>
;             FStar.UInt32.v s < 64 /\
;             (forall (any_result: FStar.UInt32.t).
;                 s == any_result ==>
;                 (forall (pure_result: FStar.UInt128.t).
;                     FStar.UInt128.v pure_result == FStar.UInt128.v a / Prims.pow2 (FStar.UInt32.v s) ==>
;                     k pure_result))) /\
;           (~(FStar.UInt32.lt s FStar.UInt128.u32_64 = true) ==>
;             (forall (b: Prims.bool).
;                 FStar.UInt32.lt s FStar.UInt128.u32_64 == b ==>
;                 FStar.UInt32.v s >= 64 /\ FStar.UInt32.v s < 128 /\
;                 (forall (any_result: FStar.UInt32.t).
;                     s == any_result ==>
;                     (forall (pure_result: FStar.UInt128.t).
;                         FStar.UInt128.v pure_result ==
;                         FStar.UInt128.v a / Prims.pow2 (FStar.UInt32.v s) ==>
;                         k pure_result)))))) /\
;   (forall (p: Prims.pure_post FStar.UInt128.t).
;       FStar.UInt32.v s < FStar.UInt128.n /\
;       (forall (pure_result: FStar.UInt128.t).
;           FStar.UInt128.v pure_result = FStar.UInt128.v a / Prims.pow2 (FStar.UInt32.v s) ==>
;           p pure_result) ==>
;       FStar.UInt32.v s < 128 /\
;       (forall (pure_result: FStar.UInt128.t).
;           FStar.UInt128.v pure_result == FStar.UInt128.v a / Prims.pow2 (FStar.UInt32.v s) ==>
;           pure_result ==
;           (match FStar.UInt32.lt s FStar.UInt128.u32_64 with
;             | true -> FStar.UInt128.shift_right_small a s
;             | _ -> FStar.UInt128.shift_right_large a s) ==>
;           (forall (return_val: FStar.UInt128.t). return_val == pure_result ==> p return_val)))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let shift_right’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt32.t Dummy_value)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.UInt128.fst(819,2-821,30); use=FStar.UInt128.fst(819,2-821,30)
       (forall ((@x2 Term))
        (! (implies
          (HasType @x2 (Tm_refine_a3347afabe0e4a76525639a139c42aca @x1))
          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(819,2-821,30)
          (and
           (implies
            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(819,2-821,30)
            (Valid
             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(819,2-821,30)
             (FStar.UInt.size (FStar.UInt32.v @x1) (BoxInt 32)))
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(818,39-818,48)
            (or
             label_1
             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(819,2-821,30)
             (>= (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 0)))))
           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(819,2-821,30)
           (forall ((@x3 Term))
            (! (implies
              (and
               (HasType @x3 Prims.nat)
               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(819,2-821,30)
               (= @x3 (FStar.UInt32.v @x1)))
              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(819,2-821,30)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  (HasType @x4 Prims.pos)
                  ;; def=Prims.fst(665,24-665,31); use=FStar.UInt128.fst(819,2-821,30)
                  (= (Prims.pow2 (FStar.UInt32.v @x1)) @x4)
                  ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(819,2-821,30)
                  (> (BoxInt_proj_0 (Prims.pow2 (FStar.UInt32.v @x1))) (BoxInt_proj_0 (BoxInt 0))))
                 ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(818,34-818,48)
                 (or
                  label_2
                  ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(819,2-821,30)
                  (not (= (Prims.pow2 (FStar.UInt32.v @x1)) (BoxInt 0)))))
                :qid @query.3)))
             :qid @query.2))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
           ;; def=FStar.UInt128.fst(817,12-817,27); use=FStar.UInt128.fst(819,2-821,30)
           (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 128)))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(819,2-821,30)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_3 (HasType @x3 (FStar.UInt128.t Dummy_value)))
               ;; def=FStar.UInt128.fst(818,21-818,48); use=FStar.UInt128.fst(819,2-821,30)
               (or
                label_4
                ;; def=FStar.UInt128.fst(818,21-818,48); use=FStar.UInt128.fst(819,2-821,30)
                (=
                 (FStar.UInt128.v @x3)
                 (Prims.op_Division (FStar.UInt128.v @x0) (Prims.pow2 (FStar.UInt32.v @x1))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(819,2-821,30)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(819,2-821,30)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(819,2-821,30)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(819,2-821,30)
                (ApplyTT @x2 @x3)))
             :qid @query.5)))
          ;; def=Prims.fst(368,4-368,99); use=FStar.UInt128.fst(819,2-821,30)
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
              ;; def=Prims.fst(368,4-368,99); use=FStar.UInt128.fst(819,2-821,30)
              (forall ((@x4 Term))
               (! (implies
                 (implies
                  ;; def=FStar.UInt128.fst(816,41-821,30); use=FStar.UInt128.fst(819,2-821,30)
                  (=
                   @x4
                   (let ((@lb5 (FStar.UInt32.lt @x1 (FStar.UInt128.u32_64 Dummy_value))))
                    (ite
                     (= @lb5 (BoxBool true))
                     (FStar.UInt128.shift_right_small @x0 @x1)
                     (FStar.UInt128.shift_right_large @x0 @x1))))
                  ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
                  (forall ((@x5 Term))
                   (! (implies
                     (and
                      (HasType @x5 (FStar.UInt128.t Dummy_value))
                      ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                      (= @x5 @x4))
                     ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                     (Valid
                      ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                      (ApplyTT @x2 @x5)))
                    :qid @query.8)))
                 ;; def=Prims.fst(368,86-368,89); use=FStar.UInt128.fst(819,2-821,30)
                 (Valid
                  ;; def=Prims.fst(368,86-368,89); use=FStar.UInt128.fst(819,2-821,30)
                  (ApplyTT @x3 @x4)))
                :weight 0
                :pattern ((ApplyTT @x3 @x4))
                :qid @query.7)))
             ;; def=Prims.fst(355,2-355,39); use=FStar.UInt128.fst(819,2-821,30)
             (and
              (implies
               ;; def=FStar.UInt128.fst(819,5-819,20); use=FStar.UInt128.fst(819,5-819,20)
               (= (FStar.UInt32.lt @x1 (FStar.UInt128.u32_64 Dummy_value)) (BoxBool true))
               ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(819,2-821,30)
               (and
                ;; def=FStar.UInt128.fst(789,39-789,51); use=FStar.UInt128.fst(820,29-820,30)
                (or
                 label_5
                 ;; def=FStar.UInt128.fst(789,39-789,51); use=FStar.UInt128.fst(820,29-820,30)
                 (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 64))))
                ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(819,2-821,30)
                (forall ((@x4 Term))
                 (! (implies
                   (and
                    (HasType @x4 (FStar.UInt32.t Dummy_value))
                    ;; def=FStar.UInt128.fst(789,30-816,25); use=FStar.UInt128.fst(819,2-821,30)
                    (= @x1 @x4))
                   ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(820,9-820,26)
                   (forall ((@x5 Term))
                    (! (implies
                      (and
                       (HasType @x5 (FStar.UInt128.t Dummy_value))
                       ;; def=FStar.UInt128.fst(791,21-791,48); use=FStar.UInt128.fst(820,9-820,26)
                       (=
                        (FStar.UInt128.v @x5)
                        (Prims.op_Division (FStar.UInt128.v @x0) (Prims.pow2 (FStar.UInt32.v @x1)))))
                      ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(820,9-820,26)
                      (Valid
                       ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(820,9-820,26)
                       (ApplyTT @x3 @x5)))
                     :qid @query.10)))
                  :qid @query.9))))
              (implies
               ;; def=Prims.fst(355,19-355,21); use=FStar.UInt128.fst(819,2-821,30)
               (not
                ;; def=FStar.UInt128.fst(819,5-819,20); use=FStar.UInt128.fst(819,5-819,20)
                (= (FStar.UInt32.lt @x1 (FStar.UInt128.u32_64 Dummy_value)) (BoxBool true)))
               ;; def=Prims.fst(381,28-381,49); use=FStar.UInt128.fst(819,2-821,30)
               (forall ((@x4 Term))
                (! (implies
                  (and
                   (HasType @x4 Prims.bool)
                   ;; def=FStar.UInt128.fst(819,5-821,30); use=FStar.UInt128.fst(819,5-821,30)
                   (= (FStar.UInt32.lt @x1 (FStar.UInt128.u32_64 Dummy_value)) @x4))
                  ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(819,2-821,30)
                  (and
                   ;; def=FStar.UInt128.fst(804,39-804,52); use=FStar.UInt128.fst(821,29-821,30)
                   (or
                    label_6
                    ;; def=FStar.UInt128.fst(804,39-804,52); use=FStar.UInt128.fst(821,29-821,30)
                    (>= (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 64))))
                   ;; def=FStar.UInt128.fst(804,56-804,69); use=FStar.UInt128.fst(821,29-821,30)
                   (or
                    label_7
                    ;; def=FStar.UInt128.fst(804,56-804,69); use=FStar.UInt128.fst(821,29-821,30)
                    (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 128))))
                   ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(819,2-821,30)
                   (forall ((@x5 Term))
                    (! (implies
                      (and
                       (HasType @x5 (FStar.UInt32.t Dummy_value))
                       ;; def=FStar.UInt128.fst(804,30-816,25); use=FStar.UInt128.fst(819,2-821,30)
                       (= @x1 @x5))
                      ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(821,9-821,26)
                      (forall ((@x6 Term))
                       (! (implies
                         (and
                          (HasType @x6 (FStar.UInt128.t Dummy_value))
                          ;; def=FStar.UInt128.fst(806,21-806,48); use=FStar.UInt128.fst(821,9-821,26)
                          (=
                           (FStar.UInt128.v @x6)
                           (Prims.op_Division
                            (FStar.UInt128.v @x0)
                            (Prims.pow2 (FStar.UInt32.v @x1)))))
                         ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(821,9-821,26)
                         (Valid
                          ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(821,9-821,26)
                          (ApplyTT @x3 @x6)))
                        :qid @query.13)))
                     :qid @query.12))))
                 :qid @query.11)))))
            :qid @query.6)))
         :qid @query.4))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
           ;; def=FStar.UInt128.fsti(102,12-102,25); use=FStar.UInt128.fst(819,2-821,30)
           (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(819,2-821,30)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_8 (HasType @x3 (FStar.UInt128.t Dummy_value)))
               ;; def=FStar.UInt128.fsti(103,21-103,54); use=FStar.UInt128.fst(819,2-821,30)
               (or
                label_9
                ;; def=FStar.UInt128.fsti(103,21-103,54); use=FStar.UInt128.fst(819,2-821,30)
                (=
                 (FStar.UInt128.v @x3)
                 (Prims.op_Division (FStar.UInt128.v @x0) (Prims.pow2 (FStar.UInt32.v @x1))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(819,2-821,30)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(819,2-821,30)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(819,2-821,30)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(819,2-821,30)
                (ApplyTT @x2 @x3)))
             :qid @query.15)))
          ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(819,2-821,30)
          (and
           ;; def=FStar.UInt128.fst(817,12-817,27); use=FStar.UInt128.fst(819,2-821,30)
           (or
            label_10
            ;; def=FStar.UInt128.fst(817,12-817,27); use=FStar.UInt128.fst(819,2-821,30)
            (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 128))))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(819,2-821,30)
           (forall ((@x3 Term))
            (! (implies
              (and
               (HasType @x3 (FStar.UInt128.t Dummy_value))
               ;; def=FStar.UInt128.fst(818,21-818,48); use=FStar.UInt128.fst(819,2-821,30)
               (=
                (FStar.UInt128.v @x3)
                (Prims.op_Division (FStar.UInt128.v @x0) (Prims.pow2 (FStar.UInt32.v @x1))))
               ;; def=FStar.UInt128.fst(819,2-821,30); use=FStar.UInt128.fst(819,2-821,30)
               (=
                @x3
                (let ((@lb4 (FStar.UInt32.lt @x1 (FStar.UInt128.u32_64 Dummy_value))))
                 (ite
                  (= @lb4 (BoxBool true))
                  (FStar.UInt128.shift_right_small @x0 @x1)
                  (FStar.UInt128.shift_right_large @x0 @x1)))))
              ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  (HasType @x4 (FStar.UInt128.t Dummy_value))
                  ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                  (= @x4 @x3))
                 ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                 (Valid
                  ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                  (ApplyTT @x2 @x4)))
                :qid @query.17)))
             :qid @query.16))))
         :qid @query.14))))
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
(echo "label_9")
(echo "label_8")
(echo "label_7")
(echo "label_6")
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.shift_right, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t) (r: Prims.bool).
;   (* - Could not prove post-condition *) FStar.UInt128.n >= 0
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.eq’
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
   ;; def=FStar.UInt128.fsti(107,0-109,45); use=FStar.UInt128.fsti(107,0-109,45)
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 (FStar.UInt128.t Dummy_value))
       (HasType @x2 Prims.bool))
      ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(109,30-109,31)
      (or
       label_1
       ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(107,10-107,30)
       (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0)))))
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
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.eq, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt64.eq (Term Term) Term)
; Equation for FStar.UInt64.eq
;;; Fact-ids: Name FStar.UInt64.eq; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(234,4-234,6); use=FStar.UInt64.fsti(234,4-234,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt64.eq @x0 @x1)
     (FStar.UInt.eq (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt64.v @x1)))
    :pattern ((FStar.UInt64.eq @x0 @x1))
    :qid equation_FStar.UInt64.eq))
  :named equation_FStar.UInt64.eq))
; free var typing
;;; Fact-ids: Name FStar.UInt64.eq; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(234,4-234,6); use=FStar.UInt64.fsti(234,4-234,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.eq @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt64.eq @x0 @x1))
    :qid typing_FStar.UInt64.eq))
  :named typing_FStar.UInt64.eq))
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.bool).
;     (forall (pure_result: Prims.bool).
;         pure_result == FStar.UInt.eq (FStar.UInt128.v a) (FStar.UInt128.v b) ==> p pure_result) ==>
;     (forall (return_val: Prims.bool).
;         return_val == (FStar.UInt64.eq a.low b.low && FStar.UInt64.eq a.high b.high) ==>
;         p return_val)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let eq’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.bool))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(823,17-823,59)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.bool))
              ;; def=FStar.UInt128.fsti(109,21-109,43); use=FStar.UInt128.fst(823,17-823,59)
              (or
               label_2
               ;; def=FStar.UInt128.fsti(109,21-109,43); use=FStar.UInt128.fst(823,17-823,59)
               (=
                @x3
                (FStar.UInt.eq
                 (FStar.UInt128.n Dummy_value)
                 (FStar.UInt128.v @x0)
                 (FStar.UInt128.v @x1)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(823,17-823,59)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(823,17-823,59)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(823,17-823,59)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(823,17-823,59)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.bool)
             ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
             (=
              @x3
              (Prims.op_AmpAmp
               (FStar.UInt64.eq
                (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                (FStar.UInt128.__proj__Mkuint128__item__low @x1))
               (FStar.UInt64.eq
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1)))))
            ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
            (Valid
             ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.eq, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t) (r: Prims.bool).
;   (* - Could not prove post-condition *) FStar.UInt128.n >= 0
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.gt’
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
   ;; def=FStar.UInt128.fsti(111,0-113,45); use=FStar.UInt128.fsti(111,0-113,45)
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 (FStar.UInt128.t Dummy_value))
       (HasType @x2 Prims.bool))
      ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(113,30-113,31)
      (or
       label_1
       ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(111,10-111,30)
       (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0)))))
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
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.gt, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt.gt (Term Term Term) Term)
(declare-fun FStar.UInt64.gt (Term Term) Term)
(declare-fun Prims.op_BarBar (Term Term) Term)
(declare-fun Prims.op_GreaterThan (Term Term) Term)
; Equation for FStar.UInt.gt
;;; Fact-ids: Name FStar.UInt.gt; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(167,4-167,6); use=FStar.UInt.fsti(167,4-167,6)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (FStar.UInt.gt @x0 @x1 @x2) (Prims.op_GreaterThan @x1 @x2))
    :pattern ((FStar.UInt.gt @x0 @x1 @x2))
    :qid equation_FStar.UInt.gt))
  :named equation_FStar.UInt.gt))
; Equation for FStar.UInt64.gt
;;; Fact-ids: Name FStar.UInt64.gt; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(240,4-240,6); use=FStar.UInt64.fsti(240,4-240,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt64.gt @x0 @x1)
     (FStar.UInt.gt (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt64.v @x1)))
    :pattern ((FStar.UInt64.gt @x0 @x1))
    :qid equation_FStar.UInt64.gt))
  :named equation_FStar.UInt64.gt))
;;; Fact-ids: Name Prims.op_BarBar; Namespace Prims
(assert
 (! ;; def=Prims.fst(496,4-496,13); use=Prims.fst(496,4-496,13)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_BarBar @x0 @x1) (BoxBool (or (BoxBool_proj_0 @x0) (BoxBool_proj_0 @x1))))
    :pattern ((Prims.op_BarBar @x0 @x1))
    :qid primitive_Prims.op_BarBar))
  :named primitive_Prims.op_BarBar))
;;; Fact-ids: Name Prims.op_GreaterThan; Namespace Prims
(assert
 (! ;; def=Prims.fst(538,4-538,18); use=Prims.fst(538,4-538,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_GreaterThan @x0 @x1) (BoxBool (> (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_GreaterThan @x0 @x1))
    :qid primitive_Prims.op_GreaterThan))
  :named primitive_Prims.op_GreaterThan))
; free var typing
;;; Fact-ids: Name FStar.UInt.gt; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(167,4-167,6); use=FStar.UInt.fsti(167,4-167,6)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.nat)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.gt @x0 @x1 @x2) Prims.bool))
    :pattern ((FStar.UInt.gt @x0 @x1 @x2))
    :qid typing_FStar.UInt.gt))
  :named typing_FStar.UInt.gt))
; free var typing
;;; Fact-ids: Name FStar.UInt64.gt; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(240,4-240,6); use=FStar.UInt64.fsti(240,4-240,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.gt @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt64.gt @x0 @x1))
    :qid typing_FStar.UInt64.gt))
  :named typing_FStar.UInt64.gt))
; free var typing
;;; Fact-ids: Name Prims.op_BarBar; Namespace Prims
(assert
 (! ;; def=Prims.fst(496,4-496,13); use=Prims.fst(496,4-496,13)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.bool) (HasType @x1 Prims.bool))
     (HasType (Prims.op_BarBar @x0 @x1) Prims.bool))
    :pattern ((Prims.op_BarBar @x0 @x1))
    :qid typing_Prims.op_BarBar))
  :named typing_Prims.op_BarBar))
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
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.bool).
;     (forall (pure_result: Prims.bool).
;         pure_result == FStar.UInt.gt (FStar.UInt128.v a) (FStar.UInt128.v b) ==> p pure_result) ==>
;     (forall (return_val: Prims.bool).
;         return_val ==
;         (FStar.UInt64.gt a.high b.high ||
;         FStar.UInt64.eq a.high b.high && FStar.UInt64.gt a.low b.low) ==>
;         p return_val)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let gt’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.bool))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(824,17-825,60)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.bool))
              ;; def=FStar.UInt128.fsti(113,21-113,43); use=FStar.UInt128.fst(824,17-825,60)
              (or
               label_2
               ;; def=FStar.UInt128.fsti(113,21-113,43); use=FStar.UInt128.fst(824,17-825,60)
               (=
                @x3
                (FStar.UInt.gt
                 (FStar.UInt128.n Dummy_value)
                 (FStar.UInt128.v @x0)
                 (FStar.UInt128.v @x1)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(824,17-825,60)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(824,17-825,60)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(824,17-825,60)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(824,17-825,60)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.bool)
             ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
             (=
              @x3
              (Prims.op_BarBar
               (FStar.UInt64.gt
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1))
               (Prims.op_AmpAmp
                (FStar.UInt64.eq
                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                (FStar.UInt64.gt
                 (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))
            ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
            (Valid
             ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.gt, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t) (r: Prims.bool).
;   (* - Could not prove post-condition *) FStar.UInt128.n >= 0
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.lt’
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
   ;; def=FStar.UInt128.fsti(115,0-117,45); use=FStar.UInt128.fsti(115,0-117,45)
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 (FStar.UInt128.t Dummy_value))
       (HasType @x2 Prims.bool))
      ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(117,30-117,31)
      (or
       label_1
       ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(115,10-115,30)
       (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0)))))
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
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.lt, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt64.lt (Term Term) Term)
; Equation for FStar.UInt64.lt
;;; Fact-ids: Name FStar.UInt64.lt; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(246,4-246,6); use=FStar.UInt64.fsti(246,4-246,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt64.lt @x0 @x1)
     (FStar.UInt.lt (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt64.v @x1)))
    :pattern ((FStar.UInt64.lt @x0 @x1))
    :qid equation_FStar.UInt64.lt))
  :named equation_FStar.UInt64.lt))
; free var typing
;;; Fact-ids: Name FStar.UInt64.lt; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(246,4-246,6); use=FStar.UInt64.fsti(246,4-246,6)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.lt @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt64.lt @x0 @x1))
    :qid typing_FStar.UInt64.lt))
  :named typing_FStar.UInt64.lt))
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.bool).
;     (forall (pure_result: Prims.bool).
;         pure_result == FStar.UInt.lt (FStar.UInt128.v a) (FStar.UInt128.v b) ==> p pure_result) ==>
;     (forall (return_val: Prims.bool).
;         return_val ==
;         (FStar.UInt64.lt a.high b.high ||
;         FStar.UInt64.eq a.high b.high && FStar.UInt64.lt a.low b.low) ==>
;         p return_val)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let lt’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.bool))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(826,17-827,60)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.bool))
              ;; def=FStar.UInt128.fsti(117,21-117,43); use=FStar.UInt128.fst(826,17-827,60)
              (or
               label_2
               ;; def=FStar.UInt128.fsti(117,21-117,43); use=FStar.UInt128.fst(826,17-827,60)
               (=
                @x3
                (FStar.UInt.lt
                 (FStar.UInt128.n Dummy_value)
                 (FStar.UInt128.v @x0)
                 (FStar.UInt128.v @x1)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(826,17-827,60)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(826,17-827,60)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(826,17-827,60)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(826,17-827,60)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.bool)
             ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
             (=
              @x3
              (Prims.op_BarBar
               (FStar.UInt64.lt
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1))
               (Prims.op_AmpAmp
                (FStar.UInt64.eq
                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                (FStar.UInt64.lt
                 (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))
            ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
            (Valid
             ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.lt, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t) (r: Prims.bool).
;   (* - Could not prove post-condition *) FStar.UInt128.n >= 0
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.gte’
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
   ;; def=FStar.UInt128.fsti(119,0-121,46); use=FStar.UInt128.fsti(119,0-121,46)
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 (FStar.UInt128.t Dummy_value))
       (HasType @x2 Prims.bool))
      ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(121,31-121,32)
      (or
       label_1
       ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(119,11-119,31)
       (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0)))))
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
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.gte, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt.gte (Term Term Term) Term)
(declare-fun FStar.UInt64.gte (Term Term) Term)
; Equation for FStar.UInt.gte
;;; Fact-ids: Name FStar.UInt.gte; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(168,4-168,7); use=FStar.UInt.fsti(168,4-168,7)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (FStar.UInt.gte @x0 @x1 @x2) (Prims.op_GreaterThanOrEqual @x1 @x2))
    :pattern ((FStar.UInt.gte @x0 @x1 @x2))
    :qid equation_FStar.UInt.gte))
  :named equation_FStar.UInt.gte))
; Equation for FStar.UInt64.gte
;;; Fact-ids: Name FStar.UInt64.gte; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(243,4-243,7); use=FStar.UInt64.fsti(243,4-243,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt64.gte @x0 @x1)
     (FStar.UInt.gte (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt64.v @x1)))
    :pattern ((FStar.UInt64.gte @x0 @x1))
    :qid equation_FStar.UInt64.gte))
  :named equation_FStar.UInt64.gte))
; free var typing
;;; Fact-ids: Name FStar.UInt.gte; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(168,4-168,7); use=FStar.UInt.fsti(168,4-168,7)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.nat)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.gte @x0 @x1 @x2) Prims.bool))
    :pattern ((FStar.UInt.gte @x0 @x1 @x2))
    :qid typing_FStar.UInt.gte))
  :named typing_FStar.UInt.gte))
; free var typing
;;; Fact-ids: Name FStar.UInt64.gte; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(243,4-243,7); use=FStar.UInt64.fsti(243,4-243,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.gte @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt64.gte @x0 @x1))
    :qid typing_FStar.UInt64.gte))
  :named typing_FStar.UInt64.gte))
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.bool).
;     (forall (pure_result: Prims.bool).
;         pure_result == FStar.UInt.gte (FStar.UInt128.v a) (FStar.UInt128.v b) ==> p pure_result) ==>
;     (forall (return_val: Prims.bool).
;         return_val ==
;         (FStar.UInt64.gt a.high b.high ||
;         FStar.UInt64.eq a.high b.high && FStar.UInt64.gte a.low b.low) ==>
;         p return_val)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let gte’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.bool))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(828,18-829,62)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.bool))
              ;; def=FStar.UInt128.fsti(121,21-121,44); use=FStar.UInt128.fst(828,18-829,62)
              (or
               label_2
               ;; def=FStar.UInt128.fsti(121,21-121,44); use=FStar.UInt128.fst(828,18-829,62)
               (=
                @x3
                (FStar.UInt.gte
                 (FStar.UInt128.n Dummy_value)
                 (FStar.UInt128.v @x0)
                 (FStar.UInt128.v @x1)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(828,18-829,62)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(828,18-829,62)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(828,18-829,62)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(828,18-829,62)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.bool)
             ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
             (=
              @x3
              (Prims.op_BarBar
               (FStar.UInt64.gt
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1))
               (Prims.op_AmpAmp
                (FStar.UInt64.eq
                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                (FStar.UInt64.gte
                 (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))
            ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
            (Valid
             ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.gte, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t) (r: Prims.bool).
;   (* - Could not prove post-condition *) FStar.UInt128.n >= 0
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.lte’
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
   ;; def=FStar.UInt128.fsti(123,0-125,46); use=FStar.UInt128.fsti(123,0-125,46)
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 (FStar.UInt128.t Dummy_value))
       (HasType @x1 (FStar.UInt128.t Dummy_value))
       (HasType @x2 Prims.bool))
      ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(125,31-125,32)
      (or
       label_1
       ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(123,11-123,31)
       (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0)))))
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
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.lte, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt.lte (Term Term Term) Term)
(declare-fun FStar.UInt64.lte (Term Term) Term)
; Equation for FStar.UInt.lte
;;; Fact-ids: Name FStar.UInt.lte; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(170,4-170,7); use=FStar.UInt.fsti(170,4-170,7)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (FStar.UInt.lte @x0 @x1 @x2) (Prims.op_LessThanOrEqual @x1 @x2))
    :pattern ((FStar.UInt.lte @x0 @x1 @x2))
    :qid equation_FStar.UInt.lte))
  :named equation_FStar.UInt.lte))
; Equation for FStar.UInt64.lte
;;; Fact-ids: Name FStar.UInt64.lte; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(249,4-249,7); use=FStar.UInt64.fsti(249,4-249,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt64.lte @x0 @x1)
     (FStar.UInt.lte (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt64.v @x1)))
    :pattern ((FStar.UInt64.lte @x0 @x1))
    :qid equation_FStar.UInt64.lte))
  :named equation_FStar.UInt64.lte))
; free var typing
;;; Fact-ids: Name FStar.UInt.lte; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(170,4-170,7); use=FStar.UInt.fsti(170,4-170,7)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.nat)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.lte @x0 @x1 @x2) Prims.bool))
    :pattern ((FStar.UInt.lte @x0 @x1 @x2))
    :qid typing_FStar.UInt.lte))
  :named typing_FStar.UInt.lte))
; free var typing
;;; Fact-ids: Name FStar.UInt64.lte; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(249,4-249,7); use=FStar.UInt64.fsti(249,4-249,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.lte @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt64.lte @x0 @x1))
    :qid typing_FStar.UInt64.lte))
  :named typing_FStar.UInt64.lte))
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.bool).
;     (forall (pure_result: Prims.bool).
;         pure_result == FStar.UInt.lte (FStar.UInt128.v a) (FStar.UInt128.v b) ==> p pure_result) ==>
;     (forall (return_val: Prims.bool).
;         return_val ==
;         (FStar.UInt64.lt a.high b.high ||
;         FStar.UInt64.eq a.high b.high && FStar.UInt64.lte a.low b.low) ==>
;         p return_val)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let lte’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.bool))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(830,18-831,62)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.bool))
              ;; def=FStar.UInt128.fsti(125,21-125,44); use=FStar.UInt128.fst(830,18-831,62)
              (or
               label_2
               ;; def=FStar.UInt128.fsti(125,21-125,44); use=FStar.UInt128.fst(830,18-831,62)
               (=
                @x3
                (FStar.UInt.lte
                 (FStar.UInt128.n Dummy_value)
                 (FStar.UInt128.v @x0)
                 (FStar.UInt128.v @x1)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(830,18-831,62)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(830,18-831,62)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(830,18-831,62)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(830,18-831,62)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.bool)
             ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
             (=
              @x3
              (Prims.op_BarBar
               (FStar.UInt64.lt
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1))
               (Prims.op_AmpAmp
                (FStar.UInt64.eq
                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                (FStar.UInt64.lte
                 (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))
            ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
            (Valid
             ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.lte, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.BitVector.logand_vec (Term Term Term) Term)
; Fuel-instrumented function name
(declare-fun FStar.BitVector.logand_vec.fuel_instrumented (Fuel Term Term Term) Term)
(declare-fun FStar.UInt.logand (Term Term Term) Term)
(declare-fun FStar.UInt64.logand (Term Term) Term)
(declare-fun Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb (Term Term) Term)
; Correspondence of recursive function to instrumented version
;;; Fact-ids: Name FStar.BitVector.logand_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(45,8-45,18); use=FStar.BitVector.fsti(45,8-45,18)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.BitVector.logand_vec @x0 @x1 @x2)
     (FStar.BitVector.logand_vec.fuel_instrumented MaxFuel @x0 @x1 @x2))
    :pattern ((FStar.BitVector.logand_vec @x0 @x1 @x2))
    :qid @fuel_correspondence_FStar.BitVector.logand_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.BitVector.logand_vec.fuel_instrumented))
; Fuel irrelevance
;;; Fact-ids: Name FStar.BitVector.logand_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(45,8-45,18); use=FStar.BitVector.fsti(45,8-45,18)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.BitVector.logand_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3)
     (FStar.BitVector.logand_vec.fuel_instrumented ZFuel @x1 @x2 @x3))
    :pattern ((FStar.BitVector.logand_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3))
    :qid @fuel_irrelevance_FStar.BitVector.logand_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.BitVector.logand_vec.fuel_instrumented))
; Equation for FStar.UInt.logand
;;; Fact-ids: Name FStar.UInt.logand; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(299,4-299,10); use=FStar.UInt.fsti(299,4-299,10)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.logand @x0 @x1 @x2)
     (FStar.UInt.from_vec
      @x0
      (FStar.BitVector.logand_vec @x0 (FStar.UInt.to_vec @x0 @x1) (FStar.UInt.to_vec @x0 @x2))))
    :pattern ((FStar.UInt.logand @x0 @x1 @x2))
    :qid equation_FStar.UInt.logand))
  :named equation_FStar.UInt.logand))
; Equation for fuel-instrumented recursive function: FStar.BitVector.logand_vec
;;; Fact-ids: Name FStar.BitVector.logand_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(45,8-45,18); use=FStar.BitVector.fsti(45,8-45,18)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 Prims.pos)
      (HasType @x2 (FStar.BitVector.bv_t @x1))
      (HasType @x3 (FStar.BitVector.bv_t @x1)))
     (=
      (FStar.BitVector.logand_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3)
      (let ((@lb4 (Prims.op_Equality Prims.int @x1 (BoxInt 1))))
       (ite
        (= @lb4 (BoxBool true))
        (FStar.Seq.Base.create
         U_zero
         Prims.bool
         (BoxInt 1)
         (Prims.op_AmpAmp
          (FStar.Seq.Base.index U_zero Prims.bool @x2 (BoxInt 0))
          (FStar.Seq.Base.index U_zero Prims.bool @x3 (BoxInt 0))))
        (FStar.Seq.Base.append
         U_zero
         Prims.bool
         (FStar.Seq.Base.create
          U_zero
          Prims.bool
          (BoxInt 1)
          (Prims.op_AmpAmp
           (FStar.Seq.Base.index U_zero Prims.bool @x2 (BoxInt 0))
           (FStar.Seq.Base.index U_zero Prims.bool @x3 (BoxInt 0))))
         (FStar.BitVector.logand_vec.fuel_instrumented
          @u0
          (Prims.op_Subtraction @x1 (BoxInt 1))
          (FStar.Seq.Base.slice U_zero Prims.bool @x2 (BoxInt 1) @x1)
          (FStar.Seq.Base.slice U_zero Prims.bool @x3 (BoxInt 1) @x1)))))))
    :weight 0
    :pattern ((FStar.BitVector.logand_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3))
    :qid equation_with_fuel_FStar.BitVector.logand_vec.fuel_instrumented))
  :named equation_with_fuel_FStar.BitVector.logand_vec.fuel_instrumented))
; haseq for Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb
;;; Fact-ids: Name FStar.UInt64.logand; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(185,30-185,31); use=FStar.UInt64.fsti(185,30-185,31)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb @x0 @x1))))
    :qid haseqTm_refine_4a73301fbc41c8e432f23b6aef69a5eb))
  :named haseqTm_refine_4a73301fbc41c8e432f23b6aef69a5eb))
; Lemma: FStar.BitVector.logand_vec_definition
;;; Fact-ids: Name FStar.BitVector.logand_vec_definition; Namespace FStar.BitVector
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (FStar.BitVector.bv_t @x0))
      (HasType @x3 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.BitVector.fsti(52,21-52,75); use=FStar.BitVector.fsti(52,21-52,75)
     (=
      (FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.BitVector.logand_vec.fuel_instrumented ZFuel @x0 @x1 @x2)
       @x3)
      (Prims.op_AmpAmp
       (FStar.Seq.Base.index U_zero Prims.bool @x1 @x3)
       (FStar.Seq.Base.index U_zero Prims.bool @x2 @x3))))
    :pattern
     ((FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.BitVector.logand_vec.fuel_instrumented ZFuel @x0 @x1 @x2)
       @x3))
    :qid lemma_FStar.BitVector.logand_vec_definition))
  :named lemma_FStar.BitVector.logand_vec_definition))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.logand; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(185,30-185,31); use=FStar.UInt64.fsti(185,30-185,31)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(187,21-187,43); use=FStar.UInt64.fsti(187,21-187,43)
      (=
       (FStar.UInt.logand (BoxInt 64) (FStar.UInt64.v @x2) (FStar.UInt64.v @x3))
       (FStar.UInt64.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb))
  :named refinement_interpretation_Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.logand; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(185,30-185,31); use=FStar.UInt64.fsti(185,30-185,31)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb))
  :named refinement_kinding_Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb))
; Typing correspondence of token to term
;;; Fact-ids: Name FStar.BitVector.logand_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(45,8-45,18); use=FStar.BitVector.fsti(45,8-45,18)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 Prims.pos)
      (HasType @x2 (FStar.BitVector.bv_t @x1))
      (HasType @x3 (FStar.BitVector.bv_t @x1)))
     (HasType
      (FStar.BitVector.logand_vec.fuel_instrumented @u0 @x1 @x2 @x3)
      (FStar.BitVector.bv_t @x1)))
    :pattern ((FStar.BitVector.logand_vec.fuel_instrumented @u0 @x1 @x2 @x3))
    :qid token_correspondence_FStar.BitVector.logand_vec.fuel_instrumented))
  :named token_correspondence_FStar.BitVector.logand_vec.fuel_instrumented))
; free var typing
;;; Fact-ids: Name FStar.BitVector.logand_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(45,8-45,18); use=FStar.BitVector.fsti(45,8-45,18)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (FStar.BitVector.bv_t @x0)))
     (HasType (FStar.BitVector.logand_vec @x0 @x1 @x2) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.logand_vec @x0 @x1 @x2))
    :qid typing_FStar.BitVector.logand_vec))
  :named typing_FStar.BitVector.logand_vec))
; free var typing
;;; Fact-ids: Name FStar.UInt.logand; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(299,4-299,10); use=FStar.UInt.fsti(299,4-299,10)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.logand @x0 @x1 @x2) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.logand @x0 @x1 @x2))
    :qid typing_FStar.UInt.logand))
  :named typing_FStar.UInt.logand))
; free var typing
;;; Fact-ids: Name FStar.UInt64.logand; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(185,4-185,10); use=FStar.UInt64.fsti(185,4-185,10)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.logand @x0 @x1) (Tm_refine_4a73301fbc41c8e432f23b6aef69a5eb @x0 @x1)))
    :pattern ((FStar.UInt64.logand @x0 @x1))
    :qid typing_FStar.UInt64.logand))
  :named typing_FStar.UInt64.logand))
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t) (b: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         FStar.UInt64.logand a b == FStar.UInt64.logand b a ==> p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         FStar.UInt.logand (FStar.UInt64.v a) (FStar.UInt64.v b) =
;         FStar.UInt.logand (FStar.UInt64.v b) (FStar.UInt64.v a) ==>
;         p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_logand_comm’
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
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(834,2-834,45)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              ;; def=FStar.UInt128.fst(833,40-833,74); use=FStar.UInt128.fst(834,2-834,45)
              (or
               label_2
               ;; def=FStar.UInt128.fst(833,40-833,74); use=FStar.UInt128.fst(834,2-834,45)
               (= (FStar.UInt64.logand @x0 @x1) (FStar.UInt64.logand @x1 @x0))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(834,2-834,45)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(834,2-834,45)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(834,2-834,45)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(834,2-834,45)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(834,2-834,45)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.unit)
             ;; def=FStar.UInt.fsti(341,33-341,64); use=FStar.UInt128.fst(834,7-834,25)
             (=
              (FStar.UInt.logand (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt64.v @x1))
              (FStar.UInt.logand (BoxInt 64) (FStar.UInt64.v @x1) (FStar.UInt64.v @x0))))
            ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(834,2-834,45)
            (Valid
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(834,2-834,45)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_logand_comm, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t) (b: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         (FStar.UInt64.v b = 0 ==> FStar.UInt64.v (FStar.UInt64.logand a b) = 0) ==> p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         FStar.UInt.logand (FStar.UInt64.v a) (FStar.UInt.zero 64) = FStar.UInt.zero 64 ==>
;         p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_and_0’
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
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(839,20-839,49)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              (implies
               ;; def=FStar.UInt128.fst(837,9-837,20); use=FStar.UInt128.fst(839,20-839,49)
               (= (FStar.UInt64.v @x1) (BoxInt 0))
               ;; def=FStar.UInt128.fst(837,25-837,51); use=FStar.UInt128.fst(839,20-839,49)
               (or
                label_2
                ;; def=FStar.UInt128.fst(837,25-837,51); use=FStar.UInt128.fst(839,20-839,49)
                (= (FStar.UInt64.v (FStar.UInt64.logand @x0 @x1)) (BoxInt 0)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(839,20-839,49)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(839,20-839,49)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(839,20-839,49)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(839,20-839,49)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(839,20-839,49)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.unit)
             ;; def=FStar.UInt.fsti(351,33-351,64); use=FStar.UInt128.fst(839,25-839,39)
             (=
              (FStar.UInt.logand (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt.zero (BoxInt 64)))
              (FStar.UInt.zero (BoxInt 64))))
            ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(839,20-839,49)
            (Valid
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(839,20-839,49)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_and_0, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
; Lemma: FStar.UInt128.u64_and_0
;;; Fact-ids: Name FStar.UInt128.u64_and_0; Namespace FStar.UInt128
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(837,9-837,20); use=FStar.UInt128.fst(839,4-839,13)
      (= (FStar.UInt64.v @x1) (BoxInt 0)))
     ;; def=FStar.UInt128.fst(837,25-837,51); use=FStar.UInt128.fst(839,4-839,13)
     (= (FStar.UInt64.v (FStar.UInt64.logand @x0 @x1)) (BoxInt 0)))
    :pattern ((FStar.UInt64.logand @x0 @x1))
    :qid lemma_FStar.UInt128.u64_and_0))
  :named lemma_FStar.UInt128.u64_and_0))
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t) (b: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         (FStar.UInt64.v a = 0 ==> FStar.UInt64.v (FStar.UInt64.logand a b) = 0) ==> p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         FStar.UInt64.logand a b == FStar.UInt64.logand b a ==> p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_0_and’
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
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(844,2-844,21)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              (implies
               ;; def=FStar.UInt128.fst(842,9-842,20); use=FStar.UInt128.fst(844,2-844,21)
               (= (FStar.UInt64.v @x0) (BoxInt 0))
               ;; def=FStar.UInt128.fst(842,25-842,51); use=FStar.UInt128.fst(844,2-844,21)
               (or
                label_2
                ;; def=FStar.UInt128.fst(842,25-842,51); use=FStar.UInt128.fst(844,2-844,21)
                (= (FStar.UInt64.v (FStar.UInt64.logand @x0 @x1)) (BoxInt 0)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(844,2-844,21)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(844,2-844,21)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(844,2-844,21)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(844,2-844,21)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(844,2-844,21)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.unit)
             ;; def=FStar.UInt128.fst(833,40-833,74); use=FStar.UInt128.fst(844,2-844,17)
             (= (FStar.UInt64.logand @x0 @x1) (FStar.UInt64.logand @x1 @x0)))
            ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(844,2-844,21)
            (Valid
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(844,2-844,21)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_0_and, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.BitVector.ones_vec (Term) Term)
(declare-fun FStar.UInt.ones (Term) Term)
; Equation for FStar.BitVector.ones_vec
;;; Fact-ids: Name FStar.BitVector.ones_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(42,4-42,12); use=FStar.BitVector.fsti(42,4-42,12)
  (forall ((@x0 Term))
   (! (= (FStar.BitVector.ones_vec @x0) (FStar.Seq.Base.create U_zero Prims.bool @x0 (BoxBool true)))
    :pattern ((FStar.BitVector.ones_vec @x0))
    :qid equation_FStar.BitVector.ones_vec))
  :named equation_FStar.BitVector.ones_vec))
; Equation for FStar.UInt.ones
;;; Fact-ids: Name FStar.UInt.ones; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(64,4-64,8); use=FStar.UInt.fsti(64,4-64,8)
  (forall ((@x0 Term))
   (! (= (FStar.UInt.ones @x0) (FStar.UInt.max_int @x0))
    :pattern ((FStar.UInt.ones @x0))
    :qid equation_FStar.UInt.ones))
  :named equation_FStar.UInt.ones))
; Lemma: FStar.UInt.ones_from_vec_lemma
;;; Fact-ids: Name FStar.UInt.ones_from_vec_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.pos)
     ;; def=FStar.UInt.fsti(265,33-265,64); use=FStar.UInt.fsti(265,33-265,64)
     (=
      (FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 (FStar.BitVector.ones_vec @x0))
      (FStar.UInt.ones @x0)))
    :pattern ((FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 (FStar.BitVector.ones_vec @x0)))
    :qid lemma_FStar.UInt.ones_from_vec_lemma))
  :named lemma_FStar.UInt.ones_from_vec_lemma))
; Lemma: FStar.UInt.ones_to_vec_lemma
;;; Fact-ids: Name FStar.UInt.ones_to_vec_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.UInt.fsti(261,17-261,66); use=FStar.UInt.fsti(261,17-261,66)
     (=
      (FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.UInt.to_vec.fuel_instrumented ZFuel @x0 (FStar.UInt.ones @x0))
       @x1)
      (FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.ones_vec @x0) @x1)))
    :pattern
     ((FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.UInt.to_vec.fuel_instrumented ZFuel @x0 (FStar.UInt.ones @x0))
       @x1))
    :qid lemma_FStar.UInt.ones_to_vec_lemma))
  :named lemma_FStar.UInt.ones_to_vec_lemma))
; Lemma: FStar.UInt128.u64_0_and
;;; Fact-ids: Name FStar.UInt128.u64_0_and; Namespace FStar.UInt128
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(842,9-842,20); use=FStar.UInt128.fst(842,9-842,20)
      (= (FStar.UInt64.v @x0) (BoxInt 0)))
     ;; def=FStar.UInt128.fst(842,25-842,51); use=FStar.UInt128.fst(842,25-842,51)
     (= (FStar.UInt64.v (FStar.UInt64.logand @x0 @x1)) (BoxInt 0)))
    :pattern ((FStar.UInt64.logand @x0 @x1))
    :qid lemma_FStar.UInt128.u64_0_and))
  :named lemma_FStar.UInt128.u64_0_and))
; free var typing
;;; Fact-ids: Name FStar.BitVector.ones_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(42,4-42,12); use=FStar.BitVector.fsti(42,4-42,12)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.pos)
     (HasType (FStar.BitVector.ones_vec @x0) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.ones_vec @x0))
    :qid typing_FStar.BitVector.ones_vec))
  :named typing_FStar.BitVector.ones_vec))
; free var typing
;;; Fact-ids: Name FStar.UInt.ones; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(64,4-64,8); use=FStar.UInt.fsti(64,4-64,8)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.ones @x0) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.ones @x0))
    :qid typing_FStar.UInt.ones))
  :named typing_FStar.UInt.ones))
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t) (b: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         (FStar.UInt64.v a = Prims.pow2 64 - 1 /\ FStar.UInt64.v b = Prims.pow2 64 - 1 ==>
;           FStar.UInt64.v (FStar.UInt64.logand a b) = Prims.pow2 64 - 1) ==>
;         p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         FStar.UInt.logand (FStar.UInt64.v a) (FStar.UInt.ones 64) = FStar.UInt64.v a ==>
;         p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_1s_and’
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
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(850,21-850,50)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              (implies
               ;; def=FStar.UInt128.fst(847,9-848,30); use=FStar.UInt128.fst(850,21-850,50)
               (and
                ;; def=FStar.UInt128.fst(847,9-847,30); use=FStar.UInt128.fst(850,21-850,50)
                (= (FStar.UInt64.v @x0) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1)))
                ;; def=FStar.UInt128.fst(848,9-848,30); use=FStar.UInt128.fst(850,21-850,50)
                (= (FStar.UInt64.v @x1) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))
               ;; def=FStar.UInt128.fst(848,35-848,71); use=FStar.UInt128.fst(850,21-850,50)
               (or
                label_2
                ;; def=FStar.UInt128.fst(848,35-848,71); use=FStar.UInt128.fst(850,21-850,50)
                (=
                 (FStar.UInt64.v (FStar.UInt64.logand @x0 @x1))
                 (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(850,21-850,50)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(850,21-850,50)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(850,21-850,50)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(850,21-850,50)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(850,21-850,50)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.unit)
             ;; def=FStar.UInt.fsti(354,33-354,59); use=FStar.UInt128.fst(850,26-850,40)
             (=
              (FStar.UInt.logand (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt.ones (BoxInt 64)))
              (FStar.UInt64.v @x0)))
            ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(850,21-850,50)
            (Valid
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(850,21-850,50)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_1s_and, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_5 () Bool)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (* - Subtyping check failed\n  - Expected type Type0 got type Type0 *)
;   forall (c: FStar.UInt128.t).
;     FStar.UInt128.n >= 0 /\
;     (forall (any_result: Prims.int).
;         FStar.UInt128.n == any_result ==>
;         (forall (any_result: Type0).
;             FStar.UInt.uint_t FStar.UInt128.n == any_result ==>
;             Prims.hasEq (FStar.UInt.uint_t FStar.UInt128.n))) /\
;     (FStar.UInt128.v a = FStar.UInt128.v b ==> FStar.UInt128.n >= 0) /\
;     ((FStar.UInt128.v a = FStar.UInt128.v b ==> FStar.UInt128.v c = Prims.pow2 FStar.UInt128.n - 1) ==>
;       FStar.UInt128.n >= 0 /\
;       (forall (any_result: Prims.int).
;           FStar.UInt128.n == any_result ==>
;           (forall (any_result: Type0).
;               FStar.UInt.uint_t FStar.UInt128.n == any_result ==>
;               Prims.hasEq (FStar.UInt.uint_t FStar.UInt128.n))))
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.eq_mask’
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
   ;; def=FStar.UInt128.fsti(127,0-127,98); use=FStar.UInt128.fsti(127,0-127,98)
   (forall ((@x0 Term) (@x1 Term))
    (! (implies
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=FStar.UInt128.fsti(127,15-127,98); use=FStar.UInt128.fsti(127,15-127,98)
      (forall ((@x2 Term))
       (! (implies
         (HasType @x2 (FStar.UInt128.t Dummy_value))
         ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fsti(127,36-127,96)
         (and
          ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(127,37-127,38)
          (or
           label_1
           ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(127,37-127,38)
           (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0))))
          ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fsti(127,36-127,68)
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 Prims.int)
              ;; def=FStar.UInt.fsti(53,13-53,14); use=FStar.UInt128.fsti(127,36-127,68)
              (= (FStar.UInt128.n Dummy_value) @x3))
             ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fsti(127,36-127,68)
             (forall ((@x4 Term))
              (! (implies
                (and
                 (HasType @x4 (Tm_type U_zero))
                 ;; def=Prims.fst(556,34-556,40); use=FStar.UInt128.fsti(127,37-127,42)
                 (= (FStar.UInt.uint_t (FStar.UInt128.n Dummy_value)) @x4))
                ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fsti(127,37-127,38)
                (or
                 label_2
                 ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fsti(127,37-127,38)
                 (Valid
                  ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fsti(127,37-127,38)
                  (Prims.hasEq U_zero (FStar.UInt.uint_t (FStar.UInt128.n Dummy_value))))))
               :qid @query.3)))
            :qid @query.2))
          (implies
           ;; def=FStar.UInt128.fsti(127,37-127,46); use=FStar.UInt128.fsti(127,37-127,46)
           (= (FStar.UInt128.v @x0) (FStar.UInt128.v @x1))
           ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(127,62-127,63)
           (or
            label_3
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(127,62-127,63)
            (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0)))))
          (implies
           ;; def=FStar.UInt128.fsti(127,36-127,68); use=FStar.UInt128.fsti(127,36-127,68)
           (implies
            ;; def=FStar.UInt128.fsti(127,37-127,46); use=FStar.UInt128.fsti(127,37-127,46)
            (= (FStar.UInt128.v @x0) (FStar.UInt128.v @x1))
            ;; def=FStar.UInt128.fsti(127,51-127,67); use=FStar.UInt128.fsti(127,51-127,67)
            (=
             (FStar.UInt128.v @x2)
             (Prims.op_Subtraction (Prims.pow2 (FStar.UInt128.n Dummy_value)) (BoxInt 1))))
           ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fsti(127,72-127,96)
           (and
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(127,80-127,81)
            (or
             label_4
             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(127,80-127,81)
             (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0))))
            ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fsti(127,72-127,96)
            (forall ((@x3 Term))
             (! (implies
               (and
                (HasType @x3 Prims.int)
                ;; def=FStar.UInt.fsti(53,13-53,14); use=FStar.UInt128.fsti(127,72-127,96)
                (= (FStar.UInt128.n Dummy_value) @x3))
               ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fsti(127,72-127,96)
               (forall ((@x4 Term))
                (! (implies
                  (and
                   (HasType @x4 (Tm_type U_zero))
                   ;; def=Prims.fst(562,37-562,43); use=FStar.UInt128.fsti(127,77-127,81)
                   (= (FStar.UInt.uint_t (FStar.UInt128.n Dummy_value)) @x4))
                  ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fsti(127,80-127,81)
                  (or
                   label_5
                   ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fsti(127,80-127,81)
                   (Valid
                    ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fsti(127,80-127,81)
                    (Prims.hasEq U_zero (FStar.UInt.uint_t (FStar.UInt128.n Dummy_value))))))
                 :qid @query.5)))
              :qid @query.4))))))
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
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.eq_mask, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.BitVector.lognot_vec (Term Term) Term)
; Fuel-instrumented function name
(declare-fun FStar.BitVector.lognot_vec.fuel_instrumented (Fuel Term Term) Term)
(declare-fun FStar.BitVector.logor_vec (Term Term Term) Term)
; Fuel-instrumented function name
(declare-fun FStar.BitVector.logor_vec.fuel_instrumented (Fuel Term Term Term) Term)
(declare-fun FStar.BitVector.logxor_vec (Term Term Term) Term)
; Fuel-instrumented function name
(declare-fun FStar.BitVector.logxor_vec.fuel_instrumented (Fuel Term Term Term) Term)
(declare-fun FStar.UInt.add_mod (Term Term Term) Term)
(declare-fun FStar.UInt.lognot (Term Term) Term)
(declare-fun FStar.UInt.logor (Term Term Term) Term)
(declare-fun FStar.UInt.logxor (Term Term Term) Term)
(declare-fun FStar.UInt.sub_mod (Term Term Term) Term)
(declare-fun FStar.UInt64.add_mod (Term Term) Term)
(declare-fun FStar.UInt64.eq_mask (Term Term) Term)
(declare-fun FStar.UInt64.lognot (Term) Term)
(declare-fun FStar.UInt64.logor (Term Term) Term)
(declare-fun FStar.UInt64.logxor (Term Term) Term)
(declare-fun FStar.UInt64.minus (Term) Term)
(declare-fun FStar.UInt64.n_minus_one (Dummy_sort) Term)
(declare-fun FStar.UInt64.sub_mod (Term Term) Term)
(declare-fun Prims.op_Negation (Term) Term)
(declare-fun Prims.op_disEquality (Term Term Term) Term)
(declare-fun Tm_refine_2d98f2f5de361516da3dbd9f556509e2 (Term Term) Term)
(declare-fun Tm_refine_30c561286d2c8600e271922aaab003cf (Term Term) Term)
(declare-fun Tm_refine_6913af387cf2f30da0961ac60666f00f (Term Term) Term)
(declare-fun Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6 (Term Term) Term)
(declare-fun Tm_refine_cb95789552ffa46c14f21af13ceaad6b (Term Term) Term)
(declare-fun Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1 (Term) Term)
; Correspondence of recursive function to instrumented version
;;; Fact-ids: Name FStar.BitVector.lognot_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(78,8-78,18); use=FStar.BitVector.fsti(78,8-78,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.BitVector.lognot_vec @x0 @x1)
     (FStar.BitVector.lognot_vec.fuel_instrumented MaxFuel @x0 @x1))
    :pattern ((FStar.BitVector.lognot_vec @x0 @x1))
    :qid @fuel_correspondence_FStar.BitVector.lognot_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.BitVector.lognot_vec.fuel_instrumented))
; Correspondence of recursive function to instrumented version
;;; Fact-ids: Name FStar.BitVector.logor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(67,8-67,17); use=FStar.BitVector.fsti(67,8-67,17)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.BitVector.logor_vec @x0 @x1 @x2)
     (FStar.BitVector.logor_vec.fuel_instrumented MaxFuel @x0 @x1 @x2))
    :pattern ((FStar.BitVector.logor_vec @x0 @x1 @x2))
    :qid @fuel_correspondence_FStar.BitVector.logor_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.BitVector.logor_vec.fuel_instrumented))
; Correspondence of recursive function to instrumented version
;;; Fact-ids: Name FStar.BitVector.logxor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(56,8-56,18); use=FStar.BitVector.fsti(56,8-56,18)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.BitVector.logxor_vec @x0 @x1 @x2)
     (FStar.BitVector.logxor_vec.fuel_instrumented MaxFuel @x0 @x1 @x2))
    :pattern ((FStar.BitVector.logxor_vec @x0 @x1 @x2))
    :qid @fuel_correspondence_FStar.BitVector.logxor_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.BitVector.logxor_vec.fuel_instrumented))
; Fuel irrelevance
;;; Fact-ids: Name FStar.BitVector.lognot_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(78,8-78,18); use=FStar.BitVector.fsti(78,8-78,18)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.BitVector.lognot_vec.fuel_instrumented (SFuel @u0) @x1 @x2)
     (FStar.BitVector.lognot_vec.fuel_instrumented ZFuel @x1 @x2))
    :pattern ((FStar.BitVector.lognot_vec.fuel_instrumented (SFuel @u0) @x1 @x2))
    :qid @fuel_irrelevance_FStar.BitVector.lognot_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.BitVector.lognot_vec.fuel_instrumented))
; Fuel irrelevance
;;; Fact-ids: Name FStar.BitVector.logor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(67,8-67,17); use=FStar.BitVector.fsti(67,8-67,17)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.BitVector.logor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3)
     (FStar.BitVector.logor_vec.fuel_instrumented ZFuel @x1 @x2 @x3))
    :pattern ((FStar.BitVector.logor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3))
    :qid @fuel_irrelevance_FStar.BitVector.logor_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.BitVector.logor_vec.fuel_instrumented))
; Fuel irrelevance
;;; Fact-ids: Name FStar.BitVector.logxor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(56,8-56,18); use=FStar.BitVector.fsti(56,8-56,18)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.BitVector.logxor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3)
     (FStar.BitVector.logxor_vec.fuel_instrumented ZFuel @x1 @x2 @x3))
    :pattern ((FStar.BitVector.logxor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3))
    :qid @fuel_irrelevance_FStar.BitVector.logxor_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.BitVector.logxor_vec.fuel_instrumented))
; Equation for FStar.UInt.add_mod
;;; Fact-ids: Name FStar.UInt.add_mod; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(98,4-98,11); use=FStar.UInt.fsti(98,4-98,11)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.add_mod @x0 @x1 @x2)
     (Prims.op_Modulus (Prims.op_Addition @x1 @x2) (Prims.pow2 @x0)))
    :pattern ((FStar.UInt.add_mod @x0 @x1 @x2))
    :qid equation_FStar.UInt.add_mod))
  :named equation_FStar.UInt.add_mod))
; Equation for FStar.UInt.lognot
;;; Fact-ids: Name FStar.UInt.lognot; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(308,4-308,10); use=FStar.UInt.fsti(308,4-308,10)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt.lognot @x0 @x1)
     (FStar.UInt.from_vec @x0 (FStar.BitVector.lognot_vec @x0 (FStar.UInt.to_vec @x0 @x1))))
    :pattern ((FStar.UInt.lognot @x0 @x1))
    :qid equation_FStar.UInt.lognot))
  :named equation_FStar.UInt.lognot))
; Equation for FStar.UInt.logor
;;; Fact-ids: Name FStar.UInt.logor; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(305,4-305,9); use=FStar.UInt.fsti(305,4-305,9)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.logor @x0 @x1 @x2)
     (FStar.UInt.from_vec
      @x0
      (FStar.BitVector.logor_vec @x0 (FStar.UInt.to_vec @x0 @x1) (FStar.UInt.to_vec @x0 @x2))))
    :pattern ((FStar.UInt.logor @x0 @x1 @x2))
    :qid equation_FStar.UInt.logor))
  :named equation_FStar.UInt.logor))
; Equation for FStar.UInt.logxor
;;; Fact-ids: Name FStar.UInt.logxor; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(302,4-302,10); use=FStar.UInt.fsti(302,4-302,10)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.logxor @x0 @x1 @x2)
     (FStar.UInt.from_vec
      @x0
      (FStar.BitVector.logxor_vec @x0 (FStar.UInt.to_vec @x0 @x1) (FStar.UInt.to_vec @x0 @x2))))
    :pattern ((FStar.UInt.logxor @x0 @x1 @x2))
    :qid equation_FStar.UInt.logxor))
  :named equation_FStar.UInt.logxor))
; Equation for FStar.UInt.sub_mod
;;; Fact-ids: Name FStar.UInt.sub_mod; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(112,4-112,11); use=FStar.UInt.fsti(112,4-112,11)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.sub_mod @x0 @x1 @x2)
     (Prims.op_Modulus (Prims.op_Subtraction @x1 @x2) (Prims.pow2 @x0)))
    :pattern ((FStar.UInt.sub_mod @x0 @x1 @x2))
    :qid equation_FStar.UInt.sub_mod))
  :named equation_FStar.UInt.sub_mod))
; Equation for FStar.UInt64.eq_mask
;;; Fact-ids: Name FStar.UInt64.eq_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(269,4-269,11); use=FStar.UInt64.fsti(269,4-269,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt64.eq_mask @x0 @x1)
     (FStar.UInt64.sub_mod
      (FStar.UInt64.shift_right
       (FStar.UInt64.logor
        (FStar.UInt64.logxor @x0 @x1)
        (FStar.UInt64.minus (FStar.UInt64.logxor @x0 @x1)))
       (FStar.UInt64.n_minus_one Dummy_value))
      (FStar.UInt64.uint_to_t (BoxInt 1))))
    :pattern ((FStar.UInt64.eq_mask @x0 @x1))
    :qid equation_FStar.UInt64.eq_mask))
  :named equation_FStar.UInt64.eq_mask))
; Equation for FStar.UInt64.minus
;;; Fact-ids: Name FStar.UInt64.minus; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(253,4-253,9); use=FStar.UInt64.fsti(253,4-253,9)
  (forall ((@x0 Term))
   (! (=
     (FStar.UInt64.minus @x0)
     (FStar.UInt64.add_mod (FStar.UInt64.lognot @x0) (FStar.UInt64.uint_to_t (BoxInt 1))))
    :pattern ((FStar.UInt64.minus @x0))
    :qid equation_FStar.UInt64.minus))
  :named equation_FStar.UInt64.minus))
; Equation for FStar.UInt64.n_minus_one
;;; Fact-ids: Name FStar.UInt64.n_minus_one; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(258,4-258,15); use=FStar.UInt64.fsti(258,4-258,15)
  (forall ((@u0 Dummy_sort))
   (! (=
     ;; def=FStar.UInt64.fsti(258,4-258,15); use=FStar.UInt64.fsti(258,4-258,15)
     (FStar.UInt64.n_minus_one @u0)
     (FStar.UInt32.uint_to_t (BoxInt 63)))
    :pattern
     (;; def=FStar.UInt64.fsti(258,4-258,15); use=FStar.UInt64.fsti(258,4-258,15)
      (FStar.UInt64.n_minus_one @u0))
    :qid equation_FStar.UInt64.n_minus_one))
  :named equation_FStar.UInt64.n_minus_one))
; Equation for fuel-instrumented recursive function: FStar.BitVector.lognot_vec
;;; Fact-ids: Name FStar.BitVector.lognot_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(78,8-78,18); use=FStar.BitVector.fsti(78,8-78,18)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.pos) (HasType @x2 (FStar.BitVector.bv_t @x1)))
     (=
      (FStar.BitVector.lognot_vec.fuel_instrumented (SFuel @u0) @x1 @x2)
      (let ((@lb3 (Prims.op_Equality Prims.int @x1 (BoxInt 1))))
       (ite
        (= @lb3 (BoxBool true))
        (FStar.Seq.Base.create
         U_zero
         Prims.bool
         (BoxInt 1)
         (Prims.op_Negation (FStar.Seq.Base.index U_zero Prims.bool @x2 (BoxInt 0))))
        (FStar.Seq.Base.append
         U_zero
         Prims.bool
         (FStar.Seq.Base.create
          U_zero
          Prims.bool
          (BoxInt 1)
          (Prims.op_Negation (FStar.Seq.Base.index U_zero Prims.bool @x2 (BoxInt 0))))
         (FStar.BitVector.lognot_vec.fuel_instrumented
          @u0
          (Prims.op_Subtraction @x1 (BoxInt 1))
          (FStar.Seq.Base.slice U_zero Prims.bool @x2 (BoxInt 1) @x1)))))))
    :weight 0
    :pattern ((FStar.BitVector.lognot_vec.fuel_instrumented (SFuel @u0) @x1 @x2))
    :qid equation_with_fuel_FStar.BitVector.lognot_vec.fuel_instrumented))
  :named equation_with_fuel_FStar.BitVector.lognot_vec.fuel_instrumented))
; Equation for fuel-instrumented recursive function: FStar.BitVector.logor_vec
;;; Fact-ids: Name FStar.BitVector.logor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(67,8-67,17); use=FStar.BitVector.fsti(67,8-67,17)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 Prims.pos)
      (HasType @x2 (FStar.BitVector.bv_t @x1))
      (HasType @x3 (FStar.BitVector.bv_t @x1)))
     (=
      (FStar.BitVector.logor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3)
      (let ((@lb4 (Prims.op_Equality Prims.int @x1 (BoxInt 1))))
       (ite
        (= @lb4 (BoxBool true))
        (FStar.Seq.Base.create
         U_zero
         Prims.bool
         (BoxInt 1)
         (Prims.op_BarBar
          (FStar.Seq.Base.index U_zero Prims.bool @x2 (BoxInt 0))
          (FStar.Seq.Base.index U_zero Prims.bool @x3 (BoxInt 0))))
        (FStar.Seq.Base.append
         U_zero
         Prims.bool
         (FStar.Seq.Base.create
          U_zero
          Prims.bool
          (BoxInt 1)
          (Prims.op_BarBar
           (FStar.Seq.Base.index U_zero Prims.bool @x2 (BoxInt 0))
           (FStar.Seq.Base.index U_zero Prims.bool @x3 (BoxInt 0))))
         (FStar.BitVector.logor_vec.fuel_instrumented
          @u0
          (Prims.op_Subtraction @x1 (BoxInt 1))
          (FStar.Seq.Base.slice U_zero Prims.bool @x2 (BoxInt 1) @x1)
          (FStar.Seq.Base.slice U_zero Prims.bool @x3 (BoxInt 1) @x1)))))))
    :weight 0
    :pattern ((FStar.BitVector.logor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3))
    :qid equation_with_fuel_FStar.BitVector.logor_vec.fuel_instrumented))
  :named equation_with_fuel_FStar.BitVector.logor_vec.fuel_instrumented))
; Equation for fuel-instrumented recursive function: FStar.BitVector.logxor_vec
;;; Fact-ids: Name FStar.BitVector.logxor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(56,8-56,18); use=FStar.BitVector.fsti(56,8-56,18)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 Prims.pos)
      (HasType @x2 (FStar.BitVector.bv_t @x1))
      (HasType @x3 (FStar.BitVector.bv_t @x1)))
     (=
      (FStar.BitVector.logxor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3)
      (let ((@lb4 (Prims.op_Equality Prims.int @x1 (BoxInt 1))))
       (ite
        (= @lb4 (BoxBool true))
        (FStar.Seq.Base.create
         U_zero
         Prims.bool
         (BoxInt 1)
         (Prims.op_disEquality
          Prims.bool
          (FStar.Seq.Base.index U_zero Prims.bool @x2 (BoxInt 0))
          (FStar.Seq.Base.index U_zero Prims.bool @x3 (BoxInt 0))))
        (FStar.Seq.Base.append
         U_zero
         Prims.bool
         (FStar.Seq.Base.create
          U_zero
          Prims.bool
          (BoxInt 1)
          (Prims.op_disEquality
           Prims.bool
           (FStar.Seq.Base.index U_zero Prims.bool @x2 (BoxInt 0))
           (FStar.Seq.Base.index U_zero Prims.bool @x3 (BoxInt 0))))
         (FStar.BitVector.logxor_vec.fuel_instrumented
          @u0
          (Prims.op_Subtraction @x1 (BoxInt 1))
          (FStar.Seq.Base.slice U_zero Prims.bool @x2 (BoxInt 1) @x1)
          (FStar.Seq.Base.slice U_zero Prims.bool @x3 (BoxInt 1) @x1)))))))
    :weight 0
    :pattern ((FStar.BitVector.logxor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3))
    :qid equation_with_fuel_FStar.BitVector.logxor_vec.fuel_instrumented))
  :named equation_with_fuel_FStar.BitVector.logxor_vec.fuel_instrumented))
; haseq for Tm_refine_2d98f2f5de361516da3dbd9f556509e2
;;; Fact-ids: Name FStar.UInt64.add_mod; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(104,31-104,32); use=FStar.UInt64.fsti(104,31-104,32)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_2d98f2f5de361516da3dbd9f556509e2 @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_2d98f2f5de361516da3dbd9f556509e2 @x0 @x1))))
    :qid haseqTm_refine_2d98f2f5de361516da3dbd9f556509e2))
  :named haseqTm_refine_2d98f2f5de361516da3dbd9f556509e2))
; haseq for Tm_refine_30c561286d2c8600e271922aaab003cf
;;; Fact-ids: Name FStar.UInt64.eq_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(270,9-270,10); use=FStar.UInt64.fsti(270,9-270,10)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_30c561286d2c8600e271922aaab003cf @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_30c561286d2c8600e271922aaab003cf @x0 @x1))))
    :qid haseqTm_refine_30c561286d2c8600e271922aaab003cf))
  :named haseqTm_refine_30c561286d2c8600e271922aaab003cf))
; haseq for Tm_refine_6913af387cf2f30da0961ac60666f00f
;;; Fact-ids: Name FStar.UInt64.logor; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(195,29-195,30); use=FStar.UInt64.fsti(195,29-195,30)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_6913af387cf2f30da0961ac60666f00f @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_6913af387cf2f30da0961ac60666f00f @x0 @x1))))
    :qid haseqTm_refine_6913af387cf2f30da0961ac60666f00f))
  :named haseqTm_refine_6913af387cf2f30da0961ac60666f00f))
; haseq for Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6
;;; Fact-ids: Name FStar.UInt64.logxor; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(190,30-190,31); use=FStar.UInt64.fsti(190,30-190,31)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6 @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6 @x0 @x1))))
    :qid haseqTm_refine_b87f471e80e3c2bc077d38b7026cfcf6))
  :named haseqTm_refine_b87f471e80e3c2bc077d38b7026cfcf6))
; haseq for Tm_refine_cb95789552ffa46c14f21af13ceaad6b
;;; Fact-ids: Name FStar.UInt64.sub_mod; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(132,31-132,32); use=FStar.UInt64.fsti(132,31-132,32)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_cb95789552ffa46c14f21af13ceaad6b @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_cb95789552ffa46c14f21af13ceaad6b @x0 @x1))))
    :qid haseqTm_refine_cb95789552ffa46c14f21af13ceaad6b))
  :named haseqTm_refine_cb95789552ffa46c14f21af13ceaad6b))
; haseq for Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1
;;; Fact-ids: Name FStar.UInt64.lognot; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(200,24-200,25); use=FStar.UInt64.fsti(200,24-200,25)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1 @x0)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1 @x0))))
    :qid haseqTm_refine_d294ad5c8783c9adf54e87f8b3d910d1))
  :named haseqTm_refine_d294ad5c8783c9adf54e87f8b3d910d1))
; Lemma: FStar.BitVector.lognot_vec_definition
;;; Fact-ids: Name FStar.BitVector.lognot_vec_definition; Namespace FStar.BitVector
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.BitVector.fsti(85,21-85,64); use=FStar.BitVector.fsti(85,21-85,64)
     (=
      (FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.BitVector.lognot_vec.fuel_instrumented ZFuel @x0 @x1)
       @x2)
      (Prims.op_Negation (FStar.Seq.Base.index U_zero Prims.bool @x1 @x2))))
    :pattern
     ((FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.BitVector.lognot_vec.fuel_instrumented ZFuel @x0 @x1)
       @x2))
    :qid lemma_FStar.BitVector.lognot_vec_definition))
  :named lemma_FStar.BitVector.lognot_vec_definition))
; Lemma: FStar.BitVector.logor_vec_definition
;;; Fact-ids: Name FStar.BitVector.logor_vec_definition; Namespace FStar.BitVector
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (FStar.BitVector.bv_t @x0))
      (HasType @x3 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.BitVector.fsti(74,21-74,74); use=FStar.BitVector.fsti(74,21-74,74)
     (=
      (FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.BitVector.logor_vec.fuel_instrumented ZFuel @x0 @x1 @x2)
       @x3)
      (Prims.op_BarBar
       (FStar.Seq.Base.index U_zero Prims.bool @x1 @x3)
       (FStar.Seq.Base.index U_zero Prims.bool @x2 @x3))))
    :pattern
     ((FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.BitVector.logor_vec.fuel_instrumented ZFuel @x0 @x1 @x2)
       @x3))
    :qid lemma_FStar.BitVector.logor_vec_definition))
  :named lemma_FStar.BitVector.logor_vec_definition))
; Lemma: FStar.BitVector.logxor_vec_definition
;;; Fact-ids: Name FStar.BitVector.logxor_vec_definition; Namespace FStar.BitVector
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (FStar.BitVector.bv_t @x0))
      (HasType @x3 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.BitVector.fsti(63,21-63,75); use=FStar.BitVector.fsti(63,21-63,75)
     (=
      (FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.BitVector.logxor_vec.fuel_instrumented ZFuel @x0 @x1 @x2)
       @x3)
      (Prims.op_disEquality
       Prims.bool
       (FStar.Seq.Base.index U_zero Prims.bool @x1 @x3)
       (FStar.Seq.Base.index U_zero Prims.bool @x2 @x3))))
    :pattern
     ((FStar.Seq.Base.index
       U_zero
       Prims.bool
       (FStar.BitVector.logxor_vec.fuel_instrumented ZFuel @x0 @x1 @x2)
       @x3))
    :qid lemma_FStar.BitVector.logxor_vec_definition))
  :named lemma_FStar.BitVector.logxor_vec_definition))
; Lemma: FStar.UInt128.u64_1s_and
;;; Fact-ids: Name FStar.UInt128.u64_1s_and; Namespace FStar.UInt128
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(847,9-847,30); use=FStar.UInt128.fst(850,4-850,14)
      (=
       (FStar.UInt64.v @x0)
       (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel (BoxInt 64)) (BoxInt 1)))
      ;; def=FStar.UInt128.fst(848,9-848,30); use=FStar.UInt128.fst(850,4-850,14)
      (=
       (FStar.UInt64.v @x1)
       (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel (BoxInt 64)) (BoxInt 1))))
     ;; def=FStar.UInt128.fst(848,35-848,71); use=FStar.UInt128.fst(850,4-850,14)
     (=
      (FStar.UInt64.v (FStar.UInt64.logand @x0 @x1))
      (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel (BoxInt 64)) (BoxInt 1))))
    :pattern ((FStar.UInt64.logand @x0 @x1))
    :qid lemma_FStar.UInt128.u64_1s_and))
  :named lemma_FStar.UInt128.u64_1s_and))
;;; Fact-ids: Name Prims.op_Negation; Namespace Prims
(assert
 (! ;; def=Prims.fst(502,4-502,15); use=Prims.fst(502,4-502,15)
  (forall ((@x0 Term))
   (! (= (Prims.op_Negation @x0) (BoxBool (not (BoxBool_proj_0 @x0))))
    :pattern ((Prims.op_Negation @x0))
    :qid primitive_Prims.op_Negation))
  :named primitive_Prims.op_Negation))
;;; Fact-ids: Name Prims.op_disEquality; Namespace Prims
(assert
 (! ;; def=Prims.fst(562,4-562,18); use=Prims.fst(562,4-562,18)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (Prims.op_disEquality @x0 @x1 @x2) (BoxBool (not (= @x1 @x2))))
    :pattern ((Prims.op_disEquality @x0 @x1 @x2))
    :qid primitive_Prims.op_disEquality))
  :named primitive_Prims.op_disEquality))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.add_mod; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(104,31-104,32); use=FStar.UInt64.fsti(104,31-104,32)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_2d98f2f5de361516da3dbd9f556509e2 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(106,21-106,57); use=FStar.UInt64.fsti(106,21-106,57)
      (=
       (FStar.UInt.add_mod (BoxInt 64) (FStar.UInt64.v @x2) (FStar.UInt64.v @x3))
       (FStar.UInt64.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_2d98f2f5de361516da3dbd9f556509e2 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_2d98f2f5de361516da3dbd9f556509e2))
  :named refinement_interpretation_Tm_refine_2d98f2f5de361516da3dbd9f556509e2))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.eq_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(270,9-270,10); use=FStar.UInt64.fsti(270,9-270,10)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_30c561286d2c8600e271922aaab003cf @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(272,23-272,55); use=FStar.UInt64.fsti(272,23-272,55)
      (implies
       ;; def=FStar.UInt64.fsti(272,24-272,33); use=FStar.UInt64.fsti(272,24-272,33)
       (= (FStar.UInt64.v @x2) (FStar.UInt64.v @x3))
       ;; def=FStar.UInt64.fsti(272,38-272,54); use=FStar.UInt64.fsti(272,38-272,54)
       (= (FStar.UInt64.v @x1) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))
      ;; def=FStar.UInt64.fsti(273,23-273,47); use=FStar.UInt64.fsti(273,23-273,47)
      (implies
       ;; def=FStar.UInt64.fsti(273,24-273,34); use=FStar.UInt64.fsti(273,24-273,34)
       (not (= (FStar.UInt64.v @x2) (FStar.UInt64.v @x3)))
       ;; def=FStar.UInt64.fsti(273,39-273,46); use=FStar.UInt64.fsti(273,39-273,46)
       (= (FStar.UInt64.v @x1) (BoxInt 0)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_30c561286d2c8600e271922aaab003cf @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_30c561286d2c8600e271922aaab003cf))
  :named refinement_interpretation_Tm_refine_30c561286d2c8600e271922aaab003cf))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.logor; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(195,29-195,30); use=FStar.UInt64.fsti(195,29-195,30)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_6913af387cf2f30da0961ac60666f00f @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(197,21-197,43); use=FStar.UInt64.fsti(197,21-197,43)
      (=
       (FStar.UInt.logor (BoxInt 64) (FStar.UInt64.v @x2) (FStar.UInt64.v @x3))
       (FStar.UInt64.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_6913af387cf2f30da0961ac60666f00f @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_6913af387cf2f30da0961ac60666f00f))
  :named refinement_interpretation_Tm_refine_6913af387cf2f30da0961ac60666f00f))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.logxor; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(190,30-190,31); use=FStar.UInt64.fsti(190,30-190,31)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(192,21-192,44); use=FStar.UInt64.fsti(192,21-192,44)
      (=
       (FStar.UInt.logxor (BoxInt 64) (FStar.UInt64.v @x2) (FStar.UInt64.v @x3))
       (FStar.UInt64.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6))
  :named refinement_interpretation_Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.sub_mod; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(132,31-132,32); use=FStar.UInt64.fsti(132,31-132,32)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_cb95789552ffa46c14f21af13ceaad6b @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(134,21-134,57); use=FStar.UInt64.fsti(134,21-134,57)
      (=
       (FStar.UInt.sub_mod (BoxInt 64) (FStar.UInt64.v @x2) (FStar.UInt64.v @x3))
       (FStar.UInt64.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_cb95789552ffa46c14f21af13ceaad6b @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_cb95789552ffa46c14f21af13ceaad6b))
  :named refinement_interpretation_Tm_refine_cb95789552ffa46c14f21af13ceaad6b))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.lognot; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(200,24-200,25); use=FStar.UInt64.fsti(200,24-200,25)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1 @x2))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(202,21-202,40); use=FStar.UInt64.fsti(202,21-202,40)
      (= (FStar.UInt.lognot (BoxInt 64) (FStar.UInt64.v @x2)) (FStar.UInt64.v @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1 @x2)))
    :qid refinement_interpretation_Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1))
  :named refinement_interpretation_Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.add_mod; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(104,31-104,32); use=FStar.UInt64.fsti(104,31-104,32)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_2d98f2f5de361516da3dbd9f556509e2 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_2d98f2f5de361516da3dbd9f556509e2 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_2d98f2f5de361516da3dbd9f556509e2))
  :named refinement_kinding_Tm_refine_2d98f2f5de361516da3dbd9f556509e2))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.eq_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(270,9-270,10); use=FStar.UInt64.fsti(270,9-270,10)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_30c561286d2c8600e271922aaab003cf @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_30c561286d2c8600e271922aaab003cf @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_30c561286d2c8600e271922aaab003cf))
  :named refinement_kinding_Tm_refine_30c561286d2c8600e271922aaab003cf))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.logor; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(195,29-195,30); use=FStar.UInt64.fsti(195,29-195,30)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_6913af387cf2f30da0961ac60666f00f @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_6913af387cf2f30da0961ac60666f00f @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_6913af387cf2f30da0961ac60666f00f))
  :named refinement_kinding_Tm_refine_6913af387cf2f30da0961ac60666f00f))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.logxor; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(190,30-190,31); use=FStar.UInt64.fsti(190,30-190,31)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6))
  :named refinement_kinding_Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.sub_mod; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(132,31-132,32); use=FStar.UInt64.fsti(132,31-132,32)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_cb95789552ffa46c14f21af13ceaad6b @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_cb95789552ffa46c14f21af13ceaad6b @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_cb95789552ffa46c14f21af13ceaad6b))
  :named refinement_kinding_Tm_refine_cb95789552ffa46c14f21af13ceaad6b))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.lognot; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(200,24-200,25); use=FStar.UInt64.fsti(200,24-200,25)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1 @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1 @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1))
  :named refinement_kinding_Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1))
; Typing correspondence of token to term
;;; Fact-ids: Name FStar.BitVector.lognot_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(78,8-78,18); use=FStar.BitVector.fsti(78,8-78,18)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.pos) (HasType @x2 (FStar.BitVector.bv_t @x1)))
     (HasType (FStar.BitVector.lognot_vec.fuel_instrumented @u0 @x1 @x2) (FStar.BitVector.bv_t @x1)))
    :pattern ((FStar.BitVector.lognot_vec.fuel_instrumented @u0 @x1 @x2))
    :qid token_correspondence_FStar.BitVector.lognot_vec.fuel_instrumented))
  :named token_correspondence_FStar.BitVector.lognot_vec.fuel_instrumented))
; Typing correspondence of token to term
;;; Fact-ids: Name FStar.BitVector.logor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(67,8-67,17); use=FStar.BitVector.fsti(67,8-67,17)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 Prims.pos)
      (HasType @x2 (FStar.BitVector.bv_t @x1))
      (HasType @x3 (FStar.BitVector.bv_t @x1)))
     (HasType
      (FStar.BitVector.logor_vec.fuel_instrumented @u0 @x1 @x2 @x3)
      (FStar.BitVector.bv_t @x1)))
    :pattern ((FStar.BitVector.logor_vec.fuel_instrumented @u0 @x1 @x2 @x3))
    :qid token_correspondence_FStar.BitVector.logor_vec.fuel_instrumented))
  :named token_correspondence_FStar.BitVector.logor_vec.fuel_instrumented))
; Typing correspondence of token to term
;;; Fact-ids: Name FStar.BitVector.logxor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(56,8-56,18); use=FStar.BitVector.fsti(56,8-56,18)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 Prims.pos)
      (HasType @x2 (FStar.BitVector.bv_t @x1))
      (HasType @x3 (FStar.BitVector.bv_t @x1)))
     (HasType
      (FStar.BitVector.logxor_vec.fuel_instrumented @u0 @x1 @x2 @x3)
      (FStar.BitVector.bv_t @x1)))
    :pattern ((FStar.BitVector.logxor_vec.fuel_instrumented @u0 @x1 @x2 @x3))
    :qid token_correspondence_FStar.BitVector.logxor_vec.fuel_instrumented))
  :named token_correspondence_FStar.BitVector.logxor_vec.fuel_instrumented))
; free var typing
;;; Fact-ids: Name FStar.BitVector.lognot_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(78,8-78,18); use=FStar.BitVector.fsti(78,8-78,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.BitVector.bv_t @x0)))
     (HasType (FStar.BitVector.lognot_vec @x0 @x1) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.lognot_vec @x0 @x1))
    :qid typing_FStar.BitVector.lognot_vec))
  :named typing_FStar.BitVector.lognot_vec))
; free var typing
;;; Fact-ids: Name FStar.BitVector.logor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(67,8-67,17); use=FStar.BitVector.fsti(67,8-67,17)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (FStar.BitVector.bv_t @x0)))
     (HasType (FStar.BitVector.logor_vec @x0 @x1 @x2) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.logor_vec @x0 @x1 @x2))
    :qid typing_FStar.BitVector.logor_vec))
  :named typing_FStar.BitVector.logor_vec))
; free var typing
;;; Fact-ids: Name FStar.BitVector.logxor_vec; Namespace FStar.BitVector
(assert
 (! ;; def=FStar.BitVector.fsti(56,8-56,18); use=FStar.BitVector.fsti(56,8-56,18)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (FStar.BitVector.bv_t @x0)))
     (HasType (FStar.BitVector.logxor_vec @x0 @x1 @x2) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.logxor_vec @x0 @x1 @x2))
    :qid typing_FStar.BitVector.logxor_vec))
  :named typing_FStar.BitVector.logxor_vec))
; free var typing
;;; Fact-ids: Name FStar.UInt.add_mod; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(98,4-98,11); use=FStar.UInt.fsti(98,4-98,11)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.nat)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.add_mod @x0 @x1 @x2) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.add_mod @x0 @x1 @x2))
    :qid typing_FStar.UInt.add_mod))
  :named typing_FStar.UInt.add_mod))
; free var typing
;;; Fact-ids: Name FStar.UInt.lognot; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(308,4-308,10); use=FStar.UInt.fsti(308,4-308,10)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.lognot @x0 @x1) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.lognot @x0 @x1))
    :qid typing_FStar.UInt.lognot))
  :named typing_FStar.UInt.lognot))
; free var typing
;;; Fact-ids: Name FStar.UInt.logor; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(305,4-305,9); use=FStar.UInt.fsti(305,4-305,9)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.logor @x0 @x1 @x2) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.logor @x0 @x1 @x2))
    :qid typing_FStar.UInt.logor))
  :named typing_FStar.UInt.logor))
; free var typing
;;; Fact-ids: Name FStar.UInt.logxor; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(302,4-302,10); use=FStar.UInt.fsti(302,4-302,10)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.logxor @x0 @x1 @x2) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.logxor @x0 @x1 @x2))
    :qid typing_FStar.UInt.logxor))
  :named typing_FStar.UInt.logxor))
; free var typing
;;; Fact-ids: Name FStar.UInt.sub_mod; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(112,4-112,11); use=FStar.UInt.fsti(112,4-112,11)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.nat)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.sub_mod @x0 @x1 @x2) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.sub_mod @x0 @x1 @x2))
    :qid typing_FStar.UInt.sub_mod))
  :named typing_FStar.UInt.sub_mod))
; free var typing
;;; Fact-ids: Name FStar.UInt64.add_mod; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(104,4-104,11); use=FStar.UInt64.fsti(104,4-104,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.add_mod @x0 @x1) (Tm_refine_2d98f2f5de361516da3dbd9f556509e2 @x0 @x1)))
    :pattern ((FStar.UInt64.add_mod @x0 @x1))
    :qid typing_FStar.UInt64.add_mod))
  :named typing_FStar.UInt64.add_mod))
; free var typing
;;; Fact-ids: Name FStar.UInt64.eq_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(269,4-269,11); use=FStar.UInt64.fsti(269,4-269,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.eq_mask @x0 @x1) (Tm_refine_30c561286d2c8600e271922aaab003cf @x0 @x1)))
    :pattern ((FStar.UInt64.eq_mask @x0 @x1))
    :qid typing_FStar.UInt64.eq_mask))
  :named typing_FStar.UInt64.eq_mask))
; free var typing
;;; Fact-ids: Name FStar.UInt64.lognot; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(200,4-200,10); use=FStar.UInt64.fsti(200,4-200,10)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt64.t Dummy_value))
     (HasType (FStar.UInt64.lognot @x0) (Tm_refine_d294ad5c8783c9adf54e87f8b3d910d1 @x0)))
    :pattern ((FStar.UInt64.lognot @x0))
    :qid typing_FStar.UInt64.lognot))
  :named typing_FStar.UInt64.lognot))
; free var typing
;;; Fact-ids: Name FStar.UInt64.logor; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(195,4-195,9); use=FStar.UInt64.fsti(195,4-195,9)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.logor @x0 @x1) (Tm_refine_6913af387cf2f30da0961ac60666f00f @x0 @x1)))
    :pattern ((FStar.UInt64.logor @x0 @x1))
    :qid typing_FStar.UInt64.logor))
  :named typing_FStar.UInt64.logor))
; free var typing
;;; Fact-ids: Name FStar.UInt64.logxor; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(190,4-190,10); use=FStar.UInt64.fsti(190,4-190,10)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.logxor @x0 @x1) (Tm_refine_b87f471e80e3c2bc077d38b7026cfcf6 @x0 @x1)))
    :pattern ((FStar.UInt64.logxor @x0 @x1))
    :qid typing_FStar.UInt64.logxor))
  :named typing_FStar.UInt64.logxor))
; free var typing
;;; Fact-ids: Name FStar.UInt64.minus; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(253,4-253,9); use=FStar.UInt64.fsti(253,4-253,9)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt64.t Dummy_value))
     (HasType (FStar.UInt64.minus @x0) (FStar.UInt64.t Dummy_value)))
    :pattern ((FStar.UInt64.minus @x0))
    :qid typing_FStar.UInt64.minus))
  :named typing_FStar.UInt64.minus))
; free var typing
;;; Fact-ids: Name FStar.UInt64.n_minus_one; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(258,4-258,15); use=FStar.UInt64.fsti(258,4-258,15)
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt64.n_minus_one @u0) (FStar.UInt32.t Dummy_value))
    :pattern ((FStar.UInt64.n_minus_one @u0))
    :qid typing_FStar.UInt64.n_minus_one))
  :named typing_FStar.UInt64.n_minus_one))
; free var typing
;;; Fact-ids: Name FStar.UInt64.sub_mod; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(132,4-132,11); use=FStar.UInt64.fsti(132,4-132,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.sub_mod @x0 @x1) (Tm_refine_cb95789552ffa46c14f21af13ceaad6b @x0 @x1)))
    :pattern ((FStar.UInt64.sub_mod @x0 @x1))
    :qid typing_FStar.UInt64.sub_mod))
  :named typing_FStar.UInt64.sub_mod))
; free var typing
;;; Fact-ids: Name Prims.op_Negation; Namespace Prims
(assert
 (! ;; def=Prims.fst(502,4-502,15); use=Prims.fst(502,4-502,15)
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.bool) (HasType (Prims.op_Negation @x0) Prims.bool))
    :pattern ((Prims.op_Negation @x0))
    :qid typing_Prims.op_Negation))
  :named typing_Prims.op_Negation))
; free var typing
;;; Fact-ids: Name Prims.op_disEquality; Namespace Prims
(assert
 (! ;; def=Prims.fst(562,4-562,18); use=Prims.fst(562,4-562,18)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.eqtype) (HasType @x1 @x0) (HasType @x2 @x0))
     (HasType (Prims.op_disEquality @x0 @x1 @x2) Prims.bool))
    :pattern ((Prims.op_disEquality @x0 @x1 @x2))
    :qid typing_Prims.op_disEquality))
  :named typing_Prims.op_disEquality))
(push) ;; push{1
(declare-fun label_9 () Bool)
(declare-fun label_8 () Bool)
(declare-fun label_7 () Bool)
(declare-fun label_6 () Bool)
(declare-fun label_5 () Bool)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (forall (r: FStar.UInt128.t).
;       (* - Could not prove post-condition *)
;       FStar.UInt128.n >= 0 /\
;       (forall (any_result: Prims.int).
;           FStar.UInt128.n == any_result ==>
;           (forall (any_result: Type0).
;               FStar.UInt.uint_t FStar.UInt128.n == any_result ==>
;               Prims.hasEq (FStar.UInt.uint_t FStar.UInt128.n))) /\
;       ((FStar.UInt128.v a = FStar.UInt128.v b ==> FStar.UInt128.v r = Prims.pow2 128 - 1) ==>
;         FStar.UInt128.n >= 0 /\
;         (forall (any_result: Prims.int).
;             FStar.UInt128.n == any_result ==>
;             (forall (any_result: Type0).
;                 FStar.UInt.uint_t FStar.UInt128.n == any_result ==>
;                 Prims.hasEq (FStar.UInt.uint_t FStar.UInt128.n))))) /\
;   (forall (p: Prims.pure_post FStar.UInt128.t).
;       (forall (pure_result: FStar.UInt128.t).
;           (FStar.UInt128.v a = FStar.UInt128.v b ==>
;             FStar.UInt128.v pure_result = Prims.pow2 128 - 1) /\
;           (FStar.UInt128.v a <> FStar.UInt128.v b ==> FStar.UInt128.v pure_result = 0) ==>
;           p pure_result) ==>
;       (forall (pure_result: FStar.UInt64.t).
;           (FStar.UInt64.v a.low = FStar.UInt64.v b.low ==>
;             FStar.UInt64.v pure_result = Prims.pow2 64 - 1) /\
;           (FStar.UInt64.v a.low <> FStar.UInt64.v b.low ==> FStar.UInt64.v pure_result = 0) ==>
;           FStar.UInt64.eq_mask a.low b.low == pure_result ==>
;           (forall (pure_result: FStar.UInt64.t).
;               (FStar.UInt64.v a.high = FStar.UInt64.v b.high ==>
;                 FStar.UInt64.v pure_result = Prims.pow2 64 - 1) /\
;               (FStar.UInt64.v a.high <> FStar.UInt64.v b.high ==> FStar.UInt64.v pure_result = 0) ==>
;               FStar.UInt64.eq_mask a.high b.high == pure_result ==>
;               (forall (pure_result: FStar.UInt64.t).
;                   FStar.UInt.logand (FStar.UInt64.v (FStar.UInt64.eq_mask a.low b.low))
;                     (FStar.UInt64.v (FStar.UInt64.eq_mask a.high b.high)) =
;                   FStar.UInt64.v pure_result ==>
;                   FStar.UInt64.logand (FStar.UInt64.eq_mask a.low b.low)
;                     (FStar.UInt64.eq_mask a.high b.high) ==
;                   pure_result ==>
;                   (forall (any_result: FStar.UInt128.t).
;                       any_result ==
;                       FStar.UInt128.Mkuint128
;                         (FStar.UInt64.logand (FStar.UInt64.eq_mask a.low b.low)
;                             (FStar.UInt64.eq_mask a.high b.high))
;                         (FStar.UInt64.logand (FStar.UInt64.eq_mask a.low b.low)
;                             (FStar.UInt64.eq_mask a.high b.high)) ==>
;                       (forall (return_val: FStar.UInt128.t).
;                           return_val == any_result ==> p return_val)))))) /\
;   (forall (pure_result: FStar.UInt128.t).
;       (FStar.UInt128.v a = FStar.UInt128.v b ==> FStar.UInt128.v pure_result = Prims.pow2 128 - 1) /\
;       (FStar.UInt128.v a <> FStar.UInt128.v b ==> FStar.UInt128.v pure_result = 0) ==>
;       FStar.UInt128.Mkuint128
;         (FStar.UInt64.logand (FStar.UInt64.eq_mask a.low b.low) (FStar.UInt64.eq_mask a.high b.high)
;         )
;         (FStar.UInt64.logand (FStar.UInt64.eq_mask a.low b.low) (FStar.UInt64.eq_mask a.high b.high)
;         ) ==
;       pure_result ==>
;       (FStar.UInt128.v a = FStar.UInt128.v b ==>
;         FStar.UInt128.v (FStar.UInt128.Mkuint128
;               (FStar.UInt64.logand (FStar.UInt64.eq_mask a.low b.low)
;                   (FStar.UInt64.eq_mask a.high b.high))
;               (FStar.UInt64.logand (FStar.UInt64.eq_mask a.low b.low)
;                   (FStar.UInt64.eq_mask a.high b.high))) =
;         Prims.pow2 FStar.UInt128.n - 1) /\
;       (FStar.UInt128.v a <> FStar.UInt128.v b ==>
;         FStar.UInt128.v (FStar.UInt128.Mkuint128
;               (FStar.UInt64.logand (FStar.UInt64.eq_mask a.low b.low)
;                   (FStar.UInt64.eq_mask a.high b.high))
;               (FStar.UInt64.logand (FStar.UInt64.eq_mask a.low b.low)
;                   (FStar.UInt64.eq_mask a.high b.high))) =
;         0))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let eq_mask’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=Prims.fst(373,4-409,97); use=FStar.UInt128.fst(854,87-857,30)
      (and
       ;; def=FStar.UInt128.fst(854,87-857,30); use=FStar.UInt128.fst(854,87-857,30)
       (forall ((@x2 Term))
        (! (implies
          (HasType @x2 (FStar.UInt128.t Dummy_value))
          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(854,87-857,30)
          (and
           ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(854,22-854,23)
           (or
            label_1
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(854,87-857,30)
            (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0))))
           ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(854,87-857,30)
           (forall ((@x3 Term))
            (! (implies
              (and
               (HasType @x3 Prims.int)
               ;; def=FStar.UInt.fsti(53,13-53,14); use=FStar.UInt128.fst(854,87-857,30)
               (= (FStar.UInt128.n Dummy_value) @x3))
              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(854,87-857,30)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  (HasType @x4 (Tm_type U_zero))
                  ;; def=Prims.fst(556,34-556,40); use=FStar.UInt128.fst(854,87-857,30)
                  (= (FStar.UInt.uint_t (FStar.UInt128.n Dummy_value)) @x4))
                 ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(854,22-854,23)
                 (or
                  label_2
                  ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(854,87-857,30)
                  (Valid
                   ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(854,87-857,30)
                   (Prims.hasEq U_zero (FStar.UInt.uint_t (FStar.UInt128.n Dummy_value))))))
                :qid @query.3)))
             :qid @query.2))
           (implies
            ;; def=FStar.UInt128.fst(854,21-854,55); use=FStar.UInt128.fst(854,87-857,30)
            (implies
             ;; def=FStar.UInt128.fst(854,22-854,31); use=FStar.UInt128.fst(854,87-857,30)
             (= (FStar.UInt128.v @x0) (FStar.UInt128.v @x1))
             ;; def=FStar.UInt128.fst(854,36-854,54); use=FStar.UInt128.fst(854,87-857,30)
             (= (FStar.UInt128.v @x2) (Prims.op_Subtraction (Prims.pow2 (BoxInt 128)) (BoxInt 1))))
            ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(854,87-857,30)
            (and
             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(854,67-854,68)
             (or
              label_3
              ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(854,87-857,30)
              (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0))))
             ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(854,87-857,30)
             (forall ((@x3 Term))
              (! (implies
                (and
                 (HasType @x3 Prims.int)
                 ;; def=FStar.UInt.fsti(53,13-53,14); use=FStar.UInt128.fst(854,87-857,30)
                 (= (FStar.UInt128.n Dummy_value) @x3))
                ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(854,87-857,30)
                (forall ((@x4 Term))
                 (! (implies
                   (and
                    (HasType @x4 (Tm_type U_zero))
                    ;; def=Prims.fst(562,37-562,43); use=FStar.UInt128.fst(854,87-857,30)
                    (= (FStar.UInt.uint_t (FStar.UInt128.n Dummy_value)) @x4))
                   ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(854,67-854,68)
                   (or
                    label_4
                    ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(854,87-857,30)
                    (Valid
                     ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(854,87-857,30)
                     (Prims.hasEq U_zero (FStar.UInt.uint_t (FStar.UInt128.n Dummy_value))))))
                  :qid @query.5)))
               :qid @query.4))))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(854,87-857,30)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_5 (HasType @x3 (FStar.UInt128.t Dummy_value)))
               (implies
                ;; def=FStar.UInt128.fst(854,22-854,31); use=FStar.UInt128.fst(854,87-857,30)
                (= (FStar.UInt128.v @x0) (FStar.UInt128.v @x1))
                ;; def=FStar.UInt128.fst(854,36-854,54); use=FStar.UInt128.fst(854,87-857,30)
                (or
                 label_6
                 ;; def=FStar.UInt128.fst(854,36-854,54); use=FStar.UInt128.fst(854,87-857,30)
                 (=
                  (FStar.UInt128.v @x3)
                  (Prims.op_Subtraction (Prims.pow2 (BoxInt 128)) (BoxInt 1)))))
               (implies
                ;; def=FStar.UInt128.fst(854,60-854,70); use=FStar.UInt128.fst(854,87-857,30)
                (not (= (FStar.UInt128.v @x0) (FStar.UInt128.v @x1)))
                ;; def=FStar.UInt128.fst(854,75-854,82); use=FStar.UInt128.fst(854,87-857,30)
                (or
                 label_7
                 ;; def=FStar.UInt128.fst(854,75-854,82); use=FStar.UInt128.fst(854,87-857,30)
                 (= (FStar.UInt128.v @x3) (BoxInt 0)))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(854,87-857,30)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(854,87-857,30)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(854,87-857,30)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(854,87-857,30)
                (ApplyTT @x2 @x3)))
             :qid @query.7)))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(855,29-855,36)
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 (FStar.UInt64.t Dummy_value))
              ;; def=FStar.UInt64.fsti(272,23-272,55); use=FStar.UInt128.fst(855,29-855,36)
              (implies
               ;; def=FStar.UInt64.fsti(272,24-272,33); use=FStar.UInt128.fst(855,29-855,36)
               (=
                (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0))
                (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x1)))
               ;; def=FStar.UInt64.fsti(272,38-272,54); use=FStar.UInt128.fst(855,29-855,36)
               (= (FStar.UInt64.v @x3) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))
              ;; def=FStar.UInt64.fsti(273,23-273,47); use=FStar.UInt128.fst(855,29-855,36)
              (implies
               ;; def=FStar.UInt64.fsti(273,24-273,34); use=FStar.UInt128.fst(855,29-855,36)
               (not
                (=
                 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0))
                 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x1))))
               ;; def=FStar.UInt64.fsti(273,39-273,46); use=FStar.UInt128.fst(855,29-855,36)
               (= (FStar.UInt64.v @x3) (BoxInt 0)))
              ;; def=FStar.UInt64.fsti(185,12-185,13); use=FStar.UInt128.fst(854,87-857,30)
              (=
               (FStar.UInt64.eq_mask
                (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                (FStar.UInt128.__proj__Mkuint128__item__low @x1))
               @x3))
             ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(856,29-856,36)
             (forall ((@x4 Term))
              (! (implies
                (and
                 (HasType @x4 (FStar.UInt64.t Dummy_value))
                 ;; def=FStar.UInt64.fsti(272,23-272,55); use=FStar.UInt128.fst(856,29-856,36)
                 (implies
                  ;; def=FStar.UInt64.fsti(272,24-272,33); use=FStar.UInt128.fst(856,29-856,36)
                  (=
                   (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                   (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                  ;; def=FStar.UInt64.fsti(272,38-272,54); use=FStar.UInt128.fst(856,29-856,36)
                  (= (FStar.UInt64.v @x4) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))
                 ;; def=FStar.UInt64.fsti(273,23-273,47); use=FStar.UInt128.fst(856,29-856,36)
                 (implies
                  ;; def=FStar.UInt64.fsti(273,24-273,34); use=FStar.UInt128.fst(856,29-856,36)
                  (not
                   (=
                    (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                    (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                  ;; def=FStar.UInt64.fsti(273,39-273,46); use=FStar.UInt128.fst(856,29-856,36)
                  (= (FStar.UInt64.v @x4) (BoxInt 0)))
                 ;; def=FStar.UInt64.fsti(185,18-185,19); use=FStar.UInt128.fst(854,87-857,30)
                 (=
                  (FStar.UInt64.eq_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  @x4))
                ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(855,17-855,23)
                (forall ((@x5 Term))
                 (! (implies
                   (and
                    (HasType @x5 (FStar.UInt64.t Dummy_value))
                    ;; def=FStar.UInt64.fsti(187,21-187,43); use=FStar.UInt128.fst(855,17-855,23)
                    (=
                     (FStar.UInt.logand
                      (BoxInt 64)
                      (FStar.UInt64.v
                       (FStar.UInt64.eq_mask
                        (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                        (FStar.UInt128.__proj__Mkuint128__item__low @x1)))
                      (FStar.UInt64.v
                       (FStar.UInt64.eq_mask
                        (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                        (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                     (FStar.UInt64.v @x5))
                    ;; def=FStar.UInt128.fst(855,6-856,51); use=FStar.UInt128.fst(855,6-856,51)
                    (=
                     (FStar.UInt64.logand
                      (FStar.UInt64.eq_mask
                       (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                       (FStar.UInt128.__proj__Mkuint128__item__low @x1))
                      (FStar.UInt64.eq_mask
                       (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                       (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                     @x5))
                   ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(854,87-857,30)
                   (forall ((@x6 Term))
                    (! (implies
                      (and
                       (HasType @x6 (FStar.UInt128.t Dummy_value))
                       ;; def=FStar.UInt128.fst(852,28-857,30); use=FStar.UInt128.fst(854,87-857,30)
                       (=
                        @x6
                        (FStar.UInt128.Mkuint128
                         (FStar.UInt64.logand
                          (FStar.UInt64.eq_mask
                           (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                           (FStar.UInt128.__proj__Mkuint128__item__low @x1))
                          (FStar.UInt64.eq_mask
                           (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                           (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                         (FStar.UInt64.logand
                          (FStar.UInt64.eq_mask
                           (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                           (FStar.UInt128.__proj__Mkuint128__item__low @x1))
                          (FStar.UInt64.eq_mask
                           (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                           (FStar.UInt128.__proj__Mkuint128__item__high @x1))))))
                      ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
                      (forall ((@x7 Term))
                       (! (implies
                         (and
                          (HasType @x7 (FStar.UInt128.t Dummy_value))
                          ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                          (= @x7 @x6))
                         ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                         (Valid
                          ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                          (ApplyTT @x2 @x7)))
                        :qid @query.12)))
                     :qid @query.11)))
                  :qid @query.10)))
               :qid @query.9)))
            :qid @query.8)))
         :qid @query.6))
       ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(854,87-857,30)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (FStar.UInt128.t Dummy_value))
           ;; def=FStar.UInt128.fst(854,21-854,55); use=FStar.UInt128.fst(854,87-857,30)
           (implies
            ;; def=FStar.UInt128.fst(854,22-854,31); use=FStar.UInt128.fst(854,87-857,30)
            (= (FStar.UInt128.v @x0) (FStar.UInt128.v @x1))
            ;; def=FStar.UInt128.fst(854,36-854,54); use=FStar.UInt128.fst(854,87-857,30)
            (= (FStar.UInt128.v @x2) (Prims.op_Subtraction (Prims.pow2 (BoxInt 128)) (BoxInt 1))))
           ;; def=FStar.UInt128.fst(854,59-854,83); use=FStar.UInt128.fst(854,87-857,30)
           (implies
            ;; def=FStar.UInt128.fst(854,60-854,70); use=FStar.UInt128.fst(854,87-857,30)
            (not (= (FStar.UInt128.v @x0) (FStar.UInt128.v @x1)))
            ;; def=FStar.UInt128.fst(854,75-854,82); use=FStar.UInt128.fst(854,87-857,30)
            (= (FStar.UInt128.v @x2) (BoxInt 0)))
           ;; def=FStar.UInt128.fsti(127,31-127,98); use=FStar.UInt128.fst(854,87-857,30)
           (=
            (FStar.UInt128.Mkuint128
             (FStar.UInt64.logand
              (FStar.UInt64.eq_mask
               (FStar.UInt128.__proj__Mkuint128__item__low @x0)
               (FStar.UInt128.__proj__Mkuint128__item__low @x1))
              (FStar.UInt64.eq_mask
               (FStar.UInt128.__proj__Mkuint128__item__high @x0)
               (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
             (FStar.UInt64.logand
              (FStar.UInt64.eq_mask
               (FStar.UInt128.__proj__Mkuint128__item__low @x0)
               (FStar.UInt128.__proj__Mkuint128__item__low @x1))
              (FStar.UInt64.eq_mask
               (FStar.UInt128.__proj__Mkuint128__item__high @x0)
               (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
            @x2))
          ;; def=FStar.UInt128.fsti(127,36-127,96); use=FStar.UInt128.fst(854,87-857,30)
          (and
           (implies
            ;; def=FStar.UInt128.fsti(127,37-127,46); use=FStar.UInt128.fst(854,87-857,30)
            (= (FStar.UInt128.v @x0) (FStar.UInt128.v @x1))
            ;; def=FStar.UInt128.fsti(127,51-127,67); use=FStar.UInt128.fst(854,87-857,30)
            (or
             label_8
             ;; def=FStar.UInt128.fsti(127,51-127,67); use=FStar.UInt128.fst(854,87-857,30)
             (=
              (FStar.UInt128.v
               (FStar.UInt128.Mkuint128
                (FStar.UInt64.logand
                 (FStar.UInt64.eq_mask
                  (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                  (FStar.UInt128.__proj__Mkuint128__item__low @x1))
                 (FStar.UInt64.eq_mask
                  (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                  (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                (FStar.UInt64.logand
                 (FStar.UInt64.eq_mask
                  (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                  (FStar.UInt128.__proj__Mkuint128__item__low @x1))
                 (FStar.UInt64.eq_mask
                  (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                  (FStar.UInt128.__proj__Mkuint128__item__high @x1)))))
              (Prims.op_Subtraction (Prims.pow2 (FStar.UInt128.n Dummy_value)) (BoxInt 1)))))
           (implies
            ;; def=FStar.UInt128.fsti(127,73-127,83); use=FStar.UInt128.fst(854,87-857,30)
            (not (= (FStar.UInt128.v @x0) (FStar.UInt128.v @x1)))
            ;; def=FStar.UInt128.fsti(127,88-127,95); use=FStar.UInt128.fst(854,87-857,30)
            (or
             label_9
             ;; def=FStar.UInt128.fsti(127,88-127,95); use=FStar.UInt128.fst(854,87-857,30)
             (=
              (FStar.UInt128.v
               (FStar.UInt128.Mkuint128
                (FStar.UInt64.logand
                 (FStar.UInt64.eq_mask
                  (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                  (FStar.UInt128.__proj__Mkuint128__item__low @x1))
                 (FStar.UInt64.eq_mask
                  (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                  (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                (FStar.UInt64.logand
                 (FStar.UInt64.eq_mask
                  (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                  (FStar.UInt128.__proj__Mkuint128__item__low @x1))
                 (FStar.UInt64.eq_mask
                  (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                  (FStar.UInt128.__proj__Mkuint128__item__high @x1)))))
              (BoxInt 0))))))
         :qid @query.13))))
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
(echo "label_9")
(echo "label_8")
(echo "label_7")
(echo "label_6")
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.eq_mask, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9 () Term)
; haseq for Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9
;;; Fact-ids: Name FStar.Tactics.V2.Derived.run_tactic; Namespace FStar.Tactics.V2.Derived
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
   (Valid (Prims.hasEq U_zero Prims.unit)))
  :named haseqTm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
; refinement_interpretation
;;; Fact-ids: Name FStar.Tactics.V2.Derived.run_tactic; Namespace FStar.Tactics.V2.Derived
(assert
 (! ;; def=FStar.Tactics.V2.Derived.fst(142,9-142,13); use=FStar.Tactics.V2.Derived.fst(142,9-142,13)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9)
     (HasTypeFuel @u0 @x1 Prims.unit))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
    :qid refinement_interpretation_Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
  :named refinement_interpretation_Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
; refinement kinding
;;; Fact-ids: Name FStar.Tactics.V2.Derived.run_tactic; Namespace FStar.Tactics.V2.Derived
(assert
 (! (HasType Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
(push) ;; push{1
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)

; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (forall (_: Prims.squash Prims.l_True).
;       (* - Could not prove post-condition *)
;       FStar.UInt128.v a >= FStar.UInt128.v b ==>
;       ~(FStar.UInt64.v a.high > FStar.UInt64.v b.high) ==> Prims.hasEq (FStar.UInt.uint_t 64)) /\
;   (forall (p: Prims.pure_post Prims.unit).
;       (forall (pure_result: Prims.unit).
;           (FStar.UInt128.v a >= FStar.UInt128.v b ==>
;             FStar.UInt64.v a.high > FStar.UInt64.v b.high \/
;             FStar.UInt64.v a.high = FStar.UInt64.v b.high /\
;             FStar.UInt64.v a.low >= FStar.UInt64.v b.low) ==>
;           p pure_result) ==>
;       (forall (any_result: Prims.unit). p any_result))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let gte_characterization’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.UInt128.fst(862,71-862,73); use=FStar.UInt128.fst(862,71-862,73)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9)
           ;; def=FStar.UInt128.fst(860,9-860,19); use=FStar.UInt128.fst(862,71-862,73)
           (>= (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
           ;; def=FStar.UInt128.fst(861,8-861,35); use=FStar.UInt128.fst(862,71-862,73)
           (not
            ;; def=FStar.UInt128.fst(861,8-861,35); use=FStar.UInt128.fst(862,71-862,73)
            (>
             (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0)))
             (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1))))))
          ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(862,13-862,14)
          (or
           label_1
           ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(862,71-862,73)
           (Valid
            ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(862,71-862,73)
            (Prims.hasEq U_zero (FStar.UInt.uint_t (BoxInt 64))))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero Prims.unit))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(862,71-862,73)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_2 (HasType @x3 Prims.unit))
               (implies
                ;; def=FStar.UInt128.fst(860,9-860,19); use=FStar.UInt128.fst(862,71-862,73)
                (>= (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
                ;; def=FStar.UInt128.fst(861,8-862,67); use=FStar.UInt128.fst(862,71-862,73)
                (or
                 label_3
                 ;; def=FStar.UInt128.fst(861,8-861,35); use=FStar.UInt128.fst(862,71-862,73)
                 (>
                  (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0)))
                  (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                 ;; def=FStar.UInt128.fst(862,8-862,67); use=FStar.UInt128.fst(862,71-862,73)
                 (and
                  ;; def=FStar.UInt128.fst(862,9-862,36); use=FStar.UInt128.fst(862,71-862,73)
                  (=
                   (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                   (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                  ;; def=FStar.UInt128.fst(862,40-862,66); use=FStar.UInt128.fst(862,71-862,73)
                  (>=
                   (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0)))
                   (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(862,71-862,73)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(862,71-862,73)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(862,71-862,73)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(862,71-862,73)
                (ApplyTT @x2 @x3)))
             :qid @query.3)))
          ;; def=Prims.fst(419,66-419,102); use=Prims.fst(422,31-422,44)
          (forall ((@x3 Term))
           (! (implies
             (HasType @x3 Prims.unit)
             ;; def=Prims.fst(419,90-419,102); use=Prims.fst(422,31-422,44)
             (Valid
              ;; def=Prims.fst(419,90-419,102); use=Prims.fst(422,31-422,44)
              (ApplyTT @x2 @x3)))
            :qid @query.4)))
         :qid @query.2))))
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
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.gte_characterization, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)

; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (forall (_: Prims.squash Prims.l_True).
;       (* - Could not prove post-condition *)
;       FStar.UInt128.v a < FStar.UInt128.v b ==>
;       ~(FStar.UInt64.v a.high < FStar.UInt64.v b.high) ==> Prims.hasEq (FStar.UInt.uint_t 64)) /\
;   (forall (p: Prims.pure_post Prims.unit).
;       (forall (pure_result: Prims.unit).
;           (FStar.UInt128.v a < FStar.UInt128.v b ==>
;             FStar.UInt64.v a.high < FStar.UInt64.v b.high \/
;             FStar.UInt64.v a.high = FStar.UInt64.v b.high /\
;             FStar.UInt64.v a.low < FStar.UInt64.v b.low) ==>
;           p pure_result) ==>
;       (forall (any_result: Prims.unit). p any_result))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let lt_characterization’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.UInt128.fst(867,71-867,73); use=FStar.UInt128.fst(867,71-867,73)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9)
           ;; def=FStar.UInt128.fst(865,9-865,18); use=FStar.UInt128.fst(867,71-867,73)
           (< (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
           ;; def=FStar.UInt128.fst(866,9-866,36); use=FStar.UInt128.fst(867,71-867,73)
           (not
            ;; def=FStar.UInt128.fst(866,9-866,36); use=FStar.UInt128.fst(867,71-867,73)
            (<
             (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0)))
             (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1))))))
          ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(867,14-867,15)
          (or
           label_1
           ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(867,71-867,73)
           (Valid
            ;; def=Prims.fst(90,23-90,30); use=FStar.UInt128.fst(867,71-867,73)
            (Prims.hasEq U_zero (FStar.UInt.uint_t (BoxInt 64))))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero Prims.unit))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(867,71-867,73)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_2 (HasType @x3 Prims.unit))
               (implies
                ;; def=FStar.UInt128.fst(865,9-865,18); use=FStar.UInt128.fst(867,71-867,73)
                (< (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
                ;; def=FStar.UInt128.fst(866,9-867,67); use=FStar.UInt128.fst(867,71-867,73)
                (or
                 label_3
                 ;; def=FStar.UInt128.fst(866,9-866,36); use=FStar.UInt128.fst(867,71-867,73)
                 (<
                  (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0)))
                  (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                 ;; def=FStar.UInt128.fst(867,9-867,67); use=FStar.UInt128.fst(867,71-867,73)
                 (and
                  ;; def=FStar.UInt128.fst(867,10-867,37); use=FStar.UInt128.fst(867,71-867,73)
                  (=
                   (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                   (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                  ;; def=FStar.UInt128.fst(867,41-867,66); use=FStar.UInt128.fst(867,71-867,73)
                  (<
                   (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0)))
                   (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(867,71-867,73)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(867,71-867,73)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(867,71-867,73)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(867,71-867,73)
                (ApplyTT @x2 @x3)))
             :qid @query.3)))
          ;; def=Prims.fst(419,66-419,102); use=Prims.fst(422,31-422,44)
          (forall ((@x3 Term))
           (! (implies
             (HasType @x3 Prims.unit)
             ;; def=Prims.fst(419,90-419,102); use=Prims.fst(422,31-422,44)
             (Valid
              ;; def=Prims.fst(419,90-419,102); use=Prims.fst(422,31-422,44)
              (ApplyTT @x2 @x3)))
            :qid @query.4)))
         :qid @query.2))))
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
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.lt_characterization, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t) (b: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         FStar.UInt64.logor a b == FStar.UInt64.logor b a ==> p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         FStar.UInt.logor (FStar.UInt64.v a) (FStar.UInt64.v b) =
;         FStar.UInt.logor (FStar.UInt64.v b) (FStar.UInt64.v a) ==>
;         p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_logor_comm’
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
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(870,2-870,44)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              ;; def=FStar.UInt128.fst(869,39-869,71); use=FStar.UInt128.fst(870,2-870,44)
              (or
               label_2
               ;; def=FStar.UInt128.fst(869,39-869,71); use=FStar.UInt128.fst(870,2-870,44)
               (= (FStar.UInt64.logor @x0 @x1) (FStar.UInt64.logor @x1 @x0))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(870,2-870,44)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(870,2-870,44)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(870,2-870,44)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(870,2-870,44)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(870,2-870,44)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.unit)
             ;; def=FStar.UInt.fsti(396,33-396,62); use=FStar.UInt128.fst(870,7-870,24)
             (=
              (FStar.UInt.logor (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt64.v @x1))
              (FStar.UInt.logor (BoxInt 64) (FStar.UInt64.v @x1) (FStar.UInt64.v @x0))))
            ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(870,2-870,44)
            (Valid
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(870,2-870,44)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_logor_comm, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t) (b: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         (FStar.UInt64.v b = Prims.pow2 64 - 1 ==>
;           FStar.UInt64.v (FStar.UInt64.logor a b) = Prims.pow2 64 - 1) ==>
;         p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         FStar.UInt.logor (FStar.UInt64.v a) (FStar.UInt.ones 64) = FStar.UInt.ones 64 ==>
;         p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_or_1’
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
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(875,19-875,47)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              (implies
               ;; def=FStar.UInt128.fst(873,9-873,30); use=FStar.UInt128.fst(875,19-875,47)
               (= (FStar.UInt64.v @x1) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1)))
               ;; def=FStar.UInt128.fst(873,35-873,70); use=FStar.UInt128.fst(875,19-875,47)
               (or
                label_2
                ;; def=FStar.UInt128.fst(873,35-873,70); use=FStar.UInt128.fst(875,19-875,47)
                (=
                 (FStar.UInt64.v (FStar.UInt64.logor @x0 @x1))
                 (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(875,19-875,47)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(875,19-875,47)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(875,19-875,47)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(875,19-875,47)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(875,19-875,47)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.unit)
             ;; def=FStar.UInt.fsti(409,33-409,63); use=FStar.UInt128.fst(875,24-875,37)
             (=
              (FStar.UInt.logor (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt.ones (BoxInt 64)))
              (FStar.UInt.ones (BoxInt 64))))
            ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(875,19-875,47)
            (Valid
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(875,19-875,47)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_or_1, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
; Lemma: FStar.UInt128.u64_or_1
;;; Fact-ids: Name FStar.UInt128.u64_or_1; Namespace FStar.UInt128
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(873,9-873,30); use=FStar.UInt128.fst(875,4-875,12)
      (=
       (FStar.UInt64.v @x1)
       (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel (BoxInt 64)) (BoxInt 1))))
     ;; def=FStar.UInt128.fst(873,35-873,70); use=FStar.UInt128.fst(875,4-875,12)
     (=
      (FStar.UInt64.v (FStar.UInt64.logor @x0 @x1))
      (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel (BoxInt 64)) (BoxInt 1))))
    :pattern ((FStar.UInt64.logor @x0 @x1))
    :qid lemma_FStar.UInt128.u64_or_1))
  :named lemma_FStar.UInt128.u64_or_1))
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t) (b: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         (FStar.UInt64.v a = Prims.pow2 64 - 1 ==>
;           FStar.UInt64.v (FStar.UInt64.logor a b) = Prims.pow2 64 - 1) ==>
;         p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         FStar.UInt64.logor a b == FStar.UInt64.logor b a ==> p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_1_or’
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
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(880,2-880,20)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              (implies
               ;; def=FStar.UInt128.fst(878,9-878,30); use=FStar.UInt128.fst(880,2-880,20)
               (= (FStar.UInt64.v @x0) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1)))
               ;; def=FStar.UInt128.fst(878,35-878,70); use=FStar.UInt128.fst(880,2-880,20)
               (or
                label_2
                ;; def=FStar.UInt128.fst(878,35-878,70); use=FStar.UInt128.fst(880,2-880,20)
                (=
                 (FStar.UInt64.v (FStar.UInt64.logor @x0 @x1))
                 (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(880,2-880,20)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(880,2-880,20)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(880,2-880,20)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(880,2-880,20)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(880,2-880,20)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.unit)
             ;; def=FStar.UInt128.fst(869,39-869,71); use=FStar.UInt128.fst(880,2-880,16)
             (= (FStar.UInt64.logor @x0 @x1) (FStar.UInt64.logor @x1 @x0)))
            ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(880,2-880,20)
            (Valid
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(880,2-880,20)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_1_or, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
; Lemma: FStar.UInt128.u64_1_or
;;; Fact-ids: Name FStar.UInt128.u64_1_or; Namespace FStar.UInt128
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(878,9-878,30); use=FStar.UInt128.fst(878,9-878,30)
      (=
       (FStar.UInt64.v @x0)
       (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel (BoxInt 64)) (BoxInt 1))))
     ;; def=FStar.UInt128.fst(878,35-878,70); use=FStar.UInt128.fst(878,35-878,70)
     (=
      (FStar.UInt64.v (FStar.UInt64.logor @x0 @x1))
      (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel (BoxInt 64)) (BoxInt 1))))
    :pattern ((FStar.UInt64.logor @x0 @x1))
    :qid lemma_FStar.UInt128.u64_1_or))
  :named lemma_FStar.UInt128.u64_1_or))
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t) (b: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         (FStar.UInt64.v a = 0 /\ FStar.UInt64.v b = 0 ==>
;           FStar.UInt64.v (FStar.UInt64.logor a b) = 0) ==>
;         p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         FStar.UInt.logor (FStar.UInt64.v a) (FStar.UInt.zero 64) = FStar.UInt64.v a ==>
;         p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_or_0’
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
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(885,19-885,47)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              (implies
               ;; def=FStar.UInt128.fst(883,9-883,35); use=FStar.UInt128.fst(885,19-885,47)
               (and
                ;; def=FStar.UInt128.fst(883,9-883,20); use=FStar.UInt128.fst(885,19-885,47)
                (= (FStar.UInt64.v @x0) (BoxInt 0))
                ;; def=FStar.UInt128.fst(883,24-883,35); use=FStar.UInt128.fst(885,19-885,47)
                (= (FStar.UInt64.v @x1) (BoxInt 0)))
               ;; def=FStar.UInt128.fst(883,40-883,65); use=FStar.UInt128.fst(885,19-885,47)
               (or
                label_2
                ;; def=FStar.UInt128.fst(883,40-883,65); use=FStar.UInt128.fst(885,19-885,47)
                (= (FStar.UInt64.v (FStar.UInt64.logor @x0 @x1)) (BoxInt 0)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(885,19-885,47)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(885,19-885,47)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(885,19-885,47)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(885,19-885,47)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(885,19-885,47)
         (forall ((@x3 Term))
          (! (implies
            (and
             (HasType @x3 Prims.unit)
             ;; def=FStar.UInt.fsti(406,33-406,58); use=FStar.UInt128.fst(885,24-885,37)
             (=
              (FStar.UInt.logor (BoxInt 64) (FStar.UInt64.v @x0) (FStar.UInt.zero (BoxInt 64)))
              (FStar.UInt64.v @x0)))
            ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(885,19-885,47)
            (Valid
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(885,19-885,47)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_or_0, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         (FStar.UInt64.v a = 0 ==> FStar.UInt64.v (FStar.UInt64.lognot a) = Prims.pow2 64 - 1) ==>
;         p pure_result) ==>
;     (forall (pure_result: Prims.unit).
;         FStar.UInt.lognot (FStar.UInt.zero 64) = FStar.UInt.ones 64 ==> p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_not_0’
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
   (forall ((@x0 Term))
    (! (implies
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x1 Term))
       (! (implies
         (and
          (HasType @x1 (Prims.pure_post U_zero Prims.unit))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(890,18-890,41)
          (forall ((@x2 Term))
           (! (implies
             (and
              (or label_1 (HasType @x2 Prims.unit))
              (implies
               ;; def=FStar.UInt128.fst(888,9-888,20); use=FStar.UInt128.fst(890,18-890,41)
               (= (FStar.UInt64.v @x0) (BoxInt 0))
               ;; def=FStar.UInt128.fst(888,25-888,59); use=FStar.UInt128.fst(890,18-890,41)
               (or
                label_2
                ;; def=FStar.UInt128.fst(888,25-888,59); use=FStar.UInt128.fst(890,18-890,41)
                (=
                 (FStar.UInt64.v (FStar.UInt64.lognot @x0))
                 (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(890,18-890,41)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(890,18-890,41)
              (ApplyTT @x1 @x2)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(890,18-890,41)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(890,18-890,41)
               (ApplyTT @x1 @x2)))
            :qid @query.2)))
         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(890,18-890,41)
         (forall ((@x2 Term))
          (! (implies
            (and
             (HasType @x2 Prims.unit)
             ;; def=FStar.UInt.fsti(427,33-427,62); use=FStar.UInt128.fst(890,23-890,37)
             (=
              (FStar.UInt.lognot (BoxInt 64) (FStar.UInt.zero (BoxInt 64)))
              (FStar.UInt.ones (BoxInt 64))))
            ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(890,18-890,41)
            (Valid
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(890,18-890,41)
             (ApplyTT @x1 @x2)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_not_0, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt.nth (Term Term Term) Term)
; Equation for FStar.UInt.nth
;;; Fact-ids: Name FStar.UInt.nth; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(270,4-270,7); use=FStar.UInt.fsti(270,4-270,7)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.nth @x0 @x1 @x2)
     (FStar.Seq.Base.index U_zero Prims.bool (FStar.UInt.to_vec @x0 @x1) @x2))
    :pattern ((FStar.UInt.nth @x0 @x1 @x2))
    :qid equation_FStar.UInt.nth))
  :named equation_FStar.UInt.nth))
; Lemma: FStar.UInt.lognot_definition
;;; Fact-ids: Name FStar.UInt.lognot_definition; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.UInt.fsti(329,17-329,50); use=FStar.UInt.fsti(329,17-329,50)
     (=
      (FStar.UInt.nth @x0 (FStar.UInt.lognot @x0 @x1) @x2)
      (Prims.op_Negation (FStar.UInt.nth @x0 @x1 @x2))))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.lognot @x0 @x1) @x2))
    :qid lemma_FStar.UInt.lognot_definition))
  :named lemma_FStar.UInt.lognot_definition))
; Lemma: FStar.UInt.ones_nth_lemma
;;; Fact-ids: Name FStar.UInt.ones_nth_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.UInt.fsti(295,33-295,56); use=FStar.UInt.fsti(295,33-295,56)
     (= (FStar.UInt.nth @x0 (FStar.UInt.ones @x0) @x1) (BoxBool true)))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.ones @x0) @x1))
    :qid lemma_FStar.UInt.ones_nth_lemma))
  :named lemma_FStar.UInt.ones_nth_lemma))
; Lemma: FStar.UInt.zero_nth_lemma
;;; Fact-ids: Name FStar.UInt.zero_nth_lemma; Namespace FStar.UInt
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     ;; def=FStar.UInt.fsti(279,33-279,55); use=FStar.UInt.fsti(279,33-279,55)
     (= (FStar.UInt.nth @x0 (FStar.UInt.zero @x0) @x1) (BoxBool false)))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.zero @x0) @x1))
    :qid lemma_FStar.UInt.zero_nth_lemma))
  :named lemma_FStar.UInt.zero_nth_lemma))
; Lemma: FStar.UInt128.u64_not_0
;;; Fact-ids: Name FStar.UInt128.u64_not_0; Namespace FStar.UInt128
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(888,9-888,20); use=FStar.UInt128.fst(890,4-890,13)
      (= (FStar.UInt64.v @x0) (BoxInt 0)))
     ;; def=FStar.UInt128.fst(888,25-888,59); use=FStar.UInt128.fst(890,4-890,13)
     (=
      (FStar.UInt64.v (FStar.UInt64.lognot @x0))
      (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel (BoxInt 64)) (BoxInt 1))))
    :pattern ((FStar.UInt64.lognot @x0))
    :qid lemma_FStar.UInt128.u64_not_0))
  :named lemma_FStar.UInt128.u64_not_0))
; free var typing
;;; Fact-ids: Name FStar.UInt.nth; Namespace FStar.UInt
(assert
 (! ;; def=FStar.UInt.fsti(270,4-270,7); use=FStar.UInt.fsti(270,4-270,7)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x0)))
     (HasType (FStar.UInt.nth @x0 @x1 @x2) Prims.bool))
    :pattern ((FStar.UInt.nth @x0 @x1 @x2))
    :qid typing_FStar.UInt.nth))
  :named typing_FStar.UInt.nth))
(push) ;; push{1
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
(declare-fun Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228 () Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! (HasType Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.UInt.fsti(274,25-274,39); use=FStar.UInt128.fst(896,7-896,16)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228)
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.UInt.fsti(274,32-274,37); use=FStar.UInt128.fst(896,7-896,16)
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 (BoxInt 64)))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228))
    :qid refinement_interpretation_Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228))
  :named refinement_interpretation_Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228))
; haseq for Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228
;;; Fact-ids: 
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228))
   (Valid (Prims.hasEq U_zero Prims.nat)))
  :named haseqTm_refine_3c44adc8bb49dc22b5c9c4b7dc100228))
; Encoding query formula : forall (a: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         (FStar.UInt64.v a = Prims.pow2 64 - 1 ==> FStar.UInt64.v (FStar.UInt64.lognot a) = 0) ==>
;         p pure_result) ==>
;     (forall (i: Prims.nat{i < 64}).
;         FStar.UInt.nth (FStar.UInt.lognot (FStar.UInt.ones 64)) i =
;         FStar.UInt.nth (FStar.UInt.zero 64) i) /\
;     (forall (pure_result: Prims.unit).
;         FStar.UInt.lognot (FStar.UInt.ones 64) = FStar.UInt.zero 64 ==> p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_not_1’
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
   (forall ((@x0 Term))
    (! (implies
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x1 Term))
       (! (implies
         (and
          (HasType @x1 (Prims.pure_post U_zero Prims.unit))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(896,2-896,64)
          (forall ((@x2 Term))
           (! (implies
             (and
              (or label_1 (HasType @x2 Prims.unit))
              (implies
               ;; def=FStar.UInt128.fst(893,9-893,30); use=FStar.UInt128.fst(896,2-896,64)
               (= (FStar.UInt64.v @x0) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1)))
               ;; def=FStar.UInt128.fst(893,35-893,59); use=FStar.UInt128.fst(896,2-896,64)
               (or
                label_2
                ;; def=FStar.UInt128.fst(893,35-893,59); use=FStar.UInt128.fst(896,2-896,64)
                (= (FStar.UInt64.v (FStar.UInt64.lognot @x0)) (BoxInt 0)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(896,2-896,64)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(896,2-896,64)
              (ApplyTT @x1 @x2)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(896,2-896,64)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(896,2-896,64)
               (ApplyTT @x1 @x2)))
            :qid @query.2)))
         ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(896,2-896,64)
         (and
          ;; def=FStar.UInt.fsti(274,18-274,58); use=FStar.UInt128.fst(896,7-896,16)
          (forall ((@x2 Term))
           (! (implies
             (HasType @x2 Tm_refine_3c44adc8bb49dc22b5c9c4b7dc100228)
             ;; def=FStar.UInt.fsti(274,41-274,58); use=FStar.UInt128.fst(896,7-896,16)
             (or
              label_3
              ;; def=FStar.UInt.fsti(274,41-274,58); use=FStar.UInt128.fst(896,7-896,16)
              (=
               (FStar.UInt.nth
                (BoxInt 64)
                (FStar.UInt.lognot (BoxInt 64) (FStar.UInt.ones (BoxInt 64)))
                @x2)
               (FStar.UInt.nth (BoxInt 64) (FStar.UInt.zero (BoxInt 64)) @x2))))
            :qid @query.3))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(896,2-896,64)
          (forall ((@x2 Term))
           (! (implies
             (and
              (HasType @x2 Prims.unit)
              ;; def=FStar.UInt.fsti(275,17-275,22); use=FStar.UInt128.fst(896,7-896,16)
              (=
               (FStar.UInt.lognot (BoxInt 64) (FStar.UInt.ones (BoxInt 64)))
               (FStar.UInt.zero (BoxInt 64))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(896,2-896,64)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(896,2-896,64)
              (ApplyTT @x1 @x2)))
            :qid @query.4))))
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
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_not_1, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (* - Subtyping check failed\n  - Expected type Type0 got type Type0 *)
;   forall (c: FStar.UInt128.t). FStar.UInt128.v a >= FStar.UInt128.v b ==> FStar.UInt128.n >= 0
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.gte_mask’
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
   ;; def=FStar.UInt128.fsti(129,0-129,99); use=FStar.UInt128.fsti(129,0-129,99)
   (forall ((@x0 Term) (@x1 Term))
    (! (implies
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=FStar.UInt128.fsti(129,16-129,99); use=FStar.UInt128.fsti(129,16-129,99)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (FStar.UInt128.t Dummy_value))
          ;; def=FStar.UInt128.fsti(129,38-129,48); use=FStar.UInt128.fsti(129,38-129,48)
          (>= (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1))))
         ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(129,64-129,65)
         (or
          label_1
          ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(129,64-129,65)
          (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0)))))
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
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.gte_mask, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt64.gte_mask (Term Term) Term)
(declare-fun Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234 (Term Term) Term)
; Equation for FStar.UInt64.gte_mask
;;; Fact-ids: Name FStar.UInt64.gte_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(308,4-308,12); use=FStar.UInt64.fsti(308,4-308,12)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt64.gte_mask @x0 @x1)
     (FStar.UInt64.sub_mod
      (FStar.UInt64.shift_right
       (FStar.UInt64.logxor
        @x0
        (FStar.UInt64.logor
         (FStar.UInt64.logxor @x0 @x1)
         (FStar.UInt64.logxor (FStar.UInt64.sub_mod @x0 @x1) @x1)))
       (FStar.UInt64.n_minus_one Dummy_value))
      (FStar.UInt64.uint_to_t (BoxInt 1))))
    :pattern ((FStar.UInt64.gte_mask @x0 @x1))
    :qid equation_FStar.UInt64.gte_mask))
  :named equation_FStar.UInt64.gte_mask))
; haseq for Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234
;;; Fact-ids: Name FStar.UInt64.gte_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(309,9-309,10); use=FStar.UInt64.fsti(309,9-309,10)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234 @x0 @x1)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234 @x0 @x1))))
    :qid haseqTm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234))
  :named haseqTm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234))
; Lemma: FStar.UInt128.u64_not_1
;;; Fact-ids: Name FStar.UInt128.u64_not_1; Namespace FStar.UInt128
(assert
 (! (forall ((@x0 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(893,9-893,30); use=FStar.UInt128.fst(895,4-895,13)
      (=
       (FStar.UInt64.v @x0)
       (Prims.op_Subtraction (Prims.pow2.fuel_instrumented ZFuel (BoxInt 64)) (BoxInt 1))))
     ;; def=FStar.UInt128.fst(893,35-893,59); use=FStar.UInt128.fst(895,4-895,13)
     (= (FStar.UInt64.v (FStar.UInt64.lognot @x0)) (BoxInt 0)))
    :pattern ((FStar.UInt64.lognot @x0))
    :qid lemma_FStar.UInt128.u64_not_1))
  :named lemma_FStar.UInt128.u64_not_1))
; Lemma: FStar.UInt128.u64_or_0
;;; Fact-ids: Name FStar.UInt128.u64_or_0; Namespace FStar.UInt128
(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      (HasType @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(883,9-883,20); use=FStar.UInt128.fst(885,4-885,12)
      (= (FStar.UInt64.v @x0) (BoxInt 0))
      ;; def=FStar.UInt128.fst(883,24-883,35); use=FStar.UInt128.fst(885,4-885,12)
      (= (FStar.UInt64.v @x1) (BoxInt 0)))
     ;; def=FStar.UInt128.fst(883,40-883,65); use=FStar.UInt128.fst(885,4-885,12)
     (= (FStar.UInt64.v (FStar.UInt64.logor @x0 @x1)) (BoxInt 0)))
    :pattern ((FStar.UInt64.logor @x0 @x1))
    :qid lemma_FStar.UInt128.u64_or_0))
  :named lemma_FStar.UInt128.u64_or_0))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt64.gte_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(309,9-309,10); use=FStar.UInt64.fsti(309,9-309,10)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt64.fsti(311,23-311,56); use=FStar.UInt64.fsti(311,23-311,56)
      (implies
       ;; def=FStar.UInt64.fsti(311,24-311,34); use=FStar.UInt64.fsti(311,24-311,34)
       (>= (BoxInt_proj_0 (FStar.UInt64.v @x2)) (BoxInt_proj_0 (FStar.UInt64.v @x3)))
       ;; def=FStar.UInt64.fsti(311,39-311,55); use=FStar.UInt64.fsti(311,39-311,55)
       (= (FStar.UInt64.v @x1) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))
      ;; def=FStar.UInt64.fsti(312,23-312,46); use=FStar.UInt64.fsti(312,23-312,46)
      (implies
       ;; def=FStar.UInt64.fsti(312,24-312,33); use=FStar.UInt64.fsti(312,24-312,33)
       (< (BoxInt_proj_0 (FStar.UInt64.v @x2)) (BoxInt_proj_0 (FStar.UInt64.v @x3)))
       ;; def=FStar.UInt64.fsti(312,38-312,45); use=FStar.UInt64.fsti(312,38-312,45)
       (= (FStar.UInt64.v @x1) (BoxInt 0)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234))
  :named refinement_interpretation_Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234))
; refinement kinding
;;; Fact-ids: Name FStar.UInt64.gte_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(309,9-309,10); use=FStar.UInt64.fsti(309,9-309,10)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234))
  :named refinement_kinding_Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234))
; free var typing
;;; Fact-ids: Name FStar.UInt64.gte_mask; Namespace FStar.UInt64
(assert
 (! ;; def=FStar.UInt64.fsti(308,4-308,12); use=FStar.UInt64.fsti(308,4-308,12)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt64.gte_mask @x0 @x1) (Tm_refine_1b1f0e3b5d9ef76ddc765c8d9e623234 @x0 @x1)))
    :pattern ((FStar.UInt64.gte_mask @x0 @x1))
    :qid typing_FStar.UInt64.gte_mask))
  :named typing_FStar.UInt64.gte_mask))
(push) ;; push{1
(declare-fun label_5 () Bool)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t) (b: FStar.UInt128.t).
;   (forall (p: Prims.pure_post FStar.UInt128.t).
;       (forall (pure_result: FStar.UInt128.t).
;           (FStar.UInt128.v a >= FStar.UInt128.v b ==>
;             FStar.UInt128.v pure_result = Prims.pow2 128 - 1) /\
;           (FStar.UInt128.v a < FStar.UInt128.v b ==> FStar.UInt128.v pure_result = 0) ==>
;           p pure_result) ==>
;       (forall (pure_result: FStar.UInt64.t).
;           (FStar.UInt64.v a.high >= FStar.UInt64.v b.high ==>
;             FStar.UInt64.v pure_result = Prims.pow2 64 - 1) /\
;           (FStar.UInt64.v a.high < FStar.UInt64.v b.high ==> FStar.UInt64.v pure_result = 0) ==>
;           FStar.UInt64.gte_mask a.high b.high == pure_result ==>
;           (forall (pure_result: FStar.UInt64.t).
;               (FStar.UInt64.v a.high = FStar.UInt64.v b.high ==>
;                 FStar.UInt64.v pure_result = Prims.pow2 64 - 1) /\
;               (FStar.UInt64.v a.high <> FStar.UInt64.v b.high ==> FStar.UInt64.v pure_result = 0) ==>
;               FStar.UInt64.eq_mask a.high b.high == pure_result ==>
;               (forall (pure_result: FStar.UInt64.t).
;                   FStar.UInt.lognot (FStar.UInt64.v (FStar.UInt64.eq_mask a.high b.high)) ==
;                   FStar.UInt64.v pure_result ==>
;                   FStar.UInt64.lognot (FStar.UInt64.eq_mask a.high b.high) == pure_result ==>
;                   (forall (pure_result: FStar.UInt64.t).
;                       FStar.UInt.logand (FStar.UInt64.v (FStar.UInt64.gte_mask a.high b.high))
;                         (FStar.UInt64.v (FStar.UInt64.lognot (FStar.UInt64.eq_mask a.high b.high))) =
;                       FStar.UInt64.v pure_result ==>
;                       FStar.UInt64.logand (FStar.UInt64.gte_mask a.high b.high)
;                         (FStar.UInt64.lognot (FStar.UInt64.eq_mask a.high b.high)) ==
;                       pure_result ==>
;                       (forall (pure_result: FStar.UInt64.t).
;                           (FStar.UInt64.v a.high = FStar.UInt64.v b.high ==>
;                             FStar.UInt64.v pure_result = Prims.pow2 64 - 1) /\
;                           (FStar.UInt64.v a.high <> FStar.UInt64.v b.high ==>
;                             FStar.UInt64.v pure_result = 0) ==>
;                           FStar.UInt64.eq_mask a.high b.high == pure_result ==>
;                           (forall (pure_result: FStar.UInt64.t).
;                               (FStar.UInt64.v a.low >= FStar.UInt64.v b.low ==>
;                                 FStar.UInt64.v pure_result = Prims.pow2 64 - 1) /\
;                               (FStar.UInt64.v a.low < FStar.UInt64.v b.low ==>
;                                 FStar.UInt64.v pure_result = 0) ==>
;                               FStar.UInt64.gte_mask a.low b.low == pure_result ==>
;                               (forall (pure_result: FStar.UInt64.t).
;                                   FStar.UInt.logand (FStar.UInt64.v (FStar.UInt64.eq_mask a.high
;                                             b.high))
;                                     (FStar.UInt64.v (FStar.UInt64.gte_mask a.low b.low)) =
;                                   FStar.UInt64.v pure_result ==>
;                                   FStar.UInt64.logand (FStar.UInt64.eq_mask a.high b.high)
;                                     (FStar.UInt64.gte_mask a.low b.low) ==
;                                   pure_result ==>
;                                   (forall (pure_result: FStar.UInt64.t).
;                                       FStar.UInt.logor (FStar.UInt64.v pure_result)
;                                         (FStar.UInt64.v pure_result) ==
;                                       FStar.UInt64.v pure_result ==>
;                                       FStar.UInt64.logor pure_result pure_result == pure_result ==>
;                                       (forall (pure_result: Prims.unit).
;                                           (FStar.UInt128.v a >= FStar.UInt128.v b ==>
;                                             FStar.UInt64.v a.high > FStar.UInt64.v b.high \/
;                                             FStar.UInt64.v a.high = FStar.UInt64.v b.high /\
;                                             FStar.UInt64.v a.low >= FStar.UInt64.v b.low) ==>
;                                           (forall (pure_result: Prims.unit).
;                                               (FStar.UInt128.v a < FStar.UInt128.v b ==>
;                                                 FStar.UInt64.v a.high < FStar.UInt64.v b.high \/
;                                                 FStar.UInt64.v a.high = FStar.UInt64.v b.high /\
;                                                 FStar.UInt64.v a.low < FStar.UInt64.v b.low) ==>
;                                               (forall (any_result: FStar.UInt128.t).
;                                                   any_result ==
;                                                   FStar.UInt128.Mkuint128
;                                                     (FStar.UInt64.logor (FStar.UInt64.logand (FStar.UInt64.gte_mask
;                                                                 a.high
;                                                                 b.high)
;                                                             (FStar.UInt64.lognot (FStar.UInt64.eq_mask
;                                                                     a.high
;                                                                     b.high)))
;                                                         (FStar.UInt64.logand (FStar.UInt64.eq_mask a
;                                                                   .high
;                                                                 b.high)
;                                                             (FStar.UInt64.gte_mask a.low b.low)))
;                                                     (FStar.UInt64.logor (FStar.UInt64.logand (FStar.UInt64.gte_mask
;                                                                 a.high
;                                                                 b.high)
;                                                             (FStar.UInt64.lognot (FStar.UInt64.eq_mask
;                                                                     a.high
;                                                                     b.high)))
;                                                         (FStar.UInt64.logand (FStar.UInt64.eq_mask a
;                                                                   .high
;                                                                 b.high)
;                                                             (FStar.UInt64.gte_mask a.low b.low))) ==>
;                                                   (forall (return_val: FStar.UInt128.t).
;                                                       return_val == any_result ==> p return_val)))))
;                               )))))))) /\
;   (forall (pure_result: FStar.UInt128.t).
;       (FStar.UInt128.v a >= FStar.UInt128.v b ==> FStar.UInt128.v pure_result = Prims.pow2 128 - 1) /\
;       (FStar.UInt128.v a < FStar.UInt128.v b ==> FStar.UInt128.v pure_result = 0) ==>
;       FStar.UInt128.Mkuint128
;         (FStar.UInt64.logor (FStar.UInt64.logand (FStar.UInt64.gte_mask a.high b.high)
;                 (FStar.UInt64.lognot (FStar.UInt64.eq_mask a.high b.high)))
;             (FStar.UInt64.logand (FStar.UInt64.eq_mask a.high b.high)
;                 (FStar.UInt64.gte_mask a.low b.low)))
;         (FStar.UInt64.logor (FStar.UInt64.logand (FStar.UInt64.gte_mask a.high b.high)
;                 (FStar.UInt64.lognot (FStar.UInt64.eq_mask a.high b.high)))
;             (FStar.UInt64.logand (FStar.UInt64.eq_mask a.high b.high)
;                 (FStar.UInt64.gte_mask a.low b.low))) ==
;       pure_result ==>
;       (FStar.UInt128.v a >= FStar.UInt128.v b ==>
;         FStar.UInt128.v (FStar.UInt128.Mkuint128
;               (FStar.UInt64.logor (FStar.UInt64.logand (FStar.UInt64.gte_mask a.high b.high)
;                       (FStar.UInt64.lognot (FStar.UInt64.eq_mask a.high b.high)))
;                   (FStar.UInt64.logand (FStar.UInt64.eq_mask a.high b.high)
;                       (FStar.UInt64.gte_mask a.low b.low)))
;               (FStar.UInt64.logor (FStar.UInt64.logand (FStar.UInt64.gte_mask a.high b.high)
;                       (FStar.UInt64.lognot (FStar.UInt64.eq_mask a.high b.high)))
;                   (FStar.UInt64.logand (FStar.UInt64.eq_mask a.high b.high)
;                       (FStar.UInt64.gte_mask a.low b.low)))) =
;         Prims.pow2 FStar.UInt128.n - 1) /\
;       (FStar.UInt128.v a < FStar.UInt128.v b ==>
;         FStar.UInt128.v (FStar.UInt128.Mkuint128
;               (FStar.UInt64.logor (FStar.UInt64.logand (FStar.UInt64.gte_mask a.high b.high)
;                       (FStar.UInt64.lognot (FStar.UInt64.eq_mask a.high b.high)))
;                   (FStar.UInt64.logand (FStar.UInt64.eq_mask a.high b.high)
;                       (FStar.UInt64.gte_mask a.low b.low)))
;               (FStar.UInt64.logor (FStar.UInt64.logand (FStar.UInt64.gte_mask a.high b.high)
;                       (FStar.UInt64.lognot (FStar.UInt64.eq_mask a.high b.high)))
;                   (FStar.UInt64.logand (FStar.UInt64.eq_mask a.high b.high)
;                       (FStar.UInt64.gte_mask a.low b.low)))) =
;         0))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let gte_mask’
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
      (and (HasType @x0 (FStar.UInt128.t Dummy_value)) (HasType @x1 (FStar.UInt128.t Dummy_value)))
      ;; def=Prims.fst(373,4-409,97); use=FStar.UInt128.fst(900,87-908,30)
      (and
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt128.t Dummy_value)))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(900,87-908,30)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_1 (HasType @x3 (FStar.UInt128.t Dummy_value)))
               (implies
                ;; def=FStar.UInt128.fst(900,22-900,32); use=FStar.UInt128.fst(900,87-908,30)
                (>= (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
                ;; def=FStar.UInt128.fst(900,37-900,55); use=FStar.UInt128.fst(900,87-908,30)
                (or
                 label_2
                 ;; def=FStar.UInt128.fst(900,37-900,55); use=FStar.UInt128.fst(900,87-908,30)
                 (=
                  (FStar.UInt128.v @x3)
                  (Prims.op_Subtraction (Prims.pow2 (BoxInt 128)) (BoxInt 1)))))
               (implies
                ;; def=FStar.UInt128.fst(900,61-900,70); use=FStar.UInt128.fst(900,87-908,30)
                (< (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
                ;; def=FStar.UInt128.fst(900,75-900,82); use=FStar.UInt128.fst(900,87-908,30)
                (or
                 label_3
                 ;; def=FStar.UInt128.fst(900,75-900,82); use=FStar.UInt128.fst(900,87-908,30)
                 (= (FStar.UInt128.v @x3) (BoxInt 0)))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(900,87-908,30)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(900,87-908,30)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(900,87-908,30)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(900,87-908,30)
                (ApplyTT @x2 @x3)))
             :qid @query.2)))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(901,36-901,44)
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 (FStar.UInt64.t Dummy_value))
              ;; def=FStar.UInt64.fsti(311,23-311,56); use=FStar.UInt128.fst(901,36-901,44)
              (implies
               ;; def=FStar.UInt64.fsti(311,24-311,34); use=FStar.UInt128.fst(901,36-901,44)
               (>=
                (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0)))
                (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
               ;; def=FStar.UInt64.fsti(311,39-311,55); use=FStar.UInt128.fst(901,36-901,44)
               (= (FStar.UInt64.v @x3) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))
              ;; def=FStar.UInt64.fsti(312,23-312,46); use=FStar.UInt128.fst(901,36-901,44)
              (implies
               ;; def=FStar.UInt64.fsti(312,24-312,33); use=FStar.UInt128.fst(901,36-901,44)
               (<
                (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0)))
                (BoxInt_proj_0 (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
               ;; def=FStar.UInt64.fsti(312,38-312,45); use=FStar.UInt128.fst(901,36-901,44)
               (= (FStar.UInt64.v @x3) (BoxInt 0)))
              ;; def=FStar.UInt64.fsti(185,12-185,13); use=FStar.UInt128.fst(900,87-908,30)
              (=
               (FStar.UInt64.gte_mask
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1))
               @x3))
             ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(902,48-902,55)
             (forall ((@x4 Term))
              (! (implies
                (and
                 (HasType @x4 (FStar.UInt64.t Dummy_value))
                 ;; def=FStar.UInt64.fsti(272,23-272,55); use=FStar.UInt128.fst(902,48-902,55)
                 (implies
                  ;; def=FStar.UInt64.fsti(272,24-272,33); use=FStar.UInt128.fst(902,48-902,55)
                  (=
                   (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                   (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                  ;; def=FStar.UInt64.fsti(272,38-272,54); use=FStar.UInt128.fst(902,48-902,55)
                  (= (FStar.UInt64.v @x4) (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))
                 ;; def=FStar.UInt64.fsti(273,23-273,47); use=FStar.UInt128.fst(902,48-902,55)
                 (implies
                  ;; def=FStar.UInt64.fsti(273,24-273,34); use=FStar.UInt128.fst(902,48-902,55)
                  (not
                   (=
                    (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                    (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                  ;; def=FStar.UInt64.fsti(273,39-273,46); use=FStar.UInt128.fst(902,48-902,55)
                  (= (FStar.UInt64.v @x4) (BoxInt 0)))
                 ;; def=FStar.UInt64.fsti(200,12-200,13); use=FStar.UInt128.fst(900,87-908,30)
                 (=
                  (FStar.UInt64.eq_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  @x4))
                ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(902,36-902,42)
                (forall ((@x5 Term))
                 (! (implies
                   (and
                    (HasType @x5 (FStar.UInt64.t Dummy_value))
                    ;; def=FStar.UInt64.fsti(202,21-202,40); use=FStar.UInt128.fst(902,36-902,42)
                    (=
                     (FStar.UInt.lognot
                      (BoxInt 64)
                      (FStar.UInt64.v
                       (FStar.UInt64.eq_mask
                        (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                        (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                     (FStar.UInt64.v @x5))
                    ;; def=FStar.UInt64.fsti(185,18-185,19); use=FStar.UInt128.fst(900,87-908,30)
                    (=
                     (FStar.UInt64.lognot
                      (FStar.UInt64.eq_mask
                       (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                       (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                     @x5))
                   ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(901,24-901,30)
                   (forall ((@x6 Term))
                    (! (implies
                      (and
                       (HasType @x6 (FStar.UInt64.t Dummy_value))
                       ;; def=FStar.UInt64.fsti(187,21-187,43); use=FStar.UInt128.fst(901,24-901,30)
                       (=
                        (FStar.UInt.logand
                         (BoxInt 64)
                         (FStar.UInt64.v
                          (FStar.UInt64.gte_mask
                           (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                           (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                         (FStar.UInt64.v
                          (FStar.UInt64.lognot
                           (FStar.UInt64.eq_mask
                            (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                            (FStar.UInt128.__proj__Mkuint128__item__high @x1)))))
                        (FStar.UInt64.v @x6))
                       ;; def=FStar.UInt128.fst(901,6-902,71); use=FStar.UInt128.fst(901,6-902,71)
                       (=
                        (FStar.UInt64.logand
                         (FStar.UInt64.gte_mask
                          (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                          (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                         (FStar.UInt64.lognot
                          (FStar.UInt64.eq_mask
                           (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                           (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                        @x6))
                      ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(903,36-903,43)
                      (forall ((@x7 Term))
                       (! (implies
                         (and
                          (HasType @x7 (FStar.UInt64.t Dummy_value))
                          ;; def=FStar.UInt64.fsti(272,23-272,55); use=FStar.UInt128.fst(903,36-903,43)
                          (implies
                           ;; def=FStar.UInt64.fsti(272,24-272,33); use=FStar.UInt128.fst(903,36-903,43)
                           (=
                            (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                            (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                           ;; def=FStar.UInt64.fsti(272,38-272,54); use=FStar.UInt128.fst(903,36-903,43)
                           (=
                            (FStar.UInt64.v @x7)
                            (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))
                          ;; def=FStar.UInt64.fsti(273,23-273,47); use=FStar.UInt128.fst(903,36-903,43)
                          (implies
                           ;; def=FStar.UInt64.fsti(273,24-273,34); use=FStar.UInt128.fst(903,36-903,43)
                           (not
                            (=
                             (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                             (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                           ;; def=FStar.UInt64.fsti(273,39-273,46); use=FStar.UInt128.fst(903,36-903,43)
                           (= (FStar.UInt64.v @x7) (BoxInt 0)))
                          ;; def=FStar.UInt64.fsti(185,12-185,13); use=FStar.UInt128.fst(900,87-908,30)
                          (=
                           (FStar.UInt64.eq_mask
                            (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                            (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                           @x7))
                         ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(904,36-904,44)
                         (forall ((@x8 Term))
                          (! (implies
                            (and
                             (HasType @x8 (FStar.UInt64.t Dummy_value))
                             ;; def=FStar.UInt64.fsti(311,23-311,56); use=FStar.UInt128.fst(904,36-904,44)
                             (implies
                              ;; def=FStar.UInt64.fsti(311,24-311,34); use=FStar.UInt128.fst(904,36-904,44)
                              (>=
                               (BoxInt_proj_0
                                (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0)))
                               (BoxInt_proj_0
                                (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x1))))
                              ;; def=FStar.UInt64.fsti(311,39-311,55); use=FStar.UInt128.fst(904,36-904,44)
                              (=
                               (FStar.UInt64.v @x8)
                               (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (BoxInt 1))))
                             ;; def=FStar.UInt64.fsti(312,23-312,46); use=FStar.UInt128.fst(904,36-904,44)
                             (implies
                              ;; def=FStar.UInt64.fsti(312,24-312,33); use=FStar.UInt128.fst(904,36-904,44)
                              (<
                               (BoxInt_proj_0
                                (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0)))
                               (BoxInt_proj_0
                                (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x1))))
                              ;; def=FStar.UInt64.fsti(312,38-312,45); use=FStar.UInt128.fst(904,36-904,44)
                              (= (FStar.UInt64.v @x8) (BoxInt 0)))
                             ;; def=FStar.UInt64.fsti(185,18-185,19); use=FStar.UInt128.fst(900,87-908,30)
                             (=
                              (FStar.UInt64.gte_mask
                               (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                               (FStar.UInt128.__proj__Mkuint128__item__low @x1))
                              @x8))
                            ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(903,24-903,30)
                            (forall ((@x9 Term))
                             (! (implies
                               (and
                                (HasType @x9 (FStar.UInt64.t Dummy_value))
                                ;; def=FStar.UInt64.fsti(187,21-187,43); use=FStar.UInt128.fst(903,24-903,30)
                                (=
                                 (FStar.UInt.logand
                                  (BoxInt 64)
                                  (FStar.UInt64.v
                                   (FStar.UInt64.eq_mask
                                    (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                    (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                                  (FStar.UInt64.v
                                   (FStar.UInt64.gte_mask
                                    (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                                    (FStar.UInt128.__proj__Mkuint128__item__low @x1))))
                                 (FStar.UInt64.v @x9))
                                ;; def=FStar.UInt128.fst(903,6-904,57); use=FStar.UInt128.fst(903,6-904,57)
                                (=
                                 (FStar.UInt64.logand
                                  (FStar.UInt64.eq_mask
                                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                                  (FStar.UInt64.gte_mask
                                   (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                                   (FStar.UInt128.__proj__Mkuint128__item__low @x1)))
                                 @x9))
                               ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(905,17-905,22)
                               (forall ((@x10 Term))
                                (! (implies
                                  (and
                                   (HasType @x10 (FStar.UInt64.t Dummy_value))
                                   ;; def=FStar.UInt64.fsti(197,21-197,43); use=FStar.UInt128.fst(905,17-905,22)
                                   (=
                                    (FStar.UInt.logor
                                     (BoxInt 64)
                                     (FStar.UInt64.v @x6)
                                     (FStar.UInt64.v @x9))
                                    (FStar.UInt64.v @x10))
                                   ;; def=FStar.UInt128.fst(905,6-905,46); use=FStar.UInt128.fst(905,6-905,46)
                                   (= (FStar.UInt64.logor @x6 @x9) @x10))
                                  ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(906,2-906,22)
                                  (forall ((@x11 Term))
                                   (! (implies
                                     (and
                                      (HasType @x11 Prims.unit)
                                      ;; def=FStar.UInt128.fst(860,8-862,68); use=FStar.UInt128.fst(906,2-906,22)
                                      (implies
                                       ;; def=FStar.UInt128.fst(860,9-860,19); use=FStar.UInt128.fst(906,2-906,22)
                                       (>=
                                        (BoxInt_proj_0 (FStar.UInt128.v @x0))
                                        (BoxInt_proj_0 (FStar.UInt128.v @x1)))
                                       ;; def=FStar.UInt128.fst(861,8-862,67); use=FStar.UInt128.fst(906,2-906,22)
                                       (or
                                        ;; def=FStar.UInt128.fst(861,8-861,35); use=FStar.UInt128.fst(906,2-906,22)
                                        (>
                                         (BoxInt_proj_0
                                          (FStar.UInt64.v
                                           (FStar.UInt128.__proj__Mkuint128__item__high @x0)))
                                         (BoxInt_proj_0
                                          (FStar.UInt64.v
                                           (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                                        ;; def=FStar.UInt128.fst(862,8-862,67); use=FStar.UInt128.fst(906,2-906,22)
                                        (and
                                         ;; def=FStar.UInt128.fst(862,9-862,36); use=FStar.UInt128.fst(906,2-906,22)
                                         (=
                                          (FStar.UInt64.v
                                           (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                                          (FStar.UInt64.v
                                           (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                                         ;; def=FStar.UInt128.fst(862,40-862,66); use=FStar.UInt128.fst(906,2-906,22)
                                         (>=
                                          (BoxInt_proj_0
                                           (FStar.UInt64.v
                                            (FStar.UInt128.__proj__Mkuint128__item__low @x0)))
                                          (BoxInt_proj_0
                                           (FStar.UInt64.v
                                            (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))))
                                     ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(907,2-907,21)
                                     (forall ((@x12 Term))
                                      (! (implies
                                        (and
                                         (HasType @x12 Prims.unit)
                                         ;; def=FStar.UInt128.fst(865,8-867,68); use=FStar.UInt128.fst(907,2-907,21)
                                         (implies
                                          ;; def=FStar.UInt128.fst(865,9-865,18); use=FStar.UInt128.fst(907,2-907,21)
                                          (<
                                           (BoxInt_proj_0 (FStar.UInt128.v @x0))
                                           (BoxInt_proj_0 (FStar.UInt128.v @x1)))
                                          ;; def=FStar.UInt128.fst(866,9-867,67); use=FStar.UInt128.fst(907,2-907,21)
                                          (or
                                           ;; def=FStar.UInt128.fst(866,9-866,36); use=FStar.UInt128.fst(907,2-907,21)
                                           (<
                                            (BoxInt_proj_0
                                             (FStar.UInt64.v
                                              (FStar.UInt128.__proj__Mkuint128__item__high @x0)))
                                            (BoxInt_proj_0
                                             (FStar.UInt64.v
                                              (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                                           ;; def=FStar.UInt128.fst(867,9-867,67); use=FStar.UInt128.fst(907,2-907,21)
                                           (and
                                            ;; def=FStar.UInt128.fst(867,10-867,37); use=FStar.UInt128.fst(907,2-907,21)
                                            (=
                                             (FStar.UInt64.v
                                              (FStar.UInt128.__proj__Mkuint128__item__high @x0))
                                             (FStar.UInt64.v
                                              (FStar.UInt128.__proj__Mkuint128__item__high @x1)))
                                            ;; def=FStar.UInt128.fst(867,41-867,66); use=FStar.UInt128.fst(907,2-907,21)
                                            (<
                                             (BoxInt_proj_0
                                              (FStar.UInt64.v
                                               (FStar.UInt128.__proj__Mkuint128__item__low @x0)))
                                             (BoxInt_proj_0
                                              (FStar.UInt64.v
                                               (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))))
                                        ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(900,87-908,30)
                                        (forall ((@x13 Term))
                                         (! (implies
                                           (and
                                            (HasType @x13 (FStar.UInt128.t Dummy_value))
                                            ;; def=FStar.UInt128.fst(898,29-908,30); use=FStar.UInt128.fst(900,87-908,30)
                                            (=
                                             @x13
                                             (FStar.UInt128.Mkuint128
                                              (FStar.UInt64.logor
                                               (FStar.UInt64.logand
                                                (FStar.UInt64.gte_mask
                                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                                                (FStar.UInt64.lognot
                                                 (FStar.UInt64.eq_mask
                                                  (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                                  (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                                               (FStar.UInt64.logand
                                                (FStar.UInt64.eq_mask
                                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                                                (FStar.UInt64.gte_mask
                                                 (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                                                 (FStar.UInt128.__proj__Mkuint128__item__low @x1))))
                                              (FStar.UInt64.logor
                                               (FStar.UInt64.logand
                                                (FStar.UInt64.gte_mask
                                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                                                (FStar.UInt64.lognot
                                                 (FStar.UInt64.eq_mask
                                                  (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                                  (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                                               (FStar.UInt64.logand
                                                (FStar.UInt64.eq_mask
                                                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                                                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                                                (FStar.UInt64.gte_mask
                                                 (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                                                 (FStar.UInt128.__proj__Mkuint128__item__low @x1)))))))
                                           ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
                                           (forall ((@x14 Term))
                                            (! (implies
                                              (and
                                               (HasType @x14 (FStar.UInt128.t Dummy_value))
                                               ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                                               (= @x14 @x13))
                                              ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                                              (Valid
                                               ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                                               (ApplyTT @x2 @x14)))
                                             :qid @query.14)))
                                          :qid @query.13)))
                                       :qid @query.12)))
                                    :qid @query.11)))
                                 :qid @query.10)))
                              :qid @query.9)))
                           :qid @query.8)))
                        :qid @query.7)))
                     :qid @query.6)))
                  :qid @query.5)))
               :qid @query.4)))
            :qid @query.3)))
         :qid @query.1))
       ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(900,87-908,30)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (FStar.UInt128.t Dummy_value))
           ;; def=FStar.UInt128.fst(900,21-900,56); use=FStar.UInt128.fst(900,87-908,30)
           (implies
            ;; def=FStar.UInt128.fst(900,22-900,32); use=FStar.UInt128.fst(900,87-908,30)
            (>= (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
            ;; def=FStar.UInt128.fst(900,37-900,55); use=FStar.UInt128.fst(900,87-908,30)
            (= (FStar.UInt128.v @x2) (Prims.op_Subtraction (Prims.pow2 (BoxInt 128)) (BoxInt 1))))
           ;; def=FStar.UInt128.fst(900,60-900,83); use=FStar.UInt128.fst(900,87-908,30)
           (implies
            ;; def=FStar.UInt128.fst(900,61-900,70); use=FStar.UInt128.fst(900,87-908,30)
            (< (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
            ;; def=FStar.UInt128.fst(900,75-900,82); use=FStar.UInt128.fst(900,87-908,30)
            (= (FStar.UInt128.v @x2) (BoxInt 0)))
           ;; def=FStar.UInt128.fsti(129,32-129,99); use=FStar.UInt128.fst(900,87-908,30)
           (=
            (FStar.UInt128.Mkuint128
             (FStar.UInt64.logor
              (FStar.UInt64.logand
               (FStar.UInt64.gte_mask
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1))
               (FStar.UInt64.lognot
                (FStar.UInt64.eq_mask
                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
              (FStar.UInt64.logand
               (FStar.UInt64.eq_mask
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1))
               (FStar.UInt64.gte_mask
                (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                (FStar.UInt128.__proj__Mkuint128__item__low @x1))))
             (FStar.UInt64.logor
              (FStar.UInt64.logand
               (FStar.UInt64.gte_mask
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1))
               (FStar.UInt64.lognot
                (FStar.UInt64.eq_mask
                 (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                 (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
              (FStar.UInt64.logand
               (FStar.UInt64.eq_mask
                (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                (FStar.UInt128.__proj__Mkuint128__item__high @x1))
               (FStar.UInt64.gte_mask
                (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                (FStar.UInt128.__proj__Mkuint128__item__low @x1)))))
            @x2))
          ;; def=FStar.UInt128.fsti(129,37-129,97); use=FStar.UInt128.fst(900,87-908,30)
          (and
           (implies
            ;; def=FStar.UInt128.fsti(129,38-129,48); use=FStar.UInt128.fst(900,87-908,30)
            (>= (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
            ;; def=FStar.UInt128.fsti(129,53-129,69); use=FStar.UInt128.fst(900,87-908,30)
            (or
             label_4
             ;; def=FStar.UInt128.fsti(129,53-129,69); use=FStar.UInt128.fst(900,87-908,30)
             (=
              (FStar.UInt128.v
               (FStar.UInt128.Mkuint128
                (FStar.UInt64.logor
                 (FStar.UInt64.logand
                  (FStar.UInt64.gte_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  (FStar.UInt64.lognot
                   (FStar.UInt64.eq_mask
                    (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                    (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                 (FStar.UInt64.logand
                  (FStar.UInt64.eq_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  (FStar.UInt64.gte_mask
                   (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__low @x1))))
                (FStar.UInt64.logor
                 (FStar.UInt64.logand
                  (FStar.UInt64.gte_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  (FStar.UInt64.lognot
                   (FStar.UInt64.eq_mask
                    (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                    (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                 (FStar.UInt64.logand
                  (FStar.UInt64.eq_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  (FStar.UInt64.gte_mask
                   (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))
              (Prims.op_Subtraction (Prims.pow2 (FStar.UInt128.n Dummy_value)) (BoxInt 1)))))
           (implies
            ;; def=FStar.UInt128.fsti(129,75-129,84); use=FStar.UInt128.fst(900,87-908,30)
            (< (BoxInt_proj_0 (FStar.UInt128.v @x0)) (BoxInt_proj_0 (FStar.UInt128.v @x1)))
            ;; def=FStar.UInt128.fsti(129,89-129,96); use=FStar.UInt128.fst(900,87-908,30)
            (or
             label_5
             ;; def=FStar.UInt128.fsti(129,89-129,96); use=FStar.UInt128.fst(900,87-908,30)
             (=
              (FStar.UInt128.v
               (FStar.UInt128.Mkuint128
                (FStar.UInt64.logor
                 (FStar.UInt64.logand
                  (FStar.UInt64.gte_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  (FStar.UInt64.lognot
                   (FStar.UInt64.eq_mask
                    (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                    (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                 (FStar.UInt64.logand
                  (FStar.UInt64.eq_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  (FStar.UInt64.gte_mask
                   (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__low @x1))))
                (FStar.UInt64.logor
                 (FStar.UInt64.logand
                  (FStar.UInt64.gte_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  (FStar.UInt64.lognot
                   (FStar.UInt64.eq_mask
                    (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                    (FStar.UInt128.__proj__Mkuint128__item__high @x1))))
                 (FStar.UInt64.logand
                  (FStar.UInt64.eq_mask
                   (FStar.UInt128.__proj__Mkuint128__item__high @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__high @x1))
                  (FStar.UInt64.gte_mask
                   (FStar.UInt128.__proj__Mkuint128__item__low @x0)
                   (FStar.UInt128.__proj__Mkuint128__item__low @x1))))))
              (BoxInt 0))))))
         :qid @query.15))))
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
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.gte_mask, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
(declare-fun Tm_refine_72df458a33263103f162261adb7096d8 () Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! (HasType Tm_refine_72df458a33263103f162261adb7096d8 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_72df458a33263103f162261adb7096d8))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.UInt.fsti(53,22-53,36); use=FStar.UInt128.fsti(132,34-132,53)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_72df458a33263103f162261adb7096d8)
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,34-132,53)
      (or
       ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,34-132,53)
       (Valid
        ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,34-132,53)
        (FStar.UInt.size @x1 (FStar.UInt128.n Dummy_value)))
       ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,34-132,53)
       (Valid
        ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,34-132,53)
        (FStar.UInt.size @x1 (BoxInt 64))))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_72df458a33263103f162261adb7096d8))
    :qid refinement_interpretation_Tm_refine_72df458a33263103f162261adb7096d8))
  :named refinement_interpretation_Tm_refine_72df458a33263103f162261adb7096d8))
; haseq for Tm_refine_72df458a33263103f162261adb7096d8
;;; Fact-ids: 
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_72df458a33263103f162261adb7096d8))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_72df458a33263103f162261adb7096d8))

; Encoding query formula : forall (a: FStar.UInt64.t).
;   (* - Subtyping check failed\n  - Expected type Type0 got type Type0 *)
;   forall (b: FStar.UInt128.t).
;     (forall (x: Prims.int).
;         (* - Subtyping check failed\n  - Expected type Prims.nat got type Prims.int *)
;         FStar.UInt128.n >= 0) /\
;     (forall (any_result: Type0).
;         x: Prims.int{FStar.UInt.size x FStar.UInt128.n \/ FStar.UInt.size x 64} == any_result ==>
;         (FStar.UInt.size (FStar.UInt128.v b) FStar.UInt128.n ==>
;           FStar.UInt.size (FStar.UInt128.v b) FStar.UInt128.n \/
;           FStar.UInt.size (FStar.UInt128.v b) 64) /\
;         (forall (return_val:
;             x: Prims.int{FStar.UInt.size x FStar.UInt128.n \/ FStar.UInt.size x 64}).
;             return_val == FStar.UInt128.v b ==>
;             FStar.UInt.size (FStar.UInt64.v a) 64 ==>
;             FStar.UInt.size (FStar.UInt64.v a) FStar.UInt128.n \/
;             FStar.UInt.size (FStar.UInt64.v a) 64))
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.uint64_to_uint128’
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
   ;; def=FStar.UInt128.fsti(132,0-132,53); use=FStar.UInt128.fsti(132,0-132,53)
   (forall ((@x0 Term))
    (! (implies
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fsti(132,25-132,53); use=FStar.UInt128.fsti(132,25-132,53)
      (forall ((@x1 Term))
       (! (implies
         (HasType @x1 (FStar.UInt128.t Dummy_value))
         ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fsti(132,34-132,53)
         (and
          ;; def=FStar.UInt128.fsti(132,34-132,53); use=FStar.UInt128.fsti(132,34-132,53)
          (forall ((@x2 Term))
           (! (implies
             (HasType @x2 Prims.int)
             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(132,38-132,39)
             (or
              label_1
              ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fsti(132,34-132,53)
              (>= (BoxInt_proj_0 (FStar.UInt128.n Dummy_value)) (BoxInt_proj_0 (BoxInt 0)))))
            :qid @query.2))
          ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fsti(132,34-132,53)
          (forall ((@x2 Term))
           (! (implies
             (and
              (HasType @x2 (Tm_type U_zero))
              ;; def=Prims.fst(160,31-160,32); use=FStar.UInt128.fsti(132,34-132,53)
              (= Tm_refine_72df458a33263103f162261adb7096d8 @x2))
             ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fsti(132,34-132,53)
             (and
              (implies
               ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,38-132,41)
               (Valid
                ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,38-132,41)
                (FStar.UInt.size (FStar.UInt128.v @x1) (FStar.UInt128.n Dummy_value)))
               ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,38-132,41)
               (or
                label_2
                ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,38-132,41)
                (Valid
                 ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,38-132,41)
                 (FStar.UInt.size (FStar.UInt128.v @x1) (FStar.UInt128.n Dummy_value)))
                ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,38-132,41)
                (Valid
                 ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,38-132,41)
                 (FStar.UInt.size (FStar.UInt128.v @x1) (BoxInt 64)))))
              ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fsti(132,34-132,53)
              (forall ((@x3 Term))
               (! (implies
                 (and
                  (HasType @x3 Tm_refine_72df458a33263103f162261adb7096d8)
                  ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fsti(132,34-132,53)
                  (= @x3 (FStar.UInt128.v @x1))
                  ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,45-132,52)
                  (Valid
                   ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,45-132,52)
                   (FStar.UInt.size (FStar.UInt64.v @x0) (BoxInt 64))))
                 ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,45-132,52)
                 (or
                  label_3
                  ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,45-132,52)
                  (Valid
                   ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,45-132,52)
                   (FStar.UInt.size (FStar.UInt64.v @x0) (FStar.UInt128.n Dummy_value)))
                  ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,45-132,52)
                  (Valid
                   ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fsti(132,45-132,52)
                   (FStar.UInt.size (FStar.UInt64.v @x0) (BoxInt 64)))))
                :qid @query.4))))
            :qid @query.3))))
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
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.uint64_to_uint128, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t).
;   (* - Could not prove post-condition *)
;   FStar.UInt.size 0 64 /\
;   (forall (any_result: Prims.int).
;       0 == any_result ==>
;       (forall (pure_result: FStar.UInt64.t).
;           FStar.UInt64.v pure_result = 0 ==>
;           0uL == pure_result ==>
;           (forall (any_result: FStar.UInt128.uint128).
;               FStar.UInt128.Mkuint128 a 0uL == any_result ==>
;               FStar.UInt128.v (FStar.UInt128.Mkuint128 a 0uL) == FStar.UInt64.v a)))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let uint64_to_uint128’
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
   (forall ((@x0 Term))
    (! (implies
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(910,36-910,68)
      (and
       ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(910,66-910,67)
       (or
        label_1
        ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(910,66-910,67)
        (Valid
         ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(910,66-910,67)
         (FStar.UInt.size (BoxInt 0) (BoxInt 64))))
       ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(910,36-910,68)
       (forall ((@x1 Term))
        (! (implies
          (and
           (HasType @x1 Prims.int)
           ;; def=FStar.UInt64.fsti(57,15-57,16); use=FStar.UInt128.fst(910,36-910,68)
           (= (BoxInt 0) @x1))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(910,56-910,65)
          (forall ((@x2 Term))
           (! (implies
             (and
              (HasType @x2 (FStar.UInt64.t Dummy_value))
              ;; def=FStar.UInt64.fsti(59,21-59,28); use=FStar.UInt128.fst(910,56-910,65)
              (= (FStar.UInt64.v @x2) (BoxInt 0))
              ;; def=FStar.UInt128.fst(114,36-910,67); use=FStar.UInt128.fst(910,36-910,68)
              (= (FStar.UInt64.uint_to_t (BoxInt 0)) @x2))
             ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(910,36-910,68)
             (forall ((@x3 Term))
              (! (implies
                (and
                 (HasType @x3 FStar.UInt128.uint128)
                 ;; def=FStar.UInt128.fsti(132,34-132,53); use=FStar.UInt128.fst(910,36-910,68)
                 (= (FStar.UInt128.Mkuint128 @x0 (FStar.UInt64.uint_to_t (BoxInt 0))) @x3))
                ;; def=FStar.UInt128.fsti(132,38-132,52); use=FStar.UInt128.fst(910,36-910,68)
                (or
                 label_2
                 ;; def=FStar.UInt128.fsti(132,38-132,52); use=FStar.UInt128.fst(910,36-910,68)
                 (=
                  (FStar.UInt128.v (FStar.UInt128.Mkuint128 @x0 (FStar.UInt64.uint_to_t (BoxInt 0))))
                  (FStar.UInt64.v @x0))))
               :qid @query.3)))
            :qid @query.2)))
         :qid @query.1))))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.uint64_to_uint128, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t).
;   (* - Subtyping check failed\n  - Expected type Type0 got type Type0 *)
;   forall (b: FStar.UInt64.t).
;     (* - Subtyping check failed\n  - Expected type Prims.nonzero got type Prims.pos *)
;     Prims.pow2 64 > 0 ==> Prims.pow2 64 <> 0
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.uint128_to_uint64’
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
   ;; def=FStar.UInt128.fsti(133,0-133,63); use=FStar.UInt128.fsti(133,0-133,63)
   (forall ((@x0 Term))
    (! (implies
      (HasType @x0 (FStar.UInt128.t Dummy_value))
      ;; def=FStar.UInt128.fsti(133,25-133,63); use=FStar.UInt128.fsti(133,25-133,63)
      (forall ((@x1 Term))
       (! (implies
         (and
          (HasType @x1 (FStar.UInt64.t Dummy_value))
          ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fsti(133,55-133,62)
          (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 64))) (BoxInt_proj_0 (BoxInt 0))))
         ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fsti(133,55-133,62)
         (or
          label_1
          ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fsti(133,55-133,62)
          (not (= (Prims.pow2 (BoxInt 64)) (BoxInt 0)))))
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
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.uint128_to_uint64, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt128.t).
;   (forall (b: FStar.UInt64.t).
;       (* - Subtyping check failed\n  - Expected type Prims.nonzero got type Prims.pos *)
;       Prims.pow2 64 > 0 ==> Prims.pow2 64 <> 0) /\
;   FStar.UInt64.v a.low == FStar.UInt128.v a % Prims.pow2 64
; Context: While encoding a query
; While typechecking the top-level declaration ‘let uint128_to_uint64’
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
   (forall ((@x0 Term))
    (! (implies
      (HasType @x0 (FStar.UInt128.t Dummy_value))
      ;; def=FStar.UInt128.fst(912,30-912,71); use=FStar.UInt128.fst(912,30-912,71)
      (and
       ;; def=FStar.UInt128.fst(912,66-912,71); use=FStar.UInt128.fst(912,66-912,71)
       (forall ((@x1 Term))
        (! (implies
          (and
           (HasType @x1 (FStar.UInt64.t Dummy_value))
           ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(912,66-912,71)
           (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 64))) (BoxInt_proj_0 (BoxInt 0))))
          ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(912,55-912,62)
          (or
           label_1
           ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(912,66-912,71)
           (not (= (Prims.pow2 (BoxInt 64)) (BoxInt 0)))))
         :qid @query.1))
       ;; def=FStar.UInt128.fst(912,38-912,62); use=FStar.UInt128.fst(912,66-912,71)
       (or
        label_2
        ;; def=FStar.UInt128.fst(912,38-912,62); use=FStar.UInt128.fst(912,66-912,71)
        (=
         (FStar.UInt64.v (FStar.UInt128.__proj__Mkuint128__item__low @x0))
         (Prims.op_Modulus (FStar.UInt128.v @x0) (Prims.pow2 (BoxInt 64)))))))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.uint128_to_uint64, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : FStar.UInt.size 0xffffffff 64 /\
; (forall (any_result: Prims.int).
;     0xffffffff == any_result ==>
;     (forall (pure_result: FStar.UInt64.t).
;         FStar.UInt64.v pure_result = 0xffffffff ==>
;         0xffffffffuL == pure_result ==> 4294967295 == Prims.pow2 32 - 1))
; Context: While encoding a query
; While checking for top-level effects
; While typechecking the top-level declaration ‘let u64_l32_mask’
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
   ;; def=Prims.fst(427,77-427,89); use=Prims.fst(427,77-427,89)
   (and
    ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(915,66-915,76)
    (or
     label_1
     ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(915,66-915,76)
     (Valid
      ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(915,66-915,76)
      (FStar.UInt.size (BoxInt 4294967295) (BoxInt 64))))
    ;; def=Prims.fst(419,66-419,102); use=Prims.fst(422,31-422,44)
    (forall ((@x0 Term))
     (! (implies
       (and
        (HasType @x0 Prims.int)
        ;; def=FStar.UInt64.fsti(57,15-57,16); use=FStar.UInt64.fsti(57,15-57,16)
        (= (BoxInt 4294967295) @x0))
       ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(915,56-915,65)
       (forall ((@x1 Term))
        (! (implies
          (and
           (HasType @x1 (FStar.UInt64.t Dummy_value))
           ;; def=FStar.UInt64.fsti(59,21-59,28); use=FStar.UInt128.fst(915,56-915,65)
           (= (FStar.UInt64.v @x1) (BoxInt 4294967295))
           ;; def=FStar.UInt128.fst(915,18-915,76); use=FStar.UInt128.fst(915,18-915,76)
           (= (FStar.UInt64.uint_to_t (BoxInt 4294967295)) @x1))
          ;; def=FStar.UInt128.fst(915,26-915,48); use=FStar.UInt128.fst(915,52-915,76)
          (or
           label_2
           ;; def=FStar.UInt128.fst(915,26-915,48); use=FStar.UInt128.fst(915,52-915,76)
           (= (BoxInt 4294967295) (Prims.op_Subtraction (Prims.pow2 (BoxInt 32)) (BoxInt 1)))))
         :qid @query.1)))
      :qid @query))))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_l32_mask, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt128.u64_l32_mask (Dummy_sort) Term)
(declare-fun Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5 () Term)
; Equation for FStar.UInt128.u64_l32_mask
;;; Fact-ids: Name FStar.UInt128.u64_l32_mask; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(915,4-915,16); use=FStar.UInt128.fst(915,4-915,16)
  (forall ((@u0 Dummy_sort))
   (! (=
     ;; def=FStar.UInt128.fst(915,4-915,16); use=FStar.UInt128.fst(915,4-915,16)
     (FStar.UInt128.u64_l32_mask @u0)
     (FStar.UInt64.uint_to_t (BoxInt 4294967295)))
    :pattern
     (;; def=FStar.UInt128.fst(915,4-915,16); use=FStar.UInt128.fst(915,4-915,16)
      (FStar.UInt128.u64_l32_mask @u0))
    :qid equation_FStar.UInt128.u64_l32_mask))
  :named equation_FStar.UInt128.u64_l32_mask))
; haseq for Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5
;;; Fact-ids: Name FStar.UInt128.u64_l32_mask; Namespace FStar.UInt128
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5))
   (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
  :named haseqTm_refine_48c02aeb52d751253bb6cbc645e3d0a5))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt128.u64_l32_mask; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(915,18-915,49); use=FStar.UInt128.fst(915,18-915,49)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5)
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(915,26-915,48); use=FStar.UInt128.fst(915,26-915,48)
      (= (FStar.UInt64.v @x1) (Prims.op_Subtraction (Prims.pow2 (BoxInt 32)) (BoxInt 1)))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5))
    :qid refinement_interpretation_Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5))
  :named refinement_interpretation_Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5))
; refinement kinding
;;; Fact-ids: Name FStar.UInt128.u64_l32_mask; Namespace FStar.UInt128
(assert
 (! (HasType Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5))
; free var typing
;;; Fact-ids: Name FStar.UInt128.u64_l32_mask; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(915,4-915,16); use=FStar.UInt128.fst(915,4-915,16)
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt128.u64_l32_mask @u0) Tm_refine_48c02aeb52d751253bb6cbc645e3d0a5)
    :pattern ((FStar.UInt128.u64_l32_mask @u0))
    :qid typing_FStar.UInt128.u64_l32_mask))
  :named typing_FStar.UInt128.u64_l32_mask))
(push) ;; push{1
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: FStar.UInt64.t).
;   (forall (r: FStar.UInt64.t).
;       (* - Could not prove post-condition *) Prims.pow2 32 > 0 ==> Prims.pow2 32 <> 0) /\
;   (forall (p: Prims.pure_post FStar.UInt64.t).
;       (forall (pure_result: FStar.UInt64.t).
;           FStar.UInt64.v pure_result = FStar.UInt64.v a % Prims.pow2 32 ==> p pure_result) ==>
;       (forall (pure_result: Prims.unit).
;           Prims.pow2 32 < Prims.pow2 64 /\
;           FStar.UInt.logand (FStar.UInt64.v a) (Prims.pow2 32 - 1) ==
;           FStar.UInt64.v a % Prims.pow2 32 ==>
;           (forall (pure_result: FStar.UInt64.t).
;               FStar.UInt.logand (FStar.UInt64.v a) (FStar.UInt64.v FStar.UInt128.u64_l32_mask) =
;               FStar.UInt64.v pure_result ==>
;               pure_result == FStar.UInt64.logand a FStar.UInt128.u64_l32_mask ==>
;               (forall (return_val: FStar.UInt64.t). return_val == pure_result ==> p return_val))))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_mod_32’
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
   (forall ((@x0 Term))
    (! (implies
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.UInt128.fst(920,2-921,27); use=FStar.UInt128.fst(920,2-921,27)
       (forall ((@x1 Term))
        (! (implies
          (and
           (HasType @x1 (FStar.UInt64.t Dummy_value))
           ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(920,2-921,27)
           (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0))))
          ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(919,41-919,48)
          (or
           label_1
           ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(920,2-921,27)
           (not (= (Prims.pow2 (BoxInt 32)) (BoxInt 0)))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x1 Term))
        (! (implies
          (and
           (HasType @x1 (Prims.pure_post U_zero (FStar.UInt64.t Dummy_value)))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(920,2-921,27)
           (forall ((@x2 Term))
            (! (implies
              (and
               (or label_2 (HasType @x2 (FStar.UInt64.t Dummy_value)))
               ;; def=FStar.UInt128.fst(919,21-919,48); use=FStar.UInt128.fst(920,2-921,27)
               (or
                label_3
                ;; def=FStar.UInt128.fst(919,21-919,48); use=FStar.UInt128.fst(920,2-921,27)
                (=
                 (FStar.UInt64.v @x2)
                 (Prims.op_Modulus (FStar.UInt64.v @x0) (Prims.pow2 (BoxInt 32))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(920,2-921,27)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(920,2-921,27)
               (ApplyTT @x1 @x2)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(920,2-921,27)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(920,2-921,27)
                (ApplyTT @x1 @x2)))
             :qid @query.3)))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(920,7-920,18)
          (forall ((@x2 Term))
           (! (implies
             (and
              (HasType @x2 Prims.unit)
              ;; def=FStar.UInt.fsti(443,9-443,24); use=FStar.UInt128.fst(920,7-920,18)
              (< (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (Prims.pow2 (BoxInt 64))))
              ;; def=FStar.UInt.fsti(443,28-443,66); use=FStar.UInt128.fst(920,7-920,18)
              (=
               (FStar.UInt.logand
                (BoxInt 64)
                (FStar.UInt64.v @x0)
                (Prims.op_Subtraction (Prims.pow2 (BoxInt 32)) (BoxInt 1)))
               (Prims.op_Modulus (FStar.UInt64.v @x0) (Prims.pow2 (BoxInt 32)))))
             ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(921,6-921,12)
             (forall ((@x3 Term))
              (! (implies
                (and
                 (HasType @x3 (FStar.UInt64.t Dummy_value))
                 ;; def=FStar.UInt64.fsti(187,21-187,43); use=FStar.UInt128.fst(921,6-921,12)
                 (=
                  (FStar.UInt.logand
                   (BoxInt 64)
                   (FStar.UInt64.v @x0)
                   (FStar.UInt64.v (FStar.UInt128.u64_l32_mask Dummy_value)))
                  (FStar.UInt64.v @x3))
                 ;; def=FStar.UInt128.fst(917,33-921,27); use=FStar.UInt128.fst(920,2-921,27)
                 (= @x3 (FStar.UInt64.logand @x0 (FStar.UInt128.u64_l32_mask Dummy_value))))
                ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
                (forall ((@x4 Term))
                 (! (implies
                   (and
                    (HasType @x4 (FStar.UInt64.t Dummy_value))
                    ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                    (= @x4 @x3))
                   ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                   (Valid
                    ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                    (ApplyTT @x1 @x4)))
                  :qid @query.6)))
               :qid @query.5)))
            :qid @query.4)))
         :qid @query.2))))
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
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_mod_32, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
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
 (! ;; def=FStar.UInt128.fst(124,20-124,34); use=FStar.UInt128.fst(924,2-924,9)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_afd51579b90d50ea23e03b743a1fa001)
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.UInt128.fst(124,27-124,32); use=FStar.UInt128.fst(924,2-924,9)
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
; Encoding query formula : forall (a: FStar.UInt64.t).
;   (forall (_: Prims.squash Prims.l_True).
;       (* - Could not prove post-condition *)
;       (Prims.pow2 32 > 0 ==> Prims.pow2 32 <> 0) /\
;       (forall (return_val: Prims.nonzero).
;           return_val == Prims.pow2 32 ==>
;           (forall (any_result: Prims.int).
;               FStar.UInt64.v a / Prims.pow2 32 == any_result ==>
;               (forall (any_result: Prims.int).
;                   FStar.UInt64.v a / Prims.pow2 32 * Prims.pow2 32 == any_result ==>
;                   Prims.pow2 32 > 0 ==> Prims.pow2 32 <> 0)))) /\
;   (forall (p: Prims.pure_post Prims.unit).
;       (forall (pure_result: Prims.unit).
;           FStar.UInt64.v a / Prims.pow2 32 * Prims.pow2 32 + FStar.UInt64.v a % Prims.pow2 32 ==
;           FStar.UInt64.v a ==>
;           p pure_result) ==>
;       (FStar.UInt.size (FStar.UInt64.v a) 64 ==> FStar.UInt64.v a >= 0) /\
;       (forall (return_val: Prims.nat).
;           return_val == FStar.UInt64.v a ==>
;           (Prims.pow2 32 > 0 ==> Prims.pow2 32 >= 0 /\ Prims.pow2 32 > 0) /\
;           (forall (return_val: k: Prims.nat{k > 0}).
;               return_val == Prims.pow2 32 ==>
;               (forall (pure_result: Prims.unit).
;                   FStar.UInt64.v a / Prims.pow2 32 * Prims.pow2 32 +
;                   FStar.UInt64.v a % Prims.pow2 32 ==
;                   FStar.UInt64.v a ==>
;                   p pure_result))))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u64_32_digits’
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
   (forall ((@x0 Term))
    (! (implies
      (HasType @x0 (FStar.UInt64.t Dummy_value))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.UInt128.fst(924,2-924,29); use=FStar.UInt128.fst(924,2-924,29)
       (forall ((@x1 Term))
        (! (implies
          (HasType @x1 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9)
          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(924,2-924,29)
          (and
           (implies
            ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(924,2-924,29)
            (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0)))
            ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(923,48-923,55)
            (or
             label_1
             ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(924,2-924,29)
             (not (= (Prims.pow2 (BoxInt 32)) (BoxInt 0)))))
           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(924,2-924,29)
           (forall ((@x2 Term))
            (! (implies
              (and
               (HasType @x2 Prims.nonzero)
               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(924,2-924,29)
               (= @x2 (Prims.pow2 (BoxInt 32))))
              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(924,2-924,29)
              (forall ((@x3 Term))
               (! (implies
                 (and
                  (HasType @x3 Prims.int)
                  ;; def=FStar.UInt128.fst(923,37-923,97); use=FStar.UInt128.fst(924,2-924,29)
                  (= (Prims.op_Division (FStar.UInt64.v @x0) (Prims.pow2 (BoxInt 32))) @x3))
                 ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(924,2-924,29)
                 (forall ((@x4 Term))
                  (! (implies
                    (and
                     (HasType @x4 Prims.int)
                     ;; def=FStar.UInt128.fst(923,37-923,97); use=FStar.UInt128.fst(924,2-924,29)
                     (=
                      (Prims.op_Star
                       (Prims.op_Division (FStar.UInt64.v @x0) (Prims.pow2 (BoxInt 32)))
                       (Prims.pow2 (BoxInt 32)))
                      @x4)
                     ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(924,2-924,29)
                     (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0))))
                    ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(923,78-923,85)
                    (or
                     label_2
                     ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(924,2-924,29)
                     (not (= (Prims.pow2 (BoxInt 32)) (BoxInt 0)))))
                   :qid @query.4)))
                :qid @query.3)))
             :qid @query.2))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x1 Term))
        (! (implies
          (and
           (HasType @x1 (Prims.pure_post U_zero Prims.unit))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(924,2-924,29)
           (forall ((@x2 Term))
            (! (implies
              (and
               (or label_3 (HasType @x2 Prims.unit))
               ;; def=FStar.UInt128.fst(923,37-923,97); use=FStar.UInt128.fst(924,2-924,29)
               (or
                label_4
                ;; def=FStar.UInt128.fst(923,37-923,97); use=FStar.UInt128.fst(924,2-924,29)
                (=
                 (Prims.op_Addition
                  (Prims.op_Star
                   (Prims.op_Division (FStar.UInt64.v @x0) (Prims.pow2 (BoxInt 32)))
                   (Prims.pow2 (BoxInt 32)))
                  (Prims.op_Modulus (FStar.UInt64.v @x0) (Prims.pow2 (BoxInt 32))))
                 (FStar.UInt64.v @x0))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(924,2-924,29)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(924,2-924,29)
               (ApplyTT @x1 @x2)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(924,2-924,29)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(924,2-924,29)
                (ApplyTT @x1 @x2)))
             :qid @query.6)))
          ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(924,2-924,29)
          (and
           (implies
            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(924,10-924,19)
            (Valid
             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(924,10-924,19)
             (FStar.UInt.size (FStar.UInt64.v @x0) (BoxInt 64)))
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(924,10-924,19)
            (or
             label_5
             ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(924,10-924,19)
             (>= (BoxInt_proj_0 (FStar.UInt64.v @x0)) (BoxInt_proj_0 (BoxInt 0)))))
           ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(924,2-924,29)
           (forall ((@x2 Term))
            (! (implies
              (and
               (HasType @x2 Prims.nat)
               ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(924,2-924,29)
               (= @x2 (FStar.UInt64.v @x0)))
              ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(924,2-924,29)
              (and
               (implies
                ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(924,20-924,29)
                (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0)))
                ;; def=FStar.UInt128.fst(124,27-124,32); use=FStar.UInt128.fst(924,20-924,29)
                (and
                 ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(924,20-924,29)
                 (or
                  label_6
                  ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(924,20-924,29)
                  (>= (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0))))
                 ;; def=FStar.UInt128.fst(124,27-124,32); use=FStar.UInt128.fst(924,20-924,29)
                 (or
                  label_7
                  ;; def=FStar.UInt128.fst(124,27-124,32); use=FStar.UInt128.fst(924,20-924,29)
                  (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0))))))
               ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(924,2-924,29)
               (forall ((@x3 Term))
                (! (implies
                  (and
                   (HasType @x3 Tm_refine_afd51579b90d50ea23e03b743a1fa001)
                   ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(924,2-924,29)
                   (= @x3 (Prims.pow2 (BoxInt 32))))
                  ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(924,2-924,9)
                  (forall ((@x4 Term))
                   (! (implies
                     (and
                      (HasType @x4 Prims.unit)
                      ;; def=FStar.UInt128.fst(124,43-124,67); use=FStar.UInt128.fst(924,2-924,9)
                      (=
                       (Prims.op_Addition
                        (Prims.op_Star
                         (Prims.op_Division (FStar.UInt64.v @x0) (Prims.pow2 (BoxInt 32)))
                         (Prims.pow2 (BoxInt 32)))
                        (Prims.op_Modulus (FStar.UInt64.v @x0) (Prims.pow2 (BoxInt 32))))
                       (FStar.UInt64.v @x0)))
                     ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(924,2-924,9)
                     (Valid
                      ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(924,2-924,9)
                      (ApplyTT @x1 @x4)))
                    :qid @query.9)))
                 :qid @query.8))))
             :qid @query.7))))
         :qid @query.5))))
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
(echo "label_7")
(echo "label_6")
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u64_32_digits, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)

; Encoding query formula : forall (x: FStar.UInt.uint_t 64) (y: FStar.UInt.uint_t 32) (_: Prims.squash Prims.l_True).
;   (* - Could not prove post-condition *)
;   (Prims.pow2 32 > 0 ==> Prims.pow2 32 <> 0) /\
;   (forall (return_val: Prims.nonzero).
;       return_val == Prims.pow2 32 ==>
;       (forall (any_result: Prims.int).
;           x / Prims.pow2 32 == any_result ==>
;           (forall (any_result: Prims.int).
;               x / Prims.pow2 32 * y == any_result ==>
;               (forall (any_result: Prims.int).
;                   x / Prims.pow2 32 * y * Prims.pow2 32 == any_result ==>
;                   Prims.pow2 32 > 0 ==> Prims.pow2 32 <> 0))))
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.mul32_digits’
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
   ;; def=FStar.UInt128.fst(926,0-927,66); use=FStar.UInt128.fst(926,0-927,66)
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 (FStar.UInt.uint_t (BoxInt 64)))
       (HasType @x1 (FStar.UInt.uint_t (BoxInt 32)))
       (HasType @x2 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
      ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(927,8-927,66)
      (and
       (implies
        ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(927,23-927,30)
        (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0)))
        ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(927,23-927,30)
        (or
         label_1
         ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(927,23-927,30)
         (not (= (Prims.pow2 (BoxInt 32)) (BoxInt 0)))))
       ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(927,8-927,66)
       (forall ((@x3 Term))
        (! (implies
          (and
           (HasType @x3 Prims.nonzero)
           ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(927,8-927,66)
           (= @x3 (Prims.pow2 (BoxInt 32))))
          ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(927,8-927,66)
          (forall ((@x4 Term))
           (! (implies
             (and
              (HasType @x4 Prims.int)
              ;; def=FStar.UInt128.fst(927,8-927,66); use=FStar.UInt128.fst(927,8-927,66)
              (= (Prims.op_Division @x0 (Prims.pow2 (BoxInt 32))) @x4))
             ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(927,8-927,66)
             (forall ((@x5 Term))
              (! (implies
                (and
                 (HasType @x5 Prims.int)
                 ;; def=FStar.UInt128.fst(927,8-927,66); use=FStar.UInt128.fst(927,8-927,66)
                 (= (Prims.op_Star (Prims.op_Division @x0 (Prims.pow2 (BoxInt 32))) @x1) @x5))
                ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(927,8-927,66)
                (forall ((@x6 Term))
                 (! (implies
                   (and
                    (HasType @x6 Prims.int)
                    ;; def=FStar.UInt128.fst(927,8-927,66); use=FStar.UInt128.fst(927,8-927,66)
                    (=
                     (Prims.op_Star
                      (Prims.op_Star (Prims.op_Division @x0 (Prims.pow2 (BoxInt 32))) @x1)
                      (Prims.pow2 (BoxInt 32)))
                     @x6)
                    ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(927,53-927,60)
                    (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0))))
                   ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(927,53-927,60)
                   (or
                    label_2
                    ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(927,53-927,60)
                    (not (= (Prims.pow2 (BoxInt 32)) (BoxInt 0)))))
                  :qid @query.4)))
               :qid @query.3)))
            :qid @query.2)))
         :qid @query.1))))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.mul32_digits, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (x: FStar.UInt.uint_t 64) (y: FStar.UInt.uint_t 32).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         x * y == x / Prims.pow2 32 * y * Prims.pow2 32 + x % Prims.pow2 32 * y ==> p pure_result) ==>
;     (forall (any_result: Prims.unit). p any_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let mul32_digits’
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
      (and
       (HasType @x0 (FStar.UInt.uint_t (BoxInt 64)))
       (HasType @x1 (FStar.UInt.uint_t (BoxInt 32))))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.unit))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(928,23-928,25)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              ;; def=FStar.UInt128.fst(927,8-927,66); use=FStar.UInt128.fst(928,23-928,25)
              (or
               label_2
               ;; def=FStar.UInt128.fst(927,8-927,66); use=FStar.UInt128.fst(928,23-928,25)
               (=
                (Prims.op_Star @x0 @x1)
                (Prims.op_Addition
                 (Prims.op_Star
                  (Prims.op_Star (Prims.op_Division @x0 (Prims.pow2 (BoxInt 32))) @x1)
                  (Prims.pow2 (BoxInt 32)))
                 (Prims.op_Star (Prims.op_Modulus @x0 (Prims.pow2 (BoxInt 32))) @x1)))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(928,23-928,25)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(928,23-928,25)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(928,23-928,25)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(928,23-928,25)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(419,66-419,102); use=Prims.fst(422,31-422,44)
         (forall ((@x3 Term))
          (! (implies
            (HasType @x3 Prims.unit)
            ;; def=Prims.fst(419,90-419,102); use=Prims.fst(422,31-422,44)
            (Valid
             ;; def=Prims.fst(419,90-419,102); use=Prims.fst(422,31-422,44)
             (ApplyTT @x2 @x3)))
           :qid @query.3)))
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
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.mul32_digits, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)
; Encoding query formula : FStar.UInt.size 32 32
; Context: While encoding a query
; While checking for top-level effects
; While typechecking the top-level declaration ‘let u32_32’
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
   ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(930,52-930,54)
   (or
    label_1
    ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(930,52-930,54)
    (Valid
     ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(930,52-930,54)
     (FStar.UInt.size (BoxInt 32) (BoxInt 32)))))
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
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u32_32, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(declare-fun FStar.UInt128.u32_32 (Dummy_sort) Term)
(declare-fun Tm_refine_abdf9dfe68d7634503222a934e1ba5a5 () Term)
; Equation for FStar.UInt128.u32_32
;;; Fact-ids: Name FStar.UInt128.u32_32; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(930,4-930,10); use=FStar.UInt128.fst(930,4-930,10)
  (forall ((@u0 Dummy_sort))
   (! (=
     ;; def=FStar.UInt128.fst(930,4-930,10); use=FStar.UInt128.fst(930,4-930,10)
     (FStar.UInt128.u32_32 @u0)
     (FStar.UInt32.uint_to_t (BoxInt 32)))
    :pattern
     (;; def=FStar.UInt128.fst(930,4-930,10); use=FStar.UInt128.fst(930,4-930,10)
      (FStar.UInt128.u32_32 @u0))
    :qid equation_FStar.UInt128.u32_32))
  :named equation_FStar.UInt128.u32_32))
; haseq for Tm_refine_abdf9dfe68d7634503222a934e1ba5a5
;;; Fact-ids: Name FStar.UInt128.u32_32; Namespace FStar.UInt128
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_abdf9dfe68d7634503222a934e1ba5a5))
   (Valid (Prims.hasEq U_zero (FStar.UInt32.t Dummy_value))))
  :named haseqTm_refine_abdf9dfe68d7634503222a934e1ba5a5))
; refinement_interpretation
;;; Fact-ids: Name FStar.UInt128.u32_32; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(930,13-930,35); use=FStar.UInt128.fst(930,13-930,35)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_abdf9dfe68d7634503222a934e1ba5a5)
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      ;; def=FStar.UInt128.fst(930,21-930,34); use=FStar.UInt128.fst(930,21-930,34)
      (= (FStar.UInt32.v @x1) (BoxInt 32))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_abdf9dfe68d7634503222a934e1ba5a5))
    :qid refinement_interpretation_Tm_refine_abdf9dfe68d7634503222a934e1ba5a5))
  :named refinement_interpretation_Tm_refine_abdf9dfe68d7634503222a934e1ba5a5))
; refinement kinding
;;; Fact-ids: Name FStar.UInt128.u32_32; Namespace FStar.UInt128
(assert
 (! (HasType Tm_refine_abdf9dfe68d7634503222a934e1ba5a5 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_abdf9dfe68d7634503222a934e1ba5a5))
; free var typing
;;; Fact-ids: Name FStar.UInt128.u32_32; Namespace FStar.UInt128
(assert
 (! ;; def=FStar.UInt128.fst(930,4-930,10); use=FStar.UInt128.fst(930,4-930,10)
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt128.u32_32 @u0) Tm_refine_abdf9dfe68d7634503222a934e1ba5a5)
    :pattern ((FStar.UInt128.u32_32 @u0))
    :qid typing_FStar.UInt128.u32_32))
  :named typing_FStar.UInt128.u32_32))
(push) ;; push{1
(declare-fun label_5 () Bool)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
(declare-fun Tm_refine_cde1ca397051832c6c262860f5dc341d (Term) Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=FStar.UInt128.fst(936,2-936,39)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_cde1ca397051832c6c262860f5dc341d @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_cde1ca397051832c6c262860f5dc341d @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_cde1ca397051832c6c262860f5dc341d))
  :named refinement_kinding_Tm_refine_cde1ca397051832c6c262860f5dc341d))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=FStar.UInt128.fst(936,2-936,39)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_cde1ca397051832c6c262860f5dc341d @x2))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt64.t Dummy_value))
      ;; def=FStar.UInt128.fst(934,12-934,32); use=FStar.UInt128.fst(936,2-936,39)
      (< (BoxInt_proj_0 (FStar.UInt64.v @x2)) (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_cde1ca397051832c6c262860f5dc341d @x2)))
    :qid refinement_interpretation_Tm_refine_cde1ca397051832c6c262860f5dc341d))
  :named refinement_interpretation_Tm_refine_cde1ca397051832c6c262860f5dc341d))
; haseq for Tm_refine_cde1ca397051832c6c262860f5dc341d
;;; Fact-ids: 
(assert
 (! ;; def=Prims.fst(281,39-281,48); use=FStar.UInt128.fst(936,2-936,39)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_cde1ca397051832c6c262860f5dc341d @x0)))
     (Valid (Prims.hasEq U_zero (FStar.UInt64.t Dummy_value))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_cde1ca397051832c6c262860f5dc341d @x0))))
    :qid haseqTm_refine_cde1ca397051832c6c262860f5dc341d))
  :named haseqTm_refine_cde1ca397051832c6c262860f5dc341d))
; Encoding query formula : forall (hi: FStar.UInt64.t) (lo: FStar.UInt64.t).
;   (forall (r: _: FStar.UInt64.t{FStar.UInt64.v lo < Prims.pow2 32}).
;       (* - Could not prove post-condition *) Prims.pow2 32 > 0 ==> Prims.pow2 32 <> 0) /\
;   (forall (p: Prims.pure_post FStar.UInt64.t).
;       FStar.UInt64.v lo < Prims.pow2 32 /\
;       (forall (pure_result: FStar.UInt64.t).
;           FStar.UInt64.v pure_result =
;           FStar.UInt64.v hi % Prims.pow2 32 * Prims.pow2 32 + FStar.UInt64.v lo ==>
;           p pure_result) ==>
;       FStar.UInt32.v FStar.UInt128.u32_32 < 64 /\
;       (forall (pure_result: FStar.UInt64.t).
;           FStar.UInt.shift_left (FStar.UInt64.v hi) (FStar.UInt32.v FStar.UInt128.u32_32) =
;           FStar.UInt64.v pure_result ==>
;           FStar.UInt64.shift_left hi FStar.UInt128.u32_32 == pure_result ==>
;           FStar.UInt.size (FStar.UInt64.v lo +
;               FStar.UInt64.v (FStar.UInt64.shift_left hi FStar.UInt128.u32_32))
;             64 /\
;           (forall (pure_result: FStar.UInt64.t).
;               FStar.UInt64.v lo + FStar.UInt64.v (FStar.UInt64.shift_left hi FStar.UInt128.u32_32) =
;               FStar.UInt64.v pure_result ==>
;               pure_result == FStar.UInt64.add lo (FStar.UInt64.shift_left hi FStar.UInt128.u32_32) ==>
;               (forall (return_val: FStar.UInt64.t). return_val == pure_result ==> p return_val))))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u32_combine’
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
      (and
       ;; def=FStar.UInt128.fst(936,2-936,39); use=FStar.UInt128.fst(936,2-936,39)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Tm_refine_cde1ca397051832c6c262860f5dc341d @x1))
           ;; def=Prims.fst(645,18-645,23); use=FStar.UInt128.fst(936,2-936,39)
           (> (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))) (BoxInt_proj_0 (BoxInt 0))))
          ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(935,42-935,49)
          (or
           label_1
           ;; def=Prims.fst(648,22-648,28); use=FStar.UInt128.fst(936,2-936,39)
           (not (= (Prims.pow2 (BoxInt 32)) (BoxInt 0)))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt64.t Dummy_value)))
           ;; def=FStar.UInt128.fst(934,12-934,32); use=FStar.UInt128.fst(936,2-936,39)
           (< (BoxInt_proj_0 (FStar.UInt64.v @x1)) (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(936,2-936,39)
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_2 (HasType @x3 (FStar.UInt64.t Dummy_value)))
               ;; def=FStar.UInt128.fst(935,21-935,70); use=FStar.UInt128.fst(936,2-936,39)
               (or
                label_3
                ;; def=FStar.UInt128.fst(935,21-935,70); use=FStar.UInt128.fst(936,2-936,39)
                (=
                 (FStar.UInt64.v @x3)
                 (Prims.op_Addition
                  (Prims.op_Star
                   (Prims.op_Modulus (FStar.UInt64.v @x0) (Prims.pow2 (BoxInt 32)))
                   (Prims.pow2 (BoxInt 32)))
                  (FStar.UInt64.v @x1)))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(936,2-936,39)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(936,2-936,39)
               (ApplyTT @x2 @x3)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(936,2-936,39)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(936,2-936,39)
                (ApplyTT @x2 @x3)))
             :qid @query.3)))
          ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(936,18-936,28)
          (and
           ;; def=FStar.UInt64.fsti(213,12-213,28); use=FStar.UInt128.fst(936,18-936,28)
           (or
            label_4
            ;; def=FStar.UInt64.fsti(213,12-213,28); use=FStar.UInt128.fst(936,18-936,28)
            (<
             (BoxInt_proj_0 (FStar.UInt32.v (FStar.UInt128.u32_32 Dummy_value)))
             (BoxInt_proj_0 (BoxInt 64))))
           ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(936,18-936,28)
           (forall ((@x3 Term))
            (! (implies
              (and
               (HasType @x3 (FStar.UInt64.t Dummy_value))
               ;; def=FStar.UInt64.fsti(214,21-214,67); use=FStar.UInt128.fst(936,18-936,28)
               (=
                (FStar.UInt.shift_left
                 (BoxInt 64)
                 (FStar.UInt64.v @x0)
                 (FStar.UInt32.v (FStar.UInt128.u32_32 Dummy_value)))
                (FStar.UInt64.v @x3))
               ;; def=FStar.UInt64.fsti(87,15-87,16); use=FStar.UInt128.fst(936,2-936,39)
               (= (FStar.UInt64.shift_left @x0 (FStar.UInt128.u32_32 Dummy_value)) @x3))
              ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(936,6-936,9)
              (and
               ;; def=FStar.UInt64.fsti(88,12-88,32); use=FStar.UInt128.fst(936,6-936,9)
               (or
                label_5
                ;; def=FStar.UInt64.fsti(88,12-88,32); use=FStar.UInt128.fst(936,6-936,9)
                (Valid
                 ;; def=FStar.UInt64.fsti(88,12-88,32); use=FStar.UInt128.fst(936,6-936,9)
                 (FStar.UInt.size
                  (Prims.op_Addition
                   (FStar.UInt64.v @x1)
                   (FStar.UInt64.v (FStar.UInt64.shift_left @x0 (FStar.UInt128.u32_32 Dummy_value))))
                  (BoxInt 64))))
               ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(936,6-936,9)
               (forall ((@x4 Term))
                (! (implies
                  (and
                   (HasType @x4 (FStar.UInt64.t Dummy_value))
                   ;; def=FStar.UInt64.fsti(89,21-89,36); use=FStar.UInt128.fst(936,6-936,9)
                   (=
                    (Prims.op_Addition
                     (FStar.UInt64.v @x1)
                     (FStar.UInt64.v
                      (FStar.UInt64.shift_left @x0 (FStar.UInt128.u32_32 Dummy_value))))
                    (FStar.UInt64.v @x4))
                   ;; def=FStar.UInt128.fst(933,38-936,39); use=FStar.UInt128.fst(936,2-936,39)
                   (=
                    @x4
                    (FStar.UInt64.add
                     @x1
                     (FStar.UInt64.shift_left @x0 (FStar.UInt128.u32_32 Dummy_value)))))
                  ;; def=Prims.fst(322,2-322,58); use=Prims.fst(394,19-394,31)
                  (forall ((@x5 Term))
                   (! (implies
                     (and
                      (HasType @x5 (FStar.UInt64.t Dummy_value))
                      ;; def=Prims.fst(322,26-322,41); use=Prims.fst(394,19-394,31)
                      (= @x5 @x4))
                     ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                     (Valid
                      ;; def=Prims.fst(322,46-322,58); use=Prims.fst(394,19-394,31)
                      (ApplyTT @x2 @x5)))
                    :qid @query.6)))
                 :qid @query.5))))
             :qid @query.4))))
         :qid @query.2))))
     :qid @query)))
  :named @query))
(set-option :rlimit 15000000)
(echo "<initial_stats>")
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "</initial_stats>")
(echo "<result>")
(check-sat)
(echo "</result>")
(set-option :rlimit 0)
(echo "<reason-unknown>") (get-info :reason-unknown) (echo "</reason-unknown>")
(echo "<labels>")
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u32_combine, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_5 () Bool)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (a: Prims.nat) (b: Prims.nat) (k: Prims.pos).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     a < k /\ b < k /\
;     (forall (pure_result: Prims.unit). a * b <= k * k - 2 * k + 1 ==> p pure_result) ==>
;     a <= k - 1 /\
;     (forall (pure_result: Prims.unit).
;         a * b <= (k - 1) * b ==>
;         k - 1 >= 0 /\
;         (forall (return_val: Prims.nat).
;             return_val == k - 1 ==>
;             b <= k - 1 /\
;             (forall (pure_result: Prims.unit). (k - 1) * b <= (k - 1) * (k - 1) ==> p pure_result)))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let product_bound’
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
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and (HasType @x0 Prims.nat) (HasType @x1 Prims.nat) (HasType @x2 Prims.pos))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x3 Term))
       (! (implies
         (and
          (HasType @x3 (Prims.pure_post U_zero Prims.unit))
          ;; def=FStar.UInt128.fst(940,19-940,24); use=FStar.UInt128.fst(942,2-943,39)
          (< (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x2))
          ;; def=FStar.UInt128.fst(940,28-940,33); use=FStar.UInt128.fst(942,2-943,39)
          (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 @x2))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(942,2-943,39)
          (forall ((@x4 Term))
           (! (implies
             (and
              (or label_1 (HasType @x4 Prims.unit))
              ;; def=FStar.UInt128.fst(941,17-941,41); use=FStar.UInt128.fst(942,2-943,39)
              (or
               label_2
               ;; def=FStar.UInt128.fst(941,17-941,41); use=FStar.UInt128.fst(942,2-943,39)
               (<=
                (BoxInt_proj_0 (Prims.op_Star @x0 @x1))
                (BoxInt_proj_0
                 (Prims.op_Addition
                  (Prims.op_Subtraction (Prims.op_Star @x2 @x2) (Prims.op_Star (BoxInt 2) @x2))
                  (BoxInt 1))))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(942,2-943,39)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(942,2-943,39)
              (ApplyTT @x3 @x4)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(942,2-943,39)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(942,2-943,39)
               (ApplyTT @x3 @x4)))
            :qid @query.2)))
         ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(942,7-942,26)
         (and
          ;; def=FStar.Math.Lemmas.fsti(32,12-32,20); use=FStar.UInt128.fst(942,7-942,26)
          (or
           label_3
           ;; def=FStar.Math.Lemmas.fsti(32,12-32,20); use=FStar.UInt128.fst(942,7-942,26)
           (<= (BoxInt_proj_0 @x0) (BoxInt_proj_0 (Prims.op_Subtraction @x2 (BoxInt 1)))))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(942,7-942,26)
          (forall ((@x4 Term))
           (! (implies
             (and
              (HasType @x4 Prims.unit)
              ;; def=FStar.Math.Lemmas.fsti(33,12-33,28); use=FStar.UInt128.fst(942,7-942,26)
              (<=
               (BoxInt_proj_0 (Prims.op_Star @x0 @x1))
               (BoxInt_proj_0 (Prims.op_Star (Prims.op_Subtraction @x2 (BoxInt 1)) @x1))))
             ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(942,2-943,39)
             (and
              ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(943,26-943,31)
              (or
               label_4
               ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(943,26-943,31)
               (>= (BoxInt_proj_0 (Prims.op_Subtraction @x2 (BoxInt 1))) (BoxInt_proj_0 (BoxInt 0))))
              ;; def=Prims.fst(322,2-322,58); use=FStar.UInt128.fst(942,2-943,39)
              (forall ((@x5 Term))
               (! (implies
                 (and
                  (HasType @x5 Prims.nat)
                  ;; def=Prims.fst(322,26-322,41); use=FStar.UInt128.fst(942,2-943,39)
                  (= @x5 (Prims.op_Subtraction @x2 (BoxInt 1))))
                 ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(943,7-943,25)
                 (and
                  ;; def=FStar.Math.Lemmas.fsti(28,12-28,20); use=FStar.UInt128.fst(943,7-943,25)
                  (or
                   label_5
                   ;; def=FStar.Math.Lemmas.fsti(28,12-28,20); use=FStar.UInt128.fst(943,7-943,25)
                   (<= (BoxInt_proj_0 @x1) (BoxInt_proj_0 (Prims.op_Subtraction @x2 (BoxInt 1)))))
                  ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(943,7-943,25)
                  (forall ((@x6 Term))
                   (! (implies
                     (and
                      (HasType @x6 Prims.unit)
                      ;; def=FStar.Math.Lemmas.fsti(29,12-29,28); use=FStar.UInt128.fst(943,7-943,25)
                      (<=
                       (BoxInt_proj_0 (Prims.op_Star (Prims.op_Subtraction @x2 (BoxInt 1)) @x1))
                       (BoxInt_proj_0
                        (Prims.op_Star
                         (Prims.op_Subtraction @x2 (BoxInt 1))
                         (Prims.op_Subtraction @x2 (BoxInt 1))))))
                     ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(943,7-943,25)
                     (Valid
                      ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(943,7-943,25)
                      (ApplyTT @x3 @x6)))
                    :qid @query.5))))
                :qid @query.4))))
            :qid @query.3))))
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
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.product_bound, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_1 () Bool)

; Encoding query formula : forall (n: Prims.nat)
;   (a: FStar.UInt.uint_t n)
;   (b: FStar.UInt.uint_t n)
;   (_: Prims.squash Prims.l_True).
;   (* - Could not prove post-condition *) 2 * n >= 0
; Context: While encoding a query
; While typechecking the top-level declaration ‘val FStar.UInt128.uint_product_bound’
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
   ;; def=FStar.UInt128.fst(945,0-946,46); use=FStar.UInt128.fst(945,0-946,46)
   (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
    (! (implies
      (and
       (HasType @x0 Prims.nat)
       (HasType @x1 (FStar.UInt.uint_t @x0))
       (HasType @x2 (FStar.UInt.uint_t @x0))
       (HasType @x3 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
      ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(946,23-946,28)
      (or
       label_1
       ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(946,23-946,28)
       (>= (BoxInt_proj_0 (Prims.op_Star (BoxInt 2) @x0)) (BoxInt_proj_0 (BoxInt 0)))))
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
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.uint_product_bound, 1)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_6 () Bool)
(declare-fun label_5 () Bool)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (n: Prims.nat) (a: FStar.UInt.uint_t n) (b: FStar.UInt.uint_t n).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         a * b <= Prims.pow2 (2 * n) - 2 * Prims.pow2 n + 1 ==> p pure_result) ==>
;     (FStar.UInt.size a n ==> a >= 0) /\
;     (forall (any_result: FStar.UInt.uint_t n).
;         a == any_result ==>
;         (FStar.UInt.size b n ==> b >= 0) /\
;         (forall (any_result: FStar.UInt.uint_t n).
;             b == any_result ==>
;             a < Prims.pow2 n /\ b < Prims.pow2 n /\
;             (forall (pure_result: Prims.unit).
;                 a * b <= Prims.pow2 n * Prims.pow2 n - 2 * Prims.pow2 n + 1 ==>
;                 (forall (pure_result: Prims.unit).
;                     Prims.pow2 n * Prims.pow2 n = Prims.pow2 (n + n) ==> p pure_result))))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let uint_product_bound’
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
   (forall ((@x0 Term) (@x1 Term) (@x2 Term))
    (! (implies
      (and
       (HasType @x0 Prims.nat)
       (HasType @x1 (FStar.UInt.uint_t @x0))
       (HasType @x2 (FStar.UInt.uint_t @x0)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x3 Term))
       (! (implies
         (and
          (HasType @x3 (Prims.pure_post U_zero Prims.unit))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(948,2-949,20)
          (forall ((@x4 Term))
           (! (implies
             (and
              (or label_1 (HasType @x4 Prims.unit))
              ;; def=FStar.UInt128.fst(946,8-946,46); use=FStar.UInt128.fst(948,2-949,20)
              (or
               label_2
               ;; def=FStar.UInt128.fst(946,8-946,46); use=FStar.UInt128.fst(948,2-949,20)
               (<=
                (BoxInt_proj_0 (Prims.op_Star @x1 @x2))
                (BoxInt_proj_0
                 (Prims.op_Addition
                  (Prims.op_Subtraction
                   (Prims.pow2 (Prims.op_Star (BoxInt 2) @x0))
                   (Prims.op_Star (BoxInt 2) (Prims.pow2 @x0)))
                  (BoxInt 1))))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(948,2-949,20)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(948,2-949,20)
              (ApplyTT @x3 @x4)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(948,2-949,20)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(948,2-949,20)
               (ApplyTT @x3 @x4)))
            :qid @query.2)))
         ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(948,2-949,20)
         (and
          (implies
           ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(948,16-948,17)
           (Valid
            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(948,16-948,17)
            (FStar.UInt.size @x1 @x0))
           ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(948,16-948,17)
           (or
            label_3
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(948,16-948,17)
            (>= (BoxInt_proj_0 @x1) (BoxInt_proj_0 (BoxInt 0)))))
          ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(948,2-949,20)
          (forall ((@x4 Term))
           (! (implies
             (and
              (HasType @x4 (FStar.UInt.uint_t @x0))
              ;; def=FStar.UInt128.fst(939,19-947,27); use=FStar.UInt128.fst(948,2-949,20)
              (= @x1 @x4))
             ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(948,2-949,20)
             (and
              (implies
               ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(948,18-948,19)
               (Valid
                ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(948,18-948,19)
                (FStar.UInt.size @x2 @x0))
               ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(948,18-948,19)
               (or
                label_4
                ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(948,18-948,19)
                (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(948,2-949,20)
              (forall ((@x5 Term))
               (! (implies
                 (and
                  (HasType @x5 (FStar.UInt.uint_t @x0))
                  ;; def=FStar.UInt128.fst(939,21-947,29); use=FStar.UInt128.fst(948,2-949,20)
                  (= @x2 @x5))
                 ;; def=Prims.fst(409,29-409,97); use=FStar.UInt128.fst(948,2-948,15)
                 (and
                  ;; def=FStar.UInt128.fst(940,19-940,24); use=FStar.UInt128.fst(948,2-948,15)
                  (or
                   label_5
                   ;; def=FStar.UInt128.fst(940,19-940,24); use=FStar.UInt128.fst(948,2-948,15)
                   (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 (Prims.pow2 @x0))))
                  ;; def=FStar.UInt128.fst(940,28-940,33); use=FStar.UInt128.fst(948,2-948,15)
                  (or
                   label_6
                   ;; def=FStar.UInt128.fst(940,28-940,33); use=FStar.UInt128.fst(948,2-948,15)
                   (< (BoxInt_proj_0 @x2) (BoxInt_proj_0 (Prims.pow2 @x0))))
                  ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(948,2-948,15)
                  (forall ((@x6 Term))
                   (! (implies
                     (and
                      (HasType @x6 Prims.unit)
                      ;; def=FStar.UInt128.fst(941,17-941,41); use=FStar.UInt128.fst(948,2-948,15)
                      (<=
                       (BoxInt_proj_0 (Prims.op_Star @x1 @x2))
                       (BoxInt_proj_0
                        (Prims.op_Addition
                         (Prims.op_Subtraction
                          (Prims.op_Star (Prims.pow2 @x0) (Prims.pow2 @x0))
                          (Prims.op_Star (BoxInt 2) (Prims.pow2 @x0)))
                         (BoxInt 1)))))
                     ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(949,7-949,16)
                     (forall ((@x7 Term))
                      (! (implies
                        (and
                         (HasType @x7 Prims.unit)
                         ;; def=FStar.Math.Lemmas.fsti(155,11-155,43); use=FStar.UInt128.fst(949,7-949,16)
                         (=
                          (Prims.op_Star (Prims.pow2 @x0) (Prims.pow2 @x0))
                          (Prims.pow2 (Prims.op_Addition @x0 @x0))))
                        ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(949,7-949,16)
                        (Valid
                         ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(949,7-949,16)
                         (ApplyTT @x3 @x7)))
                       :qid @query.6)))
                    :qid @query.5))))
                :qid @query.4))))
            :qid @query.3))))
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
(echo "label_6")
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.uint_product_bound, 2)
; STATUS: unsat
; Z3 invocation started by F*
; F* version: 2026.07.26~dev -- commit hash: 8d8025158cbb38b6c1ee2b1be38ca29baec0995b
; Z3 version (according to F*): 5.0.0

(pop) ;; 1}pop
(push) ;; push{1
(declare-fun label_5 () Bool)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
(declare-fun Tm_refine_54b601985451a2432a353b711858af42 () Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! (HasType Tm_refine_54b601985451a2432a353b711858af42 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_54b601985451a2432a353b711858af42))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.UInt128.fst(951,24-951,42); use=FStar.UInt128.fst(953,4-953,21)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_54b601985451a2432a353b711858af42)
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      ;; def=FStar.UInt128.fst(951,30-951,41); use=FStar.UInt128.fst(953,4-953,21)
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 (Prims.pow2 (BoxInt 32))))))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_54b601985451a2432a353b711858af42))
    :qid refinement_interpretation_Tm_refine_54b601985451a2432a353b711858af42))
  :named refinement_interpretation_Tm_refine_54b601985451a2432a353b711858af42))
; haseq for Tm_refine_54b601985451a2432a353b711858af42
;;; Fact-ids: 
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_54b601985451a2432a353b711858af42))
   (Valid (Prims.hasEq U_zero Prims.nat)))
  :named haseqTm_refine_54b601985451a2432a353b711858af42))



; Encoding query formula : forall (a: Prims.nat{a < Prims.pow2 32}) (b: Prims.nat{b < Prims.pow2 32}).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     (forall (pure_result: Prims.unit).
;         FStar.UInt.size (a * b) 64 /\ a * b < Prims.pow2 64 - Prims.pow2 32 - 1 ==> p pure_result) ==>
;     (a >= 0 /\ a < Prims.pow2 32 ==> FStar.UInt.size a 32) /\
;     (forall (any_result: a: Prims.nat{a < Prims.pow2 32}).
;         a == any_result ==>
;         (b >= 0 /\ b < Prims.pow2 32 ==> FStar.UInt.size b 32) /\
;         (forall (any_result: b: Prims.nat{b < Prims.pow2 32}).
;             b == any_result ==>
;             (forall (pure_result: Prims.unit).
;                 a * b <= Prims.pow2 64 - 2 * Prims.pow2 32 + 1 ==> p pure_result)))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let u32_product_bound’
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
      (and
       (HasType @x0 Tm_refine_54b601985451a2432a353b711858af42)
       (HasType @x1 Tm_refine_54b601985451a2432a353b711858af42))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.unit))
          ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(954,2-954,28)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              ;; def=FStar.UInt128.fst(952,9-952,29); use=FStar.UInt128.fst(954,2-954,28)
              (or
               label_2
               ;; def=FStar.UInt128.fst(952,9-952,29); use=FStar.UInt128.fst(954,2-954,28)
               (Valid
                ;; def=FStar.UInt128.fst(952,9-952,29); use=FStar.UInt128.fst(954,2-954,28)
                (FStar.UInt.size (Prims.op_Star @x0 @x1) (BoxInt 64))))
              ;; def=FStar.UInt128.fst(952,33-952,62); use=FStar.UInt128.fst(954,2-954,28)
              (or
               label_3
               ;; def=FStar.UInt128.fst(952,33-952,62); use=FStar.UInt128.fst(954,2-954,28)
               (<
                (BoxInt_proj_0 (Prims.op_Star @x0 @x1))
                (BoxInt_proj_0
                 (Prims.op_Subtraction
                  (Prims.op_Subtraction (Prims.pow2 (BoxInt 64)) (Prims.pow2 (BoxInt 32)))
                  (BoxInt 1))))))
             ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(954,2-954,28)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(954,2-954,28)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(954,2-954,28)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(954,2-954,28)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(954,2-954,28)
         (and
          (implies
           ;; def=FStar.UInt128.fst(951,30-951,41); use=FStar.UInt128.fst(954,25-954,26)
           (and
            ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(954,25-954,26)
            (>= (BoxInt_proj_0 @x0) (BoxInt_proj_0 (BoxInt 0)))
            ;; def=FStar.UInt128.fst(951,30-951,41); use=FStar.UInt128.fst(954,25-954,26)
            (< (BoxInt_proj_0 @x0) (BoxInt_proj_0 (Prims.pow2 (BoxInt 32)))))
           ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(954,25-954,26)
           (or
            label_4
            ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(954,25-954,26)
            (Valid
             ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(954,25-954,26)
             (FStar.UInt.size @x0 (BoxInt 32)))))
          ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(954,2-954,28)
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 Tm_refine_54b601985451a2432a353b711858af42)
              ;; def=FStar.UInt128.fst(945,35-953,23); use=FStar.UInt128.fst(954,2-954,28)
              (= @x0 @x3))
             ;; def=Prims.fst(427,77-427,89); use=FStar.UInt128.fst(954,2-954,28)
             (and
              (implies
               ;; def=FStar.UInt128.fst(951,52-951,63); use=FStar.UInt128.fst(954,27-954,28)
               (and
                ;; def=Prims.fst(642,18-642,24); use=FStar.UInt128.fst(954,27-954,28)
                (>= (BoxInt_proj_0 @x1) (BoxInt_proj_0 (BoxInt 0)))
                ;; def=FStar.UInt128.fst(951,52-951,63); use=FStar.UInt128.fst(954,27-954,28)
                (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 (Prims.pow2 (BoxInt 32)))))
               ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(954,27-954,28)
               (or
                label_5
                ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(954,27-954,28)
                (Valid
                 ;; def=FStar.UInt.fsti(53,28-53,36); use=FStar.UInt128.fst(954,27-954,28)
                 (FStar.UInt.size @x1 (BoxInt 32)))))
              ;; def=Prims.fst(419,66-419,102); use=FStar.UInt128.fst(954,2-954,28)
              (forall ((@x4 Term))
               (! (implies
                 (and
                  (HasType @x4 Tm_refine_54b601985451a2432a353b711858af42)
                  ;; def=FStar.UInt128.fst(945,54-953,25); use=FStar.UInt128.fst(954,2-954,28)
                  (= @x1 @x4))
                 ;; def=Prims.fst(409,36-409,97); use=FStar.UInt128.fst(954,2-954,20)
                 (forall ((@x5 Term))
                  (! (implies
                    (and
                     (HasType @x5 Prims.unit)
                     ;; def=FStar.UInt128.fst(946,8-946,46); use=FStar.UInt128.fst(954,2-954,20)
                     (<=
                      (BoxInt_proj_0 (Prims.op_Star @x0 @x1))
                      (BoxInt_proj_0
                       (Prims.op_Addition
                        (Prims.op_Subtraction
                         (Prims.pow2 (BoxInt 64))
                         (Prims.op_Star (BoxInt 2) (Prims.pow2 (BoxInt 32))))
                        (BoxInt 1)))))
                    ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(954,2-954,20)
                    (Valid
                     ;; def=Prims.fst(409,83-409,96); use=FStar.UInt128.fst(954,2-954,20)
                     (ApplyTT @x2 @x5)))
                   :qid @query.5)))
                :qid @query.4))))
            :qid @query.3))))
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
(echo "label_5")
(echo "label_4")
(echo "label_3")
(echo "label_2")
(echo "label_1")
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop

; QUERY ID: (FStar.UInt128.u32_product_bound, 1)
; STATUS: unsat
