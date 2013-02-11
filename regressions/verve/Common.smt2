(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-option :AUTO_CONFIG false)
(set-option :MODEL_HIDE_UNUSED_PARTITIONS false)
(set-option :MODEL_V2 true)
(set-option :ASYNC_COMMANDS false)
(set-option :PHASE_SELECTION 0)
(set-option :RESTART_STRATEGY 0)
(set-option :RESTART_FACTOR |1.5|)
(set-option :ARITH_RANDOM_INITIAL_VALUE true)
(set-option :CASE_SPLIT 3)
(set-option :DELAY_UNITS true)
(set-option :DELAY_UNITS_THRESHOLD 16)
(set-option :NNF_SK_HACK true)
(set-option :MBQI false)
(set-option :QI_EAGER_THRESHOLD 100)
(set-option :QI_COST |"(+ weight generation)"|)
(set-option :TYPE_CHECK true)
(set-option :BV_REFLECT true)
; done setting options

; Boogie universal background predicate
; Copyright (c) 2004-2010, Microsoft Corp.
(set-info :category "industrial")
(declare-sort |T@U| 0)
(declare-sort |T@T| 0)
(declare-fun real_pow (Real Real) Real)
(declare-fun UOrdering2 (|T@U| |T@U|) Bool)
(declare-fun UOrdering3 (|T@T| |T@U| |T@U|) Bool)

(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-fun TV (Int) Bool)
(declare-fun TO (Int) Bool)
(declare-fun between (Int Int Int) Bool)
(declare-fun word (Int) Bool)
(declare-fun WORD_HI () Int)
(declare-fun NULL () Int)
(declare-fun TVM (Int Int) Bool)
(declare-fun Mult (Int Int) Int)
(declare-fun TVM3 (Int Int Int) Bool)
(declare-fun memAddr (Int) Bool)
(declare-fun ?memLo () Int)
(declare-fun ?memHi () Int)
(declare-fun memAddrEx (Int) Bool)
(declare-fun PtrOk (Int) Bool)
(declare-fun Aligned (Int) Bool)
(declare-fun ?SegmentDescriptorSize () Int)
(declare-fun ?SegmentDescriptorTypeData () Int)
(declare-fun ?SegmentDescriptorTypeCode () Int)
(declare-sort T@SegmentDescriptor 0)
(declare-fun ValidSegmentDescriptor (T@SegmentDescriptor) Bool)
(declare-fun SegmentDescriptorGetType (T@SegmentDescriptor) Int)
(declare-fun SegmentDescriptorWord0 (T@SegmentDescriptor) Int)
(declare-fun q@or (Int Int) Int)
(declare-fun shl (Int Int) Int)
(declare-fun SegmentDescriptorGetBase (T@SegmentDescriptor) Int)
(declare-fun SegmentDescriptorWord1 (T@SegmentDescriptor) Int)
(declare-fun q@and (Int Int) Int)
(declare-fun shr (Int Int) Int)
(declare-fun ValidSegmentSelector (Int Int) Bool)
(declare-fun ValidGdtDescriptor (Int T@SegmentDescriptor Int Int (Array Int Int)) Bool)
(declare-fun GdtParamsWord0 (Int Int) Int)
(declare-fun GdtParamsWord1 (Int Int) Int)
(declare-fun ?VgaTextLo () Int)
(declare-fun ?VgaTextHi () Int)
(declare-fun vgaAddr2 (Int) Bool)
(declare-fun ?RoBiosLo () Int)
(declare-fun ?RoBiosHi () Int)
(declare-fun inBiosRo (Int) Bool)
(declare-fun MatchesRsdp (Int) Bool)
(declare-fun ro32 (Int) Int)
(declare-fun ByteSum (Int Int) Int)
(declare-fun MatchesDmar (Int) Bool)
(declare-fun MatchesDrhd (Int) Bool)
(declare-fun roU16 (Int) Int)
(declare-fun MaybeDrhd (Int Int) Bool)
(declare-fun ?DrhdPtr () (Array Int Int))
(declare-fun inRo (Int Int) Bool)
(declare-fun ?DmarPtr () Int)
(declare-fun ?DmarLen () Int)
(declare-fun DrhdInv (Int Int) Bool)
(declare-fun ?DrhdRegs () (Array Int Int))
(declare-fun ?iomHi () Int)
(declare-fun ?iomLo () Int)
(declare-fun ?dmaHi () Int)
(declare-fun ?dmaLo () Int)
(declare-fun iomAddr (Int) Bool)
(declare-fun IsDmaPage (Int) Bool)
(declare-fun IoPageTableEntry (Int Int) Bool)
(declare-fun IoPageTable ((Array Int Int) Int) Bool)
(declare-fun IoPageDirEntry ((Array Int Int) Int Int) Bool)
(declare-fun IoPageDir ((Array Int Int) Int) Bool)
(declare-fun IoPageDirStub ((Array Int Int) Int) Bool)
(declare-fun IoContextEntry ((Array Int Int) Int Int Int Int) Bool)
(declare-fun IoContextTable ((Array Int Int) Int) Bool)
(declare-fun IoRootEntry ((Array Int Int) Int Int Int Int) Bool)
(declare-fun IoRootTable ((Array Int Int) Int) Bool)
(declare-fun IsValidPciId (Int) Bool)
(declare-fun IsValidPciOffset (Int) Bool)
(declare-fun ?FFFFFFFF () Int)
(declare-fun PciVendorId (Int) Int)
(declare-fun PciHeaderType (Int) Int)
(declare-sort T@SegmentRegister 0)
(declare-fun SegmentRegisterGetIndex (T@SegmentRegister) Int)
(declare-fun SegmentRegisterCreate (Int T@SegmentDescriptor) T@SegmentRegister)
(declare-fun SegmentRegisterGetDescriptor (T@SegmentRegister) T@SegmentDescriptor)
(declare-fun SegmentDescriptorCreate (Int Int) T@SegmentDescriptor)
(declare-fun FlagsCmp (Int Int Int) Bool)
(declare-fun Je (Int) Bool)
(declare-fun Jne (Int) Bool)
(declare-fun Jbe (Int) Bool)
(declare-fun Jb (Int) Bool)
(declare-fun Jae (Int) Bool)
(declare-fun Ja (Int) Bool)
(declare-sort T@opn 0)
(declare-fun OpnOk ((Array Int Int) T@opn) Bool)
(declare-fun OpnReg (Int) T@opn)
(declare-fun OpnMem (Int) T@opn)
(declare-fun EvalOpn ((Array Int Int) T@opn) Int)
(declare-fun UpdateOpn ((Array Int Int) T@opn Int) (Array Int Int))
(declare-fun MapStacksToMem ((Array Int Int)) (Array Int (Array Int Int)))
(declare-fun ?NumStacks () Int)
(declare-fun ?InitialStack () Int)
(declare-fun ?InterruptStack () Int)
(declare-fun ?InterruptReserve () Int)
(declare-fun ?StackReserve () Int)
(declare-fun ?STACK_EMPTY () Int)
(declare-fun ?STACK_RUNNING () Int)
(declare-fun ?STACK_YIELDED () Int)
(declare-fun ?STACK_INTERRUPTED () Int)
(declare-fun IsStackStateTag (Int) Bool)
(declare-sort T@StackState 0)
(declare-fun IsStackStateTagFor (Int T@StackState) Bool)
(declare-fun StackStateTag (T@StackState) Int)
(declare-fun ?KernelEntryPoint () Int)
(declare-fun ?SSize () Int)
(declare-fun ?DSize () Int)
(declare-fun ?PciSize () Int)
(declare-fun ?TSize () Int)
(declare-fun ?FSize () Int)
(declare-fun ?sLo () Int)
(declare-fun ?sHi () Int)
(declare-fun ?dLo () Int)
(declare-fun ?dHi () Int)
(declare-fun ?pciLo () Int)
(declare-fun ?pciHi () Int)
(declare-fun ?tLo () Int)
(declare-fun ?tHi () Int)
(declare-fun ?fLo () Int)
(declare-fun ?fHi () Int)
(declare-fun ?gcLo () Int)
(declare-fun ?gcHi () Int)
(declare-fun gcAddr (Int) Bool)
(declare-fun gcAddrEx (Int) Bool)
(declare-fun isStack (Int) Bool)
(declare-fun sAddr (Int) Bool)
(declare-fun sAddrEx (Int) Bool)
(declare-fun dAddr (Int) Bool)
(declare-fun dAddrEx (Int) Bool)
(declare-fun pciAddr (Int) Bool)
(declare-fun pciAddrEx (Int) Bool)
(declare-fun fAddr (Int Int) Bool)
(declare-fun fAddrEx (Int Int) Bool)
(declare-fun tAddr (Int Int) Bool)
(declare-fun tAddrEx (Int Int) Bool)
(declare-fun MemInv ((Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int (Array Int Int)) (Array Int Int) Int Int Int Int Int Int Int) Bool)
(declare-fun MemSepInv ((Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int (Array Int Int)) (Array Int Int) Int Int Int Int Int Int Int) Bool)
(declare-fun SMemRequire (Int (Array Int Int) Int) Bool)
(declare-fun SMemRequireInline (Int Int (Array Int Int) Int) Bool)
(declare-sort T@ReturnTo 0)
(declare-fun SMemRequireRA (Int (Array Int Int) Int T@ReturnTo) Bool)
(declare-fun ReturnToAddr (Int) T@ReturnTo)
(declare-fun SMemInv ((Array Int Int) (Array Int Int) Int Int) Bool)
(declare-fun SMemEnsure ((Array Int Int) (Array Int Int) Int Int) Bool)
(declare-fun bbvec4 ((Array Int Int) Int Int (Array Int Int) Int Int Int Int Int) Bool)
(declare-fun BitIndex (Int Int) Int)
(declare-fun BitZero (Int Int Int) Bool)
(declare-fun bb2vec4 ((Array Int Int) Int (Array Int Int) Int Int Int Int Int) Bool)
(declare-fun ColorIndex (Int Int) Int)
(declare-fun ColorGet (Int Int Int) Int)
(declare-fun Pointer ((Array Int Int) Int Int) Bool)
(declare-fun NO_ABS () Int)
(declare-fun InteriorValue (Bool (Array Int Int) Int Int Int) Bool)
(declare-fun numFields (Int) Int)
(declare-fun Value (Bool (Array Int Int) Int Int) Bool)
(declare-fun WellFormed ((Array Int Int)) Bool)
(declare-fun TSlot (Int) Bool)
(declare-fun TT (Int) Bool)
(declare-fun getBit (Int Int) Bool)
(declare-fun getNib (Int Int) Int)
(declare-fun ?SPARSE_TAG () Int)
(declare-fun ?DENSE_TAG () Int)
(declare-fun ?PTR_VECTOR_TAG () Int)
(declare-fun ?OTHER_VECTOR_TAG () Int)
(declare-fun ?PTR_ARRAY_TAG () Int)
(declare-fun ?OTHER_ARRAY_TAG () Int)
(declare-fun ?STRING_TAG () Int)
(declare-fun isOtherTag (Int) Bool)
(declare-fun isVarSize (Int) Bool)
(declare-fun isReadonlyField (Int Int) Bool)
(declare-fun ?STRING_VTABLE () Int)
(declare-fun ?BYTE_VECTOR_VTABLE () Int)
(declare-fun ?VT_MASK () Int)
(declare-fun ?VT_BASE_LENGTH () Int)
(declare-fun ?VT_ARRAY_ELEMENT_SIZE () Int)
(declare-fun ?VT_ARRAY_ELEMENT_CLASS () Int)
(declare-fun ?VT_ARRAY_OF () Int)
(declare-fun mask (Int) Int)
(declare-fun tag@@1 (Int) Int)
(declare-fun baseLength (Int) Int)
(declare-fun arrayElementSize (Int) Int)
(declare-fun arrayElementClass (Int) Int)
(declare-fun arrayOf (Int) Int)
(declare-fun baseWords (Int) Int)
(declare-fun arrayElementWords (Int) Int)
(declare-fun ?TYPE_STRUCT () Int)
(declare-fun Sparse1 (Int Int Int Int) Bool)
(declare-fun VFieldPtr (Int Int) Bool)
(declare-fun fieldToSlot (Int Int) Int)
(declare-fun Sparse2 (Int Int) Bool)
(declare-fun TVT (Int Int) Bool)
(declare-fun VTable (Int Int) Bool)
(declare-fun pad (Int) Int)
(declare-fun neg (Int) Int)
(declare-fun TVL (Int) Bool)
(declare-fun ObjSize (Int Int Int Int) Bool)
(declare-sort T@$FrameLayout 0)
(declare-fun inFrame (T@$FrameLayout Int) Bool)
(declare-fun frameLayoutLocals (T@$FrameLayout) Int)
(declare-fun frameLayoutArgs (T@$FrameLayout) Int)
(declare-fun TVF (T@$FrameLayout) Bool)
(declare-fun ?SectionCount () Int)
(declare-fun ?StaticDataPointerBitMap () Int)
(declare-fun ?DataSectionEnd () Int)
(declare-fun ?DataSectionBase () Int)
(declare-fun sectionBase (Int) Int)
(declare-fun sectionEnd (Int) Int)
(declare-fun TVS (Int Int) Bool)
(declare-fun ?CallSiteTableCount () Int)
(declare-fun ?CodeBaseStartTable () Int)
(declare-fun ?ReturnAddressToCallSiteSetNumbers () Int)
(declare-fun ?CallSiteSetCount () Int)
(declare-fun ?CallSiteSetNumberToIndex () Int)
(declare-fun ?ActivationDescriptorTable () Int)
(declare-fun LookupDesc (Int Int) Int)
(declare-fun InTable (Int Int) Bool)
(declare-fun RetAddrAt (Int Int Int) Bool)
(declare-fun TVFT (Int) Bool)
(declare-fun FrameNextInv (Int Int Int (Array Int Int) (Array Int T@$FrameLayout)) Bool)
(declare-fun frameDescriptor (T@$FrameLayout) Int)
(declare-fun FrameInv (Int T@$FrameLayout (Array Int Int) (Array Int Int) (Array Int T@$FrameLayout) (Array Int (Array Int Int)) (Array Int Int)) Bool)
(declare-fun StackInv (Int (Array Int Int) (Array Int T@$FrameLayout) (Array Int Int) (Array Int (Array Int Int)) (Array Int Int)) Bool)
(declare-fun StackInvS (Int (Array Int Int) (Array Int (Array Int Int)) (Array Int (Array Int T@$FrameLayout)) (Array Int (Array Int Int)) (Array Int (Array Int (Array Int Int))) (Array Int (Array Int Int))) Bool)
(declare-fun SectionInv (Int Int Int (Array Int Int) (Array Int Int) (Array Int (Array Int Int))) Bool)
(declare-fun sectionSlice (Int) Int)
(declare-fun sectionHasPtr (Int Int) Bool)
(declare-fun StaticInv ((Array Int Int) (Array Int Int) (Array Int (Array Int Int))) Bool)
(declare-fun MAP_ZERO () (Array Int Int))
(declare-fun MAP_NO_ABS () (Array Int Int))
(declare-fun AlignedHeapAddr (Int) Bool)
(declare-fun RExtend ((Array Int Int) (Array Int Int)) Bool)
(declare-fun AbsMapped (Int (Array Int Int) Int) Bool)
(declare-fun TStk (Int) Bool)
(declare-fun StackTag (Int (Array Int (Array Int Int))) Int)
(declare-fun StackEsp (Int (Array Int (Array Int Int))) Int)
(declare-fun StackEbp (Int (Array Int (Array Int Int))) Int)
(declare-fun StackEax (Int (Array Int (Array Int Int))) Int)
(declare-fun StackEbx (Int (Array Int (Array Int Int))) Int)
(declare-fun StackEcx (Int (Array Int (Array Int Int))) Int)
(declare-fun StackEdx (Int (Array Int (Array Int Int))) Int)
(declare-fun StackEsi (Int (Array Int (Array Int Int))) Int)
(declare-fun StackEdi (Int (Array Int (Array Int Int))) Int)
(declare-fun StackRA (Int (Array Int (Array Int Int)) (Array Int (Array Int Int))) Int)
(declare-fun StackCS (Int (Array Int (Array Int Int)) (Array Int (Array Int Int))) Int)
(declare-fun StackEfl (Int (Array Int (Array Int Int)) (Array Int (Array Int Int))) Int)
(declare-fun IsEmpty (T@StackState) Bool)
(declare-fun IsYielded (T@StackState) Bool)
(declare-fun IsInterrupted (T@StackState) Bool)
(declare-fun MutatorFrameInvAddrs (Int Int T@$FrameLayout (Array Int Int) (Array Int Int) (Array Int Int) (Array Int T@$FrameLayout) (Array Int (Array Int Int)) (Array Int Int) (Array Int Int)) Bool)
(declare-fun MutatorFrameInv (Int Int T@$FrameLayout (Array Int Int) (Array Int Int) (Array Int Int) (Array Int T@$FrameLayout) (Array Int (Array Int Int)) (Array Int Int) (Array Int Int)) Bool)
(declare-fun frameHasPtr (T@$FrameLayout Int) Bool)
(declare-fun MutatorStackInv (Int (Array Int Int) Int (Array Int Int) (Array Int T@$FrameLayout) (Array Int Int) (Array Int (Array Int Int)) (Array Int Int) (Array Int Int)) Bool)
(declare-fun _MutatorFrameInv (Int Int T@$FrameLayout (Array Int Int) (Array Int Int) (Array Int Int) (Array Int T@$FrameLayout) (Array Int (Array Int Int)) (Array Int Int) (Array Int Int)) Bool)
(declare-fun _InFrameSlice (Int Int (Array Int Int) (Array Int Int)) Bool)
(declare-fun _MutatorStackInv (Int (Array Int Int) Int (Array Int Int) (Array Int T@$FrameLayout) (Array Int Int) (Array Int (Array Int Int)) (Array Int Int) (Array Int Int)) Bool)
(declare-fun MutatorStackInvS (Int (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int (Array Int T@$FrameLayout)) (Array Int (Array Int Int)) (Array Int (Array Int (Array Int Int))) (Array Int (Array Int Int)) (Array Int (Array Int Int))) Bool)
(declare-fun GcFrameInv (Int Int T@$FrameLayout (Array Int Int) (Array Int Int) (Array Int Int) (Array Int T@$FrameLayout) (Array Int Int) (Array Int (Array Int Int)) (Array Int Int)) Bool)
(declare-fun GcStackInv (Int (Array Int Int) Int (Array Int Int) (Array Int T@$FrameLayout) (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int Int)) Bool)
(declare-fun ObjInvBase (Int (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int Int) (Array Int Int)) Bool)
(declare-fun ObjInvField (Int Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int Int) (Array Int Int)) Bool)
(declare-fun ObjInvPartial (Int Int Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int Int) (Array Int Int)) Bool)
(declare-fun ObjInv (Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int Int) (Array Int Int)) Bool)
(declare-fun _IoInv (Bool (Array Int Int) Int (Array Int Int)) Bool)
(declare-fun PciMemAddr (Int) Int)
(declare-fun PciMemSize (Int) Int)
(declare-fun IoInv (Bool (Array Int Int) Int (Array Int Int)) Bool)
(declare-fun %lbl%+16939 () Bool)
(declare-fun %lbl%@38017 () Bool)
(declare-fun %lbl%+37969 () Bool)
(assert (forall ((val Int) ) (! (= (TV val) true)
 :qid |baseibpl.14:28|
 :skolemid |0|
 :pattern ( (TV val))
)))
(assert (forall ((wordOffset Int) ) (! (= (TO wordOffset) true)
 :qid |baseibpl.18:28|
 :skolemid |1|
 :pattern ( (TO wordOffset))
)))
(assert (forall ((i1 Int) (i2 Int) (x Int) ) (! (= (between i1 i2 x) (and
(<= i1 x)
(< x i2)))
 :qid |baseibpl.25:18|
 :skolemid |2|
 :pattern ( (between i1 i2 x))
)))
(assert (forall ((val@@0 Int) ) (! (= (word val@@0) (and
(<= 0 val@@0)
(< val@@0 WORD_HI)))
 :qid |baseibpl.30:15|
 :skolemid |3|
 :pattern ( (word val@@0))
)))
(assert (= NULL 0))
(assert (forall ((a Int) (b Int) ) (! (= (TVM a b) true)
 :qid |baseibpl.45:29|
 :skolemid |4|
 :pattern ( (TVM a b))
)))
(assert (forall ((a@@0 Int) (b@@0 Int) ) (! (= (Mult a@@0 b@@0) (* a@@0 b@@0))
 :qid |baseibpl.47:15|
 :skolemid |5|
 :pattern ( (TVM a@@0 b@@0))
)))
(assert (forall ((a@@1 Int) (b1 Int) (b2 Int) ) (! (= (TVM3 a@@1 b1 b2) true)
 :qid |baseibpl.49:30|
 :skolemid |6|
 :pattern ( (TVM3 a@@1 b1 b2))
)))
(assert (forall ((i Int) ) (! (= (memAddr i) (and
(<= ?memLo i)
(< i ?memHi)))
 :qid |memoryib.18:18|
 :skolemid |7|
 :pattern ( (memAddr i))
)))
(assert (forall ((i@@0 Int) ) (! (= (memAddrEx i@@0) (and
(<= ?memLo i@@0)
(<= i@@0 ?memHi)))
 :qid |memoryib.19:20|
 :skolemid |8|
 :pattern ( (memAddrEx i@@0))
)))
(assert (forall ((ptr Int) ) (! (= (PtrOk ptr) (and
(memAddr ptr)
(Aligned ptr)))
 :qid |assembly.36:16|
 :skolemid |9|
 :pattern ( (PtrOk ptr))
)))
(assert (= ?SegmentDescriptorSize 8))
(assert (= ?SegmentDescriptorTypeData 2))
(assert (= ?SegmentDescriptorTypeCode 8))
(assert (forall (($descriptor T@SegmentDescriptor) ) (! (= (ValidSegmentDescriptor $descriptor) (or
(= (SegmentDescriptorGetType $descriptor) ?SegmentDescriptorTypeData)
(= (SegmentDescriptorGetType $descriptor) ?SegmentDescriptorTypeCode)))
 :qid |assembly.287:33|
 :skolemid |10|
 :pattern ( (ValidSegmentDescriptor $descriptor))
)))
(assert (forall (($descriptor@@0 T@SegmentDescriptor) ) (! (= (SegmentDescriptorWord0 $descriptor@@0) (q@or (shl (SegmentDescriptorGetBase $descriptor@@0) 16) 65535))
 :qid |assembly.293:33|
 :skolemid |11|
 :pattern ( (SegmentDescriptorWord0 $descriptor@@0))
)))
(assert (forall (($descriptor@@1 T@SegmentDescriptor) ) (! (= (SegmentDescriptorWord1 $descriptor@@1) (q@or (q@and (SegmentDescriptorGetBase $descriptor@@1) 4278190080) (q@or (shr (q@and (SegmentDescriptorGetBase $descriptor@@1) 16711680) 16) (q@or (shl 53136 8) (SegmentDescriptorGetType $descriptor@@1)))))
 :qid |assembly.299:33|
 :skolemid |12|
 :pattern ( (SegmentDescriptorWord1 $descriptor@@1))
)))
(assert (forall (($register Int) ($index Int) ) (! (= (ValidSegmentSelector $register $index) (= $register (shl $index 3)))
 :qid |assembly.314:31|
 :skolemid |13|
 :pattern ( (ValidSegmentSelector $register $index))
)))
(assert (forall (($index@@0 Int) ($descriptor@@2 T@SegmentDescriptor) ($GdtBase Int) ($GdtLen Int) ($Mem (Array Int Int)) ) (! (= (ValidGdtDescriptor $index@@0 $descriptor@@2 $GdtBase $GdtLen $Mem) (and
(> $index@@0 0)
(< $index@@0 $GdtLen)
(ValidSegmentDescriptor $descriptor@@2)
(= (SegmentDescriptorWord0 $descriptor@@2) (select $Mem (+ $GdtBase (* $index@@0 ?SegmentDescriptorSize))))
(= (SegmentDescriptorWord1 $descriptor@@2) (select $Mem (+ (+ $GdtBase (* $index@@0 ?SegmentDescriptorSize)) 4)))))
 :qid |assembly.321:29|
 :skolemid |14|
 :pattern ( (ValidGdtDescriptor $index@@0 $descriptor@@2 $GdtBase $GdtLen $Mem))
)))
(assert (forall (($base Int) ($len Int) ) (! (= (GdtParamsWord0 $base $len) (q@or (shl $len 16) (shr $base 16)))
 :qid |assembly.352:25|
 :skolemid |15|
 :pattern ( (GdtParamsWord0 $base $len))
)))
(assert (forall (($base@@0 Int) ($len@@0 Int) ) (! (= (GdtParamsWord1 $base@@0 $len@@0) (shl $base@@0 16))
 :qid |assembly.357:25|
 :skolemid |16|
 :pattern ( (GdtParamsWord1 $base@@0 $len@@0))
)))
(assert (= ?VgaTextLo 753664))
(assert (= ?VgaTextHi 761664))
(assert (forall ((i@@1 Int) ) (! (= (vgaAddr2 i@@1) (and
(<= ?VgaTextLo i@@1)
(<= i@@1 (- ?VgaTextHi 2))))
 :qid |Ioibpl.16:19|
 :skolemid |17|
 :pattern ( (vgaAddr2 i@@1))
)))
(assert (= ?RoBiosLo 917504))
(assert (= ?RoBiosHi 1048576))
(assert (forall ((i@@2 Int) ) (! (= (inBiosRo i@@2) (and
(<= ?RoBiosLo i@@2)
(< i@@2 ?RoBiosHi)))
 :qid |Ioibpl.75:19|
 :skolemid |18|
 :pattern ( (inBiosRo i@@2))
)))
(assert (forall ((ptr@@0 Int) ) (! (= (MatchesRsdp ptr@@0) (and
(= (ro32 (+ ptr@@0 0)) 541348690)
(= (ro32 (+ ptr@@0 4)) 542266448)
(= (q@and (ByteSum ptr@@0 (+ ptr@@0 20)) 255) 0)))
 :qid |Ioibpl.79:22|
 :skolemid |19|
 :pattern ( (MatchesRsdp ptr@@0))
)))
(assert (forall ((ptr@@1 Int) ) (! (= (MatchesDmar ptr@@1) (= (ro32 (+ ptr@@1 0)) 1380011332))
 :qid |Ioibpl.86:22|
 :skolemid |20|
 :pattern ( (MatchesDmar ptr@@1))
)))
(assert (forall ((ptr@@2 Int) ) (! (= (MatchesDrhd ptr@@2) (= (roU16 ptr@@2) 0))
 :qid |Ioibpl.91:22|
 :skolemid |21|
 :pattern ( (MatchesDrhd ptr@@2))
)))
(assert (forall ((ptr@@3 Int) (entry Int) ) (! (= (MaybeDrhd ptr@@3 entry) (and
(= (select ?DrhdPtr entry) ptr@@3)
(inRo (+ ptr@@3 0) 2)
(inRo (+ ptr@@3 2) 2)
(<= (+ ptr@@3 (roU16 (+ ptr@@3 2))) (+ ?DmarPtr ?DmarLen))))
 :qid |Ioibpl.96:20|
 :skolemid |22|
 :pattern ( (MaybeDrhd ptr@@3 entry))
)))
(assert (forall ((ptr@@4 Int) (entry@@0 Int) ) (! (= (DrhdInv ptr@@4 entry@@0) (and
(inRo (+ ptr@@4 8) 4)
(inRo (+ ptr@@4 12) 4)
(=> (= (ro32 (+ ptr@@4 12)) 0) (= (select ?DrhdRegs entry@@0) (ro32 (+ (select ?DrhdPtr entry@@0) 8))))))
 :qid |Ioibpl.104:18|
 :skolemid |23|
 :pattern ( (DrhdInv ptr@@4 entry@@0))
)))
(assert (= ?iomHi (+ ?iomLo 65536)))
(assert (= ?dmaHi (+ ?dmaLo (* (* 18 1024) 1024))))
(assert (forall ((i@@3 Int) ) (! (= (iomAddr i@@3) (and
(<= ?iomLo i@@3)
(< i@@3 ?iomHi)))
 :qid |Ioibpl.152:18|
 :skolemid |26|
 :pattern ( (iomAddr i@@3))
)))
(assert (forall ((ptr@@5 Int) ) (! (= (IsDmaPage ptr@@5) (and
(= (q@and ptr@@5 4095) 0)
(<= ?dmaLo ptr@@5)
(<= (+ ptr@@5 4096) ?dmaHi)))
 :qid |Ioibpl.194:20|
 :skolemid |28|
 :pattern ( (IsDmaPage ptr@@5))
)))
(assert (forall ((w0 Int) (w1 Int) ) (! (= (IoPageTableEntry w0 w1) (and
(= w1 0)
(or
(= w0 0)
(IsDmaPage (- w0 3)))))
 :qid |Ioibpl.200:27|
 :skolemid |29|
 :pattern ( (IoPageTableEntry w0 w1))
)))
(assert (forall (($IomMem (Array Int Int)) (ptr@@6 Int) ) (! (= (IoPageTable $IomMem ptr@@6) (and
(= (q@and ptr@@6 4095) 0)
(forall ((i@@4 Int) ) (! (=> (and
(TV i@@4)
(<= 0 i@@4)
(< i@@4 512)) (IoPageTableEntry (select $IomMem (+ ptr@@6 (* 8 i@@4))) (select $IomMem (+ (+ ptr@@6 (* 8 i@@4)) 4))))
 :qid |Ioibpl.208:13|
 :skolemid |30|
 :pattern ( (TV i@@4))
))))
 :qid |Ioibpl.205:37|
 :skolemid |31|
 :pattern ( (IoPageTable $IomMem ptr@@6))
)))
(assert (forall (($IomMem@@0 (Array Int Int)) (w0@@0 Int) (w1@@0 Int) ) (! (= (IoPageDirEntry $IomMem@@0 w0@@0 w1@@0) (and
(= w1@@0 0)
(or
(= w0@@0 0)
(IoPageTable $IomMem@@0 (- w0@@0 3)))))
 :qid |Ioibpl.212:25|
 :skolemid |32|
 :pattern ( (IoPageDirEntry $IomMem@@0 w0@@0 w1@@0))
)))
(assert (forall (($IomMem@@1 (Array Int Int)) (ptr@@7 Int) ) (! (= (IoPageDir $IomMem@@1 ptr@@7) (and
(= (q@and ptr@@7 4095) 0)
(forall ((i@@5 Int) ) (! (=> (and
(TV i@@5)
(<= 0 i@@5)
(< i@@5 512)) (IoPageDirEntry $IomMem@@1 (select $IomMem@@1 (+ ptr@@7 (* 8 i@@5))) (select $IomMem@@1 (+ (+ ptr@@7 (* 8 i@@5)) 4))))
 :qid |Ioibpl.220:13|
 :skolemid |33|
 :pattern ( (TV i@@5))
))))
 :qid |Ioibpl.217:35|
 :skolemid |34|
 :pattern ( (IoPageDir $IomMem@@1 ptr@@7))
)))
(assert (forall (($IomMem@@2 (Array Int Int)) (ptr@@8 Int) ) (! (= (IoPageDirStub $IomMem@@2 ptr@@8) (and
(= (q@and ptr@@8 4095) 0)
(= (select $IomMem@@2 (+ ptr@@8 4)) 0)
(forall ((i@@6 Int) ) (! (=> (and
(TV i@@6)
(<= 1 i@@6)
(< i@@6 512)) (and
(= (select $IomMem@@2 (+ ptr@@8 (* 8 i@@6))) 0)
(= (select $IomMem@@2 (+ (+ ptr@@8 (* 8 i@@6)) 4)) 0)))
 :qid |Ioibpl.228:13|
 :skolemid |35|
 :pattern ( (TV i@@6))
))))
 :qid |Ioibpl.224:39|
 :skolemid |36|
 :pattern ( (IoPageDirStub $IomMem@@2 ptr@@8))
)))
(assert (forall (($IomMem@@3 (Array Int Int)) (w0@@1 Int) (w1@@1 Int) (w2 Int) (w3 Int) ) (! (= (IoContextEntry $IomMem@@3 w0@@1 w1@@1 w2 w3) (and
(= w3 0)
(= w2 258)
(= w1@@1 0)
(IoPageDirStub $IomMem@@3 (- w0@@1 3))
(IoPageDirStub $IomMem@@3 (- (select $IomMem@@3 (- w0@@1 3)) 3))
(IoPageDir $IomMem@@3 (- (select $IomMem@@3 (- (select $IomMem@@3 (- w0@@1 3)) 3)) 3))))
 :qid |Ioibpl.232:25|
 :skolemid |37|
 :pattern ( (IoContextEntry $IomMem@@3 w0@@1 w1@@1 w2 w3))
)))
(assert (forall (($IomMem@@4 (Array Int Int)) (ptr@@9 Int) ) (! (= (IoContextTable $IomMem@@4 ptr@@9) (and
(= (q@and ptr@@9 4095) 0)
(forall ((i@@7 Int) ) (! (=> (and
(TV i@@7)
(<= 0 i@@7)
(< i@@7 256)) (IoContextEntry $IomMem@@4 (select $IomMem@@4 (+ (+ ptr@@9 (* 16 i@@7)) 0)) (select $IomMem@@4 (+ (+ ptr@@9 (* 16 i@@7)) 4)) (select $IomMem@@4 (+ (+ ptr@@9 (* 16 i@@7)) 8)) (select $IomMem@@4 (+ (+ ptr@@9 (* 16 i@@7)) 12))))
 :qid |Ioibpl.243:13|
 :skolemid |38|
 :pattern ( (TV i@@7))
))))
 :qid |Ioibpl.240:40|
 :skolemid |39|
 :pattern ( (IoContextTable $IomMem@@4 ptr@@9))
)))
(assert (forall (($IomMem@@5 (Array Int Int)) (w0@@2 Int) (w1@@2 Int) (w2@@0 Int) (w3@@0 Int) ) (! (= (IoRootEntry $IomMem@@5 w0@@2 w1@@2 w2@@0 w3@@0) (and
(= w3@@0 0)
(= w2@@0 0)
(= w1@@2 0)
(IoContextTable $IomMem@@5 (- w0@@2 1))))
 :qid |Ioibpl.251:22|
 :skolemid |40|
 :pattern ( (IoRootEntry $IomMem@@5 w0@@2 w1@@2 w2@@0 w3@@0))
)))
(assert (forall (($IomMem@@6 (Array Int Int)) (ptr@@10 Int) ) (! (= (IoRootTable $IomMem@@6 ptr@@10) (and
(= (q@and ptr@@10 4095) 0)
(forall ((i@@8 Int) ) (! (=> (and
(TV i@@8)
(<= 0 i@@8)
(< i@@8 256)) (IoRootEntry $IomMem@@6 (select $IomMem@@6 (+ (+ ptr@@10 (* 16 i@@8)) 0)) (select $IomMem@@6 (+ (+ ptr@@10 (* 16 i@@8)) 4)) (select $IomMem@@6 (+ (+ ptr@@10 (* 16 i@@8)) 8)) (select $IomMem@@6 (+ (+ ptr@@10 (* 16 i@@8)) 12))))
 :qid |Ioibpl.259:13|
 :skolemid |41|
 :pattern ( (TV i@@8))
))))
 :qid |Ioibpl.256:37|
 :skolemid |42|
 :pattern ( (IoRootTable $IomMem@@6 ptr@@10))
)))
(assert (forall ((id Int) ) (! (= (IsValidPciId id) (and
(<= 0 id)
(< id 65536)))
 :qid |Ioibpl.271:23|
 :skolemid |43|
 :pattern ( (IsValidPciId id))
)))
(assert (forall ((o Int) ) (! (= (IsValidPciOffset o) (and
(<= 0 o)
(< o 256)
(Aligned o)))
 :qid |Ioibpl.274:27|
 :skolemid |44|
 :pattern ( (IsValidPciOffset o))
)))
(assert (= ?FFFFFFFF (+ (+ 2147483647 2147483647) 1)))
(assert (forall ((config0 Int) ) (! (= (PciVendorId config0) (q@and config0 65535))
 :qid |Ioibpl.302:22|
 :skolemid |45|
 :pattern ( (PciVendorId config0))
)))
(assert (forall ((config12 Int) ) (! (= (PciHeaderType config12) (q@and (shr config12 16) 255))
 :qid |Ioibpl.303:24|
 :skolemid |46|
 :pattern ( (PciHeaderType config12))
)))
(assert (>= WORD_HI 100))
(assert (forall ((a@@2 Int) (b1@@0 Int) (b2@@0 Int) ) (! (= (Mult a@@2 (+ b1@@0 b2@@0)) (* a@@2 (+ b1@@0 b2@@0)))
 :qid |baseaxio.13:15|
 :skolemid |47|
 :pattern ( (TVM3 a@@2 b1@@0 b2@@0))
)))
(assert (forall ((i@@9 Int) (j Int) ) (! (=> (and
(TV i@@9)
(TO j)) (= (Aligned i@@9) (Aligned (+ i@@9 (* 4 j)))))
 :qid |memoryax.10:15|
 :skolemid |48|
 :pattern ( (TV i@@9) (TO j))
)))
(assert (< NULL ?memLo))
(assert (<= ?memLo ?memHi))
(assert (< ?memHi WORD_HI))
(assert (Aligned ?memLo))
(assert (Aligned ?memHi))
(assert (forall (($index@@1 Int) ($descriptor@@3 T@SegmentDescriptor) ) (! (= (SegmentRegisterGetIndex (SegmentRegisterCreate $index@@1 $descriptor@@3)) $index@@1)
 :qid |assembly.29:15|
 :skolemid |49|
 :pattern ( (SegmentRegisterGetIndex (SegmentRegisterCreate $index@@1 $descriptor@@3)))
)))
(assert (forall (($index@@2 Int) ($descriptor@@4 T@SegmentDescriptor) ) (! (= (SegmentRegisterGetDescriptor (SegmentRegisterCreate $index@@2 $descriptor@@4)) $descriptor@@4)
 :qid |assembly.33:15|
 :skolemid |50|
 :pattern ( (SegmentRegisterGetDescriptor (SegmentRegisterCreate $index@@2 $descriptor@@4)))
)))
(assert (forall (($base@@1 Int) ($type Int) ) (! (= (SegmentDescriptorGetBase (SegmentDescriptorCreate $base@@1 $type)) $base@@1)
 :qid |assembly.37:15|
 :skolemid |51|
 :pattern ( (SegmentDescriptorGetBase (SegmentDescriptorCreate $base@@1 $type)))
)))
(assert (forall (($base@@2 Int) ($type@@0 Int) ) (! (= (SegmentDescriptorGetType (SegmentDescriptorCreate $base@@2 $type@@0)) $type@@0)
 :qid |assembly.39:15|
 :skolemid |52|
 :pattern ( (SegmentDescriptorGetType (SegmentDescriptorCreate $base@@2 $type@@0)))
)))
(assert (forall ((f Int) (x@@0 Int) (y Int) ) (! (=> (FlagsCmp f x@@0 y) (= (Je f) (= x@@0 y)))
 :qid |assembly.46:15|
 :skolemid |53|
 :pattern ( (FlagsCmp f x@@0 y) (Je f))
)))
(assert (forall ((f@@0 Int) (x@@1 Int) (y@@0 Int) ) (! (=> (FlagsCmp f@@0 x@@1 y@@0) (= (Jne f@@0) (not (= x@@1 y@@0))))
 :qid |assembly.47:15|
 :skolemid |54|
 :pattern ( (FlagsCmp f@@0 x@@1 y@@0) (Jne f@@0))
)))
(assert (forall ((f@@1 Int) (x@@2 Int) (y@@1 Int) ) (! (=> (FlagsCmp f@@1 x@@2 y@@1) (= (Jbe f@@1) (<= x@@2 y@@1)))
 :qid |assembly.48:15|
 :skolemid |55|
 :pattern ( (FlagsCmp f@@1 x@@2 y@@1) (Jbe f@@1))
)))
(assert (forall ((f@@2 Int) (x@@3 Int) (y@@2 Int) ) (! (=> (FlagsCmp f@@2 x@@3 y@@2) (= (Jb f@@2) (< x@@3 y@@2)))
 :qid |assembly.49:15|
 :skolemid |56|
 :pattern ( (FlagsCmp f@@2 x@@3 y@@2) (Jb f@@2))
)))
(assert (forall ((f@@3 Int) (x@@4 Int) (y@@3 Int) ) (! (=> (FlagsCmp f@@3 x@@4 y@@3) (= (Jae f@@3) (>= x@@4 y@@3)))
 :qid |assembly.50:15|
 :skolemid |57|
 :pattern ( (FlagsCmp f@@3 x@@4 y@@3) (Jae f@@3))
)))
(assert (forall ((f@@4 Int) (x@@5 Int) (y@@4 Int) ) (! (=> (FlagsCmp f@@4 x@@5 y@@4) (= (Ja f@@4) (> x@@5 y@@4)))
 :qid |assembly.51:15|
 :skolemid |58|
 :pattern ( (FlagsCmp f@@4 x@@5 y@@4) (Ja f@@4))
)))
(assert (forall ((Mem (Array Int Int)) (reg Int) ) (! (OpnOk Mem (OpnReg reg))
 :qid |assembly.56:15|
 :skolemid |59|
 :pattern ( (OpnOk Mem (OpnReg reg)))
)))
(assert (forall ((Mem@@0 (Array Int Int)) (ptr@@11 Int) ) (! (=> (PtrOk ptr@@11) (OpnOk Mem@@0 (OpnMem ptr@@11)))
 :qid |assembly.57:15|
 :skolemid |60|
 :pattern ( (OpnOk Mem@@0 (OpnMem ptr@@11)))
)))
(assert (forall ((Mem@@1 (Array Int Int)) (reg@@0 Int) ) (! (= (EvalOpn Mem@@1 (OpnReg reg@@0)) reg@@0)
 :qid |assembly.58:15|
 :skolemid |61|
 :pattern ( (EvalOpn Mem@@1 (OpnReg reg@@0)))
)))
(assert (forall ((Mem@@2 (Array Int Int)) (ptr@@12 Int) ) (! (= (EvalOpn Mem@@2 (OpnMem ptr@@12)) (select Mem@@2 ptr@@12))
 :qid |assembly.59:15|
 :skolemid |62|
 :pattern ( (EvalOpn Mem@@2 (OpnMem ptr@@12)))
)))
(assert (forall ((Mem@@3 (Array Int Int)) (reg@@1 Int) (v Int) ) (! (= (UpdateOpn Mem@@3 (OpnReg reg@@1) v) Mem@@3)
 :qid |assembly.60:15|
 :skolemid |63|
 :pattern ( (UpdateOpn Mem@@3 (OpnReg reg@@1) v))
)))
(assert (forall ((Mem@@4 (Array Int Int)) (ptr@@13 Int) (v@@0 Int) ) (! (= (UpdateOpn Mem@@4 (OpnMem ptr@@13) v@@0) (store Mem@@4 ptr@@13 v@@0))
 :qid |assembly.61:15|
 :skolemid |64|
 :pattern ( (UpdateOpn Mem@@4 (OpnMem ptr@@13) v@@0))
)))
(assert (forall (($Mem@@0 (Array Int Int)) (s Int) (i@@10 Int) ) (! (= (select (select (MapStacksToMem $Mem@@0) s) i@@10) (select $Mem@@0 i@@10))
 :qid |utilibpl.20:15|
 :skolemid |65|
 :pattern ( (select (select (MapStacksToMem $Mem@@0) s) i@@10))
)))
(assert (= ?NumStacks 64))
(assert (= ?InitialStack 0))
(assert (= ?InterruptStack 0))
(assert (= ?InterruptReserve 16))
(assert (= ?StackReserve 4096))
(assert (= ?STACK_EMPTY 0))
(assert (= ?STACK_RUNNING 1))
(assert (= ?STACK_YIELDED 2))
(assert (= ?STACK_INTERRUPTED 3))
(assert (forall ((tag Int) ) (! (= (IsStackStateTag tag) (and
(<= 0 tag)
(<= tag 3)))
 :qid |stacksib.61:27|
 :skolemid |66|
 :pattern ( (IsStackStateTag tag))
)))
(assert (forall ((tag@@0 Int) (state T@StackState) ) (! (= (IsStackStateTagFor tag@@0 state) (and
(IsStackStateTag tag@@0)
(= tag@@0 (StackStateTag state))))
 :qid |stacksib.62:30|
 :skolemid |67|
 :pattern ( (IsStackStateTagFor tag@@0 state))
)))
(assert (= ?KernelEntryPoint 3735928559))
(assert (= ?SSize 1024))
(assert (= ?DSize 1024))
(assert (= ?PciSize (* 8 65536)))
(assert (= ?TSize 256))
(assert (= ?FSize 16384))
(assert (= ?sLo ?memLo))
(assert (= ?sHi (+ ?sLo ?SSize)))
(assert (= ?dLo ?sHi))
(assert (= ?dHi (+ ?dLo ?DSize)))
(assert (= ?pciLo ?dHi))
(assert (= ?pciHi (+ ?pciLo ?PciSize)))
(assert (= ?tLo ?pciHi))
(assert (= ?tHi (+ ?tLo (* ?NumStacks ?TSize))))
(assert (= ?fLo ?tHi))
(assert (= ?fHi (+ ?fLo (* ?NumStacks ?FSize))))
(assert (= ?gcLo (+ (+ ?memLo 1114112) (* 8 65536))))
(assert (= ?gcHi ?memHi))
(assert (forall ((i@@11 Int) ) (! (= (gcAddr i@@11) (and
(<= ?gcLo i@@11)
(< i@@11 ?gcHi)))
 :qid |separati.58:18|
 :skolemid |72|
 :pattern ( (gcAddr i@@11))
)))
(assert (forall ((i@@12 Int) ) (! (= (gcAddrEx i@@12) (and
(<= ?gcLo i@@12)
(<= i@@12 ?gcHi)))
 :qid |separati.59:20|
 :skolemid |73|
 :pattern ( (gcAddrEx i@@12))
)))
(assert (forall ((s@@0 Int) ) (! (= (isStack s@@0) (and
(<= 0 s@@0)
(< s@@0 ?NumStacks)))
 :qid |separati.61:19|
 :skolemid |74|
 :pattern ( (isStack s@@0))
)))
(assert (forall ((i@@13 Int) ) (! (= (sAddr i@@13) (and
(<= ?sLo i@@13)
(< i@@13 ?sHi)))
 :qid |separati.63:17|
 :skolemid |75|
 :pattern ( (sAddr i@@13))
)))
(assert (forall ((i@@14 Int) ) (! (= (sAddrEx i@@14) (and
(<= ?sLo i@@14)
(<= i@@14 ?sHi)))
 :qid |separati.64:19|
 :skolemid |76|
 :pattern ( (sAddrEx i@@14))
)))
(assert (forall ((i@@15 Int) ) (! (= (dAddr i@@15) (and
(<= ?dLo i@@15)
(< i@@15 ?dHi)))
 :qid |separati.66:17|
 :skolemid |77|
 :pattern ( (dAddr i@@15))
)))
(assert (forall ((i@@16 Int) ) (! (= (dAddrEx i@@16) (and
(<= ?dLo i@@16)
(<= i@@16 ?dHi)))
 :qid |separati.67:19|
 :skolemid |78|
 :pattern ( (dAddrEx i@@16))
)))
(assert (forall ((i@@17 Int) ) (! (= (pciAddr i@@17) (and
(<= ?pciLo i@@17)
(< i@@17 ?pciHi)))
 :qid |separati.69:19|
 :skolemid |79|
 :pattern ( (pciAddr i@@17))
)))
(assert (forall ((i@@18 Int) ) (! (= (pciAddrEx i@@18) (and
(<= ?pciLo i@@18)
(<= i@@18 ?pciHi)))
 :qid |separati.70:21|
 :skolemid |80|
 :pattern ( (pciAddrEx i@@18))
)))
(assert (forall ((s@@1 Int) (i@@19 Int) ) (! (= (fAddr s@@1 i@@19) (and
(isStack s@@1)
(<= (+ ?fLo (* s@@1 ?FSize)) i@@19)
(< i@@19 (+ (+ ?fLo (* s@@1 ?FSize)) ?FSize))))
 :qid |separati.72:17|
 :skolemid |81|
 :pattern ( (fAddr s@@1 i@@19))
)))
(assert (forall ((s@@2 Int) (i@@20 Int) ) (! (= (fAddrEx s@@2 i@@20) (and
(isStack s@@2)
(<= (+ ?fLo (* s@@2 ?FSize)) i@@20)
(<= i@@20 (+ (+ ?fLo (* s@@2 ?FSize)) ?FSize))))
 :qid |separati.73:19|
 :skolemid |82|
 :pattern ( (fAddrEx s@@2 i@@20))
)))
(assert (forall ((s@@3 Int) (i@@21 Int) ) (! (= (tAddr s@@3 i@@21) (and
(isStack s@@3)
(<= (+ ?tLo (* s@@3 ?TSize)) i@@21)
(< i@@21 (+ (+ ?tLo (* s@@3 ?TSize)) ?TSize))))
 :qid |separati.75:17|
 :skolemid |83|
 :pattern ( (tAddr s@@3 i@@21))
)))
(assert (forall ((s@@4 Int) (i@@22 Int) ) (! (= (tAddrEx s@@4 i@@22) (and
(isStack s@@4)
(<= (+ ?tLo (* s@@4 ?TSize)) i@@22)
(<= i@@22 (+ (+ ?tLo (* s@@4 ?TSize)) ?TSize))))
 :qid |separati.76:19|
 :skolemid |84|
 :pattern ( (tAddrEx s@@4 i@@22))
)))
(assert (forall (($Mem@@1 (Array Int Int)) ($sMem (Array Int Int)) ($dMem (Array Int Int)) ($pciMem (Array Int Int)) ($tMems (Array Int (Array Int Int))) ($fMems (Array Int (Array Int Int))) ($gcMem (Array Int Int)) (SLo Int) (DLo Int) (PciLo Int) (TLo Int) (FLo Int) (GcLo Int) (GcHi Int) ) (! (= (MemInv $Mem@@1 $sMem $dMem $pciMem $tMems $fMems $gcMem SLo DLo PciLo TLo FLo GcLo GcHi) (and
(MemSepInv $Mem@@1 $sMem $dMem $pciMem $tMems $fMems $gcMem SLo DLo PciLo TLo FLo GcLo GcHi)
(<= ?gcLo ?gcHi)
(Aligned ?sLo)
(Aligned ?dLo)
(Aligned ?pciLo)
(Aligned ?tLo)
(Aligned ?fLo)
(Aligned ?gcLo)
(Aligned ?gcHi)
(= SLo ?sLo)
(= DLo ?dLo)
(= PciLo ?pciLo)
(= TLo ?tLo)
(= FLo ?fLo)
(= GcLo ?gcLo)
(= GcHi ?gcHi)))
 :qid |separati.80:18|
 :skolemid |85|
 :pattern ( (MemInv $Mem@@1 $sMem $dMem $pciMem $tMems $fMems $gcMem SLo DLo PciLo TLo FLo GcLo GcHi))
)))
(assert (forall ((n Int) ($sMem@@0 (Array Int Int)) ($esp Int) ) (! (= (SMemRequire n $sMem@@0 $esp) (and
(Aligned $esp)
(<= (+ ?sLo n) $esp)
(<= $esp ?sHi)))
 :qid |separati.198:23|
 :skolemid |86|
 :pattern ( (SMemRequire n $sMem@@0 $esp))
)))
(assert (forall ((n@@0 Int) (m Int) ($sMem@@1 (Array Int Int)) ($esp@@0 Int) ) (! (= (SMemRequireInline n@@0 m $sMem@@1 $esp@@0) (and
(Aligned $esp@@0)
(Aligned (+ $esp@@0 m))
(<= (+ ?sLo n@@0) $esp@@0)
(<= (+ $esp@@0 m) ?sHi)))
 :qid |separati.205:29|
 :skolemid |87|
 :pattern ( (SMemRequireInline n@@0 m $sMem@@1 $esp@@0))
)))
(assert (forall ((n@@1 Int) ($sMem@@2 (Array Int Int)) ($esp@@1 Int) ($RET T@ReturnTo) ) (! (= (SMemRequireRA n@@1 $sMem@@2 $esp@@1 $RET) (and
(SMemRequire n@@1 $sMem@@2 $esp@@1)
(<= (+ ?sLo n@@1) $esp@@1)
(<= $esp@@1 (- ?sHi 4))
(= (ReturnToAddr (select $sMem@@2 $esp@@1)) $RET)))
 :qid |separati.213:25|
 :skolemid |88|
 :pattern ( (SMemRequireRA n@@1 $sMem@@2 $esp@@1 $RET))
)))
(assert (forall (($sMem@@3 (Array Int Int)) (oldSMem (Array Int Int)) ($esp@@2 Int) (oldEsp Int) ) (! (= (SMemInv $sMem@@3 oldSMem $esp@@2 oldEsp) (and
(= $esp@@2 oldEsp)
(forall ((i@@23 Int) ) (! (=> (<= $esp@@2 i@@23) (= (select $sMem@@3 i@@23) (select oldSMem i@@23)))
 :qid |separati.224:27|
 :skolemid |89|
 :pattern ( (select $sMem@@3 i@@23))
))))
 :qid |separati.221:19|
 :skolemid |90|
 :pattern ( (SMemInv $sMem@@3 oldSMem $esp@@2 oldEsp))
)))
(assert (forall (($sMem@@4 (Array Int Int)) (oldSMem@@0 (Array Int Int)) ($esp@@3 Int) (oldEsp@@0 Int) ) (! (= (SMemEnsure $sMem@@4 oldSMem@@0 $esp@@3 oldEsp@@0) (and
(= $esp@@3 (+ oldEsp@@0 4))
(forall ((i@@24 Int) ) (! (=> (<= $esp@@3 i@@24) (= (select $sMem@@4 i@@24) (select oldSMem@@0 i@@24)))
 :qid |separati.231:29|
 :skolemid |91|
 :pattern ( (select $sMem@@4 i@@24))
))))
 :qid |separati.228:22|
 :skolemid |92|
 :pattern ( (SMemEnsure $sMem@@4 oldSMem@@0 $esp@@3 oldEsp@@0))
)))
(assert (forall ((a@@3 (Array Int Int)) (off Int) (aBase Int) (bb (Array Int Int)) (i0 Int) (i1@@0 Int) (i2@@0 Int) (g1 Int) (g2 Int) ) (! (= (bbvec4 a@@3 off aBase bb i0 i1@@0 i2@@0 g1 g2) (forall ((i@@25 Int) ) (! (=> (and
(TV i@@25)
(<= i1@@0 i@@25)
(< i@@25 i2@@0)
(Aligned (- i@@25 i0))) (and
(between g1 g2 (+ g1 (BitIndex i0 i@@25)))
(= (= (select a@@3 (+ aBase (- i@@25 i0))) off) (BitZero (select bb (+ g1 (BitIndex i0 i@@25))) i0 i@@25))))
 :qid |BitVecto.12:11|
 :skolemid |94|
 :pattern ( (TV i@@25))
)))
 :qid |BitVecto.10:17|
 :skolemid |95|
 :pattern ( (bbvec4 a@@3 off aBase bb i0 i1@@0 i2@@0 g1 g2))
)))
(assert (forall ((a@@4 (Array Int Int)) (aBase@@0 Int) (bb@@0 (Array Int Int)) (i0@@0 Int) (i1@@1 Int) (i2@@1 Int) (g1@@0 Int) (g2@@0 Int) ) (! (= (bb2vec4 a@@4 aBase@@0 bb@@0 i0@@0 i1@@1 i2@@1 g1@@0 g2@@0) (forall ((i@@26 Int) ) (! (=> (and
(TV i@@26)
(word (- i@@26 i0@@0))
(<= i1@@1 i@@26)
(< i@@26 i2@@1)
(Aligned (- i@@26 i0@@0))) (and
(between g1@@0 g2@@0 (+ g1@@0 (ColorIndex i0@@0 i@@26)))
(= (select a@@4 (+ aBase@@0 (- i@@26 i0@@0))) (ColorGet (select bb@@0 (+ g1@@0 (ColorIndex i0@@0 i@@26))) i0@@0 i@@26))))
 :qid |BitVecto.20:11|
 :skolemid |96|
 :pattern ( (TV i@@26))
)))
 :qid |BitVecto.18:18|
 :skolemid |97|
 :pattern ( (bb2vec4 a@@4 aBase@@0 bb@@0 i0@@0 i1@@1 i2@@1 g1@@0 g2@@0))
)))
(assert (forall ((rev (Array Int Int)) (ptr@@14 Int) (q@abs Int) ) (! (= (Pointer rev ptr@@14 q@abs) (and
(gcAddr ptr@@14)
(Aligned ptr@@14)
(not (= q@abs NO_ABS))
(= (select rev ptr@@14) q@abs)))
 :qid |GcMemory.38:19|
 :skolemid |100|
 :pattern ( (Pointer rev ptr@@14 q@abs))
)))
(assert (forall ((isPtr Bool) (rev@@0 (Array Int Int)) (val@@1 Int) (q@abs@@0 Int) (offset Int) ) (! (= (InteriorValue isPtr rev@@0 val@@1 q@abs@@0 offset) (or
(and
isPtr
(word val@@1)
(gcAddrEx val@@1)
(Pointer rev@@0 (- (- val@@1 4) offset) q@abs@@0)
(not (word q@abs@@0))
(<= 0 offset)
(<= offset (- (* 4 (numFields q@abs@@0)) 4)))
(and
isPtr
(word val@@1)
(not (gcAddrEx val@@1))
(= q@abs@@0 val@@1))
(and
(not isPtr)
(word val@@1)
(= q@abs@@0 val@@1))))
 :qid |GcMemory.46:25|
 :skolemid |101|
 :pattern ( (InteriorValue isPtr rev@@0 val@@1 q@abs@@0 offset))
)))
(assert (forall ((isPtr@@0 Bool) (rev@@1 (Array Int Int)) (val@@2 Int) (q@abs@@1 Int) ) (! (= (Value isPtr@@0 rev@@1 val@@2 q@abs@@1) (InteriorValue isPtr@@0 rev@@1 val@@2 q@abs@@1 0))
 :qid |GcMemory.55:17|
 :skolemid |102|
 :pattern ( (Value isPtr@@0 rev@@1 val@@2 q@abs@@1))
)))
(assert (forall (($toAbs (Array Int Int)) ) (! (= (WellFormed $toAbs) (forall ((i1@@2 Int) (i2@@2 Int) ) (! (=> (and
(TV i1@@2)
(TV i2@@2)
(gcAddr i1@@2)
(gcAddr i2@@2)
(not (= i1@@2 i2@@2))
(not (= (select $toAbs i1@@2) NO_ABS))
(not (= (select $toAbs i2@@2) NO_ABS))) (not (= (select $toAbs i1@@2) (select $toAbs i2@@2))))
 :qid |GcMemory.83:11|
 :skolemid |103|
 :pattern ( (TV i1@@2) (TV i2@@2))
)))
 :qid |GcMemory.80:22|
 :skolemid |104|
 :pattern ( (WellFormed $toAbs))
)))
(assert (forall ((slot Int) ) (! (= (TSlot slot) true)
 :qid |Bartokib.10:32|
 :skolemid |105|
 :pattern ( (TSlot slot))
)))
(assert (forall ((table Int) ) (! (= (TT table) true)
 :qid |Bartokib.13:29|
 :skolemid |106|
 :pattern ( (TT table))
)))
(assert (forall ((x@@6 Int) (i@@27 Int) ) (! (= (getBit x@@6 i@@27) (= 1 (q@and (shr x@@6 i@@27) 1)))
 :qid |Bartokib.19:18|
 :skolemid |107|
 :pattern ( (getBit x@@6 i@@27))
)))
(assert (forall ((x@@7 Int) (i@@28 Int) ) (! (= (getNib x@@7 i@@28) (q@and (shr x@@7 i@@28) 15))
 :qid |Bartokib.20:18|
 :skolemid |108|
 :pattern ( (getNib x@@7 i@@28))
)))
(assert (= ?SPARSE_TAG 1))
(assert (= ?DENSE_TAG 3))
(assert (= ?PTR_VECTOR_TAG 5))
(assert (= ?OTHER_VECTOR_TAG 7))
(assert (= ?PTR_ARRAY_TAG 9))
(assert (= ?OTHER_ARRAY_TAG 11))
(assert (= ?STRING_TAG 13))
(assert (forall ((t Int) ) (! (= (isOtherTag t) (not (or
(= t ?SPARSE_TAG)
(= t ?DENSE_TAG)
(= t ?PTR_VECTOR_TAG)
(= t ?OTHER_VECTOR_TAG)
(= t ?PTR_ARRAY_TAG)
(= t ?OTHER_ARRAY_TAG)
(= t ?STRING_TAG))))
 :qid |Bartokib.30:22|
 :skolemid |109|
 :pattern ( (isOtherTag t))
)))
(assert (forall ((t@@0 Int) ) (! (= (isVarSize t@@0) (or
(= t@@0 ?PTR_VECTOR_TAG)
(= t@@0 ?OTHER_VECTOR_TAG)
(= t@@0 ?PTR_ARRAY_TAG)
(= t@@0 ?OTHER_ARRAY_TAG)
(= t@@0 ?STRING_TAG)))
 :qid |Bartokib.40:21|
 :skolemid |110|
 :pattern ( (isVarSize t@@0))
)))
(assert (forall ((t@@1 Int) (j@@0 Int) ) (! (= (isReadonlyField t@@1 j@@0) (or
(= j@@0 1)
(and
(= t@@1 ?PTR_VECTOR_TAG)
(= j@@0 2))
(and
(= t@@1 ?OTHER_VECTOR_TAG)
(= j@@0 2))
(and
(= t@@1 ?PTR_ARRAY_TAG)
(or
(= j@@0 2)
(= j@@0 3)))
(and
(= t@@1 ?OTHER_ARRAY_TAG)
(or
(= j@@0 2)
(= j@@0 3)))
(and
(= t@@1 ?STRING_TAG)
(= j@@0 2))))
 :qid |Bartokib.47:27|
 :skolemid |111|
 :pattern ( (isReadonlyField t@@1 j@@0))
)))
(assert (= ?STRING_VTABLE 3735928559))
(assert (= ?BYTE_VECTOR_VTABLE 3735928559))
(assert (= ?VT_MASK 60))
(assert (= ?VT_BASE_LENGTH 52))
(assert (= ?VT_ARRAY_ELEMENT_SIZE 44))
(assert (= ?VT_ARRAY_ELEMENT_CLASS 40))
(assert (= ?VT_ARRAY_OF 36))
(assert (forall ((vt Int) ) (! (= (mask vt) (ro32 (+ vt ?VT_MASK)))
 :qid |Bartokib.66:16|
 :skolemid |112|
 :pattern ( (mask vt))
)))
(assert (forall ((vt@@0 Int) ) (! (= (tag@@1 vt@@0) (q@and (mask vt@@0) 15))
 :qid |Bartokib.67:15|
 :skolemid |113|
 :pattern ( (tag@@1 vt@@0))
)))
(assert (forall ((vt@@1 Int) ) (! (= (baseLength vt@@1) (ro32 (+ vt@@1 ?VT_BASE_LENGTH)))
 :qid |Bartokib.68:22|
 :skolemid |114|
 :pattern ( (baseLength vt@@1))
)))
(assert (forall ((vt@@2 Int) ) (! (= (arrayElementSize vt@@2) (ro32 (+ vt@@2 ?VT_ARRAY_ELEMENT_SIZE)))
 :qid |Bartokib.69:28|
 :skolemid |115|
 :pattern ( (arrayElementSize vt@@2))
)))
(assert (forall ((vt@@3 Int) ) (! (= (arrayElementClass vt@@3) (ro32 (+ vt@@3 ?VT_ARRAY_ELEMENT_CLASS)))
 :qid |Bartokib.70:29|
 :skolemid |116|
 :pattern ( (arrayElementClass vt@@3))
)))
(assert (forall ((vt@@4 Int) ) (! (= (arrayOf vt@@4) (ro32 (+ vt@@4 ?VT_ARRAY_OF)))
 :qid |Bartokib.71:19|
 :skolemid |117|
 :pattern ( (arrayOf vt@@4))
)))
(assert (forall ((vt@@5 Int) ) (! (= (baseWords vt@@5) (shr (baseLength vt@@5) 2))
 :qid |Bartokib.73:21|
 :skolemid |118|
 :pattern ( (baseWords vt@@5))
)))
(assert (forall ((vt@@6 Int) ) (! (= (arrayElementWords vt@@6) (shr (arrayElementSize vt@@6) 2))
 :qid |Bartokib.74:29|
 :skolemid |119|
 :pattern ( (arrayElementWords vt@@6))
)))
(assert (= ?TYPE_STRUCT 3))
(assert (forall ((q@abs@@2 Int) (vt@@7 Int) (j@@1 Int) (field Int) ) (! (= (Sparse1 q@abs@@2 vt@@7 j@@1 field) (and
(= (VFieldPtr q@abs@@2 j@@1) (not (= (fieldToSlot vt@@7 field) 0)))
(=> (not (= (fieldToSlot vt@@7 field) 0)) (and
(between 1 8 (fieldToSlot vt@@7 field))
(= (- (getNib (mask vt@@7) (* 4 (fieldToSlot vt@@7 field))) 1) field)))))
 :qid |Bartokib.85:19|
 :skolemid |120|
 :pattern ( (Sparse1 q@abs@@2 vt@@7 j@@1 field))
)))
(assert (forall ((vt@@8 Int) (nFields Int) ) (! (= (Sparse2 vt@@8 nFields) (forall ((k Int) ) (! (=> (TSlot k) (=> (and
(<= 1 k)
(< k 8)
(not (= (getNib (mask vt@@8) (* 4 k)) 0))) (and
(between 0 nFields (- (getNib (mask vt@@8) (* 4 k)) 1))
(= (fieldToSlot vt@@8 (- (getNib (mask vt@@8) (* 4 k)) 1)) k))))
 :qid |Bartokib.95:11|
 :skolemid |121|
 :pattern ( (TSlot k))
)))
 :qid |Bartokib.92:19|
 :skolemid |122|
 :pattern ( (Sparse2 vt@@8 nFields))
)))
(assert (forall ((q@abs@@3 Int) (vt@@9 Int) ) (! (= (TVT q@abs@@3 vt@@9) true)
 :qid |Bartokib.99:30|
 :skolemid |123|
 :pattern ( (TVT q@abs@@3 vt@@9))
)))
(assert (forall ((q@abs@@4 Int) (vt@@10 Int) ) (! (= (VTable q@abs@@4 vt@@10) (and
(not (VFieldPtr q@abs@@4 0))
(not (VFieldPtr q@abs@@4 1))
(=> (= (tag@@1 vt@@10) ?DENSE_TAG) (forall ((j@@2 Int) ) (! (=> (TO j@@2) (=> (and
(<= 2 j@@2)
(< j@@2 (numFields q@abs@@4))) (= (VFieldPtr q@abs@@4 j@@2) (and
(< j@@2 30)
(getBit (mask vt@@10) (+ 2 j@@2))))))
 :qid |Bartokib.101:139|
 :skolemid |124|
 :pattern ( (TO j@@2))
)))
(=> (= (tag@@1 vt@@10) ?SPARSE_TAG) (and
(forall ((j@@3 Int) ) (! (=> (TO j@@3) (Sparse1 q@abs@@4 vt@@10 j@@3 (- j@@3 2)))
 :qid |Bartokib.101:271|
 :skolemid |125|
 :pattern ( (TO j@@3))
))
(Sparse2 vt@@10 (- (numFields q@abs@@4) 2))))
(=> (= (tag@@1 vt@@10) ?STRING_TAG) (forall ((j@@4 Int) ) (! (=> (TO j@@4) (not (VFieldPtr q@abs@@4 j@@4)))
 :qid |Bartokib.101:381|
 :skolemid |126|
 :pattern ( (TO j@@4))
)))
(=> (= (tag@@1 vt@@10) ?PTR_VECTOR_TAG) (and
(between 3 (numFields q@abs@@4) (baseWords vt@@10))
(forall ((j@@5 Int) ) (! (=> (TO j@@5) (= (and
(<= (baseWords vt@@10) j@@5)
(< j@@5 (numFields q@abs@@4))) (VFieldPtr q@abs@@4 j@@5)))
 :qid |Bartokib.101:502|
 :skolemid |127|
 :pattern ( (TO j@@5))
))))
(=> (= (tag@@1 vt@@10) ?OTHER_VECTOR_TAG) (and
(not (VFieldPtr q@abs@@4 2))
(inRo (+ (arrayElementClass vt@@10) ?VT_MASK) 4)
(between 3 (numFields q@abs@@4) (baseWords vt@@10))
(=> (not (= (arrayOf vt@@10) ?TYPE_STRUCT)) (forall ((j@@6 Int) ) (! (=> (TO j@@6) (not (VFieldPtr q@abs@@4 j@@6)))
 :qid |Bartokib.101:759|
 :skolemid |128|
 :pattern ( (TO j@@6))
)))
(=> (= (arrayOf vt@@10) ?TYPE_STRUCT) (not (isVarSize (tag@@1 (arrayElementClass vt@@10)))))
(=> (and
(= (arrayOf vt@@10) ?TYPE_STRUCT)
(= (mask (arrayElementClass vt@@10)) ?SPARSE_TAG)) (forall ((j@@7 Int) ) (! (=> (TO j@@7) (not (VFieldPtr q@abs@@4 j@@7)))
 :qid |Bartokib.101:953|
 :skolemid |129|
 :pattern ( (TO j@@7))
)))
(=> (and
(= (arrayOf vt@@10) ?TYPE_STRUCT)
(= (tag@@1 (arrayElementClass vt@@10)) ?SPARSE_TAG)) (and
(forall ((j@@8 Int) ) (! (=> (TO j@@8) (and
(=> (VFieldPtr q@abs@@4 j@@8) (and
(<= (baseWords vt@@10) j@@8)
(< j@@8 (numFields q@abs@@4))))
(=> (and
(<= (baseWords vt@@10) j@@8)
(< j@@8 (numFields q@abs@@4))) (forall ((m@@0 Int) ) (! (=> (TO m@@0) (=> (between 0 (arrayElementWords vt@@10) (- (- j@@8 (Mult (arrayElementWords vt@@10) m@@0)) (baseWords vt@@10))) (and
(<= (+ (+ (baseWords vt@@10) (Mult (arrayElementWords vt@@10) m@@0)) (arrayElementWords vt@@10)) (numFields q@abs@@4))
(Sparse1 q@abs@@4 (arrayElementClass vt@@10) j@@8 (- (- j@@8 (Mult (arrayElementWords vt@@10) m@@0)) (baseWords vt@@10))))))
 :qid |Bartokib.101:1201|
 :skolemid |130|
 :pattern ( (TO m@@0))
)))))
 :qid |Bartokib.101:1076|
 :skolemid |131|
 :pattern ( (TO j@@8))
))
(>= (arrayElementWords vt@@10) 0)
(Sparse2 (arrayElementClass vt@@10) (arrayElementWords vt@@10))))))
(=> (= (tag@@1 vt@@10) ?PTR_ARRAY_TAG) (and
(between 4 (numFields q@abs@@4) (baseWords vt@@10))
(forall ((j@@9 Int) ) (! (=> (TO j@@9) (= (and
(<= (baseWords vt@@10) j@@9)
(< j@@9 (numFields q@abs@@4))) (VFieldPtr q@abs@@4 j@@9)))
 :qid |Bartokib.101:1636|
 :skolemid |132|
 :pattern ( (TO j@@9))
))))
(=> (= (tag@@1 vt@@10) ?OTHER_ARRAY_TAG) (and
(not (VFieldPtr q@abs@@4 2))
(not (VFieldPtr q@abs@@4 3))
(between 4 (numFields q@abs@@4) (baseWords vt@@10))
(=> (not (= (arrayOf vt@@10) ?TYPE_STRUCT)) (forall ((j@@10 Int) ) (! (=> (TO j@@10) (not (VFieldPtr q@abs@@4 j@@10)))
 :qid |Bartokib.101:1868|
 :skolemid |133|
 :pattern ( (TO j@@10))
)))))
(=> (isOtherTag (tag@@1 vt@@10)) (and
(forall ((j@@11 Int) ) (! (=> (TO j@@11) (and
(= (VFieldPtr q@abs@@4 j@@11) (not (= (fieldToSlot vt@@10 j@@11) 0)))
(=> (not (= (fieldToSlot vt@@10 j@@11) 0)) (and
(between 1 (+ 1 (ro32 (mask vt@@10))) (fieldToSlot vt@@10 j@@11))
(= (+ (ro32 (+ (mask vt@@10) (* 4 (fieldToSlot vt@@10 j@@11)))) 1) j@@11)))))
 :qid |Bartokib.101:1946|
 :skolemid |134|
 :pattern ( (TO j@@11))
))
(forall ((k@@0 Int) ) (! (=> (TSlot k@@0) (=> (and
(<= 1 k@@0)
(< k@@0 (+ 1 (ro32 (mask vt@@10))))) (and
(inRo (+ (mask vt@@10) (* 4 k@@0)) 4)
(=> (not (= (ro32 (+ (mask vt@@10) (* 4 k@@0))) 0)) (and
(between 0 (numFields q@abs@@4) (+ (ro32 (+ (mask vt@@10) (* 4 k@@0))) 1))
(= (fieldToSlot vt@@10 (+ (ro32 (+ (mask vt@@10) (* 4 k@@0))) 1)) k@@0))))))
 :qid |Bartokib.101:2132|
 :skolemid |135|
 :pattern ( (TSlot k@@0))
))
(inRo (mask vt@@10) 4)
(>= (ro32 (mask vt@@10)) 0)))))
 :qid |Bartokib.101:15|
 :skolemid |136|
 :pattern ( (TVT q@abs@@4 vt@@10))
)))
(assert (forall ((i@@29 Int) ) (! (= (pad i@@29) (q@and (+ i@@29 3) (neg 3)))
 :qid |Bartokib.163:15|
 :skolemid |137|
 :pattern ( (pad i@@29))
)))
(assert (forall ((q@abs@@5 Int) ) (! (= (TVL q@abs@@5) true)
 :qid |Bartokib.168:30|
 :skolemid |138|
 :pattern ( (TVL q@abs@@5))
)))
(assert (forall ((q@abs@@6 Int) (vt@@11 Int) (nElems1 Int) (nElems2 Int) ) (! (= (ObjSize q@abs@@6 vt@@11 nElems1 nElems2) (and
(>= (numFields q@abs@@6) 2)
(=> (not (isVarSize (tag@@1 vt@@11))) (= (* 4 (numFields q@abs@@6)) (baseLength vt@@11)))
(=> (= (tag@@1 vt@@11) ?STRING_TAG) (and
(>= (numFields q@abs@@6) 4)
(= (* 4 (numFields q@abs@@6)) (pad (+ 16 (* 2 nElems1))))))
(=> (= (tag@@1 vt@@11) ?PTR_VECTOR_TAG) (and
(>= (numFields q@abs@@6) 3)
(= (* 4 (numFields q@abs@@6)) (pad (+ (baseLength vt@@11) (* 4 nElems1))))))
(=> (= (tag@@1 vt@@11) ?OTHER_VECTOR_TAG) (and
(>= (numFields q@abs@@6) 3)
(= (* 4 (numFields q@abs@@6)) (pad (+ (baseLength vt@@11) (Mult (arrayElementSize vt@@11) nElems1))))))
(=> (= (tag@@1 vt@@11) ?PTR_ARRAY_TAG) (and
(>= (numFields q@abs@@6) 4)
(= (* 4 (numFields q@abs@@6)) (pad (+ (baseLength vt@@11) (* 4 nElems2))))))
(=> (= (tag@@1 vt@@11) ?OTHER_ARRAY_TAG) (and
(>= (numFields q@abs@@6) 4)
(= (* 4 (numFields q@abs@@6)) (pad (+ (baseLength vt@@11) (Mult (arrayElementSize vt@@11) nElems2))))))))
 :qid |Bartokib.170:15|
 :skolemid |139|
 :pattern ( (TVL q@abs@@6) (ObjSize q@abs@@6 vt@@11 nElems1 nElems2))
)))
(assert (forall ((layout T@$FrameLayout) (j@@12 Int) ) (! (= (inFrame layout j@@12) (and
(<= (- 0 (frameLayoutLocals layout)) j@@12)
(< j@@12 (+ 2 (frameLayoutArgs layout)))))
 :qid |Bartokib.195:19|
 :skolemid |140|
 :pattern ( (inFrame layout j@@12))
)))
(assert (forall ((l T@$FrameLayout) ) (! (= (TVF l) true)
 :qid |Bartokib.200:30|
 :skolemid |141|
 :pattern ( (TVF l))
)))
(assert (= ?SectionCount 3735928559))
(assert (= ?StaticDataPointerBitMap 3735928559))
(assert (= ?DataSectionEnd 3735928559))
(assert (= ?DataSectionBase 3735928559))
(assert (forall ((section Int) ) (! (= (sectionBase section) (ro32 (+ ?DataSectionBase (* 4 section))))
 :qid |Bartokib.208:23|
 :skolemid |142|
 :pattern ( (sectionBase section))
)))
(assert (forall ((section@@0 Int) ) (! (= (sectionEnd section@@0) (ro32 (+ ?DataSectionEnd (* 4 section@@0))))
 :qid |Bartokib.209:22|
 :skolemid |143|
 :pattern ( (sectionEnd section@@0))
)))
(assert (forall ((s@@5 Int) (j@@13 Int) ) (! (= (TVS s@@5 j@@13) true)
 :qid |Bartokib.214:30|
 :skolemid |144|
 :pattern ( (TVS s@@5 j@@13))
)))
(assert (= ?CallSiteTableCount 3735928559))
(assert (= ?CodeBaseStartTable 3735928559))
(assert (= ?ReturnAddressToCallSiteSetNumbers 3735928559))
(assert (= ?CallSiteSetCount 3735928559))
(assert (= ?CallSiteSetNumberToIndex 3735928559))
(assert (= ?ActivationDescriptorTable 3735928559))
(assert (forall ((t@@2 Int) (j@@14 Int) ) (! (= (LookupDesc t@@2 j@@14) (ro32 (+ (ro32 (+ ?ActivationDescriptorTable (* 4 t@@2))) (* 4 (roU16 (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@2))) (* 2 j@@14)))))))
 :qid |Bartokib.223:22|
 :skolemid |145|
 :pattern ( (LookupDesc t@@2 j@@14))
)))
(assert (forall ((t@@3 Int) (j@@15 Int) ) (! (= (InTable t@@3 j@@15) (and
(<= 0 t@@3)
(< t@@3 ?CallSiteTableCount)
(<= 0 j@@15)
(< j@@15 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@3)))))))
 :qid |Bartokib.229:19|
 :skolemid |146|
 :pattern ( (InTable t@@3 j@@15))
)))
(assert (forall ((t@@4 Int) (j@@16 Int) (retaddr Int) ) (! (= (RetAddrAt t@@4 j@@16 retaddr) (and
(InTable t@@4 j@@16)
(between (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@4))) (* 4 j@@16))) (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@4))) (* 4 (+ j@@16 1)))) (- retaddr (ro32 (+ ?CodeBaseStartTable (* 4 t@@4)))))))
 :qid |Bartokib.234:21|
 :skolemid |147|
 :pattern ( (RetAddrAt t@@4 j@@16 retaddr))
)))
(assert (forall ((f@@5 Int) ) (! (= (TVFT f@@5) true)
 :qid |Bartokib.242:31|
 :skolemid |148|
 :pattern ( (TVFT f@@5))
)))
(assert (forall ((f@@6 Int) (ra Int) (nextFp Int) ($FrameAddr (Array Int Int)) ($FrameLayout (Array Int T@$FrameLayout)) ) (! (= (FrameNextInv f@@6 ra nextFp $FrameAddr $FrameLayout) (and
(>= f@@6 0)
(= (= f@@6 0) (= nextFp 0))
(=> (> f@@6 0) (and
(= (select $FrameAddr (- f@@6 1)) nextFp)
(exists ((t@@5 Int) (j@@17 Int) ) (! (and
(TT t@@5)
(TO j@@17)
(RetAddrAt t@@5 j@@17 ra))
 :qid |Bartokib.245:282|
 :skolemid |149|
 :pattern ( (TT t@@5) (TO j@@17))
))
(forall ((t@@6 Int) (j@@18 Int) ) (! (=> (and
(TT t@@6)
(TO j@@18)) (=> (RetAddrAt t@@6 j@@18 ra) (= (frameDescriptor (select $FrameLayout (- f@@6 1))) (LookupDesc t@@6 j@@18))))
 :qid |Bartokib.245:353|
 :skolemid |150|
 :pattern ( (TT t@@6) (TO j@@18))
))))))
 :qid |Bartokib.245:15|
 :skolemid |151|
 :pattern ( (TVFT f@@6) (FrameNextInv f@@6 ra nextFp $FrameAddr $FrameLayout))
)))
(assert (forall ((f@@7 Int) (l@@0 T@$FrameLayout) ($FrameAddr@@0 (Array Int Int)) ($FrameSlice (Array Int Int)) ($FrameLayout@@0 (Array Int T@$FrameLayout)) ($FrameAbs (Array Int (Array Int Int))) ($FrameOffset (Array Int Int)) ) (! (= (FrameInv f@@7 l@@0 $FrameAddr@@0 $FrameSlice $FrameLayout@@0 $FrameAbs $FrameOffset) (and
(FrameNextInv f@@7 (select (select $FrameAbs f@@7) 1) (select (select $FrameAbs f@@7) 0) $FrameAddr@@0 $FrameLayout@@0)
(forall ((j@@19 Int) ) (! (=> (TO j@@19) (=> (inFrame l@@0 j@@19) (= (select $FrameSlice (+ (select $FrameAddr@@0 f@@7) (* 4 j@@19))) f@@7)))
 :qid |Bartokib.259:97|
 :skolemid |152|
 :pattern ( (TO j@@19))
))
(forall ((j@@20 Int) ) (! (=> (TO j@@20) (=> (= (select $FrameSlice (+ (select $FrameAddr@@0 f@@7) (* 4 j@@20))) f@@7) (word (+ (select $FrameAddr@@0 f@@7) (* 4 j@@20)))))
 :qid |Bartokib.259:185|
 :skolemid |153|
 :pattern ( (TO j@@20))
))))
 :qid |Bartokib.256:20|
 :skolemid |154|
 :pattern ( (FrameInv f@@7 l@@0 $FrameAddr@@0 $FrameSlice $FrameLayout@@0 $FrameAbs $FrameOffset))
)))
(assert (forall (($FrameCount Int) ($FrameAddr@@1 (Array Int Int)) ($FrameLayout@@1 (Array Int T@$FrameLayout)) ($FrameSlice@@0 (Array Int Int)) ($FrameAbs@@0 (Array Int (Array Int Int))) ($FrameOffset@@0 (Array Int Int)) ) (! (= (StackInv $FrameCount $FrameAddr@@1 $FrameLayout@@1 $FrameSlice@@0 $FrameAbs@@0 $FrameOffset@@0) (forall ((f@@8 Int) ) (! (=> (TV f@@8) (=> (and
(<= 0 f@@8)
(< f@@8 $FrameCount)) (FrameInv f@@8 (select $FrameLayout@@1 f@@8) $FrameAddr@@1 $FrameSlice@@0 $FrameLayout@@1 $FrameAbs@@0 $FrameOffset@@0)))
 :qid |Bartokib.268:11|
 :skolemid |155|
 :pattern ( (TV f@@8))
)))
 :qid |Bartokib.265:20|
 :skolemid |156|
 :pattern ( (StackInv $FrameCount $FrameAddr@@1 $FrameLayout@@1 $FrameSlice@@0 $FrameAbs@@0 $FrameOffset@@0))
)))
(assert (forall (($s Int) ($FrameCounts (Array Int Int)) ($FrameAddrs (Array Int (Array Int Int))) ($FrameLayouts (Array Int (Array Int T@$FrameLayout))) ($FrameSlices (Array Int (Array Int Int))) ($FrameAbss (Array Int (Array Int (Array Int Int)))) ($FrameOffsets (Array Int (Array Int Int))) ) (! (= (StackInvS $s $FrameCounts $FrameAddrs $FrameLayouts $FrameSlices $FrameAbss $FrameOffsets) (StackInv (select $FrameCounts $s) (select $FrameAddrs $s) (select $FrameLayouts $s) (select $FrameSlices $s) (select $FrameAbss $s) (select $FrameOffsets $s)))
 :qid |Bartokib.272:21|
 :skolemid |157|
 :pattern ( (StackInvS $s $FrameCounts $FrameAddrs $FrameLayouts $FrameSlices $FrameAbss $FrameOffsets))
)))
(assert (forall ((s@@6 Int) (i1@@3 Int) (i2@@3 Int) (r (Array Int Int)) ($SectionMem (Array Int Int)) ($SectionAbs (Array Int (Array Int Int))) ) (! (= (SectionInv s@@6 i1@@3 i2@@3 r $SectionMem $SectionAbs) (forall ((j@@21 Int) ) (! (=> (TO j@@21) (=> (and
(<= 0 j@@21)
(< (+ i1@@3 (* 4 j@@21)) i2@@3)) (and
(= (sectionSlice (+ i1@@3 (* 4 j@@21))) s@@6)
(Value (sectionHasPtr s@@6 j@@21) r (select $SectionMem (+ i1@@3 (* 4 j@@21))) (select (select $SectionAbs s@@6) j@@21)))))
 :qid |Bartokib.284:11|
 :skolemid |158|
 :pattern ( (TO j@@21))
)))
 :qid |Bartokib.281:22|
 :skolemid |159|
 :pattern ( (SectionInv s@@6 i1@@3 i2@@3 r $SectionMem $SectionAbs))
)))
(assert (forall ((r@@0 (Array Int Int)) ($SectionMem@@0 (Array Int Int)) ($SectionAbs@@0 (Array Int (Array Int Int))) ) (! (= (StaticInv r@@0 $SectionMem@@0 $SectionAbs@@0) (forall ((s@@7 Int) ) (! (=> (TV s@@7) (=> (and
(<= 0 s@@7)
(< s@@7 ?SectionCount)) (SectionInv s@@7 (sectionBase s@@7) (sectionEnd s@@7) r@@0 $SectionMem@@0 $SectionAbs@@0)))
 :qid |Bartokib.292:11|
 :skolemid |160|
 :pattern ( (TV s@@7))
)))
 :qid |Bartokib.289:21|
 :skolemid |161|
 :pattern ( (StaticInv r@@0 $SectionMem@@0 $SectionAbs@@0))
)))
(assert (forall ((i@@30 Int) ) (! (= (select MAP_ZERO i@@30) 0)
 :qid |Commonib.20:15|
 :skolemid |171|
 :pattern ( (TV i@@30))
)))
(assert (forall ((i@@31 Int) ) (! (= (select MAP_NO_ABS i@@31) NO_ABS)
 :qid |Commonib.24:15|
 :skolemid |172|
 :pattern ( (TV i@@31))
)))
(assert (forall ((i@@32 Int) ) (! (= (AlignedHeapAddr i@@32) (and
(gcAddr i@@32)
(Aligned i@@32)))
 :qid |Commonib.26:27|
 :skolemid |173|
 :pattern ( (AlignedHeapAddr i@@32))
)))
(assert (forall ((rOld (Array Int Int)) (rNew (Array Int Int)) ) (! (= (RExtend rOld rNew) (forall ((i@@33 Int) ) (! (=> (not (= (select rOld i@@33) NO_ABS)) (= (select rOld i@@33) (select rNew i@@33)))
 :qid |Commonib.37:11|
 :skolemid |174|
 :pattern ( (select rOld i@@33))
)))
 :qid |Commonib.34:19|
 :skolemid |175|
 :pattern ( (RExtend rOld rNew))
)))
(assert (forall ((val@@3 Int) (rev@@2 (Array Int Int)) (q@abs@@7 Int) ) (! (= (AbsMapped val@@3 rev@@2 q@abs@@7) (and
(not (= q@abs@@7 NO_ABS))
(= q@abs@@7 (select rev@@2 val@@3))))
 :qid |Commonib.39:21|
 :skolemid |176|
 :pattern ( (AbsMapped val@@3 rev@@2 q@abs@@7))
)))
(assert (forall (($s@@0 Int) ) (! (= (TStk $s@@0) true)
 :qid |Commonib.55:30|
 :skolemid |177|
 :pattern ( (TStk $s@@0))
)))
(assert (forall (($s@@1 Int) ($tMems@@0 (Array Int (Array Int Int))) ) (! (= (StackTag $s@@1 $tMems@@0) (select (select $tMems@@0 $s@@1) (+ (+ ?tLo (* $s@@1 ?TSize)) 0)))
 :qid |Commonib.60:20|
 :skolemid |178|
 :pattern ( (StackTag $s@@1 $tMems@@0))
)))
(assert (forall (($s@@2 Int) ($tMems@@1 (Array Int (Array Int Int))) ) (! (= (StackEsp $s@@2 $tMems@@1) (select (select $tMems@@1 $s@@2) (+ (+ ?tLo (* $s@@2 ?TSize)) 4)))
 :qid |Commonib.61:20|
 :skolemid |179|
 :pattern ( (StackEsp $s@@2 $tMems@@1))
)))
(assert (forall (($s@@3 Int) ($tMems@@2 (Array Int (Array Int Int))) ) (! (= (StackEbp $s@@3 $tMems@@2) (select (select $tMems@@2 $s@@3) (+ (+ ?tLo (* $s@@3 ?TSize)) 8)))
 :qid |Commonib.62:20|
 :skolemid |180|
 :pattern ( (StackEbp $s@@3 $tMems@@2))
)))
(assert (forall (($s@@4 Int) ($tMems@@3 (Array Int (Array Int Int))) ) (! (= (StackEax $s@@4 $tMems@@3) (select (select $tMems@@3 $s@@4) (+ (+ ?tLo (* $s@@4 ?TSize)) 12)))
 :qid |Commonib.63:20|
 :skolemid |181|
 :pattern ( (StackEax $s@@4 $tMems@@3))
)))
(assert (forall (($s@@5 Int) ($tMems@@4 (Array Int (Array Int Int))) ) (! (= (StackEbx $s@@5 $tMems@@4) (select (select $tMems@@4 $s@@5) (+ (+ ?tLo (* $s@@5 ?TSize)) 16)))
 :qid |Commonib.64:20|
 :skolemid |182|
 :pattern ( (StackEbx $s@@5 $tMems@@4))
)))
(assert (forall (($s@@6 Int) ($tMems@@5 (Array Int (Array Int Int))) ) (! (= (StackEcx $s@@6 $tMems@@5) (select (select $tMems@@5 $s@@6) (+ (+ ?tLo (* $s@@6 ?TSize)) 20)))
 :qid |Commonib.65:20|
 :skolemid |183|
 :pattern ( (StackEcx $s@@6 $tMems@@5))
)))
(assert (forall (($s@@7 Int) ($tMems@@6 (Array Int (Array Int Int))) ) (! (= (StackEdx $s@@7 $tMems@@6) (select (select $tMems@@6 $s@@7) (+ (+ ?tLo (* $s@@7 ?TSize)) 24)))
 :qid |Commonib.66:20|
 :skolemid |184|
 :pattern ( (StackEdx $s@@7 $tMems@@6))
)))
(assert (forall (($s@@8 Int) ($tMems@@7 (Array Int (Array Int Int))) ) (! (= (StackEsi $s@@8 $tMems@@7) (select (select $tMems@@7 $s@@8) (+ (+ ?tLo (* $s@@8 ?TSize)) 28)))
 :qid |Commonib.67:20|
 :skolemid |185|
 :pattern ( (StackEsi $s@@8 $tMems@@7))
)))
(assert (forall (($s@@9 Int) ($tMems@@8 (Array Int (Array Int Int))) ) (! (= (StackEdi $s@@9 $tMems@@8) (select (select $tMems@@8 $s@@9) (+ (+ ?tLo (* $s@@9 ?TSize)) 32)))
 :qid |Commonib.68:20|
 :skolemid |186|
 :pattern ( (StackEdi $s@@9 $tMems@@8))
)))
(assert (forall (($s@@10 Int) ($tMems@@9 (Array Int (Array Int Int))) ($fMems@@0 (Array Int (Array Int Int))) ) (! (= (StackRA $s@@10 $tMems@@9 $fMems@@0) (select (select $fMems@@0 $s@@10) (StackEsp $s@@10 $tMems@@9)))
 :qid |Commonib.69:19|
 :skolemid |187|
 :pattern ( (StackRA $s@@10 $tMems@@9 $fMems@@0))
)))
(assert (forall (($s@@11 Int) ($tMems@@10 (Array Int (Array Int Int))) ($fMems@@1 (Array Int (Array Int Int))) ) (! (= (StackCS $s@@11 $tMems@@10 $fMems@@1) (select (select $fMems@@1 $s@@11) (+ (StackEsp $s@@11 $tMems@@10) 4)))
 :qid |Commonib.70:19|
 :skolemid |188|
 :pattern ( (StackCS $s@@11 $tMems@@10 $fMems@@1))
)))
(assert (forall (($s@@12 Int) ($tMems@@11 (Array Int (Array Int Int))) ($fMems@@2 (Array Int (Array Int Int))) ) (! (= (StackEfl $s@@12 $tMems@@11 $fMems@@2) (select (select $fMems@@2 $s@@12) (+ (StackEsp $s@@12 $tMems@@11) 8)))
 :qid |Commonib.71:20|
 :skolemid |189|
 :pattern ( (StackEfl $s@@12 $tMems@@11 $fMems@@2))
)))
(assert (forall (($state T@StackState) ) (! (= (IsEmpty $state) (= (StackStateTag $state) ?STACK_EMPTY))
 :qid |Commonib.73:19|
 :skolemid |190|
 :pattern ( (IsEmpty $state))
)))
(assert (forall (($state@@0 T@StackState) ) (! (= (IsYielded $state@@0) (= (StackStateTag $state@@0) ?STACK_YIELDED))
 :qid |Commonib.78:21|
 :skolemid |191|
 :pattern ( (IsYielded $state@@0))
)))
(assert (forall (($state@@1 T@StackState) ) (! (= (IsInterrupted $state@@1) (= (StackStateTag $state@@1) ?STACK_INTERRUPTED))
 :qid |Commonib.83:25|
 :skolemid |192|
 :pattern ( (IsInterrupted $state@@1))
)))
(assert (forall (($s@@13 Int) (f@@9 Int) (l@@1 T@$FrameLayout) (r@@1 (Array Int Int)) ($FrameAddr@@2 (Array Int Int)) ($FrameSlice@@1 (Array Int Int)) ($FrameLayout@@2 (Array Int T@$FrameLayout)) ($FrameAbs@@1 (Array Int (Array Int Int))) ($FrameOffset@@1 (Array Int Int)) ($fMem (Array Int Int)) ) (! (= (MutatorFrameInvAddrs $s@@13 f@@9 l@@1 r@@1 $FrameAddr@@2 $FrameSlice@@1 $FrameLayout@@2 $FrameAbs@@1 $FrameOffset@@1 $fMem) (forall ((j@@22 Int) ) (! (=> (TO j@@22) (=> (= (select $FrameSlice@@1 (+ (select $FrameAddr@@2 f@@9) (* 4 j@@22))) f@@9) (and
(Aligned (+ (select $FrameAddr@@2 f@@9) (* 4 j@@22)))
(fAddr $s@@13 (+ (select $FrameAddr@@2 f@@9) (* 4 j@@22))))))
 :qid |Commonib.91:11|
 :skolemid |193|
 :pattern ( (TO j@@22))
)))
 :qid |Commonib.88:32|
 :skolemid |194|
 :pattern ( (MutatorFrameInvAddrs $s@@13 f@@9 l@@1 r@@1 $FrameAddr@@2 $FrameSlice@@1 $FrameLayout@@2 $FrameAbs@@1 $FrameOffset@@1 $fMem))
)))
(assert (forall (($s@@14 Int) (f@@10 Int) (l@@2 T@$FrameLayout) (r@@2 (Array Int Int)) ($FrameAddr@@3 (Array Int Int)) ($FrameSlice@@2 (Array Int Int)) ($FrameLayout@@3 (Array Int T@$FrameLayout)) ($FrameAbs@@2 (Array Int (Array Int Int))) ($FrameOffset@@2 (Array Int Int)) ($fMem@@0 (Array Int Int)) ) (! (= (MutatorFrameInv $s@@14 f@@10 l@@2 r@@2 $FrameAddr@@3 $FrameSlice@@2 $FrameLayout@@3 $FrameAbs@@2 $FrameOffset@@2 $fMem@@0) (forall ((j@@23 Int) ) (! (=> (TO j@@23) (=> (= (select $FrameSlice@@2 (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23))) f@@10) (and
(Aligned (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23)))
(fAddr $s@@14 (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23)))
(InteriorValue (frameHasPtr l@@2 j@@23) r@@2 (select $fMem@@0 (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23))) (select (select $FrameAbs@@2 f@@10) j@@23) (select $FrameOffset@@2 (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23)))))))
 :qid |Commonib.99:11|
 :skolemid |195|
 :pattern ( (TO j@@23))
)))
 :qid |Commonib.96:27|
 :skolemid |196|
 :pattern ( (MutatorFrameInv $s@@14 f@@10 l@@2 r@@2 $FrameAddr@@3 $FrameSlice@@2 $FrameLayout@@3 $FrameAbs@@2 $FrameOffset@@2 $fMem@@0))
)))
(assert (forall (($s@@15 Int) (r@@3 (Array Int Int)) ($FrameCount@@0 Int) ($FrameAddr@@4 (Array Int Int)) ($FrameLayout@@4 (Array Int T@$FrameLayout)) ($FrameSlice@@3 (Array Int Int)) ($FrameAbs@@3 (Array Int (Array Int Int))) ($FrameOffset@@3 (Array Int Int)) ($fMem@@1 (Array Int Int)) ) (! (= (MutatorStackInv $s@@15 r@@3 $FrameCount@@0 $FrameAddr@@4 $FrameLayout@@4 $FrameSlice@@3 $FrameAbs@@3 $FrameOffset@@3 $fMem@@1) (forall ((f@@11 Int) ) (! (=> (TV f@@11) (=> (and
(<= 0 f@@11)
(< f@@11 $FrameCount@@0)) (MutatorFrameInv $s@@15 f@@11 (select $FrameLayout@@4 f@@11) r@@3 $FrameAddr@@4 $FrameSlice@@3 $FrameLayout@@4 $FrameAbs@@3 $FrameOffset@@3 $fMem@@1)))
 :qid |Commonib.108:11|
 :skolemid |197|
 :pattern ( (TV f@@11))
)))
 :qid |Commonib.105:27|
 :skolemid |198|
 :pattern ( (MutatorStackInv $s@@15 r@@3 $FrameCount@@0 $FrameAddr@@4 $FrameLayout@@4 $FrameSlice@@3 $FrameAbs@@3 $FrameOffset@@3 $fMem@@1))
)))
(assert (forall (($s@@16 Int) (f@@12 Int) (l@@3 T@$FrameLayout) (r@@4 (Array Int Int)) ($FrameAddr@@5 (Array Int Int)) ($FrameSlice@@4 (Array Int Int)) ($FrameLayout@@5 (Array Int T@$FrameLayout)) ($FrameAbs@@4 (Array Int (Array Int Int))) ($FrameOffset@@4 (Array Int Int)) ($fMem@@2 (Array Int Int)) ) (! (= (_MutatorFrameInv $s@@16 f@@12 l@@3 r@@4 $FrameAddr@@5 $FrameSlice@@4 $FrameLayout@@5 $FrameAbs@@4 $FrameOffset@@4 $fMem@@2) (forall ((j@@24 Int) ) (! (=> (TO j@@24) (=> (_InFrameSlice f@@12 j@@24 $FrameAddr@@5 $FrameSlice@@4) (and
(Aligned (+ (select $FrameAddr@@5 f@@12) (* 4 j@@24)))
(fAddr $s@@16 (+ (select $FrameAddr@@5 f@@12) (* 4 j@@24)))
(InteriorValue (frameHasPtr l@@3 j@@24) r@@4 (select $fMem@@2 (+ (select $FrameAddr@@5 f@@12) (* 4 j@@24))) (select (select $FrameAbs@@4 f@@12) j@@24) (select $FrameOffset@@4 (+ (select $FrameAddr@@5 f@@12) (* 4 j@@24)))))))
 :qid |Commonib.121:11|
 :skolemid |200|
 :pattern ( (TO j@@24))
)))
 :qid |Commonib.118:28|
 :skolemid |201|
 :pattern ( (_MutatorFrameInv $s@@16 f@@12 l@@3 r@@4 $FrameAddr@@5 $FrameSlice@@4 $FrameLayout@@5 $FrameAbs@@4 $FrameOffset@@4 $fMem@@2))
)))
(assert (forall (($s@@17 Int) (r@@5 (Array Int Int)) ($FrameCount@@1 Int) ($FrameAddr@@6 (Array Int Int)) ($FrameLayout@@6 (Array Int T@$FrameLayout)) ($FrameSlice@@5 (Array Int Int)) ($FrameAbs@@5 (Array Int (Array Int Int))) ($FrameOffset@@5 (Array Int Int)) ($fMem@@3 (Array Int Int)) ) (! (= (_MutatorStackInv $s@@17 r@@5 $FrameCount@@1 $FrameAddr@@6 $FrameLayout@@6 $FrameSlice@@5 $FrameAbs@@5 $FrameOffset@@5 $fMem@@3) (forall ((f@@13 Int) ) (! (=> (TV f@@13) (=> (and
(<= 0 f@@13)
(< f@@13 $FrameCount@@1)) (_MutatorFrameInv $s@@17 f@@13 (select $FrameLayout@@6 f@@13) r@@5 $FrameAddr@@6 $FrameSlice@@5 $FrameLayout@@6 $FrameAbs@@5 $FrameOffset@@5 $fMem@@3)))
 :qid |Commonib.130:11|
 :skolemid |202|
 :pattern ( (TV f@@13))
)))
 :qid |Commonib.127:28|
 :skolemid |203|
 :pattern ( (_MutatorStackInv $s@@17 r@@5 $FrameCount@@1 $FrameAddr@@6 $FrameLayout@@6 $FrameSlice@@5 $FrameAbs@@5 $FrameOffset@@5 $fMem@@3))
)))
(assert (forall (($s@@18 Int) (r@@6 (Array Int Int)) ($FrameCounts@@0 (Array Int Int)) ($FrameAddrs@@0 (Array Int (Array Int Int))) ($FrameLayouts@@0 (Array Int (Array Int T@$FrameLayout))) ($FrameSlices@@0 (Array Int (Array Int Int))) ($FrameAbss@@0 (Array Int (Array Int (Array Int Int)))) ($FrameOffsets@@0 (Array Int (Array Int Int))) ($fMems@@3 (Array Int (Array Int Int))) ) (! (= (MutatorStackInvS $s@@18 r@@6 $FrameCounts@@0 $FrameAddrs@@0 $FrameLayouts@@0 $FrameSlices@@0 $FrameAbss@@0 $FrameOffsets@@0 $fMems@@3) (MutatorStackInv $s@@18 r@@6 (select $FrameCounts@@0 $s@@18) (select $FrameAddrs@@0 $s@@18) (select $FrameLayouts@@0 $s@@18) (select $FrameSlices@@0 $s@@18) (select $FrameAbss@@0 $s@@18) (select $FrameOffsets@@0 $s@@18) (select $fMems@@3 $s@@18)))
 :qid |Commonib.134:28|
 :skolemid |204|
 :pattern ( (MutatorStackInvS $s@@18 r@@6 $FrameCounts@@0 $FrameAddrs@@0 $FrameLayouts@@0 $FrameSlices@@0 $FrameAbss@@0 $FrameOffsets@@0 $fMems@@3))
)))
(assert (forall (($s@@19 Int) (f@@14 Int) (l@@4 T@$FrameLayout) (r@@7 (Array Int Int)) ($FrameAddr@@7 (Array Int Int)) ($FrameSlice@@6 (Array Int Int)) ($FrameLayout@@7 (Array Int T@$FrameLayout)) ($fMem@@4 (Array Int Int)) ($FrameAbs@@6 (Array Int (Array Int Int))) ($FrameOffset@@6 (Array Int Int)) ) (! (= (GcFrameInv $s@@19 f@@14 l@@4 r@@7 $FrameAddr@@7 $FrameSlice@@6 $FrameLayout@@7 $fMem@@4 $FrameAbs@@6 $FrameOffset@@6) (and
(FrameInv f@@14 l@@4 $FrameAddr@@7 $FrameSlice@@6 $FrameLayout@@7 $FrameAbs@@6 $FrameOffset@@6)
(MutatorFrameInv $s@@19 f@@14 l@@4 r@@7 $FrameAddr@@7 $FrameSlice@@6 $FrameLayout@@7 $FrameAbs@@6 $FrameOffset@@6 $fMem@@4)))
 :qid |Commonib.140:22|
 :skolemid |205|
 :pattern ( (GcFrameInv $s@@19 f@@14 l@@4 r@@7 $FrameAddr@@7 $FrameSlice@@6 $FrameLayout@@7 $fMem@@4 $FrameAbs@@6 $FrameOffset@@6))
)))
(assert (forall (($s@@20 Int) (r@@8 (Array Int Int)) ($FrameCount@@2 Int) ($FrameAddr@@8 (Array Int Int)) ($FrameLayout@@8 (Array Int T@$FrameLayout)) ($FrameSlice@@7 (Array Int Int)) ($fMem@@5 (Array Int Int)) ($FrameAbs@@7 (Array Int (Array Int Int))) ($FrameOffset@@7 (Array Int Int)) ) (! (= (GcStackInv $s@@20 r@@8 $FrameCount@@2 $FrameAddr@@8 $FrameLayout@@8 $FrameSlice@@7 $fMem@@5 $FrameAbs@@7 $FrameOffset@@7) (and
(StackInv $FrameCount@@2 $FrameAddr@@8 $FrameLayout@@8 $FrameSlice@@7 $FrameAbs@@7 $FrameOffset@@7)
(MutatorStackInv $s@@20 r@@8 $FrameCount@@2 $FrameAddr@@8 $FrameLayout@@8 $FrameSlice@@7 $FrameAbs@@7 $FrameOffset@@7 $fMem@@5)))
 :qid |Commonib.146:22|
 :skolemid |206|
 :pattern ( (GcStackInv $s@@20 r@@8 $FrameCount@@2 $FrameAddr@@8 $FrameLayout@@8 $FrameSlice@@7 $fMem@@5 $FrameAbs@@7 $FrameOffset@@7))
)))
(assert (forall ((i@@34 Int) (rs (Array Int Int)) ($toAbs@@0 (Array Int Int)) ($AbsMem (Array Int (Array Int Int))) ($gcMem@@0 (Array Int Int)) ($gcSlice (Array Int Int)) ) (! (= (ObjInvBase i@@34 rs $toAbs@@0 $AbsMem $gcMem@@0 $gcSlice) (=> (and
(gcAddr i@@34)
(not (= (select rs i@@34) NO_ABS))) (and
(Aligned i@@34)
(AlignedHeapAddr (+ i@@34 4))
(VTable (select rs i@@34) (select (select $AbsMem (select rs i@@34)) 1))
(not (VFieldPtr (select rs i@@34) 1))
(>= (numFields (select rs i@@34)) 2)
(ObjSize (select rs i@@34) (select (select $AbsMem (select rs i@@34)) 1) (select (select $AbsMem (select rs i@@34)) 2) (select (select $AbsMem (select rs i@@34)) 3))
(= (select $gcSlice i@@34) i@@34)
(= (select $gcSlice (+ i@@34 4)) i@@34))))
 :qid |Commonib.163:22|
 :skolemid |207|
 :pattern ( (ObjInvBase i@@34 rs $toAbs@@0 $AbsMem $gcMem@@0 $gcSlice))
)))
(assert (forall ((i@@35 Int) (j@@25 Int) (rs@@0 (Array Int Int)) (rt (Array Int Int)) ($toAbs@@1 (Array Int Int)) ($AbsMem@@0 (Array Int (Array Int Int))) ($gcMem@@1 (Array Int Int)) ($gcSlice@@0 (Array Int Int)) ) (! (= (ObjInvField i@@35 j@@25 rs@@0 rt $toAbs@@1 $AbsMem@@0 $gcMem@@1 $gcSlice@@0) (=> (and
(gcAddr i@@35)
(not (= (select rs@@0 i@@35) NO_ABS))) (and
(gcAddr (+ i@@35 (* 4 j@@25)))
(= (select $gcSlice@@0 (+ i@@35 (* 4 j@@25))) i@@35)
(Value (VFieldPtr (select rs@@0 i@@35) j@@25) rt (select $gcMem@@1 (+ i@@35 (* 4 j@@25))) (select (select $AbsMem@@0 (select $toAbs@@1 i@@35)) j@@25)))))
 :qid |Commonib.177:23|
 :skolemid |208|
 :pattern ( (ObjInvField i@@35 j@@25 rs@@0 rt $toAbs@@1 $AbsMem@@0 $gcMem@@1 $gcSlice@@0))
)))
(assert (forall ((i@@36 Int) (j1 Int) (j2 Int) (rs@@1 (Array Int Int)) (rt@@0 (Array Int Int)) ($toAbs@@2 (Array Int Int)) ($AbsMem@@1 (Array Int (Array Int Int))) ($gcMem@@2 (Array Int Int)) ($gcSlice@@1 (Array Int Int)) ) (! (= (ObjInvPartial i@@36 j1 j2 rs@@1 rt@@0 $toAbs@@2 $AbsMem@@1 $gcMem@@2 $gcSlice@@1) (and
(ObjInvBase i@@36 rs@@1 $toAbs@@2 $AbsMem@@1 $gcMem@@2 $gcSlice@@1)
(forall ((j@@26 Int) ) (! (=> (TO j@@26) (=> (and
(<= j1 j@@26)
(< j@@26 j2)) (ObjInvField i@@36 j@@26 rs@@1 rt@@0 $toAbs@@2 $AbsMem@@1 $gcMem@@2 $gcSlice@@1)))
 :qid |Commonib.189:68|
 :skolemid |209|
 :pattern ( (TO j@@26))
))))
 :qid |Commonib.186:25|
 :skolemid |210|
 :pattern ( (ObjInvPartial i@@36 j1 j2 rs@@1 rt@@0 $toAbs@@2 $AbsMem@@1 $gcMem@@2 $gcSlice@@1))
)))
(assert (forall ((i@@37 Int) (rs@@2 (Array Int Int)) (rt@@1 (Array Int Int)) ($toAbs@@3 (Array Int Int)) ($AbsMem@@2 (Array Int (Array Int Int))) ($gcMem@@3 (Array Int Int)) ($gcSlice@@2 (Array Int Int)) ) (! (= (ObjInv i@@37 rs@@2 rt@@1 $toAbs@@3 $AbsMem@@2 $gcMem@@3 $gcSlice@@2) (ObjInvPartial i@@37 0 (numFields (select rs@@2 i@@37)) rs@@2 rt@@1 $toAbs@@3 $AbsMem@@2 $gcMem@@3 $gcSlice@@2))
 :qid |Commonib.194:18|
 :skolemid |211|
 :pattern ( (ObjInv i@@37 rs@@2 rt@@1 $toAbs@@3 $AbsMem@@2 $gcMem@@3 $gcSlice@@2))
)))
(assert (forall (($IoMmuEnabled Bool) ($PciConfigState (Array Int Int)) (DmaAddr Int) ($pciMem@@0 (Array Int Int)) ) (! (= (_IoInv $IoMmuEnabled $PciConfigState DmaAddr $pciMem@@0) (and
(or
(and
(= DmaAddr 0)
(not $IoMmuEnabled))
(and
(= DmaAddr ?dmaLo)
$IoMmuEnabled))
(> ?dmaLo 8)
(word (- ?dmaLo 8))
(forall ((i@@38 Int) ) (! (=> (TV i@@38) (=> (and
(<= 0 i@@38)
(< i@@38 65536)) (or
(and
(= (select $pciMem@@0 (+ ?pciLo (* 8 i@@38))) 0)
(= (select $PciConfigState i@@38) 0))
(and
(not (= (select $pciMem@@0 (+ ?pciLo (* 8 i@@38))) 0))
(= (select $PciConfigState i@@38) 4)
(= (PciMemAddr i@@38) (select $pciMem@@0 (+ ?pciLo (* 8 i@@38))))
(= (PciMemSize i@@38) (select $pciMem@@0 (+ (+ ?pciLo (* 8 i@@38)) 4)))))))
 :qid |Commonib.258:111|
 :skolemid |212|
 :pattern ( (TV i@@38))
))))
 :qid |Commonib.255:18|
 :skolemid |213|
 :pattern ( (_IoInv $IoMmuEnabled $PciConfigState DmaAddr $pciMem@@0))
)))
(assert (forall ((f@@15 Int) (j@@27 Int) ($FrameAddr@@9 (Array Int Int)) ($FrameSlice@@8 (Array Int Int)) ) (! (= (_InFrameSlice f@@15 j@@27 $FrameAddr@@9 $FrameSlice@@8) (= (select $FrameSlice@@8 (+ (select $FrameAddr@@9 f@@15) (* 4 j@@27))) f@@15))
 :qid |Commonbp.11:15|
 :skolemid |215|
)))
(assert (forall (($IoMmuEnabled@@0 Bool) ($PciConfigState@@0 (Array Int Int)) (DmaAddr@@0 Int) ($pciMem@@1 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1) (_IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1))
 :qid |Commonbp.15:15|
 :skolemid |216|
)))
(push 1)
(set-info :boogie-vc-id _inFrameSlice)
(assert (not
(let ((anon0_correct (=> (! (and %lbl%+16939 true) :lblpos +16939) (and
(! (or %lbl%@38017 (forall ((f@@16 Int) (j@@28 Int) ($FrameAddr@@10 (Array Int Int)) ($FrameSlice@@9 (Array Int Int)) ) (! (= (_InFrameSlice f@@16 j@@28 $FrameAddr@@10 $FrameSlice@@9) (= (select $FrameSlice@@9 (+ (select $FrameAddr@@10 f@@16) (* 4 j@@28))) f@@16))
 :qid |Commonib.115:17|
 :skolemid |199|
))) :lblneg @38017)
(=> (forall ((f@@17 Int) (j@@29 Int) ($FrameAddr@@11 (Array Int Int)) ($FrameSlice@@10 (Array Int Int)) ) (! (= (_InFrameSlice f@@17 j@@29 $FrameAddr@@11 $FrameSlice@@10) (= (select $FrameSlice@@10 (+ (select $FrameAddr@@11 f@@17) (* 4 j@@29))) f@@17))
 :qid |Commonib.115:17|
 :skolemid |199|
)) true)))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+37969 true) :lblpos +37969) anon0_correct)))
PreconditionGeneratedEntry_correct))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+16973 () Bool)
(declare-fun %lbl%@38095 () Bool)
(declare-fun %lbl%+38068 () Bool)
(push 1)
(set-info :boogie-vc-id _ioInv)
(assert (not
(let ((anon0_correct@@0 (=> (! (and %lbl%+16973 true) :lblpos +16973) (and
(! (or %lbl%@38095 (forall (($IoMmuEnabled@@1 Bool) ($PciConfigState@@1 (Array Int Int)) (DmaAddr@@1 Int) ($pciMem@@2 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@1 $PciConfigState@@1 DmaAddr@@1 $pciMem@@2) (_IoInv $IoMmuEnabled@@1 $PciConfigState@@1 DmaAddr@@1 $pciMem@@2))
 :qid |Commonib.268:17|
 :skolemid |214|
))) :lblneg @38095)
(=> (forall (($IoMmuEnabled@@2 Bool) ($PciConfigState@@2 (Array Int Int)) (DmaAddr@@2 Int) ($pciMem@@3 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@2 $PciConfigState@@2 DmaAddr@@2 $pciMem@@3) (_IoInv $IoMmuEnabled@@2 $PciConfigState@@2 DmaAddr@@2 $pciMem@@3))
 :qid |Commonib.268:17|
 :skolemid |214|
)) true)))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+38068 true) :lblpos +38068) anon0_correct@@0)))
PreconditionGeneratedEntry_correct@@0))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+17802 () Bool)
(declare-fun %lbl%@41094 () Bool)
(declare-fun esi@1 () Int)
(declare-fun edi@1 () Int)
(declare-fun $count () Int)
(declare-fun %lbl%@41122 () Bool)
(declare-fun $base@@3 () Int)
(declare-fun $x () Int)
(declare-fun %lbl%+17798 () Bool)
(declare-fun $Efl@25 () Int)
(declare-fun call17615formal@$ret@0 () Int)
(declare-fun ebx@1 () Int)
(declare-fun esi@0 () Int)
(declare-fun %lbl%+17796 () Bool)
(declare-fun call17621formal@$ret@0 () Int)
(declare-fun edi@0 () Int)
(declare-fun %lbl%+17795 () Bool)
(declare-fun %lbl%@40916 () Bool)
(declare-fun call17599formal@$ptr@0 () Int)
(declare-fun ecx () Int)
(declare-fun %lbl%@40934 () Bool)
(declare-fun call17599formal@$val@0 () Int)
(declare-fun call17606formal@$x@0 () T@opn)
(declare-fun call17606formal@$y@0 () T@opn)
(declare-fun ebp () Int)
(declare-fun %lbl%@40984 () Bool)
(declare-fun $Mem@@2 () (Array Int Int))
(declare-fun %lbl%@40989 () Bool)
(declare-fun %lbl%+17785 () Bool)
(declare-fun $Efl@22 () Int)
(declare-fun call17554formal@$ret@0 () Int)
(declare-fun %lbl%+17788 () Bool)
(declare-fun call17588formal@$addr@0 () Int)
(declare-fun %lbl%@40883 () Bool)
(declare-fun call17588formal@$ret@0 () Int)
(declare-fun %lbl%+17783 () Bool)
(declare-fun %lbl%+17775 () Bool)
(declare-fun $Efl@21 () Int)
(declare-fun call17574formal@$x@0 () T@opn)
(declare-fun call17574formal@$y@0 () T@opn)
(declare-fun %lbl%@40825 () Bool)
(declare-fun %lbl%@40830 () Bool)
(declare-fun %lbl%+17773 () Bool)
(declare-fun %lbl%+17765 () Bool)
(declare-fun $Efl@15 () Int)
(declare-fun call17550formal@$addr@0 () Int)
(declare-fun call17550formal@$ret@0 () Int)
(declare-fun %lbl%@40715 () Bool)
(declare-fun call17561formal@$x@0 () T@opn)
(declare-fun call17561formal@$y@0 () T@opn)
(declare-fun %lbl%@40763 () Bool)
(declare-fun %lbl%@40768 () Bool)
(declare-fun %lbl%+38166 () Bool)
(declare-fun %lbl%@41855 () Bool)
(declare-fun eax@1 () Int)
(declare-fun edx@0 () Int)
(declare-fun %lbl%@41863 () Bool)
(declare-fun %lbl%@41932 () Bool)
(declare-fun %lbl%@41983 () Bool)
(declare-fun $sMem@@5 () (Array Int Int))
(declare-fun esp@5 () Int)
(declare-fun esp () Int)
(declare-fun %lbl%@41991 () Bool)
(declare-fun $dMem@@0 () (Array Int Int))
(declare-fun $pciMem@@4 () (Array Int Int))
(declare-fun $tMems@@12 () (Array Int (Array Int Int)))
(declare-fun $fMems@@4 () (Array Int (Array Int Int)))
(declare-fun $gcMem@@4 () (Array Int Int))
(declare-fun SLo@@0 () Int)
(declare-fun DLo@@0 () Int)
(declare-fun PciLo@@0 () Int)
(declare-fun TLo@@0 () Int)
(declare-fun FLo@@0 () Int)
(declare-fun GcLo@@0 () Int)
(declare-fun GcHi@@0 () Int)
(declare-fun %lbl%+17730 () Bool)
(declare-fun $Efl@0 () Int)
(declare-fun call17246formal@$ret@0 () Int)
(declare-fun call17261formal@$oldMem@0 () (Array Int Int))
(declare-fun call17261formal@$oldSMem@0 () (Array Int Int))
(declare-fun call17261formal@$oldDMem@0 () (Array Int Int))
(declare-fun call17261formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call17261formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call17261formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call17261formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@39212 () Bool)
(declare-fun %lbl%@39242 () Bool)
(declare-fun %lbl%@39265 () Bool)
(declare-fun %lbl%@39278 () Bool)
(declare-fun call17264formal@$oldRA@0 () T@ReturnTo)
(declare-fun $RET@@0 () T@ReturnTo)
(declare-fun %lbl%@39317 () Bool)
(declare-fun %lbl%@39328 () Bool)
(declare-fun esp@0 () Int)
(declare-fun eax () Int)
(declare-fun %lbl%+17741 () Bool)
(declare-fun $Efl@4 () Int)
(declare-fun %lbl%@39565 () Bool)
(declare-fun call17292formal@$ret@0 () Int)
(declare-fun call17307formal@$oldMem@0 () (Array Int Int))
(declare-fun call17307formal@$oldSMem@0 () (Array Int Int))
(declare-fun call17307formal@$oldDMem@0 () (Array Int Int))
(declare-fun call17307formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call17307formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call17307formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call17307formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@39646 () Bool)
(declare-fun %lbl%@39676 () Bool)
(declare-fun %lbl%@39699 () Bool)
(declare-fun %lbl%@39712 () Bool)
(declare-fun call17310formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@39751 () Bool)
(declare-fun %lbl%@39762 () Bool)
(declare-fun esp@1 () Int)
(declare-fun call17272formal@$val@0 () Int)
(declare-fun %lbl%+17752 () Bool)
(declare-fun $Efl@6 () Int)
(declare-fun %lbl%@39969 () Bool)
(declare-fun %lbl%@39973 () Bool)
(declare-fun %lbl%@40039 () Bool)
(declare-fun call17420formal@$ret@0 () Int)
(declare-fun call17435formal@$oldMem@0 () (Array Int Int))
(declare-fun call17435formal@$oldSMem@0 () (Array Int Int))
(declare-fun call17435formal@$oldDMem@0 () (Array Int Int))
(declare-fun call17435formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call17435formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call17435formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call17435formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@40172 () Bool)
(declare-fun %lbl%@40202 () Bool)
(declare-fun %lbl%@40225 () Bool)
(declare-fun %lbl%@40238 () Bool)
(declare-fun call17438formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@40277 () Bool)
(declare-fun %lbl%@40288 () Bool)
(declare-fun esp@2 () Int)
(declare-fun call17322formal@$val@0 () Int)
(declare-fun %lbl%+17822 () Bool)
(declare-fun $Efl@29 () Int)
(declare-fun call17672formal@$ret@0 () Int)
(declare-fun call17687formal@$oldMem@0 () (Array Int Int))
(declare-fun call17687formal@$oldSMem@0 () (Array Int Int))
(declare-fun call17687formal@$oldDMem@0 () (Array Int Int))
(declare-fun call17687formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call17687formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call17687formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call17687formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@41416 () Bool)
(declare-fun %lbl%@41446 () Bool)
(declare-fun %lbl%@41469 () Bool)
(declare-fun %lbl%@41482 () Bool)
(declare-fun call17690formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@41521 () Bool)
(declare-fun %lbl%@41532 () Bool)
(declare-fun esp@3 () Int)
(declare-fun call17627formal@$ret@0 () Int)
(declare-fun %lbl%+17824 () Bool)
(declare-fun call17694formal@$ret@0 () Int)
(declare-fun call17709formal@$oldMem@0 () (Array Int Int))
(declare-fun call17709formal@$oldSMem@0 () (Array Int Int))
(declare-fun call17709formal@$oldDMem@0 () (Array Int Int))
(declare-fun call17709formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call17709formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call17709formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call17709formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@41642 () Bool)
(declare-fun %lbl%@41672 () Bool)
(declare-fun %lbl%@41695 () Bool)
(declare-fun %lbl%@41708 () Bool)
(declare-fun call17712formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@41747 () Bool)
(declare-fun %lbl%@41758 () Bool)
(declare-fun esp@4 () Int)
(declare-fun %lbl%+17820 () Bool)
(declare-fun %lbl%+17812 () Bool)
(declare-fun $Efl@18 () Int)
(declare-fun call17656formal@$ptr@0 () Int)
(declare-fun %lbl%@41247 () Bool)
(declare-fun call17656formal@$val@0 () Int)
(declare-fun call17663formal@$x@0 () T@opn)
(declare-fun call17663formal@$y@0 () T@opn)
(declare-fun %lbl%@41295 () Bool)
(declare-fun %lbl%@41300 () Bool)
(declare-fun %lbl%+17810 () Bool)
(declare-fun %lbl%+17763 () Bool)
(declare-fun call17634formal@$ptr@0 () Int)
(declare-fun %lbl%@40589 () Bool)
(declare-fun call17634formal@$val@0 () Int)
(declare-fun call17641formal@$x@0 () T@opn)
(declare-fun call17641formal@$y@0 () T@opn)
(declare-fun %lbl%@40637 () Bool)
(declare-fun %lbl%@40642 () Bool)
(declare-fun %lbl%+17762 () Bool)
(declare-fun call17530formal@$addr@0 () Int)
(declare-fun %lbl%@40474 () Bool)
(declare-fun call17530formal@$ret@0 () Int)
(declare-fun call17537formal@$x@0 () T@opn)
(declare-fun call17537formal@$y@0 () T@opn)
(declare-fun %lbl%@40514 () Bool)
(declare-fun %lbl%@40519 () Bool)
(declare-fun %lbl%+17750 () Bool)
(declare-fun call17442formal@$ret@0 () Int)
(declare-fun call17445formal@$ret@0 () Int)
(declare-fun edx () Int)
(declare-fun %lbl%@39840 () Bool)
(declare-fun %lbl%@39868 () Bool)
(declare-fun %lbl%+17739 () Bool)
(declare-fun %lbl%@39456 () Bool)
(declare-fun call17322formal@$ptr@0 () Int)
(declare-fun %lbl%@39476 () Bool)
(declare-fun call17329formal@$x@0 () T@opn)
(declare-fun call17329formal@$y@0 () T@opn)
(declare-fun %lbl%@39524 () Bool)
(declare-fun %lbl%@39529 () Bool)
(declare-fun %lbl%+17728 () Bool)
(declare-fun %lbl%@39362 () Bool)
(declare-fun %lbl%@39369 () Bool)
(declare-fun call17279formal@$x@0 () T@opn)
(declare-fun call17279formal@$y@0 () T@opn)
(declare-fun %lbl%@39417 () Bool)
(declare-fun %lbl%@39422 () Bool)
(declare-fun %lbl%+17727 () Bool)
(declare-fun call17237formal@$x@0 () T@opn)
(declare-fun call17237formal@$y@0 () T@opn)
(declare-fun %lbl%@39092 () Bool)
(declare-fun %lbl%@39097 () Bool)
(declare-fun %lbl%+38174 () Bool)
(push 1)
(set-info :boogie-vc-id TableSearch)
(assert (not
(let ((skip5_correct (=> (! (and %lbl%+17802 true) :lblpos +17802) (and
(! (or %lbl%@41094 (and
(TO esi@1)
(TO edi@1)
(<= 0 esi@1)
(< esi@1 edi@1)
(<= edi@1 $count))) :lblneg @41094)
(=> (and
(TO esi@1)
(TO edi@1)
(<= 0 esi@1)
(< esi@1 edi@1)
(<= edi@1 $count)) (and
(! (or %lbl%@41122 (=> (exists ((j@@30 Int) ) (! (and
(TO j@@30)
(<= 0 j@@30)
(< j@@30 $count)
(between (ro32 (+ $base@@3 (* 4 j@@30))) (ro32 (+ $base@@3 (* 4 (+ j@@30 1)))) $x))
 :qid |Commonbp.66:18|
 :skolemid |222|
 :pattern ( (TO j@@30))
)) (and
(<= (ro32 (+ $base@@3 (* 4 esi@1))) $x)
(< $x (ro32 (+ $base@@3 (* 4 edi@1))))))) :lblneg @41122)
(=> (=> (exists ((j@@31 Int) ) (! (and
(TO j@@31)
(<= 0 j@@31)
(< j@@31 $count)
(between (ro32 (+ $base@@3 (* 4 j@@31))) (ro32 (+ $base@@3 (* 4 (+ j@@31 1)))) $x))
 :qid |Commonbp.66:18|
 :skolemid |222|
 :pattern ( (TO j@@31))
)) (and
(<= (ro32 (+ $base@@3 (* 4 esi@1))) $x)
(< $x (ro32 (+ $base@@3 (* 4 edi@1)))))) true)))))))
(let ((anon25_Else_correct (=> (! (and %lbl%+17798 true) :lblpos +17798) (=> (and
(not (Jbe $Efl@25))
(= call17615formal@$ret@0 ebx@1)
(= edi@1 call17615formal@$ret@0)
(= esi@1 esi@0)) skip5_correct))))
(let ((anon25_Then_correct (=> (! (and %lbl%+17796 true) :lblpos +17796) (=> (and
(Jbe $Efl@25)
(= call17621formal@$ret@0 ebx@1)
(= edi@1 edi@0)
(= esi@1 call17621formal@$ret@0)) skip5_correct))))
(let ((skip4_correct (=> (! (and %lbl%+17795 true) :lblpos +17795) (and
(! (or %lbl%@40916 (TO ebx@1)) :lblneg @40916)
(=> (TO ebx@1) (=> (= call17599formal@$ptr@0 (+ ecx (* 4 ebx@1))) (and
(! (or %lbl%@40934 (inRo call17599formal@$ptr@0 4)) :lblneg @40934)
(=> (inRo call17599formal@$ptr@0 4) (=> (and
(word call17599formal@$val@0)
(= call17599formal@$val@0 (ro32 call17599formal@$ptr@0))
(= call17606formal@$x@0 (OpnReg call17599formal@$val@0))
(= call17606formal@$y@0 (OpnReg ebp))) (and
(! (or %lbl%@40984 (OpnOk $Mem@@2 call17606formal@$x@0)) :lblneg @40984)
(=> (OpnOk $Mem@@2 call17606formal@$x@0) (and
(! (or %lbl%@40989 (OpnOk $Mem@@2 call17606formal@$y@0)) :lblneg @40989)
(=> (OpnOk $Mem@@2 call17606formal@$y@0) (=> (FlagsCmp $Efl@25 (EvalOpn $Mem@@2 call17606formal@$x@0) (EvalOpn $Mem@@2 call17606formal@$y@0)) (and
anon25_Then_correct
anon25_Else_correct)))))))))))))))
(let ((anon24_Else_correct (=> (! (and %lbl%+17785 true) :lblpos +17785) (=> (and
(not (Jae $Efl@22))
(= ebx@1 call17554formal@$ret@0)) skip4_correct))))
(let ((do4_correct (=> (! (and %lbl%+17788 true) :lblpos +17788) (=> (= call17588formal@$addr@0 (+ esi@0 1)) (and
(! (or %lbl%@40883 (word call17588formal@$addr@0)) :lblneg @40883)
(=> (word call17588formal@$addr@0) (=> (and
(= call17588formal@$ret@0 call17588formal@$addr@0)
(= ebx@1 call17588formal@$ret@0)) skip4_correct)))))))
(let ((anon24_Then_correct (=> (! (and %lbl%+17783 true) :lblpos +17783) (=> (Jae $Efl@22) do4_correct))))
(let ((anon23_Else_correct (=> (! (and %lbl%+17775 true) :lblpos +17775) (=> (not (Jbe $Efl@21)) (=> (and
(= call17574formal@$x@0 (OpnReg call17554formal@$ret@0))
(= call17574formal@$y@0 (OpnReg edi@0))) (and
(! (or %lbl%@40825 (OpnOk $Mem@@2 call17574formal@$x@0)) :lblneg @40825)
(=> (OpnOk $Mem@@2 call17574formal@$x@0) (and
(! (or %lbl%@40830 (OpnOk $Mem@@2 call17574formal@$y@0)) :lblneg @40830)
(=> (OpnOk $Mem@@2 call17574formal@$y@0) (=> (FlagsCmp $Efl@22 (EvalOpn $Mem@@2 call17574formal@$x@0) (EvalOpn $Mem@@2 call17574formal@$y@0)) (and
anon24_Then_correct
anon24_Else_correct)))))))))))
(let ((anon23_Then_correct (=> (! (and %lbl%+17773 true) :lblpos +17773) (=> (Jbe $Efl@21) do4_correct))))
(let ((anon22_Else_correct (=> (! (and %lbl%+17765 true) :lblpos +17765) (=> (not (Jae $Efl@15)) (=> (and
(= call17550formal@$addr@0 (+ esi@0 (* 1 edi@0)))
(word call17550formal@$ret@0)) (and
(! (or %lbl%@40715 (< 1 32)) :lblneg @40715)
(=> (< 1 32) (=> (and
(= call17554formal@$ret@0 (shr call17550formal@$ret@0 1))
(word call17554formal@$ret@0)
(= call17561formal@$x@0 (OpnReg call17554formal@$ret@0))
(= call17561formal@$y@0 (OpnReg esi@0))) (and
(! (or %lbl%@40763 (OpnOk $Mem@@2 call17561formal@$x@0)) :lblneg @40763)
(=> (OpnOk $Mem@@2 call17561formal@$x@0) (and
(! (or %lbl%@40768 (OpnOk $Mem@@2 call17561formal@$y@0)) :lblneg @40768)
(=> (OpnOk $Mem@@2 call17561formal@$y@0) (=> (FlagsCmp $Efl@21 (EvalOpn $Mem@@2 call17561formal@$x@0) (EvalOpn $Mem@@2 call17561formal@$y@0)) (and
anon23_Then_correct
anon23_Else_correct))))))))))))))
(let ((GeneratedUnifiedExit_correct (=> (! (and %lbl%+38166 true) :lblpos +38166) (and
(! (or %lbl%@41855 (and
(word eax@1)
(word edx@0))) :lblneg @41855)
(=> (and
(word eax@1)
(word edx@0)) (and
(! (or %lbl%@41863 (= (not (= edx@0 0)) (exists ((j@@32 Int) ) (! (and
(TO j@@32)
(<= 0 j@@32)
(< j@@32 $count)
(between (ro32 (+ $base@@3 (* 4 j@@32))) (ro32 (+ $base@@3 (* 4 (+ j@@32 1)))) $x))
 :qid |Commonbp.31:27|
 :skolemid |219|
 :pattern ( (TO j@@32))
)))) :lblneg @41863)
(=> (= (not (= edx@0 0)) (exists ((j@@33 Int) ) (! (and
(TO j@@33)
(<= 0 j@@33)
(< j@@33 $count)
(between (ro32 (+ $base@@3 (* 4 j@@33))) (ro32 (+ $base@@3 (* 4 (+ j@@33 1)))) $x))
 :qid |Commonbp.31:27|
 :skolemid |219|
 :pattern ( (TO j@@33))
))) (and
(! (or %lbl%@41932 (=> (not (= edx@0 0)) (and
(<= 0 eax@1)
(< eax@1 $count)
(between (ro32 (+ $base@@3 (* 4 eax@1))) (ro32 (+ $base@@3 (* 4 (+ eax@1 1)))) $x)))) :lblneg @41932)
(=> (=> (not (= edx@0 0)) (and
(<= 0 eax@1)
(< eax@1 $count)
(between (ro32 (+ $base@@3 (* 4 eax@1))) (ro32 (+ $base@@3 (* 4 (+ eax@1 1)))) $x))) (and
(! (or %lbl%@41983 (SMemEnsure $sMem@@5 $sMem@@5 esp@5 esp)) :lblneg @41983)
(=> (SMemEnsure $sMem@@5 $sMem@@5 esp@5 esp) (and
(! (or %lbl%@41991 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @41991)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) true)))))))))))))
(let ((anon19_Else_correct (=> (! (and %lbl%+17730 true) :lblpos +17730) (=> (not (Jae $Efl@0)) (=> (and
(= call17246formal@$ret@0 0)
(= call17261formal@$oldMem@0 $Mem@@2)
(= call17261formal@$oldSMem@0 $sMem@@5)
(= call17261formal@$oldDMem@0 $dMem@@0)
(= call17261formal@$oldPciMem@0 $pciMem@@4)
(= call17261formal@$oldTMem@0 $tMems@@12)
(= call17261formal@$oldFMem@0 $fMems@@4)
(= call17261formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@39212 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @39212)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@39242 (MemInv call17261formal@$oldMem@0 call17261formal@$oldSMem@0 call17261formal@$oldDMem@0 call17261formal@$oldPciMem@0 call17261formal@$oldTMem@0 call17261formal@$oldFMem@0 call17261formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @39242)
(=> (MemInv call17261formal@$oldMem@0 call17261formal@$oldSMem@0 call17261formal@$oldDMem@0 call17261formal@$oldPciMem@0 call17261formal@$oldTMem@0 call17261formal@$oldFMem@0 call17261formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@39265 (= (select $sMem@@5 esp) (select call17261formal@$oldSMem@0 esp))) :lblneg @39265)
(=> (= (select $sMem@@5 esp) (select call17261formal@$oldSMem@0 esp)) (and
(! (or %lbl%@39278 (sAddr esp)) :lblneg @39278)
(=> (sAddr esp) (=> (= (select $Mem@@2 esp) (select call17261formal@$oldMem@0 esp)) (=> (and
(= (select $Mem@@2 esp) (select $sMem@@5 esp))
(= call17264formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@39317 (= (ReturnToAddr (select $Mem@@2 esp)) call17264formal@$oldRA@0)) :lblneg @39317)
(=> (= (ReturnToAddr (select $Mem@@2 esp)) call17264formal@$oldRA@0) (and
(! (or %lbl%@39328 (Aligned esp)) :lblneg @39328)
(=> (Aligned esp) (=> (= esp@0 (+ esp 4)) (=> (and
(Aligned esp@0)
(= eax@1 eax)
(= edx@0 call17246formal@$ret@0)
(= esp@5 esp@0)) GeneratedUnifiedExit_correct)))))))))))))))))))))
(let ((anon20_Else_correct (=> (! (and %lbl%+17741 true) :lblpos +17741) (=> (not (Jae $Efl@4)) (and
(! (or %lbl%@39565 (TO 0)) :lblneg @39565)
(=> (TO 0) (=> (and
(= call17292formal@$ret@0 0)
(= call17307formal@$oldMem@0 $Mem@@2)
(= call17307formal@$oldSMem@0 $sMem@@5)
(= call17307formal@$oldDMem@0 $dMem@@0)
(= call17307formal@$oldPciMem@0 $pciMem@@4)
(= call17307formal@$oldTMem@0 $tMems@@12)
(= call17307formal@$oldFMem@0 $fMems@@4)
(= call17307formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@39646 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @39646)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@39676 (MemInv call17307formal@$oldMem@0 call17307formal@$oldSMem@0 call17307formal@$oldDMem@0 call17307formal@$oldPciMem@0 call17307formal@$oldTMem@0 call17307formal@$oldFMem@0 call17307formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @39676)
(=> (MemInv call17307formal@$oldMem@0 call17307formal@$oldSMem@0 call17307formal@$oldDMem@0 call17307formal@$oldPciMem@0 call17307formal@$oldTMem@0 call17307formal@$oldFMem@0 call17307formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@39699 (= (select $sMem@@5 esp) (select call17307formal@$oldSMem@0 esp))) :lblneg @39699)
(=> (= (select $sMem@@5 esp) (select call17307formal@$oldSMem@0 esp)) (and
(! (or %lbl%@39712 (sAddr esp)) :lblneg @39712)
(=> (sAddr esp) (=> (= (select $Mem@@2 esp) (select call17307formal@$oldMem@0 esp)) (=> (and
(= (select $Mem@@2 esp) (select $sMem@@5 esp))
(= call17310formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@39751 (= (ReturnToAddr (select $Mem@@2 esp)) call17310formal@$oldRA@0)) :lblneg @39751)
(=> (= (ReturnToAddr (select $Mem@@2 esp)) call17310formal@$oldRA@0) (and
(! (or %lbl%@39762 (Aligned esp)) :lblneg @39762)
(=> (Aligned esp) (=> (= esp@1 (+ esp 4)) (=> (and
(Aligned esp@1)
(= eax@1 call17272formal@$val@0)
(= edx@0 call17292formal@$ret@0)
(= esp@5 esp@1)) GeneratedUnifiedExit_correct)))))))))))))))))))))))
(let ((anon21_Else_correct (=> (! (and %lbl%+17752 true) :lblpos +17752) (=> (not (Jb $Efl@6)) (and
(! (or %lbl%@39969 (TO $count)) :lblneg @39969)
(=> (TO $count) (and
(! (or %lbl%@39973 (forall ((j@@34 Int) ) (! (=> (and
(TSlot j@@34)
(TO j@@34)
(TO (+ j@@34 1))
(<= 0 j@@34)
(< j@@34 $count)) (>= $x (ro32 (+ $base@@3 (* 4 (+ j@@34 1))))))
 :qid |Commonbp.54:18|
 :skolemid |220|
 :pattern ( (TSlot j@@34))
))) :lblneg @39973)
(=> (forall ((j@@35 Int) ) (! (=> (and
(TSlot j@@35)
(TO j@@35)
(TO (+ j@@35 1))
(<= 0 j@@35)
(< j@@35 $count)) (>= $x (ro32 (+ $base@@3 (* 4 (+ j@@35 1))))))
 :qid |Commonbp.54:18|
 :skolemid |220|
 :pattern ( (TSlot j@@35))
)) (and
(! (or %lbl%@40039 (forall ((j@@36 Int) ) (! (=> (and
(TO j@@36)
(TSlot j@@36)
(<= 0 j@@36)
(< j@@36 $count)) (>= $x (ro32 (+ $base@@3 (* 4 (+ j@@36 1))))))
 :qid |Commonbp.55:18|
 :skolemid |221|
 :pattern ( (TO j@@36))
))) :lblneg @40039)
(=> (forall ((j@@37 Int) ) (! (=> (and
(TO j@@37)
(TSlot j@@37)
(<= 0 j@@37)
(< j@@37 $count)) (>= $x (ro32 (+ $base@@3 (* 4 (+ j@@37 1))))))
 :qid |Commonbp.55:18|
 :skolemid |221|
 :pattern ( (TO j@@37))
)) (=> (and
(= call17420formal@$ret@0 0)
(= call17435formal@$oldMem@0 $Mem@@2)
(= call17435formal@$oldSMem@0 $sMem@@5)
(= call17435formal@$oldDMem@0 $dMem@@0)
(= call17435formal@$oldPciMem@0 $pciMem@@4)
(= call17435formal@$oldTMem@0 $tMems@@12)
(= call17435formal@$oldFMem@0 $fMems@@4)
(= call17435formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@40172 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @40172)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@40202 (MemInv call17435formal@$oldMem@0 call17435formal@$oldSMem@0 call17435formal@$oldDMem@0 call17435formal@$oldPciMem@0 call17435formal@$oldTMem@0 call17435formal@$oldFMem@0 call17435formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @40202)
(=> (MemInv call17435formal@$oldMem@0 call17435formal@$oldSMem@0 call17435formal@$oldDMem@0 call17435formal@$oldPciMem@0 call17435formal@$oldTMem@0 call17435formal@$oldFMem@0 call17435formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@40225 (= (select $sMem@@5 esp) (select call17435formal@$oldSMem@0 esp))) :lblneg @40225)
(=> (= (select $sMem@@5 esp) (select call17435formal@$oldSMem@0 esp)) (and
(! (or %lbl%@40238 (sAddr esp)) :lblneg @40238)
(=> (sAddr esp) (=> (= (select $Mem@@2 esp) (select call17435formal@$oldMem@0 esp)) (=> (and
(= (select $Mem@@2 esp) (select $sMem@@5 esp))
(= call17438formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@40277 (= (ReturnToAddr (select $Mem@@2 esp)) call17438formal@$oldRA@0)) :lblneg @40277)
(=> (= (ReturnToAddr (select $Mem@@2 esp)) call17438formal@$oldRA@0) (and
(! (or %lbl%@40288 (Aligned esp)) :lblneg @40288)
(=> (Aligned esp) (=> (= esp@2 (+ esp 4)) (=> (and
(Aligned esp@2)
(= eax@1 call17322formal@$val@0)
(= edx@0 call17420formal@$ret@0)
(= esp@5 esp@2)) GeneratedUnifiedExit_correct)))))))))))))))))))))))))))
(let ((anon27_Else_correct (=> (! (and %lbl%+17822 true) :lblpos +17822) (=> (not (Jae $Efl@29)) (=> (and
(= call17672formal@$ret@0 1)
(= call17687formal@$oldMem@0 $Mem@@2)
(= call17687formal@$oldSMem@0 $sMem@@5)
(= call17687formal@$oldDMem@0 $dMem@@0)
(= call17687formal@$oldPciMem@0 $pciMem@@4)
(= call17687formal@$oldTMem@0 $tMems@@12)
(= call17687formal@$oldFMem@0 $fMems@@4)
(= call17687formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@41416 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @41416)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@41446 (MemInv call17687formal@$oldMem@0 call17687formal@$oldSMem@0 call17687formal@$oldDMem@0 call17687formal@$oldPciMem@0 call17687formal@$oldTMem@0 call17687formal@$oldFMem@0 call17687formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @41446)
(=> (MemInv call17687formal@$oldMem@0 call17687formal@$oldSMem@0 call17687formal@$oldDMem@0 call17687formal@$oldPciMem@0 call17687formal@$oldTMem@0 call17687formal@$oldFMem@0 call17687formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@41469 (= (select $sMem@@5 esp) (select call17687formal@$oldSMem@0 esp))) :lblneg @41469)
(=> (= (select $sMem@@5 esp) (select call17687formal@$oldSMem@0 esp)) (and
(! (or %lbl%@41482 (sAddr esp)) :lblneg @41482)
(=> (sAddr esp) (=> (= (select $Mem@@2 esp) (select call17687formal@$oldMem@0 esp)) (=> (and
(= (select $Mem@@2 esp) (select $sMem@@5 esp))
(= call17690formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@41521 (= (ReturnToAddr (select $Mem@@2 esp)) call17690formal@$oldRA@0)) :lblneg @41521)
(=> (= (ReturnToAddr (select $Mem@@2 esp)) call17690formal@$oldRA@0) (and
(! (or %lbl%@41532 (Aligned esp)) :lblneg @41532)
(=> (Aligned esp) (=> (= esp@3 (+ esp 4)) (=> (and
(Aligned esp@3)
(= eax@1 call17627formal@$ret@0)
(= edx@0 call17672formal@$ret@0)
(= esp@5 esp@3)) GeneratedUnifiedExit_correct)))))))))))))))))))))
(let ((skip6_correct (=> (! (and %lbl%+17824 true) :lblpos +17824) (=> (and
(= call17694formal@$ret@0 0)
(= call17709formal@$oldMem@0 $Mem@@2)
(= call17709formal@$oldSMem@0 $sMem@@5)
(= call17709formal@$oldDMem@0 $dMem@@0)
(= call17709formal@$oldPciMem@0 $pciMem@@4)
(= call17709formal@$oldTMem@0 $tMems@@12)
(= call17709formal@$oldFMem@0 $fMems@@4)
(= call17709formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@41642 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @41642)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@41672 (MemInv call17709formal@$oldMem@0 call17709formal@$oldSMem@0 call17709formal@$oldDMem@0 call17709formal@$oldPciMem@0 call17709formal@$oldTMem@0 call17709formal@$oldFMem@0 call17709formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @41672)
(=> (MemInv call17709formal@$oldMem@0 call17709formal@$oldSMem@0 call17709formal@$oldDMem@0 call17709formal@$oldPciMem@0 call17709formal@$oldTMem@0 call17709formal@$oldFMem@0 call17709formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@41695 (= (select $sMem@@5 esp) (select call17709formal@$oldSMem@0 esp))) :lblneg @41695)
(=> (= (select $sMem@@5 esp) (select call17709formal@$oldSMem@0 esp)) (and
(! (or %lbl%@41708 (sAddr esp)) :lblneg @41708)
(=> (sAddr esp) (=> (= (select $Mem@@2 esp) (select call17709formal@$oldMem@0 esp)) (=> (and
(= (select $Mem@@2 esp) (select $sMem@@5 esp))
(= call17712formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@41747 (= (ReturnToAddr (select $Mem@@2 esp)) call17712formal@$oldRA@0)) :lblneg @41747)
(=> (= (ReturnToAddr (select $Mem@@2 esp)) call17712formal@$oldRA@0) (and
(! (or %lbl%@41758 (Aligned esp)) :lblneg @41758)
(=> (Aligned esp) (=> (= esp@4 (+ esp 4)) (=> (and
(Aligned esp@4)
(= eax@1 call17627formal@$ret@0)
(= edx@0 call17694formal@$ret@0)
(= esp@5 esp@4)) GeneratedUnifiedExit_correct))))))))))))))))))))
(let ((anon27_Then_correct (=> (! (and %lbl%+17820 true) :lblpos +17820) (=> (Jae $Efl@29) skip6_correct))))
(let ((anon26_Else_correct (=> (! (and %lbl%+17812 true) :lblpos +17812) (=> (and
(not (Jb $Efl@18))
(= call17656formal@$ptr@0 (+ (+ ecx (* 4 call17627formal@$ret@0)) 4))) (and
(! (or %lbl%@41247 (inRo call17656formal@$ptr@0 4)) :lblneg @41247)
(=> (inRo call17656formal@$ptr@0 4) (=> (and
(word call17656formal@$val@0)
(= call17656formal@$val@0 (ro32 call17656formal@$ptr@0))
(= call17663formal@$x@0 (OpnReg ebp))
(= call17663formal@$y@0 (OpnReg call17656formal@$val@0))) (and
(! (or %lbl%@41295 (OpnOk $Mem@@2 call17663formal@$x@0)) :lblneg @41295)
(=> (OpnOk $Mem@@2 call17663formal@$x@0) (and
(! (or %lbl%@41300 (OpnOk $Mem@@2 call17663formal@$y@0)) :lblneg @41300)
(=> (OpnOk $Mem@@2 call17663formal@$y@0) (=> (FlagsCmp $Efl@29 (EvalOpn $Mem@@2 call17663formal@$x@0) (EvalOpn $Mem@@2 call17663formal@$y@0)) (and
anon27_Then_correct
anon27_Else_correct)))))))))))))
(let ((anon26_Then_correct (=> (! (and %lbl%+17810 true) :lblpos +17810) (=> (Jb $Efl@18) skip6_correct))))
(let ((anon22_Then_correct (=> (! (and %lbl%+17763 true) :lblpos +17763) (=> (Jae $Efl@15) (=> (and
(= call17627formal@$ret@0 esi@0)
(= call17634formal@$ptr@0 (+ ecx (* 4 call17627formal@$ret@0)))) (and
(! (or %lbl%@40589 (inRo call17634formal@$ptr@0 4)) :lblneg @40589)
(=> (inRo call17634formal@$ptr@0 4) (=> (and
(word call17634formal@$val@0)
(= call17634formal@$val@0 (ro32 call17634formal@$ptr@0))
(= call17641formal@$x@0 (OpnReg ebp))
(= call17641formal@$y@0 (OpnReg call17634formal@$val@0))) (and
(! (or %lbl%@40637 (OpnOk $Mem@@2 call17641formal@$x@0)) :lblneg @40637)
(=> (OpnOk $Mem@@2 call17641formal@$x@0) (and
(! (or %lbl%@40642 (OpnOk $Mem@@2 call17641formal@$y@0)) :lblneg @40642)
(=> (OpnOk $Mem@@2 call17641formal@$y@0) (=> (FlagsCmp $Efl@18 (EvalOpn $Mem@@2 call17641formal@$x@0) (EvalOpn $Mem@@2 call17641formal@$y@0)) (and
anon26_Then_correct
anon26_Else_correct))))))))))))))
(let ((loop_correct (=> (! (and %lbl%+17762 true) :lblpos +17762) (=> (and
(TO esi@0)
(TO edi@0)
(<= 0 esi@0)
(< esi@0 edi@0)
(<= edi@0 $count)
(=> (exists ((j@@38 Int) ) (! (and
(TO j@@38)
(<= 0 j@@38)
(< j@@38 $count)
(between (ro32 (+ $base@@3 (* 4 j@@38))) (ro32 (+ $base@@3 (* 4 (+ j@@38 1)))) $x))
 :qid |Commonbp.66:18|
 :skolemid |222|
 :pattern ( (TO j@@38))
)) (and
(<= (ro32 (+ $base@@3 (* 4 esi@0))) $x)
(< $x (ro32 (+ $base@@3 (* 4 edi@0))))))
(= call17530formal@$addr@0 (+ esi@0 1))) (and
(! (or %lbl%@40474 (word call17530formal@$addr@0)) :lblneg @40474)
(=> (word call17530formal@$addr@0) (=> (= call17530formal@$ret@0 call17530formal@$addr@0) (=> (and
(= call17537formal@$x@0 (OpnReg call17530formal@$ret@0))
(= call17537formal@$y@0 (OpnReg edi@0))) (and
(! (or %lbl%@40514 (OpnOk $Mem@@2 call17537formal@$x@0)) :lblneg @40514)
(=> (OpnOk $Mem@@2 call17537formal@$x@0) (and
(! (or %lbl%@40519 (OpnOk $Mem@@2 call17537formal@$y@0)) :lblneg @40519)
(=> (OpnOk $Mem@@2 call17537formal@$y@0) (=> (FlagsCmp $Efl@15 (EvalOpn $Mem@@2 call17537formal@$x@0) (EvalOpn $Mem@@2 call17537formal@$y@0)) (and
anon22_Then_correct
anon22_Else_correct))))))))))))))
(let ((anon21_Then_correct (=> (! (and %lbl%+17750 true) :lblpos +17750) (=> (Jb $Efl@6) (=> (and
(= call17442formal@$ret@0 0)
(= call17445formal@$ret@0 edx)) (and
(! (or %lbl%@39840 (and
(TO call17442formal@$ret@0)
(TO call17445formal@$ret@0)
(<= 0 call17442formal@$ret@0)
(< call17442formal@$ret@0 call17445formal@$ret@0)
(<= call17445formal@$ret@0 $count))) :lblneg @39840)
(=> (and
(TO call17442formal@$ret@0)
(TO call17445formal@$ret@0)
(<= 0 call17442formal@$ret@0)
(< call17442formal@$ret@0 call17445formal@$ret@0)
(<= call17445formal@$ret@0 $count)) (and
(! (or %lbl%@39868 (=> (exists ((j@@39 Int) ) (! (and
(TO j@@39)
(<= 0 j@@39)
(< j@@39 $count)
(between (ro32 (+ $base@@3 (* 4 j@@39))) (ro32 (+ $base@@3 (* 4 (+ j@@39 1)))) $x))
 :qid |Commonbp.66:18|
 :skolemid |222|
 :pattern ( (TO j@@39))
)) (and
(<= (ro32 (+ $base@@3 (* 4 call17442formal@$ret@0))) $x)
(< $x (ro32 (+ $base@@3 (* 4 call17445formal@$ret@0))))))) :lblneg @39868)
(=> (=> (exists ((j@@40 Int) ) (! (and
(TO j@@40)
(<= 0 j@@40)
(< j@@40 $count)
(between (ro32 (+ $base@@3 (* 4 j@@40))) (ro32 (+ $base@@3 (* 4 (+ j@@40 1)))) $x))
 :qid |Commonbp.66:18|
 :skolemid |222|
 :pattern ( (TO j@@40))
)) (and
(<= (ro32 (+ $base@@3 (* 4 call17442formal@$ret@0))) $x)
(< $x (ro32 (+ $base@@3 (* 4 call17445formal@$ret@0)))))) loop_correct)))))))))
(let ((anon20_Then_correct (=> (! (and %lbl%+17739 true) :lblpos +17739) (=> (Jae $Efl@4) (and
(! (or %lbl%@39456 (TO $count)) :lblneg @39456)
(=> (TO $count) (=> (= call17322formal@$ptr@0 (+ ecx (* 4 edx))) (and
(! (or %lbl%@39476 (inRo call17322formal@$ptr@0 4)) :lblneg @39476)
(=> (inRo call17322formal@$ptr@0 4) (=> (and
(word call17322formal@$val@0)
(= call17322formal@$val@0 (ro32 call17322formal@$ptr@0))
(= call17329formal@$x@0 (OpnReg ebp))
(= call17329formal@$y@0 (OpnReg call17322formal@$val@0))) (and
(! (or %lbl%@39524 (OpnOk $Mem@@2 call17329formal@$x@0)) :lblneg @39524)
(=> (OpnOk $Mem@@2 call17329formal@$x@0) (and
(! (or %lbl%@39529 (OpnOk $Mem@@2 call17329formal@$y@0)) :lblneg @39529)
(=> (OpnOk $Mem@@2 call17329formal@$y@0) (=> (FlagsCmp $Efl@6 (EvalOpn $Mem@@2 call17329formal@$x@0) (EvalOpn $Mem@@2 call17329formal@$y@0)) (and
anon21_Then_correct
anon21_Else_correct))))))))))))))))
(let ((anon19_Then_correct (=> (! (and %lbl%+17728 true) :lblpos +17728) (=> (Jae $Efl@0) (and
(! (or %lbl%@39362 (TO 0)) :lblneg @39362)
(=> (TO 0) (and
(! (or %lbl%@39369 (inRo ecx 4)) :lblneg @39369)
(=> (inRo ecx 4) (=> (and
(word call17272formal@$val@0)
(= call17272formal@$val@0 (ro32 ecx))
(= call17279formal@$x@0 (OpnReg ebp))
(= call17279formal@$y@0 (OpnReg call17272formal@$val@0))) (and
(! (or %lbl%@39417 (OpnOk $Mem@@2 call17279formal@$x@0)) :lblneg @39417)
(=> (OpnOk $Mem@@2 call17279formal@$x@0) (and
(! (or %lbl%@39422 (OpnOk $Mem@@2 call17279formal@$y@0)) :lblneg @39422)
(=> (OpnOk $Mem@@2 call17279formal@$y@0) (=> (FlagsCmp $Efl@4 (EvalOpn $Mem@@2 call17279formal@$x@0) (EvalOpn $Mem@@2 call17279formal@$y@0)) (and
anon20_Then_correct
anon20_Else_correct)))))))))))))))
(let ((anon0_correct@@1 (=> (! (and %lbl%+17727 true) :lblpos +17727) (=> (and
(= call17237formal@$x@0 (OpnReg edx))
(= call17237formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@39092 (OpnOk $Mem@@2 call17237formal@$x@0)) :lblneg @39092)
(=> (OpnOk $Mem@@2 call17237formal@$x@0) (and
(! (or %lbl%@39097 (OpnOk $Mem@@2 call17237formal@$y@0)) :lblneg @39097)
(=> (OpnOk $Mem@@2 call17237formal@$y@0) (=> (FlagsCmp $Efl@0 (EvalOpn $Mem@@2 call17237formal@$x@0) (EvalOpn $Mem@@2 call17237formal@$y@0)) (and
anon19_Then_correct
anon19_Else_correct))))))))))
(let ((PreconditionGeneratedEntry_correct@@1 (=> (! (and %lbl%+38174 true) :lblpos +38174) (=> (and
(= ecx $base@@3)
(= edx $count)
(= ebp $x)) (=> (and
(word ecx)
(word edx)
(word ebp)
(forall ((j@@41 Int) ) (! (=> (TO j@@41) (=> (and
(<= 0 j@@41)
(<= j@@41 $count)) (inRo (+ $base@@3 (* 4 j@@41)) 4)))
 :qid |Commonbp.21:18|
 :skolemid |217|
 :pattern ( (TO j@@41))
))
(forall ((j1@@0 Int) (j2@@0 Int) ) (! (=> (and
(TO j1@@0)
(TO j2@@0)) (=> (and
(<= 0 j1@@0)
(< j1@@0 j2@@0)
(<= j2@@0 $count)) (< (ro32 (+ $base@@3 (* 4 j1@@0))) (ro32 (+ $base@@3 (* 4 j2@@0))))))
 :qid |Commonbp.22:18|
 :skolemid |218|
 :pattern ( (TO j1@@0) (TO j2@@0))
))
(SMemRequireRA 72 $sMem@@5 esp $RET@@0)
(MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) anon0_correct@@1)))))
PreconditionGeneratedEntry_correct@@1))))))))))))))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+18415 () Bool)
(declare-fun call18331formal@$ptr@0 () Int)
(declare-fun esp@5@@0 () Int)
(declare-fun %lbl%@47308 () Bool)
(declare-fun $Mem@7 () (Array Int Int))
(declare-fun $sMem@6 () (Array Int Int))
(declare-fun %lbl%@47336 () Bool)
(declare-fun call18338formal@$ptr@0 () Int)
(declare-fun call18338formal@$val@0 () Int)
(declare-fun $beat__stackvar__8_esp__table@0 () Int)
(declare-fun %lbl%@47371 () Bool)
(declare-fun %lbl%@47399 () Bool)
(declare-fun $sMem@7 () (Array Int Int))
(declare-fun call18345formal@$x@0 () T@opn)
(declare-fun %lbl%@47463 () Bool)
(declare-fun $Mem@8 () (Array Int Int))
(declare-fun $beat__stackvar__8_esp__table@1 () Int)
(declare-fun call18354formal@$ret@0 () Int)
(declare-fun %lbl%@47543 () Bool)
(declare-fun $beat__stackvar__24_esp__tmp2@0 () Int)
(declare-fun %lbl%@47554 () Bool)
(declare-fun $beat__stackvar__20_esp__tmp1@0 () Int)
(declare-fun %lbl%@47565 () Bool)
(declare-fun $beat__stackvar__16_esp__tableBase@0 () Int)
(declare-fun %lbl%@47576 () Bool)
(declare-fun $beat__stackvar__12_esp__index@2 () Int)
(declare-fun %lbl%@47587 () Bool)
(declare-fun %lbl%@47598 () Bool)
(declare-fun %lbl%@47609 () Bool)
(declare-fun %lbl%@47620 () Bool)
(declare-fun $f () Int)
(declare-fun %lbl%@47624 () Bool)
(declare-fun %lbl%@47634 () Bool)
(declare-fun %lbl%@47639 () Bool)
(declare-fun %lbl%@47679 () Bool)
(declare-fun %lbl%@47687 () Bool)
(declare-fun %lbl%@47697 () Bool)
(declare-fun %lbl%@47725 () Bool)
(declare-fun $ra () Int)
(declare-fun %lbl%+18411 () Bool)
(declare-fun $Efl@26 () Int)
(declare-fun eax@1@@0 () Int)
(declare-fun $Mem@6 () (Array Int Int))
(declare-fun $sMem@5 () (Array Int Int))
(declare-fun esp@3@@0 () Int)
(declare-fun %lbl%+18401 () Bool)
(declare-fun $Efl@21@@0 () Int)
(declare-fun $beat__stackvar__12_esp__index@1 () Int)
(declare-fun $Mem@3 () (Array Int Int))
(declare-fun $sMem@3 () (Array Int Int))
(declare-fun esp@0@@0 () Int)
(declare-fun %lbl%+42147 () Bool)
(declare-fun %lbl%@47793 () Bool)
(declare-fun eax@2 () Int)
(declare-fun edx@2 () Int)
(declare-fun %lbl%@47801 () Bool)
(declare-fun $FrameLayouts@@1 () (Array Int (Array Int T@$FrameLayout)))
(declare-fun $s@@21 () Int)
(declare-fun $FrameAddrs@@1 () (Array Int (Array Int Int)))
(declare-fun $nextFp () Int)
(declare-fun %lbl%@47855 () Bool)
(declare-fun %lbl%@47868 () Bool)
(declare-fun $Mem@9 () (Array Int Int))
(declare-fun $sMem@8 () (Array Int Int))
(declare-fun %lbl%@47896 () Bool)
(declare-fun esp@6 () Int)
(declare-fun %lbl%+18413 () Bool)
(declare-fun call18265formal@$ptr@0 () Int)
(declare-fun %lbl%@46749 () Bool)
(declare-fun %lbl%@46777 () Bool)
(declare-fun call18270formal@$ptr@0 () Int)
(declare-fun %lbl%@46801 () Bool)
(declare-fun call18270formal@$val@0 () Int)
(declare-fun call18273formal@$ret@0 () Int)
(declare-fun call18280formal@$ptr@0 () Int)
(declare-fun %lbl%@46865 () Bool)
(declare-fun call18280formal@$val@0 () Int)
(declare-fun call18283formal@$ret@0 () Int)
(declare-fun call18290formal@$ptr@0 () Int)
(declare-fun %lbl%@46930 () Bool)
(declare-fun call18290formal@$val@0 () Int)
(declare-fun call18297formal@$ptr@0 () Int)
(declare-fun %lbl%@46973 () Bool)
(declare-fun call18297formal@$val@0 () Int)
(declare-fun call18304formal@$ptr@0 () Int)
(declare-fun %lbl%@47016 () Bool)
(declare-fun call18304formal@$val@0 () Int)
(declare-fun %lbl%@47050 () Bool)
(declare-fun call18308formal@$ret@0 () Int)
(declare-fun call18323formal@$oldMem@0 () (Array Int Int))
(declare-fun call18323formal@$oldSMem@0 () (Array Int Int))
(declare-fun call18323formal@$oldDMem@0 () (Array Int Int))
(declare-fun call18323formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call18323formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call18323formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call18323formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@47132 () Bool)
(declare-fun %lbl%@47160 () Bool)
(declare-fun %lbl%@47183 () Bool)
(declare-fun %lbl%@47193 () Bool)
(declare-fun call18326formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@47223 () Bool)
(declare-fun %lbl%@47232 () Bool)
(declare-fun esp@4@@0 () Int)
(declare-fun edx@1 () Int)
(declare-fun %lbl%+18403 () Bool)
(declare-fun %lbl%@45959 () Bool)
(declare-fun call18198formal@$val@0 () Int)
(declare-fun call18189formal@$val@0 () Int)
(declare-fun call18222formal@$ret@0 () Int)
(declare-fun %lbl%@45987 () Bool)
(declare-fun %lbl%@46015 () Bool)
(declare-fun $sMem@4 () (Array Int Int))
(declare-fun NextEip (Int) Int)
(declare-fun $Eip@24 () Int)
(declare-fun %lbl%@46079 () Bool)
(declare-fun %lbl%@46086 () Bool)
(declare-fun esp@2@@0 () Int)
(declare-fun $RET@1 () T@ReturnTo)
(declare-fun $Mem@4 () (Array Int Int))
(declare-fun call18230formal@$x@0 () Int)
(declare-fun %lbl%@46157 () Bool)
(declare-fun call18166formal@$val@0 () Int)
(declare-fun call18179formal@$val@0 () Int)
(declare-fun %lbl%@46173 () Bool)
(declare-fun %lbl%@46186 () Bool)
(declare-fun %lbl%@46228 () Bool)
(declare-fun %lbl%@46299 () Bool)
(declare-fun %lbl%@46306 () Bool)
(declare-fun $Mem@5 () (Array Int Int))
(declare-fun call18239formal@$ptr@0 () Int)
(declare-fun %lbl%@46558 () Bool)
(declare-fun %lbl%@46586 () Bool)
(declare-fun call18244formal@$ptr@0 () Int)
(declare-fun %lbl%@46647 () Bool)
(declare-fun %lbl%@46650 () Bool)
(declare-fun %lbl%@46676 () Bool)
(declare-fun call18255formal@$x@0 () T@opn)
(declare-fun call18255formal@$y@0 () T@opn)
(declare-fun %lbl%@46698 () Bool)
(declare-fun %lbl%@46702 () Bool)
(declare-fun %lbl%+18393 () Bool)
(declare-fun $Efl@9 () Int)
(declare-fun call18159formal@$ret@0 () Int)
(declare-fun call18166formal@$ptr@0 () Int)
(declare-fun call18140formal@$val@0 () Int)
(declare-fun %lbl%@45581 () Bool)
(declare-fun call18169formal@$ret@0 () Int)
(declare-fun call18176formal@$ptr@0 () Int)
(declare-fun %lbl%@45646 () Bool)
(declare-fun call18176formal@$val@0 () Int)
(declare-fun %lbl%@45677 () Bool)
(declare-fun call18182formal@$ret@0 () Int)
(declare-fun call18189formal@$ptr@0 () Int)
(declare-fun %lbl%@45742 () Bool)
(declare-fun call18193formal@$ptr@0 () Int)
(declare-fun %lbl%@45782 () Bool)
(declare-fun %lbl%@45810 () Bool)
(declare-fun call18198formal@$ptr@0 () Int)
(declare-fun %lbl%@45834 () Bool)
(declare-fun %lbl%@45862 () Bool)
(declare-fun %lbl%@45868 () Bool)
(declare-fun call18205formal@$val@0 () Int)
(declare-fun call18212formal@$x@0 () T@opn)
(declare-fun call18212formal@$y@0 () T@opn)
(declare-fun %lbl%@45915 () Bool)
(declare-fun %lbl%@45919 () Bool)
(declare-fun %lbl%+18391 () Bool)
(declare-fun %lbl%@45329 () Bool)
(declare-fun call18361formal@$ret@0 () Int)
(declare-fun call18376formal@$oldMem@0 () (Array Int Int))
(declare-fun call18376formal@$oldSMem@0 () (Array Int Int))
(declare-fun call18376formal@$oldDMem@0 () (Array Int Int))
(declare-fun call18376formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call18376formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call18376formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call18376formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@45411 () Bool)
(declare-fun %lbl%@45439 () Bool)
(declare-fun %lbl%@45462 () Bool)
(declare-fun %lbl%@45472 () Bool)
(declare-fun call18379formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@45502 () Bool)
(declare-fun %lbl%@45511 () Bool)
(declare-fun esp@1@@0 () Int)
(declare-fun edx@0@@0 () Int)
(declare-fun %lbl%+18390 () Bool)
(declare-fun call18135formal@$ptr@0 () Int)
(declare-fun %lbl%@45169 () Bool)
(declare-fun %lbl%@45197 () Bool)
(declare-fun call18140formal@$ptr@0 () Int)
(declare-fun %lbl%@45221 () Bool)
(declare-fun call18143formal@$ret@0 () Int)
(declare-fun call18150formal@$x@0 () T@opn)
(declare-fun call18150formal@$y@0 () T@opn)
(declare-fun %lbl%@45289 () Bool)
(declare-fun %lbl%@45293 () Bool)
(declare-fun %lbl%+18383 () Bool)
(declare-fun frameFieldToSlot (T@$FrameLayout Int) Int)
(declare-fun roS8 (Int) Int)
(declare-fun roU8 (Int) Int)
(declare-fun inSectionData (Int) Bool)
(declare-fun %lbl%@44128 () Bool)
(declare-fun %lbl%@44208 () Bool)
(declare-fun call17909formal@$ret@0 () Int)
(declare-fun call17918formal@$ptr@0 () Int)
(declare-fun %lbl%@44253 () Bool)
(declare-fun %lbl%@44283 () Bool)
(declare-fun $sMem@0 () (Array Int Int))
(declare-fun call17923formal@$ptr@0 () Int)
(declare-fun %lbl%@44347 () Bool)
(declare-fun %lbl%@44350 () Bool)
(declare-fun $Mem@0 () (Array Int Int))
(declare-fun call17932formal@$ptr@0 () Int)
(declare-fun %lbl%@44394 () Bool)
(declare-fun %lbl%@44422 () Bool)
(declare-fun $sMem@1 () (Array Int Int))
(declare-fun call17937formal@$ptr@0 () Int)
(declare-fun %lbl%@44484 () Bool)
(declare-fun %lbl%@44487 () Bool)
(declare-fun $Mem@1 () (Array Int Int))
(declare-fun call17946formal@$ptr@0 () Int)
(declare-fun %lbl%@44530 () Bool)
(declare-fun %lbl%@44558 () Bool)
(declare-fun $sMem@2 () (Array Int Int))
(declare-fun call17951formal@$ptr@0 () Int)
(declare-fun %lbl%@44620 () Bool)
(declare-fun %lbl%@44623 () Bool)
(declare-fun $Mem@2 () (Array Int Int))
(declare-fun $beat__stackvar__12_esp__index@0 () Int)
(declare-fun call17986formal@$ret@0 () Int)
(declare-fun %lbl%@44727 () Bool)
(declare-fun %lbl%@44738 () Bool)
(declare-fun %lbl%@44749 () Bool)
(declare-fun %lbl%@44760 () Bool)
(declare-fun %lbl%@44771 () Bool)
(declare-fun %lbl%@44782 () Bool)
(declare-fun %lbl%@44793 () Bool)
(declare-fun %lbl%@44804 () Bool)
(declare-fun %lbl%@44808 () Bool)
(declare-fun %lbl%@44818 () Bool)
(declare-fun %lbl%@44823 () Bool)
(declare-fun %lbl%@44863 () Bool)
(declare-fun %lbl%@44871 () Bool)
(declare-fun %lbl%@44881 () Bool)
(declare-fun %lbl%@44909 () Bool)
(declare-fun %lbl%+42152 () Bool)
(push 1)
(set-info :boogie-vc-id TablesSearch)
(assert (not
(let ((skip1_correct (=> (! (and %lbl%+18415 true) :lblpos +18415) (=> (= call18331formal@$ptr@0 (+ esp@5@@0 8)) (and
(! (or %lbl%@47308 (MemInv $Mem@7 $sMem@6 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @47308)
(=> (MemInv $Mem@7 $sMem@6 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@47336 (sAddr call18331formal@$ptr@0)) :lblneg @47336)
(=> (sAddr call18331formal@$ptr@0) (=> (= (select $Mem@7 call18331formal@$ptr@0) (select $sMem@6 call18331formal@$ptr@0)) (=> (and
(= call18338formal@$ptr@0 (+ esp@5@@0 8))
(= call18338formal@$val@0 (+ $beat__stackvar__8_esp__table@0 1))) (and
(! (or %lbl%@47371 (MemInv $Mem@7 $sMem@6 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @47371)
(=> (MemInv $Mem@7 $sMem@6 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@47399 (sAddr call18338formal@$ptr@0)) :lblneg @47399)
(=> (sAddr call18338formal@$ptr@0) (=> (MemInv (store $Mem@7 call18338formal@$ptr@0 call18338formal@$val@0) $sMem@7 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@7 (store $sMem@6 call18338formal@$ptr@0 call18338formal@$val@0))
(= call18345formal@$x@0 (OpnMem (+ esp@5@@0 8)))) (and
(! (or %lbl%@47463 (OpnOk $Mem@7 call18345formal@$x@0)) :lblneg @47463)
(=> (OpnOk $Mem@7 call18345formal@$x@0) (=> (and
(word (+ (EvalOpn $Mem@7 call18345formal@$x@0) 1))
(= $Mem@8 (UpdateOpn $Mem@7 call18345formal@$x@0 (+ (EvalOpn $Mem@7 call18345formal@$x@0) 1)))
(= $beat__stackvar__8_esp__table@1 (+ $beat__stackvar__8_esp__table@0 1))
(= call18354formal@$ret@0 0)) (and
(! (or %lbl%@47543 (= $beat__stackvar__24_esp__tmp2@0 (select $sMem@7 (+ esp@5@@0 24)))) :lblneg @47543)
(=> (= $beat__stackvar__24_esp__tmp2@0 (select $sMem@7 (+ esp@5@@0 24))) (and
(! (or %lbl%@47554 (= $beat__stackvar__20_esp__tmp1@0 (select $sMem@7 (+ esp@5@@0 20)))) :lblneg @47554)
(=> (= $beat__stackvar__20_esp__tmp1@0 (select $sMem@7 (+ esp@5@@0 20))) (and
(! (or %lbl%@47565 (= $beat__stackvar__16_esp__tableBase@0 (select $sMem@7 (+ esp@5@@0 16)))) :lblneg @47565)
(=> (= $beat__stackvar__16_esp__tableBase@0 (select $sMem@7 (+ esp@5@@0 16))) (and
(! (or %lbl%@47576 (= $beat__stackvar__12_esp__index@2 (select $sMem@7 (+ esp@5@@0 12)))) :lblneg @47576)
(=> (= $beat__stackvar__12_esp__index@2 (select $sMem@7 (+ esp@5@@0 12))) (and
(! (or %lbl%@47587 (= $beat__stackvar__8_esp__table@1 (select $sMem@7 (+ esp@5@@0 8)))) :lblneg @47587)
(=> (= $beat__stackvar__8_esp__table@1 (select $sMem@7 (+ esp@5@@0 8))) (and
(! (or %lbl%@47598 (= edx (select $sMem@7 (+ esp@5@@0 4)))) :lblneg @47598)
(=> (= edx (select $sMem@7 (+ esp@5@@0 4))) (and
(! (or %lbl%@47609 (= ecx (select $sMem@7 (+ esp@5@@0 0)))) :lblneg @47609)
(=> (= ecx (select $sMem@7 (+ esp@5@@0 0))) (and
(! (or %lbl%@47620 (TVFT $f)) :lblneg @47620)
(=> (TVFT $f) (and
(! (or %lbl%@47624 (and
(TT $beat__stackvar__8_esp__table@1)
(<= 0 $beat__stackvar__8_esp__table@1))) :lblneg @47624)
(=> (and
(TT $beat__stackvar__8_esp__table@1)
(<= 0 $beat__stackvar__8_esp__table@1)) (and
(! (or %lbl%@47634 (= call18354formal@$ret@0 0)) :lblneg @47634)
(=> (= call18354formal@$ret@0 0) (and
(! (or %lbl%@47639 (not (exists ((t@@7 Int) (j@@42 Int) ) (! (and
(TT t@@7)
(TO j@@42)
(< t@@7 $beat__stackvar__8_esp__table@1)
(RetAddrAt t@@7 j@@42 ecx))
 :qid |Commonbp.122:19|
 :skolemid |223|
 :pattern ( (TT t@@7) (TO j@@42))
)))) :lblneg @47639)
(=> (not (exists ((t@@8 Int) (j@@43 Int) ) (! (and
(TT t@@8)
(TO j@@43)
(< t@@8 $beat__stackvar__8_esp__table@1)
(RetAddrAt t@@8 j@@43 ecx))
 :qid |Commonbp.122:19|
 :skolemid |223|
 :pattern ( (TT t@@8) (TO j@@43))
))) (and
(! (or %lbl%@47679 (and
(word $beat__stackvar__8_esp__table@1)
(word ecx))) :lblneg @47679)
(=> (and
(word $beat__stackvar__8_esp__table@1)
(word ecx)) (and
(! (or %lbl%@47687 (SMemInv $sMem@7 $sMem@@5 (+ esp@5@@0 28) esp)) :lblneg @47687)
(=> (SMemInv $sMem@7 $sMem@@5 (+ esp@5@@0 28) esp) (and
(! (or %lbl%@47697 (MemInv $Mem@8 $sMem@7 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @47697)
(=> (MemInv $Mem@8 $sMem@7 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@47725 (= ecx $ra)) :lblneg @47725)
(=> (= ecx $ra) true)))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon9_Then_correct (=> (! (and %lbl%+18411 true) :lblpos +18411) (=> (Je $Efl@26) (=> (and
(= $beat__stackvar__12_esp__index@2 eax@1@@0)
(= $Mem@7 $Mem@6)
(= $sMem@6 $sMem@5)
(= esp@5@@0 esp@3@@0)) skip1_correct)))))
(let ((anon8_Then_correct (=> (! (and %lbl%+18401 true) :lblpos +18401) (=> (Ja $Efl@21@@0) (=> (and
(= $beat__stackvar__12_esp__index@2 $beat__stackvar__12_esp__index@1)
(= $Mem@7 $Mem@3)
(= $sMem@6 $sMem@3)
(= esp@5@@0 esp@0@@0)) skip1_correct)))))
(let ((GeneratedUnifiedExit_correct@@0 (=> (! (and %lbl%+42147 true) :lblpos +42147) (and
(! (or %lbl%@47793 (and
(word eax@2)
(word edx@2))) :lblneg @47793)
(=> (and
(word eax@2)
(word edx@2)) (and
(! (or %lbl%@47801 (=> (not (= edx@2 0)) (=> (> $f 0) (and
(= eax@2 (frameDescriptor (select (select $FrameLayouts@@1 $s@@21) (- $f 1))))
(= (select (select $FrameAddrs@@1 $s@@21) (- $f 1)) $nextFp))))) :lblneg @47801)
(=> (=> (not (= edx@2 0)) (=> (> $f 0) (and
(= eax@2 (frameDescriptor (select (select $FrameLayouts@@1 $s@@21) (- $f 1))))
(= (select (select $FrameAddrs@@1 $s@@21) (- $f 1)) $nextFp)))) (and
(! (or %lbl%@47855 (=> (= edx@2 0) (= $f 0))) :lblneg @47855)
(=> (=> (= edx@2 0) (= $f 0)) (and
(! (or %lbl%@47868 (MemInv $Mem@9 $sMem@8 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @47868)
(=> (MemInv $Mem@9 $sMem@8 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@47896 (SMemEnsure $sMem@8 $sMem@@5 esp@6 esp)) :lblneg @47896)
(=> (SMemEnsure $sMem@8 $sMem@@5 esp@6 esp) true)))))))))))))
(let ((anon9_Else_correct (=> (! (and %lbl%+18413 true) :lblpos +18413) (=> (and
(not (Je $Efl@26))
(= call18265formal@$ptr@0 (+ esp@3@@0 8))) (and
(! (or %lbl%@46749 (MemInv $Mem@6 $sMem@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @46749)
(=> (MemInv $Mem@6 $sMem@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@46777 (sAddr call18265formal@$ptr@0)) :lblneg @46777)
(=> (sAddr call18265formal@$ptr@0) (=> (and
(= (select $Mem@6 call18265formal@$ptr@0) (select $sMem@5 call18265formal@$ptr@0))
(= call18270formal@$ptr@0 (+ esp@3@@0 8))) (and
(! (or %lbl%@46801 (PtrOk call18270formal@$ptr@0)) :lblneg @46801)
(=> (PtrOk call18270formal@$ptr@0) (=> (and
(word call18270formal@$val@0)
(= call18270formal@$val@0 (select $Mem@6 call18270formal@$ptr@0))
(= call18273formal@$ret@0 ?ActivationDescriptorTable)
(= call18280formal@$ptr@0 (+ call18273formal@$ret@0 (* 4 call18270formal@$val@0)))) (and
(! (or %lbl%@46865 (inRo call18280formal@$ptr@0 4)) :lblneg @46865)
(=> (inRo call18280formal@$ptr@0 4) (=> (and
(word call18280formal@$val@0)
(= call18280formal@$val@0 (ro32 call18280formal@$ptr@0))
(= call18283formal@$ret@0 ?CallSiteSetNumberToIndex)
(= call18290formal@$ptr@0 (+ call18283formal@$ret@0 (* 4 call18270formal@$val@0)))) (and
(! (or %lbl%@46930 (inRo call18290formal@$ptr@0 4)) :lblneg @46930)
(=> (inRo call18290formal@$ptr@0 4) (=> (word call18290formal@$val@0) (=> (and
(= call18290formal@$val@0 (ro32 call18290formal@$ptr@0))
(= call18297formal@$ptr@0 (+ call18290formal@$val@0 (* 2 eax@1@@0)))) (and
(! (or %lbl%@46973 (inRo call18297formal@$ptr@0 2)) :lblneg @46973)
(=> (inRo call18297formal@$ptr@0 2) (=> (word call18297formal@$val@0) (=> (and
(= call18297formal@$val@0 (roU16 call18297formal@$ptr@0))
(= call18304formal@$ptr@0 (+ call18280formal@$val@0 (* 4 call18297formal@$val@0)))) (and
(! (or %lbl%@47016 (inRo call18304formal@$ptr@0 4)) :lblneg @47016)
(=> (inRo call18304formal@$ptr@0 4) (=> (and
(word call18304formal@$val@0)
(= call18304formal@$val@0 (ro32 call18304formal@$ptr@0))) (and
(! (or %lbl%@47050 (word (+ esp@3@@0 28))) :lblneg @47050)
(=> (word (+ esp@3@@0 28)) (=> (and
(= call18308formal@$ret@0 (+ esp@3@@0 28))
(= call18323formal@$oldMem@0 $Mem@@2)
(= call18323formal@$oldSMem@0 $sMem@@5)
(= call18323formal@$oldDMem@0 $dMem@@0)
(= call18323formal@$oldPciMem@0 $pciMem@@4)
(= call18323formal@$oldTMem@0 $tMems@@12)
(= call18323formal@$oldFMem@0 $fMems@@4)
(= call18323formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@47132 (MemInv $Mem@6 $sMem@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @47132)
(=> (MemInv $Mem@6 $sMem@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@47160 (MemInv call18323formal@$oldMem@0 call18323formal@$oldSMem@0 call18323formal@$oldDMem@0 call18323formal@$oldPciMem@0 call18323formal@$oldTMem@0 call18323formal@$oldFMem@0 call18323formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @47160)
(=> (MemInv call18323formal@$oldMem@0 call18323formal@$oldSMem@0 call18323formal@$oldDMem@0 call18323formal@$oldPciMem@0 call18323formal@$oldTMem@0 call18323formal@$oldFMem@0 call18323formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@47183 (= (select $sMem@5 call18308formal@$ret@0) (select call18323formal@$oldSMem@0 call18308formal@$ret@0))) :lblneg @47183)
(=> (= (select $sMem@5 call18308formal@$ret@0) (select call18323formal@$oldSMem@0 call18308formal@$ret@0)) (and
(! (or %lbl%@47193 (sAddr call18308formal@$ret@0)) :lblneg @47193)
(=> (sAddr call18308formal@$ret@0) (=> (= (select $Mem@6 call18308formal@$ret@0) (select call18323formal@$oldMem@0 call18308formal@$ret@0)) (=> (and
(= (select $Mem@6 call18308formal@$ret@0) (select $sMem@5 call18308formal@$ret@0))
(= call18326formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@47223 (= (ReturnToAddr (select $Mem@6 call18308formal@$ret@0)) call18326formal@$oldRA@0)) :lblneg @47223)
(=> (= (ReturnToAddr (select $Mem@6 call18308formal@$ret@0)) call18326formal@$oldRA@0) (and
(! (or %lbl%@47232 (Aligned call18308formal@$ret@0)) :lblneg @47232)
(=> (Aligned call18308formal@$ret@0) (=> (= esp@4@@0 (+ call18308formal@$ret@0 4)) (=> (and
(Aligned esp@4@@0)
(= eax@2 call18304formal@$val@0)) (=> (and
(= $sMem@8 $sMem@5)
(= $Mem@9 $Mem@6)
(= edx@2 edx@1)
(= esp@6 esp@4@@0)) GeneratedUnifiedExit_correct@@0))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon8_Else_correct (=> (! (and %lbl%+18403 true) :lblpos +18403) (=> (not (Ja $Efl@21@@0)) (and
(! (or %lbl%@45959 (word (- call18198formal@$val@0 call18189formal@$val@0))) :lblneg @45959)
(=> (word (- call18198formal@$val@0 call18189formal@$val@0)) (=> (= call18222formal@$ret@0 (- call18198formal@$val@0 call18189formal@$val@0)) (and
(! (or %lbl%@45987 (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @45987)
(=> (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@46015 (sAddr (- esp@0@@0 4))) :lblneg @46015)
(=> (sAddr (- esp@0@@0 4)) (=> (and
(= $sMem@4 (store $sMem@3 (- esp@0@@0 4) (NextEip $Eip@24)))
(MemInv (store $Mem@3 (- esp@0@@0 4) (NextEip $Eip@24)) $sMem@4 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (and
(! (or %lbl%@46079 (memAddr (- esp@0@@0 4))) :lblneg @46079)
(=> (memAddr (- esp@0@@0 4)) (and
(! (or %lbl%@46086 (Aligned esp@0@@0)) :lblneg @46086)
(=> (Aligned esp@0@@0) (=> (= esp@2@@0 (- esp@0@@0 4)) (=> (and
(Aligned esp@2@@0)
(= $RET@1 (ReturnToAddr (NextEip $Eip@24)))
(= $Mem@4 (store $Mem@3 esp@2@@0 (NextEip $Eip@24)))
(= call18230formal@$x@0 (- ecx call18189formal@$val@0))) (and
(! (or %lbl%@46157 (and
(= call18166formal@$val@0 call18166formal@$val@0)
(= call18179formal@$val@0 call18179formal@$val@0)
(= call18222formal@$ret@0 call18230formal@$x@0))) :lblneg @46157)
(=> (and
(= call18166formal@$val@0 call18166formal@$val@0)
(= call18179formal@$val@0 call18179formal@$val@0)
(= call18222formal@$ret@0 call18230formal@$x@0)) (and
(! (or %lbl%@46173 (and
(word call18166formal@$val@0)
(word call18179formal@$val@0)
(word call18222formal@$ret@0))) :lblneg @46173)
(=> (and
(word call18166formal@$val@0)
(word call18179formal@$val@0)
(word call18222formal@$ret@0)) (and
(! (or %lbl%@46186 (forall ((j@@44 Int) ) (! (=> (TO j@@44) (=> (and
(<= 0 j@@44)
(<= j@@44 call18179formal@$val@0)) (inRo (+ call18166formal@$val@0 (* 4 j@@44)) 4)))
 :qid |Commonbp.21:18|
 :skolemid |217|
 :pattern ( (TO j@@44))
))) :lblneg @46186)
(=> (forall ((j@@45 Int) ) (! (=> (TO j@@45) (=> (and
(<= 0 j@@45)
(<= j@@45 call18179formal@$val@0)) (inRo (+ call18166formal@$val@0 (* 4 j@@45)) 4)))
 :qid |Commonbp.21:18|
 :skolemid |217|
 :pattern ( (TO j@@45))
)) (and
(! (or %lbl%@46228 (forall ((j1@@1 Int) (j2@@1 Int) ) (! (=> (and
(TO j1@@1)
(TO j2@@1)) (=> (and
(<= 0 j1@@1)
(< j1@@1 j2@@1)
(<= j2@@1 call18179formal@$val@0)) (< (ro32 (+ call18166formal@$val@0 (* 4 j1@@1))) (ro32 (+ call18166formal@$val@0 (* 4 j2@@1))))))
 :qid |Commonbp.22:18|
 :skolemid |218|
 :pattern ( (TO j1@@1) (TO j2@@1))
))) :lblneg @46228)
(=> (forall ((j1@@2 Int) (j2@@2 Int) ) (! (=> (and
(TO j1@@2)
(TO j2@@2)) (=> (and
(<= 0 j1@@2)
(< j1@@2 j2@@2)
(<= j2@@2 call18179formal@$val@0)) (< (ro32 (+ call18166formal@$val@0 (* 4 j1@@2))) (ro32 (+ call18166formal@$val@0 (* 4 j2@@2))))))
 :qid |Commonbp.22:18|
 :skolemid |218|
 :pattern ( (TO j1@@2) (TO j2@@2))
)) (and
(! (or %lbl%@46299 (SMemRequireRA 72 $sMem@4 esp@2@@0 $RET@1)) :lblneg @46299)
(=> (SMemRequireRA 72 $sMem@4 esp@2@@0 $RET@1) (and
(! (or %lbl%@46306 (MemInv $Mem@4 $sMem@4 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @46306)
(=> (MemInv $Mem@4 $sMem@4 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(word eax@1@@0)
(word edx@1)
(= (not (= edx@1 0)) (exists ((j@@46 Int) ) (! (and
(TO j@@46)
(<= 0 j@@46)
(< j@@46 call18179formal@$val@0)
(between (ro32 (+ call18166formal@$val@0 (* 4 j@@46))) (ro32 (+ call18166formal@$val@0 (* 4 (+ j@@46 1)))) call18230formal@$x@0))
 :qid |Commonbp.31:27|
 :skolemid |219|
 :pattern ( (TO j@@46))
)))
(=> (not (= edx@1 0)) (and
(<= 0 eax@1@@0)
(< eax@1@@0 call18179formal@$val@0)
(between (ro32 (+ call18166formal@$val@0 (* 4 eax@1@@0))) (ro32 (+ call18166formal@$val@0 (* 4 (+ eax@1@@0 1)))) call18230formal@$x@0)))
(SMemEnsure $sMem@4 $sMem@4 esp@3@@0 esp@2@@0)
(MemInv $Mem@5 $sMem@4 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(= call18239formal@$ptr@0 (+ esp@3@@0 12))) (and
(! (or %lbl%@46558 (MemInv $Mem@5 $sMem@4 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @46558)
(=> (MemInv $Mem@5 $sMem@4 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@46586 (sAddr call18239formal@$ptr@0)) :lblneg @46586)
(=> (sAddr call18239formal@$ptr@0) (=> (MemInv (store $Mem@5 call18239formal@$ptr@0 eax@1@@0) $sMem@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@5 (store $sMem@4 call18239formal@$ptr@0 eax@1@@0))
(= call18244formal@$ptr@0 (+ esp@3@@0 12))) (and
(! (or %lbl%@46647 (PtrOk call18244formal@$ptr@0)) :lblneg @46647)
(=> (PtrOk call18244formal@$ptr@0) (and
(! (or %lbl%@46650 (word eax@1@@0)) :lblneg @46650)
(=> (word eax@1@@0) (=> (= $Mem@6 (store $Mem@5 call18244formal@$ptr@0 eax@1@@0)) (and
(! (or %lbl%@46676 (TO eax@1@@0)) :lblneg @46676)
(=> (TO eax@1@@0) (=> (and
(= call18255formal@$x@0 (OpnReg edx@1))
(= call18255formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@46698 (OpnOk $Mem@6 call18255formal@$x@0)) :lblneg @46698)
(=> (OpnOk $Mem@6 call18255formal@$x@0) (and
(! (or %lbl%@46702 (OpnOk $Mem@6 call18255formal@$y@0)) :lblneg @46702)
(=> (OpnOk $Mem@6 call18255formal@$y@0) (=> (FlagsCmp $Efl@26 (EvalOpn $Mem@6 call18255formal@$x@0) (EvalOpn $Mem@6 call18255formal@$y@0)) (and
anon9_Then_correct
anon9_Else_correct)))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon7_Else_correct (=> (! (and %lbl%+18393 true) :lblpos +18393) (=> (not (Jbe $Efl@9)) (=> (and
(= call18159formal@$ret@0 ?ReturnAddressToCallSiteSetNumbers)
(= call18166formal@$ptr@0 (+ call18159formal@$ret@0 (* 4 call18140formal@$val@0)))) (and
(! (or %lbl%@45581 (inRo call18166formal@$ptr@0 4)) :lblneg @45581)
(=> (inRo call18166formal@$ptr@0 4) (=> (and
(word call18166formal@$val@0)
(= call18166formal@$val@0 (ro32 call18166formal@$ptr@0))
(= call18169formal@$ret@0 ?CallSiteSetCount)
(= call18176formal@$ptr@0 (+ call18169formal@$ret@0 (* 4 call18140formal@$val@0)))) (and
(! (or %lbl%@45646 (inRo call18176formal@$ptr@0 4)) :lblneg @45646)
(=> (inRo call18176formal@$ptr@0 4) (=> (and
(word call18176formal@$val@0)
(= call18176formal@$val@0 (ro32 call18176formal@$ptr@0))) (and
(! (or %lbl%@45677 (inRo call18176formal@$val@0 4)) :lblneg @45677)
(=> (inRo call18176formal@$val@0 4) (=> (and
(word call18179formal@$val@0)
(= call18179formal@$val@0 (ro32 call18176formal@$val@0))
(= call18182formal@$ret@0 ?CodeBaseStartTable)
(= call18189formal@$ptr@0 (+ call18182formal@$ret@0 (* 4 call18140formal@$val@0)))) (and
(! (or %lbl%@45742 (inRo call18189formal@$ptr@0 4)) :lblneg @45742)
(=> (inRo call18189formal@$ptr@0 4) (=> (word call18189formal@$val@0) (=> (and
(= call18189formal@$val@0 (ro32 call18189formal@$ptr@0))
(= call18193formal@$ptr@0 (+ esp@0@@0 0))) (and
(! (or %lbl%@45782 (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @45782)
(=> (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@45810 (sAddr call18193formal@$ptr@0)) :lblneg @45810)
(=> (sAddr call18193formal@$ptr@0) (=> (and
(= (select $Mem@3 call18193formal@$ptr@0) (select $sMem@3 call18193formal@$ptr@0))
(= call18198formal@$ptr@0 (+ esp@0@@0 0))) (and
(! (or %lbl%@45834 (PtrOk call18198formal@$ptr@0)) :lblneg @45834)
(=> (PtrOk call18198formal@$ptr@0) (=> (and
(word call18198formal@$val@0)
(= call18198formal@$val@0 (select $Mem@3 call18198formal@$ptr@0))) (and
(! (or %lbl%@45862 (TO 0)) :lblneg @45862)
(=> (TO 0) (and
(! (or %lbl%@45868 (inRo call18166formal@$val@0 4)) :lblneg @45868)
(=> (inRo call18166formal@$val@0 4) (=> (and
(word call18205formal@$val@0)
(= call18205formal@$val@0 (ro32 call18166formal@$val@0))
(= call18212formal@$x@0 (OpnReg call18189formal@$val@0))
(= call18212formal@$y@0 (OpnReg call18198formal@$val@0))) (and
(! (or %lbl%@45915 (OpnOk $Mem@3 call18212formal@$x@0)) :lblneg @45915)
(=> (OpnOk $Mem@3 call18212formal@$x@0) (and
(! (or %lbl%@45919 (OpnOk $Mem@3 call18212formal@$y@0)) :lblneg @45919)
(=> (OpnOk $Mem@3 call18212formal@$y@0) (=> (FlagsCmp $Efl@21@@0 (EvalOpn $Mem@3 call18212formal@$x@0) (EvalOpn $Mem@3 call18212formal@$y@0)) (and
anon8_Then_correct
anon8_Else_correct)))))))))))))))))))))))))))))))))))))
(let ((anon7_Then_correct (=> (! (and %lbl%+18391 true) :lblpos +18391) (=> (Jbe $Efl@9) (and
(! (or %lbl%@45329 (word (+ esp@0@@0 28))) :lblneg @45329)
(=> (word (+ esp@0@@0 28)) (=> (and
(= call18361formal@$ret@0 (+ esp@0@@0 28))
(= call18376formal@$oldMem@0 $Mem@@2)
(= call18376formal@$oldSMem@0 $sMem@@5)
(= call18376formal@$oldDMem@0 $dMem@@0)
(= call18376formal@$oldPciMem@0 $pciMem@@4)
(= call18376formal@$oldTMem@0 $tMems@@12)
(= call18376formal@$oldFMem@0 $fMems@@4)
(= call18376formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@45411 (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @45411)
(=> (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@45439 (MemInv call18376formal@$oldMem@0 call18376formal@$oldSMem@0 call18376formal@$oldDMem@0 call18376formal@$oldPciMem@0 call18376formal@$oldTMem@0 call18376formal@$oldFMem@0 call18376formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @45439)
(=> (MemInv call18376formal@$oldMem@0 call18376formal@$oldSMem@0 call18376formal@$oldDMem@0 call18376formal@$oldPciMem@0 call18376formal@$oldTMem@0 call18376formal@$oldFMem@0 call18376formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@45462 (= (select $sMem@3 call18361formal@$ret@0) (select call18376formal@$oldSMem@0 call18361formal@$ret@0))) :lblneg @45462)
(=> (= (select $sMem@3 call18361formal@$ret@0) (select call18376formal@$oldSMem@0 call18361formal@$ret@0)) (and
(! (or %lbl%@45472 (sAddr call18361formal@$ret@0)) :lblneg @45472)
(=> (sAddr call18361formal@$ret@0) (=> (= (select $Mem@3 call18361formal@$ret@0) (select call18376formal@$oldMem@0 call18361formal@$ret@0)) (=> (and
(= (select $Mem@3 call18361formal@$ret@0) (select $sMem@3 call18361formal@$ret@0))
(= call18379formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@45502 (= (ReturnToAddr (select $Mem@3 call18361formal@$ret@0)) call18379formal@$oldRA@0)) :lblneg @45502)
(=> (= (ReturnToAddr (select $Mem@3 call18361formal@$ret@0)) call18379formal@$oldRA@0) (and
(! (or %lbl%@45511 (Aligned call18361formal@$ret@0)) :lblneg @45511)
(=> (Aligned call18361formal@$ret@0) (=> (= esp@1@@0 (+ call18361formal@$ret@0 4)) (=> (and
(Aligned esp@1@@0)
(= eax@2 call18140formal@$val@0)) (=> (and
(= $sMem@8 $sMem@3)
(= $Mem@9 $Mem@3)
(= edx@2 edx@0@@0)
(= esp@6 esp@1@@0)) GeneratedUnifiedExit_correct@@0))))))))))))))))))))))))
(let ((loop_correct@@0 (=> (! (and %lbl%+18390 true) :lblpos +18390) (=> (and
(= edx@0@@0 0)
(<= 0 $beat__stackvar__8_esp__table@0)
(= $beat__stackvar__24_esp__tmp2@0 (select $sMem@3 (+ esp@0@@0 24)))
(= $beat__stackvar__20_esp__tmp1@0 (select $sMem@3 (+ esp@0@@0 20)))) (=> (and
(= $beat__stackvar__16_esp__tableBase@0 (select $sMem@3 (+ esp@0@@0 16)))
(= $beat__stackvar__12_esp__index@1 (select $sMem@3 (+ esp@0@@0 12)))
(= $beat__stackvar__8_esp__table@0 (select $sMem@3 (+ esp@0@@0 8)))
(= edx (select $sMem@3 (+ esp@0@@0 4)))
(= ecx (select $sMem@3 (+ esp@0@@0 0)))
(TVFT $f)
(TT $beat__stackvar__8_esp__table@0)
(<= 0 $beat__stackvar__8_esp__table@0)
(= edx@0@@0 0)
(not (exists ((t@@9 Int) (j@@47 Int) ) (! (and
(TT t@@9)
(TO j@@47)
(< t@@9 $beat__stackvar__8_esp__table@0)
(RetAddrAt t@@9 j@@47 ecx))
 :qid |Commonbp.122:19|
 :skolemid |223|
 :pattern ( (TT t@@9) (TO j@@47))
)))
(word $beat__stackvar__8_esp__table@0)
(word ecx)
(SMemInv $sMem@3 $sMem@@5 (+ esp@0@@0 28) esp)
(MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(= ecx $ra)
(= call18135formal@$ptr@0 (+ esp@0@@0 8))) (and
(! (or %lbl%@45169 (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @45169)
(=> (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@45197 (sAddr call18135formal@$ptr@0)) :lblneg @45197)
(=> (sAddr call18135formal@$ptr@0) (=> (and
(= (select $Mem@3 call18135formal@$ptr@0) (select $sMem@3 call18135formal@$ptr@0))
(= call18140formal@$ptr@0 (+ esp@0@@0 8))) (and
(! (or %lbl%@45221 (PtrOk call18140formal@$ptr@0)) :lblneg @45221)
(=> (PtrOk call18140formal@$ptr@0) (=> (word call18140formal@$val@0) (=> (and
(= call18140formal@$val@0 (select $Mem@3 call18140formal@$ptr@0))
(= call18143formal@$ret@0 ?CallSiteTableCount)
(= call18150formal@$x@0 (OpnReg call18143formal@$ret@0))
(= call18150formal@$y@0 (OpnReg call18140formal@$val@0))) (and
(! (or %lbl%@45289 (OpnOk $Mem@3 call18150formal@$x@0)) :lblneg @45289)
(=> (OpnOk $Mem@3 call18150formal@$x@0) (and
(! (or %lbl%@45293 (OpnOk $Mem@3 call18150formal@$y@0)) :lblneg @45293)
(=> (OpnOk $Mem@3 call18150formal@$y@0) (=> (FlagsCmp $Efl@9 (EvalOpn $Mem@3 call18150formal@$x@0) (EvalOpn $Mem@3 call18150formal@$y@0)) (and
anon7_Then_correct
anon7_Else_correct))))))))))))))))))))
(let ((anon0_correct@@2 (=> (! (and %lbl%+18383 true) :lblpos +18383) (=> (and
(forall ((q@abs@@8 Int) (vt@@12 Int) ) (! (=> (VTable q@abs@@8 vt@@12) (and
(inRo (+ vt@@12 ?VT_MASK) 4)
(inRo (+ vt@@12 ?VT_BASE_LENGTH) 4)
(inRo (+ vt@@12 ?VT_ARRAY_ELEMENT_SIZE) 4)
(inRo (+ vt@@12 ?VT_ARRAY_ELEMENT_CLASS) 4)
(inRo (+ vt@@12 ?VT_ARRAY_OF) 4)))
 :qid |Bartokib.309:17|
 :skolemid |162|
 :pattern ( (TVT q@abs@@8 vt@@12))
))
(forall ((l@@5 T@$FrameLayout) (j@@48 Int) ) (! (and
(inFrame l@@5 0)
(not (frameHasPtr l@@5 0))
(inFrame l@@5 1)
(not (frameHasPtr l@@5 1))
(=> (and
(TO j@@48)
(frameHasPtr l@@5 j@@48)) (inFrame l@@5 j@@48))
(=> (and
(TO j@@48)
(getBit (frameDescriptor l@@5) 0)
(not (getBit (frameDescriptor l@@5) 1))
(= (q@and (shr (frameDescriptor l@@5) 6) 1023) 0)) (and
(between 0 16 (frameLayoutArgs l@@5))
(= (frameLayoutArgs l@@5) (q@and (shr (frameDescriptor l@@5) 2) 15))
(=> (frameHasPtr l@@5 j@@48) (and
(<= 0 (- (+ (frameLayoutArgs l@@5) 1) j@@48))
(< (- (- (frameLayoutArgs l@@5) 1) j@@48) 16)))
(=> (and
(<= 0 (- (+ (frameLayoutArgs l@@5) 1) j@@48))
(< (- (- (frameLayoutArgs l@@5) 1) j@@48) 16)) (and
(=> (>= j@@48 2) (= (frameHasPtr l@@5 j@@48) (getBit (frameDescriptor l@@5) (- (+ (+ 16 (frameLayoutArgs l@@5)) 1) j@@48))))
(=> (< j@@48 0) (= (frameHasPtr l@@5 j@@48) (getBit (frameDescriptor l@@5) (- (- (+ 16 (frameLayoutArgs l@@5)) 1) j@@48))))))))
(=> (and
(TO j@@48)
(not (getBit (frameDescriptor l@@5) 0))) (inRo (frameDescriptor l@@5) 4))
(=> (and
(TO j@@48)
(not (getBit (frameDescriptor l@@5) 0))
(= (ro32 (frameDescriptor l@@5)) 4096)
(inFrame l@@5 j@@48)) (and
(inRo (+ (frameDescriptor l@@5) 4) 1)
(inRo (+ (+ (frameDescriptor l@@5) 6) (frameFieldToSlot l@@5 j@@48)) 1)
(= j@@48 (roS8 (+ (+ (frameDescriptor l@@5) 6) (frameFieldToSlot l@@5 j@@48))))
(= (frameHasPtr l@@5 j@@48) (between 0 (roU8 (+ (frameDescriptor l@@5) 4)) (frameFieldToSlot l@@5 j@@48))))))
 :qid |Bartokib.316:17|
 :skolemid |163|
 :pattern ( (TVF l@@5) (TO j@@48))
))) (=> (and
(forall ((l@@6 T@$FrameLayout) (k@@1 Int) ) (! (=> (and
(TSlot k@@1)
(not (getBit (frameDescriptor l@@6) 0))
(= (ro32 (frameDescriptor l@@6)) 4096)
(between 0 (roU8 (+ (frameDescriptor l@@6) 4)) k@@1)) (and
(inFrame l@@6 (roS8 (+ (+ (frameDescriptor l@@6) 6) k@@1)))
(= k@@1 (frameFieldToSlot l@@6 (roS8 (+ (+ (frameDescriptor l@@6) 6) k@@1))))))
 :qid |Bartokib.337:17|
 :skolemid |164|
 :pattern ( (TVF l@@6) (TSlot k@@1))
))
(forall ((s@@8 Int) (j@@49 Int) ) (! (=> (and
(<= 0 s@@8)
(< s@@8 ?SectionCount)
(<= 0 j@@49)) (and
(inRo (+ ?DataSectionBase (* 4 s@@8)) 4)
(inRo (+ ?DataSectionEnd (* 4 s@@8)) 4)
(inRo (+ ?StaticDataPointerBitMap (* 4 s@@8)) 4)
(=> (< (+ (sectionBase s@@8) (* 4 j@@49)) (sectionEnd s@@8)) (and
(inSectionData (+ (ro32 (+ ?DataSectionBase (* 4 s@@8))) (* 4 j@@49)))
(inRo (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@8))) (* 4 (shr j@@49 5))) 4)
(< (q@and j@@49 31) 32)
(= (sectionHasPtr s@@8 j@@49) (getBit (ro32 (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@8))) (* 4 (shr j@@49 5)))) (q@and j@@49 31)))))))
 :qid |Bartokib.342:17|
 :skolemid |165|
 :pattern ( (TVS s@@8 j@@49))
))
(forall ((f@@18 Int) ) (! (forall ((t@@10 Int) ) (! (=> (TT t@@10) (=> (and
(<= 0 t@@10)
(< t@@10 ?CallSiteTableCount)) (and
(inRo (+ ?CodeBaseStartTable (* 4 t@@10)) 4)
(inRo (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@10)) 4)
(inRo (+ ?CallSiteSetCount (* 4 t@@10)) 4)
(inRo (ro32 (+ ?CallSiteSetCount (* 4 t@@10))) 4)
(inRo (+ ?CallSiteSetNumberToIndex (* 4 t@@10)) 4)
(inRo (+ ?ActivationDescriptorTable (* 4 t@@10)) 4)
(forall ((j@@50 Int) ) (! (=> (TO j@@50) (=> (and
(<= 0 j@@50)
(<= j@@50 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@10)))))) (and
(inRo (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@10))) (* 4 j@@50)) 4)
(inRo (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@10))) (* 2 j@@50)) 2)
(inRo (+ (ro32 (+ ?ActivationDescriptorTable (* 4 t@@10))) (* 4 (roU16 (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@10))) (* 2 j@@50))))) 4))))
 :qid |Bartokib.355:340|
 :skolemid |166|
 :pattern ( (TO j@@50))
)))))
 :qid |Bartokib.355:41|
 :skolemid |167|
 :pattern ( (TT t@@10))
))
 :qid |Bartokib.355:17|
 :skolemid |168|
 :pattern ( (TVFT f@@18))
))
(forall ((f@@19 Int) ) (! (forall ((t@@11 Int) (j1@@3 Int) (j2@@3 Int) ) (! (=> (and
(TT t@@11)
(TO j1@@3)
(TO j2@@3)) (=> (and
(<= 0 t@@11)
(< t@@11 ?CallSiteTableCount)
(<= 0 j1@@3)
(< j1@@3 j2@@3)
(<= j2@@3 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@11)))))) (< (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@11))) (* 4 j1@@3))) (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@11))) (* 4 j2@@3))))))
 :qid |Bartokib.372:41|
 :skolemid |169|
 :pattern ( (TT t@@11) (TO j1@@3) (TO j2@@3))
))
 :qid |Bartokib.372:17|
 :skolemid |170|
 :pattern ( (TVFT f@@19))
))) (and
(! (or %lbl%@44128 (and
(TV esp)
(TO (- 0 7))
(TO (- 0 6))
(TO (- 0 5))
(TO (- 0 4))
(TO (- 0 3))
(TO (- 0 2))
(TO (- 0 1)))) :lblneg @44128)
(=> (and
(TV esp)
(TO (- 0 7))
(TO (- 0 6))
(TO (- 0 5))
(TO (- 0 4))
(TO (- 0 3))
(TO (- 0 2))
(TO (- 0 1))) (and
(! (or %lbl%@44208 (word (- esp 28))) :lblneg @44208)
(=> (word (- esp 28)) (=> (and
(= call17909formal@$ret@0 (- esp 28))
(= call17918formal@$ptr@0 (+ call17909formal@$ret@0 0))) (and
(! (or %lbl%@44253 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @44253)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@44283 (sAddr call17918formal@$ptr@0)) :lblneg @44283)
(=> (sAddr call17918formal@$ptr@0) (=> (MemInv (store $Mem@@2 call17918formal@$ptr@0 ecx) $sMem@0 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0 (store $sMem@@5 call17918formal@$ptr@0 ecx))
(= call17923formal@$ptr@0 (+ call17909formal@$ret@0 0))) (and
(! (or %lbl%@44347 (PtrOk call17923formal@$ptr@0)) :lblneg @44347)
(=> (PtrOk call17923formal@$ptr@0) (and
(! (or %lbl%@44350 (word ecx)) :lblneg @44350)
(=> (word ecx) (=> (and
(= $Mem@0 (store $Mem@@2 call17923formal@$ptr@0 ecx))
(= call17932formal@$ptr@0 (+ call17909formal@$ret@0 4))) (and
(! (or %lbl%@44394 (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @44394)
(=> (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@44422 (sAddr call17932formal@$ptr@0)) :lblneg @44422)
(=> (sAddr call17932formal@$ptr@0) (=> (MemInv (store $Mem@0 call17932formal@$ptr@0 edx) $sMem@1 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@1 (store $sMem@0 call17932formal@$ptr@0 edx))
(= call17937formal@$ptr@0 (+ call17909formal@$ret@0 4))) (and
(! (or %lbl%@44484 (PtrOk call17937formal@$ptr@0)) :lblneg @44484)
(=> (PtrOk call17937formal@$ptr@0) (and
(! (or %lbl%@44487 (word edx)) :lblneg @44487)
(=> (word edx) (=> (and
(= $Mem@1 (store $Mem@0 call17937formal@$ptr@0 edx))
(= call17946formal@$ptr@0 (+ call17909formal@$ret@0 8))) (and
(! (or %lbl%@44530 (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @44530)
(=> (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@44558 (sAddr call17946formal@$ptr@0)) :lblneg @44558)
(=> (sAddr call17946formal@$ptr@0) (=> (MemInv (store $Mem@1 call17946formal@$ptr@0 0) $sMem@2 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@2 (store $sMem@1 call17946formal@$ptr@0 0))
(= call17951formal@$ptr@0 (+ call17909formal@$ret@0 8))) (and
(! (or %lbl%@44620 (PtrOk call17951formal@$ptr@0)) :lblneg @44620)
(=> (PtrOk call17951formal@$ptr@0) (and
(! (or %lbl%@44623 (word 0)) :lblneg @44623)
(=> (word 0) (=> (and
(= $Mem@2 (store $Mem@1 call17951formal@$ptr@0 0))
(= $beat__stackvar__12_esp__index@0 (select $sMem@2 (+ call17909formal@$ret@0 12)))) (=> (and
(= $beat__stackvar__16_esp__tableBase@0 (select $sMem@2 (+ call17909formal@$ret@0 16)))
(= $beat__stackvar__20_esp__tmp1@0 (select $sMem@2 (+ call17909formal@$ret@0 20)))
(= $beat__stackvar__24_esp__tmp2@0 (select $sMem@2 (+ call17909formal@$ret@0 24)))
(= call17986formal@$ret@0 0)) (and
(! (or %lbl%@44727 (= $beat__stackvar__24_esp__tmp2@0 (select $sMem@2 (+ call17909formal@$ret@0 24)))) :lblneg @44727)
(=> (= $beat__stackvar__24_esp__tmp2@0 (select $sMem@2 (+ call17909formal@$ret@0 24))) (and
(! (or %lbl%@44738 (= $beat__stackvar__20_esp__tmp1@0 (select $sMem@2 (+ call17909formal@$ret@0 20)))) :lblneg @44738)
(=> (= $beat__stackvar__20_esp__tmp1@0 (select $sMem@2 (+ call17909formal@$ret@0 20))) (and
(! (or %lbl%@44749 (= $beat__stackvar__16_esp__tableBase@0 (select $sMem@2 (+ call17909formal@$ret@0 16)))) :lblneg @44749)
(=> (= $beat__stackvar__16_esp__tableBase@0 (select $sMem@2 (+ call17909formal@$ret@0 16))) (and
(! (or %lbl%@44760 (= $beat__stackvar__12_esp__index@0 (select $sMem@2 (+ call17909formal@$ret@0 12)))) :lblneg @44760)
(=> (= $beat__stackvar__12_esp__index@0 (select $sMem@2 (+ call17909formal@$ret@0 12))) (and
(! (or %lbl%@44771 (= 0 (select $sMem@2 (+ call17909formal@$ret@0 8)))) :lblneg @44771)
(=> (= 0 (select $sMem@2 (+ call17909formal@$ret@0 8))) (and
(! (or %lbl%@44782 (= edx (select $sMem@2 (+ call17909formal@$ret@0 4)))) :lblneg @44782)
(=> (= edx (select $sMem@2 (+ call17909formal@$ret@0 4))) (and
(! (or %lbl%@44793 (= ecx (select $sMem@2 (+ call17909formal@$ret@0 0)))) :lblneg @44793)
(=> (= ecx (select $sMem@2 (+ call17909formal@$ret@0 0))) (and
(! (or %lbl%@44804 (TVFT $f)) :lblneg @44804)
(=> (TVFT $f) (and
(! (or %lbl%@44808 (and
(TT 0)
(<= 0 0))) :lblneg @44808)
(=> (and
(TT 0)
(<= 0 0)) (and
(! (or %lbl%@44818 (= call17986formal@$ret@0 0)) :lblneg @44818)
(=> (= call17986formal@$ret@0 0) (and
(! (or %lbl%@44823 (not (exists ((t@@12 Int) (j@@51 Int) ) (! (and
(TT t@@12)
(TO j@@51)
(< t@@12 0)
(RetAddrAt t@@12 j@@51 ecx))
 :qid |Commonbp.122:19|
 :skolemid |223|
 :pattern ( (TT t@@12) (TO j@@51))
)))) :lblneg @44823)
(=> (not (exists ((t@@13 Int) (j@@52 Int) ) (! (and
(TT t@@13)
(TO j@@52)
(< t@@13 0)
(RetAddrAt t@@13 j@@52 ecx))
 :qid |Commonbp.122:19|
 :skolemid |223|
 :pattern ( (TT t@@13) (TO j@@52))
))) (and
(! (or %lbl%@44863 (and
(word 0)
(word ecx))) :lblneg @44863)
(=> (and
(word 0)
(word ecx)) (and
(! (or %lbl%@44871 (SMemInv $sMem@2 $sMem@@5 (+ call17909formal@$ret@0 28) esp)) :lblneg @44871)
(=> (SMemInv $sMem@2 $sMem@@5 (+ call17909formal@$ret@0 28) esp) (and
(! (or %lbl%@44881 (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @44881)
(=> (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@44909 (= ecx $ra)) :lblneg @44909)
(=> (= ecx $ra) loop_correct@@0))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@2 (=> (! (and %lbl%+42152 true) :lblpos +42152) (=> (and
(= ecx $ra)
(= edx $nextFp)) (=> (and
(word $ra)
(word $nextFp)
(FrameNextInv $f $ra $nextFp (select $FrameAddrs@@1 $s@@21) (select $FrameLayouts@@1 $s@@21))
(MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 104 $sMem@@5 esp $RET@@0)) anon0_correct@@2)))))
PreconditionGeneratedEntry_correct@@2)))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+19029 () Bool)
(declare-fun %lbl%@52608 () Bool)
(declare-fun eax@0 () Int)
(declare-fun $abs () Int)
(declare-fun %lbl%@52619 () Bool)
(declare-fun %lbl%+18958 () Bool)
(declare-fun $Efl@3 () Int)
(declare-fun call18602formal@$ptr@0 () Int)
(declare-fun %lbl%@50219 () Bool)
(declare-fun call18602formal@$val@0 () Int)
(declare-fun %lbl%+18969 () Bool)
(declare-fun $Efl@5 () Int)
(declare-fun call18623formal@$ptr@0 () Int)
(declare-fun %lbl%@50384 () Bool)
(declare-fun call18623formal@$val@0 () Int)
(declare-fun %lbl%+18980 () Bool)
(declare-fun $Efl@6@@0 () Int)
(declare-fun %lbl%@50479 () Bool)
(declare-fun call18647formal@$ptr@0 () Int)
(declare-fun %lbl%@50495 () Bool)
(declare-fun %lbl%@50525 () Bool)
(declare-fun %lbl%@50528 () Bool)
(declare-fun call18652formal@$ptr@0 () Int)
(declare-fun %lbl%@50562 () Bool)
(declare-fun call18652formal@$val@0 () Int)
(declare-fun call18655formal@$ret@0 () Int)
(declare-fun call18659formal@$ret@0 () Int)
(declare-fun call18663formal@$ret@0 () Int)
(declare-fun call18666formal@$ret@0 () Int)
(declare-fun call18669formal@$ret@0 () Int)
(declare-fun call18673formal@$ret@0 () Int)
(declare-fun %lbl%+18991 () Bool)
(declare-fun $Efl@8 () Int)
(declare-fun %lbl%@50820 () Bool)
(declare-fun call18697formal@$ptr@0 () Int)
(declare-fun %lbl%@50836 () Bool)
(declare-fun %lbl%@50866 () Bool)
(declare-fun %lbl%@50869 () Bool)
(declare-fun call18702formal@$ptr@0 () Int)
(declare-fun %lbl%@50903 () Bool)
(declare-fun call18702formal@$val@0 () Int)
(declare-fun call18707formal@$ptr@0 () Int)
(declare-fun %lbl%@50944 () Bool)
(declare-fun call18707formal@$val@0 () Int)
(declare-fun call18711formal@$ret@0 () Int)
(declare-fun call18715formal@$ret@0 () Int)
(declare-fun call18719formal@$ret@0 () Int)
(declare-fun call18723formal@$ret@0 () Int)
(declare-fun call18726formal@$ret@0 () Int)
(declare-fun call18729formal@$ret@0 () Int)
(declare-fun call18733formal@$ret@0 () Int)
(declare-fun %lbl%+19002 () Bool)
(declare-fun $Efl@16 () Int)
(declare-fun %lbl%@51245 () Bool)
(declare-fun call18757formal@$ptr@0 () Int)
(declare-fun %lbl%@51261 () Bool)
(declare-fun %lbl%@51291 () Bool)
(declare-fun %lbl%@51294 () Bool)
(declare-fun call18762formal@$ptr@0 () Int)
(declare-fun %lbl%@51328 () Bool)
(declare-fun call18762formal@$val@0 () Int)
(declare-fun call18767formal@$ptr@0 () Int)
(declare-fun %lbl%@51369 () Bool)
(declare-fun call18767formal@$val@0 () Int)
(declare-fun call18772formal@$ptr@0 () Int)
(declare-fun %lbl%@51410 () Bool)
(declare-fun call18772formal@$val@0 () Int)
(declare-fun call18775formal@$ret@0 () Int)
(declare-fun call18778formal@$ret@0 () Int)
(declare-fun call18783formal@$ret@0 () Int)
(declare-fun call18787formal@$ret@0 () Int)
(declare-fun call18791formal@$ret@0 () Int)
(declare-fun call18794formal@$ret@0 () Int)
(declare-fun call18797formal@$ret@0 () Int)
(declare-fun call18801formal@$ret@0 () Int)
(declare-fun %lbl%+19013 () Bool)
(declare-fun $Efl@26@@0 () Int)
(declare-fun %lbl%@51739 () Bool)
(declare-fun call18825formal@$ptr@0 () Int)
(declare-fun %lbl%@51755 () Bool)
(declare-fun %lbl%@51785 () Bool)
(declare-fun %lbl%@51788 () Bool)
(declare-fun call18830formal@$ptr@0 () Int)
(declare-fun %lbl%@51822 () Bool)
(declare-fun call18830formal@$val@0 () Int)
(declare-fun call18835formal@$ptr@0 () Int)
(declare-fun %lbl%@51863 () Bool)
(declare-fun call18835formal@$val@0 () Int)
(declare-fun call18839formal@$ret@0 () Int)
(declare-fun call18843formal@$ret@0 () Int)
(declare-fun call18847formal@$ret@0 () Int)
(declare-fun call18851formal@$ret@0 () Int)
(declare-fun call18854formal@$ret@0 () Int)
(declare-fun call18857formal@$ret@0 () Int)
(declare-fun call18861formal@$ret@0 () Int)
(declare-fun %lbl%+19024 () Bool)
(declare-fun $Efl@38 () Int)
(declare-fun %lbl%@52150 () Bool)
(declare-fun call18885formal@$ptr@0 () Int)
(declare-fun %lbl%@52166 () Bool)
(declare-fun %lbl%@52196 () Bool)
(declare-fun %lbl%@52199 () Bool)
(declare-fun call18890formal@$ptr@0 () Int)
(declare-fun %lbl%@52233 () Bool)
(declare-fun call18890formal@$val@0 () Int)
(declare-fun call18895formal@$ptr@0 () Int)
(declare-fun %lbl%@52274 () Bool)
(declare-fun call18895formal@$val@0 () Int)
(declare-fun call18900formal@$ptr@0 () Int)
(declare-fun %lbl%@52315 () Bool)
(declare-fun call18900formal@$val@0 () Int)
(declare-fun call18903formal@$ret@0 () Int)
(declare-fun call18906formal@$ret@0 () Int)
(declare-fun call18911formal@$ret@0 () Int)
(declare-fun call18915formal@$ret@0 () Int)
(declare-fun call18919formal@$ret@0 () Int)
(declare-fun call18922formal@$ret@0 () Int)
(declare-fun call18925formal@$ret@0 () Int)
(declare-fun call18929formal@$ret@0 () Int)
(declare-fun %lbl%+19022 () Bool)
(declare-fun call18937formal@$ptr@0 () Int)
(declare-fun %lbl%@52116 () Bool)
(declare-fun call18937formal@$val@0 () Int)
(declare-fun %lbl%+19011 () Bool)
(declare-fun call18871formal@$x@0 () T@opn)
(declare-fun call18584formal@$ret@0 () Int)
(declare-fun call18871formal@$y@0 () T@opn)
(declare-fun %lbl%@51698 () Bool)
(declare-fun %lbl%@51703 () Bool)
(declare-fun %lbl%+19000 () Bool)
(declare-fun call18811formal@$x@0 () T@opn)
(declare-fun call18811formal@$y@0 () T@opn)
(declare-fun %lbl%@51204 () Bool)
(declare-fun %lbl%@51209 () Bool)
(declare-fun %lbl%+18989 () Bool)
(declare-fun call18743formal@$x@0 () T@opn)
(declare-fun call18743formal@$y@0 () T@opn)
(declare-fun %lbl%@50779 () Bool)
(declare-fun %lbl%@50784 () Bool)
(declare-fun %lbl%+18978 () Bool)
(declare-fun call18683formal@$x@0 () T@opn)
(declare-fun call18683formal@$y@0 () T@opn)
(declare-fun %lbl%@50438 () Bool)
(declare-fun %lbl%@50443 () Bool)
(declare-fun %lbl%+18967 () Bool)
(declare-fun call18633formal@$x@0 () T@opn)
(declare-fun call18633formal@$y@0 () T@opn)
(declare-fun %lbl%@50331 () Bool)
(declare-fun %lbl%@50336 () Bool)
(declare-fun %lbl%+18956 () Bool)
(declare-fun call18612formal@$x@0 () T@opn)
(declare-fun call18612formal@$y@0 () T@opn)
(declare-fun %lbl%@50273 () Bool)
(declare-fun %lbl%@50278 () Bool)
(declare-fun %lbl%+18955 () Bool)
(declare-fun %lbl%@50066 () Bool)
(declare-fun %lbl%@50070 () Bool)
(declare-fun $vt () Int)
(declare-fun call18580formal@$ptr@0 () Int)
(declare-fun %lbl%@50088 () Bool)
(declare-fun call18580formal@$val@0 () Int)
(declare-fun call18591formal@$x@0 () T@opn)
(declare-fun call18591formal@$y@0 () T@opn)
(declare-fun %lbl%@50166 () Bool)
(declare-fun %lbl%@50171 () Bool)
(declare-fun %lbl%+47904 () Bool)
(declare-fun $ptr () Int)
(declare-fun $_nElems1 () Int)
(declare-fun $_nElems2 () Int)
(push 1)
(set-info :boogie-vc-id getSize)
(assert (not
(let ((end_correct (=> (! (and %lbl%+19029 true) :lblpos +19029) (and
(! (or %lbl%@52608 (= eax@0 (* 4 (numFields $abs)))) :lblneg @52608)
(=> (= eax@0 (* 4 (numFields $abs))) (and
(! (or %lbl%@52619 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @52619)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) true)))))))
(let ((anon15_Else_correct (=> (! (and %lbl%+18958 true) :lblpos +18958) (=> (and
(not (Jne $Efl@3))
(= call18602formal@$ptr@0 (+ edx ?VT_BASE_LENGTH))) (and
(! (or %lbl%@50219 (inRo call18602formal@$ptr@0 4)) :lblneg @50219)
(=> (inRo call18602formal@$ptr@0 4) (=> (word call18602formal@$val@0) (=> (and
(= call18602formal@$val@0 (ro32 call18602formal@$ptr@0))
(= eax@0 call18602formal@$val@0)) end_correct))))))))
(let ((anon16_Else_correct (=> (! (and %lbl%+18969 true) :lblpos +18969) (=> (and
(not (Jne $Efl@5))
(= call18623formal@$ptr@0 (+ edx ?VT_BASE_LENGTH))) (and
(! (or %lbl%@50384 (inRo call18623formal@$ptr@0 4)) :lblneg @50384)
(=> (inRo call18623formal@$ptr@0 4) (=> (word call18623formal@$val@0) (=> (and
(= call18623formal@$val@0 (ro32 call18623formal@$ptr@0))
(= eax@0 call18623formal@$val@0)) end_correct))))))))
(let ((anon17_Else_correct (=> (! (and %lbl%+18980 true) :lblpos +18980) (=> (not (Jne $Efl@6@@0)) (and
(! (or %lbl%@50479 (TO 2)) :lblneg @50479)
(=> (TO 2) (=> (= call18647formal@$ptr@0 (+ ecx 8)) (and
(! (or %lbl%@50495 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @50495)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@50525 (gcAddr call18647formal@$ptr@0)) :lblneg @50525)
(=> (gcAddr call18647formal@$ptr@0) (and
(! (or %lbl%@50528 (TV call18647formal@$ptr@0)) :lblneg @50528)
(=> (TV call18647formal@$ptr@0) (=> (= (select $Mem@@2 call18647formal@$ptr@0) (select $gcMem@@4 call18647formal@$ptr@0)) (=> (and
(TV (select $Mem@@2 call18647formal@$ptr@0))
(= call18652formal@$ptr@0 (+ ecx 8))) (and
(! (or %lbl%@50562 (PtrOk call18652formal@$ptr@0)) :lblneg @50562)
(=> (PtrOk call18652formal@$ptr@0) (=> (word call18652formal@$val@0) (=> (and
(= call18652formal@$val@0 (select $Mem@@2 call18652formal@$ptr@0))
(= call18655formal@$ret@0 call18652formal@$val@0)
(word (+ call18655formal@$ret@0 call18655formal@$ret@0))
(= call18659formal@$ret@0 (+ call18655formal@$ret@0 call18655formal@$ret@0))) (=> (and
(word (+ call18659formal@$ret@0 19))
(= call18663formal@$ret@0 (+ call18659formal@$ret@0 19))
(= call18666formal@$ret@0 3)
(= call18669formal@$ret@0 (neg call18666formal@$ret@0))
(word call18669formal@$ret@0)
(= call18673formal@$ret@0 (q@and call18663formal@$ret@0 call18669formal@$ret@0))
(word call18673formal@$ret@0)
(= eax@0 call18673formal@$ret@0)) end_correct))))))))))))))))))))
(let ((anon18_Else_correct (=> (! (and %lbl%+18991 true) :lblpos +18991) (=> (not (Jne $Efl@8)) (and
(! (or %lbl%@50820 (TO 2)) :lblneg @50820)
(=> (TO 2) (=> (= call18697formal@$ptr@0 (+ ecx 8)) (and
(! (or %lbl%@50836 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @50836)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@50866 (gcAddr call18697formal@$ptr@0)) :lblneg @50866)
(=> (gcAddr call18697formal@$ptr@0) (and
(! (or %lbl%@50869 (TV call18697formal@$ptr@0)) :lblneg @50869)
(=> (TV call18697formal@$ptr@0) (=> (= (select $Mem@@2 call18697formal@$ptr@0) (select $gcMem@@4 call18697formal@$ptr@0)) (=> (and
(TV (select $Mem@@2 call18697formal@$ptr@0))
(= call18702formal@$ptr@0 (+ ecx 8))) (and
(! (or %lbl%@50903 (PtrOk call18702formal@$ptr@0)) :lblneg @50903)
(=> (PtrOk call18702formal@$ptr@0) (=> (word call18702formal@$val@0) (=> (and
(= call18702formal@$val@0 (select $Mem@@2 call18702formal@$ptr@0))
(= call18707formal@$ptr@0 (+ edx ?VT_BASE_LENGTH))) (and
(! (or %lbl%@50944 (inRo call18707formal@$ptr@0 4)) :lblneg @50944)
(=> (inRo call18707formal@$ptr@0 4) (=> (and
(word call18707formal@$val@0)
(= call18707formal@$val@0 (ro32 call18707formal@$ptr@0))
(word (+ call18702formal@$val@0 call18702formal@$val@0))
(= call18711formal@$ret@0 (+ call18702formal@$val@0 call18702formal@$val@0))
(word (+ call18711formal@$ret@0 call18711formal@$ret@0))
(= call18715formal@$ret@0 (+ call18711formal@$ret@0 call18711formal@$ret@0))
(word (+ call18707formal@$val@0 call18715formal@$ret@0))
(= call18719formal@$ret@0 (+ call18707formal@$val@0 call18715formal@$ret@0))
(word (+ call18719formal@$ret@0 3))
(= call18723formal@$ret@0 (+ call18719formal@$ret@0 3))
(= call18726formal@$ret@0 3)
(= call18729formal@$ret@0 (neg call18726formal@$ret@0))
(word call18729formal@$ret@0)
(= call18733formal@$ret@0 (q@and call18723formal@$ret@0 call18729formal@$ret@0))
(word call18733formal@$ret@0)
(= eax@0 call18733formal@$ret@0)) end_correct))))))))))))))))))))))
(let ((anon19_Else_correct@@0 (=> (! (and %lbl%+19002 true) :lblpos +19002) (=> (not (Jne $Efl@16)) (and
(! (or %lbl%@51245 (TO 2)) :lblneg @51245)
(=> (TO 2) (=> (= call18757formal@$ptr@0 (+ ecx 8)) (and
(! (or %lbl%@51261 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @51261)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@51291 (gcAddr call18757formal@$ptr@0)) :lblneg @51291)
(=> (gcAddr call18757formal@$ptr@0) (and
(! (or %lbl%@51294 (TV call18757formal@$ptr@0)) :lblneg @51294)
(=> (TV call18757formal@$ptr@0) (=> (= (select $Mem@@2 call18757formal@$ptr@0) (select $gcMem@@4 call18757formal@$ptr@0)) (=> (and
(TV (select $Mem@@2 call18757formal@$ptr@0))
(= call18762formal@$ptr@0 (+ ecx 8))) (and
(! (or %lbl%@51328 (PtrOk call18762formal@$ptr@0)) :lblneg @51328)
(=> (PtrOk call18762formal@$ptr@0) (=> (word call18762formal@$val@0) (=> (and
(= call18762formal@$val@0 (select $Mem@@2 call18762formal@$ptr@0))
(= call18767formal@$ptr@0 (+ edx ?VT_BASE_LENGTH))) (and
(! (or %lbl%@51369 (inRo call18767formal@$ptr@0 4)) :lblneg @51369)
(=> (inRo call18767formal@$ptr@0 4) (=> (word call18767formal@$val@0) (=> (and
(= call18767formal@$val@0 (ro32 call18767formal@$ptr@0))
(= call18772formal@$ptr@0 (+ edx ?VT_ARRAY_ELEMENT_SIZE))) (and
(! (or %lbl%@51410 (inRo call18772formal@$ptr@0 4)) :lblneg @51410)
(=> (inRo call18772formal@$ptr@0 4) (=> (and
(word call18772formal@$val@0)
(= call18772formal@$val@0 (ro32 call18772formal@$ptr@0))) (=> (and
(= call18775formal@$ret@0 call18767formal@$val@0)
(= call18778formal@$ret@0 call18772formal@$val@0)
(word (* call18778formal@$ret@0 call18762formal@$val@0))
(word (Mult call18778formal@$ret@0 call18762formal@$val@0))
(= call18783formal@$ret@0 (* call18778formal@$ret@0 call18762formal@$val@0))
(= call18783formal@$ret@0 (Mult call18778formal@$ret@0 call18762formal@$val@0))
(word (+ call18783formal@$ret@0 call18775formal@$ret@0))
(= call18787formal@$ret@0 (+ call18783formal@$ret@0 call18775formal@$ret@0))
(word (+ call18787formal@$ret@0 3))
(= call18791formal@$ret@0 (+ call18787formal@$ret@0 3))
(= call18794formal@$ret@0 3)
(= call18797formal@$ret@0 (neg call18794formal@$ret@0))
(word call18797formal@$ret@0)
(= call18801formal@$ret@0 (q@and call18791formal@$ret@0 call18797formal@$ret@0))
(word call18801formal@$ret@0)
(= eax@0 call18801formal@$ret@0)) end_correct)))))))))))))))))))))))))))
(let ((anon20_Else_correct@@0 (=> (! (and %lbl%+19013 true) :lblpos +19013) (=> (not (Jne $Efl@26@@0)) (and
(! (or %lbl%@51739 (TO 3)) :lblneg @51739)
(=> (TO 3) (=> (= call18825formal@$ptr@0 (+ ecx 12)) (and
(! (or %lbl%@51755 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @51755)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@51785 (gcAddr call18825formal@$ptr@0)) :lblneg @51785)
(=> (gcAddr call18825formal@$ptr@0) (and
(! (or %lbl%@51788 (TV call18825formal@$ptr@0)) :lblneg @51788)
(=> (TV call18825formal@$ptr@0) (=> (= (select $Mem@@2 call18825formal@$ptr@0) (select $gcMem@@4 call18825formal@$ptr@0)) (=> (and
(TV (select $Mem@@2 call18825formal@$ptr@0))
(= call18830formal@$ptr@0 (+ ecx 12))) (and
(! (or %lbl%@51822 (PtrOk call18830formal@$ptr@0)) :lblneg @51822)
(=> (PtrOk call18830formal@$ptr@0) (=> (word call18830formal@$val@0) (=> (and
(= call18830formal@$val@0 (select $Mem@@2 call18830formal@$ptr@0))
(= call18835formal@$ptr@0 (+ edx ?VT_BASE_LENGTH))) (and
(! (or %lbl%@51863 (inRo call18835formal@$ptr@0 4)) :lblneg @51863)
(=> (inRo call18835formal@$ptr@0 4) (=> (and
(word call18835formal@$val@0)
(= call18835formal@$val@0 (ro32 call18835formal@$ptr@0))
(word (+ call18830formal@$val@0 call18830formal@$val@0))
(= call18839formal@$ret@0 (+ call18830formal@$val@0 call18830formal@$val@0))
(word (+ call18839formal@$ret@0 call18839formal@$ret@0))
(= call18843formal@$ret@0 (+ call18839formal@$ret@0 call18839formal@$ret@0))
(word (+ call18835formal@$val@0 call18843formal@$ret@0))
(= call18847formal@$ret@0 (+ call18835formal@$val@0 call18843formal@$ret@0))
(word (+ call18847formal@$ret@0 3))
(= call18851formal@$ret@0 (+ call18847formal@$ret@0 3))
(= call18854formal@$ret@0 3)
(= call18857formal@$ret@0 (neg call18854formal@$ret@0))
(word call18857formal@$ret@0)
(= call18861formal@$ret@0 (q@and call18851formal@$ret@0 call18857formal@$ret@0))
(word call18861formal@$ret@0)
(= eax@0 call18861formal@$ret@0)) end_correct))))))))))))))))))))))
(let ((anon21_Else_correct@@0 (=> (! (and %lbl%+19024 true) :lblpos +19024) (=> (not (Jne $Efl@38)) (and
(! (or %lbl%@52150 (TO 3)) :lblneg @52150)
(=> (TO 3) (=> (= call18885formal@$ptr@0 (+ ecx 12)) (and
(! (or %lbl%@52166 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @52166)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@52196 (gcAddr call18885formal@$ptr@0)) :lblneg @52196)
(=> (gcAddr call18885formal@$ptr@0) (and
(! (or %lbl%@52199 (TV call18885formal@$ptr@0)) :lblneg @52199)
(=> (TV call18885formal@$ptr@0) (=> (= (select $Mem@@2 call18885formal@$ptr@0) (select $gcMem@@4 call18885formal@$ptr@0)) (=> (and
(TV (select $Mem@@2 call18885formal@$ptr@0))
(= call18890formal@$ptr@0 (+ ecx 12))) (and
(! (or %lbl%@52233 (PtrOk call18890formal@$ptr@0)) :lblneg @52233)
(=> (PtrOk call18890formal@$ptr@0) (=> (word call18890formal@$val@0) (=> (and
(= call18890formal@$val@0 (select $Mem@@2 call18890formal@$ptr@0))
(= call18895formal@$ptr@0 (+ edx ?VT_BASE_LENGTH))) (and
(! (or %lbl%@52274 (inRo call18895formal@$ptr@0 4)) :lblneg @52274)
(=> (inRo call18895formal@$ptr@0 4) (=> (word call18895formal@$val@0) (=> (and
(= call18895formal@$val@0 (ro32 call18895formal@$ptr@0))
(= call18900formal@$ptr@0 (+ edx ?VT_ARRAY_ELEMENT_SIZE))) (and
(! (or %lbl%@52315 (inRo call18900formal@$ptr@0 4)) :lblneg @52315)
(=> (inRo call18900formal@$ptr@0 4) (=> (and
(word call18900formal@$val@0)
(= call18900formal@$val@0 (ro32 call18900formal@$ptr@0))) (=> (and
(= call18903formal@$ret@0 call18895formal@$val@0)
(= call18906formal@$ret@0 call18900formal@$val@0)
(word (* call18906formal@$ret@0 call18890formal@$val@0))
(word (Mult call18906formal@$ret@0 call18890formal@$val@0))
(= call18911formal@$ret@0 (* call18906formal@$ret@0 call18890formal@$val@0))
(= call18911formal@$ret@0 (Mult call18906formal@$ret@0 call18890formal@$val@0))
(word (+ call18911formal@$ret@0 call18903formal@$ret@0))
(= call18915formal@$ret@0 (+ call18911formal@$ret@0 call18903formal@$ret@0))
(word (+ call18915formal@$ret@0 3))
(= call18919formal@$ret@0 (+ call18915formal@$ret@0 3))
(= call18922formal@$ret@0 3)
(= call18925formal@$ret@0 (neg call18922formal@$ret@0))
(word call18925formal@$ret@0)
(= call18929formal@$ret@0 (q@and call18919formal@$ret@0 call18925formal@$ret@0))
(word call18929formal@$ret@0)
(= eax@0 call18929formal@$ret@0)) end_correct)))))))))))))))))))))))))))
(let ((anon21_Then_correct@@0 (=> (! (and %lbl%+19022 true) :lblpos +19022) (=> (and
(Jne $Efl@38)
(= call18937formal@$ptr@0 (+ edx ?VT_BASE_LENGTH))) (and
(! (or %lbl%@52116 (inRo call18937formal@$ptr@0 4)) :lblneg @52116)
(=> (inRo call18937formal@$ptr@0 4) (=> (word call18937formal@$val@0) (=> (and
(= call18937formal@$val@0 (ro32 call18937formal@$ptr@0))
(= eax@0 call18937formal@$val@0)) end_correct))))))))
(let ((anon20_Then_correct@@0 (=> (! (and %lbl%+19011 true) :lblpos +19011) (=> (Jne $Efl@26@@0) (=> (and
(= call18871formal@$x@0 (OpnReg call18584formal@$ret@0))
(= call18871formal@$y@0 (OpnReg ?OTHER_ARRAY_TAG))) (and
(! (or %lbl%@51698 (OpnOk $Mem@@2 call18871formal@$x@0)) :lblneg @51698)
(=> (OpnOk $Mem@@2 call18871formal@$x@0) (and
(! (or %lbl%@51703 (OpnOk $Mem@@2 call18871formal@$y@0)) :lblneg @51703)
(=> (OpnOk $Mem@@2 call18871formal@$y@0) (=> (FlagsCmp $Efl@38 (EvalOpn $Mem@@2 call18871formal@$x@0) (EvalOpn $Mem@@2 call18871formal@$y@0)) (and
anon21_Then_correct@@0
anon21_Else_correct@@0)))))))))))
(let ((anon19_Then_correct@@0 (=> (! (and %lbl%+19000 true) :lblpos +19000) (=> (Jne $Efl@16) (=> (and
(= call18811formal@$x@0 (OpnReg call18584formal@$ret@0))
(= call18811formal@$y@0 (OpnReg ?PTR_ARRAY_TAG))) (and
(! (or %lbl%@51204 (OpnOk $Mem@@2 call18811formal@$x@0)) :lblneg @51204)
(=> (OpnOk $Mem@@2 call18811formal@$x@0) (and
(! (or %lbl%@51209 (OpnOk $Mem@@2 call18811formal@$y@0)) :lblneg @51209)
(=> (OpnOk $Mem@@2 call18811formal@$y@0) (=> (FlagsCmp $Efl@26@@0 (EvalOpn $Mem@@2 call18811formal@$x@0) (EvalOpn $Mem@@2 call18811formal@$y@0)) (and
anon20_Then_correct@@0
anon20_Else_correct@@0)))))))))))
(let ((anon18_Then_correct (=> (! (and %lbl%+18989 true) :lblpos +18989) (=> (Jne $Efl@8) (=> (and
(= call18743formal@$x@0 (OpnReg call18584formal@$ret@0))
(= call18743formal@$y@0 (OpnReg ?OTHER_VECTOR_TAG))) (and
(! (or %lbl%@50779 (OpnOk $Mem@@2 call18743formal@$x@0)) :lblneg @50779)
(=> (OpnOk $Mem@@2 call18743formal@$x@0) (and
(! (or %lbl%@50784 (OpnOk $Mem@@2 call18743formal@$y@0)) :lblneg @50784)
(=> (OpnOk $Mem@@2 call18743formal@$y@0) (=> (FlagsCmp $Efl@16 (EvalOpn $Mem@@2 call18743formal@$x@0) (EvalOpn $Mem@@2 call18743formal@$y@0)) (and
anon19_Then_correct@@0
anon19_Else_correct@@0)))))))))))
(let ((anon17_Then_correct (=> (! (and %lbl%+18978 true) :lblpos +18978) (=> (Jne $Efl@6@@0) (=> (and
(= call18683formal@$x@0 (OpnReg call18584formal@$ret@0))
(= call18683formal@$y@0 (OpnReg ?PTR_VECTOR_TAG))) (and
(! (or %lbl%@50438 (OpnOk $Mem@@2 call18683formal@$x@0)) :lblneg @50438)
(=> (OpnOk $Mem@@2 call18683formal@$x@0) (and
(! (or %lbl%@50443 (OpnOk $Mem@@2 call18683formal@$y@0)) :lblneg @50443)
(=> (OpnOk $Mem@@2 call18683formal@$y@0) (=> (FlagsCmp $Efl@8 (EvalOpn $Mem@@2 call18683formal@$x@0) (EvalOpn $Mem@@2 call18683formal@$y@0)) (and
anon18_Then_correct
anon18_Else_correct)))))))))))
(let ((anon16_Then_correct (=> (! (and %lbl%+18967 true) :lblpos +18967) (=> (Jne $Efl@5) (=> (and
(= call18633formal@$x@0 (OpnReg call18584formal@$ret@0))
(= call18633formal@$y@0 (OpnReg ?STRING_TAG))) (and
(! (or %lbl%@50331 (OpnOk $Mem@@2 call18633formal@$x@0)) :lblneg @50331)
(=> (OpnOk $Mem@@2 call18633formal@$x@0) (and
(! (or %lbl%@50336 (OpnOk $Mem@@2 call18633formal@$y@0)) :lblneg @50336)
(=> (OpnOk $Mem@@2 call18633formal@$y@0) (=> (FlagsCmp $Efl@6@@0 (EvalOpn $Mem@@2 call18633formal@$x@0) (EvalOpn $Mem@@2 call18633formal@$y@0)) (and
anon17_Then_correct
anon17_Else_correct)))))))))))
(let ((anon15_Then_correct (=> (! (and %lbl%+18956 true) :lblpos +18956) (=> (Jne $Efl@3) (=> (and
(= call18612formal@$x@0 (OpnReg call18584formal@$ret@0))
(= call18612formal@$y@0 (OpnReg ?DENSE_TAG))) (and
(! (or %lbl%@50273 (OpnOk $Mem@@2 call18612formal@$x@0)) :lblneg @50273)
(=> (OpnOk $Mem@@2 call18612formal@$x@0) (and
(! (or %lbl%@50278 (OpnOk $Mem@@2 call18612formal@$y@0)) :lblneg @50278)
(=> (OpnOk $Mem@@2 call18612formal@$y@0) (=> (FlagsCmp $Efl@5 (EvalOpn $Mem@@2 call18612formal@$x@0) (EvalOpn $Mem@@2 call18612formal@$y@0)) (and
anon16_Then_correct
anon16_Else_correct)))))))))))
(let ((anon0_correct@@3 (=> (! (and %lbl%+18955 true) :lblpos +18955) (=> (and
(forall ((q@abs@@9 Int) (vt@@13 Int) ) (! (=> (VTable q@abs@@9 vt@@13) (and
(inRo (+ vt@@13 ?VT_MASK) 4)
(inRo (+ vt@@13 ?VT_BASE_LENGTH) 4)
(inRo (+ vt@@13 ?VT_ARRAY_ELEMENT_SIZE) 4)
(inRo (+ vt@@13 ?VT_ARRAY_ELEMENT_CLASS) 4)
(inRo (+ vt@@13 ?VT_ARRAY_OF) 4)))
 :qid |Bartokib.309:17|
 :skolemid |162|
 :pattern ( (TVT q@abs@@9 vt@@13))
))
(forall ((l@@7 T@$FrameLayout) (j@@53 Int) ) (! (and
(inFrame l@@7 0)
(not (frameHasPtr l@@7 0))
(inFrame l@@7 1)
(not (frameHasPtr l@@7 1))
(=> (and
(TO j@@53)
(frameHasPtr l@@7 j@@53)) (inFrame l@@7 j@@53))
(=> (and
(TO j@@53)
(getBit (frameDescriptor l@@7) 0)
(not (getBit (frameDescriptor l@@7) 1))
(= (q@and (shr (frameDescriptor l@@7) 6) 1023) 0)) (and
(between 0 16 (frameLayoutArgs l@@7))
(= (frameLayoutArgs l@@7) (q@and (shr (frameDescriptor l@@7) 2) 15))
(=> (frameHasPtr l@@7 j@@53) (and
(<= 0 (- (+ (frameLayoutArgs l@@7) 1) j@@53))
(< (- (- (frameLayoutArgs l@@7) 1) j@@53) 16)))
(=> (and
(<= 0 (- (+ (frameLayoutArgs l@@7) 1) j@@53))
(< (- (- (frameLayoutArgs l@@7) 1) j@@53) 16)) (and
(=> (>= j@@53 2) (= (frameHasPtr l@@7 j@@53) (getBit (frameDescriptor l@@7) (- (+ (+ 16 (frameLayoutArgs l@@7)) 1) j@@53))))
(=> (< j@@53 0) (= (frameHasPtr l@@7 j@@53) (getBit (frameDescriptor l@@7) (- (- (+ 16 (frameLayoutArgs l@@7)) 1) j@@53))))))))
(=> (and
(TO j@@53)
(not (getBit (frameDescriptor l@@7) 0))) (inRo (frameDescriptor l@@7) 4))
(=> (and
(TO j@@53)
(not (getBit (frameDescriptor l@@7) 0))
(= (ro32 (frameDescriptor l@@7)) 4096)
(inFrame l@@7 j@@53)) (and
(inRo (+ (frameDescriptor l@@7) 4) 1)
(inRo (+ (+ (frameDescriptor l@@7) 6) (frameFieldToSlot l@@7 j@@53)) 1)
(= j@@53 (roS8 (+ (+ (frameDescriptor l@@7) 6) (frameFieldToSlot l@@7 j@@53))))
(= (frameHasPtr l@@7 j@@53) (between 0 (roU8 (+ (frameDescriptor l@@7) 4)) (frameFieldToSlot l@@7 j@@53))))))
 :qid |Bartokib.316:17|
 :skolemid |163|
 :pattern ( (TVF l@@7) (TO j@@53))
))) (=> (and
(forall ((l@@8 T@$FrameLayout) (k@@2 Int) ) (! (=> (and
(TSlot k@@2)
(not (getBit (frameDescriptor l@@8) 0))
(= (ro32 (frameDescriptor l@@8)) 4096)
(between 0 (roU8 (+ (frameDescriptor l@@8) 4)) k@@2)) (and
(inFrame l@@8 (roS8 (+ (+ (frameDescriptor l@@8) 6) k@@2)))
(= k@@2 (frameFieldToSlot l@@8 (roS8 (+ (+ (frameDescriptor l@@8) 6) k@@2))))))
 :qid |Bartokib.337:17|
 :skolemid |164|
 :pattern ( (TVF l@@8) (TSlot k@@2))
))
(forall ((s@@9 Int) (j@@54 Int) ) (! (=> (and
(<= 0 s@@9)
(< s@@9 ?SectionCount)
(<= 0 j@@54)) (and
(inRo (+ ?DataSectionBase (* 4 s@@9)) 4)
(inRo (+ ?DataSectionEnd (* 4 s@@9)) 4)
(inRo (+ ?StaticDataPointerBitMap (* 4 s@@9)) 4)
(=> (< (+ (sectionBase s@@9) (* 4 j@@54)) (sectionEnd s@@9)) (and
(inSectionData (+ (ro32 (+ ?DataSectionBase (* 4 s@@9))) (* 4 j@@54)))
(inRo (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@9))) (* 4 (shr j@@54 5))) 4)
(< (q@and j@@54 31) 32)
(= (sectionHasPtr s@@9 j@@54) (getBit (ro32 (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@9))) (* 4 (shr j@@54 5)))) (q@and j@@54 31)))))))
 :qid |Bartokib.342:17|
 :skolemid |165|
 :pattern ( (TVS s@@9 j@@54))
))
(forall ((f@@20 Int) ) (! (forall ((t@@14 Int) ) (! (=> (TT t@@14) (=> (and
(<= 0 t@@14)
(< t@@14 ?CallSiteTableCount)) (and
(inRo (+ ?CodeBaseStartTable (* 4 t@@14)) 4)
(inRo (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@14)) 4)
(inRo (+ ?CallSiteSetCount (* 4 t@@14)) 4)
(inRo (ro32 (+ ?CallSiteSetCount (* 4 t@@14))) 4)
(inRo (+ ?CallSiteSetNumberToIndex (* 4 t@@14)) 4)
(inRo (+ ?ActivationDescriptorTable (* 4 t@@14)) 4)
(forall ((j@@55 Int) ) (! (=> (TO j@@55) (=> (and
(<= 0 j@@55)
(<= j@@55 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@14)))))) (and
(inRo (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@14))) (* 4 j@@55)) 4)
(inRo (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@14))) (* 2 j@@55)) 2)
(inRo (+ (ro32 (+ ?ActivationDescriptorTable (* 4 t@@14))) (* 4 (roU16 (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@14))) (* 2 j@@55))))) 4))))
 :qid |Bartokib.355:340|
 :skolemid |166|
 :pattern ( (TO j@@55))
)))))
 :qid |Bartokib.355:41|
 :skolemid |167|
 :pattern ( (TT t@@14))
))
 :qid |Bartokib.355:17|
 :skolemid |168|
 :pattern ( (TVFT f@@20))
))
(forall ((f@@21 Int) ) (! (forall ((t@@15 Int) (j1@@4 Int) (j2@@4 Int) ) (! (=> (and
(TT t@@15)
(TO j1@@4)
(TO j2@@4)) (=> (and
(<= 0 t@@15)
(< t@@15 ?CallSiteTableCount)
(<= 0 j1@@4)
(< j1@@4 j2@@4)
(<= j2@@4 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@15)))))) (< (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@15))) (* 4 j1@@4))) (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@15))) (* 4 j2@@4))))))
 :qid |Bartokib.372:41|
 :skolemid |169|
 :pattern ( (TT t@@15) (TO j1@@4) (TO j2@@4))
))
 :qid |Bartokib.372:17|
 :skolemid |170|
 :pattern ( (TVFT f@@21))
))) (and
(! (or %lbl%@50066 (TVL $abs)) :lblneg @50066)
(=> (TVL $abs) (and
(! (or %lbl%@50070 (TVT $abs $vt)) :lblneg @50070)
(=> (TVT $abs $vt) (=> (= call18580formal@$ptr@0 (+ edx ?VT_MASK)) (and
(! (or %lbl%@50088 (inRo call18580formal@$ptr@0 4)) :lblneg @50088)
(=> (inRo call18580formal@$ptr@0 4) (=> (and
(word call18580formal@$val@0)
(= call18580formal@$val@0 (ro32 call18580formal@$ptr@0))) (=> (and
(= call18584formal@$ret@0 (q@and call18580formal@$val@0 15))
(word call18584formal@$ret@0)
(= call18591formal@$x@0 (OpnReg call18584formal@$ret@0))
(= call18591formal@$y@0 (OpnReg ?SPARSE_TAG))) (and
(! (or %lbl%@50166 (OpnOk $Mem@@2 call18591formal@$x@0)) :lblneg @50166)
(=> (OpnOk $Mem@@2 call18591formal@$x@0) (and
(! (or %lbl%@50171 (OpnOk $Mem@@2 call18591formal@$y@0)) :lblneg @50171)
(=> (OpnOk $Mem@@2 call18591formal@$y@0) (=> (FlagsCmp $Efl@3 (EvalOpn $Mem@@2 call18591formal@$x@0) (EvalOpn $Mem@@2 call18591formal@$y@0)) (and
anon15_Then_correct
anon15_Else_correct))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@3 (=> (! (and %lbl%+47904 true) :lblpos +47904) (=> (and
(= ecx $ptr)
(= edx $vt)
(ObjSize $abs $vt $_nElems1 $_nElems2)
(VTable $abs $vt)
(=> (>= (numFields $abs) 3) (AlignedHeapAddr (+ $ptr 8)))
(=> (and
(>= (numFields $abs) 3)
(not (VFieldPtr $abs 2))) (= (select $gcMem@@4 (+ $ptr 8)) $_nElems1))
(=> (>= (numFields $abs) 4) (AlignedHeapAddr (+ $ptr 12)))
(=> (and
(>= (numFields $abs) 4)
(not (VFieldPtr $abs 3))) (= (select $gcMem@@4 (+ $ptr 12)) $_nElems2))
(MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) anon0_correct@@3))))
PreconditionGeneratedEntry_correct@@3)))))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+19103 () Bool)
(declare-fun %lbl%@53012 () Bool)
(declare-fun $ptr@@0 () Int)
(declare-fun %lbl%@53016 () Bool)
(declare-fun %lbl%@53020 () Bool)
(declare-fun %lbl%@53024 () Bool)
(declare-fun call19082formal@$abs@0 () Int)
(declare-fun $rs () (Array Int Int))
(declare-fun call19082formal@$_nElems1@0 () Int)
(declare-fun $AbsMem@@3 () (Array Int (Array Int Int)))
(declare-fun call19082formal@$_nElems2@0 () Int)
(declare-fun %lbl%@53086 () Bool)
(declare-fun $vt@@0 () Int)
(declare-fun %lbl%@53098 () Bool)
(declare-fun %lbl%@53104 () Bool)
(declare-fun %lbl%@53108 () Bool)
(declare-fun %lbl%@53124 () Bool)
(declare-fun %lbl%@53154 () Bool)
(declare-fun %lbl%@53170 () Bool)
(declare-fun %lbl%@53200 () Bool)
(declare-fun eax@0@@0 () Int)
(declare-fun call19097formal@$oldMem@0 () (Array Int Int))
(declare-fun call19097formal@$oldSMem@0 () (Array Int Int))
(declare-fun call19097formal@$oldDMem@0 () (Array Int Int))
(declare-fun call19097formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call19097formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call19097formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call19097formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@53374 () Bool)
(declare-fun %lbl%@53404 () Bool)
(declare-fun %lbl%@53427 () Bool)
(declare-fun %lbl%@53440 () Bool)
(declare-fun call19100formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@53479 () Bool)
(declare-fun %lbl%@53490 () Bool)
(declare-fun esp@0@@1 () Int)
(declare-fun %lbl%@53521 () Bool)
(declare-fun %lbl%@53536 () Bool)
(declare-fun %lbl%@53566 () Bool)
(declare-fun %lbl%+52650 () Bool)
(declare-fun $toAbs@@4 () (Array Int Int))
(declare-fun $rt () (Array Int Int))
(declare-fun $gcSlice@@3 () (Array Int Int))
(push 1)
(set-info :boogie-vc-id GetSize)
(assert (not
(let ((anon0_correct@@4 (=> (! (and %lbl%+19103 true) :lblpos +19103) (and
(! (or %lbl%@53012 (TV $ptr@@0)) :lblneg @53012)
(=> (TV $ptr@@0) (and
(! (or %lbl%@53016 (TO 1)) :lblneg @53016)
(=> (TO 1) (and
(! (or %lbl%@53020 (TO 2)) :lblneg @53020)
(=> (TO 2) (and
(! (or %lbl%@53024 (TO 3)) :lblneg @53024)
(=> (TO 3) (=> (= call19082formal@$abs@0 (select $rs $ptr@@0)) (=> (and
(= call19082formal@$_nElems1@0 (select (select $AbsMem@@3 (select $rs $ptr@@0)) 2))
(= call19082formal@$_nElems2@0 (select (select $AbsMem@@3 (select $rs $ptr@@0)) 3))) (and
(! (or %lbl%@53086 (and
(= ecx $ptr@@0)
(= edx $vt@@0))) :lblneg @53086)
(=> (and
(= ecx $ptr@@0)
(= edx $vt@@0)) (and
(! (or %lbl%@53098 (ObjSize call19082formal@$abs@0 $vt@@0 call19082formal@$_nElems1@0 call19082formal@$_nElems2@0)) :lblneg @53098)
(=> (ObjSize call19082formal@$abs@0 $vt@@0 call19082formal@$_nElems1@0 call19082formal@$_nElems2@0) (and
(! (or %lbl%@53104 (VTable call19082formal@$abs@0 $vt@@0)) :lblneg @53104)
(=> (VTable call19082formal@$abs@0 $vt@@0) (and
(! (or %lbl%@53108 (=> (>= (numFields call19082formal@$abs@0) 3) (AlignedHeapAddr (+ $ptr@@0 8)))) :lblneg @53108)
(=> (=> (>= (numFields call19082formal@$abs@0) 3) (AlignedHeapAddr (+ $ptr@@0 8))) (and
(! (or %lbl%@53124 (=> (and
(>= (numFields call19082formal@$abs@0) 3)
(not (VFieldPtr call19082formal@$abs@0 2))) (= (select $gcMem@@4 (+ $ptr@@0 8)) call19082formal@$_nElems1@0))) :lblneg @53124)
(=> (=> (and
(>= (numFields call19082formal@$abs@0) 3)
(not (VFieldPtr call19082formal@$abs@0 2))) (= (select $gcMem@@4 (+ $ptr@@0 8)) call19082formal@$_nElems1@0)) (and
(! (or %lbl%@53154 (=> (>= (numFields call19082formal@$abs@0) 4) (AlignedHeapAddr (+ $ptr@@0 12)))) :lblneg @53154)
(=> (=> (>= (numFields call19082formal@$abs@0) 4) (AlignedHeapAddr (+ $ptr@@0 12))) (and
(! (or %lbl%@53170 (=> (and
(>= (numFields call19082formal@$abs@0) 4)
(not (VFieldPtr call19082formal@$abs@0 3))) (= (select $gcMem@@4 (+ $ptr@@0 12)) call19082formal@$_nElems2@0))) :lblneg @53170)
(=> (=> (and
(>= (numFields call19082formal@$abs@0) 4)
(not (VFieldPtr call19082formal@$abs@0 3))) (= (select $gcMem@@4 (+ $ptr@@0 12)) call19082formal@$_nElems2@0)) (and
(! (or %lbl%@53200 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @53200)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (= eax@0@@0 (* 4 (numFields call19082formal@$abs@0))) (=> (and
(MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(= call19097formal@$oldMem@0 $Mem@@2)
(= call19097formal@$oldSMem@0 $sMem@@5)
(= call19097formal@$oldDMem@0 $dMem@@0)
(= call19097formal@$oldPciMem@0 $pciMem@@4)
(= call19097formal@$oldTMem@0 $tMems@@12)
(= call19097formal@$oldFMem@0 $fMems@@4)
(= call19097formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@53374 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @53374)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@53404 (MemInv call19097formal@$oldMem@0 call19097formal@$oldSMem@0 call19097formal@$oldDMem@0 call19097formal@$oldPciMem@0 call19097formal@$oldTMem@0 call19097formal@$oldFMem@0 call19097formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @53404)
(=> (MemInv call19097formal@$oldMem@0 call19097formal@$oldSMem@0 call19097formal@$oldDMem@0 call19097formal@$oldPciMem@0 call19097formal@$oldTMem@0 call19097formal@$oldFMem@0 call19097formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@53427 (= (select $sMem@@5 esp) (select call19097formal@$oldSMem@0 esp))) :lblneg @53427)
(=> (= (select $sMem@@5 esp) (select call19097formal@$oldSMem@0 esp)) (and
(! (or %lbl%@53440 (sAddr esp)) :lblneg @53440)
(=> (sAddr esp) (=> (= (select $Mem@@2 esp) (select call19097formal@$oldMem@0 esp)) (=> (and
(= (select $Mem@@2 esp) (select $sMem@@5 esp))
(= call19100formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@53479 (= (ReturnToAddr (select $Mem@@2 esp)) call19100formal@$oldRA@0)) :lblneg @53479)
(=> (= (ReturnToAddr (select $Mem@@2 esp)) call19100formal@$oldRA@0) (and
(! (or %lbl%@53490 (Aligned esp)) :lblneg @53490)
(=> (Aligned esp) (=> (and
(= esp@0@@1 (+ esp 4))
(Aligned esp@0@@1)) (and
(! (or %lbl%@53521 (= eax@0@@0 (* 4 (numFields (select $rs $ptr@@0))))) :lblneg @53521)
(=> (= eax@0@@0 (* 4 (numFields (select $rs $ptr@@0)))) (and
(! (or %lbl%@53536 (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @53536)
(=> (MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@53566 (SMemEnsure $sMem@@5 $sMem@@5 esp@0@@1 esp)) :lblneg @53566)
(=> (SMemEnsure $sMem@@5 $sMem@@5 esp@0@@1 esp) true))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@4 (=> (! (and %lbl%+52650 true) :lblpos +52650) (=> (and
(= ecx $ptr@@0)
(= edx $vt@@0)
(gcAddr $ptr@@0)
(not (= (select $rs $ptr@@0) NO_ABS))
(= (select $rs $ptr@@0) (select $toAbs@@4 $ptr@@0))
(ObjInv $ptr@@0 $rs $rt $toAbs@@4 $AbsMem@@3 $gcMem@@4 $gcSlice@@3)
(or
(= $vt@@0 (select (select $AbsMem@@3 (select $rs $ptr@@0)) 1))
(= $vt@@0 (select $gcMem@@4 (+ $ptr@@0 4))))
(MemInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@4 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 96 $sMem@@5 esp $RET@@0)) anon0_correct@@4))))
PreconditionGeneratedEntry_correct@@4))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+19127 () Bool)
(declare-fun %lbl%@54903 () Bool)
(declare-fun $abs@@0 () Int)
(declare-fun $vt@@1 () Int)
(declare-fun call19120formal@$ptr@0 () Int)
(declare-fun %lbl%@54921 () Bool)
(declare-fun call19120formal@$val@0 () Int)
(declare-fun call19124formal@$ret@0 () Int)
(declare-fun %lbl%@54980 () Bool)
(declare-fun %lbl%+53575 () Bool)
(push 1)
(set-info :boogie-vc-id readTag)
(assert (not
(let ((anon0_correct@@5 (=> (! (and %lbl%+19127 true) :lblpos +19127) (=> (and
(forall ((q@abs@@10 Int) (vt@@14 Int) ) (! (=> (VTable q@abs@@10 vt@@14) (and
(inRo (+ vt@@14 ?VT_MASK) 4)
(inRo (+ vt@@14 ?VT_BASE_LENGTH) 4)
(inRo (+ vt@@14 ?VT_ARRAY_ELEMENT_SIZE) 4)
(inRo (+ vt@@14 ?VT_ARRAY_ELEMENT_CLASS) 4)
(inRo (+ vt@@14 ?VT_ARRAY_OF) 4)))
 :qid |Bartokib.309:17|
 :skolemid |162|
 :pattern ( (TVT q@abs@@10 vt@@14))
))
(forall ((l@@9 T@$FrameLayout) (j@@56 Int) ) (! (and
(inFrame l@@9 0)
(not (frameHasPtr l@@9 0))
(inFrame l@@9 1)
(not (frameHasPtr l@@9 1))
(=> (and
(TO j@@56)
(frameHasPtr l@@9 j@@56)) (inFrame l@@9 j@@56))
(=> (and
(TO j@@56)
(getBit (frameDescriptor l@@9) 0)
(not (getBit (frameDescriptor l@@9) 1))
(= (q@and (shr (frameDescriptor l@@9) 6) 1023) 0)) (and
(between 0 16 (frameLayoutArgs l@@9))
(= (frameLayoutArgs l@@9) (q@and (shr (frameDescriptor l@@9) 2) 15))
(=> (frameHasPtr l@@9 j@@56) (and
(<= 0 (- (+ (frameLayoutArgs l@@9) 1) j@@56))
(< (- (- (frameLayoutArgs l@@9) 1) j@@56) 16)))
(=> (and
(<= 0 (- (+ (frameLayoutArgs l@@9) 1) j@@56))
(< (- (- (frameLayoutArgs l@@9) 1) j@@56) 16)) (and
(=> (>= j@@56 2) (= (frameHasPtr l@@9 j@@56) (getBit (frameDescriptor l@@9) (- (+ (+ 16 (frameLayoutArgs l@@9)) 1) j@@56))))
(=> (< j@@56 0) (= (frameHasPtr l@@9 j@@56) (getBit (frameDescriptor l@@9) (- (- (+ 16 (frameLayoutArgs l@@9)) 1) j@@56))))))))
(=> (and
(TO j@@56)
(not (getBit (frameDescriptor l@@9) 0))) (inRo (frameDescriptor l@@9) 4))
(=> (and
(TO j@@56)
(not (getBit (frameDescriptor l@@9) 0))
(= (ro32 (frameDescriptor l@@9)) 4096)
(inFrame l@@9 j@@56)) (and
(inRo (+ (frameDescriptor l@@9) 4) 1)
(inRo (+ (+ (frameDescriptor l@@9) 6) (frameFieldToSlot l@@9 j@@56)) 1)
(= j@@56 (roS8 (+ (+ (frameDescriptor l@@9) 6) (frameFieldToSlot l@@9 j@@56))))
(= (frameHasPtr l@@9 j@@56) (between 0 (roU8 (+ (frameDescriptor l@@9) 4)) (frameFieldToSlot l@@9 j@@56))))))
 :qid |Bartokib.316:17|
 :skolemid |163|
 :pattern ( (TVF l@@9) (TO j@@56))
))) (=> (and
(forall ((l@@10 T@$FrameLayout) (k@@3 Int) ) (! (=> (and
(TSlot k@@3)
(not (getBit (frameDescriptor l@@10) 0))
(= (ro32 (frameDescriptor l@@10)) 4096)
(between 0 (roU8 (+ (frameDescriptor l@@10) 4)) k@@3)) (and
(inFrame l@@10 (roS8 (+ (+ (frameDescriptor l@@10) 6) k@@3)))
(= k@@3 (frameFieldToSlot l@@10 (roS8 (+ (+ (frameDescriptor l@@10) 6) k@@3))))))
 :qid |Bartokib.337:17|
 :skolemid |164|
 :pattern ( (TVF l@@10) (TSlot k@@3))
))
(forall ((s@@10 Int) (j@@57 Int) ) (! (=> (and
(<= 0 s@@10)
(< s@@10 ?SectionCount)
(<= 0 j@@57)) (and
(inRo (+ ?DataSectionBase (* 4 s@@10)) 4)
(inRo (+ ?DataSectionEnd (* 4 s@@10)) 4)
(inRo (+ ?StaticDataPointerBitMap (* 4 s@@10)) 4)
(=> (< (+ (sectionBase s@@10) (* 4 j@@57)) (sectionEnd s@@10)) (and
(inSectionData (+ (ro32 (+ ?DataSectionBase (* 4 s@@10))) (* 4 j@@57)))
(inRo (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@10))) (* 4 (shr j@@57 5))) 4)
(< (q@and j@@57 31) 32)
(= (sectionHasPtr s@@10 j@@57) (getBit (ro32 (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@10))) (* 4 (shr j@@57 5)))) (q@and j@@57 31)))))))
 :qid |Bartokib.342:17|
 :skolemid |165|
 :pattern ( (TVS s@@10 j@@57))
))
(forall ((f@@22 Int) ) (! (forall ((t@@16 Int) ) (! (=> (TT t@@16) (=> (and
(<= 0 t@@16)
(< t@@16 ?CallSiteTableCount)) (and
(inRo (+ ?CodeBaseStartTable (* 4 t@@16)) 4)
(inRo (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@16)) 4)
(inRo (+ ?CallSiteSetCount (* 4 t@@16)) 4)
(inRo (ro32 (+ ?CallSiteSetCount (* 4 t@@16))) 4)
(inRo (+ ?CallSiteSetNumberToIndex (* 4 t@@16)) 4)
(inRo (+ ?ActivationDescriptorTable (* 4 t@@16)) 4)
(forall ((j@@58 Int) ) (! (=> (TO j@@58) (=> (and
(<= 0 j@@58)
(<= j@@58 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@16)))))) (and
(inRo (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@16))) (* 4 j@@58)) 4)
(inRo (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@16))) (* 2 j@@58)) 2)
(inRo (+ (ro32 (+ ?ActivationDescriptorTable (* 4 t@@16))) (* 4 (roU16 (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@16))) (* 2 j@@58))))) 4))))
 :qid |Bartokib.355:340|
 :skolemid |166|
 :pattern ( (TO j@@58))
)))))
 :qid |Bartokib.355:41|
 :skolemid |167|
 :pattern ( (TT t@@16))
))
 :qid |Bartokib.355:17|
 :skolemid |168|
 :pattern ( (TVFT f@@22))
))
(forall ((f@@23 Int) ) (! (forall ((t@@17 Int) (j1@@5 Int) (j2@@5 Int) ) (! (=> (and
(TT t@@17)
(TO j1@@5)
(TO j2@@5)) (=> (and
(<= 0 t@@17)
(< t@@17 ?CallSiteTableCount)
(<= 0 j1@@5)
(< j1@@5 j2@@5)
(<= j2@@5 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@17)))))) (< (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@17))) (* 4 j1@@5))) (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@17))) (* 4 j2@@5))))))
 :qid |Bartokib.372:41|
 :skolemid |169|
 :pattern ( (TT t@@17) (TO j1@@5) (TO j2@@5))
))
 :qid |Bartokib.372:17|
 :skolemid |170|
 :pattern ( (TVFT f@@23))
))) (and
(! (or %lbl%@54903 (TVT $abs@@0 $vt@@1)) :lblneg @54903)
(=> (TVT $abs@@0 $vt@@1) (=> (= call19120formal@$ptr@0 (+ ecx ?VT_MASK)) (and
(! (or %lbl%@54921 (inRo call19120formal@$ptr@0 4)) :lblneg @54921)
(=> (inRo call19120formal@$ptr@0 4) (=> (and
(word call19120formal@$val@0)
(= call19120formal@$val@0 (ro32 call19120formal@$ptr@0))
(= call19124formal@$ret@0 (q@and call19120formal@$val@0 15))
(word call19124formal@$ret@0)) (and
(! (or %lbl%@54980 (= call19124formal@$ret@0 (tag@@1 $vt@@1))) :lblneg @54980)
(=> (= call19124formal@$ret@0 (tag@@1 $vt@@1)) true)))))))))))))
(let ((PreconditionGeneratedEntry_correct@@5 (=> (! (and %lbl%+53575 true) :lblpos +53575) (=> (and
(= ecx $vt@@1)
(VTable $abs@@0 $vt@@1)) anon0_correct@@5))))
PreconditionGeneratedEntry_correct@@5))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+19147 () Bool)
(declare-fun %lbl%@56306 () Bool)
(declare-fun $abs@@1 () Int)
(declare-fun $vt@@2 () Int)
(declare-fun call19144formal@$ptr@0 () Int)
(declare-fun %lbl%@56324 () Bool)
(declare-fun call19144formal@$val@0 () Int)
(declare-fun %lbl%@56353 () Bool)
(declare-fun %lbl%+54988 () Bool)
(push 1)
(set-info :boogie-vc-id readArrayOf)
(assert (not
(let ((anon0_correct@@6 (=> (! (and %lbl%+19147 true) :lblpos +19147) (=> (and
(forall ((q@abs@@11 Int) (vt@@15 Int) ) (! (=> (VTable q@abs@@11 vt@@15) (and
(inRo (+ vt@@15 ?VT_MASK) 4)
(inRo (+ vt@@15 ?VT_BASE_LENGTH) 4)
(inRo (+ vt@@15 ?VT_ARRAY_ELEMENT_SIZE) 4)
(inRo (+ vt@@15 ?VT_ARRAY_ELEMENT_CLASS) 4)
(inRo (+ vt@@15 ?VT_ARRAY_OF) 4)))
 :qid |Bartokib.309:17|
 :skolemid |162|
 :pattern ( (TVT q@abs@@11 vt@@15))
))
(forall ((l@@11 T@$FrameLayout) (j@@59 Int) ) (! (and
(inFrame l@@11 0)
(not (frameHasPtr l@@11 0))
(inFrame l@@11 1)
(not (frameHasPtr l@@11 1))
(=> (and
(TO j@@59)
(frameHasPtr l@@11 j@@59)) (inFrame l@@11 j@@59))
(=> (and
(TO j@@59)
(getBit (frameDescriptor l@@11) 0)
(not (getBit (frameDescriptor l@@11) 1))
(= (q@and (shr (frameDescriptor l@@11) 6) 1023) 0)) (and
(between 0 16 (frameLayoutArgs l@@11))
(= (frameLayoutArgs l@@11) (q@and (shr (frameDescriptor l@@11) 2) 15))
(=> (frameHasPtr l@@11 j@@59) (and
(<= 0 (- (+ (frameLayoutArgs l@@11) 1) j@@59))
(< (- (- (frameLayoutArgs l@@11) 1) j@@59) 16)))
(=> (and
(<= 0 (- (+ (frameLayoutArgs l@@11) 1) j@@59))
(< (- (- (frameLayoutArgs l@@11) 1) j@@59) 16)) (and
(=> (>= j@@59 2) (= (frameHasPtr l@@11 j@@59) (getBit (frameDescriptor l@@11) (- (+ (+ 16 (frameLayoutArgs l@@11)) 1) j@@59))))
(=> (< j@@59 0) (= (frameHasPtr l@@11 j@@59) (getBit (frameDescriptor l@@11) (- (- (+ 16 (frameLayoutArgs l@@11)) 1) j@@59))))))))
(=> (and
(TO j@@59)
(not (getBit (frameDescriptor l@@11) 0))) (inRo (frameDescriptor l@@11) 4))
(=> (and
(TO j@@59)
(not (getBit (frameDescriptor l@@11) 0))
(= (ro32 (frameDescriptor l@@11)) 4096)
(inFrame l@@11 j@@59)) (and
(inRo (+ (frameDescriptor l@@11) 4) 1)
(inRo (+ (+ (frameDescriptor l@@11) 6) (frameFieldToSlot l@@11 j@@59)) 1)
(= j@@59 (roS8 (+ (+ (frameDescriptor l@@11) 6) (frameFieldToSlot l@@11 j@@59))))
(= (frameHasPtr l@@11 j@@59) (between 0 (roU8 (+ (frameDescriptor l@@11) 4)) (frameFieldToSlot l@@11 j@@59))))))
 :qid |Bartokib.316:17|
 :skolemid |163|
 :pattern ( (TVF l@@11) (TO j@@59))
))) (=> (and
(forall ((l@@12 T@$FrameLayout) (k@@4 Int) ) (! (=> (and
(TSlot k@@4)
(not (getBit (frameDescriptor l@@12) 0))
(= (ro32 (frameDescriptor l@@12)) 4096)
(between 0 (roU8 (+ (frameDescriptor l@@12) 4)) k@@4)) (and
(inFrame l@@12 (roS8 (+ (+ (frameDescriptor l@@12) 6) k@@4)))
(= k@@4 (frameFieldToSlot l@@12 (roS8 (+ (+ (frameDescriptor l@@12) 6) k@@4))))))
 :qid |Bartokib.337:17|
 :skolemid |164|
 :pattern ( (TVF l@@12) (TSlot k@@4))
))
(forall ((s@@11 Int) (j@@60 Int) ) (! (=> (and
(<= 0 s@@11)
(< s@@11 ?SectionCount)
(<= 0 j@@60)) (and
(inRo (+ ?DataSectionBase (* 4 s@@11)) 4)
(inRo (+ ?DataSectionEnd (* 4 s@@11)) 4)
(inRo (+ ?StaticDataPointerBitMap (* 4 s@@11)) 4)
(=> (< (+ (sectionBase s@@11) (* 4 j@@60)) (sectionEnd s@@11)) (and
(inSectionData (+ (ro32 (+ ?DataSectionBase (* 4 s@@11))) (* 4 j@@60)))
(inRo (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@11))) (* 4 (shr j@@60 5))) 4)
(< (q@and j@@60 31) 32)
(= (sectionHasPtr s@@11 j@@60) (getBit (ro32 (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@11))) (* 4 (shr j@@60 5)))) (q@and j@@60 31)))))))
 :qid |Bartokib.342:17|
 :skolemid |165|
 :pattern ( (TVS s@@11 j@@60))
))
(forall ((f@@24 Int) ) (! (forall ((t@@18 Int) ) (! (=> (TT t@@18) (=> (and
(<= 0 t@@18)
(< t@@18 ?CallSiteTableCount)) (and
(inRo (+ ?CodeBaseStartTable (* 4 t@@18)) 4)
(inRo (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@18)) 4)
(inRo (+ ?CallSiteSetCount (* 4 t@@18)) 4)
(inRo (ro32 (+ ?CallSiteSetCount (* 4 t@@18))) 4)
(inRo (+ ?CallSiteSetNumberToIndex (* 4 t@@18)) 4)
(inRo (+ ?ActivationDescriptorTable (* 4 t@@18)) 4)
(forall ((j@@61 Int) ) (! (=> (TO j@@61) (=> (and
(<= 0 j@@61)
(<= j@@61 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@18)))))) (and
(inRo (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@18))) (* 4 j@@61)) 4)
(inRo (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@18))) (* 2 j@@61)) 2)
(inRo (+ (ro32 (+ ?ActivationDescriptorTable (* 4 t@@18))) (* 4 (roU16 (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@18))) (* 2 j@@61))))) 4))))
 :qid |Bartokib.355:340|
 :skolemid |166|
 :pattern ( (TO j@@61))
)))))
 :qid |Bartokib.355:41|
 :skolemid |167|
 :pattern ( (TT t@@18))
))
 :qid |Bartokib.355:17|
 :skolemid |168|
 :pattern ( (TVFT f@@24))
))
(forall ((f@@25 Int) ) (! (forall ((t@@19 Int) (j1@@6 Int) (j2@@6 Int) ) (! (=> (and
(TT t@@19)
(TO j1@@6)
(TO j2@@6)) (=> (and
(<= 0 t@@19)
(< t@@19 ?CallSiteTableCount)
(<= 0 j1@@6)
(< j1@@6 j2@@6)
(<= j2@@6 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@19)))))) (< (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@19))) (* 4 j1@@6))) (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@19))) (* 4 j2@@6))))))
 :qid |Bartokib.372:41|
 :skolemid |169|
 :pattern ( (TT t@@19) (TO j1@@6) (TO j2@@6))
))
 :qid |Bartokib.372:17|
 :skolemid |170|
 :pattern ( (TVFT f@@25))
))) (and
(! (or %lbl%@56306 (TVT $abs@@1 $vt@@2)) :lblneg @56306)
(=> (TVT $abs@@1 $vt@@2) (=> (= call19144formal@$ptr@0 (+ ecx ?VT_ARRAY_OF)) (and
(! (or %lbl%@56324 (inRo call19144formal@$ptr@0 4)) :lblneg @56324)
(=> (inRo call19144formal@$ptr@0 4) (=> (and
(word call19144formal@$val@0)
(= call19144formal@$val@0 (ro32 call19144formal@$ptr@0))) (and
(! (or %lbl%@56353 (= call19144formal@$val@0 (arrayOf $vt@@2))) :lblneg @56353)
(=> (= call19144formal@$val@0 (arrayOf $vt@@2)) true)))))))))))))
(let ((PreconditionGeneratedEntry_correct@@6 (=> (! (and %lbl%+54988 true) :lblpos +54988) (=> (and
(= ecx $vt@@2)
(VTable $abs@@1 $vt@@2)) anon0_correct@@6))))
PreconditionGeneratedEntry_correct@@6))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+19177 () Bool)
(declare-fun %lbl%@57720 () Bool)
(declare-fun $abs@@2 () Int)
(declare-fun $vt@@3 () Int)
(declare-fun call19164formal@$ptr@0 () Int)
(declare-fun %lbl%@57738 () Bool)
(declare-fun call19164formal@$val@0 () Int)
(declare-fun call19169formal@$ptr@0 () Int)
(declare-fun %lbl%@57779 () Bool)
(declare-fun call19169formal@$val@0 () Int)
(declare-fun call19174formal@$ptr@0 () Int)
(declare-fun %lbl%@57819 () Bool)
(declare-fun call19174formal@$val@0 () Int)
(declare-fun %lbl%@57848 () Bool)
(declare-fun %lbl%@57855 () Bool)
(declare-fun %lbl%+56361 () Bool)
(push 1)
(set-info :boogie-vc-id readElementInfo)
(assert (not
(let ((anon0_correct@@7 (=> (! (and %lbl%+19177 true) :lblpos +19177) (=> (and
(forall ((q@abs@@12 Int) (vt@@16 Int) ) (! (=> (VTable q@abs@@12 vt@@16) (and
(inRo (+ vt@@16 ?VT_MASK) 4)
(inRo (+ vt@@16 ?VT_BASE_LENGTH) 4)
(inRo (+ vt@@16 ?VT_ARRAY_ELEMENT_SIZE) 4)
(inRo (+ vt@@16 ?VT_ARRAY_ELEMENT_CLASS) 4)
(inRo (+ vt@@16 ?VT_ARRAY_OF) 4)))
 :qid |Bartokib.309:17|
 :skolemid |162|
 :pattern ( (TVT q@abs@@12 vt@@16))
))
(forall ((l@@13 T@$FrameLayout) (j@@62 Int) ) (! (and
(inFrame l@@13 0)
(not (frameHasPtr l@@13 0))
(inFrame l@@13 1)
(not (frameHasPtr l@@13 1))
(=> (and
(TO j@@62)
(frameHasPtr l@@13 j@@62)) (inFrame l@@13 j@@62))
(=> (and
(TO j@@62)
(getBit (frameDescriptor l@@13) 0)
(not (getBit (frameDescriptor l@@13) 1))
(= (q@and (shr (frameDescriptor l@@13) 6) 1023) 0)) (and
(between 0 16 (frameLayoutArgs l@@13))
(= (frameLayoutArgs l@@13) (q@and (shr (frameDescriptor l@@13) 2) 15))
(=> (frameHasPtr l@@13 j@@62) (and
(<= 0 (- (+ (frameLayoutArgs l@@13) 1) j@@62))
(< (- (- (frameLayoutArgs l@@13) 1) j@@62) 16)))
(=> (and
(<= 0 (- (+ (frameLayoutArgs l@@13) 1) j@@62))
(< (- (- (frameLayoutArgs l@@13) 1) j@@62) 16)) (and
(=> (>= j@@62 2) (= (frameHasPtr l@@13 j@@62) (getBit (frameDescriptor l@@13) (- (+ (+ 16 (frameLayoutArgs l@@13)) 1) j@@62))))
(=> (< j@@62 0) (= (frameHasPtr l@@13 j@@62) (getBit (frameDescriptor l@@13) (- (- (+ 16 (frameLayoutArgs l@@13)) 1) j@@62))))))))
(=> (and
(TO j@@62)
(not (getBit (frameDescriptor l@@13) 0))) (inRo (frameDescriptor l@@13) 4))
(=> (and
(TO j@@62)
(not (getBit (frameDescriptor l@@13) 0))
(= (ro32 (frameDescriptor l@@13)) 4096)
(inFrame l@@13 j@@62)) (and
(inRo (+ (frameDescriptor l@@13) 4) 1)
(inRo (+ (+ (frameDescriptor l@@13) 6) (frameFieldToSlot l@@13 j@@62)) 1)
(= j@@62 (roS8 (+ (+ (frameDescriptor l@@13) 6) (frameFieldToSlot l@@13 j@@62))))
(= (frameHasPtr l@@13 j@@62) (between 0 (roU8 (+ (frameDescriptor l@@13) 4)) (frameFieldToSlot l@@13 j@@62))))))
 :qid |Bartokib.316:17|
 :skolemid |163|
 :pattern ( (TVF l@@13) (TO j@@62))
))) (=> (and
(forall ((l@@14 T@$FrameLayout) (k@@5 Int) ) (! (=> (and
(TSlot k@@5)
(not (getBit (frameDescriptor l@@14) 0))
(= (ro32 (frameDescriptor l@@14)) 4096)
(between 0 (roU8 (+ (frameDescriptor l@@14) 4)) k@@5)) (and
(inFrame l@@14 (roS8 (+ (+ (frameDescriptor l@@14) 6) k@@5)))
(= k@@5 (frameFieldToSlot l@@14 (roS8 (+ (+ (frameDescriptor l@@14) 6) k@@5))))))
 :qid |Bartokib.337:17|
 :skolemid |164|
 :pattern ( (TVF l@@14) (TSlot k@@5))
))
(forall ((s@@12 Int) (j@@63 Int) ) (! (=> (and
(<= 0 s@@12)
(< s@@12 ?SectionCount)
(<= 0 j@@63)) (and
(inRo (+ ?DataSectionBase (* 4 s@@12)) 4)
(inRo (+ ?DataSectionEnd (* 4 s@@12)) 4)
(inRo (+ ?StaticDataPointerBitMap (* 4 s@@12)) 4)
(=> (< (+ (sectionBase s@@12) (* 4 j@@63)) (sectionEnd s@@12)) (and
(inSectionData (+ (ro32 (+ ?DataSectionBase (* 4 s@@12))) (* 4 j@@63)))
(inRo (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@12))) (* 4 (shr j@@63 5))) 4)
(< (q@and j@@63 31) 32)
(= (sectionHasPtr s@@12 j@@63) (getBit (ro32 (+ (ro32 (+ ?StaticDataPointerBitMap (* 4 s@@12))) (* 4 (shr j@@63 5)))) (q@and j@@63 31)))))))
 :qid |Bartokib.342:17|
 :skolemid |165|
 :pattern ( (TVS s@@12 j@@63))
))
(forall ((f@@26 Int) ) (! (forall ((t@@20 Int) ) (! (=> (TT t@@20) (=> (and
(<= 0 t@@20)
(< t@@20 ?CallSiteTableCount)) (and
(inRo (+ ?CodeBaseStartTable (* 4 t@@20)) 4)
(inRo (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@20)) 4)
(inRo (+ ?CallSiteSetCount (* 4 t@@20)) 4)
(inRo (ro32 (+ ?CallSiteSetCount (* 4 t@@20))) 4)
(inRo (+ ?CallSiteSetNumberToIndex (* 4 t@@20)) 4)
(inRo (+ ?ActivationDescriptorTable (* 4 t@@20)) 4)
(forall ((j@@64 Int) ) (! (=> (TO j@@64) (=> (and
(<= 0 j@@64)
(<= j@@64 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@20)))))) (and
(inRo (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@20))) (* 4 j@@64)) 4)
(inRo (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@20))) (* 2 j@@64)) 2)
(inRo (+ (ro32 (+ ?ActivationDescriptorTable (* 4 t@@20))) (* 4 (roU16 (+ (ro32 (+ ?CallSiteSetNumberToIndex (* 4 t@@20))) (* 2 j@@64))))) 4))))
 :qid |Bartokib.355:340|
 :skolemid |166|
 :pattern ( (TO j@@64))
)))))
 :qid |Bartokib.355:41|
 :skolemid |167|
 :pattern ( (TT t@@20))
))
 :qid |Bartokib.355:17|
 :skolemid |168|
 :pattern ( (TVFT f@@26))
))
(forall ((f@@27 Int) ) (! (forall ((t@@21 Int) (j1@@7 Int) (j2@@7 Int) ) (! (=> (and
(TT t@@21)
(TO j1@@7)
(TO j2@@7)) (=> (and
(<= 0 t@@21)
(< t@@21 ?CallSiteTableCount)
(<= 0 j1@@7)
(< j1@@7 j2@@7)
(<= j2@@7 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@21)))))) (< (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@21))) (* 4 j1@@7))) (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@21))) (* 4 j2@@7))))))
 :qid |Bartokib.372:41|
 :skolemid |169|
 :pattern ( (TT t@@21) (TO j1@@7) (TO j2@@7))
))
 :qid |Bartokib.372:17|
 :skolemid |170|
 :pattern ( (TVFT f@@27))
))) (and
(! (or %lbl%@57720 (TVT $abs@@2 $vt@@3)) :lblneg @57720)
(=> (TVT $abs@@2 $vt@@3) (=> (= call19164formal@$ptr@0 (+ ecx ?VT_ARRAY_ELEMENT_SIZE)) (and
(! (or %lbl%@57738 (inRo call19164formal@$ptr@0 4)) :lblneg @57738)
(=> (inRo call19164formal@$ptr@0 4) (=> (word call19164formal@$val@0) (=> (and
(= call19164formal@$val@0 (ro32 call19164formal@$ptr@0))
(= call19169formal@$ptr@0 (+ ecx ?VT_ARRAY_ELEMENT_CLASS))) (and
(! (or %lbl%@57779 (inRo call19169formal@$ptr@0 4)) :lblneg @57779)
(=> (inRo call19169formal@$ptr@0 4) (=> (word call19169formal@$val@0) (=> (and
(= call19169formal@$val@0 (ro32 call19169formal@$ptr@0))
(= call19174formal@$ptr@0 (+ call19169formal@$val@0 ?VT_MASK))) (and
(! (or %lbl%@57819 (inRo call19174formal@$ptr@0 4)) :lblneg @57819)
(=> (inRo call19174formal@$ptr@0 4) (=> (and
(word call19174formal@$val@0)
(= call19174formal@$val@0 (ro32 call19174formal@$ptr@0))) (and
(! (or %lbl%@57848 (= call19164formal@$val@0 (arrayElementSize $vt@@3))) :lblneg @57848)
(=> (= call19164formal@$val@0 (arrayElementSize $vt@@3)) (and
(! (or %lbl%@57855 (= call19174formal@$val@0 (mask (arrayElementClass $vt@@3)))) :lblneg @57855)
(=> (= call19174formal@$val@0 (mask (arrayElementClass $vt@@3))) true)))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@7 (=> (! (and %lbl%+56361 true) :lblpos +56361) (=> (= ecx $vt@@3) (=> (and
(VTable $abs@@2 $vt@@3)
(= (tag@@1 $vt@@3) ?OTHER_VECTOR_TAG)) anon0_correct@@7)))))
PreconditionGeneratedEntry_correct@@7))
))
(check-sat)
(pop 1)
