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
(assert (forall ((f Fuel) (x Term) (t Term))
(! (= (HasTypeFuel (SFuel f) x t)
(HasTypeZ x t))
:pattern ((HasTypeFuel (SFuel f) x t)))))
(declare-fun NoHoist (Term Bool) Bool)
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
(declare-fun FString_const (Int) FString)
(declare-fun FString_const_proj_0 (FString) Int)
(define-fun is-FString_const ((__@u0 FString)) Bool
 (and (= (FString_constr_id __@u0) 0) (= __@u0 (FString_const (FString_const_proj_0 __@u0)))))
(declare-fun Tm_type (Universe) Term)
(declare-fun Tm_type_0 (Term) Universe)
(define-fun is-Tm_type ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 2) (= __@x0 (Tm_type (Tm_type_0 __@x0)))))
(declare-fun Tm_arrow (Int) Term)
(declare-fun Tm_arrow_id (Term) Int)
(define-fun is-Tm_arrow ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 3) (= __@x0 (Tm_arrow (Tm_arrow_id __@x0)))))
(declare-fun Tm_unit () Term)
(define-fun is-Tm_unit ((__@x0 Term)) Bool (and (= (Term_constr_id __@x0) 6) (= __@x0 Tm_unit)))
(declare-fun BoxInt (Int) Term)
(declare-fun BoxInt_proj_0 (Term) Int)
(assert
 (! (forall ((@u0 Int))
   (! (= (BoxInt_proj_0 (BoxInt @u0)) @u0)
    :pattern ((BoxInt @u0))
    :qid projection_inverse_BoxInt_proj_0))
  :named projection_inverse_BoxInt_proj_0))
(define-fun is-BoxInt ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 7) (= __@x0 (BoxInt (BoxInt_proj_0 __@x0)))))
(declare-fun BoxBool (Bool) Term)
(declare-fun BoxBool_proj_0 (Term) Bool)
(assert
 (! (forall ((@u0 Bool))
   (! (= (BoxBool_proj_0 (BoxBool @u0)) @u0)
    :pattern ((BoxBool @u0))
    :qid projection_inverse_BoxBool_proj_0))
  :named projection_inverse_BoxBool_proj_0))
(define-fun is-BoxBool ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 8) (= __@x0 (BoxBool (BoxBool_proj_0 __@x0)))))
(declare-fun BoxString (FString) Term)
(declare-fun BoxString_proj_0 (Term) FString)
(define-fun is-BoxString ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 9) (= __@x0 (BoxString (BoxString_proj_0 __@x0)))))
(declare-fun BoxReal (Real) Term)
(declare-fun BoxReal_proj_0 (Term) Real)
(define-fun is-BoxReal ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 10) (= __@x0 (BoxReal (BoxReal_proj_0 __@x0)))))
(declare-fun LexCons (Term Term Term) Term)
(declare-fun LexCons_0 (Term) Term)
(declare-fun LexCons_1 (Term) Term)
(declare-fun LexCons_2 (Term) Term)
(define-fun is-LexCons ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 11)
  (= __@x0 (LexCons (LexCons_0 __@x0) (LexCons_1 __@x0) (LexCons_2 __@x0)))))
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
(declare-fun FStar.Stubs.Tactics.Common.NotAListLiteral () Term)
(declare-fun FStar.Stubs.Tactics.Common.NotAListLiteral@base () Term)
(declare-fun FStar.Stubs.Tactics.Common.SKIP () Term)
(declare-fun FStar.Stubs.Tactics.Common.SKIP@base () Term)
(declare-fun FStar.Stubs.Tactics.Common.Stop () Term)
(declare-fun FStar.Stubs.Tactics.Common.Stop@base () Term)
(declare-fun FStar.Tactics.V2.Derived.Goal_not_trivial () Term)
(declare-fun FStar.Tactics.V2.Derived.Goal_not_trivial@base () Term)
(declare-fun FStar.UInt.fits (Term Term) Term)
(declare-fun FStar.UInt.max_int (Term) Term)
(declare-fun FStar.UInt.min_int (Term) Term)
(declare-fun FStar.UInt.size (Term Term) Term)
(declare-fun FStar.UInt.uint_t (Term) Term)
(declare-fun FStar.UInt128.Mkuint128 (Term Term) Term)
(declare-fun FStar.UInt128.Mkuint128_@high (Term) Term)
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
(define-fun is-FStar.Stubs.Tactics.Common.NotAListLiteral ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 102) (= __@x0 FStar.Stubs.Tactics.Common.NotAListLiteral)))
(define-fun is-FStar.Stubs.Tactics.Common.SKIP ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 117) (= __@x0 FStar.Stubs.Tactics.Common.SKIP)))
(define-fun is-FStar.Stubs.Tactics.Common.Stop ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 121) (= __@x0 FStar.Stubs.Tactics.Common.Stop)))
(define-fun is-FStar.Tactics.V2.Derived.Goal_not_trivial ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 112) (= __@x0 FStar.Tactics.V2.Derived.Goal_not_trivial)))
(define-fun is-FStar.UInt128.Mkuint128 ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 239)
  (=
   __@x0
   (FStar.UInt128.Mkuint128
    (FStar.UInt128.Mkuint128_@low __@x0)
    (FStar.UInt128.Mkuint128_@high __@x0)))))
(assert
 (! ;; def=Prims.fst(670,8-670,12); use=Prims.fst(670,8-670,12)
  (forall ((@x0 Term))
   (! (= (Prims.pow2 @x0) (Prims.pow2.fuel_instrumented MaxFuel @x0))
    :pattern ((Prims.pow2 @x0))
    :qid @fuel_correspondence_Prims.pow2.fuel_instrumented))
  :named @fuel_correspondence_Prims.pow2.fuel_instrumented))
(assert
 (! ;; def=Prims.fst(165,4-165,7); use=Prims.fst(165,4-165,7)
  (forall ((@x0 Term))
   (! (= (Valid (Prims.b2t @x0)) (BoxBool_proj_0 @x0)) :pattern ((Prims.b2t @x0)) :qid b2t_def))
  :named b2t_def))
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
(assert
 (! ;; def=FStar.UInt.fsti(45,4-45,11); use=FStar.UInt.fsti(45,4-45,11)
  (forall ((@x0 Term))
   (! (= (FStar.UInt.max_int @x0) (Prims.op_Subtraction (Prims.pow2 @x0) (BoxInt 1)))
    :pattern ((FStar.UInt.max_int @x0))
    :qid equation_FStar.UInt.max_int))
  :named equation_FStar.UInt.max_int))
(assert
 (! ;; def=FStar.UInt.fsti(46,4-46,11); use=FStar.UInt.fsti(46,4-46,11)
  (forall ((@x0 Term))
   (! (= (FStar.UInt.min_int @x0) (BoxInt 0))
    :pattern ((FStar.UInt.min_int @x0))
    :qid equation_FStar.UInt.min_int))
  :named equation_FStar.UInt.min_int))
(assert
 (! ;; def=FStar.UInt.fsti(49,4-49,8); use=FStar.UInt.fsti(49,4-49,8)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt.size @x0 @x1) (Prims.b2t (FStar.UInt.fits @x0 @x1)))
    :pattern ((FStar.UInt.size @x0 @x1))
    :qid equation_FStar.UInt.size))
  :named equation_FStar.UInt.size))
(assert
 (! ;; def=FStar.UInt.fsti(53,5-53,11); use=FStar.UInt.fsti(53,5-53,11)
  (forall ((@x0 Term))
   (! (= (FStar.UInt.uint_t @x0) (Tm_refine_f13070840248fced9d9d60d77bdae3ec @x0))
    :pattern ((FStar.UInt.uint_t @x0))
    :qid equation_FStar.UInt.uint_t))
  :named equation_FStar.UInt.uint_t))
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
(assert
 (! ;; def=FStar.UInt128.fst(1005,4-1005,9); use=FStar.UInt128.fst(1005,4-1005,9)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt128.pll_h @x0 @x1) (FStar.UInt128.h32 (FStar.UInt128.pll @x0 @x1)))
    :pattern ((FStar.UInt128.pll_h @x0 @x1))
    :qid equation_FStar.UInt128.pll_h))
  :named equation_FStar.UInt128.pll_h))
(assert
 (! ;; def=FStar.UInt128.fst(1003,4-1003,9); use=FStar.UInt128.fst(1003,4-1003,9)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt128.pll_l @x0 @x1) (FStar.UInt128.l32 (FStar.UInt128.pll @x0 @x1)))
    :pattern ((FStar.UInt128.pll_l @x0 @x1))
    :qid equation_FStar.UInt128.pll_l))
  :named equation_FStar.UInt128.pll_l))
(assert
 (! (= Prims.nat Tm_refine_542f9d4f129664613f2483a6c88bc7c2) :named equation_Prims.nat))
(assert
 (! (forall ((@u0 Fuel) (@x1 Term))
   (! (implies (HasTypeFuel @u0 @x1 Prims.int) (is-BoxInt @x1))
    :pattern ((HasTypeFuel @u0 @x1 Prims.int))
    :qid int_inversion))
  :named int_inversion))
(assert
 (! (forall ((@u0 Int)) (! (HasType (BoxInt @u0) Prims.int) :pattern ((BoxInt @u0)) :qid int_typing))
  :named int_typing))
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
(assert
 (! ;; def=Prims.fst(520,4-520,15); use=Prims.fst(520,4-520,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Addition @x0 @x1) (BoxInt (+ (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Addition @x0 @x1))
    :qid primitive_Prims.op_Addition))
  :named primitive_Prims.op_Addition))
(assert
 (! ;; def=Prims.fst(490,4-490,13); use=Prims.fst(490,4-490,13)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_AmpAmp @x0 @x1) (BoxBool (and (BoxBool_proj_0 @x0) (BoxBool_proj_0 @x1))))
    :pattern ((Prims.op_AmpAmp @x0 @x1))
    :qid primitive_Prims.op_AmpAmp))
  :named primitive_Prims.op_AmpAmp))
(assert
 (! ;; def=Prims.fst(665,4-665,15); use=Prims.fst(665,4-665,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (not (= (BoxInt_proj_0 @x1) 0))
     (= (Prims.op_Division @x0 @x1) (BoxInt (div (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1)))))
    :pattern ((Prims.op_Division @x0 @x1))
    :qid primitive_Prims.op_Division))
  :named primitive_Prims.op_Division))
(assert
 (! ;; def=Prims.fst(532,4-532,22); use=Prims.fst(532,4-532,22)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_LessThanOrEqual @x0 @x1) (BoxBool (<= (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_LessThanOrEqual @x0 @x1))
    :qid primitive_Prims.op_LessThanOrEqual))
  :named primitive_Prims.op_LessThanOrEqual))
(assert
 (! ;; def=Prims.fst(508,4-508,11); use=Prims.fst(508,4-508,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Star @x0 @x1) (BoxInt (* (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Star @x0 @x1))
    :qid primitive_Prims.op_Star))
  :named primitive_Prims.op_Star))
(assert
 (! ;; def=Prims.fst(514,4-514,18); use=Prims.fst(514,4-514,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Subtraction @x0 @x1) (BoxInt (- (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Subtraction @x0 @x1))
    :qid primitive_Prims.op_Subtraction))
  :named primitive_Prims.op_Subtraction))
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
(assert
 (! ;; def=FStar.UInt128.fst(1000,4-1000,7); use=FStar.UInt128.fst(1000,4-1000,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.phh @x0 @x1) Tm_refine_d12ff0579459f51559539386c837ad74))
    :pattern ((FStar.UInt128.phh @x0 @x1))
    :qid typing_FStar.UInt128.phh))
  :named typing_FStar.UInt128.phh))
(assert
 (! ;; def=FStar.UInt128.fst(998,4-998,7); use=FStar.UInt128.fst(998,4-998,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.phl @x0 @x1) Tm_refine_d12ff0579459f51559539386c837ad74))
    :pattern ((FStar.UInt128.phl @x0 @x1))
    :qid typing_FStar.UInt128.phl))
  :named typing_FStar.UInt128.phl))
(assert
 (! ;; def=FStar.UInt128.fst(996,4-996,7); use=FStar.UInt128.fst(996,4-996,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.plh @x0 @x1) Tm_refine_d12ff0579459f51559539386c837ad74))
    :pattern ((FStar.UInt128.plh @x0 @x1))
    :qid typing_FStar.UInt128.plh))
  :named typing_FStar.UInt128.plh))
(assert
 (! ;; def=FStar.UInt128.fst(1005,4-1005,9); use=FStar.UInt128.fst(1005,4-1005,9)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.pll_h @x0 @x1) (FStar.UInt.uint_t (BoxInt 32))))
    :pattern ((FStar.UInt128.pll_h @x0 @x1))
    :qid typing_FStar.UInt128.pll_h))
  :named typing_FStar.UInt128.pll_h))
(assert
 (! ;; def=FStar.UInt128.fst(1003,4-1003,9); use=FStar.UInt128.fst(1003,4-1003,9)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt64.t Dummy_value)) (HasType @x1 (FStar.UInt64.t Dummy_value)))
     (HasType (FStar.UInt128.pll_l @x0 @x1) (FStar.UInt.uint_t (BoxInt 32))))
    :pattern ((FStar.UInt128.pll_l @x0 @x1))
    :qid typing_FStar.UInt128.pll_l))
  :named typing_FStar.UInt128.pll_l))
(assert
 (! ;; def=Prims.fst(665,4-665,15); use=Prims.fst(665,4-665,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.nonzero))
     (HasType (Prims.op_Division @x0 @x1) Prims.int))
    :pattern ((Prims.op_Division @x0 @x1))
    :qid typing_Prims.op_Division))
  :named typing_Prims.op_Division))
(push)
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
(push)
(assert (! (= MaxFuel ZFuel) :named @MaxFuel_assumption))
(assert (! (= MaxIFuel ZFuel) :named @MaxIFuel_assumption))
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
(check-sat)
(set-option :rlimit 0)
(pop)
