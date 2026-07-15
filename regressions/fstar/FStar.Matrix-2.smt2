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
(declare-fun
 FStar.Algebra.CommMonoid.Equiv.CM
 (Universe Term Term Term Term Term Term Term Term)
 Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.CM_@0 (Term) Universe)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.CM_@a (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.CM_@associativity (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.CM_@commutativity (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.CM_@congruence (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.CM_@eq (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.CM_@identity (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.CM_@mult (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.CM_@unit (Term) Term)
; Constructor
(declare-fun FStar.Algebra.CommMonoid.Equiv.EQ (Universe Term Term Term Term Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.EQ_@0 (Term) Universe)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.EQ_@a (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.EQ_@eq (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.EQ_@reflexivity (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.EQ_@symmetry (Term) Term)
; Projector
(declare-fun FStar.Algebra.CommMonoid.Equiv.EQ_@transitivity (Term) Term)
(declare-fun FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit (Universe Term Term Term) Term)
(declare-fun FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq (Universe Term Term) Term)
(declare-fun FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok (Universe) Term)
; Constructor
(declare-fun FStar.Algebra.CommMonoid.Equiv.cm (Universe Term Term) Term)
; token
(declare-fun FStar.Algebra.CommMonoid.Equiv.cm@tok (Universe) Term)
; Constructor
(declare-fun FStar.Algebra.CommMonoid.Equiv.equiv (Universe Term) Term)
; token
(declare-fun FStar.Algebra.CommMonoid.Equiv.equiv@tok (Universe) Term)
(declare-fun FStar.IntegerIntervals.indices_seq (Term) Term)
(declare-fun FStar.IntegerIntervals.interval (Term Term) Term)
(declare-fun FStar.IntegerIntervals.interval_condition (Term Term Term) Term)
(declare-fun FStar.IntegerIntervals.interval_type (Term Term) Term)
(declare-fun FStar.IntegerIntervals.under (Term) Term)
(declare-fun FStar.Matrix.get_i (Term Term Term) Term)
(declare-fun FStar.Matrix.get_ij (Term Term Term Term) Term)
(declare-fun FStar.Matrix.get_j (Term Term Term) Term)
(declare-fun FStar.Matrix.ijth (Universe Term Term Term Term Term Term) Term)
(declare-fun FStar.Matrix.init (Universe Term Term Term Term) Term)
(declare-fun FStar.Matrix.matrix (Universe Term Term Term) Term)
(declare-fun FStar.Matrix.matrix_generator (Universe Term Term Term) Term)
(declare-fun FStar.Matrix.matrix_mul_unit (Universe Term Term Term Term Term) Term)
(declare-fun FStar.Matrix.matrix_of (Universe Term Term Term Term) Term)
(declare-fun FStar.Matrix.row (Universe Term Term Term Term Term) Term)
(declare-fun FStar.Matrix.seq_of_matrix (Universe Term Term Term Term) Term)
(declare-fun FStar.Seq.Base.append (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.create (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.equal (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.index (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.init (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.length (Universe Term Term) Term)
(declare-fun FStar.Seq.Base.seq (Universe Term) Term)
(declare-fun FStar.Seq.Properties.map_seq (Universe Universe Term Term Term Term) Term)
(declare-fun Prims.bool () Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.hasEq (Universe Term) Term)
(declare-fun Prims.int () Term)
(declare-fun Prims.l_True () Term)
(declare-fun Prims.nat () Term)
(declare-fun Prims.nonzero () Term)
(declare-fun Prims.op_Addition (Term Term) Term)
(declare-fun Prims.op_Addition@tok () Term)
(declare-fun Prims.op_AmpAmp (Term Term) Term)
(declare-fun Prims.op_Division (Term Term) Term)
(declare-fun Prims.op_Equality (Term Term Term) Term)
(declare-fun Prims.op_LessThan (Term Term) Term)
(declare-fun Prims.op_LessThanOrEqual (Term Term) Term)
(declare-fun Prims.op_Modulus (Term Term) Term)
(declare-fun Prims.op_Star (Term Term) Term)
(declare-fun Prims.op_Star@tok () Term)
(declare-fun Prims.op_Subtraction (Term Term) Term)
(declare-fun Prims.pos () Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_post (Universe Term) Term)
(declare-fun Prims.pure_post_ (Universe Term Term) Term)
(declare-fun Prims.unit () Term)
(declare-fun Tm_abs_07607a90cdec640007c6e8f2e5d63494 (Term) Term)
(declare-fun Tm_abs_7794e091436089522f6291c350690dfa (Term Term Universe Term Term Term) Term)
(declare-fun Tm_abs_938e0f44b4a93213a875f12294289ff4 (Term Term Universe Term Term Term) Term)
(declare-fun Tm_abs_c9ff1344e6045730d5ebd5616437488c (Term Term Term Universe Term) Term)
(declare-fun Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65 (Term Term Universe) Term)
(declare-fun Tm_arrow_257a53890f49995b0f689694ec797771 (Term) Term)
(declare-fun Tm_arrow_40916f69cbb43d885c4b9d96f6954d12 (Term Term Term Universe) Term)
(declare-fun Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623 () Term)
(declare-fun Tm_arrow_57cf062ad88ff86192177a2ff1a1d94c (Term Term Universe Universe) Term)
(declare-fun Tm_arrow_6c5500042885b9cc1eced46408a1056f (Term Universe Term Term Term) Term)
(declare-fun Tm_arrow_6d1d34f39847bb08991d0c820d8b4257 (Term Term Universe) Term)
(declare-fun Tm_arrow_6d76c8e4fc59503348e55fc915188ea1 (Term Term Universe) Term)
(declare-fun Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c (Term Term Universe) Term)
(declare-fun Tm_arrow_8979d1416f9c75020b0a5911a0a455c2 (Universe Term Term Term) Term)
(declare-fun Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59 (Term Universe Term Term) Term)
(declare-fun Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd (Term Term Universe) Term)
(declare-fun Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d (Term Term Term Universe) Term)
(declare-fun Tm_arrow_c50dacffbddc8b7e8983e24975dde472 (Term Term Universe) Term)
(declare-fun Tm_arrow_d64d4275ed8e577d65d5c1671754751b (Term Universe) Term)
(declare-fun Tm_arrow_e45db00acd4175c5113071bde065fbe3 (Term Universe) Term)
(declare-fun Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf (Term Universe Term Term) Term)
(declare-fun Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 (Universe Term Term) Term)
(declare-fun Tm_arrow_fab84e6afc892ca93c78ca3949230b64 (Universe) Term)
(declare-fun Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f () Term)
(declare-fun Tm_refine_079809d6a4568acb4adbe11585a669ef (Universe Term Term Term Term Term) Term)
(declare-fun Tm_refine_08c147be678c982b4c352f75d8eec630 (Term Term Term Term) Term)
(declare-fun Tm_refine_160fe7faad9a466b3cae8455bac5be60 (Universe Term Term) Term)
(declare-fun Tm_refine_17d6a0887ae9558c86dba7da9cd58343 (Term) Term)
(declare-fun Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a (Term Term) Term)
(declare-fun Tm_refine_444061fd0bd0053c4f27fa233082c9ca (Universe Term Term Term) Term)
(declare-fun Tm_refine_542f9d4f129664613f2483a6c88bc7c2 () Term)
(declare-fun Tm_refine_54dbd50028a232789dd68ce8ea833f14 (Universe Term Term Term Term) Term)
(declare-fun Tm_refine_774ba3f728d91ead8ef40be66c9802e5 () Term)
(declare-fun
 Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db
 (Universe Term Term Term Term Term Term)
 Term)
(declare-fun Tm_refine_97ae7a69cd5f02d44d6644f169486ebb (Term Term) Term)
(declare-fun Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df (Universe Term Term Term Term Term) Term)
(declare-fun Tm_refine_9d6af3f3535473623f7aec2f0501897f () Term)
(declare-fun Tm_refine_b85d2a162d78f833de0a4223b666960d (Term Term Term) Term)
(declare-fun Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0 (Universe Term Term Term) Term)
(declare-fun Tm_refine_c1424615841f28cac7fc34e92b7ff33c (Term) Term)
(declare-fun Tm_refine_c5494133ebeeaeb6939645c40bf85e62 (Universe Term Term Term) Term)
(declare-fun
 Tm_refine_d70b7477cee9e214d3da094d85921d96
 (Universe Term Term Term Term Term Term)
 Term)
(declare-fun Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 (Universe Term Term) Term)
(declare-fun
 Tm_refine_ed6514ea2e57229a44a63744c80130cd
 (Universe Term Term Term Term Term Term Term)
 Term)
(declare-fun Tm_refine_fcf1a3596fffd49dd2e91f2678358f19 (Term Term) Term)
; Discriminator definition
(define-fun is-FStar.Algebra.CommMonoid.Equiv.CM ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 189)
  (=
   __@x0
   (FStar.Algebra.CommMonoid.Equiv.CM
    (FStar.Algebra.CommMonoid.Equiv.CM_@0 __@x0)
    (FStar.Algebra.CommMonoid.Equiv.CM_@a __@x0)
    (FStar.Algebra.CommMonoid.Equiv.CM_@eq __@x0)
    (FStar.Algebra.CommMonoid.Equiv.CM_@unit __@x0)
    (FStar.Algebra.CommMonoid.Equiv.CM_@mult __@x0)
    (FStar.Algebra.CommMonoid.Equiv.CM_@identity __@x0)
    (FStar.Algebra.CommMonoid.Equiv.CM_@associativity __@x0)
    (FStar.Algebra.CommMonoid.Equiv.CM_@commutativity __@x0)
    (FStar.Algebra.CommMonoid.Equiv.CM_@congruence __@x0)))))
; Discriminator definition
(define-fun is-FStar.Algebra.CommMonoid.Equiv.EQ ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 119)
  (=
   __@x0
   (FStar.Algebra.CommMonoid.Equiv.EQ
    (FStar.Algebra.CommMonoid.Equiv.EQ_@0 __@x0)
    (FStar.Algebra.CommMonoid.Equiv.EQ_@a __@x0)
    (FStar.Algebra.CommMonoid.Equiv.EQ_@eq __@x0)
    (FStar.Algebra.CommMonoid.Equiv.EQ_@reflexivity __@x0)
    (FStar.Algebra.CommMonoid.Equiv.EQ_@symmetry __@x0)
    (FStar.Algebra.CommMonoid.Equiv.EQ_@transitivity __@x0)))))
; kick_partial_app
;;; Fact-ids: Name FStar.Matrix.is_absorber; Namespace FStar.Matrix
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u0) @x1) @x2))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2))
    :qid @kick_partial_app_00403b38c9f2b32b07373bfcae23e011))
  :named @kick_partial_app_00403b38c9f2b32b07373bfcae23e011))
; kick_partial_app
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u0) @x1) @x2))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2))
    :qid @kick_partial_app_0d8512a590581c5b0293a93bac1f5357))
  :named @kick_partial_app_0d8512a590581c5b0293a93bac1f5357))
; kick_partial_app
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.int_multiply_cm; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! (Valid (ApplyTT __uu__PartialApp Prims.op_Star@tok))
  :named @kick_partial_app_1dfe2940aab437e3a51b0ac4a69b8081))
; kick_partial_app
;;; Fact-ids: Name FStar.Matrix.matrix_fold_equals_fold_of_seq; Namespace FStar.Matrix
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u0) @x1) @x2))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2))
    :qid @kick_partial_app_8e35ce0efd35a16db1cbb5fa4dec9031))
  :named @kick_partial_app_8e35ce0efd35a16db1cbb5fa4dec9031))
; kick_partial_app
;;; Fact-ids: Name FStar.Matrix.is_left_distributive; Namespace FStar.Matrix
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u0) @x1) @x2))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2))
    :qid @kick_partial_app_9845dfdb8ff40703e04edeb4fe6e814b))
  :named @kick_partial_app_9845dfdb8ff40703e04edeb4fe6e814b))
; kick_partial_app
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.int_plus_cm; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! (Valid (ApplyTT __uu__PartialApp Prims.op_Addition@tok))
  :named @kick_partial_app_e6040789326ec4b020bc6baa631c67f4))
; interpretation_Tm_arrow_6c5500042885b9cc1eced46408a1056f
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-53,60); use=FStar.Algebra.CommMonoid.Equiv.fst(53,18-53,60)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_6c5500042885b9cc1eced46408a1056f @x1 @u2 @x3 @x4 @x5))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-53,60); use=FStar.Algebra.CommMonoid.Equiv.fst(53,18-53,60)
      (forall ((@x6 Term))
       (! (implies
         (HasType @x6 @x1)
         (HasType
          (ApplyTT @x0 @x6)
          (Tm_refine_079809d6a4568acb4adbe11585a669ef @u2 @x1 @x3 @x4 @x5 @x6)))
        :pattern ((ApplyTT @x0 @x6))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_6c5500042885b9cc1eced46408a1056f.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_6c5500042885b9cc1eced46408a1056f @x1 @u2 @x3 @x4 @x5)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_6c5500042885b9cc1eced46408a1056f))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_6c5500042885b9cc1eced46408a1056f))
; interpretation_Tm_arrow_6d1d34f39847bb08991d0c820d8b4257
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-23,40); use=FStar.Algebra.CommMonoid.Equiv.fst(23,19-23,40)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_6d1d34f39847bb08991d0c820d8b4257 @x1 @x2 @u3))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-23,40); use=FStar.Algebra.CommMonoid.Equiv.fst(23,19-23,40)
      (forall ((@x4 Term))
       (! (implies
         (HasType @x4 @x1)
         (HasType (ApplyTT @x0 @x4) (Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a @x2 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_6d1d34f39847bb08991d0c820d8b4257.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_6d1d34f39847bb08991d0c820d8b4257 @x1 @x2 @u3)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_6d1d34f39847bb08991d0c820d8b4257))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_6d1d34f39847bb08991d0c820d8b4257))
; interpretation_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-57,143); use=FStar.Algebra.CommMonoid.Equiv.fst(57,18-57,143)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_8979d1416f9c75020b0a5911a0a455c2 @u1 @x2 @x3 @x4))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-57,143); use=FStar.Algebra.CommMonoid.Equiv.fst(57,18-57,143)
      (forall ((@x5 Term) (@x6 Term) (@x7 Term) (@x8 Term))
       (! (implies
         (and
          ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,61-57,76); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
          (Valid
           ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,61-57,76); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
           (ApplyTT
            (ApplyTT
             (ApplyTT
              (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u1) @x2)
              @x3)
             @x5)
            @x7))
          ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,80-57,95); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
          (Valid
           ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,80-57,95); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
           (ApplyTT
            (ApplyTT
             (ApplyTT
              (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u1) @x2)
              @x3)
             @x6)
            @x8))
          (HasType @x5 @x2)
          (HasType @x6 @x2)
          (HasType @x7 @x2)
          (HasType @x8 @x2))
         (HasType
          (ApplyTT (ApplyTT (ApplyTT (ApplyTT @x0 @x5) @x6) @x7) @x8)
          (Tm_refine_ed6514ea2e57229a44a63744c80130cd @u1 @x2 @x3 @x5 @x7 @x6 @x8 @x4)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT (ApplyTT @x0 @x5) @x6) @x7) @x8))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-57,143); use=FStar.Algebra.CommMonoid.Equiv.fst(57,18-57,143)
      (forall ((@x5 Term))
       (! (implies (HasType @x5 @x2) (IsTotFun (ApplyTT @x0 @x5)))
        :pattern ((ApplyTT @x0 @x5))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2.2))
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-57,143); use=FStar.Algebra.CommMonoid.Equiv.fst(57,18-57,143)
      (forall ((@x5 Term) (@x6 Term))
       (! (implies
         (and (HasType @x5 @x2) (HasType @x6 @x2))
         (IsTotFun (ApplyTT (ApplyTT @x0 @x5) @x6)))
        :pattern ((ApplyTT (ApplyTT @x0 @x5) @x6))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2.3))
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-57,143); use=FStar.Algebra.CommMonoid.Equiv.fst(57,18-57,143)
      (forall ((@x5 Term) (@x6 Term) (@x7 Term))
       (! (implies
         (and (HasType @x5 @x2) (HasType @x6 @x2) (HasType @x7 @x2))
         (IsTotFun (ApplyTT (ApplyTT (ApplyTT @x0 @x5) @x6) @x7)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT @x0 @x5) @x6) @x7))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2.4))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_8979d1416f9c75020b0a5911a0a455c2 @u1 @x2 @x3 @x4)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2))
; interpretation_Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(54,23-55,87)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59 @x1 @u2 @x3 @x4))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(54,23-55,87)
      (forall ((@x5 Term) (@x6 Term) (@x7 Term))
       (! (implies
         (and (HasType @x5 @x1) (HasType @x6 @x1) (HasType @x7 @x1))
         (HasType
          (ApplyTT (ApplyTT (ApplyTT @x0 @x5) @x6) @x7)
          (Tm_refine_d70b7477cee9e214d3da094d85921d96 @u2 @x1 @x3 @x4 @x5 @x6 @x7)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT @x0 @x5) @x6) @x7))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(54,23-55,87)
      (forall ((@x5 Term))
       (! (implies (HasType @x5 @x1) (IsTotFun (ApplyTT @x0 @x5)))
        :pattern ((ApplyTT @x0 @x5))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59.2))
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(54,23-55,87)
      (forall ((@x5 Term) (@x6 Term))
       (! (implies
         (and (HasType @x5 @x1) (HasType @x6 @x1))
         (IsTotFun (ApplyTT (ApplyTT @x0 @x5) @x6)))
        :pattern ((ApplyTT (ApplyTT @x0 @x5) @x6))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59.3))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59 @x1 @u2 @x3 @x4)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59))
; interpretation_Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-24,76); use=FStar.Algebra.CommMonoid.Equiv.fst(24,16-24,76)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd @x1 @x2 @u3))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-24,76); use=FStar.Algebra.CommMonoid.Equiv.fst(24,16-24,76)
      (forall ((@x4 Term) (@x5 Term))
       (! (implies
         (and
          ;; def=Prims.fst(409,29-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,33)
          (Valid
           ;; def=FStar.Algebra.CommMonoid.Equiv.fst(24,44-24,54); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,33)
           (ApplyTT (ApplyTT @x1 @x4) @x5))
          (HasType @x4 @x2)
          (HasType @x5 @x2))
         (HasType
          (ApplyTT (ApplyTT @x0 @x4) @x5)
          (Tm_refine_b85d2a162d78f833de0a4223b666960d @x1 @x4 @x5)))
        :pattern ((ApplyTT (ApplyTT @x0 @x4) @x5))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-24,76); use=FStar.Algebra.CommMonoid.Equiv.fst(24,16-24,76)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 @x2) (IsTotFun (ApplyTT @x0 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd @x1 @x2 @u3)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd))
; interpretation_Tm_arrow_c50dacffbddc8b7e8983e24975dde472
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-25,99); use=FStar.Algebra.CommMonoid.Equiv.fst(25,20-25,99)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_c50dacffbddc8b7e8983e24975dde472 @x1 @x2 @u3))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-25,99); use=FStar.Algebra.CommMonoid.Equiv.fst(25,20-25,99)
      (forall ((@x4 Term) (@x5 Term) (@x6 Term))
       (! (implies
         (and
          ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,56-25,64); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
          (Valid
           ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,56-25,64); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
           (ApplyTT (ApplyTT @x1 @x4) @x5))
          ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,68-25,76); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
          (Valid
           ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,68-25,76); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
           (ApplyTT (ApplyTT @x1 @x5) @x6))
          (HasType @x4 @x2)
          (HasType @x5 @x2)
          (HasType @x6 @x2))
         (HasType
          (ApplyTT (ApplyTT (ApplyTT @x0 @x4) @x5) @x6)
          (Tm_refine_08c147be678c982b4c352f75d8eec630 @x1 @x4 @x5 @x6)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT @x0 @x4) @x5) @x6))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_c50dacffbddc8b7e8983e24975dde472.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-25,99); use=FStar.Algebra.CommMonoid.Equiv.fst(25,20-25,99)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 @x2) (IsTotFun (ApplyTT @x0 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_c50dacffbddc8b7e8983e24975dde472.2))
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-25,99); use=FStar.Algebra.CommMonoid.Equiv.fst(25,20-25,99)
      (forall ((@x4 Term) (@x5 Term))
       (! (implies
         (and (HasType @x4 @x2) (HasType @x5 @x2))
         (IsTotFun (ApplyTT (ApplyTT @x0 @x4) @x5)))
        :pattern ((ApplyTT (ApplyTT @x0 @x4) @x5))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_c50dacffbddc8b7e8983e24975dde472.3))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_c50dacffbddc8b7e8983e24975dde472 @x1 @x2 @u3)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_c50dacffbddc8b7e8983e24975dde472))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_c50dacffbddc8b7e8983e24975dde472))
; interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-49,10); use=FStar.Algebra.CommMonoid.Equiv.fst(52,10-52,21)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u2))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-49,10); use=FStar.Algebra.CommMonoid.Equiv.fst(52,10-52,21)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and (HasType @x3 @x1) (HasType @x4 @x1))
         (HasType (ApplyTT (ApplyTT @x0 @x3) @x4) @x1))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-49,10); use=FStar.Algebra.CommMonoid.Equiv.fst(52,10-52,21)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 @x1) (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u2)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
; interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22); use=FStar.Algebra.CommMonoid.Equiv.fst(22,8-22,22)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x1 @u2))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22); use=FStar.Algebra.CommMonoid.Equiv.fst(22,8-22,22)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and (HasType @x3 @x1) (HasType @x4 @x1))
         (HasType (ApplyTT (ApplyTT @x0 @x3) @x4) Prims.prop))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22); use=FStar.Algebra.CommMonoid.Equiv.fst(22,8-22,22)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 @x1) (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x1 @u2)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3))
; interpretation_Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-56,78); use=FStar.Algebra.CommMonoid.Equiv.fst(56,21-56,78)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf @x1 @u2 @x3 @x4))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-56,78); use=FStar.Algebra.CommMonoid.Equiv.fst(56,21-56,78)
      (forall ((@x5 Term) (@x6 Term))
       (! (implies
         (and (HasType @x5 @x1) (HasType @x6 @x1))
         (HasType
          (ApplyTT (ApplyTT @x0 @x5) @x6)
          (Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df @u2 @x1 @x3 @x4 @x5 @x6)))
        :pattern ((ApplyTT (ApplyTT @x0 @x5) @x6))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-56,78); use=FStar.Algebra.CommMonoid.Equiv.fst(56,21-56,78)
      (forall ((@x5 Term))
       (! (implies (HasType @x5 @x1) (IsTotFun (ApplyTT @x0 @x5)))
        :pattern ((ApplyTT @x0 @x5))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf @x1 @u2 @x3 @x4)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf))
; interpretation_Tm_arrow_fab84e6afc892ca93c78ca3949230b64
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22); use=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22)
  (forall ((@x0 Term) (@u1 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_fab84e6afc892ca93c78ca3949230b64 @u1))
     (and
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22); use=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22)
      (forall ((@x2 Term) (@x3 Term))
       (! (implies
         (and
          (HasType @x2 (Tm_type @u1))
          (HasType @x3 (FStar.Algebra.CommMonoid.Equiv.equiv @u1 @x2)))
         (HasType
          (ApplyTT (ApplyTT @x0 @x2) @x3)
          (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x2 @u1)))
        :pattern ((ApplyTT (ApplyTT @x0 @x2) @x3))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_fab84e6afc892ca93c78ca3949230b64.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22); use=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22)
      (forall ((@x2 Term))
       (! (implies (HasType @x2 (Tm_type @u1)) (IsTotFun (ApplyTT @x0 @x2)))
        :pattern ((ApplyTT @x0 @x2))
        :qid
         FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_fab84e6afc892ca93c78ca3949230b64.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_fab84e6afc892ca93c78ca3949230b64 @u1)))
    :qid FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_fab84e6afc892ca93c78ca3949230b64))
  :named FStar.Algebra.CommMonoid.Equiv_interpretation_Tm_arrow_fab84e6afc892ca93c78ca3949230b64))
; interpretation_Tm_arrow_257a53890f49995b0f689694ec797771
;;; Fact-ids: Name FStar.IntegerIntervals.indices_seq; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(84,34-84,41); use=FStar.IntegerIntervals.fst(84,19-84,41)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_257a53890f49995b0f689694ec797771 @x1))
     (and
      ;; def=FStar.IntegerIntervals.fst(84,34-84,41); use=FStar.IntegerIntervals.fst(84,19-84,41)
      (forall ((@x2 Term))
       (! (implies
         (HasType @x2 (FStar.IntegerIntervals.under @x1))
         (HasType (ApplyTT @x0 @x2) (FStar.IntegerIntervals.under @x1)))
        :pattern ((ApplyTT @x0 @x2))
        :qid FStar.IntegerIntervals_interpretation_Tm_arrow_257a53890f49995b0f689694ec797771.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_257a53890f49995b0f689694ec797771 @x1)))
    :qid FStar.IntegerIntervals_interpretation_Tm_arrow_257a53890f49995b0f689694ec797771))
  :named FStar.IntegerIntervals_interpretation_Tm_arrow_257a53890f49995b0f689694ec797771))
; interpretation_Tm_arrow_57cf062ad88ff86192177a2ff1a1d94c
;;; Fact-ids: Name FStar.List.Tot.Base.map; Namespace FStar.List.Tot.Base
(assert
 (! ;; def=FStar.List.Tot.Base.fst(151,12-151,13); use=FStar.List.Tot.Base.fst(151,12-151,13)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe) (@u4 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_57cf062ad88ff86192177a2ff1a1d94c @x1 @x2 @u3 @u4))
     (and
      ;; def=FStar.List.Tot.Base.fst(151,12-151,13); use=FStar.List.Tot.Base.fst(151,12-151,13)
      (forall ((@x5 Term))
       (! (implies (HasType @x5 @x1) (HasType (ApplyTT @x0 @x5) @x2))
        :pattern ((ApplyTT @x0 @x5))
        :qid FStar.List.Tot.Base_interpretation_Tm_arrow_57cf062ad88ff86192177a2ff1a1d94c.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_57cf062ad88ff86192177a2ff1a1d94c @x1 @x2 @u3 @u4)))
    :qid FStar.List.Tot.Base_interpretation_Tm_arrow_57cf062ad88ff86192177a2ff1a1d94c))
  :named FStar.List.Tot.Base_interpretation_Tm_arrow_57cf062ad88ff86192177a2ff1a1d94c))
; interpretation_Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65
;;; Fact-ids: Name FStar.Matrix.matrix_mul_unit; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(37,37-325,22); use=FStar.Matrix.fsti(37,37-325,44)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65 @x1 @x2 @u3))
     (and
      ;; def=FStar.Matrix.fsti(37,37-325,22); use=FStar.Matrix.fsti(37,37-325,44)
      (forall ((@x4 Term) (@x5 Term))
       (! (implies
         (and
          (HasType @x4 (FStar.IntegerIntervals.under @x1))
          (HasType @x5 (FStar.IntegerIntervals.under @x1)))
         (HasType (ApplyTT (ApplyTT @x0 @x4) @x5) @x2))
        :pattern ((ApplyTT (ApplyTT @x0 @x4) @x5))
        :qid FStar.Matrix_interpretation_Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65.1))
      (IsTotFun @x0)
      ;; def=FStar.Matrix.fsti(37,37-325,22); use=FStar.Matrix.fsti(37,37-325,44)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 (FStar.IntegerIntervals.under @x1)) (IsTotFun (ApplyTT @x0 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid FStar.Matrix_interpretation_Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65 @x1 @x2 @u3)))
    :qid FStar.Matrix_interpretation_Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65))
  :named FStar.Matrix_interpretation_Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65))
; interpretation_Tm_arrow_40916f69cbb43d885c4b9d96f6954d12
;;; Fact-ids: Name FStar.Matrix.matrix_generator; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(37,22-37,55); use=FStar.Matrix.fsti(37,37-37,60)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@u4 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_40916f69cbb43d885c4b9d96f6954d12 @x1 @x2 @x3 @u4))
     (and
      ;; def=FStar.Matrix.fsti(37,22-37,55); use=FStar.Matrix.fsti(37,37-37,60)
      (forall ((@x5 Term) (@x6 Term))
       (! (implies
         (and
          (HasType @x5 (FStar.IntegerIntervals.under @x1))
          (HasType @x6 (FStar.IntegerIntervals.under @x2)))
         (HasType (ApplyTT (ApplyTT @x0 @x5) @x6) @x3))
        :pattern ((ApplyTT (ApplyTT @x0 @x5) @x6))
        :qid FStar.Matrix_interpretation_Tm_arrow_40916f69cbb43d885c4b9d96f6954d12.1))
      (IsTotFun @x0)
      ;; def=FStar.Matrix.fsti(37,22-37,55); use=FStar.Matrix.fsti(37,37-37,60)
      (forall ((@x5 Term))
       (! (implies (HasType @x5 (FStar.IntegerIntervals.under @x1)) (IsTotFun (ApplyTT @x0 @x5)))
        :pattern ((ApplyTT @x0 @x5))
        :qid FStar.Matrix_interpretation_Tm_arrow_40916f69cbb43d885c4b9d96f6954d12.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_40916f69cbb43d885c4b9d96f6954d12 @x1 @x2 @x3 @u4)))
    :qid FStar.Matrix_interpretation_Tm_arrow_40916f69cbb43d885c4b9d96f6954d12))
  :named FStar.Matrix_interpretation_Tm_arrow_40916f69cbb43d885c4b9d96f6954d12))
; interpretation_Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c
;;; Fact-ids: Name FStar.Matrix.col; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(223,9-223,77); use=FStar.Matrix.fsti(223,29-223,77)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c @x1 @x2 @u3))
     (and
      ;; def=FStar.Matrix.fsti(223,9-223,77); use=FStar.Matrix.fsti(223,29-223,77)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 (FStar.IntegerIntervals.under @x1)) (HasType (ApplyTT @x0 @x4) @x2))
        :pattern ((ApplyTT @x0 @x4))
        :qid FStar.Matrix_interpretation_Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c @x1 @x2 @u3)))
    :qid FStar.Matrix_interpretation_Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c))
  :named FStar.Matrix_interpretation_Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c))
; interpretation_Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d
;;; Fact-ids: Name FStar.Matrix.init; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(54,26-54,37); use=FStar.Matrix.fst(73,54-76,40)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@u4 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d @x1 @x2 @x3 @u4))
     (and
      ;; def=FStar.Matrix.fsti(54,26-54,37); use=FStar.Matrix.fst(73,54-76,40)
      (forall ((@x5 Term))
       (! (implies
         (HasType @x5 (FStar.IntegerIntervals.under (Prims.op_Star @x1 @x2)))
         (HasType (ApplyTT @x0 @x5) @x3))
        :pattern ((ApplyTT @x0 @x5))
        :qid FStar.Matrix_interpretation_Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d @x1 @x2 @x3 @u4)))
    :qid FStar.Matrix_interpretation_Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d))
  :named FStar.Matrix_interpretation_Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d))
; interpretation_Tm_arrow_6d76c8e4fc59503348e55fc915188ea1
;;; Fact-ids: Name FStar.Seq.Base.init_aux; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(36,23-36,86); use=FStar.Seq.Base.fsti(36,69-36,95)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_6d76c8e4fc59503348e55fc915188ea1 @x1 @x2 @u3))
     (and
      ;; def=FStar.Seq.Base.fsti(36,23-36,86); use=FStar.Seq.Base.fsti(36,69-36,95)
      (forall ((@x4 Term))
       (! (implies
         (HasType @x4 (Tm_refine_c1424615841f28cac7fc34e92b7ff33c @x1))
         (HasType (ApplyTT @x0 @x4) @x2))
        :pattern ((ApplyTT @x0 @x4))
        :qid FStar.Seq.Base_interpretation_Tm_arrow_6d76c8e4fc59503348e55fc915188ea1.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_6d76c8e4fc59503348e55fc915188ea1 @x1 @x2 @u3)))
    :qid FStar.Seq.Base_interpretation_Tm_arrow_6d76c8e4fc59503348e55fc915188ea1))
  :named FStar.Seq.Base_interpretation_Tm_arrow_6d76c8e4fc59503348e55fc915188ea1))
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
; Assumption: FStar.Algebra.CommMonoid.Equiv.cm__uu___haseq
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm__uu___haseq; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! (forall ((@u0 Universe))
   (! (forall ((@x1 Term) (@x2 Term))
     (! (implies
       (and
        (HasType @x1 (Tm_type @u0))
        (HasType @x2 (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1))
        (forall ((@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term) (@x8 Term))
         (! (implies
           (and
            (HasType @x3 @x1)
            (HasType @x4 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0))
            (HasType @x5 (Tm_arrow_6c5500042885b9cc1eced46408a1056f @x1 @u0 @x2 @x4 @x3))
            (HasType @x6 (Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59 @x1 @u0 @x2 @x4))
            (HasType @x7 (Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf @x1 @u0 @x2 @x4))
            (HasType @x8 (Tm_arrow_8979d1416f9c75020b0a5911a0a455c2 @u0 @x1 @x2 @x4)))
           (and
            (Valid (Prims.hasEq @u0 @x1))
            (Valid (Prims.hasEq @u0 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
            (Valid (Prims.hasEq @u0 (Tm_arrow_6c5500042885b9cc1eced46408a1056f @x1 @u0 @x2 @x4 @x3)))
            (Valid (Prims.hasEq @u0 (Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59 @x1 @u0 @x2 @x4)))
            (Valid (Prims.hasEq @u0 (Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf @x1 @u0 @x2 @x4)))
            (Valid (Prims.hasEq @u0 (Tm_arrow_8979d1416f9c75020b0a5911a0a455c2 @u0 @x1 @x2 @x4)))))
          :qid assumption_FStar.Algebra.CommMonoid.Equiv.cm__uu___haseq.2)))
       (Valid (Prims.hasEq @u0 (FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2))))
      :pattern ((Prims.hasEq @u0 (FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2)))
      :qid assumption_FStar.Algebra.CommMonoid.Equiv.cm__uu___haseq.1))
    :qid assumption_FStar.Algebra.CommMonoid.Equiv.cm__uu___haseq))
  :named assumption_FStar.Algebra.CommMonoid.Equiv.cm__uu___haseq))
; Assumption: FStar.Algebra.CommMonoid.Equiv.equiv__uu___haseq
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv__uu___haseq; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! (forall ((@u0 Universe))
   (! (forall ((@x1 Term))
     (! (implies
       (and
        (HasType @x1 (Tm_type @u0))
        (forall ((@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
         (! (implies
           (and
            (HasType @x2 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x1 @u0))
            (HasType @x3 (Tm_arrow_6d1d34f39847bb08991d0c820d8b4257 @x1 @x2 @u0))
            (HasType @x4 (Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd @x2 @x1 @u0))
            (HasType @x5 (Tm_arrow_c50dacffbddc8b7e8983e24975dde472 @x2 @x1 @u0)))
           (and
            (Valid (Prims.hasEq @u0 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x1 @u0)))
            (Valid (Prims.hasEq @u0 (Tm_arrow_6d1d34f39847bb08991d0c820d8b4257 @x1 @x2 @u0)))
            (Valid (Prims.hasEq @u0 (Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd @x2 @x1 @u0)))
            (Valid (Prims.hasEq @u0 (Tm_arrow_c50dacffbddc8b7e8983e24975dde472 @x2 @x1 @u0)))))
          :qid assumption_FStar.Algebra.CommMonoid.Equiv.equiv__uu___haseq.2)))
       (Valid (Prims.hasEq @u0 (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1))))
      :pattern ((Prims.hasEq @u0 (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1)))
      :qid assumption_FStar.Algebra.CommMonoid.Equiv.equiv__uu___haseq.1))
    :qid assumption_FStar.Algebra.CommMonoid.Equiv.equiv__uu___haseq))
  :named assumption_FStar.Algebra.CommMonoid.Equiv.equiv__uu___haseq))
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
; Constructor distinct
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     189
     (Term_constr_id (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid constructor_distinct_FStar.Algebra.CommMonoid.Equiv.CM))
  :named constructor_distinct_FStar.Algebra.CommMonoid.Equiv.CM))
; Constructor distinct
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (= 119 (Term_constr_id (FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5)))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
    :qid constructor_distinct_FStar.Algebra.CommMonoid.Equiv.EQ))
  :named constructor_distinct_FStar.Algebra.CommMonoid.Equiv.EQ))
; Constructor distinct
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7); use=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= 168 (Term_constr_id (FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2)))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2))
    :qid constructor_distinct_FStar.Algebra.CommMonoid.Equiv.cm))
  :named constructor_distinct_FStar.Algebra.CommMonoid.Equiv.cm))
; Constructor distinct
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10); use=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 101 (Term_constr_id (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1)))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1))
    :qid constructor_distinct_FStar.Algebra.CommMonoid.Equiv.equiv))
  :named constructor_distinct_FStar.Algebra.CommMonoid.Equiv.equiv))
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
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
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
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)
      (FStar.Algebra.CommMonoid.Equiv.cm @u1 @x10 @x11))
     (and
      (HasTypeFuel @u0 @x10 (Tm_type @u1))
      (HasTypeFuel @u0 @x11 (FStar.Algebra.CommMonoid.Equiv.equiv @u1 @x10))
      (HasTypeFuel @u0 @x4 @x10)
      (HasTypeFuel @u0 @x5 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x10 @u1))
      (HasTypeFuel @u0 @x6 (Tm_arrow_6c5500042885b9cc1eced46408a1056f @x10 @u1 @x11 @x5 @x4))
      (HasTypeFuel @u0 @x7 (Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59 @x10 @u1 @x11 @x5))
      (HasTypeFuel @u0 @x8 (Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf @x10 @u1 @x11 @x5))
      (HasTypeFuel @u0 @x9 (Tm_arrow_8979d1416f9c75020b0a5911a0a455c2 @u1 @x10 @x11 @x5))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)
       (FStar.Algebra.CommMonoid.Equiv.cm @u1 @x10 @x11)))
    :qid data_elim_FStar.Algebra.CommMonoid.Equiv.CM))
  :named data_elim_FStar.Algebra.CommMonoid.Equiv.CM))
; data constructor typing elim
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall
    ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)
      (FStar.Algebra.CommMonoid.Equiv.equiv @u1 @x7))
     (and
      (HasTypeFuel @u0 @x7 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x7 @u1))
      (HasTypeFuel @u0 @x4 (Tm_arrow_6d1d34f39847bb08991d0c820d8b4257 @x7 @x3 @u1))
      (HasTypeFuel @u0 @x5 (Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd @x3 @x7 @u1))
      (HasTypeFuel @u0 @x6 (Tm_arrow_c50dacffbddc8b7e8983e24975dde472 @x3 @x7 @u1))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)
       (FStar.Algebra.CommMonoid.Equiv.equiv @u1 @x7)))
    :qid data_elim_FStar.Algebra.CommMonoid.Equiv.EQ))
  :named data_elim_FStar.Algebra.CommMonoid.Equiv.EQ))
; data constructor typing intro
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
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
      (HasTypeFuel @u0 @x2 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 (FStar.Algebra.CommMonoid.Equiv.equiv @u1 @x2))
      (HasTypeFuel @u0 @x4 @x2)
      (HasTypeFuel @u0 @x5 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x2 @u1))
      (HasTypeFuel @u0 @x6 (Tm_arrow_6c5500042885b9cc1eced46408a1056f @x2 @u1 @x3 @x5 @x4))
      (HasTypeFuel @u0 @x7 (Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59 @x2 @u1 @x3 @x5))
      (HasTypeFuel @u0 @x8 (Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf @x2 @u1 @x3 @x5))
      (HasTypeFuel @u0 @x9 (Tm_arrow_8979d1416f9c75020b0a5911a0a455c2 @u1 @x2 @x3 @x5)))
     (HasTypeFuel
      @u0
      (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)
      (FStar.Algebra.CommMonoid.Equiv.cm @u1 @x2 @x3)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)
       (FStar.Algebra.CommMonoid.Equiv.cm @u1 @x2 @x3)))
    :qid data_typing_intro_FStar.Algebra.CommMonoid.Equiv.CM@tok))
  :named data_typing_intro_FStar.Algebra.CommMonoid.Equiv.CM@tok))
; data constructor typing intro
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x2 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x2 @u1))
      (HasTypeFuel @u0 @x4 (Tm_arrow_6d1d34f39847bb08991d0c820d8b4257 @x2 @x3 @u1))
      (HasTypeFuel @u0 @x5 (Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd @x3 @x2 @u1))
      (HasTypeFuel @u0 @x6 (Tm_arrow_c50dacffbddc8b7e8983e24975dde472 @x3 @x2 @u1)))
     (HasTypeFuel
      @u0
      (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)
      (FStar.Algebra.CommMonoid.Equiv.equiv @u1 @x2)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)
       (FStar.Algebra.CommMonoid.Equiv.equiv @u1 @x2)))
    :qid data_typing_intro_FStar.Algebra.CommMonoid.Equiv.EQ@tok))
  :named data_typing_intro_FStar.Algebra.CommMonoid.Equiv.EQ@tok))
; Equation for FStar.IntegerIntervals.indices_seq
;;; Fact-ids: Name FStar.IntegerIntervals.indices_seq; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(79,4-79,15); use=FStar.IntegerIntervals.fst(79,4-79,15)
  (forall ((@x0 Term))
   (! (=
     (FStar.IntegerIntervals.indices_seq @x0)
     (FStar.Seq.Base.init
      U_zero
      (FStar.IntegerIntervals.under @x0)
      @x0
      (Tm_abs_07607a90cdec640007c6e8f2e5d63494 @x0)))
    :pattern ((FStar.IntegerIntervals.indices_seq @x0))
    :qid equation_FStar.IntegerIntervals.indices_seq))
  :named equation_FStar.IntegerIntervals.indices_seq))
; Equation for FStar.IntegerIntervals.interval
;;; Fact-ids: Name FStar.IntegerIntervals.interval; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(38,5-38,13); use=FStar.IntegerIntervals.fst(38,5-38,13)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.IntegerIntervals.interval @x0 @x1)
     (Tm_refine_fcf1a3596fffd49dd2e91f2678358f19 @x0 @x1))
    :pattern ((FStar.IntegerIntervals.interval @x0 @x1))
    :qid equation_FStar.IntegerIntervals.interval))
  :named equation_FStar.IntegerIntervals.interval))
; Equation for FStar.IntegerIntervals.interval_condition
;;; Fact-ids: Name FStar.IntegerIntervals.interval_condition; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(33,4-33,22); use=FStar.IntegerIntervals.fst(33,4-33,22)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.IntegerIntervals.interval_condition @x0 @x1 @x2)
     (Prims.op_AmpAmp (Prims.op_LessThanOrEqual @x0 @x2) (Prims.op_LessThan @x2 @x1)))
    :pattern ((FStar.IntegerIntervals.interval_condition @x0 @x1 @x2))
    :qid equation_FStar.IntegerIntervals.interval_condition))
  :named equation_FStar.IntegerIntervals.interval_condition))
; Equation for FStar.IntegerIntervals.interval_type
;;; Fact-ids: Name FStar.IntegerIntervals.interval_type; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(35,5-35,18); use=FStar.IntegerIntervals.fst(35,5-35,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (FStar.IntegerIntervals.interval_type @x0 @x1)
     (Tm_refine_97ae7a69cd5f02d44d6644f169486ebb @x0 @x1))
    :pattern ((FStar.IntegerIntervals.interval_type @x0 @x1))
    :qid equation_FStar.IntegerIntervals.interval_type))
  :named equation_FStar.IntegerIntervals.interval_type))
; Equation for FStar.IntegerIntervals.under
;;; Fact-ids: Name FStar.IntegerIntervals.under; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(47,5-47,10); use=FStar.IntegerIntervals.fst(47,5-47,10)
  (forall ((@x0 Term))
   (! (= (FStar.IntegerIntervals.under @x0) (FStar.IntegerIntervals.interval (BoxInt 0) @x0))
    :pattern ((FStar.IntegerIntervals.under @x0))
    :qid equation_FStar.IntegerIntervals.under))
  :named equation_FStar.IntegerIntervals.under))
; Equation for FStar.Matrix.get_i
;;; Fact-ids: Name FStar.Matrix.get_i; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(54,4-54,9); use=FStar.Matrix.fsti(54,4-54,9)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (FStar.Matrix.get_i @x0 @x1 @x2) (Prims.op_Division @x2 @x1))
    :pattern ((FStar.Matrix.get_i @x0 @x1 @x2))
    :qid equation_FStar.Matrix.get_i))
  :named equation_FStar.Matrix.get_i))
; Equation for FStar.Matrix.get_ij
;;; Fact-ids: Name FStar.Matrix.get_ij; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(49,4-49,10); use=FStar.Matrix.fsti(49,4-49,10)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= (FStar.Matrix.get_ij @x0 @x1 @x2 @x3) (Prims.op_Addition (Prims.op_Star @x2 @x1) @x3))
    :pattern ((FStar.Matrix.get_ij @x0 @x1 @x2 @x3))
    :qid equation_FStar.Matrix.get_ij))
  :named equation_FStar.Matrix.get_ij))
; Equation for FStar.Matrix.get_j
;;; Fact-ids: Name FStar.Matrix.get_j; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(55,4-55,9); use=FStar.Matrix.fsti(55,4-55,9)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (= (FStar.Matrix.get_j @x0 @x1 @x2) (Prims.op_Modulus @x2 @x1))
    :pattern ((FStar.Matrix.get_j @x0 @x1 @x2))
    :qid equation_FStar.Matrix.get_j))
  :named equation_FStar.Matrix.get_j))
; Equation for FStar.Matrix.ijth
;;; Fact-ids: Name FStar.Matrix.ijth; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(55,4-55,8); use=FStar.Matrix.fst(55,4-55,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (FStar.Matrix.ijth @u0 @x1 @x2 @x3 @x4 @x5 @x6)
     (FStar.Seq.Base.index @u0 @x1 @x4 (FStar.Matrix.get_ij @x2 @x3 @x5 @x6)))
    :pattern ((FStar.Matrix.ijth @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid equation_FStar.Matrix.ijth))
  :named equation_FStar.Matrix.ijth))
; Equation for FStar.Matrix.init
;;; Fact-ids: Name FStar.Matrix.init; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(73,4-73,8); use=FStar.Matrix.fst(73,4-73,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Matrix.init @u0 @x1 @x2 @x3 @x4)
     (FStar.Seq.Properties.map_seq
      U_zero
      @u0
      (FStar.IntegerIntervals.under (Prims.op_Star @x2 @x3))
      @x1
      (Tm_abs_c9ff1344e6045730d5ebd5616437488c @x2 @x3 @x1 @u0 @x4)
      (FStar.IntegerIntervals.indices_seq (Prims.op_Star @x2 @x3))))
    :pattern ((FStar.Matrix.init @u0 @x1 @x2 @x3 @x4))
    :qid equation_FStar.Matrix.init))
  :named equation_FStar.Matrix.init))
; Equation for FStar.Matrix.matrix
;;; Fact-ids: Name FStar.Matrix.matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(51,5-51,11); use=FStar.Matrix.fst(51,5-51,11)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.Matrix.matrix @u0 @x1 @x2 @x3)
     (Tm_refine_c5494133ebeeaeb6939645c40bf85e62 @u0 @x1 @x2 @x3))
    :pattern ((FStar.Matrix.matrix @u0 @x1 @x2 @x3))
    :qid equation_FStar.Matrix.matrix))
  :named equation_FStar.Matrix.matrix))
; Equation for FStar.Matrix.matrix_generator
;;; Fact-ids: Name FStar.Matrix.matrix_generator; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(37,5-37,21); use=FStar.Matrix.fsti(37,5-37,21)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.Matrix.matrix_generator @u0 @x1 @x2 @x3)
     (Tm_arrow_40916f69cbb43d885c4b9d96f6954d12 @x2 @x3 @x1 @u0))
    :pattern ((FStar.Matrix.matrix_generator @u0 @x1 @x2 @x3))
    :qid equation_FStar.Matrix.matrix_generator))
  :named equation_FStar.Matrix.matrix_generator))
; Equation for FStar.Matrix.matrix_mul_unit
;;; Fact-ids: Name FStar.Matrix.matrix_mul_unit; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(325,4-325,19); use=FStar.Matrix.fsti(325,4-325,19)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Matrix.matrix_mul_unit @u0 @x1 @x2 @x3 @x4 @x5)
     (FStar.Matrix.init
      @u0
      @x1
      @x5
      @x5
      (Tm_abs_7794e091436089522f6291c350690dfa @x5 @x1 @u0 @x2 @x4 @x3)))
    :pattern ((FStar.Matrix.matrix_mul_unit @u0 @x1 @x2 @x3 @x4 @x5))
    :qid equation_FStar.Matrix.matrix_mul_unit))
  :named equation_FStar.Matrix.matrix_mul_unit))
; Equation for FStar.Matrix.matrix_of
;;; Fact-ids: Name FStar.Matrix.matrix_of; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(110,5-110,14); use=FStar.Matrix.fsti(110,5-110,14)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.Matrix.matrix_of @u0 @x1 @x2 @x3 @x4)
     (Tm_refine_54dbd50028a232789dd68ce8ea833f14 @u0 @x2 @x3 @x1 @x4))
    :pattern ((FStar.Matrix.matrix_of @u0 @x1 @x2 @x3 @x4))
    :qid equation_FStar.Matrix.matrix_of))
  :named equation_FStar.Matrix.matrix_of))
; Equation for FStar.Matrix.row
;;; Fact-ids: Name FStar.Matrix.row; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(225,4-225,7); use=FStar.Matrix.fsti(225,4-225,7)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Matrix.row @u0 @x1 @x2 @x3 @x4 @x5)
     (FStar.Seq.Base.init
      @u0
      @x1
      @x3
      (Tm_abs_938e0f44b4a93213a875f12294289ff4 @x3 @x1 @u0 @x2 @x4 @x5)))
    :pattern ((FStar.Matrix.row @u0 @x1 @x2 @x3 @x4 @x5))
    :qid equation_FStar.Matrix.row))
  :named equation_FStar.Matrix.row))
; Equation for FStar.Matrix.seq_of_matrix
;;; Fact-ids: Name FStar.Matrix.seq_of_matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(53,4-53,17); use=FStar.Matrix.fst(53,4-53,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.Matrix.seq_of_matrix @u0 @x1 @x2 @x3 @x4) @x4)
    :pattern ((FStar.Matrix.seq_of_matrix @u0 @x1 @x2 @x3 @x4))
    :qid equation_FStar.Matrix.seq_of_matrix))
  :named equation_FStar.Matrix.seq_of_matrix))
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
; fresh token
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! (forall ((@u0 Universe))
   (! (= 169 (Term_constr_id (FStar.Algebra.CommMonoid.Equiv.cm@tok @u0)))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.cm@tok @u0))
    :qid fresh_token_FStar.Algebra.CommMonoid.Equiv.cm@tok))
  :named fresh_token_FStar.Algebra.CommMonoid.Equiv.cm@tok))
; fresh token
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! (forall ((@u0 Universe))
   (! (= 102 (Term_constr_id (FStar.Algebra.CommMonoid.Equiv.equiv@tok @u0)))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.equiv@tok @u0))
    :qid fresh_token_FStar.Algebra.CommMonoid.Equiv.equiv@tok))
  :named fresh_token_FStar.Algebra.CommMonoid.Equiv.equiv@tok))
; inversion axiom
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7); use=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (FStar.Algebra.CommMonoid.Equiv.cm @u2 @x3 @x4))
     (and
      (is-FStar.Algebra.CommMonoid.Equiv.CM @x1)
      (= @u2 (FStar.Algebra.CommMonoid.Equiv.CM_@0 @x1))
      (= @x3 (FStar.Algebra.CommMonoid.Equiv.CM_@a @x1))
      (= @x4 (FStar.Algebra.CommMonoid.Equiv.CM_@eq @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (FStar.Algebra.CommMonoid.Equiv.cm @u2 @x3 @x4)))
    :qid fuel_guarded_inversion_FStar.Algebra.CommMonoid.Equiv.cm))
  :named fuel_guarded_inversion_FStar.Algebra.CommMonoid.Equiv.cm))
; inversion axiom
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10); use=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (FStar.Algebra.CommMonoid.Equiv.equiv @u2 @x3))
     (and
      (is-FStar.Algebra.CommMonoid.Equiv.EQ @x1)
      (= @u2 (FStar.Algebra.CommMonoid.Equiv.EQ_@0 @x1))
      (= @x3 (FStar.Algebra.CommMonoid.Equiv.EQ_@a @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (FStar.Algebra.CommMonoid.Equiv.equiv @u2 @x3)))
    :qid fuel_guarded_inversion_FStar.Algebra.CommMonoid.Equiv.equiv))
  :named fuel_guarded_inversion_FStar.Algebra.CommMonoid.Equiv.equiv))
; function token typing
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6); use=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6)
  (forall ((@u0 Universe))
   (! (HasType
     (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u0)
     (Tm_arrow_fab84e6afc892ca93c78ca3949230b64 @u0))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u0))
    :qid function_token_typing_FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq))
  :named function_token_typing_FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq))
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
;;; Fact-ids: Name Prims.op_Addition; Namespace Prims
(assert
 (! ;; def=Prims.fst(520,4-520,15); use=Prims.fst(520,4-520,15)
  (forall ((@x0 Term))
   (! (and
     (NoHoist @x0 (HasType Prims.op_Addition@tok Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623))
     ;; def=Prims.fst(520,4-520,15); use=Prims.fst(520,4-520,15)
     (forall ((@x1 Term) (@x2 Term))
      (! (= (ApplyTT (ApplyTT Prims.op_Addition@tok @x1) @x2) (Prims.op_Addition @x1 @x2))
       :pattern ((Prims.op_Addition @x1 @x2))
       :qid function_token_typing_Prims.op_Addition.1)))
    :pattern ((ApplyTT @x0 Prims.op_Addition@tok))
    :qid function_token_typing_Prims.op_Addition))
  :named function_token_typing_Prims.op_Addition))
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
; haseq for Tm_refine_079809d6a4568acb4adbe11585a669ef
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,60); use=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,60)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (Valid
      (Prims.hasEq U_zero (Tm_refine_079809d6a4568acb4adbe11585a669ef @u0 @x1 @x2 @x3 @x4 @x5)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid
       (Prims.hasEq U_zero (Tm_refine_079809d6a4568acb4adbe11585a669ef @u0 @x1 @x2 @x3 @x4 @x5))))
    :qid haseqTm_refine_079809d6a4568acb4adbe11585a669ef))
  :named haseqTm_refine_079809d6a4568acb4adbe11585a669ef))
; haseq for Tm_refine_08c147be678c982b4c352f75d8eec630
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,99); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,99)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_08c147be678c982b4c352f75d8eec630 @x0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid (Prims.hasEq U_zero (Tm_refine_08c147be678c982b4c352f75d8eec630 @x0 @x1 @x2 @x3))))
    :qid haseqTm_refine_08c147be678c982b4c352f75d8eec630))
  :named haseqTm_refine_08c147be678c982b4c352f75d8eec630))
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
; haseq for Tm_refine_17d6a0887ae9558c86dba7da9cd58343
;;; Fact-ids: Name FStar.IntegerIntervals.indices_seq; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(80,4-83,6); use=FStar.IntegerIntervals.fst(80,4-83,6)
  (forall ((@x0 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_17d6a0887ae9558c86dba7da9cd58343 @x0)))
     (Valid (Prims.hasEq U_zero (FStar.Seq.Base.seq U_zero (FStar.IntegerIntervals.under @x0)))))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_17d6a0887ae9558c86dba7da9cd58343 @x0))))
    :qid haseqTm_refine_17d6a0887ae9558c86dba7da9cd58343))
  :named haseqTm_refine_17d6a0887ae9558c86dba7da9cd58343))
; haseq for Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,40); use=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,40)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a @x0 @x1))))
    :qid haseqTm_refine_427dfeb6a3d9b68cc7798a759cd6675a))
  :named haseqTm_refine_427dfeb6a3d9b68cc7798a759cd6675a))
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
; haseq for Tm_refine_542f9d4f129664613f2483a6c88bc7c2
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_542f9d4f129664613f2483a6c88bc7c2))
; haseq for Tm_refine_54dbd50028a232789dd68ce8ea833f14
;;; Fact-ids: Name FStar.Matrix.matrix_of; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(110,63-113,1); use=FStar.Matrix.fsti(110,63-113,1)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_54dbd50028a232789dd68ce8ea833f14 @u0 @x1 @x2 @x3 @x4)))
     (Valid (Prims.hasEq @u0 (FStar.Matrix.matrix @u0 @x3 @x1 @x2))))
    :pattern
     ((Valid (Prims.hasEq @u0 (Tm_refine_54dbd50028a232789dd68ce8ea833f14 @u0 @x1 @x2 @x3 @x4))))
    :qid haseqTm_refine_54dbd50028a232789dd68ce8ea833f14))
  :named haseqTm_refine_54dbd50028a232789dd68ce8ea833f14))
; haseq for Tm_refine_774ba3f728d91ead8ef40be66c9802e5
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_774ba3f728d91ead8ef40be66c9802e5))
; haseq for Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db
;;; Fact-ids: Name FStar.Matrix.ijth; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(100,2-100,58); use=FStar.Matrix.fst(55,4-55,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (iff
     (Valid
      (Prims.hasEq @u0 (Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db @u0 @x1 @x2 @x3 @x4 @x5 @x6)))
     (Valid (Prims.hasEq @u0 @x1)))
    :pattern
     ((Valid
       (Prims.hasEq @u0 (Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db @u0 @x1 @x2 @x3 @x4 @x5 @x6))))
    :qid haseqTm_refine_7c067c17a9f6e5c93ba9f986b521b9db))
  :named haseqTm_refine_7c067c17a9f6e5c93ba9f986b521b9db))
; haseq for Tm_refine_97ae7a69cd5f02d44d6644f169486ebb
;;; Fact-ids: Name FStar.IntegerIntervals.interval_type; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(35,31-35,80); use=FStar.IntegerIntervals.fst(35,31-35,80)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq (U_succ U_zero) (Tm_refine_97ae7a69cd5f02d44d6644f169486ebb @x0 @x1)))
     (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
    :pattern
     ((Valid (Prims.hasEq (U_succ U_zero) (Tm_refine_97ae7a69cd5f02d44d6644f169486ebb @x0 @x1))))
    :qid haseqTm_refine_97ae7a69cd5f02d44d6644f169486ebb))
  :named haseqTm_refine_97ae7a69cd5f02d44d6644f169486ebb))
; haseq for Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,78); use=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,78)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (Valid
      (Prims.hasEq U_zero (Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df @u0 @x1 @x2 @x3 @x4 @x5)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid
       (Prims.hasEq U_zero (Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df @u0 @x1 @x2 @x3 @x4 @x5))))
    :qid haseqTm_refine_98bfb9c4a1d28a0a144569c7964ea8df))
  :named haseqTm_refine_98bfb9c4a1d28a0a144569c7964ea8df))
; haseq for Tm_refine_9d6af3f3535473623f7aec2f0501897f
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq (U_succ U_zero) Tm_refine_9d6af3f3535473623f7aec2f0501897f))
   (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
  :named haseqTm_refine_9d6af3f3535473623f7aec2f0501897f))
; haseq for Tm_refine_b85d2a162d78f833de0a4223b666960d
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,76); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,76)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_b85d2a162d78f833de0a4223b666960d @x0 @x1 @x2)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_b85d2a162d78f833de0a4223b666960d @x0 @x1 @x2))))
    :qid haseqTm_refine_b85d2a162d78f833de0a4223b666960d))
  :named haseqTm_refine_b85d2a162d78f833de0a4223b666960d))
; haseq for Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0
;;; Fact-ids: Name FStar.Matrix.seq_of_matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(93,2-96,4); use=FStar.Matrix.fst(53,4-53,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0 @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq @u0 (FStar.Seq.Base.seq @u0 @x1))))
    :pattern
     ((Valid (Prims.hasEq @u0 (Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0 @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_bcdb054c1bdf0a6970243b8aab50e2d0))
  :named haseqTm_refine_bcdb054c1bdf0a6970243b8aab50e2d0))
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
; haseq for Tm_refine_c5494133ebeeaeb6939645c40bf85e62
;;; Fact-ids: Name FStar.Matrix.matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(51,20-51,52); use=FStar.Matrix.fst(51,20-51,52)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_c5494133ebeeaeb6939645c40bf85e62 @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq @u0 (FStar.Seq.Base.seq @u0 @x1))))
    :pattern
     ((Valid (Prims.hasEq @u0 (Tm_refine_c5494133ebeeaeb6939645c40bf85e62 @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_c5494133ebeeaeb6939645c40bf85e62))
  :named haseqTm_refine_c5494133ebeeaeb6939645c40bf85e62))
; haseq for Tm_refine_d70b7477cee9e214d3da094d85921d96
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,87)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (iff
     (Valid
      (Prims.hasEq U_zero (Tm_refine_d70b7477cee9e214d3da094d85921d96 @u0 @x1 @x2 @x3 @x4 @x5 @x6)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid
       (Prims.hasEq U_zero (Tm_refine_d70b7477cee9e214d3da094d85921d96 @u0 @x1 @x2 @x3 @x4 @x5 @x6))))
    :qid haseqTm_refine_d70b7477cee9e214d3da094d85921d96))
  :named haseqTm_refine_d70b7477cee9e214d3da094d85921d96))
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
; haseq for Tm_refine_ed6514ea2e57229a44a63744c80130cd
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,143); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,143)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (iff
     (Valid
      (Prims.hasEq
       U_zero
       (Tm_refine_ed6514ea2e57229a44a63744c80130cd @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid
       (Prims.hasEq
        U_zero
        (Tm_refine_ed6514ea2e57229a44a63744c80130cd @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))))
    :qid haseqTm_refine_ed6514ea2e57229a44a63744c80130cd))
  :named haseqTm_refine_ed6514ea2e57229a44a63744c80130cd))
; haseq for Tm_refine_fcf1a3596fffd49dd2e91f2678358f19
;;; Fact-ids: Name FStar.IntegerIntervals.interval_type; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(35,47-35,78); use=FStar.IntegerIntervals.fst(35,47-35,78)
  (forall ((@x0 Term) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_fcf1a3596fffd49dd2e91f2678358f19 @x0 @x1)))
     (Valid (Prims.hasEq U_zero Prims.int)))
    :pattern ((Valid (Prims.hasEq U_zero (Tm_refine_fcf1a3596fffd49dd2e91f2678358f19 @x0 @x1))))
    :qid haseqTm_refine_fcf1a3596fffd49dd2e91f2678358f19))
  :named haseqTm_refine_fcf1a3596fffd49dd2e91f2678358f19))
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
; interpretation_Tm_abs_07607a90cdec640007c6e8f2e5d63494
;;; Fact-ids: Name FStar.IntegerIntervals.indices_seq; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(84,32-84,33); use=FStar.IntegerIntervals.fst(84,46-84,47)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (ApplyTT (Tm_abs_07607a90cdec640007c6e8f2e5d63494 @x1) @x0) @x0)
    :pattern ((ApplyTT (Tm_abs_07607a90cdec640007c6e8f2e5d63494 @x1) @x0))
    :qid interpretation_Tm_abs_07607a90cdec640007c6e8f2e5d63494))
  :named interpretation_Tm_abs_07607a90cdec640007c6e8f2e5d63494))
; interpretation_Tm_abs_7794e091436089522f6291c350690dfa
;;; Fact-ids: Name FStar.Matrix.matrix_mul_unit; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(326,36-326,70); use=FStar.Matrix.fsti(326,36-326,70)
  (forall
    ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@u4 Universe) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (=
     (ApplyTT (ApplyTT (Tm_abs_7794e091436089522f6291c350690dfa @x2 @x3 @u4 @x5 @x6 @x7) @x0) @x1)
     (let ((@lb8 (Prims.op_Equality (FStar.IntegerIntervals.under @x2) @x0 @x1)))
      (ite
       (= @lb8 (BoxBool true))
       (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit @u4 @x3 @x5 @x6)
       (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit @u4 @x3 @x5 @x7))))
    :pattern
     ((ApplyTT (ApplyTT (Tm_abs_7794e091436089522f6291c350690dfa @x2 @x3 @u4 @x5 @x6 @x7) @x0) @x1))
    :qid interpretation_Tm_abs_7794e091436089522f6291c350690dfa))
  :named interpretation_Tm_abs_7794e091436089522f6291c350690dfa))
; interpretation_Tm_abs_938e0f44b4a93213a875f12294289ff4
;;; Fact-ids: Name FStar.Matrix.row; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(225,82-225,93); use=FStar.Matrix.fsti(225,82-225,93)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (ApplyTT (Tm_abs_938e0f44b4a93213a875f12294289ff4 @x1 @x2 @u3 @x4 @x5 @x6) @x0)
     (FStar.Matrix.ijth @u3 @x2 @x4 @x1 @x5 @x6 @x0))
    :pattern ((ApplyTT (Tm_abs_938e0f44b4a93213a875f12294289ff4 @x1 @x2 @u3 @x4 @x5 @x6) @x0))
    :qid interpretation_Tm_abs_938e0f44b4a93213a875f12294289ff4))
  :named interpretation_Tm_abs_938e0f44b4a93213a875f12294289ff4))
; interpretation_Tm_abs_c9ff1344e6045730d5ebd5616437488c
;;; Fact-ids: Name FStar.Matrix.init; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(76,24-76,63); use=FStar.Matrix.fst(76,24-76,63)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@u4 Universe) (@x5 Term))
   (! (=
     (ApplyTT (Tm_abs_c9ff1344e6045730d5ebd5616437488c @x1 @x2 @x3 @u4 @x5) @x0)
     (ApplyTT (ApplyTT @x5 (FStar.Matrix.get_i @x1 @x2 @x0)) (FStar.Matrix.get_j @x1 @x2 @x0)))
    :pattern ((ApplyTT (Tm_abs_c9ff1344e6045730d5ebd5616437488c @x1 @x2 @x3 @u4 @x5) @x0))
    :qid interpretation_Tm_abs_c9ff1344e6045730d5ebd5616437488c))
  :named interpretation_Tm_abs_c9ff1344e6045730d5ebd5616437488c))
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! (and
   ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7); use=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7)
   (forall ((@u0 Universe))
    (! (IsTotFun (FStar.Algebra.CommMonoid.Equiv.cm@tok @u0))
     :pattern ((FStar.Algebra.CommMonoid.Equiv.cm@tok @u0))
     :qid kinding_FStar.Algebra.CommMonoid.Equiv.cm@tok))
   ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7); use=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7)
   (forall ((@u0 Universe) (@x1 Term))
    (! (IsTotFun (ApplyTT (FStar.Algebra.CommMonoid.Equiv.cm@tok @u0) @x1))
     :pattern ((ApplyTT (FStar.Algebra.CommMonoid.Equiv.cm@tok @u0) @x1))
     :qid kinding_FStar.Algebra.CommMonoid.Equiv.cm@tok.1))
   ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7); use=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7)
   (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
    (! (implies
      (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1)))
      (HasType (FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2) (Tm_type @u0)))
     :pattern ((FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2))
     :qid kinding_FStar.Algebra.CommMonoid.Equiv.cm@tok.2)))
  :named kinding_FStar.Algebra.CommMonoid.Equiv.cm@tok))
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! (and
   ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10); use=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10)
   (forall ((@u0 Universe))
    (! (IsTotFun (FStar.Algebra.CommMonoid.Equiv.equiv@tok @u0))
     :pattern ((FStar.Algebra.CommMonoid.Equiv.equiv@tok @u0))
     :qid kinding_FStar.Algebra.CommMonoid.Equiv.equiv@tok))
   ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10); use=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10)
   (forall ((@u0 Universe) (@x1 Term))
    (! (implies
      (HasType @x1 (Tm_type @u0))
      (HasType (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1) (Tm_type @u0)))
     :pattern ((FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1))
     :qid kinding_FStar.Algebra.CommMonoid.Equiv.equiv@tok.1)))
  :named kinding_FStar.Algebra.CommMonoid.Equiv.equiv@tok))
; kinding_Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65
;;; Fact-ids: Name FStar.Matrix.matrix_mul_unit; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(37,37-325,22); use=FStar.Matrix.fsti(37,37-325,44)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (HasType (Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65 @x0 @x1 @u2) (Tm_type @u2))
    :pattern ((HasType (Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65 @x0 @x1 @u2) (Tm_type @u2)))
    :qid kinding_Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65))
  :named kinding_Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65))
; kinding_Tm_arrow_257a53890f49995b0f689694ec797771
;;; Fact-ids: Name FStar.IntegerIntervals.indices_seq; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(84,34-84,41); use=FStar.IntegerIntervals.fst(84,19-84,41)
  (forall ((@x0 Term))
   (! (HasType (Tm_arrow_257a53890f49995b0f689694ec797771 @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_arrow_257a53890f49995b0f689694ec797771 @x0) (Tm_type U_zero)))
    :qid kinding_Tm_arrow_257a53890f49995b0f689694ec797771))
  :named kinding_Tm_arrow_257a53890f49995b0f689694ec797771))
; kinding_Tm_arrow_40916f69cbb43d885c4b9d96f6954d12
;;; Fact-ids: Name FStar.Matrix.matrix_generator; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(37,22-37,55); use=FStar.Matrix.fsti(37,37-37,60)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (HasType (Tm_arrow_40916f69cbb43d885c4b9d96f6954d12 @x0 @x1 @x2 @u3) (Tm_type @u3))
    :pattern ((HasType (Tm_arrow_40916f69cbb43d885c4b9d96f6954d12 @x0 @x1 @x2 @u3) (Tm_type @u3)))
    :qid kinding_Tm_arrow_40916f69cbb43d885c4b9d96f6954d12))
  :named kinding_Tm_arrow_40916f69cbb43d885c4b9d96f6954d12))
; kinding_Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! (HasType Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623 (Tm_type U_zero))
  :named kinding_Tm_arrow_47fc285d7b44e13bcb7e420cbfc55623))
; kinding_Tm_arrow_6c5500042885b9cc1eced46408a1056f
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-53,60); use=FStar.Algebra.CommMonoid.Equiv.fst(53,18-53,60)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (HasType (Tm_arrow_6c5500042885b9cc1eced46408a1056f @x0 @u1 @x2 @x3 @x4) (Tm_type @u1))
    :pattern
     ((HasType (Tm_arrow_6c5500042885b9cc1eced46408a1056f @x0 @u1 @x2 @x3 @x4) (Tm_type @u1)))
    :qid kinding_Tm_arrow_6c5500042885b9cc1eced46408a1056f))
  :named kinding_Tm_arrow_6c5500042885b9cc1eced46408a1056f))
; kinding_Tm_arrow_6d1d34f39847bb08991d0c820d8b4257
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-23,40); use=FStar.Algebra.CommMonoid.Equiv.fst(23,19-23,40)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (HasType (Tm_arrow_6d1d34f39847bb08991d0c820d8b4257 @x0 @x1 @u2) (Tm_type @u2))
    :pattern ((HasType (Tm_arrow_6d1d34f39847bb08991d0c820d8b4257 @x0 @x1 @u2) (Tm_type @u2)))
    :qid kinding_Tm_arrow_6d1d34f39847bb08991d0c820d8b4257))
  :named kinding_Tm_arrow_6d1d34f39847bb08991d0c820d8b4257))
; kinding_Tm_arrow_6d76c8e4fc59503348e55fc915188ea1
;;; Fact-ids: Name FStar.Seq.Base.init_aux; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(36,23-36,86); use=FStar.Seq.Base.fsti(36,69-36,95)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (HasType (Tm_arrow_6d76c8e4fc59503348e55fc915188ea1 @x0 @x1 @u2) (Tm_type @u2))
    :pattern ((HasType (Tm_arrow_6d76c8e4fc59503348e55fc915188ea1 @x0 @x1 @u2) (Tm_type @u2)))
    :qid kinding_Tm_arrow_6d76c8e4fc59503348e55fc915188ea1))
  :named kinding_Tm_arrow_6d76c8e4fc59503348e55fc915188ea1))
; kinding_Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c
;;; Fact-ids: Name FStar.Matrix.col; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(223,9-223,77); use=FStar.Matrix.fsti(223,29-223,77)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (HasType (Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c @x0 @x1 @u2) (Tm_type @u2))
    :pattern ((HasType (Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c @x0 @x1 @u2) (Tm_type @u2)))
    :qid kinding_Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c))
  :named kinding_Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c))
; kinding_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-57,143); use=FStar.Algebra.CommMonoid.Equiv.fst(57,18-57,143)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_arrow_8979d1416f9c75020b0a5911a0a455c2 @u0 @x1 @x2 @x3) (Tm_type @u0))
    :pattern ((HasType (Tm_arrow_8979d1416f9c75020b0a5911a0a455c2 @u0 @x1 @x2 @x3) (Tm_type @u0)))
    :qid kinding_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2))
  :named kinding_Tm_arrow_8979d1416f9c75020b0a5911a0a455c2))
; kinding_Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(54,23-55,87)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59 @x0 @u1 @x2 @x3) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59 @x0 @u1 @x2 @x3) (Tm_type @u1)))
    :qid kinding_Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59))
  :named kinding_Tm_arrow_931cb885ccd6848ab0aec8dbb06c3e59))
; kinding_Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-24,76); use=FStar.Algebra.CommMonoid.Equiv.fst(24,16-24,76)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (HasType (Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd @x0 @x1 @u2) (Tm_type @u2))
    :pattern ((HasType (Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd @x0 @x1 @u2) (Tm_type @u2)))
    :qid kinding_Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd))
  :named kinding_Tm_arrow_a62f355b7a994253b6273abdfd9d4bbd))
; kinding_Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d
;;; Fact-ids: Name FStar.Matrix.init; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(54,26-54,37); use=FStar.Matrix.fst(73,54-76,40)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe))
   (! (HasType (Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d @x0 @x1 @x2 @u3) (Tm_type @u3))
    :pattern ((HasType (Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d @x0 @x1 @x2 @u3) (Tm_type @u3)))
    :qid kinding_Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d))
  :named kinding_Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d))
; kinding_Tm_arrow_c50dacffbddc8b7e8983e24975dde472
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-25,99); use=FStar.Algebra.CommMonoid.Equiv.fst(25,20-25,99)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (HasType (Tm_arrow_c50dacffbddc8b7e8983e24975dde472 @x0 @x1 @u2) (Tm_type @u2))
    :pattern ((HasType (Tm_arrow_c50dacffbddc8b7e8983e24975dde472 @x0 @x1 @u2) (Tm_type @u2)))
    :qid kinding_Tm_arrow_c50dacffbddc8b7e8983e24975dde472))
  :named kinding_Tm_arrow_c50dacffbddc8b7e8983e24975dde472))
; kinding_Tm_arrow_d64d4275ed8e577d65d5c1671754751b
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-49,10); use=FStar.Algebra.CommMonoid.Equiv.fst(52,10-52,21)
  (forall ((@x0 Term) (@u1 Universe))
   (! (HasType (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x0 @u1) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x0 @u1) (Tm_type @u1)))
    :qid kinding_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
  :named kinding_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
; kinding_Tm_arrow_e45db00acd4175c5113071bde065fbe3
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22); use=FStar.Algebra.CommMonoid.Equiv.fst(22,8-22,22)
  (forall ((@x0 Term) (@u1 Universe))
   (! (HasType (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x0 @u1) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x0 @u1) (Tm_type @u1)))
    :qid kinding_Tm_arrow_e45db00acd4175c5113071bde065fbe3))
  :named kinding_Tm_arrow_e45db00acd4175c5113071bde065fbe3))
; kinding_Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,9-56,78); use=FStar.Algebra.CommMonoid.Equiv.fst(56,21-56,78)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf @x0 @u1 @x2 @x3) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf @x0 @u1 @x2 @x3) (Tm_type @u1)))
    :qid kinding_Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf))
  :named kinding_Tm_arrow_ee6bd0edaa5e9d469aee75abac4f75cf))
; kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19
;;; Fact-ids: Name Prims.pure_post'; Namespace Prims
(assert
 (! ;; def=Prims.fst(281,39-281,56); use=Prims.fst(281,39-281,56)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u0 @x1 @x2) (Tm_type @u0))
    :pattern ((HasType (Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 @u0 @x1 @x2) (Tm_type @u0)))
    :qid kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
  :named kinding_Tm_arrow_eed220cc6714c2e2d27bc073c82dad19))
; kinding_Tm_arrow_fab84e6afc892ca93c78ca3949230b64
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22); use=FStar.Algebra.CommMonoid.Equiv.fst(20,12-22,22)
  (forall ((@u0 Universe))
   (! (HasType (Tm_arrow_fab84e6afc892ca93c78ca3949230b64 @u0) (Tm_type (U_succ @u0)))
    :pattern ((HasType (Tm_arrow_fab84e6afc892ca93c78ca3949230b64 @u0) (Tm_type (U_succ @u0))))
    :qid kinding_Tm_arrow_fab84e6afc892ca93c78ca3949230b64))
  :named kinding_Tm_arrow_fab84e6afc892ca93c78ca3949230b64))
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
; Lemma: FStar.Seq.Base.init_index_
;;; Fact-ids: Name FStar.Seq.Base.init_index_; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.nat)
      (HasType @x3 (Tm_arrow_6d76c8e4fc59503348e55fc915188ea1 @x2 @x1 @u0))
      (HasType @x4 Prims.nat)
      ;; def=FStar.Seq.Base.fsti(218,20-218,27); use=FStar.Seq.Base.fsti(218,20-218,27)
      (< (BoxInt_proj_0 @x4) (BoxInt_proj_0 @x2)))
     ;; def=FStar.Seq.Base.fsti(219,13-219,56); use=FStar.Seq.Base.fsti(219,13-219,56)
     (= (FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.init @u0 @x1 @x2 @x3) @x4) (ApplyTT @x3 @x4)))
    :pattern ((FStar.Seq.Base.index @u0 @x1 (FStar.Seq.Base.init @u0 @x1 @x2 @x3) @x4))
    :qid lemma_FStar.Seq.Base.init_index_))
  :named lemma_FStar.Seq.Base.init_index_))
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
; Lemma: FStar.Seq.Base.lemma_init_len
;;; Fact-ids: Name FStar.Seq.Base.lemma_init_len; Namespace FStar.Seq.Base
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.nat)
      (HasType @x3 (Tm_arrow_6d76c8e4fc59503348e55fc915188ea1 @x2 @x1 @u0)))
     ;; def=FStar.Seq.Base.fsti(99,11-99,41); use=FStar.Seq.Base.fsti(99,11-99,41)
     (= (FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.init @u0 @x1 @x2 @x3)) @x2))
    :pattern ((FStar.Seq.Base.length @u0 @x1 (FStar.Seq.Base.init @u0 @x1 @x2 @x3)))
    :qid lemma_FStar.Seq.Base.lemma_init_len))
  :named lemma_FStar.Seq.Base.lemma_init_len))
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
;;; Fact-ids: Name Prims.op_Addition; Namespace Prims
(assert
 (! (IsTotFun Prims.op_Addition@tok) :named primitive_tot_fun_Prims.op_Addition))
;;; Fact-ids: Name Prims.op_Addition; Namespace Prims
(assert
 (! ;; def=Prims.fst(520,4-520,15); use=Prims.fst(520,4-520,15)
  (forall ((@x0 Term))
   (! (IsTotFun (ApplyTT Prims.op_Addition@tok @x0))
    :pattern ((ApplyTT Prims.op_Addition@tok @x0))
    :qid primitive_tot_fun_Prims.op_Addition.1))
  :named primitive_tot_fun_Prims.op_Addition.1))
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
; Projector equation
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(51,4-51,8); use=FStar.Algebra.CommMonoid.Equiv.fst(51,4-51,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit @u0 @x1 @x2 @x3)
     (FStar.Algebra.CommMonoid.Equiv.CM_@unit @x3))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit @u0 @x1 @x2 @x3))
    :qid proj_equation_FStar.Algebra.CommMonoid.Equiv.CM_@unit))
  :named proj_equation_FStar.Algebra.CommMonoid.Equiv.CM_@unit))
; Projector equation
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6); use=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2)
     (FStar.Algebra.CommMonoid.Equiv.EQ_@eq @x2))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2))
    :qid proj_equation_FStar.Algebra.CommMonoid.Equiv.EQ_@eq))
  :named proj_equation_FStar.Algebra.CommMonoid.Equiv.EQ_@eq))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.CM_@0
      (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
     @u0)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@0))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.CM_@a
      (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x1)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@a))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@a))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.CM_@associativity
      (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x6)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@associativity))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@associativity))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.CM_@commutativity
      (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x7)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@commutativity))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@commutativity))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.CM_@congruence
      (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x8)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@congruence))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@congruence))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.CM_@eq
      (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x2)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@eq))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@eq))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.CM_@identity
      (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x5)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@identity))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@identity))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.CM_@mult
      (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x4)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@mult))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@mult))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Universe)
     (@x1 Term)
     (@x2 Term)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.CM_@unit
      (FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
     @x3)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.CM @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7 @x8))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@unit))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.CM_@unit))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.EQ_@0
      (FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
     @u0)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@0))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.EQ_@a
      (FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
     @x1)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@a))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@a))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.EQ_@eq
      (FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
     @x2)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@eq))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@eq))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.EQ_@reflexivity
      (FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
     @x3)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@reflexivity))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@reflexivity))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.EQ_@symmetry
      (FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
     @x4)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@symmetry))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@symmetry))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (FStar.Algebra.CommMonoid.Equiv.EQ_@transitivity
      (FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
     @x5)
    :pattern ((FStar.Algebra.CommMonoid.Equiv.EQ @u0 @x1 @x2 @x3 @x4 @x5))
    :qid projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@transitivity))
  :named projection_inverse_FStar.Algebra.CommMonoid.Equiv.EQ_@transitivity))
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
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,60); use=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,60)
  (forall
    ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_079809d6a4568acb4adbe11585a669ef @u2 @x3 @x4 @x5 @x6 @x7))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,60)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,28)
       (forall ((@x8 Term))
        (! (implies
          (and
           (HasType @x8 Prims.unit)
           ;; def=FStar.Algebra.CommMonoid.Equiv.fst(53,29-53,60); use=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,28)
           (Valid
            ;; def=FStar.Algebra.CommMonoid.Equiv.fst(53,29-53,60); use=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,28)
            (ApplyTT
             (ApplyTT
              (ApplyTT
               (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u2) @x3)
               @x4)
              (ApplyTT (ApplyTT @x5 @x6) @x7))
             @x7)))
          ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,60)
          (not
           ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,60)
           (= @x8 @x1)))
         :qid refinement_interpretation_Tm_refine_079809d6a4568acb4adbe11585a669ef.1)))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_079809d6a4568acb4adbe11585a669ef @u2 @x3 @x4 @x5 @x6 @x7)))
    :qid refinement_interpretation_Tm_refine_079809d6a4568acb4adbe11585a669ef))
  :named refinement_interpretation_Tm_refine_079809d6a4568acb4adbe11585a669ef))
; refinement_interpretation
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,99); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,99)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_08c147be678c982b4c352f75d8eec630 @x2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,99)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
       (and
        ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,56-25,64); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
        (Valid
         ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,56-25,64); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
         (ApplyTT (ApplyTT @x2 @x3) @x4))
        ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,68-25,76); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
        (Valid
         ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,68-25,76); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
         (ApplyTT (ApplyTT @x2 @x4) @x5))
        ;; def=Prims.fst(409,36-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
        (forall ((@x6 Term))
         (! (implies
           (and
            (HasType @x6 Prims.unit)
            ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,88-25,98); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
            (Valid
             ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,88-25,98); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,44)
             (ApplyTT (ApplyTT @x2 @x3) @x5)))
           ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,99)
           (not
            ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,99)
            (= @x6 @x1)))
          :qid refinement_interpretation_Tm_refine_08c147be678c982b4c352f75d8eec630.1))))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_08c147be678c982b4c352f75d8eec630 @x2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_08c147be678c982b4c352f75d8eec630))
  :named refinement_interpretation_Tm_refine_08c147be678c982b4c352f75d8eec630))
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
;;; Fact-ids: Name FStar.IntegerIntervals.indices_seq; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(80,4-83,6); use=FStar.IntegerIntervals.fst(80,4-83,6)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_17d6a0887ae9558c86dba7da9cd58343 @x2))
     (and
      (HasTypeFuel @u0 @x1 (FStar.Seq.Base.seq U_zero (FStar.IntegerIntervals.under @x2)))
      ;; def=FStar.IntegerIntervals.fst(81,7-81,34); use=FStar.IntegerIntervals.fst(81,7-81,34)
      (= (FStar.Seq.Base.length U_zero (FStar.IntegerIntervals.under @x2) @x1) @x2)
      ;; def=FStar.IntegerIntervals.fst(82,7-82,58); use=FStar.IntegerIntervals.fst(82,7-82,58)
      (forall ((@x3 Term))
       (! (implies
         (HasType @x3 (FStar.IntegerIntervals.under @x2))
         ;; def=FStar.IntegerIntervals.fst(82,29-82,57); use=FStar.IntegerIntervals.fst(82,29-82,57)
         (= (FStar.Seq.Base.index U_zero (FStar.IntegerIntervals.under @x2) @x1 @x3) @x3))
        :qid refinement_interpretation_Tm_refine_17d6a0887ae9558c86dba7da9cd58343.1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_17d6a0887ae9558c86dba7da9cd58343 @x2)))
    :qid refinement_interpretation_Tm_refine_17d6a0887ae9558c86dba7da9cd58343))
  :named refinement_interpretation_Tm_refine_17d6a0887ae9558c86dba7da9cd58343))
; refinement_interpretation
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,40); use=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,40)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,40)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,29)
       (forall ((@x4 Term))
        (! (implies
          (and
           (HasType @x4 Prims.unit)
           ;; def=FStar.Algebra.CommMonoid.Equiv.fst(23,30-23,40); use=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,29)
           (Valid
            ;; def=FStar.Algebra.CommMonoid.Equiv.fst(23,30-23,40); use=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,29)
            (ApplyTT (ApplyTT @x2 @x3) @x3)))
          ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,40)
          (not
           ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,40)
           (= @x4 @x1)))
         :qid refinement_interpretation_Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a.1)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a))
  :named refinement_interpretation_Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a))
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
;;; Fact-ids: Name FStar.Matrix.matrix_of; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(110,63-113,1); use=FStar.Matrix.fsti(110,63-113,1)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_54dbd50028a232789dd68ce8ea833f14 @u2 @x3 @x4 @x5 @x6))
     (and
      (HasTypeFuel @u0 @x1 (FStar.Matrix.matrix @u2 @x5 @x3 @x4))
      ;; def=FStar.Matrix.fsti(111,2-111,59); use=FStar.Matrix.fsti(111,2-111,59)
      (forall ((@x7 Term) (@x8 Term))
       (! (implies
         (and
          (HasType @x7 (FStar.IntegerIntervals.under @x3))
          (HasType @x8 (FStar.IntegerIntervals.under @x4)))
         ;; def=FStar.Matrix.fsti(111,37-111,58); use=FStar.Matrix.fsti(111,37-111,58)
         (= (FStar.Matrix.ijth @u2 @x5 @x3 @x4 @x1 @x7 @x8) (ApplyTT (ApplyTT @x6 @x7) @x8)))
        :qid refinement_interpretation_Tm_refine_54dbd50028a232789dd68ce8ea833f14.1))
      ;; def=FStar.Matrix.fsti(112,2-112,100); use=FStar.Matrix.fsti(112,2-112,100)
      (forall ((@x7 Term))
       (! (implies
         (HasType @x7 (FStar.IntegerIntervals.under (Prims.op_Star @x3 @x4)))
         ;; def=FStar.Matrix.fsti(112,29-112,99); use=FStar.Matrix.fsti(112,29-112,99)
         (=
          (FStar.Seq.Base.index @u2 @x5 (FStar.Matrix.seq_of_matrix @u2 @x5 @x3 @x4 @x1) @x7)
          (ApplyTT (ApplyTT @x6 (FStar.Matrix.get_i @x3 @x4 @x7)) (FStar.Matrix.get_j @x3 @x4 @x7))))
        :qid refinement_interpretation_Tm_refine_54dbd50028a232789dd68ce8ea833f14.2))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_54dbd50028a232789dd68ce8ea833f14 @u2 @x3 @x4 @x5 @x6)))
    :qid refinement_interpretation_Tm_refine_54dbd50028a232789dd68ce8ea833f14))
  :named refinement_interpretation_Tm_refine_54dbd50028a232789dd68ce8ea833f14))
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
;;; Fact-ids: Name FStar.Matrix.ijth; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(100,2-100,58); use=FStar.Matrix.fst(55,4-55,8)
  (forall
    ((@u0 Fuel)
     (@x1 Term)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     (and
      (HasTypeFuel @u0 @x1 @x3)
      ;; def=FStar.Matrix.fsti(100,7-100,56); use=FStar.Matrix.fst(55,4-55,8)
      (=
       @x1
       (FStar.Seq.Base.index
        @u2
        @x3
        (FStar.Matrix.seq_of_matrix @u2 @x3 @x4 @x5 @x6)
        (FStar.Matrix.get_ij @x4 @x5 @x7 @x8)))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db @u2 @x3 @x4 @x5 @x6 @x7 @x8)))
    :qid refinement_interpretation_Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db))
  :named refinement_interpretation_Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db))
; refinement_interpretation
;;; Fact-ids: Name FStar.IntegerIntervals.interval_type; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(35,31-35,80); use=FStar.IntegerIntervals.fst(35,31-35,80)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_97ae7a69cd5f02d44d6644f169486ebb @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (Tm_type U_zero))
      ;; def=FStar.IntegerIntervals.fst(35,42-35,78); use=FStar.IntegerIntervals.fst(35,42-35,78)
      (= @x1 (Tm_refine_fcf1a3596fffd49dd2e91f2678358f19 @x2 @x3))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_97ae7a69cd5f02d44d6644f169486ebb @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_97ae7a69cd5f02d44d6644f169486ebb))
  :named refinement_interpretation_Tm_refine_97ae7a69cd5f02d44d6644f169486ebb))
; refinement_interpretation
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,78); use=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,78)
  (forall
    ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df @u2 @x3 @x4 @x5 @x6 @x7))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,78)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,38)
       (forall ((@x8 Term))
        (! (implies
          (and
           (HasType @x8 Prims.unit)
           ;; def=FStar.Algebra.CommMonoid.Equiv.fst(56,39-56,78); use=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,38)
           (Valid
            ;; def=FStar.Algebra.CommMonoid.Equiv.fst(56,39-56,78); use=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,38)
            (ApplyTT
             (ApplyTT
              (ApplyTT
               (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u2) @x3)
               @x4)
              (ApplyTT (ApplyTT @x5 @x6) @x7))
             (ApplyTT (ApplyTT @x5 @x7) @x6))))
          ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,78)
          (not
           ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,78)
           (= @x8 @x1)))
         :qid refinement_interpretation_Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df.1)))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df @u2 @x3 @x4 @x5 @x6 @x7)))
    :qid refinement_interpretation_Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df))
  :named refinement_interpretation_Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df))
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
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,76); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,76)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_b85d2a162d78f833de0a4223b666960d @x2 @x3 @x4))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,76)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,33)
       (and
        ;; def=FStar.Algebra.CommMonoid.Equiv.fst(24,44-24,54); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,33)
        (Valid
         ;; def=FStar.Algebra.CommMonoid.Equiv.fst(24,44-24,54); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,33)
         (ApplyTT (ApplyTT @x2 @x3) @x4))
        ;; def=Prims.fst(409,36-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,33)
        (forall ((@x5 Term))
         (! (implies
           (and
            (HasType @x5 Prims.unit)
            ;; def=FStar.Algebra.CommMonoid.Equiv.fst(24,65-24,75); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,33)
            (Valid
             ;; def=FStar.Algebra.CommMonoid.Equiv.fst(24,65-24,75); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,33)
             (ApplyTT (ApplyTT @x2 @x4) @x3)))
           ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,76)
           (not
            ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,76)
            (= @x5 @x1)))
          :qid refinement_interpretation_Tm_refine_b85d2a162d78f833de0a4223b666960d.1))))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_b85d2a162d78f833de0a4223b666960d @x2 @x3 @x4)))
    :qid refinement_interpretation_Tm_refine_b85d2a162d78f833de0a4223b666960d))
  :named refinement_interpretation_Tm_refine_b85d2a162d78f833de0a4223b666960d))
; refinement_interpretation
;;; Fact-ids: Name FStar.Matrix.seq_of_matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(93,2-96,4); use=FStar.Matrix.fst(53,4-53,17)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0 @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 (FStar.Seq.Base.seq @u2 @x3))
      ;; def=FStar.Matrix.fsti(94,4-94,19); use=FStar.Matrix.fst(53,4-53,17)
      (= (FStar.Seq.Base.length @u2 @x3 @x1) (Prims.op_Star @x4 @x5))
      ;; def=FStar.Matrix.fsti(95,4-95,102); use=FStar.Matrix.fst(53,4-53,17)
      (forall ((@x6 Term))
       (! (implies
         (HasType @x6 (FStar.IntegerIntervals.under (Prims.op_Star @x4 @x5)))
         ;; def=FStar.Matrix.fsti(95,31-95,101); use=FStar.Matrix.fst(53,4-53,17)
         (=
          (FStar.Seq.Base.index @u2 @x3 @x1 @x6)
          (FStar.Seq.Base.index
           @u2
           @x3
           @x1
           (FStar.Matrix.get_ij
            @x4
            @x5
            (FStar.Matrix.get_i @x4 @x5 @x6)
            (FStar.Matrix.get_j @x4 @x5 @x6)))))
        :qid refinement_interpretation_Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0.1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0 @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0))
  :named refinement_interpretation_Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0))
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
;;; Fact-ids: Name FStar.Matrix.matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(51,20-51,52); use=FStar.Matrix.fst(51,20-51,52)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_c5494133ebeeaeb6939645c40bf85e62 @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 (FStar.Seq.Base.seq @u2 @x3))
      ;; def=FStar.Matrix.fst(51,33-51,50); use=FStar.Matrix.fst(51,33-51,50)
      (= (FStar.Seq.Base.length @u2 @x3 @x1) (Prims.op_Star @x4 @x5))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_c5494133ebeeaeb6939645c40bf85e62 @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_c5494133ebeeaeb6939645c40bf85e62))
  :named refinement_interpretation_Tm_refine_c5494133ebeeaeb6939645c40bf85e62))
; refinement_interpretation
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,87)
  (forall
    ((@u0 Fuel)
     (@x1 Term)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_d70b7477cee9e214d3da094d85921d96 @u2 @x3 @x4 @x5 @x6 @x7 @x8))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,87)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,27)
       (forall ((@x9 Term))
        (! (implies
          (and
           (HasType @x9 Prims.unit)
           ;; def=FStar.Algebra.CommMonoid.Equiv.fst(55,28-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,27)
           (Valid
            ;; def=FStar.Algebra.CommMonoid.Equiv.fst(55,28-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,27)
            (ApplyTT
             (ApplyTT
              (ApplyTT
               (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u2) @x3)
               @x4)
              (ApplyTT (ApplyTT @x5 (ApplyTT (ApplyTT @x5 @x6) @x7)) @x8))
             (ApplyTT (ApplyTT @x5 @x6) (ApplyTT (ApplyTT @x5 @x7) @x8)))))
          ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,87)
          (not
           ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,87)
           (= @x9 @x1)))
         :qid refinement_interpretation_Tm_refine_d70b7477cee9e214d3da094d85921d96.1)))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_d70b7477cee9e214d3da094d85921d96 @u2 @x3 @x4 @x5 @x6 @x7 @x8)))
    :qid refinement_interpretation_Tm_refine_d70b7477cee9e214d3da094d85921d96))
  :named refinement_interpretation_Tm_refine_d70b7477cee9e214d3da094d85921d96))
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
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,143); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,143)
  (forall
    ((@u0 Fuel)
     (@x1 Term)
     (@u2 Universe)
     (@x3 Term)
     (@x4 Term)
     (@x5 Term)
     (@x6 Term)
     (@x7 Term)
     (@x8 Term)
     (@x9 Term))
   (! (iff
     (HasTypeFuel
      @u0
      @x1
      (Tm_refine_ed6514ea2e57229a44a63744c80130cd @u2 @x3 @x4 @x5 @x6 @x7 @x8 @x9))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,143)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
       (and
        ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,61-57,76); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
        (Valid
         ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,61-57,76); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
         (ApplyTT
          (ApplyTT
           (ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u2) @x3) @x4)
           @x5)
          @x6))
        ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,80-57,95); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
        (Valid
         ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,80-57,95); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
         (ApplyTT
          (ApplyTT
           (ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u2) @x3) @x4)
           @x7)
          @x8))
        ;; def=Prims.fst(409,36-409,97); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
        (forall ((@x10 Term))
         (! (implies
           (and
            (HasType @x10 Prims.unit)
            ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,107-57,142); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
            (Valid
             ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,107-57,142); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,49)
             (ApplyTT
              (ApplyTT
               (ApplyTT
                (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u2) @x3)
                @x4)
               (ApplyTT (ApplyTT @x9 @x5) @x7))
              (ApplyTT (ApplyTT @x9 @x6) @x8))))
           ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,143)
           (not
            ;; def=Prims.fst(588,86-588,93); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,143)
            (= @x10 @x1)))
          :qid refinement_interpretation_Tm_refine_ed6514ea2e57229a44a63744c80130cd.1))))))
    :pattern
     ((HasTypeFuel
       @u0
       @x1
       (Tm_refine_ed6514ea2e57229a44a63744c80130cd @u2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)))
    :qid refinement_interpretation_Tm_refine_ed6514ea2e57229a44a63744c80130cd))
  :named refinement_interpretation_Tm_refine_ed6514ea2e57229a44a63744c80130cd))
; refinement_interpretation
;;; Fact-ids: Name FStar.IntegerIntervals.interval_type; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(35,47-35,78); use=FStar.IntegerIntervals.fst(35,47-35,78)
  (forall ((@u0 Fuel) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_fcf1a3596fffd49dd2e91f2678358f19 @x2 @x3))
     (and
      (HasTypeFuel @u0 @x1 Prims.int)
      ;; def=FStar.IntegerIntervals.fst(35,53-35,77); use=FStar.IntegerIntervals.fst(35,53-35,77)
      (BoxBool_proj_0 (FStar.IntegerIntervals.interval_condition @x2 @x3 @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_fcf1a3596fffd49dd2e91f2678358f19 @x2 @x3)))
    :qid refinement_interpretation_Tm_refine_fcf1a3596fffd49dd2e91f2678358f19))
  :named refinement_interpretation_Tm_refine_fcf1a3596fffd49dd2e91f2678358f19))
; refinement kinding
;;; Fact-ids: Name Prims.nonzero; Namespace Prims
(assert
 (! (HasType Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_0766302b68bb44ab7aff8c4d8be0b46f))
; refinement kinding
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,60); use=FStar.Algebra.CommMonoid.Equiv.fst(53,23-53,60)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (HasType (Tm_refine_079809d6a4568acb4adbe11585a669ef @u0 @x1 @x2 @x3 @x4 @x5) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_079809d6a4568acb4adbe11585a669ef @u0 @x1 @x2 @x3 @x4 @x5) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_079809d6a4568acb4adbe11585a669ef))
  :named refinement_kinding_Tm_refine_079809d6a4568acb4adbe11585a669ef))
; refinement kinding
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,99); use=FStar.Algebra.CommMonoid.Equiv.fst(25,39-25,99)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_08c147be678c982b4c352f75d8eec630 @x0 @x1 @x2 @x3) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_08c147be678c982b4c352f75d8eec630 @x0 @x1 @x2 @x3) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_08c147be678c982b4c352f75d8eec630))
  :named refinement_kinding_Tm_refine_08c147be678c982b4c352f75d8eec630))
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
;;; Fact-ids: Name FStar.IntegerIntervals.indices_seq; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(80,4-83,6); use=FStar.IntegerIntervals.fst(80,4-83,6)
  (forall ((@x0 Term))
   (! (HasType (Tm_refine_17d6a0887ae9558c86dba7da9cd58343 @x0) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_17d6a0887ae9558c86dba7da9cd58343 @x0) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_17d6a0887ae9558c86dba7da9cd58343))
  :named refinement_kinding_Tm_refine_17d6a0887ae9558c86dba7da9cd58343))
; refinement kinding
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,40); use=FStar.Algebra.CommMonoid.Equiv.fst(23,24-23,40)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a))
  :named refinement_kinding_Tm_refine_427dfeb6a3d9b68cc7798a759cd6675a))
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
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Tm_refine_542f9d4f129664613f2483a6c88bc7c2 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
; refinement kinding
;;; Fact-ids: Name FStar.Matrix.matrix_of; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(110,63-113,1); use=FStar.Matrix.fsti(110,63-113,1)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (HasType (Tm_refine_54dbd50028a232789dd68ce8ea833f14 @u0 @x1 @x2 @x3 @x4) (Tm_type @u0))
    :pattern
     ((HasType (Tm_refine_54dbd50028a232789dd68ce8ea833f14 @u0 @x1 @x2 @x3 @x4) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_54dbd50028a232789dd68ce8ea833f14))
  :named refinement_kinding_Tm_refine_54dbd50028a232789dd68ce8ea833f14))
; refinement kinding
;;; Fact-ids: Name Prims.pos; Namespace Prims
(assert
 (! (HasType Tm_refine_774ba3f728d91ead8ef40be66c9802e5 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_774ba3f728d91ead8ef40be66c9802e5))
; refinement kinding
;;; Fact-ids: Name FStar.Matrix.ijth; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(100,2-100,58); use=FStar.Matrix.fst(55,4-55,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (HasType
     (Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db @u0 @x1 @x2 @x3 @x4 @x5 @x6)
     (Tm_type @u0))
    :pattern
     ((HasType
       (Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db @u0 @x1 @x2 @x3 @x4 @x5 @x6)
       (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db))
  :named refinement_kinding_Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db))
; refinement kinding
;;; Fact-ids: Name FStar.IntegerIntervals.interval_type; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(35,31-35,80); use=FStar.IntegerIntervals.fst(35,31-35,80)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_97ae7a69cd5f02d44d6644f169486ebb @x0 @x1) (Tm_type (U_succ U_zero)))
    :pattern
     ((HasType (Tm_refine_97ae7a69cd5f02d44d6644f169486ebb @x0 @x1) (Tm_type (U_succ U_zero))))
    :qid refinement_kinding_Tm_refine_97ae7a69cd5f02d44d6644f169486ebb))
  :named refinement_kinding_Tm_refine_97ae7a69cd5f02d44d6644f169486ebb))
; refinement kinding
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,78); use=FStar.Algebra.CommMonoid.Equiv.fst(56,33-56,78)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (HasType (Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df @u0 @x1 @x2 @x3 @x4 @x5) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df @u0 @x1 @x2 @x3 @x4 @x5) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df))
  :named refinement_kinding_Tm_refine_98bfb9c4a1d28a0a144569c7964ea8df))
; refinement kinding
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Tm_refine_9d6af3f3535473623f7aec2f0501897f (Tm_type (U_succ U_zero)))
  :named refinement_kinding_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; refinement kinding
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,76); use=FStar.Algebra.CommMonoid.Equiv.fst(24,28-24,76)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (HasType (Tm_refine_b85d2a162d78f833de0a4223b666960d @x0 @x1 @x2) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_b85d2a162d78f833de0a4223b666960d @x0 @x1 @x2) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_b85d2a162d78f833de0a4223b666960d))
  :named refinement_kinding_Tm_refine_b85d2a162d78f833de0a4223b666960d))
; refinement kinding
;;; Fact-ids: Name FStar.Matrix.seq_of_matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(93,2-96,4); use=FStar.Matrix.fst(53,4-53,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0 @u0 @x1 @x2 @x3) (Tm_type @u0))
    :pattern ((HasType (Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0 @u0 @x1 @x2 @x3) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0))
  :named refinement_kinding_Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0))
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
;;; Fact-ids: Name FStar.Matrix.matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(51,20-51,52); use=FStar.Matrix.fst(51,20-51,52)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_c5494133ebeeaeb6939645c40bf85e62 @u0 @x1 @x2 @x3) (Tm_type @u0))
    :pattern ((HasType (Tm_refine_c5494133ebeeaeb6939645c40bf85e62 @u0 @x1 @x2 @x3) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_c5494133ebeeaeb6939645c40bf85e62))
  :named refinement_kinding_Tm_refine_c5494133ebeeaeb6939645c40bf85e62))
; refinement kinding
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,87); use=FStar.Algebra.CommMonoid.Equiv.fst(55,22-55,87)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (HasType
     (Tm_refine_d70b7477cee9e214d3da094d85921d96 @u0 @x1 @x2 @x3 @x4 @x5 @x6)
     (Tm_type U_zero))
    :pattern
     ((HasType
       (Tm_refine_d70b7477cee9e214d3da094d85921d96 @u0 @x1 @x2 @x3 @x4 @x5 @x6)
       (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_d70b7477cee9e214d3da094d85921d96))
  :named refinement_kinding_Tm_refine_d70b7477cee9e214d3da094d85921d96))
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
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,143); use=FStar.Algebra.CommMonoid.Equiv.fst(57,44-57,143)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (HasType
     (Tm_refine_ed6514ea2e57229a44a63744c80130cd @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)
     (Tm_type U_zero))
    :pattern
     ((HasType
       (Tm_refine_ed6514ea2e57229a44a63744c80130cd @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)
       (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_ed6514ea2e57229a44a63744c80130cd))
  :named refinement_kinding_Tm_refine_ed6514ea2e57229a44a63744c80130cd))
; refinement kinding
;;; Fact-ids: Name FStar.IntegerIntervals.interval_type; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(35,47-35,78); use=FStar.IntegerIntervals.fst(35,47-35,78)
  (forall ((@x0 Term) (@x1 Term))
   (! (HasType (Tm_refine_fcf1a3596fffd49dd2e91f2678358f19 @x0 @x1) (Tm_type U_zero))
    :pattern ((HasType (Tm_refine_fcf1a3596fffd49dd2e91f2678358f19 @x0 @x1) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_fcf1a3596fffd49dd2e91f2678358f19))
  :named refinement_kinding_Tm_refine_fcf1a3596fffd49dd2e91f2678358f19))
; subterm ordering
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6); use=FStar.Algebra.CommMonoid.Equiv.fst(50,4-50,6)
  (forall
    ((@u0 Fuel)
     (@u1 Universe)
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
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)
      (FStar.Algebra.CommMonoid.Equiv.cm @u1 @x10 @x11))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x4
        (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x5
        (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x6
        (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x7
        (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x8
        (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x9
        (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Algebra.CommMonoid.Equiv.CM @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8 @x9)
       (FStar.Algebra.CommMonoid.Equiv.cm @u1 @x10 @x11)))
    :qid subterm_ordering_FStar.Algebra.CommMonoid.Equiv.CM))
  :named subterm_ordering_FStar.Algebra.CommMonoid.Equiv.CM))
; subterm ordering
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6); use=FStar.Algebra.CommMonoid.Equiv.fst(21,4-21,6)
  (forall
    ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)
      (FStar.Algebra.CommMonoid.Equiv.equiv @u1 @x7))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x3
        (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x4
        (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x5
        (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x6
        (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Algebra.CommMonoid.Equiv.EQ @u1 @x2 @x3 @x4 @x5 @x6)
       (FStar.Algebra.CommMonoid.Equiv.equiv @u1 @x7)))
    :qid subterm_ordering_FStar.Algebra.CommMonoid.Equiv.EQ))
  :named subterm_ordering_FStar.Algebra.CommMonoid.Equiv.EQ))
; Name-token correspondence
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6); use=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6); use=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6)
    (forall ((@x1 Term) (@x2 Term))
     (! (=
       (ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u0) @x1) @x2)
       (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2))
      :pattern
       ((ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u0) @x1) @x2))
      :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2))
      :qid token_correspondence_FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq.1))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq@tok @u0))
    :qid token_correspondence_FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq))
  :named token_correspondence_FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq))
; name-token correspondence
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.cm; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.CM; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7); use=FStar.Algebra.CommMonoid.Equiv.fst(49,5-49,7)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.cm@tok @u0) @x1) @x2)
     (FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2))
    :pattern ((ApplyTT (ApplyTT (FStar.Algebra.CommMonoid.Equiv.cm@tok @u0) @x1) @x2))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2))
    :qid token_correspondence_FStar.Algebra.CommMonoid.Equiv.cm@tok))
  :named token_correspondence_FStar.Algebra.CommMonoid.Equiv.cm@tok))
; name-token correspondence
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.equiv; Namespace FStar.Algebra.CommMonoid.Equiv; Name FStar.Algebra.CommMonoid.Equiv.EQ; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10); use=FStar.Algebra.CommMonoid.Equiv.fst(20,5-20,10)
  (forall ((@u0 Universe) (@x1 Term))
   (! (=
     (ApplyTT (FStar.Algebra.CommMonoid.Equiv.equiv@tok @u0) @x1)
     (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1))
    :pattern ((ApplyTT (FStar.Algebra.CommMonoid.Equiv.equiv@tok @u0) @x1))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1))
    :qid token_correspondence_FStar.Algebra.CommMonoid.Equiv.equiv@tok))
  :named token_correspondence_FStar.Algebra.CommMonoid.Equiv.equiv@tok))
; Name-token correspondence
;;; Fact-ids: Name Prims.op_Addition; Namespace Prims
(assert
 (! ;; def=Prims.fst(520,4-520,15); use=Prims.fst(520,4-520,15)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (ApplyTT (ApplyTT Prims.op_Addition@tok @x0) @x1) (Prims.op_Addition @x0 @x1))
    :pattern ((ApplyTT (ApplyTT Prims.op_Addition@tok @x0) @x1))
    :qid token_correspondence_Prims.op_Addition))
  :named token_correspondence_Prims.op_Addition))
; Name-token correspondence
;;; Fact-ids: Name Prims.op_Star; Namespace Prims
(assert
 (! ;; def=Prims.fst(508,4-508,11); use=Prims.fst(508,4-508,11)
  (forall ((@x0 Term) (@x1 Term))
   (! (= (ApplyTT (ApplyTT Prims.op_Star@tok @x0) @x1) (Prims.op_Star @x0 @x1))
    :pattern ((ApplyTT (ApplyTT Prims.op_Star@tok @x0) @x1))
    :qid token_correspondence_Prims.op_Star))
  :named token_correspondence_Prims.op_Star))
; True interpretation
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert (! (Valid Prims.l_True) :named true_interp))
; free var typing
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(51,4-51,8); use=FStar.Algebra.CommMonoid.Equiv.fst(51,4-51,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1))
      (HasType @x3 (FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2)))
     (HasType (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit @u0 @x1 @x2 @x3) @x1))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit @u0 @x1 @x2 @x3))
    :qid typing_FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit))
  :named typing_FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit))
; free var typing
;;; Fact-ids: Name FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq; Namespace FStar.Algebra.CommMonoid.Equiv
(assert
 (! ;; def=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6); use=FStar.Algebra.CommMonoid.Equiv.fst(22,4-22,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1)))
     (HasType
      (FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2)
      (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x1 @u0)))
    :pattern ((FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq @u0 @x1 @x2))
    :qid typing_FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq))
  :named typing_FStar.Algebra.CommMonoid.Equiv.__proj__EQ__item__eq))
; free var typing
;;; Fact-ids: Name FStar.IntegerIntervals.indices_seq; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(79,4-79,15); use=FStar.IntegerIntervals.fst(79,4-79,15)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.nat)
     (HasType
      (FStar.IntegerIntervals.indices_seq @x0)
      (Tm_refine_17d6a0887ae9558c86dba7da9cd58343 @x0)))
    :pattern ((FStar.IntegerIntervals.indices_seq @x0))
    :qid typing_FStar.IntegerIntervals.indices_seq))
  :named typing_FStar.IntegerIntervals.indices_seq))
; free var typing
;;; Fact-ids: Name FStar.IntegerIntervals.interval; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(38,5-38,13); use=FStar.IntegerIntervals.fst(38,5-38,13)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType
      (FStar.IntegerIntervals.interval @x0 @x1)
      (FStar.IntegerIntervals.interval_type @x0 @x1)))
    :pattern ((FStar.IntegerIntervals.interval @x0 @x1))
    :qid typing_FStar.IntegerIntervals.interval))
  :named typing_FStar.IntegerIntervals.interval))
; free var typing
;;; Fact-ids: Name FStar.IntegerIntervals.interval_condition; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(33,4-33,22); use=FStar.IntegerIntervals.fst(33,4-33,22)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int) (HasType @x2 Prims.int))
     (HasType (FStar.IntegerIntervals.interval_condition @x0 @x1 @x2) Prims.bool))
    :pattern ((FStar.IntegerIntervals.interval_condition @x0 @x1 @x2))
    :qid typing_FStar.IntegerIntervals.interval_condition))
  :named typing_FStar.IntegerIntervals.interval_condition))
; free var typing
;;; Fact-ids: Name FStar.IntegerIntervals.interval_type; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(35,5-35,18); use=FStar.IntegerIntervals.fst(35,5-35,18)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.int) (HasType @x1 Prims.int))
     (HasType (FStar.IntegerIntervals.interval_type @x0 @x1) (Tm_type (U_succ U_zero))))
    :pattern ((FStar.IntegerIntervals.interval_type @x0 @x1))
    :qid typing_FStar.IntegerIntervals.interval_type))
  :named typing_FStar.IntegerIntervals.interval_type))
; free var typing
;;; Fact-ids: Name FStar.IntegerIntervals.under; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(47,5-47,10); use=FStar.IntegerIntervals.fst(47,5-47,10)
  (forall ((@x0 Term))
   (! (implies
     (HasType @x0 Prims.nat)
     (HasType
      (FStar.IntegerIntervals.under @x0)
      (FStar.IntegerIntervals.interval_type (BoxInt 0) @x0)))
    :pattern ((FStar.IntegerIntervals.under @x0))
    :qid typing_FStar.IntegerIntervals.under))
  :named typing_FStar.IntegerIntervals.under))
; free var typing
;;; Fact-ids: Name FStar.Matrix.get_i; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(54,4-54,9); use=FStar.Matrix.fsti(54,4-54,9)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 Prims.pos)
      (HasType @x2 (FStar.IntegerIntervals.under (Prims.op_Star @x0 @x1))))
     (HasType (FStar.Matrix.get_i @x0 @x1 @x2) (FStar.IntegerIntervals.under @x0)))
    :pattern ((FStar.Matrix.get_i @x0 @x1 @x2))
    :qid typing_FStar.Matrix.get_i))
  :named typing_FStar.Matrix.get_i))
; free var typing
;;; Fact-ids: Name FStar.Matrix.get_ij; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(49,4-49,10); use=FStar.Matrix.fsti(49,4-49,10)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 Prims.pos)
      (HasType @x2 (FStar.IntegerIntervals.under @x0))
      (HasType @x3 (FStar.IntegerIntervals.under @x1)))
     (HasType
      (FStar.Matrix.get_ij @x0 @x1 @x2 @x3)
      (FStar.IntegerIntervals.under (Prims.op_Star @x0 @x1))))
    :pattern ((FStar.Matrix.get_ij @x0 @x1 @x2 @x3))
    :qid typing_FStar.Matrix.get_ij))
  :named typing_FStar.Matrix.get_ij))
; free var typing
;;; Fact-ids: Name FStar.Matrix.get_j; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(55,4-55,9); use=FStar.Matrix.fsti(55,4-55,9)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x0 Prims.pos)
      (HasType @x1 Prims.pos)
      (HasType @x2 (FStar.IntegerIntervals.under (Prims.op_Star @x0 @x1))))
     (HasType (FStar.Matrix.get_j @x0 @x1 @x2) (FStar.IntegerIntervals.under @x1)))
    :pattern ((FStar.Matrix.get_j @x0 @x1 @x2))
    :qid typing_FStar.Matrix.get_j))
  :named typing_FStar.Matrix.get_j))
; free var typing
;;; Fact-ids: Name FStar.Matrix.ijth; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(55,4-55,8); use=FStar.Matrix.fst(55,4-55,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.pos)
      (HasType @x3 Prims.pos)
      (HasType @x4 (FStar.Matrix.matrix @u0 @x1 @x2 @x3))
      (HasType @x5 (FStar.IntegerIntervals.under @x2))
      (HasType @x6 (FStar.IntegerIntervals.under @x3)))
     (HasType
      (FStar.Matrix.ijth @u0 @x1 @x2 @x3 @x4 @x5 @x6)
      (Tm_refine_7c067c17a9f6e5c93ba9f986b521b9db @u0 @x1 @x2 @x3 @x4 @x5 @x6)))
    :pattern ((FStar.Matrix.ijth @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid typing_FStar.Matrix.ijth))
  :named typing_FStar.Matrix.ijth))
; free var typing
;;; Fact-ids: Name FStar.Matrix.init; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(73,4-73,8); use=FStar.Matrix.fst(73,4-73,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.pos)
      (HasType @x3 Prims.pos)
      (HasType @x4 (FStar.Matrix.matrix_generator @u0 @x1 @x2 @x3)))
     (HasType (FStar.Matrix.init @u0 @x1 @x2 @x3 @x4) (FStar.Matrix.matrix_of @u0 @x1 @x2 @x3 @x4)))
    :pattern ((FStar.Matrix.init @u0 @x1 @x2 @x3 @x4))
    :qid typing_FStar.Matrix.init))
  :named typing_FStar.Matrix.init))
; free var typing
;;; Fact-ids: Name FStar.Matrix.matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(51,5-51,11); use=FStar.Matrix.fst(51,5-51,11)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 Prims.pos) (HasType @x3 Prims.pos))
     (HasType (FStar.Matrix.matrix @u0 @x1 @x2 @x3) (Tm_type @u0)))
    :pattern ((FStar.Matrix.matrix @u0 @x1 @x2 @x3))
    :qid typing_FStar.Matrix.matrix))
  :named typing_FStar.Matrix.matrix))
; free var typing
;;; Fact-ids: Name FStar.Matrix.matrix_generator; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(37,5-37,21); use=FStar.Matrix.fsti(37,5-37,21)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 Prims.pos) (HasType @x3 Prims.pos))
     (HasType (FStar.Matrix.matrix_generator @u0 @x1 @x2 @x3) (Tm_type @u0)))
    :pattern ((FStar.Matrix.matrix_generator @u0 @x1 @x2 @x3))
    :qid typing_FStar.Matrix.matrix_generator))
  :named typing_FStar.Matrix.matrix_generator))
; free var typing
;;; Fact-ids: Name FStar.Matrix.matrix_mul_unit; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(325,4-325,19); use=FStar.Matrix.fsti(325,4-325,19)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.Algebra.CommMonoid.Equiv.equiv @u0 @x1))
      (HasType @x3 (FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2))
      (HasType @x4 (FStar.Algebra.CommMonoid.Equiv.cm @u0 @x1 @x2))
      (HasType @x5 Prims.pos))
     (HasType
      (FStar.Matrix.matrix_mul_unit @u0 @x1 @x2 @x3 @x4 @x5)
      (FStar.Matrix.matrix @u0 @x1 @x5 @x5)))
    :pattern ((FStar.Matrix.matrix_mul_unit @u0 @x1 @x2 @x3 @x4 @x5))
    :qid typing_FStar.Matrix.matrix_mul_unit))
  :named typing_FStar.Matrix.matrix_mul_unit))
; free var typing
;;; Fact-ids: Name FStar.Matrix.matrix_of; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(110,5-110,14); use=FStar.Matrix.fsti(110,5-110,14)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.pos)
      (HasType @x3 Prims.pos)
      (HasType @x4 (FStar.Matrix.matrix_generator @u0 @x1 @x2 @x3)))
     (HasType (FStar.Matrix.matrix_of @u0 @x1 @x2 @x3 @x4) (Tm_type @u0)))
    :pattern ((FStar.Matrix.matrix_of @u0 @x1 @x2 @x3 @x4))
    :qid typing_FStar.Matrix.matrix_of))
  :named typing_FStar.Matrix.matrix_of))
; free var typing
;;; Fact-ids: Name FStar.Matrix.row; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(225,4-225,7); use=FStar.Matrix.fsti(225,4-225,7)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.pos)
      (HasType @x3 Prims.pos)
      (HasType @x4 (FStar.Matrix.matrix @u0 @x1 @x2 @x3))
      (HasType @x5 (FStar.IntegerIntervals.under @x2)))
     (HasType (FStar.Matrix.row @u0 @x1 @x2 @x3 @x4 @x5) (FStar.Seq.Base.seq @u0 @x1)))
    :pattern ((FStar.Matrix.row @u0 @x1 @x2 @x3 @x4 @x5))
    :qid typing_FStar.Matrix.row))
  :named typing_FStar.Matrix.row))
; free var typing
;;; Fact-ids: Name FStar.Matrix.seq_of_matrix; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(53,4-53,17); use=FStar.Matrix.fst(53,4-53,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.pos)
      (HasType @x3 Prims.pos)
      (HasType @x4 (FStar.Matrix.matrix @u0 @x1 @x2 @x3)))
     (HasType
      (FStar.Matrix.seq_of_matrix @u0 @x1 @x2 @x3 @x4)
      (Tm_refine_bcdb054c1bdf0a6970243b8aab50e2d0 @u0 @x1 @x2 @x3)))
    :pattern ((FStar.Matrix.seq_of_matrix @u0 @x1 @x2 @x3 @x4))
    :qid typing_FStar.Matrix.seq_of_matrix))
  :named typing_FStar.Matrix.seq_of_matrix))
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
;;; Fact-ids: Name FStar.Seq.Base.init; Namespace FStar.Seq.Base
(assert
 (! ;; def=FStar.Seq.Base.fsti(39,26-39,30); use=FStar.Seq.Base.fsti(39,26-39,30)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 Prims.nat)
      (HasType @x3 (Tm_arrow_6d76c8e4fc59503348e55fc915188ea1 @x2 @x1 @u0)))
     (HasType (FStar.Seq.Base.init @u0 @x1 @x2 @x3) (FStar.Seq.Base.seq @u0 @x1)))
    :pattern ((FStar.Seq.Base.init @u0 @x1 @x2 @x3))
    :qid typing_FStar.Seq.Base.init))
  :named typing_FStar.Seq.Base.init))
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
;;; Fact-ids: Name FStar.Seq.Properties.map_seq; Namespace FStar.Seq.Properties
(assert
 (! ;; def=FStar.Seq.Properties.fsti(752,4-752,11); use=FStar.Seq.Properties.fsti(752,4-752,11)
  (forall ((@u0 Universe) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasType @x2 (Tm_type @u0))
      (HasType @x3 (Tm_type @u1))
      (HasType @x4 (Tm_arrow_57cf062ad88ff86192177a2ff1a1d94c @x2 @x3 @u0 @u1))
      (HasType @x5 (FStar.Seq.Base.seq @u0 @x2)))
     (HasType (FStar.Seq.Properties.map_seq @u0 @u1 @x2 @x3 @x4 @x5) (FStar.Seq.Base.seq @u1 @x3)))
    :pattern ((FStar.Seq.Properties.map_seq @u0 @u1 @x2 @x3 @x4 @x5))
    :qid typing_FStar.Seq.Properties.map_seq))
  :named typing_FStar.Seq.Properties.map_seq))
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
; typing_Tm_abs_07607a90cdec640007c6e8f2e5d63494
;;; Fact-ids: Name FStar.IntegerIntervals.indices_seq; Namespace FStar.IntegerIntervals
(assert
 (! ;; def=FStar.IntegerIntervals.fst(84,32-84,33); use=FStar.IntegerIntervals.fst(84,46-84,47)
  (forall ((@x0 Term))
   (! (HasType
     (Tm_abs_07607a90cdec640007c6e8f2e5d63494 @x0)
     (Tm_arrow_257a53890f49995b0f689694ec797771 @x0))
    :pattern ((Tm_abs_07607a90cdec640007c6e8f2e5d63494 @x0))
    :qid typing_Tm_abs_07607a90cdec640007c6e8f2e5d63494))
  :named typing_Tm_abs_07607a90cdec640007c6e8f2e5d63494))
; typing_Tm_abs_7794e091436089522f6291c350690dfa
;;; Fact-ids: Name FStar.Matrix.matrix_mul_unit; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(326,36-326,70); use=FStar.Matrix.fsti(326,36-326,70)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (HasType
     (Tm_abs_7794e091436089522f6291c350690dfa @x0 @x1 @u2 @x3 @x4 @x5)
     (Tm_arrow_1386a01ae45d6b0a21e661ecef87bf65 @x0 @x1 @u2))
    :pattern ((Tm_abs_7794e091436089522f6291c350690dfa @x0 @x1 @u2 @x3 @x4 @x5))
    :qid typing_Tm_abs_7794e091436089522f6291c350690dfa))
  :named typing_Tm_abs_7794e091436089522f6291c350690dfa))
; typing_Tm_abs_938e0f44b4a93213a875f12294289ff4
;;; Fact-ids: Name FStar.Matrix.row; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fsti(225,82-225,93); use=FStar.Matrix.fsti(225,82-225,93)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (HasType
     (Tm_abs_938e0f44b4a93213a875f12294289ff4 @x0 @x1 @u2 @x3 @x4 @x5)
     (Tm_arrow_7b78a134b3e9e8d98968a36e38b1110c @x0 @x1 @u2))
    :pattern ((Tm_abs_938e0f44b4a93213a875f12294289ff4 @x0 @x1 @u2 @x3 @x4 @x5))
    :qid typing_Tm_abs_938e0f44b4a93213a875f12294289ff4))
  :named typing_Tm_abs_938e0f44b4a93213a875f12294289ff4))
; typing_Tm_abs_c9ff1344e6045730d5ebd5616437488c
;;; Fact-ids: Name FStar.Matrix.init; Namespace FStar.Matrix
(assert
 (! ;; def=FStar.Matrix.fst(76,24-76,63); use=FStar.Matrix.fst(76,24-76,63)
  (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@u3 Universe) (@x4 Term))
   (! (HasType
     (Tm_abs_c9ff1344e6045730d5ebd5616437488c @x0 @x1 @x2 @u3 @x4)
     (Tm_arrow_a9b50d858f6eb2c2abc0beb16942d35d @x0 @x1 @x2 @u3))
    :pattern ((Tm_abs_c9ff1344e6045730d5ebd5616437488c @x0 @x1 @x2 @u3 @x4))
    :qid typing_Tm_abs_c9ff1344e6045730d5ebd5616437488c))
  :named typing_Tm_abs_c9ff1344e6045730d5ebd5616437488c))
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
; Starting query at FStar.Matrix.fst(731,2-736,54)
; universe local constant
(declare-fun uu___588 () Universe)
(declare-fun label_25 () Bool)
(declare-fun label_24 () Bool)
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
(declare-fun Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9 () Term)
; refinement kinding
;;; Fact-ids: 
(assert
 (! (HasType Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
; refinement_interpretation
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Matrix.fst(725,4-730,46); use=FStar.Matrix.fst(731,2-736,54)
  (forall ((@u0 Fuel) (@x1 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9)
     (HasTypeFuel @u0 @x1 Prims.unit))
    :pattern ((HasTypeFuel @u0 @x1 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
    :qid refinement_interpretation_Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
  :named refinement_interpretation_Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
; haseq for Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9
;;; Fact-ids: 
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
   (Valid (Prims.hasEq U_zero Prims.unit)))
  :named haseqTm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9))
; Encoding query formula : forall (c: Type)
;   (eq: FStar.Algebra.CommMonoid.Equiv.equiv c)
;   (m: Prims.nat)
;   (add: FStar.Algebra.CommMonoid.Equiv.cm c eq)
;   (mul: FStar.Algebra.CommMonoid.Equiv.cm c eq)
;   (i: FStar.IntegerIntervals.under m).
;   (forall (_: Prims.squash Prims.l_True).
;       (* - Could not prove post-condition *)
;       (m >= 0 ==> m > 0) /\
;       (forall (any_result: Prims.nat).
;           m == any_result ==>
;           (m >= 0 ==> m > 0) /\
;           (forall (any_result: Prims.nat).
;               m == any_result ==>
;               (m >= 0 ==> m > 0) /\
;               (forall (any_result: Prims.nat).
;                   m == any_result ==>
;                   (forall (any_result: FStar.Matrix.matrix c m m).
;                       FStar.Matrix.matrix_mul_unit add mul m == any_result ==>
;                       (forall (any_result: FStar.Seq.Base.seq c).
;                           FStar.Matrix.row (FStar.Matrix.matrix_mul_unit add mul m) i == any_result ==>
;                           (FStar.IntegerIntervals.interval_condition 0 m i ==> i >= 0) /\
;                           (forall (any_result: FStar.IntegerIntervals.under m).
;                               i == any_result ==>
;                               (forall (any_result: FStar.Seq.Base.seq c).
;                                   FStar.Seq.Base.create i add.unit == any_result ==> m - i - 1 >= 0)
;                           )))))) /\
;       (FStar.Matrix.row (FStar.Matrix.matrix_mul_unit add mul m) i ==
;         FStar.Seq.Base.append (FStar.Seq.Base.create i add.unit)
;           (FStar.Seq.Base.append (FStar.Seq.Base.create 1 mul.unit)
;               (FStar.Seq.Base.create (m - i - 1) add.unit)) ==>
;         (m >= 0 ==> m > 0) /\
;         (forall (any_result: Prims.nat).
;             m == any_result ==>
;             (m >= 0 ==> m > 0) /\
;             (forall (any_result: Prims.nat).
;                 m == any_result ==>
;                 (m >= 0 ==> m > 0) /\
;                 (forall (any_result: Prims.nat).
;                     m == any_result ==>
;                     (forall (any_result: FStar.Matrix.matrix c m m).
;                         FStar.Matrix.matrix_mul_unit add mul m == any_result ==>
;                         (forall (any_result: FStar.Seq.Base.seq c).
;                             FStar.Matrix.row (FStar.Matrix.matrix_mul_unit add mul m) i ==
;                             any_result ==>
;                             (FStar.IntegerIntervals.interval_condition 0 m i ==> i >= 0) /\
;                             (forall (any_result: FStar.IntegerIntervals.under m).
;                                 i == any_result ==>
;                                 (forall (any_result: FStar.Seq.Base.seq c).
;                                     FStar.Seq.Base.create i add.unit == any_result ==>
;                                     (forall (any_result: FStar.Seq.Base.seq c).
;                                         FStar.Seq.Base.append (FStar.Seq.Base.create i add.unit)
;                                           (FStar.Seq.Base.create 1 mul.unit) ==
;                                         any_result ==>
;                                         m - i - 1 >= 0)))))))))) /\
;   (forall (p: Prims.pure_post Prims.unit).
;       (forall (pure_result: Prims.unit).
;           FStar.Matrix.row (FStar.Matrix.matrix_mul_unit add mul m) i ==
;           FStar.Seq.Base.append (FStar.Seq.Base.create i add.unit)
;             (FStar.Seq.Base.append (FStar.Seq.Base.create 1 mul.unit)
;                 (FStar.Seq.Base.create (m - i - 1) add.unit)) /\
;           FStar.Matrix.row (FStar.Matrix.matrix_mul_unit add mul m) i ==
;           FStar.Seq.Base.append (FStar.Seq.Base.append (FStar.Seq.Base.create i add.unit)
;                 (FStar.Seq.Base.create 1 mul.unit))
;             (FStar.Seq.Base.create (m - i - 1) add.unit) ==>
;           p pure_result) ==>
;       (FStar.IntegerIntervals.interval_condition 0 m i ==> i >= 0) /\
;       (forall (any_result: FStar.IntegerIntervals.under m).
;           i == any_result ==>
;           (forall (any_result: FStar.Seq.Base.seq c).
;               FStar.Seq.Base.create i add.unit == any_result ==>
;               (forall (any_result: FStar.Seq.Base.seq c).
;                   FStar.Seq.Base.append (FStar.Seq.Base.create i add.unit)
;                     (FStar.Seq.Base.create 1 mul.unit) ==
;                   any_result ==>
;                   m - i - 1 >= 0 /\
;                   (forall (return_val: Prims.nat).
;                       return_val == m - i - 1 ==>
;                       (forall (any_result: FStar.Seq.Base.seq c).
;                           FStar.Seq.Base.create (m - i - 1) add.unit == any_result ==>
;                           (forall (any_result: FStar.Seq.Base.seq c).
;                               FStar.Seq.Base.append (FStar.Seq.Base.append (FStar.Seq.Base.create i
;                                         add.unit)
;                                     (FStar.Seq.Base.create 1 mul.unit))
;                                 (FStar.Seq.Base.create (m - i - 1) add.unit) ==
;                               any_result ==>
;                               (m >= 0 ==> m > 0) /\
;                               (forall (any_result: Prims.nat).
;                                   m == any_result ==>
;                                   (m >= 0 ==> m > 0) /\
;                                   (forall (any_result: Prims.nat).
;                                       m == any_result ==>
;                                       (m >= 0 ==> m > 0) /\
;                                       (forall (any_result: Prims.nat).
;                                           m == any_result ==>
;                                           (forall (any_result: FStar.Matrix.matrix c m m).
;                                               FStar.Matrix.matrix_mul_unit add mul m == any_result ==>
;                                               (forall (any_result: FStar.Seq.Base.seq c).
;                                                   FStar.Matrix.row (FStar.Matrix.matrix_mul_unit add
;                                                         mul
;                                                         m)
;                                                     i ==
;                                                   any_result ==>
;                                                   FStar.Seq.Base.equal (FStar.Seq.Base.append (FStar.Seq.Base.append
;                                                             (FStar.Seq.Base.create i add.unit)
;                                                             (FStar.Seq.Base.create 1 mul.unit))
;                                                         (FStar.Seq.Base.create (m - i - 1) add.unit)
;                                                     )
;                                                     (FStar.Matrix.row (FStar.Matrix.matrix_mul_unit add
;                                                             mul
;                                                             m)
;                                                         i) /\
;                                                   (forall (pure_result: Prims.unit).
;                                                       FStar.Seq.Base.append (FStar.Seq.Base.append (FStar.Seq.Base.create
;                                                                 i
;                                                                 add.unit)
;                                                             (FStar.Seq.Base.create 1 mul.unit))
;                                                         (FStar.Seq.Base.create (m - i - 1) add.unit) ==
;                                                       FStar.Matrix.row (FStar.Matrix.matrix_mul_unit
;                                                             add
;                                                             mul
;                                                             m)
;                                                         i ==>
;                                                       (FStar.IntegerIntervals.interval_condition 0
;                                                           m
;                                                           i ==>
;                                                         i >= 0) /\
;                                                       (forall (any_result:
;                                                           FStar.IntegerIntervals.under m).
;                                                           i == any_result ==>
;                                                           (forall (any_result: FStar.Seq.Base.seq c)
;                                                             .
;                                                               FStar.Seq.Base.create i add.unit ==
;                                                               any_result ==>
;                                                               m - i - 1 >= 0 /\
;                                                               (forall (return_val: Prims.nat).
;                                                                   return_val == m - i - 1 ==>
;                                                                   (forall (any_result:
;                                                                       FStar.Seq.Base.seq c).
;                                                                       FStar.Seq.Base.create (m - i -
;                                                                           1)
;                                                                         add.unit ==
;                                                                       any_result ==>
;                                                                       (forall (any_result:
;                                                                           FStar.Seq.Base.seq c).
;                                                                           FStar.Seq.Base.append (FStar.Seq.Base.create
;                                                                                 1
;                                                                                 mul.unit)
;                                                                             (FStar.Seq.Base.create (m -
;                                                                                   i -
;                                                                                   1)
;                                                                                 add.unit) ==
;                                                                           any_result ==>
;                                                                           (forall (any_result:
;                                                                               FStar.Seq.Base.seq c).
;                                                                               FStar.Seq.Base.append (
;                                                                                   FStar.Seq.Base.create
;                                                                                     i
;                                                                                     add.unit)
;                                                                                 (FStar.Seq.Base.append
;                                                                                     (FStar.Seq.Base.create
;                                                                                         1
;                                                                                         mul.unit)
;                                                                                     (FStar.Seq.Base.create
;                                                                                         (m - i - 1)
;                                                                                         add.unit)) ==
;                                                                               any_result ==>
;                                                                               (m >= 0 ==> m > 0) /\
;                                                                               (forall (any_result:
;                                                                                   Prims.nat).
;                                                                                   m == any_result ==>
;                                                                                   (m >= 0 ==> m > 0) /\
;                                                                                   (forall (any_result:
;                                                                                       Prims.nat).
;                                                                                       m ==
;                                                                                       any_result ==>
;                                                                                       (m >= 0 ==>
;                                                                                         m > 0) /\
;                                                                                       (forall (any_result:
;                                                                                           Prims.nat)
;                                                                                         .
;                                                                                           m ==
;                                                                                           any_result ==>
;                                                                                           (forall (any_result:
;                                                                                               FStar.Matrix.matrix
;                                                                                                 c
;                                                                                                 m
;                                                                                                 m).
;                                                                                               FStar.Matrix.matrix_mul_unit
;                                                                                                 add
;                                                                                                 mul
;                                                                                                 m ==
;                                                                                               any_result ==>
;                                                                                               (forall
;                                                                                                   (any_result:
;                                                                                                   FStar.Seq.Base.seq
;                                                                                                     c
;                                                                                                   ).
;                                                                                                   FStar.Matrix.row
;                                                                                                     (
;                                                                                                       FStar.Matrix.matrix_mul_unit
;                                                                                                         add
;                                                                                                         mul
;                                                                                                         m
; 
;                                                                                                     )
;                                                                                                     i
;                                                                                                    ==
;                                                                                                   any_result ==>
;                                                                                                   FStar.Seq.Base.equal
;                                                                                                     (
;                                                                                                       FStar.Seq.Base.append
;                                                                                                         (
;                                                                                                           FStar.Seq.Base.create
;                                                                                                             i
;                                                                                                             add
;                                                                                                               .unit
; 
;                                                                                                         )
;                                                                                                         (
;                                                                                                           FStar.Seq.Base.append
;                                                                                                             (
;                                                                                                               FStar.Seq.Base.create
;                                                                                                                 1
;                                                                                                                 mul
;                                                                                                                   .unit
; 
;                                                                                                             )
;                                                                                                             (
;                                                                                                               FStar.Seq.Base.create
;                                                                                                                 (
;                                                                                                                   m -
;                                                                                                                   i -
;                                                                                                                   1
;                                                                                                                 )
;                                                                                                                 add
;                                                                                                                   .unit
; 
;                                                                                                             )
; 
;                                                                                                         )
; 
;                                                                                                     )
;                                                                                                     (
;                                                                                                       FStar.Matrix.row
;                                                                                                         (
;                                                                                                           FStar.Matrix.matrix_mul_unit
;                                                                                                             add
;                                                                                                             mul
;                                                                                                             m
; 
;                                                                                                         )
;                                                                                                         i
; 
;                                                                                                     )
;                                                                                                    /\
;                                                                                                   (forall
;                                                                                                       (pure_result:
;                                                                                                       Prims.unit)
;                                                                                                     .
;                                                                                                       FStar.Seq.Base.append
;                                                                                                         (
;                                                                                                           FStar.Seq.Base.create
;                                                                                                             i
;                                                                                                             add
;                                                                                                               .unit
; 
;                                                                                                         )
;                                                                                                         (
;                                                                                                           FStar.Seq.Base.append
;                                                                                                             (
;                                                                                                               FStar.Seq.Base.create
;                                                                                                                 1
;                                                                                                                 mul
;                                                                                                                   .unit
; 
;                                                                                                             )
;                                                                                                             (
;                                                                                                               FStar.Seq.Base.create
;                                                                                                                 (
;                                                                                                                   m -
;                                                                                                                   i -
;                                                                                                                   1
;                                                                                                                 )
;                                                                                                                 add
;                                                                                                                   .unit
; 
;                                                                                                             )
; 
;                                                                                                         )
;                                                                                                        ==
;                                                                                                       FStar.Matrix.row
;                                                                                                         (
;                                                                                                           FStar.Matrix.matrix_mul_unit
;                                                                                                             add
;                                                                                                             mul
;                                                                                                             m
; 
;                                                                                                         )
;                                                                                                         i
;                                                                                                        ==>
;                                                                                                       p
;                                                                                                         pure_result
; 
;                                                                                                   ))
;                                                                                           ))))))))))
;                                                   )))))))))))))
; Context: While encoding a query
; While typechecking the top-level declaration ‘let matrix_mul_unit_row_lemma’
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
   (forall ((@x0 Term) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
    (! (implies
      (and
       (HasType @x0 (Tm_type uu___588))
       (HasType @x1 (FStar.Algebra.CommMonoid.Equiv.equiv uu___588 @x0))
       (HasType @x2 Prims.nat)
       (HasType @x3 (FStar.Algebra.CommMonoid.Equiv.cm uu___588 @x0 @x1))
       (HasType @x4 (FStar.Algebra.CommMonoid.Equiv.cm uu___588 @x0 @x1))
       (HasType @x5 (FStar.IntegerIntervals.under @x2)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (and
       ;; def=FStar.Matrix.fst(731,2-736,54); use=FStar.Matrix.fst(731,2-736,54)
       (forall ((@x6 Term))
        (! (implies
          (HasType @x6 Tm_refine_4fe5a88d1a1dcab567f82d246dbcb5b9)
          ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
          (and
           (implies
            ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
            (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
            ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(725,41-725,42)
            (or
             label_1
             ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(731,2-736,54)
             (> (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
           ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
           (forall ((@x7 Term))
            (! (implies
              (and
               (HasType @x7 Prims.nat)
               ;; def=FStar.Matrix.fsti(225,12-225,13); use=FStar.Matrix.fst(731,2-736,54)
               (= @x2 @x7))
              ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
              (and
               (implies
                ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
                (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
                ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(725,41-725,42)
                (or
                 label_2
                 ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(731,2-736,54)
                 (> (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
               ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
               (forall ((@x8 Term))
                (! (implies
                  (and
                   (HasType @x8 Prims.nat)
                   ;; def=FStar.Matrix.fsti(225,15-225,16); use=FStar.Matrix.fst(731,2-736,54)
                   (= @x2 @x8))
                  ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                  (and
                   (implies
                    ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
                    (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
                    ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(725,41-725,42)
                    (or
                     label_3
                     ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(731,2-736,54)
                     (> (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
                   ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                   (forall ((@x9 Term))
                    (! (implies
                      (and
                       (HasType @x9 Prims.nat)
                       ;; def=FStar.Matrix.fsti(325,49-325,50); use=FStar.Matrix.fst(731,2-736,54)
                       (= @x2 @x9))
                      ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                      (forall ((@x10 Term))
                       (! (implies
                         (and
                          (HasType @x10 (FStar.Matrix.matrix uu___588 @x0 @x2 @x2))
                          ;; def=FStar.Matrix.fsti(225,18-225,20); use=FStar.Matrix.fst(731,2-736,54)
                          (= (FStar.Matrix.matrix_mul_unit uu___588 @x0 @x1 @x3 @x4 @x2) @x10))
                         ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                         (forall ((@x11 Term))
                          (! (implies
                            (and
                             (HasType @x11 (FStar.Seq.Base.seq uu___588 @x0))
                             ;; def=Prims.fst(160,41-160,42); use=FStar.Matrix.fst(731,2-736,54)
                             (=
                              (FStar.Matrix.row
                               uu___588
                               @x0
                               @x2
                               @x2
                               (FStar.Matrix.matrix_mul_unit uu___588 @x0 @x1 @x3 @x4 @x2)
                               @x5)
                              @x11))
                            ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                            (and
                             (implies
                              ;; def=FStar.IntegerIntervals.fst(38,53-38,77); use=FStar.Matrix.fst(731,2-736,54)
                              (BoxBool_proj_0
                               (FStar.IntegerIntervals.interval_condition (BoxInt 0) @x2 @x5))
                              ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(726,27-726,28)
                              (or
                               label_4
                               ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
                               (>= (BoxInt_proj_0 @x5) (BoxInt_proj_0 (BoxInt 0)))))
                             ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                             (forall ((@x12 Term))
                              (! (implies
                                (and
                                 (HasType @x12 (FStar.IntegerIntervals.under @x2))
                                 ;; def=FStar.Matrix.fst(725,10-730,46); use=FStar.Matrix.fst(731,2-736,54)
                                 (= @x5 @x12))
                                ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                (forall ((@x13 Term))
                                 (! (implies
                                   (and
                                    (HasType @x13 (FStar.Seq.Base.seq uu___588 @x0))
                                    ;; def=FStar.Matrix.fst(725,10-730,46); use=FStar.Matrix.fst(731,2-736,54)
                                    (=
                                     (FStar.Seq.Base.create
                                      uu___588
                                      @x0
                                      @x5
                                      (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                       uu___588
                                       @x0
                                       @x1
                                       @x3))
                                     @x13))
                                   ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(727,63-727,70)
                                   (or
                                    label_5
                                    ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
                                    (>=
                                     (BoxInt_proj_0
                                      (Prims.op_Subtraction
                                       (Prims.op_Subtraction @x2 @x5)
                                       (BoxInt 1)))
                                     (BoxInt_proj_0 (BoxInt 0)))))
                                  :qid @query.8)))
                               :qid @query.7))))
                           :qid @query.6)))
                        :qid @query.5)))
                     :qid @query.4))))
                 :qid @query.3))))
             :qid @query.2))
           (implies
            ;; def=FStar.Matrix.fst(725,11-727,82); use=FStar.Matrix.fst(731,2-736,54)
            (=
             (FStar.Matrix.row
              uu___588
              @x0
              @x2
              @x2
              (FStar.Matrix.matrix_mul_unit uu___588 @x0 @x1 @x3 @x4 @x2)
              @x5)
             (FStar.Seq.Base.append
              uu___588
              @x0
              (FStar.Seq.Base.create
               uu___588
               @x0
               @x5
               (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x3))
              (FStar.Seq.Base.append
               uu___588
               @x0
               (FStar.Seq.Base.create
                uu___588
                @x0
                (BoxInt 1)
                (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x4))
               (FStar.Seq.Base.create
                uu___588
                @x0
                (Prims.op_Subtraction (Prims.op_Subtraction @x2 @x5) (BoxInt 1))
                (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x3)))))
            ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
            (and
             (implies
              ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
              (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
              ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(728,41-728,42)
              (or
               label_6
               ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(731,2-736,54)
               (> (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
             ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
             (forall ((@x7 Term))
              (! (implies
                (and
                 (HasType @x7 Prims.nat)
                 ;; def=FStar.Matrix.fsti(225,12-225,13); use=FStar.Matrix.fst(731,2-736,54)
                 (= @x2 @x7))
                ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                (and
                 (implies
                  ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
                  (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
                  ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(728,41-728,42)
                  (or
                   label_7
                   ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(731,2-736,54)
                   (> (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
                 ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                 (forall ((@x8 Term))
                  (! (implies
                    (and
                     (HasType @x8 Prims.nat)
                     ;; def=FStar.Matrix.fsti(225,15-225,16); use=FStar.Matrix.fst(731,2-736,54)
                     (= @x2 @x8))
                    ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                    (and
                     (implies
                      ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
                      (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
                      ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(728,41-728,42)
                      (or
                       label_8
                       ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(731,2-736,54)
                       (> (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
                     ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                     (forall ((@x9 Term))
                      (! (implies
                        (and
                         (HasType @x9 Prims.nat)
                         ;; def=FStar.Matrix.fsti(325,49-325,50); use=FStar.Matrix.fst(731,2-736,54)
                         (= @x2 @x9))
                        ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                        (forall ((@x10 Term))
                         (! (implies
                           (and
                            (HasType @x10 (FStar.Matrix.matrix uu___588 @x0 @x2 @x2))
                            ;; def=FStar.Matrix.fsti(225,18-225,20); use=FStar.Matrix.fst(731,2-736,54)
                            (= (FStar.Matrix.matrix_mul_unit uu___588 @x0 @x1 @x3 @x4 @x2) @x10))
                           ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                           (forall ((@x11 Term))
                            (! (implies
                              (and
                               (HasType @x11 (FStar.Seq.Base.seq uu___588 @x0))
                               ;; def=Prims.fst(160,41-160,42); use=FStar.Matrix.fst(731,2-736,54)
                               (=
                                (FStar.Matrix.row
                                 uu___588
                                 @x0
                                 @x2
                                 @x2
                                 (FStar.Matrix.matrix_mul_unit uu___588 @x0 @x1 @x3 @x4 @x2)
                                 @x5)
                                @x11))
                              ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                              (and
                               (implies
                                ;; def=FStar.IntegerIntervals.fst(38,53-38,77); use=FStar.Matrix.fst(731,2-736,54)
                                (BoxBool_proj_0
                                 (FStar.IntegerIntervals.interval_condition (BoxInt 0) @x2 @x5))
                                ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(729,28-729,29)
                                (or
                                 label_9
                                 ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
                                 (>= (BoxInt_proj_0 @x5) (BoxInt_proj_0 (BoxInt 0)))))
                               ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                               (forall ((@x12 Term))
                                (! (implies
                                  (and
                                   (HasType @x12 (FStar.IntegerIntervals.under @x2))
                                   ;; def=FStar.Matrix.fst(725,10-730,46); use=FStar.Matrix.fst(731,2-736,54)
                                   (= @x5 @x12))
                                  ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                  (forall ((@x13 Term))
                                   (! (implies
                                     (and
                                      (HasType @x13 (FStar.Seq.Base.seq uu___588 @x0))
                                      ;; def=FStar.Matrix.fst(725,10-730,46); use=FStar.Matrix.fst(731,2-736,54)
                                      (=
                                       (FStar.Seq.Base.create
                                        uu___588
                                        @x0
                                        @x5
                                        (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                         uu___588
                                         @x0
                                         @x1
                                         @x3))
                                       @x13))
                                     ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                     (forall ((@x14 Term))
                                      (! (implies
                                        (and
                                         (HasType @x14 (FStar.Seq.Base.seq uu___588 @x0))
                                         ;; def=FStar.Matrix.fst(725,10-730,46); use=FStar.Matrix.fst(731,2-736,54)
                                         (=
                                          (FStar.Seq.Base.append
                                           uu___588
                                           @x0
                                           (FStar.Seq.Base.create
                                            uu___588
                                            @x0
                                            @x5
                                            (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                             uu___588
                                             @x0
                                             @x1
                                             @x3))
                                           (FStar.Seq.Base.create
                                            uu___588
                                            @x0
                                            (BoxInt 1)
                                            (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                             uu___588
                                             @x0
                                             @x1
                                             @x4)))
                                          @x14))
                                        ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(730,27-730,34)
                                        (or
                                         label_10
                                         ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,2-736,54)
                                         (>=
                                          (BoxInt_proj_0
                                           (Prims.op_Subtraction
                                            (Prims.op_Subtraction @x2 @x5)
                                            (BoxInt 1)))
                                          (BoxInt_proj_0 (BoxInt 0)))))
                                       :qid @query.16)))
                                    :qid @query.15)))
                                 :qid @query.14))))
                             :qid @query.13)))
                          :qid @query.12)))
                       :qid @query.11))))
                   :qid @query.10))))
               :qid @query.9))))))
         :qid @query.1))
       ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
       (forall ((@x6 Term))
        (! (implies
          (and
           (HasType @x6 (Prims.pure_post U_zero Prims.unit))
           ;; def=Prims.fst(409,36-409,97); use=FStar.Matrix.fst(731,2-736,54)
           (forall ((@x7 Term))
            (! (implies
              (and
               (or label_11 (HasType @x7 Prims.unit))
               ;; def=FStar.Matrix.fst(725,11-727,82); use=FStar.Matrix.fst(731,2-736,54)
               (or
                label_12
                ;; def=FStar.Matrix.fst(725,11-727,82); use=FStar.Matrix.fst(731,2-736,54)
                (=
                 (FStar.Matrix.row
                  uu___588
                  @x0
                  @x2
                  @x2
                  (FStar.Matrix.matrix_mul_unit uu___588 @x0 @x1 @x3 @x4 @x2)
                  @x5)
                 (FStar.Seq.Base.append
                  uu___588
                  @x0
                  (FStar.Seq.Base.create
                   uu___588
                   @x0
                   @x5
                   (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x3))
                  (FStar.Seq.Base.append
                   uu___588
                   @x0
                   (FStar.Seq.Base.create
                    uu___588
                    @x0
                    (BoxInt 1)
                    (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x4))
                   (FStar.Seq.Base.create
                    uu___588
                    @x0
                    (Prims.op_Subtraction (Prims.op_Subtraction @x2 @x5) (BoxInt 1))
                    (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x3))))))
               ;; def=FStar.Matrix.fst(728,11-730,45); use=FStar.Matrix.fst(731,2-736,54)
               (or
                label_13
                ;; def=FStar.Matrix.fst(728,11-730,45); use=FStar.Matrix.fst(731,2-736,54)
                (=
                 (FStar.Matrix.row
                  uu___588
                  @x0
                  @x2
                  @x2
                  (FStar.Matrix.matrix_mul_unit uu___588 @x0 @x1 @x3 @x4 @x2)
                  @x5)
                 (FStar.Seq.Base.append
                  uu___588
                  @x0
                  (FStar.Seq.Base.append
                   uu___588
                   @x0
                   (FStar.Seq.Base.create
                    uu___588
                    @x0
                    @x5
                    (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x3))
                   (FStar.Seq.Base.create
                    uu___588
                    @x0
                    (BoxInt 1)
                    (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x4)))
                  (FStar.Seq.Base.create
                   uu___588
                   @x0
                   (Prims.op_Subtraction (Prims.op_Subtraction @x2 @x5) (BoxInt 1))
                   (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x3))))))
              ;; def=Prims.fst(409,83-409,96); use=FStar.Matrix.fst(731,2-736,54)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=FStar.Matrix.fst(731,2-736,54)
               (ApplyTT @x6 @x7)))
             :pattern
              (;; def=Prims.fst(409,83-409,96); use=FStar.Matrix.fst(731,2-736,54)
               (Valid
                ;; def=Prims.fst(409,83-409,96); use=FStar.Matrix.fst(731,2-736,54)
                (ApplyTT @x6 @x7)))
             :qid @query.18)))
          ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
          (and
           (implies
            ;; def=FStar.IntegerIntervals.fst(38,53-38,77); use=FStar.Matrix.fst(731,31-731,32)
            (BoxBool_proj_0 (FStar.IntegerIntervals.interval_condition (BoxInt 0) @x2 @x5))
            ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,31-731,32)
            (or
             label_14
             ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(731,31-731,32)
             (>= (BoxInt_proj_0 @x5) (BoxInt_proj_0 (BoxInt 0)))))
           ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
           (forall ((@x7 Term))
            (! (implies
              (and
               (HasType @x7 (FStar.IntegerIntervals.under @x2))
               ;; def=FStar.Matrix.fst(731,2-736,54); use=FStar.Matrix.fst(731,2-736,54)
               (= @x5 @x7))
              ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
              (forall ((@x8 Term))
               (! (implies
                 (and
                  (HasType @x8 (FStar.Seq.Base.seq uu___588 @x0))
                  ;; def=FStar.Matrix.fst(731,2-736,54); use=FStar.Matrix.fst(731,2-736,54)
                  (=
                   (FStar.Seq.Base.create
                    uu___588
                    @x0
                    @x5
                    (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x3))
                   @x8))
                 ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                 (forall ((@x9 Term))
                  (! (implies
                    (and
                     (HasType @x9 (FStar.Seq.Base.seq uu___588 @x0))
                     ;; def=FStar.Matrix.fst(731,2-736,54); use=FStar.Matrix.fst(731,2-736,54)
                     (=
                      (FStar.Seq.Base.append
                       uu___588
                       @x0
                       (FStar.Seq.Base.create
                        uu___588
                        @x0
                        @x5
                        (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x3))
                       (FStar.Seq.Base.create
                        uu___588
                        @x0
                        (BoxInt 1)
                        (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit uu___588 @x0 @x1 @x4)))
                      @x9))
                    ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                    (and
                     ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(732,42-732,49)
                     (or
                      label_15
                      ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(732,42-732,49)
                      (>=
                       (BoxInt_proj_0
                        (Prims.op_Subtraction (Prims.op_Subtraction @x2 @x5) (BoxInt 1)))
                       (BoxInt_proj_0 (BoxInt 0))))
                     ;; def=Prims.fst(322,2-322,58); use=FStar.Matrix.fst(731,2-736,54)
                     (forall ((@x10 Term))
                      (! (implies
                        (and
                         (HasType @x10 Prims.nat)
                         ;; def=Prims.fst(322,26-322,41); use=FStar.Matrix.fst(731,2-736,54)
                         (= @x10 (Prims.op_Subtraction (Prims.op_Subtraction @x2 @x5) (BoxInt 1))))
                        ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                        (forall ((@x11 Term))
                         (! (implies
                           (and
                            (HasType @x11 (FStar.Seq.Base.seq uu___588 @x0))
                            ;; def=FStar.Matrix.fst(731,2-736,54); use=FStar.Matrix.fst(731,2-736,54)
                            (=
                             (FStar.Seq.Base.create
                              uu___588
                              @x0
                              (Prims.op_Subtraction (Prims.op_Subtraction @x2 @x5) (BoxInt 1))
                              (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                               uu___588
                               @x0
                               @x1
                               @x3))
                             @x11))
                           ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                           (forall ((@x12 Term))
                            (! (implies
                              (and
                               (HasType @x12 (FStar.Seq.Base.seq uu___588 @x0))
                               ;; def=FStar.Seq.Base.fsti(187,30-187,32); use=FStar.Matrix.fst(731,2-736,54)
                               (=
                                (FStar.Seq.Base.append
                                 uu___588
                                 @x0
                                 (FStar.Seq.Base.append
                                  uu___588
                                  @x0
                                  (FStar.Seq.Base.create
                                   uu___588
                                   @x0
                                   @x5
                                   (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                    uu___588
                                    @x0
                                    @x1
                                    @x3))
                                  (FStar.Seq.Base.create
                                   uu___588
                                   @x0
                                   (BoxInt 1)
                                   (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                    uu___588
                                    @x0
                                    @x1
                                    @x4)))
                                 (FStar.Seq.Base.create
                                  uu___588
                                  @x0
                                  (Prims.op_Subtraction (Prims.op_Subtraction @x2 @x5) (BoxInt 1))
                                  (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                   uu___588
                                   @x0
                                   @x1
                                   @x3)))
                                @x12))
                              ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                              (and
                               (implies
                                ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(733,49-733,50)
                                (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
                                ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(733,49-733,50)
                                (or
                                 label_16
                                 ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(733,49-733,50)
                                 (> (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
                               ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                               (forall ((@x13 Term))
                                (! (implies
                                  (and
                                   (HasType @x13 Prims.nat)
                                   ;; def=FStar.Matrix.fsti(225,12-225,13); use=FStar.Matrix.fst(731,2-736,54)
                                   (= @x2 @x13))
                                  ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                                  (and
                                   (implies
                                    ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(733,49-733,50)
                                    (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
                                    ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(733,49-733,50)
                                    (or
                                     label_17
                                     ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(733,49-733,50)
                                     (> (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
                                   ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                   (forall ((@x14 Term))
                                    (! (implies
                                      (and
                                       (HasType @x14 Prims.nat)
                                       ;; def=FStar.Matrix.fsti(225,15-225,16); use=FStar.Matrix.fst(731,2-736,54)
                                       (= @x2 @x14))
                                      ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                                      (and
                                       (implies
                                        ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(733,49-733,50)
                                        (>= (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))
                                        ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(733,49-733,50)
                                        (or
                                         label_18
                                         ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(733,49-733,50)
                                         (> (BoxInt_proj_0 @x2) (BoxInt_proj_0 (BoxInt 0)))))
                                       ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                       (forall ((@x15 Term))
                                        (! (implies
                                          (and
                                           (HasType @x15 Prims.nat)
                                           ;; def=FStar.Matrix.fsti(325,49-325,50); use=FStar.Matrix.fst(731,2-736,54)
                                           (= @x2 @x15))
                                          ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                          (forall ((@x16 Term))
                                           (! (implies
                                             (and
                                              (HasType
                                               @x16
                                               (FStar.Matrix.matrix uu___588 @x0 @x2 @x2))
                                              ;; def=FStar.Matrix.fsti(225,18-225,20); use=FStar.Matrix.fst(731,2-736,54)
                                              (=
                                               (FStar.Matrix.matrix_mul_unit
                                                uu___588
                                                @x0
                                                @x1
                                                @x3
                                                @x4
                                                @x2)
                                               @x16))
                                             ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                             (forall ((@x17 Term))
                                              (! (implies
                                                (and
                                                 (HasType @x17 (FStar.Seq.Base.seq uu___588 @x0))
                                                 ;; def=FStar.Seq.Base.fsti(187,42-187,44); use=FStar.Matrix.fst(731,2-736,54)
                                                 (=
                                                  (FStar.Matrix.row
                                                   uu___588
                                                   @x0
                                                   @x2
                                                   @x2
                                                   (FStar.Matrix.matrix_mul_unit
                                                    uu___588
                                                    @x0
                                                    @x1
                                                    @x3
                                                    @x4
                                                    @x2)
                                                   @x5)
                                                  @x17))
                                                ;; def=Prims.fst(409,29-409,97); use=FStar.Matrix.fst(731,5-731,18)
                                                (and
                                                 ;; def=FStar.Seq.Base.fsti(188,15-188,28); use=FStar.Matrix.fst(731,5-731,18)
                                                 (or
                                                  label_19
                                                  ;; def=FStar.Seq.Base.fsti(188,15-188,28); use=FStar.Matrix.fst(731,5-731,18)
                                                  (Valid
                                                   ;; def=FStar.Seq.Base.fsti(188,15-188,28); use=FStar.Matrix.fst(731,5-731,18)
                                                   (FStar.Seq.Base.equal
                                                    uu___588
                                                    @x0
                                                    (FStar.Seq.Base.append
                                                     uu___588
                                                     @x0
                                                     (FStar.Seq.Base.append
                                                      uu___588
                                                      @x0
                                                      (FStar.Seq.Base.create
                                                       uu___588
                                                       @x0
                                                       @x5
                                                       (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                        uu___588
                                                        @x0
                                                        @x1
                                                        @x3))
                                                      (FStar.Seq.Base.create
                                                       uu___588
                                                       @x0
                                                       (BoxInt 1)
                                                       (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                        uu___588
                                                        @x0
                                                        @x1
                                                        @x4)))
                                                     (FStar.Seq.Base.create
                                                      uu___588
                                                      @x0
                                                      (Prims.op_Subtraction
                                                       (Prims.op_Subtraction @x2 @x5)
                                                       (BoxInt 1))
                                                      (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                       uu___588
                                                       @x0
                                                       @x1
                                                       @x3)))
                                                    (FStar.Matrix.row
                                                     uu___588
                                                     @x0
                                                     @x2
                                                     @x2
                                                     (FStar.Matrix.matrix_mul_unit
                                                      uu___588
                                                      @x0
                                                      @x1
                                                      @x3
                                                      @x4
                                                      @x2)
                                                     @x5))))
                                                 ;; def=Prims.fst(409,36-409,97); use=FStar.Matrix.fst(731,5-731,18)
                                                 (forall ((@x18 Term))
                                                  (! (implies
                                                    (and
                                                     (HasType @x18 Prims.unit)
                                                     ;; def=FStar.Seq.Base.fsti(189,14-189,22); use=FStar.Matrix.fst(731,5-731,18)
                                                     (=
                                                      (FStar.Seq.Base.append
                                                       uu___588
                                                       @x0
                                                       (FStar.Seq.Base.append
                                                        uu___588
                                                        @x0
                                                        (FStar.Seq.Base.create
                                                         uu___588
                                                         @x0
                                                         @x5
                                                         (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                          uu___588
                                                          @x0
                                                          @x1
                                                          @x3))
                                                        (FStar.Seq.Base.create
                                                         uu___588
                                                         @x0
                                                         (BoxInt 1)
                                                         (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                          uu___588
                                                          @x0
                                                          @x1
                                                          @x4)))
                                                       (FStar.Seq.Base.create
                                                        uu___588
                                                        @x0
                                                        (Prims.op_Subtraction
                                                         (Prims.op_Subtraction @x2 @x5)
                                                         (BoxInt 1))
                                                        (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                         uu___588
                                                         @x0
                                                         @x1
                                                         @x3)))
                                                      (FStar.Matrix.row
                                                       uu___588
                                                       @x0
                                                       @x2
                                                       @x2
                                                       (FStar.Matrix.matrix_mul_unit
                                                        uu___588
                                                        @x0
                                                        @x1
                                                        @x3
                                                        @x4
                                                        @x2)
                                                       @x5)))
                                                    ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                                                    (and
                                                     (implies
                                                      ;; def=FStar.IntegerIntervals.fst(38,53-38,77); use=FStar.Matrix.fst(734,31-734,32)
                                                      (BoxBool_proj_0
                                                       (FStar.IntegerIntervals.interval_condition
                                                        (BoxInt 0)
                                                        @x2
                                                        @x5))
                                                      ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(734,31-734,32)
                                                      (or
                                                       label_20
                                                       ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(734,31-734,32)
                                                       (>=
                                                        (BoxInt_proj_0 @x5)
                                                        (BoxInt_proj_0 (BoxInt 0)))))
                                                     ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                     (forall ((@x19 Term))
                                                      (! (implies
                                                        (and
                                                         (HasType
                                                          @x19
                                                          (FStar.IntegerIntervals.under @x2))
                                                         ;; def=FStar.Matrix.fst(731,2-736,54); use=FStar.Matrix.fst(731,2-736,54)
                                                         (= @x5 @x19))
                                                        ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                        (forall ((@x20 Term))
                                                         (! (implies
                                                           (and
                                                            (HasType
                                                             @x20
                                                             (FStar.Seq.Base.seq uu___588 @x0))
                                                            ;; def=FStar.Matrix.fst(731,2-736,54); use=FStar.Matrix.fst(731,2-736,54)
                                                            (=
                                                             (FStar.Seq.Base.create
                                                              uu___588
                                                              @x0
                                                              @x5
                                                              (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                               uu___588
                                                               @x0
                                                               @x1
                                                               @x3))
                                                             @x20))
                                                           ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                                                           (and
                                                            ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(735,63-735,70)
                                                            (or
                                                             label_21
                                                             ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(735,63-735,70)
                                                             (>=
                                                              (BoxInt_proj_0
                                                               (Prims.op_Subtraction
                                                                (Prims.op_Subtraction @x2 @x5)
                                                                (BoxInt 1)))
                                                              (BoxInt_proj_0 (BoxInt 0))))
                                                            ;; def=Prims.fst(322,2-322,58); use=FStar.Matrix.fst(731,2-736,54)
                                                            (forall ((@x21 Term))
                                                             (! (implies
                                                               (and
                                                                (HasType @x21 Prims.nat)
                                                                ;; def=Prims.fst(322,26-322,41); use=FStar.Matrix.fst(731,2-736,54)
                                                                (=
                                                                 @x21
                                                                 (Prims.op_Subtraction
                                                                  (Prims.op_Subtraction @x2 @x5)
                                                                  (BoxInt 1))))
                                                               ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                               (forall ((@x22 Term))
                                                                (! (implies
                                                                  (and
                                                                   (HasType
                                                                    @x22
                                                                    (FStar.Seq.Base.seq uu___588 @x0))
                                                                   ;; def=FStar.Matrix.fst(731,2-736,54); use=FStar.Matrix.fst(731,2-736,54)
                                                                   (=
                                                                    (FStar.Seq.Base.create
                                                                     uu___588
                                                                     @x0
                                                                     (Prims.op_Subtraction
                                                                      (Prims.op_Subtraction @x2 @x5)
                                                                      (BoxInt 1))
                                                                     (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                      uu___588
                                                                      @x0
                                                                      @x1
                                                                      @x3))
                                                                    @x22))
                                                                  ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                                  (forall ((@x23 Term))
                                                                   (! (implies
                                                                     (and
                                                                      (HasType
                                                                       @x23
                                                                       (FStar.Seq.Base.seq
                                                                        uu___588
                                                                        @x0))
                                                                      ;; def=FStar.Matrix.fst(731,2-736,54); use=FStar.Matrix.fst(731,2-736,54)
                                                                      (=
                                                                       (FStar.Seq.Base.append
                                                                        uu___588
                                                                        @x0
                                                                        (FStar.Seq.Base.create
                                                                         uu___588
                                                                         @x0
                                                                         (BoxInt 1)
                                                                         (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                          uu___588
                                                                          @x0
                                                                          @x1
                                                                          @x4))
                                                                        (FStar.Seq.Base.create
                                                                         uu___588
                                                                         @x0
                                                                         (Prims.op_Subtraction
                                                                          (Prims.op_Subtraction
                                                                           @x2
                                                                           @x5)
                                                                          (BoxInt 1))
                                                                         (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                          uu___588
                                                                          @x0
                                                                          @x1
                                                                          @x3)))
                                                                       @x23))
                                                                     ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                                     (forall ((@x24 Term))
                                                                      (! (implies
                                                                        (and
                                                                         (HasType
                                                                          @x24
                                                                          (FStar.Seq.Base.seq
                                                                           uu___588
                                                                           @x0))
                                                                         ;; def=FStar.Seq.Base.fsti(187,30-187,32); use=FStar.Matrix.fst(731,2-736,54)
                                                                         (=
                                                                          (FStar.Seq.Base.append
                                                                           uu___588
                                                                           @x0
                                                                           (FStar.Seq.Base.create
                                                                            uu___588
                                                                            @x0
                                                                            @x5
                                                                            (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                             uu___588
                                                                             @x0
                                                                             @x1
                                                                             @x3))
                                                                           (FStar.Seq.Base.append
                                                                            uu___588
                                                                            @x0
                                                                            (FStar.Seq.Base.create
                                                                             uu___588
                                                                             @x0
                                                                             (BoxInt 1)
                                                                             (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                              uu___588
                                                                              @x0
                                                                              @x1
                                                                              @x4))
                                                                            (FStar.Seq.Base.create
                                                                             uu___588
                                                                             @x0
                                                                             (Prims.op_Subtraction
                                                                              (Prims.op_Subtraction
                                                                               @x2
                                                                               @x5)
                                                                              (BoxInt 1))
                                                                             (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                              uu___588
                                                                              @x0
                                                                              @x1
                                                                              @x3))))
                                                                          @x24))
                                                                        ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                                                                        (and
                                                                         (implies
                                                                          ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(736,49-736,50)
                                                                          (>=
                                                                           (BoxInt_proj_0 @x2)
                                                                           (BoxInt_proj_0 (BoxInt 0)))
                                                                          ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(736,49-736,50)
                                                                          (or
                                                                           label_22
                                                                           ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(736,49-736,50)
                                                                           (>
                                                                            (BoxInt_proj_0 @x2)
                                                                            (BoxInt_proj_0
                                                                             (BoxInt 0)))))
                                                                         ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                                         (forall ((@x25 Term))
                                                                          (! (implies
                                                                            (and
                                                                             (HasType @x25 Prims.nat)
                                                                             ;; def=FStar.Matrix.fsti(225,12-225,13); use=FStar.Matrix.fst(731,2-736,54)
                                                                             (= @x2 @x25))
                                                                            ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                                                                            (and
                                                                             (implies
                                                                              ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(736,49-736,50)
                                                                              (>=
                                                                               (BoxInt_proj_0 @x2)
                                                                               (BoxInt_proj_0
                                                                                (BoxInt 0)))
                                                                              ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(736,49-736,50)
                                                                              (or
                                                                               label_23
                                                                               ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(736,49-736,50)
                                                                               (>
                                                                                (BoxInt_proj_0 @x2)
                                                                                (BoxInt_proj_0
                                                                                 (BoxInt 0)))))
                                                                             ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                                             (forall ((@x26 Term))
                                                                              (! (implies
                                                                                (and
                                                                                 (HasType
                                                                                  @x26
                                                                                  Prims.nat)
                                                                                 ;; def=FStar.Matrix.fsti(225,15-225,16); use=FStar.Matrix.fst(731,2-736,54)
                                                                                 (= @x2 @x26))
                                                                                ;; def=Prims.fst(427,77-427,89); use=FStar.Matrix.fst(731,2-736,54)
                                                                                (and
                                                                                 (implies
                                                                                  ;; def=Prims.fst(642,18-642,24); use=FStar.Matrix.fst(736,49-736,50)
                                                                                  (>=
                                                                                   (BoxInt_proj_0
                                                                                    @x2)
                                                                                   (BoxInt_proj_0
                                                                                    (BoxInt 0)))
                                                                                  ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(736,49-736,50)
                                                                                  (or
                                                                                   label_24
                                                                                   ;; def=Prims.fst(645,18-645,23); use=FStar.Matrix.fst(736,49-736,50)
                                                                                   (>
                                                                                    (BoxInt_proj_0
                                                                                     @x2)
                                                                                    (BoxInt_proj_0
                                                                                     (BoxInt 0)))))
                                                                                 ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                                                 (forall
                                                                                   ((@x27 Term))
                                                                                  (! (implies
                                                                                    (and
                                                                                     (HasType
                                                                                      @x27
                                                                                      Prims.nat)
                                                                                     ;; def=FStar.Matrix.fsti(325,49-325,50); use=FStar.Matrix.fst(731,2-736,54)
                                                                                     (= @x2 @x27))
                                                                                    ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                                                    (forall
                                                                                      ((@x28 Term))
                                                                                     (! (implies
                                                                                       (and
                                                                                        (HasType
                                                                                         @x28
                                                                                         (FStar.Matrix.matrix
                                                                                          uu___588
                                                                                          @x0
                                                                                          @x2
                                                                                          @x2))
                                                                                        ;; def=FStar.Matrix.fsti(225,18-225,20); use=FStar.Matrix.fst(731,2-736,54)
                                                                                        (=
                                                                                         (FStar.Matrix.matrix_mul_unit
                                                                                          uu___588
                                                                                          @x0
                                                                                          @x1
                                                                                          @x3
                                                                                          @x4
                                                                                          @x2)
                                                                                         @x28))
                                                                                       ;; def=Prims.fst(419,66-419,102); use=FStar.Matrix.fst(731,2-736,54)
                                                                                       (forall
                                                                                         ((@x29 Term))
                                                                                        (! (implies
                                                                                          (and
                                                                                           (HasType
                                                                                            @x29
                                                                                            (FStar.Seq.Base.seq
                                                                                             uu___588
                                                                                             @x0))
                                                                                           ;; def=FStar.Seq.Base.fsti(187,42-187,44); use=FStar.Matrix.fst(731,2-736,54)
                                                                                           (=
                                                                                            (FStar.Matrix.row
                                                                                             uu___588
                                                                                             @x0
                                                                                             @x2
                                                                                             @x2
                                                                                             (FStar.Matrix.matrix_mul_unit
                                                                                              uu___588
                                                                                              @x0
                                                                                              @x1
                                                                                              @x3
                                                                                              @x4
                                                                                              @x2)
                                                                                             @x5)
                                                                                            @x29))
                                                                                          ;; def=Prims.fst(409,29-409,97); use=FStar.Matrix.fst(734,5-734,18)
                                                                                          (and
                                                                                           ;; def=FStar.Seq.Base.fsti(188,15-188,28); use=FStar.Matrix.fst(734,5-734,18)
                                                                                           (or
                                                                                            label_25
                                                                                            ;; def=FStar.Seq.Base.fsti(188,15-188,28); use=FStar.Matrix.fst(734,5-734,18)
                                                                                            (Valid
                                                                                             ;; def=FStar.Seq.Base.fsti(188,15-188,28); use=FStar.Matrix.fst(734,5-734,18)
                                                                                             (FStar.Seq.Base.equal
                                                                                              uu___588
                                                                                              @x0
                                                                                              (FStar.Seq.Base.append
                                                                                               uu___588
                                                                                               @x0
                                                                                               (FStar.Seq.Base.create
                                                                                                uu___588
                                                                                                @x0
                                                                                                @x5
                                                                                                (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                                                 uu___588
                                                                                                 @x0
                                                                                                 @x1
                                                                                                 @x3))
                                                                                               (FStar.Seq.Base.append
                                                                                                uu___588
                                                                                                @x0
                                                                                                (FStar.Seq.Base.create
                                                                                                 uu___588
                                                                                                 @x0
                                                                                                 (BoxInt
                                                                                                  1)
                                                                                                 (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                                                  uu___588
                                                                                                  @x0
                                                                                                  @x1
                                                                                                  @x4))
                                                                                                (FStar.Seq.Base.create
                                                                                                 uu___588
                                                                                                 @x0
                                                                                                 (Prims.op_Subtraction
                                                                                                  (Prims.op_Subtraction
                                                                                                   @x2
                                                                                                   @x5)
                                                                                                  (BoxInt
                                                                                                   1))
                                                                                                 (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                                                  uu___588
                                                                                                  @x0
                                                                                                  @x1
                                                                                                  @x3))))
                                                                                              (FStar.Matrix.row
                                                                                               uu___588
                                                                                               @x0
                                                                                               @x2
                                                                                               @x2
                                                                                               (FStar.Matrix.matrix_mul_unit
                                                                                                uu___588
                                                                                                @x0
                                                                                                @x1
                                                                                                @x3
                                                                                                @x4
                                                                                                @x2)
                                                                                               @x5))))
                                                                                           ;; def=Prims.fst(409,36-409,97); use=FStar.Matrix.fst(734,5-734,18)
                                                                                           (forall
                                                                                             ((@x30
                                                                                               Term))
                                                                                            (! (implies
                                                                                              (and
                                                                                               (HasType
                                                                                                @x30
                                                                                                Prims.unit)
                                                                                               ;; def=FStar.Seq.Base.fsti(189,14-189,22); use=FStar.Matrix.fst(734,5-734,18)
                                                                                               (=
                                                                                                (FStar.Seq.Base.append
                                                                                                 uu___588
                                                                                                 @x0
                                                                                                 (FStar.Seq.Base.create
                                                                                                  uu___588
                                                                                                  @x0
                                                                                                  @x5
                                                                                                  (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                                                   uu___588
                                                                                                   @x0
                                                                                                   @x1
                                                                                                   @x3))
                                                                                                 (FStar.Seq.Base.append
                                                                                                  uu___588
                                                                                                  @x0
                                                                                                  (FStar.Seq.Base.create
                                                                                                   uu___588
                                                                                                   @x0
                                                                                                   (BoxInt
                                                                                                    1)
                                                                                                   (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                                                    uu___588
                                                                                                    @x0
                                                                                                    @x1
                                                                                                    @x4))
                                                                                                  (FStar.Seq.Base.create
                                                                                                   uu___588
                                                                                                   @x0
                                                                                                   (Prims.op_Subtraction
                                                                                                    (Prims.op_Subtraction
                                                                                                     @x2
                                                                                                     @x5)
                                                                                                    (BoxInt
                                                                                                     1))
                                                                                                   (FStar.Algebra.CommMonoid.Equiv.__proj__CM__item__unit
                                                                                                    uu___588
                                                                                                    @x0
                                                                                                    @x1
                                                                                                    @x3))))
                                                                                                (FStar.Matrix.row
                                                                                                 uu___588
                                                                                                 @x0
                                                                                                 @x2
                                                                                                 @x2
                                                                                                 (FStar.Matrix.matrix_mul_unit
                                                                                                  uu___588
                                                                                                  @x0
                                                                                                  @x1
                                                                                                  @x3
                                                                                                  @x4
                                                                                                  @x2)
                                                                                                 @x5)))
                                                                                              ;; def=Prims.fst(409,83-409,96); use=FStar.Matrix.fst(734,5-734,18)
                                                                                              (Valid
                                                                                               ;; def=Prims.fst(409,83-409,96); use=FStar.Matrix.fst(734,5-734,18)
                                                                                               (ApplyTT
                                                                                                @x6
                                                                                                @x30)))
                                                                                             :qid
                                                                                              @query.42))))
                                                                                         :qid
                                                                                          @query.41)))
                                                                                      :qid @query.40)))
                                                                                   :qid @query.39))))
                                                                               :qid @query.38))))
                                                                           :qid @query.37))))
                                                                       :qid @query.36)))
                                                                    :qid @query.35)))
                                                                 :qid @query.34)))
                                                              :qid @query.33))))
                                                          :qid @query.32)))
                                                       :qid @query.31))))
                                                   :qid @query.30))))
                                               :qid @query.29)))
                                            :qid @query.28)))
                                         :qid @query.27))))
                                     :qid @query.26))))
                                 :qid @query.25))))
                             :qid @query.24)))
                          :qid @query.23)))
                       :qid @query.22))))
                   :qid @query.21)))
                :qid @query.20)))
             :qid @query.19))))
         :qid @query.17))))
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
(echo "label_25")
(eval label_25)
(echo "label_24")
(eval label_24)
(echo "label_23")
(eval label_23)
(echo "label_22")
(eval label_22)
(echo "label_21")
(eval label_21)
(echo "label_20")
(eval label_20)
(echo "label_19")
(eval label_19)
(echo "label_18")
(eval label_18)
(echo "label_17")
(eval label_17)
(echo "label_16")
(eval label_16)
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
(pop) ;; 0}pop
