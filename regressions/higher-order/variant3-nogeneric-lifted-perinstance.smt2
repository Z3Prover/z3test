



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
(declare-fun Tm_refinement (Term (=> Term Bool)) Term)
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


(declare-fun FString_const (Int) FString)


(assert
 (! (forall ((@u0 Int))
   (! (= 0 (FString_constr_id (FString_const @u0)))
    :pattern ((FString_const @u0))
    :qid constructor_distinct_FString_const))
  :named constructor_distinct_FString_const))

(declare-fun FString_const_proj_0 (FString) Int)


(assert
 (! (forall ((@u0 Int))
   (! (= (FString_const_proj_0 (FString_const @u0)) @u0)
    :pattern ((FString_const @u0))
    :qid projection_inverse_FString_const_proj_0))
  :named projection_inverse_FString_const_proj_0))

(define-fun is-FString_const ((__@u0 FString)) Bool
 (and (= (FString_constr_id __@u0) 0) (= __@u0 (FString_const (FString_const_proj_0 __@u0)))))



(declare-fun Tm_type (Universe) Term)


(assert
 (! (forall ((@u0 Universe))
   (! (= 2 (Term_constr_id (Tm_type @u0)))
    :pattern ((Tm_type @u0))
    :qid constructor_distinct_Tm_type))
  :named constructor_distinct_Tm_type))

(declare-fun Tm_type_0 (Term) Universe)


(assert
 (! (forall ((@u0 Universe))
   (! (= (Tm_type_0 (Tm_type @u0)) @u0) :pattern ((Tm_type @u0)) :qid projection_inverse_Tm_type_0))
  :named projection_inverse_Tm_type_0))

(define-fun is-Tm_type ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 2) (= __@x0 (Tm_type (Tm_type_0 __@x0)))))



(declare-fun Tm_arrow (Int) Term)


(assert
 (! (forall ((@u0 Int))
   (! (= 3 (Term_constr_id (Tm_arrow @u0)))
    :pattern ((Tm_arrow @u0))
    :qid constructor_distinct_Tm_arrow))
  :named constructor_distinct_Tm_arrow))

(declare-fun Tm_arrow_id (Term) Int)


(assert
 (! (forall ((@u0 Int))
   (! (= (Tm_arrow_id (Tm_arrow @u0)) @u0)
    :pattern ((Tm_arrow @u0))
    :qid projection_inverse_Tm_arrow_id))
  :named projection_inverse_Tm_arrow_id))

(define-fun is-Tm_arrow ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 3) (= __@x0 (Tm_arrow (Tm_arrow_id __@x0)))))



(declare-fun Tm_unit () Term)


(assert (! (= 6 (Term_constr_id Tm_unit)) :named constructor_distinct_Tm_unit))

(define-fun is-Tm_unit ((__@x0 Term)) Bool (and (= (Term_constr_id __@x0) 6) (= __@x0 Tm_unit)))



(declare-fun BoxInt (Int) Term)


(assert
 (! (forall ((@u0 Int))
   (! (= 7 (Term_constr_id (BoxInt @u0))) :pattern ((BoxInt @u0)) :qid constructor_distinct_BoxInt))
  :named constructor_distinct_BoxInt))

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


(assert
 (! (forall ((@u0 Bool))
   (! (= 8 (Term_constr_id (BoxBool @u0)))
    :pattern ((BoxBool @u0))
    :qid constructor_distinct_BoxBool))
  :named constructor_distinct_BoxBool))

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


(assert
 (! (forall ((@u0 FString))
   (! (= 9 (Term_constr_id (BoxString @u0)))
    :pattern ((BoxString @u0))
    :qid constructor_distinct_BoxString))
  :named constructor_distinct_BoxString))

(declare-fun BoxString_proj_0 (Term) FString)


(assert
 (! (forall ((@u0 FString))
   (! (= (BoxString_proj_0 (BoxString @u0)) @u0)
    :pattern ((BoxString @u0))
    :qid projection_inverse_BoxString_proj_0))
  :named projection_inverse_BoxString_proj_0))

(define-fun is-BoxString ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 9) (= __@x0 (BoxString (BoxString_proj_0 __@x0)))))



(declare-fun BoxReal (Real) Term)


(assert
 (! (forall ((@u0 Real))
   (! (= 10 (Term_constr_id (BoxReal @u0)))
    :pattern ((BoxReal @u0))
    :qid constructor_distinct_BoxReal))
  :named constructor_distinct_BoxReal))

(declare-fun BoxReal_proj_0 (Term) Real)


(assert
 (! (forall ((@u0 Real))
   (! (= (BoxReal_proj_0 (BoxReal @u0)) @u0)
    :pattern ((BoxReal @u0))
    :qid projection_inverse_BoxReal_proj_0))
  :named projection_inverse_BoxReal_proj_0))

(define-fun is-BoxReal ((__@x0 Term)) Bool
 (and (= (Term_constr_id __@x0) 10) (= __@x0 (BoxReal (BoxReal_proj_0 __@x0)))))



(declare-fun LexCons (Term Term Term) Term)


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= 11 (Term_constr_id (LexCons @x0 @x1 @x2)))
    :pattern ((LexCons @x0 @x1 @x2))
    :qid constructor_distinct_LexCons))
  :named constructor_distinct_LexCons))

(declare-fun LexCons_0 (Term) Term)


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (LexCons_0 (LexCons @x0 @x1 @x2)) @x0)
    :pattern ((LexCons @x0 @x1 @x2))
    :qid projection_inverse_LexCons_0))
  :named projection_inverse_LexCons_0))

(declare-fun LexCons_1 (Term) Term)


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (LexCons_1 (LexCons @x0 @x1 @x2)) @x1)
    :pattern ((LexCons @x0 @x1 @x2))
    :qid projection_inverse_LexCons_1))
  :named projection_inverse_LexCons_1))

(declare-fun LexCons_2 (Term) Term)


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (LexCons_2 (LexCons @x0 @x1 @x2)) @x2)
    :pattern ((LexCons @x0 @x1 @x2))
    :qid projection_inverse_LexCons_2))
  :named projection_inverse_LexCons_2))

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

(declare-fun FStar.BitVector.bv_t (Term) Term)
(declare-fun FStar.BitVector.lognot_vec (Term Term) Term)

(declare-fun FStar.BitVector.lognot_vec.fuel_instrumented (Fuel Term Term) Term)
(declare-fun FStar.BitVector.logor_vec (Term Term Term) Term)

(declare-fun FStar.BitVector.logor_vec.fuel_instrumented (Fuel Term Term Term) Term)
(declare-fun FStar.BitVector.logxor_vec (Term Term Term) Term)

(declare-fun FStar.BitVector.logxor_vec.fuel_instrumented (Fuel Term Term Term) Term)
(declare-fun FStar.BitVector.ones_vec (Term) Term)
(declare-fun FStar.BitVector.shift_right_vec (Term Term Term) Term)
(declare-fun FStar.BitVector.zero_vec (Term) Term)
(declare-fun FStar.Seq.Base.append (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.create (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.empty (Universe Term) Term)
(declare-fun FStar.Seq.Base.equal (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.index (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.length (Universe Term Term) Term)
(declare-fun FStar.Seq.Base.seq (Universe Term) Term)
(declare-fun FStar.Seq.Base.slice (Universe Term Term Term Term) Term)
(declare-fun FStar.UInt.add_mod (Term Term Term) Term)
(declare-fun FStar.UInt.fits (Term Term) Term)
(declare-fun FStar.UInt.from_vec (Term Term) Term)

(declare-fun FStar.UInt.from_vec.fuel_instrumented (Fuel Term Term) Term)
(declare-fun FStar.UInt.lognot (Term Term) Term)
(declare-fun FStar.UInt.logor (Term Term Term) Term)
(declare-fun FStar.UInt.logxor (Term Term Term) Term)
(declare-fun FStar.UInt.max_int (Term) Term)
(declare-fun FStar.UInt.min_int (Term) Term)
(declare-fun FStar.UInt.minus (Term Term) Term)
(declare-fun FStar.UInt.msb (Term Term) Term)
(declare-fun FStar.UInt.nth (Term Term Term) Term)
(declare-fun FStar.UInt.ones (Term) Term)
(declare-fun FStar.UInt.shift_right (Term Term Term) Term)
(declare-fun FStar.UInt.size (Term Term) Term)
(declare-fun FStar.UInt.sub_mod (Term Term Term) Term)
(declare-fun FStar.UInt.to_vec (Term Term) Term)

(declare-fun FStar.UInt.to_vec.fuel_instrumented (Fuel Term Term) Term)
(declare-fun FStar.UInt.uint_t (Term) Term)
(declare-fun FStar.UInt.zero (Term) Term)
(declare-fun FStar.UInt32.add_mod (Term Term) Term)
(declare-fun FStar.UInt32.lognot (Term) Term)
(declare-fun FStar.UInt32.logor (Term Term) Term)
(declare-fun FStar.UInt32.logxor (Term Term) Term)
(declare-fun FStar.UInt32.minus (Term) Term)
(declare-fun FStar.UInt32.n_minus_one (Dummy_sort) Term)
(declare-fun FStar.UInt32.shift_right (Term Term) Term)
(declare-fun FStar.UInt32.sub_mod (Term Term) Term)
(declare-fun FStar.UInt32.t (Dummy_sort) Term)
(declare-fun FStar.UInt32.uint_to_t (Term) Term)
(declare-fun FStar.UInt32.v (Term) Term)
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
(declare-fun Prims.op_BarBar (Term Term) Term)
(declare-fun Prims.op_Division (Term Term) Term)
(declare-fun Prims.op_Equality (Term Term Term) Term)
(declare-fun Prims.op_GreaterThanOrEqual (Term Term) Term)
(declare-fun Prims.op_LessThan (Term Term) Term)
(declare-fun Prims.op_LessThanOrEqual (Term Term) Term)
(declare-fun Prims.op_Modulus (Term Term) Term)
(declare-fun Prims.op_Negation (Term) Term)
(declare-fun Prims.op_Star (Term Term) Term)
(declare-fun Prims.op_Subtraction (Term Term) Term)
(declare-fun Prims.op_disEquality (Term Term Term) Term)
(declare-fun Prims.pos () Term)
(declare-fun Prims.pow2 (Term) Term)

(declare-fun Prims.pow2.fuel_instrumented (Fuel Term) Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_post (Universe Term) Term)
(declare-fun Prims.pure_post_ (Universe Term Term) Term)
(declare-fun Prims.unit () Term)

(declare-fun Tm_arrow_df7368353fc211da625f2c46a01987e1 (Term Term Universe) Term)
(declare-fun Tm_refine_pred_0766302b68bb44ab7aff8c4d8be0b46f () (=> Term Bool))
(declare-fun Tm_refine_pred_0ce91af3d6762ea7d913b870f9e33a01 (Universe Term) (=> Term Bool))
(declare-fun Tm_refine_pred_0ea1fba779ad5718e28476faeef94d56 (Term) (=> Term Bool))
(declare-fun Tm_refine_pred_150c87740acaa31f788a9e84dd5820c2 (Term) (=> Term Bool))
(declare-fun Tm_refine_pred_160fe7faad9a466b3cae8455bac5be60 (Universe Term Term) (=> Term Bool))
(declare-fun Tm_refine_pred_2b25e5c3b25bc06167200cbfa5d36b3e (Term Term) (=> Term Bool))
(declare-fun Tm_refine_pred_34425c23b534b8a294f8f063dd9faa4b (Term Term) (=> Term Bool))
(declare-fun Tm_refine_pred_35a0739c434508f48d0bb1d5cd5df9e8 (Term Term) (=> Term Bool))
(declare-fun Tm_refine_pred_39cb18a1d289e559096741772432b24f (Term Term) (=> Term Bool))
(declare-fun
 Tm_refine_pred_444061fd0bd0053c4f27fa233082c9ca
 (Universe Term Term Term)
 (=> Term Bool))
(declare-fun Tm_refine_pred_542f9d4f129664613f2483a6c88bc7c2 () (=> Term Bool))
(declare-fun Tm_refine_pred_59202c8b625f4b04caf2081d6778d9e7 (Term Term) (=> Term Bool))
(declare-fun
 Tm_refine_pred_5a92b6e4e7af9363bc35e43d9d7f3f13
 (Universe Term Term Term)
 (=> Term Bool))
(declare-fun Tm_refine_pred_774ba3f728d91ead8ef40be66c9802e5 () (=> Term Bool))
(declare-fun Tm_refine_pred_7e0b9b2dbca36eab00de093c1b701c6d (Term) (=> Term Bool))
(declare-fun Tm_refine_pred_9464479a8dbea99c4e6879c5c69f2f30 (Term Term) (=> Term Bool))
(declare-fun Tm_refine_pred_9d6af3f3535473623f7aec2f0501897f () (=> Term Bool))
(declare-fun Tm_refine_pred_ace23c600fbe87b65e5fc333816f74de (Term Term) (=> Term Bool))
(declare-fun
 Tm_refine_pred_b9ca4cf05147d86d6eff56ccafdd09d0
 (Universe Term Term Term)
 (=> Term Bool))
(declare-fun Tm_refine_pred_c0ec47abc53a2509e744dad22ccf8191 (Term Term) (=> Term Bool))
(declare-fun Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c (Term) (=> Term Bool))
(declare-fun Tm_refine_pred_d5743ca0a8d5f3ceec748bdcb132b14f (Term) (=> Term Bool))
(declare-fun Tm_refine_pred_edc8fb7e909853d860d4ab445ef31337 (Term Term) (=> Term Bool))
(declare-fun Tm_refine_pred_f13070840248fced9d9d60d77bdae3ec (Term) (=> Term Bool))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.BitVector.lognot_vec @x0 @x1)
     (FStar.BitVector.lognot_vec.fuel_instrumented MaxFuel @x0 @x1))
    :pattern ((FStar.BitVector.lognot_vec @x0 @x1))
    :qid @fuel_correspondence_FStar.BitVector.lognot_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.BitVector.lognot_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.BitVector.logor_vec @x0 @x1 @x2)
     (FStar.BitVector.logor_vec.fuel_instrumented MaxFuel @x0 @x1 @x2))
    :pattern ((FStar.BitVector.logor_vec @x0 @x1 @x2))
    :qid @fuel_correspondence_FStar.BitVector.logor_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.BitVector.logor_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.BitVector.logxor_vec @x0 @x1 @x2)
     (FStar.BitVector.logxor_vec.fuel_instrumented MaxFuel @x0 @x1 @x2))
    :pattern ((FStar.BitVector.logxor_vec @x0 @x1 @x2))
    :qid @fuel_correspondence_FStar.BitVector.logxor_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.BitVector.logxor_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt.from_vec @x0 @x1) (FStar.UInt.from_vec.fuel_instrumented MaxFuel @x0 @x1))
    :pattern ((FStar.UInt.from_vec @x0 @x1))
    :qid @fuel_correspondence_FStar.UInt.from_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.UInt.from_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt.to_vec @x0 @x1) (FStar.UInt.to_vec.fuel_instrumented MaxFuel @x0 @x1))
    :pattern ((FStar.UInt.to_vec @x0 @x1))
    :qid @fuel_correspondence_FStar.UInt.to_vec.fuel_instrumented))
  :named @fuel_correspondence_FStar.UInt.to_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@x0 Term))
   (! (= (Prims.pow2 @x0) (Prims.pow2.fuel_instrumented MaxFuel @x0))
    :pattern ((Prims.pow2 @x0))
    :qid @fuel_correspondence_Prims.pow2.fuel_instrumented))
  :named @fuel_correspondence_Prims.pow2.fuel_instrumented))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.BitVector.lognot_vec.fuel_instrumented (SFuel @u0) @x1 @x2)
     (FStar.BitVector.lognot_vec.fuel_instrumented ZFuel @x1 @x2))
    :pattern ((FStar.BitVector.lognot_vec.fuel_instrumented (SFuel @u0) @x1 @x2))
    :qid @fuel_irrelevance_FStar.BitVector.lognot_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.BitVector.lognot_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.BitVector.logor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3)
     (FStar.BitVector.logor_vec.fuel_instrumented ZFuel @x1 @x2 @x3))
    :pattern ((FStar.BitVector.logor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3))
    :qid @fuel_irrelevance_FStar.BitVector.logor_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.BitVector.logor_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.BitVector.logxor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3)
     (FStar.BitVector.logxor_vec.fuel_instrumented ZFuel @x1 @x2 @x3))
    :pattern ((FStar.BitVector.logxor_vec.fuel_instrumented (SFuel @u0) @x1 @x2 @x3))
    :qid @fuel_irrelevance_FStar.BitVector.logxor_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.BitVector.logxor_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.from_vec.fuel_instrumented (SFuel @u0) @x1 @x2)
     (FStar.UInt.from_vec.fuel_instrumented ZFuel @x1 @x2))
    :pattern ((FStar.UInt.from_vec.fuel_instrumented (SFuel @u0) @x1 @x2))
    :qid @fuel_irrelevance_FStar.UInt.from_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.UInt.from_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.to_vec.fuel_instrumented (SFuel @u0) @x1 @x2)
     (FStar.UInt.to_vec.fuel_instrumented ZFuel @x1 @x2))
    :pattern ((FStar.UInt.to_vec.fuel_instrumented (SFuel @u0) @x1 @x2))
    :qid @fuel_irrelevance_FStar.UInt.to_vec.fuel_instrumented))
  :named @fuel_irrelevance_FStar.UInt.to_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term))
   (! (= (Prims.pow2.fuel_instrumented (SFuel @u0) @x1) (Prims.pow2.fuel_instrumented ZFuel @x1))
    :pattern ((Prims.pow2.fuel_instrumented (SFuel @u0) @x1))
    :qid @fuel_irrelevance_Prims.pow2.fuel_instrumented))
  :named @fuel_irrelevance_Prims.pow2.fuel_instrumented))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_df7368353fc211da625f2c46a01987e1 @x1 @x2 @u3))
     (and
      
      (forall ((@x4 Term))
       (! (implies
         
         (HasType
          @x4
          
          (Tm_refinement @x1 (Tm_refine_pred_9464479a8dbea99c4e6879c5c69f2f30 @x2 @x1)))
         (HasType (ApplyTT @x0 @x4) Prims.prop))
        :pattern ((ApplyTT @x0 @x4))
        :qid Prims_interpretation_Tm_arrow_df7368353fc211da625f2c46a01987e1.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_df7368353fc211da625f2c46a01987e1 @x1 @x2 @u3)))
    :qid Prims_interpretation_Tm_arrow_df7368353fc211da625f2c46a01987e1))
  :named Prims_interpretation_Tm_arrow_df7368353fc211da625f2c46a01987e1))


(assert
 (! 
  (forall ((@x0 Term))
   (! (= (Valid (Prims.b2t @x0)) (BoxBool_proj_0 @x0)) :pattern ((Prims.b2t @x0)) :qid b2t_def))
  :named b2t_def))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.bool) (HasType (Prims.b2t @x0) Prims.prop))
    :pattern ((Prims.b2t @x0))
    :qid b2t_typing))
  :named b2t_typing))


(assert
 (! (forall ((@u0 Fuel) (@x1 Term))
   (! (implies (HasTypeFuel @u0 @x1 Prims.bool) (is-BoxBool @x1))
    :pattern ((HasTypeFuel @u0 @x1 Prims.bool))
    :qid bool_inversion))
  :named bool_inversion))


(assert
 (! (forall ((@u0 Bool))
   (! (HasType (BoxBool @u0) Prims.bool) :pattern ((BoxBool @u0)) :qid bool_typing))
  :named bool_typing))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 103 (Term_constr_id (FStar.Seq.Base.seq @u0 @x1)))
    :pattern ((FStar.Seq.Base.seq @u0 @x1))
    :qid constructor_distinct_FStar.Seq.Base.seq))
  :named constructor_distinct_FStar.Seq.Base.seq))


(assert
 (! 
  (forall ((@u0 Dummy_sort))
   (! (= 284 (Term_constr_id (FStar.UInt32.t @u0)))
    :pattern ((FStar.UInt32.t @u0))
    :qid constructor_distinct_FStar.UInt32.t))
  :named constructor_distinct_FStar.UInt32.t))


(assert
 (! (= 107 (Term_constr_id Prims.bool)) :named constructor_distinct_Prims.bool))


(assert
 (! (= 298 (Term_constr_id Prims.int)) :named constructor_distinct_Prims.int))


(assert
 (! (= 125 (Term_constr_id Prims.unit)) :named constructor_distinct_Prims.unit))


(assert
 (! 
  (forall ((@x0 Term))
   (! (=
     (FStar.BitVector.bv_t @x0)
     
     (Tm_refinement
      (FStar.Seq.Base.seq U_zero Prims.bool)
      (Tm_refine_pred_150c87740acaa31f788a9e84dd5820c2 @x0)))
    :pattern ((FStar.BitVector.bv_t @x0))
    :qid equation_FStar.BitVector.bv_t))
  :named equation_FStar.BitVector.bv_t))


(assert
 (! 
  (forall ((@x0 Term))
   (! (= (FStar.BitVector.ones_vec @x0) (FStar.Seq.Base.create U_zero Prims.bool @x0 (BoxBool true)))
    :pattern ((FStar.BitVector.ones_vec @x0))
    :qid equation_FStar.BitVector.ones_vec))
  :named equation_FStar.BitVector.ones_vec))


(assert
 (! 
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


(assert
 (! 
  (forall ((@x0 Term))
   (! (=
     (FStar.BitVector.zero_vec @x0)
     (FStar.Seq.Base.create U_zero Prims.bool @x0 (BoxBool false)))
    :pattern ((FStar.BitVector.zero_vec @x0))
    :qid equation_FStar.BitVector.zero_vec))
  :named equation_FStar.BitVector.zero_vec))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.add_mod @x0 @x1 @x2)
     (Prims.op_Modulus (Prims.op_Addition @x1 @x2) (Prims.pow2 @x0)))
    :pattern ((FStar.UInt.add_mod @x0 @x1 @x2))
    :qid equation_FStar.UInt.add_mod))
  :named equation_FStar.UInt.add_mod))


(assert
 (! 
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
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.UInt.lognot @x0 @x1)
     (FStar.UInt.from_vec @x0 (FStar.BitVector.lognot_vec @x0 (FStar.UInt.to_vec @x0 @x1))))
    :pattern ((FStar.UInt.lognot @x0 @x1))
    :qid equation_FStar.UInt.lognot))
  :named equation_FStar.UInt.lognot))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.logor @x0 @x1 @x2)
     (FStar.UInt.from_vec
      @x0
      (FStar.BitVector.logor_vec @x0 (FStar.UInt.to_vec @x0 @x1) (FStar.UInt.to_vec @x0 @x2))))
    :pattern ((FStar.UInt.logor @x0 @x1 @x2))
    :qid equation_FStar.UInt.logor))
  :named equation_FStar.UInt.logor))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.logxor @x0 @x1 @x2)
     (FStar.UInt.from_vec
      @x0
      (FStar.BitVector.logxor_vec @x0 (FStar.UInt.to_vec @x0 @x1) (FStar.UInt.to_vec @x0 @x2))))
    :pattern ((FStar.UInt.logxor @x0 @x1 @x2))
    :qid equation_FStar.UInt.logxor))
  :named equation_FStar.UInt.logxor))


(assert
 (! 
  (forall ((@x0 Term))
   (! (= (FStar.UInt.max_int @x0) (Prims.op_Subtraction (Prims.pow2 @x0) (BoxInt 1)))
    :pattern ((FStar.UInt.max_int @x0))
    :qid equation_FStar.UInt.max_int))
  :named equation_FStar.UInt.max_int))


(assert
 (! 
  (forall ((@x0 Term))
   (! (= (FStar.UInt.min_int @x0) (BoxInt 0))
    :pattern ((FStar.UInt.min_int @x0))
    :qid equation_FStar.UInt.min_int))
  :named equation_FStar.UInt.min_int))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt.minus @x0 @x1) (FStar.UInt.add_mod @x0 (FStar.UInt.lognot @x0 @x1) (BoxInt 1)))
    :pattern ((FStar.UInt.minus @x0 @x1))
    :qid equation_FStar.UInt.minus))
  :named equation_FStar.UInt.minus))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt.msb @x0 @x1) (FStar.UInt.nth @x0 @x1 (BoxInt 0)))
    :pattern ((FStar.UInt.msb @x0 @x1))
    :qid equation_FStar.UInt.msb))
  :named equation_FStar.UInt.msb))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.nth @x0 @x1 @x2)
     (FStar.Seq.Base.index U_zero Prims.bool (FStar.UInt.to_vec @x0 @x1) @x2))
    :pattern ((FStar.UInt.nth @x0 @x1 @x2))
    :qid equation_FStar.UInt.nth))
  :named equation_FStar.UInt.nth))


(assert
 (! 
  (forall ((@x0 Term))
   (! (= (FStar.UInt.ones @x0) (FStar.UInt.max_int @x0))
    :pattern ((FStar.UInt.ones @x0))
    :qid equation_FStar.UInt.ones))
  :named equation_FStar.UInt.ones))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.shift_right @x0 @x1 @x2)
     (FStar.UInt.from_vec @x0 (FStar.BitVector.shift_right_vec @x0 (FStar.UInt.to_vec @x0 @x1) @x2)))
    :pattern ((FStar.UInt.shift_right @x0 @x1 @x2))
    :qid equation_FStar.UInt.shift_right))
  :named equation_FStar.UInt.shift_right))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (FStar.UInt.size @x0 @x1) (Prims.b2t (FStar.UInt.fits @x0 @x1)))
    :pattern ((FStar.UInt.size @x0 @x1))
    :qid equation_FStar.UInt.size))
  :named equation_FStar.UInt.size))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.UInt.sub_mod @x0 @x1 @x2)
     (Prims.op_Modulus (Prims.op_Subtraction @x1 @x2) (Prims.pow2 @x0)))
    :pattern ((FStar.UInt.sub_mod @x0 @x1 @x2))
    :qid equation_FStar.UInt.sub_mod))
  :named equation_FStar.UInt.sub_mod))


(assert
 (! 
  (forall ((@x0 Term))
   (! (=
     (FStar.UInt.uint_t @x0)
     
     (Tm_refinement Prims.int (Tm_refine_pred_f13070840248fced9d9d60d77bdae3ec @x0)))
    :pattern ((FStar.UInt.uint_t @x0))
    :qid equation_FStar.UInt.uint_t))
  :named equation_FStar.UInt.uint_t))


(assert
 (! 
  (forall ((@x0 Term))
   (! (= (FStar.UInt.zero @x0) (BoxInt 0))
    :pattern ((FStar.UInt.zero @x0))
    :qid equation_FStar.UInt.zero))
  :named equation_FStar.UInt.zero))


(assert
 (! 
  (forall ((@x0 Term))
   (! (=
     (FStar.UInt32.minus @x0)
     (FStar.UInt32.add_mod (FStar.UInt32.lognot @x0) (FStar.UInt32.uint_to_t (BoxInt 1))))
    :pattern ((FStar.UInt32.minus @x0))
    :qid equation_FStar.UInt32.minus))
  :named equation_FStar.UInt32.minus))


(assert
 (! 
  (forall ((@u0 Dummy_sort))
   (! (=
     
     (FStar.UInt32.n_minus_one @u0)
     (FStar.UInt32.uint_to_t (BoxInt 31)))
    :pattern
     (
      (FStar.UInt32.n_minus_one @u0))
    :qid equation_FStar.UInt32.n_minus_one))
  :named equation_FStar.UInt32.n_minus_one))


(assert
 (! (=
   Prims.eqtype
   
   (Tm_refinement (Tm_type U_zero) Tm_refine_pred_9d6af3f3535473623f7aec2f0501897f))
  :named equation_Prims.eqtype))


(assert
 (! (=
   Prims.nat
   
   (Tm_refinement Prims.int Tm_refine_pred_542f9d4f129664613f2483a6c88bc7c2))
  :named equation_Prims.nat))


(assert
 (! (=
   Prims.nonzero
   
   (Tm_refinement Prims.int Tm_refine_pred_0766302b68bb44ab7aff8c4d8be0b46f))
  :named equation_Prims.nonzero))


(assert
 (! (=
   Prims.pos
   
   (Tm_refinement Prims.int Tm_refine_pred_774ba3f728d91ead8ef40be66c9802e5))
  :named equation_Prims.pos))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (Prims.pure_post @u0 @x1) (Prims.pure_post_ @u0 @x1 Prims.l_True))
    :pattern ((Prims.pure_post @u0 @x1))
    :qid equation_Prims.pure_post))
  :named equation_Prims.pure_post))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (Prims.pure_post_ @u0 @x1 @x2) (Tm_arrow_df7368353fc211da625f2c46a01987e1 @x1 @x2 @u0))
    :pattern ((Prims.pure_post_ @u0 @x1 @x2))
    :qid equation_Prims.pure_post_))
  :named equation_Prims.pure_post_))


(assert
 (! 
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


(assert
 (! 
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


(assert
 (! 
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


(assert
 (! 
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


(assert
 (! 
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


(assert
 (! 
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


(assert
 (! (HasType Prims.bool Prims.eqtype) :named function_token_typing_Prims.bool))


(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named function_token_typing_Prims.eqtype))


(assert
 (! (HasType Prims.int Prims.eqtype) :named function_token_typing_Prims.int))


(assert
 (! (HasType Prims.l_True Prims.prop) :named function_token_typing_Prims.l_True))


(assert
 (! (HasType Prims.nat (Tm_type U_zero)) :named function_token_typing_Prims.nat))


(assert
 (! (HasType Prims.nonzero (Tm_type U_zero)) :named function_token_typing_Prims.nonzero))


(assert
 (! (HasType Prims.pos (Tm_type U_zero)) :named function_token_typing_Prims.pos))


(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named function_token_typing_Prims.prop))


(assert
 (! (HasType Prims.unit Prims.eqtype) :named function_token_typing_Prims.unit))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@u2 (=> Term Bool)))
   (! (iff (Prims.hasEq @u0 @x1) (Prims.hasEq @u0 (Tm_refinement @x1 @u2)))
    :pattern ((Prims.hasEq @u0 (Tm_refinement @x1 @u2)))
    :qid has_eq_refine))
  :named has_eq_refine))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.int Tm_refine_pred_0766302b68bb44ab7aff8c4d8be0b46f))
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      
      (not (= @x1 (BoxInt 0)))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.int Tm_refine_pred_0766302b68bb44ab7aff8c4d8be0b46f)))
    :qid ho_refinement_interpretation_Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
  :named ho_refinement_interpretation_Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement
       (FStar.Seq.Base.seq @u2 @x3)
       (Tm_refine_pred_0ce91af3d6762ea7d913b870f9e33a01 @u2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 (FStar.Seq.Base.seq @u2 @x3))
      
      (= (FStar.Seq.Base.length @u2 @x3 @x1) (BoxInt 0))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement
        (FStar.Seq.Base.seq @u2 @x3)
        (Tm_refine_pred_0ce91af3d6762ea7d913b870f9e33a01 @u2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_0ce91af3d6762ea7d913b870f9e33a01))
  :named ho_refinement_interpretation_Tm_refine_0ce91af3d6762ea7d913b870f9e33a01))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_0ea1fba779ad5718e28476faeef94d56 @x2)))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      
      (= (FStar.UInt32.v @x1) @x2)))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement
        (FStar.UInt32.t Dummy_value)
        (Tm_refine_pred_0ea1fba779ad5718e28476faeef94d56 @x2))))
    :qid ho_refinement_interpretation_Tm_refine_0ea1fba779ad5718e28476faeef94d56))
  :named ho_refinement_interpretation_Tm_refine_0ea1fba779ad5718e28476faeef94d56))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement
       (FStar.Seq.Base.seq U_zero Prims.bool)
       (Tm_refine_pred_150c87740acaa31f788a9e84dd5820c2 @x2)))
     (and
      (HasTypeFuel @u0 @x1 (FStar.Seq.Base.seq U_zero Prims.bool))
      
      (= (FStar.Seq.Base.length U_zero Prims.bool @x1) @x2)))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement
        (FStar.Seq.Base.seq U_zero Prims.bool)
        (Tm_refine_pred_150c87740acaa31f788a9e84dd5820c2 @x2))))
    :qid ho_refinement_interpretation_Tm_refine_150c87740acaa31f788a9e84dd5820c2))
  :named ho_refinement_interpretation_Tm_refine_150c87740acaa31f788a9e84dd5820c2))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.nat (Tm_refine_pred_160fe7faad9a466b3cae8455bac5be60 @u2 @x3 @x4)))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 (FStar.Seq.Base.length @u2 @x3 @x4)))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_160fe7faad9a466b3cae8455bac5be60 @u2 @x3 @x4))))
    :qid ho_refinement_interpretation_Tm_refine_160fe7faad9a466b3cae8455bac5be60))
  :named ho_refinement_interpretation_Tm_refine_160fe7faad9a466b3cae8455bac5be60))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_2b25e5c3b25bc06167200cbfa5d36b3e @x2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      
      (=
       (FStar.UInt.logxor (BoxInt 32) (FStar.UInt32.v @x2) (FStar.UInt32.v @x3))
       (FStar.UInt32.v @x1))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement
        (FStar.UInt32.t Dummy_value)
        (Tm_refine_pred_2b25e5c3b25bc06167200cbfa5d36b3e @x2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_2b25e5c3b25bc06167200cbfa5d36b3e))
  :named ho_refinement_interpretation_Tm_refine_2b25e5c3b25bc06167200cbfa5d36b3e))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.nat (Tm_refine_pred_34425c23b534b8a294f8f063dd9faa4b @x2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      (BoxBool_proj_0 (Prims.op_LessThan @x1 @x2))
      (BoxBool_proj_0 (Prims.op_LessThan @x1 @x3))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_34425c23b534b8a294f8f063dd9faa4b @x2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_34425c23b534b8a294f8f063dd9faa4b))
  :named ho_refinement_interpretation_Tm_refine_34425c23b534b8a294f8f063dd9faa4b))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.nat (Tm_refine_pred_35a0739c434508f48d0bb1d5cd5df9e8 @x2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 (Prims.op_Subtraction @x2 @x3)))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_35a0739c434508f48d0bb1d5cd5df9e8 @x2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8))
  :named ho_refinement_interpretation_Tm_refine_35a0739c434508f48d0bb1d5cd5df9e8))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_39cb18a1d289e559096741772432b24f @x2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      
      (=
       (FStar.UInt.logor (BoxInt 32) (FStar.UInt32.v @x2) (FStar.UInt32.v @x3))
       (FStar.UInt32.v @x1))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement
        (FStar.UInt32.t Dummy_value)
        (Tm_refine_pred_39cb18a1d289e559096741772432b24f @x2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_39cb18a1d289e559096741772432b24f))
  :named ho_refinement_interpretation_Tm_refine_39cb18a1d289e559096741772432b24f))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.nat (Tm_refine_pred_444061fd0bd0053c4f27fa233082c9ca @u2 @x3 @x4 @x5)))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      
      (<
       (BoxInt_proj_0 @x1)
       (BoxInt_proj_0
        (Prims.op_Addition (FStar.Seq.Base.length @u2 @x3 @x4) (FStar.Seq.Base.length @u2 @x3 @x5))))
      
      (<= (BoxInt_proj_0 (FStar.Seq.Base.length @u2 @x3 @x4)) (BoxInt_proj_0 @x1))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_444061fd0bd0053c4f27fa233082c9ca @u2 @x3 @x4 @x5))))
    :qid ho_refinement_interpretation_Tm_refine_444061fd0bd0053c4f27fa233082c9ca))
  :named ho_refinement_interpretation_Tm_refine_444061fd0bd0053c4f27fa233082c9ca))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.int Tm_refine_pred_542f9d4f129664613f2483a6c88bc7c2))
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      
      (>= (BoxInt_proj_0 @x1) (BoxInt_proj_0 (BoxInt 0)))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.int Tm_refine_pred_542f9d4f129664613f2483a6c88bc7c2)))
    :qid ho_refinement_interpretation_Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
  :named ho_refinement_interpretation_Tm_refine_542f9d4f129664613f2483a6c88bc7c2))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_59202c8b625f4b04caf2081d6778d9e7 @x2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      
      (=
       (FStar.UInt.shift_right (BoxInt 32) (FStar.UInt32.v @x2) (FStar.UInt32.v @x3))
       (FStar.UInt32.v @x1))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement
        (FStar.UInt32.t Dummy_value)
        (Tm_refine_pred_59202c8b625f4b04caf2081d6778d9e7 @x2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_59202c8b625f4b04caf2081d6778d9e7))
  :named ho_refinement_interpretation_Tm_refine_59202c8b625f4b04caf2081d6778d9e7))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.nat (Tm_refine_pred_5a92b6e4e7af9363bc35e43d9d7f3f13 @u2 @x3 @x4 @x5)))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      (BoxBool_proj_0 (Prims.op_LessThanOrEqual @x3 @x1))
      (BoxBool_proj_0 (Prims.op_LessThanOrEqual @x1 (FStar.Seq.Base.length @u2 @x4 @x5)))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_5a92b6e4e7af9363bc35e43d9d7f3f13 @u2 @x3 @x4 @x5))))
    :qid ho_refinement_interpretation_Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13))
  :named ho_refinement_interpretation_Tm_refine_5a92b6e4e7af9363bc35e43d9d7f3f13))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.int Tm_refine_pred_774ba3f728d91ead8ef40be66c9802e5))
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      
      (> (BoxInt_proj_0 @x1) (BoxInt_proj_0 (BoxInt 0)))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.int Tm_refine_pred_774ba3f728d91ead8ef40be66c9802e5)))
    :qid ho_refinement_interpretation_Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
  :named ho_refinement_interpretation_Tm_refine_774ba3f728d91ead8ef40be66c9802e5))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.nat (Tm_refine_pred_7e0b9b2dbca36eab00de093c1b701c6d @x2)))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      
      (<= (BoxInt_proj_0 @x1) (BoxInt_proj_0 @x2))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_7e0b9b2dbca36eab00de093c1b701c6d @x2))))
    :qid ho_refinement_interpretation_Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d))
  :named ho_refinement_interpretation_Tm_refine_7e0b9b2dbca36eab00de093c1b701c6d))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement @x3 (Tm_refine_pred_9464479a8dbea99c4e6879c5c69f2f30 @x2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 @x3)
      
      (Valid
       
       @x2)))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement @x3 (Tm_refine_pred_9464479a8dbea99c4e6879c5c69f2f30 @x2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_9464479a8dbea99c4e6879c5c69f2f30))
  :named ho_refinement_interpretation_Tm_refine_9464479a8dbea99c4e6879c5c69f2f30))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement (Tm_type U_zero) Tm_refine_pred_9d6af3f3535473623f7aec2f0501897f))
     (and
      (HasTypeFuel @u0 @x1 (Tm_type U_zero))
      
      (Valid
       
       (Prims.hasEq U_zero @x1))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement (Tm_type U_zero) Tm_refine_pred_9d6af3f3535473623f7aec2f0501897f)))
    :qid ho_refinement_interpretation_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
  :named ho_refinement_interpretation_Tm_refine_9d6af3f3535473623f7aec2f0501897f))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_ace23c600fbe87b65e5fc333816f74de @x2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      
      (=
       (FStar.UInt.sub_mod (BoxInt 32) (FStar.UInt32.v @x2) (FStar.UInt32.v @x3))
       (FStar.UInt32.v @x1))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement
        (FStar.UInt32.t Dummy_value)
        (Tm_refine_pred_ace23c600fbe87b65e5fc333816f74de @x2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_ace23c600fbe87b65e5fc333816f74de))
  :named ho_refinement_interpretation_Tm_refine_ace23c600fbe87b65e5fc333816f74de))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.nat (Tm_refine_pred_b9ca4cf05147d86d6eff56ccafdd09d0 @u2 @x3 @x4 @x5)))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      
      (<= (BoxInt_proj_0 @x3) (BoxInt_proj_0 @x1))
      
      (<= (BoxInt_proj_0 @x1) (BoxInt_proj_0 (FStar.Seq.Base.length @u2 @x4 @x5)))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_b9ca4cf05147d86d6eff56ccafdd09d0 @u2 @x3 @x4 @x5))))
    :qid ho_refinement_interpretation_Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0))
  :named ho_refinement_interpretation_Tm_refine_b9ca4cf05147d86d6eff56ccafdd09d0))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.nat (Tm_refine_pred_c0ec47abc53a2509e744dad22ccf8191 @x2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      (BoxBool_proj_0 (Prims.op_LessThan @x1 @x2))
      (BoxBool_proj_0 (Prims.op_GreaterThanOrEqual @x1 @x3))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c0ec47abc53a2509e744dad22ccf8191 @x2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_c0ec47abc53a2509e744dad22ccf8191))
  :named ho_refinement_interpretation_Tm_refine_c0ec47abc53a2509e744dad22ccf8191))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x2)))
     (and
      (HasTypeFuel @u0 @x1 Prims.nat)
      
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 @x2))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x2))))
    :qid ho_refinement_interpretation_Tm_refine_c1424615841f28cac7fc34e92b7ff33c))
  :named ho_refinement_interpretation_Tm_refine_c1424615841f28cac7fc34e92b7ff33c))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_d5743ca0a8d5f3ceec748bdcb132b14f @x2)))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      
      (= (FStar.UInt.lognot (BoxInt 32) (FStar.UInt32.v @x2)) (FStar.UInt32.v @x1))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement
        (FStar.UInt32.t Dummy_value)
        (Tm_refine_pred_d5743ca0a8d5f3ceec748bdcb132b14f @x2))))
    :qid ho_refinement_interpretation_Tm_refine_d5743ca0a8d5f3ceec748bdcb132b14f))
  :named ho_refinement_interpretation_Tm_refine_d5743ca0a8d5f3ceec748bdcb132b14f))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_edc8fb7e909853d860d4ab445ef31337 @x2 @x3)))
     (and
      (HasTypeFuel @u0 @x1 (FStar.UInt32.t Dummy_value))
      
      (=
       (FStar.UInt.add_mod (BoxInt 32) (FStar.UInt32.v @x2) (FStar.UInt32.v @x3))
       (FStar.UInt32.v @x1))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement
        (FStar.UInt32.t Dummy_value)
        (Tm_refine_pred_edc8fb7e909853d860d4ab445ef31337 @x2 @x3))))
    :qid ho_refinement_interpretation_Tm_refine_edc8fb7e909853d860d4ab445ef31337))
  :named ho_refinement_interpretation_Tm_refine_edc8fb7e909853d860d4ab445ef31337))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     
     (HasTypeFuel
      @u0
      @x1
      
      (Tm_refinement Prims.int (Tm_refine_pred_f13070840248fced9d9d60d77bdae3ec @x2)))
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      
      (Valid
       
       (FStar.UInt.size @x1 @x2))))
    :pattern
     (
      (HasTypeFuel
       @u0
       @x1
       
       (Tm_refinement Prims.int (Tm_refine_pred_f13070840248fced9d9d60d77bdae3ec @x2))))
    :qid ho_refinement_interpretation_Tm_refine_f13070840248fced9d9d60d77bdae3ec))
  :named ho_refinement_interpretation_Tm_refine_f13070840248fced9d9d60d77bdae3ec))


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
 (! 
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (HasType (Tm_arrow_df7368353fc211da625f2c46a01987e1 @x0 @x1 @u2) (Tm_type @u2))
    :pattern ((HasType (Tm_arrow_df7368353fc211da625f2c46a01987e1 @x0 @x1 @u2) (Tm_type @u2)))
    :qid kinding_Tm_arrow_df7368353fc211da625f2c46a01987e1))
  :named kinding_Tm_arrow_df7368353fc211da625f2c46a01987e1))


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      
      (HasType
       @x2
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
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


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (FStar.BitVector.bv_t @x0))
      
      (HasType
       @x3
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
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


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 (FStar.BitVector.bv_t @x0))
      
      (HasType
       @x3
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
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


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 Prims.nat)
      
      (HasType
       @x3
       
       (Tm_refinement Prims.nat (Tm_refine_pred_34425c23b534b8a294f8f063dd9faa4b @x0 @x2))))
     
     (=
      (FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_right_vec @x0 @x1 @x2) @x3)
      (BoxBool false)))
    :pattern
     ((FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_right_vec @x0 @x1 @x2) @x3))
    :qid lemma_FStar.BitVector.shift_right_vec_lemma_1))
  :named lemma_FStar.BitVector.shift_right_vec_lemma_1))


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      (HasType @x2 Prims.nat)
      
      (HasType
       @x3
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c0ec47abc53a2509e744dad22ccf8191 @x0 @x2))))
     
     (=
      (FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_right_vec @x0 @x1 @x2) @x3)
      (FStar.Seq.Base.index U_zero Prims.bool @x1 (Prims.op_Subtraction @x3 @x2))))
    :pattern
     ((FStar.Seq.Base.index U_zero Prims.bool (FStar.BitVector.shift_right_vec @x0 @x1 @x2) @x3))
    :qid lemma_FStar.BitVector.shift_right_vec_lemma_2))
  :named lemma_FStar.BitVector.shift_right_vec_lemma_2))


(assert
 (! (forall ((@u0 Universe) (@x1 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      
      (Valid
       
       (Prims.hasEq @u0 @x1)))
     
     (Valid
      
      (Prims.hasEq @u0 (FStar.Seq.Base.seq @u0 @x1))))
    :pattern ((Prims.hasEq @u0 (FStar.Seq.Base.seq @u0 @x1)))
    :qid lemma_FStar.Seq.Base.hasEq_lemma))
  :named lemma_FStar.Seq.Base.hasEq_lemma))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 Prims.nat) (HasType @x3 @x1))
     
     (= (FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.create @u0 @x1 @x2 @x3)) @x2))
    :pattern ((FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.create @u0 @x1 @x2 @x3)))
    :qid lemma_FStar.Seq.Base.lemma_create_len))
  :named lemma_FStar.Seq.Base.lemma_create_len))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      
      (Valid
       
       (FStar.Seq.Base.equal @u0 @x1 @x2 @x3)))
     
     (= @x2 @x3))
    :pattern ((FStar.Seq.Base.equal @u0 @x1 @x2 @x3))
    :qid lemma_FStar.Seq.Base.lemma_eq_elim))
  :named lemma_FStar.Seq.Base.lemma_eq_elim))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      
      (= (FStar.Seq.Base.length @u0 @x1 @x2) (FStar.Seq.Base.length @u0 @x1 @x3))
      
      (forall ((@x4 Term))
       (! (implies
         
         (HasType
          @x4
          
          (Tm_refinement Prims.nat (Tm_refine_pred_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2)))
         
         (= (FStar.Seq.Base.index @u0 @x1 @x2 @x4) (FStar.Seq.Base.index @u0 @x1 @x3 @x4)))
        :pattern ((FStar.Seq.Base.index @u0 @x1 @x2 @x4) (FStar.Seq.Base.index @u0 @x1 @x3 @x4))
        :qid lemma_FStar.Seq.Base.lemma_eq_intro.1)))
     
     (Valid
      
      (FStar.Seq.Base.equal @u0 @x1 @x2 @x3)))
    :pattern ((FStar.Seq.Base.equal @u0 @x1 @x2 @x3))
    :qid lemma_FStar.Seq.Base.lemma_eq_intro))
  :named lemma_FStar.Seq.Base.lemma_eq_intro))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      
      (= @x2 @x3))
     
     (Valid
      
      (FStar.Seq.Base.equal @u0 @x1 @x2 @x3)))
    :pattern ((FStar.Seq.Base.equal @u0 @x1 @x2 @x3))
    :qid lemma_FStar.Seq.Base.lemma_eq_refl))
  :named lemma_FStar.Seq.Base.lemma_eq_refl))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      
      (HasType
       @x4
       
       (Tm_refinement Prims.nat (Tm_refine_pred_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2))))
     
     (=
      (FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3) @x4)
      (FStar.Seq.Base.index @u0 @x1 @x2 @x4)))
    :pattern ((FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3) @x4))
    :qid lemma_FStar.Seq.Base.lemma_index_app1))
  :named lemma_FStar.Seq.Base.lemma_index_app1))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1))
      
      (HasType
       @x4
       
       (Tm_refinement Prims.nat (Tm_refine_pred_444061fd0bd0053c4f27fa233082c9ca @u0 @x1 @x2 @x3))))
     
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


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.nat)
      (HasType @x3 @x1)
      
      (HasType
       @x4
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x2))))
     
     (= (FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.create @u0 @x1 @x2 @x3) @x4) @x3))
    :pattern ((FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.create @u0 @x1 @x2 @x3) @x4))
    :qid lemma_FStar.Seq.Base.lemma_index_create))
  :named lemma_FStar.Seq.Base.lemma_index_create))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 Prims.nat)
      
      (HasType
       @x4
       
       (Tm_refinement Prims.nat (Tm_refine_pred_b9ca4cf05147d86d6eff56ccafdd09d0 @u0 @x3 @x1 @x2)))
      
      (HasType
       @x5
       
       (Tm_refinement Prims.nat (Tm_refine_pred_35a0739c434508f48d0bb1d5cd5df9e8 @x4 @x3))))
     
     (=
      (FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4) @x5)
      (FStar.Seq.Base.index @u0 @x1 @x2 (Prims.op_Addition @x5 @x3))))
    :pattern ((FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4) @x5))
    :qid lemma_FStar.Seq.Base.lemma_index_slice))
  :named lemma_FStar.Seq.Base.lemma_index_slice))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 (FStar.Seq.Base.seq @u0 @x1)))
     
     (=
      (FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3))
      (Prims.op_Addition (FStar.Seq.Base.length @u0 @x1 @x2) (FStar.Seq.Base.length @u0 @x1 @x3))))
    :pattern ((FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.append @u0 @x1 @x2 @x3)))
    :qid lemma_FStar.Seq.Base.lemma_len_append))
  :named lemma_FStar.Seq.Base.lemma_len_append))


(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 Prims.nat)
      
      (HasType
       @x4
       
       (Tm_refinement Prims.nat (Tm_refine_pred_5a92b6e4e7af9363bc35e43d9d7f3f13 @u0 @x3 @x1 @x2))))
     
     (=
      (FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4))
      (Prims.op_Subtraction @x4 @x3)))
    :pattern ((FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4)))
    :qid lemma_FStar.Seq.Base.lemma_len_slice))
  :named lemma_FStar.Seq.Base.lemma_len_slice))


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      
      (HasType
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_7e0b9b2dbca36eab00de093c1b701c6d @x0)))
      
      (HasType
       @x2
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
     (and
      
      (<=
       (BoxInt_proj_0 (Prims.pow2.fuel_instrumented ZFuel @x1))
       (BoxInt_proj_0 (Prims.pow2.fuel_instrumented ZFuel @x0)))
      
      (implies
       
       (< (BoxInt_proj_0 @x2) (BoxInt_proj_0 (Prims.op_Subtraction @x0 @x1)))
       
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
      
      (implies
       
       (<= (BoxInt_proj_0 (Prims.op_Subtraction @x0 @x1)) (BoxInt_proj_0 @x2))
       
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


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.nat)
      (HasType @x1 (FStar.BitVector.bv_t @x0))
      
      (HasType
       @x2
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
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


(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.nat) (HasType @x1 (FStar.UInt.uint_t @x0)))
     
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


(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.nat) (HasType @x1 (FStar.BitVector.bv_t @x0)))
     
     (Valid
      
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


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      
      (HasType
       @x2
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
     (=
      (FStar.UInt.nth @x0 (FStar.UInt.lognot @x0 @x1) @x2)
      (Prims.op_Negation (FStar.UInt.nth @x0 @x1 @x2))))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.lognot @x0 @x1) @x2))
    :qid lemma_FStar.UInt.lognot_definition))
  :named lemma_FStar.UInt.lognot_definition))


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0))
      
      (HasType
       @x3
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
     (=
      (FStar.UInt.nth @x0 (FStar.UInt.logor @x0 @x1 @x2) @x3)
      (Prims.op_BarBar (FStar.UInt.nth @x0 @x1 @x3) (FStar.UInt.nth @x0 @x2 @x3))))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.logor @x0 @x1 @x2) @x3))
    :qid lemma_FStar.UInt.logor_definition))
  :named lemma_FStar.UInt.logor_definition))


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 (FStar.UInt.uint_t @x0))
      
      (HasType
       @x3
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
     (=
      (FStar.UInt.nth @x0 (FStar.UInt.logxor @x0 @x1 @x2) @x3)
      (Prims.op_disEquality Prims.bool (FStar.UInt.nth @x0 @x1 @x3) (FStar.UInt.nth @x0 @x2 @x3))))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.logxor @x0 @x1 @x2) @x3))
    :qid lemma_FStar.UInt.logxor_definition))
  :named lemma_FStar.UInt.logxor_definition))


(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.pos)
     
     (=
      (FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 (FStar.BitVector.ones_vec @x0))
      (FStar.UInt.ones @x0)))
    :pattern ((FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 (FStar.BitVector.ones_vec @x0)))
    :qid lemma_FStar.UInt.ones_from_vec_lemma))
  :named lemma_FStar.UInt.ones_from_vec_lemma))


(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      
      (HasType
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
     (= (FStar.UInt.nth @x0 (FStar.UInt.ones @x0) @x1) (BoxBool true)))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.ones @x0) @x1))
    :qid lemma_FStar.UInt.ones_nth_lemma))
  :named lemma_FStar.UInt.ones_nth_lemma))


(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      
      (HasType
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
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


(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.nat)
     (let ((@lb1 @x0))
      (ite
       (= @lb1 (BoxInt 0))
       
       (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 1))
       (ite
        (= @lb1 (BoxInt 1))
        
        (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 2))
        (ite
         (= @lb1 (BoxInt 8))
         
         (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 256))
         (ite
          (= @lb1 (BoxInt 16))
          
          (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 65536))
          (ite
           (= @lb1 (BoxInt 31))
           
           (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 2147483648))
           (ite
            (= @lb1 (BoxInt 32))
            
            (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 4294967296))
            (ite
             (= @lb1 (BoxInt 63))
             
             (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 9223372036854775808))
             (ite
              (= @lb1 (BoxInt 64))
              
              (= (Prims.pow2.fuel_instrumented ZFuel @x0) (BoxInt 18446744073709551616))
              (implies
               (= @lb1 (BoxInt 128))
               
               (=
                (Prims.pow2.fuel_instrumented ZFuel @x0)
                (BoxInt 340282366920938463463374607431768211456)))))))))))))
    :pattern ((Prims.pow2.fuel_instrumented ZFuel @x0))
    :qid lemma_FStar.UInt.pow2_values))
  :named lemma_FStar.UInt.pow2_values))


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 Prims.nat)
      
      (HasType
       @x3
       
       (Tm_refinement Prims.nat (Tm_refine_pred_34425c23b534b8a294f8f063dd9faa4b @x0 @x2))))
     
     (= (FStar.UInt.nth @x0 (FStar.UInt.shift_right @x0 @x1 @x2) @x3) (BoxBool false)))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.shift_right @x0 @x1 @x2) @x3))
    :qid lemma_FStar.UInt.shift_right_lemma_1))
  :named lemma_FStar.UInt.shift_right_lemma_1))


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      (HasType @x2 Prims.nat)
      
      (HasType
       @x3
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c0ec47abc53a2509e744dad22ccf8191 @x0 @x2))))
     
     (=
      (FStar.UInt.nth @x0 (FStar.UInt.shift_right @x0 @x1 @x2) @x3)
      (FStar.UInt.nth @x0 @x1 (Prims.op_Subtraction @x3 @x2))))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.shift_right @x0 @x1 @x2) @x3))
    :qid lemma_FStar.UInt.shift_right_lemma_2))
  :named lemma_FStar.UInt.shift_right_lemma_2))


(assert
 (! (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)) (HasType @x2 Prims.nat))
     
     (=
      (FStar.UInt.shift_right @x0 @x1 @x2)
      (Prims.op_Division @x1 (Prims.pow2.fuel_instrumented ZFuel @x2))))
    :pattern ((FStar.UInt.shift_right @x0 @x1 @x2))
    :qid lemma_FStar.UInt.shift_right_value_lemma))
  :named lemma_FStar.UInt.shift_right_value_lemma))


(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.pos)
     
     (=
      (FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 (FStar.BitVector.zero_vec @x0))
      (FStar.UInt.zero @x0)))
    :pattern ((FStar.UInt.from_vec.fuel_instrumented ZFuel @x0 (FStar.BitVector.zero_vec @x0)))
    :qid lemma_FStar.UInt.zero_from_vec_lemma))
  :named lemma_FStar.UInt.zero_from_vec_lemma))


(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      
      (HasType
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
     (= (FStar.UInt.nth @x0 (FStar.UInt.zero @x0) @x1) (BoxBool false)))
    :pattern ((FStar.UInt.nth @x0 (FStar.UInt.zero @x0) @x1))
    :qid lemma_FStar.UInt.zero_nth_lemma))
  :named lemma_FStar.UInt.zero_nth_lemma))


(assert
 (! (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      
      (HasType
       @x1
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     
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


(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt32.t Dummy_value))
     
     (= (FStar.UInt32.uint_to_t (FStar.UInt32.v @x0)) @x0))
    :pattern ((FStar.UInt32.v @x0))
    :qid lemma_FStar.UInt32.uv_inv))
  :named lemma_FStar.UInt32.uv_inv))


(assert
 (! (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt.uint_t (BoxInt 32)))
     
     (= (FStar.UInt32.v (FStar.UInt32.uint_to_t @x0)) @x0))
    :pattern ((FStar.UInt32.uint_to_t @x0))
    :qid lemma_FStar.UInt32.vu_inv))
  :named lemma_FStar.UInt32.vu_inv))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Addition @x0 @x1) (BoxInt (+ (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Addition @x0 @x1))
    :qid primitive_Prims.op_Addition))
  :named primitive_Prims.op_Addition))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_AmpAmp @x0 @x1) (BoxBool (and (BoxBool_proj_0 @x0) (BoxBool_proj_0 @x1))))
    :pattern ((Prims.op_AmpAmp @x0 @x1))
    :qid primitive_Prims.op_AmpAmp))
  :named primitive_Prims.op_AmpAmp))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_BarBar @x0 @x1) (BoxBool (or (BoxBool_proj_0 @x0) (BoxBool_proj_0 @x1))))
    :pattern ((Prims.op_BarBar @x0 @x1))
    :qid primitive_Prims.op_BarBar))
  :named primitive_Prims.op_BarBar))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (not (= (BoxInt_proj_0 @x1) 0))
     (= (Prims.op_Division @x0 @x1) (BoxInt (div (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1)))))
    :pattern ((Prims.op_Division @x0 @x1))
    :qid primitive_Prims.op_Division))
  :named primitive_Prims.op_Division))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (Prims.op_Equality @x0 @x1 @x2) (BoxBool (= @x1 @x2)))
    :pattern ((Prims.op_Equality @x0 @x1 @x2))
    :qid primitive_Prims.op_Equality))
  :named primitive_Prims.op_Equality))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (Prims.op_GreaterThanOrEqual @x0 @x1)
     (BoxBool (>= (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_GreaterThanOrEqual @x0 @x1))
    :qid primitive_Prims.op_GreaterThanOrEqual))
  :named primitive_Prims.op_GreaterThanOrEqual))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_LessThan @x0 @x1) (BoxBool (< (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_LessThan @x0 @x1))
    :qid primitive_Prims.op_LessThan))
  :named primitive_Prims.op_LessThan))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_LessThanOrEqual @x0 @x1) (BoxBool (<= (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_LessThanOrEqual @x0 @x1))
    :qid primitive_Prims.op_LessThanOrEqual))
  :named primitive_Prims.op_LessThanOrEqual))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (not (= (BoxInt_proj_0 @x1) 0))
     (= (Prims.op_Modulus @x0 @x1) (BoxInt (mod (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1)))))
    :pattern ((Prims.op_Modulus @x0 @x1))
    :qid primitive_Prims.op_Modulus))
  :named primitive_Prims.op_Modulus))

(assert
 (! 
  (forall ((@x0 Term))
   (! (= (Prims.op_Negation @x0) (BoxBool (not (BoxBool_proj_0 @x0))))
    :pattern ((Prims.op_Negation @x0))
    :qid primitive_Prims.op_Negation))
  :named primitive_Prims.op_Negation))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Star @x0 @x1) (BoxInt (* (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Star @x0 @x1))
    :qid primitive_Prims.op_Star))
  :named primitive_Prims.op_Star))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (= (Prims.op_Subtraction @x0 @x1) (BoxInt (- (BoxInt_proj_0 @x0) (BoxInt_proj_0 @x1))))
    :pattern ((Prims.op_Subtraction @x0 @x1))
    :qid primitive_Prims.op_Subtraction))
  :named primitive_Prims.op_Subtraction))

(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (Prims.op_disEquality @x0 @x1 @x2) (BoxBool (not (= @x1 @x2))))
    :pattern ((Prims.op_disEquality @x0 @x1 @x2))
    :qid primitive_Prims.op_disEquality))
  :named primitive_Prims.op_disEquality))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.pos) (HasType @x2 (FStar.BitVector.bv_t @x1)))
     (HasType (FStar.BitVector.lognot_vec.fuel_instrumented @u0 @x1 @x2) (FStar.BitVector.bv_t @x1)))
    :pattern ((FStar.BitVector.lognot_vec.fuel_instrumented @u0 @x1 @x2))
    :qid token_correspondence_FStar.BitVector.lognot_vec.fuel_instrumented))
  :named token_correspondence_FStar.BitVector.lognot_vec.fuel_instrumented))


(assert
 (! 
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


(assert
 (! 
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


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.nat) (HasType @x2 (FStar.BitVector.bv_t @x1)))
     (HasType (FStar.UInt.from_vec.fuel_instrumented @u0 @x1 @x2) (FStar.UInt.uint_t @x1)))
    :pattern ((FStar.UInt.from_vec.fuel_instrumented @u0 @x1 @x2))
    :qid token_correspondence_FStar.UInt.from_vec.fuel_instrumented))
  :named token_correspondence_FStar.UInt.from_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.nat) (HasType @x2 (FStar.UInt.uint_t @x1)))
     (HasType (FStar.UInt.to_vec.fuel_instrumented @u0 @x1 @x2) (FStar.BitVector.bv_t @x1)))
    :pattern ((FStar.UInt.to_vec.fuel_instrumented @u0 @x1 @x2))
    :qid token_correspondence_FStar.UInt.to_vec.fuel_instrumented))
  :named token_correspondence_FStar.UInt.to_vec.fuel_instrumented))


(assert
 (! 
  (forall ((@u0 Fuel) (@x1 Term))
   (! (implies (HasType @x1 Prims.nat) (HasType (Prims.pow2.fuel_instrumented @u0 @x1) Prims.pos))
    :pattern ((Prims.pow2.fuel_instrumented @u0 @x1))
    :qid token_correspondence_Prims.pow2.fuel_instrumented))
  :named token_correspondence_Prims.pow2.fuel_instrumented))


(assert (! (Valid Prims.l_True) :named true_interp))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.BitVector.bv_t @x0) (Tm_type U_zero)))
    :pattern ((FStar.BitVector.bv_t @x0))
    :qid typing_FStar.BitVector.bv_t))
  :named typing_FStar.BitVector.bv_t))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.BitVector.bv_t @x0)))
     (HasType (FStar.BitVector.lognot_vec @x0 @x1) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.lognot_vec @x0 @x1))
    :qid typing_FStar.BitVector.lognot_vec))
  :named typing_FStar.BitVector.lognot_vec))


(assert
 (! 
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


(assert
 (! 
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


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.pos)
     (HasType (FStar.BitVector.ones_vec @x0) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.ones_vec @x0))
    :qid typing_FStar.BitVector.ones_vec))
  :named typing_FStar.BitVector.ones_vec))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.BitVector.bv_t @x0)) (HasType @x2 Prims.nat))
     (HasType (FStar.BitVector.shift_right_vec @x0 @x1 @x2) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.shift_right_vec @x0 @x1 @x2))
    :qid typing_FStar.BitVector.shift_right_vec))
  :named typing_FStar.BitVector.shift_right_vec))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.pos)
     (HasType (FStar.BitVector.zero_vec @x0) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.BitVector.zero_vec @x0))
    :qid typing_FStar.BitVector.zero_vec))
  :named typing_FStar.BitVector.zero_vec))


(assert
 (! 
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


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 Prims.nat) (HasType @x3 @x1))
     (HasType (FStar.Seq.Base.create @u0 @x1 @x2 @x3) (FStar.Seq.Base.seq @u0 @x1)))
    :pattern ((FStar.Seq.Base.create @u0 @x1 @x2 @x3))
    :qid typing_FStar.Seq.Base.create))
  :named typing_FStar.Seq.Base.create))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies
     (HasType @x1 (Tm_type @u0))
     
     (HasType
      (FStar.Seq.Base.empty @u0 @x1)
      
      (Tm_refinement
       (FStar.Seq.Base.seq @u0 @x1)
       (Tm_refine_pred_0ce91af3d6762ea7d913b870f9e33a01 @u0 @x1))))
    :pattern ((FStar.Seq.Base.empty @u0 @x1))
    :qid typing_FStar.Seq.Base.empty))
  :named typing_FStar.Seq.Base.empty))


(assert
 (! 
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


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      
      (HasType
       @x3
       
       (Tm_refinement Prims.nat (Tm_refine_pred_160fe7faad9a466b3cae8455bac5be60 @u0 @x1 @x2))))
     (HasType (FStar.Seq.Base.index @u0 @x1 @x2 @x3) @x1))
    :pattern ((FStar.Seq.Base.index @u0 @x1 @x2 @x3))
    :qid typing_FStar.Seq.Base.index))
  :named typing_FStar.Seq.Base.index))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Seq.Base.seq @u0 @x1)))
     (HasType (FStar.Seq.Base.length @u0 @x1 @x2) Prims.nat))
    :pattern ((FStar.Seq.Base.length @u0 @x1 @x2))
    :qid typing_FStar.Seq.Base.length))
  :named typing_FStar.Seq.Base.length))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies (HasType @x1 (Tm_type @u0)) (HasType (FStar.Seq.Base.seq @u0 @x1) (Tm_type @u0)))
    :pattern ((FStar.Seq.Base.seq @u0 @x1))
    :qid typing_FStar.Seq.Base.seq))
  :named typing_FStar.Seq.Base.seq))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Seq.Base.seq @u0 @x1))
      (HasType @x3 Prims.nat)
      
      (HasType
       @x4
       
       (Tm_refinement Prims.nat (Tm_refine_pred_5a92b6e4e7af9363bc35e43d9d7f3f13 @u0 @x3 @x1 @x2))))
     (HasType (FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4) (FStar.Seq.Base.seq @u0 @x1)))
    :pattern ((FStar.Seq.Base.slice @u0 @x1 @x2 @x3 @x4))
    :qid typing_FStar.Seq.Base.slice))
  :named typing_FStar.Seq.Base.slice))


(assert
 (! 
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


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.nat))
     (HasType (FStar.UInt.fits @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt.fits @x0 @x1))
    :qid typing_FStar.UInt.fits))
  :named typing_FStar.UInt.fits))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.nat) (HasType @x1 (FStar.BitVector.bv_t @x0)))
     (HasType (FStar.UInt.from_vec @x0 @x1) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.from_vec @x0 @x1))
    :qid typing_FStar.UInt.from_vec))
  :named typing_FStar.UInt.from_vec))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.lognot @x0 @x1) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.lognot @x0 @x1))
    :qid typing_FStar.UInt.lognot))
  :named typing_FStar.UInt.lognot))


(assert
 (! 
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


(assert
 (! 
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


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.max_int @x0) Prims.int))
    :pattern ((FStar.UInt.max_int @x0))
    :qid typing_FStar.UInt.max_int))
  :named typing_FStar.UInt.max_int))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.min_int @x0) Prims.int))
    :pattern ((FStar.UInt.min_int @x0))
    :qid typing_FStar.UInt.min_int))
  :named typing_FStar.UInt.min_int))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.minus @x0 @x1) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.minus @x0 @x1))
    :qid typing_FStar.UInt.minus))
  :named typing_FStar.UInt.minus))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.msb @x0 @x1) Prims.bool))
    :pattern ((FStar.UInt.msb @x0 @x1))
    :qid typing_FStar.UInt.msb))
  :named typing_FStar.UInt.msb))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 (FStar.UInt.uint_t @x0))
      
      (HasType
       @x2
       
       (Tm_refinement Prims.nat (Tm_refine_pred_c1424615841f28cac7fc34e92b7ff33c @x0))))
     (HasType (FStar.UInt.nth @x0 @x1 @x2) Prims.bool))
    :pattern ((FStar.UInt.nth @x0 @x1 @x2))
    :qid typing_FStar.UInt.nth))
  :named typing_FStar.UInt.nth))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.ones @x0) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.ones @x0))
    :qid typing_FStar.UInt.ones))
  :named typing_FStar.UInt.ones))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.pos) (HasType @x1 (FStar.UInt.uint_t @x0)) (HasType @x2 Prims.nat))
     (HasType (FStar.UInt.shift_right @x0 @x1 @x2) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.shift_right @x0 @x1 @x2))
    :qid typing_FStar.UInt.shift_right))
  :named typing_FStar.UInt.shift_right))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.nat))
     (HasType (FStar.UInt.size @x0 @x1) Prims.prop))
    :pattern ((FStar.UInt.size @x0 @x1))
    :qid typing_FStar.UInt.size))
  :named typing_FStar.UInt.size))


(assert
 (! 
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


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.nat) (HasType @x1 (FStar.UInt.uint_t @x0)))
     (HasType (FStar.UInt.to_vec @x0 @x1) (FStar.BitVector.bv_t @x0)))
    :pattern ((FStar.UInt.to_vec @x0 @x1))
    :qid typing_FStar.UInt.to_vec))
  :named typing_FStar.UInt.to_vec))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.uint_t @x0) (Tm_type U_zero)))
    :pattern ((FStar.UInt.uint_t @x0))
    :qid typing_FStar.UInt.uint_t))
  :named typing_FStar.UInt.uint_t))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (FStar.UInt.zero @x0) (FStar.UInt.uint_t @x0)))
    :pattern ((FStar.UInt.zero @x0))
    :qid typing_FStar.UInt.zero))
  :named typing_FStar.UInt.zero))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt32.t Dummy_value)) (HasType @x1 (FStar.UInt32.t Dummy_value)))
     
     (HasType
      (FStar.UInt32.add_mod @x0 @x1)
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_edc8fb7e909853d860d4ab445ef31337 @x0 @x1))))
    :pattern ((FStar.UInt32.add_mod @x0 @x1))
    :qid typing_FStar.UInt32.add_mod))
  :named typing_FStar.UInt32.add_mod))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt32.t Dummy_value))
     
     (HasType
      (FStar.UInt32.lognot @x0)
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_d5743ca0a8d5f3ceec748bdcb132b14f @x0))))
    :pattern ((FStar.UInt32.lognot @x0))
    :qid typing_FStar.UInt32.lognot))
  :named typing_FStar.UInt32.lognot))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt32.t Dummy_value)) (HasType @x1 (FStar.UInt32.t Dummy_value)))
     
     (HasType
      (FStar.UInt32.logor @x0 @x1)
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_39cb18a1d289e559096741772432b24f @x0 @x1))))
    :pattern ((FStar.UInt32.logor @x0 @x1))
    :qid typing_FStar.UInt32.logor))
  :named typing_FStar.UInt32.logor))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt32.t Dummy_value)) (HasType @x1 (FStar.UInt32.t Dummy_value)))
     
     (HasType
      (FStar.UInt32.logxor @x0 @x1)
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_2b25e5c3b25bc06167200cbfa5d36b3e @x0 @x1))))
    :pattern ((FStar.UInt32.logxor @x0 @x1))
    :qid typing_FStar.UInt32.logxor))
  :named typing_FStar.UInt32.logxor))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt32.t Dummy_value))
     (HasType (FStar.UInt32.minus @x0) (FStar.UInt32.t Dummy_value)))
    :pattern ((FStar.UInt32.minus @x0))
    :qid typing_FStar.UInt32.minus))
  :named typing_FStar.UInt32.minus))


(assert
 (! 
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt32.n_minus_one @u0) (FStar.UInt32.t Dummy_value))
    :pattern ((FStar.UInt32.n_minus_one @u0))
    :qid typing_FStar.UInt32.n_minus_one))
  :named typing_FStar.UInt32.n_minus_one))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and
      
      (< (BoxInt_proj_0 (FStar.UInt32.v @x1)) (BoxInt_proj_0 (BoxInt 32)))
      (HasType @x0 (FStar.UInt32.t Dummy_value))
      (HasType @x1 (FStar.UInt32.t Dummy_value)))
     
     (HasType
      (FStar.UInt32.shift_right @x0 @x1)
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_59202c8b625f4b04caf2081d6778d9e7 @x0 @x1))))
    :pattern ((FStar.UInt32.shift_right @x0 @x1))
    :qid typing_FStar.UInt32.shift_right))
  :named typing_FStar.UInt32.shift_right))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 (FStar.UInt32.t Dummy_value)) (HasType @x1 (FStar.UInt32.t Dummy_value)))
     
     (HasType
      (FStar.UInt32.sub_mod @x0 @x1)
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_ace23c600fbe87b65e5fc333816f74de @x0 @x1))))
    :pattern ((FStar.UInt32.sub_mod @x0 @x1))
    :qid typing_FStar.UInt32.sub_mod))
  :named typing_FStar.UInt32.sub_mod))


(assert
 (! 
  (forall ((@u0 Dummy_sort))
   (! (HasType (FStar.UInt32.t @u0) Prims.eqtype)
    :pattern ((FStar.UInt32.t @u0))
    :qid typing_FStar.UInt32.t))
  :named typing_FStar.UInt32.t))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt.uint_t (BoxInt 32)))
     
     (HasType
      (FStar.UInt32.uint_to_t @x0)
      
      (Tm_refinement
       (FStar.UInt32.t Dummy_value)
       (Tm_refine_pred_0ea1fba779ad5718e28476faeef94d56 @x0))))
    :pattern ((FStar.UInt32.uint_to_t @x0))
    :qid typing_FStar.UInt32.uint_to_t))
  :named typing_FStar.UInt32.uint_to_t))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 (FStar.UInt32.t Dummy_value))
     (HasType (FStar.UInt32.v @x0) (FStar.UInt.uint_t (BoxInt 32))))
    :pattern ((FStar.UInt32.v @x0))
    :qid typing_FStar.UInt32.v))
  :named typing_FStar.UInt32.v))


(assert
 (! (HasType Prims.bool Prims.eqtype) :named typing_Prims.bool))


(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named typing_Prims.eqtype))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies (HasType @x1 (Tm_type @u0)) (HasType (Prims.hasEq @u0 @x1) Prims.prop))
    :pattern ((Prims.hasEq @u0 @x1))
    :qid typing_Prims.hasEq))
  :named typing_Prims.hasEq))


(assert
 (! (HasType Prims.int Prims.eqtype) :named typing_Prims.int))


(assert
 (! (HasType Prims.l_True Prims.prop) :named typing_Prims.l_True))


(assert
 (! (HasType Prims.nat (Tm_type U_zero)) :named typing_Prims.nat))


(assert
 (! (HasType Prims.nonzero (Tm_type U_zero)) :named typing_Prims.nonzero))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_Addition @x0 @x1) Prims.int))
    :pattern ((Prims.op_Addition @x0 @x1))
    :qid typing_Prims.op_Addition))
  :named typing_Prims.op_Addition))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.bool) (HasType @x1 Prims.bool))
     (HasType (Prims.op_AmpAmp @x0 @x1) Prims.bool))
    :pattern ((Prims.op_AmpAmp @x0 @x1))
    :qid typing_Prims.op_AmpAmp))
  :named typing_Prims.op_AmpAmp))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.bool) (HasType @x1 Prims.bool))
     (HasType (Prims.op_BarBar @x0 @x1) Prims.bool))
    :pattern ((Prims.op_BarBar @x0 @x1))
    :qid typing_Prims.op_BarBar))
  :named typing_Prims.op_BarBar))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.nonzero))
     (HasType (Prims.op_Division @x0 @x1) Prims.int))
    :pattern ((Prims.op_Division @x0 @x1))
    :qid typing_Prims.op_Division))
  :named typing_Prims.op_Division))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.eqtype) (HasType @x1 @x0) (HasType @x2 @x0))
     (HasType (Prims.op_Equality @x0 @x1 @x2) Prims.bool))
    :pattern ((Prims.op_Equality @x0 @x1 @x2))
    :qid typing_Prims.op_Equality))
  :named typing_Prims.op_Equality))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_GreaterThanOrEqual @x0 @x1) Prims.bool))
    :pattern ((Prims.op_GreaterThanOrEqual @x0 @x1))
    :qid typing_Prims.op_GreaterThanOrEqual))
  :named typing_Prims.op_GreaterThanOrEqual))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_LessThan @x0 @x1) Prims.bool))
    :pattern ((Prims.op_LessThan @x0 @x1))
    :qid typing_Prims.op_LessThan))
  :named typing_Prims.op_LessThan))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_LessThanOrEqual @x0 @x1) Prims.bool))
    :pattern ((Prims.op_LessThanOrEqual @x0 @x1))
    :qid typing_Prims.op_LessThanOrEqual))
  :named typing_Prims.op_LessThanOrEqual))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.nonzero))
     (HasType (Prims.op_Modulus @x0 @x1) Prims.int))
    :pattern ((Prims.op_Modulus @x0 @x1))
    :qid typing_Prims.op_Modulus))
  :named typing_Prims.op_Modulus))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.bool) (HasType (Prims.op_Negation @x0) Prims.bool))
    :pattern ((Prims.op_Negation @x0))
    :qid typing_Prims.op_Negation))
  :named typing_Prims.op_Negation))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_Star @x0 @x1) Prims.int))
    :pattern ((Prims.op_Star @x0 @x1))
    :qid typing_Prims.op_Star))
  :named typing_Prims.op_Star))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (Prims.op_Subtraction @x0 @x1) Prims.int))
    :pattern ((Prims.op_Subtraction @x0 @x1))
    :qid typing_Prims.op_Subtraction))
  :named typing_Prims.op_Subtraction))


(assert
 (! 
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.eqtype) (HasType @x1 @x0) (HasType @x2 @x0))
     (HasType (Prims.op_disEquality @x0 @x1 @x2) Prims.bool))
    :pattern ((Prims.op_disEquality @x0 @x1 @x2))
    :qid typing_Prims.op_disEquality))
  :named typing_Prims.op_disEquality))


(assert
 (! (HasType Prims.pos (Tm_type U_zero)) :named typing_Prims.pos))


(assert
 (! 
  (forall ((@x0 Term))
   (! (implies (HasType @x0 Prims.nat) (HasType (Prims.pow2 @x0) Prims.pos))
    :pattern ((Prims.pow2 @x0))
    :qid typing_Prims.pow2))
  :named typing_Prims.pow2))


(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named typing_Prims.prop))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies (HasType @x1 (Tm_type @u0)) (HasType (Prims.pure_post @u0 @x1) (Tm_type @u0)))
    :pattern ((Prims.pure_post @u0 @x1))
    :qid typing_Prims.pure_post))
  :named typing_Prims.pure_post))


(assert
 (! 
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 Prims.prop))
     (HasType (Prims.pure_post_ @u0 @x1 @x2) (Tm_type @u0)))
    :pattern ((Prims.pure_post_ @u0 @x1 @x2))
    :qid typing_Prims.pure_post_))
  :named typing_Prims.pure_post_))


(assert
 (! (HasType Prims.unit Prims.eqtype) :named typing_Prims.unit))


(assert
 (! (forall ((@u0 Fuel) (@x1 Term))
   (! (implies (HasTypeFuel @u0 @x1 Prims.unit) (= @x1 Tm_unit))
    :pattern ((HasTypeFuel @u0 @x1 Prims.unit))
    :qid unit_inversion))
  :named unit_inversion))


(assert
 (! (HasType Tm_unit Prims.unit) :named unit_typing))
(push) 

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





















































































































































(push) 


(assert (! (= MaxFuel (SFuel ZFuel)) :named @MaxFuel_assumption))

(assert (! (= MaxIFuel (SFuel ZFuel)) :named @MaxIFuel_assumption))


(assert
 (! (not
   (forall ((@x0 Term) (@x1 Term))
    (! (implies
      (and (HasType @x0 (FStar.UInt32.t Dummy_value)) (HasType @x1 (FStar.UInt32.t Dummy_value)))
      
      (and
       
       (forall ((@x2 Term))
        (! (implies
          (HasType @x2 (FStar.UInt32.t Dummy_value))
          
          (and
           
           (or
            label_1
            
            (Valid
             
             (Prims.hasEq U_zero (FStar.UInt.uint_t (BoxInt 32)))))
           (implies
            
            (implies
             
             (= (FStar.UInt32.v @x0) (FStar.UInt32.v @x1))
             
             (= (FStar.UInt32.v @x2) (Prims.op_Subtraction (Prims.pow2 (BoxInt 32)) (BoxInt 1))))
            
            (or
             label_2
             
             (Valid
              
              (Prims.hasEq U_zero (FStar.UInt.uint_t (BoxInt 32))))))))
         :qid @query.1))
       
       (forall ((@x2 Term))
        (! (implies
          (and
           (HasType @x2 (Prims.pure_post U_zero (FStar.UInt32.t Dummy_value)))
           
           (forall ((@x3 Term))
            (! (implies
              (and
               (or label_3 (HasType @x3 (FStar.UInt32.t Dummy_value)))
               (implies
                
                (= (FStar.UInt32.v @x0) (FStar.UInt32.v @x1))
                
                (or
                 label_4
                 
                 (= (FStar.UInt32.v @x3) (Prims.op_Subtraction (Prims.pow2 (BoxInt 32)) (BoxInt 1)))))
               (implies
                
                (not (= (FStar.UInt32.v @x0) (FStar.UInt32.v @x1)))
                
                (or
                 label_5
                 
                 (= (FStar.UInt32.v @x3) (BoxInt 0)))))
              
              (Valid
               
               (ApplyTT @x2 @x3)))
             :pattern
              (
               (Valid
                
                (ApplyTT @x2 @x3)))
             :qid @query.3)))
          
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 (FStar.UInt32.t Dummy_value))
              
              (=
               (FStar.UInt.logxor (BoxInt 32) (FStar.UInt32.v @x0) (FStar.UInt32.v @x1))
               (FStar.UInt32.v @x3))
              
              (= (FStar.UInt32.logxor @x0 @x1) @x3))
             
             (forall ((@x4 Term))
              (! (implies
                (and
                 (HasType @x4 (FStar.UInt32.t Dummy_value))
                 
                 (= (FStar.UInt32.minus @x3) @x4))
                
                (forall ((@x5 Term))
                 (! (implies
                   (and
                    (HasType @x5 (FStar.UInt32.t Dummy_value))
                    
                    (=
                     (FStar.UInt.logor (BoxInt 32) (FStar.UInt32.v @x3) (FStar.UInt32.v @x4))
                     (FStar.UInt32.v @x5))
                    
                    (= (FStar.UInt32.logor @x3 @x4) @x5))
                   
                   (and
                    
                    (or
                     label_6
                     
                     (<
                      (BoxInt_proj_0 (FStar.UInt32.v (FStar.UInt32.n_minus_one Dummy_value)))
                      (BoxInt_proj_0 (BoxInt 32))))
                    
                    (forall ((@x6 Term))
                     (! (implies
                       (and
                        (HasType @x6 (FStar.UInt32.t Dummy_value))
                        
                        (=
                         (FStar.UInt.shift_right
                          (BoxInt 32)
                          (FStar.UInt32.v @x5)
                          (FStar.UInt32.v (FStar.UInt32.n_minus_one Dummy_value)))
                         (FStar.UInt32.v @x6))
                        
                        (= (FStar.UInt32.shift_right @x5 (FStar.UInt32.n_minus_one Dummy_value)) @x6))
                       
                       (and
                        
                        (or
                         label_7
                         
                         (Valid
                          
                          (FStar.UInt.size (BoxInt 1) (BoxInt 32))))
                        
                        (forall ((@x7 Term))
                         (! (implies
                           (and
                            (HasType @x7 Prims.int)
                            
                            (= (BoxInt 1) @x7))
                           
                           (forall ((@x8 Term))
                            (! (implies
                              (and
                               (HasType @x8 (FStar.UInt32.t Dummy_value))
                               
                               (= (FStar.UInt32.v @x8) (BoxInt 1))
                               
                               (= (FStar.UInt32.uint_to_t (BoxInt 1)) @x8))
                              
                              (forall ((@x9 Term))
                               (! (implies
                                 (and
                                  (HasType @x9 (FStar.UInt32.t Dummy_value))
                                  
                                  (=
                                   (FStar.UInt.sub_mod (BoxInt 32) (FStar.UInt32.v @x6) (BoxInt 1))
                                   (FStar.UInt32.v @x9))
                                  
                                  (=
                                   (FStar.UInt32.sub_mod @x6 (FStar.UInt32.uint_to_t (BoxInt 1)))
                                   @x9))
                                 
                                 (forall ((@x10 Term))
                                  (! (implies
                                    (and
                                     (HasType @x10 (Prims.pure_post U_zero Prims.unit))
                                     
                                     (forall ((@x11 Term))
                                      (! (implies
                                        
                                        (forall ((@x12 Term))
                                         (! (implies
                                           (and
                                            (HasType @x12 (FStar.UInt32.t Dummy_value))
                                            
                                            (=
                                             @x12
                                             (FStar.UInt32.sub_mod
                                              (FStar.UInt32.shift_right
                                               (FStar.UInt32.logor
                                                (FStar.UInt32.logxor @x0 @x1)
                                                (FStar.UInt32.minus (FStar.UInt32.logxor @x0 @x1)))
                                               (FStar.UInt32.n_minus_one Dummy_value))
                                              (FStar.UInt32.uint_to_t (BoxInt 1)))))
                                           
                                           (forall ((@x13 Term))
                                            (! (implies
                                              (and
                                               (HasType @x13 (FStar.UInt32.t Dummy_value))
                                               
                                               (= @x13 @x12))
                                              
                                              (Valid
                                               
                                               (ApplyTT @x2 @x13)))
                                             :qid @query.14)))
                                          :qid @query.13))
                                        
                                        (Valid
                                         
                                         (ApplyTT @x10 @x11)))
                                       :weight 0
                                       :pattern ((ApplyTT @x10 @x11))
                                       :qid @query.12)))
                                    
                                    (and
                                     (implies
                                      
                                      (=
                                       (Prims.op_Equality (FStar.UInt32.t Dummy_value) @x0 @x1)
                                       (BoxBool true))
                                      
                                      (forall ((@x11 Term))
                                       (! (implies
                                         (and
                                          (HasType @x11 Prims.unit)
                                          
                                          (=
                                           (FStar.UInt.logxor
                                            (BoxInt 32)
                                            (FStar.UInt32.v @x0)
                                            (FStar.UInt32.v @x0))
                                           (FStar.UInt.zero (BoxInt 32))))
                                         
                                         (forall ((@x12 Term))
                                          (! (implies
                                            (and
                                             (HasType @x12 Prims.unit)
                                             
                                             (=
                                              (FStar.UInt.lognot
                                               (BoxInt 32)
                                               (FStar.UInt.zero (BoxInt 32)))
                                              (FStar.UInt.ones (BoxInt 32))))
                                            
                                            (forall ((@x13 Term))
                                             (! (implies
                                               (and
                                                (HasType @x13 Prims.unit)
                                                
                                                (=
                                                 (FStar.UInt.logor
                                                  (BoxInt 32)
                                                  (FStar.UInt32.v @x3)
                                                  (FStar.UInt.zero (BoxInt 32)))
                                                 (FStar.UInt32.v @x3)))
                                               
                                               (and
                                                
                                                (or
                                                 label_8
                                                 
                                                 (= (FStar.UInt32.v @x3) (BoxInt 0)))
                                                
                                                (or
                                                 label_9
                                                 
                                                 (= (FStar.UInt32.v @x4) (BoxInt 0)))
                                                
                                                (or
                                                 label_10
                                                 
                                                 (= (FStar.UInt32.v @x5) (BoxInt 0)))
                                                
                                                (or
                                                 label_11
                                                 
                                                 (= (FStar.UInt32.v @x6) (BoxInt 0)))
                                                
                                                (forall ((@x14 Term))
                                                 (! (implies
                                                   (and
                                                    (HasType @x14 Prims.unit)
                                                    
                                                    (= (FStar.UInt32.v @x3) (BoxInt 0))
                                                    
                                                    (= (FStar.UInt32.v @x4) (BoxInt 0))
                                                    
                                                    (= (FStar.UInt32.v @x5) (BoxInt 0))
                                                    
                                                    (= (FStar.UInt32.v @x6) (BoxInt 0)))
                                                   
                                                   (and
                                                    
                                                    (or
                                                     label_12
                                                     
                                                     (Valid
                                                      
                                                      (Prims.hasEq
                                                       U_zero
                                                       (FStar.UInt.uint_t (BoxInt 32)))))
                                                    
                                                    (forall ((@x15 Term))
                                                     (! (implies
                                                       (and
                                                        (HasType @x15 Prims.eqtype)
                                                        
                                                        (= @x15 (FStar.UInt.uint_t (BoxInt 32))))
                                                       
                                                       (forall ((@x16 Term))
                                                        (! (implies
                                                          (and
                                                           (HasType @x16 Prims.bool)
                                                           
                                                           (=
                                                            (Prims.op_Equality
                                                             (FStar.UInt.uint_t (BoxInt 32))
                                                             (FStar.UInt32.v @x9)
                                                             (FStar.UInt.ones (BoxInt 32)))
                                                            @x16))
                                                          
                                                          (forall ((@x17 Term))
                                                           (! (implies
                                                             (and
                                                              (HasType @x17 Prims.prop)
                                                              
                                                              (=
                                                               (Prims.b2t
                                                                (Prims.op_Equality
                                                                 (FStar.UInt.uint_t (BoxInt 32))
                                                                 (FStar.UInt32.v @x9)
                                                                 (FStar.UInt.ones (BoxInt 32))))
                                                               @x17))
                                                             
                                                             (and
                                                              
                                                              (or
                                                               label_13
                                                               
                                                               (=
                                                                (FStar.UInt32.v @x9)
                                                                (FStar.UInt.ones (BoxInt 32))))
                                                              
                                                              (forall ((@x18 Term))
                                                               (! (implies
                                                                 (and
                                                                  (HasType @x18 Prims.unit)
                                                                  
                                                                  (=
                                                                   (FStar.UInt32.v @x9)
                                                                   (FStar.UInt.ones (BoxInt 32))))
                                                                 
                                                                 (Valid
                                                                  
                                                                  (ApplyTT @x10 @x18)))
                                                                :qid @query.22))))
                                                            :qid @query.21)))
                                                         :qid @query.20)))
                                                      :qid @query.19))))
                                                  :qid @query.18))))
                                              :qid @query.17)))
                                           :qid @query.16)))
                                        :qid @query.15)))
                                     (implies
                                      
                                      (not
                                       
                                       (=
                                        (Prims.op_Equality (FStar.UInt32.t Dummy_value) @x0 @x1)
                                        (BoxBool true)))
                                      
                                      (forall ((@x11 Term))
                                       (! (implies
                                         (and
                                          (HasType @x11 Prims.bool)
                                          
                                          (=
                                           (Prims.op_Equality (FStar.UInt32.t Dummy_value) @x0 @x1)
                                           @x11))
                                         
                                         (forall ((@x12 Term))
                                          (! (implies
                                            (and
                                             (HasType @x12 Prims.unit)
                                             
                                             (implies
                                              
                                              (not (= (FStar.UInt32.v @x0) (FStar.UInt32.v @x1)))
                                              
                                              (not
                                               (=
                                                (FStar.UInt.logxor
                                                 (BoxInt 32)
                                                 (FStar.UInt32.v @x0)
                                                 (FStar.UInt32.v @x1))
                                                (BoxInt 0)))))
                                            
                                            (forall ((@x13 Term))
                                             (! (implies
                                               (and
                                                (HasType @x13 (FStar.UInt32.t Dummy_value))
                                                
                                                (=
                                                 (FStar.UInt.lognot (BoxInt 32) (FStar.UInt32.v @x3))
                                                 (FStar.UInt32.v @x13))
                                                
                                                (= (FStar.UInt32.lognot @x3) @x13))
                                               
                                               (forall ((@x14 Term))
                                                (! (implies
                                                  (and
                                                   (HasType @x14 (FStar.UInt.uint_t (BoxInt 32)))
                                                   
                                                   (=
                                                    (FStar.UInt32.v (FStar.UInt32.lognot @x3))
                                                    @x14))
                                                  
                                                  (forall ((@x15 Term))
                                                   (! (implies
                                                     (and
                                                      (HasType @x15 Prims.unit)
                                                      
                                                      (iff
                                                       
                                                       (BoxBool_proj_0
                                                        (FStar.UInt.msb
                                                         (BoxInt 32)
                                                         (FStar.UInt32.v (FStar.UInt32.lognot @x3))))
                                                       
                                                       (>=
                                                        (BoxInt_proj_0
                                                         (FStar.UInt32.v (FStar.UInt32.lognot @x3)))
                                                        (BoxInt_proj_0 (Prims.pow2 (BoxInt 31))))))
                                                     
                                                     (forall ((@x16 Term))
                                                      (! (implies
                                                        (and
                                                         (HasType @x16 Prims.unit)
                                                         
                                                         (iff
                                                          
                                                          (BoxBool_proj_0
                                                           (FStar.UInt.msb
                                                            (BoxInt 32)
                                                            (FStar.UInt32.v @x4)))
                                                          
                                                          (>=
                                                           (BoxInt_proj_0 (FStar.UInt32.v @x4))
                                                           (BoxInt_proj_0 (Prims.pow2 (BoxInt 31))))))
                                                        
                                                        (forall ((@x17 Term))
                                                         (! (implies
                                                           (and
                                                            (HasType @x17 Prims.unit)
                                                            
                                                            (implies
                                                             
                                                             (=
                                                              (FStar.UInt.minus
                                                               (BoxInt 32)
                                                               (FStar.UInt32.v @x3))
                                                              (BoxInt 0))
                                                             
                                                             (= (FStar.UInt32.v @x3) (BoxInt 0))))
                                                           
                                                           (and
                                                            
                                                            (or
                                                             label_14
                                                             
                                                             (Valid
                                                              
                                                              (Prims.hasEq
                                                               U_zero
                                                               (FStar.UInt.uint_t (BoxInt 32)))))
                                                            
                                                            (forall ((@x18 Term))
                                                             (! (implies
                                                               (and
                                                                (HasType @x18 Prims.eqtype)
                                                                
                                                                (=
                                                                 @x18
                                                                 (FStar.UInt.uint_t (BoxInt 32))))
                                                               
                                                               (forall ((@x19 Term))
                                                                (! (implies
                                                                  (and
                                                                   (HasType @x19 Prims.bool)
                                                                   
                                                                   (=
                                                                    (Prims.op_Equality
                                                                     (FStar.UInt.uint_t (BoxInt 32))
                                                                     (FStar.UInt32.v @x9)
                                                                     (FStar.UInt.zero (BoxInt 32)))
                                                                    @x19))
                                                                  
                                                                  (forall ((@x20 Term))
                                                                   (! (implies
                                                                     (and
                                                                      (HasType @x20 Prims.prop)
                                                                      
                                                                      (=
                                                                       (Prims.b2t
                                                                        (Prims.op_Equality
                                                                         (FStar.UInt.uint_t
                                                                          (BoxInt 32))
                                                                         (FStar.UInt32.v @x9)
                                                                         (FStar.UInt.zero
                                                                          (BoxInt 32))))
                                                                       @x20))
                                                                     
                                                                     (and
                                                                      
                                                                      (or
                                                                       label_15
                                                                       
                                                                       (=
                                                                        (FStar.UInt32.v @x9)
                                                                        (FStar.UInt.zero (BoxInt 32))))
                                                                      
                                                                      (forall ((@x21 Term))
                                                                       (! (implies
                                                                         (and
                                                                          (HasType @x21 Prims.unit)
                                                                          
                                                                          (=
                                                                           (FStar.UInt32.v @x9)
                                                                           (FStar.UInt.zero
                                                                            (BoxInt 32))))
                                                                         
                                                                         (Valid
                                                                          
                                                                          (ApplyTT @x10 @x21)))
                                                                        :qid @query.33))))
                                                                    :qid @query.32)))
                                                                 :qid @query.31)))
                                                              :qid @query.30))))
                                                          :qid @query.29)))
                                                       :qid @query.28)))
                                                    :qid @query.27)))
                                                 :qid @query.26)))
                                              :qid @query.25)))
                                           :qid @query.24)))
                                        :qid @query.23)))))
                                   :qid @query.11)))
                                :qid @query.10)))
                             :qid @query.9)))
                          :qid @query.8))))
                      :qid @query.7))))
                  :qid @query.6)))
               :qid @query.5)))
            :qid @query.4)))
         :qid @query.2))))
     :qid @query)))
  :named @query))
(set-option :rlimit 40000000)
(echo "<initial_stats>")
(echo "<statistics>") (get-info :all-statistics) (echo "</statistics>")
(echo "</initial_stats>")
(echo "<result>")
(check-sat)
(echo "</result>")
(set-option :rlimit 0)
(echo "<reason-unknown>") (get-info :reason-unknown) (echo "</reason-unknown>")
(echo "<labels>")
(echo "label_15")
(eval label_15)
(echo "label_14")
(eval label_14)
(echo "label_13")
(eval label_13)
(echo "label_12")
(eval label_12)
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
(pop) 


