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
(declare-fun FStar.PCM.Mkpcm (Universe Term Term Term Term Term Term Term) Term)
; Constructor
(declare-fun FStar.PCM.Mkpcm_ (Universe Term Term Term Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm_@0 (Term) Universe)
; Projector
(declare-fun FStar.PCM.Mkpcm_@a (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm_@assoc (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm_@assoc_r (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm_@comm (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm_@is_unit (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm_@p (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm_@refine (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm__@0 (Term) Universe)
; Projector
(declare-fun FStar.PCM.Mkpcm__@a (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm__@composable (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm__@one (Term) Term)
; Projector
(declare-fun FStar.PCM.Mkpcm__@op (Term) Term)
(declare-fun FStar.PCM.__proj__Mkpcm___item__composable (Universe Term Term) Term)
(declare-fun FStar.PCM.__proj__Mkpcm___item__composable@tok (Universe) Term)
(declare-fun FStar.PCM.__proj__Mkpcm___item__one (Universe Term Term) Term)
(declare-fun FStar.PCM.__proj__Mkpcm___item__op (Universe Term Term) Term)
(declare-fun FStar.PCM.__proj__Mkpcm___item__op@tok (Universe) Term)
(declare-fun FStar.PCM.__proj__Mkpcm__item__p (Universe Term Term) Term)
(declare-fun FStar.PCM.composable (Universe Term Term Term Term) Term)
(declare-fun FStar.PCM.lem_assoc_l (Universe Term Term) Term)
(declare-fun FStar.PCM.lem_assoc_r (Universe Term Term) Term)
(declare-fun FStar.PCM.lem_commutative (Universe Term Term) Term)
(declare-fun FStar.PCM.lem_is_unit (Universe Term Term) Term)
(declare-fun FStar.PCM.op (Universe Term Term Term Term) Term)
; Constructor
(declare-fun FStar.PCM.pcm (Universe Term) Term)
; token
(declare-fun FStar.PCM.pcm@tok (Universe) Term)
; Constructor
(declare-fun FStar.PCM.pcm_ (Universe Term) Term)
; token
(declare-fun FStar.PCM.pcm_@tok (Universe) Term)
(declare-fun FStar.PCM.symrel (Universe Term) Term)
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
(declare-fun FStar.Seq.Base.create (Universe Term Term Term) Term)
(declare-fun FStar.Seq.Base.length (Universe Term Term) Term)
(declare-fun FStar.Seq.Base.seq (Universe Term) Term)
(declare-fun Prims.bool () Term)
(declare-fun Prims.eq2 (Universe Term Term Term) Term)
(declare-fun Prims.eqtype () Term)
(declare-fun Prims.hasEq (Universe Term) Term)
(declare-fun Prims.int () Term)
(declare-fun Prims.l_Forall (Universe Term Term) Term)
(declare-fun Prims.l_True () Term)
(declare-fun Prims.l_and (Term Term) Term)
(declare-fun Prims.nat () Term)
(declare-fun Prims.op_GreaterThanOrEqual (Term Term) Term)
(declare-fun Prims.prop () Term)
(declare-fun Prims.pure_post (Universe Term) Term)
(declare-fun Prims.pure_post_ (Universe Term Term) Term)
(declare-fun Prims.unit () Term)
; Constructor
(declare-fun PulseCore.Heap.Ref (Universe Term Term Term) Term)
; Projector
(declare-fun PulseCore.Heap.Ref_@0 (Term) Universe)
; Projector
(declare-fun PulseCore.Heap.Ref_@a (Term) Term)
; Projector
(declare-fun PulseCore.Heap.Ref_@p (Term) Term)
; Projector
(declare-fun PulseCore.Heap.Ref_@v (Term) Term)
(declare-fun PulseCore.Heap.addr () Term)
; Constructor
(declare-fun PulseCore.Heap.cell (Universe) Term)
(declare-fun PulseCore.Heap.contains_addr (Universe Term Term) Term)
(declare-fun PulseCore.Heap.ctr (Universe Term) Term)
(declare-fun PulseCore.Heap.disjoint (Universe Term Term) Term)
(declare-fun PulseCore.Heap.disjoint_addr (Universe Term Term Term) Term)
(declare-fun PulseCore.Heap.disjoint_cells (Universe Term Term) Term)
(declare-fun PulseCore.Heap.empty_heap (Universe) Term)
(declare-fun PulseCore.Heap.empty_heap_ (Universe Term) Term)
(declare-fun PulseCore.Heap.heap (Universe) Term)
(declare-fun PulseCore.Heap.join (Universe Term Term) Term)
(declare-fun PulseCore.Heap.join_cells (Universe Term Term) Term)
(declare-fun PulseCore.Heap.max (Term Term) Term)
(declare-fun PulseCore.Heap.mem_equiv (Universe Term Term) Term)
(declare-fun PulseCore.Heap.select (Universe Term Term) Term)
(declare-fun Tm_abs_520c1999e88cc0354a39b631f422ea87 (Universe Term Term) Term)
(declare-fun Tm_abs_7ae4b74ad2694204c5d0733b63d0a941 (Universe Term Term) Term)
(declare-fun Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6 () Term)
(declare-fun Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d (Term Universe Term) Term)
(declare-fun Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e (Term Universe Term) Term)
(declare-fun Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d () Term)
(declare-fun Tm_arrow_b3fac581c29dc335883c32c911e60a35 (Universe) Term)
(declare-fun Tm_arrow_c71e8e57f344346f459228466fb8d275 (Universe) Term)
(declare-fun Tm_arrow_da5936f5874c2d80cb185c7556127efb (Term Universe Term) Term)
(declare-fun Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d (Term Universe Term) Term)
(declare-fun Tm_arrow_e14da214a54226494910be7e049c0cf9 (Term Universe Term) Term)
(declare-fun Tm_arrow_e1534e83cb62e69f328ebb02235e963c (Term Universe Term) Term)
(declare-fun Tm_arrow_e45db00acd4175c5113071bde065fbe3 (Term Universe) Term)
(declare-fun Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 (Term Universe) Term)
(declare-fun Tm_arrow_eed220cc6714c2e2d27bc073c82dad19 (Universe Term Term) Term)
(declare-fun Tm_refine_008234c63858379db49cc5ea2545247b (Universe Term Term Term Term Term) Term)
(declare-fun Tm_refine_0c9cc7066f159da9f2304f36bc009670 (Universe Term Term Term) Term)
(declare-fun Tm_refine_542f9d4f129664613f2483a6c88bc7c2 () Term)
(declare-fun Tm_refine_8e674d733943b7a0a4e1fd1da53454ca (Universe Term) Term)
(declare-fun Tm_refine_9d6af3f3535473623f7aec2f0501897f () Term)
(declare-fun Tm_refine_b12092c65c1c48799fb8f0642b431935 (Universe Term Term Term) Term)
(declare-fun Tm_refine_b36aec17ab518ffeb2440b8fbbd36093 (Universe Term Term Term Term) Term)
(declare-fun Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4 (Universe Term Term Term) Term)
(declare-fun Tm_refine_b8db5a672f5081a8d8af76d8f5919128 (Universe Term Term Term Term) Term)
(declare-fun Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db (Universe Term) Term)
(declare-fun Tm_refine_d19534a0bb80160c41d95f9649f0003f (Universe Term) Term)
(declare-fun Tm_refine_d79dab86b7f5fc89b7215ab23d0f2c81 (Universe Term Term) Term)
(declare-fun Tm_refine_e4bacacd37ffee86dbfec609a586dee4 (Universe Term Term Term) Term)
(declare-fun Tm_refine_e999f29571cb29862018b18f47c1eeaf (Universe Term Term Term Term) Term)
(declare-fun Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca (Universe Term Term Term Term Term) Term)
; Discriminator definition
(define-fun is-FStar.PCM.Mkpcm ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 167)
  (=
   __@x0
   (FStar.PCM.Mkpcm
    (FStar.PCM.Mkpcm_@0 __@x0)
    (FStar.PCM.Mkpcm_@a __@x0)
    (FStar.PCM.Mkpcm_@p __@x0)
    (FStar.PCM.Mkpcm_@comm __@x0)
    (FStar.PCM.Mkpcm_@assoc __@x0)
    (FStar.PCM.Mkpcm_@assoc_r __@x0)
    (FStar.PCM.Mkpcm_@is_unit __@x0)
    (FStar.PCM.Mkpcm_@refine __@x0)))))
; Discriminator definition
(define-fun is-FStar.PCM.Mkpcm_ ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 116)
  (=
   __@x0
   (FStar.PCM.Mkpcm_
    (FStar.PCM.Mkpcm__@0 __@x0)
    (FStar.PCM.Mkpcm__@a __@x0)
    (FStar.PCM.Mkpcm__@composable __@x0)
    (FStar.PCM.Mkpcm__@op __@x0)
    (FStar.PCM.Mkpcm__@one __@x0)))))
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
; Discriminator definition
(define-fun is-PulseCore.Heap.Ref ((__@x0 Term)) Bool
 (and
  (= (Term_constr_id __@x0) 112)
  (=
   __@x0
   (PulseCore.Heap.Ref
    (PulseCore.Heap.Ref_@0 __@x0)
    (PulseCore.Heap.Ref_@a __@x0)
    (PulseCore.Heap.Ref_@p __@x0)
    (PulseCore.Heap.Ref_@v __@x0)))))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.lem_commutative; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2))
    :qid @kick_partial_app_335fda1b48d36a3424186cffa635ae8d))
  :named @kick_partial_app_335fda1b48d36a3424186cffa635ae8d))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.lem_is_unit; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2))
    :qid @kick_partial_app_436db091fc4b2d56197d3841696181df))
  :named @kick_partial_app_436db091fc4b2d56197d3841696181df))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2))
    :qid @kick_partial_app_45afe2678f3414e63b2e7eb69ecddacc))
  :named @kick_partial_app_45afe2678f3414e63b2e7eb69ecddacc))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
    :qid @kick_partial_app_6fa2ebc6a9c778cf6b31ffddfc3e3608))
  :named @kick_partial_app_6fa2ebc6a9c778cf6b31ffddfc3e3608))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
    :qid @kick_partial_app_771bb4582ca119ee2ee1395d0ea2d5ee))
  :named @kick_partial_app_771bb4582ca119ee2ee1395d0ea2d5ee))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2))
    :qid @kick_partial_app_95fe4ee9ca85a4800072dfe9b58cae5f))
  :named @kick_partial_app_95fe4ee9ca85a4800072dfe9b58cae5f))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.op; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2))
    :qid @kick_partial_app_9ccdf930e1b77ca6b448205da2711b53))
  :named @kick_partial_app_9ccdf930e1b77ca6b448205da2711b53))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.lem_commutative; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
    :qid @kick_partial_app_b1d19268ee005db70d79125407c35261))
  :named @kick_partial_app_b1d19268ee005db70d79125407c35261))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.lem_is_unit; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
    :qid @kick_partial_app_c5d68eb3438047083f46dbafca626914))
  :named @kick_partial_app_c5d68eb3438047083f46dbafca626914))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.composable; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
    :qid @kick_partial_app_c7c6d078d7716cd3715265ca8fa0ce55))
  :named @kick_partial_app_c7c6d078d7716cd3715265ca8fa0ce55))
; kick_partial_app
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2)
     (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0) @x1) @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
    :qid @kick_partial_app_dcc9b456bd5f232a4b591bc61d6d90f8))
  :named @kick_partial_app_dcc9b456bd5f232a4b591bc61d6d90f8))
; interpretation_Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(41,18-47,48); use=FStar.PCM.fst(42,4-47,48)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d @x1 @u2 @x3))
     (and
      ;; def=FStar.PCM.fst(41,18-47,48); use=FStar.PCM.fst(42,4-47,48)
      (forall ((@x4 Term) (@x5 Term) (@x6 Term))
       (! (implies
         (and
          (HasType @x4 @x1)
          (HasType @x5 @x1)
          (HasType @x6 (Tm_refine_e999f29571cb29862018b18f47c1eeaf @u2 @x1 @x3 @x5 @x4)))
         (HasType
          (ApplyTT (ApplyTT (ApplyTT @x0 @x4) @x5) @x6)
          (Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca @u2 @x1 @x3 @x4 @x5 @x6)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT @x0 @x4) @x5) @x6))
        :qid FStar.PCM_interpretation_Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d.1))
      (IsTotFun @x0)
      ;; def=FStar.PCM.fst(41,18-47,48); use=FStar.PCM.fst(42,4-47,48)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 @x1) (IsTotFun (ApplyTT @x0 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid FStar.PCM_interpretation_Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d.2))
      ;; def=FStar.PCM.fst(41,18-47,48); use=FStar.PCM.fst(42,4-47,48)
      (forall ((@x4 Term) (@x5 Term))
       (! (implies
         (and (HasType @x4 @x1) (HasType @x5 @x1))
         (IsTotFun (ApplyTT (ApplyTT @x0 @x4) @x5)))
        :pattern ((ApplyTT (ApplyTT @x0 @x4) @x5))
        :qid FStar.PCM_interpretation_Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d.3))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d @x1 @u2 @x3)))
    :qid FStar.PCM_interpretation_Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d))
  :named FStar.PCM_interpretation_Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d))
; interpretation_Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e
;;; Fact-ids: Name FStar.PCM.lem_is_unit; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(62,18-65,27); use=FStar.PCM.fst(63,4-65,27)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e @x1 @u2 @x3))
     (and
      ;; def=FStar.PCM.fst(62,18-65,27); use=FStar.PCM.fst(63,4-65,27)
      (forall ((@x4 Term))
       (! (implies
         (HasType @x4 @x1)
         (HasType (ApplyTT @x0 @x4) (Tm_refine_b12092c65c1c48799fb8f0642b431935 @u2 @x1 @x3 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid FStar.PCM_interpretation_Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 (Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e @x1 @u2 @x3)))
    :qid FStar.PCM_interpretation_Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e))
  :named FStar.PCM_interpretation_Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e))
; interpretation_Tm_arrow_b3fac581c29dc335883c32c911e60a35
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-30,32); use=FStar.PCM.fst(28,5-30,32)
  (forall ((@x0 Term) (@u1 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_b3fac581c29dc335883c32c911e60a35 @u1))
     (and
      ;; def=FStar.PCM.fst(28,5-30,32); use=FStar.PCM.fst(28,5-30,32)
      (forall ((@x2 Term) (@x3 Term))
       (! (implies
         (and (HasType @x2 (Tm_type @u1)) (HasType @x3 (FStar.PCM.pcm_ @u1 @x2)))
         (HasType
          (ApplyTT (ApplyTT @x0 @x2) @x3)
          (Tm_arrow_da5936f5874c2d80cb185c7556127efb @x2 @u1 @x3)))
        :pattern ((ApplyTT (ApplyTT @x0 @x2) @x3))
        :qid FStar.PCM_interpretation_Tm_arrow_b3fac581c29dc335883c32c911e60a35.1))
      (IsTotFun @x0)
      ;; def=FStar.PCM.fst(28,5-30,32); use=FStar.PCM.fst(28,5-30,32)
      (forall ((@x2 Term))
       (! (implies (HasType @x2 (Tm_type @u1)) (IsTotFun (ApplyTT @x0 @x2)))
        :pattern ((ApplyTT @x0 @x2))
        :qid FStar.PCM_interpretation_Tm_arrow_b3fac581c29dc335883c32c911e60a35.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_b3fac581c29dc335883c32c911e60a35 @u1)))
    :qid FStar.PCM_interpretation_Tm_arrow_b3fac581c29dc335883c32c911e60a35))
  :named FStar.PCM_interpretation_Tm_arrow_b3fac581c29dc335883c32c911e60a35))
; interpretation_Tm_arrow_c71e8e57f344346f459228466fb8d275
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__composable; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-29,22); use=FStar.PCM.fst(28,5-29,22)
  (forall ((@x0 Term) (@u1 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_c71e8e57f344346f459228466fb8d275 @u1))
     (and
      ;; def=FStar.PCM.fst(28,5-29,22); use=FStar.PCM.fst(28,5-29,22)
      (forall ((@x2 Term) (@x3 Term))
       (! (implies
         (and (HasType @x2 (Tm_type @u1)) (HasType @x3 (FStar.PCM.pcm_ @u1 @x2)))
         (HasType (ApplyTT (ApplyTT @x0 @x2) @x3) (FStar.PCM.symrel @u1 @x2)))
        :pattern ((ApplyTT (ApplyTT @x0 @x2) @x3))
        :qid FStar.PCM_interpretation_Tm_arrow_c71e8e57f344346f459228466fb8d275.1))
      (IsTotFun @x0)
      ;; def=FStar.PCM.fst(28,5-29,22); use=FStar.PCM.fst(28,5-29,22)
      (forall ((@x2 Term))
       (! (implies (HasType @x2 (Tm_type @u1)) (IsTotFun (ApplyTT @x0 @x2)))
        :pattern ((ApplyTT @x0 @x2))
        :qid FStar.PCM_interpretation_Tm_arrow_c71e8e57f344346f459228466fb8d275.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_c71e8e57f344346f459228466fb8d275 @u1)))
    :qid FStar.PCM_interpretation_Tm_arrow_c71e8e57f344346f459228466fb8d275))
  :named FStar.PCM_interpretation_Tm_arrow_c71e8e57f344346f459228466fb8d275))
; interpretation_Tm_arrow_da5936f5874c2d80cb185c7556127efb
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,11-30,32); use=FStar.PCM.fst(28,11-30,32)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_da5936f5874c2d80cb185c7556127efb @x1 @u2 @x3))
     (and
      ;; def=FStar.PCM.fst(28,11-30,32); use=FStar.PCM.fst(28,11-30,32)
      (forall ((@x4 Term) (@x5 Term))
       (! (implies
         (and
          (HasType @x4 @x1)
          (HasType @x5 (Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4 @u2 @x1 @x3 @x4)))
         (HasType (ApplyTT (ApplyTT @x0 @x4) @x5) @x1))
        :pattern ((ApplyTT (ApplyTT @x0 @x4) @x5))
        :qid FStar.PCM_interpretation_Tm_arrow_da5936f5874c2d80cb185c7556127efb.1))
      (IsTotFun @x0)
      ;; def=FStar.PCM.fst(28,11-30,32); use=FStar.PCM.fst(28,11-30,32)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 @x1) (IsTotFun (ApplyTT @x0 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid FStar.PCM_interpretation_Tm_arrow_da5936f5874c2d80cb185c7556127efb.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_da5936f5874c2d80cb185c7556127efb @x1 @u2 @x3)))
    :qid FStar.PCM_interpretation_Tm_arrow_da5936f5874c2d80cb185c7556127efb))
  :named FStar.PCM_interpretation_Tm_arrow_da5936f5874c2d80cb185c7556127efb))
; interpretation_Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d
;;; Fact-ids: Name FStar.PCM.lem_commutative; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(35,22-38,32); use=FStar.PCM.fst(36,4-38,32)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d @x1 @u2 @x3))
     (and
      ;; def=FStar.PCM.fst(35,22-38,32); use=FStar.PCM.fst(36,4-38,32)
      (forall ((@x4 Term) (@x5 Term))
       (! (implies
         (and
          (HasType @x4 @x1)
          (HasType @x5 (Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4 @u2 @x1 @x3 @x4)))
         (HasType
          (ApplyTT (ApplyTT @x0 @x4) @x5)
          (Tm_refine_b8db5a672f5081a8d8af76d8f5919128 @u2 @x1 @x3 @x4 @x5)))
        :pattern ((ApplyTT (ApplyTT @x0 @x4) @x5))
        :qid FStar.PCM_interpretation_Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d.1))
      (IsTotFun @x0)
      ;; def=FStar.PCM.fst(35,22-38,32); use=FStar.PCM.fst(36,4-38,32)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 @x1) (IsTotFun (ApplyTT @x0 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid FStar.PCM_interpretation_Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d @x1 @u2 @x3)))
    :qid FStar.PCM_interpretation_Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d))
  :named FStar.PCM_interpretation_Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d))
; interpretation_Tm_arrow_e14da214a54226494910be7e049c0cf9
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(51,18-59,46); use=FStar.PCM.fst(52,4-59,46)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_e14da214a54226494910be7e049c0cf9 @x1 @u2 @x3))
     (and
      ;; def=FStar.PCM.fst(51,18-59,46); use=FStar.PCM.fst(52,4-59,46)
      (forall ((@x4 Term) (@x5 Term) (@x6 Term))
       (! (implies
         (and
          (HasType @x4 @x1)
          (HasType @x5 @x1)
          (HasType @x6 (Tm_refine_b36aec17ab518ffeb2440b8fbbd36093 @u2 @x1 @x3 @x4 @x5)))
         (HasType
          (ApplyTT (ApplyTT (ApplyTT @x0 @x4) @x5) @x6)
          (Tm_refine_008234c63858379db49cc5ea2545247b @u2 @x1 @x3 @x5 @x6 @x4)))
        :pattern ((ApplyTT (ApplyTT (ApplyTT @x0 @x4) @x5) @x6))
        :qid FStar.PCM_interpretation_Tm_arrow_e14da214a54226494910be7e049c0cf9.1))
      (IsTotFun @x0)
      ;; def=FStar.PCM.fst(51,18-59,46); use=FStar.PCM.fst(52,4-59,46)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 @x1) (IsTotFun (ApplyTT @x0 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid FStar.PCM_interpretation_Tm_arrow_e14da214a54226494910be7e049c0cf9.2))
      ;; def=FStar.PCM.fst(51,18-59,46); use=FStar.PCM.fst(52,4-59,46)
      (forall ((@x4 Term) (@x5 Term))
       (! (implies
         (and (HasType @x4 @x1) (HasType @x5 @x1))
         (IsTotFun (ApplyTT (ApplyTT @x0 @x4) @x5)))
        :pattern ((ApplyTT (ApplyTT @x0 @x4) @x5))
        :qid FStar.PCM_interpretation_Tm_arrow_e14da214a54226494910be7e049c0cf9.3))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_e14da214a54226494910be7e049c0cf9 @x1 @u2 @x3)))
    :qid FStar.PCM_interpretation_Tm_arrow_e14da214a54226494910be7e049c0cf9))
  :named FStar.PCM_interpretation_Tm_arrow_e14da214a54226494910be7e049c0cf9))
; interpretation_Tm_arrow_e1534e83cb62e69f328ebb02235e963c
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,11-30,32); use=FStar.PCM.fst(30,8-30,37)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_e1534e83cb62e69f328ebb02235e963c @x1 @u2 @x3))
     (and
      ;; def=FStar.PCM.fst(28,11-30,32); use=FStar.PCM.fst(30,8-30,37)
      (forall ((@x4 Term) (@x5 Term))
       (! (implies
         (and
          (HasType @x4 @x1)
          (HasType @x5 (Tm_refine_0c9cc7066f159da9f2304f36bc009670 @u2 @x3 @x4 @x1)))
         (HasType (ApplyTT (ApplyTT @x0 @x4) @x5) @x1))
        :pattern ((ApplyTT (ApplyTT @x0 @x4) @x5))
        :qid FStar.PCM_interpretation_Tm_arrow_e1534e83cb62e69f328ebb02235e963c.1))
      (IsTotFun @x0)
      ;; def=FStar.PCM.fst(28,11-30,32); use=FStar.PCM.fst(30,8-30,37)
      (forall ((@x4 Term))
       (! (implies (HasType @x4 @x1) (IsTotFun (ApplyTT @x0 @x4)))
        :pattern ((ApplyTT @x0 @x4))
        :qid FStar.PCM_interpretation_Tm_arrow_e1534e83cb62e69f328ebb02235e963c.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_e1534e83cb62e69f328ebb02235e963c @x1 @u2 @x3)))
    :qid FStar.PCM_interpretation_Tm_arrow_e1534e83cb62e69f328ebb02235e963c))
  :named FStar.PCM_interpretation_Tm_arrow_e1534e83cb62e69f328ebb02235e963c))
; interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3
;;; Fact-ids: Name FStar.PCM.symrel; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(24,12-24,44); use=FStar.PCM.fst(24,30-24,44)
  (forall ((@x0 Term) (@x1 Term) (@u2 Universe))
   (! (iff
     (HasTypeZ @x0 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x1 @u2))
     (and
      ;; def=FStar.PCM.fst(24,12-24,44); use=FStar.PCM.fst(24,30-24,44)
      (forall ((@x3 Term) (@x4 Term))
       (! (implies
         (and (HasType @x3 @x1) (HasType @x4 @x1))
         (HasType (ApplyTT (ApplyTT @x0 @x3) @x4) Prims.prop))
        :pattern ((ApplyTT (ApplyTT @x0 @x3) @x4))
        :qid FStar.PCM_interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3.1))
      (IsTotFun @x0)
      ;; def=FStar.PCM.fst(24,12-24,44); use=FStar.PCM.fst(24,30-24,44)
      (forall ((@x3 Term))
       (! (implies (HasType @x3 @x1) (IsTotFun (ApplyTT @x0 @x3)))
        :pattern ((ApplyTT @x0 @x3))
        :qid FStar.PCM_interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3.2))))
    :pattern ((HasTypeZ @x0 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x1 @u2)))
    :qid FStar.PCM_interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3))
  :named FStar.PCM_interpretation_Tm_arrow_e45db00acd4175c5113071bde065fbe3))
; interpretation_Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6
;;; Fact-ids: Name FStar.Seq.Properties.found; Namespace FStar.Seq.Properties
(assert
 (! ;; def=FStar.Seq.Properties.fsti(380,14-380,17); use=FStar.Seq.Properties.fsti(380,14-380,25)
  (forall ((@x0 Term))
   (! (iff
     (HasTypeZ @x0 Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6)
     (and
      ;; def=FStar.Seq.Properties.fsti(380,14-380,17); use=FStar.Seq.Properties.fsti(380,14-380,25)
      (forall ((@x1 Term))
       (! (implies (HasType @x1 Prims.nat) (HasType (ApplyTT @x0 @x1) Prims.prop))
        :pattern ((ApplyTT @x0 @x1))
        :qid FStar.Seq.Properties_interpretation_Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6))
    :qid FStar.Seq.Properties_interpretation_Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6))
  :named FStar.Seq.Properties_interpretation_Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6))
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
; interpretation_Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d
;;; Fact-ids: Name PulseCore.Heap.disjoint; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(85,38-85,42); use=PulseCore.Heap.fst(118,11-118,12)
  (forall ((@x0 Term))
   (! (iff
     (HasTypeZ @x0 Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d)
     (and
      ;; def=PulseCore.Heap.fst(85,38-85,42); use=PulseCore.Heap.fst(118,11-118,12)
      (forall ((@x1 Term))
       (! (implies (HasType @x1 PulseCore.Heap.addr) (HasType (ApplyTT @x0 @x1) Prims.prop))
        :pattern ((ApplyTT @x0 @x1))
        :qid PulseCore.Heap_interpretation_Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d.1))
      (IsTotFun @x0)))
    :pattern ((HasTypeZ @x0 Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d))
    :qid PulseCore.Heap_interpretation_Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d))
  :named PulseCore.Heap_interpretation_Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d))
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
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= 167 (Term_constr_id (FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)))
    :pattern ((FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid constructor_distinct_FStar.PCM.Mkpcm))
  :named constructor_distinct_FStar.PCM.Mkpcm))
; Constructor distinct
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= 116 (Term_constr_id (FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4)))
    :pattern ((FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4))
    :qid constructor_distinct_FStar.PCM.Mkpcm_))
  :named constructor_distinct_FStar.PCM.Mkpcm_))
; Constructor distinct
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 158 (Term_constr_id (FStar.PCM.pcm @u0 @x1)))
    :pattern ((FStar.PCM.pcm @u0 @x1))
    :qid constructor_distinct_FStar.PCM.pcm))
  :named constructor_distinct_FStar.PCM.pcm))
; Constructor distinct
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= 106 (Term_constr_id (FStar.PCM.pcm_ @u0 @x1)))
    :pattern ((FStar.PCM.pcm_ @u0 @x1))
    :qid constructor_distinct_FStar.PCM.pcm_))
  :named constructor_distinct_FStar.PCM.pcm_))
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
; Constructor distinct
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(41,4-41,7); use=PulseCore.Heap.fsti(41,4-41,7)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= 112 (Term_constr_id (PulseCore.Heap.Ref @u0 @x1 @x2 @x3)))
    :pattern ((PulseCore.Heap.Ref @u0 @x1 @x2 @x3))
    :qid constructor_distinct_PulseCore.Heap.Ref))
  :named constructor_distinct_PulseCore.Heap.Ref))
; Constructor distinct
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(40,5-40,9); use=PulseCore.Heap.fsti(40,5-40,9)
  (forall ((@u0 Universe))
   (! (= 106 (Term_constr_id (PulseCore.Heap.cell @u0)))
    :pattern ((PulseCore.Heap.cell @u0))
    :qid constructor_distinct_PulseCore.Heap.cell))
  :named constructor_distinct_PulseCore.Heap.cell))
; data constructor typing elim
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
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
     (HasTypeFuel
      (SFuel @u0)
      (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)
      (FStar.PCM.pcm @u1 @x9))
     (and
      (HasTypeFuel @u0 @x9 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 (FStar.PCM.pcm_ @u1 @x9))
      (HasTypeFuel @u0 @x4 (FStar.PCM.lem_commutative @u1 @x9 @x3))
      (HasTypeFuel @u0 @x5 (FStar.PCM.lem_assoc_l @u1 @x9 @x3))
      (HasTypeFuel @u0 @x6 (FStar.PCM.lem_assoc_r @u1 @x9 @x3))
      (HasTypeFuel @u0 @x7 (FStar.PCM.lem_is_unit @u1 @x9 @x3))
      (HasTypeFuel @u0 @x8 (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x9 @u1))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)
       (FStar.PCM.pcm @u1 @x9)))
    :qid data_elim_FStar.PCM.Mkpcm))
  :named data_elim_FStar.PCM.Mkpcm))
; data constructor typing elim
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) (FStar.PCM.Mkpcm_ @u1 @x2 @x3 @x4 @x5) (FStar.PCM.pcm_ @u1 @x6))
     (and
      (HasTypeFuel @u0 @x6 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 (FStar.PCM.symrel @u1 @x6))
      (HasTypeFuel @u0 @x4 (Tm_arrow_e1534e83cb62e69f328ebb02235e963c @x6 @u1 @x3))
      (HasTypeFuel @u0 @x5 @x6)))
    :pattern
     ((HasTypeFuel (SFuel @u0) (FStar.PCM.Mkpcm_ @u1 @x2 @x3 @x4 @x5) (FStar.PCM.pcm_ @u1 @x6)))
    :qid data_elim_FStar.PCM.Mkpcm_))
  :named data_elim_FStar.PCM.Mkpcm_))
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
; data constructor typing elim
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(41,4-41,7); use=PulseCore.Heap.fsti(41,4-41,7)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) (PulseCore.Heap.Ref @u1 @x2 @x3 @x4) (PulseCore.Heap.cell @u1))
     (and
      (HasTypeFuel @u0 @x2 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 (FStar.PCM.pcm @u1 @x2))
      (HasTypeFuel @u0 @x4 @x2)))
    :pattern
     ((HasTypeFuel (SFuel @u0) (PulseCore.Heap.Ref @u1 @x2 @x3 @x4) (PulseCore.Heap.cell @u1)))
    :qid data_elim_PulseCore.Heap.Ref))
  :named data_elim_PulseCore.Heap.Ref))
; data constructor typing intro
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
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
     (and
      (HasTypeFuel @u0 @x2 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 (FStar.PCM.pcm_ @u1 @x2))
      (HasTypeFuel @u0 @x4 (FStar.PCM.lem_commutative @u1 @x2 @x3))
      (HasTypeFuel @u0 @x5 (FStar.PCM.lem_assoc_l @u1 @x2 @x3))
      (HasTypeFuel @u0 @x6 (FStar.PCM.lem_assoc_r @u1 @x2 @x3))
      (HasTypeFuel @u0 @x7 (FStar.PCM.lem_is_unit @u1 @x2 @x3))
      (HasTypeFuel @u0 @x8 (Tm_arrow_eb6b0d19c4d8aa97d1954ddb31b16d45 @x2 @u1)))
     (HasTypeFuel @u0 (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8) (FStar.PCM.pcm @u1 @x2)))
    :pattern
     ((HasTypeFuel @u0 (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8) (FStar.PCM.pcm @u1 @x2)))
    :qid data_typing_intro_FStar.PCM.Mkpcm@tok))
  :named data_typing_intro_FStar.PCM.Mkpcm@tok))
; data constructor typing intro
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x2 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 (FStar.PCM.symrel @u1 @x2))
      (HasTypeFuel @u0 @x4 (Tm_arrow_e1534e83cb62e69f328ebb02235e963c @x2 @u1 @x3))
      (HasTypeFuel @u0 @x5 @x2))
     (HasTypeFuel @u0 (FStar.PCM.Mkpcm_ @u1 @x2 @x3 @x4 @x5) (FStar.PCM.pcm_ @u1 @x2)))
    :pattern ((HasTypeFuel @u0 (FStar.PCM.Mkpcm_ @u1 @x2 @x3 @x4 @x5) (FStar.PCM.pcm_ @u1 @x2)))
    :qid data_typing_intro_FStar.PCM.Mkpcm_@tok))
  :named data_typing_intro_FStar.PCM.Mkpcm_@tok))
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
; data constructor typing intro
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(41,4-41,7); use=PulseCore.Heap.fsti(41,4-41,7)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasTypeFuel @u0 @x2 (Tm_type @u1))
      (HasTypeFuel @u0 @x3 (FStar.PCM.pcm @u1 @x2))
      (HasTypeFuel @u0 @x4 @x2))
     (HasTypeFuel @u0 (PulseCore.Heap.Ref @u1 @x2 @x3 @x4) (PulseCore.Heap.cell @u1)))
    :pattern ((HasTypeFuel @u0 (PulseCore.Heap.Ref @u1 @x2 @x3 @x4) (PulseCore.Heap.cell @u1)))
    :qid data_typing_intro_PulseCore.Heap.Ref@tok))
  :named data_typing_intro_PulseCore.Heap.Ref@tok))
; Equation for PulseCore.Heap.disjoint
;;; Fact-ids: Name PulseCore.Heap.disjoint; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(116,4-116,12); use=PulseCore.Heap.fst(116,4-116,12)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (PulseCore.Heap.disjoint @u0 @x1 @x2)
     (Prims.l_Forall
      U_zero
      PulseCore.Heap.addr
      (Tm_abs_520c1999e88cc0354a39b631f422ea87 @u0 @x1 @x2)))
    :pattern ((PulseCore.Heap.disjoint @u0 @x1 @x2))
    :qid defn_equation_PulseCore.Heap.disjoint))
  :named defn_equation_PulseCore.Heap.disjoint))
; Equation for PulseCore.Heap.mem_equiv
;;; Fact-ids: Name PulseCore.Heap.mem_equiv; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(200,4-200,13); use=PulseCore.Heap.fst(200,4-200,13)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (PulseCore.Heap.mem_equiv @u0 @x1 @x2)
     (Prims.l_and
      (Prims.eq2 U_zero Prims.nat (PulseCore.Heap.ctr @u0 @x1) (PulseCore.Heap.ctr @u0 @x2))
      (Prims.l_Forall U_zero Prims.nat (Tm_abs_7ae4b74ad2694204c5d0733b63d0a941 @u0 @x1 @x2))))
    :pattern ((PulseCore.Heap.mem_equiv @u0 @x1 @x2))
    :qid defn_equation_PulseCore.Heap.mem_equiv))
  :named defn_equation_PulseCore.Heap.mem_equiv))
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
; Equation for FStar.PCM.composable
;;; Fact-ids: Name FStar.PCM.composable; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(82,4-82,14); use=FStar.PCM.fst(82,4-82,14)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.PCM.composable @u0 @x1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT
       (ApplyTT
        (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0) @x1)
        (FStar.PCM.__proj__Mkpcm__item__p @u0 @x1 @x2))
       @x3)
      @x4))
    :pattern ((FStar.PCM.composable @u0 @x1 @x2 @x3 @x4))
    :qid equation_FStar.PCM.composable))
  :named equation_FStar.PCM.composable))
; Equation for FStar.PCM.lem_assoc_l
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(41,4-41,15); use=FStar.PCM.fst(41,4-41,15)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.PCM.lem_assoc_l @u0 @x1 @x2) (Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d @x1 @u0 @x2))
    :pattern ((FStar.PCM.lem_assoc_l @u0 @x1 @x2))
    :qid equation_FStar.PCM.lem_assoc_l))
  :named equation_FStar.PCM.lem_assoc_l))
; Equation for FStar.PCM.lem_assoc_r
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(51,4-51,15); use=FStar.PCM.fst(51,4-51,15)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.PCM.lem_assoc_r @u0 @x1 @x2) (Tm_arrow_e14da214a54226494910be7e049c0cf9 @x1 @u0 @x2))
    :pattern ((FStar.PCM.lem_assoc_r @u0 @x1 @x2))
    :qid equation_FStar.PCM.lem_assoc_r))
  :named equation_FStar.PCM.lem_assoc_r))
; Equation for FStar.PCM.lem_commutative
;;; Fact-ids: Name FStar.PCM.lem_commutative; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(35,4-35,19); use=FStar.PCM.fst(35,4-35,19)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (FStar.PCM.lem_commutative @u0 @x1 @x2)
     (Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d @x1 @u0 @x2))
    :pattern ((FStar.PCM.lem_commutative @u0 @x1 @x2))
    :qid equation_FStar.PCM.lem_commutative))
  :named equation_FStar.PCM.lem_commutative))
; Equation for FStar.PCM.lem_is_unit
;;; Fact-ids: Name FStar.PCM.lem_is_unit; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(62,4-62,15); use=FStar.PCM.fst(62,4-62,15)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.PCM.lem_is_unit @u0 @x1 @x2) (Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e @x1 @u0 @x2))
    :pattern ((FStar.PCM.lem_is_unit @u0 @x1 @x2))
    :qid equation_FStar.PCM.lem_is_unit))
  :named equation_FStar.PCM.lem_is_unit))
; Equation for FStar.PCM.op
;;; Fact-ids: Name FStar.PCM.op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(85,4-85,6); use=FStar.PCM.fst(85,4-85,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (=
     (FStar.PCM.op @u0 @x1 @x2 @x3 @x4)
     (ApplyTT
      (ApplyTT
       (ApplyTT
        (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u0) @x1)
        (FStar.PCM.__proj__Mkpcm__item__p @u0 @x1 @x2))
       @x3)
      @x4))
    :pattern ((FStar.PCM.op @u0 @x1 @x2 @x3 @x4))
    :qid equation_FStar.PCM.op))
  :named equation_FStar.PCM.op))
; Equation for FStar.PCM.symrel
;;; Fact-ids: Name FStar.PCM.symrel; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(24,4-24,10); use=FStar.PCM.fst(24,4-24,10)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (FStar.PCM.symrel @u0 @x1) (Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db @u0 @x1))
    :pattern ((FStar.PCM.symrel @u0 @x1))
    :qid equation_FStar.PCM.symrel))
  :named equation_FStar.PCM.symrel))
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
; Equation for PulseCore.Heap.addr
;;; Fact-ids: Name PulseCore.Heap.addr; Namespace PulseCore.Heap
(assert
 (! (= PulseCore.Heap.addr Prims.nat) :named equation_PulseCore.Heap.addr))
; Equation for PulseCore.Heap.contains_addr
;;; Fact-ids: Name PulseCore.Heap.contains_addr; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(43,4-43,17); use=PulseCore.Heap.fst(43,4-43,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (PulseCore.Heap.contains_addr @u0 @x1 @x2)
     (FStar.Pervasives.Native.uu___is_Some
      (U_succ @u0)
      (PulseCore.Heap.cell @u0)
      (PulseCore.Heap.select @u0 @x2 @x1)))
    :pattern ((PulseCore.Heap.contains_addr @u0 @x1 @x2))
    :qid equation_PulseCore.Heap.contains_addr))
  :named equation_PulseCore.Heap.contains_addr))
; Equation for PulseCore.Heap.ctr
;;; Fact-ids: Name PulseCore.Heap.ctr; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(28,4-28,7); use=PulseCore.Heap.fst(28,4-28,7)
  (forall ((@u0 Universe) (@x1 Term))
   (! (=
     (PulseCore.Heap.ctr @u0 @x1)
     (FStar.Seq.Base.length
      (U_succ @u0)
      (FStar.Pervasives.Native.option (U_succ @u0) (PulseCore.Heap.cell @u0))
      @x1))
    :pattern ((PulseCore.Heap.ctr @u0 @x1))
    :qid equation_PulseCore.Heap.ctr))
  :named equation_PulseCore.Heap.ctr))
; Equation for PulseCore.Heap.disjoint
;;; Fact-ids: Name PulseCore.Heap.disjoint; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(116,4-116,12); use=PulseCore.Heap.fst(116,4-116,12)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (Valid (PulseCore.Heap.disjoint @u0 @x1 @x2))
     ;; def=PulseCore.Heap.fst(118,4-118,35); use=PulseCore.Heap.fst(118,4-118,35)
     (forall ((@x3 Term))
      (! (implies
        (HasType @x3 PulseCore.Heap.addr)
        ;; def=PulseCore.Heap.fst(118,14-118,35); use=PulseCore.Heap.fst(118,14-118,35)
        (Valid
         ;; def=PulseCore.Heap.fst(118,14-118,35); use=PulseCore.Heap.fst(118,14-118,35)
         (PulseCore.Heap.disjoint_addr @u0 @x1 @x2 @x3)))
       :qid equation_PulseCore.Heap.disjoint.1)))
    :pattern ((PulseCore.Heap.disjoint @u0 @x1 @x2))
    :qid equation_PulseCore.Heap.disjoint))
  :named equation_PulseCore.Heap.disjoint))
; Equation for PulseCore.Heap.disjoint_addr
;;; Fact-ids: Name PulseCore.Heap.disjoint_addr; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(85,4-85,17); use=PulseCore.Heap.fst(85,4-85,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (=
     (PulseCore.Heap.disjoint_addr @u0 @x1 @x2 @x3)
     (let
       ((@lb4
         (FStar.Pervasives.Native.Mktuple2
          (U_succ @u0)
          (U_succ @u0)
          (FStar.Pervasives.Native.option (U_succ @u0) (PulseCore.Heap.cell @u0))
          (FStar.Pervasives.Native.option (U_succ @u0) (PulseCore.Heap.cell @u0))
          (PulseCore.Heap.select @u0 @x3 @x1)
          (PulseCore.Heap.select @u0 @x3 @x2))))
      (ite
       (and
        (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
        (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
       (PulseCore.Heap.disjoint_cells
        @u0
        (FStar.Pervasives.Native.Some_@v (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
        (FStar.Pervasives.Native.Some_@v (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
       (ite
        (and
         (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
         (is-FStar.Pervasives.Native.None (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
        Prims.l_True
        (ite
         (and
          (is-FStar.Pervasives.Native.None (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
          (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
         Prims.l_True
         (ite
          (and
           (is-FStar.Pervasives.Native.None (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
           (is-FStar.Pervasives.Native.None (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
          Prims.l_True
          Tm_unit))))))
    :pattern ((PulseCore.Heap.disjoint_addr @u0 @x1 @x2 @x3))
    :qid equation_PulseCore.Heap.disjoint_addr))
  :named equation_PulseCore.Heap.disjoint_addr))
; Equation for PulseCore.Heap.disjoint_cells
;;; Fact-ids: Name PulseCore.Heap.disjoint_cells; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(70,4-70,18); use=PulseCore.Heap.fst(70,4-70,18)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (PulseCore.Heap.disjoint_cells @u0 @x1 @x2)
     (let ((@lb3 @x1))
      (let ((@lb4 @x2))
       (Prims.l_and
        (Prims.l_and
         (Prims.eq2
          (U_succ @u0)
          (Tm_type @u0)
          (PulseCore.Heap.Ref_@a @lb3)
          (PulseCore.Heap.Ref_@a @lb4))
         (Prims.eq2
          @u0
          (FStar.PCM.pcm @u0 (PulseCore.Heap.Ref_@a @lb3))
          (PulseCore.Heap.Ref_@p @lb3)
          (PulseCore.Heap.Ref_@p @lb4)))
        (FStar.PCM.composable
         @u0
         (PulseCore.Heap.Ref_@a @lb3)
         (PulseCore.Heap.Ref_@p @lb3)
         (PulseCore.Heap.Ref_@v @lb3)
         (PulseCore.Heap.Ref_@v @lb4))))))
    :pattern ((PulseCore.Heap.disjoint_cells @u0 @x1 @x2))
    :qid equation_PulseCore.Heap.disjoint_cells))
  :named equation_PulseCore.Heap.disjoint_cells))
; Equation for PulseCore.Heap.empty_heap
;;; Fact-ids: Name PulseCore.Heap.empty_heap; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(39,4-39,14); use=PulseCore.Heap.fst(39,4-39,14)
  (forall ((@u0 Universe))
   (! (= (PulseCore.Heap.empty_heap @u0) (PulseCore.Heap.empty_heap_ @u0 (BoxInt 0)))
    :pattern ((PulseCore.Heap.empty_heap @u0))
    :qid equation_PulseCore.Heap.empty_heap))
  :named equation_PulseCore.Heap.empty_heap))
; Equation for PulseCore.Heap.empty_heap'
;;; Fact-ids: Name PulseCore.Heap.empty_heap'; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(34,4-34,15); use=PulseCore.Heap.fst(34,4-34,15)
  (forall ((@u0 Universe) (@x1 Term))
   (! (=
     (PulseCore.Heap.empty_heap_ @u0 @x1)
     (FStar.Seq.Base.create
      (U_succ @u0)
      (FStar.Pervasives.Native.option (U_succ @u0) (PulseCore.Heap.cell @u0))
      @x1
      (FStar.Pervasives.Native.None (U_succ @u0) (PulseCore.Heap.cell @u0))))
    :pattern ((PulseCore.Heap.empty_heap_ @u0 @x1))
    :qid equation_PulseCore.Heap.empty_heap_))
  :named equation_PulseCore.Heap.empty_heap_))
; Equation for PulseCore.Heap.heap
;;; Fact-ids: Name PulseCore.Heap.heap; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(25,5-25,9); use=PulseCore.Heap.fst(25,5-25,9)
  (forall ((@u0 Universe))
   (! (=
     (PulseCore.Heap.heap @u0)
     (FStar.Seq.Base.seq
      (U_succ @u0)
      (FStar.Pervasives.Native.option (U_succ @u0) (PulseCore.Heap.cell @u0))))
    :pattern ((PulseCore.Heap.heap @u0))
    :qid equation_PulseCore.Heap.heap))
  :named equation_PulseCore.Heap.heap))
; Equation for PulseCore.Heap.join_cells
;;; Fact-ids: Name PulseCore.Heap.join_cells; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(133,4-133,14); use=PulseCore.Heap.fst(133,4-133,14)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (PulseCore.Heap.join_cells @u0 @x1 @x2)
     (let ((@lb3 @x1))
      (let ((@lb4 @x2))
       (PulseCore.Heap.Ref
        @u0
        (PulseCore.Heap.Ref_@a @lb3)
        (PulseCore.Heap.Ref_@p @lb3)
        (FStar.PCM.op
         @u0
         (PulseCore.Heap.Ref_@a @lb3)
         (PulseCore.Heap.Ref_@p @lb3)
         (PulseCore.Heap.Ref_@v @lb3)
         (PulseCore.Heap.Ref_@v @lb4))))))
    :pattern ((PulseCore.Heap.join_cells @u0 @x1 @x2))
    :qid equation_PulseCore.Heap.join_cells))
  :named equation_PulseCore.Heap.join_cells))
; Equation for PulseCore.Heap.max
;;; Fact-ids: Name PulseCore.Heap.max; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(34,4-34,7); use=PulseCore.Heap.fsti(34,4-34,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (=
     (PulseCore.Heap.max @x0 @x1)
     (let ((@lb2 (Prims.op_GreaterThanOrEqual @x0 @x1))) (ite (= @lb2 (BoxBool true)) @x0 @x1)))
    :pattern ((PulseCore.Heap.max @x0 @x1))
    :qid equation_PulseCore.Heap.max))
  :named equation_PulseCore.Heap.max))
; Equation for PulseCore.Heap.mem_equiv
;;; Fact-ids: Name PulseCore.Heap.mem_equiv; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(200,4-200,13); use=PulseCore.Heap.fst(200,4-200,13)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (=
     (Valid (PulseCore.Heap.mem_equiv @u0 @x1 @x2))
     ;; def=PulseCore.Heap.fst(201,2-201,58); use=PulseCore.Heap.fst(201,2-201,58)
     (and
      ;; def=PulseCore.Heap.fst(201,2-201,18); use=PulseCore.Heap.fst(201,2-201,18)
      (= (PulseCore.Heap.ctr @u0 @x1) (PulseCore.Heap.ctr @u0 @x2))
      ;; def=PulseCore.Heap.fst(201,22-201,58); use=PulseCore.Heap.fst(201,22-201,58)
      (forall ((@x3 Term))
       (! (implies
         (HasType @x3 Prims.nat)
         ;; def=PulseCore.Heap.fst(201,32-201,58); use=PulseCore.Heap.fst(201,32-201,58)
         (= (PulseCore.Heap.select @u0 @x3 @x1) (PulseCore.Heap.select @u0 @x3 @x2)))
        :qid equation_PulseCore.Heap.mem_equiv.1))))
    :pattern ((PulseCore.Heap.mem_equiv @u0 @x1 @x2))
    :qid equation_PulseCore.Heap.mem_equiv))
  :named equation_PulseCore.Heap.mem_equiv))
; fresh token
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe))
   (! (= 159 (Term_constr_id (FStar.PCM.pcm@tok @u0)))
    :pattern ((FStar.PCM.pcm@tok @u0))
    :qid fresh_token_FStar.PCM.pcm@tok))
  :named fresh_token_FStar.PCM.pcm@tok))
; fresh token
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! (forall ((@u0 Universe))
   (! (= 107 (Term_constr_id (FStar.PCM.pcm_@tok @u0)))
    :pattern ((FStar.PCM.pcm_@tok @u0))
    :qid fresh_token_FStar.PCM.pcm_@tok))
  :named fresh_token_FStar.PCM.pcm_@tok))
; fresh token
;;; Fact-ids: Name FStar.Pervasives.Native.option; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.None; Namespace FStar.Pervasives.Native; Name FStar.Pervasives.Native.Some; Namespace FStar.Pervasives.Native
(assert
 (! (forall ((@u0 Universe))
   (! (= 102 (Term_constr_id (FStar.Pervasives.Native.option@tok @u0)))
    :pattern ((FStar.Pervasives.Native.option@tok @u0))
    :qid fresh_token_FStar.Pervasives.Native.option@tok))
  :named fresh_token_FStar.Pervasives.Native.option@tok))
; inversion axiom
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (FStar.PCM.pcm @u2 @x3))
     (and (is-FStar.PCM.Mkpcm @x1) (= @u2 (FStar.PCM.Mkpcm_@0 @x1)) (= @x3 (FStar.PCM.Mkpcm_@a @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (FStar.PCM.pcm @u2 @x3)))
    :qid fuel_guarded_inversion_FStar.PCM.pcm))
  :named fuel_guarded_inversion_FStar.PCM.pcm))
; inversion axiom
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (implies
     (HasTypeFuel @u0 @x1 (FStar.PCM.pcm_ @u2 @x3))
     (and
      (is-FStar.PCM.Mkpcm_ @x1)
      (= @u2 (FStar.PCM.Mkpcm__@0 @x1))
      (= @x3 (FStar.PCM.Mkpcm__@a @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (FStar.PCM.pcm_ @u2 @x3)))
    :qid fuel_guarded_inversion_FStar.PCM.pcm_))
  :named fuel_guarded_inversion_FStar.PCM.pcm_))
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
; inversion axiom
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(40,5-40,9); use=PulseCore.Heap.fsti(40,5-40,9)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe))
   (! (implies
     (HasTypeFuel @u0 @x1 (PulseCore.Heap.cell @u2))
     (and (is-PulseCore.Heap.Ref @x1) (= @u2 (PulseCore.Heap.Ref_@0 @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (PulseCore.Heap.cell @u2)))
    :qid fuel_guarded_inversion_PulseCore.Heap.cell))
  :named fuel_guarded_inversion_PulseCore.Heap.cell))
; function token typing
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__composable; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(29,2-29,12); use=FStar.PCM.fst(29,2-29,12)
  (forall ((@u0 Universe))
   (! (HasType
     (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0)
     (Tm_arrow_c71e8e57f344346f459228466fb8d275 @u0))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable@tok @u0))
    :qid function_token_typing_FStar.PCM.__proj__Mkpcm___item__composable))
  :named function_token_typing_FStar.PCM.__proj__Mkpcm___item__composable))
; function token typing
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(30,2-30,4); use=FStar.PCM.fst(30,2-30,4)
  (forall ((@u0 Universe))
   (! (HasType
     (FStar.PCM.__proj__Mkpcm___item__op@tok @u0)
     (Tm_arrow_b3fac581c29dc335883c32c911e60a35 @u0))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__op@tok @u0))
    :qid function_token_typing_FStar.PCM.__proj__Mkpcm___item__op))
  :named function_token_typing_FStar.PCM.__proj__Mkpcm___item__op))
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
;;; Fact-ids: Name PulseCore.Heap.addr; Namespace PulseCore.Heap
(assert
 (! (HasType PulseCore.Heap.addr (Tm_type U_zero)) :named function_token_typing_PulseCore.Heap.addr))
; function token typing
;;; Fact-ids: Name PulseCore.Heap.empty_heap; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(39,4-39,14); use=PulseCore.Heap.fst(39,4-39,14)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.Heap.empty_heap @u0) (PulseCore.Heap.heap @u0))
    :pattern ((PulseCore.Heap.empty_heap @u0))
    :qid function_token_typing_PulseCore.Heap.empty_heap))
  :named function_token_typing_PulseCore.Heap.empty_heap))
; function token typing
;;; Fact-ids: Name PulseCore.Heap.heap; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(25,5-25,9); use=PulseCore.Heap.fst(25,5-25,9)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.Heap.heap @u0) (Tm_type (U_succ @u0)))
    :pattern ((PulseCore.Heap.heap @u0))
    :qid function_token_typing_PulseCore.Heap.heap))
  :named function_token_typing_PulseCore.Heap.heap))
; haseq for Tm_refine_008234c63858379db49cc5ea2545247b
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(56,2-59,46); use=FStar.PCM.fst(56,2-59,46)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (Valid
      (Prims.hasEq U_zero (Tm_refine_008234c63858379db49cc5ea2545247b @u0 @x1 @x2 @x3 @x4 @x5)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid
       (Prims.hasEq U_zero (Tm_refine_008234c63858379db49cc5ea2545247b @u0 @x1 @x2 @x3 @x4 @x5))))
    :qid haseqTm_refine_008234c63858379db49cc5ea2545247b))
  :named haseqTm_refine_008234c63858379db49cc5ea2545247b))
; haseq for Tm_refine_0c9cc7066f159da9f2304f36bc009670
;;; Fact-ids: Name FStar.Ghost.elift2_p; Namespace FStar.Ghost
(assert
 (! ;; def=FStar.Ghost.fsti(133,21-133,35); use=FStar.Ghost.fsti(133,21-133,35)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_0c9cc7066f159da9f2304f36bc009670 @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq @u0 @x3)))
    :pattern
     ((Valid (Prims.hasEq @u0 (Tm_refine_0c9cc7066f159da9f2304f36bc009670 @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_0c9cc7066f159da9f2304f36bc009670))
  :named haseqTm_refine_0c9cc7066f159da9f2304f36bc009670))
; haseq for Tm_refine_542f9d4f129664613f2483a6c88bc7c2
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq U_zero Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
   (Valid (Prims.hasEq U_zero Prims.int)))
  :named haseqTm_refine_542f9d4f129664613f2483a6c88bc7c2))
; haseq for Tm_refine_9d6af3f3535473623f7aec2f0501897f
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (iff
   (Valid (Prims.hasEq (U_succ U_zero) Tm_refine_9d6af3f3535473623f7aec2f0501897f))
   (Valid (Prims.hasEq (U_succ U_zero) (Tm_type U_zero))))
  :named haseqTm_refine_9d6af3f3535473623f7aec2f0501897f))
; haseq for Tm_refine_b12092c65c1c48799fb8f0642b431935
;;; Fact-ids: Name FStar.PCM.lem_is_unit; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(64,2-65,27); use=FStar.PCM.fst(64,2-65,27)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_b12092c65c1c48799fb8f0642b431935 @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid (Prims.hasEq U_zero (Tm_refine_b12092c65c1c48799fb8f0642b431935 @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_b12092c65c1c48799fb8f0642b431935))
  :named haseqTm_refine_b12092c65c1c48799fb8f0642b431935))
; haseq for Tm_refine_b36aec17ab518ffeb2440b8fbbd36093
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(54,2-55,33); use=FStar.PCM.fst(54,2-55,33)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_b36aec17ab518ffeb2440b8fbbd36093 @u0 @x1 @x2 @x3 @x4)))
     (Valid (Prims.hasEq @u0 @x1)))
    :pattern
     ((Valid (Prims.hasEq @u0 (Tm_refine_b36aec17ab518ffeb2440b8fbbd36093 @u0 @x1 @x2 @x3 @x4))))
    :qid haseqTm_refine_b36aec17ab518ffeb2440b8fbbd36093))
  :named haseqTm_refine_b36aec17ab518ffeb2440b8fbbd36093))
; haseq for Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(30,13-30,32); use=FStar.PCM.fst(30,13-30,32)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4 @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq @u0 @x1)))
    :pattern
     ((Valid (Prims.hasEq @u0 (Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4 @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_b6dbea2fd04077cba8ed1bcab5a526c4))
  :named haseqTm_refine_b6dbea2fd04077cba8ed1bcab5a526c4))
; haseq for Tm_refine_b8db5a672f5081a8d8af76d8f5919128
;;; Fact-ids: Name FStar.PCM.lem_commutative; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(38,4-38,32); use=FStar.PCM.fst(38,4-38,32)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (Valid (Prims.hasEq U_zero (Tm_refine_b8db5a672f5081a8d8af76d8f5919128 @u0 @x1 @x2 @x3 @x4)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid (Prims.hasEq U_zero (Tm_refine_b8db5a672f5081a8d8af76d8f5919128 @u0 @x1 @x2 @x3 @x4))))
    :qid haseqTm_refine_b8db5a672f5081a8d8af76d8f5919128))
  :named haseqTm_refine_b8db5a672f5081a8d8af76d8f5919128))
; haseq for Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db
;;; Fact-ids: Name FStar.PCM.symrel; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(24,27-24,80); use=FStar.PCM.fst(24,27-24,80)
  (forall ((@u0 Universe) (@x1 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db @u0 @x1)))
     (Valid (Prims.hasEq @u0 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x1 @u0))))
    :pattern ((Valid (Prims.hasEq @u0 (Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db @u0 @x1))))
    :qid haseqTm_refine_c7b453f20f8fb7d24d4e96bfef4457db))
  :named haseqTm_refine_c7b453f20f8fb7d24d4e96bfef4457db))
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
; haseq for Tm_refine_e4bacacd37ffee86dbfec609a586dee4
;;; Fact-ids: Name FStar.PCM.op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(85,38-85,61); use=FStar.PCM.fst(85,38-85,61)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_e4bacacd37ffee86dbfec609a586dee4 @u0 @x1 @x2 @x3)))
     (Valid (Prims.hasEq @u0 @x1)))
    :pattern
     ((Valid (Prims.hasEq @u0 (Tm_refine_e4bacacd37ffee86dbfec609a586dee4 @u0 @x1 @x2 @x3))))
    :qid haseqTm_refine_e4bacacd37ffee86dbfec609a586dee4))
  :named haseqTm_refine_e4bacacd37ffee86dbfec609a586dee4))
; haseq for Tm_refine_e999f29571cb29862018b18f47c1eeaf
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(44,2-44,52); use=FStar.PCM.fst(44,2-44,52)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (iff
     (Valid (Prims.hasEq @u0 (Tm_refine_e999f29571cb29862018b18f47c1eeaf @u0 @x1 @x2 @x3 @x4)))
     (Valid (Prims.hasEq @u0 @x1)))
    :pattern
     ((Valid (Prims.hasEq @u0 (Tm_refine_e999f29571cb29862018b18f47c1eeaf @u0 @x1 @x2 @x3 @x4))))
    :qid haseqTm_refine_e999f29571cb29862018b18f47c1eeaf))
  :named haseqTm_refine_e999f29571cb29862018b18f47c1eeaf))
; haseq for Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(45,2-47,48); use=FStar.PCM.fst(45,2-47,48)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (Valid
      (Prims.hasEq U_zero (Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca @u0 @x1 @x2 @x3 @x4 @x5)))
     (Valid (Prims.hasEq U_zero Prims.unit)))
    :pattern
     ((Valid
       (Prims.hasEq U_zero (Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca @u0 @x1 @x2 @x3 @x4 @x5))))
    :qid haseqTm_refine_fa4ad31eafce5666c0ff5c3235fe22ca))
  :named haseqTm_refine_fa4ad31eafce5666c0ff5c3235fe22ca))
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
; interpretation_Tm_abs_520c1999e88cc0354a39b631f422ea87
;;; Fact-ids: Name PulseCore.Heap.disjoint; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(118,4-118,35); use=PulseCore.Heap.fst(118,4-118,35)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (=
     (ApplyTT (Tm_abs_520c1999e88cc0354a39b631f422ea87 @u1 @x2 @x3) @x0)
     (PulseCore.Heap.disjoint_addr @u1 @x2 @x3 @x0))
    :pattern ((ApplyTT (Tm_abs_520c1999e88cc0354a39b631f422ea87 @u1 @x2 @x3) @x0))
    :qid interpretation_Tm_abs_520c1999e88cc0354a39b631f422ea87))
  :named interpretation_Tm_abs_520c1999e88cc0354a39b631f422ea87))
; interpretation_Tm_abs_7ae4b74ad2694204c5d0733b63d0a941
;;; Fact-ids: Name PulseCore.Heap.mem_equiv; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(201,22-201,58); use=PulseCore.Heap.fst(201,22-201,58)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term) (@x3 Term))
   (! (=
     (ApplyTT (Tm_abs_7ae4b74ad2694204c5d0733b63d0a941 @u1 @x2 @x3) @x0)
     (Prims.eq2
      (U_succ @u1)
      (FStar.Pervasives.Native.option (U_succ @u1) (PulseCore.Heap.cell @u1))
      (PulseCore.Heap.select @u1 @x0 @x2)
      (PulseCore.Heap.select @u1 @x0 @x3)))
    :pattern ((ApplyTT (Tm_abs_7ae4b74ad2694204c5d0733b63d0a941 @u1 @x2 @x3) @x0))
    :qid interpretation_Tm_abs_7ae4b74ad2694204c5d0733b63d0a941))
  :named interpretation_Tm_abs_7ae4b74ad2694204c5d0733b63d0a941))
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! (and
   ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
   (forall ((@u0 Universe))
    (! (IsTotFun (FStar.PCM.pcm@tok @u0))
     :pattern ((FStar.PCM.pcm@tok @u0))
     :qid kinding_FStar.PCM.pcm@tok))
   ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
   (forall ((@u0 Universe) (@x1 Term))
    (! (implies (HasType @x1 (Tm_type @u0)) (HasType (FStar.PCM.pcm @u0 @x1) (Tm_type @u0)))
     :pattern ((FStar.PCM.pcm @u0 @x1))
     :qid kinding_FStar.PCM.pcm@tok.1)))
  :named kinding_FStar.PCM.pcm@tok))
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! (and
   ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
   (forall ((@u0 Universe))
    (! (IsTotFun (FStar.PCM.pcm_@tok @u0))
     :pattern ((FStar.PCM.pcm_@tok @u0))
     :qid kinding_FStar.PCM.pcm_@tok))
   ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
   (forall ((@u0 Universe) (@x1 Term))
    (! (implies (HasType @x1 (Tm_type @u0)) (HasType (FStar.PCM.pcm_ @u0 @x1) (Tm_type @u0)))
     :pattern ((FStar.PCM.pcm_ @u0 @x1))
     :qid kinding_FStar.PCM.pcm_@tok.1)))
  :named kinding_FStar.PCM.pcm_@tok))
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
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(40,5-40,9); use=PulseCore.Heap.fsti(40,5-40,9)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.Heap.cell @u0) (Tm_type (U_succ @u0)))
    :pattern ((PulseCore.Heap.cell @u0))
    :qid kinding_PulseCore.Heap.cell@tok))
  :named kinding_PulseCore.Heap.cell@tok))
; kinding_Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6
;;; Fact-ids: Name FStar.Seq.Properties.found; Namespace FStar.Seq.Properties
(assert
 (! (HasType Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6 (Tm_type U_zero))
  :named kinding_Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6))
; kinding_Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(41,18-47,48); use=FStar.PCM.fst(42,4-47,48)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (HasType (Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d @x0 @u1 @x2) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d @x0 @u1 @x2) (Tm_type @u1)))
    :qid kinding_Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d))
  :named kinding_Tm_arrow_4ffe152f734ae4d19ec9ee9a0f23261d))
; kinding_Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e
;;; Fact-ids: Name FStar.PCM.lem_is_unit; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(62,18-65,27); use=FStar.PCM.fst(63,4-65,27)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (HasType (Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e @x0 @u1 @x2) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e @x0 @u1 @x2) (Tm_type @u1)))
    :qid kinding_Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e))
  :named kinding_Tm_arrow_56e92dbffd13cc8c0ad49c6bf91ea60e))
; kinding_Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d
;;; Fact-ids: Name PulseCore.Heap.disjoint; Namespace PulseCore.Heap
(assert
 (! (HasType Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d (Tm_type U_zero))
  :named kinding_Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d))
; kinding_Tm_arrow_b3fac581c29dc335883c32c911e60a35
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-30,32); use=FStar.PCM.fst(28,5-30,32)
  (forall ((@u0 Universe))
   (! (HasType (Tm_arrow_b3fac581c29dc335883c32c911e60a35 @u0) (Tm_type (U_succ @u0)))
    :pattern ((HasType (Tm_arrow_b3fac581c29dc335883c32c911e60a35 @u0) (Tm_type (U_succ @u0))))
    :qid kinding_Tm_arrow_b3fac581c29dc335883c32c911e60a35))
  :named kinding_Tm_arrow_b3fac581c29dc335883c32c911e60a35))
; kinding_Tm_arrow_c71e8e57f344346f459228466fb8d275
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__composable; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-29,22); use=FStar.PCM.fst(28,5-29,22)
  (forall ((@u0 Universe))
   (! (HasType (Tm_arrow_c71e8e57f344346f459228466fb8d275 @u0) (Tm_type (U_succ @u0)))
    :pattern ((HasType (Tm_arrow_c71e8e57f344346f459228466fb8d275 @u0) (Tm_type (U_succ @u0))))
    :qid kinding_Tm_arrow_c71e8e57f344346f459228466fb8d275))
  :named kinding_Tm_arrow_c71e8e57f344346f459228466fb8d275))
; kinding_Tm_arrow_da5936f5874c2d80cb185c7556127efb
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,11-30,32); use=FStar.PCM.fst(28,11-30,32)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (HasType (Tm_arrow_da5936f5874c2d80cb185c7556127efb @x0 @u1 @x2) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_da5936f5874c2d80cb185c7556127efb @x0 @u1 @x2) (Tm_type @u1)))
    :qid kinding_Tm_arrow_da5936f5874c2d80cb185c7556127efb))
  :named kinding_Tm_arrow_da5936f5874c2d80cb185c7556127efb))
; kinding_Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d
;;; Fact-ids: Name FStar.PCM.lem_commutative; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(35,22-38,32); use=FStar.PCM.fst(36,4-38,32)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (HasType (Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d @x0 @u1 @x2) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d @x0 @u1 @x2) (Tm_type @u1)))
    :qid kinding_Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d))
  :named kinding_Tm_arrow_ddd5a35bb7f53e400b8799662e65ef8d))
; kinding_Tm_arrow_e14da214a54226494910be7e049c0cf9
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(51,18-59,46); use=FStar.PCM.fst(52,4-59,46)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (HasType (Tm_arrow_e14da214a54226494910be7e049c0cf9 @x0 @u1 @x2) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_e14da214a54226494910be7e049c0cf9 @x0 @u1 @x2) (Tm_type @u1)))
    :qid kinding_Tm_arrow_e14da214a54226494910be7e049c0cf9))
  :named kinding_Tm_arrow_e14da214a54226494910be7e049c0cf9))
; kinding_Tm_arrow_e1534e83cb62e69f328ebb02235e963c
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,11-30,32); use=FStar.PCM.fst(30,8-30,37)
  (forall ((@x0 Term) (@u1 Universe) (@x2 Term))
   (! (HasType (Tm_arrow_e1534e83cb62e69f328ebb02235e963c @x0 @u1 @x2) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_e1534e83cb62e69f328ebb02235e963c @x0 @u1 @x2) (Tm_type @u1)))
    :qid kinding_Tm_arrow_e1534e83cb62e69f328ebb02235e963c))
  :named kinding_Tm_arrow_e1534e83cb62e69f328ebb02235e963c))
; kinding_Tm_arrow_e45db00acd4175c5113071bde065fbe3
;;; Fact-ids: Name FStar.PCM.symrel; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(24,12-24,44); use=FStar.PCM.fst(24,30-24,44)
  (forall ((@x0 Term) (@u1 Universe))
   (! (HasType (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x0 @u1) (Tm_type @u1))
    :pattern ((HasType (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x0 @u1) (Tm_type @u1)))
    :qid kinding_Tm_arrow_e45db00acd4175c5113071bde065fbe3))
  :named kinding_Tm_arrow_e45db00acd4175c5113071bde065fbe3))
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
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name PulseCore.Heap.mem_equiv; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(201,22-201,58); use=PulseCore.Heap.fst(201,22-201,58)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid (Prims.l_Forall U_zero Prims.nat (Tm_abs_7ae4b74ad2694204c5d0733b63d0a941 @u0 @x1 @x2)))
     ;; def=PulseCore.Heap.fst(201,22-201,58); use=PulseCore.Heap.fst(201,22-201,58)
     (forall ((@x3 Term))
      (! (implies
        (HasType @x3 Prims.nat)
        ;; def=PulseCore.Heap.fst(201,32-201,58); use=PulseCore.Heap.fst(201,32-201,58)
        (= (PulseCore.Heap.select @u0 @x3 @x1) (PulseCore.Heap.select @u0 @x3 @x2)))
       :qid l_quant_interp_b9677725b7082ffaa492b763ca1ccbee.1)))
    :pattern
     ((Valid (Prims.l_Forall U_zero Prims.nat (Tm_abs_7ae4b74ad2694204c5d0733b63d0a941 @u0 @x1 @x2))))
    :qid l_quant_interp_b9677725b7082ffaa492b763ca1ccbee))
  :named l_quant_interp_b9677725b7082ffaa492b763ca1ccbee))
; Interpretation of deeply embedded quantifier
;;; Fact-ids: Name PulseCore.Heap.disjoint; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(118,4-118,35); use=PulseCore.Heap.fst(118,4-118,35)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (iff
     (Valid
      (Prims.l_Forall
       U_zero
       PulseCore.Heap.addr
       (Tm_abs_520c1999e88cc0354a39b631f422ea87 @u0 @x1 @x2)))
     ;; def=PulseCore.Heap.fst(118,4-118,35); use=PulseCore.Heap.fst(118,4-118,35)
     (forall ((@x3 Term))
      (! (implies
        (HasType @x3 PulseCore.Heap.addr)
        ;; def=PulseCore.Heap.fst(118,14-118,35); use=PulseCore.Heap.fst(118,14-118,35)
        (Valid
         ;; def=PulseCore.Heap.fst(118,14-118,35); use=PulseCore.Heap.fst(118,14-118,35)
         (PulseCore.Heap.disjoint_addr @u0 @x1 @x2 @x3)))
       :qid l_quant_interp_c931598590415ba08ce0c45afdc5a290.1)))
    :pattern
     ((Valid
       (Prims.l_Forall
        U_zero
        PulseCore.Heap.addr
        (Tm_abs_520c1999e88cc0354a39b631f422ea87 @u0 @x1 @x2))))
    :qid l_quant_interp_c931598590415ba08ce0c45afdc5a290))
  :named l_quant_interp_c931598590415ba08ce0c45afdc5a290))
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
; Lemma: PulseCore.Heap.ctr_join_def
;;; Fact-ids: Name PulseCore.Heap.ctr_join_def; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.heap @u0))
      (HasType @x2 (Tm_refine_8e674d733943b7a0a4e1fd1da53454ca @u0 @x1)))
     ;; def=PulseCore.Heap.fst(149,31-149,74); use=PulseCore.Heap.fst(149,31-149,74)
     (=
      (PulseCore.Heap.ctr @u0 (PulseCore.Heap.join @u0 @x1 @x2))
      (PulseCore.Heap.max (PulseCore.Heap.ctr @u0 @x1) (PulseCore.Heap.ctr @u0 @x2))))
    :pattern ((PulseCore.Heap.ctr @u0 (PulseCore.Heap.join @u0 @x1 @x2)))
    :qid lemma_PulseCore.Heap.ctr_join_def))
  :named lemma_PulseCore.Heap.ctr_join_def))
; Lemma: PulseCore.Heap.disjoint_join'
;;; Fact-ids: Name PulseCore.Heap.disjoint_join'; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.heap @u0))
      (HasType @x2 (PulseCore.Heap.heap @u0))
      (HasType @x3 (PulseCore.Heap.heap @u0))
      ;; def=PulseCore.Heap.fst(177,20-177,34); use=PulseCore.Heap.fst(177,20-177,34)
      (Valid
       ;; def=PulseCore.Heap.fst(177,20-177,34); use=PulseCore.Heap.fst(177,20-177,34)
       (PulseCore.Heap.disjoint @u0 @x2 @x3))
      ;; def=PulseCore.Heap.fst(178,20-178,44); use=PulseCore.Heap.fst(178,20-178,44)
      (Valid
       ;; def=PulseCore.Heap.fst(178,20-178,44); use=PulseCore.Heap.fst(178,20-178,44)
       (PulseCore.Heap.disjoint @u0 @x1 (PulseCore.Heap.join @u0 @x2 @x3))))
     ;; def=PulseCore.Heap.fst(179,20-179,62); use=PulseCore.Heap.fst(179,20-179,62)
     (and
      ;; def=PulseCore.Heap.fst(179,20-179,34); use=PulseCore.Heap.fst(179,20-179,34)
      (Valid
       ;; def=PulseCore.Heap.fst(179,20-179,34); use=PulseCore.Heap.fst(179,20-179,34)
       (PulseCore.Heap.disjoint @u0 @x1 @x2))
      ;; def=PulseCore.Heap.fst(179,38-179,62); use=PulseCore.Heap.fst(179,38-179,62)
      (Valid
       ;; def=PulseCore.Heap.fst(179,38-179,62); use=PulseCore.Heap.fst(179,38-179,62)
       (PulseCore.Heap.disjoint @u0 (PulseCore.Heap.join @u0 @x1 @x2) @x3))))
    :pattern ((PulseCore.Heap.disjoint @u0 (PulseCore.Heap.join @u0 @x1 @x2) @x3))
    :qid lemma_PulseCore.Heap.disjoint_join_))
  :named lemma_PulseCore.Heap.disjoint_join_))
; Lemma: PulseCore.Heap.disjoint_sym
;;; Fact-ids: Name PulseCore.Heap.disjoint_sym; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (PulseCore.Heap.heap @u0)) (HasType @x2 (PulseCore.Heap.heap @u0)))
     ;; def=PulseCore.Heap.fsti(95,10-95,46); use=PulseCore.Heap.fst(122,4-122,16)
     (iff
      ;; def=PulseCore.Heap.fsti(95,11-95,25); use=PulseCore.Heap.fst(122,4-122,16)
      (Valid
       ;; def=PulseCore.Heap.fsti(95,11-95,25); use=PulseCore.Heap.fst(122,4-122,16)
       (PulseCore.Heap.disjoint @u0 @x1 @x2))
      ;; def=PulseCore.Heap.fsti(95,31-95,45); use=PulseCore.Heap.fst(122,4-122,16)
      (Valid
       ;; def=PulseCore.Heap.fsti(95,31-95,45); use=PulseCore.Heap.fst(122,4-122,16)
       (PulseCore.Heap.disjoint @u0 @x2 @x1))))
    :pattern ((PulseCore.Heap.disjoint @u0 @x1 @x2))
    :qid lemma_PulseCore.Heap.disjoint_sym))
  :named lemma_PulseCore.Heap.disjoint_sym))
; Lemma: PulseCore.Heap.join_associative2
;;; Fact-ids: Name PulseCore.Heap.join_associative2; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.heap @u0))
      (HasType @x2 (PulseCore.Heap.heap @u0))
      (HasType @x3 (PulseCore.Heap.heap @u0))
      ;; def=PulseCore.Heap.fst(285,6-285,20); use=PulseCore.Heap.fst(285,6-285,20)
      (Valid
       ;; def=PulseCore.Heap.fst(285,6-285,20); use=PulseCore.Heap.fst(285,6-285,20)
       (PulseCore.Heap.disjoint @u0 @x1 @x2))
      ;; def=PulseCore.Heap.fst(286,6-286,30); use=PulseCore.Heap.fst(286,6-286,30)
      (Valid
       ;; def=PulseCore.Heap.fst(286,6-286,30); use=PulseCore.Heap.fst(286,6-286,30)
       (PulseCore.Heap.disjoint @u0 (PulseCore.Heap.join @u0 @x1 @x2) @x3)))
     ;; def=PulseCore.Heap.fst(288,6-290,59); use=PulseCore.Heap.fst(288,6-290,59)
     (and
      ;; def=PulseCore.Heap.fst(288,6-288,20); use=PulseCore.Heap.fst(288,6-288,20)
      (Valid
       ;; def=PulseCore.Heap.fst(288,6-288,20); use=PulseCore.Heap.fst(288,6-288,20)
       (PulseCore.Heap.disjoint @u0 @x2 @x3))
      ;; def=PulseCore.Heap.fst(289,6-289,30); use=PulseCore.Heap.fst(289,6-289,30)
      (Valid
       ;; def=PulseCore.Heap.fst(289,6-289,30); use=PulseCore.Heap.fst(289,6-289,30)
       (PulseCore.Heap.disjoint @u0 @x1 (PulseCore.Heap.join @u0 @x2 @x3)))
      ;; def=PulseCore.Heap.fst(290,6-290,59); use=PulseCore.Heap.fst(290,6-290,59)
      (Valid
       ;; def=PulseCore.Heap.fst(290,6-290,59); use=PulseCore.Heap.fst(290,6-290,59)
       (PulseCore.Heap.mem_equiv
        @u0
        (PulseCore.Heap.join @u0 @x1 (PulseCore.Heap.join @u0 @x2 @x3))
        (PulseCore.Heap.join @u0 (PulseCore.Heap.join @u0 @x1 @x2) @x3)))))
    :pattern ((PulseCore.Heap.join @u0 (PulseCore.Heap.join @u0 @x1 @x2) @x3))
    :qid lemma_PulseCore.Heap.join_associative2))
  :named lemma_PulseCore.Heap.join_associative2))
; Lemma: PulseCore.Heap.join_associative'
;;; Fact-ids: Name PulseCore.Heap.join_associative'; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.heap @u0))
      (HasType @x2 (PulseCore.Heap.heap @u0))
      (HasType @x3 (PulseCore.Heap.heap @u0))
      ;; def=PulseCore.Heap.fst(257,6-257,20); use=PulseCore.Heap.fst(257,6-257,20)
      (Valid
       ;; def=PulseCore.Heap.fst(257,6-257,20); use=PulseCore.Heap.fst(257,6-257,20)
       (PulseCore.Heap.disjoint @u0 @x2 @x3))
      ;; def=PulseCore.Heap.fst(258,6-258,30); use=PulseCore.Heap.fst(258,6-258,30)
      (Valid
       ;; def=PulseCore.Heap.fst(258,6-258,30); use=PulseCore.Heap.fst(258,6-258,30)
       (PulseCore.Heap.disjoint @u0 @x1 (PulseCore.Heap.join @u0 @x2 @x3))))
     ;; def=PulseCore.Heap.fst(261,7-261,60); use=PulseCore.Heap.fst(261,7-261,60)
     (Valid
      ;; def=PulseCore.Heap.fst(261,7-261,60); use=PulseCore.Heap.fst(261,7-261,60)
      (PulseCore.Heap.mem_equiv
       @u0
       (PulseCore.Heap.join @u0 @x1 (PulseCore.Heap.join @u0 @x2 @x3))
       (PulseCore.Heap.join @u0 (PulseCore.Heap.join @u0 @x1 @x2) @x3))))
    :pattern ((PulseCore.Heap.join @u0 @x1 (PulseCore.Heap.join @u0 @x2 @x3)))
    :pattern ((PulseCore.Heap.join @u0 (PulseCore.Heap.join @u0 @x1 @x2) @x3))
    :qid lemma_PulseCore.Heap.join_associative_))
  :named lemma_PulseCore.Heap.join_associative_))
; Lemma: PulseCore.Heap.join_cells_commutative
;;; Fact-ids: Name PulseCore.Heap.join_cells_commutative; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.cell @u0))
      (HasType @x2 (Tm_refine_d19534a0bb80160c41d95f9649f0003f @u0 @x1)))
     ;; def=PulseCore.Heap.fst(213,37-213,73); use=PulseCore.Heap.fst(213,37-213,73)
     (= (PulseCore.Heap.join_cells @u0 @x1 @x2) (PulseCore.Heap.join_cells @u0 @x2 @x1)))
    :pattern ((PulseCore.Heap.join_cells @u0 @x1 @x2))
    :qid lemma_PulseCore.Heap.join_cells_commutative))
  :named lemma_PulseCore.Heap.join_cells_commutative))
; Lemma: PulseCore.Heap.join_commutative'
;;; Fact-ids: Name PulseCore.Heap.join_commutative'; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.heap @u0))
      (HasType @x2 (PulseCore.Heap.heap @u0))
      ;; def=PulseCore.Heap.fst(222,6-222,20); use=PulseCore.Heap.fst(222,6-222,20)
      (Valid
       ;; def=PulseCore.Heap.fst(222,6-222,20); use=PulseCore.Heap.fst(222,6-222,20)
       (PulseCore.Heap.disjoint @u0 @x1 @x2)))
     ;; def=PulseCore.Heap.fst(224,6-224,39); use=PulseCore.Heap.fst(224,6-224,39)
     (Valid
      ;; def=PulseCore.Heap.fst(224,6-224,39); use=PulseCore.Heap.fst(224,6-224,39)
      (PulseCore.Heap.mem_equiv
       @u0
       (PulseCore.Heap.join @u0 @x1 @x2)
       (PulseCore.Heap.join @u0 @x2 @x1))))
    :pattern ((PulseCore.Heap.join @u0 @x1 @x2))
    :qid lemma_PulseCore.Heap.join_commutative_))
  :named lemma_PulseCore.Heap.join_commutative_))
; Lemma: PulseCore.Heap.mem_equiv_eq
;;; Fact-ids: Name PulseCore.Heap.mem_equiv_eq; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.heap @u0))
      (HasType @x2 (PulseCore.Heap.heap @u0))
      ;; def=PulseCore.Heap.fst(206,6-206,23); use=PulseCore.Heap.fst(206,6-206,23)
      (Valid
       ;; def=PulseCore.Heap.fst(206,6-206,23); use=PulseCore.Heap.fst(206,6-206,23)
       (PulseCore.Heap.mem_equiv @u0 @x1 @x2)))
     ;; def=PulseCore.Heap.fst(208,6-208,14); use=PulseCore.Heap.fst(208,6-208,14)
     (= @x1 @x2))
    :pattern ((PulseCore.Heap.mem_equiv @u0 @x1 @x2))
    :qid lemma_PulseCore.Heap.mem_equiv_eq))
  :named lemma_PulseCore.Heap.mem_equiv_eq))
; Lemma: PulseCore.Heap.select_empty_heap'
;;; Fact-ids: Name PulseCore.Heap.select_empty_heap'; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.nat) (HasType @x2 Prims.nat))
     ;; def=PulseCore.Heap.fst(36,35-36,73); use=PulseCore.Heap.fst(36,35-36,73)
     (=
      (PulseCore.Heap.select @u0 @x1 (PulseCore.Heap.empty_heap_ @u0 @x2))
      (FStar.Pervasives.Native.None (U_succ @u0) (PulseCore.Heap.cell @u0))))
    :pattern ((PulseCore.Heap.select @u0 @x1 (PulseCore.Heap.empty_heap_ @u0 @x2)))
    :qid lemma_PulseCore.Heap.select_empty_heap_))
  :named lemma_PulseCore.Heap.select_empty_heap_))
; Lemma: PulseCore.Heap.select_join_def
;;; Fact-ids: Name PulseCore.Heap.select_join_def; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 Prims.nat)
      (HasType @x2 (PulseCore.Heap.heap @u0))
      (HasType @x3 (Tm_refine_8e674d733943b7a0a4e1fd1da53454ca @u0 @x2)))
     ;; def=PulseCore.Heap.fst(153,10-159,33); use=PulseCore.Heap.fst(153,10-159,33)
     (=
      (PulseCore.Heap.select @u0 @x1 (PulseCore.Heap.join @u0 @x2 @x3))
      (let
        ((@lb4
          (FStar.Pervasives.Native.Mktuple2
           (U_succ @u0)
           (U_succ @u0)
           (FStar.Pervasives.Native.option (U_succ @u0) (PulseCore.Heap.cell @u0))
           (FStar.Pervasives.Native.option (U_succ @u0) (PulseCore.Heap.cell @u0))
           (PulseCore.Heap.select @u0 @x1 @x2)
           (PulseCore.Heap.select @u0 @x1 @x3))))
       (ite
        (and
         (is-FStar.Pervasives.Native.None (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
         (is-FStar.Pervasives.Native.None (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
        (FStar.Pervasives.Native.None (U_succ @u0) (PulseCore.Heap.cell @u0))
        (ite
         (and
          (is-FStar.Pervasives.Native.None (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
          (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
         (FStar.Pervasives.Native.Some
          (U_succ @u0)
          (PulseCore.Heap.cell @u0)
          (FStar.Pervasives.Native.Some_@v (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
         (ite
          (and
           (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
           (is-FStar.Pervasives.Native.None (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
          (FStar.Pervasives.Native.Some
           (U_succ @u0)
           (PulseCore.Heap.cell @u0)
           (FStar.Pervasives.Native.Some_@v (FStar.Pervasives.Native.Mktuple2_@_1 @lb4)))
          (ite
           (and
            (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
            (is-FStar.Pervasives.Native.Some (FStar.Pervasives.Native.Mktuple2_@_2 @lb4)))
           (FStar.Pervasives.Native.Some
            (U_succ @u0)
            (PulseCore.Heap.cell @u0)
            (PulseCore.Heap.join_cells
             @u0
             (FStar.Pervasives.Native.Some_@v (FStar.Pervasives.Native.Mktuple2_@_1 @lb4))
             (FStar.Pervasives.Native.Some_@v (FStar.Pervasives.Native.Mktuple2_@_2 @lb4))))
           Tm_unit)))))))
    :pattern ((PulseCore.Heap.select @u0 @x1 (PulseCore.Heap.join @u0 @x2 @x3)))
    :qid lemma_PulseCore.Heap.select_join_def))
  :named lemma_PulseCore.Heap.select_join_def))
; Lemma: PulseCore.Heap.select_some
;;; Fact-ids: Name PulseCore.Heap.select_some; Namespace PulseCore.Heap
(assert
 (! (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 Tm_refine_542f9d4f129664613f2483a6c88bc7c2)
      (HasType @x2 (PulseCore.Heap.heap @u0))
      ;; def=PulseCore.Heap.fst(48,20-48,38); use=PulseCore.Heap.fst(48,20-48,38)
      (BoxBool_proj_0
       (FStar.Pervasives.Native.uu___is_Some
        (U_succ @u0)
        (PulseCore.Heap.cell @u0)
        (PulseCore.Heap.select @u0 @x1 @x2))))
     ;; def=PulseCore.Heap.fst(48,49-48,79); use=PulseCore.Heap.fst(48,49-48,79)
     (and
      ;; def=PulseCore.Heap.fst(48,49-48,66); use=PulseCore.Heap.fst(48,49-48,66)
      (BoxBool_proj_0 (PulseCore.Heap.contains_addr @u0 @x2 @x1))
      ;; def=PulseCore.Heap.fst(48,70-48,79); use=PulseCore.Heap.fst(48,70-48,79)
      (< (BoxInt_proj_0 @x1) (BoxInt_proj_0 (PulseCore.Heap.ctr @u0 @x2)))))
    :pattern ((PulseCore.Heap.select @u0 @x1 @x2))
    :qid lemma_PulseCore.Heap.select_some))
  :named lemma_PulseCore.Heap.select_some))
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
; Projector equation
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm__item__p; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(70,2-70,3); use=FStar.PCM.fst(70,2-70,3)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.PCM.__proj__Mkpcm__item__p @u0 @x1 @x2) (FStar.PCM.Mkpcm_@p @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm__item__p @u0 @x1 @x2))
    :qid proj_equation_FStar.PCM.Mkpcm_@p))
  :named proj_equation_FStar.PCM.Mkpcm_@p))
; Projector equation
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__composable; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(29,2-29,12); use=FStar.PCM.fst(29,2-29,12)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2) (FStar.PCM.Mkpcm__@composable @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
    :qid proj_equation_FStar.PCM.Mkpcm__@composable))
  :named proj_equation_FStar.PCM.Mkpcm__@composable))
; Projector equation
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__one; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(31,2-31,5); use=FStar.PCM.fst(31,2-31,5)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.PCM.__proj__Mkpcm___item__one @u0 @x1 @x2) (FStar.PCM.Mkpcm__@one @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__one @u0 @x1 @x2))
    :qid proj_equation_FStar.PCM.Mkpcm__@one))
  :named proj_equation_FStar.PCM.Mkpcm__@one))
; Projector equation
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(30,2-30,4); use=FStar.PCM.fst(30,2-30,4)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (= (FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2) (FStar.PCM.Mkpcm__@op @x2))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2))
    :qid proj_equation_FStar.PCM.Mkpcm__@op))
  :named proj_equation_FStar.PCM.Mkpcm__@op))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= (FStar.PCM.Mkpcm_@0 (FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)) @u0)
    :pattern ((FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.PCM.Mkpcm_@0))
  :named projection_inverse_FStar.PCM.Mkpcm_@0))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= (FStar.PCM.Mkpcm_@a (FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)) @x1)
    :pattern ((FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.PCM.Mkpcm_@a))
  :named projection_inverse_FStar.PCM.Mkpcm_@a))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= (FStar.PCM.Mkpcm_@assoc (FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)) @x4)
    :pattern ((FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.PCM.Mkpcm_@assoc))
  :named projection_inverse_FStar.PCM.Mkpcm_@assoc))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= (FStar.PCM.Mkpcm_@assoc_r (FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)) @x5)
    :pattern ((FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.PCM.Mkpcm_@assoc_r))
  :named projection_inverse_FStar.PCM.Mkpcm_@assoc_r))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= (FStar.PCM.Mkpcm_@comm (FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)) @x3)
    :pattern ((FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.PCM.Mkpcm_@comm))
  :named projection_inverse_FStar.PCM.Mkpcm_@comm))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= (FStar.PCM.Mkpcm_@is_unit (FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)) @x6)
    :pattern ((FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.PCM.Mkpcm_@is_unit))
  :named projection_inverse_FStar.PCM.Mkpcm_@is_unit))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= (FStar.PCM.Mkpcm_@p (FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)) @x2)
    :pattern ((FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.PCM.Mkpcm_@p))
  :named projection_inverse_FStar.PCM.Mkpcm_@p))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall
    ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (= (FStar.PCM.Mkpcm_@refine (FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7)) @x7)
    :pattern ((FStar.PCM.Mkpcm @u0 @x1 @x2 @x3 @x4 @x5 @x6 @x7))
    :qid projection_inverse_FStar.PCM.Mkpcm_@refine))
  :named projection_inverse_FStar.PCM.Mkpcm_@refine))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.PCM.Mkpcm__@0 (FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4)) @u0)
    :pattern ((FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.PCM.Mkpcm__@0))
  :named projection_inverse_FStar.PCM.Mkpcm__@0))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.PCM.Mkpcm__@a (FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4)) @x1)
    :pattern ((FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.PCM.Mkpcm__@a))
  :named projection_inverse_FStar.PCM.Mkpcm__@a))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.PCM.Mkpcm__@composable (FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4)) @x2)
    :pattern ((FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.PCM.Mkpcm__@composable))
  :named projection_inverse_FStar.PCM.Mkpcm__@composable))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.PCM.Mkpcm__@one (FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4)) @x4)
    :pattern ((FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.PCM.Mkpcm__@one))
  :named projection_inverse_FStar.PCM.Mkpcm__@one))
; Projection inverse
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (= (FStar.PCM.Mkpcm__@op (FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4)) @x3)
    :pattern ((FStar.PCM.Mkpcm_ @u0 @x1 @x2 @x3 @x4))
    :qid projection_inverse_FStar.PCM.Mkpcm__@op))
  :named projection_inverse_FStar.PCM.Mkpcm__@op))
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
; Projection inverse
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(41,4-41,7); use=PulseCore.Heap.fsti(41,4-41,7)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= (PulseCore.Heap.Ref_@0 (PulseCore.Heap.Ref @u0 @x1 @x2 @x3)) @u0)
    :pattern ((PulseCore.Heap.Ref @u0 @x1 @x2 @x3))
    :qid projection_inverse_PulseCore.Heap.Ref_@0))
  :named projection_inverse_PulseCore.Heap.Ref_@0))
; Projection inverse
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(41,4-41,7); use=PulseCore.Heap.fsti(41,4-41,7)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= (PulseCore.Heap.Ref_@a (PulseCore.Heap.Ref @u0 @x1 @x2 @x3)) @x1)
    :pattern ((PulseCore.Heap.Ref @u0 @x1 @x2 @x3))
    :qid projection_inverse_PulseCore.Heap.Ref_@a))
  :named projection_inverse_PulseCore.Heap.Ref_@a))
; Projection inverse
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(41,4-41,7); use=PulseCore.Heap.fsti(41,4-41,7)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= (PulseCore.Heap.Ref_@p (PulseCore.Heap.Ref @u0 @x1 @x2 @x3)) @x2)
    :pattern ((PulseCore.Heap.Ref @u0 @x1 @x2 @x3))
    :qid projection_inverse_PulseCore.Heap.Ref_@p))
  :named projection_inverse_PulseCore.Heap.Ref_@p))
; Projection inverse
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(41,4-41,7); use=PulseCore.Heap.fsti(41,4-41,7)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (= (PulseCore.Heap.Ref_@v (PulseCore.Heap.Ref @u0 @x1 @x2 @x3)) @x3)
    :pattern ((PulseCore.Heap.Ref @u0 @x1 @x2 @x3))
    :qid projection_inverse_PulseCore.Heap.Ref_@v))
  :named projection_inverse_PulseCore.Heap.Ref_@v))
; refinement_interpretation
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(56,2-59,46); use=FStar.PCM.fst(56,2-59,46)
  (forall
    ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_008234c63858379db49cc5ea2545247b @u2 @x3 @x4 @x5 @x6 @x7))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.PCM.fst(56,2-59,46)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.PCM.fst(56,2-56,7)
       (forall ((@x8 Term))
        (! (implies
          (and
           (HasType @x8 Prims.unit)
           ;; def=FStar.PCM.fst(57,7-57,23); use=FStar.PCM.fst(56,2-56,7)
           (Valid
            ;; def=FStar.PCM.fst(57,7-57,23); use=FStar.PCM.fst(56,2-56,7)
            (ApplyTT
             (ApplyTT
              (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
              @x5)
             @x6))
           ;; def=FStar.PCM.fst(58,7-58,32); use=FStar.PCM.fst(56,2-56,7)
           (Valid
            ;; def=FStar.PCM.fst(58,7-58,32); use=FStar.PCM.fst(56,2-56,7)
            (ApplyTT
             (ApplyTT
              (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
              @x7)
             (ApplyTT
              (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x5)
              @x6)))
           ;; def=FStar.PCM.fst(59,7-59,45); use=FStar.PCM.fst(56,2-56,7)
           (=
            (ApplyTT
             (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x7)
             (ApplyTT
              (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x5)
              @x6))
            (ApplyTT
             (ApplyTT
              (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4)
              (ApplyTT
               (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x7)
               @x5))
             @x6)))
          ;; def=Prims.fst(588,86-588,93); use=FStar.PCM.fst(56,2-59,46)
          (not
           ;; def=Prims.fst(588,86-588,93); use=FStar.PCM.fst(56,2-59,46)
           (= @x8 @x1)))
         :qid refinement_interpretation_Tm_refine_008234c63858379db49cc5ea2545247b.1)))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_008234c63858379db49cc5ea2545247b @u2 @x3 @x4 @x5 @x6 @x7)))
    :qid refinement_interpretation_Tm_refine_008234c63858379db49cc5ea2545247b))
  :named refinement_interpretation_Tm_refine_008234c63858379db49cc5ea2545247b))
; refinement_interpretation
;;; Fact-ids: Name FStar.Ghost.elift2_p; Namespace FStar.Ghost
(assert
 (! ;; def=FStar.Ghost.fsti(133,21-133,35); use=FStar.Ghost.fsti(133,21-133,35)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_0c9cc7066f159da9f2304f36bc009670 @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 @x5)
      ;; def=FStar.Ghost.fsti(133,27-133,34); use=FStar.Ghost.fsti(133,27-133,34)
      (Valid
       ;; def=FStar.Ghost.fsti(133,27-133,34); use=FStar.Ghost.fsti(133,27-133,34)
       (ApplyTT (ApplyTT @x3 @x4) @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_0c9cc7066f159da9f2304f36bc009670 @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_0c9cc7066f159da9f2304f36bc009670))
  :named refinement_interpretation_Tm_refine_0c9cc7066f159da9f2304f36bc009670))
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
;;; Fact-ids: Name PulseCore.Heap.join; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(99,23-99,52); use=PulseCore.Heap.fst(139,4-139,8)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_8e674d733943b7a0a4e1fd1da53454ca @u2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (PulseCore.Heap.heap @u2))
      ;; def=PulseCore.Heap.fsti(99,36-99,50); use=PulseCore.Heap.fst(139,4-139,8)
      (Valid
       ;; def=PulseCore.Heap.fsti(99,36-99,50); use=PulseCore.Heap.fst(139,4-139,8)
       (PulseCore.Heap.disjoint @u2 @x3 @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_8e674d733943b7a0a4e1fd1da53454ca @u2 @x3)))
    :qid refinement_interpretation_Tm_refine_8e674d733943b7a0a4e1fd1da53454ca))
  :named refinement_interpretation_Tm_refine_8e674d733943b7a0a4e1fd1da53454ca))
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
;;; Fact-ids: Name FStar.PCM.lem_is_unit; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(64,2-65,27); use=FStar.PCM.fst(64,2-65,27)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_b12092c65c1c48799fb8f0642b431935 @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.PCM.fst(64,2-65,27)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.PCM.fst(64,2-64,7)
       (forall ((@x6 Term))
        (! (implies
          (and
           (HasType @x6 Prims.unit)
           ;; def=FStar.PCM.fst(64,9-64,29); use=FStar.PCM.fst(64,2-64,7)
           (Valid
            ;; def=FStar.PCM.fst(64,9-64,29); use=FStar.PCM.fst(64,2-64,7)
            (ApplyTT
             (ApplyTT
              (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
              @x5)
             (FStar.PCM.__proj__Mkpcm___item__one @u2 @x3 @x4)))
           ;; def=FStar.PCM.fst(65,9-65,26); use=FStar.PCM.fst(64,2-64,7)
           (=
            (ApplyTT
             (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x5)
             (FStar.PCM.__proj__Mkpcm___item__one @u2 @x3 @x4))
            @x5))
          ;; def=Prims.fst(588,86-588,93); use=FStar.PCM.fst(64,2-65,27)
          (not
           ;; def=Prims.fst(588,86-588,93); use=FStar.PCM.fst(64,2-65,27)
           (= @x6 @x1)))
         :qid refinement_interpretation_Tm_refine_b12092c65c1c48799fb8f0642b431935.1)))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_b12092c65c1c48799fb8f0642b431935 @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_b12092c65c1c48799fb8f0642b431935))
  :named refinement_interpretation_Tm_refine_b12092c65c1c48799fb8f0642b431935))
; refinement_interpretation
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(54,2-55,33); use=FStar.PCM.fst(54,2-55,33)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_b36aec17ab518ffeb2440b8fbbd36093 @u2 @x3 @x4 @x5 @x6))
     (and
      (HasTypeFuel @u0 @x1 @x3)
      ;; def=FStar.PCM.fst(54,7-54,23); use=FStar.PCM.fst(54,7-54,23)
      (Valid
       ;; def=FStar.PCM.fst(54,7-54,23); use=FStar.PCM.fst(54,7-54,23)
       (ApplyTT
        (ApplyTT
         (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
         @x5)
        @x6))
      ;; def=FStar.PCM.fst(55,7-55,32); use=FStar.PCM.fst(55,7-55,32)
      (Valid
       ;; def=FStar.PCM.fst(55,7-55,32); use=FStar.PCM.fst(55,7-55,32)
       (ApplyTT
        (ApplyTT
         (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
         (ApplyTT
          (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x5)
          @x6))
        @x1))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_b36aec17ab518ffeb2440b8fbbd36093 @u2 @x3 @x4 @x5 @x6)))
    :qid refinement_interpretation_Tm_refine_b36aec17ab518ffeb2440b8fbbd36093))
  :named refinement_interpretation_Tm_refine_b36aec17ab518ffeb2440b8fbbd36093))
; refinement_interpretation
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(30,13-30,32); use=FStar.PCM.fst(30,13-30,32)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4 @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 @x3)
      ;; def=FStar.PCM.fst(30,17-30,31); use=FStar.PCM.fst(30,17-30,31)
      (Valid
       ;; def=FStar.PCM.fst(30,17-30,31); use=FStar.PCM.fst(30,17-30,31)
       (ApplyTT
        (ApplyTT
         (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
         @x5)
        @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4 @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4))
  :named refinement_interpretation_Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4))
; refinement_interpretation
;;; Fact-ids: Name FStar.PCM.lem_commutative; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(38,4-38,32); use=FStar.PCM.fst(38,4-38,32)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_b8db5a672f5081a8d8af76d8f5919128 @u2 @x3 @x4 @x5 @x6))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.PCM.fst(38,4-38,32)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.PCM.fst(38,4-38,9)
       (forall ((@x7 Term))
        (! (implies
          (and
           (HasType @x7 Prims.unit)
           ;; def=FStar.PCM.fst(38,10-38,32); use=FStar.PCM.fst(38,4-38,9)
           (=
            (ApplyTT
             (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x5)
             @x6)
            (ApplyTT
             (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x6)
             @x5)))
          ;; def=Prims.fst(588,86-588,93); use=FStar.PCM.fst(38,4-38,32)
          (not
           ;; def=Prims.fst(588,86-588,93); use=FStar.PCM.fst(38,4-38,32)
           (= @x7 @x1)))
         :qid refinement_interpretation_Tm_refine_b8db5a672f5081a8d8af76d8f5919128.1)))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_b8db5a672f5081a8d8af76d8f5919128 @u2 @x3 @x4 @x5 @x6)))
    :qid refinement_interpretation_Tm_refine_b8db5a672f5081a8d8af76d8f5919128))
  :named refinement_interpretation_Tm_refine_b8db5a672f5081a8d8af76d8f5919128))
; refinement_interpretation
;;; Fact-ids: Name FStar.PCM.symrel; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(24,27-24,80); use=FStar.PCM.fst(24,27-24,80)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db @u2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (Tm_arrow_e45db00acd4175c5113071bde065fbe3 @x3 @u2))
      ;; def=FStar.PCM.fst(24,48-24,78); use=FStar.PCM.fst(24,48-24,78)
      (forall ((@x4 Term) (@x5 Term))
       (! (implies
         (and (HasType @x4 @x3) (HasType @x5 @x3))
         ;; def=FStar.PCM.fst(24,61-24,77); use=FStar.PCM.fst(24,61-24,77)
         (iff
          ;; def=FStar.PCM.fst(24,61-24,66); use=FStar.PCM.fst(24,61-24,66)
          (Valid
           ;; def=FStar.PCM.fst(24,61-24,66); use=FStar.PCM.fst(24,61-24,66)
           (ApplyTT (ApplyTT @x1 @x4) @x5))
          ;; def=FStar.PCM.fst(24,72-24,77); use=FStar.PCM.fst(24,72-24,77)
          (Valid
           ;; def=FStar.PCM.fst(24,72-24,77); use=FStar.PCM.fst(24,72-24,77)
           (ApplyTT (ApplyTT @x1 @x5) @x4))))
        :qid refinement_interpretation_Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db.1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db @u2 @x3)))
    :qid refinement_interpretation_Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db))
  :named refinement_interpretation_Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db))
; refinement_interpretation
;;; Fact-ids: Name PulseCore.Heap.join_cells; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(133,29-133,64); use=PulseCore.Heap.fst(133,29-133,64)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_d19534a0bb80160c41d95f9649f0003f @u2 @x3))
     (and
      (HasTypeFuel @u0 @x1 (PulseCore.Heap.cell @u2))
      ;; def=PulseCore.Heap.fst(133,42-133,62); use=PulseCore.Heap.fst(133,42-133,62)
      (Valid
       ;; def=PulseCore.Heap.fst(133,42-133,62); use=PulseCore.Heap.fst(133,42-133,62)
       (PulseCore.Heap.disjoint_cells @u2 @x3 @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_d19534a0bb80160c41d95f9649f0003f @u2 @x3)))
    :qid refinement_interpretation_Tm_refine_d19534a0bb80160c41d95f9649f0003f))
  :named refinement_interpretation_Tm_refine_d19534a0bb80160c41d95f9649f0003f))
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
;;; Fact-ids: Name FStar.PCM.op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(85,38-85,61); use=FStar.PCM.fst(85,38-85,61)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_e4bacacd37ffee86dbfec609a586dee4 @u2 @x3 @x4 @x5))
     (and
      (HasTypeFuel @u0 @x1 @x3)
      ;; def=FStar.PCM.fst(85,43-85,59); use=FStar.PCM.fst(85,43-85,59)
      (Valid
       ;; def=FStar.PCM.fst(85,43-85,59); use=FStar.PCM.fst(85,43-85,59)
       (FStar.PCM.composable @u2 @x3 @x4 @x5 @x1))))
    :pattern ((HasTypeFuel @u0 @x1 (Tm_refine_e4bacacd37ffee86dbfec609a586dee4 @u2 @x3 @x4 @x5)))
    :qid refinement_interpretation_Tm_refine_e4bacacd37ffee86dbfec609a586dee4))
  :named refinement_interpretation_Tm_refine_e4bacacd37ffee86dbfec609a586dee4))
; refinement_interpretation
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(44,2-44,52); use=FStar.PCM.fst(44,2-44,52)
  (forall ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_e999f29571cb29862018b18f47c1eeaf @u2 @x3 @x4 @x5 @x6))
     (and
      (HasTypeFuel @u0 @x1 @x3)
      ;; def=FStar.PCM.fst(44,6-44,22); use=FStar.PCM.fst(44,6-44,22)
      (Valid
       ;; def=FStar.PCM.fst(44,6-44,22); use=FStar.PCM.fst(44,6-44,22)
       (ApplyTT
        (ApplyTT
         (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
         @x5)
        @x1))
      ;; def=FStar.PCM.fst(44,26-44,51); use=FStar.PCM.fst(44,26-44,51)
      (Valid
       ;; def=FStar.PCM.fst(44,26-44,51); use=FStar.PCM.fst(44,26-44,51)
       (ApplyTT
        (ApplyTT
         (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
         @x6)
        (ApplyTT
         (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x5)
         @x1)))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_e999f29571cb29862018b18f47c1eeaf @u2 @x3 @x4 @x5 @x6)))
    :qid refinement_interpretation_Tm_refine_e999f29571cb29862018b18f47c1eeaf))
  :named refinement_interpretation_Tm_refine_e999f29571cb29862018b18f47c1eeaf))
; refinement_interpretation
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(45,2-47,48); use=FStar.PCM.fst(45,2-47,48)
  (forall
    ((@u0 Fuel) (@x1 Term) (@u2 Universe) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term) (@x7 Term))
   (! (iff
     (HasTypeFuel @u0 @x1 (Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca @u2 @x3 @x4 @x5 @x6 @x7))
     (and
      (HasTypeFuel @u0 @x1 Prims.unit)
      ;; def=Prims.fst(588,71-588,95); use=FStar.PCM.fst(45,2-47,48)
      (not
       ;; def=Prims.fst(409,29-409,97); use=FStar.PCM.fst(45,2-45,7)
       (forall ((@x8 Term))
        (! (implies
          (and
           (HasType @x8 Prims.unit)
           ;; def=FStar.PCM.fst(45,9-45,25); use=FStar.PCM.fst(45,2-45,7)
           (Valid
            ;; def=FStar.PCM.fst(45,9-45,25); use=FStar.PCM.fst(45,2-45,7)
            (ApplyTT
             (ApplyTT
              (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
              @x5)
             @x6))
           ;; def=FStar.PCM.fst(46,9-46,34); use=FStar.PCM.fst(45,2-45,7)
           (Valid
            ;; def=FStar.PCM.fst(46,9-46,34); use=FStar.PCM.fst(45,2-45,7)
            (ApplyTT
             (ApplyTT
              (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u2) @x3) @x4)
              (ApplyTT
               (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x5)
               @x6))
             @x7))
           ;; def=FStar.PCM.fst(47,9-47,47); use=FStar.PCM.fst(45,2-45,7)
           (=
            (ApplyTT
             (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x5)
             (ApplyTT
              (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x6)
              @x7))
            (ApplyTT
             (ApplyTT
              (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4)
              (ApplyTT
               (ApplyTT (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u2) @x3) @x4) @x5)
               @x6))
             @x7)))
          ;; def=Prims.fst(588,86-588,93); use=FStar.PCM.fst(45,2-47,48)
          (not
           ;; def=Prims.fst(588,86-588,93); use=FStar.PCM.fst(45,2-47,48)
           (= @x8 @x1)))
         :qid refinement_interpretation_Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca.1)))))
    :pattern
     ((HasTypeFuel @u0 @x1 (Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca @u2 @x3 @x4 @x5 @x6 @x7)))
    :qid refinement_interpretation_Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca))
  :named refinement_interpretation_Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca))
; refinement kinding
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(56,2-59,46); use=FStar.PCM.fst(56,2-59,46)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (HasType (Tm_refine_008234c63858379db49cc5ea2545247b @u0 @x1 @x2 @x3 @x4 @x5) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_008234c63858379db49cc5ea2545247b @u0 @x1 @x2 @x3 @x4 @x5) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_008234c63858379db49cc5ea2545247b))
  :named refinement_kinding_Tm_refine_008234c63858379db49cc5ea2545247b))
; refinement kinding
;;; Fact-ids: Name FStar.Ghost.elift2_p; Namespace FStar.Ghost
(assert
 (! ;; def=FStar.Ghost.fsti(133,21-133,35); use=FStar.Ghost.fsti(133,21-133,35)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_0c9cc7066f159da9f2304f36bc009670 @u0 @x1 @x2 @x3) (Tm_type @u0))
    :pattern ((HasType (Tm_refine_0c9cc7066f159da9f2304f36bc009670 @u0 @x1 @x2 @x3) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_0c9cc7066f159da9f2304f36bc009670))
  :named refinement_kinding_Tm_refine_0c9cc7066f159da9f2304f36bc009670))
; refinement kinding
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Tm_refine_542f9d4f129664613f2483a6c88bc7c2 (Tm_type U_zero))
  :named refinement_kinding_Tm_refine_542f9d4f129664613f2483a6c88bc7c2))
; refinement kinding
;;; Fact-ids: Name Prims.eqtype; Namespace Prims
(assert
 (! (HasType Tm_refine_9d6af3f3535473623f7aec2f0501897f (Tm_type (U_succ U_zero)))
  :named refinement_kinding_Tm_refine_9d6af3f3535473623f7aec2f0501897f))
; refinement kinding
;;; Fact-ids: Name FStar.PCM.lem_is_unit; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(64,2-65,27); use=FStar.PCM.fst(64,2-65,27)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_b12092c65c1c48799fb8f0642b431935 @u0 @x1 @x2 @x3) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_b12092c65c1c48799fb8f0642b431935 @u0 @x1 @x2 @x3) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_b12092c65c1c48799fb8f0642b431935))
  :named refinement_kinding_Tm_refine_b12092c65c1c48799fb8f0642b431935))
; refinement kinding
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(54,2-55,33); use=FStar.PCM.fst(54,2-55,33)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (HasType (Tm_refine_b36aec17ab518ffeb2440b8fbbd36093 @u0 @x1 @x2 @x3 @x4) (Tm_type @u0))
    :pattern
     ((HasType (Tm_refine_b36aec17ab518ffeb2440b8fbbd36093 @u0 @x1 @x2 @x3 @x4) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_b36aec17ab518ffeb2440b8fbbd36093))
  :named refinement_kinding_Tm_refine_b36aec17ab518ffeb2440b8fbbd36093))
; refinement kinding
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(30,13-30,32); use=FStar.PCM.fst(30,13-30,32)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4 @u0 @x1 @x2 @x3) (Tm_type @u0))
    :pattern ((HasType (Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4 @u0 @x1 @x2 @x3) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4))
  :named refinement_kinding_Tm_refine_b6dbea2fd04077cba8ed1bcab5a526c4))
; refinement kinding
;;; Fact-ids: Name FStar.PCM.lem_commutative; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(38,4-38,32); use=FStar.PCM.fst(38,4-38,32)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (HasType (Tm_refine_b8db5a672f5081a8d8af76d8f5919128 @u0 @x1 @x2 @x3 @x4) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_b8db5a672f5081a8d8af76d8f5919128 @u0 @x1 @x2 @x3 @x4) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_b8db5a672f5081a8d8af76d8f5919128))
  :named refinement_kinding_Tm_refine_b8db5a672f5081a8d8af76d8f5919128))
; refinement kinding
;;; Fact-ids: Name FStar.PCM.symrel; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(24,27-24,80); use=FStar.PCM.fst(24,27-24,80)
  (forall ((@u0 Universe) (@x1 Term))
   (! (HasType (Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db @u0 @x1) (Tm_type @u0))
    :pattern ((HasType (Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db @u0 @x1) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db))
  :named refinement_kinding_Tm_refine_c7b453f20f8fb7d24d4e96bfef4457db))
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
;;; Fact-ids: Name FStar.PCM.op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(85,38-85,61); use=FStar.PCM.fst(85,38-85,61)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (HasType (Tm_refine_e4bacacd37ffee86dbfec609a586dee4 @u0 @x1 @x2 @x3) (Tm_type @u0))
    :pattern ((HasType (Tm_refine_e4bacacd37ffee86dbfec609a586dee4 @u0 @x1 @x2 @x3) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_e4bacacd37ffee86dbfec609a586dee4))
  :named refinement_kinding_Tm_refine_e4bacacd37ffee86dbfec609a586dee4))
; refinement kinding
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(44,2-44,52); use=FStar.PCM.fst(44,2-44,52)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (HasType (Tm_refine_e999f29571cb29862018b18f47c1eeaf @u0 @x1 @x2 @x3 @x4) (Tm_type @u0))
    :pattern
     ((HasType (Tm_refine_e999f29571cb29862018b18f47c1eeaf @u0 @x1 @x2 @x3 @x4) (Tm_type @u0)))
    :qid refinement_kinding_Tm_refine_e999f29571cb29862018b18f47c1eeaf))
  :named refinement_kinding_Tm_refine_e999f29571cb29862018b18f47c1eeaf))
; refinement kinding
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(45,2-47,48); use=FStar.PCM.fst(45,2-47,48)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term))
   (! (HasType (Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca @u0 @x1 @x2 @x3 @x4 @x5) (Tm_type U_zero))
    :pattern
     ((HasType (Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca @u0 @x1 @x2 @x3 @x4 @x5) (Tm_type U_zero)))
    :qid refinement_kinding_Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca))
  :named refinement_kinding_Tm_refine_fa4ad31eafce5666c0ff5c3235fe22ca))
; subterm ordering
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
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
     (HasTypeFuel
      (SFuel @u0)
      (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)
      (FStar.PCM.pcm @u1 @x9))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x3
        (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x4
        (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x5
        (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x6
        (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x7
        (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x8
        (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)))))
    :pattern
     ((HasTypeFuel
       (SFuel @u0)
       (FStar.PCM.Mkpcm @u1 @x2 @x3 @x4 @x5 @x6 @x7 @x8)
       (FStar.PCM.pcm @u1 @x9)))
    :qid subterm_ordering_FStar.PCM.Mkpcm))
  :named subterm_ordering_FStar.PCM.Mkpcm))
; subterm ordering
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term) (@x5 Term) (@x6 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) (FStar.PCM.Mkpcm_ @u1 @x2 @x3 @x4 @x5) (FStar.PCM.pcm_ @u1 @x6))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x3
        (FStar.PCM.Mkpcm_ @u1 @x2 @x3 @x4 @x5)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x4
        (FStar.PCM.Mkpcm_ @u1 @x2 @x3 @x4 @x5)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x5
        (FStar.PCM.Mkpcm_ @u1 @x2 @x3 @x4 @x5)))))
    :pattern
     ((HasTypeFuel (SFuel @u0) (FStar.PCM.Mkpcm_ @u1 @x2 @x3 @x4 @x5) (FStar.PCM.pcm_ @u1 @x6)))
    :qid subterm_ordering_FStar.PCM.Mkpcm_))
  :named subterm_ordering_FStar.PCM.Mkpcm_))
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
; subterm ordering
;;; Fact-ids: Name PulseCore.Heap.cell; Namespace PulseCore.Heap; Name PulseCore.Heap.Ref; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(41,4-41,7); use=PulseCore.Heap.fsti(41,4-41,7)
  (forall ((@u0 Fuel) (@u1 Universe) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (HasTypeFuel (SFuel @u0) (PulseCore.Heap.Ref @u1 @x2 @x3 @x4) (PulseCore.Heap.cell @u1))
     (and
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x2
        (PulseCore.Heap.Ref @u1 @x2 @x3 @x4)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x3
        (PulseCore.Heap.Ref @u1 @x2 @x3 @x4)))
      (Valid
       (Prims.precedes
        U_zero
        U_zero
        Prims.lex_t
        Prims.lex_t
        @x4
        (PulseCore.Heap.Ref @u1 @x2 @x3 @x4)))))
    :pattern
     ((HasTypeFuel (SFuel @u0) (PulseCore.Heap.Ref @u1 @x2 @x3 @x4) (PulseCore.Heap.cell @u1)))
    :qid subterm_ordering_PulseCore.Heap.Ref))
  :named subterm_ordering_PulseCore.Heap.Ref))
; Name-token correspondence
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__composable; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(29,2-29,12); use=FStar.PCM.fst(29,2-29,12)
  (forall ((@u0 Universe))
   (! ;; def=FStar.PCM.fst(29,2-29,12); use=FStar.PCM.fst(29,2-29,12)
    (forall ((@x1 Term) (@x2 Term))
     (! (=
       (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0) @x1) @x2)
       (FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
      :pattern ((ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__composable@tok @u0) @x1) @x2))
      :pattern ((FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
      :qid token_correspondence_FStar.PCM.__proj__Mkpcm___item__composable.1))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable@tok @u0))
    :qid token_correspondence_FStar.PCM.__proj__Mkpcm___item__composable))
  :named token_correspondence_FStar.PCM.__proj__Mkpcm___item__composable))
; Name-token correspondence
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(30,2-30,4); use=FStar.PCM.fst(30,2-30,4)
  (forall ((@u0 Universe))
   (! ;; def=FStar.PCM.fst(30,2-30,4); use=FStar.PCM.fst(30,2-30,4)
    (forall ((@x1 Term) (@x2 Term))
     (! (=
       (ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u0) @x1) @x2)
       (FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2))
      :pattern ((ApplyTT (ApplyTT (FStar.PCM.__proj__Mkpcm___item__op@tok @u0) @x1) @x2))
      :pattern ((FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2))
      :qid token_correspondence_FStar.PCM.__proj__Mkpcm___item__op.1))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__op@tok @u0))
    :qid token_correspondence_FStar.PCM.__proj__Mkpcm___item__op))
  :named token_correspondence_FStar.PCM.__proj__Mkpcm___item__op))
; name-token correspondence
;;; Fact-ids: Name FStar.PCM.pcm; Namespace FStar.PCM; Name FStar.PCM.Mkpcm; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(69,5-69,8); use=FStar.PCM.fst(69,5-69,8)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (ApplyTT (FStar.PCM.pcm@tok @u0) @x1) (FStar.PCM.pcm @u0 @x1))
    :pattern ((ApplyTT (FStar.PCM.pcm@tok @u0) @x1))
    :pattern ((FStar.PCM.pcm @u0 @x1))
    :qid token_correspondence_FStar.PCM.pcm@tok))
  :named token_correspondence_FStar.PCM.pcm@tok))
; name-token correspondence
;;; Fact-ids: Name FStar.PCM.pcm'; Namespace FStar.PCM; Name FStar.PCM.Mkpcm'; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(28,5-28,9); use=FStar.PCM.fst(28,5-28,9)
  (forall ((@u0 Universe) (@x1 Term))
   (! (= (ApplyTT (FStar.PCM.pcm_@tok @u0) @x1) (FStar.PCM.pcm_ @u0 @x1))
    :pattern ((ApplyTT (FStar.PCM.pcm_@tok @u0) @x1))
    :pattern ((FStar.PCM.pcm_ @u0 @x1))
    :qid token_correspondence_FStar.PCM.pcm_@tok))
  :named token_correspondence_FStar.PCM.pcm_@tok))
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
; True interpretation
;;; Fact-ids: Name Prims.l_True; Namespace Prims
(assert (! (Valid Prims.l_True) :named true_interp))
; free var typing
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__composable; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(29,2-29,12); use=FStar.PCM.fst(29,2-29,12)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.PCM.pcm_ @u0 @x1)))
     (HasType (FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2) (FStar.PCM.symrel @u0 @x1)))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__composable @u0 @x1 @x2))
    :qid typing_FStar.PCM.__proj__Mkpcm___item__composable))
  :named typing_FStar.PCM.__proj__Mkpcm___item__composable))
; free var typing
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__one; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(31,2-31,5); use=FStar.PCM.fst(31,2-31,5)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.PCM.pcm_ @u0 @x1)))
     (HasType (FStar.PCM.__proj__Mkpcm___item__one @u0 @x1 @x2) @x1))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__one @u0 @x1 @x2))
    :qid typing_FStar.PCM.__proj__Mkpcm___item__one))
  :named typing_FStar.PCM.__proj__Mkpcm___item__one))
; free var typing
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm'__item__op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(30,2-30,4); use=FStar.PCM.fst(30,2-30,4)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.PCM.pcm_ @u0 @x1)))
     (HasType
      (FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2)
      (Tm_arrow_da5936f5874c2d80cb185c7556127efb @x1 @u0 @x2)))
    :pattern ((FStar.PCM.__proj__Mkpcm___item__op @u0 @x1 @x2))
    :qid typing_FStar.PCM.__proj__Mkpcm___item__op))
  :named typing_FStar.PCM.__proj__Mkpcm___item__op))
; free var typing
;;; Fact-ids: Name FStar.PCM.__proj__Mkpcm__item__p; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(70,2-70,3); use=FStar.PCM.fst(70,2-70,3)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.PCM.pcm @u0 @x1)))
     (HasType (FStar.PCM.__proj__Mkpcm__item__p @u0 @x1 @x2) (FStar.PCM.pcm_ @u0 @x1)))
    :pattern ((FStar.PCM.__proj__Mkpcm__item__p @u0 @x1 @x2))
    :qid typing_FStar.PCM.__proj__Mkpcm__item__p))
  :named typing_FStar.PCM.__proj__Mkpcm__item__p))
; free var typing
;;; Fact-ids: Name FStar.PCM.composable; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(82,4-82,14); use=FStar.PCM.fst(82,4-82,14)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.PCM.pcm @u0 @x1))
      (HasType @x3 @x1)
      (HasType @x4 @x1))
     (HasType (FStar.PCM.composable @u0 @x1 @x2 @x3 @x4) Prims.prop))
    :pattern ((FStar.PCM.composable @u0 @x1 @x2 @x3 @x4))
    :qid typing_FStar.PCM.composable))
  :named typing_FStar.PCM.composable))
; free var typing
;;; Fact-ids: Name FStar.PCM.lem_assoc_l; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(41,4-41,15); use=FStar.PCM.fst(41,4-41,15)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.PCM.pcm_ @u0 @x1)))
     (HasType (FStar.PCM.lem_assoc_l @u0 @x1 @x2) (Tm_type @u0)))
    :pattern ((FStar.PCM.lem_assoc_l @u0 @x1 @x2))
    :qid typing_FStar.PCM.lem_assoc_l))
  :named typing_FStar.PCM.lem_assoc_l))
; free var typing
;;; Fact-ids: Name FStar.PCM.lem_assoc_r; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(51,4-51,15); use=FStar.PCM.fst(51,4-51,15)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.PCM.pcm_ @u0 @x1)))
     (HasType (FStar.PCM.lem_assoc_r @u0 @x1 @x2) (Tm_type @u0)))
    :pattern ((FStar.PCM.lem_assoc_r @u0 @x1 @x2))
    :qid typing_FStar.PCM.lem_assoc_r))
  :named typing_FStar.PCM.lem_assoc_r))
; free var typing
;;; Fact-ids: Name FStar.PCM.lem_commutative; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(35,4-35,19); use=FStar.PCM.fst(35,4-35,19)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.PCM.pcm_ @u0 @x1)))
     (HasType (FStar.PCM.lem_commutative @u0 @x1 @x2) (Tm_type @u0)))
    :pattern ((FStar.PCM.lem_commutative @u0 @x1 @x2))
    :qid typing_FStar.PCM.lem_commutative))
  :named typing_FStar.PCM.lem_commutative))
; free var typing
;;; Fact-ids: Name FStar.PCM.lem_is_unit; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(62,4-62,15); use=FStar.PCM.fst(62,4-62,15)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (Tm_type @u0)) (HasType @x2 (FStar.PCM.pcm_ @u0 @x1)))
     (HasType (FStar.PCM.lem_is_unit @u0 @x1 @x2) (Tm_type @u0)))
    :pattern ((FStar.PCM.lem_is_unit @u0 @x1 @x2))
    :qid typing_FStar.PCM.lem_is_unit))
  :named typing_FStar.PCM.lem_is_unit))
; free var typing
;;; Fact-ids: Name FStar.PCM.op; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(85,4-85,6); use=FStar.PCM.fst(85,4-85,6)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term) (@x4 Term))
   (! (implies
     (and
      (HasType @x1 (Tm_type @u0))
      (HasType @x2 (FStar.PCM.pcm @u0 @x1))
      (HasType @x3 @x1)
      (HasType @x4 (Tm_refine_e4bacacd37ffee86dbfec609a586dee4 @u0 @x1 @x2 @x3)))
     (HasType (FStar.PCM.op @u0 @x1 @x2 @x3 @x4) @x1))
    :pattern ((FStar.PCM.op @u0 @x1 @x2 @x3 @x4))
    :qid typing_FStar.PCM.op))
  :named typing_FStar.PCM.op))
; free var typing
;;; Fact-ids: Name FStar.PCM.symrel; Namespace FStar.PCM
(assert
 (! ;; def=FStar.PCM.fst(24,4-24,10); use=FStar.PCM.fst(24,4-24,10)
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies (HasType @x1 (Tm_type @u0)) (HasType (FStar.PCM.symrel @u0 @x1) (Tm_type @u0)))
    :pattern ((FStar.PCM.symrel @u0 @x1))
    :qid typing_FStar.PCM.symrel))
  :named typing_FStar.PCM.symrel))
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
;;; Fact-ids: Name Prims.nat; Namespace Prims
(assert
 (! (HasType Prims.nat (Tm_type U_zero)) :named typing_Prims.nat))
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
; free var typing
;;; Fact-ids: Name PulseCore.Heap.addr; Namespace PulseCore.Heap
(assert
 (! (HasType PulseCore.Heap.addr (Tm_type U_zero)) :named typing_PulseCore.Heap.addr))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.contains_addr; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(43,4-43,17); use=PulseCore.Heap.fst(43,4-43,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (PulseCore.Heap.heap @u0)) (HasType @x2 PulseCore.Heap.addr))
     (HasType (PulseCore.Heap.contains_addr @u0 @x1 @x2) Prims.bool))
    :pattern ((PulseCore.Heap.contains_addr @u0 @x1 @x2))
    :qid typing_PulseCore.Heap.contains_addr))
  :named typing_PulseCore.Heap.contains_addr))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.ctr; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(28,4-28,7); use=PulseCore.Heap.fst(28,4-28,7)
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies
     (HasType @x1 (PulseCore.Heap.heap @u0))
     (HasType (PulseCore.Heap.ctr @u0 @x1) Prims.nat))
    :pattern ((PulseCore.Heap.ctr @u0 @x1))
    :qid typing_PulseCore.Heap.ctr))
  :named typing_PulseCore.Heap.ctr))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.disjoint; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(116,4-116,12); use=PulseCore.Heap.fst(116,4-116,12)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (PulseCore.Heap.heap @u0)) (HasType @x2 (PulseCore.Heap.heap @u0)))
     (HasType (PulseCore.Heap.disjoint @u0 @x1 @x2) Prims.prop))
    :pattern ((PulseCore.Heap.disjoint @u0 @x1 @x2))
    :qid typing_PulseCore.Heap.disjoint))
  :named typing_PulseCore.Heap.disjoint))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.disjoint_addr; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(85,4-85,17); use=PulseCore.Heap.fst(85,4-85,17)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term) (@x3 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.heap @u0))
      (HasType @x2 (PulseCore.Heap.heap @u0))
      (HasType @x3 PulseCore.Heap.addr))
     (HasType (PulseCore.Heap.disjoint_addr @u0 @x1 @x2 @x3) Prims.prop))
    :pattern ((PulseCore.Heap.disjoint_addr @u0 @x1 @x2 @x3))
    :qid typing_PulseCore.Heap.disjoint_addr))
  :named typing_PulseCore.Heap.disjoint_addr))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.disjoint_cells; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(70,4-70,18); use=PulseCore.Heap.fst(70,4-70,18)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (PulseCore.Heap.cell @u0)) (HasType @x2 (PulseCore.Heap.cell @u0)))
     (HasType (PulseCore.Heap.disjoint_cells @u0 @x1 @x2) Prims.prop))
    :pattern ((PulseCore.Heap.disjoint_cells @u0 @x1 @x2))
    :qid typing_PulseCore.Heap.disjoint_cells))
  :named typing_PulseCore.Heap.disjoint_cells))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.empty_heap; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(39,4-39,14); use=PulseCore.Heap.fst(39,4-39,14)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.Heap.empty_heap @u0) (PulseCore.Heap.heap @u0))
    :pattern ((PulseCore.Heap.empty_heap @u0))
    :qid typing_PulseCore.Heap.empty_heap))
  :named typing_PulseCore.Heap.empty_heap))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.empty_heap'; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(34,4-34,15); use=PulseCore.Heap.fst(34,4-34,15)
  (forall ((@u0 Universe) (@x1 Term))
   (! (implies
     (HasType @x1 Prims.nat)
     (HasType (PulseCore.Heap.empty_heap_ @u0 @x1) (PulseCore.Heap.heap @u0)))
    :pattern ((PulseCore.Heap.empty_heap_ @u0 @x1))
    :qid typing_PulseCore.Heap.empty_heap_))
  :named typing_PulseCore.Heap.empty_heap_))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.heap; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(25,5-25,9); use=PulseCore.Heap.fst(25,5-25,9)
  (forall ((@u0 Universe))
   (! (HasType (PulseCore.Heap.heap @u0) (Tm_type (U_succ @u0)))
    :pattern ((PulseCore.Heap.heap @u0))
    :qid typing_PulseCore.Heap.heap))
  :named typing_PulseCore.Heap.heap))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.join; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(139,4-139,8); use=PulseCore.Heap.fst(139,4-139,8)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.heap @u0))
      (HasType @x2 (Tm_refine_8e674d733943b7a0a4e1fd1da53454ca @u0 @x1)))
     (HasType (PulseCore.Heap.join @u0 @x1 @x2) (PulseCore.Heap.heap @u0)))
    :pattern ((PulseCore.Heap.join @u0 @x1 @x2))
    :qid typing_PulseCore.Heap.join))
  :named typing_PulseCore.Heap.join))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.join_cells; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(133,4-133,14); use=PulseCore.Heap.fst(133,4-133,14)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and
      (HasType @x1 (PulseCore.Heap.cell @u0))
      (HasType @x2 (Tm_refine_d19534a0bb80160c41d95f9649f0003f @u0 @x1)))
     (HasType (PulseCore.Heap.join_cells @u0 @x1 @x2) (PulseCore.Heap.cell @u0)))
    :pattern ((PulseCore.Heap.join_cells @u0 @x1 @x2))
    :qid typing_PulseCore.Heap.join_cells))
  :named typing_PulseCore.Heap.join_cells))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.max; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fsti(34,4-34,7); use=PulseCore.Heap.fsti(34,4-34,7)
  (forall ((@x0 Term) (@x1 Term))
   (! (implies
     (and (HasType @x0 Prims.nat) (HasType @x1 Prims.nat))
     (HasType (PulseCore.Heap.max @x0 @x1) Prims.nat))
    :pattern ((PulseCore.Heap.max @x0 @x1))
    :qid typing_PulseCore.Heap.max))
  :named typing_PulseCore.Heap.max))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.mem_equiv; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(200,4-200,13); use=PulseCore.Heap.fst(200,4-200,13)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 (PulseCore.Heap.heap @u0)) (HasType @x2 (PulseCore.Heap.heap @u0)))
     (HasType (PulseCore.Heap.mem_equiv @u0 @x1 @x2) Prims.prop))
    :pattern ((PulseCore.Heap.mem_equiv @u0 @x1 @x2))
    :qid typing_PulseCore.Heap.mem_equiv))
  :named typing_PulseCore.Heap.mem_equiv))
; free var typing
;;; Fact-ids: Name PulseCore.Heap.select; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(31,4-31,10); use=PulseCore.Heap.fst(31,4-31,10)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (implies
     (and (HasType @x1 Prims.nat) (HasType @x2 (PulseCore.Heap.heap @u0)))
     (HasType
      (PulseCore.Heap.select @u0 @x1 @x2)
      (FStar.Pervasives.Native.option (U_succ @u0) (PulseCore.Heap.cell @u0))))
    :pattern ((PulseCore.Heap.select @u0 @x1 @x2))
    :qid typing_PulseCore.Heap.select))
  :named typing_PulseCore.Heap.select))
; typing_Tm_abs_520c1999e88cc0354a39b631f422ea87
;;; Fact-ids: Name PulseCore.Heap.disjoint; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(118,4-118,35); use=PulseCore.Heap.fst(118,4-118,35)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType
     (Tm_abs_520c1999e88cc0354a39b631f422ea87 @u0 @x1 @x2)
     Tm_arrow_6e9d76b9dcc3aa97cdda046b1588303d)
    :pattern ((Tm_abs_520c1999e88cc0354a39b631f422ea87 @u0 @x1 @x2))
    :qid typing_Tm_abs_520c1999e88cc0354a39b631f422ea87))
  :named typing_Tm_abs_520c1999e88cc0354a39b631f422ea87))
; typing_Tm_abs_7ae4b74ad2694204c5d0733b63d0a941
;;; Fact-ids: Name PulseCore.Heap.mem_equiv; Namespace PulseCore.Heap
(assert
 (! ;; def=PulseCore.Heap.fst(201,22-201,58); use=PulseCore.Heap.fst(201,22-201,58)
  (forall ((@u0 Universe) (@x1 Term) (@x2 Term))
   (! (HasType
     (Tm_abs_7ae4b74ad2694204c5d0733b63d0a941 @u0 @x1 @x2)
     Tm_arrow_1742ee5bbc9c9e74913cc041d85062b6)
    :pattern ((Tm_abs_7ae4b74ad2694204c5d0733b63d0a941 @u0 @x1 @x2))
    :qid typing_Tm_abs_7ae4b74ad2694204c5d0733b63d0a941))
  :named typing_Tm_abs_7ae4b74ad2694204c5d0733b63d0a941))
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
; Starting query at PulseCore.Heap.fst(303,2-303,65)
; universe local constant
(declare-fun uu___59 () Universe)
(declare-fun label_5 () Bool)
(declare-fun label_4 () Bool)
(declare-fun label_3 () Bool)
(declare-fun label_2 () Bool)
(declare-fun label_1 () Bool)
; Encoding query formula : forall (m0: PulseCore.Heap.heap) (m1: PulseCore.Heap.heap).
;   (* - Could not prove post-condition *)
;   forall (p: Prims.pure_post Prims.unit).
;     PulseCore.Heap.disjoint m0 m1 /\ PulseCore.Heap.join m0 m1 == PulseCore.Heap.empty_heap /\
;     (forall (pure_result: Prims.unit).
;         m0 == PulseCore.Heap.empty_heap /\ m1 == PulseCore.Heap.empty_heap ==> p pure_result) ==>
;     PulseCore.Heap.mem_equiv m0 PulseCore.Heap.empty_heap /\
;     PulseCore.Heap.mem_equiv m1 PulseCore.Heap.empty_heap /\
;     (forall (pure_result: Prims.unit).
;         PulseCore.Heap.mem_equiv m0 PulseCore.Heap.empty_heap /\
;         PulseCore.Heap.mem_equiv m1 PulseCore.Heap.empty_heap ==>
;         p pure_result)
; Context: While encoding a query
; While typechecking the top-level declaration ‘let join_empty_inverse’
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
      (and (HasType @x0 (PulseCore.Heap.heap uu___59)) (HasType @x1 (PulseCore.Heap.heap uu___59)))
      ;; def=Prims.fst(373,4-373,44); use=Prims.fst(398,19-398,32)
      (forall ((@x2 Term))
       (! (implies
         (and
          (HasType @x2 (Prims.pure_post U_zero Prims.unit))
          ;; def=PulseCore.Heap.fst(301,12-301,26); use=PulseCore.Heap.fst(303,2-303,65)
          (Valid
           ;; def=PulseCore.Heap.fst(301,12-301,26); use=PulseCore.Heap.fst(303,2-303,65)
           (PulseCore.Heap.disjoint uu___59 @x0 @x1))
          ;; def=PulseCore.Heap.fst(301,30-301,54); use=PulseCore.Heap.fst(303,2-303,65)
          (= (PulseCore.Heap.join uu___59 @x0 @x1) (PulseCore.Heap.empty_heap uu___59))
          ;; def=Prims.fst(409,36-409,97); use=PulseCore.Heap.fst(303,2-303,65)
          (forall ((@x3 Term))
           (! (implies
             (and
              (or label_1 (HasType @x3 Prims.unit))
              ;; def=PulseCore.Heap.fst(302,11-302,27); use=PulseCore.Heap.fst(303,2-303,65)
              (or
               label_2
               ;; def=PulseCore.Heap.fst(302,11-302,27); use=PulseCore.Heap.fst(303,2-303,65)
               (= @x0 (PulseCore.Heap.empty_heap uu___59)))
              ;; def=PulseCore.Heap.fst(302,31-302,47); use=PulseCore.Heap.fst(303,2-303,65)
              (or
               label_3
               ;; def=PulseCore.Heap.fst(302,31-302,47); use=PulseCore.Heap.fst(303,2-303,65)
               (= @x1 (PulseCore.Heap.empty_heap uu___59))))
             ;; def=Prims.fst(409,83-409,96); use=PulseCore.Heap.fst(303,2-303,65)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=PulseCore.Heap.fst(303,2-303,65)
              (ApplyTT @x2 @x3)))
            :pattern
             (;; def=Prims.fst(409,83-409,96); use=PulseCore.Heap.fst(303,2-303,65)
              (Valid
               ;; def=Prims.fst(409,83-409,96); use=PulseCore.Heap.fst(303,2-303,65)
               (ApplyTT @x2 @x3)))
            :qid @query.2)))
         ;; def=Prims.fst(409,29-409,97); use=PulseCore.Heap.fst(303,2-303,65)
         (and
          ;; def=PulseCore.Heap.fst(303,10-303,35); use=PulseCore.Heap.fst(303,10-303,35)
          (or
           label_4
           ;; def=PulseCore.Heap.fst(303,10-303,35); use=PulseCore.Heap.fst(303,10-303,35)
           (Valid
            ;; def=PulseCore.Heap.fst(303,10-303,35); use=PulseCore.Heap.fst(303,10-303,35)
            (PulseCore.Heap.mem_equiv uu___59 @x0 (PulseCore.Heap.empty_heap uu___59))))
          ;; def=PulseCore.Heap.fst(303,39-303,64); use=PulseCore.Heap.fst(303,39-303,64)
          (or
           label_5
           ;; def=PulseCore.Heap.fst(303,39-303,64); use=PulseCore.Heap.fst(303,39-303,64)
           (Valid
            ;; def=PulseCore.Heap.fst(303,39-303,64); use=PulseCore.Heap.fst(303,39-303,64)
            (PulseCore.Heap.mem_equiv uu___59 @x1 (PulseCore.Heap.empty_heap uu___59))))
          ;; def=Prims.fst(409,36-409,97); use=PulseCore.Heap.fst(303,2-303,65)
          (forall ((@x3 Term))
           (! (implies
             (and
              (HasType @x3 Prims.unit)
              ;; def=PulseCore.Heap.fst(303,10-303,35); use=PulseCore.Heap.fst(303,2-303,8)
              (Valid
               ;; def=PulseCore.Heap.fst(303,10-303,35); use=PulseCore.Heap.fst(303,2-303,8)
               (PulseCore.Heap.mem_equiv uu___59 @x0 (PulseCore.Heap.empty_heap uu___59)))
              ;; def=PulseCore.Heap.fst(303,39-303,64); use=PulseCore.Heap.fst(303,2-303,8)
              (Valid
               ;; def=PulseCore.Heap.fst(303,39-303,64); use=PulseCore.Heap.fst(303,2-303,8)
               (PulseCore.Heap.mem_equiv uu___59 @x1 (PulseCore.Heap.empty_heap uu___59))))
             ;; def=Prims.fst(409,83-409,96); use=PulseCore.Heap.fst(303,2-303,65)
             (Valid
              ;; def=Prims.fst(409,83-409,96); use=PulseCore.Heap.fst(303,2-303,65)
              (ApplyTT @x2 @x3)))
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
