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
(declare-fun FStar.Algebra.Monoid.Monoid (Universe Term Term Term Term Term Term) Term)
; Projector
(declare-fun FStar.Algebra.Monoid.Monoid_@0 (Term) Universe)
; Projector
(declare-fun FStar.Algebra.Monoid.Monoid_@associativity (Term) Term)
; Projector
(declare-fun FStar.Algebra.Monoid.Monoid_@left_unitality (Term) Term)
; Projector
(declare-fun FStar.Algebra.Monoid.Monoid_@m (Term) Term)
; Projector
(declare-fun FStar.Algebra.Monoid.Monoid_@mult (Term) Term)
; Projector
(declare-fun FStar.Algebra.Monoid.Monoid_@right_unitality (Term) Term)
; Projector
(declare-fun FStar.Algebra.Monoid.Monoid_@unit (Term) Term)
(declare-fun FStar.Algebra.Monoid.__proj__Monoid__item__mult (Universe Term Term) Term)
(declare-fun FStar.Algebra.Monoid.__proj__Monoid__item__mult@tok (Universe) Term)
(declare-fun FStar.Algebra.Monoid.__proj__Monoid__item__unit (Universe Term Term) Term)
(declare-fun FStar.Algebra.Monoid.associativity_lemma (Universe Term Term) Term)
(declare-fun FStar.Algebra.Monoid.left_unitality_lemma (Universe Term Term Term) Term)
; Constructor
(declare-fun FStar.Algebra.Monoid.monoid (Universe Term) Term)
; token
(declare-fun FStar.Algebra.Monoid.monoid@tok (Universe) Term)
(declare-fun FStar.Algebra.Monoid.right_unitality_lemma (Universe Term Term Term) Term)
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
; Constructor
(declare-fun FStar.Pervasives.Native.None (Universe Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.None_@0 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Native.None_@a (Term) Term)
; Constructor
(declare-fun FStar.Pervasives.Native.Some (Universe Term Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Some_@0 (Term) Universe)
; Projector
(declare-fun FStar.Pervasives.Native.Some_@a (Term) Term)
; Projector
(declare-fun FStar.Pervasives.Native.Some_@v (Term) Term)
; Constructor
(declare-fun FStar.Pervasives.Native.option (Universe Term) Term)
; token
(declare-fun FStar.Pervasives.Native.option@tok (Universe) Term)
(declare-fun FStar.Pervasives.Native.uu___is_None (Universe Term Term) Term)
(declare-fun FStar.Pervasives.Native.uu___is_Some (Universe Term Term) Term)
(declare-fun Prims.bool () Term)
(declare-fun Prims.eq2 (Universe Term Term Term) Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.hasEq (Universe Term) Term)
(declare-fun Prims.l_Forall (Universe Term Term) Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.squash (Term) Term)
(declare-fun Prims.unit () Term)
(declare-fun Tm_abs_9fe43ea578162b025105b54f8c92c195 (Term Universe Term Term) Term)
(declare-fun Tm_abs_a5b155c160e0351d85fe12536fe7f7f1 (Term Universe Term Term) Term)
(declare-fun Tm_abs_aae8e44e94204ab25237f29d76e45f99 (Term Universe Term) Term)
(declare-fun Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03 (Term Universe Term Term Term) Term)
(declare-fun Tm_abs_da50ab613c96608d7b80cc04e28f7cbc (Term Universe Term Term) Term)
(declare-fun Tm_arrow_629a218f62a315d32bc29220d13cb23a (Universe) Term)
(declare-fun Tm_arrow_d64d4275ed8e577d65d5c1671754751b (Term Universe) Term)
(declare-fun Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 (Term Universe) Term)
(declare-fun Tm_refine_2de20c066034c13bf76e9c0b94f4806c (Term) Term)
(declare-fun Tm_refine_9d6af3f3535473623f7aec2f0501897f () Term)
; Discriminator definition
(define-fun is-FStar.Algebra.Monoid.Monoid ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 147)
  (=
   __@x0
   (FStar.Algebra.Monoid.Monoid
    (FStar.Algebra.Monoid.Monoid_@0 __@x0)
    (FStar.Algebra.Monoid.Monoid_@m __@x0)
    (FStar.Algebra.Monoid.Monoid_@unit __@x0)
    (FStar.Algebra.Monoid.Monoid_@mult __@x0)
    (FStar.Algebra.Monoid.Monoid_@right_unitality __@x0)
    (FStar.Algebra.Monoid.Monoid_@left_unitality __@x0)
    (FStar.Algebra.Monoid.Monoid_@associativity __@x0)))))
; Discriminator definition
(define-fun is-FStar.Pervasives.Native.None ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 108)
  (=
   __@x0
   (FStar.Pervasives.Native.None
    (FStar.Pervasives.Native.None_@0 __@x0)
    (FStar.Pervasives.Native.None_@a __@x0)))))
; Discriminator definition
(define-fun is-FStar.Pervasives.Native.Some ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 113)
  (=
   __@x0
   (FStar.Pervasives.Native.Some
    (FStar.Pervasives.Native.Some_@0 __@x0)
    (FStar.Pervasives.Native.Some_@a __@x0)
    (FStar.Pervasives.Native.Some_@v __@x0)))))
; interpretation_Tm_arrow_629a218f62a315d32bc29220d13cb23a
;;; Fact-ids: Name FStar.Algebra.Monoid.__proj__Monoid__item__mult; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(39,13-40,10); use=FStar.Algebra.Monoid.fst(39,13-40,10)
  (forall ((@x0 Term) (@u1 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_629a218f62a315d32bc29220d13cb23a @u1))
     (and
      ;; def=FStar.Algebra.Monoid.fst(39,13-40,10); use=FStar.Algebra.Monoid.fst(39,13-40,10)
      (forall ((@x2 Term) (@x3 Term))
       (! (implies
         (and (HasType @x2 (Tm_type @u1)) (HasType @x3 (FStar.Algebra.Monoid.monoid @u1 @x2)))
         (HasType
          (ApplyTT (ApplyTT @x0 @x2) @x3)
          (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x2 @u1)))
        :pattern ((ApplyTT (ApplyTT @x0 @x2) @x3))
        :qid FStar.Algebra.Monoid_interpretation_Tm_arrow_629a218f62a315d32bc29220d13cb23a.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.Monoid.fst(39,13-40,10); use=FStar.Algebra.Monoid.fst(39,13-40,10)
      (forall ((@x2 Term))
       (! (implies (HasType @x2 (Tm_type @u1)) (IsTotFun (ApplyTT @x0 @x2)))
        :pattern ((ApplyTT @x0 @x2))
        :qid FStar.Algebra.Monoid_interpretation_Tm_arrow_629a218f62a315d32bc29220d13cb23a.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_629a218f62a315d32bc29220d13cb23a @u1)))
    :qid FStar.Algebra.Monoid_interpretation_Tm_arrow_629a218f62a315d32bc29220d13cb23a))
  :named FStar.Algebra.Monoid_interpretation_Tm_arrow_629a218f62a315d32bc29220d13cb23a))
; interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b
;;; Fact-ids: Name FStar.Algebra.Monoid.right_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(29,27-29,28); use=FStar.Algebra.Monoid.fst(29,47-29,58)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u2))
     (and
      ;; def=FStar.Algebra.Monoid.fst(29,27-29,28); use=FStar.Algebra.Monoid.fst(29,47-29,58)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and (HasType @x3 @x1) (HasType @x4 @x1))
         (HasType (ApplyTT (ApplyTT @x0 @x3) @x4) @x1))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid FStar.Algebra.Monoid_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.Monoid.fst(29,27-29,28); use=FStar.Algebra.Monoid.fst(29,47-29,58)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 @x1) (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Algebra.Monoid_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u2)))
    :qid FStar.Algebra.Monoid_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
  :named FStar.Algebra.Monoid_interpretation_Tm_arrow_d64d4275ed8e577d65d5c1671754751b))
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
; Assumption: FStar.Algebra.Monoid.monoid__uu___haseq
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid__uu___haseq; Namespace FStar.Algebra.Monoid
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
            (HasType @x4 (Prims.squash (FStar.Algebra.Monoid.right_unitality_lemma @u0 @x1 @x2 @x3)))
            (HasType @x5 (Prims.squash (FStar.Algebra.Monoid.left_unitality_lemma @u0 @x1 @x2 @x3)))
            (HasType @x6 (Prims.squash (FStar.Algebra.Monoid.associativity_lemma @u0 @x1 @x3))))
           (and
            (Valid (Prims.hasEq @u0 @x1))
            (Valid (Prims.hasEq @u0 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
            (Valid
             (Prims.hasEq
              U_zero
              (Prims.squash (FStar.Algebra.Monoid.right_unitality_lemma @u0 @x1 @x2 @x3))))
            (Valid
             (Prims.hasEq
              U_zero
              (Prims.squash (FStar.Algebra.Monoid.left_unitality_lemma @u0 @x1 @x2 @x3))))
            (Valid
             (Prims.hasEq
              U_zero
              (Prims.squash (FStar.Algebra.Monoid.associativity_lemma @u0 @x1 @x3))))))
          :qid assumption_FStar.Algebra.Monoid.monoid__uu___haseq.2)))
       (Valid (Prims.hasEq @u0 (FStar.Algebra.Monoid.monoid @u0 @x1))))
      :pattern ((Prims.hasEq @u0 (FStar.Algebra.Monoid.monoid @u0 @x1)))
      :qid assumption_FStar.Algebra.Monoid.monoid__uu___haseq.1))
    :qid assumption_FStar.Algebra.Monoid.monoid__uu___haseq))
  :named assumption_FStar.Algebra.Monoid.monoid__uu___haseq))
; Assumption: FStar.Pervasives.Native.option__uu___haseq
;;; Fact-ids: Name FStar.Pervasives.Native.option__uu___haseq; Namespace FStar.Pervasives.Native
(assert
 (! (forall ((@u0 Universe))
   (! (forall ((@x1 Term))
     (! (implies
       (and (HasType @x1 (Tm_type @u0)) (Valid (Prims.hasEq @u0 @x1)))
       (Valid (Prims.hasEq @u0 (FStar.Pervasives.Native.option @u0 @x1))))
      :pattern ((Prims.hasEq @u0 (FStar.Pervasives.Native.option @u0 @x1)))
      :qid assumption_FStar.Pervasives.Native.option__uu___haseq.1))
    :qid assumption_FStar.Pervasives.Native.option__uu___haseq))
  :named assumption_FStar.Pervasives.Native.option__uu___haseq))
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
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (= 147 (Term_constr_id (FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6)))
    :pattern ((FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid constructor_distinct_FStar.Algebra.Monoid.Monoid))
  :named constructor_distinct_FStar.Algebra.Monoid.Monoid))
; Constructor distinct
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(39,5-39,11); use=FStar.Algebra.Monoid.fst(39,5-39,11)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 138 (Term_constr_id (FStar.Algebra.Monoid.monoid @u0 @x1)))
    :pattern ((FStar.Algebra.Monoid.monoid @u0 @x1))
    :qid constructor_distinct_FStar.Algebra.Monoid.monoid))
  :named constructor_distinct_FStar.Algebra.Monoid.monoid))
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
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(32,4-32,8); use=FStar.Pervasives.Native.fst(32,4-32,8)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 108 (Term_constr_id (FStar.Pervasives.Native.None @u0 @x1)))
    :pattern ((FStar.Pervasives.Native.None @u0 @x1))
    :qid constructor_distinct_FStar.Pervasives.Native.None))
  :named constructor_distinct_FStar.Pervasives.Native.None))
; Constructor distinct
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(33,4-33,8); use=FStar.Pervasives.Native.fst(33,4-33,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= 113 (Term_constr_id (FStar.Pervasives.Native.Some @u0 @x1 @x2)))
    :pattern ((FStar.Pervasives.Native.Some @u0 @x1 @x2))
    :qid constructor_distinct_FStar.Pervasives.Native.Some))
  :named constructor_distinct_FStar.Pervasives.Native.Some))
; Constructor distinct
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(31,5-31,11); use=FStar.Pervasives.Native.fst(31,5-31,11)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 101 (Term_constr_id (FStar.Pervasives.Native.option @u0 @x1)))
    :pattern ((FStar.Pervasives.Native.option @u0 @x1))
    :qid constructor_distinct_FStar.Pervasives.Native.option))
  :named constructor_distinct_FStar.Pervasives.Native.option))
; Constructor distinct
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (= 107 (Term_constr_id Prims.bool)) :named constructor_distinct_Prims.bool))
; Constructor distinct
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (= 125 (Term_constr_id Prims.unit)) :named constructor_distinct_Prims.unit))
; data constructor typing elim
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
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
      (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
      (FStar.Algebra.Monoid.monoid @u1 @x8))
     (and
      (HasTypeFuel @u0 @x8 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 @x8)
      (HasTypeFuel @u0 @x4 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x8 @u1))
      (HasTypeFuel
       @u0
       @x5
       (Prims.squash (FStar.Algebra.Monoid.right_unitality_lemma @u1 @x8 @x3 @x4)))
      (HasTypeFuel
       @u0
       @x6
       (Prims.squash (FStar.Algebra.Monoid.left_unitality_lemma @u1 @x8 @x3 @x4)))
      (HasTypeFuel @u0 @x7 (Prims.squash (FStar.Algebra.Monoid.associativity_lemma @u1 @x8 @x4)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
       (FStar.Algebra.Monoid.monoid @u1 @x8)))
    :qid data_elim_FStar.Algebra.Monoid.Monoid))
  :named data_elim_FStar.Algebra.Monoid.Monoid))
; data constructor typing elim
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(32,4-32,8); use=FStar.Pervasives.Native.fst(32,4-32,8)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Native.None @u1 @x2)
      (FStar.Pervasives.Native.option @u1 @x3))
     (HasTypeFuel @u0 @x3 (Tm_type @u1)))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Native.None @u1 @x2)
       (FStar.Pervasives.Native.option @u1 @x3)))
    :qid data_elim_FStar.Pervasives.Native.None))
  :named data_elim_FStar.Pervasives.Native.None))
; data constructor typing elim
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(33,4-33,8); use=FStar.Pervasives.Native.fst(33,4-33,8)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Native.Some @u1 @x2 @x3)
      (FStar.Pervasives.Native.option @u1 @x4))
     (and (HasTypeFuel @u0 @x4 (Tm_type @u1)) (HasTypeFuel @u0 @x3 @x4)))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Native.Some @u1 @x2 @x3)
       (FStar.Pervasives.Native.option @u1 @x4)))
    :qid data_elim_FStar.Pervasives.Native.Some))
  :named data_elim_FStar.Pervasives.Native.Some))
; data constructor typing intro
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
  (forall
    ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x2 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 @x2)
      (HasTypeFuel @u0 @x4 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x2 @u1))
      (HasTypeFuel
       @u0
       @x5
       (Prims.squash (FStar.Algebra.Monoid.right_unitality_lemma @u1 @x2 @x3 @x4)))
      (HasTypeFuel
       @u0
       @x6
       (Prims.squash (FStar.Algebra.Monoid.left_unitality_lemma @u1 @x2 @x3 @x4)))
      (HasTypeFuel @u0 @x7 (Prims.squash (FStar.Algebra.Monoid.associativity_lemma @u1 @x2 @x4))))
     (HasTypeFuel
      @u0
      (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
      (FStar.Algebra.Monoid.monoid @u1 @x2)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
       (FStar.Algebra.Monoid.monoid @u1 @x2)))
    :qid data_typing_intro_FStar.Algebra.Monoid.Monoid@tok))
  :named data_typing_intro_FStar.Algebra.Monoid.Monoid@tok))
; data constructor typing intro
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(32,4-32,8); use=FStar.Pervasives.Native.fst(32,4-32,8)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term))
   (! (implies
     (HasTypeFuel @u0 @x2 (Tm_type @u1))
     (HasTypeFuel
      @u0
      (FStar.Pervasives.Native.None @u1 @x2)
      (FStar.Pervasives.Native.option @u1 @x2)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Pervasives.Native.None @u1 @x2)
       (FStar.Pervasives.Native.option @u1 @x2)))
    :qid data_typing_intro_FStar.Pervasives.Native.None@tok))
  :named data_typing_intro_FStar.Pervasives.Native.None@tok))
; data constructor typing intro
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(33,4-33,8); use=FStar.Pervasives.Native.fst(33,4-33,8)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (implies
     (and (HasTypeFuel @u0 @x2 (Tm_type @u1)) (HasTypeFuel @u0 @x3 @x2))
     (HasTypeFuel
      @u0
      (FStar.Pervasives.Native.Some @u1 @x2 @x3)
      (FStar.Pervasives.Native.option @u1 @x2)))
    :pattern
     ((HasTypeFuel
       @u0
       (FStar.Pervasives.Native.Some @u1 @x2 @x3)
       (FStar.Pervasives.Native.option @u1 @x2)))
    :qid data_typing_intro_FStar.Pervasives.Native.Some@tok))
  :named data_typing_intro_FStar.Pervasives.Native.Some@tok))
; Equation for FStar.Algebra.Monoid.associativity_lemma
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(35,4-35,23); use=FStar.Algebra.Monoid.fst(35,4-35,23)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Algebra.Monoid.associativity_lemma @u0 @x1 @x2)
     (Prims.l_Forall @u0 @x1 (Tm_abs_aae8e44e94204ab25237f29d76e45f99 @x1 @u0 @x2)))
    :pattern ((FStar.Algebra.Monoid.associativity_lemma @u0 @x1 @x2))
    :qid defn_equation_FStar.Algebra.Monoid.associativity_lemma))
  :named defn_equation_FStar.Algebra.Monoid.associativity_lemma))
; Equation for FStar.Algebra.Monoid.left_unitality_lemma
;;; Fact-ids: Name FStar.Algebra.Monoid.left_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(32,4-32,24); use=FStar.Algebra.Monoid.fst(32,4-32,24)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.Algebra.Monoid.left_unitality_lemma @u0 @x1 @x2 @x3)
     (Prims.l_Forall @u0 @x1 (Tm_abs_9fe43ea578162b025105b54f8c92c195 @x1 @u0 @x3 @x2)))
    :pattern ((FStar.Algebra.Monoid.left_unitality_lemma @u0 @x1 @x2 @x3))
    :qid defn_equation_FStar.Algebra.Monoid.left_unitality_lemma))
  :named defn_equation_FStar.Algebra.Monoid.left_unitality_lemma))
; Equation for FStar.Algebra.Monoid.right_unitality_lemma
;;; Fact-ids: Name FStar.Algebra.Monoid.right_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(29,4-29,25); use=FStar.Algebra.Monoid.fst(29,4-29,25)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (FStar.Algebra.Monoid.right_unitality_lemma @u0 @x1 @x2 @x3)
     (Prims.l_Forall @u0 @x1 (Tm_abs_da50ab613c96608d7b80cc04e28f7cbc @x1 @u0 @x3 @x2)))
    :pattern ((FStar.Algebra.Monoid.right_unitality_lemma @u0 @x1 @x2 @x3))
    :qid defn_equation_FStar.Algebra.Monoid.right_unitality_lemma))
  :named defn_equation_FStar.Algebra.Monoid.right_unitality_lemma))
; Discriminator equation
;;; Fact-ids: Name FStar.Pervasives.Native.uu___is_None; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(32,4-32,8); use=FStar.Pervasives.Native.fst(32,4-32,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Pervasives.Native.uu___is_None @u0 @x1 @x2)
     (BoxBool (is-FStar.Pervasives.Native.None @x2)))
    :pattern ((FStar.Pervasives.Native.uu___is_None @u0 @x1 @x2))
    :qid disc_equation_FStar.Pervasives.Native.None))
  :named disc_equation_FStar.Pervasives.Native.None))
; Discriminator equation
;;; Fact-ids: Name FStar.Pervasives.Native.uu___is_Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(33,4-33,8); use=FStar.Pervasives.Native.fst(33,4-33,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Pervasives.Native.uu___is_Some @u0 @x1 @x2)
     (BoxBool (is-FStar.Pervasives.Native.Some @x2)))
    :pattern ((FStar.Pervasives.Native.uu___is_Some @u0 @x1 @x2))
    :qid disc_equation_FStar.Pervasives.Native.Some))
  :named disc_equation_FStar.Pervasives.Native.Some))
; Eq2 interpretation
;;; Fact-ids: Name Prims.eq2; Namespace Prims
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff (= @x2 @x3) (Valid (Prims.eq2 @u0 @x1 @x2 @x3)))
    :pattern ((Prims.eq2 @u0 @x1 @x2 @x3))
    :qid eq2-interp))
  :named eq2-interp))
; Equation for FStar.Algebra.Monoid.associativity_lemma
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(35,4-35,23); use=FStar.Algebra.Monoid.fst(35,4-35,23)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (Valid (FStar.Algebra.Monoid.associativity_lemma @u0 @x1 @x2))
     ;; def=FStar.Algebra.Monoid.fst(36,2-36,64); use=FStar.Algebra.Monoid.fst(36,2-36,64)
     (forall ((@x3 Term) (@x4 Term) (@x5 Term))
      (! (implies
        (and (HasType @x3 @x1) (HasType @x4 @x1) (HasType @x5 @x1))
        ;; def=FStar.Algebra.Monoid.fst(36,20-36,64); use=FStar.Algebra.Monoid.fst(36,20-36,64)
        (=
         (ApplyTT (ApplyTT @x2 (ApplyTT (ApplyTT @x2 @x3) @x4)) @x5)
         (ApplyTT (ApplyTT @x2 @x3) (ApplyTT (ApplyTT @x2 @x4) @x5))))
       :qid equation_FStar.Algebra.Monoid.associativity_lemma.1)))
    :pattern ((FStar.Algebra.Monoid.associativity_lemma @u0 @x1 @x2))
    :qid equation_FStar.Algebra.Monoid.associativity_lemma))
  :named equation_FStar.Algebra.Monoid.associativity_lemma))
; Equation for FStar.Algebra.Monoid.left_unitality_lemma
;;; Fact-ids: Name FStar.Algebra.Monoid.left_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(32,4-32,24); use=FStar.Algebra.Monoid.fst(32,4-32,24)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (Valid (FStar.Algebra.Monoid.left_unitality_lemma @u0 @x1 @x2 @x3))
     ;; def=FStar.Algebra.Monoid.fst(33,2-33,31); use=FStar.Algebra.Monoid.fst(33,2-33,31)
     (forall ((@x4 Term))
      (! (implies
        (HasType @x4 @x1)
        ;; def=FStar.Algebra.Monoid.fst(33,16-33,31); use=FStar.Algebra.Monoid.fst(33,16-33,31)
        (= (ApplyTT (ApplyTT @x3 @x2) @x4) @x4))
       :qid equation_FStar.Algebra.Monoid.left_unitality_lemma.1)))
    :pattern ((FStar.Algebra.Monoid.left_unitality_lemma @u0 @x1 @x2 @x3))
    :qid equation_FStar.Algebra.Monoid.left_unitality_lemma))
  :named equation_FStar.Algebra.Monoid.left_unitality_lemma))
; Equation for FStar.Algebra.Monoid.right_unitality_lemma
;;; Fact-ids: Name FStar.Algebra.Monoid.right_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(29,4-29,25); use=FStar.Algebra.Monoid.fst(29,4-29,25)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (Valid (FStar.Algebra.Monoid.right_unitality_lemma @u0 @x1 @x2 @x3))
     ;; def=FStar.Algebra.Monoid.fst(30,2-30,31); use=FStar.Algebra.Monoid.fst(30,2-30,31)
     (forall ((@x4 Term))
      (! (implies
        (HasType @x4 @x1)
        ;; def=FStar.Algebra.Monoid.fst(30,16-30,31); use=FStar.Algebra.Monoid.fst(30,16-30,31)
        (= (ApplyTT (ApplyTT @x3 @x4) @x2) @x4))
       :qid equation_FStar.Algebra.Monoid.right_unitality_lemma.1)))
    :pattern ((FStar.Algebra.Monoid.right_unitality_lemma @u0 @x1 @x2 @x3))
    :qid equation_FStar.Algebra.Monoid.right_unitality_lemma))
  :named equation_FStar.Algebra.Monoid.right_unitality_lemma))
; Equation for Prims.eqtype
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (= Prims.eqtype Tm_refine_9d6af3f3535473623f7aec2f0501897f) :named equation_Prims.eqtype))
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
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! (forall ((@u0 Universe))
   (! (= 139 (Term_constr_id (FStar.Algebra.Monoid.monoid@tok @u0)))
    :pattern ((FStar.Algebra.Monoid.monoid@tok @u0))
    :qid fresh_token_FStar.Algebra.Monoid.monoid@tok))
  :named fresh_token_FStar.Algebra.Monoid.monoid@tok))
; fresh token
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! (forall ((@u0 Universe))
   (! (= 102 (Term_constr_id (FStar.Pervasives.Native.option@tok @u0)))
    :pattern ((FStar.Pervasives.Native.option@tok @u0))
    :qid fresh_token_FStar.Pervasives.Native.option@tok))
  :named fresh_token_FStar.Pervasives.Native.option@tok))
; inversion axiom
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(39,5-39,11); use=FStar.Algebra.Monoid.fst(39,5-39,11)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (FStar.Algebra.Monoid.monoid @u2 @x3))
     (and
      (is-FStar.Algebra.Monoid.Monoid @x1)
      (= @u2 (FStar.Algebra.Monoid.Monoid_@0 @x1))
      (= @x3 (FStar.Algebra.Monoid.Monoid_@m @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (FStar.Algebra.Monoid.monoid @u2 @x3)))
    :qid fuel_guarded_inversion_FStar.Algebra.Monoid.monoid))
  :named fuel_guarded_inversion_FStar.Algebra.Monoid.monoid))
; inversion axiom
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(31,5-31,11); use=FStar.Pervasives.Native.fst(31,5-31,11)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) @x1 (FStar.Pervasives.Native.option @u2 @x3))
     (or
      (and
       (is-FStar.Pervasives.Native.None @x1)
       (= @u2 (FStar.Pervasives.Native.None_@0 @x1))
       (= @x3 (FStar.Pervasives.Native.None_@a @x1)))
      (and
       (is-FStar.Pervasives.Native.Some @x1)
       (= @u2 (FStar.Pervasives.Native.Some_@0 @x1))
       (= @x3 (FStar.Pervasives.Native.Some_@a @x1)))))
    :pattern ((HasTypeFuel (SFuel @u0) @x1 (FStar.Pervasives.Native.option @u2 @x3)))
    :qid fuel_guarded_inversion_FStar.Pervasives.Native.option))
  :named fuel_guarded_inversion_FStar.Pervasives.Native.option))
; function token typing
;;; Fact-ids: Name FStar.Algebra.Monoid.__proj__Monoid__item__mult; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(42,4-42,8); use=FStar.Algebra.Monoid.fst(42,4-42,8)
  (forall ((@u0 Universe))
   (! (HasType
     (FStar.Algebra.Monoid.__proj__Monoid__item__mult@tok @u0)
     (Tm_arrow_629a218f62a315d32bc29220d13cb23a @u0))
    :pattern ((FStar.Algebra.Monoid.__proj__Monoid__item__mult@tok @u0))
    :qid function_token_typing_FStar.Algebra.Monoid.__proj__Monoid__item__mult))
  :named function_token_typing_FStar.Algebra.Monoid.__proj__Monoid__item__mult))
; function token typing
;;; Fact-ids: Name Prims.bool; Namespace Prims
(assert
 (! (HasType Prims.bool Prims.eqtype) :named function_token_typing_Prims.bool))
; function token typing
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Prims.eqtype (Tm_type (U_succ U_zero))) :named function_token_typing_Prims.eqtype))
; function token typing
;;; Fact-ids: Name Prims.prop; Namespace Prims
(assert
 (! (HasType Prims.prop (Tm_type U_zero)) :named function_token_typing_Prims.prop))
; function token typing
;;; Fact-ids: Name Prims.unit; Namespace Prims
(assert
 (! (HasType Prims.unit Prims.eqtype) :named function_token_typing_Prims.unit))
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
; haseq for Tm_refine_9d6af3f3535473623f7aec2f0501897f
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq (U_succ U_zero) Tm_refine_9d6af3f3535473623f7aec2f0501897f))
   (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
  :named haseqTm_refine_9d6af3f3535473623f7aec2f0501897f))
; interpretation_Tm_abs_9fe43ea578162b025105b54f8c92c195
;;; Fact-ids: Name FStar.Algebra.Monoid.left_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(33,2-33,31); use=FStar.Algebra.Monoid.fst(33,2-33,31)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (=
     (ApplyTT (Tm_abs_9fe43ea578162b025105b54f8c92c195 @x1 @u2 @x3 @x4) @x0)
     (Prims.eq2 @u2 @x1 (ApplyTT (ApplyTT @x3 @x4) @x0) @x0))
    :pattern ((ApplyTT (Tm_abs_9fe43ea578162b025105b54f8c92c195 @x1 @u2 @x3 @x4) @x0))
    :qid interpretation_Tm_abs_9fe43ea578162b025105b54f8c92c195))
  :named interpretation_Tm_abs_9fe43ea578162b025105b54f8c92c195))
; interpretation_Tm_abs_a5b155c160e0351d85fe12536fe7f7f1
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(36,9-36,64); use=FStar.Algebra.Monoid.fst(36,9-36,64)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (=
     (ApplyTT (Tm_abs_a5b155c160e0351d85fe12536fe7f7f1 @x1 @u2 @x3 @x4) @x0)
     (Prims.l_Forall @u2 @x1 (Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03 @x1 @u2 @x3 @x4 @x0)))
    :pattern ((ApplyTT (Tm_abs_a5b155c160e0351d85fe12536fe7f7f1 @x1 @u2 @x3 @x4) @x0))
    :qid interpretation_Tm_abs_a5b155c160e0351d85fe12536fe7f7f1))
  :named interpretation_Tm_abs_a5b155c160e0351d85fe12536fe7f7f1))
; interpretation_Tm_abs_aae8e44e94204ab25237f29d76e45f99
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(36,9-36,64); use=FStar.Algebra.Monoid.fst(36,9-36,64)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (=
     (ApplyTT (Tm_abs_aae8e44e94204ab25237f29d76e45f99 @x1 @u2 @x3) @x0)
     (Prims.l_Forall @u2 @x1 (Tm_abs_a5b155c160e0351d85fe12536fe7f7f1 @x1 @u2 @x3 @x0)))
    :pattern ((ApplyTT (Tm_abs_aae8e44e94204ab25237f29d76e45f99 @x1 @u2 @x3) @x0))
    :qid interpretation_Tm_abs_aae8e44e94204ab25237f29d76e45f99))
  :named interpretation_Tm_abs_aae8e44e94204ab25237f29d76e45f99))
; interpretation_Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(36,9-36,64); use=FStar.Algebra.Monoid.fst(36,9-36,64)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (=
     (ApplyTT (Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03 @x1 @u2 @x3 @x4 @x5) @x0)
     (Prims.eq2
      @u2
      @x1
      (ApplyTT (ApplyTT @x3 (ApplyTT (ApplyTT @x3 @x4) @x5)) @x0)
      (ApplyTT (ApplyTT @x3 @x4) (ApplyTT (ApplyTT @x3 @x5) @x0))))
    :pattern ((ApplyTT (Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03 @x1 @u2 @x3 @x4 @x5) @x0))
    :qid interpretation_Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03))
  :named interpretation_Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03))
; interpretation_Tm_abs_da50ab613c96608d7b80cc04e28f7cbc
;;; Fact-ids: Name FStar.Algebra.Monoid.right_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(30,2-30,31); use=FStar.Algebra.Monoid.fst(30,2-30,31)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (=
     (ApplyTT (Tm_abs_da50ab613c96608d7b80cc04e28f7cbc @x1 @u2 @x3 @x4) @x0)
     (Prims.eq2 @u2 @x1 (ApplyTT (ApplyTT @x3 @x0) @x4) @x0))
    :pattern ((ApplyTT (Tm_abs_da50ab613c96608d7b80cc04e28f7cbc @x1 @u2 @x3 @x4) @x0))
    :qid interpretation_Tm_abs_da50ab613c96608d7b80cc04e28f7cbc))
  :named interpretation_Tm_abs_da50ab613c96608d7b80cc04e28f7cbc))
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! (and
   ;; def=FStar.Algebra.Monoid.fst(39,5-39,11); use=FStar.Algebra.Monoid.fst(39,5-39,11)
   (forall ((@u0 Universe))
    (! (IsTotFun (FStar.Algebra.Monoid.monoid@tok @u0))
     :pattern ((FStar.Algebra.Monoid.monoid@tok @u0))
     :qid kinding_FStar.Algebra.Monoid.monoid@tok))
   ;; def=FStar.Algebra.Monoid.fst(39,5-39,11); use=FStar.Algebra.Monoid.fst(39,5-39,11)
   (forall ((@u0 Universe) (@x1 Term))
    (! (implies
      (HasType @x1 (Tm_type @u0))
      (HasType (FStar.Algebra.Monoid.monoid @u0 @x1) (Tm_type @u0)))
     :pattern ((FStar.Algebra.Monoid.monoid @u0 @x1))
     :qid kinding_FStar.Algebra.Monoid.monoid@tok.1)))
  :named kinding_FStar.Algebra.Monoid.monoid@tok))
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! (and
   ;; def=FStar.Pervasives.Native.fst(31,5-31,11); use=FStar.Pervasives.Native.fst(31,5-31,11)
   (forall ((@u0 Universe))
    (! (IsTotFun (FStar.Pervasives.Native.option@tok @u0))
     :pattern ((FStar.Pervasives.Native.option@tok @u0))
     :qid kinding_FStar.Pervasives.Native.option@tok))
   ;; def=FStar.Pervasives.Native.fst(31,5-31,11); use=FStar.Pervasives.Native.fst(31,5-31,11)
   (forall ((@u0 Universe) (@x1 Term))
    (! (implies
      (HasType @x1 (Tm_type @u0))
      (HasType (FStar.Pervasives.Native.option @u0 @x1) (Tm_type @u0)))
     :pattern ((FStar.Pervasives.Native.option @u0 @x1))
     :qid kinding_FStar.Pervasives.Native.option@tok.1)))
  :named kinding_FStar.Pervasives.Native.option@tok))
; kinding_Tm_arrow_629a218f62a315d32bc29220d13cb23a
;;; Fact-ids: Name FStar.Algebra.Monoid.__proj__Monoid__item__mult; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(39,13-40,10); use=FStar.Algebra.Monoid.fst(39,13-40,10)
  (forall ((@u0 Universe))
   (! (HasType (Tm_arrow_629a218f62a315d32bc29220d13cb23a @u0) (Tm_type (U_succ @u0)))
    :pattern ((HasType (Tm_arrow_629a218f62a315d32bc29220d13cb23a @u0) (Tm_type (U_succ @u0))))
    :qid kinding_Tm_arrow_629a218f62a315d32bc29220d13cb23a))
  :named kinding_Tm_arrow_629a218f62a315d32bc29220d13cb23a))
; kinding_Tm_arrow_d64d4275ed8e577d65d5c1671754751b
;;; Fact-ids: Name FStar.Algebra.Monoid.right_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(29,27-29,28); use=FStar.Algebra.Monoid.fst(29,47-29,58)
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
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(36,2-36,64); use=FStar.Algebra.Monoid.fst(36,2-36,64)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.l_Forall @u0 @x1 (Tm_abs_aae8e44e94204ab25237f29d76e45f99 @x1 @u0 @x2)))
     ;; def=FStar.Algebra.Monoid.fst(36,2-36,64); use=FStar.Algebra.Monoid.fst(36,2-36,64)
     (forall ((@x3 Term) (@x4 Term) (@x5 Term))
      (! (implies
        (and (HasType @x3 @x1) (HasType @x4 @x1) (HasType @x5 @x1))
        ;; def=FStar.Algebra.Monoid.fst(36,20-36,64); use=FStar.Algebra.Monoid.fst(36,20-36,64)
        (=
         (ApplyTT (ApplyTT @x2 (ApplyTT (ApplyTT @x2 @x3) @x4)) @x5)
         (ApplyTT (ApplyTT @x2 @x3) (ApplyTT (ApplyTT @x2 @x4) @x5))))
       :qid l_quant_interp_a63d6ce84371dae30eee063f4c362968.1)))
    :pattern
     ((Valid (Prims.l_Forall @u0 @x1 (Tm_abs_aae8e44e94204ab25237f29d76e45f99 @x1 @u0 @x2))))
    :qid l_quant_interp_a63d6ce84371dae30eee063f4c362968))
  :named l_quant_interp_a63d6ce84371dae30eee063f4c362968))
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name FStar.Algebra.Monoid.right_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(30,2-30,31); use=FStar.Algebra.Monoid.fst(30,2-30,31)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.l_Forall @u0 @x1 (Tm_abs_da50ab613c96608d7b80cc04e28f7cbc @x1 @u0 @x2 @x3)))
     ;; def=FStar.Algebra.Monoid.fst(30,2-30,31); use=FStar.Algebra.Monoid.fst(30,2-30,31)
     (forall ((@x4 Term))
      (! (implies
        (HasType @x4 @x1)
        ;; def=FStar.Algebra.Monoid.fst(30,16-30,31); use=FStar.Algebra.Monoid.fst(30,16-30,31)
        (= (ApplyTT (ApplyTT @x2 @x4) @x3) @x4))
       :qid l_quant_interp_a75f8a4317cb52ca983df5b55bfbdeb7.1)))
    :pattern
     ((Valid (Prims.l_Forall @u0 @x1 (Tm_abs_da50ab613c96608d7b80cc04e28f7cbc @x1 @u0 @x2 @x3))))
    :qid l_quant_interp_a75f8a4317cb52ca983df5b55bfbdeb7))
  :named l_quant_interp_a75f8a4317cb52ca983df5b55bfbdeb7))
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name FStar.Algebra.Monoid.left_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(33,2-33,31); use=FStar.Algebra.Monoid.fst(33,2-33,31)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.l_Forall @u0 @x1 (Tm_abs_9fe43ea578162b025105b54f8c92c195 @x1 @u0 @x2 @x3)))
     ;; def=FStar.Algebra.Monoid.fst(33,2-33,31); use=FStar.Algebra.Monoid.fst(33,2-33,31)
     (forall ((@x4 Term))
      (! (implies
        (HasType @x4 @x1)
        ;; def=FStar.Algebra.Monoid.fst(33,16-33,31); use=FStar.Algebra.Monoid.fst(33,16-33,31)
        (= (ApplyTT (ApplyTT @x2 @x3) @x4) @x4))
       :qid l_quant_interp_b3182459bfe17ee55d613c726e3e64a5.1)))
    :pattern
     ((Valid (Prims.l_Forall @u0 @x1 (Tm_abs_9fe43ea578162b025105b54f8c92c195 @x1 @u0 @x2 @x3))))
    :qid l_quant_interp_b3182459bfe17ee55d613c726e3e64a5))
  :named l_quant_interp_b3182459bfe17ee55d613c726e3e64a5))
; Lemma: FStar.Pervasives.invertOption
;;; Fact-ids: Name FStar.Pervasives.invertOption; Namespace FStar.Pervasives
(assert
 (! (forall ((@u0 Universe) (@x1 Term))
   (! (implies
     (HasType @x1 (Tm_type @u0))
     ;; def=FStar.Pervasives.fsti(581,37-581,79); use=FStar.Pervasives.fsti(581,37-581,79)
     (forall ((@x2 Term))
      (! (implies
        (HasType @x2 (FStar.Pervasives.Native.option @u0 @x1))
        ;; def=FStar.Pervasives.fsti(581,60-581,78); use=FStar.Pervasives.fsti(581,60-581,78)
        (or
         ;; def=FStar.Pervasives.fsti(581,60-581,67); use=FStar.Pervasives.fsti(581,60-581,67)
         (BoxBool_proj_0 (FStar.Pervasives.Native.uu___is_None @u0 @x1 @x2))
         ;; def=FStar.Pervasives.fsti(581,71-581,78); use=FStar.Pervasives.fsti(581,71-581,78)
         (BoxBool_proj_0 (FStar.Pervasives.Native.uu___is_Some @u0 @x1 @x2))))
       :qid lemma_FStar.Pervasives.invertOption.1)))
    :pattern ((FStar.Pervasives.Native.option @u0 @x1))
    :qid lemma_FStar.Pervasives.invertOption))
  :named lemma_FStar.Pervasives.invertOption))
; Projector equation
;;; Fact-ids: Name FStar.Algebra.Monoid.__proj__Monoid__item__mult; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(42,4-42,8); use=FStar.Algebra.Monoid.fst(42,4-42,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Algebra.Monoid.__proj__Monoid__item__mult @u0 @x1 @x2)
     (FStar.Algebra.Monoid.Monoid_@mult @x2))
    :pattern ((FStar.Algebra.Monoid.__proj__Monoid__item__mult @u0 @x1 @x2))
    :qid proj_equation_FStar.Algebra.Monoid.Monoid_@mult))
  :named proj_equation_FStar.Algebra.Monoid.Monoid_@mult))
; Projector equation
;;; Fact-ids: Name FStar.Algebra.Monoid.__proj__Monoid__item__unit; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(41,4-41,8); use=FStar.Algebra.Monoid.fst(41,4-41,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Algebra.Monoid.__proj__Monoid__item__unit @u0 @x1 @x2)
     (FStar.Algebra.Monoid.Monoid_@unit @x2))
    :pattern ((FStar.Algebra.Monoid.__proj__Monoid__item__unit @u0 @x1 @x2))
    :qid proj_equation_FStar.Algebra.Monoid.Monoid_@unit))
  :named proj_equation_FStar.Algebra.Monoid.Monoid_@unit))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (FStar.Algebra.Monoid.Monoid_@0 (FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
     @u0)
    :pattern ((FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_FStar.Algebra.Monoid.Monoid_@0))
  :named projection_inverse_FStar.Algebra.Monoid.Monoid_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (FStar.Algebra.Monoid.Monoid_@associativity
      (FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
     @x6)
    :pattern ((FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_FStar.Algebra.Monoid.Monoid_@associativity))
  :named projection_inverse_FStar.Algebra.Monoid.Monoid_@associativity))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (FStar.Algebra.Monoid.Monoid_@left_unitality
      (FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
     @x5)
    :pattern ((FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_FStar.Algebra.Monoid.Monoid_@left_unitality))
  :named projection_inverse_FStar.Algebra.Monoid.Monoid_@left_unitality))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (FStar.Algebra.Monoid.Monoid_@m (FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
     @x1)
    :pattern ((FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_FStar.Algebra.Monoid.Monoid_@m))
  :named projection_inverse_FStar.Algebra.Monoid.Monoid_@m))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (FStar.Algebra.Monoid.Monoid_@mult (FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
     @x3)
    :pattern ((FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_FStar.Algebra.Monoid.Monoid_@mult))
  :named projection_inverse_FStar.Algebra.Monoid.Monoid_@mult))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (FStar.Algebra.Monoid.Monoid_@right_unitality
      (FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
     @x4)
    :pattern ((FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_FStar.Algebra.Monoid.Monoid_@right_unitality))
  :named projection_inverse_FStar.Algebra.Monoid.Monoid_@right_unitality))
; Projection inverse
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (=
     (FStar.Algebra.Monoid.Monoid_@unit (FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
     @x2)
    :pattern ((FStar.Algebra.Monoid.Monoid @u0 @x1 @x2 @x3 @x4 @x5 @x6))
    :qid projection_inverse_FStar.Algebra.Monoid.Monoid_@unit))
  :named projection_inverse_FStar.Algebra.Monoid.Monoid_@unit))
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
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(32,4-32,8); use=FStar.Pervasives.Native.fst(32,4-32,8)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (FStar.Pervasives.Native.None_@0 (FStar.Pervasives.Native.None @u0 @x1)) @u0)
    :pattern ((FStar.Pervasives.Native.None @u0 @x1))
    :qid projection_inverse_FStar.Pervasives.Native.None_@0))
  :named projection_inverse_FStar.Pervasives.Native.None_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(32,4-32,8); use=FStar.Pervasives.Native.fst(32,4-32,8)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (FStar.Pervasives.Native.None_@a (FStar.Pervasives.Native.None @u0 @x1)) @x1)
    :pattern ((FStar.Pervasives.Native.None @u0 @x1))
    :qid projection_inverse_FStar.Pervasives.Native.None_@a))
  :named projection_inverse_FStar.Pervasives.Native.None_@a))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(33,4-33,8); use=FStar.Pervasives.Native.fst(33,4-33,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.Pervasives.Native.Some_@0 (FStar.Pervasives.Native.Some @u0 @x1 @x2)) @u0)
    :pattern ((FStar.Pervasives.Native.Some @u0 @x1 @x2))
    :qid projection_inverse_FStar.Pervasives.Native.Some_@0))
  :named projection_inverse_FStar.Pervasives.Native.Some_@0))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(33,4-33,8); use=FStar.Pervasives.Native.fst(33,4-33,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.Pervasives.Native.Some_@a (FStar.Pervasives.Native.Some @u0 @x1 @x2)) @x1)
    :pattern ((FStar.Pervasives.Native.Some @u0 @x1 @x2))
    :qid projection_inverse_FStar.Pervasives.Native.Some_@a))
  :named projection_inverse_FStar.Pervasives.Native.Some_@a))
; Projection inverse
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(33,4-33,8); use=FStar.Pervasives.Native.fst(33,4-33,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.Pervasives.Native.Some_@v (FStar.Pervasives.Native.Some @u0 @x1 @x2)) @x2)
    :pattern ((FStar.Pervasives.Native.Some @u0 @x1 @x2))
    :qid projection_inverse_FStar.Pervasives.Native.Some_@v))
  :named projection_inverse_FStar.Pervasives.Native.Some_@v))
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
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Tm_refine_9d6af3f3535473623f7aec2f0501897f (Tm_type (U_succ U_zero)))
  :named refinement_kinding_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; subterm ordering
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(40,4-40,10); use=FStar.Algebra.Monoid.fst(40,4-40,10)
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
      (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
      (FStar.Algebra.Monoid.monoid @u1 @x8))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x3
        (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x4
        (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x5
        (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x6
        (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x7
        (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Algebra.Monoid.Monoid @u1 @x2 @x3 @x4 @x5 @x6 @x7)
       (FStar.Algebra.Monoid.monoid @u1 @x8)))
    :qid subterm_ordering_FStar.Algebra.Monoid.Monoid))
  :named subterm_ordering_FStar.Algebra.Monoid.Monoid))
; subterm ordering
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(33,4-33,8); use=FStar.Pervasives.Native.fst(33,4-33,8)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (HasTypeFuel
      (SFuel @u0)
      (FStar.Pervasives.Native.Some @u1 @x2 @x3)
      (FStar.Pervasives.Native.option @u1 @x4))
     (Valid
      (Prims.precedes
       U_zero
       U_zero
       Prims.lex_t
       Prims.lex_t
       @x3
       (FStar.Pervasives.Native.Some @u1 @x2 @x3))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.Pervasives.Native.Some @u1 @x2 @x3)
       (FStar.Pervasives.Native.option @u1 @x4)))
    :qid subterm_ordering_FStar.Pervasives.Native.Some))
  :named subterm_ordering_FStar.Pervasives.Native.Some))
; Name-token correspondence
;;; Fact-ids: Name FStar.Algebra.Monoid.__proj__Monoid__item__mult; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(42,4-42,8); use=FStar.Algebra.Monoid.fst(42,4-42,8)
  (forall ((@u0 Universe))
   (! ;; def=FStar.Algebra.Monoid.fst(42,4-42,8); use=FStar.Algebra.Monoid.fst(42,4-42,8)
    (forall ((@x1 Term) (@x2 Term))
     (! (=
       (ApplyTT (ApplyTT (FStar.Algebra.Monoid.__proj__Monoid__item__mult@tok @u0) @x1) @x2)
       (FStar.Algebra.Monoid.__proj__Monoid__item__mult @u0 @x1 @x2))
      :pattern
       ((ApplyTT (ApplyTT (FStar.Algebra.Monoid.__proj__Monoid__item__mult@tok @u0) @x1) @x2))
      :pattern ((FStar.Algebra.Monoid.__proj__Monoid__item__mult @u0 @x1 @x2))
      :qid token_correspondence_FStar.Algebra.Monoid.__proj__Monoid__item__mult.1))
    :pattern ((FStar.Algebra.Monoid.__proj__Monoid__item__mult@tok @u0))
    :qid token_correspondence_FStar.Algebra.Monoid.__proj__Monoid__item__mult))
  :named token_correspondence_FStar.Algebra.Monoid.__proj__Monoid__item__mult))
; name-token correspondence
;;; Fact-ids: Name FStar.Algebra.Monoid.monoid; Namespace FStar.Algebra.Monoid; Name FStar.Algebra.Monoid.Monoid; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(39,5-39,11); use=FStar.Algebra.Monoid.fst(39,5-39,11)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (ApplyTT (FStar.Algebra.Monoid.monoid@tok @u0) @x1) (FStar.Algebra.Monoid.monoid @u0 @x1))
    :pattern ((ApplyTT (FStar.Algebra.Monoid.monoid@tok @u0) @x1))
    :pattern ((FStar.Algebra.Monoid.monoid @u0 @x1))
    :qid token_correspondence_FStar.Algebra.Monoid.monoid@tok))
  :named token_correspondence_FStar.Algebra.Monoid.monoid@tok))
; name-token correspondence
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(31,5-31,11); use=FStar.Pervasives.Native.fst(31,5-31,11)
  (forall ((@u0 Universe) (@x1 Term))
   (! (=
     (ApplyTT (FStar.Pervasives.Native.option@tok @u0) @x1)
     (FStar.Pervasives.Native.option @u0 @x1))
    :pattern ((ApplyTT (FStar.Pervasives.Native.option@tok @u0) @x1))
    :pattern ((FStar.Pervasives.Native.option @u0 @x1))
    :qid token_correspondence_FStar.Pervasives.Native.option@tok))
  :named token_correspondence_FStar.Pervasives.Native.option@tok))
; free var typing
;;; Fact-ids: Name FStar.Algebra.Monoid.__proj__Monoid__item__mult; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(42,4-42,8); use=FStar.Algebra.Monoid.fst(42,4-42,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Algebra.Monoid.monoid @u0 @x1)))
     (HasType
      (FStar.Algebra.Monoid.__proj__Monoid__item__mult @u0 @x1 @x2)
      (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
    :pattern ((FStar.Algebra.Monoid.__proj__Monoid__item__mult @u0 @x1 @x2))
    :qid typing_FStar.Algebra.Monoid.__proj__Monoid__item__mult))
  :named typing_FStar.Algebra.Monoid.__proj__Monoid__item__mult))
; free var typing
;;; Fact-ids: Name FStar.Algebra.Monoid.__proj__Monoid__item__unit; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(41,4-41,8); use=FStar.Algebra.Monoid.fst(41,4-41,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Algebra.Monoid.monoid @u0 @x1)))
     (HasType (FStar.Algebra.Monoid.__proj__Monoid__item__unit @u0 @x1 @x2) @x1))
    :pattern ((FStar.Algebra.Monoid.__proj__Monoid__item__unit @u0 @x1 @x2))
    :qid typing_FStar.Algebra.Monoid.__proj__Monoid__item__unit))
  :named typing_FStar.Algebra.Monoid.__proj__Monoid__item__unit))
; free var typing
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(35,4-35,23); use=FStar.Algebra.Monoid.fst(35,4-35,23)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
     (HasType (FStar.Algebra.Monoid.associativity_lemma @u0 @x1 @x2) Prims.prop))
    :pattern ((FStar.Algebra.Monoid.associativity_lemma @u0 @x1 @x2))
    :qid typing_FStar.Algebra.Monoid.associativity_lemma))
  :named typing_FStar.Algebra.Monoid.associativity_lemma))
; free var typing
;;; Fact-ids: Name FStar.Algebra.Monoid.left_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(32,4-32,24); use=FStar.Algebra.Monoid.fst(32,4-32,24)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 @x1)
      (HasType @x3 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
     (HasType (FStar.Algebra.Monoid.left_unitality_lemma @u0 @x1 @x2 @x3) Prims.prop))
    :pattern ((FStar.Algebra.Monoid.left_unitality_lemma @u0 @x1 @x2 @x3))
    :qid typing_FStar.Algebra.Monoid.left_unitality_lemma))
  :named typing_FStar.Algebra.Monoid.left_unitality_lemma))
; free var typing
;;; Fact-ids: Name FStar.Algebra.Monoid.right_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(29,4-29,25); use=FStar.Algebra.Monoid.fst(29,4-29,25)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 @x1)
      (HasType @x3 (Tm_arrow_d64d4275ed8e577d65d5c1671754751b @x1 @u0)))
     (HasType (FStar.Algebra.Monoid.right_unitality_lemma @u0 @x1 @x2 @x3) Prims.prop))
    :pattern ((FStar.Algebra.Monoid.right_unitality_lemma @u0 @x1 @x2 @x3))
    :qid typing_FStar.Algebra.Monoid.right_unitality_lemma))
  :named typing_FStar.Algebra.Monoid.right_unitality_lemma))
; free var typing
;;; Fact-ids: Name FStar.Pervasives.Native.uu___is_None; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(32,4-32,8); use=FStar.Pervasives.Native.fst(32,4-32,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Pervasives.Native.option @u0 @x1)))
     (HasType (FStar.Pervasives.Native.uu___is_None @u0 @x1 @x2) Prims.bool))
    :pattern ((FStar.Pervasives.Native.uu___is_None @u0 @x1 @x2))
    :qid typing_FStar.Pervasives.Native.uu___is_None))
  :named typing_FStar.Pervasives.Native.uu___is_None))
; free var typing
;;; Fact-ids: Name FStar.Pervasives.Native.uu___is_Some; Namespace FStar.Pervasives.Native
(assert
 (! ;; def=FStar.Pervasives.Native.fst(33,4-33,8); use=FStar.Pervasives.Native.fst(33,4-33,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.Pervasives.Native.option @u0 @x1)))
     (HasType (FStar.Pervasives.Native.uu___is_Some @u0 @x1 @x2) Prims.bool))
    :pattern ((FStar.Pervasives.Native.uu___is_Some @u0 @x1 @x2))
    :qid typing_FStar.Pervasives.Native.uu___is_Some))
  :named typing_FStar.Pervasives.Native.uu___is_Some))
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
; typing_Tm_abs_9fe43ea578162b025105b54f8c92c195
;;; Fact-ids: Name FStar.Algebra.Monoid.left_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(33,2-33,31); use=FStar.Algebra.Monoid.fst(33,2-33,31)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (HasType
     (Tm_abs_9fe43ea578162b025105b54f8c92c195 @x0 @u1 @x2 @x3)
     (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1))
    :pattern ((Tm_abs_9fe43ea578162b025105b54f8c92c195 @x0 @u1 @x2 @x3))
    :qid typing_Tm_abs_9fe43ea578162b025105b54f8c92c195))
  :named typing_Tm_abs_9fe43ea578162b025105b54f8c92c195))
; typing_Tm_abs_a5b155c160e0351d85fe12536fe7f7f1
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(36,9-36,64); use=FStar.Algebra.Monoid.fst(36,9-36,64)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (HasType
     (Tm_abs_a5b155c160e0351d85fe12536fe7f7f1 @x0 @u1 @x2 @x3)
     (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1))
    :pattern ((Tm_abs_a5b155c160e0351d85fe12536fe7f7f1 @x0 @u1 @x2 @x3))
    :qid typing_Tm_abs_a5b155c160e0351d85fe12536fe7f7f1))
  :named typing_Tm_abs_a5b155c160e0351d85fe12536fe7f7f1))
; typing_Tm_abs_aae8e44e94204ab25237f29d76e45f99
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(36,9-36,64); use=FStar.Algebra.Monoid.fst(36,9-36,64)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (HasType
     (Tm_abs_aae8e44e94204ab25237f29d76e45f99 @x0 @u1 @x2)
     (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1))
    :pattern ((Tm_abs_aae8e44e94204ab25237f29d76e45f99 @x0 @u1 @x2))
    :qid typing_Tm_abs_aae8e44e94204ab25237f29d76e45f99))
  :named typing_Tm_abs_aae8e44e94204ab25237f29d76e45f99))
; typing_Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03
;;; Fact-ids: Name FStar.Algebra.Monoid.associativity_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(36,9-36,64); use=FStar.Algebra.Monoid.fst(36,9-36,64)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (HasType
     (Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03 @x0 @u1 @x2 @x3 @x4)
     (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1))
    :pattern ((Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03 @x0 @u1 @x2 @x3 @x4))
    :qid typing_Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03))
  :named typing_Tm_abs_d75822d9937ad3bd4bf563d62b3c5d03))
; typing_Tm_abs_da50ab613c96608d7b80cc04e28f7cbc
;;; Fact-ids: Name FStar.Algebra.Monoid.right_unitality_lemma; Namespace FStar.Algebra.Monoid
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(30,2-30,31); use=FStar.Algebra.Monoid.fst(30,2-30,31)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (HasType
     (Tm_abs_da50ab613c96608d7b80cc04e28f7cbc @x0 @u1 @x2 @x3)
     (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x0 @u1))
    :pattern ((Tm_abs_da50ab613c96608d7b80cc04e28f7cbc @x0 @u1 @x2 @x3))
    :qid typing_Tm_abs_da50ab613c96608d7b80cc04e28f7cbc))
  :named typing_Tm_abs_da50ab613c96608d7b80cc04e28f7cbc))
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
; Starting query at FStar.Algebra.Monoid.fst(136,67-142,44)
; universe local constant
(declare-fun uu___235 () Universe)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
(declare-fun Tm_arrow_e236aecf7f1662aba597fd1ead28e470 (Universe Term) Term)
; kinding_Tm_arrow_e236aecf7f1662aba597fd1ead28e470
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(137,16-137,24); use=FStar.Algebra.Monoid.fst(137,16-140,18)
  (forall ((@u0 Universe) (@x1 Term))
   (! (HasType (Tm_arrow_e236aecf7f1662aba597fd1ead28e470 @u0 @x1) (Tm_type @u0))
    :pattern ((HasType (Tm_arrow_e236aecf7f1662aba597fd1ead28e470 @u0 @x1) (Tm_type @u0)))
    :qid kinding_Tm_arrow_e236aecf7f1662aba597fd1ead28e470))
  :named kinding_Tm_arrow_e236aecf7f1662aba597fd1ead28e470))
; pretyping
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(137,16-137,24); use=FStar.Algebra.Monoid.fst(137,16-140,18)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (Tm_arrow_e236aecf7f1662aba597fd1ead28e470 @u2 @x3))
     (is-Tm_arrow (PreType @x1)))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_arrow_e236aecf7f1662aba597fd1ead28e470 @u2 @x3)))
    :qid FStar.Algebra.Monoid_pre_typing_Tm_arrow_e236aecf7f1662aba597fd1ead28e470))
  :named FStar.Algebra.Monoid_pre_typing_Tm_arrow_e236aecf7f1662aba597fd1ead28e470))
; interpretation_Tm_arrow_e236aecf7f1662aba597fd1ead28e470
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(137,16-137,24); use=FStar.Algebra.Monoid.fst(137,16-140,18)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_e236aecf7f1662aba597fd1ead28e470 @u1 @x2))
     (and
      ;; def=FStar.Algebra.Monoid.fst(137,16-137,24); use=FStar.Algebra.Monoid.fst(137,16-140,18)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and
          (HasType @x3 (FStar.Pervasives.Native.option @u1 @x2))
          (HasType @x4 (FStar.Pervasives.Native.option @u1 @x2)))
         (HasType (ApplyTT (ApplyTT @x0 @x3) @x4) (FStar.Pervasives.Native.option @u1 @x2)))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid FStar.Algebra.Monoid_interpretation_Tm_arrow_e236aecf7f1662aba597fd1ead28e470.1))
      (IsTotFun @x0)
      ;; def=FStar.Algebra.Monoid.fst(137,16-137,24); use=FStar.Algebra.Monoid.fst(137,16-140,18)
      (forall ((@x3 Term))
       (! (implies
         (HasType @x3 (FStar.Pervasives.Native.option @u1 @x2))
         (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.Algebra.Monoid_interpretation_Tm_arrow_e236aecf7f1662aba597fd1ead28e470.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_e236aecf7f1662aba597fd1ead28e470 @u1 @x2)))
    :qid FStar.Algebra.Monoid_interpretation_Tm_arrow_e236aecf7f1662aba597fd1ead28e470))
  :named FStar.Algebra.Monoid_interpretation_Tm_arrow_e236aecf7f1662aba597fd1ead28e470))
; kick_partial_app
;;; Fact-ids: 
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.Algebra.Monoid.__proj__Monoid__item__mult @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.Algebra.Monoid.__proj__Monoid__item__mult@tok @u0) @x1) @x2))
    :pattern ((FStar.Algebra.Monoid.__proj__Monoid__item__mult @u0 @x1 @x2))
    :qid @kick_partial_app_df0310f56f6a6948f636caa8aed33320))
  :named @kick_partial_app_df0310f56f6a6948f636caa8aed33320))

(declare-fun Tm_abs_be98751468ae7066aac768486da870ba (Universe Term Term) Term)
; typing_Tm_abs_be98751468ae7066aac768486da870ba
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(138,4-140,18); use=FStar.Algebra.Monoid.fst(138,4-140,18)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType
     (Tm_abs_be98751468ae7066aac768486da870ba @u0 @x1 @x2)
     (Tm_arrow_e236aecf7f1662aba597fd1ead28e470 @u0 @x1))
    :pattern ((Tm_abs_be98751468ae7066aac768486da870ba @u0 @x1 @x2))
    :qid typing_Tm_abs_be98751468ae7066aac768486da870ba))
  :named typing_Tm_abs_be98751468ae7066aac768486da870ba))
; interpretation_Tm_abs_be98751468ae7066aac768486da870ba
;;; Fact-ids: 
(assert
 (! ;; def=FStar.Algebra.Monoid.fst(138,4-140,18); use=FStar.Algebra.Monoid.fst(138,4-140,18)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term))
   (! (=
     (ApplyTT (ApplyTT (Tm_abs_be98751468ae7066aac768486da870ba @u2 @x3 @x4) @x0) @x1)
     (let
       ((@lb5
         (FStar.Pervasives.Native.Mktuple2
          @u2
          @u2
          (FStar.Pervasives.Native.option @u2 @x3)
          (FStar.Pervasives.Native.option @u2 @x3)
          @x0
          @x1)))
      (ite
       (and
        (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_1 @lb5))
        (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_2 @lb5)))
       (FStar.Pervasives.Native.Some
        @u2
        @x3
        (ApplyTT
         (ApplyTT
          (ApplyTT (ApplyTT (FStar.Algebra.Monoid.__proj__Monoid__item__mult@tok @u2) @x3) @x4)
          (FStar.Pervasives.Native.Some_@v (FStar.Pervasives.Native.Mktuple2_@_1 @lb5)))
         (FStar.Pervasives.Native.Some_@v (FStar.Pervasives.Native.Mktuple2_@_2 @lb5))))
       (FStar.Pervasives.Native.None @u2 @x3))))
    :pattern ((ApplyTT (ApplyTT (Tm_abs_be98751468ae7066aac768486da870ba @u2 @x3 @x4) @x0) @x1))
    :qid interpretation_Tm_abs_be98751468ae7066aac768486da870ba))
  :named interpretation_Tm_abs_be98751468ae7066aac768486da870ba))
; Encoding query formula : forall (a: Type) (m: FStar.Algebra.Monoid.monoid a).
;   (* - Could not prove post-condition *)
;   forall (b:
;     (x: FStar.Pervasives.Native.option a -> y: FStar.Pervasives.Native.option a
;         -> FStar.Pervasives.Native.option a)).
;     (fun x y ->
;         (match x, y with
;           | FStar.Pervasives.Native.Some x0, FStar.Pervasives.Native.Some y0 ->
;             FStar.Pervasives.Native.Some (m.mult x0 y0)
;           | _, _ -> FStar.Pervasives.Native.None)
;         <:
;         FStar.Pervasives.Native.option a) ==
;     b ==>
;     FStar.Algebra.Monoid.right_unitality_lemma (FStar.Pervasives.Native.option a)
;       (FStar.Pervasives.Native.Some m.unit)
;       b /\
;     FStar.Algebra.Monoid.left_unitality_lemma (FStar.Pervasives.Native.option a)
;       (FStar.Pervasives.Native.Some m.unit)
;       b /\ FStar.Algebra.Monoid.associativity_lemma (FStar.Pervasives.Native.option a) b
; Context: While encoding a query
; While typechecking the top-level declaration ‘let lift_monoid_option’
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
      (and (HasType @x0 (Tm_type uu___235)) (HasType @x1 (FStar.Algebra.Monoid.monoid uu___235 @x0)))
      ;; def=Prims.fst(381,28-381,49); use=FStar.Algebra.Monoid.fst(136,67-142,44)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Tm_arrow_e236aecf7f1662aba597fd1ead28e470 uu___235 @x0))
          ;; def=FStar.Algebra.Monoid.fst(137,6-140,18); use=FStar.Algebra.Monoid.fst(137,6-140,18)
          (= (Tm_abs_be98751468ae7066aac768486da870ba uu___235 @x0 @x1) @x2))
         ;; def=FStar.Algebra.Monoid.fst(51,14-51,109); use=FStar.Algebra.Monoid.fst(142,2-142,14)
         (and
          ;; def=FStar.Algebra.Monoid.fst(51,15-51,45); use=FStar.Algebra.Monoid.fst(142,2-142,14)
          (or
           label_1
           ;; def=FStar.Algebra.Monoid.fst(51,15-51,45); use=FStar.Algebra.Monoid.fst(142,2-142,14)
           (Valid
            ;; def=FStar.Algebra.Monoid.fst(51,15-51,45); use=FStar.Algebra.Monoid.fst(142,2-142,14)
            (FStar.Algebra.Monoid.right_unitality_lemma
             uu___235
             (FStar.Pervasives.Native.option uu___235 @x0)
             (FStar.Pervasives.Native.Some
              uu___235
              @x0
              (FStar.Algebra.Monoid.__proj__Monoid__item__unit uu___235 @x0 @x1))
             @x2)))
          ;; def=FStar.Algebra.Monoid.fst(51,49-51,78); use=FStar.Algebra.Monoid.fst(142,2-142,14)
          (or
           label_2
           ;; def=FStar.Algebra.Monoid.fst(51,49-51,78); use=FStar.Algebra.Monoid.fst(142,2-142,14)
           (Valid
            ;; def=FStar.Algebra.Monoid.fst(51,49-51,78); use=FStar.Algebra.Monoid.fst(142,2-142,14)
            (FStar.Algebra.Monoid.left_unitality_lemma
             uu___235
             (FStar.Pervasives.Native.option uu___235 @x0)
             (FStar.Pervasives.Native.Some
              uu___235
              @x0
              (FStar.Algebra.Monoid.__proj__Monoid__item__unit uu___235 @x0 @x1))
             @x2)))
          ;; def=FStar.Algebra.Monoid.fst(51,82-51,108); use=FStar.Algebra.Monoid.fst(142,2-142,14)
          (or
           label_3
           ;; def=FStar.Algebra.Monoid.fst(51,82-51,108); use=FStar.Algebra.Monoid.fst(142,2-142,14)
           (Valid
            ;; def=FStar.Algebra.Monoid.fst(51,82-51,108); use=FStar.Algebra.Monoid.fst(142,2-142,14)
            (FStar.Algebra.Monoid.associativity_lemma
             uu___235
             (FStar.Pervasives.Native.option uu___235 @x0)
             @x2)))))
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
(eval label_3)
(echo "label_2")
(eval label_2)
(echo "label_1")
(eval label_1)
(echo "</labels>")
(echo "Done!")
(pop) ;; 0}pop
