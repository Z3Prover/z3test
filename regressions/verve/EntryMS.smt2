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
(declare-fun ?NIdt () Int)
(declare-fun IsHandlerForEntry (Int Int) Bool)
(declare-fun ?FatalHandler () Int)
(declare-fun ?CodeSegmentSelector () Int)
(declare-fun ?Mask16Hi () Int)
(declare-fun ?Mask16Lo () Int)
(declare-fun ?IdtWord4Lo () Int)
(declare-fun IdtWord0 (Int) Int)
(declare-fun IdtWord4 (Int) Int)
(declare-fun ?idtHi () Int)
(declare-fun ?idtLo () Int)
(declare-fun IdtMemOk ((Array Int Bool)) Bool)
(declare-fun PicOk ((Array Int Int)) Bool)
(declare-fun TimerOk (Int) Bool)
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
(declare-fun roU8 (Int) Int)
(declare-fun ?RsdpExists () Bool)
(declare-fun ?RsdtPtr () Int)
(declare-fun ?RsdpPtr () Int)
(declare-fun ?RsdtCount () Int)
(declare-fun ?DmarExists () Bool)
(declare-fun ?BYTE_VECTOR_VTABLE () Int)
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
(declare-fun StackHi (Int) Int)
(declare-fun StackLo (Int) Int)
(declare-fun SpRequire (Int Int Int) Bool)
(declare-fun StackCheckInv (Int Int) Bool)
(declare-fun ScanStackInv (Int (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int (Array Int T@$FrameLayout)) (Array Int (Array Int Int)) (Array Int (Array Int (Array Int Int))) (Array Int (Array Int Int)) Int Int Int) Bool)
(declare-fun %lbl%+85181 () Bool)
(declare-fun %lbl%@86757 () Bool)
(declare-fun esp@1 () Int)
(declare-fun esp () Int)
(declare-fun %lbl%@86765 () Bool)
(declare-fun %lbl%@86773 () Bool)
(declare-fun $Mem@@3 () (Array Int Int))
(declare-fun $sMem@@5 () (Array Int Int))
(declare-fun $dMem@@0 () (Array Int Int))
(declare-fun $pciMem@@1 () (Array Int Int))
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
(declare-fun %lbl%@86803 () Bool)
(declare-fun %lbl%@86810 () Bool)
(declare-fun eax@1 () Int)
(declare-fun ecx () Int)
(declare-fun edx@1 () Int)
(declare-fun ebx@1 () Int)
(declare-fun esi@1 () Int)
(declare-fun edi () Int)
(declare-fun ebp () Int)
(declare-fun %lbl%@86846 () Bool)
(declare-fun $ghost_c@1 () Int)
(declare-fun $ghost_N () Int)
(declare-fun %lbl%@86859 () Bool)
(declare-fun %lbl%+25420 () Bool)
(declare-fun $Efl@6 () Int)
(declare-fun %lbl%@86582 () Bool)
(declare-fun call25195formal@$ret@0 () Int)
(declare-fun call25396formal@$ret@0 () Int)
(declare-fun %lbl%@86612 () Bool)
(declare-fun %lbl%@86642 () Bool)
(declare-fun call25401formal@$oldRA@0 () T@ReturnTo)
(declare-fun $RET@@0 () T@ReturnTo)
(declare-fun %lbl%@86664 () Bool)
(declare-fun %lbl%@86674 () Bool)
(declare-fun esp@0 () Int)
(declare-fun $ghost_c@0 () Int)
(declare-fun esi@0 () Int)
(declare-fun ebx@0 () Int)
(declare-fun edx@0 () Int)
(declare-fun eax@0 () Int)
(declare-fun %lbl%+25418 () Bool)
(declare-fun call25230formal@$ret@0 () Int)
(declare-fun call25238formal@$ret@0 () Int)
(declare-fun call25246formal@$ret@0 () Int)
(declare-fun call25254formal@$ret@0 () Int)
(declare-fun %lbl%@86408 () Bool)
(declare-fun %lbl%@86438 () Bool)
(declare-fun %lbl%@86449 () Bool)
(declare-fun %lbl%@86463 () Bool)
(declare-fun %lbl%@86499 () Bool)
(declare-fun %lbl%@86503 () Bool)
(declare-fun %lbl%@86509 () Bool)
(declare-fun %lbl%@86513 () Bool)
(declare-fun %lbl%@86517 () Bool)
(declare-fun %lbl%@86521 () Bool)
(declare-fun %lbl%@86526 () Bool)
(declare-fun %lbl%@86536 () Bool)
(declare-fun %lbl%@86558 () Bool)
(declare-fun %lbl%+25417 () Bool)
(declare-fun $ghost_n@0 () Int)
(declare-fun $ghost_k@0 () Int)
(declare-fun $ghost_m@0 () Int)
(declare-fun call25386formal@$x@0 () T@opn)
(declare-fun call25386formal@$y@0 () T@opn)
(declare-fun %lbl%@86231 () Bool)
(declare-fun %lbl%@86236 () Bool)
(declare-fun %lbl%+25408 () Bool)
(declare-fun %lbl%@85665 () Bool)
(declare-fun %lbl%@85675 () Bool)
(declare-fun call25198formal@$ret@0 () Int)
(declare-fun call25205formal@$ret@0 () Int)
(declare-fun call25212formal@$ret@0 () Int)
(declare-fun call25219formal@$ret@0 () Int)
(declare-fun %lbl%@85804 () Bool)
(declare-fun %lbl%@85834 () Bool)
(declare-fun %lbl%@85845 () Bool)
(declare-fun %lbl%@85859 () Bool)
(declare-fun %lbl%@85895 () Bool)
(declare-fun %lbl%@85899 () Bool)
(declare-fun %lbl%@85905 () Bool)
(declare-fun %lbl%@85909 () Bool)
(declare-fun %lbl%@85913 () Bool)
(declare-fun %lbl%@85917 () Bool)
(declare-fun %lbl%@85922 () Bool)
(declare-fun %lbl%@85932 () Bool)
(declare-fun %lbl%@85954 () Bool)
(declare-fun %lbl%+85185 () Bool)
(declare-fun eax () Int)
(declare-fun edx () Int)
(declare-fun ebx () Int)
(declare-fun esi () Int)
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
(assert (= ?NIdt 256))
(assert (forall (($entry Int) ($handler Int) ) (! (= (IsHandlerForEntry $entry $handler) (= $handler ?FatalHandler))
 :qid |Interrup.25:28|
 :skolemid |17|
 :pattern ( (IsHandlerForEntry $entry $handler))
)))
(assert (= ?CodeSegmentSelector 32))
(assert (= ?Mask16Hi (+ 2147450880 2147450880)))
(assert (= ?Mask16Lo 65535))
(assert (= ?IdtWord4Lo 36352))
(assert (forall ((handler Int) ) (! (= (IdtWord0 handler) (q@or (shl ?CodeSegmentSelector 16) (q@and handler ?Mask16Lo)))
 :qid |Interrup.39:19|
 :skolemid |18|
 :pattern ( (IdtWord0 handler))
)))
(assert (forall ((handler@@0 Int) ) (! (= (IdtWord4 handler@@0) (q@or (q@and handler@@0 ?Mask16Hi) ?IdtWord4Lo))
 :qid |Interrup.40:19|
 :skolemid |19|
 :pattern ( (IdtWord4 handler@@0))
)))
(assert (= ?idtHi (+ ?idtLo (* ?NIdt 8))))
(assert (forall (($IdtMemOk (Array Int Bool)) ) (! (= (IdtMemOk $IdtMemOk) (forall ((i@@1 Int) ) (! (=> (TV i@@1) (=> (and
(<= 0 i@@1)
(< i@@1 ?NIdt)) (and
(select $IdtMemOk (+ ?idtLo (* 8 i@@1)))
(select $IdtMemOk (+ (+ ?idtLo (* 8 i@@1)) 4)))))
 :qid |Interrup.68:11|
 :skolemid |20|
 :pattern ( (TV i@@1))
)))
 :qid |Interrup.66:19|
 :skolemid |21|
 :pattern ( (IdtMemOk $IdtMemOk))
)))
(assert (forall (($PicSeq (Array Int Int)) ) (! (= (PicOk $PicSeq) (and
(>= (select $PicSeq 0) 5)
(>= (select $PicSeq 1) 5)))
 :qid |Interrup.94:16|
 :skolemid |22|
 :pattern ( (PicOk $PicSeq))
)))
(assert (forall (($TimerSeq Int) ) (! (= (TimerOk $TimerSeq) (= $TimerSeq 2))
 :qid |Interrup.128:18|
 :skolemid |23|
 :pattern ( (TimerOk $TimerSeq))
)))
(assert (= ?VgaTextLo 753664))
(assert (= ?VgaTextHi 761664))
(assert (forall ((i@@2 Int) ) (! (= (vgaAddr2 i@@2) (and
(<= ?VgaTextLo i@@2)
(<= i@@2 (- ?VgaTextHi 2))))
 :qid |Ioibpl.16:19|
 :skolemid |24|
 :pattern ( (vgaAddr2 i@@2))
)))
(assert (= ?RoBiosLo 917504))
(assert (= ?RoBiosHi 1048576))
(assert (forall ((i@@3 Int) ) (! (= (inBiosRo i@@3) (and
(<= ?RoBiosLo i@@3)
(< i@@3 ?RoBiosHi)))
 :qid |Ioibpl.75:19|
 :skolemid |25|
 :pattern ( (inBiosRo i@@3))
)))
(assert (forall ((ptr@@0 Int) ) (! (= (MatchesRsdp ptr@@0) (and
(= (ro32 (+ ptr@@0 0)) 541348690)
(= (ro32 (+ ptr@@0 4)) 542266448)
(= (q@and (ByteSum ptr@@0 (+ ptr@@0 20)) 255) 0)))
 :qid |Ioibpl.79:22|
 :skolemid |26|
 :pattern ( (MatchesRsdp ptr@@0))
)))
(assert (forall ((ptr@@1 Int) ) (! (= (MatchesDmar ptr@@1) (= (ro32 (+ ptr@@1 0)) 1380011332))
 :qid |Ioibpl.86:22|
 :skolemid |27|
 :pattern ( (MatchesDmar ptr@@1))
)))
(assert (forall ((ptr@@2 Int) ) (! (= (MatchesDrhd ptr@@2) (= (roU16 ptr@@2) 0))
 :qid |Ioibpl.91:22|
 :skolemid |28|
 :pattern ( (MatchesDrhd ptr@@2))
)))
(assert (forall ((ptr@@3 Int) (entry Int) ) (! (= (MaybeDrhd ptr@@3 entry) (and
(= (select ?DrhdPtr entry) ptr@@3)
(inRo (+ ptr@@3 0) 2)
(inRo (+ ptr@@3 2) 2)
(<= (+ ptr@@3 (roU16 (+ ptr@@3 2))) (+ ?DmarPtr ?DmarLen))))
 :qid |Ioibpl.96:20|
 :skolemid |29|
 :pattern ( (MaybeDrhd ptr@@3 entry))
)))
(assert (forall ((ptr@@4 Int) (entry@@0 Int) ) (! (= (DrhdInv ptr@@4 entry@@0) (and
(inRo (+ ptr@@4 8) 4)
(inRo (+ ptr@@4 12) 4)
(=> (= (ro32 (+ ptr@@4 12)) 0) (= (select ?DrhdRegs entry@@0) (ro32 (+ (select ?DrhdPtr entry@@0) 8))))))
 :qid |Ioibpl.104:18|
 :skolemid |30|
 :pattern ( (DrhdInv ptr@@4 entry@@0))
)))
(assert (= ?iomHi (+ ?iomLo 65536)))
(assert (= ?dmaHi (+ ?dmaLo (* (* 18 1024) 1024))))
(assert (forall ((i@@4 Int) ) (! (= (iomAddr i@@4) (and
(<= ?iomLo i@@4)
(< i@@4 ?iomHi)))
 :qid |Ioibpl.152:18|
 :skolemid |33|
 :pattern ( (iomAddr i@@4))
)))
(assert (forall ((ptr@@5 Int) ) (! (= (IsDmaPage ptr@@5) (and
(= (q@and ptr@@5 4095) 0)
(<= ?dmaLo ptr@@5)
(<= (+ ptr@@5 4096) ?dmaHi)))
 :qid |Ioibpl.194:20|
 :skolemid |35|
 :pattern ( (IsDmaPage ptr@@5))
)))
(assert (forall ((w0 Int) (w1 Int) ) (! (= (IoPageTableEntry w0 w1) (and
(= w1 0)
(or
(= w0 0)
(IsDmaPage (- w0 3)))))
 :qid |Ioibpl.200:27|
 :skolemid |36|
 :pattern ( (IoPageTableEntry w0 w1))
)))
(assert (forall (($IomMem (Array Int Int)) (ptr@@6 Int) ) (! (= (IoPageTable $IomMem ptr@@6) (and
(= (q@and ptr@@6 4095) 0)
(forall ((i@@5 Int) ) (! (=> (and
(TV i@@5)
(<= 0 i@@5)
(< i@@5 512)) (IoPageTableEntry (select $IomMem (+ ptr@@6 (* 8 i@@5))) (select $IomMem (+ (+ ptr@@6 (* 8 i@@5)) 4))))
 :qid |Ioibpl.208:13|
 :skolemid |37|
 :pattern ( (TV i@@5))
))))
 :qid |Ioibpl.205:37|
 :skolemid |38|
 :pattern ( (IoPageTable $IomMem ptr@@6))
)))
(assert (forall (($IomMem@@0 (Array Int Int)) (w0@@0 Int) (w1@@0 Int) ) (! (= (IoPageDirEntry $IomMem@@0 w0@@0 w1@@0) (and
(= w1@@0 0)
(or
(= w0@@0 0)
(IoPageTable $IomMem@@0 (- w0@@0 3)))))
 :qid |Ioibpl.212:25|
 :skolemid |39|
 :pattern ( (IoPageDirEntry $IomMem@@0 w0@@0 w1@@0))
)))
(assert (forall (($IomMem@@1 (Array Int Int)) (ptr@@7 Int) ) (! (= (IoPageDir $IomMem@@1 ptr@@7) (and
(= (q@and ptr@@7 4095) 0)
(forall ((i@@6 Int) ) (! (=> (and
(TV i@@6)
(<= 0 i@@6)
(< i@@6 512)) (IoPageDirEntry $IomMem@@1 (select $IomMem@@1 (+ ptr@@7 (* 8 i@@6))) (select $IomMem@@1 (+ (+ ptr@@7 (* 8 i@@6)) 4))))
 :qid |Ioibpl.220:13|
 :skolemid |40|
 :pattern ( (TV i@@6))
))))
 :qid |Ioibpl.217:35|
 :skolemid |41|
 :pattern ( (IoPageDir $IomMem@@1 ptr@@7))
)))
(assert (forall (($IomMem@@2 (Array Int Int)) (ptr@@8 Int) ) (! (= (IoPageDirStub $IomMem@@2 ptr@@8) (and
(= (q@and ptr@@8 4095) 0)
(= (select $IomMem@@2 (+ ptr@@8 4)) 0)
(forall ((i@@7 Int) ) (! (=> (and
(TV i@@7)
(<= 1 i@@7)
(< i@@7 512)) (and
(= (select $IomMem@@2 (+ ptr@@8 (* 8 i@@7))) 0)
(= (select $IomMem@@2 (+ (+ ptr@@8 (* 8 i@@7)) 4)) 0)))
 :qid |Ioibpl.228:13|
 :skolemid |42|
 :pattern ( (TV i@@7))
))))
 :qid |Ioibpl.224:39|
 :skolemid |43|
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
 :skolemid |44|
 :pattern ( (IoContextEntry $IomMem@@3 w0@@1 w1@@1 w2 w3))
)))
(assert (forall (($IomMem@@4 (Array Int Int)) (ptr@@9 Int) ) (! (= (IoContextTable $IomMem@@4 ptr@@9) (and
(= (q@and ptr@@9 4095) 0)
(forall ((i@@8 Int) ) (! (=> (and
(TV i@@8)
(<= 0 i@@8)
(< i@@8 256)) (IoContextEntry $IomMem@@4 (select $IomMem@@4 (+ (+ ptr@@9 (* 16 i@@8)) 0)) (select $IomMem@@4 (+ (+ ptr@@9 (* 16 i@@8)) 4)) (select $IomMem@@4 (+ (+ ptr@@9 (* 16 i@@8)) 8)) (select $IomMem@@4 (+ (+ ptr@@9 (* 16 i@@8)) 12))))
 :qid |Ioibpl.243:13|
 :skolemid |45|
 :pattern ( (TV i@@8))
))))
 :qid |Ioibpl.240:40|
 :skolemid |46|
 :pattern ( (IoContextTable $IomMem@@4 ptr@@9))
)))
(assert (forall (($IomMem@@5 (Array Int Int)) (w0@@2 Int) (w1@@2 Int) (w2@@0 Int) (w3@@0 Int) ) (! (= (IoRootEntry $IomMem@@5 w0@@2 w1@@2 w2@@0 w3@@0) (and
(= w3@@0 0)
(= w2@@0 0)
(= w1@@2 0)
(IoContextTable $IomMem@@5 (- w0@@2 1))))
 :qid |Ioibpl.251:22|
 :skolemid |47|
 :pattern ( (IoRootEntry $IomMem@@5 w0@@2 w1@@2 w2@@0 w3@@0))
)))
(assert (forall (($IomMem@@6 (Array Int Int)) (ptr@@10 Int) ) (! (= (IoRootTable $IomMem@@6 ptr@@10) (and
(= (q@and ptr@@10 4095) 0)
(forall ((i@@9 Int) ) (! (=> (and
(TV i@@9)
(<= 0 i@@9)
(< i@@9 256)) (IoRootEntry $IomMem@@6 (select $IomMem@@6 (+ (+ ptr@@10 (* 16 i@@9)) 0)) (select $IomMem@@6 (+ (+ ptr@@10 (* 16 i@@9)) 4)) (select $IomMem@@6 (+ (+ ptr@@10 (* 16 i@@9)) 8)) (select $IomMem@@6 (+ (+ ptr@@10 (* 16 i@@9)) 12))))
 :qid |Ioibpl.259:13|
 :skolemid |48|
 :pattern ( (TV i@@9))
))))
 :qid |Ioibpl.256:37|
 :skolemid |49|
 :pattern ( (IoRootTable $IomMem@@6 ptr@@10))
)))
(assert (forall ((id Int) ) (! (= (IsValidPciId id) (and
(<= 0 id)
(< id 65536)))
 :qid |Ioibpl.271:23|
 :skolemid |50|
 :pattern ( (IsValidPciId id))
)))
(assert (forall ((o Int) ) (! (= (IsValidPciOffset o) (and
(<= 0 o)
(< o 256)
(Aligned o)))
 :qid |Ioibpl.274:27|
 :skolemid |51|
 :pattern ( (IsValidPciOffset o))
)))
(assert (= ?FFFFFFFF (+ (+ 2147483647 2147483647) 1)))
(assert (forall ((config0 Int) ) (! (= (PciVendorId config0) (q@and config0 65535))
 :qid |Ioibpl.302:22|
 :skolemid |52|
 :pattern ( (PciVendorId config0))
)))
(assert (forall ((config12 Int) ) (! (= (PciHeaderType config12) (q@and (shr config12 16) 255))
 :qid |Ioibpl.303:24|
 :skolemid |53|
 :pattern ( (PciHeaderType config12))
)))
(assert (>= WORD_HI 100))
(assert (forall ((a@@2 Int) (b1@@0 Int) (b2@@0 Int) ) (! (= (Mult a@@2 (+ b1@@0 b2@@0)) (* a@@2 (+ b1@@0 b2@@0)))
 :qid |baseaxio.13:15|
 :skolemid |54|
 :pattern ( (TVM3 a@@2 b1@@0 b2@@0))
)))
(assert (forall ((i@@10 Int) (j Int) ) (! (=> (and
(TV i@@10)
(TO j)) (= (Aligned i@@10) (Aligned (+ i@@10 (* 4 j)))))
 :qid |memoryax.10:15|
 :skolemid |55|
 :pattern ( (TV i@@10) (TO j))
)))
(assert (< NULL ?memLo))
(assert (<= ?memLo ?memHi))
(assert (< ?memHi WORD_HI))
(assert (Aligned ?memLo))
(assert (Aligned ?memHi))
(assert (forall (($index@@1 Int) ($descriptor@@3 T@SegmentDescriptor) ) (! (= (SegmentRegisterGetIndex (SegmentRegisterCreate $index@@1 $descriptor@@3)) $index@@1)
 :qid |assembly.29:15|
 :skolemid |56|
 :pattern ( (SegmentRegisterGetIndex (SegmentRegisterCreate $index@@1 $descriptor@@3)))
)))
(assert (forall (($index@@2 Int) ($descriptor@@4 T@SegmentDescriptor) ) (! (= (SegmentRegisterGetDescriptor (SegmentRegisterCreate $index@@2 $descriptor@@4)) $descriptor@@4)
 :qid |assembly.33:15|
 :skolemid |57|
 :pattern ( (SegmentRegisterGetDescriptor (SegmentRegisterCreate $index@@2 $descriptor@@4)))
)))
(assert (forall (($base@@1 Int) ($type Int) ) (! (= (SegmentDescriptorGetBase (SegmentDescriptorCreate $base@@1 $type)) $base@@1)
 :qid |assembly.37:15|
 :skolemid |58|
 :pattern ( (SegmentDescriptorGetBase (SegmentDescriptorCreate $base@@1 $type)))
)))
(assert (forall (($base@@2 Int) ($type@@0 Int) ) (! (= (SegmentDescriptorGetType (SegmentDescriptorCreate $base@@2 $type@@0)) $type@@0)
 :qid |assembly.39:15|
 :skolemid |59|
 :pattern ( (SegmentDescriptorGetType (SegmentDescriptorCreate $base@@2 $type@@0)))
)))
(assert (forall ((f Int) (x@@0 Int) (y Int) ) (! (=> (FlagsCmp f x@@0 y) (= (Je f) (= x@@0 y)))
 :qid |assembly.46:15|
 :skolemid |60|
 :pattern ( (FlagsCmp f x@@0 y) (Je f))
)))
(assert (forall ((f@@0 Int) (x@@1 Int) (y@@0 Int) ) (! (=> (FlagsCmp f@@0 x@@1 y@@0) (= (Jne f@@0) (not (= x@@1 y@@0))))
 :qid |assembly.47:15|
 :skolemid |61|
 :pattern ( (FlagsCmp f@@0 x@@1 y@@0) (Jne f@@0))
)))
(assert (forall ((f@@1 Int) (x@@2 Int) (y@@1 Int) ) (! (=> (FlagsCmp f@@1 x@@2 y@@1) (= (Jbe f@@1) (<= x@@2 y@@1)))
 :qid |assembly.48:15|
 :skolemid |62|
 :pattern ( (FlagsCmp f@@1 x@@2 y@@1) (Jbe f@@1))
)))
(assert (forall ((f@@2 Int) (x@@3 Int) (y@@2 Int) ) (! (=> (FlagsCmp f@@2 x@@3 y@@2) (= (Jb f@@2) (< x@@3 y@@2)))
 :qid |assembly.49:15|
 :skolemid |63|
 :pattern ( (FlagsCmp f@@2 x@@3 y@@2) (Jb f@@2))
)))
(assert (forall ((f@@3 Int) (x@@4 Int) (y@@3 Int) ) (! (=> (FlagsCmp f@@3 x@@4 y@@3) (= (Jae f@@3) (>= x@@4 y@@3)))
 :qid |assembly.50:15|
 :skolemid |64|
 :pattern ( (FlagsCmp f@@3 x@@4 y@@3) (Jae f@@3))
)))
(assert (forall ((f@@4 Int) (x@@5 Int) (y@@4 Int) ) (! (=> (FlagsCmp f@@4 x@@5 y@@4) (= (Ja f@@4) (> x@@5 y@@4)))
 :qid |assembly.51:15|
 :skolemid |65|
 :pattern ( (FlagsCmp f@@4 x@@5 y@@4) (Ja f@@4))
)))
(assert (forall ((Mem (Array Int Int)) (reg Int) ) (! (OpnOk Mem (OpnReg reg))
 :qid |assembly.56:15|
 :skolemid |66|
 :pattern ( (OpnOk Mem (OpnReg reg)))
)))
(assert (forall ((Mem@@0 (Array Int Int)) (ptr@@11 Int) ) (! (=> (PtrOk ptr@@11) (OpnOk Mem@@0 (OpnMem ptr@@11)))
 :qid |assembly.57:15|
 :skolemid |67|
 :pattern ( (OpnOk Mem@@0 (OpnMem ptr@@11)))
)))
(assert (forall ((Mem@@1 (Array Int Int)) (reg@@0 Int) ) (! (= (EvalOpn Mem@@1 (OpnReg reg@@0)) reg@@0)
 :qid |assembly.58:15|
 :skolemid |68|
 :pattern ( (EvalOpn Mem@@1 (OpnReg reg@@0)))
)))
(assert (forall ((Mem@@2 (Array Int Int)) (ptr@@12 Int) ) (! (= (EvalOpn Mem@@2 (OpnMem ptr@@12)) (select Mem@@2 ptr@@12))
 :qid |assembly.59:15|
 :skolemid |69|
 :pattern ( (EvalOpn Mem@@2 (OpnMem ptr@@12)))
)))
(assert (forall ((Mem@@3 (Array Int Int)) (reg@@1 Int) (v Int) ) (! (= (UpdateOpn Mem@@3 (OpnReg reg@@1) v) Mem@@3)
 :qid |assembly.60:15|
 :skolemid |70|
 :pattern ( (UpdateOpn Mem@@3 (OpnReg reg@@1) v))
)))
(assert (forall ((Mem@@4 (Array Int Int)) (ptr@@13 Int) (v@@0 Int) ) (! (= (UpdateOpn Mem@@4 (OpnMem ptr@@13) v@@0) (store Mem@@4 ptr@@13 v@@0))
 :qid |assembly.61:15|
 :skolemid |71|
 :pattern ( (UpdateOpn Mem@@4 (OpnMem ptr@@13) v@@0))
)))
(assert (forall ((i@@11 Int) (size Int) ) (! (=> (and
(<= ?RoBiosLo i@@11)
(<= (+ i@@11 size) ?RoBiosHi)) (inRo i@@11 size))
 :qid |Ioaxioms.6:15|
 :skolemid |72|
 :pattern ( (inRo i@@11 size))
)))
(assert (forall ((ptr@@14 Int) ) (! (= (ByteSum ptr@@14 ptr@@14) 0)
 :qid |Ioaxioms.8:15|
 :skolemid |73|
 :pattern ( (ByteSum ptr@@14 ptr@@14))
)))
(assert (forall ((ptr@@15 Int) (end Int) ) (! (=> (<= ptr@@15 end) (= (ByteSum ptr@@15 (+ end 1)) (+ (ByteSum ptr@@15 end) (roU8 end))))
 :qid |Ioaxioms.9:15|
 :skolemid |74|
 :pattern ( (ByteSum ptr@@15 end))
)))
(assert (=> ?RsdpExists (and
(= ?RsdtPtr (ro32 (+ ?RsdpPtr 16)))
(inRo (+ ?RsdtPtr 4) 4)
(= (+ 36 (* 4 ?RsdtCount)) (ro32 (+ ?RsdtPtr 4)))
(>= ?RsdtCount 0)
(word ?RsdtPtr)
(word (+ (+ ?RsdtPtr 36) (* 4 ?RsdtCount)))
(forall ((i@@12 Int) ) (! (=> (and
(TV i@@12)
(<= 0 i@@12)
(< i@@12 ?RsdtCount)) (and
(inRo (+ (+ ?RsdtPtr 36) (* 4 i@@12)) 4)
(inRo (ro32 (+ (+ ?RsdtPtr 36) (* 4 i@@12))) 4)))
 :qid |Ioaxioms.17:13|
 :skolemid |75|
 :pattern ( (TV i@@12))
)))))
(assert (=> ?DmarExists (and
(inRo (+ ?DmarPtr 4) 4)
(= ?DmarLen (ro32 (+ ?DmarPtr 4)))
(>= ?DmarLen 48)
(word ?DmarPtr)
(word (+ ?DmarPtr ?DmarLen))
(MaybeDrhd (+ ?DmarPtr 48) 0))))
(assert (word ?BYTE_VECTOR_VTABLE))
(assert (forall (($Mem@@0 (Array Int Int)) (s Int) (i@@13 Int) ) (! (= (select (select (MapStacksToMem $Mem@@0) s) i@@13) (select $Mem@@0 i@@13))
 :qid |utilibpl.20:15|
 :skolemid |76|
 :pattern ( (select (select (MapStacksToMem $Mem@@0) s) i@@13))
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
 :skolemid |77|
 :pattern ( (IsStackStateTag tag))
)))
(assert (forall ((tag@@0 Int) (state T@StackState) ) (! (= (IsStackStateTagFor tag@@0 state) (and
(IsStackStateTag tag@@0)
(= tag@@0 (StackStateTag state))))
 :qid |stacksib.62:30|
 :skolemid |78|
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
(assert (forall ((i@@14 Int) ) (! (= (gcAddr i@@14) (and
(<= ?gcLo i@@14)
(< i@@14 ?gcHi)))
 :qid |separati.58:18|
 :skolemid |83|
 :pattern ( (gcAddr i@@14))
)))
(assert (forall ((i@@15 Int) ) (! (= (gcAddrEx i@@15) (and
(<= ?gcLo i@@15)
(<= i@@15 ?gcHi)))
 :qid |separati.59:20|
 :skolemid |84|
 :pattern ( (gcAddrEx i@@15))
)))
(assert (forall ((s@@0 Int) ) (! (= (isStack s@@0) (and
(<= 0 s@@0)
(< s@@0 ?NumStacks)))
 :qid |separati.61:19|
 :skolemid |85|
 :pattern ( (isStack s@@0))
)))
(assert (forall ((i@@16 Int) ) (! (= (sAddr i@@16) (and
(<= ?sLo i@@16)
(< i@@16 ?sHi)))
 :qid |separati.63:17|
 :skolemid |86|
 :pattern ( (sAddr i@@16))
)))
(assert (forall ((i@@17 Int) ) (! (= (sAddrEx i@@17) (and
(<= ?sLo i@@17)
(<= i@@17 ?sHi)))
 :qid |separati.64:19|
 :skolemid |87|
 :pattern ( (sAddrEx i@@17))
)))
(assert (forall ((i@@18 Int) ) (! (= (dAddr i@@18) (and
(<= ?dLo i@@18)
(< i@@18 ?dHi)))
 :qid |separati.66:17|
 :skolemid |88|
 :pattern ( (dAddr i@@18))
)))
(assert (forall ((i@@19 Int) ) (! (= (dAddrEx i@@19) (and
(<= ?dLo i@@19)
(<= i@@19 ?dHi)))
 :qid |separati.67:19|
 :skolemid |89|
 :pattern ( (dAddrEx i@@19))
)))
(assert (forall ((i@@20 Int) ) (! (= (pciAddr i@@20) (and
(<= ?pciLo i@@20)
(< i@@20 ?pciHi)))
 :qid |separati.69:19|
 :skolemid |90|
 :pattern ( (pciAddr i@@20))
)))
(assert (forall ((i@@21 Int) ) (! (= (pciAddrEx i@@21) (and
(<= ?pciLo i@@21)
(<= i@@21 ?pciHi)))
 :qid |separati.70:21|
 :skolemid |91|
 :pattern ( (pciAddrEx i@@21))
)))
(assert (forall ((s@@1 Int) (i@@22 Int) ) (! (= (fAddr s@@1 i@@22) (and
(isStack s@@1)
(<= (+ ?fLo (* s@@1 ?FSize)) i@@22)
(< i@@22 (+ (+ ?fLo (* s@@1 ?FSize)) ?FSize))))
 :qid |separati.72:17|
 :skolemid |92|
 :pattern ( (fAddr s@@1 i@@22))
)))
(assert (forall ((s@@2 Int) (i@@23 Int) ) (! (= (fAddrEx s@@2 i@@23) (and
(isStack s@@2)
(<= (+ ?fLo (* s@@2 ?FSize)) i@@23)
(<= i@@23 (+ (+ ?fLo (* s@@2 ?FSize)) ?FSize))))
 :qid |separati.73:19|
 :skolemid |93|
 :pattern ( (fAddrEx s@@2 i@@23))
)))
(assert (forall ((s@@3 Int) (i@@24 Int) ) (! (= (tAddr s@@3 i@@24) (and
(isStack s@@3)
(<= (+ ?tLo (* s@@3 ?TSize)) i@@24)
(< i@@24 (+ (+ ?tLo (* s@@3 ?TSize)) ?TSize))))
 :qid |separati.75:17|
 :skolemid |94|
 :pattern ( (tAddr s@@3 i@@24))
)))
(assert (forall ((s@@4 Int) (i@@25 Int) ) (! (= (tAddrEx s@@4 i@@25) (and
(isStack s@@4)
(<= (+ ?tLo (* s@@4 ?TSize)) i@@25)
(<= i@@25 (+ (+ ?tLo (* s@@4 ?TSize)) ?TSize))))
 :qid |separati.76:19|
 :skolemid |95|
 :pattern ( (tAddrEx s@@4 i@@25))
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
 :skolemid |96|
 :pattern ( (MemInv $Mem@@1 $sMem $dMem $pciMem $tMems $fMems $gcMem SLo DLo PciLo TLo FLo GcLo GcHi))
)))
(assert (forall ((n Int) ($sMem@@0 (Array Int Int)) ($esp Int) ) (! (= (SMemRequire n $sMem@@0 $esp) (and
(Aligned $esp)
(<= (+ ?sLo n) $esp)
(<= $esp ?sHi)))
 :qid |separati.198:23|
 :skolemid |97|
 :pattern ( (SMemRequire n $sMem@@0 $esp))
)))
(assert (forall ((n@@0 Int) (m Int) ($sMem@@1 (Array Int Int)) ($esp@@0 Int) ) (! (= (SMemRequireInline n@@0 m $sMem@@1 $esp@@0) (and
(Aligned $esp@@0)
(Aligned (+ $esp@@0 m))
(<= (+ ?sLo n@@0) $esp@@0)
(<= (+ $esp@@0 m) ?sHi)))
 :qid |separati.205:29|
 :skolemid |98|
 :pattern ( (SMemRequireInline n@@0 m $sMem@@1 $esp@@0))
)))
(assert (forall ((n@@1 Int) ($sMem@@2 (Array Int Int)) ($esp@@1 Int) ($RET T@ReturnTo) ) (! (= (SMemRequireRA n@@1 $sMem@@2 $esp@@1 $RET) (and
(SMemRequire n@@1 $sMem@@2 $esp@@1)
(<= (+ ?sLo n@@1) $esp@@1)
(<= $esp@@1 (- ?sHi 4))
(= (ReturnToAddr (select $sMem@@2 $esp@@1)) $RET)))
 :qid |separati.213:25|
 :skolemid |99|
 :pattern ( (SMemRequireRA n@@1 $sMem@@2 $esp@@1 $RET))
)))
(assert (forall (($sMem@@3 (Array Int Int)) (oldSMem (Array Int Int)) ($esp@@2 Int) (oldEsp Int) ) (! (= (SMemInv $sMem@@3 oldSMem $esp@@2 oldEsp) (and
(= $esp@@2 oldEsp)
(forall ((i@@26 Int) ) (! (=> (<= $esp@@2 i@@26) (= (select $sMem@@3 i@@26) (select oldSMem i@@26)))
 :qid |separati.224:27|
 :skolemid |100|
 :pattern ( (select $sMem@@3 i@@26))
))))
 :qid |separati.221:19|
 :skolemid |101|
 :pattern ( (SMemInv $sMem@@3 oldSMem $esp@@2 oldEsp))
)))
(assert (forall (($sMem@@4 (Array Int Int)) (oldSMem@@0 (Array Int Int)) ($esp@@3 Int) (oldEsp@@0 Int) ) (! (= (SMemEnsure $sMem@@4 oldSMem@@0 $esp@@3 oldEsp@@0) (and
(= $esp@@3 (+ oldEsp@@0 4))
(forall ((i@@27 Int) ) (! (=> (<= $esp@@3 i@@27) (= (select $sMem@@4 i@@27) (select oldSMem@@0 i@@27)))
 :qid |separati.231:29|
 :skolemid |102|
 :pattern ( (select $sMem@@4 i@@27))
))))
 :qid |separati.228:22|
 :skolemid |103|
 :pattern ( (SMemEnsure $sMem@@4 oldSMem@@0 $esp@@3 oldEsp@@0))
)))
(assert (forall ((a@@3 (Array Int Int)) (off Int) (aBase Int) (bb (Array Int Int)) (i0 Int) (i1@@0 Int) (i2@@0 Int) (g1 Int) (g2 Int) ) (! (= (bbvec4 a@@3 off aBase bb i0 i1@@0 i2@@0 g1 g2) (forall ((i@@28 Int) ) (! (=> (and
(TV i@@28)
(<= i1@@0 i@@28)
(< i@@28 i2@@0)
(Aligned (- i@@28 i0))) (and
(between g1 g2 (+ g1 (BitIndex i0 i@@28)))
(= (= (select a@@3 (+ aBase (- i@@28 i0))) off) (BitZero (select bb (+ g1 (BitIndex i0 i@@28))) i0 i@@28))))
 :qid |BitVecto.12:11|
 :skolemid |105|
 :pattern ( (TV i@@28))
)))
 :qid |BitVecto.10:17|
 :skolemid |106|
 :pattern ( (bbvec4 a@@3 off aBase bb i0 i1@@0 i2@@0 g1 g2))
)))
(assert (forall ((a@@4 (Array Int Int)) (aBase@@0 Int) (bb@@0 (Array Int Int)) (i0@@0 Int) (i1@@1 Int) (i2@@1 Int) (g1@@0 Int) (g2@@0 Int) ) (! (= (bb2vec4 a@@4 aBase@@0 bb@@0 i0@@0 i1@@1 i2@@1 g1@@0 g2@@0) (forall ((i@@29 Int) ) (! (=> (and
(TV i@@29)
(word (- i@@29 i0@@0))
(<= i1@@1 i@@29)
(< i@@29 i2@@1)
(Aligned (- i@@29 i0@@0))) (and
(between g1@@0 g2@@0 (+ g1@@0 (ColorIndex i0@@0 i@@29)))
(= (select a@@4 (+ aBase@@0 (- i@@29 i0@@0))) (ColorGet (select bb@@0 (+ g1@@0 (ColorIndex i0@@0 i@@29))) i0@@0 i@@29))))
 :qid |BitVecto.20:11|
 :skolemid |107|
 :pattern ( (TV i@@29))
)))
 :qid |BitVecto.18:18|
 :skolemid |108|
 :pattern ( (bb2vec4 a@@4 aBase@@0 bb@@0 i0@@0 i1@@1 i2@@1 g1@@0 g2@@0))
)))
(assert (forall ((rev (Array Int Int)) (ptr@@16 Int) (q@abs Int) ) (! (= (Pointer rev ptr@@16 q@abs) (and
(gcAddr ptr@@16)
(Aligned ptr@@16)
(not (= q@abs NO_ABS))
(= (select rev ptr@@16) q@abs)))
 :qid |GcMemory.38:19|
 :skolemid |111|
 :pattern ( (Pointer rev ptr@@16 q@abs))
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
 :skolemid |112|
 :pattern ( (InteriorValue isPtr rev@@0 val@@1 q@abs@@0 offset))
)))
(assert (forall ((isPtr@@0 Bool) (rev@@1 (Array Int Int)) (val@@2 Int) (q@abs@@1 Int) ) (! (= (Value isPtr@@0 rev@@1 val@@2 q@abs@@1) (InteriorValue isPtr@@0 rev@@1 val@@2 q@abs@@1 0))
 :qid |GcMemory.55:17|
 :skolemid |113|
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
 :skolemid |114|
 :pattern ( (TV i1@@2) (TV i2@@2))
)))
 :qid |GcMemory.80:22|
 :skolemid |115|
 :pattern ( (WellFormed $toAbs))
)))
(assert (forall ((slot Int) ) (! (= (TSlot slot) true)
 :qid |Bartokib.10:32|
 :skolemid |116|
 :pattern ( (TSlot slot))
)))
(assert (forall ((table Int) ) (! (= (TT table) true)
 :qid |Bartokib.13:29|
 :skolemid |117|
 :pattern ( (TT table))
)))
(assert (forall ((x@@6 Int) (i@@30 Int) ) (! (= (getBit x@@6 i@@30) (= 1 (q@and (shr x@@6 i@@30) 1)))
 :qid |Bartokib.19:18|
 :skolemid |118|
 :pattern ( (getBit x@@6 i@@30))
)))
(assert (forall ((x@@7 Int) (i@@31 Int) ) (! (= (getNib x@@7 i@@31) (q@and (shr x@@7 i@@31) 15))
 :qid |Bartokib.20:18|
 :skolemid |119|
 :pattern ( (getNib x@@7 i@@31))
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
 :skolemid |120|
 :pattern ( (isOtherTag t))
)))
(assert (forall ((t@@0 Int) ) (! (= (isVarSize t@@0) (or
(= t@@0 ?PTR_VECTOR_TAG)
(= t@@0 ?OTHER_VECTOR_TAG)
(= t@@0 ?PTR_ARRAY_TAG)
(= t@@0 ?OTHER_ARRAY_TAG)
(= t@@0 ?STRING_TAG)))
 :qid |Bartokib.40:21|
 :skolemid |121|
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
 :skolemid |122|
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
 :skolemid |123|
 :pattern ( (mask vt))
)))
(assert (forall ((vt@@0 Int) ) (! (= (tag@@1 vt@@0) (q@and (mask vt@@0) 15))
 :qid |Bartokib.67:15|
 :skolemid |124|
 :pattern ( (tag@@1 vt@@0))
)))
(assert (forall ((vt@@1 Int) ) (! (= (baseLength vt@@1) (ro32 (+ vt@@1 ?VT_BASE_LENGTH)))
 :qid |Bartokib.68:22|
 :skolemid |125|
 :pattern ( (baseLength vt@@1))
)))
(assert (forall ((vt@@2 Int) ) (! (= (arrayElementSize vt@@2) (ro32 (+ vt@@2 ?VT_ARRAY_ELEMENT_SIZE)))
 :qid |Bartokib.69:28|
 :skolemid |126|
 :pattern ( (arrayElementSize vt@@2))
)))
(assert (forall ((vt@@3 Int) ) (! (= (arrayElementClass vt@@3) (ro32 (+ vt@@3 ?VT_ARRAY_ELEMENT_CLASS)))
 :qid |Bartokib.70:29|
 :skolemid |127|
 :pattern ( (arrayElementClass vt@@3))
)))
(assert (forall ((vt@@4 Int) ) (! (= (arrayOf vt@@4) (ro32 (+ vt@@4 ?VT_ARRAY_OF)))
 :qid |Bartokib.71:19|
 :skolemid |128|
 :pattern ( (arrayOf vt@@4))
)))
(assert (forall ((vt@@5 Int) ) (! (= (baseWords vt@@5) (shr (baseLength vt@@5) 2))
 :qid |Bartokib.73:21|
 :skolemid |129|
 :pattern ( (baseWords vt@@5))
)))
(assert (forall ((vt@@6 Int) ) (! (= (arrayElementWords vt@@6) (shr (arrayElementSize vt@@6) 2))
 :qid |Bartokib.74:29|
 :skolemid |130|
 :pattern ( (arrayElementWords vt@@6))
)))
(assert (= ?TYPE_STRUCT 3))
(assert (forall ((q@abs@@2 Int) (vt@@7 Int) (j@@1 Int) (field Int) ) (! (= (Sparse1 q@abs@@2 vt@@7 j@@1 field) (and
(= (VFieldPtr q@abs@@2 j@@1) (not (= (fieldToSlot vt@@7 field) 0)))
(=> (not (= (fieldToSlot vt@@7 field) 0)) (and
(between 1 8 (fieldToSlot vt@@7 field))
(= (- (getNib (mask vt@@7) (* 4 (fieldToSlot vt@@7 field))) 1) field)))))
 :qid |Bartokib.85:19|
 :skolemid |131|
 :pattern ( (Sparse1 q@abs@@2 vt@@7 j@@1 field))
)))
(assert (forall ((vt@@8 Int) (nFields Int) ) (! (= (Sparse2 vt@@8 nFields) (forall ((k Int) ) (! (=> (TSlot k) (=> (and
(<= 1 k)
(< k 8)
(not (= (getNib (mask vt@@8) (* 4 k)) 0))) (and
(between 0 nFields (- (getNib (mask vt@@8) (* 4 k)) 1))
(= (fieldToSlot vt@@8 (- (getNib (mask vt@@8) (* 4 k)) 1)) k))))
 :qid |Bartokib.95:11|
 :skolemid |132|
 :pattern ( (TSlot k))
)))
 :qid |Bartokib.92:19|
 :skolemid |133|
 :pattern ( (Sparse2 vt@@8 nFields))
)))
(assert (forall ((q@abs@@3 Int) (vt@@9 Int) ) (! (= (TVT q@abs@@3 vt@@9) true)
 :qid |Bartokib.99:30|
 :skolemid |134|
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
 :skolemid |135|
 :pattern ( (TO j@@2))
)))
(=> (= (tag@@1 vt@@10) ?SPARSE_TAG) (and
(forall ((j@@3 Int) ) (! (=> (TO j@@3) (Sparse1 q@abs@@4 vt@@10 j@@3 (- j@@3 2)))
 :qid |Bartokib.101:271|
 :skolemid |136|
 :pattern ( (TO j@@3))
))
(Sparse2 vt@@10 (- (numFields q@abs@@4) 2))))
(=> (= (tag@@1 vt@@10) ?STRING_TAG) (forall ((j@@4 Int) ) (! (=> (TO j@@4) (not (VFieldPtr q@abs@@4 j@@4)))
 :qid |Bartokib.101:381|
 :skolemid |137|
 :pattern ( (TO j@@4))
)))
(=> (= (tag@@1 vt@@10) ?PTR_VECTOR_TAG) (and
(between 3 (numFields q@abs@@4) (baseWords vt@@10))
(forall ((j@@5 Int) ) (! (=> (TO j@@5) (= (and
(<= (baseWords vt@@10) j@@5)
(< j@@5 (numFields q@abs@@4))) (VFieldPtr q@abs@@4 j@@5)))
 :qid |Bartokib.101:502|
 :skolemid |138|
 :pattern ( (TO j@@5))
))))
(=> (= (tag@@1 vt@@10) ?OTHER_VECTOR_TAG) (and
(not (VFieldPtr q@abs@@4 2))
(inRo (+ (arrayElementClass vt@@10) ?VT_MASK) 4)
(between 3 (numFields q@abs@@4) (baseWords vt@@10))
(=> (not (= (arrayOf vt@@10) ?TYPE_STRUCT)) (forall ((j@@6 Int) ) (! (=> (TO j@@6) (not (VFieldPtr q@abs@@4 j@@6)))
 :qid |Bartokib.101:759|
 :skolemid |139|
 :pattern ( (TO j@@6))
)))
(=> (= (arrayOf vt@@10) ?TYPE_STRUCT) (not (isVarSize (tag@@1 (arrayElementClass vt@@10)))))
(=> (and
(= (arrayOf vt@@10) ?TYPE_STRUCT)
(= (mask (arrayElementClass vt@@10)) ?SPARSE_TAG)) (forall ((j@@7 Int) ) (! (=> (TO j@@7) (not (VFieldPtr q@abs@@4 j@@7)))
 :qid |Bartokib.101:953|
 :skolemid |140|
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
 :skolemid |141|
 :pattern ( (TO m@@0))
)))))
 :qid |Bartokib.101:1076|
 :skolemid |142|
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
 :skolemid |143|
 :pattern ( (TO j@@9))
))))
(=> (= (tag@@1 vt@@10) ?OTHER_ARRAY_TAG) (and
(not (VFieldPtr q@abs@@4 2))
(not (VFieldPtr q@abs@@4 3))
(between 4 (numFields q@abs@@4) (baseWords vt@@10))
(=> (not (= (arrayOf vt@@10) ?TYPE_STRUCT)) (forall ((j@@10 Int) ) (! (=> (TO j@@10) (not (VFieldPtr q@abs@@4 j@@10)))
 :qid |Bartokib.101:1868|
 :skolemid |144|
 :pattern ( (TO j@@10))
)))))
(=> (isOtherTag (tag@@1 vt@@10)) (and
(forall ((j@@11 Int) ) (! (=> (TO j@@11) (and
(= (VFieldPtr q@abs@@4 j@@11) (not (= (fieldToSlot vt@@10 j@@11) 0)))
(=> (not (= (fieldToSlot vt@@10 j@@11) 0)) (and
(between 1 (+ 1 (ro32 (mask vt@@10))) (fieldToSlot vt@@10 j@@11))
(= (+ (ro32 (+ (mask vt@@10) (* 4 (fieldToSlot vt@@10 j@@11)))) 1) j@@11)))))
 :qid |Bartokib.101:1946|
 :skolemid |145|
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
 :skolemid |146|
 :pattern ( (TSlot k@@0))
))
(inRo (mask vt@@10) 4)
(>= (ro32 (mask vt@@10)) 0)))))
 :qid |Bartokib.101:15|
 :skolemid |147|
 :pattern ( (TVT q@abs@@4 vt@@10))
)))
(assert (forall ((i@@32 Int) ) (! (= (pad i@@32) (q@and (+ i@@32 3) (neg 3)))
 :qid |Bartokib.163:15|
 :skolemid |148|
 :pattern ( (pad i@@32))
)))
(assert (forall ((q@abs@@5 Int) ) (! (= (TVL q@abs@@5) true)
 :qid |Bartokib.168:30|
 :skolemid |149|
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
 :skolemid |150|
 :pattern ( (TVL q@abs@@6) (ObjSize q@abs@@6 vt@@11 nElems1 nElems2))
)))
(assert (forall ((layout T@$FrameLayout) (j@@12 Int) ) (! (= (inFrame layout j@@12) (and
(<= (- 0 (frameLayoutLocals layout)) j@@12)
(< j@@12 (+ 2 (frameLayoutArgs layout)))))
 :qid |Bartokib.195:19|
 :skolemid |151|
 :pattern ( (inFrame layout j@@12))
)))
(assert (forall ((l T@$FrameLayout) ) (! (= (TVF l) true)
 :qid |Bartokib.200:30|
 :skolemid |152|
 :pattern ( (TVF l))
)))
(assert (= ?SectionCount 3735928559))
(assert (= ?StaticDataPointerBitMap 3735928559))
(assert (= ?DataSectionEnd 3735928559))
(assert (= ?DataSectionBase 3735928559))
(assert (forall ((section Int) ) (! (= (sectionBase section) (ro32 (+ ?DataSectionBase (* 4 section))))
 :qid |Bartokib.208:23|
 :skolemid |153|
 :pattern ( (sectionBase section))
)))
(assert (forall ((section@@0 Int) ) (! (= (sectionEnd section@@0) (ro32 (+ ?DataSectionEnd (* 4 section@@0))))
 :qid |Bartokib.209:22|
 :skolemid |154|
 :pattern ( (sectionEnd section@@0))
)))
(assert (forall ((s@@5 Int) (j@@13 Int) ) (! (= (TVS s@@5 j@@13) true)
 :qid |Bartokib.214:30|
 :skolemid |155|
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
 :skolemid |156|
 :pattern ( (LookupDesc t@@2 j@@14))
)))
(assert (forall ((t@@3 Int) (j@@15 Int) ) (! (= (InTable t@@3 j@@15) (and
(<= 0 t@@3)
(< t@@3 ?CallSiteTableCount)
(<= 0 j@@15)
(< j@@15 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@3)))))))
 :qid |Bartokib.229:19|
 :skolemid |157|
 :pattern ( (InTable t@@3 j@@15))
)))
(assert (forall ((t@@4 Int) (j@@16 Int) (retaddr Int) ) (! (= (RetAddrAt t@@4 j@@16 retaddr) (and
(InTable t@@4 j@@16)
(between (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@4))) (* 4 j@@16))) (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@4))) (* 4 (+ j@@16 1)))) (- retaddr (ro32 (+ ?CodeBaseStartTable (* 4 t@@4)))))))
 :qid |Bartokib.234:21|
 :skolemid |158|
 :pattern ( (RetAddrAt t@@4 j@@16 retaddr))
)))
(assert (forall ((f@@5 Int) ) (! (= (TVFT f@@5) true)
 :qid |Bartokib.242:31|
 :skolemid |159|
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
 :skolemid |160|
 :pattern ( (TT t@@5) (TO j@@17))
))
(forall ((t@@6 Int) (j@@18 Int) ) (! (=> (and
(TT t@@6)
(TO j@@18)) (=> (RetAddrAt t@@6 j@@18 ra) (= (frameDescriptor (select $FrameLayout (- f@@6 1))) (LookupDesc t@@6 j@@18))))
 :qid |Bartokib.245:353|
 :skolemid |161|
 :pattern ( (TT t@@6) (TO j@@18))
))))))
 :qid |Bartokib.245:15|
 :skolemid |162|
 :pattern ( (TVFT f@@6) (FrameNextInv f@@6 ra nextFp $FrameAddr $FrameLayout))
)))
(assert (forall ((f@@7 Int) (l@@0 T@$FrameLayout) ($FrameAddr@@0 (Array Int Int)) ($FrameSlice (Array Int Int)) ($FrameLayout@@0 (Array Int T@$FrameLayout)) ($FrameAbs (Array Int (Array Int Int))) ($FrameOffset (Array Int Int)) ) (! (= (FrameInv f@@7 l@@0 $FrameAddr@@0 $FrameSlice $FrameLayout@@0 $FrameAbs $FrameOffset) (and
(FrameNextInv f@@7 (select (select $FrameAbs f@@7) 1) (select (select $FrameAbs f@@7) 0) $FrameAddr@@0 $FrameLayout@@0)
(forall ((j@@19 Int) ) (! (=> (TO j@@19) (=> (inFrame l@@0 j@@19) (= (select $FrameSlice (+ (select $FrameAddr@@0 f@@7) (* 4 j@@19))) f@@7)))
 :qid |Bartokib.259:97|
 :skolemid |163|
 :pattern ( (TO j@@19))
))
(forall ((j@@20 Int) ) (! (=> (TO j@@20) (=> (= (select $FrameSlice (+ (select $FrameAddr@@0 f@@7) (* 4 j@@20))) f@@7) (word (+ (select $FrameAddr@@0 f@@7) (* 4 j@@20)))))
 :qid |Bartokib.259:185|
 :skolemid |164|
 :pattern ( (TO j@@20))
))))
 :qid |Bartokib.256:20|
 :skolemid |165|
 :pattern ( (FrameInv f@@7 l@@0 $FrameAddr@@0 $FrameSlice $FrameLayout@@0 $FrameAbs $FrameOffset))
)))
(assert (forall (($FrameCount Int) ($FrameAddr@@1 (Array Int Int)) ($FrameLayout@@1 (Array Int T@$FrameLayout)) ($FrameSlice@@0 (Array Int Int)) ($FrameAbs@@0 (Array Int (Array Int Int))) ($FrameOffset@@0 (Array Int Int)) ) (! (= (StackInv $FrameCount $FrameAddr@@1 $FrameLayout@@1 $FrameSlice@@0 $FrameAbs@@0 $FrameOffset@@0) (forall ((f@@8 Int) ) (! (=> (TV f@@8) (=> (and
(<= 0 f@@8)
(< f@@8 $FrameCount)) (FrameInv f@@8 (select $FrameLayout@@1 f@@8) $FrameAddr@@1 $FrameSlice@@0 $FrameLayout@@1 $FrameAbs@@0 $FrameOffset@@0)))
 :qid |Bartokib.268:11|
 :skolemid |166|
 :pattern ( (TV f@@8))
)))
 :qid |Bartokib.265:20|
 :skolemid |167|
 :pattern ( (StackInv $FrameCount $FrameAddr@@1 $FrameLayout@@1 $FrameSlice@@0 $FrameAbs@@0 $FrameOffset@@0))
)))
(assert (forall (($s Int) ($FrameCounts (Array Int Int)) ($FrameAddrs (Array Int (Array Int Int))) ($FrameLayouts (Array Int (Array Int T@$FrameLayout))) ($FrameSlices (Array Int (Array Int Int))) ($FrameAbss (Array Int (Array Int (Array Int Int)))) ($FrameOffsets (Array Int (Array Int Int))) ) (! (= (StackInvS $s $FrameCounts $FrameAddrs $FrameLayouts $FrameSlices $FrameAbss $FrameOffsets) (StackInv (select $FrameCounts $s) (select $FrameAddrs $s) (select $FrameLayouts $s) (select $FrameSlices $s) (select $FrameAbss $s) (select $FrameOffsets $s)))
 :qid |Bartokib.272:21|
 :skolemid |168|
 :pattern ( (StackInvS $s $FrameCounts $FrameAddrs $FrameLayouts $FrameSlices $FrameAbss $FrameOffsets))
)))
(assert (forall ((s@@6 Int) (i1@@3 Int) (i2@@3 Int) (r (Array Int Int)) ($SectionMem (Array Int Int)) ($SectionAbs (Array Int (Array Int Int))) ) (! (= (SectionInv s@@6 i1@@3 i2@@3 r $SectionMem $SectionAbs) (forall ((j@@21 Int) ) (! (=> (TO j@@21) (=> (and
(<= 0 j@@21)
(< (+ i1@@3 (* 4 j@@21)) i2@@3)) (and
(= (sectionSlice (+ i1@@3 (* 4 j@@21))) s@@6)
(Value (sectionHasPtr s@@6 j@@21) r (select $SectionMem (+ i1@@3 (* 4 j@@21))) (select (select $SectionAbs s@@6) j@@21)))))
 :qid |Bartokib.284:11|
 :skolemid |169|
 :pattern ( (TO j@@21))
)))
 :qid |Bartokib.281:22|
 :skolemid |170|
 :pattern ( (SectionInv s@@6 i1@@3 i2@@3 r $SectionMem $SectionAbs))
)))
(assert (forall ((r@@0 (Array Int Int)) ($SectionMem@@0 (Array Int Int)) ($SectionAbs@@0 (Array Int (Array Int Int))) ) (! (= (StaticInv r@@0 $SectionMem@@0 $SectionAbs@@0) (forall ((s@@7 Int) ) (! (=> (TV s@@7) (=> (and
(<= 0 s@@7)
(< s@@7 ?SectionCount)) (SectionInv s@@7 (sectionBase s@@7) (sectionEnd s@@7) r@@0 $SectionMem@@0 $SectionAbs@@0)))
 :qid |Bartokib.292:11|
 :skolemid |171|
 :pattern ( (TV s@@7))
)))
 :qid |Bartokib.289:21|
 :skolemid |172|
 :pattern ( (StaticInv r@@0 $SectionMem@@0 $SectionAbs@@0))
)))
(assert (forall ((i@@33 Int) ) (! (= (select MAP_ZERO i@@33) 0)
 :qid |Commonib.20:15|
 :skolemid |182|
 :pattern ( (TV i@@33))
)))
(assert (forall ((i@@34 Int) ) (! (= (select MAP_NO_ABS i@@34) NO_ABS)
 :qid |Commonib.24:15|
 :skolemid |183|
 :pattern ( (TV i@@34))
)))
(assert (forall ((i@@35 Int) ) (! (= (AlignedHeapAddr i@@35) (and
(gcAddr i@@35)
(Aligned i@@35)))
 :qid |Commonib.26:27|
 :skolemid |184|
 :pattern ( (AlignedHeapAddr i@@35))
)))
(assert (forall ((rOld (Array Int Int)) (rNew (Array Int Int)) ) (! (= (RExtend rOld rNew) (forall ((i@@36 Int) ) (! (=> (not (= (select rOld i@@36) NO_ABS)) (= (select rOld i@@36) (select rNew i@@36)))
 :qid |Commonib.37:11|
 :skolemid |185|
 :pattern ( (select rOld i@@36))
)))
 :qid |Commonib.34:19|
 :skolemid |186|
 :pattern ( (RExtend rOld rNew))
)))
(assert (forall ((val@@3 Int) (rev@@2 (Array Int Int)) (q@abs@@7 Int) ) (! (= (AbsMapped val@@3 rev@@2 q@abs@@7) (and
(not (= q@abs@@7 NO_ABS))
(= q@abs@@7 (select rev@@2 val@@3))))
 :qid |Commonib.39:21|
 :skolemid |187|
 :pattern ( (AbsMapped val@@3 rev@@2 q@abs@@7))
)))
(assert (forall (($s@@0 Int) ) (! (= (TStk $s@@0) true)
 :qid |Commonib.55:30|
 :skolemid |188|
 :pattern ( (TStk $s@@0))
)))
(assert (forall (($s@@1 Int) ($tMems@@0 (Array Int (Array Int Int))) ) (! (= (StackTag $s@@1 $tMems@@0) (select (select $tMems@@0 $s@@1) (+ (+ ?tLo (* $s@@1 ?TSize)) 0)))
 :qid |Commonib.60:20|
 :skolemid |189|
 :pattern ( (StackTag $s@@1 $tMems@@0))
)))
(assert (forall (($s@@2 Int) ($tMems@@1 (Array Int (Array Int Int))) ) (! (= (StackEsp $s@@2 $tMems@@1) (select (select $tMems@@1 $s@@2) (+ (+ ?tLo (* $s@@2 ?TSize)) 4)))
 :qid |Commonib.61:20|
 :skolemid |190|
 :pattern ( (StackEsp $s@@2 $tMems@@1))
)))
(assert (forall (($s@@3 Int) ($tMems@@2 (Array Int (Array Int Int))) ) (! (= (StackEbp $s@@3 $tMems@@2) (select (select $tMems@@2 $s@@3) (+ (+ ?tLo (* $s@@3 ?TSize)) 8)))
 :qid |Commonib.62:20|
 :skolemid |191|
 :pattern ( (StackEbp $s@@3 $tMems@@2))
)))
(assert (forall (($s@@4 Int) ($tMems@@3 (Array Int (Array Int Int))) ) (! (= (StackEax $s@@4 $tMems@@3) (select (select $tMems@@3 $s@@4) (+ (+ ?tLo (* $s@@4 ?TSize)) 12)))
 :qid |Commonib.63:20|
 :skolemid |192|
 :pattern ( (StackEax $s@@4 $tMems@@3))
)))
(assert (forall (($s@@5 Int) ($tMems@@4 (Array Int (Array Int Int))) ) (! (= (StackEbx $s@@5 $tMems@@4) (select (select $tMems@@4 $s@@5) (+ (+ ?tLo (* $s@@5 ?TSize)) 16)))
 :qid |Commonib.64:20|
 :skolemid |193|
 :pattern ( (StackEbx $s@@5 $tMems@@4))
)))
(assert (forall (($s@@6 Int) ($tMems@@5 (Array Int (Array Int Int))) ) (! (= (StackEcx $s@@6 $tMems@@5) (select (select $tMems@@5 $s@@6) (+ (+ ?tLo (* $s@@6 ?TSize)) 20)))
 :qid |Commonib.65:20|
 :skolemid |194|
 :pattern ( (StackEcx $s@@6 $tMems@@5))
)))
(assert (forall (($s@@7 Int) ($tMems@@6 (Array Int (Array Int Int))) ) (! (= (StackEdx $s@@7 $tMems@@6) (select (select $tMems@@6 $s@@7) (+ (+ ?tLo (* $s@@7 ?TSize)) 24)))
 :qid |Commonib.66:20|
 :skolemid |195|
 :pattern ( (StackEdx $s@@7 $tMems@@6))
)))
(assert (forall (($s@@8 Int) ($tMems@@7 (Array Int (Array Int Int))) ) (! (= (StackEsi $s@@8 $tMems@@7) (select (select $tMems@@7 $s@@8) (+ (+ ?tLo (* $s@@8 ?TSize)) 28)))
 :qid |Commonib.67:20|
 :skolemid |196|
 :pattern ( (StackEsi $s@@8 $tMems@@7))
)))
(assert (forall (($s@@9 Int) ($tMems@@8 (Array Int (Array Int Int))) ) (! (= (StackEdi $s@@9 $tMems@@8) (select (select $tMems@@8 $s@@9) (+ (+ ?tLo (* $s@@9 ?TSize)) 32)))
 :qid |Commonib.68:20|
 :skolemid |197|
 :pattern ( (StackEdi $s@@9 $tMems@@8))
)))
(assert (forall (($s@@10 Int) ($tMems@@9 (Array Int (Array Int Int))) ($fMems@@0 (Array Int (Array Int Int))) ) (! (= (StackRA $s@@10 $tMems@@9 $fMems@@0) (select (select $fMems@@0 $s@@10) (StackEsp $s@@10 $tMems@@9)))
 :qid |Commonib.69:19|
 :skolemid |198|
 :pattern ( (StackRA $s@@10 $tMems@@9 $fMems@@0))
)))
(assert (forall (($s@@11 Int) ($tMems@@10 (Array Int (Array Int Int))) ($fMems@@1 (Array Int (Array Int Int))) ) (! (= (StackCS $s@@11 $tMems@@10 $fMems@@1) (select (select $fMems@@1 $s@@11) (+ (StackEsp $s@@11 $tMems@@10) 4)))
 :qid |Commonib.70:19|
 :skolemid |199|
 :pattern ( (StackCS $s@@11 $tMems@@10 $fMems@@1))
)))
(assert (forall (($s@@12 Int) ($tMems@@11 (Array Int (Array Int Int))) ($fMems@@2 (Array Int (Array Int Int))) ) (! (= (StackEfl $s@@12 $tMems@@11 $fMems@@2) (select (select $fMems@@2 $s@@12) (+ (StackEsp $s@@12 $tMems@@11) 8)))
 :qid |Commonib.71:20|
 :skolemid |200|
 :pattern ( (StackEfl $s@@12 $tMems@@11 $fMems@@2))
)))
(assert (forall (($state T@StackState) ) (! (= (IsEmpty $state) (= (StackStateTag $state) ?STACK_EMPTY))
 :qid |Commonib.73:19|
 :skolemid |201|
 :pattern ( (IsEmpty $state))
)))
(assert (forall (($state@@0 T@StackState) ) (! (= (IsYielded $state@@0) (= (StackStateTag $state@@0) ?STACK_YIELDED))
 :qid |Commonib.78:21|
 :skolemid |202|
 :pattern ( (IsYielded $state@@0))
)))
(assert (forall (($state@@1 T@StackState) ) (! (= (IsInterrupted $state@@1) (= (StackStateTag $state@@1) ?STACK_INTERRUPTED))
 :qid |Commonib.83:25|
 :skolemid |203|
 :pattern ( (IsInterrupted $state@@1))
)))
(assert (forall (($s@@13 Int) (f@@9 Int) (l@@1 T@$FrameLayout) (r@@1 (Array Int Int)) ($FrameAddr@@2 (Array Int Int)) ($FrameSlice@@1 (Array Int Int)) ($FrameLayout@@2 (Array Int T@$FrameLayout)) ($FrameAbs@@1 (Array Int (Array Int Int))) ($FrameOffset@@1 (Array Int Int)) ($fMem (Array Int Int)) ) (! (= (MutatorFrameInvAddrs $s@@13 f@@9 l@@1 r@@1 $FrameAddr@@2 $FrameSlice@@1 $FrameLayout@@2 $FrameAbs@@1 $FrameOffset@@1 $fMem) (forall ((j@@22 Int) ) (! (=> (TO j@@22) (=> (= (select $FrameSlice@@1 (+ (select $FrameAddr@@2 f@@9) (* 4 j@@22))) f@@9) (and
(Aligned (+ (select $FrameAddr@@2 f@@9) (* 4 j@@22)))
(fAddr $s@@13 (+ (select $FrameAddr@@2 f@@9) (* 4 j@@22))))))
 :qid |Commonib.91:11|
 :skolemid |204|
 :pattern ( (TO j@@22))
)))
 :qid |Commonib.88:32|
 :skolemid |205|
 :pattern ( (MutatorFrameInvAddrs $s@@13 f@@9 l@@1 r@@1 $FrameAddr@@2 $FrameSlice@@1 $FrameLayout@@2 $FrameAbs@@1 $FrameOffset@@1 $fMem))
)))
(assert (forall (($s@@14 Int) (f@@10 Int) (l@@2 T@$FrameLayout) (r@@2 (Array Int Int)) ($FrameAddr@@3 (Array Int Int)) ($FrameSlice@@2 (Array Int Int)) ($FrameLayout@@3 (Array Int T@$FrameLayout)) ($FrameAbs@@2 (Array Int (Array Int Int))) ($FrameOffset@@2 (Array Int Int)) ($fMem@@0 (Array Int Int)) ) (! (= (MutatorFrameInv $s@@14 f@@10 l@@2 r@@2 $FrameAddr@@3 $FrameSlice@@2 $FrameLayout@@3 $FrameAbs@@2 $FrameOffset@@2 $fMem@@0) (forall ((j@@23 Int) ) (! (=> (TO j@@23) (=> (= (select $FrameSlice@@2 (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23))) f@@10) (and
(Aligned (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23)))
(fAddr $s@@14 (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23)))
(InteriorValue (frameHasPtr l@@2 j@@23) r@@2 (select $fMem@@0 (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23))) (select (select $FrameAbs@@2 f@@10) j@@23) (select $FrameOffset@@2 (+ (select $FrameAddr@@3 f@@10) (* 4 j@@23)))))))
 :qid |Commonib.99:11|
 :skolemid |206|
 :pattern ( (TO j@@23))
)))
 :qid |Commonib.96:27|
 :skolemid |207|
 :pattern ( (MutatorFrameInv $s@@14 f@@10 l@@2 r@@2 $FrameAddr@@3 $FrameSlice@@2 $FrameLayout@@3 $FrameAbs@@2 $FrameOffset@@2 $fMem@@0))
)))
(assert (forall (($s@@15 Int) (r@@3 (Array Int Int)) ($FrameCount@@0 Int) ($FrameAddr@@4 (Array Int Int)) ($FrameLayout@@4 (Array Int T@$FrameLayout)) ($FrameSlice@@3 (Array Int Int)) ($FrameAbs@@3 (Array Int (Array Int Int))) ($FrameOffset@@3 (Array Int Int)) ($fMem@@1 (Array Int Int)) ) (! (= (MutatorStackInv $s@@15 r@@3 $FrameCount@@0 $FrameAddr@@4 $FrameLayout@@4 $FrameSlice@@3 $FrameAbs@@3 $FrameOffset@@3 $fMem@@1) (forall ((f@@11 Int) ) (! (=> (TV f@@11) (=> (and
(<= 0 f@@11)
(< f@@11 $FrameCount@@0)) (MutatorFrameInv $s@@15 f@@11 (select $FrameLayout@@4 f@@11) r@@3 $FrameAddr@@4 $FrameSlice@@3 $FrameLayout@@4 $FrameAbs@@3 $FrameOffset@@3 $fMem@@1)))
 :qid |Commonib.108:11|
 :skolemid |208|
 :pattern ( (TV f@@11))
)))
 :qid |Commonib.105:27|
 :skolemid |209|
 :pattern ( (MutatorStackInv $s@@15 r@@3 $FrameCount@@0 $FrameAddr@@4 $FrameLayout@@4 $FrameSlice@@3 $FrameAbs@@3 $FrameOffset@@3 $fMem@@1))
)))
(assert (forall (($s@@16 Int) (f@@12 Int) (l@@3 T@$FrameLayout) (r@@4 (Array Int Int)) ($FrameAddr@@5 (Array Int Int)) ($FrameSlice@@4 (Array Int Int)) ($FrameLayout@@5 (Array Int T@$FrameLayout)) ($FrameAbs@@4 (Array Int (Array Int Int))) ($FrameOffset@@4 (Array Int Int)) ($fMem@@2 (Array Int Int)) ) (! (= (_MutatorFrameInv $s@@16 f@@12 l@@3 r@@4 $FrameAddr@@5 $FrameSlice@@4 $FrameLayout@@5 $FrameAbs@@4 $FrameOffset@@4 $fMem@@2) (forall ((j@@24 Int) ) (! (=> (TO j@@24) (=> (_InFrameSlice f@@12 j@@24 $FrameAddr@@5 $FrameSlice@@4) (and
(Aligned (+ (select $FrameAddr@@5 f@@12) (* 4 j@@24)))
(fAddr $s@@16 (+ (select $FrameAddr@@5 f@@12) (* 4 j@@24)))
(InteriorValue (frameHasPtr l@@3 j@@24) r@@4 (select $fMem@@2 (+ (select $FrameAddr@@5 f@@12) (* 4 j@@24))) (select (select $FrameAbs@@4 f@@12) j@@24) (select $FrameOffset@@4 (+ (select $FrameAddr@@5 f@@12) (* 4 j@@24)))))))
 :qid |Commonib.121:11|
 :skolemid |211|
 :pattern ( (TO j@@24))
)))
 :qid |Commonib.118:28|
 :skolemid |212|
 :pattern ( (_MutatorFrameInv $s@@16 f@@12 l@@3 r@@4 $FrameAddr@@5 $FrameSlice@@4 $FrameLayout@@5 $FrameAbs@@4 $FrameOffset@@4 $fMem@@2))
)))
(assert (forall (($s@@17 Int) (r@@5 (Array Int Int)) ($FrameCount@@1 Int) ($FrameAddr@@6 (Array Int Int)) ($FrameLayout@@6 (Array Int T@$FrameLayout)) ($FrameSlice@@5 (Array Int Int)) ($FrameAbs@@5 (Array Int (Array Int Int))) ($FrameOffset@@5 (Array Int Int)) ($fMem@@3 (Array Int Int)) ) (! (= (_MutatorStackInv $s@@17 r@@5 $FrameCount@@1 $FrameAddr@@6 $FrameLayout@@6 $FrameSlice@@5 $FrameAbs@@5 $FrameOffset@@5 $fMem@@3) (forall ((f@@13 Int) ) (! (=> (TV f@@13) (=> (and
(<= 0 f@@13)
(< f@@13 $FrameCount@@1)) (_MutatorFrameInv $s@@17 f@@13 (select $FrameLayout@@6 f@@13) r@@5 $FrameAddr@@6 $FrameSlice@@5 $FrameLayout@@6 $FrameAbs@@5 $FrameOffset@@5 $fMem@@3)))
 :qid |Commonib.130:11|
 :skolemid |213|
 :pattern ( (TV f@@13))
)))
 :qid |Commonib.127:28|
 :skolemid |214|
 :pattern ( (_MutatorStackInv $s@@17 r@@5 $FrameCount@@1 $FrameAddr@@6 $FrameLayout@@6 $FrameSlice@@5 $FrameAbs@@5 $FrameOffset@@5 $fMem@@3))
)))
(assert (forall (($s@@18 Int) (r@@6 (Array Int Int)) ($FrameCounts@@0 (Array Int Int)) ($FrameAddrs@@0 (Array Int (Array Int Int))) ($FrameLayouts@@0 (Array Int (Array Int T@$FrameLayout))) ($FrameSlices@@0 (Array Int (Array Int Int))) ($FrameAbss@@0 (Array Int (Array Int (Array Int Int)))) ($FrameOffsets@@0 (Array Int (Array Int Int))) ($fMems@@3 (Array Int (Array Int Int))) ) (! (= (MutatorStackInvS $s@@18 r@@6 $FrameCounts@@0 $FrameAddrs@@0 $FrameLayouts@@0 $FrameSlices@@0 $FrameAbss@@0 $FrameOffsets@@0 $fMems@@3) (MutatorStackInv $s@@18 r@@6 (select $FrameCounts@@0 $s@@18) (select $FrameAddrs@@0 $s@@18) (select $FrameLayouts@@0 $s@@18) (select $FrameSlices@@0 $s@@18) (select $FrameAbss@@0 $s@@18) (select $FrameOffsets@@0 $s@@18) (select $fMems@@3 $s@@18)))
 :qid |Commonib.134:28|
 :skolemid |215|
 :pattern ( (MutatorStackInvS $s@@18 r@@6 $FrameCounts@@0 $FrameAddrs@@0 $FrameLayouts@@0 $FrameSlices@@0 $FrameAbss@@0 $FrameOffsets@@0 $fMems@@3))
)))
(assert (forall (($s@@19 Int) (f@@14 Int) (l@@4 T@$FrameLayout) (r@@7 (Array Int Int)) ($FrameAddr@@7 (Array Int Int)) ($FrameSlice@@6 (Array Int Int)) ($FrameLayout@@7 (Array Int T@$FrameLayout)) ($fMem@@4 (Array Int Int)) ($FrameAbs@@6 (Array Int (Array Int Int))) ($FrameOffset@@6 (Array Int Int)) ) (! (= (GcFrameInv $s@@19 f@@14 l@@4 r@@7 $FrameAddr@@7 $FrameSlice@@6 $FrameLayout@@7 $fMem@@4 $FrameAbs@@6 $FrameOffset@@6) (and
(FrameInv f@@14 l@@4 $FrameAddr@@7 $FrameSlice@@6 $FrameLayout@@7 $FrameAbs@@6 $FrameOffset@@6)
(MutatorFrameInv $s@@19 f@@14 l@@4 r@@7 $FrameAddr@@7 $FrameSlice@@6 $FrameLayout@@7 $FrameAbs@@6 $FrameOffset@@6 $fMem@@4)))
 :qid |Commonib.140:22|
 :skolemid |216|
 :pattern ( (GcFrameInv $s@@19 f@@14 l@@4 r@@7 $FrameAddr@@7 $FrameSlice@@6 $FrameLayout@@7 $fMem@@4 $FrameAbs@@6 $FrameOffset@@6))
)))
(assert (forall (($s@@20 Int) (r@@8 (Array Int Int)) ($FrameCount@@2 Int) ($FrameAddr@@8 (Array Int Int)) ($FrameLayout@@8 (Array Int T@$FrameLayout)) ($FrameSlice@@7 (Array Int Int)) ($fMem@@5 (Array Int Int)) ($FrameAbs@@7 (Array Int (Array Int Int))) ($FrameOffset@@7 (Array Int Int)) ) (! (= (GcStackInv $s@@20 r@@8 $FrameCount@@2 $FrameAddr@@8 $FrameLayout@@8 $FrameSlice@@7 $fMem@@5 $FrameAbs@@7 $FrameOffset@@7) (and
(StackInv $FrameCount@@2 $FrameAddr@@8 $FrameLayout@@8 $FrameSlice@@7 $FrameAbs@@7 $FrameOffset@@7)
(MutatorStackInv $s@@20 r@@8 $FrameCount@@2 $FrameAddr@@8 $FrameLayout@@8 $FrameSlice@@7 $FrameAbs@@7 $FrameOffset@@7 $fMem@@5)))
 :qid |Commonib.146:22|
 :skolemid |217|
 :pattern ( (GcStackInv $s@@20 r@@8 $FrameCount@@2 $FrameAddr@@8 $FrameLayout@@8 $FrameSlice@@7 $fMem@@5 $FrameAbs@@7 $FrameOffset@@7))
)))
(assert (forall ((i@@37 Int) (rs (Array Int Int)) ($toAbs@@0 (Array Int Int)) ($AbsMem (Array Int (Array Int Int))) ($gcMem@@0 (Array Int Int)) ($gcSlice (Array Int Int)) ) (! (= (ObjInvBase i@@37 rs $toAbs@@0 $AbsMem $gcMem@@0 $gcSlice) (=> (and
(gcAddr i@@37)
(not (= (select rs i@@37) NO_ABS))) (and
(Aligned i@@37)
(AlignedHeapAddr (+ i@@37 4))
(VTable (select rs i@@37) (select (select $AbsMem (select rs i@@37)) 1))
(not (VFieldPtr (select rs i@@37) 1))
(>= (numFields (select rs i@@37)) 2)
(ObjSize (select rs i@@37) (select (select $AbsMem (select rs i@@37)) 1) (select (select $AbsMem (select rs i@@37)) 2) (select (select $AbsMem (select rs i@@37)) 3))
(= (select $gcSlice i@@37) i@@37)
(= (select $gcSlice (+ i@@37 4)) i@@37))))
 :qid |Commonib.163:22|
 :skolemid |218|
 :pattern ( (ObjInvBase i@@37 rs $toAbs@@0 $AbsMem $gcMem@@0 $gcSlice))
)))
(assert (forall ((i@@38 Int) (j@@25 Int) (rs@@0 (Array Int Int)) (rt (Array Int Int)) ($toAbs@@1 (Array Int Int)) ($AbsMem@@0 (Array Int (Array Int Int))) ($gcMem@@1 (Array Int Int)) ($gcSlice@@0 (Array Int Int)) ) (! (= (ObjInvField i@@38 j@@25 rs@@0 rt $toAbs@@1 $AbsMem@@0 $gcMem@@1 $gcSlice@@0) (=> (and
(gcAddr i@@38)
(not (= (select rs@@0 i@@38) NO_ABS))) (and
(gcAddr (+ i@@38 (* 4 j@@25)))
(= (select $gcSlice@@0 (+ i@@38 (* 4 j@@25))) i@@38)
(Value (VFieldPtr (select rs@@0 i@@38) j@@25) rt (select $gcMem@@1 (+ i@@38 (* 4 j@@25))) (select (select $AbsMem@@0 (select $toAbs@@1 i@@38)) j@@25)))))
 :qid |Commonib.177:23|
 :skolemid |219|
 :pattern ( (ObjInvField i@@38 j@@25 rs@@0 rt $toAbs@@1 $AbsMem@@0 $gcMem@@1 $gcSlice@@0))
)))
(assert (forall ((i@@39 Int) (j1 Int) (j2 Int) (rs@@1 (Array Int Int)) (rt@@0 (Array Int Int)) ($toAbs@@2 (Array Int Int)) ($AbsMem@@1 (Array Int (Array Int Int))) ($gcMem@@2 (Array Int Int)) ($gcSlice@@1 (Array Int Int)) ) (! (= (ObjInvPartial i@@39 j1 j2 rs@@1 rt@@0 $toAbs@@2 $AbsMem@@1 $gcMem@@2 $gcSlice@@1) (and
(ObjInvBase i@@39 rs@@1 $toAbs@@2 $AbsMem@@1 $gcMem@@2 $gcSlice@@1)
(forall ((j@@26 Int) ) (! (=> (TO j@@26) (=> (and
(<= j1 j@@26)
(< j@@26 j2)) (ObjInvField i@@39 j@@26 rs@@1 rt@@0 $toAbs@@2 $AbsMem@@1 $gcMem@@2 $gcSlice@@1)))
 :qid |Commonib.189:68|
 :skolemid |220|
 :pattern ( (TO j@@26))
))))
 :qid |Commonib.186:25|
 :skolemid |221|
 :pattern ( (ObjInvPartial i@@39 j1 j2 rs@@1 rt@@0 $toAbs@@2 $AbsMem@@1 $gcMem@@2 $gcSlice@@1))
)))
(assert (forall ((i@@40 Int) (rs@@2 (Array Int Int)) (rt@@1 (Array Int Int)) ($toAbs@@3 (Array Int Int)) ($AbsMem@@2 (Array Int (Array Int Int))) ($gcMem@@3 (Array Int Int)) ($gcSlice@@2 (Array Int Int)) ) (! (= (ObjInv i@@40 rs@@2 rt@@1 $toAbs@@3 $AbsMem@@2 $gcMem@@3 $gcSlice@@2) (ObjInvPartial i@@40 0 (numFields (select rs@@2 i@@40)) rs@@2 rt@@1 $toAbs@@3 $AbsMem@@2 $gcMem@@3 $gcSlice@@2))
 :qid |Commonib.194:18|
 :skolemid |222|
 :pattern ( (ObjInv i@@40 rs@@2 rt@@1 $toAbs@@3 $AbsMem@@2 $gcMem@@3 $gcSlice@@2))
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
(forall ((i@@41 Int) ) (! (=> (TV i@@41) (=> (and
(<= 0 i@@41)
(< i@@41 65536)) (or
(and
(= (select $pciMem@@0 (+ ?pciLo (* 8 i@@41))) 0)
(= (select $PciConfigState i@@41) 0))
(and
(not (= (select $pciMem@@0 (+ ?pciLo (* 8 i@@41))) 0))
(= (select $PciConfigState i@@41) 4)
(= (PciMemAddr i@@41) (select $pciMem@@0 (+ ?pciLo (* 8 i@@41))))
(= (PciMemSize i@@41) (select $pciMem@@0 (+ (+ ?pciLo (* 8 i@@41)) 4)))))))
 :qid |Commonib.258:111|
 :skolemid |223|
 :pattern ( (TV i@@41))
))))
 :qid |Commonib.255:18|
 :skolemid |224|
 :pattern ( (_IoInv $IoMmuEnabled $PciConfigState DmaAddr $pciMem@@0))
)))
(assert (forall (($s@@21 Int) ) (! (= (StackHi $s@@21) (+ (+ ?fLo (* $s@@21 ?FSize)) ?FSize))
 :qid |MarkSwee.33:15|
 :skolemid |226|
)))
(assert (forall (($s@@22 Int) ) (! (= (StackLo $s@@22) (+ ?fLo (* $s@@22 ?FSize)))
 :qid |MarkSwee.34:15|
 :skolemid |227|
)))
(assert (forall (($s@@23 Int) (sp Int) (n@@2 Int) ) (! (= (SpRequire $s@@23 sp n@@2) (and
(<= (StackLo $s@@23) sp)
(<= (+ sp n@@2) (StackHi $s@@23))
(Aligned sp)))
 :qid |MarkSwee.188:21|
 :skolemid |231|
 :pattern ( (SpRequire $s@@23 sp n@@2))
)))
(assert (forall (($s@@24 Int) (StackCheck Int) ) (! (= (StackCheckInv $s@@24 StackCheck) (and
(<= (+ (+ (StackLo $s@@24) ?StackReserve) ?InterruptReserve) StackCheck)
(<= StackCheck (StackHi $s@@24))))
 :qid |MarkSwee.193:25|
 :skolemid |232|
 :pattern ( (StackCheckInv $s@@24 StackCheck))
)))
(assert (forall (($S Int) ($Mem@@2 (Array Int Int)) ($FrameCounts@@1 (Array Int Int)) ($FrameAddrs@@1 (Array Int (Array Int Int))) ($FrameLayouts@@1 (Array Int (Array Int T@$FrameLayout))) ($FrameSlices@@1 (Array Int (Array Int Int))) ($FrameAbss@@1 (Array Int (Array Int (Array Int Int)))) ($FrameOffsets@@1 (Array Int (Array Int Int))) ($ra Int) ($esp@@4 Int) ($ebp Int) ) (! (= (ScanStackInv $S $Mem@@2 $FrameCounts@@1 $FrameAddrs@@1 $FrameLayouts@@1 $FrameSlices@@1 $FrameAbss@@1 $FrameOffsets@@1 $ra $esp@@4 $ebp) (and
(<= 0 (select $FrameCounts@@1 $S))
(= (select (select $FrameSlices@@1 $S) $esp@@4) (select $FrameCounts@@1 $S))
(= (select $Mem@@2 $esp@@4) $ra)
(FrameNextInv (select $FrameCounts@@1 $S) $ra $ebp (select $FrameAddrs@@1 $S) (select $FrameLayouts@@1 $S))
(StackInvS $S $FrameCounts@@1 $FrameAddrs@@1 $FrameLayouts@@1 $FrameSlices@@1 $FrameAbss@@1 $FrameOffsets@@1)))
 :qid |MarkSwee.199:24|
 :skolemid |233|
 :pattern ( (ScanStackInv $S $Mem@@2 $FrameCounts@@1 $FrameAddrs@@1 $FrameLayouts@@1 $FrameSlices@@1 $FrameAbss@@1 $FrameOffsets@@1 $ra $esp@@4 $ebp))
)))
(assert (= WORD_HI (+ (+ 2147483647 2147483647) 2)))
(push 1)
(set-info :boogie-vc-id Proc_Cube)
(assert (not
(let ((GeneratedUnifiedExit_correct (=> (! (and %lbl%+85181 true) :lblpos +85181) (and
(! (or %lbl%@86757 (= esp@1 (+ esp 4))) :lblneg @86757)
(=> (= esp@1 (+ esp 4)) (and
(! (or %lbl%@86765 (= esp@1 (+ esp 4))) :lblneg @86765)
(=> (= esp@1 (+ esp 4)) (and
(! (or %lbl%@86773 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @86773)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@86803 (SMemEnsure $sMem@@5 $sMem@@5 esp@1 esp)) :lblneg @86803)
(=> (SMemEnsure $sMem@@5 $sMem@@5 esp@1 esp) (and
(! (or %lbl%@86810 (and
(word eax@1)
(word ecx)
(word edx@1)
(word ebx@1)
(word esi@1)
(word edi)
(word ebp))) :lblneg @86810)
(=> (and
(word eax@1)
(word ecx)
(word edx@1)
(word ebx@1)
(word esi@1)
(word edi)
(word ebp)) (and
(! (or %lbl%@86846 (= $ghost_c@1 (* (* $ghost_N $ghost_N) $ghost_N))) :lblneg @86846)
(=> (= $ghost_c@1 (* (* $ghost_N $ghost_N) $ghost_N)) (and
(! (or %lbl%@86859 (= eax@1 $ghost_c@1)) :lblneg @86859)
(=> (= eax@1 $ghost_c@1) true)))))))))))))))))
(let ((anon2_Else_correct (=> (! (and %lbl%+25420 true) :lblpos +25420) (=> (not (Jb $Efl@6)) (and
(! (or %lbl%@86582 (word (+ call25195formal@$ret@0 0))) :lblneg @86582)
(=> (word (+ call25195formal@$ret@0 0)) (=> (= call25396formal@$ret@0 (+ call25195formal@$ret@0 0)) (and
(! (or %lbl%@86612 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @86612)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@86642 (sAddr call25396formal@$ret@0)) :lblneg @86642)
(=> (sAddr call25396formal@$ret@0) (=> (and
(= (select $Mem@@3 call25396formal@$ret@0) (select $sMem@@5 call25396formal@$ret@0))
(= call25401formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@86664 (= (ReturnToAddr (select $Mem@@3 call25396formal@$ret@0)) call25401formal@$oldRA@0)) :lblneg @86664)
(=> (= (ReturnToAddr (select $Mem@@3 call25396formal@$ret@0)) call25401formal@$oldRA@0) (and
(! (or %lbl%@86674 (Aligned call25396formal@$ret@0)) :lblneg @86674)
(=> (Aligned call25396formal@$ret@0) (=> (and
(= esp@0 (+ call25396formal@$ret@0 4))
(Aligned esp@0)
(= $ghost_c@1 $ghost_c@0)
(= esp@1 esp@0)
(= esi@1 esi@0)
(= ebx@1 ebx@0)
(= edx@1 edx@0)
(= eax@1 eax@0)) GeneratedUnifiedExit_correct)))))))))))))))))
(let ((anon2_Then_correct (=> (! (and %lbl%+25418 true) :lblpos +25418) (=> (Jb $Efl@6) (=> (and
(word (+ eax@0 ebx@0))
(= call25230formal@$ret@0 (+ eax@0 ebx@0))
(word (+ ebx@0 esi@0))
(= call25238formal@$ret@0 (+ ebx@0 esi@0))
(word (+ esi@0 6))
(= call25246formal@$ret@0 (+ esi@0 6))
(word (+ edx@0 1))
(= call25254formal@$ret@0 (+ edx@0 1))) (and
(! (or %lbl%@86408 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @86408)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@86438 (SMemInv $sMem@@5 $sMem@@5 (+ call25195formal@$ret@0 0) esp)) :lblneg @86438)
(=> (SMemInv $sMem@@5 $sMem@@5 (+ call25195formal@$ret@0 0) esp) (and
(! (or %lbl%@86449 (= (ReturnToAddr (select $sMem@@5 (+ call25195formal@$ret@0 0))) $RET@@0)) :lblneg @86449)
(=> (= (ReturnToAddr (select $sMem@@5 (+ call25195formal@$ret@0 0))) $RET@@0) (and
(! (or %lbl%@86463 (and
(word call25230formal@$ret@0)
(word ecx)
(word call25254formal@$ret@0)
(word call25238formal@$ret@0)
(word call25246formal@$ret@0)
(word edi)
(word ebp))) :lblneg @86463)
(=> (and
(word call25230formal@$ret@0)
(word ecx)
(word call25254formal@$ret@0)
(word call25238formal@$ret@0)
(word call25246formal@$ret@0)
(word edi)
(word ebp)) (and
(! (or %lbl%@86499 (= call25254formal@$ret@0 call25254formal@$ret@0)) :lblneg @86499)
(=> (= call25254formal@$ret@0 call25254formal@$ret@0) (and
(! (or %lbl%@86503 (= $ghost_N ecx)) :lblneg @86503)
(=> (= $ghost_N ecx) (and
(! (or %lbl%@86509 (= call25230formal@$ret@0 call25230formal@$ret@0)) :lblneg @86509)
(=> (= call25230formal@$ret@0 call25230formal@$ret@0) (and
(! (or %lbl%@86513 (= call25238formal@$ret@0 call25238formal@$ret@0)) :lblneg @86513)
(=> (= call25238formal@$ret@0 call25238formal@$ret@0) (and
(! (or %lbl%@86517 (= call25246formal@$ret@0 call25246formal@$ret@0)) :lblneg @86517)
(=> (= call25246formal@$ret@0 call25246formal@$ret@0) (and
(! (or %lbl%@86521 (<= call25254formal@$ret@0 $ghost_N)) :lblneg @86521)
(=> (<= call25254formal@$ret@0 $ghost_N) (and
(! (or %lbl%@86526 (= call25230formal@$ret@0 (* (* call25254formal@$ret@0 call25254formal@$ret@0) call25254formal@$ret@0))) :lblneg @86526)
(=> (= call25230formal@$ret@0 (* (* call25254formal@$ret@0 call25254formal@$ret@0) call25254formal@$ret@0)) (and
(! (or %lbl%@86536 (= call25238formal@$ret@0 (+ (+ (* (* 3 call25254formal@$ret@0) call25254formal@$ret@0) (* 3 call25254formal@$ret@0)) 1))) :lblneg @86536)
(=> (= call25238formal@$ret@0 (+ (+ (* (* 3 call25254formal@$ret@0) call25254formal@$ret@0) (* 3 call25254formal@$ret@0)) 1)) (and
(! (or %lbl%@86558 (= call25246formal@$ret@0 (+ (* 6 call25254formal@$ret@0) 6))) :lblneg @86558)
(=> (= call25246formal@$ret@0 (+ (* 6 call25254formal@$ret@0) 6)) true)))))))))))))))))))))))))))))))
(let ((L1_correct (=> (! (and %lbl%+25417 true) :lblpos +25417) (=> (and
(<= 0 eax@0)
(<= 1 ebx@0)
(<= 0 edx@0)
(<= 6 esi@0)
(<= 0 $ghost_n@0)
(<= 1 $ghost_k@0)
(<= 6 $ghost_m@0)
(<= 0 $ghost_c@0)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemInv $sMem@@5 $sMem@@5 (+ call25195formal@$ret@0 0) esp)
(= (ReturnToAddr (select $sMem@@5 (+ call25195formal@$ret@0 0))) $RET@@0)
(word eax@0)
(word ecx)
(word edx@0)
(word ebx@0)
(word esi@0)
(word edi)
(word ebp)
(= $ghost_n@0 edx@0)
(= $ghost_N ecx)
(= $ghost_c@0 eax@0)
(= $ghost_k@0 ebx@0)
(= $ghost_m@0 esi@0)
(<= $ghost_n@0 $ghost_N)
(= $ghost_c@0 (* (* $ghost_n@0 $ghost_n@0) $ghost_n@0))
(= $ghost_k@0 (+ (+ (* (* 3 $ghost_n@0) $ghost_n@0) (* 3 $ghost_n@0)) 1))
(= $ghost_m@0 (+ (* 6 $ghost_n@0) 6))
(= call25386formal@$x@0 (OpnReg edx@0))
(= call25386formal@$y@0 (OpnReg ecx))) (and
(! (or %lbl%@86231 (OpnOk $Mem@@3 call25386formal@$x@0)) :lblneg @86231)
(=> (OpnOk $Mem@@3 call25386formal@$x@0) (and
(! (or %lbl%@86236 (OpnOk $Mem@@3 call25386formal@$y@0)) :lblneg @86236)
(=> (OpnOk $Mem@@3 call25386formal@$y@0) (=> (FlagsCmp $Efl@6 (EvalOpn $Mem@@3 call25386formal@$x@0) (EvalOpn $Mem@@3 call25386formal@$y@0)) (and
anon2_Then_correct
anon2_Else_correct))))))))))
(let ((anon0_correct (=> (! (and %lbl%+25408 true) :lblpos +25408) (and
(! (or %lbl%@85665 (TV esp)) :lblneg @85665)
(=> (TV esp) (and
(! (or %lbl%@85675 (word (- esp 0))) :lblneg @85675)
(=> (word (- esp 0)) (=> (= call25195formal@$ret@0 (- esp 0)) (=> (and
(= call25198formal@$ret@0 0)
(= call25205formal@$ret@0 0)
(= call25212formal@$ret@0 1)
(= call25219formal@$ret@0 6)) (and
(! (or %lbl%@85804 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @85804)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@85834 (SMemInv $sMem@@5 $sMem@@5 (+ call25195formal@$ret@0 0) esp)) :lblneg @85834)
(=> (SMemInv $sMem@@5 $sMem@@5 (+ call25195formal@$ret@0 0) esp) (and
(! (or %lbl%@85845 (= (ReturnToAddr (select $sMem@@5 (+ call25195formal@$ret@0 0))) $RET@@0)) :lblneg @85845)
(=> (= (ReturnToAddr (select $sMem@@5 (+ call25195formal@$ret@0 0))) $RET@@0) (and
(! (or %lbl%@85859 (and
(word call25198formal@$ret@0)
(word ecx)
(word call25205formal@$ret@0)
(word call25212formal@$ret@0)
(word call25219formal@$ret@0)
(word edi)
(word ebp))) :lblneg @85859)
(=> (and
(word call25198formal@$ret@0)
(word ecx)
(word call25205formal@$ret@0)
(word call25212formal@$ret@0)
(word call25219formal@$ret@0)
(word edi)
(word ebp)) (and
(! (or %lbl%@85895 (= call25205formal@$ret@0 call25205formal@$ret@0)) :lblneg @85895)
(=> (= call25205formal@$ret@0 call25205formal@$ret@0) (and
(! (or %lbl%@85899 (= $ghost_N ecx)) :lblneg @85899)
(=> (= $ghost_N ecx) (and
(! (or %lbl%@85905 (= call25198formal@$ret@0 call25198formal@$ret@0)) :lblneg @85905)
(=> (= call25198formal@$ret@0 call25198formal@$ret@0) (and
(! (or %lbl%@85909 (= call25212formal@$ret@0 call25212formal@$ret@0)) :lblneg @85909)
(=> (= call25212formal@$ret@0 call25212formal@$ret@0) (and
(! (or %lbl%@85913 (= call25219formal@$ret@0 call25219formal@$ret@0)) :lblneg @85913)
(=> (= call25219formal@$ret@0 call25219formal@$ret@0) (and
(! (or %lbl%@85917 (<= call25205formal@$ret@0 $ghost_N)) :lblneg @85917)
(=> (<= call25205formal@$ret@0 $ghost_N) (and
(! (or %lbl%@85922 (= call25198formal@$ret@0 (* (* call25205formal@$ret@0 call25205formal@$ret@0) call25205formal@$ret@0))) :lblneg @85922)
(=> (= call25198formal@$ret@0 (* (* call25205formal@$ret@0 call25205formal@$ret@0) call25205formal@$ret@0)) (and
(! (or %lbl%@85932 (= call25212formal@$ret@0 (+ (+ (* (* 3 call25205formal@$ret@0) call25205formal@$ret@0) (* 3 call25205formal@$ret@0)) 1))) :lblneg @85932)
(=> (= call25212formal@$ret@0 (+ (+ (* (* 3 call25205formal@$ret@0) call25205formal@$ret@0) (* 3 call25205formal@$ret@0)) 1)) (and
(! (or %lbl%@85954 (= call25219formal@$ret@0 (+ (* 6 call25205formal@$ret@0) 6))) :lblneg @85954)
(=> (= call25219formal@$ret@0 (+ (* 6 call25205formal@$ret@0) 6)) L1_correct)))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+85185 true) :lblpos +85185) (=> (and
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(Aligned esp)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 0 $sMem@@5 esp $RET@@0)) (=> (and
(word eax)
(word ecx)
(word edx)
(word ebx)
(word esi)
(word edi)
(word ebp)
(= ecx $ghost_N)
(<= 0 $ghost_N)) anon0_correct)))))
PreconditionGeneratedEntry_correct))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+25650 () Bool)
(declare-fun %lbl%@87295 () Bool)
(declare-fun %lbl%@87305 () Bool)
(declare-fun call25600formal@$ret@0 () Int)
(declare-fun q@xor (Int Int) Int)
(declare-fun call25604formal@$ret@0 () Int)
(declare-fun call25612formal@$ret@0 () Int)
(declare-fun call25620formal@$ret@0 () Int)
(declare-fun call25627formal@$ret@0 () Int)
(declare-fun call25634formal@$ret@0 () Int)
(declare-fun %lbl%@87521 () Bool)
(declare-fun call25638formal@$ret@0 () Int)
(declare-fun %lbl%@87551 () Bool)
(declare-fun %lbl%@87581 () Bool)
(declare-fun call25643formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@87603 () Bool)
(declare-fun %lbl%@87613 () Bool)
(declare-fun esp@0@@0 () Int)
(declare-fun %lbl%@87642 () Bool)
(declare-fun %lbl%@87650 () Bool)
(declare-fun %lbl%@87658 () Bool)
(declare-fun %lbl%@87688 () Bool)
(declare-fun %lbl%@87695 () Bool)
(declare-fun %lbl%@87733 () Bool)
(declare-fun $ghost_a () Int)
(declare-fun %lbl%@87738 () Bool)
(declare-fun %lbl%+86878 () Bool)
(push 1)
(set-info :boogie-vc-id Proc_XorIdentity)
(assert (not
(let ((anon0_correct@@0 (=> (! (and %lbl%+25650 true) :lblpos +25650) (and
(! (or %lbl%@87295 (TV esp)) :lblneg @87295)
(=> (TV esp) (and
(! (or %lbl%@87305 (word (- esp 0))) :lblneg @87305)
(=> (word (- esp 0)) (=> (= call25600formal@$ret@0 (- esp 0)) (=> (and
(forall ((x@@8 Int) ) (! (= (q@xor x@@8 x@@8) 0)
 :qid |BitVecto.6:19|
 :skolemid |243|
))
(forall ((x@@9 Int) ) (! (=> (word x@@9) (= (q@xor x@@9 0) x@@9))
 :qid |BitVecto.7:19|
 :skolemid |244|
))) (=> (and
(forall ((x@@10 Int) (y@@5 Int) ) (! (= (q@xor x@@10 y@@5) (q@xor y@@5 x@@10))
 :qid |BitVecto.8:19|
 :skolemid |245|
))
(= call25604formal@$ret@0 ecx)
(= call25612formal@$ret@0 (q@xor call25604formal@$ret@0 ecx))
(word call25612formal@$ret@0)
(= call25620formal@$ret@0 (q@xor call25612formal@$ret@0 ecx))
(word call25620formal@$ret@0)
(= call25627formal@$ret@0 call25620formal@$ret@0)
(= call25634formal@$ret@0 call25627formal@$ret@0)) (and
(! (or %lbl%@87521 (word (+ call25600formal@$ret@0 0))) :lblneg @87521)
(=> (word (+ call25600formal@$ret@0 0)) (=> (= call25638formal@$ret@0 (+ call25600formal@$ret@0 0)) (and
(! (or %lbl%@87551 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @87551)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@87581 (sAddr call25638formal@$ret@0)) :lblneg @87581)
(=> (sAddr call25638formal@$ret@0) (=> (and
(= (select $Mem@@3 call25638formal@$ret@0) (select $sMem@@5 call25638formal@$ret@0))
(= call25643formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@87603 (= (ReturnToAddr (select $Mem@@3 call25638formal@$ret@0)) call25643formal@$oldRA@0)) :lblneg @87603)
(=> (= (ReturnToAddr (select $Mem@@3 call25638formal@$ret@0)) call25643formal@$oldRA@0) (and
(! (or %lbl%@87613 (Aligned call25638formal@$ret@0)) :lblneg @87613)
(=> (Aligned call25638formal@$ret@0) (=> (and
(= esp@0@@0 (+ call25638formal@$ret@0 4))
(Aligned esp@0@@0)) (and
(! (or %lbl%@87642 (= esp@0@@0 (+ esp 4))) :lblneg @87642)
(=> (= esp@0@@0 (+ esp 4)) (and
(! (or %lbl%@87650 (= esp@0@@0 (+ esp 4))) :lblneg @87650)
(=> (= esp@0@@0 (+ esp 4)) (and
(! (or %lbl%@87658 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @87658)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@87688 (SMemEnsure $sMem@@5 $sMem@@5 esp@0@@0 esp)) :lblneg @87688)
(=> (SMemEnsure $sMem@@5 $sMem@@5 esp@0@@0 esp) (and
(! (or %lbl%@87695 (and
(word call25634formal@$ret@0)
(word call25627formal@$ret@0)
(word edx)
(word ebx)
(word esi)
(word edi)
(word ebp))) :lblneg @87695)
(=> (and
(word call25634formal@$ret@0)
(word call25627formal@$ret@0)
(word edx)
(word ebx)
(word esi)
(word edi)
(word ebp)) (and
(! (or %lbl%@87733 (= call25627formal@$ret@0 $ghost_a)) :lblneg @87733)
(=> (= call25627formal@$ret@0 $ghost_a) (and
(! (or %lbl%@87738 (= call25634formal@$ret@0 call25627formal@$ret@0)) :lblneg @87738)
(=> (= call25634formal@$ret@0 call25627formal@$ret@0) true)))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+86878 true) :lblpos +86878) (=> (and
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(Aligned esp)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 0 $sMem@@5 esp $RET@@0)) (=> (and
(word eax)
(word ecx)
(word edx)
(word ebx)
(word esi)
(word edi)
(word ebp)
(= ecx $ghost_a)
(word $ghost_a)) anon0_correct@@0)))))
PreconditionGeneratedEntry_correct@@0))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+25854 () Bool)
(declare-fun %lbl%@87908 () Bool)
(declare-fun %lbl%@88072 () Bool)
(declare-fun %lbl%@88110 () Bool)
(declare-fun %lbl%@88148 () Bool)
(declare-fun %lbl%@88186 () Bool)
(declare-fun %lbl%+87743 () Bool)
(push 1)
(set-info :boogie-vc-id espAligned)
(assert (not
(let ((anon0_correct@@1 (=> (! (and %lbl%+25854 true) :lblpos +25854) (and
(! (or %lbl%@87908 (and
(TV esp)
(TO (- 0 1))
(TO (- 0 2))
(TO (- 0 3))
(TO (- 0 4))
(TO (- 0 5))
(TO (- 0 6))
(TO (- 0 7))
(TO (- 0 8))
(TO (- 0 9))
(TO (- 0 10))
(TO (- 0 11))
(TO (- 0 12))
(TO (- 0 13))
(TO (- 0 14))
(TO (- 0 15))
(TO (- 0 16)))) :lblneg @87908)
(=> (and
(TV esp)
(TO (- 0 1))
(TO (- 0 2))
(TO (- 0 3))
(TO (- 0 4))
(TO (- 0 5))
(TO (- 0 6))
(TO (- 0 7))
(TO (- 0 8))
(TO (- 0 9))
(TO (- 0 10))
(TO (- 0 11))
(TO (- 0 12))
(TO (- 0 13))
(TO (- 0 14))
(TO (- 0 15))
(TO (- 0 16))) (and
(! (or %lbl%@88072 (and
(Aligned (- esp 4))
(Aligned (- esp 8))
(Aligned (- esp 12))
(Aligned (- esp 16)))) :lblneg @88072)
(=> (and
(Aligned (- esp 4))
(Aligned (- esp 8))
(Aligned (- esp 12))
(Aligned (- esp 16))) (and
(! (or %lbl%@88110 (and
(Aligned (- esp 20))
(Aligned (- esp 24))
(Aligned (- esp 28))
(Aligned (- esp 32)))) :lblneg @88110)
(=> (and
(Aligned (- esp 20))
(Aligned (- esp 24))
(Aligned (- esp 28))
(Aligned (- esp 32))) (and
(! (or %lbl%@88148 (and
(Aligned (- esp 36))
(Aligned (- esp 40))
(Aligned (- esp 44))
(Aligned (- esp 48)))) :lblneg @88148)
(=> (and
(Aligned (- esp 36))
(Aligned (- esp 40))
(Aligned (- esp 44))
(Aligned (- esp 48))) (and
(! (or %lbl%@88186 (and
(Aligned (- esp 52))
(Aligned (- esp 56))
(Aligned (- esp 60))
(Aligned (- esp 64)))) :lblneg @88186)
(=> (and
(Aligned (- esp 52))
(Aligned (- esp 56))
(Aligned (- esp 60))
(Aligned (- esp 64))) true)))))))))))))
(let ((PreconditionGeneratedEntry_correct@@1 (=> (! (and %lbl%+87743 true) :lblpos +87743) (=> (Aligned esp) anon0_correct@@1))))
PreconditionGeneratedEntry_correct@@1))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+26026 () Bool)
(declare-fun %lbl%@88390 () Bool)
(declare-fun %lbl%@88490 () Bool)
(declare-fun %lbl%@88528 () Bool)
(declare-fun %lbl%@88566 () Bool)
(declare-fun %lbl%@88604 () Bool)
(declare-fun %lbl%+88225 () Bool)
(push 1)
(set-info :boogie-vc-id espAlignedInline)
(assert (not
(let ((anon0_correct@@2 (=> (! (and %lbl%+26026 true) :lblpos +26026) (and
(! (or %lbl%@88390 (and
(TV esp)
(TO 1)
(TO 2)
(TO 3)
(TO 4)
(TO 5)
(TO 6)
(TO 7)
(TO 8)
(TO 9)
(TO 10)
(TO 11)
(TO 12)
(TO 13)
(TO 14)
(TO 15)
(TO 16))) :lblneg @88390)
(=> (and
(TV esp)
(TO 1)
(TO 2)
(TO 3)
(TO 4)
(TO 5)
(TO 6)
(TO 7)
(TO 8)
(TO 9)
(TO 10)
(TO 11)
(TO 12)
(TO 13)
(TO 14)
(TO 15)
(TO 16)) (and
(! (or %lbl%@88490 (and
(Aligned (+ esp 4))
(Aligned (+ esp 8))
(Aligned (+ esp 12))
(Aligned (+ esp 16)))) :lblneg @88490)
(=> (and
(Aligned (+ esp 4))
(Aligned (+ esp 8))
(Aligned (+ esp 12))
(Aligned (+ esp 16))) (and
(! (or %lbl%@88528 (and
(Aligned (+ esp 20))
(Aligned (+ esp 24))
(Aligned (+ esp 28))
(Aligned (+ esp 32)))) :lblneg @88528)
(=> (and
(Aligned (+ esp 20))
(Aligned (+ esp 24))
(Aligned (+ esp 28))
(Aligned (+ esp 32))) (and
(! (or %lbl%@88566 (and
(Aligned (+ esp 36))
(Aligned (+ esp 40))
(Aligned (+ esp 44))
(Aligned (+ esp 48)))) :lblneg @88566)
(=> (and
(Aligned (+ esp 36))
(Aligned (+ esp 40))
(Aligned (+ esp 44))
(Aligned (+ esp 48))) (and
(! (or %lbl%@88604 (and
(Aligned (+ esp 52))
(Aligned (+ esp 56))
(Aligned (+ esp 60))
(Aligned (+ esp 64)))) :lblneg @88604)
(=> (and
(Aligned (+ esp 52))
(Aligned (+ esp 56))
(Aligned (+ esp 60))
(Aligned (+ esp 64))) true)))))))))))))
(let ((PreconditionGeneratedEntry_correct@@2 (=> (! (and %lbl%+88225 true) :lblpos +88225) (=> (Aligned esp) anon0_correct@@2))))
PreconditionGeneratedEntry_correct@@2))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+26062 () Bool)
(declare-fun call26048formal@$ret@0 () Int)
(declare-fun %lbl%@88742 () Bool)
(declare-fun $TimerSeq@0 () Int)
(declare-fun $TimerFreq@0 () Int)
(declare-fun call26053formal@$ret@0 () Int)
(declare-fun %lbl%@88800 () Bool)
(declare-fun %lbl%@88812 () Bool)
(declare-fun %lbl%@88823 () Bool)
(declare-fun $TimerSeq@1 () Int)
(declare-fun %lbl%@88866 () Bool)
(declare-fun call26058formal@$ret@0 () Int)
(declare-fun %lbl%@88896 () Bool)
(declare-fun %lbl%@88908 () Bool)
(declare-fun %lbl%@88919 () Bool)
(declare-fun $TimerSeq@2 () Int)
(declare-fun %lbl%@88957 () Bool)
(declare-fun %lbl%+88643 () Bool)
(push 1)
(set-info :boogie-vc-id startTimer)
(assert (not
(let ((anon0_correct@@3 (=> (! (and %lbl%+26062 true) :lblpos +26062) (=> (= call26048formal@$ret@0 48) (and
(! (or %lbl%@88742 (= call26048formal@$ret@0 48)) :lblneg @88742)
(=> (= call26048formal@$ret@0 48) (=> (= $TimerSeq@0 0) (=> (and
(= $TimerFreq@0 ecx)
(= call26053formal@$ret@0 ecx)) (and
(! (or %lbl%@88800 (and
(<= 0 $TimerSeq@0)
(< $TimerSeq@0 2))) :lblneg @88800)
(=> (and
(<= 0 $TimerSeq@0)
(< $TimerSeq@0 2)) (and
(! (or %lbl%@88812 (=> (= $TimerSeq@0 0) (= call26053formal@$ret@0 $TimerFreq@0))) :lblneg @88812)
(=> (=> (= $TimerSeq@0 0) (= call26053formal@$ret@0 $TimerFreq@0)) (and
(! (or %lbl%@88823 (=> (= $TimerSeq@0 1) (= call26053formal@$ret@0 (shr $TimerFreq@0 8)))) :lblneg @88823)
(=> (=> (= $TimerSeq@0 1) (= call26053formal@$ret@0 (shr $TimerFreq@0 8))) (=> (= $TimerSeq@1 (+ $TimerSeq@0 1)) (and
(! (or %lbl%@88866 (< 8 32)) :lblneg @88866)
(=> (< 8 32) (=> (and
(= call26058formal@$ret@0 (shr call26053formal@$ret@0 8))
(word call26058formal@$ret@0)) (and
(! (or %lbl%@88896 (and
(<= 0 $TimerSeq@1)
(< $TimerSeq@1 2))) :lblneg @88896)
(=> (and
(<= 0 $TimerSeq@1)
(< $TimerSeq@1 2)) (and
(! (or %lbl%@88908 (=> (= $TimerSeq@1 0) (= call26058formal@$ret@0 $TimerFreq@0))) :lblneg @88908)
(=> (=> (= $TimerSeq@1 0) (= call26058formal@$ret@0 $TimerFreq@0)) (and
(! (or %lbl%@88919 (=> (= $TimerSeq@1 1) (= call26058formal@$ret@0 (shr $TimerFreq@0 8)))) :lblneg @88919)
(=> (=> (= $TimerSeq@1 1) (= call26058formal@$ret@0 (shr $TimerFreq@0 8))) (=> (= $TimerSeq@2 (+ $TimerSeq@1 1)) (and
(! (or %lbl%@88957 (and
(TimerOk $TimerSeq@2)
(= $TimerFreq@0 ecx))) :lblneg @88957)
(=> (and
(TimerOk $TimerSeq@2)
(= $TimerFreq@0 ecx)) true)))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@3 (=> (! (and %lbl%+88643 true) :lblpos +88643) (=> (word ecx) anon0_correct@@3))))
PreconditionGeneratedEntry_correct@@3))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+26738 () Bool)
(declare-fun $Efl@6@@0 () Int)
(declare-fun %lbl%@90921 () Bool)
(declare-fun call26604formal@$ret@0 () Int)
(declare-fun edx@0@@0 () Int)
(declare-fun %lbl%@90981 () Bool)
(declare-fun call26608formal@$ret@0 () Int)
(declare-fun call26611formal@$ret@0 () Int)
(declare-fun call26616formal@$ptr@0 () Int)
(declare-fun edi@0 () Int)
(declare-fun %lbl%@91043 () Bool)
(declare-fun %lbl%@91046 () Bool)
(declare-fun %lbl%@91049 () Bool)
(declare-fun %lbl%@91052 () Bool)
(declare-fun $IomFrozen () Bool)
(declare-fun $IomMem@1 () (Array Int Int))
(declare-fun $IomMem@0 () (Array Int Int))
(declare-fun call26621formal@$ptr@0 () Int)
(declare-fun %lbl%@91093 () Bool)
(declare-fun %lbl%@91096 () Bool)
(declare-fun %lbl%@91099 () Bool)
(declare-fun %lbl%@91102 () Bool)
(declare-fun $IomMem@2 () (Array Int Int))
(declare-fun call26626formal@$ptr@0 () Int)
(declare-fun %lbl%@91143 () Bool)
(declare-fun %lbl%@91146 () Bool)
(declare-fun %lbl%@91149 () Bool)
(declare-fun %lbl%@91152 () Bool)
(declare-fun $IomMem@3 () (Array Int Int))
(declare-fun call26631formal@$ptr@0 () Int)
(declare-fun %lbl%@91193 () Bool)
(declare-fun %lbl%@91196 () Bool)
(declare-fun %lbl%@91199 () Bool)
(declare-fun %lbl%@91202 () Bool)
(declare-fun $IomMem@4 () (Array Int Int))
(declare-fun call26636formal@$ptr@0 () Int)
(declare-fun %lbl%@91243 () Bool)
(declare-fun %lbl%@91246 () Bool)
(declare-fun %lbl%@91249 () Bool)
(declare-fun %lbl%@91252 () Bool)
(declare-fun $IomMem@5 () (Array Int Int))
(declare-fun call26641formal@$ptr@0 () Int)
(declare-fun %lbl%@91293 () Bool)
(declare-fun %lbl%@91296 () Bool)
(declare-fun %lbl%@91299 () Bool)
(declare-fun %lbl%@91302 () Bool)
(declare-fun $IomMem@6 () (Array Int Int))
(declare-fun call26646formal@$ptr@0 () Int)
(declare-fun %lbl%@91343 () Bool)
(declare-fun %lbl%@91346 () Bool)
(declare-fun %lbl%@91349 () Bool)
(declare-fun %lbl%@91352 () Bool)
(declare-fun $IomMem@7 () (Array Int Int))
(declare-fun call26651formal@$ptr@0 () Int)
(declare-fun %lbl%@91393 () Bool)
(declare-fun %lbl%@91396 () Bool)
(declare-fun %lbl%@91399 () Bool)
(declare-fun %lbl%@91402 () Bool)
(declare-fun $IomMem@8 () (Array Int Int))
(declare-fun $entry@1 () Int)
(declare-fun $entry@0 () Int)
(declare-fun %lbl%@91445 () Bool)
(declare-fun call26661formal@$ret@0 () Int)
(declare-fun %lbl%@91475 () Bool)
(declare-fun %lbl%@91484 () Bool)
(declare-fun %lbl%@91517 () Bool)
(declare-fun call26667formal@$ret@0 () Int)
(declare-fun %lbl%@91548 () Bool)
(declare-fun %lbl%@91568 () Bool)
(declare-fun %lbl%@91580 () Bool)
(declare-fun %lbl%@91589 () Bool)
(declare-fun %lbl%@91601 () Bool)
(declare-fun %lbl%@91613 () Bool)
(declare-fun %lbl%@91674 () Bool)
(declare-fun %lbl%@91751 () Bool)
(declare-fun %lbl%@91828 () Bool)
(declare-fun %lbl%+26749 () Bool)
(declare-fun %lbl%+89042 () Bool)
(declare-fun %lbl%@92133 () Bool)
(declare-fun $IomMem@10 () (Array Int Int))
(declare-fun %lbl%@92138 () Bool)
(declare-fun %lbl%@92243 () Bool)
(declare-fun %lbl%@92321 () Bool)
(declare-fun %lbl%+26753 () Bool)
(declare-fun %lbl%@91973 () Bool)
(declare-fun ecx@2 () Int)
(declare-fun call26709formal@$ret@0 () Int)
(declare-fun %lbl%@92018 () Bool)
(declare-fun call26713formal@$ret@0 () Int)
(declare-fun call26716formal@$ret@0 () Int)
(declare-fun call26725formal@$ptr@0 () Int)
(declare-fun %lbl%@92088 () Bool)
(declare-fun %lbl%@92091 () Bool)
(declare-fun %lbl%@92094 () Bool)
(declare-fun %lbl%@92097 () Bool)
(declare-fun $IomMem@9 () (Array Int Int))
(declare-fun %lbl%+26747 () Bool)
(declare-fun $Efl@9 () Int)
(declare-fun call26677formal@$ret@0 () Int)
(declare-fun %lbl%+26736 () Bool)
(declare-fun call26673formal@$ret@0 () Int)
(declare-fun %lbl%@90831 () Bool)
(declare-fun call26684formal@$x@0 () T@opn)
(declare-fun call26684formal@$y@0 () T@opn)
(declare-fun %lbl%@90880 () Bool)
(declare-fun %lbl%@90885 () Bool)
(declare-fun %lbl%+26735 () Bool)
(declare-fun call26571formal@$x@0 () T@opn)
(declare-fun call26571formal@$y@0 () T@opn)
(declare-fun call26333formal@$ret@0 () Int)
(declare-fun %lbl%@90765 () Bool)
(declare-fun %lbl%@90770 () Bool)
(declare-fun %lbl%+26728 () Bool)
(declare-fun call26323formal@$ret@0 () Int)
(declare-fun call26326formal@$ret@0 () Int)
(declare-fun %lbl%@89909 () Bool)
(declare-fun call26330formal@$ret@0 () Int)
(declare-fun call26336formal@$ret@0 () Int)
(declare-fun %lbl%@89983 () Bool)
(declare-fun %lbl%@90003 () Bool)
(declare-fun %lbl%@90015 () Bool)
(declare-fun %lbl%@90024 () Bool)
(declare-fun %lbl%@90036 () Bool)
(declare-fun %lbl%@90048 () Bool)
(declare-fun $IomMem@@7 () (Array Int Int))
(declare-fun %lbl%@90111 () Bool)
(declare-fun %lbl%@90190 () Bool)
(declare-fun %lbl%@90269 () Bool)
(declare-fun %lbl%+89046 () Bool)
(push 1)
(set-info :boogie-vc-id setupIoTablesHelper1)
(assert (not
(let ((anon5_Else_correct (=> (! (and %lbl%+26738 true) :lblpos +26738) (=> (not (Jae $Efl@6@@0)) (and
(! (or %lbl%@90921 (and
(TO 1024)
(TO 1025)
(TO 2048)
(TO 2049)
(TO 3072)
(TO 3073))) :lblneg @90921)
(=> (and
(TO 1024)
(TO 1025)
(TO 2048)
(TO 2049)
(TO 3072)
(TO 3073)) (=> (= call26604formal@$ret@0 edx@0@@0) (and
(! (or %lbl%@90981 (word (+ call26604formal@$ret@0 3))) :lblneg @90981)
(=> (word (+ call26604formal@$ret@0 3)) (=> (= call26608formal@$ret@0 (+ call26604formal@$ret@0 3)) (=> (and
(= call26611formal@$ret@0 call26608formal@$ret@0)
(= call26616formal@$ptr@0 (+ edi@0 0))) (and
(! (or %lbl%@91043 (iomAddr call26616formal@$ptr@0)) :lblneg @91043)
(=> (iomAddr call26616formal@$ptr@0) (and
(! (or %lbl%@91046 (Aligned call26616formal@$ptr@0)) :lblneg @91046)
(=> (Aligned call26616formal@$ptr@0) (and
(! (or %lbl%@91049 (word call26611formal@$ret@0)) :lblneg @91049)
(=> (word call26611formal@$ret@0) (and
(! (or %lbl%@91052 (not $IomFrozen)) :lblneg @91052)
(=> (not $IomFrozen) (=> (and
(= $IomMem@1 (store $IomMem@0 call26616formal@$ptr@0 call26611formal@$ret@0))
(= call26621formal@$ptr@0 (+ edi@0 4))) (and
(! (or %lbl%@91093 (iomAddr call26621formal@$ptr@0)) :lblneg @91093)
(=> (iomAddr call26621formal@$ptr@0) (and
(! (or %lbl%@91096 (Aligned call26621formal@$ptr@0)) :lblneg @91096)
(=> (Aligned call26621formal@$ptr@0) (and
(! (or %lbl%@91099 (word 0)) :lblneg @91099)
(=> (word 0) (and
(! (or %lbl%@91102 (not $IomFrozen)) :lblneg @91102)
(=> (not $IomFrozen) (=> (and
(= $IomMem@2 (store $IomMem@1 call26621formal@$ptr@0 0))
(= call26626formal@$ptr@0 (+ edi@0 4096))) (and
(! (or %lbl%@91143 (iomAddr call26626formal@$ptr@0)) :lblneg @91143)
(=> (iomAddr call26626formal@$ptr@0) (and
(! (or %lbl%@91146 (Aligned call26626formal@$ptr@0)) :lblneg @91146)
(=> (Aligned call26626formal@$ptr@0) (and
(! (or %lbl%@91149 (word 0)) :lblneg @91149)
(=> (word 0) (and
(! (or %lbl%@91152 (not $IomFrozen)) :lblneg @91152)
(=> (not $IomFrozen) (=> (and
(= $IomMem@3 (store $IomMem@2 call26626formal@$ptr@0 0))
(= call26631formal@$ptr@0 (+ edi@0 4100))) (and
(! (or %lbl%@91193 (iomAddr call26631formal@$ptr@0)) :lblneg @91193)
(=> (iomAddr call26631formal@$ptr@0) (and
(! (or %lbl%@91196 (Aligned call26631formal@$ptr@0)) :lblneg @91196)
(=> (Aligned call26631formal@$ptr@0) (and
(! (or %lbl%@91199 (word 0)) :lblneg @91199)
(=> (word 0) (and
(! (or %lbl%@91202 (not $IomFrozen)) :lblneg @91202)
(=> (not $IomFrozen) (=> (and
(= $IomMem@4 (store $IomMem@3 call26631formal@$ptr@0 0))
(= call26636formal@$ptr@0 (+ edi@0 8192))) (and
(! (or %lbl%@91243 (iomAddr call26636formal@$ptr@0)) :lblneg @91243)
(=> (iomAddr call26636formal@$ptr@0) (and
(! (or %lbl%@91246 (Aligned call26636formal@$ptr@0)) :lblneg @91246)
(=> (Aligned call26636formal@$ptr@0) (and
(! (or %lbl%@91249 (word 0)) :lblneg @91249)
(=> (word 0) (and
(! (or %lbl%@91252 (not $IomFrozen)) :lblneg @91252)
(=> (not $IomFrozen) (=> (and
(= $IomMem@5 (store $IomMem@4 call26636formal@$ptr@0 0))
(= call26641formal@$ptr@0 (+ edi@0 8196))) (and
(! (or %lbl%@91293 (iomAddr call26641formal@$ptr@0)) :lblneg @91293)
(=> (iomAddr call26641formal@$ptr@0) (and
(! (or %lbl%@91296 (Aligned call26641formal@$ptr@0)) :lblneg @91296)
(=> (Aligned call26641formal@$ptr@0) (and
(! (or %lbl%@91299 (word 0)) :lblneg @91299)
(=> (word 0) (and
(! (or %lbl%@91302 (not $IomFrozen)) :lblneg @91302)
(=> (not $IomFrozen) (=> (and
(= $IomMem@6 (store $IomMem@5 call26641formal@$ptr@0 0))
(= call26646formal@$ptr@0 (+ edi@0 12288))) (and
(! (or %lbl%@91343 (iomAddr call26646formal@$ptr@0)) :lblneg @91343)
(=> (iomAddr call26646formal@$ptr@0) (and
(! (or %lbl%@91346 (Aligned call26646formal@$ptr@0)) :lblneg @91346)
(=> (Aligned call26646formal@$ptr@0) (and
(! (or %lbl%@91349 (word 0)) :lblneg @91349)
(=> (word 0) (and
(! (or %lbl%@91352 (not $IomFrozen)) :lblneg @91352)
(=> (not $IomFrozen) (=> (and
(= $IomMem@7 (store $IomMem@6 call26646formal@$ptr@0 0))
(= call26651formal@$ptr@0 (+ edi@0 12292))) (and
(! (or %lbl%@91393 (iomAddr call26651formal@$ptr@0)) :lblneg @91393)
(=> (iomAddr call26651formal@$ptr@0) (and
(! (or %lbl%@91396 (Aligned call26651formal@$ptr@0)) :lblneg @91396)
(=> (Aligned call26651formal@$ptr@0) (and
(! (or %lbl%@91399 (word 0)) :lblneg @91399)
(=> (word 0) (and
(! (or %lbl%@91402 (not $IomFrozen)) :lblneg @91402)
(=> (not $IomFrozen) (=> (and
(= $IomMem@8 (store $IomMem@7 call26651formal@$ptr@0 0))
(= $entry@1 (+ $entry@0 1))) (and
(! (or %lbl%@91445 (word (+ edi@0 8))) :lblneg @91445)
(=> (word (+ edi@0 8)) (=> (= call26661formal@$ret@0 (+ edi@0 8)) (and
(! (or %lbl%@91475 (= (q@and edx@0@@0 4095) 0)) :lblneg @91475)
(=> (= (q@and edx@0@@0 4095) 0) (and
(! (or %lbl%@91484 (and
(word edx@0@@0)
(word (+ edx@0@@0 4096)))) :lblneg @91484)
(=> (and
(word edx@0@@0)
(word (+ edx@0@@0 4096))) (=> (and
(= (q@and (+ edx@0@@0 4096) 4095) 0)
(Aligned edx@0@@0)) (and
(! (or %lbl%@91517 (word (+ edx@0@@0 4096))) :lblneg @91517)
(=> (word (+ edx@0@@0 4096)) (=> (= call26667formal@$ret@0 (+ edx@0@@0 4096)) (and
(! (or %lbl%@91548 (and
(Aligned call26661formal@$ret@0)
(TV call26661formal@$ret@0)
(TO 1)
(TO 2))) :lblneg @91548)
(=> (and
(Aligned call26661formal@$ret@0)
(TV call26661formal@$ret@0)
(TO 1)
(TO 2)) (and
(! (or %lbl%@91568 (= call26667formal@$ret@0 (+ ebx (* $entry@1 4096)))) :lblneg @91568)
(=> (= call26667formal@$ret@0 (+ ebx (* $entry@1 4096))) (and
(! (or %lbl%@91580 (= (q@and call26667formal@$ret@0 4095) 0)) :lblneg @91580)
(=> (= (q@and call26667formal@$ret@0 4095) 0) (and
(! (or %lbl%@91589 (= call26661formal@$ret@0 (+ esi (* 8 $entry@1)))) :lblneg @91589)
(=> (= call26661formal@$ret@0 (+ esi (* 8 $entry@1))) (and
(! (or %lbl%@91601 (and
(<= 0 $entry@1)
(<= $entry@1 512))) :lblneg @91601)
(=> (and
(<= 0 $entry@1)
(<= $entry@1 512)) (and
(! (or %lbl%@91613 (forall ((i@@42 Int) ) (! (=> (and
(TV i@@42)
(<= 0 i@@42)
(< i@@42 $entry@1)) (IoPageTableEntry (select $IomMem@8 (+ esi (* 8 i@@42))) (select $IomMem@8 (+ (+ esi (* 8 i@@42)) 4))))
 :qid |EntryMSb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@42))
))) :lblneg @91613)
(=> (forall ((i@@43 Int) ) (! (=> (and
(TV i@@43)
(<= 0 i@@43)
(< i@@43 $entry@1)) (IoPageTableEntry (select $IomMem@8 (+ esi (* 8 i@@43))) (select $IomMem@8 (+ (+ esi (* 8 i@@43)) 4))))
 :qid |EntryMSb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@43))
)) (and
(! (or %lbl%@91674 (forall ((i@@44 Int) ) (! (=> (and
(TV i@@44)
(<= 0 i@@44)
(< i@@44 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 4096) (* 8 i@@44))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 4096) (* 8 i@@44)) 4)) 0)))
 :qid |EntryMSb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@44))
))) :lblneg @91674)
(=> (forall ((i@@45 Int) ) (! (=> (and
(TV i@@45)
(<= 0 i@@45)
(< i@@45 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 4096) (* 8 i@@45))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 4096) (* 8 i@@45)) 4)) 0)))
 :qid |EntryMSb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@45))
)) (and
(! (or %lbl%@91751 (forall ((i@@46 Int) ) (! (=> (and
(TV i@@46)
(<= 0 i@@46)
(< i@@46 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 8192) (* 8 i@@46))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 8192) (* 8 i@@46)) 4)) 0)))
 :qid |EntryMSb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@46))
))) :lblneg @91751)
(=> (forall ((i@@47 Int) ) (! (=> (and
(TV i@@47)
(<= 0 i@@47)
(< i@@47 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 8192) (* 8 i@@47))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 8192) (* 8 i@@47)) 4)) 0)))
 :qid |EntryMSb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@47))
)) (and
(! (or %lbl%@91828 (forall ((i@@48 Int) ) (! (=> (and
(TV i@@48)
(<= 0 i@@48)
(< i@@48 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 12288) (* 8 i@@48))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 12288) (* 8 i@@48)) 4)) 0)))
 :qid |EntryMSb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@48))
))) :lblneg @91828)
(=> (forall ((i@@49 Int) ) (! (=> (and
(TV i@@49)
(<= 0 i@@49)
(< i@@49 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 12288) (* 8 i@@49))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 12288) (* 8 i@@49)) 4)) 0)))
 :qid |EntryMSb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@49))
)) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon6_Else_correct (=> (! (and %lbl%+26749 true) :lblpos +26749) true)))
(let ((GeneratedUnifiedExit_correct@@0 (=> (! (and %lbl%+89042 true) :lblpos +89042) (and
(! (or %lbl%@92133 (IoPageTable $IomMem@10 esi)) :lblneg @92133)
(=> (IoPageTable $IomMem@10 esi) (and
(! (or %lbl%@92138 (forall ((i@@50 Int) ) (! (=> (and
(TV i@@50)
(<= 0 i@@50)
(< i@@50 512)) (and
(or
(= (select $IomMem@10 (+ (+ esi 4096) (* 8 i@@50))) 0)
(= (select $IomMem@10 (+ (+ esi 4096) (* 8 i@@50))) (+ esi 3)))
(= (select $IomMem@10 (+ (+ (+ esi 4096) (* 8 i@@50)) 4)) 0)))
 :qid |EntryMSb.49:17|
 :skolemid |248|
 :pattern ( (TV i@@50))
))) :lblneg @92138)
(=> (forall ((i@@51 Int) ) (! (=> (and
(TV i@@51)
(<= 0 i@@51)
(< i@@51 512)) (and
(or
(= (select $IomMem@10 (+ (+ esi 4096) (* 8 i@@51))) 0)
(= (select $IomMem@10 (+ (+ esi 4096) (* 8 i@@51))) (+ esi 3)))
(= (select $IomMem@10 (+ (+ (+ esi 4096) (* 8 i@@51)) 4)) 0)))
 :qid |EntryMSb.49:17|
 :skolemid |248|
 :pattern ( (TV i@@51))
)) (and
(! (or %lbl%@92243 (forall ((i@@52 Int) ) (! (=> (and
(TV i@@52)
(<= 0 i@@52)
(< i@@52 512)) (and
(= (select $IomMem@10 (+ (+ esi 8192) (* 8 i@@52))) 0)
(= (select $IomMem@10 (+ (+ (+ esi 8192) (* 8 i@@52)) 4)) 0)))
 :qid |EntryMSb.52:17|
 :skolemid |249|
 :pattern ( (TV i@@52))
))) :lblneg @92243)
(=> (forall ((i@@53 Int) ) (! (=> (and
(TV i@@53)
(<= 0 i@@53)
(< i@@53 512)) (and
(= (select $IomMem@10 (+ (+ esi 8192) (* 8 i@@53))) 0)
(= (select $IomMem@10 (+ (+ (+ esi 8192) (* 8 i@@53)) 4)) 0)))
 :qid |EntryMSb.52:17|
 :skolemid |249|
 :pattern ( (TV i@@53))
)) (and
(! (or %lbl%@92321 (forall ((i@@54 Int) ) (! (=> (and
(TV i@@54)
(<= 0 i@@54)
(< i@@54 512)) (and
(= (select $IomMem@10 (+ (+ esi 12288) (* 8 i@@54))) 0)
(= (select $IomMem@10 (+ (+ (+ esi 12288) (* 8 i@@54)) 4)) 0)))
 :qid |EntryMSb.55:17|
 :skolemid |250|
 :pattern ( (TV i@@54))
))) :lblneg @92321)
(=> (forall ((i@@55 Int) ) (! (=> (and
(TV i@@55)
(<= 0 i@@55)
(< i@@55 512)) (and
(= (select $IomMem@10 (+ (+ esi 12288) (* 8 i@@55))) 0)
(= (select $IomMem@10 (+ (+ (+ esi 12288) (* 8 i@@55)) 4)) 0)))
 :qid |EntryMSb.55:17|
 :skolemid |250|
 :pattern ( (TV i@@55))
)) true)))))))))))
(let ((__L3_correct (=> (! (and %lbl%+26753 true) :lblpos +26753) (and
(! (or %lbl%@91973 (and
(TV ecx@2)
(TO (+ (* 2 ecx@2) 1024)))) :lblneg @91973)
(=> (and
(TV ecx@2)
(TO (+ (* 2 ecx@2) 1024))) (=> (= call26709formal@$ret@0 esi) (and
(! (or %lbl%@92018 (word (+ call26709formal@$ret@0 3))) :lblneg @92018)
(=> (word (+ call26709formal@$ret@0 3)) (=> (= call26713formal@$ret@0 (+ call26709formal@$ret@0 3)) (=> (and
(= call26716formal@$ret@0 call26713formal@$ret@0)
(= call26725formal@$ptr@0 (+ (+ esi (* 8 ecx@2)) 4096))) (and
(! (or %lbl%@92088 (iomAddr call26725formal@$ptr@0)) :lblneg @92088)
(=> (iomAddr call26725formal@$ptr@0) (and
(! (or %lbl%@92091 (Aligned call26725formal@$ptr@0)) :lblneg @92091)
(=> (Aligned call26725formal@$ptr@0) (and
(! (or %lbl%@92094 (word call26716formal@$ret@0)) :lblneg @92094)
(=> (word call26716formal@$ret@0) (and
(! (or %lbl%@92097 (not $IomFrozen)) :lblneg @92097)
(=> (not $IomFrozen) (=> (and
(= $IomMem@9 (store $IomMem@0 call26725formal@$ptr@0 call26716formal@$ret@0))
(= $IomMem@10 $IomMem@9)) GeneratedUnifiedExit_correct@@0)))))))))))))))))))
(let ((anon6_Then_correct (=> (! (and %lbl%+26747 true) :lblpos +26747) (=> (and
(Jb $Efl@9)
(= ecx@2 call26677formal@$ret@0)) __L3_correct))))
(let ((anon5_Then_correct (=> (! (and %lbl%+26736 true) :lblpos +26736) (=> (and
(Jae $Efl@6@@0)
(= call26673formal@$ret@0 ebx)) (and
(! (or %lbl%@90831 (< 21 32)) :lblneg @90831)
(=> (< 21 32) (=> (and
(= call26677formal@$ret@0 (shr call26673formal@$ret@0 21))
(word call26677formal@$ret@0)
(= call26684formal@$x@0 (OpnReg call26677formal@$ret@0))
(= call26684formal@$y@0 (OpnReg 512))) (and
(! (or %lbl%@90880 (OpnOk $Mem@@3 call26684formal@$x@0)) :lblneg @90880)
(=> (OpnOk $Mem@@3 call26684formal@$x@0) (and
(! (or %lbl%@90885 (OpnOk $Mem@@3 call26684formal@$y@0)) :lblneg @90885)
(=> (OpnOk $Mem@@3 call26684formal@$y@0) (=> (FlagsCmp $Efl@9 (EvalOpn $Mem@@3 call26684formal@$x@0) (EvalOpn $Mem@@3 call26684formal@$y@0)) (and
anon6_Then_correct
anon6_Else_correct)))))))))))))
(let ((__L1_correct (=> (! (and %lbl%+26735 true) :lblpos +26735) (=> (and
(not $IomFrozen)
(<= 0 $entry@0)
(< $entry@0 514)) (=> (and
(Aligned edi@0)
(TV edi@0)
(TO 1)
(TO 2)
(= edx@0@@0 (+ ebx (* $entry@0 4096)))
(= (q@and edx@0@@0 4095) 0)
(= edi@0 (+ esi (* 8 $entry@0)))
(<= 0 $entry@0)
(<= $entry@0 512)
(forall ((i@@56 Int) ) (! (=> (and
(TV i@@56)
(<= 0 i@@56)
(< i@@56 $entry@0)) (IoPageTableEntry (select $IomMem@0 (+ esi (* 8 i@@56))) (select $IomMem@0 (+ (+ esi (* 8 i@@56)) 4))))
 :qid |EntryMSb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@56))
))
(forall ((i@@57 Int) ) (! (=> (and
(TV i@@57)
(<= 0 i@@57)
(< i@@57 $entry@0)) (and
(= (select $IomMem@0 (+ (+ esi 4096) (* 8 i@@57))) 0)
(= (select $IomMem@0 (+ (+ (+ esi 4096) (* 8 i@@57)) 4)) 0)))
 :qid |EntryMSb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@57))
))
(forall ((i@@58 Int) ) (! (=> (and
(TV i@@58)
(<= 0 i@@58)
(< i@@58 $entry@0)) (and
(= (select $IomMem@0 (+ (+ esi 8192) (* 8 i@@58))) 0)
(= (select $IomMem@0 (+ (+ (+ esi 8192) (* 8 i@@58)) 4)) 0)))
 :qid |EntryMSb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@58))
))
(forall ((i@@59 Int) ) (! (=> (and
(TV i@@59)
(<= 0 i@@59)
(< i@@59 $entry@0)) (and
(= (select $IomMem@0 (+ (+ esi 12288) (* 8 i@@59))) 0)
(= (select $IomMem@0 (+ (+ (+ esi 12288) (* 8 i@@59)) 4)) 0)))
 :qid |EntryMSb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@59))
))
(= call26571formal@$x@0 (OpnReg edi@0))
(= call26571formal@$y@0 (OpnReg call26333formal@$ret@0))) (and
(! (or %lbl%@90765 (OpnOk $Mem@@3 call26571formal@$x@0)) :lblneg @90765)
(=> (OpnOk $Mem@@3 call26571formal@$x@0) (and
(! (or %lbl%@90770 (OpnOk $Mem@@3 call26571formal@$y@0)) :lblneg @90770)
(=> (OpnOk $Mem@@3 call26571formal@$y@0) (=> (FlagsCmp $Efl@6@@0 (EvalOpn $Mem@@3 call26571formal@$x@0) (EvalOpn $Mem@@3 call26571formal@$y@0)) (and
anon5_Then_correct
anon5_Else_correct)))))))))))
(let ((anon0_correct@@4 (=> (! (and %lbl%+26728 true) :lblpos +26728) (=> (and
(= call26323formal@$ret@0 esi)
(= call26326formal@$ret@0 call26323formal@$ret@0)) (and
(! (or %lbl%@89909 (word (+ call26326formal@$ret@0 4096))) :lblneg @89909)
(=> (word (+ call26326formal@$ret@0 4096)) (=> (= call26330formal@$ret@0 (+ call26326formal@$ret@0 4096)) (=> (and
(= call26333formal@$ret@0 call26330formal@$ret@0)
(= call26336formal@$ret@0 ebx)) (and
(! (or %lbl%@89983 (and
(Aligned call26323formal@$ret@0)
(TV call26323formal@$ret@0)
(TO 1)
(TO 2))) :lblneg @89983)
(=> (and
(Aligned call26323formal@$ret@0)
(TV call26323formal@$ret@0)
(TO 1)
(TO 2)) (and
(! (or %lbl%@90003 (= call26336formal@$ret@0 (+ ebx (* 0 4096)))) :lblneg @90003)
(=> (= call26336formal@$ret@0 (+ ebx (* 0 4096))) (and
(! (or %lbl%@90015 (= (q@and call26336formal@$ret@0 4095) 0)) :lblneg @90015)
(=> (= (q@and call26336formal@$ret@0 4095) 0) (and
(! (or %lbl%@90024 (= call26323formal@$ret@0 (+ esi (* 8 0)))) :lblneg @90024)
(=> (= call26323formal@$ret@0 (+ esi (* 8 0))) (and
(! (or %lbl%@90036 (and
(<= 0 0)
(<= 0 512))) :lblneg @90036)
(=> (and
(<= 0 0)
(<= 0 512)) (and
(! (or %lbl%@90048 (forall ((i@@60 Int) ) (! (=> (and
(TV i@@60)
(<= 0 i@@60)
(< i@@60 0)) (IoPageTableEntry (select $IomMem@@7 (+ esi (* 8 i@@60))) (select $IomMem@@7 (+ (+ esi (* 8 i@@60)) 4))))
 :qid |EntryMSb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@60))
))) :lblneg @90048)
(=> (forall ((i@@61 Int) ) (! (=> (and
(TV i@@61)
(<= 0 i@@61)
(< i@@61 0)) (IoPageTableEntry (select $IomMem@@7 (+ esi (* 8 i@@61))) (select $IomMem@@7 (+ (+ esi (* 8 i@@61)) 4))))
 :qid |EntryMSb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@61))
)) (and
(! (or %lbl%@90111 (forall ((i@@62 Int) ) (! (=> (and
(TV i@@62)
(<= 0 i@@62)
(< i@@62 0)) (and
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@62))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 4096) (* 8 i@@62)) 4)) 0)))
 :qid |EntryMSb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@62))
))) :lblneg @90111)
(=> (forall ((i@@63 Int) ) (! (=> (and
(TV i@@63)
(<= 0 i@@63)
(< i@@63 0)) (and
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@63))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 4096) (* 8 i@@63)) 4)) 0)))
 :qid |EntryMSb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@63))
)) (and
(! (or %lbl%@90190 (forall ((i@@64 Int) ) (! (=> (and
(TV i@@64)
(<= 0 i@@64)
(< i@@64 0)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@64))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@64)) 4)) 0)))
 :qid |EntryMSb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@64))
))) :lblneg @90190)
(=> (forall ((i@@65 Int) ) (! (=> (and
(TV i@@65)
(<= 0 i@@65)
(< i@@65 0)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@65))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@65)) 4)) 0)))
 :qid |EntryMSb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@65))
)) (and
(! (or %lbl%@90269 (forall ((i@@66 Int) ) (! (=> (and
(TV i@@66)
(<= 0 i@@66)
(< i@@66 0)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@66))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@66)) 4)) 0)))
 :qid |EntryMSb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@66))
))) :lblneg @90269)
(=> (forall ((i@@67 Int) ) (! (=> (and
(TV i@@67)
(<= 0 i@@67)
(< i@@67 0)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@67))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@67)) 4)) 0)))
 :qid |EntryMSb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@67))
)) __L1_correct))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@4 (=> (! (and %lbl%+89046 true) :lblpos +89046) (=> (and
(word ?iomLo)
(word ?iomHi)
(word ?dmaHi)
(= ?dmaLo ?iomHi)
(= (q@and ebx 4095) 0)
(<= ?dmaLo ebx)
(<= (+ (+ ebx 2097152) 4096) ?dmaHi)
(Aligned esi)
(<= ?iomLo esi)
(<= (+ esi 32768) ?iomHi)
(= (q@and (+ esi 0) 4095) 0)
(= (q@and (+ esi 4096) 4095) 0)
(= (q@and (+ esi 8192) 4095) 0)
(= (q@and (+ esi 12288) 4095) 0)
(not $IomFrozen)) anon0_correct@@4))))
PreconditionGeneratedEntry_correct@@4)))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+28006 () Bool)
(declare-fun $Efl@16 () Int)
(declare-fun call27818formal@$ptr@0 () Int)
(declare-fun edi@0@@0 () Int)
(declare-fun %lbl%@96836 () Bool)
(declare-fun %lbl%@96839 () Bool)
(declare-fun %lbl%@96842 () Bool)
(declare-fun call27427formal@$ret@0 () Int)
(declare-fun %lbl%@96845 () Bool)
(declare-fun $IomMem@5@@0 () (Array Int Int))
(declare-fun $IomMem@0@@0 () (Array Int Int))
(declare-fun call27823formal@$ptr@0 () Int)
(declare-fun %lbl%@96886 () Bool)
(declare-fun %lbl%@96889 () Bool)
(declare-fun %lbl%@96892 () Bool)
(declare-fun %lbl%@96895 () Bool)
(declare-fun $IomMem@6@@0 () (Array Int Int))
(declare-fun call27828formal@$ptr@0 () Int)
(declare-fun %lbl%@96936 () Bool)
(declare-fun %lbl%@96939 () Bool)
(declare-fun %lbl%@96942 () Bool)
(declare-fun %lbl%@96945 () Bool)
(declare-fun $IomMem@7@@0 () (Array Int Int))
(declare-fun call27833formal@$ptr@0 () Int)
(declare-fun %lbl%@96986 () Bool)
(declare-fun %lbl%@96989 () Bool)
(declare-fun %lbl%@96992 () Bool)
(declare-fun %lbl%@96995 () Bool)
(declare-fun $IomMem@8@@0 () (Array Int Int))
(declare-fun %lbl%@97022 () Bool)
(declare-fun call27854formal@$ptr@0 () Int)
(declare-fun %lbl%@97057 () Bool)
(declare-fun %lbl%@97060 () Bool)
(declare-fun %lbl%@97063 () Bool)
(declare-fun call27441formal@$ret@0 () Int)
(declare-fun %lbl%@97066 () Bool)
(declare-fun $IomMem@9@@0 () (Array Int Int))
(declare-fun call27859formal@$ptr@0 () Int)
(declare-fun %lbl%@97107 () Bool)
(declare-fun %lbl%@97110 () Bool)
(declare-fun %lbl%@97113 () Bool)
(declare-fun %lbl%@97116 () Bool)
(declare-fun $IomMem@10@@0 () (Array Int Int))
(declare-fun call27864formal@$ptr@0 () Int)
(declare-fun %lbl%@97157 () Bool)
(declare-fun %lbl%@97160 () Bool)
(declare-fun %lbl%@97163 () Bool)
(declare-fun %lbl%@97166 () Bool)
(declare-fun $IomMem@11 () (Array Int Int))
(declare-fun call27869formal@$ptr@0 () Int)
(declare-fun %lbl%@97207 () Bool)
(declare-fun %lbl%@97210 () Bool)
(declare-fun %lbl%@97213 () Bool)
(declare-fun %lbl%@97216 () Bool)
(declare-fun $IomMem@12 () (Array Int Int))
(declare-fun $entry@1@@0 () Int)
(declare-fun $entry@0@@0 () Int)
(declare-fun %lbl%@97259 () Bool)
(declare-fun call27879formal@$ret@0 () Int)
(declare-fun %lbl%@97290 () Bool)
(declare-fun %lbl%@97322 () Bool)
(declare-fun %lbl%@97338 () Bool)
(declare-fun %lbl%@97350 () Bool)
(declare-fun %lbl%@97355 () Bool)
(declare-fun %lbl%@97460 () Bool)
(declare-fun %lbl%@97538 () Bool)
(declare-fun %lbl%@97616 () Bool)
(declare-fun %lbl%@97759 () Bool)
(declare-fun %lbl%+92464 () Bool)
(declare-fun %lbl%@97913 () Bool)
(declare-fun $IomMem@13 () (Array Int Int))
(declare-fun %lbl%@97918 () Bool)
(declare-fun %lbl%@97939 () Bool)
(declare-fun %lbl%@97952 () Bool)
(declare-fun %lbl%@97973 () Bool)
(declare-fun %lbl%@97986 () Bool)
(declare-fun %lbl%@98091 () Bool)
(declare-fun %lbl%@98169 () Bool)
(declare-fun %lbl%@98247 () Bool)
(declare-fun %lbl%@98391 () Bool)
(declare-fun %lbl%@98535 () Bool)
(declare-fun %lbl%@98548 () Bool)
(declare-fun %lbl%+28004 () Bool)
(declare-fun %lbl%@96121 () Bool)
(declare-fun %lbl%@96125 () Bool)
(declare-fun call27901formal@$ret@0 () Int)
(declare-fun %lbl%@96168 () Bool)
(declare-fun call27905formal@$ret@0 () Int)
(declare-fun %lbl%@96201 () Bool)
(declare-fun call27909formal@$ret@0 () Int)
(declare-fun call27912formal@$ret@0 () Int)
(declare-fun call27917formal@$ptr@0 () Int)
(declare-fun %lbl%@96264 () Bool)
(declare-fun %lbl%@96267 () Bool)
(declare-fun %lbl%@96270 () Bool)
(declare-fun %lbl%@96273 () Bool)
(declare-fun $IomMem@1@@0 () (Array Int Int))
(declare-fun call27920formal@$ret@0 () Int)
(declare-fun %lbl%@96327 () Bool)
(declare-fun call27924formal@$ret@0 () Int)
(declare-fun %lbl%@96360 () Bool)
(declare-fun call27928formal@$ret@0 () Int)
(declare-fun call27931formal@$ret@0 () Int)
(declare-fun call27936formal@$ptr@0 () Int)
(declare-fun %lbl%@96423 () Bool)
(declare-fun %lbl%@96426 () Bool)
(declare-fun %lbl%@96429 () Bool)
(declare-fun %lbl%@96432 () Bool)
(declare-fun $IomMem@2@@0 () (Array Int Int))
(declare-fun call27939formal@$ret@0 () Int)
(declare-fun call27389formal@$ret@0 () Int)
(declare-fun call27943formal@$ret@0 () Int)
(declare-fun call27946formal@$ret@0 () Int)
(declare-fun %lbl%@96534 () Bool)
(declare-fun call27965formal@$ret@0 () Int)
(declare-fun %lbl%@96584 () Bool)
(declare-fun call27969formal@$ret@0 () Int)
(declare-fun call27972formal@$ret@0 () Int)
(declare-fun call27975formal@$ret@0 () Int)
(declare-fun %lbl%@96659 () Bool)
(declare-fun %lbl%@96662 () Bool)
(declare-fun %lbl%@96665 () Bool)
(declare-fun %lbl%@96668 () Bool)
(declare-fun $IomMem@3@@0 () (Array Int Int))
(declare-fun call27981formal@$ret@0 () Int)
(declare-fun %lbl%@96720 () Bool)
(declare-fun call27985formal@$ret@0 () Int)
(declare-fun call27988formal@$ret@0 () Int)
(declare-fun call27993formal@$ptr@0 () Int)
(declare-fun %lbl%@96782 () Bool)
(declare-fun %lbl%@96785 () Bool)
(declare-fun %lbl%@96788 () Bool)
(declare-fun %lbl%@96791 () Bool)
(declare-fun $IomMem@4@@0 () (Array Int Int))
(declare-fun %lbl%+28003 () Bool)
(declare-fun call27807formal@$x@0 () T@opn)
(declare-fun call27807formal@$y@0 () T@opn)
(declare-fun call27413formal@$ret@0 () Int)
(declare-fun %lbl%@96082 () Bool)
(declare-fun %lbl%@96087 () Bool)
(declare-fun %lbl%+27996 () Bool)
(declare-fun call27396formal@$ret@0 () Int)
(declare-fun %lbl%@94449 () Bool)
(declare-fun call27400formal@$ret@0 () Int)
(declare-fun call27403formal@$ret@0 () Int)
(declare-fun call27406formal@$ret@0 () Int)
(declare-fun %lbl%@94524 () Bool)
(declare-fun call27410formal@$ret@0 () Int)
(declare-fun call27416formal@$ret@0 () Int)
(declare-fun %lbl%@94600 () Bool)
(declare-fun call27420formal@$ret@0 () Int)
(declare-fun %lbl%@94633 () Bool)
(declare-fun call27424formal@$ret@0 () Int)
(declare-fun call27430formal@$ret@0 () Int)
(declare-fun %lbl%@94709 () Bool)
(declare-fun call27434formal@$ret@0 () Int)
(declare-fun %lbl%@94742 () Bool)
(declare-fun call27438formal@$ret@0 () Int)
(declare-fun %lbl%@94791 () Bool)
(declare-fun %lbl%@94823 () Bool)
(declare-fun %lbl%@94839 () Bool)
(declare-fun %lbl%@94851 () Bool)
(declare-fun %lbl%@94857 () Bool)
(declare-fun %lbl%@94965 () Bool)
(declare-fun %lbl%@95045 () Bool)
(declare-fun %lbl%@95125 () Bool)
(declare-fun %lbl%@95272 () Bool)
(declare-fun %lbl%+92468 () Bool)
(push 1)
(set-info :boogie-vc-id setupIoTablesHelper2)
(assert (not
(let ((anon3_Else_correct (=> (! (and %lbl%+28006 true) :lblpos +28006) (=> (and
(not (Jae $Efl@16))
(= call27818formal@$ptr@0 (+ edi@0@@0 0))) (and
(! (or %lbl%@96836 (iomAddr call27818formal@$ptr@0)) :lblneg @96836)
(=> (iomAddr call27818formal@$ptr@0) (and
(! (or %lbl%@96839 (Aligned call27818formal@$ptr@0)) :lblneg @96839)
(=> (Aligned call27818formal@$ptr@0) (and
(! (or %lbl%@96842 (word call27427formal@$ret@0)) :lblneg @96842)
(=> (word call27427formal@$ret@0) (and
(! (or %lbl%@96845 (not $IomFrozen)) :lblneg @96845)
(=> (not $IomFrozen) (=> (and
(= $IomMem@5@@0 (store $IomMem@0@@0 call27818formal@$ptr@0 call27427formal@$ret@0))
(= call27823formal@$ptr@0 (+ edi@0@@0 4))) (and
(! (or %lbl%@96886 (iomAddr call27823formal@$ptr@0)) :lblneg @96886)
(=> (iomAddr call27823formal@$ptr@0) (and
(! (or %lbl%@96889 (Aligned call27823formal@$ptr@0)) :lblneg @96889)
(=> (Aligned call27823formal@$ptr@0) (and
(! (or %lbl%@96892 (word 0)) :lblneg @96892)
(=> (word 0) (and
(! (or %lbl%@96895 (not $IomFrozen)) :lblneg @96895)
(=> (not $IomFrozen) (=> (and
(= $IomMem@6@@0 (store $IomMem@5@@0 call27823formal@$ptr@0 0))
(= call27828formal@$ptr@0 (+ edi@0@@0 8))) (and
(! (or %lbl%@96936 (iomAddr call27828formal@$ptr@0)) :lblneg @96936)
(=> (iomAddr call27828formal@$ptr@0) (and
(! (or %lbl%@96939 (Aligned call27828formal@$ptr@0)) :lblneg @96939)
(=> (Aligned call27828formal@$ptr@0) (and
(! (or %lbl%@96942 (word 258)) :lblneg @96942)
(=> (word 258) (and
(! (or %lbl%@96945 (not $IomFrozen)) :lblneg @96945)
(=> (not $IomFrozen) (=> (and
(= $IomMem@7@@0 (store $IomMem@6@@0 call27828formal@$ptr@0 258))
(= call27833formal@$ptr@0 (+ edi@0@@0 12))) (and
(! (or %lbl%@96986 (iomAddr call27833formal@$ptr@0)) :lblneg @96986)
(=> (iomAddr call27833formal@$ptr@0) (and
(! (or %lbl%@96989 (Aligned call27833formal@$ptr@0)) :lblneg @96989)
(=> (Aligned call27833formal@$ptr@0) (and
(! (or %lbl%@96992 (word 0)) :lblneg @96992)
(=> (word 0) (and
(! (or %lbl%@96995 (not $IomFrozen)) :lblneg @96995)
(=> (not $IomFrozen) (=> (= $IomMem@8@@0 (store $IomMem@7@@0 call27833formal@$ptr@0 0)) (and
(! (or %lbl%@97022 (and
(TO 1024)
(TO 1025)
(TO 1026)
(TO 1027))) :lblneg @97022)
(=> (and
(TO 1024)
(TO 1025)
(TO 1026)
(TO 1027)) (=> (= call27854formal@$ptr@0 (+ edi@0@@0 4096)) (and
(! (or %lbl%@97057 (iomAddr call27854formal@$ptr@0)) :lblneg @97057)
(=> (iomAddr call27854formal@$ptr@0) (and
(! (or %lbl%@97060 (Aligned call27854formal@$ptr@0)) :lblneg @97060)
(=> (Aligned call27854formal@$ptr@0) (and
(! (or %lbl%@97063 (word call27441formal@$ret@0)) :lblneg @97063)
(=> (word call27441formal@$ret@0) (and
(! (or %lbl%@97066 (not $IomFrozen)) :lblneg @97066)
(=> (not $IomFrozen) (=> (and
(= $IomMem@9@@0 (store $IomMem@8@@0 call27854formal@$ptr@0 call27441formal@$ret@0))
(= call27859formal@$ptr@0 (+ edi@0@@0 4100))) (and
(! (or %lbl%@97107 (iomAddr call27859formal@$ptr@0)) :lblneg @97107)
(=> (iomAddr call27859formal@$ptr@0) (and
(! (or %lbl%@97110 (Aligned call27859formal@$ptr@0)) :lblneg @97110)
(=> (Aligned call27859formal@$ptr@0) (and
(! (or %lbl%@97113 (word 0)) :lblneg @97113)
(=> (word 0) (and
(! (or %lbl%@97116 (not $IomFrozen)) :lblneg @97116)
(=> (not $IomFrozen) (=> (and
(= $IomMem@10@@0 (store $IomMem@9@@0 call27859formal@$ptr@0 0))
(= call27864formal@$ptr@0 (+ edi@0@@0 4104))) (and
(! (or %lbl%@97157 (iomAddr call27864formal@$ptr@0)) :lblneg @97157)
(=> (iomAddr call27864formal@$ptr@0) (and
(! (or %lbl%@97160 (Aligned call27864formal@$ptr@0)) :lblneg @97160)
(=> (Aligned call27864formal@$ptr@0) (and
(! (or %lbl%@97163 (word 0)) :lblneg @97163)
(=> (word 0) (and
(! (or %lbl%@97166 (not $IomFrozen)) :lblneg @97166)
(=> (not $IomFrozen) (=> (and
(= $IomMem@11 (store $IomMem@10@@0 call27864formal@$ptr@0 0))
(= call27869formal@$ptr@0 (+ edi@0@@0 4108))) (and
(! (or %lbl%@97207 (iomAddr call27869formal@$ptr@0)) :lblneg @97207)
(=> (iomAddr call27869formal@$ptr@0) (and
(! (or %lbl%@97210 (Aligned call27869formal@$ptr@0)) :lblneg @97210)
(=> (Aligned call27869formal@$ptr@0) (and
(! (or %lbl%@97213 (word 0)) :lblneg @97213)
(=> (word 0) (and
(! (or %lbl%@97216 (not $IomFrozen)) :lblneg @97216)
(=> (not $IomFrozen) (=> (and
(= $IomMem@12 (store $IomMem@11 call27869formal@$ptr@0 0))
(= $entry@1@@0 (+ $entry@0@@0 1))) (and
(! (or %lbl%@97259 (word (+ edi@0@@0 16))) :lblneg @97259)
(=> (word (+ edi@0@@0 16)) (=> (= call27879formal@$ret@0 (+ edi@0@@0 16)) (and
(! (or %lbl%@97290 (and
(Aligned call27879formal@$ret@0)
(TV call27879formal@$ret@0)
(TO 1)
(TO 2)
(TO 3)
(TO 4))) :lblneg @97290)
(=> (and
(Aligned call27879formal@$ret@0)
(TV call27879formal@$ret@0)
(TO 1)
(TO 2)
(TO 3)
(TO 4)) (and
(! (or %lbl%@97322 (= call27879formal@$ret@0 (+ (+ esi 16384) (* 16 $entry@1@@0)))) :lblneg @97322)
(=> (= call27879formal@$ret@0 (+ (+ esi 16384) (* 16 $entry@1@@0))) (and
(! (or %lbl%@97338 (and
(<= 0 $entry@1@@0)
(<= $entry@1@@0 256))) :lblneg @97338)
(=> (and
(<= 0 $entry@1@@0)
(<= $entry@1@@0 256)) (and
(! (or %lbl%@97350 (IoPageTable $IomMem@12 esi)) :lblneg @97350)
(=> (IoPageTable $IomMem@12 esi) (and
(! (or %lbl%@97355 (forall ((i@@68 Int) ) (! (=> (and
(TV i@@68)
(<= 0 i@@68)
(< i@@68 512)) (and
(or
(= (select $IomMem@12 (+ (+ esi 4096) (* 8 i@@68))) 0)
(= (select $IomMem@12 (+ (+ esi 4096) (* 8 i@@68))) (+ esi 3)))
(= (select $IomMem@12 (+ (+ (+ esi 4096) (* 8 i@@68)) 4)) 0)))
 :qid |EntryMSb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@68))
))) :lblneg @97355)
(=> (forall ((i@@69 Int) ) (! (=> (and
(TV i@@69)
(<= 0 i@@69)
(< i@@69 512)) (and
(or
(= (select $IomMem@12 (+ (+ esi 4096) (* 8 i@@69))) 0)
(= (select $IomMem@12 (+ (+ esi 4096) (* 8 i@@69))) (+ esi 3)))
(= (select $IomMem@12 (+ (+ (+ esi 4096) (* 8 i@@69)) 4)) 0)))
 :qid |EntryMSb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@69))
)) (and
(! (or %lbl%@97460 (forall ((i@@70 Int) ) (! (=> (and
(TV i@@70)
(<= 0 i@@70)
(< i@@70 512)) (and
(= (select $IomMem@12 (+ (+ esi 8192) (* 8 i@@70))) 0)
(= (select $IomMem@12 (+ (+ (+ esi 8192) (* 8 i@@70)) 4)) 0)))
 :qid |EntryMSb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@70))
))) :lblneg @97460)
(=> (forall ((i@@71 Int) ) (! (=> (and
(TV i@@71)
(<= 0 i@@71)
(< i@@71 512)) (and
(= (select $IomMem@12 (+ (+ esi 8192) (* 8 i@@71))) 0)
(= (select $IomMem@12 (+ (+ (+ esi 8192) (* 8 i@@71)) 4)) 0)))
 :qid |EntryMSb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@71))
)) (and
(! (or %lbl%@97538 (forall ((i@@72 Int) ) (! (=> (and
(TV i@@72)
(<= 0 i@@72)
(< i@@72 512)) (and
(= (select $IomMem@12 (+ (+ esi 12288) (* 8 i@@72))) 0)
(= (select $IomMem@12 (+ (+ (+ esi 12288) (* 8 i@@72)) 4)) 0)))
 :qid |EntryMSb.178:18|
 :skolemid |265|
 :pattern ( (TV i@@72))
))) :lblneg @97538)
(=> (forall ((i@@73 Int) ) (! (=> (and
(TV i@@73)
(<= 0 i@@73)
(< i@@73 512)) (and
(= (select $IomMem@12 (+ (+ esi 12288) (* 8 i@@73))) 0)
(= (select $IomMem@12 (+ (+ (+ esi 12288) (* 8 i@@73)) 4)) 0)))
 :qid |EntryMSb.178:18|
 :skolemid |265|
 :pattern ( (TV i@@73))
)) (and
(! (or %lbl%@97616 (forall ((i@@74 Int) ) (! (=> (and
(TV i@@74)
(<= 0 i@@74)
(< i@@74 $entry@1@@0)) (and
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@74)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@74)) 4)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@74)) 8)) 258)
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@74)) 12)) 0)))
 :qid |EntryMSb.181:18|
 :skolemid |266|
 :pattern ( (TV i@@74))
))) :lblneg @97616)
(=> (forall ((i@@75 Int) ) (! (=> (and
(TV i@@75)
(<= 0 i@@75)
(< i@@75 $entry@1@@0)) (and
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@75)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@75)) 4)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@75)) 8)) 258)
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@75)) 12)) 0)))
 :qid |EntryMSb.181:18|
 :skolemid |266|
 :pattern ( (TV i@@75))
)) (and
(! (or %lbl%@97759 (forall ((i@@76 Int) ) (! (=> (and
(TV i@@76)
(<= 0 i@@76)
(< i@@76 $entry@1@@0)) (and
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@76)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@76)) 4)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@76)) 8)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@76)) 12)) 0)))
 :qid |EntryMSb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@76))
))) :lblneg @97759)
(=> (forall ((i@@77 Int) ) (! (=> (and
(TV i@@77)
(<= 0 i@@77)
(< i@@77 $entry@1@@0)) (and
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@77)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@77)) 4)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@77)) 8)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@77)) 12)) 0)))
 :qid |EntryMSb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@77))
)) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((GeneratedUnifiedExit_correct@@1 (=> (! (and %lbl%+92464 true) :lblpos +92464) (and
(! (or %lbl%@97913 (IoPageTable $IomMem@13 esi)) :lblneg @97913)
(=> (IoPageTable $IomMem@13 esi) (and
(! (or %lbl%@97918 (= (select $IomMem@13 (+ esi 8192)) (+ (+ esi 4096) 3))) :lblneg @97918)
(=> (= (select $IomMem@13 (+ esi 8192)) (+ (+ esi 4096) 3)) (and
(! (or %lbl%@97939 (= (select $IomMem@13 (+ esi 8196)) 0)) :lblneg @97939)
(=> (= (select $IomMem@13 (+ esi 8196)) 0) (and
(! (or %lbl%@97952 (= (select $IomMem@13 (+ esi 12288)) (+ (+ esi 8192) 3))) :lblneg @97952)
(=> (= (select $IomMem@13 (+ esi 12288)) (+ (+ esi 8192) 3)) (and
(! (or %lbl%@97973 (= (select $IomMem@13 (+ esi 12292)) 0)) :lblneg @97973)
(=> (= (select $IomMem@13 (+ esi 12292)) 0) (and
(! (or %lbl%@97986 (forall ((i@@78 Int) ) (! (=> (and
(TV i@@78)
(<= 0 i@@78)
(< i@@78 512)) (and
(or
(= (select $IomMem@13 (+ (+ esi 4096) (* 8 i@@78))) 0)
(= (select $IomMem@13 (+ (+ esi 4096) (* 8 i@@78))) (+ esi 3)))
(= (select $IomMem@13 (+ (+ (+ esi 4096) (* 8 i@@78)) 4)) 0)))
 :qid |EntryMSb.138:17|
 :skolemid |258|
 :pattern ( (TV i@@78))
))) :lblneg @97986)
(=> (forall ((i@@79 Int) ) (! (=> (and
(TV i@@79)
(<= 0 i@@79)
(< i@@79 512)) (and
(or
(= (select $IomMem@13 (+ (+ esi 4096) (* 8 i@@79))) 0)
(= (select $IomMem@13 (+ (+ esi 4096) (* 8 i@@79))) (+ esi 3)))
(= (select $IomMem@13 (+ (+ (+ esi 4096) (* 8 i@@79)) 4)) 0)))
 :qid |EntryMSb.138:17|
 :skolemid |258|
 :pattern ( (TV i@@79))
)) (and
(! (or %lbl%@98091 (forall ((i@@80 Int) ) (! (=> (and
(TV i@@80)
(<= 1 i@@80)
(< i@@80 512)) (and
(= (select $IomMem@13 (+ (+ esi 8192) (* 8 i@@80))) 0)
(= (select $IomMem@13 (+ (+ (+ esi 8192) (* 8 i@@80)) 4)) 0)))
 :qid |EntryMSb.141:17|
 :skolemid |259|
 :pattern ( (TV i@@80))
))) :lblneg @98091)
(=> (forall ((i@@81 Int) ) (! (=> (and
(TV i@@81)
(<= 1 i@@81)
(< i@@81 512)) (and
(= (select $IomMem@13 (+ (+ esi 8192) (* 8 i@@81))) 0)
(= (select $IomMem@13 (+ (+ (+ esi 8192) (* 8 i@@81)) 4)) 0)))
 :qid |EntryMSb.141:17|
 :skolemid |259|
 :pattern ( (TV i@@81))
)) (and
(! (or %lbl%@98169 (forall ((i@@82 Int) ) (! (=> (and
(TV i@@82)
(<= 1 i@@82)
(< i@@82 512)) (and
(= (select $IomMem@13 (+ (+ esi 12288) (* 8 i@@82))) 0)
(= (select $IomMem@13 (+ (+ (+ esi 12288) (* 8 i@@82)) 4)) 0)))
 :qid |EntryMSb.144:17|
 :skolemid |260|
 :pattern ( (TV i@@82))
))) :lblneg @98169)
(=> (forall ((i@@83 Int) ) (! (=> (and
(TV i@@83)
(<= 1 i@@83)
(< i@@83 512)) (and
(= (select $IomMem@13 (+ (+ esi 12288) (* 8 i@@83))) 0)
(= (select $IomMem@13 (+ (+ (+ esi 12288) (* 8 i@@83)) 4)) 0)))
 :qid |EntryMSb.144:17|
 :skolemid |260|
 :pattern ( (TV i@@83))
)) (and
(! (or %lbl%@98247 (forall ((i@@84 Int) ) (! (=> (and
(TV i@@84)
(<= 0 i@@84)
(< i@@84 256)) (and
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@84)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@84)) 4)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@84)) 8)) 258)
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@84)) 12)) 0)))
 :qid |EntryMSb.147:17|
 :skolemid |261|
 :pattern ( (TV i@@84))
))) :lblneg @98247)
(=> (forall ((i@@85 Int) ) (! (=> (and
(TV i@@85)
(<= 0 i@@85)
(< i@@85 256)) (and
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@85)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@85)) 4)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@85)) 8)) 258)
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@85)) 12)) 0)))
 :qid |EntryMSb.147:17|
 :skolemid |261|
 :pattern ( (TV i@@85))
)) (and
(! (or %lbl%@98391 (forall ((i@@86 Int) ) (! (=> (and
(TV i@@86)
(<= 0 i@@86)
(< i@@86 256)) (and
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@86)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@86)) 4)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@86)) 8)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@86)) 12)) 0)))
 :qid |EntryMSb.152:17|
 :skolemid |262|
 :pattern ( (TV i@@86))
))) :lblneg @98391)
(=> (forall ((i@@87 Int) ) (! (=> (and
(TV i@@87)
(<= 0 i@@87)
(< i@@87 256)) (and
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@87)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@87)) 4)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@87)) 8)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@87)) 12)) 0)))
 :qid |EntryMSb.152:17|
 :skolemid |262|
 :pattern ( (TV i@@87))
)) (and
(! (or %lbl%@98535 (= (select $IomMem@13 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)) :lblneg @98535)
(=> (= (select $IomMem@13 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE) (and
(! (or %lbl%@98548 (= (select $IomMem@13 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) :lblneg @98548)
(=> (= (select $IomMem@13 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo)) true)))))))))))))))))))))))))))
(let ((anon3_Then_correct (=> (! (and %lbl%+28004 true) :lblpos +28004) (=> (Jae $Efl@16) (and
(! (or %lbl%@96121 (TV esi)) :lblneg @96121)
(=> (TV esi) (and
(! (or %lbl%@96125 (and
(TV 0)
(TO 2048)
(TO 3072))) :lblneg @96125)
(=> (and
(TV 0)
(TO 2048)
(TO 3072)) (=> (= call27901formal@$ret@0 esi) (and
(! (or %lbl%@96168 (word (+ call27901formal@$ret@0 4096))) :lblneg @96168)
(=> (word (+ call27901formal@$ret@0 4096)) (=> (= call27905formal@$ret@0 (+ call27901formal@$ret@0 4096)) (and
(! (or %lbl%@96201 (word (+ call27905formal@$ret@0 3))) :lblneg @96201)
(=> (word (+ call27905formal@$ret@0 3)) (=> (= call27909formal@$ret@0 (+ call27905formal@$ret@0 3)) (=> (and
(= call27912formal@$ret@0 call27909formal@$ret@0)
(= call27917formal@$ptr@0 (+ esi 8192))) (and
(! (or %lbl%@96264 (iomAddr call27917formal@$ptr@0)) :lblneg @96264)
(=> (iomAddr call27917formal@$ptr@0) (and
(! (or %lbl%@96267 (Aligned call27917formal@$ptr@0)) :lblneg @96267)
(=> (Aligned call27917formal@$ptr@0) (and
(! (or %lbl%@96270 (word call27912formal@$ret@0)) :lblneg @96270)
(=> (word call27912formal@$ret@0) (and
(! (or %lbl%@96273 (not $IomFrozen)) :lblneg @96273)
(=> (not $IomFrozen) (=> (and
(= $IomMem@1@@0 (store $IomMem@0@@0 call27917formal@$ptr@0 call27912formal@$ret@0))
(= call27920formal@$ret@0 esi)) (and
(! (or %lbl%@96327 (word (+ call27920formal@$ret@0 8192))) :lblneg @96327)
(=> (word (+ call27920formal@$ret@0 8192)) (=> (= call27924formal@$ret@0 (+ call27920formal@$ret@0 8192)) (and
(! (or %lbl%@96360 (word (+ call27924formal@$ret@0 3))) :lblneg @96360)
(=> (word (+ call27924formal@$ret@0 3)) (=> (= call27928formal@$ret@0 (+ call27924formal@$ret@0 3)) (=> (and
(= call27931formal@$ret@0 call27928formal@$ret@0)
(= call27936formal@$ptr@0 (+ esi 12288))) (and
(! (or %lbl%@96423 (iomAddr call27936formal@$ptr@0)) :lblneg @96423)
(=> (iomAddr call27936formal@$ptr@0) (and
(! (or %lbl%@96426 (Aligned call27936formal@$ptr@0)) :lblneg @96426)
(=> (Aligned call27936formal@$ptr@0) (and
(! (or %lbl%@96429 (word call27931formal@$ret@0)) :lblneg @96429)
(=> (word call27931formal@$ret@0) (and
(! (or %lbl%@96432 (not $IomFrozen)) :lblneg @96432)
(=> (not $IomFrozen) (=> (= $IomMem@2@@0 (store $IomMem@1@@0 call27936formal@$ptr@0 call27931formal@$ret@0)) (=> (and
(= call27939formal@$ret@0 call27389formal@$ret@0)
(word (+ call27939formal@$ret@0 18874368))
(= call27943formal@$ret@0 (+ call27939formal@$ret@0 18874368))
(= call27946formal@$ret@0 call27943formal@$ret@0)) (and
(! (or %lbl%@96534 (and
(TV ?dmaLo)
(TO (- 0 1))
(TO (- 0 2)))) :lblneg @96534)
(=> (and
(TV ?dmaLo)
(TO (- 0 1))
(TO (- 0 2))) (=> (= call27965formal@$ret@0 call27389formal@$ret@0) (and
(! (or %lbl%@96584 (word (- call27965formal@$ret@0 8))) :lblneg @96584)
(=> (word (- call27965formal@$ret@0 8)) (=> (= call27969formal@$ret@0 (- call27965formal@$ret@0 8)) (=> (and
(= call27972formal@$ret@0 call27969formal@$ret@0)
(= call27975formal@$ret@0 ?BYTE_VECTOR_VTABLE)) (and
(! (or %lbl%@96659 (iomAddr call27972formal@$ret@0)) :lblneg @96659)
(=> (iomAddr call27972formal@$ret@0) (and
(! (or %lbl%@96662 (Aligned call27972formal@$ret@0)) :lblneg @96662)
(=> (Aligned call27972formal@$ret@0) (and
(! (or %lbl%@96665 (word call27975formal@$ret@0)) :lblneg @96665)
(=> (word call27975formal@$ret@0) (and
(! (or %lbl%@96668 (not $IomFrozen)) :lblneg @96668)
(=> (not $IomFrozen) (=> (and
(= $IomMem@3@@0 (store $IomMem@2@@0 call27972formal@$ret@0 call27975formal@$ret@0))
(= call27981formal@$ret@0 call27946formal@$ret@0)) (and
(! (or %lbl%@96720 (word (- call27981formal@$ret@0 call27389formal@$ret@0))) :lblneg @96720)
(=> (word (- call27981formal@$ret@0 call27389formal@$ret@0)) (=> (= call27985formal@$ret@0 (- call27981formal@$ret@0 call27389formal@$ret@0)) (=> (and
(= call27988formal@$ret@0 call27985formal@$ret@0)
(= call27993formal@$ptr@0 (+ call27972formal@$ret@0 4))) (and
(! (or %lbl%@96782 (iomAddr call27993formal@$ptr@0)) :lblneg @96782)
(=> (iomAddr call27993formal@$ptr@0) (and
(! (or %lbl%@96785 (Aligned call27993formal@$ptr@0)) :lblneg @96785)
(=> (Aligned call27993formal@$ptr@0) (and
(! (or %lbl%@96788 (word call27988formal@$ret@0)) :lblneg @96788)
(=> (word call27988formal@$ret@0) (and
(! (or %lbl%@96791 (not $IomFrozen)) :lblneg @96791)
(=> (not $IomFrozen) (=> (and
(= $IomMem@4@@0 (store $IomMem@3@@0 call27993formal@$ptr@0 call27988formal@$ret@0))
(= $IomMem@13 $IomMem@4@@0)) GeneratedUnifiedExit_correct@@1)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((__L4_correct (=> (! (and %lbl%+28003 true) :lblpos +28003) (=> (and
(not $IomFrozen)
(<= 0 $entry@0@@0)
(< $entry@0@@0 258)) (=> (and
(Aligned edi@0@@0)
(TV edi@0@@0)
(TO 1)
(TO 2)
(TO 3)
(TO 4)
(= edi@0@@0 (+ (+ esi 16384) (* 16 $entry@0@@0)))
(<= 0 $entry@0@@0)
(<= $entry@0@@0 256)
(IoPageTable $IomMem@0@@0 esi)
(forall ((i@@88 Int) ) (! (=> (and
(TV i@@88)
(<= 0 i@@88)
(< i@@88 512)) (and
(or
(= (select $IomMem@0@@0 (+ (+ esi 4096) (* 8 i@@88))) 0)
(= (select $IomMem@0@@0 (+ (+ esi 4096) (* 8 i@@88))) (+ esi 3)))
(= (select $IomMem@0@@0 (+ (+ (+ esi 4096) (* 8 i@@88)) 4)) 0)))
 :qid |EntryMSb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@88))
))
(forall ((i@@89 Int) ) (! (=> (and
(TV i@@89)
(<= 0 i@@89)
(< i@@89 512)) (and
(= (select $IomMem@0@@0 (+ (+ esi 8192) (* 8 i@@89))) 0)
(= (select $IomMem@0@@0 (+ (+ (+ esi 8192) (* 8 i@@89)) 4)) 0)))
 :qid |EntryMSb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@89))
))
(forall ((i@@90 Int) ) (! (=> (and
(TV i@@90)
(<= 0 i@@90)
(< i@@90 512)) (and
(= (select $IomMem@0@@0 (+ (+ esi 12288) (* 8 i@@90))) 0)
(= (select $IomMem@0@@0 (+ (+ (+ esi 12288) (* 8 i@@90)) 4)) 0)))
 :qid |EntryMSb.178:18|
 :skolemid |265|
 :pattern ( (TV i@@90))
))
(forall ((i@@91 Int) ) (! (=> (and
(TV i@@91)
(<= 0 i@@91)
(< i@@91 $entry@0@@0)) (and
(= (select $IomMem@0@@0 (+ (+ (+ esi 16384) (* 16 i@@91)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@0@@0 (+ (+ (+ esi 16384) (* 16 i@@91)) 4)) 0)
(= (select $IomMem@0@@0 (+ (+ (+ esi 16384) (* 16 i@@91)) 8)) 258)
(= (select $IomMem@0@@0 (+ (+ (+ esi 16384) (* 16 i@@91)) 12)) 0)))
 :qid |EntryMSb.181:18|
 :skolemid |266|
 :pattern ( (TV i@@91))
))
(forall ((i@@92 Int) ) (! (=> (and
(TV i@@92)
(<= 0 i@@92)
(< i@@92 $entry@0@@0)) (and
(= (select $IomMem@0@@0 (+ (+ (+ esi 20480) (* 16 i@@92)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@0@@0 (+ (+ (+ esi 20480) (* 16 i@@92)) 4)) 0)
(= (select $IomMem@0@@0 (+ (+ (+ esi 20480) (* 16 i@@92)) 8)) 0)
(= (select $IomMem@0@@0 (+ (+ (+ esi 20480) (* 16 i@@92)) 12)) 0)))
 :qid |EntryMSb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@92))
))
(= call27807formal@$x@0 (OpnReg edi@0@@0))
(= call27807formal@$y@0 (OpnReg call27413formal@$ret@0))) (and
(! (or %lbl%@96082 (OpnOk $Mem@@3 call27807formal@$x@0)) :lblneg @96082)
(=> (OpnOk $Mem@@3 call27807formal@$x@0) (and
(! (or %lbl%@96087 (OpnOk $Mem@@3 call27807formal@$y@0)) :lblneg @96087)
(=> (OpnOk $Mem@@3 call27807formal@$y@0) (=> (FlagsCmp $Efl@16 (EvalOpn $Mem@@3 call27807formal@$x@0) (EvalOpn $Mem@@3 call27807formal@$y@0)) (and
anon3_Then_correct
anon3_Else_correct)))))))))))
(let ((anon0_correct@@5 (=> (! (and %lbl%+27996 true) :lblpos +27996) (=> (and
(= call27389formal@$ret@0 ecx)
(= call27396formal@$ret@0 esi)) (and
(! (or %lbl%@94449 (word (+ call27396formal@$ret@0 16384))) :lblneg @94449)
(=> (word (+ call27396formal@$ret@0 16384)) (=> (= call27400formal@$ret@0 (+ call27396formal@$ret@0 16384)) (=> (and
(= call27403formal@$ret@0 call27400formal@$ret@0)
(= call27406formal@$ret@0 call27403formal@$ret@0)) (and
(! (or %lbl%@94524 (word (+ call27406formal@$ret@0 4096))) :lblneg @94524)
(=> (word (+ call27406formal@$ret@0 4096)) (=> (= call27410formal@$ret@0 (+ call27406formal@$ret@0 4096)) (=> (and
(= call27413formal@$ret@0 call27410formal@$ret@0)
(= call27416formal@$ret@0 esi)) (and
(! (or %lbl%@94600 (word (+ call27416formal@$ret@0 12288))) :lblneg @94600)
(=> (word (+ call27416formal@$ret@0 12288)) (=> (= call27420formal@$ret@0 (+ call27416formal@$ret@0 12288)) (and
(! (or %lbl%@94633 (word (+ call27420formal@$ret@0 3))) :lblneg @94633)
(=> (word (+ call27420formal@$ret@0 3)) (=> (= call27424formal@$ret@0 (+ call27420formal@$ret@0 3)) (=> (and
(= call27427formal@$ret@0 call27424formal@$ret@0)
(= call27430formal@$ret@0 esi)) (and
(! (or %lbl%@94709 (word (+ call27430formal@$ret@0 16384))) :lblneg @94709)
(=> (word (+ call27430formal@$ret@0 16384)) (=> (= call27434formal@$ret@0 (+ call27430formal@$ret@0 16384)) (and
(! (or %lbl%@94742 (word (+ call27434formal@$ret@0 1))) :lblneg @94742)
(=> (word (+ call27434formal@$ret@0 1)) (=> (and
(= call27438formal@$ret@0 (+ call27434formal@$ret@0 1))
(= call27441formal@$ret@0 call27438formal@$ret@0)) (and
(! (or %lbl%@94791 (and
(Aligned call27403formal@$ret@0)
(TV call27403formal@$ret@0)
(TO 1)
(TO 2)
(TO 3)
(TO 4))) :lblneg @94791)
(=> (and
(Aligned call27403formal@$ret@0)
(TV call27403formal@$ret@0)
(TO 1)
(TO 2)
(TO 3)
(TO 4)) (and
(! (or %lbl%@94823 (= call27403formal@$ret@0 (+ (+ esi 16384) (* 16 0)))) :lblneg @94823)
(=> (= call27403formal@$ret@0 (+ (+ esi 16384) (* 16 0))) (and
(! (or %lbl%@94839 (and
(<= 0 0)
(<= 0 256))) :lblneg @94839)
(=> (and
(<= 0 0)
(<= 0 256)) (and
(! (or %lbl%@94851 (IoPageTable $IomMem@@7 esi)) :lblneg @94851)
(=> (IoPageTable $IomMem@@7 esi) (and
(! (or %lbl%@94857 (forall ((i@@93 Int) ) (! (=> (and
(TV i@@93)
(<= 0 i@@93)
(< i@@93 512)) (and
(or
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@93))) 0)
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@93))) (+ esi 3)))
(= (select $IomMem@@7 (+ (+ (+ esi 4096) (* 8 i@@93)) 4)) 0)))
 :qid |EntryMSb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@93))
))) :lblneg @94857)
(=> (forall ((i@@94 Int) ) (! (=> (and
(TV i@@94)
(<= 0 i@@94)
(< i@@94 512)) (and
(or
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@94))) 0)
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@94))) (+ esi 3)))
(= (select $IomMem@@7 (+ (+ (+ esi 4096) (* 8 i@@94)) 4)) 0)))
 :qid |EntryMSb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@94))
)) (and
(! (or %lbl%@94965 (forall ((i@@95 Int) ) (! (=> (and
(TV i@@95)
(<= 0 i@@95)
(< i@@95 512)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@95))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@95)) 4)) 0)))
 :qid |EntryMSb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@95))
))) :lblneg @94965)
(=> (forall ((i@@96 Int) ) (! (=> (and
(TV i@@96)
(<= 0 i@@96)
(< i@@96 512)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@96))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@96)) 4)) 0)))
 :qid |EntryMSb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@96))
)) (and
(! (or %lbl%@95045 (forall ((i@@97 Int) ) (! (=> (and
(TV i@@97)
(<= 0 i@@97)
(< i@@97 512)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@97))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@97)) 4)) 0)))
 :qid |EntryMSb.178:18|
 :skolemid |265|
 :pattern ( (TV i@@97))
))) :lblneg @95045)
(=> (forall ((i@@98 Int) ) (! (=> (and
(TV i@@98)
(<= 0 i@@98)
(< i@@98 512)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@98))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@98)) 4)) 0)))
 :qid |EntryMSb.178:18|
 :skolemid |265|
 :pattern ( (TV i@@98))
)) (and
(! (or %lbl%@95125 (forall ((i@@99 Int) ) (! (=> (and
(TV i@@99)
(<= 0 i@@99)
(< i@@99 0)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@99)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@99)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@99)) 8)) 258)
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@99)) 12)) 0)))
 :qid |EntryMSb.181:18|
 :skolemid |266|
 :pattern ( (TV i@@99))
))) :lblneg @95125)
(=> (forall ((i@@100 Int) ) (! (=> (and
(TV i@@100)
(<= 0 i@@100)
(< i@@100 0)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@100)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@100)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@100)) 8)) 258)
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@100)) 12)) 0)))
 :qid |EntryMSb.181:18|
 :skolemid |266|
 :pattern ( (TV i@@100))
)) (and
(! (or %lbl%@95272 (forall ((i@@101 Int) ) (! (=> (and
(TV i@@101)
(<= 0 i@@101)
(< i@@101 0)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@101)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@101)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@101)) 8)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@101)) 12)) 0)))
 :qid |EntryMSb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@101))
))) :lblneg @95272)
(=> (forall ((i@@102 Int) ) (! (=> (and
(TV i@@102)
(<= 0 i@@102)
(< i@@102 0)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@102)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@102)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@102)) 8)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@102)) 12)) 0)))
 :qid |EntryMSb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@102))
)) __L4_correct)))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@5 (=> (! (and %lbl%+92468 true) :lblpos +92468) (=> (and
(word ?iomLo)
(word ?iomHi)
(Aligned ?dmaLo)) (=> (and
(= ?dmaLo ?iomHi)
(= ecx ?dmaLo)
(IoPageTable $IomMem@@7 esi)
(forall ((i@@103 Int) ) (! (=> (and
(TV i@@103)
(<= 0 i@@103)
(< i@@103 512)) (and
(or
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@103))) 0)
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@103))) (+ esi 3)))
(= (select $IomMem@@7 (+ (+ (+ esi 4096) (* 8 i@@103)) 4)) 0)))
 :qid |EntryMSb.113:18|
 :skolemid |255|
 :pattern ( (TV i@@103))
))
(forall ((i@@104 Int) ) (! (=> (and
(TV i@@104)
(<= 0 i@@104)
(< i@@104 512)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@104))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@104)) 4)) 0)))
 :qid |EntryMSb.116:18|
 :skolemid |256|
 :pattern ( (TV i@@104))
))
(forall ((i@@105 Int) ) (! (=> (and
(TV i@@105)
(<= 0 i@@105)
(< i@@105 512)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@105))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@105)) 4)) 0)))
 :qid |EntryMSb.119:18|
 :skolemid |257|
 :pattern ( (TV i@@105))
))
(Aligned esi)
(Aligned (+ esi 16384))
(<= ?iomLo esi)
(<= (+ esi 32768) ?iomHi)
(= (q@and (+ esi 4096) 4095) 0)
(= (q@and (+ esi 8192) 4095) 0)
(= (q@and (+ esi 12288) 4095) 0)
(= (q@and (+ esi 16384) 4095) 0)
(= (q@and (+ esi 20480) 4095) 0)
(not $IomFrozen)) anon0_correct@@5)))))
PreconditionGeneratedEntry_correct@@5))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+28116 () Bool)
(declare-fun %lbl%@98923 () Bool)
(declare-fun %lbl%+98567 () Bool)
(push 1)
(set-info :boogie-vc-id setupIoTablesHelper3)
(assert (not
(let ((anon0_correct@@6 (=> (! (and %lbl%+28116 true) :lblpos +28116) (and
(! (or %lbl%@98923 (IoRootTable $IomMem@@7 (+ esi 20480))) :lblneg @98923)
(=> (IoRootTable $IomMem@@7 (+ esi 20480)) true)))))
(let ((PreconditionGeneratedEntry_correct@@6 (=> (! (and %lbl%+98567 true) :lblpos +98567) (=> (= (q@and (+ esi 20480) 4095) 0) (=> (and
(IoContextTable $IomMem@@7 (+ esi 16384))
(forall ((i@@106 Int) ) (! (=> (and
(TV i@@106)
(<= 0 i@@106)
(< i@@106 256)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@106)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@106)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@106)) 8)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@106)) 12)) 0)))
 :qid |EntryMSb.227:18|
 :skolemid |268|
 :pattern ( (TV i@@106))
))) anon0_correct@@6)))))
PreconditionGeneratedEntry_correct@@6))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+28421 () Bool)
(declare-fun %lbl%@99462 () Bool)
(declare-fun %lbl%@99624 () Bool)
(declare-fun call28238formal@$ret@0 () Int)
(declare-fun call28241formal@$ret@0 () Int)
(declare-fun %lbl%@99681 () Bool)
(declare-fun call28245formal@$ret@0 () Int)
(declare-fun call28254formal@$ptr@0 () Int)
(declare-fun %lbl%@99724 () Bool)
(declare-fun %lbl%@99754 () Bool)
(declare-fun $sMem@0 () (Array Int Int))
(declare-fun call28259formal@$ptr@0 () Int)
(declare-fun %lbl%@99817 () Bool)
(declare-fun %lbl%@99820 () Bool)
(declare-fun $Mem@0 () (Array Int Int))
(declare-fun %lbl%@99853 () Bool)
(declare-fun call28263formal@$ret@0 () Int)
(declare-fun call28266formal@$ret@0 () Int)
(declare-fun %lbl%@99907 () Bool)
(declare-fun call28270formal@$ret@0 () Int)
(declare-fun call28273formal@$ret@0 () Int)
(declare-fun %lbl%@99958 () Bool)
(declare-fun call28284formal@$x@0 () Int)
(declare-fun %lbl%@100024 () Bool)
(declare-fun %lbl%@100033 () Bool)
(declare-fun call28293formal@$x@0 () Int)
(declare-fun %lbl%@100079 () Bool)
(declare-fun %lbl%@100088 () Bool)
(declare-fun call28302formal@$x@0 () Int)
(declare-fun %lbl%@100134 () Bool)
(declare-fun %lbl%@100143 () Bool)
(declare-fun call28311formal@$x@0 () Int)
(declare-fun %lbl%@100189 () Bool)
(declare-fun %lbl%@100198 () Bool)
(declare-fun call28320formal@$x@0 () Int)
(declare-fun %lbl%@100244 () Bool)
(declare-fun %lbl%@100253 () Bool)
(declare-fun call28329formal@$x@0 () Int)
(declare-fun %lbl%@100299 () Bool)
(declare-fun %lbl%@100308 () Bool)
(declare-fun call28333formal@$ret@0 () Int)
(declare-fun %lbl%@100370 () Bool)
(declare-fun call28337formal@$ret@0 () Int)
(declare-fun %lbl%@100398 () Bool)
(declare-fun call28345formal@$ptr@0 () Int)
(declare-fun %lbl%@100412 () Bool)
(declare-fun %lbl%@100440 () Bool)
(declare-fun call28350formal@$ptr@0 () Int)
(declare-fun %lbl%@100464 () Bool)
(declare-fun call28350formal@$val@0 () Int)
(declare-fun %lbl%@100497 () Bool)
(declare-fun call28354formal@$ret@0 () Int)
(declare-fun call28357formal@$ret@0 () Int)
(declare-fun call28360formal@$ret@0 () Int)
(declare-fun %lbl%@100572 () Bool)
(declare-fun call28364formal@$ret@0 () Int)
(declare-fun call28367formal@$ret@0 () Int)
(declare-fun %lbl%@100623 () Bool)
(declare-fun call28373formal@$ret@0 () Int)
(declare-fun %lbl%@100718 () Bool)
(declare-fun call28377formal@$ret@0 () Int)
(declare-fun %lbl%@100746 () Bool)
(declare-fun %lbl%@100762 () Bool)
(declare-fun %lbl%@100768 () Bool)
(declare-fun %lbl%@100777 () Bool)
(declare-fun %lbl%@100797 () Bool)
(declare-fun %lbl%@100800 () Bool)
(declare-fun %lbl%@100816 () Bool)
(declare-fun %lbl%@100829 () Bool)
(declare-fun %lbl%@100842 () Bool)
(declare-fun %lbl%@100855 () Bool)
(declare-fun %lbl%@100868 () Bool)
(declare-fun $IomMem@0@@1 () (Array Int Int))
(declare-fun call28382formal@$ptr@0 () Int)
(declare-fun %lbl%@101189 () Bool)
(declare-fun %lbl%@101217 () Bool)
(declare-fun call28387formal@$ptr@0 () Int)
(declare-fun %lbl%@101241 () Bool)
(declare-fun call28387formal@$val@0 () Int)
(declare-fun %lbl%@101269 () Bool)
(declare-fun %lbl%@101279 () Bool)
(declare-fun %lbl%@101283 () Bool)
(declare-fun %lbl%@101289 () Bool)
(declare-fun %lbl%@101294 () Bool)
(declare-fun %lbl%@101298 () Bool)
(declare-fun %lbl%@101399 () Bool)
(declare-fun %lbl%@101475 () Bool)
(declare-fun %lbl%@101551 () Bool)
(declare-fun %lbl%@101554 () Bool)
(declare-fun %lbl%@101561 () Bool)
(declare-fun %lbl%@101577 () Bool)
(declare-fun %lbl%@101590 () Bool)
(declare-fun %lbl%@101603 () Bool)
(declare-fun %lbl%@101616 () Bool)
(declare-fun %lbl%@101629 () Bool)
(declare-fun %lbl%@101642 () Bool)
(declare-fun $IomMem@1@@1 () (Array Int Int))
(declare-fun %lbl%@102318 () Bool)
(declare-fun %lbl%@102331 () Bool)
(declare-fun %lbl%@102339 () Bool)
(declare-fun call28392formal@$ret@0 () Int)
(declare-fun %lbl%@102512 () Bool)
(declare-fun call28396formal@$ret@0 () Int)
(declare-fun %lbl%@102545 () Bool)
(declare-fun call28400formal@$ret@0 () Int)
(declare-fun call28415formal@$oldMem@0 () (Array Int Int))
(declare-fun call28415formal@$oldSMem@0 () (Array Int Int))
(declare-fun call28415formal@$oldDMem@0 () (Array Int Int))
(declare-fun call28415formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call28415formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call28415formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call28415formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@102627 () Bool)
(declare-fun %lbl%@102655 () Bool)
(declare-fun %lbl%@102678 () Bool)
(declare-fun %lbl%@102688 () Bool)
(declare-fun call28418formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@102719 () Bool)
(declare-fun %lbl%@102728 () Bool)
(declare-fun esp@0@@1 () Int)
(declare-fun %lbl%@102757 () Bool)
(declare-fun %lbl%@102761 () Bool)
(declare-fun %lbl%@102774 () Bool)
(declare-fun %lbl%@102791 () Bool)
(declare-fun %lbl%@102819 () Bool)
(declare-fun %lbl%+98934 () Bool)
(push 1)
(set-info :boogie-vc-id SetupIoTables)
(assert (not
(let ((anon0_correct@@7 (=> (! (and %lbl%+28421 true) :lblpos +28421) (and
(! (or %lbl%@99462 (Aligned esp)) :lblneg @99462)
(=> (Aligned esp) (=> (and
(Aligned (- esp 4))
(Aligned (- esp 8))
(Aligned (- esp 12))
(Aligned (- esp 16))
(Aligned (- esp 20))
(Aligned (- esp 24))
(Aligned (- esp 28))
(Aligned (- esp 32))
(Aligned (- esp 36))
(Aligned (- esp 40))
(Aligned (- esp 44))
(Aligned (- esp 48))
(Aligned (- esp 52))
(Aligned (- esp 56))
(Aligned (- esp 60))
(Aligned (- esp 64))) (and
(! (or %lbl%@99624 (word (- esp 4))) :lblneg @99624)
(=> (word (- esp 4)) (=> (and
(= call28238formal@$ret@0 (- esp 4))
(= call28241formal@$ret@0 ecx)) (and
(! (or %lbl%@99681 (word (+ call28241formal@$ret@0 65536))) :lblneg @99681)
(=> (word (+ call28241formal@$ret@0 65536)) (=> (and
(= call28245formal@$ret@0 (+ call28241formal@$ret@0 65536))
(= call28254formal@$ptr@0 (+ call28238formal@$ret@0 0))) (and
(! (or %lbl%@99724 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @99724)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@99754 (sAddr call28254formal@$ptr@0)) :lblneg @99754)
(=> (sAddr call28254formal@$ptr@0) (=> (MemInv (store $Mem@@3 call28254formal@$ptr@0 call28245formal@$ret@0) $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0 (store $sMem@@5 call28254formal@$ptr@0 call28245formal@$ret@0))
(= call28259formal@$ptr@0 (+ call28238formal@$ret@0 0))) (and
(! (or %lbl%@99817 (PtrOk call28259formal@$ptr@0)) :lblneg @99817)
(=> (PtrOk call28259formal@$ptr@0) (and
(! (or %lbl%@99820 (word call28245formal@$ret@0)) :lblneg @99820)
(=> (word call28245formal@$ret@0) (=> (= $Mem@0 (store $Mem@@3 call28259formal@$ptr@0 call28245formal@$ret@0)) (and
(! (or %lbl%@99853 (word (+ ecx 4096))) :lblneg @99853)
(=> (word (+ ecx 4096)) (=> (and
(= call28263formal@$ret@0 (+ ecx 4096))
(= call28266formal@$ret@0 call28263formal@$ret@0)) (and
(! (or %lbl%@99907 (word (+ call28266formal@$ret@0 4096))) :lblneg @99907)
(=> (word (+ call28266formal@$ret@0 4096)) (=> (and
(= call28270formal@$ret@0 (+ call28266formal@$ret@0 4096))
(= call28273formal@$ret@0 call28270formal@$ret@0)) (and
(! (or %lbl%@99958 (and
(word call28263formal@$ret@0)
(word (- call28263formal@$ret@0 4096)))) :lblneg @99958)
(=> (and
(word call28263formal@$ret@0)
(word (- call28263formal@$ret@0 4096))) (=> (= (q@and (- call28263formal@$ret@0 (q@and call28263formal@$ret@0 4095)) 4095) 0) (=> (and
(<= 0 (q@and call28263formal@$ret@0 4095))
(<= (q@and call28263formal@$ret@0 4095) 4095)
(= call28284formal@$x@0 (+ (- call28263formal@$ret@0 (q@and call28263formal@$ret@0 4095)) 0))) (and
(! (or %lbl%@100024 (= (q@and call28284formal@$x@0 4095) 0)) :lblneg @100024)
(=> (= (q@and call28284formal@$x@0 4095) 0) (and
(! (or %lbl%@100033 (and
(word call28284formal@$x@0)
(word (+ call28284formal@$x@0 4096)))) :lblneg @100033)
(=> (and
(word call28284formal@$x@0)
(word (+ call28284formal@$x@0 4096))) (=> (= (q@and (+ call28284formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28284formal@$x@0)
(= call28293formal@$x@0 (+ (- call28263formal@$ret@0 (q@and call28263formal@$ret@0 4095)) 4096))) (and
(! (or %lbl%@100079 (= (q@and call28293formal@$x@0 4095) 0)) :lblneg @100079)
(=> (= (q@and call28293formal@$x@0 4095) 0) (and
(! (or %lbl%@100088 (and
(word call28293formal@$x@0)
(word (+ call28293formal@$x@0 4096)))) :lblneg @100088)
(=> (and
(word call28293formal@$x@0)
(word (+ call28293formal@$x@0 4096))) (=> (= (q@and (+ call28293formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28293formal@$x@0)
(= call28302formal@$x@0 (+ (- call28263formal@$ret@0 (q@and call28263formal@$ret@0 4095)) 8192))) (and
(! (or %lbl%@100134 (= (q@and call28302formal@$x@0 4095) 0)) :lblneg @100134)
(=> (= (q@and call28302formal@$x@0 4095) 0) (and
(! (or %lbl%@100143 (and
(word call28302formal@$x@0)
(word (+ call28302formal@$x@0 4096)))) :lblneg @100143)
(=> (and
(word call28302formal@$x@0)
(word (+ call28302formal@$x@0 4096))) (=> (= (q@and (+ call28302formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28302formal@$x@0)
(= call28311formal@$x@0 (+ (- call28263formal@$ret@0 (q@and call28263formal@$ret@0 4095)) 12288))) (and
(! (or %lbl%@100189 (= (q@and call28311formal@$x@0 4095) 0)) :lblneg @100189)
(=> (= (q@and call28311formal@$x@0 4095) 0) (and
(! (or %lbl%@100198 (and
(word call28311formal@$x@0)
(word (+ call28311formal@$x@0 4096)))) :lblneg @100198)
(=> (and
(word call28311formal@$x@0)
(word (+ call28311formal@$x@0 4096))) (=> (= (q@and (+ call28311formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28311formal@$x@0)
(= call28320formal@$x@0 (+ (- call28263formal@$ret@0 (q@and call28263formal@$ret@0 4095)) 16384))) (and
(! (or %lbl%@100244 (= (q@and call28320formal@$x@0 4095) 0)) :lblneg @100244)
(=> (= (q@and call28320formal@$x@0 4095) 0) (and
(! (or %lbl%@100253 (and
(word call28320formal@$x@0)
(word (+ call28320formal@$x@0 4096)))) :lblneg @100253)
(=> (and
(word call28320formal@$x@0)
(word (+ call28320formal@$x@0 4096))) (=> (= (q@and (+ call28320formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28320formal@$x@0)
(= call28329formal@$x@0 (+ (- call28263formal@$ret@0 (q@and call28263formal@$ret@0 4095)) 20480))) (and
(! (or %lbl%@100299 (= (q@and call28329formal@$x@0 4095) 0)) :lblneg @100299)
(=> (= (q@and call28329formal@$x@0 4095) 0) (and
(! (or %lbl%@100308 (and
(word call28329formal@$x@0)
(word (+ call28329formal@$x@0 4096)))) :lblneg @100308)
(=> (and
(word call28329formal@$x@0)
(word (+ call28329formal@$x@0 4096))) (=> (and
(= (q@and (+ call28329formal@$x@0 4096) 4095) 0)
(Aligned call28329formal@$x@0)
(= call28333formal@$ret@0 (q@and call28263formal@$ret@0 4095))
(word call28333formal@$ret@0)) (and
(! (or %lbl%@100370 (word (- call28273formal@$ret@0 call28333formal@$ret@0))) :lblneg @100370)
(=> (word (- call28273formal@$ret@0 call28333formal@$ret@0)) (=> (= call28337formal@$ret@0 (- call28273formal@$ret@0 call28333formal@$ret@0)) (and
(! (or %lbl%@100398 (TV call28337formal@$ret@0)) :lblneg @100398)
(=> (TV call28337formal@$ret@0) (=> (= call28345formal@$ptr@0 (+ call28238formal@$ret@0 0)) (and
(! (or %lbl%@100412 (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @100412)
(=> (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@100440 (sAddr call28345formal@$ptr@0)) :lblneg @100440)
(=> (sAddr call28345formal@$ptr@0) (=> (and
(= (select $Mem@0 call28345formal@$ptr@0) (select $sMem@0 call28345formal@$ptr@0))
(= call28350formal@$ptr@0 (+ call28238formal@$ret@0 0))) (and
(! (or %lbl%@100464 (PtrOk call28350formal@$ptr@0)) :lblneg @100464)
(=> (PtrOk call28350formal@$ptr@0) (=> (and
(word call28350formal@$val@0)
(= call28350formal@$val@0 (select $Mem@0 call28350formal@$ptr@0))) (and
(! (or %lbl%@100497 (word (+ call28350formal@$val@0 2097152))) :lblneg @100497)
(=> (word (+ call28350formal@$val@0 2097152)) (=> (= call28354formal@$ret@0 (+ call28350formal@$val@0 2097152)) (=> (and
(= call28357formal@$ret@0 call28354formal@$ret@0)
(= call28360formal@$ret@0 call28357formal@$ret@0)) (and
(! (or %lbl%@100572 (word (+ call28360formal@$ret@0 2097152))) :lblneg @100572)
(=> (word (+ call28360formal@$ret@0 2097152)) (=> (and
(= call28364formal@$ret@0 (+ call28360formal@$ret@0 2097152))
(= call28367formal@$ret@0 call28364formal@$ret@0)) (and
(! (or %lbl%@100623 (and
(word call28357formal@$ret@0)
(word (- call28357formal@$ret@0 2097152))
(word (+ call28357formal@$ret@0 2097152)))) :lblneg @100623)
(=> (and
(word call28357formal@$ret@0)
(word (- call28357formal@$ret@0 2097152))
(word (+ call28357formal@$ret@0 2097152))) (=> (= (q@and (- (+ call28357formal@$ret@0 2097152) (q@and call28357formal@$ret@0 2097151)) 4095) 0) (=> (and
(<= 0 (q@and call28357formal@$ret@0 2097151))
(<= (q@and call28357formal@$ret@0 2097151) 2097151)
(= call28373formal@$ret@0 (q@and call28357formal@$ret@0 2097151))
(word call28373formal@$ret@0)) (and
(! (or %lbl%@100718 (word (- call28367formal@$ret@0 call28373formal@$ret@0))) :lblneg @100718)
(=> (word (- call28367formal@$ret@0 call28373formal@$ret@0)) (=> (= call28377formal@$ret@0 (- call28367formal@$ret@0 call28373formal@$ret@0)) (and
(! (or %lbl%@100746 (and
(word ?iomLo)
(word ?iomHi)
(word ?dmaHi))) :lblneg @100746)
(=> (and
(word ?iomLo)
(word ?iomHi)
(word ?dmaHi)) (and
(! (or %lbl%@100762 (= ?dmaLo ?iomHi)) :lblneg @100762)
(=> (= ?dmaLo ?iomHi) (and
(! (or %lbl%@100768 (= (q@and call28377formal@$ret@0 4095) 0)) :lblneg @100768)
(=> (= (q@and call28377formal@$ret@0 4095) 0) (and
(! (or %lbl%@100777 (and
(<= ?dmaLo call28377formal@$ret@0)
(<= (+ (+ call28377formal@$ret@0 2097152) 4096) ?dmaHi))) :lblneg @100777)
(=> (and
(<= ?dmaLo call28377formal@$ret@0)
(<= (+ (+ call28377formal@$ret@0 2097152) 4096) ?dmaHi)) (and
(! (or %lbl%@100797 (Aligned call28337formal@$ret@0)) :lblneg @100797)
(=> (Aligned call28337formal@$ret@0) (and
(! (or %lbl%@100800 (and
(<= ?iomLo call28337formal@$ret@0)
(<= (+ call28337formal@$ret@0 32768) ?iomHi))) :lblneg @100800)
(=> (and
(<= ?iomLo call28337formal@$ret@0)
(<= (+ call28337formal@$ret@0 32768) ?iomHi)) (and
(! (or %lbl%@100816 (= (q@and (+ call28337formal@$ret@0 0) 4095) 0)) :lblneg @100816)
(=> (= (q@and (+ call28337formal@$ret@0 0) 4095) 0) (and
(! (or %lbl%@100829 (= (q@and (+ call28337formal@$ret@0 4096) 4095) 0)) :lblneg @100829)
(=> (= (q@and (+ call28337formal@$ret@0 4096) 4095) 0) (and
(! (or %lbl%@100842 (= (q@and (+ call28337formal@$ret@0 8192) 4095) 0)) :lblneg @100842)
(=> (= (q@and (+ call28337formal@$ret@0 8192) 4095) 0) (and
(! (or %lbl%@100855 (= (q@and (+ call28337formal@$ret@0 12288) 4095) 0)) :lblneg @100855)
(=> (= (q@and (+ call28337formal@$ret@0 12288) 4095) 0) (and
(! (or %lbl%@100868 (not $IomFrozen)) :lblneg @100868)
(=> (not $IomFrozen) (=> (IoPageTable $IomMem@0@@1 call28337formal@$ret@0) (=> (and
(forall ((i@@107 Int) ) (! (=> (and
(TV i@@107)
(<= 0 i@@107)
(< i@@107 512)) (and
(or
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 4096) (* 8 i@@107))) 0)
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 4096) (* 8 i@@107))) (+ call28337formal@$ret@0 3)))
(= (select $IomMem@0@@1 (+ (+ (+ call28337formal@$ret@0 4096) (* 8 i@@107)) 4)) 0)))
 :qid |EntryMSb.49:17|
 :skolemid |248|
 :pattern ( (TV i@@107))
))
(forall ((i@@108 Int) ) (! (=> (and
(TV i@@108)
(<= 0 i@@108)
(< i@@108 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 8192) (* 8 i@@108))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28337formal@$ret@0 8192) (* 8 i@@108)) 4)) 0)))
 :qid |EntryMSb.52:17|
 :skolemid |249|
 :pattern ( (TV i@@108))
))
(forall ((i@@109 Int) ) (! (=> (and
(TV i@@109)
(<= 0 i@@109)
(< i@@109 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 12288) (* 8 i@@109))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28337formal@$ret@0 12288) (* 8 i@@109)) 4)) 0)))
 :qid |EntryMSb.55:17|
 :skolemid |250|
 :pattern ( (TV i@@109))
))
(= call28382formal@$ptr@0 (+ call28238formal@$ret@0 0))) (and
(! (or %lbl%@101189 (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @101189)
(=> (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@101217 (sAddr call28382formal@$ptr@0)) :lblneg @101217)
(=> (sAddr call28382formal@$ptr@0) (=> (and
(= (select $Mem@0 call28382formal@$ptr@0) (select $sMem@0 call28382formal@$ptr@0))
(= call28387formal@$ptr@0 (+ call28238formal@$ret@0 0))) (and
(! (or %lbl%@101241 (PtrOk call28387formal@$ptr@0)) :lblneg @101241)
(=> (PtrOk call28387formal@$ptr@0) (=> (and
(word call28387formal@$val@0)
(= call28387formal@$val@0 (select $Mem@0 call28387formal@$ptr@0))) (and
(! (or %lbl%@101269 (and
(word ?iomLo)
(word ?iomHi))) :lblneg @101269)
(=> (and
(word ?iomLo)
(word ?iomHi)) (and
(! (or %lbl%@101279 (Aligned ?dmaLo)) :lblneg @101279)
(=> (Aligned ?dmaLo) (and
(! (or %lbl%@101283 (= ?dmaLo ?iomHi)) :lblneg @101283)
(=> (= ?dmaLo ?iomHi) (and
(! (or %lbl%@101289 (= call28387formal@$val@0 ?dmaLo)) :lblneg @101289)
(=> (= call28387formal@$val@0 ?dmaLo) (and
(! (or %lbl%@101294 (IoPageTable $IomMem@0@@1 call28337formal@$ret@0)) :lblneg @101294)
(=> (IoPageTable $IomMem@0@@1 call28337formal@$ret@0) (and
(! (or %lbl%@101298 (forall ((i@@110 Int) ) (! (=> (and
(TV i@@110)
(<= 0 i@@110)
(< i@@110 512)) (and
(or
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 4096) (* 8 i@@110))) 0)
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 4096) (* 8 i@@110))) (+ call28337formal@$ret@0 3)))
(= (select $IomMem@0@@1 (+ (+ (+ call28337formal@$ret@0 4096) (* 8 i@@110)) 4)) 0)))
 :qid |EntryMSb.113:18|
 :skolemid |255|
 :pattern ( (TV i@@110))
))) :lblneg @101298)
(=> (forall ((i@@111 Int) ) (! (=> (and
(TV i@@111)
(<= 0 i@@111)
(< i@@111 512)) (and
(or
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 4096) (* 8 i@@111))) 0)
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 4096) (* 8 i@@111))) (+ call28337formal@$ret@0 3)))
(= (select $IomMem@0@@1 (+ (+ (+ call28337formal@$ret@0 4096) (* 8 i@@111)) 4)) 0)))
 :qid |EntryMSb.113:18|
 :skolemid |255|
 :pattern ( (TV i@@111))
)) (and
(! (or %lbl%@101399 (forall ((i@@112 Int) ) (! (=> (and
(TV i@@112)
(<= 0 i@@112)
(< i@@112 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 8192) (* 8 i@@112))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28337formal@$ret@0 8192) (* 8 i@@112)) 4)) 0)))
 :qid |EntryMSb.116:18|
 :skolemid |256|
 :pattern ( (TV i@@112))
))) :lblneg @101399)
(=> (forall ((i@@113 Int) ) (! (=> (and
(TV i@@113)
(<= 0 i@@113)
(< i@@113 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 8192) (* 8 i@@113))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28337formal@$ret@0 8192) (* 8 i@@113)) 4)) 0)))
 :qid |EntryMSb.116:18|
 :skolemid |256|
 :pattern ( (TV i@@113))
)) (and
(! (or %lbl%@101475 (forall ((i@@114 Int) ) (! (=> (and
(TV i@@114)
(<= 0 i@@114)
(< i@@114 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 12288) (* 8 i@@114))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28337formal@$ret@0 12288) (* 8 i@@114)) 4)) 0)))
 :qid |EntryMSb.119:18|
 :skolemid |257|
 :pattern ( (TV i@@114))
))) :lblneg @101475)
(=> (forall ((i@@115 Int) ) (! (=> (and
(TV i@@115)
(<= 0 i@@115)
(< i@@115 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28337formal@$ret@0 12288) (* 8 i@@115))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28337formal@$ret@0 12288) (* 8 i@@115)) 4)) 0)))
 :qid |EntryMSb.119:18|
 :skolemid |257|
 :pattern ( (TV i@@115))
)) (and
(! (or %lbl%@101551 (Aligned call28337formal@$ret@0)) :lblneg @101551)
(=> (Aligned call28337formal@$ret@0) (and
(! (or %lbl%@101554 (Aligned (+ call28337formal@$ret@0 16384))) :lblneg @101554)
(=> (Aligned (+ call28337formal@$ret@0 16384)) (and
(! (or %lbl%@101561 (and
(<= ?iomLo call28337formal@$ret@0)
(<= (+ call28337formal@$ret@0 32768) ?iomHi))) :lblneg @101561)
(=> (and
(<= ?iomLo call28337formal@$ret@0)
(<= (+ call28337formal@$ret@0 32768) ?iomHi)) (and
(! (or %lbl%@101577 (= (q@and (+ call28337formal@$ret@0 4096) 4095) 0)) :lblneg @101577)
(=> (= (q@and (+ call28337formal@$ret@0 4096) 4095) 0) (and
(! (or %lbl%@101590 (= (q@and (+ call28337formal@$ret@0 8192) 4095) 0)) :lblneg @101590)
(=> (= (q@and (+ call28337formal@$ret@0 8192) 4095) 0) (and
(! (or %lbl%@101603 (= (q@and (+ call28337formal@$ret@0 12288) 4095) 0)) :lblneg @101603)
(=> (= (q@and (+ call28337formal@$ret@0 12288) 4095) 0) (and
(! (or %lbl%@101616 (= (q@and (+ call28337formal@$ret@0 16384) 4095) 0)) :lblneg @101616)
(=> (= (q@and (+ call28337formal@$ret@0 16384) 4095) 0) (and
(! (or %lbl%@101629 (= (q@and (+ call28337formal@$ret@0 20480) 4095) 0)) :lblneg @101629)
(=> (= (q@and (+ call28337formal@$ret@0 20480) 4095) 0) (and
(! (or %lbl%@101642 (not $IomFrozen)) :lblneg @101642)
(=> (not $IomFrozen) (=> (and
(IoPageTable $IomMem@1@@1 call28337formal@$ret@0)
(= (select $IomMem@1@@1 (+ call28337formal@$ret@0 8192)) (+ (+ call28337formal@$ret@0 4096) 3))
(= (select $IomMem@1@@1 (+ call28337formal@$ret@0 8196)) 0)
(= (select $IomMem@1@@1 (+ call28337formal@$ret@0 12288)) (+ (+ call28337formal@$ret@0 8192) 3))) (=> (and
(= (select $IomMem@1@@1 (+ call28337formal@$ret@0 12292)) 0)
(forall ((i@@116 Int) ) (! (=> (and
(TV i@@116)
(<= 0 i@@116)
(< i@@116 512)) (and
(or
(= (select $IomMem@1@@1 (+ (+ call28337formal@$ret@0 4096) (* 8 i@@116))) 0)
(= (select $IomMem@1@@1 (+ (+ call28337formal@$ret@0 4096) (* 8 i@@116))) (+ call28337formal@$ret@0 3)))
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 4096) (* 8 i@@116)) 4)) 0)))
 :qid |EntryMSb.138:17|
 :skolemid |258|
 :pattern ( (TV i@@116))
))
(forall ((i@@117 Int) ) (! (=> (and
(TV i@@117)
(<= 1 i@@117)
(< i@@117 512)) (and
(= (select $IomMem@1@@1 (+ (+ call28337formal@$ret@0 8192) (* 8 i@@117))) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 8192) (* 8 i@@117)) 4)) 0)))
 :qid |EntryMSb.141:17|
 :skolemid |259|
 :pattern ( (TV i@@117))
))
(forall ((i@@118 Int) ) (! (=> (and
(TV i@@118)
(<= 1 i@@118)
(< i@@118 512)) (and
(= (select $IomMem@1@@1 (+ (+ call28337formal@$ret@0 12288) (* 8 i@@118))) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 12288) (* 8 i@@118)) 4)) 0)))
 :qid |EntryMSb.144:17|
 :skolemid |260|
 :pattern ( (TV i@@118))
))
(forall ((i@@119 Int) ) (! (=> (and
(TV i@@119)
(<= 0 i@@119)
(< i@@119 256)) (and
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 16384) (* 16 i@@119)) 0)) (+ (+ call28337formal@$ret@0 12288) 3))
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 16384) (* 16 i@@119)) 4)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 16384) (* 16 i@@119)) 8)) 258)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 16384) (* 16 i@@119)) 12)) 0)))
 :qid |EntryMSb.147:17|
 :skolemid |261|
 :pattern ( (TV i@@119))
))
(forall ((i@@120 Int) ) (! (=> (and
(TV i@@120)
(<= 0 i@@120)
(< i@@120 256)) (and
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@120)) 0)) (+ (+ call28337formal@$ret@0 16384) 1))
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@120)) 4)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@120)) 8)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@120)) 12)) 0)))
 :qid |EntryMSb.152:17|
 :skolemid |262|
 :pattern ( (TV i@@120))
))
(= (select $IomMem@1@@1 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)
(= (select $IomMem@1@@1 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) (and
(! (or %lbl%@102318 (= (q@and (+ call28337formal@$ret@0 20480) 4095) 0)) :lblneg @102318)
(=> (= (q@and (+ call28337formal@$ret@0 20480) 4095) 0) (and
(! (or %lbl%@102331 (IoContextTable $IomMem@1@@1 (+ call28337formal@$ret@0 16384))) :lblneg @102331)
(=> (IoContextTable $IomMem@1@@1 (+ call28337formal@$ret@0 16384)) (and
(! (or %lbl%@102339 (forall ((i@@121 Int) ) (! (=> (and
(TV i@@121)
(<= 0 i@@121)
(< i@@121 256)) (and
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@121)) 0)) (+ (+ call28337formal@$ret@0 16384) 1))
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@121)) 4)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@121)) 8)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@121)) 12)) 0)))
 :qid |EntryMSb.227:18|
 :skolemid |268|
 :pattern ( (TV i@@121))
))) :lblneg @102339)
(=> (forall ((i@@122 Int) ) (! (=> (and
(TV i@@122)
(<= 0 i@@122)
(< i@@122 256)) (and
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@122)) 0)) (+ (+ call28337formal@$ret@0 16384) 1))
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@122)) 4)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@122)) 8)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28337formal@$ret@0 20480) (* 16 i@@122)) 12)) 0)))
 :qid |EntryMSb.227:18|
 :skolemid |268|
 :pattern ( (TV i@@122))
)) (=> (and
(IoRootTable $IomMem@1@@1 (+ call28337formal@$ret@0 20480))
(= call28392formal@$ret@0 call28337formal@$ret@0)) (and
(! (or %lbl%@102512 (word (+ call28392formal@$ret@0 20480))) :lblneg @102512)
(=> (word (+ call28392formal@$ret@0 20480)) (=> (= call28396formal@$ret@0 (+ call28392formal@$ret@0 20480)) (and
(! (or %lbl%@102545 (word (+ call28238formal@$ret@0 4))) :lblneg @102545)
(=> (word (+ call28238formal@$ret@0 4)) (=> (and
(= call28400formal@$ret@0 (+ call28238formal@$ret@0 4))
(= call28415formal@$oldMem@0 $Mem@@3)
(= call28415formal@$oldSMem@0 $sMem@@5)
(= call28415formal@$oldDMem@0 $dMem@@0)
(= call28415formal@$oldPciMem@0 $pciMem@@1)
(= call28415formal@$oldTMem@0 $tMems@@12)
(= call28415formal@$oldFMem@0 $fMems@@4)
(= call28415formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@102627 (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @102627)
(=> (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@102655 (MemInv call28415formal@$oldMem@0 call28415formal@$oldSMem@0 call28415formal@$oldDMem@0 call28415formal@$oldPciMem@0 call28415formal@$oldTMem@0 call28415formal@$oldFMem@0 call28415formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @102655)
(=> (MemInv call28415formal@$oldMem@0 call28415formal@$oldSMem@0 call28415formal@$oldDMem@0 call28415formal@$oldPciMem@0 call28415formal@$oldTMem@0 call28415formal@$oldFMem@0 call28415formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@102678 (= (select $sMem@0 call28400formal@$ret@0) (select call28415formal@$oldSMem@0 call28400formal@$ret@0))) :lblneg @102678)
(=> (= (select $sMem@0 call28400formal@$ret@0) (select call28415formal@$oldSMem@0 call28400formal@$ret@0)) (and
(! (or %lbl%@102688 (sAddr call28400formal@$ret@0)) :lblneg @102688)
(=> (sAddr call28400formal@$ret@0) (=> (= (select $Mem@0 call28400formal@$ret@0) (select call28415formal@$oldMem@0 call28400formal@$ret@0)) (=> (and
(= (select $Mem@0 call28400formal@$ret@0) (select $sMem@0 call28400formal@$ret@0))
(= call28418formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@102719 (= (ReturnToAddr (select $Mem@0 call28400formal@$ret@0)) call28418formal@$oldRA@0)) :lblneg @102719)
(=> (= (ReturnToAddr (select $Mem@0 call28400formal@$ret@0)) call28418formal@$oldRA@0) (and
(! (or %lbl%@102728 (Aligned call28400formal@$ret@0)) :lblneg @102728)
(=> (Aligned call28400formal@$ret@0) (=> (and
(= esp@0@@1 (+ call28400formal@$ret@0 4))
(Aligned esp@0@@1)) (and
(! (or %lbl%@102757 (IoRootTable $IomMem@1@@1 call28396formal@$ret@0)) :lblneg @102757)
(=> (IoRootTable $IomMem@1@@1 call28396formal@$ret@0) (and
(! (or %lbl%@102761 (= (select $IomMem@1@@1 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)) :lblneg @102761)
(=> (= (select $IomMem@1@@1 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE) (and
(! (or %lbl%@102774 (= (select $IomMem@1@@1 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) :lblneg @102774)
(=> (= (select $IomMem@1@@1 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo)) (and
(! (or %lbl%@102791 (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @102791)
(=> (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@102819 (SMemEnsure $sMem@0 $sMem@@5 esp@0@@1 esp)) :lblneg @102819)
(=> (SMemEnsure $sMem@0 $sMem@@5 esp@0@@1 esp) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@7 (=> (! (and %lbl%+98934 true) :lblpos +98934) (=> (and
(word ?iomLo)
(word ?iomHi)
(word ?dmaHi)
(= ecx ?iomLo)
(= ?dmaLo ?iomHi)
(Aligned ?dmaLo)
(not $IomFrozen)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 132 $sMem@@5 esp $RET@@0)) anon0_correct@@7))))
PreconditionGeneratedEntry_correct@@7))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+28521 () Bool)
(declare-fun call28484formal@$ptr@0 () Int)
(declare-fun %lbl%@103031 () Bool)
(declare-fun $IoMmuState () (Array Int Int))
(declare-fun $entry@@0 () Int)
(declare-fun $IoMmuState@0 () (Array Int Int))
(declare-fun $IomFrozen@0 () Bool)
(declare-fun call28490formal@$ptr@0 () Int)
(declare-fun %lbl%@103223 () Bool)
(declare-fun $IoMmuState@1 () (Array Int Int))
(declare-fun $IomFrozen@1 () Bool)
(declare-fun call28493formal@$ret@0 () Int)
(declare-fun %lbl%@103416 () Bool)
(declare-fun call28497formal@$ret@0 () Int)
(declare-fun call28503formal@$ptr@0 () Int)
(declare-fun %lbl%@103463 () Bool)
(declare-fun $IoMmuState@2 () (Array Int Int))
(declare-fun $IomFrozen@2 () Bool)
(declare-fun call28506formal@$ret@0 () Int)
(declare-fun %lbl%@103656 () Bool)
(declare-fun call28510formal@$ret@0 () Int)
(declare-fun call28516formal@$ptr@0 () Int)
(declare-fun %lbl%@103703 () Bool)
(declare-fun $IoMmuState@3 () (Array Int Int))
(declare-fun $IomFrozen@3 () Bool)
(declare-fun %lbl%@103869 () Bool)
(declare-fun %lbl%@103878 () Bool)
(declare-fun %lbl%+102826 () Bool)
(push 1)
(set-info :boogie-vc-id setIoMmuRegs)
(assert (not
(let ((anon0_correct@@8 (=> (! (and %lbl%+28521 true) :lblpos +28521) (=> (= call28484formal@$ptr@0 (+ esi 32)) (and
(! (or %lbl%@103031 (or
(and
(= (select $IoMmuState $entry@@0) 0)
(= call28484formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 ebx))
(and
(= (select $IoMmuState $entry@@0) 1)
(= call28484formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= ebx 0))
(and
(= (select $IoMmuState $entry@@0) 2)
(= call28484formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= ebx (shl 1 30)))
(and
(= (select $IoMmuState $entry@@0) 3)
(= call28484formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= ebx (shl 1 31))))) :lblneg @103031)
(=> (or
(and
(= (select $IoMmuState $entry@@0) 0)
(= call28484formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 ebx))
(and
(= (select $IoMmuState $entry@@0) 1)
(= call28484formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= ebx 0))
(and
(= (select $IoMmuState $entry@@0) 2)
(= call28484formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= ebx (shl 1 30)))
(and
(= (select $IoMmuState $entry@@0) 3)
(= call28484formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= ebx (shl 1 31)))) (=> (= $IoMmuState@0 (store $IoMmuState $entry@@0 (+ 1 (select $IoMmuState $entry@@0)))) (=> (and
$IomFrozen@0
(= call28490formal@$ptr@0 (+ esi 36))) (and
(! (or %lbl%@103223 (or
(and
(= (select $IoMmuState@0 $entry@@0) 0)
(= call28490formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 0))
(and
(= (select $IoMmuState@0 $entry@@0) 1)
(= call28490formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= 0 0))
(and
(= (select $IoMmuState@0 $entry@@0) 2)
(= call28490formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= 0 (shl 1 30)))
(and
(= (select $IoMmuState@0 $entry@@0) 3)
(= call28490formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= 0 (shl 1 31))))) :lblneg @103223)
(=> (or
(and
(= (select $IoMmuState@0 $entry@@0) 0)
(= call28490formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 0))
(and
(= (select $IoMmuState@0 $entry@@0) 1)
(= call28490formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= 0 0))
(and
(= (select $IoMmuState@0 $entry@@0) 2)
(= call28490formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= 0 (shl 1 30)))
(and
(= (select $IoMmuState@0 $entry@@0) 3)
(= call28490formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= 0 (shl 1 31)))) (=> (= $IoMmuState@1 (store $IoMmuState@0 $entry@@0 (+ 1 (select $IoMmuState@0 $entry@@0)))) (=> (and
$IomFrozen@1
(= call28493formal@$ret@0 1)) (and
(! (or %lbl%@103416 (< 30 32)) :lblneg @103416)
(=> (< 30 32) (=> (= call28497formal@$ret@0 (shl call28493formal@$ret@0 30)) (=> (and
(word call28497formal@$ret@0)
(= call28503formal@$ptr@0 (+ esi 24))) (and
(! (or %lbl%@103463 (or
(and
(= (select $IoMmuState@1 $entry@@0) 0)
(= call28503formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 call28497formal@$ret@0))
(and
(= (select $IoMmuState@1 $entry@@0) 1)
(= call28503formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= call28497formal@$ret@0 0))
(and
(= (select $IoMmuState@1 $entry@@0) 2)
(= call28503formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28497formal@$ret@0 (shl 1 30)))
(and
(= (select $IoMmuState@1 $entry@@0) 3)
(= call28503formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28497formal@$ret@0 (shl 1 31))))) :lblneg @103463)
(=> (or
(and
(= (select $IoMmuState@1 $entry@@0) 0)
(= call28503formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 call28497formal@$ret@0))
(and
(= (select $IoMmuState@1 $entry@@0) 1)
(= call28503formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= call28497formal@$ret@0 0))
(and
(= (select $IoMmuState@1 $entry@@0) 2)
(= call28503formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28497formal@$ret@0 (shl 1 30)))
(and
(= (select $IoMmuState@1 $entry@@0) 3)
(= call28503formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28497formal@$ret@0 (shl 1 31)))) (=> (= $IoMmuState@2 (store $IoMmuState@1 $entry@@0 (+ 1 (select $IoMmuState@1 $entry@@0)))) (=> (and
$IomFrozen@2
(= call28506formal@$ret@0 1)) (and
(! (or %lbl%@103656 (< 31 32)) :lblneg @103656)
(=> (< 31 32) (=> (= call28510formal@$ret@0 (shl call28506formal@$ret@0 31)) (=> (and
(word call28510formal@$ret@0)
(= call28516formal@$ptr@0 (+ esi 24))) (and
(! (or %lbl%@103703 (or
(and
(= (select $IoMmuState@2 $entry@@0) 0)
(= call28516formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 call28510formal@$ret@0))
(and
(= (select $IoMmuState@2 $entry@@0) 1)
(= call28516formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= call28510formal@$ret@0 0))
(and
(= (select $IoMmuState@2 $entry@@0) 2)
(= call28516formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28510formal@$ret@0 (shl 1 30)))
(and
(= (select $IoMmuState@2 $entry@@0) 3)
(= call28516formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28510formal@$ret@0 (shl 1 31))))) :lblneg @103703)
(=> (or
(and
(= (select $IoMmuState@2 $entry@@0) 0)
(= call28516formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 call28510formal@$ret@0))
(and
(= (select $IoMmuState@2 $entry@@0) 1)
(= call28516formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= call28510formal@$ret@0 0))
(and
(= (select $IoMmuState@2 $entry@@0) 2)
(= call28516formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28510formal@$ret@0 (shl 1 30)))
(and
(= (select $IoMmuState@2 $entry@@0) 3)
(= call28516formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28510formal@$ret@0 (shl 1 31)))) (=> (and
(= $IoMmuState@3 (store $IoMmuState@2 $entry@@0 (+ 1 (select $IoMmuState@2 $entry@@0))))
$IomFrozen@3) (and
(! (or %lbl%@103869 (= (select $IoMmuState@3 $entry@@0) 4)) :lblneg @103869)
(=> (= (select $IoMmuState@3 $entry@@0) 4) (and
(! (or %lbl%@103878 (forall ((i@@123 Int) ) (! (=> (not (= i@@123 $entry@@0)) (= (select $IoMmuState@3 i@@123) (select $IoMmuState i@@123)))
 :qid |EntryMSb.295:17|
 :skolemid |269|
 :pattern ( (select $IoMmuState@3 i@@123))
))) :lblneg @103878)
(=> (forall ((i@@124 Int) ) (! (=> (not (= i@@124 $entry@@0)) (= (select $IoMmuState@3 i@@124) (select $IoMmuState i@@124)))
 :qid |EntryMSb.295:17|
 :skolemid |269|
 :pattern ( (select $IoMmuState@3 i@@124))
)) true)))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@8 (=> (! (and %lbl%+102826 true) :lblpos +102826) (=> (= esi (select ?DrhdRegs $entry@@0)) (=> (and
(IoRootTable $IomMem@@7 ebx)
(= (select $IoMmuState $entry@@0) 0)) anon0_correct@@8)))))
PreconditionGeneratedEntry_correct@@8))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+28957 () Bool)
(declare-fun %lbl%+28960 () Bool)
(declare-fun call28855formal@$ptr@0 () Int)
(declare-fun edi@0@@1 () Int)
(declare-fun %lbl%@105795 () Bool)
(declare-fun call28855formal@$val@0 () Int)
(declare-fun call28864formal@$ptr@0 () Int)
(declare-fun call28646formal@$ret@0 () Int)
(declare-fun %lbl%@105841 () Bool)
(declare-fun $Mem@1 () (Array Int Int))
(declare-fun $sMem@1 () (Array Int Int))
(declare-fun %lbl%@105869 () Bool)
(declare-fun ecx@2@@0 () Int)
(declare-fun $sMem@2 () (Array Int Int))
(declare-fun call28869formal@$ptr@0 () Int)
(declare-fun %lbl%@105930 () Bool)
(declare-fun %lbl%@105933 () Bool)
(declare-fun $Mem@2 () (Array Int Int))
(declare-fun %lbl%@105961 () Bool)
(declare-fun $entry@0@@1 () Int)
(declare-fun %lbl%@105969 () Bool)
(declare-fun %lbl%@105975 () Bool)
(declare-fun $IoMmuState@0@@0 () (Array Int Int))
(declare-fun $IoMmuState@1@@0 () (Array Int Int))
(declare-fun call28875formal@$ptr@0 () Int)
(declare-fun %lbl%@106077 () Bool)
(declare-fun %lbl%@106105 () Bool)
(declare-fun call28880formal@$ptr@0 () Int)
(declare-fun %lbl%@106129 () Bool)
(declare-fun call28880formal@$val@0 () Int)
(declare-fun $entry@1@@1 () Int)
(declare-fun %lbl%@106172 () Bool)
(declare-fun call28890formal@$ret@0 () Int)
(declare-fun %lbl%@106203 () Bool)
(declare-fun call28658formal@$ret@0 () Int)
(declare-fun %lbl%@106214 () Bool)
(declare-fun %lbl%@106217 () Bool)
(declare-fun %lbl%@106237 () Bool)
(declare-fun %lbl%@106241 () Bool)
(declare-fun %lbl%@106266 () Bool)
(declare-fun %lbl%@106299 () Bool)
(declare-fun %lbl%@106327 () Bool)
(declare-fun %lbl%+28955 () Bool)
(declare-fun $Efl@12 () Int)
(declare-fun call28806formal@$val@0 () Int)
(declare-fun %lbl%+28944 () Bool)
(declare-fun $Efl@10 () Int)
(declare-fun %lbl%@105532 () Bool)
(declare-fun %lbl%@105536 () Bool)
(declare-fun %lbl%@105545 () Bool)
(declare-fun call28833formal@$ptr@0 () Int)
(declare-fun %lbl%@105588 () Bool)
(declare-fun call28833formal@$val@0 () Int)
(declare-fun call28840formal@$x@0 () T@opn)
(declare-fun call28840formal@$y@0 () T@opn)
(declare-fun %lbl%@105636 () Bool)
(declare-fun %lbl%@105640 () Bool)
(declare-fun %lbl%+28965 () Bool)
(declare-fun %lbl%+28964 () Bool)
(declare-fun %lbl%+28946 () Bool)
(declare-fun %lbl%@105677 () Bool)
(declare-fun %lbl%@105681 () Bool)
(declare-fun ?DrhdCount () Int)
(declare-fun %lbl%+28936 () Bool)
(declare-fun $Efl@7 () Int)
(declare-fun call28801formal@$ptr@0 () Int)
(declare-fun %lbl%@105405 () Bool)
(declare-fun call28801formal@$val@0 () Int)
(declare-fun call28806formal@$ptr@0 () Int)
(declare-fun %lbl%@105445 () Bool)
(declare-fun call28813formal@$x@0 () T@opn)
(declare-fun call28813formal@$y@0 () T@opn)
(declare-fun %lbl%@105493 () Bool)
(declare-fun %lbl%@105497 () Bool)
(declare-fun %lbl%+28934 () Bool)
(declare-fun %lbl%@105364 () Bool)
(declare-fun %lbl%@105368 () Bool)
(declare-fun %lbl%+28933 () Bool)
(declare-fun call28781formal@$ptr@0 () Int)
(declare-fun %lbl%@105262 () Bool)
(declare-fun %lbl%@105290 () Bool)
(declare-fun call28790formal@$x@0 () T@opn)
(declare-fun call28790formal@$y@0 () T@opn)
(declare-fun %lbl%@105325 () Bool)
(declare-fun %lbl%@105329 () Bool)
(declare-fun %lbl%+28926 () Bool)
(declare-fun %lbl%@104470 () Bool)
(declare-fun %lbl%@104632 () Bool)
(declare-fun call28651formal@$ptr@0 () Int)
(declare-fun %lbl%@104674 () Bool)
(declare-fun call28651formal@$val@0 () Int)
(declare-fun call28654formal@$ret@0 () Int)
(declare-fun %lbl%@104729 () Bool)
(declare-fun call28667formal@$ptr@0 () Int)
(declare-fun %lbl%@104772 () Bool)
(declare-fun %lbl%@104802 () Bool)
(declare-fun $sMem@0@@0 () (Array Int Int))
(declare-fun call28672formal@$ptr@0 () Int)
(declare-fun %lbl%@104865 () Bool)
(declare-fun %lbl%@104868 () Bool)
(declare-fun $Mem@0@@0 () (Array Int Int))
(declare-fun %lbl%@104904 () Bool)
(declare-fun call28680formal@$ret@0 () Int)
(declare-fun %lbl%@104932 () Bool)
(declare-fun %lbl%@104943 () Bool)
(declare-fun %lbl%@104946 () Bool)
(declare-fun %lbl%@104966 () Bool)
(declare-fun %lbl%@104970 () Bool)
(declare-fun %lbl%@104997 () Bool)
(declare-fun %lbl%@105032 () Bool)
(declare-fun %lbl%@105060 () Bool)
(declare-fun %lbl%+103994 () Bool)
(push 1)
(set-info :boogie-vc-id ReadDmar)
(assert (not
(let ((anon10_Else_correct (=> (! (and %lbl%+28957 true) :lblpos +28957) true)))
(let ((__L9_correct (=> (! (and %lbl%+28960 true) :lblpos +28960) (=> (= call28855formal@$ptr@0 (+ edi@0@@1 8)) (and
(! (or %lbl%@105795 (inRo call28855formal@$ptr@0 4)) :lblneg @105795)
(=> (inRo call28855formal@$ptr@0 4) (=> (word call28855formal@$val@0) (=> (and
(= call28855formal@$val@0 (ro32 call28855formal@$ptr@0))
(= call28864formal@$ptr@0 (+ call28646formal@$ret@0 4))) (and
(! (or %lbl%@105841 (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @105841)
(=> (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@105869 (sAddr call28864formal@$ptr@0)) :lblneg @105869)
(=> (sAddr call28864formal@$ptr@0) (=> (MemInv (store $Mem@1 call28864formal@$ptr@0 ecx@2@@0) $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@2 (store $sMem@1 call28864formal@$ptr@0 ecx@2@@0))
(= call28869formal@$ptr@0 (+ call28646formal@$ret@0 4))) (and
(! (or %lbl%@105930 (PtrOk call28869formal@$ptr@0)) :lblneg @105930)
(=> (PtrOk call28869formal@$ptr@0) (and
(! (or %lbl%@105933 (word ecx@2@@0)) :lblneg @105933)
(=> (word ecx@2@@0) (=> (= $Mem@2 (store $Mem@1 call28869formal@$ptr@0 ecx@2@@0)) (and
(! (or %lbl%@105961 (= call28855formal@$val@0 (select ?DrhdRegs $entry@0@@1))) :lblneg @105961)
(=> (= call28855formal@$val@0 (select ?DrhdRegs $entry@0@@1)) (and
(! (or %lbl%@105969 (IoRootTable $IomMem@@7 ebx)) :lblneg @105969)
(=> (IoRootTable $IomMem@@7 ebx) (and
(! (or %lbl%@105975 (= (select $IoMmuState@0@@0 $entry@0@@1) 0)) :lblneg @105975)
(=> (= (select $IoMmuState@0@@0 $entry@0@@1) 0) (=> (= (select $IoMmuState@1@@0 $entry@0@@1) 4) (=> (and
(forall ((i@@125 Int) ) (! (=> (not (= i@@125 $entry@0@@1)) (= (select $IoMmuState@1@@0 i@@125) (select $IoMmuState@0@@0 i@@125)))
 :qid |EntryMSb.295:17|
 :skolemid |269|
 :pattern ( (select $IoMmuState@1@@0 i@@125))
))
(= call28875formal@$ptr@0 (+ call28646formal@$ret@0 4))) (and
(! (or %lbl%@106077 (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @106077)
(=> (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@106105 (sAddr call28875formal@$ptr@0)) :lblneg @106105)
(=> (sAddr call28875formal@$ptr@0) (=> (and
(= (select $Mem@2 call28875formal@$ptr@0) (select $sMem@2 call28875formal@$ptr@0))
(= call28880formal@$ptr@0 (+ call28646formal@$ret@0 4))) (and
(! (or %lbl%@106129 (PtrOk call28880formal@$ptr@0)) :lblneg @106129)
(=> (PtrOk call28880formal@$ptr@0) (=> (word call28880formal@$val@0) (=> (and
(= call28880formal@$val@0 (select $Mem@2 call28880formal@$ptr@0))
(= $entry@1@@1 (+ $entry@0@@1 1))) (and
(! (or %lbl%@106172 (word (+ edi@0@@1 call28880formal@$val@0))) :lblneg @106172)
(=> (word (+ edi@0@@1 call28880formal@$val@0)) (=> (= call28890formal@$ret@0 (+ edi@0@@1 call28880formal@$val@0)) (and
(! (or %lbl%@106203 (= call28658formal@$ret@0 (select $sMem@2 (+ call28646formal@$ret@0 0)))) :lblneg @106203)
(=> (= call28658formal@$ret@0 (select $sMem@2 (+ call28646formal@$ret@0 0))) (and
(! (or %lbl%@106214 (TV $entry@1@@1)) :lblneg @106214)
(=> (TV $entry@1@@1) (and
(! (or %lbl%@106217 (and
(<= (+ ?DmarPtr 48) call28890formal@$ret@0)
(<= call28890formal@$ret@0 (+ ?DmarPtr ?DmarLen)))) :lblneg @106217)
(=> (and
(<= (+ ?DmarPtr 48) call28890formal@$ret@0)
(<= call28890formal@$ret@0 (+ ?DmarPtr ?DmarLen))) (and
(! (or %lbl%@106237 (MaybeDrhd call28890formal@$ret@0 $entry@1@@1)) :lblneg @106237)
(=> (MaybeDrhd call28890formal@$ret@0 $entry@1@@1) (and
(! (or %lbl%@106241 (forall ((i@@126 Int) ) (! (=> (>= i@@126 $entry@1@@1) (= (select $IoMmuState@1@@0 i@@126) 0))
 :qid |EntryMSb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState@1@@0 i@@126))
))) :lblneg @106241)
(=> (forall ((i@@127 Int) ) (! (=> (>= i@@127 $entry@1@@1) (= (select $IoMmuState@1@@0 i@@127) 0))
 :qid |EntryMSb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState@1@@0 i@@127))
)) (and
(! (or %lbl%@106266 (forall ((i@@128 Int) ) (! (=> (and
(<= 0 i@@128)
(< i@@128 $entry@1@@1)) (= (select $IoMmuState@1@@0 i@@128) 4))
 :qid |EntryMSb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState@1@@0 i@@128))
))) :lblneg @106266)
(=> (forall ((i@@129 Int) ) (! (=> (and
(<= 0 i@@129)
(< i@@129 $entry@1@@1)) (= (select $IoMmuState@1@@0 i@@129) 4))
 :qid |EntryMSb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState@1@@0 i@@129))
)) (and
(! (or %lbl%@106299 (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @106299)
(=> (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@106327 (SMemInv $sMem@2 $sMem@@5 (+ call28646formal@$ret@0 8) esp)) :lblneg @106327)
(=> (SMemInv $sMem@2 $sMem@@5 (+ call28646formal@$ret@0 8) esp) true)))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon10_Then_correct (=> (! (and %lbl%+28955 true) :lblpos +28955) (=> (and
(Je $Efl@12)
(= ecx@2@@0 call28806formal@$val@0)) __L9_correct))))
(let ((anon9_Then_correct (=> (! (and %lbl%+28944 true) :lblpos +28944) (=> (Je $Efl@10) (and
(! (or %lbl%@105532 (MaybeDrhd edi@0@@1 $entry@0@@1)) :lblneg @105532)
(=> (MaybeDrhd edi@0@@1 $entry@0@@1) (and
(! (or %lbl%@105536 (< edi@0@@1 (+ ?DmarPtr ?DmarLen))) :lblneg @105536)
(=> (< edi@0@@1 (+ ?DmarPtr ?DmarLen)) (and
(! (or %lbl%@105545 (MatchesDrhd edi@0@@1)) :lblneg @105545)
(=> (MatchesDrhd edi@0@@1) (=> (and
(= (select ?DrhdPtr $entry@0@@1) edi@0@@1)
(MaybeDrhd (+ edi@0@@1 (roU16 (+ edi@0@@1 2))) (+ $entry@0@@1 1))
(DrhdInv edi@0@@1 $entry@0@@1)
(= call28833formal@$ptr@0 (+ edi@0@@1 12))) (and
(! (or %lbl%@105588 (inRo call28833formal@$ptr@0 4)) :lblneg @105588)
(=> (inRo call28833formal@$ptr@0 4) (=> (and
(word call28833formal@$val@0)
(= call28833formal@$val@0 (ro32 call28833formal@$ptr@0))
(= call28840formal@$x@0 (OpnReg call28833formal@$val@0))
(= call28840formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@105636 (OpnOk $Mem@1 call28840formal@$x@0)) :lblneg @105636)
(=> (OpnOk $Mem@1 call28840formal@$x@0) (and
(! (or %lbl%@105640 (OpnOk $Mem@1 call28840formal@$y@0)) :lblneg @105640)
(=> (OpnOk $Mem@1 call28840formal@$y@0) (=> (FlagsCmp $Efl@12 (EvalOpn $Mem@1 call28840formal@$x@0) (EvalOpn $Mem@1 call28840formal@$y@0)) (and
anon10_Then_correct
anon10_Else_correct))))))))))))))))))))
(let ((infloop_correct (=> (! (and %lbl%+28965 true) :lblpos +28965) true)))
(let ((done_correct (=> (! (and %lbl%+28964 true) :lblpos +28964) infloop_correct)))
(let ((anon9_Else_correct (=> (! (and %lbl%+28946 true) :lblpos +28946) (=> (not (Je $Efl@10)) (and
(! (or %lbl%@105677 (MaybeDrhd edi@0@@1 $entry@0@@1)) :lblneg @105677)
(=> (MaybeDrhd edi@0@@1 $entry@0@@1) (and
(! (or %lbl%@105681 (or
(= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(not (MatchesDrhd edi@0@@1)))) :lblneg @105681)
(=> (or
(= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(not (MatchesDrhd edi@0@@1))) (=> (= ?DrhdCount $entry@0@@1) done_correct)))))))))
(let ((anon8_Else_correct (=> (! (and %lbl%+28936 true) :lblpos +28936) (=> (and
(not (Jae $Efl@7))
(= call28801formal@$ptr@0 (+ edi@0@@1 0))) (and
(! (or %lbl%@105405 (inRo call28801formal@$ptr@0 2)) :lblneg @105405)
(=> (inRo call28801formal@$ptr@0 2) (=> (word call28801formal@$val@0) (=> (and
(= call28801formal@$val@0 (roU16 call28801formal@$ptr@0))
(= call28806formal@$ptr@0 (+ edi@0@@1 2))) (and
(! (or %lbl%@105445 (inRo call28806formal@$ptr@0 2)) :lblneg @105445)
(=> (inRo call28806formal@$ptr@0 2) (=> (and
(word call28806formal@$val@0)
(= call28806formal@$val@0 (roU16 call28806formal@$ptr@0))
(= call28813formal@$x@0 (OpnReg call28801formal@$val@0))
(= call28813formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@105493 (OpnOk $Mem@1 call28813formal@$x@0)) :lblneg @105493)
(=> (OpnOk $Mem@1 call28813formal@$x@0) (and
(! (or %lbl%@105497 (OpnOk $Mem@1 call28813formal@$y@0)) :lblneg @105497)
(=> (OpnOk $Mem@1 call28813formal@$y@0) (=> (FlagsCmp $Efl@10 (EvalOpn $Mem@1 call28813formal@$x@0) (EvalOpn $Mem@1 call28813formal@$y@0)) (and
anon9_Then_correct
anon9_Else_correct)))))))))))))))))
(let ((anon8_Then_correct (=> (! (and %lbl%+28934 true) :lblpos +28934) (=> (Jae $Efl@7) (and
(! (or %lbl%@105364 (MaybeDrhd edi@0@@1 $entry@0@@1)) :lblneg @105364)
(=> (MaybeDrhd edi@0@@1 $entry@0@@1) (and
(! (or %lbl%@105368 (or
(= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(not (MatchesDrhd edi@0@@1)))) :lblneg @105368)
(=> (or
(= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(not (MatchesDrhd edi@0@@1))) (=> (= ?DrhdCount $entry@0@@1) infloop_correct)))))))))
(let ((__L6_correct (=> (! (and %lbl%+28933 true) :lblpos +28933) (=> (<= 0 $entry@0@@1) (=> (and
(= call28658formal@$ret@0 (select $sMem@1 (+ call28646formal@$ret@0 0)))
(TV $entry@0@@1)) (=> (and
(<= (+ ?DmarPtr 48) edi@0@@1)
(<= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(MaybeDrhd edi@0@@1 $entry@0@@1)
(forall ((i@@130 Int) ) (! (=> (>= i@@130 $entry@0@@1) (= (select $IoMmuState@0@@0 i@@130) 0))
 :qid |EntryMSb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState@0@@0 i@@130))
))
(forall ((i@@131 Int) ) (! (=> (and
(<= 0 i@@131)
(< i@@131 $entry@0@@1)) (= (select $IoMmuState@0@@0 i@@131) 4))
 :qid |EntryMSb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState@0@@0 i@@131))
))
(MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemInv $sMem@1 $sMem@@5 (+ call28646formal@$ret@0 8) esp)
(= call28781formal@$ptr@0 (+ call28646formal@$ret@0 0))) (and
(! (or %lbl%@105262 (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @105262)
(=> (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@105290 (sAddr call28781formal@$ptr@0)) :lblneg @105290)
(=> (sAddr call28781formal@$ptr@0) (=> (= (select $Mem@1 call28781formal@$ptr@0) (select $sMem@1 call28781formal@$ptr@0)) (=> (and
(= call28790formal@$x@0 (OpnReg edi@0@@1))
(= call28790formal@$y@0 (OpnMem (+ call28646formal@$ret@0 0)))) (and
(! (or %lbl%@105325 (OpnOk $Mem@1 call28790formal@$x@0)) :lblneg @105325)
(=> (OpnOk $Mem@1 call28790formal@$x@0) (and
(! (or %lbl%@105329 (OpnOk $Mem@1 call28790formal@$y@0)) :lblneg @105329)
(=> (OpnOk $Mem@1 call28790formal@$y@0) (=> (FlagsCmp $Efl@7 (EvalOpn $Mem@1 call28790formal@$x@0) (EvalOpn $Mem@1 call28790formal@$y@0)) (and
anon8_Then_correct
anon8_Else_correct))))))))))))))))))
(let ((anon0_correct@@9 (=> (! (and %lbl%+28926 true) :lblpos +28926) (and
(! (or %lbl%@104470 (Aligned esp)) :lblneg @104470)
(=> (Aligned esp) (=> (and
(Aligned (- esp 4))
(Aligned (- esp 8))
(Aligned (- esp 12))
(Aligned (- esp 16))
(Aligned (- esp 20))
(Aligned (- esp 24))
(Aligned (- esp 28))
(Aligned (- esp 32))
(Aligned (- esp 36))
(Aligned (- esp 40))
(Aligned (- esp 44))
(Aligned (- esp 48))
(Aligned (- esp 52))
(Aligned (- esp 56))
(Aligned (- esp 60))
(Aligned (- esp 64))) (and
(! (or %lbl%@104632 (word (- esp 8))) :lblneg @104632)
(=> (word (- esp 8)) (=> (and
(= call28646formal@$ret@0 (- esp 8))
(= call28651formal@$ptr@0 (+ edi 4))) (and
(! (or %lbl%@104674 (inRo call28651formal@$ptr@0 4)) :lblneg @104674)
(=> (inRo call28651formal@$ptr@0 4) (=> (word call28651formal@$val@0) (=> (and
(= call28651formal@$val@0 (ro32 call28651formal@$ptr@0))
(= call28654formal@$ret@0 edi)) (and
(! (or %lbl%@104729 (word (+ call28654formal@$ret@0 call28651formal@$val@0))) :lblneg @104729)
(=> (word (+ call28654formal@$ret@0 call28651formal@$val@0)) (=> (and
(= call28658formal@$ret@0 (+ call28654formal@$ret@0 call28651formal@$val@0))
(= call28667formal@$ptr@0 (+ call28646formal@$ret@0 0))) (and
(! (or %lbl%@104772 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @104772)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@104802 (sAddr call28667formal@$ptr@0)) :lblneg @104802)
(=> (sAddr call28667formal@$ptr@0) (=> (MemInv (store $Mem@@3 call28667formal@$ptr@0 call28658formal@$ret@0) $sMem@0@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0@@0 (store $sMem@@5 call28667formal@$ptr@0 call28658formal@$ret@0))
(= call28672formal@$ptr@0 (+ call28646formal@$ret@0 0))) (and
(! (or %lbl%@104865 (PtrOk call28672formal@$ptr@0)) :lblneg @104865)
(=> (PtrOk call28672formal@$ptr@0) (and
(! (or %lbl%@104868 (word call28658formal@$ret@0)) :lblneg @104868)
(=> (word call28658formal@$ret@0) (=> (= $Mem@0@@0 (store $Mem@@3 call28672formal@$ptr@0 call28658formal@$ret@0)) (and
(! (or %lbl%@104904 (word (+ edi 48))) :lblneg @104904)
(=> (word (+ edi 48)) (=> (= call28680formal@$ret@0 (+ edi 48)) (and
(! (or %lbl%@104932 (= call28658formal@$ret@0 (select $sMem@0@@0 (+ call28646formal@$ret@0 0)))) :lblneg @104932)
(=> (= call28658formal@$ret@0 (select $sMem@0@@0 (+ call28646formal@$ret@0 0))) (and
(! (or %lbl%@104943 (TV 0)) :lblneg @104943)
(=> (TV 0) (and
(! (or %lbl%@104946 (and
(<= (+ ?DmarPtr 48) call28680formal@$ret@0)
(<= call28680formal@$ret@0 (+ ?DmarPtr ?DmarLen)))) :lblneg @104946)
(=> (and
(<= (+ ?DmarPtr 48) call28680formal@$ret@0)
(<= call28680formal@$ret@0 (+ ?DmarPtr ?DmarLen))) (and
(! (or %lbl%@104966 (MaybeDrhd call28680formal@$ret@0 0)) :lblneg @104966)
(=> (MaybeDrhd call28680formal@$ret@0 0) (and
(! (or %lbl%@104970 (forall ((i@@132 Int) ) (! (=> (>= i@@132 0) (= (select $IoMmuState i@@132) 0))
 :qid |EntryMSb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState i@@132))
))) :lblneg @104970)
(=> (forall ((i@@133 Int) ) (! (=> (>= i@@133 0) (= (select $IoMmuState i@@133) 0))
 :qid |EntryMSb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState i@@133))
)) (and
(! (or %lbl%@104997 (forall ((i@@134 Int) ) (! (=> (and
(<= 0 i@@134)
(< i@@134 0)) (= (select $IoMmuState i@@134) 4))
 :qid |EntryMSb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState i@@134))
))) :lblneg @104997)
(=> (forall ((i@@135 Int) ) (! (=> (and
(<= 0 i@@135)
(< i@@135 0)) (= (select $IoMmuState i@@135) 4))
 :qid |EntryMSb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState i@@135))
)) (and
(! (or %lbl%@105032 (MemInv $Mem@0@@0 $sMem@0@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @105032)
(=> (MemInv $Mem@0@@0 $sMem@0@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@105060 (SMemInv $sMem@0@@0 $sMem@@5 (+ call28646formal@$ret@0 8) esp)) :lblneg @105060)
(=> (SMemInv $sMem@0@@0 $sMem@@5 (+ call28646formal@$ret@0 8) esp) __L6_correct))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@9 (=> (! (and %lbl%+103994 true) :lblpos +103994) (=> (and
?DmarExists
(= edi ?DmarPtr)
(IoRootTable $IomMem@@7 ebx)
(= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)
(= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))
(forall ((i@@136 Int) ) (! (= (select $IoMmuState i@@136) 0)
 :qid |EntryMSb.317:18|
 :skolemid |270|
 :pattern ( (select $IoMmuState i@@136))
))
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 116 $sMem@@5 esp $RET@@0)) anon0_correct@@9))))
PreconditionGeneratedEntry_correct@@9))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+29525 () Bool)
(declare-fun $Efl@24 () Int)
(declare-fun $entry@4 () Int)
(declare-fun $entry@3 () Int)
(declare-fun %lbl%@109359 () Bool)
(declare-fun esi@1@@0 () Int)
(declare-fun call29419formal@$ret@0 () Int)
(declare-fun %lbl%@109390 () Bool)
(declare-fun $sMem@0@@1 () (Array Int Int))
(declare-fun call29115formal@$ret@0 () Int)
(declare-fun %lbl%@109401 () Bool)
(declare-fun %lbl%@109404 () Bool)
(declare-fun %lbl%@109420 () Bool)
(declare-fun %lbl%@109432 () Bool)
(declare-fun $entry@0@@2 () Int)
(declare-fun %lbl%+29503 () Bool)
(declare-fun $Efl@12@@0 () Int)
(declare-fun $entry@1@@2 () Int)
(declare-fun %lbl%@108093 () Bool)
(declare-fun esi@0@@0 () Int)
(declare-fun call29453formal@$ret@0 () Int)
(declare-fun %lbl%@108124 () Bool)
(declare-fun %lbl%@108135 () Bool)
(declare-fun %lbl%@108138 () Bool)
(declare-fun %lbl%@108154 () Bool)
(declare-fun %lbl%@108166 () Bool)
(declare-fun %lbl%@108215 () Bool)
(declare-fun $Mem@0@@1 () (Array Int Int))
(declare-fun %lbl%@108243 () Bool)
(declare-fun %lbl%+106473 () Bool)
(declare-fun %lbl%@109878 () Bool)
(declare-fun DmaAddr@1 () Int)
(declare-fun $IoMmuEnabled@2 () Bool)
(declare-fun %lbl%@109898 () Bool)
(declare-fun $Mem@4 () (Array Int Int))
(declare-fun $sMem@4 () (Array Int Int))
(declare-fun %lbl%@109926 () Bool)
(declare-fun esp@4 () Int)
(declare-fun %lbl%+29534 () Bool)
(declare-fun %lbl%@109601 () Bool)
(declare-fun esp@2 () Int)
(declare-fun call29463formal@$ret@0 () Int)
(declare-fun call29478formal@$oldMem@0 () (Array Int Int))
(declare-fun call29478formal@$oldSMem@0 () (Array Int Int))
(declare-fun call29478formal@$oldDMem@0 () (Array Int Int))
(declare-fun call29478formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call29478formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call29478formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call29478formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@109685 () Bool)
(declare-fun $Mem@3 () (Array Int Int))
(declare-fun $sMem@3 () (Array Int Int))
(declare-fun %lbl%@109713 () Bool)
(declare-fun %lbl%@109736 () Bool)
(declare-fun %lbl%@109746 () Bool)
(declare-fun call29481formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@109776 () Bool)
(declare-fun %lbl%@109785 () Bool)
(declare-fun esp@3 () Int)
(declare-fun DmaAddr@0 () Int)
(declare-fun $IoMmuEnabled@1 () Bool)
(declare-fun %lbl%+29527 () Bool)
(declare-fun call29406formal@$ret@0 () Int)
(declare-fun $RET@1 () T@ReturnTo)
(declare-fun $IoMmuEnabled@@0 () Bool)
(declare-fun %lbl%+29517 () Bool)
(declare-fun $Efl@17 () Int)
(declare-fun call29385formal@$ptr@0 () Int)
(declare-fun %lbl%@109220 () Bool)
(declare-fun call29385formal@$val@0 () Int)
(declare-fun call29390formal@$ptr@0 () Int)
(declare-fun %lbl%@109260 () Bool)
(declare-fun call29390formal@$val@0 () Int)
(declare-fun call29397formal@$x@0 () T@opn)
(declare-fun call29397formal@$y@0 () T@opn)
(declare-fun %lbl%@109308 () Bool)
(declare-fun %lbl%@109312 () Bool)
(declare-fun %lbl%+29515 () Bool)
(declare-fun %lbl%@108619 () Bool)
(declare-fun call29286formal@$ret@0 () Int)
(declare-fun %lbl%@108637 () Bool)
(declare-fun %lbl%@108639 () Bool)
(declare-fun %lbl%@108651 () Bool)
(declare-fun %lbl%@108654 () Bool)
(declare-fun %lbl%@108718 () Bool)
(declare-fun %lbl%@108746 () Bool)
(declare-fun $sMem@1@@0 () (Array Int Int))
(declare-fun NextEip (Int) Int)
(declare-fun $Eip@21 () Int)
(declare-fun %lbl%@108810 () Bool)
(declare-fun %lbl%@108817 () Bool)
(declare-fun esp@0@@2 () Int)
(declare-fun $RET@0 () T@ReturnTo)
(declare-fun $Mem@1@@0 () (Array Int Int))
(declare-fun %lbl%@108875 () Bool)
(declare-fun %lbl%@108877 () Bool)
(declare-fun %lbl%@108882 () Bool)
(declare-fun %lbl%@108888 () Bool)
(declare-fun %lbl%@108902 () Bool)
(declare-fun %lbl%@108920 () Bool)
(declare-fun %lbl%@108940 () Bool)
(declare-fun %lbl%@108968 () Bool)
(declare-fun $IoMmuEnabled@0 () Bool)
(declare-fun $Mem@2@@0 () (Array Int Int))
(declare-fun $sMem@2@@0 () (Array Int Int))
(declare-fun esp@1@@0 () Int)
(declare-fun call29432formal@$ptr@0 () Int)
(declare-fun %lbl%@109100 () Bool)
(declare-fun %lbl%@109128 () Bool)
(declare-fun call29437formal@$ptr@0 () Int)
(declare-fun %lbl%@109152 () Bool)
(declare-fun call29437formal@$val@0 () Int)
(declare-fun call29440formal@$ret@0 () Int)
(declare-fun %lbl%+29514 () Bool)
(declare-fun call29374formal@$x@0 () T@opn)
(declare-fun call29374formal@$y@0 () T@opn)
(declare-fun call29144formal@$ret@0 () Int)
(declare-fun %lbl%@108580 () Bool)
(declare-fun %lbl%@108584 () Bool)
(declare-fun %lbl%+29505 () Bool)
(declare-fun call29261formal@$val@0 () Int)
(declare-fun %lbl%@108283 () Bool)
(declare-fun $entry@2 () Int)
(declare-fun %lbl%@108302 () Bool)
(declare-fun call29300formal@$ret@0 () Int)
(declare-fun %lbl%@108330 () Bool)
(declare-fun %lbl%@108341 () Bool)
(declare-fun %lbl%@108344 () Bool)
(declare-fun %lbl%@108360 () Bool)
(declare-fun %lbl%@108372 () Bool)
(declare-fun %lbl%+29495 () Bool)
(declare-fun $Efl@8 () Int)
(declare-fun call29261formal@$ptr@0 () Int)
(declare-fun %lbl%@107954 () Bool)
(declare-fun call29266formal@$ptr@0 () Int)
(declare-fun %lbl%@107994 () Bool)
(declare-fun call29266formal@$val@0 () Int)
(declare-fun call29273formal@$x@0 () T@opn)
(declare-fun call29273formal@$y@0 () T@opn)
(declare-fun %lbl%@108042 () Bool)
(declare-fun %lbl%@108046 () Bool)
(declare-fun %lbl%+29493 () Bool)
(declare-fun call29459formal@$ret@0 () Int)
(declare-fun %lbl%+29492 () Bool)
(declare-fun call29250formal@$x@0 () T@opn)
(declare-fun call29250formal@$y@0 () T@opn)
(declare-fun %lbl%@107881 () Bool)
(declare-fun %lbl%@107885 () Bool)
(declare-fun %lbl%+29485 () Bool)
(declare-fun %lbl%@107090 () Bool)
(declare-fun %lbl%@107252 () Bool)
(declare-fun call29124formal@$ptr@0 () Int)
(declare-fun %lbl%@107299 () Bool)
(declare-fun %lbl%@107329 () Bool)
(declare-fun call29129formal@$ptr@0 () Int)
(declare-fun %lbl%@107393 () Bool)
(declare-fun %lbl%@107396 () Bool)
(declare-fun call29134formal@$ptr@0 () Int)
(declare-fun %lbl%@107435 () Bool)
(declare-fun call29134formal@$val@0 () Int)
(declare-fun call29137formal@$ret@0 () Int)
(declare-fun %lbl%@107490 () Bool)
(declare-fun call29141formal@$ret@0 () Int)
(declare-fun %lbl%@107548 () Bool)
(declare-fun call29152formal@$ret@0 () Int)
(declare-fun %lbl%@107576 () Bool)
(declare-fun %lbl%@107587 () Bool)
(declare-fun %lbl%@107590 () Bool)
(declare-fun %lbl%@107606 () Bool)
(declare-fun %lbl%@107618 () Bool)
(declare-fun %lbl%@107667 () Bool)
(declare-fun %lbl%@107695 () Bool)
(declare-fun %lbl%+106478 () Bool)
(push 1)
(set-info :boogie-vc-id ReadRsdt)
(assert (not
(let ((anon12_Then_correct (=> (! (and %lbl%+29525 true) :lblpos +29525) (=> (and
(Jne $Efl@24)
(= $entry@4 (+ $entry@3 1))) (and
(! (or %lbl%@109359 (word (+ esi@1@@0 4))) :lblneg @109359)
(=> (word (+ esi@1@@0 4)) (=> (= call29419formal@$ret@0 (+ esi@1@@0 4)) (and
(! (or %lbl%@109390 (= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0)))) :lblneg @109390)
(=> (= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0))) (and
(! (or %lbl%@109401 (TV $entry@4)) :lblneg @109401)
(=> (TV $entry@4) (and
(! (or %lbl%@109404 (= call29419formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@4)))) :lblneg @109404)
(=> (= call29419formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@4))) (and
(! (or %lbl%@109420 (and
(<= 0 $entry@4)
(<= $entry@4 ?RsdtCount))) :lblneg @109420)
(=> (and
(<= 0 $entry@4)
(<= $entry@4 ?RsdtCount)) (and
(! (or %lbl%@109432 (forall ((j@@27 Int) ) (! (=> (and
(TV j@@27)
(<= 0 j@@27)
(< j@@27 $entry@4)
(not (= j@@27 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@27))))))
 :qid |EntryMSb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@27))
))) :lblneg @109432)
(=> (forall ((j@@28 Int) ) (! (=> (and
(TV j@@28)
(<= 0 j@@28)
(< j@@28 $entry@4)
(not (= j@@28 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@28))))))
 :qid |EntryMSb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@28))
)) true)))))))))))))))))
(let ((anon10_Then_correct@@0 (=> (! (and %lbl%+29503 true) :lblpos +29503) (=> (and
(Jne $Efl@12@@0)
(= $entry@1@@2 (+ $entry@0@@2 1))) (and
(! (or %lbl%@108093 (word (+ esi@0@@0 4))) :lblneg @108093)
(=> (word (+ esi@0@@0 4)) (=> (= call29453formal@$ret@0 (+ esi@0@@0 4)) (and
(! (or %lbl%@108124 (= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0)))) :lblneg @108124)
(=> (= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0))) (and
(! (or %lbl%@108135 (TV $entry@1@@2)) :lblneg @108135)
(=> (TV $entry@1@@2) (and
(! (or %lbl%@108138 (= call29453formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@1@@2)))) :lblneg @108138)
(=> (= call29453formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@1@@2))) (and
(! (or %lbl%@108154 (and
(<= 0 $entry@1@@2)
(<= $entry@1@@2 ?RsdtCount))) :lblneg @108154)
(=> (and
(<= 0 $entry@1@@2)
(<= $entry@1@@2 ?RsdtCount)) (and
(! (or %lbl%@108166 (forall ((j@@29 Int) ) (! (=> (and
(TV j@@29)
(<= 0 j@@29)
(< j@@29 $entry@1@@2)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@29))))))
 :qid |EntryMSb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@29))
))) :lblneg @108166)
(=> (forall ((j@@30 Int) ) (! (=> (and
(TV j@@30)
(<= 0 j@@30)
(< j@@30 $entry@1@@2)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@30))))))
 :qid |EntryMSb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@30))
)) (and
(! (or %lbl%@108215 (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @108215)
(=> (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@108243 (SMemInv $sMem@0@@1 $sMem@@5 (+ call29115formal@$ret@0 4) esp)) :lblneg @108243)
(=> (SMemInv $sMem@0@@1 $sMem@@5 (+ call29115formal@$ret@0 4) esp) true)))))))))))))))))))))
(let ((GeneratedUnifiedExit_correct@@2 (=> (! (and %lbl%+106473 true) :lblpos +106473) (and
(! (or %lbl%@109878 (or
(and
(= DmaAddr@1 0)
(not $IoMmuEnabled@2))
(and
(= DmaAddr@1 ?dmaLo)
$IoMmuEnabled@2))) :lblneg @109878)
(=> (or
(and
(= DmaAddr@1 0)
(not $IoMmuEnabled@2))
(and
(= DmaAddr@1 ?dmaLo)
$IoMmuEnabled@2)) (and
(! (or %lbl%@109898 (MemInv $Mem@4 $sMem@4 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @109898)
(=> (MemInv $Mem@4 $sMem@4 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@109926 (SMemEnsure $sMem@4 $sMem@@5 esp@4 esp)) :lblneg @109926)
(=> (SMemEnsure $sMem@4 $sMem@@5 esp@4 esp) true)))))))))
(let ((done_correct@@0 (=> (! (and %lbl%+29534 true) :lblpos +29534) (and
(! (or %lbl%@109601 (word (+ esp@2 4))) :lblneg @109601)
(=> (word (+ esp@2 4)) (=> (and
(= call29463formal@$ret@0 (+ esp@2 4))
(= call29478formal@$oldMem@0 $Mem@@3)
(= call29478formal@$oldSMem@0 $sMem@@5)
(= call29478formal@$oldDMem@0 $dMem@@0)
(= call29478formal@$oldPciMem@0 $pciMem@@1)
(= call29478formal@$oldTMem@0 $tMems@@12)
(= call29478formal@$oldFMem@0 $fMems@@4)
(= call29478formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@109685 (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @109685)
(=> (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@109713 (MemInv call29478formal@$oldMem@0 call29478formal@$oldSMem@0 call29478formal@$oldDMem@0 call29478formal@$oldPciMem@0 call29478formal@$oldTMem@0 call29478formal@$oldFMem@0 call29478formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @109713)
(=> (MemInv call29478formal@$oldMem@0 call29478formal@$oldSMem@0 call29478formal@$oldDMem@0 call29478formal@$oldPciMem@0 call29478formal@$oldTMem@0 call29478formal@$oldFMem@0 call29478formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@109736 (= (select $sMem@3 call29463formal@$ret@0) (select call29478formal@$oldSMem@0 call29463formal@$ret@0))) :lblneg @109736)
(=> (= (select $sMem@3 call29463formal@$ret@0) (select call29478formal@$oldSMem@0 call29463formal@$ret@0)) (and
(! (or %lbl%@109746 (sAddr call29463formal@$ret@0)) :lblneg @109746)
(=> (sAddr call29463formal@$ret@0) (=> (= (select $Mem@3 call29463formal@$ret@0) (select call29478formal@$oldMem@0 call29463formal@$ret@0)) (=> (and
(= (select $Mem@3 call29463formal@$ret@0) (select $sMem@3 call29463formal@$ret@0))
(= call29481formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@109776 (= (ReturnToAddr (select $Mem@3 call29463formal@$ret@0)) call29481formal@$oldRA@0)) :lblneg @109776)
(=> (= (ReturnToAddr (select $Mem@3 call29463formal@$ret@0)) call29481formal@$oldRA@0) (and
(! (or %lbl%@109785 (Aligned call29463formal@$ret@0)) :lblneg @109785)
(=> (Aligned call29463formal@$ret@0) (=> (= esp@3 (+ call29463formal@$ret@0 4)) (=> (and
(Aligned esp@3)
(= DmaAddr@1 DmaAddr@0)) (=> (and
(= $IoMmuEnabled@2 $IoMmuEnabled@1)
(= $sMem@4 $sMem@3)
(= esp@4 esp@3)
(= $Mem@4 $Mem@3)) GeneratedUnifiedExit_correct@@2)))))))))))))))))))))))
(let ((anon12_Else_correct (=> (! (and %lbl%+29527 true) :lblpos +29527) (=> (and
(not (Jne $Efl@24))
(= call29406formal@$ret@0 0)
(= DmaAddr@0 call29406formal@$ret@0)
(= $Mem@3 $Mem@0@@1)
(= $RET@1 $RET@@0)
(= $IoMmuEnabled@1 $IoMmuEnabled@@0)
(= esp@2 call29115formal@$ret@0)
(= $sMem@3 $sMem@0@@1)) done_correct@@0))))
(let ((anon11_Else_correct (=> (! (and %lbl%+29517 true) :lblpos +29517) (=> (and
(not (Jae $Efl@17))
(= call29385formal@$ptr@0 (+ esi@1@@0 0))) (and
(! (or %lbl%@109220 (inRo call29385formal@$ptr@0 4)) :lblneg @109220)
(=> (inRo call29385formal@$ptr@0 4) (=> (word call29385formal@$val@0) (=> (and
(= call29385formal@$val@0 (ro32 call29385formal@$ptr@0))
(= call29390formal@$ptr@0 (+ call29385formal@$val@0 0))) (and
(! (or %lbl%@109260 (inRo call29390formal@$ptr@0 4)) :lblneg @109260)
(=> (inRo call29390formal@$ptr@0 4) (=> (and
(word call29390formal@$val@0)
(= call29390formal@$val@0 (ro32 call29390formal@$ptr@0))
(= call29397formal@$x@0 (OpnReg call29390formal@$val@0))
(= call29397formal@$y@0 (OpnReg 1380011332))) (and
(! (or %lbl%@109308 (OpnOk $Mem@0@@1 call29397formal@$x@0)) :lblneg @109308)
(=> (OpnOk $Mem@0@@1 call29397formal@$x@0) (and
(! (or %lbl%@109312 (OpnOk $Mem@0@@1 call29397formal@$y@0)) :lblneg @109312)
(=> (OpnOk $Mem@0@@1 call29397formal@$y@0) (=> (FlagsCmp $Efl@24 (EvalOpn $Mem@0@@1 call29397formal@$x@0) (EvalOpn $Mem@0@@1 call29397formal@$y@0)) (and
anon12_Then_correct
anon12_Else_correct)))))))))))))))))
(let ((anon11_Then_correct (=> (! (and %lbl%+29515 true) :lblpos +29515) (=> (Jae $Efl@17) (and
(! (or %lbl%@108619 (= call29286formal@$ret@0 (ro32 (+ (+ ?RsdtPtr 36) (* 4 $entry@0@@2))))) :lblneg @108619)
(=> (= call29286formal@$ret@0 (ro32 (+ (+ ?RsdtPtr 36) (* 4 $entry@0@@2)))) (and
(! (or %lbl%@108637 ?RsdpExists) :lblneg @108637)
(=> ?RsdpExists (and
(! (or %lbl%@108639 (and
(<= 0 $entry@0@@2)
(< $entry@0@@2 ?RsdtCount))) :lblneg @108639)
(=> (and
(<= 0 $entry@0@@2)
(< $entry@0@@2 ?RsdtCount)) (and
(! (or %lbl%@108651 (MatchesDmar call29286formal@$ret@0)) :lblneg @108651)
(=> (MatchesDmar call29286formal@$ret@0) (and
(! (or %lbl%@108654 (forall ((j@@31 Int) ) (! (=> (and
(TV j@@31)
(<= 0 j@@31)
(< j@@31 ?RsdtCount)
(not (= $entry@0@@2 j@@31))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@31))))))
 :qid |Ioibpl.125:20|
 :skolemid |32|
 :pattern ( (TV j@@31))
))) :lblneg @108654)
(=> (forall ((j@@32 Int) ) (! (=> (and
(TV j@@32)
(<= 0 j@@32)
(< j@@32 ?RsdtCount)
(not (= $entry@0@@2 j@@32))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@32))))))
 :qid |Ioibpl.125:20|
 :skolemid |32|
 :pattern ( (TV j@@32))
)) (=> (and
?DmarExists
(= ?DmarPtr call29286formal@$ret@0)) (and
(! (or %lbl%@108718 (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @108718)
(=> (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@108746 (sAddr (- call29115formal@$ret@0 4))) :lblneg @108746)
(=> (sAddr (- call29115formal@$ret@0 4)) (=> (and
(= $sMem@1@@0 (store $sMem@0@@1 (- call29115formal@$ret@0 4) (NextEip $Eip@21)))
(MemInv (store $Mem@0@@1 (- call29115formal@$ret@0 4) (NextEip $Eip@21)) $sMem@1@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (and
(! (or %lbl%@108810 (memAddr (- call29115formal@$ret@0 4))) :lblneg @108810)
(=> (memAddr (- call29115formal@$ret@0 4)) (and
(! (or %lbl%@108817 (Aligned call29115formal@$ret@0)) :lblneg @108817)
(=> (Aligned call29115formal@$ret@0) (=> (and
(= esp@0@@2 (- call29115formal@$ret@0 4))
(Aligned esp@0@@2)
(= $RET@0 (ReturnToAddr (NextEip $Eip@21)))
(= $Mem@1@@0 (store $Mem@0@@1 esp@0@@2 (NextEip $Eip@21)))) (and
(! (or %lbl%@108875 ?DmarExists) :lblneg @108875)
(=> ?DmarExists (and
(! (or %lbl%@108877 (= call29286formal@$ret@0 ?DmarPtr)) :lblneg @108877)
(=> (= call29286formal@$ret@0 ?DmarPtr) (and
(! (or %lbl%@108882 (IoRootTable $IomMem@@7 ebx)) :lblneg @108882)
(=> (IoRootTable $IomMem@@7 ebx) (and
(! (or %lbl%@108888 (= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)) :lblneg @108888)
(=> (= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE) (and
(! (or %lbl%@108902 (= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) :lblneg @108902)
(=> (= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo)) (and
(! (or %lbl%@108920 (forall ((i@@137 Int) ) (! (= (select $IoMmuState i@@137) 0)
 :qid |EntryMSb.317:18|
 :skolemid |270|
 :pattern ( (select $IoMmuState i@@137))
))) :lblneg @108920)
(=> (forall ((i@@138 Int) ) (! (= (select $IoMmuState i@@138) 0)
 :qid |EntryMSb.317:18|
 :skolemid |270|
 :pattern ( (select $IoMmuState i@@138))
)) (and
(! (or %lbl%@108940 (MemInv $Mem@1@@0 $sMem@1@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @108940)
(=> (MemInv $Mem@1@@0 $sMem@1@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@108968 (SMemRequireRA 116 $sMem@1@@0 esp@0@@2 $RET@0)) :lblneg @108968)
(=> (SMemRequireRA 116 $sMem@1@@0 esp@0@@2 $RET@0) (=> (and
$IoMmuEnabled@0
(MemInv $Mem@2@@0 $sMem@2@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemEnsure $sMem@2@@0 $sMem@1@@0 esp@1@@0 esp@0@@2)
(= call29432formal@$ptr@0 (+ esp@1@@0 0))) (and
(! (or %lbl%@109100 (MemInv $Mem@2@@0 $sMem@2@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @109100)
(=> (MemInv $Mem@2@@0 $sMem@2@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@109128 (sAddr call29432formal@$ptr@0)) :lblneg @109128)
(=> (sAddr call29432formal@$ptr@0) (=> (and
(= (select $Mem@2@@0 call29432formal@$ptr@0) (select $sMem@2@@0 call29432formal@$ptr@0))
(= call29437formal@$ptr@0 (+ esp@1@@0 0))) (and
(! (or %lbl%@109152 (PtrOk call29437formal@$ptr@0)) :lblneg @109152)
(=> (PtrOk call29437formal@$ptr@0) (=> (word call29437formal@$val@0) (=> (and
(= call29437formal@$val@0 (select $Mem@2@@0 call29437formal@$ptr@0))
(= call29440formal@$ret@0 call29437formal@$val@0)
(= DmaAddr@0 call29440formal@$ret@0)
(= $Mem@3 $Mem@2@@0)
(= $RET@1 $RET@0)
(= $IoMmuEnabled@1 $IoMmuEnabled@0)
(= esp@2 esp@1@@0)
(= $sMem@3 $sMem@2@@0)) done_correct@@0)))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((__L13_correct (=> (! (and %lbl%+29514 true) :lblpos +29514) (=> (and
(not $IoMmuEnabled@@0)
(<= 0 $entry@0@@2)
(<= 1 $entry@3)
(= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0)))
(TV $entry@3)
(= esi@1@@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@3)))
(<= 0 $entry@3)
(<= $entry@3 ?RsdtCount)
(forall ((j@@33 Int) ) (! (=> (and
(TV j@@33)
(<= 0 j@@33)
(< j@@33 $entry@3)
(not (= j@@33 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@33))))))
 :qid |EntryMSb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@33))
))
(= call29374formal@$x@0 (OpnReg esi@1@@0))
(= call29374formal@$y@0 (OpnReg call29144formal@$ret@0))) (and
(! (or %lbl%@108580 (OpnOk $Mem@0@@1 call29374formal@$x@0)) :lblneg @108580)
(=> (OpnOk $Mem@0@@1 call29374formal@$x@0) (and
(! (or %lbl%@108584 (OpnOk $Mem@0@@1 call29374formal@$y@0)) :lblneg @108584)
(=> (OpnOk $Mem@0@@1 call29374formal@$y@0) (=> (FlagsCmp $Efl@17 (EvalOpn $Mem@0@@1 call29374formal@$x@0) (EvalOpn $Mem@0@@1 call29374formal@$y@0)) (and
anon11_Then_correct
anon11_Else_correct))))))))))
(let ((anon10_Else_correct@@0 (=> (! (and %lbl%+29505 true) :lblpos +29505) (=> (and
(not (Jne $Efl@12@@0))
(= call29286formal@$ret@0 call29261formal@$val@0)) (and
(! (or %lbl%@108283 (MatchesDmar call29286formal@$ret@0)) :lblneg @108283)
(=> (MatchesDmar call29286formal@$ret@0) (=> (= $entry@2 (+ $entry@0@@2 1)) (and
(! (or %lbl%@108302 (word (+ esi@0@@0 4))) :lblneg @108302)
(=> (word (+ esi@0@@0 4)) (=> (= call29300formal@$ret@0 (+ esi@0@@0 4)) (and
(! (or %lbl%@108330 (= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0)))) :lblneg @108330)
(=> (= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0))) (and
(! (or %lbl%@108341 (TV $entry@2)) :lblneg @108341)
(=> (TV $entry@2) (and
(! (or %lbl%@108344 (= call29300formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@2)))) :lblneg @108344)
(=> (= call29300formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@2))) (and
(! (or %lbl%@108360 (and
(<= 0 $entry@2)
(<= $entry@2 ?RsdtCount))) :lblneg @108360)
(=> (and
(<= 0 $entry@2)
(<= $entry@2 ?RsdtCount)) (and
(! (or %lbl%@108372 (forall ((j@@34 Int) ) (! (=> (and
(TV j@@34)
(<= 0 j@@34)
(< j@@34 $entry@2)
(not (= j@@34 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@34))))))
 :qid |EntryMSb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@34))
))) :lblneg @108372)
(=> (forall ((j@@35 Int) ) (! (=> (and
(TV j@@35)
(<= 0 j@@35)
(< j@@35 $entry@2)
(not (= j@@35 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@35))))))
 :qid |EntryMSb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@35))
)) __L13_correct))))))))))))))))))))
(let ((anon9_Else_correct@@0 (=> (! (and %lbl%+29495 true) :lblpos +29495) (=> (and
(not (Jae $Efl@8))
(= call29261formal@$ptr@0 (+ esi@0@@0 0))) (and
(! (or %lbl%@107954 (inRo call29261formal@$ptr@0 4)) :lblneg @107954)
(=> (inRo call29261formal@$ptr@0 4) (=> (word call29261formal@$val@0) (=> (and
(= call29261formal@$val@0 (ro32 call29261formal@$ptr@0))
(= call29266formal@$ptr@0 (+ call29261formal@$val@0 0))) (and
(! (or %lbl%@107994 (inRo call29266formal@$ptr@0 4)) :lblneg @107994)
(=> (inRo call29266formal@$ptr@0 4) (=> (and
(word call29266formal@$val@0)
(= call29266formal@$val@0 (ro32 call29266formal@$ptr@0))
(= call29273formal@$x@0 (OpnReg call29266formal@$val@0))
(= call29273formal@$y@0 (OpnReg 1380011332))) (and
(! (or %lbl%@108042 (OpnOk $Mem@0@@1 call29273formal@$x@0)) :lblneg @108042)
(=> (OpnOk $Mem@0@@1 call29273formal@$x@0) (and
(! (or %lbl%@108046 (OpnOk $Mem@0@@1 call29273formal@$y@0)) :lblneg @108046)
(=> (OpnOk $Mem@0@@1 call29273formal@$y@0) (=> (FlagsCmp $Efl@12@@0 (EvalOpn $Mem@0@@1 call29273formal@$x@0) (EvalOpn $Mem@0@@1 call29273formal@$y@0)) (and
anon10_Then_correct@@0
anon10_Else_correct@@0)))))))))))))))))
(let ((anon9_Then_correct@@0 (=> (! (and %lbl%+29493 true) :lblpos +29493) (=> (and
(Jae $Efl@8)
(= call29459formal@$ret@0 0)
(= DmaAddr@0 call29459formal@$ret@0)
(= $Mem@3 $Mem@0@@1)
(= $RET@1 $RET@@0)
(= $IoMmuEnabled@1 $IoMmuEnabled@@0)
(= esp@2 call29115formal@$ret@0)
(= $sMem@3 $sMem@0@@1)) done_correct@@0))))
(let ((__L10_correct (=> (! (and %lbl%+29492 true) :lblpos +29492) (=> (and
(not $IoMmuEnabled@@0)
(<= 0 $entry@0@@2)
(= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0)))
(TV $entry@0@@2)
(= esi@0@@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@0@@2)))
(<= 0 $entry@0@@2)
(<= $entry@0@@2 ?RsdtCount)
(forall ((j@@36 Int) ) (! (=> (and
(TV j@@36)
(<= 0 j@@36)
(< j@@36 $entry@0@@2)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@36))))))
 :qid |EntryMSb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@36))
))
(MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemInv $sMem@0@@1 $sMem@@5 (+ call29115formal@$ret@0 4) esp)
(= call29250formal@$x@0 (OpnReg esi@0@@0))
(= call29250formal@$y@0 (OpnReg call29144formal@$ret@0))) (and
(! (or %lbl%@107881 (OpnOk $Mem@0@@1 call29250formal@$x@0)) :lblneg @107881)
(=> (OpnOk $Mem@0@@1 call29250formal@$x@0) (and
(! (or %lbl%@107885 (OpnOk $Mem@0@@1 call29250formal@$y@0)) :lblneg @107885)
(=> (OpnOk $Mem@0@@1 call29250formal@$y@0) (=> (FlagsCmp $Efl@8 (EvalOpn $Mem@0@@1 call29250formal@$x@0) (EvalOpn $Mem@0@@1 call29250formal@$y@0)) (and
anon9_Then_correct@@0
anon9_Else_correct@@0))))))))))
(let ((anon0_correct@@10 (=> (! (and %lbl%+29485 true) :lblpos +29485) (and
(! (or %lbl%@107090 (Aligned esp)) :lblneg @107090)
(=> (Aligned esp) (=> (and
(Aligned (- esp 4))
(Aligned (- esp 8))
(Aligned (- esp 12))
(Aligned (- esp 16))
(Aligned (- esp 20))
(Aligned (- esp 24))
(Aligned (- esp 28))
(Aligned (- esp 32))
(Aligned (- esp 36))
(Aligned (- esp 40))
(Aligned (- esp 44))
(Aligned (- esp 48))
(Aligned (- esp 52))
(Aligned (- esp 56))
(Aligned (- esp 60))
(Aligned (- esp 64))) (and
(! (or %lbl%@107252 (word (- esp 4))) :lblneg @107252)
(=> (word (- esp 4)) (=> (and
(= call29115formal@$ret@0 (- esp 4))
(= call29124formal@$ptr@0 (+ call29115formal@$ret@0 0))) (and
(! (or %lbl%@107299 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @107299)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@107329 (sAddr call29124formal@$ptr@0)) :lblneg @107329)
(=> (sAddr call29124formal@$ptr@0) (=> (MemInv (store $Mem@@3 call29124formal@$ptr@0 ebp) $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0@@1 (store $sMem@@5 call29124formal@$ptr@0 ebp))
(= call29129formal@$ptr@0 (+ call29115formal@$ret@0 0))) (and
(! (or %lbl%@107393 (PtrOk call29129formal@$ptr@0)) :lblneg @107393)
(=> (PtrOk call29129formal@$ptr@0) (and
(! (or %lbl%@107396 (word ebp)) :lblneg @107396)
(=> (word ebp) (=> (and
(= $Mem@0@@1 (store $Mem@@3 call29129formal@$ptr@0 ebp))
(= call29134formal@$ptr@0 (+ esi 4))) (and
(! (or %lbl%@107435 (inRo call29134formal@$ptr@0 4)) :lblneg @107435)
(=> (inRo call29134formal@$ptr@0 4) (=> (word call29134formal@$val@0) (=> (and
(= call29134formal@$val@0 (ro32 call29134formal@$ptr@0))
(= call29137formal@$ret@0 esi)) (and
(! (or %lbl%@107490 (word (+ call29137formal@$ret@0 call29134formal@$val@0))) :lblneg @107490)
(=> (word (+ call29137formal@$ret@0 call29134formal@$val@0)) (=> (and
(= call29141formal@$ret@0 (+ call29137formal@$ret@0 call29134formal@$val@0))
(= call29144formal@$ret@0 call29141formal@$ret@0)) (and
(! (or %lbl%@107548 (word (+ esi 36))) :lblneg @107548)
(=> (word (+ esi 36)) (=> (= call29152formal@$ret@0 (+ esi 36)) (and
(! (or %lbl%@107576 (= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0)))) :lblneg @107576)
(=> (= ebp (select $sMem@0@@1 (+ call29115formal@$ret@0 0))) (and
(! (or %lbl%@107587 (TV 0)) :lblneg @107587)
(=> (TV 0) (and
(! (or %lbl%@107590 (= call29152formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 0)))) :lblneg @107590)
(=> (= call29152formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 0))) (and
(! (or %lbl%@107606 (and
(<= 0 0)
(<= 0 ?RsdtCount))) :lblneg @107606)
(=> (and
(<= 0 0)
(<= 0 ?RsdtCount)) (and
(! (or %lbl%@107618 (forall ((j@@37 Int) ) (! (=> (and
(TV j@@37)
(<= 0 j@@37)
(< j@@37 0)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@37))))))
 :qid |EntryMSb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@37))
))) :lblneg @107618)
(=> (forall ((j@@38 Int) ) (! (=> (and
(TV j@@38)
(<= 0 j@@38)
(< j@@38 0)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@38))))))
 :qid |EntryMSb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@38))
)) (and
(! (or %lbl%@107667 (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @107667)
(=> (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@107695 (SMemInv $sMem@0@@1 $sMem@@5 (+ call29115formal@$ret@0 4) esp)) :lblneg @107695)
(=> (SMemInv $sMem@0@@1 $sMem@@5 (+ call29115formal@$ret@0 4) esp) __L10_correct))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@10 (=> (! (and %lbl%+106478 true) :lblpos +106478) (=> ?RsdpExists (=> (and
(not $IoMmuEnabled@@0)
(= esi ?RsdtPtr)) (=> (and
(= ebp ?dmaLo)
(word ebp)
(IoRootTable $IomMem@@7 ebx)
(= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)
(= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))
(forall ((i@@139 Int) ) (! (= (select $IoMmuState i@@139) 0)
 :qid |EntryMSb.387:18|
 :skolemid |273|
 :pattern ( (select $IoMmuState i@@139))
))
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 124 $sMem@@5 esp $RET@@0)) anon0_correct@@10))))))
PreconditionGeneratedEntry_correct@@10))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+30011 () Bool)
(declare-fun $Efl@17@@0 () Int)
(declare-fun %lbl%@111934 () Bool)
(declare-fun edi@1 () Int)
(declare-fun call29876formal@$val@0 () Int)
(declare-fun ebp@1 () Int)
(declare-fun call29880formal@$ret@0 () Int)
(declare-fun %lbl%@112000 () Bool)
(declare-fun call29884formal@$ret@0 () Int)
(declare-fun %lbl%@112031 () Bool)
(declare-fun $sMem@0@@2 () (Array Int Int))
(declare-fun call29674formal@$ret@0 () Int)
(declare-fun %lbl%@112042 () Bool)
(declare-fun esi@0@@1 () Int)
(declare-fun %lbl%@112050 () Bool)
(declare-fun %lbl%@112064 () Bool)
(declare-fun %lbl%+30028 () Bool)
(declare-fun $entry@1@@3 () Int)
(declare-fun $entry@0@@3 () Int)
(declare-fun %lbl%@112998 () Bool)
(declare-fun call29937formal@$ret@0 () Int)
(declare-fun %lbl%@113031 () Bool)
(declare-fun %lbl%@113042 () Bool)
(declare-fun %lbl%@113045 () Bool)
(declare-fun %lbl%@113057 () Bool)
(declare-fun %lbl%@113073 () Bool)
(declare-fun %lbl%+30027 () Bool)
(declare-fun %lbl%+30020 () Bool)
(declare-fun $Efl@19 () Int)
(declare-fun %lbl%+29997 () Bool)
(declare-fun $Efl@11 () Int)
(declare-fun %lbl%+29987 () Bool)
(declare-fun $Efl@10@@0 () Int)
(declare-fun %lbl%+110049 () Bool)
(declare-fun %lbl%@113188 () Bool)
(declare-fun DmaAddr@2 () Int)
(declare-fun $IoMmuEnabled@2@@0 () Bool)
(declare-fun %lbl%@113208 () Bool)
(declare-fun $Mem@4@@0 () (Array Int Int))
(declare-fun $sMem@4@@0 () (Array Int Int))
(declare-fun %lbl%@113236 () Bool)
(declare-fun esp@4@@0 () Int)
(declare-fun %lbl%+30031 () Bool)
(declare-fun %lbl%@112769 () Bool)
(declare-fun esp@2@@0 () Int)
(declare-fun call29947formal@$ret@0 () Int)
(declare-fun call29962formal@$oldMem@0 () (Array Int Int))
(declare-fun call29962formal@$oldSMem@0 () (Array Int Int))
(declare-fun call29962formal@$oldDMem@0 () (Array Int Int))
(declare-fun call29962formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call29962formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call29962formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call29962formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@112853 () Bool)
(declare-fun $Mem@3@@0 () (Array Int Int))
(declare-fun $sMem@3@@0 () (Array Int Int))
(declare-fun %lbl%@112881 () Bool)
(declare-fun %lbl%@112904 () Bool)
(declare-fun %lbl%@112914 () Bool)
(declare-fun call29965formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@112944 () Bool)
(declare-fun %lbl%@112953 () Bool)
(declare-fun esp@3@@0 () Int)
(declare-fun $IoMmuEnabled@1@@0 () Bool)
(declare-fun DmaAddr@1@@0 () Int)
(declare-fun %lbl%+30022 () Bool)
(declare-fun %lbl%@112085 () Bool)
(declare-fun %lbl%@112097 () Bool)
(declare-fun %lbl%@112100 () Bool)
(declare-fun %lbl%@112103 () Bool)
(declare-fun call29912formal@$ptr@0 () Int)
(declare-fun %lbl%@112170 () Bool)
(declare-fun call29912formal@$val@0 () Int)
(declare-fun call29916formal@$ptr@0 () Int)
(declare-fun %lbl%@112210 () Bool)
(declare-fun $Mem@0@@2 () (Array Int Int))
(declare-fun %lbl%@112238 () Bool)
(declare-fun call29921formal@$ptr@0 () Int)
(declare-fun %lbl%@112262 () Bool)
(declare-fun call29921formal@$val@0 () Int)
(declare-fun %lbl%@112290 () Bool)
(declare-fun %lbl%@112318 () Bool)
(declare-fun $sMem@1@@1 () (Array Int Int))
(declare-fun $Eip@30 () Int)
(declare-fun %lbl%@112382 () Bool)
(declare-fun %lbl%@112389 () Bool)
(declare-fun esp@0@@3 () Int)
(declare-fun $RET@0@@0 () T@ReturnTo)
(declare-fun $Mem@1@@1 () (Array Int Int))
(declare-fun %lbl%@112447 () Bool)
(declare-fun %lbl%@112449 () Bool)
(declare-fun %lbl%@112453 () Bool)
(declare-fun %lbl%@112458 () Bool)
(declare-fun %lbl%@112468 () Bool)
(declare-fun %lbl%@112474 () Bool)
(declare-fun %lbl%@112488 () Bool)
(declare-fun %lbl%@112506 () Bool)
(declare-fun %lbl%@112526 () Bool)
(declare-fun %lbl%@112554 () Bool)
(declare-fun DmaAddr@0@@0 () Int)
(declare-fun $IoMmuEnabled@0@@0 () Bool)
(declare-fun $Mem@2@@1 () (Array Int Int))
(declare-fun $sMem@2@@1 () (Array Int Int))
(declare-fun esp@1@@1 () Int)
(declare-fun $RET@2 () T@ReturnTo)
(declare-fun $RET@1@@0 () T@ReturnTo)
(declare-fun %lbl%+30009 () Bool)
(declare-fun call29891formal@$ret@0 () Int)
(declare-fun call29898formal@$x@0 () T@opn)
(declare-fun call29898formal@$y@0 () T@opn)
(declare-fun %lbl%@111895 () Bool)
(declare-fun %lbl%@111899 () Bool)
(declare-fun %lbl%+30008 () Bool)
(declare-fun call29856formal@$ret@0 () Int)
(declare-fun %lbl%@111765 () Bool)
(declare-fun call29860formal@$ret@0 () Int)
(declare-fun call29867formal@$x@0 () T@opn)
(declare-fun call29867formal@$y@0 () T@opn)
(declare-fun %lbl%@111811 () Bool)
(declare-fun %lbl%@111815 () Bool)
(declare-fun %lbl%+29999 () Bool)
(declare-fun call29817formal@$ret@0 () Int)
(declare-fun call29820formal@$ret@0 () Int)
(declare-fun %lbl%@111619 () Bool)
(declare-fun %lbl%@111630 () Bool)
(declare-fun %lbl%@111638 () Bool)
(declare-fun %lbl%@111652 () Bool)
(declare-fun %lbl%+29989 () Bool)
(declare-fun call29808formal@$x@0 () T@opn)
(declare-fun call29788formal@$val@0 () Int)
(declare-fun call29808formal@$y@0 () T@opn)
(declare-fun %lbl%@111536 () Bool)
(declare-fun %lbl%@111540 () Bool)
(declare-fun %lbl%+29979 () Bool)
(declare-fun $Efl@6@@1 () Int)
(declare-fun call29783formal@$ptr@0 () Int)
(declare-fun %lbl%@111389 () Bool)
(declare-fun call29783formal@$val@0 () Int)
(declare-fun call29788formal@$ptr@0 () Int)
(declare-fun %lbl%@111429 () Bool)
(declare-fun call29795formal@$x@0 () T@opn)
(declare-fun call29795formal@$y@0 () T@opn)
(declare-fun %lbl%@111477 () Bool)
(declare-fun %lbl%@111481 () Bool)
(declare-fun %lbl%+29977 () Bool)
(declare-fun call29943formal@$ret@0 () Int)
(declare-fun %lbl%+29976 () Bool)
(declare-fun call29761formal@$ret@0 () Int)
(declare-fun %lbl%@111270 () Bool)
(declare-fun call29765formal@$ret@0 () Int)
(declare-fun call29772formal@$x@0 () T@opn)
(declare-fun call29772formal@$y@0 () T@opn)
(declare-fun %lbl%@111316 () Bool)
(declare-fun %lbl%@111320 () Bool)
(declare-fun %lbl%+29969 () Bool)
(declare-fun %lbl%@110658 () Bool)
(declare-fun %lbl%@110820 () Bool)
(declare-fun call29683formal@$ptr@0 () Int)
(declare-fun %lbl%@110867 () Bool)
(declare-fun %lbl%@110897 () Bool)
(declare-fun call29688formal@$ptr@0 () Int)
(declare-fun %lbl%@110961 () Bool)
(declare-fun %lbl%@110964 () Bool)
(declare-fun call29695formal@$ret@0 () Int)
(declare-fun %lbl%@111016 () Bool)
(declare-fun %lbl%@111027 () Bool)
(declare-fun %lbl%@111030 () Bool)
(declare-fun %lbl%@111042 () Bool)
(declare-fun %lbl%@111058 () Bool)
(declare-fun %lbl%+110054 () Bool)
(push 1)
(set-info :boogie-vc-id StartIoMmu)
(assert (not
(let ((anon14_Else_correct (=> (! (and %lbl%+30011 true) :lblpos +30011) (=> (not (Jae $Efl@17@@0)) (and
(! (or %lbl%@111934 (inRo edi@1 1)) :lblneg @111934)
(=> (inRo edi@1 1) (=> (and
(word call29876formal@$val@0)
(= call29876formal@$val@0 (roU8 edi@1))
(word (+ ebp@1 call29876formal@$val@0))
(= call29880formal@$ret@0 (+ ebp@1 call29876formal@$val@0))) (and
(! (or %lbl%@112000 (word (+ edi@1 1))) :lblneg @112000)
(=> (word (+ edi@1 1)) (=> (= call29884formal@$ret@0 (+ edi@1 1)) (and
(! (or %lbl%@112031 (= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0)))) :lblneg @112031)
(=> (= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0))) (and
(! (or %lbl%@112042 (and
(TV esi@0@@1)
(TV call29884formal@$ret@0))) :lblneg @112042)
(=> (and
(TV esi@0@@1)
(TV call29884formal@$ret@0)) (and
(! (or %lbl%@112050 (and
(<= esi@0@@1 call29884formal@$ret@0)
(<= call29884formal@$ret@0 (+ esi@0@@1 20)))) :lblneg @112050)
(=> (and
(<= esi@0@@1 call29884formal@$ret@0)
(<= call29884formal@$ret@0 (+ esi@0@@1 20))) (and
(! (or %lbl%@112064 (= call29880formal@$ret@0 (ByteSum esi@0@@1 call29884formal@$ret@0))) :lblneg @112064)
(=> (= call29880formal@$ret@0 (ByteSum esi@0@@1 call29884formal@$ret@0)) true))))))))))))))))))
(let ((__L18_correct (=> (! (and %lbl%+30028 true) :lblpos +30028) (=> (= $entry@1@@3 (+ $entry@0@@3 1)) (and
(! (or %lbl%@112998 (word (+ esi@0@@1 16))) :lblneg @112998)
(=> (word (+ esi@0@@1 16)) (=> (= call29937formal@$ret@0 (+ esi@0@@1 16)) (and
(! (or %lbl%@113031 (= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0)))) :lblneg @113031)
(=> (= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0))) (and
(! (or %lbl%@113042 (TV $entry@1@@3)) :lblneg @113042)
(=> (TV $entry@1@@3) (and
(! (or %lbl%@113045 (= call29937formal@$ret@0 (+ ?RoBiosLo (* 16 $entry@1@@3)))) :lblneg @113045)
(=> (= call29937formal@$ret@0 (+ ?RoBiosLo (* 16 $entry@1@@3))) (and
(! (or %lbl%@113057 (and
(<= ?RoBiosLo call29937formal@$ret@0)
(<= call29937formal@$ret@0 (- ?RoBiosHi 16)))) :lblneg @113057)
(=> (and
(<= ?RoBiosLo call29937formal@$ret@0)
(<= call29937formal@$ret@0 (- ?RoBiosHi 16))) (and
(! (or %lbl%@113073 (forall ((j@@39 Int) ) (! (=> (and
(TV j@@39)
(< j@@39 $entry@1@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@39)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@39)))))
 :qid |EntryMSb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@39))
))) :lblneg @113073)
(=> (forall ((j@@40 Int) ) (! (=> (and
(TV j@@40)
(< j@@40 $entry@1@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@40)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@40)))))
 :qid |EntryMSb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@40))
)) true)))))))))))))))))
(let ((__L19_correct (=> (! (and %lbl%+30027 true) :lblpos +30027) __L18_correct)))
(let ((anon15_Then_correct (=> (! (and %lbl%+30020 true) :lblpos +30020) (=> (Jne $Efl@19) __L19_correct))))
(let ((anon13_Then_correct (=> (! (and %lbl%+29997 true) :lblpos +29997) (=> (Jne $Efl@11) __L18_correct))))
(let ((anon12_Then_correct@@0 (=> (! (and %lbl%+29987 true) :lblpos +29987) (=> (Jne $Efl@10@@0) __L18_correct))))
(let ((GeneratedUnifiedExit_correct@@3 (=> (! (and %lbl%+110049 true) :lblpos +110049) (and
(! (or %lbl%@113188 (or
(and
(= DmaAddr@2 0)
(not $IoMmuEnabled@2@@0))
(and
(= DmaAddr@2 ?dmaLo)
$IoMmuEnabled@2@@0))) :lblneg @113188)
(=> (or
(and
(= DmaAddr@2 0)
(not $IoMmuEnabled@2@@0))
(and
(= DmaAddr@2 ?dmaLo)
$IoMmuEnabled@2@@0)) (and
(! (or %lbl%@113208 (MemInv $Mem@4@@0 $sMem@4@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @113208)
(=> (MemInv $Mem@4@@0 $sMem@4@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@113236 (SMemEnsure $sMem@4@@0 $sMem@@5 esp@4@@0 esp)) :lblneg @113236)
(=> (SMemEnsure $sMem@4@@0 $sMem@@5 esp@4@@0 esp) true)))))))))
(let ((done_correct@@1 (=> (! (and %lbl%+30031 true) :lblpos +30031) (and
(! (or %lbl%@112769 (word (+ esp@2@@0 4))) :lblneg @112769)
(=> (word (+ esp@2@@0 4)) (=> (and
(= call29947formal@$ret@0 (+ esp@2@@0 4))
(= call29962formal@$oldMem@0 $Mem@@3)
(= call29962formal@$oldSMem@0 $sMem@@5)
(= call29962formal@$oldDMem@0 $dMem@@0)
(= call29962formal@$oldPciMem@0 $pciMem@@1)
(= call29962formal@$oldTMem@0 $tMems@@12)
(= call29962formal@$oldFMem@0 $fMems@@4)
(= call29962formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@112853 (MemInv $Mem@3@@0 $sMem@3@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112853)
(=> (MemInv $Mem@3@@0 $sMem@3@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112881 (MemInv call29962formal@$oldMem@0 call29962formal@$oldSMem@0 call29962formal@$oldDMem@0 call29962formal@$oldPciMem@0 call29962formal@$oldTMem@0 call29962formal@$oldFMem@0 call29962formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112881)
(=> (MemInv call29962formal@$oldMem@0 call29962formal@$oldSMem@0 call29962formal@$oldDMem@0 call29962formal@$oldPciMem@0 call29962formal@$oldTMem@0 call29962formal@$oldFMem@0 call29962formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112904 (= (select $sMem@3@@0 call29947formal@$ret@0) (select call29962formal@$oldSMem@0 call29947formal@$ret@0))) :lblneg @112904)
(=> (= (select $sMem@3@@0 call29947formal@$ret@0) (select call29962formal@$oldSMem@0 call29947formal@$ret@0)) (and
(! (or %lbl%@112914 (sAddr call29947formal@$ret@0)) :lblneg @112914)
(=> (sAddr call29947formal@$ret@0) (=> (= (select $Mem@3@@0 call29947formal@$ret@0) (select call29962formal@$oldMem@0 call29947formal@$ret@0)) (=> (and
(= (select $Mem@3@@0 call29947formal@$ret@0) (select $sMem@3@@0 call29947formal@$ret@0))
(= call29965formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@112944 (= (ReturnToAddr (select $Mem@3@@0 call29947formal@$ret@0)) call29965formal@$oldRA@0)) :lblneg @112944)
(=> (= (ReturnToAddr (select $Mem@3@@0 call29947formal@$ret@0)) call29965formal@$oldRA@0) (and
(! (or %lbl%@112953 (Aligned call29947formal@$ret@0)) :lblneg @112953)
(=> (Aligned call29947formal@$ret@0) (=> (= esp@3@@0 (+ call29947formal@$ret@0 4)) (=> (and
(Aligned esp@3@@0)
(= $IoMmuEnabled@2@@0 $IoMmuEnabled@1@@0)) (=> (and
(= esp@4@@0 esp@3@@0)
(= $sMem@4@@0 $sMem@3@@0)
(= $Mem@4@@0 $Mem@3@@0)
(= DmaAddr@2 DmaAddr@1@@0)) GeneratedUnifiedExit_correct@@3)))))))))))))))))))))))
(let ((anon15_Else_correct (=> (! (and %lbl%+30022 true) :lblpos +30022) (=> (not (Jne $Efl@19)) (and
(! (or %lbl%@112085 (= esi@0@@1 (+ ?RoBiosLo (* 16 $entry@0@@3)))) :lblneg @112085)
(=> (= esi@0@@1 (+ ?RoBiosLo (* 16 $entry@0@@3))) (and
(! (or %lbl%@112097 (inBiosRo esi@0@@1)) :lblneg @112097)
(=> (inBiosRo esi@0@@1) (and
(! (or %lbl%@112100 (MatchesRsdp esi@0@@1)) :lblneg @112100)
(=> (MatchesRsdp esi@0@@1) (and
(! (or %lbl%@112103 (forall ((j@@41 Int) ) (! (=> (and
(TV j@@41)
(< j@@41 $entry@0@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@41)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@41)))))
 :qid |Ioibpl.115:20|
 :skolemid |31|
 :pattern ( (TV j@@41))
))) :lblneg @112103)
(=> (forall ((j@@42 Int) ) (! (=> (and
(TV j@@42)
(< j@@42 $entry@0@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@42)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@42)))))
 :qid |Ioibpl.115:20|
 :skolemid |31|
 :pattern ( (TV j@@42))
)) (=> ?RsdpExists (=> (and
(= ?RsdpPtr esi@0@@1)
(= call29912formal@$ptr@0 (+ esi@0@@1 16))) (and
(! (or %lbl%@112170 (inRo call29912formal@$ptr@0 4)) :lblneg @112170)
(=> (inRo call29912formal@$ptr@0 4) (=> (word call29912formal@$val@0) (=> (and
(= call29912formal@$val@0 (ro32 call29912formal@$ptr@0))
(= call29916formal@$ptr@0 (+ call29674formal@$ret@0 0))) (and
(! (or %lbl%@112210 (MemInv $Mem@0@@2 $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112210)
(=> (MemInv $Mem@0@@2 $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112238 (sAddr call29916formal@$ptr@0)) :lblneg @112238)
(=> (sAddr call29916formal@$ptr@0) (=> (and
(= (select $Mem@0@@2 call29916formal@$ptr@0) (select $sMem@0@@2 call29916formal@$ptr@0))
(= call29921formal@$ptr@0 (+ call29674formal@$ret@0 0))) (and
(! (or %lbl%@112262 (PtrOk call29921formal@$ptr@0)) :lblneg @112262)
(=> (PtrOk call29921formal@$ptr@0) (=> (and
(word call29921formal@$val@0)
(= call29921formal@$val@0 (select $Mem@0@@2 call29921formal@$ptr@0))) (and
(! (or %lbl%@112290 (MemInv $Mem@0@@2 $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112290)
(=> (MemInv $Mem@0@@2 $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112318 (sAddr (- call29674formal@$ret@0 4))) :lblneg @112318)
(=> (sAddr (- call29674formal@$ret@0 4)) (=> (and
(= $sMem@1@@1 (store $sMem@0@@2 (- call29674formal@$ret@0 4) (NextEip $Eip@30)))
(MemInv (store $Mem@0@@2 (- call29674formal@$ret@0 4) (NextEip $Eip@30)) $sMem@1@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (and
(! (or %lbl%@112382 (memAddr (- call29674formal@$ret@0 4))) :lblneg @112382)
(=> (memAddr (- call29674formal@$ret@0 4)) (and
(! (or %lbl%@112389 (Aligned call29674formal@$ret@0)) :lblneg @112389)
(=> (Aligned call29674formal@$ret@0) (=> (and
(= esp@0@@3 (- call29674formal@$ret@0 4))
(Aligned esp@0@@3)
(= $RET@0@@0 (ReturnToAddr (NextEip $Eip@30)))
(= $Mem@1@@1 (store $Mem@0@@2 esp@0@@3 (NextEip $Eip@30)))) (and
(! (or %lbl%@112447 ?RsdpExists) :lblneg @112447)
(=> ?RsdpExists (and
(! (or %lbl%@112449 (not $IoMmuEnabled@@0)) :lblneg @112449)
(=> (not $IoMmuEnabled@@0) (and
(! (or %lbl%@112453 (= call29912formal@$val@0 ?RsdtPtr)) :lblneg @112453)
(=> (= call29912formal@$val@0 ?RsdtPtr) (and
(! (or %lbl%@112458 (and
(= call29921formal@$val@0 ?dmaLo)
(word call29921formal@$val@0))) :lblneg @112458)
(=> (and
(= call29921formal@$val@0 ?dmaLo)
(word call29921formal@$val@0)) (and
(! (or %lbl%@112468 (IoRootTable $IomMem@@7 ebx)) :lblneg @112468)
(=> (IoRootTable $IomMem@@7 ebx) (and
(! (or %lbl%@112474 (= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)) :lblneg @112474)
(=> (= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE) (and
(! (or %lbl%@112488 (= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) :lblneg @112488)
(=> (= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo)) (and
(! (or %lbl%@112506 (forall ((i@@140 Int) ) (! (= (select $IoMmuState i@@140) 0)
 :qid |EntryMSb.387:18|
 :skolemid |273|
 :pattern ( (select $IoMmuState i@@140))
))) :lblneg @112506)
(=> (forall ((i@@141 Int) ) (! (= (select $IoMmuState i@@141) 0)
 :qid |EntryMSb.387:18|
 :skolemid |273|
 :pattern ( (select $IoMmuState i@@141))
)) (and
(! (or %lbl%@112526 (MemInv $Mem@1@@1 $sMem@1@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112526)
(=> (MemInv $Mem@1@@1 $sMem@1@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112554 (SMemRequireRA 124 $sMem@1@@1 esp@0@@3 $RET@0@@0)) :lblneg @112554)
(=> (SMemRequireRA 124 $sMem@1@@1 esp@0@@3 $RET@0@@0) (=> (or
(and
(= DmaAddr@0@@0 0)
(not $IoMmuEnabled@0@@0))
(and
(= DmaAddr@0@@0 ?dmaLo)
$IoMmuEnabled@0@@0)) (=> (and
(MemInv $Mem@2@@1 $sMem@2@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemEnsure $sMem@2@@1 $sMem@1@@1 esp@1@@1 esp@0@@3)
(= $IoMmuEnabled@1@@0 $IoMmuEnabled@0@@0)
(= $RET@2 $RET@1@@0)
(= $sMem@3@@0 $sMem@2@@1)
(= DmaAddr@1@@0 DmaAddr@0@@0)
(= esp@2@@0 esp@1@@1)
(= $Mem@3@@0 $Mem@2@@1)) done_correct@@1))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon14_Then_correct (=> (! (and %lbl%+30009 true) :lblpos +30009) (=> (Jae $Efl@17@@0) (=> (and
(= call29891formal@$ret@0 (q@and ebp@1 255))
(word call29891formal@$ret@0)
(= call29898formal@$x@0 (OpnReg call29891formal@$ret@0))
(= call29898formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@111895 (OpnOk $Mem@0@@2 call29898formal@$x@0)) :lblneg @111895)
(=> (OpnOk $Mem@0@@2 call29898formal@$x@0) (and
(! (or %lbl%@111899 (OpnOk $Mem@0@@2 call29898formal@$y@0)) :lblneg @111899)
(=> (OpnOk $Mem@0@@2 call29898formal@$y@0) (=> (FlagsCmp $Efl@19 (EvalOpn $Mem@0@@2 call29898formal@$x@0) (EvalOpn $Mem@0@@2 call29898formal@$y@0)) (and
anon15_Then_correct
anon15_Else_correct)))))))))))
(let ((__L20_correct (=> (! (and %lbl%+30008 true) :lblpos +30008) (=> (and
(not $IoMmuEnabled@@0)
(<= 917504 esi@0@@1)
(<= 917504 edi@1)
(<= 0 $entry@0@@3)
(= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0)))
(TV esi@0@@1)
(TV edi@1)
(<= esi@0@@1 edi@1)
(<= edi@1 (+ esi@0@@1 20))
(= ebp@1 (ByteSum esi@0@@1 edi@1))
(= call29856formal@$ret@0 esi@0@@1)) (and
(! (or %lbl%@111765 (word (+ call29856formal@$ret@0 20))) :lblneg @111765)
(=> (word (+ call29856formal@$ret@0 20)) (=> (= call29860formal@$ret@0 (+ call29856formal@$ret@0 20)) (=> (and
(= call29867formal@$x@0 (OpnReg edi@1))
(= call29867formal@$y@0 (OpnReg call29860formal@$ret@0))) (and
(! (or %lbl%@111811 (OpnOk $Mem@0@@2 call29867formal@$x@0)) :lblneg @111811)
(=> (OpnOk $Mem@0@@2 call29867formal@$x@0) (and
(! (or %lbl%@111815 (OpnOk $Mem@0@@2 call29867formal@$y@0)) :lblneg @111815)
(=> (OpnOk $Mem@0@@2 call29867formal@$y@0) (=> (FlagsCmp $Efl@17@@0 (EvalOpn $Mem@0@@2 call29867formal@$x@0) (EvalOpn $Mem@0@@2 call29867formal@$y@0)) (and
anon14_Then_correct
anon14_Else_correct))))))))))))))
(let ((anon13_Else_correct (=> (! (and %lbl%+29999 true) :lblpos +29999) (=> (not (Jne $Efl@11)) (=> (and
(= call29817formal@$ret@0 esi@0@@1)
(= call29820formal@$ret@0 0)) (and
(! (or %lbl%@111619 (= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0)))) :lblneg @111619)
(=> (= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0))) (and
(! (or %lbl%@111630 (and
(TV esi@0@@1)
(TV call29817formal@$ret@0))) :lblneg @111630)
(=> (and
(TV esi@0@@1)
(TV call29817formal@$ret@0)) (and
(! (or %lbl%@111638 (and
(<= esi@0@@1 call29817formal@$ret@0)
(<= call29817formal@$ret@0 (+ esi@0@@1 20)))) :lblneg @111638)
(=> (and
(<= esi@0@@1 call29817formal@$ret@0)
(<= call29817formal@$ret@0 (+ esi@0@@1 20))) (and
(! (or %lbl%@111652 (= call29820formal@$ret@0 (ByteSum esi@0@@1 call29817formal@$ret@0))) :lblneg @111652)
(=> (= call29820formal@$ret@0 (ByteSum esi@0@@1 call29817formal@$ret@0)) __L20_correct)))))))))))))
(let ((anon12_Else_correct@@0 (=> (! (and %lbl%+29989 true) :lblpos +29989) (=> (not (Jne $Efl@10@@0)) (=> (and
(= call29808formal@$x@0 (OpnReg call29788formal@$val@0))
(= call29808formal@$y@0 (OpnReg 542266448))) (and
(! (or %lbl%@111536 (OpnOk $Mem@0@@2 call29808formal@$x@0)) :lblneg @111536)
(=> (OpnOk $Mem@0@@2 call29808formal@$x@0) (and
(! (or %lbl%@111540 (OpnOk $Mem@0@@2 call29808formal@$y@0)) :lblneg @111540)
(=> (OpnOk $Mem@0@@2 call29808formal@$y@0) (=> (FlagsCmp $Efl@11 (EvalOpn $Mem@0@@2 call29808formal@$x@0) (EvalOpn $Mem@0@@2 call29808formal@$y@0)) (and
anon13_Then_correct
anon13_Else_correct)))))))))))
(let ((anon11_Else_correct@@0 (=> (! (and %lbl%+29979 true) :lblpos +29979) (=> (and
(not (Jae $Efl@6@@1))
(= call29783formal@$ptr@0 (+ esi@0@@1 0))) (and
(! (or %lbl%@111389 (inRo call29783formal@$ptr@0 4)) :lblneg @111389)
(=> (inRo call29783formal@$ptr@0 4) (=> (word call29783formal@$val@0) (=> (and
(= call29783formal@$val@0 (ro32 call29783formal@$ptr@0))
(= call29788formal@$ptr@0 (+ esi@0@@1 4))) (and
(! (or %lbl%@111429 (inRo call29788formal@$ptr@0 4)) :lblneg @111429)
(=> (inRo call29788formal@$ptr@0 4) (=> (and
(word call29788formal@$val@0)
(= call29788formal@$val@0 (ro32 call29788formal@$ptr@0))
(= call29795formal@$x@0 (OpnReg call29783formal@$val@0))
(= call29795formal@$y@0 (OpnReg 541348690))) (and
(! (or %lbl%@111477 (OpnOk $Mem@0@@2 call29795formal@$x@0)) :lblneg @111477)
(=> (OpnOk $Mem@0@@2 call29795formal@$x@0) (and
(! (or %lbl%@111481 (OpnOk $Mem@0@@2 call29795formal@$y@0)) :lblneg @111481)
(=> (OpnOk $Mem@0@@2 call29795formal@$y@0) (=> (FlagsCmp $Efl@10@@0 (EvalOpn $Mem@0@@2 call29795formal@$x@0) (EvalOpn $Mem@0@@2 call29795formal@$y@0)) (and
anon12_Then_correct@@0
anon12_Else_correct@@0)))))))))))))))))
(let ((anon11_Then_correct@@0 (=> (! (and %lbl%+29977 true) :lblpos +29977) (=> (and
(Jae $Efl@6@@1)
(= call29943formal@$ret@0 0)
(= $IoMmuEnabled@1@@0 $IoMmuEnabled@@0)
(= $RET@2 $RET@@0)
(= $sMem@3@@0 $sMem@0@@2)
(= DmaAddr@1@@0 call29943formal@$ret@0)
(= esp@2@@0 call29674formal@$ret@0)
(= $Mem@3@@0 $Mem@0@@2)) done_correct@@1))))
(let ((__L16_correct (=> (! (and %lbl%+29976 true) :lblpos +29976) (=> (and
(not $IoMmuEnabled@@0)
(<= 917504 esi@0@@1)
(<= 0 $entry@0@@3)
(= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0)))
(TV $entry@0@@3)
(= esi@0@@1 (+ ?RoBiosLo (* 16 $entry@0@@3)))
(<= ?RoBiosLo esi@0@@1)
(<= esi@0@@1 (- ?RoBiosHi 16))
(forall ((j@@43 Int) ) (! (=> (and
(TV j@@43)
(< j@@43 $entry@0@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@43)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@43)))))
 :qid |EntryMSb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@43))
))
(= call29761formal@$ret@0 ?RoBiosHi)) (and
(! (or %lbl%@111270 (word (- call29761formal@$ret@0 16))) :lblneg @111270)
(=> (word (- call29761formal@$ret@0 16)) (=> (= call29765formal@$ret@0 (- call29761formal@$ret@0 16)) (=> (and
(= call29772formal@$x@0 (OpnReg esi@0@@1))
(= call29772formal@$y@0 (OpnReg call29765formal@$ret@0))) (and
(! (or %lbl%@111316 (OpnOk $Mem@0@@2 call29772formal@$x@0)) :lblneg @111316)
(=> (OpnOk $Mem@0@@2 call29772formal@$x@0) (and
(! (or %lbl%@111320 (OpnOk $Mem@0@@2 call29772formal@$y@0)) :lblneg @111320)
(=> (OpnOk $Mem@0@@2 call29772formal@$y@0) (=> (FlagsCmp $Efl@6@@1 (EvalOpn $Mem@0@@2 call29772formal@$x@0) (EvalOpn $Mem@0@@2 call29772formal@$y@0)) (and
anon11_Then_correct@@0
anon11_Else_correct@@0))))))))))))))
(let ((anon0_correct@@11 (=> (! (and %lbl%+29969 true) :lblpos +29969) (and
(! (or %lbl%@110658 (Aligned esp)) :lblneg @110658)
(=> (Aligned esp) (=> (and
(Aligned (- esp 4))
(Aligned (- esp 8))
(Aligned (- esp 12))
(Aligned (- esp 16))
(Aligned (- esp 20))
(Aligned (- esp 24))
(Aligned (- esp 28))
(Aligned (- esp 32))
(Aligned (- esp 36))
(Aligned (- esp 40))
(Aligned (- esp 44))
(Aligned (- esp 48))
(Aligned (- esp 52))
(Aligned (- esp 56))
(Aligned (- esp 60))
(Aligned (- esp 64))) (and
(! (or %lbl%@110820 (word (- esp 4))) :lblneg @110820)
(=> (word (- esp 4)) (=> (and
(= call29674formal@$ret@0 (- esp 4))
(= call29683formal@$ptr@0 (+ call29674formal@$ret@0 0))) (and
(! (or %lbl%@110867 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @110867)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@110897 (sAddr call29683formal@$ptr@0)) :lblneg @110897)
(=> (sAddr call29683formal@$ptr@0) (=> (MemInv (store $Mem@@3 call29683formal@$ptr@0 ebp) $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0@@2 (store $sMem@@5 call29683formal@$ptr@0 ebp))
(= call29688formal@$ptr@0 (+ call29674formal@$ret@0 0))) (and
(! (or %lbl%@110961 (PtrOk call29688formal@$ptr@0)) :lblneg @110961)
(=> (PtrOk call29688formal@$ptr@0) (and
(! (or %lbl%@110964 (word ebp)) :lblneg @110964)
(=> (word ebp) (=> (and
(= $Mem@0@@2 (store $Mem@@3 call29688formal@$ptr@0 ebp))
(= call29695formal@$ret@0 ?RoBiosLo)) (and
(! (or %lbl%@111016 (= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0)))) :lblneg @111016)
(=> (= ebp (select $sMem@0@@2 (+ call29674formal@$ret@0 0))) (and
(! (or %lbl%@111027 (TV 0)) :lblneg @111027)
(=> (TV 0) (and
(! (or %lbl%@111030 (= call29695formal@$ret@0 (+ ?RoBiosLo (* 16 0)))) :lblneg @111030)
(=> (= call29695formal@$ret@0 (+ ?RoBiosLo (* 16 0))) (and
(! (or %lbl%@111042 (and
(<= ?RoBiosLo call29695formal@$ret@0)
(<= call29695formal@$ret@0 (- ?RoBiosHi 16)))) :lblneg @111042)
(=> (and
(<= ?RoBiosLo call29695formal@$ret@0)
(<= call29695formal@$ret@0 (- ?RoBiosHi 16))) (and
(! (or %lbl%@111058 (forall ((j@@44 Int) ) (! (=> (and
(TV j@@44)
(< j@@44 0)
(inBiosRo (+ ?RoBiosLo (* 16 j@@44)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@44)))))
 :qid |EntryMSb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@44))
))) :lblneg @111058)
(=> (forall ((j@@45 Int) ) (! (=> (and
(TV j@@45)
(< j@@45 0)
(inBiosRo (+ ?RoBiosLo (* 16 j@@45)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@45)))))
 :qid |EntryMSb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@45))
)) __L16_correct))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@11 (=> (! (and %lbl%+110054 true) :lblpos +110054) (=> (and
(IoRootTable $IomMem@@7 ebx)
(not $IoMmuEnabled@@0)) (=> (and
(= ebp ?dmaLo)
(word ebp)
(= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)
(= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))
(forall ((i@@142 Int) ) (! (= (select $IoMmuState i@@142) 0)
 :qid |EntryMSb.464:18|
 :skolemid |276|
 :pattern ( (select $IoMmuState i@@142))
))
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 132 $sMem@@5 esp $RET@@0)) anon0_correct@@11)))))
PreconditionGeneratedEntry_correct@@11))))))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+30165 () Bool)
(declare-fun call30039formal@$ret@0 () Int)
(declare-fun %lbl%@113599 () Bool)
(declare-fun call30043formal@$ret@0 () Int)
(declare-fun call30046formal@$ret@0 () Int)
(declare-fun call30049formal@$ret@0 () Int)
(declare-fun %lbl%@113670 () Bool)
(declare-fun call30053formal@$ret@0 () Int)
(declare-fun %lbl%@113714 () Bool)
(declare-fun call30057formal@$ret@0 () Int)
(declare-fun call30060formal@$ret@0 () Int)
(declare-fun call30063formal@$ret@0 () Int)
(declare-fun %lbl%@113785 () Bool)
(declare-fun call30067formal@$ret@0 () Int)
(declare-fun %lbl%@113829 () Bool)
(declare-fun call30071formal@$ret@0 () Int)
(declare-fun call30074formal@$ret@0 () Int)
(declare-fun call30077formal@$ret@0 () Int)
(declare-fun %lbl%@113900 () Bool)
(declare-fun call30081formal@$ret@0 () Int)
(declare-fun %lbl%@113944 () Bool)
(declare-fun call30085formal@$ret@0 () Int)
(declare-fun call30088formal@$ret@0 () Int)
(declare-fun call30091formal@$ret@0 () Int)
(declare-fun %lbl%@114015 () Bool)
(declare-fun call30095formal@$ret@0 () Int)
(declare-fun %lbl%@114059 () Bool)
(declare-fun call30099formal@$ret@0 () Int)
(declare-fun call30102formal@$ret@0 () Int)
(declare-fun call30105formal@$ret@0 () Int)
(declare-fun %lbl%@114130 () Bool)
(declare-fun call30109formal@$ret@0 () Int)
(declare-fun %lbl%@114174 () Bool)
(declare-fun call30113formal@$ret@0 () Int)
(declare-fun call30116formal@$ret@0 () Int)
(declare-fun call30119formal@$ret@0 () Int)
(declare-fun %lbl%@114245 () Bool)
(declare-fun call30123formal@$ret@0 () Int)
(declare-fun %lbl%@114289 () Bool)
(declare-fun call30127formal@$ret@0 () Int)
(declare-fun call30130formal@$ret@0 () Int)
(declare-fun call30133formal@$ret@0 () Int)
(declare-fun %lbl%@114360 () Bool)
(declare-fun call30137formal@$ret@0 () Int)
(declare-fun %lbl%@114404 () Bool)
(declare-fun call30141formal@$ret@0 () Int)
(declare-fun call30144formal@$ret@0 () Int)
(declare-fun call30147formal@$ret@0 () Int)
(declare-fun %lbl%@114475 () Bool)
(declare-fun call30151formal@$ret@0 () Int)
(declare-fun %lbl%@114519 () Bool)
(declare-fun call30155formal@$ret@0 () Int)
(declare-fun call30158formal@$ret@0 () Int)
(declare-fun call30161formal@$ret@0 () Int)
(declare-fun %lbl%@114590 () Bool)
(declare-fun %lbl%+113245 () Bool)
(push 1)
(set-info :boogie-vc-id initializeSerialPort)
(assert (not
(let ((anon0_correct@@12 (=> (! (and %lbl%+30165 true) :lblpos +30165) (=> (= call30039formal@$ret@0 1016) (and
(! (or %lbl%@113599 (word (+ call30039formal@$ret@0 3))) :lblneg @113599)
(=> (word (+ call30039formal@$ret@0 3)) (=> (= call30043formal@$ret@0 (+ call30039formal@$ret@0 3)) (=> (and
(= call30046formal@$ret@0 call30043formal@$ret@0)
(= call30049formal@$ret@0 128)) (and
(! (or %lbl%@113670 (and
(>= call30046formal@$ret@0 1016)
(<= call30046formal@$ret@0 1020))) :lblneg @113670)
(=> (and
(>= call30046formal@$ret@0 1016)
(<= call30046formal@$ret@0 1020)) (=> (= call30053formal@$ret@0 1016) (and
(! (or %lbl%@113714 (word (+ call30053formal@$ret@0 0))) :lblneg @113714)
(=> (word (+ call30053formal@$ret@0 0)) (=> (= call30057formal@$ret@0 (+ call30053formal@$ret@0 0)) (=> (and
(= call30060formal@$ret@0 call30057formal@$ret@0)
(= call30063formal@$ret@0 1)) (and
(! (or %lbl%@113785 (and
(>= call30060formal@$ret@0 1016)
(<= call30060formal@$ret@0 1020))) :lblneg @113785)
(=> (and
(>= call30060formal@$ret@0 1016)
(<= call30060formal@$ret@0 1020)) (=> (= call30067formal@$ret@0 1016) (and
(! (or %lbl%@113829 (word (+ call30067formal@$ret@0 1))) :lblneg @113829)
(=> (word (+ call30067formal@$ret@0 1)) (=> (= call30071formal@$ret@0 (+ call30067formal@$ret@0 1)) (=> (and
(= call30074formal@$ret@0 call30071formal@$ret@0)
(= call30077formal@$ret@0 0)) (and
(! (or %lbl%@113900 (and
(>= call30074formal@$ret@0 1016)
(<= call30074formal@$ret@0 1020))) :lblneg @113900)
(=> (and
(>= call30074formal@$ret@0 1016)
(<= call30074formal@$ret@0 1020)) (=> (= call30081formal@$ret@0 1016) (and
(! (or %lbl%@113944 (word (+ call30081formal@$ret@0 3))) :lblneg @113944)
(=> (word (+ call30081formal@$ret@0 3)) (=> (= call30085formal@$ret@0 (+ call30081formal@$ret@0 3)) (=> (and
(= call30088formal@$ret@0 call30085formal@$ret@0)
(= call30091formal@$ret@0 3)) (and
(! (or %lbl%@114015 (and
(>= call30088formal@$ret@0 1016)
(<= call30088formal@$ret@0 1020))) :lblneg @114015)
(=> (and
(>= call30088formal@$ret@0 1016)
(<= call30088formal@$ret@0 1020)) (=> (= call30095formal@$ret@0 1016) (and
(! (or %lbl%@114059 (word (+ call30095formal@$ret@0 1))) :lblneg @114059)
(=> (word (+ call30095formal@$ret@0 1)) (=> (= call30099formal@$ret@0 (+ call30095formal@$ret@0 1)) (=> (and
(= call30102formal@$ret@0 call30099formal@$ret@0)
(= call30105formal@$ret@0 0)) (and
(! (or %lbl%@114130 (and
(>= call30102formal@$ret@0 1016)
(<= call30102formal@$ret@0 1020))) :lblneg @114130)
(=> (and
(>= call30102formal@$ret@0 1016)
(<= call30102formal@$ret@0 1020)) (=> (= call30109formal@$ret@0 1016) (and
(! (or %lbl%@114174 (word (+ call30109formal@$ret@0 2))) :lblneg @114174)
(=> (word (+ call30109formal@$ret@0 2)) (=> (= call30113formal@$ret@0 (+ call30109formal@$ret@0 2)) (=> (and
(= call30116formal@$ret@0 call30113formal@$ret@0)
(= call30119formal@$ret@0 1)) (and
(! (or %lbl%@114245 (and
(>= call30116formal@$ret@0 1016)
(<= call30116formal@$ret@0 1020))) :lblneg @114245)
(=> (and
(>= call30116formal@$ret@0 1016)
(<= call30116formal@$ret@0 1020)) (=> (= call30123formal@$ret@0 1016) (and
(! (or %lbl%@114289 (word (+ call30123formal@$ret@0 2))) :lblneg @114289)
(=> (word (+ call30123formal@$ret@0 2)) (=> (= call30127formal@$ret@0 (+ call30123formal@$ret@0 2)) (=> (and
(= call30130formal@$ret@0 call30127formal@$ret@0)
(= call30133formal@$ret@0 7)) (and
(! (or %lbl%@114360 (and
(>= call30130formal@$ret@0 1016)
(<= call30130formal@$ret@0 1020))) :lblneg @114360)
(=> (and
(>= call30130formal@$ret@0 1016)
(<= call30130formal@$ret@0 1020)) (=> (= call30137formal@$ret@0 1016) (and
(! (or %lbl%@114404 (word (+ call30137formal@$ret@0 2))) :lblneg @114404)
(=> (word (+ call30137formal@$ret@0 2)) (=> (= call30141formal@$ret@0 (+ call30137formal@$ret@0 2)) (=> (and
(= call30144formal@$ret@0 call30141formal@$ret@0)
(= call30147formal@$ret@0 1)) (and
(! (or %lbl%@114475 (and
(>= call30144formal@$ret@0 1016)
(<= call30144formal@$ret@0 1020))) :lblneg @114475)
(=> (and
(>= call30144formal@$ret@0 1016)
(<= call30144formal@$ret@0 1020)) (=> (= call30151formal@$ret@0 1016) (and
(! (or %lbl%@114519 (word (+ call30151formal@$ret@0 4))) :lblneg @114519)
(=> (word (+ call30151formal@$ret@0 4)) (=> (= call30155formal@$ret@0 (+ call30151formal@$ret@0 4)) (=> (and
(= call30158formal@$ret@0 call30155formal@$ret@0)
(= call30161formal@$ret@0 3)) (and
(! (or %lbl%@114590 (and
(>= call30158formal@$ret@0 1016)
(<= call30158formal@$ret@0 1020))) :lblneg @114590)
(=> (and
(>= call30158formal@$ret@0 1016)
(<= call30158formal@$ret@0 1020)) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@12 (=> (! (and %lbl%+113245 true) :lblpos +113245) anon0_correct@@12)))
PreconditionGeneratedEntry_correct@@12))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+30223 () Bool)
(declare-fun $Efl@5 () Int)
(declare-fun call30201formal@$ret@0 () Int)
(declare-fun %lbl%@114931 () Bool)
(declare-fun call30205formal@$ret@0 () Int)
(declare-fun call30208formal@$ret@0 () Int)
(declare-fun call30211formal@$ret@0 () Int)
(declare-fun %lbl%@115002 () Bool)
(declare-fun %lbl%+30221 () Bool)
(declare-fun %lbl%+30220 () Bool)
(declare-fun call30173formal@$ret@0 () Int)
(declare-fun %lbl%@114755 () Bool)
(declare-fun call30177formal@$ret@0 () Int)
(declare-fun call30180formal@$ret@0 () Int)
(declare-fun %lbl%@114804 () Bool)
(declare-fun call30185formal@$ret@0 () Int)
(declare-fun call30192formal@$x@0 () T@opn)
(declare-fun call30192formal@$y@0 () T@opn)
(declare-fun %lbl%@114863 () Bool)
(declare-fun %lbl%@114868 () Bool)
(declare-fun %lbl%+114631 () Bool)
(push 1)
(set-info :boogie-vc-id serialDbgDataOut8)
(assert (not
(let ((anon2_Else_correct@@0 (=> (! (and %lbl%+30223 true) :lblpos +30223) (=> (and
(not (Je $Efl@5))
(= call30201formal@$ret@0 1016)) (and
(! (or %lbl%@114931 (word (+ call30201formal@$ret@0 0))) :lblneg @114931)
(=> (word (+ call30201formal@$ret@0 0)) (=> (= call30205formal@$ret@0 (+ call30201formal@$ret@0 0)) (=> (and
(= call30208formal@$ret@0 call30205formal@$ret@0)
(= call30211formal@$ret@0 ecx)) (and
(! (or %lbl%@115002 (and
(>= call30208formal@$ret@0 1016)
(<= call30208formal@$ret@0 1020))) :lblneg @115002)
(=> (and
(>= call30208formal@$ret@0 1016)
(<= call30208formal@$ret@0 1020)) true))))))))))
(let ((anon2_Then_correct@@0 (=> (! (and %lbl%+30221 true) :lblpos +30221) true)))
(let ((waitForSerialPort_correct (=> (! (and %lbl%+30220 true) :lblpos +30220) (=> (= call30173formal@$ret@0 1016) (and
(! (or %lbl%@114755 (word (+ call30173formal@$ret@0 5))) :lblneg @114755)
(=> (word (+ call30173formal@$ret@0 5)) (=> (and
(= call30177formal@$ret@0 (+ call30173formal@$ret@0 5))
(= call30180formal@$ret@0 call30177formal@$ret@0)) (and
(! (or %lbl%@114804 (= call30180formal@$ret@0 1021)) :lblneg @114804)
(=> (= call30180formal@$ret@0 1021) (=> (and
(= call30185formal@$ret@0 (q@and call30177formal@$ret@0 32))
(word call30185formal@$ret@0)
(= call30192formal@$x@0 (OpnReg call30185formal@$ret@0))
(= call30192formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@114863 (OpnOk $Mem@@3 call30192formal@$x@0)) :lblneg @114863)
(=> (OpnOk $Mem@@3 call30192formal@$x@0) (and
(! (or %lbl%@114868 (OpnOk $Mem@@3 call30192formal@$y@0)) :lblneg @114868)
(=> (OpnOk $Mem@@3 call30192formal@$y@0) (=> (FlagsCmp $Efl@5 (EvalOpn $Mem@@3 call30192formal@$x@0) (EvalOpn $Mem@@3 call30192formal@$y@0)) (and
anon2_Then_correct@@0
anon2_Else_correct@@0))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@13 (=> (! (and %lbl%+114631 true) :lblpos +114631) waitForSerialPort_correct)))
PreconditionGeneratedEntry_correct@@13))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31231 () Bool)
(declare-fun %lbl%+115037 () Bool)
(declare-fun $smap () Int)
(declare-fun $PciConfigState@@0 () (Array Int Int))
(push 1)
(set-info :boogie-vc-id NucleusEntryPoint)
(assert (not
(let ((serialInfLoop_correct (=> (! (and %lbl%+31231 true) :lblpos +31231) true)))
(let ((anon0_correct@@13 (=> (! (and %lbl%+115037 true) :lblpos +115037) (=> (inRo (+ ecx 40) 4) (=> (and
(inRo (+ ecx 44) 4)
(=> (>= (ro32 (+ ecx 44)) 4) (and
(= $smap (ro32 (+ ecx 40)))
(inRo (+ $smap (* 3 24)) 4)
(inRo (+ (+ $smap (* 3 24)) 8) 4)
(inRo (+ (+ $smap (* 3 24)) 16) 4)
(=> (= (ro32 (+ (+ $smap (* 3 24)) 16)) 1) (and
(= ?idtLo (ro32 (+ (+ $smap (* 3 24)) 0)))
(= ?memHi (+ (ro32 (+ (+ $smap (* 3 24)) 8)) ?idtLo))))))) (=> (and
(= ?idtHi ?iomLo)
(= ?iomHi ?dmaLo)
(= ?dmaHi ?memLo)
(Aligned esp)
(forall ((i@@143 Int) ) (! (= (select $PciConfigState@@0 i@@143) 0)
 :qid |EntryMSi.30:20|
 :skolemid |246|
 :pattern ( (select $PciConfigState@@0 i@@143))
))
(forall ((i@@144 Int) ) (! (= (select $IoMmuState i@@144) 0)
 :qid |EntryMSi.31:20|
 :skolemid |247|
 :pattern ( (select $IoMmuState i@@144))
))
(not $IomFrozen)
(not $IoMmuEnabled@@0)) serialInfLoop_correct))))))
anon0_correct@@13))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31420 () Bool)
(declare-fun %lbl%+31423 () Bool)
(declare-fun %lbl%@117461 () Bool)
(declare-fun ecx@1 () Int)
(declare-fun %lbl%@117465 () Bool)
(declare-fun $__stackState@0 () (Array Int T@StackState))
(declare-fun StackYielded (Int Int Int) T@StackState)
(declare-fun $ebp@@0 () Int)
(declare-fun $esp@@5 () Int)
(declare-fun $eip () Int)
(declare-fun %lbl%@117481 () Bool)
(declare-fun call31376formal@$ret@0 () Int)
(declare-fun %lbl%@117484 () Bool)
(declare-fun %lbl%@117496 () Bool)
(declare-fun NucleusInv (Int (Array Int T@StackState) (Array Int Int) (Array Int (Array Int Int)) Int (Array Int Int) (Array Int Int) Int (Array Int Int) (Array Int Int) Int Int Int Int Int Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int (Array Int Int)) (Array Int Int) Int Int Int Int Int Int Int (Array Int Int) (Array Int (Array Int Int)) (Array Int (Array Int T@$FrameLayout)) (Array Int (Array Int Int)) (Array Int (Array Int (Array Int Int))) (Array Int (Array Int Int)) Bool (Array Int Int) Int) Bool)
(declare-fun $S@@0 () Int)
(declare-fun $toAbs@@4 () (Array Int Int))
(declare-fun $AbsMem@@3 () (Array Int (Array Int Int)))
(declare-fun CurrentStack () Int)
(declare-fun $gcSlice@@3 () (Array Int Int))
(declare-fun $color () (Array Int Int))
(declare-fun StackTop () Int)
(declare-fun $fs () (Array Int Int))
(declare-fun $fn () (Array Int Int))
(declare-fun CachePtr () Int)
(declare-fun CacheSize () Int)
(declare-fun ColorBase () Int)
(declare-fun HeapLo () Int)
(declare-fun HeapHi () Int)
(declare-fun ReserveMin () Int)
(declare-fun $Mem@0@@3 () (Array Int Int))
(declare-fun $tMems@0 () (Array Int (Array Int Int)))
(declare-fun $fMems@0 () (Array Int (Array Int Int)))
(declare-fun $FrameCounts@@2 () (Array Int Int))
(declare-fun $FrameAddrs@@2 () (Array Int (Array Int Int)))
(declare-fun $FrameLayouts@@2 () (Array Int (Array Int T@$FrameLayout)))
(declare-fun $FrameSlices@@2 () (Array Int (Array Int Int)))
(declare-fun $FrameAbss@@2 () (Array Int (Array Int (Array Int Int))))
(declare-fun $FrameOffsets@@2 () (Array Int (Array Int Int)))
(declare-fun DmaAddr@@0 () Int)
(declare-fun StackRunning () T@StackState)
(declare-fun CurrentStack@0 () Int)
(declare-fun $Mem@1@@2 () (Array Int Int))
(declare-fun $tMems@1 () (Array Int (Array Int Int)))
(declare-fun $fMems@1 () (Array Int (Array Int Int)))
(declare-fun esp@0@@4 () Int)
(declare-fun ebp@0 () Int)
(declare-fun call31408formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@117763 () Bool)
(declare-fun %lbl%@117772 () Bool)
(declare-fun esp@1@@2 () Int)
(declare-fun %lbl%@117801 () Bool)
(declare-fun call31370formal@$ret@0 () Int)
(declare-fun %lbl%@117806 () Bool)
(declare-fun $StackState () (Array Int T@StackState))
(declare-fun $_stackState () (Array Int T@StackState))
(declare-fun %lbl%+31418 () Bool)
(declare-fun $Efl@12@@1 () Int)
(declare-fun call31373formal@$ret@0 () Int)
(declare-fun %lbl%+31417 () Bool)
(declare-fun StackEmpty () T@StackState)
(declare-fun %lbl%@116382 () Bool)
(declare-fun %lbl%@116385 () Bool)
(declare-fun IoInv (Bool (Array Int Int) Int (Array Int Int)) Bool)
(declare-fun call31329formal@$ret@0 () Int)
(declare-fun call31332formal@$ret@0 () Int)
(declare-fun %lbl%@116610 () Bool)
(declare-fun call31337formal@$ret@0 () Int)
(declare-fun %lbl%@116655 () Bool)
(declare-fun call31341formal@$ret@0 () Int)
(declare-fun %lbl%@116683 () Bool)
(declare-fun %lbl%@116700 () Bool)
(declare-fun %lbl%@116703 () Bool)
(declare-fun %lbl%@116715 () Bool)
(declare-fun %lbl%@116718 () Bool)
(declare-fun %lbl%@116928 () Bool)
(declare-fun %lbl%@116931 () Bool)
(declare-fun call31359formal@$ret@0 () Int)
(declare-fun %lbl%@117122 () Bool)
(declare-fun call31363formal@$ret@0 () Int)
(declare-fun %lbl%@117155 () Bool)
(declare-fun call31367formal@$ret@0 () Int)
(declare-fun %lbl%@117253 () Bool)
(declare-fun %lbl%@117280 () Bool)
(declare-fun %lbl%@117302 () Bool)
(declare-fun call31382formal@$val@0 () Int)
(declare-fun call31389formal@$x@0 () T@opn)
(declare-fun call31389formal@$y@0 () T@opn)
(declare-fun %lbl%@117349 () Bool)
(declare-fun %lbl%@117353 () Bool)
(declare-fun %lbl%+115637 () Bool)
(push 1)
(set-info :boogie-vc-id Throw)
(assert (not
(let ((anon3_Else_correct@@0 (=> (! (and %lbl%+31420 true) :lblpos +31420) true)))
(let ((__L31_correct (=> (! (and %lbl%+31423 true) :lblpos +31423) (and
(! (or %lbl%@117461 (= ecx@1 ?InterruptStack)) :lblneg @117461)
(=> (= ecx@1 ?InterruptStack) (and
(! (or %lbl%@117465 (and
(isStack ?InterruptStack)
(= (select $__stackState@0 ?InterruptStack) (StackYielded $ebp@@0 $esp@@5 $eip)))) :lblneg @117465)
(=> (and
(isStack ?InterruptStack)
(= (select $__stackState@0 ?InterruptStack) (StackYielded $ebp@@0 $esp@@5 $eip))) (and
(! (or %lbl%@117481 (Aligned call31376formal@$ret@0)) :lblneg @117481)
(=> (Aligned call31376formal@$ret@0) (and
(! (or %lbl%@117484 (= call31376formal@$ret@0 (+ ?tLo (* ?InterruptStack ?TSize)))) :lblneg @117484)
(=> (= call31376formal@$ret@0 (+ ?tLo (* ?InterruptStack ?TSize))) (and
(! (or %lbl%@117496 (NucleusInv $S@@0 $__stackState@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @117496)
(=> (NucleusInv $S@@0 $__stackState@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(NucleusInv ?InterruptStack (store $__stackState@0 ?InterruptStack StackRunning) $toAbs@@4 $AbsMem@@3 CurrentStack@0 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@1@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@1 $fMems@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= esp@0@@4 (- $esp@@5 4))) (=> (and
(= ebp@0 $ebp@@0)
(Aligned esp@0@@4)
(= (select $Mem@1@@2 (- $esp@@5 4)) $eip)
(= call31408formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@117763 (= (ReturnToAddr (select $Mem@1@@2 esp@0@@4)) call31408formal@$oldRA@0)) :lblneg @117763)
(=> (= (ReturnToAddr (select $Mem@1@@2 esp@0@@4)) call31408formal@$oldRA@0) (and
(! (or %lbl%@117772 (Aligned esp@0@@4)) :lblneg @117772)
(=> (Aligned esp@0@@4) (=> (and
(= esp@1@@2 (+ esp@0@@4 4))
(Aligned esp@1@@2)) (and
(! (or %lbl%@117801 (StackCheckInv ?InterruptStack call31370formal@$ret@0)) :lblneg @117801)
(=> (StackCheckInv ?InterruptStack call31370formal@$ret@0) (and
(! (or %lbl%@117806 (=> (= (StackStateTag (select $StackState ?InterruptStack)) ?STACK_YIELDED) (and
(NucleusInv ?InterruptStack $_stackState $toAbs@@4 $AbsMem@@3 CurrentStack@0 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@1@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@1 $fMems@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@0 $ebp@@0)
(= esp@1@@2 $esp@@5)))) :lblneg @117806)
(=> (=> (= (StackStateTag (select $StackState ?InterruptStack)) ?STACK_YIELDED) (and
(NucleusInv ?InterruptStack $_stackState $toAbs@@4 $AbsMem@@3 CurrentStack@0 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@1@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@1 $fMems@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@0 $ebp@@0)
(= esp@1@@2 $esp@@5))) true))))))))))))))))))))))))
(let ((anon3_Then_correct@@0 (=> (! (and %lbl%+31418 true) :lblpos +31418) (=> (and
(Je $Efl@12@@1)
(= ecx@1 call31373formal@$ret@0)) __L31_correct))))
(let ((anon0_correct@@14 (=> (! (and %lbl%+31417 true) :lblpos +31417) (=> (= $__stackState@0 (store $StackState $S@@0 StackEmpty)) (and
(! (or %lbl%@116382 (isStack $S@@0)) :lblneg @116382)
(=> (isStack $S@@0) (and
(! (or %lbl%@116385 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @116385)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(= call31329formal@$ret@0 CurrentStack)
(= call31332formal@$ret@0 ?TSize)) (and
(! (or %lbl%@116610 (word (* call31329formal@$ret@0 call31332formal@$ret@0))) :lblneg @116610)
(=> (word (* call31329formal@$ret@0 call31332formal@$ret@0)) (=> (and
(= call31337formal@$ret@0 (* call31329formal@$ret@0 call31332formal@$ret@0))
(= call31337formal@$ret@0 (Mult call31329formal@$ret@0 call31332formal@$ret@0))) (and
(! (or %lbl%@116655 (word (+ call31337formal@$ret@0 TLo@@0))) :lblneg @116655)
(=> (word (+ call31337formal@$ret@0 TLo@@0)) (=> (= call31341formal@$ret@0 (+ call31337formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@116683 (and
(TV TLo@@0)
(TO (* 64 $S@@0)))) :lblneg @116683)
(=> (and
(TV TLo@@0)
(TO (* 64 $S@@0))) (and
(! (or %lbl%@116700 (Aligned call31341formal@$ret@0)) :lblneg @116700)
(=> (Aligned call31341formal@$ret@0) (and
(! (or %lbl%@116703 (= call31341formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize)))) :lblneg @116703)
(=> (= call31341formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize))) (and
(! (or %lbl%@116715 (isStack $S@@0)) :lblneg @116715)
(=> (isStack $S@@0) (and
(! (or %lbl%@116718 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @116718)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(NucleusInv $S@@0 (store $StackState $S@@0 StackEmpty) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= $Mem@0@@3 (store $Mem@@3 call31341formal@$ret@0 ?STACK_EMPTY))) (and
(! (or %lbl%@116928 (isStack ?InterruptStack)) :lblneg @116928)
(=> (isStack ?InterruptStack) (and
(! (or %lbl%@116931 (NucleusInv $S@@0 $__stackState@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @116931)
(=> (NucleusInv $S@@0 $__stackState@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $S@@0 CurrentStack)
(MemInv $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (=> (and
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $__stackState@0 ?InterruptStack)) (StackTag ?InterruptStack $tMems@0))
(=> (IsYielded (select $__stackState@0 ?InterruptStack)) (= (select $__stackState@0 ?InterruptStack) (StackYielded (StackEbp ?InterruptStack $tMems@0) (+ (StackEsp ?InterruptStack $tMems@0) 4) (StackRA ?InterruptStack $tMems@0 $fMems@0))))
(= call31359formal@$ret@0 FLo@@0)) (and
(! (or %lbl%@117122 (word (+ call31359formal@$ret@0 ?StackReserve))) :lblneg @117122)
(=> (word (+ call31359formal@$ret@0 ?StackReserve)) (=> (= call31363formal@$ret@0 (+ call31359formal@$ret@0 ?StackReserve)) (and
(! (or %lbl%@117155 (word (+ call31363formal@$ret@0 ?InterruptReserve))) :lblneg @117155)
(=> (word (+ call31363formal@$ret@0 ?InterruptReserve)) (=> (and
(= call31367formal@$ret@0 (+ call31363formal@$ret@0 ?InterruptReserve))
(= call31370formal@$ret@0 call31367formal@$ret@0)
(= call31373formal@$ret@0 0)
(= call31376formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@117253 (MemInv $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @117253)
(=> (MemInv $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@117280 (tAddr ?InterruptStack call31376formal@$ret@0)) :lblneg @117280)
(=> (tAddr ?InterruptStack call31376formal@$ret@0) (=> (and
(= (select $Mem@0@@3 call31376formal@$ret@0) (select (select $tMems@0 ?InterruptStack) call31376formal@$ret@0))
(memAddr call31376formal@$ret@0)) (and
(! (or %lbl%@117302 (PtrOk call31376formal@$ret@0)) :lblneg @117302)
(=> (PtrOk call31376formal@$ret@0) (=> (and
(word call31382formal@$val@0)
(= call31382formal@$val@0 (select $Mem@0@@3 call31376formal@$ret@0))
(= call31389formal@$x@0 (OpnReg call31382formal@$val@0))
(= call31389formal@$y@0 (OpnReg ?STACK_YIELDED))) (and
(! (or %lbl%@117349 (OpnOk $Mem@0@@3 call31389formal@$x@0)) :lblneg @117349)
(=> (OpnOk $Mem@0@@3 call31389formal@$x@0) (and
(! (or %lbl%@117353 (OpnOk $Mem@0@@3 call31389formal@$y@0)) :lblneg @117353)
(=> (OpnOk $Mem@0@@3 call31389formal@$y@0) (=> (FlagsCmp $Efl@12@@1 (EvalOpn $Mem@0@@3 call31389formal@$x@0) (EvalOpn $Mem@0@@3 call31389formal@$y@0)) (and
anon3_Then_correct@@0
anon3_Else_correct@@0))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@14 (=> (! (and %lbl%+115637 true) :lblpos +115637) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(word esp)
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(SpRequire $S@@0 esp 4)
(= $_stackState (store (store $StackState $S@@0 StackEmpty) ?InterruptStack StackRunning))
(=> (= (StackStateTag (select $StackState ?InterruptStack)) ?STACK_YIELDED) (and
(= $RET@@0 (ReturnToAddr $eip))
(= (select $StackState ?InterruptStack) (StackYielded $ebp@@0 $esp@@5 $eip))))) anon0_correct@@14))))
PreconditionGeneratedEntry_correct@@14)))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31433 () Bool)
(declare-fun %lbl%+117912 () Bool)
(push 1)
(set-info :boogie-vc-id FatalHandler)
(assert (not
(let ((anon0_correct@@15 (=> (! (and %lbl%+31433 true) :lblpos +31433) true)))
(let ((PreconditionGeneratedEntry_correct@@15 (=> (! (and %lbl%+117912 true) :lblpos +117912) anon0_correct@@15)))
PreconditionGeneratedEntry_correct@@15))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31502 () Bool)
(declare-fun %lbl%+31505 () Bool)
(declare-fun %lbl%@118636 () Bool)
(declare-fun $s@@25 () Int)
(declare-fun %lbl%@118639 () Bool)
(declare-fun call31459formal@$ret@0 () Int)
(declare-fun ecx@1@@0 () Int)
(declare-fun call31462formal@$ret@0 () Int)
(declare-fun %lbl%@118863 () Bool)
(declare-fun call31467formal@$ret@0 () Int)
(declare-fun %lbl%@118908 () Bool)
(declare-fun call31471formal@$ret@0 () Int)
(declare-fun %lbl%@118936 () Bool)
(declare-fun %lbl%@118955 () Bool)
(declare-fun %lbl%@118985 () Bool)
(declare-fun %lbl%@119009 () Bool)
(declare-fun call31487formal@$val@0 () Int)
(declare-fun call31490formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@119046 () Bool)
(declare-fun %lbl%@119057 () Bool)
(declare-fun esp@0@@5 () Int)
(declare-fun %lbl%@119088 () Bool)
(declare-fun %lbl%@119168 () Bool)
(declare-fun %lbl%@119179 () Bool)
(declare-fun %lbl%@119185 () Bool)
(declare-fun %lbl%+31500 () Bool)
(declare-fun $Efl@0 () Int)
(declare-fun %lbl%+31499 () Bool)
(declare-fun call31443formal@$x@0 () T@opn)
(declare-fun call31443formal@$y@0 () T@opn)
(declare-fun %lbl%@118523 () Bool)
(declare-fun %lbl%@118528 () Bool)
(declare-fun %lbl%+118048 () Bool)
(push 1)
(set-info :boogie-vc-id GetStackState)
(assert (not
(let ((anon3_Else_correct@@1 (=> (! (and %lbl%+31502 true) :lblpos +31502) true)))
(let ((__L32_correct (=> (! (and %lbl%+31505 true) :lblpos +31505) (and
(! (or %lbl%@118636 (isStack $s@@25)) :lblneg @118636)
(=> (isStack $s@@25) (and
(! (or %lbl%@118639 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @118639)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState $s@@25)) (StackTag $s@@25 $tMems@@12))
(=> (IsYielded (select $StackState $s@@25)) (= (select $StackState $s@@25) (StackYielded (StackEbp $s@@25 $tMems@@12) (+ (StackEsp $s@@25 $tMems@@12) 4) (StackRA $s@@25 $tMems@@12 $fMems@@4))))
(= call31459formal@$ret@0 ecx@1@@0)
(= call31462formal@$ret@0 ?TSize)) (and
(! (or %lbl%@118863 (word (* call31459formal@$ret@0 call31462formal@$ret@0))) :lblneg @118863)
(=> (word (* call31459formal@$ret@0 call31462formal@$ret@0)) (=> (and
(= call31467formal@$ret@0 (* call31459formal@$ret@0 call31462formal@$ret@0))
(= call31467formal@$ret@0 (Mult call31459formal@$ret@0 call31462formal@$ret@0))) (and
(! (or %lbl%@118908 (word (+ call31467formal@$ret@0 TLo@@0))) :lblneg @118908)
(=> (word (+ call31467formal@$ret@0 TLo@@0)) (=> (= call31471formal@$ret@0 (+ call31467formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@118936 (and
(TV TLo@@0)
(TO (* 64 $s@@25)))) :lblneg @118936)
(=> (and
(TV TLo@@0)
(TO (* 64 $s@@25))) (and
(! (or %lbl%@118955 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @118955)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@118985 (tAddr $s@@25 call31471formal@$ret@0)) :lblneg @118985)
(=> (tAddr $s@@25 call31471formal@$ret@0) (=> (and
(= (select $Mem@@3 call31471formal@$ret@0) (select (select $tMems@@12 $s@@25) call31471formal@$ret@0))
(memAddr call31471formal@$ret@0)) (and
(! (or %lbl%@119009 (PtrOk call31471formal@$ret@0)) :lblneg @119009)
(=> (PtrOk call31471formal@$ret@0) (=> (word call31487formal@$val@0) (=> (and
(= call31487formal@$val@0 (select $Mem@@3 call31471formal@$ret@0))
(= call31490formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@119046 (= (ReturnToAddr (select $Mem@@3 esp)) call31490formal@$oldRA@0)) :lblneg @119046)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call31490formal@$oldRA@0) (and
(! (or %lbl%@119057 (Aligned esp)) :lblneg @119057)
(=> (Aligned esp) (=> (and
(= esp@0@@5 (+ esp 4))
(Aligned esp@0@@5)) (and
(! (or %lbl%@119088 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @119088)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@119168 (= call31487formal@$val@0 (StackStateTag (select $StackState $s@@25)))) :lblneg @119168)
(=> (= call31487formal@$val@0 (StackStateTag (select $StackState $s@@25))) (and
(! (or %lbl%@119179 (= ebp ebp)) :lblneg @119179)
(=> (= ebp ebp) (and
(! (or %lbl%@119185 (= esp@0@@5 (+ esp 4))) :lblneg @119185)
(=> (= esp@0@@5 (+ esp 4)) true))))))))))))))))))))))))))))))))))))))))
(let ((anon3_Then_correct@@1 (=> (! (and %lbl%+31500 true) :lblpos +31500) (=> (and
(Jb $Efl@0)
(= ecx@1@@0 ecx)) __L32_correct))))
(let ((anon0_correct@@16 (=> (! (and %lbl%+31499 true) :lblpos +31499) (=> (and
(= call31443formal@$x@0 (OpnReg ecx))
(= call31443formal@$y@0 (OpnReg ?NumStacks))) (and
(! (or %lbl%@118523 (OpnOk $Mem@@3 call31443formal@$x@0)) :lblneg @118523)
(=> (OpnOk $Mem@@3 call31443formal@$x@0) (and
(! (or %lbl%@118528 (OpnOk $Mem@@3 call31443formal@$y@0)) :lblneg @118528)
(=> (OpnOk $Mem@@3 call31443formal@$y@0) (=> (FlagsCmp $Efl@0 (EvalOpn $Mem@@3 call31443formal@$x@0) (EvalOpn $Mem@@3 call31443formal@$y@0)) (and
anon3_Then_correct@@1
anon3_Else_correct@@1))))))))))
(let ((PreconditionGeneratedEntry_correct@@16 (=> (! (and %lbl%+118048 true) :lblpos +118048) (=> (word ecx) (=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)) (=> (and
(= ecx $s@@25)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= (ReturnToAddr (select $Mem@@3 esp)) $RET@@0)
(SpRequire $S@@0 esp 4)) anon0_correct@@16))))))
PreconditionGeneratedEntry_correct@@16)))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31594 () Bool)
(declare-fun %lbl%+31606 () Bool)
(declare-fun %lbl%+31609 () Bool)
(declare-fun %lbl%@120791 () Bool)
(declare-fun eax@2 () Int)
(declare-fun %lbl%@120794 () Bool)
(declare-fun $s@@26 () Int)
(declare-fun %lbl%@120806 () Bool)
(declare-fun %lbl%@120809 () Bool)
(declare-fun $Mem@0@@4 () (Array Int Int))
(declare-fun $tMems@0@@0 () (Array Int (Array Int Int)))
(declare-fun $fMems@0@@0 () (Array Int (Array Int Int)))
(declare-fun call31582formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@121023 () Bool)
(declare-fun %lbl%@121033 () Bool)
(declare-fun esp@0@@6 () Int)
(declare-fun %lbl%@121064 () Bool)
(declare-fun %lbl%@121147 () Bool)
(declare-fun %lbl%@121152 () Bool)
(declare-fun %lbl%+31604 () Bool)
(declare-fun $Efl@9@@0 () Int)
(declare-fun call31544formal@$ret@0 () Int)
(declare-fun %lbl%+31603 () Bool)
(declare-fun %lbl%@120265 () Bool)
(declare-fun %lbl%@120268 () Bool)
(declare-fun call31532formal@$ret@0 () Int)
(declare-fun ecx@1@@1 () Int)
(declare-fun call31535formal@$ret@0 () Int)
(declare-fun %lbl%@120492 () Bool)
(declare-fun call31540formal@$ret@0 () Int)
(declare-fun %lbl%@120537 () Bool)
(declare-fun %lbl%@120565 () Bool)
(declare-fun %lbl%@120584 () Bool)
(declare-fun %lbl%@120614 () Bool)
(declare-fun %lbl%@120638 () Bool)
(declare-fun call31560formal@$val@0 () Int)
(declare-fun call31567formal@$x@0 () T@opn)
(declare-fun call31567formal@$y@0 () T@opn)
(declare-fun %lbl%@120686 () Bool)
(declare-fun %lbl%@120691 () Bool)
(declare-fun %lbl%+31592 () Bool)
(declare-fun $Efl@1 () Int)
(declare-fun %lbl%+31591 () Bool)
(declare-fun StackInterrupted (Int Int Int Int Int Int Int Int Int Int Int) T@StackState)
(declare-fun call31516formal@$x@0 () T@opn)
(declare-fun call31516formal@$y@0 () T@opn)
(declare-fun %lbl%@120154 () Bool)
(declare-fun %lbl%@120159 () Bool)
(declare-fun %lbl%+119195 () Bool)
(push 1)
(set-info :boogie-vc-id ResetStack)
(assert (not
(let ((anon5_Else_correct@@0 (=> (! (and %lbl%+31594 true) :lblpos +31594) true)))
(let ((anon6_Else_correct@@0 (=> (! (and %lbl%+31606 true) :lblpos +31606) true)))
(let ((__L34_correct (=> (! (and %lbl%+31609 true) :lblpos +31609) (and
(! (or %lbl%@120791 (Aligned eax@2)) :lblneg @120791)
(=> (Aligned eax@2) (and
(! (or %lbl%@120794 (= eax@2 (+ ?tLo (* $s@@26 ?TSize)))) :lblneg @120794)
(=> (= eax@2 (+ ?tLo (* $s@@26 ?TSize))) (and
(! (or %lbl%@120806 (isStack $s@@26)) :lblneg @120806)
(=> (isStack $s@@26) (and
(! (or %lbl%@120809 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @120809)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (NucleusInv $S@@0 (store $StackState $s@@26 StackEmpty) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@4 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@0 $fMems@0@@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $Mem@0@@4 (store $Mem@@3 eax@2 ?STACK_EMPTY))
(= call31582formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@121023 (= (ReturnToAddr (select $Mem@0@@4 esp)) call31582formal@$oldRA@0)) :lblneg @121023)
(=> (= (ReturnToAddr (select $Mem@0@@4 esp)) call31582formal@$oldRA@0) (and
(! (or %lbl%@121033 (Aligned esp)) :lblneg @121033)
(=> (Aligned esp) (=> (and
(= esp@0@@6 (+ esp 4))
(Aligned esp@0@@6)) (and
(! (or %lbl%@121064 (NucleusInv $S@@0 (store $StackState $s@@26 StackEmpty) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@4 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@0 $fMems@0@@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @121064)
(=> (NucleusInv $S@@0 (store $StackState $s@@26 StackEmpty) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@4 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@0 $fMems@0@@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@121147 (= ebp ebp)) :lblneg @121147)
(=> (= ebp ebp) (and
(! (or %lbl%@121152 (= esp@0@@6 (+ esp 4))) :lblneg @121152)
(=> (= esp@0@@6 (+ esp 4)) true))))))))))))))))))))))))
(let ((anon6_Then_correct@@0 (=> (! (and %lbl%+31604 true) :lblpos +31604) (=> (and
(Jne $Efl@9@@0)
(= eax@2 call31544formal@$ret@0)) __L34_correct))))
(let ((__L33_correct (=> (! (and %lbl%+31603 true) :lblpos +31603) (and
(! (or %lbl%@120265 (isStack $s@@26)) :lblneg @120265)
(=> (isStack $s@@26) (and
(! (or %lbl%@120268 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @120268)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState $s@@26)) (StackTag $s@@26 $tMems@@12))
(=> (IsYielded (select $StackState $s@@26)) (= (select $StackState $s@@26) (StackYielded (StackEbp $s@@26 $tMems@@12) (+ (StackEsp $s@@26 $tMems@@12) 4) (StackRA $s@@26 $tMems@@12 $fMems@@4))))
(= call31532formal@$ret@0 ecx@1@@1)
(= call31535formal@$ret@0 ?TSize)) (and
(! (or %lbl%@120492 (word (* call31532formal@$ret@0 call31535formal@$ret@0))) :lblneg @120492)
(=> (word (* call31532formal@$ret@0 call31535formal@$ret@0)) (=> (and
(= call31540formal@$ret@0 (* call31532formal@$ret@0 call31535formal@$ret@0))
(= call31540formal@$ret@0 (Mult call31532formal@$ret@0 call31535formal@$ret@0))) (and
(! (or %lbl%@120537 (word (+ call31540formal@$ret@0 TLo@@0))) :lblneg @120537)
(=> (word (+ call31540formal@$ret@0 TLo@@0)) (=> (= call31544formal@$ret@0 (+ call31540formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@120565 (and
(TV TLo@@0)
(TO (* 64 $s@@26)))) :lblneg @120565)
(=> (and
(TV TLo@@0)
(TO (* 64 $s@@26))) (and
(! (or %lbl%@120584 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @120584)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@120614 (tAddr $s@@26 call31544formal@$ret@0)) :lblneg @120614)
(=> (tAddr $s@@26 call31544formal@$ret@0) (=> (and
(= (select $Mem@@3 call31544formal@$ret@0) (select (select $tMems@@12 $s@@26) call31544formal@$ret@0))
(memAddr call31544formal@$ret@0)) (and
(! (or %lbl%@120638 (PtrOk call31544formal@$ret@0)) :lblneg @120638)
(=> (PtrOk call31544formal@$ret@0) (=> (and
(word call31560formal@$val@0)
(= call31560formal@$val@0 (select $Mem@@3 call31544formal@$ret@0))
(= call31567formal@$x@0 (OpnReg call31560formal@$val@0))
(= call31567formal@$y@0 (OpnReg ?STACK_RUNNING))) (and
(! (or %lbl%@120686 (OpnOk $Mem@@3 call31567formal@$x@0)) :lblneg @120686)
(=> (OpnOk $Mem@@3 call31567formal@$x@0) (and
(! (or %lbl%@120691 (OpnOk $Mem@@3 call31567formal@$y@0)) :lblneg @120691)
(=> (OpnOk $Mem@@3 call31567formal@$y@0) (=> (FlagsCmp $Efl@9@@0 (EvalOpn $Mem@@3 call31567formal@$x@0) (EvalOpn $Mem@@3 call31567formal@$y@0)) (and
anon6_Then_correct@@0
anon6_Else_correct@@0))))))))))))))))))))))))))))))))
(let ((anon5_Then_correct@@0 (=> (! (and %lbl%+31592 true) :lblpos +31592) (=> (and
(Jb $Efl@1)
(= ecx@1@@1 ecx)) __L33_correct))))
(let ((anon0_correct@@17 (=> (! (and %lbl%+31591 true) :lblpos +31591) (=> (= (StackStateTag StackEmpty) ?STACK_EMPTY) (=> (and
(= (StackStateTag StackRunning) ?STACK_RUNNING)
(forall (($ebp@@1 Int) ($esp@@6 Int) ($eip@@0 Int) ) (! (= (StackStateTag (StackYielded $ebp@@1 $esp@@6 $eip@@0)) ?STACK_YIELDED)
 :qid |stacksib.74:17|
 :skolemid |79|
 :pattern ( (StackYielded $ebp@@1 $esp@@6 $eip@@0))
))
(forall (($eax Int) ($ebx Int) ($ecx Int) ($edx Int) ($esi Int) ($edi Int) ($ebp@@2 Int) ($esp@@7 Int) ($eip@@1 Int) ($cs Int) ($efl Int) ) (! (= (StackStateTag (StackInterrupted $eax $ebx $ecx $edx $esi $edi $ebp@@2 $esp@@7 $eip@@1 $cs $efl)) ?STACK_INTERRUPTED)
 :qid |stacksib.75:17|
 :skolemid |80|
 :pattern ( (StackInterrupted $eax $ebx $ecx $edx $esi $edi $ebp@@2 $esp@@7 $eip@@1 $cs $efl))
))
(forall (($ebp1 Int) ($esp1 Int) ($eip1 Int) ($ebp2 Int) ($esp2 Int) ($eip2 Int) ) (! (=> (= (StackYielded $ebp1 $esp1 $eip1) (StackYielded $ebp2 $esp2 $eip2)) (and
(= $ebp1 $ebp2)
(= $esp1 $esp2)
(= $eip1 $eip2)))
 :qid |stacksib.78:17|
 :skolemid |81|
 :pattern ( (StackYielded $ebp1 $esp1 $eip1) (StackYielded $ebp2 $esp2 $eip2))
))
(forall (($eax1 Int) ($ebx1 Int) ($ecx1 Int) ($edx1 Int) ($esi1 Int) ($edi1 Int) ($ebp1@@0 Int) ($esp1@@0 Int) ($eip1@@0 Int) ($cs1 Int) ($efl1 Int) ($eax2 Int) ($ebx2 Int) ($ecx2 Int) ($edx2 Int) ($esi2 Int) ($edi2 Int) ($ebp2@@0 Int) ($esp2@@0 Int) ($eip2@@0 Int) ($cs2 Int) ($efl2 Int) ) (! (=> (= (StackInterrupted $eax1 $ebx1 $ecx1 $edx1 $esi1 $edi1 $ebp1@@0 $esp1@@0 $eip1@@0 $cs1 $efl1) (StackInterrupted $eax2 $ebx2 $ecx2 $edx2 $esi2 $edi2 $ebp2@@0 $esp2@@0 $eip2@@0 $cs2 $efl2)) (and
(= $eax1 $eax2)
(= $ebx1 $ebx2)
(= $ecx1 $ecx2)
(= $edx1 $edx2)
(= $esi1 $esi2)
(= $edi1 $edi2)
(= $ebp1@@0 $ebp2@@0)
(= $esp1@@0 $esp2@@0)
(= $eip1@@0 $eip2@@0)
(= $cs1 $cs2)
(= $efl1 $efl2)))
 :qid |stacksib.85:17|
 :skolemid |82|
 :pattern ( (StackInterrupted $eax1 $ebx1 $ecx1 $edx1 $esi1 $edi1 $ebp1@@0 $esp1@@0 $eip1@@0 $cs1 $efl1) (StackInterrupted $eax2 $ebx2 $ecx2 $edx2 $esi2 $edi2 $ebp2@@0 $esp2@@0 $eip2@@0 $cs2 $efl2))
))
(word ?KernelEntryPoint)
(= call31516formal@$x@0 (OpnReg ecx))
(= call31516formal@$y@0 (OpnReg ?NumStacks))) (and
(! (or %lbl%@120154 (OpnOk $Mem@@3 call31516formal@$x@0)) :lblneg @120154)
(=> (OpnOk $Mem@@3 call31516formal@$x@0) (and
(! (or %lbl%@120159 (OpnOk $Mem@@3 call31516formal@$y@0)) :lblneg @120159)
(=> (OpnOk $Mem@@3 call31516formal@$y@0) (=> (FlagsCmp $Efl@1 (EvalOpn $Mem@@3 call31516formal@$x@0) (EvalOpn $Mem@@3 call31516formal@$y@0)) (and
anon5_Then_correct@@0
anon5_Else_correct@@0)))))))))))
(let ((PreconditionGeneratedEntry_correct@@17 (=> (! (and %lbl%+119195 true) :lblpos +119195) (=> (word ecx) (=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)
(= ecx $s@@26)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp)
(=> (not (= (select $StackState $s@@26) StackRunning)) (= (ReturnToAddr (select $Mem@@3 esp)) $RET@@0))
(SpRequire $S@@0 esp 4)) anon0_correct@@17)))))
PreconditionGeneratedEntry_correct@@17))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31920 () Bool)
(declare-fun %lbl%+121163 () Bool)
(declare-fun %lbl%@126886 () Bool)
(declare-fun $s@@27 () Int)
(declare-fun call31717formal@$ret@0 () Int)
(declare-fun %lbl%@126891 () Bool)
(declare-fun CurrentStack@3 () Int)
(declare-fun $Mem@6 () (Array Int Int))
(declare-fun $tMems@6 () (Array Int (Array Int Int)))
(declare-fun $fMems@6 () (Array Int (Array Int Int)))
(declare-fun ebp@2 () Int)
(declare-fun esp@6 () Int)
(declare-fun %lbl%@126995 () Bool)
(declare-fun $ebp@@3 () Int)
(declare-fun $esp@@8 () Int)
(declare-fun $eip@@2 () Int)
(declare-fun $_stackState@@0 () (Array Int T@StackState))
(declare-fun %lbl%@127103 () Bool)
(declare-fun $eax@@0 () Int)
(declare-fun $ebx@@0 () Int)
(declare-fun $ecx@@0 () Int)
(declare-fun $edx@@0 () Int)
(declare-fun $esi@@0 () Int)
(declare-fun $edi@@0 () Int)
(declare-fun $cs@@0 () Int)
(declare-fun $efl@@0 () Int)
(declare-fun eax@3 () Int)
(declare-fun ebx@2 () Int)
(declare-fun ecx@4 () Int)
(declare-fun edx@3 () Int)
(declare-fun esi@2 () Int)
(declare-fun edi@2 () Int)
(declare-fun %lbl%@127269 () Bool)
(declare-fun %lbl%+31932 () Bool)
(declare-fun $Efl@21 () Int)
(declare-fun %lbl%@124213 () Bool)
(declare-fun %lbl%@124217 () Bool)
(declare-fun %lbl%@124223 () Bool)
(declare-fun call31766formal@$ret@0 () Int)
(declare-fun %lbl%@124226 () Bool)
(declare-fun %lbl%@124239 () Bool)
(declare-fun %lbl%@124249 () Bool)
(declare-fun %lbl%@124265 () Bool)
(declare-fun %lbl%@124345 () Bool)
(declare-fun $Mem@0@@5 () (Array Int Int))
(declare-fun $tMems@0@@1 () (Array Int (Array Int Int)))
(declare-fun $fMems@0@@1 () (Array Int (Array Int Int)))
(declare-fun %lbl%@124571 () Bool)
(declare-fun ecx@1@@2 () Int)
(declare-fun %lbl%@124575 () Bool)
(declare-fun $__stackState@0@@0 () (Array Int T@StackState))
(declare-fun %lbl%@124591 () Bool)
(declare-fun call31751formal@$ret@0 () Int)
(declare-fun %lbl%@124594 () Bool)
(declare-fun %lbl%@124606 () Bool)
(declare-fun CurrentStack@0@@0 () Int)
(declare-fun $Mem@1@@3 () (Array Int Int))
(declare-fun $tMems@1@@0 () (Array Int (Array Int Int)))
(declare-fun $fMems@1@@0 () (Array Int (Array Int Int)))
(declare-fun esp@0@@7 () Int)
(declare-fun ebp@0@@0 () Int)
(declare-fun call31799formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@124868 () Bool)
(declare-fun %lbl%@124877 () Bool)
(declare-fun esp@1@@3 () Int)
(declare-fun edx@1@@0 () Int)
(declare-fun esi@0@@2 () Int)
(declare-fun edi@0@@2 () Int)
(declare-fun ebx@0@@0 () Int)
(declare-fun ecx@2@@1 () Int)
(declare-fun eax@1@@0 () Int)
(declare-fun %lbl%+31944 () Bool)
(declare-fun $Efl@22 () Int)
(declare-fun %lbl%@124969 () Bool)
(declare-fun %lbl%@124973 () Bool)
(declare-fun %lbl%@124979 () Bool)
(declare-fun %lbl%@124982 () Bool)
(declare-fun %lbl%@124995 () Bool)
(declare-fun %lbl%@125005 () Bool)
(declare-fun %lbl%@125021 () Bool)
(declare-fun %lbl%@125101 () Bool)
(declare-fun $Mem@2@@2 () (Array Int Int))
(declare-fun $tMems@2 () (Array Int (Array Int Int)))
(declare-fun $fMems@2 () (Array Int (Array Int Int)))
(declare-fun %lbl%@125351 () Bool)
(declare-fun %lbl%@125355 () Bool)
(declare-fun %lbl%@125379 () Bool)
(declare-fun %lbl%@125382 () Bool)
(declare-fun %lbl%@125394 () Bool)
(declare-fun CurrentStack@1 () Int)
(declare-fun $Mem@3@@1 () (Array Int Int))
(declare-fun $tMems@3 () (Array Int (Array Int Int)))
(declare-fun $fMems@3 () (Array Int (Array Int Int)))
(declare-fun esp@2@@1 () Int)
(declare-fun eax@2@@0 () Int)
(declare-fun ebx@1@@0 () Int)
(declare-fun ecx@3 () Int)
(declare-fun edx@2 () Int)
(declare-fun esi@1@@1 () Int)
(declare-fun edi@1@@0 () Int)
(declare-fun ebp@1@@0 () Int)
(declare-fun call31834formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@125714 () Bool)
(declare-fun ReturnToInterrupted (Int Int Int) T@ReturnTo)
(declare-fun %lbl%@125739 () Bool)
(declare-fun esp@3@@1 () Int)
(declare-fun %lbl%+31956 () Bool)
(declare-fun $Efl@26 () Int)
(declare-fun %lbl%@125825 () Bool)
(declare-fun %lbl%@125829 () Bool)
(declare-fun %lbl%@125835 () Bool)
(declare-fun %lbl%@125838 () Bool)
(declare-fun %lbl%@125851 () Bool)
(declare-fun %lbl%@125861 () Bool)
(declare-fun %lbl%@125877 () Bool)
(declare-fun %lbl%@125957 () Bool)
(declare-fun $Mem@4@@1 () (Array Int Int))
(declare-fun $tMems@4 () (Array Int (Array Int Int)))
(declare-fun $fMems@4 () (Array Int (Array Int Int)))
(declare-fun call31855formal@$ret@0 () Int)
(declare-fun call31858formal@$ret@0 () Int)
(declare-fun %lbl%@126216 () Bool)
(declare-fun call31863formal@$ret@0 () Int)
(declare-fun %lbl%@126261 () Bool)
(declare-fun call31867formal@$ret@0 () Int)
(declare-fun %lbl%@126289 () Bool)
(declare-fun call31892formal@$addr@0 () Int)
(declare-fun %lbl%@126332 () Bool)
(declare-fun call31892formal@$ret@0 () Int)
(declare-fun call31895formal@$ret@0 () Int)
(declare-fun %lbl%@126381 () Bool)
(declare-fun %lbl%@126385 () Bool)
(declare-fun %lbl%@126388 () Bool)
(declare-fun %lbl%@126391 () Bool)
(declare-fun %lbl%@126398 () Bool)
(declare-fun %lbl%@126401 () Bool)
(declare-fun %lbl%@126411 () Bool)
(declare-fun %lbl%@126423 () Bool)
(declare-fun %lbl%@126426 () Bool)
(declare-fun %lbl%@126502 () Bool)
(declare-fun $Mem@5 () (Array Int Int))
(declare-fun CurrentStack@2 () Int)
(declare-fun $tMems@5 () (Array Int (Array Int Int)))
(declare-fun $fMems@5 () (Array Int (Array Int Int)))
(declare-fun call31901formal@$ret@0 () Int)
(declare-fun call31904formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@126661 () Bool)
(declare-fun %lbl%@126670 () Bool)
(declare-fun esp@5 () Int)
(declare-fun call31863formal@$hi@0 () Int)
(declare-fun call31748formal@$val@0 () Int)
(declare-fun %lbl%+31954 () Bool)
(declare-fun call31908formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@125778 () Bool)
(declare-fun %lbl%@125789 () Bool)
(declare-fun esp@4@@1 () Int)
(declare-fun call31762formal@$hi@0 () Int)
(declare-fun %lbl%+31942 () Bool)
(declare-fun call31845formal@$x@0 () T@opn)
(declare-fun call31845formal@$y@0 () T@opn)
(declare-fun %lbl%@124928 () Bool)
(declare-fun %lbl%@124933 () Bool)
(declare-fun %lbl%+31930 () Bool)
(declare-fun call31810formal@$x@0 () T@opn)
(declare-fun call31810formal@$y@0 () T@opn)
(declare-fun %lbl%@124172 () Bool)
(declare-fun %lbl%@124177 () Bool)
(declare-fun %lbl%+31929 () Bool)
(declare-fun %lbl%@123330 () Bool)
(declare-fun %lbl%@123333 () Bool)
(declare-fun call31694formal@$ret@0 () Int)
(declare-fun call31697formal@$ret@0 () Int)
(declare-fun %lbl%@123557 () Bool)
(declare-fun call31702formal@$ret@0 () Int)
(declare-fun %lbl%@123602 () Bool)
(declare-fun call31706formal@$ret@0 () Int)
(declare-fun %lbl%@123635 () Bool)
(declare-fun call31710formal@$ret@0 () Int)
(declare-fun %lbl%@123668 () Bool)
(declare-fun call31714formal@$ret@0 () Int)
(declare-fun call31720formal@$ret@0 () Int)
(declare-fun call31723formal@$ret@0 () Int)
(declare-fun %lbl%@123764 () Bool)
(declare-fun call31728formal@$ret@0 () Int)
(declare-fun %lbl%@123809 () Bool)
(declare-fun call31732formal@$ret@0 () Int)
(declare-fun %lbl%@123837 () Bool)
(declare-fun %lbl%@123856 () Bool)
(declare-fun %lbl%@123886 () Bool)
(declare-fun %lbl%@123910 () Bool)
(declare-fun call31754formal@$ret@0 () Int)
(declare-fun call31757formal@$ret@0 () Int)
(declare-fun %lbl%@124008 () Bool)
(declare-fun call31762formal@$ret@0 () Int)
(declare-fun %lbl%@124053 () Bool)
(declare-fun %lbl%@124081 () Bool)
(declare-fun call31783formal@$x@0 () T@opn)
(declare-fun call31783formal@$y@0 () T@opn)
(declare-fun %lbl%@124114 () Bool)
(declare-fun %lbl%@124119 () Bool)
(declare-fun %lbl%+31918 () Bool)
(declare-fun $Efl@1@@0 () Int)
(declare-fun %lbl%+31917 () Bool)
(declare-fun call31663formal@$x@0 () T@opn)
(declare-fun call31663formal@$y@0 () T@opn)
(declare-fun %lbl%@123191 () Bool)
(declare-fun %lbl%@123196 () Bool)
(declare-fun %lbl%+121169 () Bool)
(push 1)
(set-info :boogie-vc-id YieldTo)
(assert (not
(let ((anon11_Else_correct@@1 (=> (! (and %lbl%+31920 true) :lblpos +31920) true)))
(let ((GeneratedUnifiedExit_correct@@4 (=> (! (and %lbl%+121163 true) :lblpos +121163) (and
(! (or %lbl%@126886 (StackCheckInv $s@@27 call31717formal@$ret@0)) :lblneg @126886)
(=> (StackCheckInv $s@@27 call31717formal@$ret@0) (and
(! (or %lbl%@126891 (=> (= (select $StackState $s@@27) StackRunning) (and
(NucleusInv $s@@27 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 ebp)
(= esp@6 (+ esp 4))))) :lblneg @126891)
(=> (=> (= (select $StackState $s@@27) StackRunning) (and
(NucleusInv $s@@27 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 ebp)
(= esp@6 (+ esp 4)))) (and
(! (or %lbl%@126995 (=> (= (select $StackState $s@@27) (StackYielded $ebp@@3 $esp@@8 $eip@@2)) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 $ebp@@3)
(= esp@6 $esp@@8)))) :lblneg @126995)
(=> (=> (= (select $StackState $s@@27) (StackYielded $ebp@@3 $esp@@8 $eip@@2)) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 $ebp@@3)
(= esp@6 $esp@@8))) (and
(! (or %lbl%@127103 (=> (= (select $StackState $s@@27) (StackInterrupted $eax@@0 $ebx@@0 $ecx@@0 $edx@@0 $esi@@0 $edi@@0 $ebp@@3 $esp@@8 $eip@@2 $cs@@0 $efl@@0)) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 $ebp@@3)
(= esp@6 $esp@@8)
(= eax@3 $eax@@0)
(= ebx@2 $ebx@@0)
(= ecx@4 $ecx@@0)
(= edx@3 $edx@@0)
(= esi@2 $esi@@0)
(= edi@2 $edi@@0)))) :lblneg @127103)
(=> (=> (= (select $StackState $s@@27) (StackInterrupted $eax@@0 $ebx@@0 $ecx@@0 $edx@@0 $esi@@0 $edi@@0 $ebp@@3 $esp@@8 $eip@@2 $cs@@0 $efl@@0)) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 $ebp@@3)
(= esp@6 $esp@@8)
(= eax@3 $eax@@0)
(= ebx@2 $ebx@@0)
(= ecx@4 $ecx@@0)
(= edx@3 $edx@@0)
(= esi@2 $esi@@0)
(= edi@2 $edi@@0))) (and
(! (or %lbl%@127269 (=> (= (select $StackState $s@@27) StackEmpty) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= esp@6 (- (StackHi $s@@27) 4))
(= ebp@2 0)))) :lblneg @127269)
(=> (=> (= (select $StackState $s@@27) StackEmpty) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= esp@6 (- (StackHi $s@@27) 4))
(= ebp@2 0))) true)))))))))))))
(let ((anon12_Else_correct@@1 (=> (! (and %lbl%+31932 true) :lblpos +31932) (=> (not (Jne $Efl@21)) (and
(! (or %lbl%@124213 (Aligned esp)) :lblneg @124213)
(=> (Aligned esp) (and
(! (or %lbl%@124217 (fAddr $S@@0 esp)) :lblneg @124217)
(=> (fAddr $S@@0 esp) (and
(! (or %lbl%@124223 (Aligned call31766formal@$ret@0)) :lblneg @124223)
(=> (Aligned call31766formal@$ret@0) (and
(! (or %lbl%@124226 (= call31766formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize)))) :lblneg @124226)
(=> (= call31766formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize))) (and
(! (or %lbl%@124239 (and
(word ebp)
(word esp))) :lblneg @124239)
(=> (and
(word ebp)
(word esp)) (and
(! (or %lbl%@124249 (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning))) :lblneg @124249)
(=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)) (and
(! (or %lbl%@124265 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @124265)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@124345 (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp)) :lblneg @124345)
(=> (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp) (=> (NucleusInv $S@@0 (store $StackState $S@@0 (StackYielded ebp (+ esp 4) (select $Mem@0@@5 esp))) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@1 $fMems@0@@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(MemInv $Mem@0@@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@1 $fMems@0@@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(= $Mem@0@@5 (store (store (store $Mem@@3 call31766formal@$ret@0 ?STACK_YIELDED) (+ call31766formal@$ret@0 4) esp) (+ call31766formal@$ret@0 8) ebp))) (and
(! (or %lbl%@124571 (= ecx@1@@2 $s@@27)) :lblneg @124571)
(=> (= ecx@1@@2 $s@@27) (and
(! (or %lbl%@124575 (and
(isStack $s@@27)
(= (select $__stackState@0@@0 $s@@27) (StackYielded $ebp@@3 $esp@@8 $eip@@2)))) :lblneg @124575)
(=> (and
(isStack $s@@27)
(= (select $__stackState@0@@0 $s@@27) (StackYielded $ebp@@3 $esp@@8 $eip@@2))) (and
(! (or %lbl%@124591 (Aligned call31751formal@$ret@0)) :lblneg @124591)
(=> (Aligned call31751formal@$ret@0) (and
(! (or %lbl%@124594 (= call31751formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize)))) :lblneg @124594)
(=> (= call31751formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize))) (and
(! (or %lbl%@124606 (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@1 $fMems@0@@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @124606)
(=> (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@0@@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@1 $fMems@0@@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(NucleusInv $s@@27 (store $__stackState@0@@0 $s@@27 StackRunning) $toAbs@@4 $AbsMem@@3 CurrentStack@0@@0 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@1@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@1@@0 $fMems@1@@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= esp@0@@7 (- $esp@@8 4))) (=> (and
(= ebp@0@@0 $ebp@@3)
(Aligned esp@0@@7)
(= (select $Mem@1@@3 (- $esp@@8 4)) $eip@@2)
(= call31799formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@124868 (= (ReturnToAddr (select $Mem@1@@3 esp@0@@7)) call31799formal@$oldRA@0)) :lblneg @124868)
(=> (= (ReturnToAddr (select $Mem@1@@3 esp@0@@7)) call31799formal@$oldRA@0) (and
(! (or %lbl%@124877 (Aligned esp@0@@7)) :lblneg @124877)
(=> (Aligned esp@0@@7) (=> (and
(= esp@1@@3 (+ esp@0@@7 4))
(Aligned esp@1@@3)) (=> (and
(= esp@6 esp@1@@3)
(= CurrentStack@3 CurrentStack@0@@0)
(= edx@3 edx@1@@0)
(= esi@2 esi@0@@2)) (=> (and
(= edi@2 edi@0@@2)
(= ebx@2 ebx@0@@0)
(= $tMems@6 $tMems@1@@0)
(= $Mem@6 $Mem@1@@3)
(= ebp@2 ebp@0@@0)
(= ecx@4 ecx@2@@1)
(= $fMems@6 $fMems@1@@0)
(= eax@3 eax@1@@0)) GeneratedUnifiedExit_correct@@4)))))))))))))))))))))))))))))))))))))))))
(let ((anon13_Else_correct@@0 (=> (! (and %lbl%+31944 true) :lblpos +31944) (=> (not (Jne $Efl@22)) (and
(! (or %lbl%@124969 (Aligned esp)) :lblneg @124969)
(=> (Aligned esp) (and
(! (or %lbl%@124973 (fAddr $S@@0 esp)) :lblneg @124973)
(=> (fAddr $S@@0 esp) (and
(! (or %lbl%@124979 (Aligned call31766formal@$ret@0)) :lblneg @124979)
(=> (Aligned call31766formal@$ret@0) (and
(! (or %lbl%@124982 (= call31766formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize)))) :lblneg @124982)
(=> (= call31766formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize))) (and
(! (or %lbl%@124995 (and
(word ebp)
(word esp))) :lblneg @124995)
(=> (and
(word ebp)
(word esp)) (and
(! (or %lbl%@125005 (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning))) :lblneg @125005)
(=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)) (and
(! (or %lbl%@125021 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @125021)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@125101 (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp)) :lblneg @125101)
(=> (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp) (=> (NucleusInv $S@@0 (store $StackState $S@@0 (StackYielded ebp (+ esp 4) (select $Mem@2@@2 esp))) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@2@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@2 $fMems@2 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(MemInv $Mem@2@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@2 $fMems@2 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(= $Mem@2@@2 (store (store (store $Mem@@3 call31766formal@$ret@0 ?STACK_YIELDED) (+ call31766formal@$ret@0 4) esp) (+ call31766formal@$ret@0 8) ebp))) (and
(! (or %lbl%@125351 (= ecx@1@@2 $s@@27)) :lblneg @125351)
(=> (= ecx@1@@2 $s@@27) (and
(! (or %lbl%@125355 (and
(isStack $s@@27)
(= (select $__stackState@0@@0 $s@@27) (StackInterrupted $eax@@0 $ebx@@0 $ecx@@0 $edx@@0 $esi@@0 $edi@@0 $ebp@@3 $esp@@8 $eip@@2 $cs@@0 $efl@@0)))) :lblneg @125355)
(=> (and
(isStack $s@@27)
(= (select $__stackState@0@@0 $s@@27) (StackInterrupted $eax@@0 $ebx@@0 $ecx@@0 $edx@@0 $esi@@0 $edi@@0 $ebp@@3 $esp@@8 $eip@@2 $cs@@0 $efl@@0))) (and
(! (or %lbl%@125379 (Aligned call31751formal@$ret@0)) :lblneg @125379)
(=> (Aligned call31751formal@$ret@0) (and
(! (or %lbl%@125382 (= call31751formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize)))) :lblneg @125382)
(=> (= call31751formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize))) (and
(! (or %lbl%@125394 (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@2@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@2 $fMems@2 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @125394)
(=> (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@2@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@2 $fMems@2 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(NucleusInv $s@@27 (store $__stackState@0@@0 $s@@27 StackRunning) $toAbs@@4 $AbsMem@@3 CurrentStack@1 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@3@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@3 $fMems@3 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= esp@2@@1 (- $esp@@8 12))) (=> (and
(= eax@2@@0 $eax@@0)
(= ebx@1@@0 $ebx@@0)
(= ecx@3 $ecx@@0)
(= edx@2 $edx@@0)
(= esi@1@@1 $esi@@0)
(= edi@1@@0 $edi@@0)
(= ebp@1@@0 $ebp@@3)
(Aligned esp@2@@1)
(= (select $Mem@3@@1 (- $esp@@8 4)) $efl@@0)
(= (select $Mem@3@@1 (- $esp@@8 8)) $cs@@0)
(= (select $Mem@3@@1 (- $esp@@8 12)) $eip@@2)
(= call31834formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@125714 (= (ReturnToInterrupted (select $Mem@3@@1 esp@2@@1) (select $Mem@3@@1 (+ esp@2@@1 4)) (select $Mem@3@@1 (+ esp@2@@1 8))) call31834formal@$oldRA@0)) :lblneg @125714)
(=> (= (ReturnToInterrupted (select $Mem@3@@1 esp@2@@1) (select $Mem@3@@1 (+ esp@2@@1 4)) (select $Mem@3@@1 (+ esp@2@@1 8))) call31834formal@$oldRA@0) (and
(! (or %lbl%@125739 (Aligned esp@2@@1)) :lblneg @125739)
(=> (Aligned esp@2@@1) (=> (and
(= esp@3@@1 (+ esp@2@@1 12))
(Aligned esp@3@@1)) (=> (and
(= esp@6 esp@3@@1)
(= CurrentStack@3 CurrentStack@1)
(= edx@3 edx@2)
(= esi@2 esi@1@@1)) (=> (and
(= edi@2 edi@1@@0)
(= ebx@2 ebx@1@@0)
(= $tMems@6 $tMems@3)
(= $Mem@6 $Mem@3@@1)
(= ebp@2 ebp@1@@0)
(= ecx@4 ecx@3)
(= $fMems@6 $fMems@3)
(= eax@3 eax@2@@0)) GeneratedUnifiedExit_correct@@4)))))))))))))))))))))))))))))))))))))))))
(let ((anon14_Else_correct@@0 (=> (! (and %lbl%+31956 true) :lblpos +31956) (=> (not (Jne $Efl@26)) (and
(! (or %lbl%@125825 (Aligned esp)) :lblneg @125825)
(=> (Aligned esp) (and
(! (or %lbl%@125829 (fAddr $S@@0 esp)) :lblneg @125829)
(=> (fAddr $S@@0 esp) (and
(! (or %lbl%@125835 (Aligned call31766formal@$ret@0)) :lblneg @125835)
(=> (Aligned call31766formal@$ret@0) (and
(! (or %lbl%@125838 (= call31766formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize)))) :lblneg @125838)
(=> (= call31766formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize))) (and
(! (or %lbl%@125851 (and
(word ebp)
(word esp))) :lblneg @125851)
(=> (and
(word ebp)
(word esp)) (and
(! (or %lbl%@125861 (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning))) :lblneg @125861)
(=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)) (and
(! (or %lbl%@125877 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @125877)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@125957 (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp)) :lblneg @125957)
(=> (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp) (=> (NucleusInv $S@@0 (store $StackState $S@@0 (StackYielded ebp (+ esp 4) (select $Mem@4@@1 esp))) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@4@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@4 $fMems@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(MemInv $Mem@4@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@4 $fMems@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(= $Mem@4@@1 (store (store (store $Mem@@3 call31766formal@$ret@0 ?STACK_YIELDED) (+ call31766formal@$ret@0 4) esp) (+ call31766formal@$ret@0 8) ebp))
(= call31855formal@$ret@0 ecx@1@@2)
(= call31858formal@$ret@0 ?FSize)) (and
(! (or %lbl%@126216 (word (* call31855formal@$ret@0 call31858formal@$ret@0))) :lblneg @126216)
(=> (word (* call31855formal@$ret@0 call31858formal@$ret@0)) (=> (and
(= call31863formal@$ret@0 (* call31855formal@$ret@0 call31858formal@$ret@0))
(= call31863formal@$ret@0 (Mult call31855formal@$ret@0 call31858formal@$ret@0))) (and
(! (or %lbl%@126261 (word (+ call31863formal@$ret@0 FLo@@0))) :lblneg @126261)
(=> (word (+ call31863formal@$ret@0 FLo@@0)) (=> (= call31867formal@$ret@0 (+ call31863formal@$ret@0 FLo@@0)) (and
(! (or %lbl%@126289 (and
(TV FLo@@0)
(TO (+ (* $s@@27 4096) 4094))
(TO (+ (* $s@@27 4096) 4095)))) :lblneg @126289)
(=> (and
(TV FLo@@0)
(TO (+ (* $s@@27 4096) 4094))
(TO (+ (* $s@@27 4096) 4095))) (=> (= call31892formal@$addr@0 (+ call31867formal@$ret@0 16376)) (and
(! (or %lbl%@126332 (word call31892formal@$addr@0)) :lblneg @126332)
(=> (word call31892formal@$addr@0) (=> (and
(= call31892formal@$ret@0 call31892formal@$addr@0)
(= call31895formal@$ret@0 ?KernelEntryPoint)) (and
(! (or %lbl%@126381 (= ecx@1@@2 $s@@27)) :lblneg @126381)
(=> (= ecx@1@@2 $s@@27) (and
(! (or %lbl%@126385 (isStack $s@@27)) :lblneg @126385)
(=> (isStack $s@@27) (and
(! (or %lbl%@126388 (Aligned call31892formal@$ret@0)) :lblneg @126388)
(=> (Aligned call31892formal@$ret@0) (and
(! (or %lbl%@126391 (Aligned (+ call31892formal@$ret@0 4))) :lblneg @126391)
(=> (Aligned (+ call31892formal@$ret@0 4)) (and
(! (or %lbl%@126398 (Aligned call31751formal@$ret@0)) :lblneg @126398)
(=> (Aligned call31751formal@$ret@0) (and
(! (or %lbl%@126401 (= call31892formal@$ret@0 (- (StackHi $s@@27) 8))) :lblneg @126401)
(=> (= call31892formal@$ret@0 (- (StackHi $s@@27) 8)) (and
(! (or %lbl%@126411 (= call31751formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize)))) :lblneg @126411)
(=> (= call31751formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize))) (and
(! (or %lbl%@126423 (word call31895formal@$ret@0)) :lblneg @126423)
(=> (word call31895formal@$ret@0) (and
(! (or %lbl%@126426 (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@4@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@4 $fMems@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @126426)
(=> (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@4@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@4 $fMems@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@126502 (= (select $FrameCounts@@2 $s@@27) 0)) :lblneg @126502)
(=> (= (select $FrameCounts@@2 $s@@27) 0) (=> (and
(= (select $Mem@5 (+ call31892formal@$ret@0 0)) call31895formal@$ret@0)
(NucleusInv $s@@27 (store $__stackState@0@@0 $s@@27 StackRunning) $toAbs@@4 $AbsMem@@3 CurrentStack@2 $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@5 $fMems@5 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= call31901formal@$ret@0 0)
(= call31904formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@126661 (= (ReturnToAddr (select $Mem@5 call31892formal@$ret@0)) call31904formal@$oldRA@0)) :lblneg @126661)
(=> (= (ReturnToAddr (select $Mem@5 call31892formal@$ret@0)) call31904formal@$oldRA@0) (and
(! (or %lbl%@126670 (Aligned call31892formal@$ret@0)) :lblneg @126670)
(=> (Aligned call31892formal@$ret@0) (=> (and
(= esp@5 (+ call31892formal@$ret@0 4))
(Aligned esp@5)) (=> (and
(= esp@6 esp@5)
(= CurrentStack@3 CurrentStack@2)
(= edx@3 call31863formal@$hi@0)
(= esi@2 esi)) (=> (and
(= edi@2 call31751formal@$ret@0)
(= ebx@2 call31748formal@$val@0)
(= $tMems@6 $tMems@5)
(= $Mem@6 $Mem@5)
(= ebp@2 call31901formal@$ret@0)
(= ecx@4 ecx@1@@2)
(= $fMems@6 $fMems@5)
(= eax@3 call31895formal@$ret@0)) GeneratedUnifiedExit_correct@@4))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon14_Then_correct@@0 (=> (! (and %lbl%+31954 true) :lblpos +31954) (=> (and
(Jne $Efl@26)
(= call31908formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@125778 (= (ReturnToAddr (select $Mem@@3 esp)) call31908formal@$oldRA@0)) :lblneg @125778)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call31908formal@$oldRA@0) (and
(! (or %lbl%@125789 (Aligned esp)) :lblneg @125789)
(=> (Aligned esp) (=> (and
(= esp@4@@1 (+ esp 4))
(Aligned esp@4@@1)) (=> (and
(= esp@6 esp@4@@1)
(= CurrentStack@3 CurrentStack)
(= edx@3 call31762formal@$hi@0)
(= esi@2 esi)) (=> (and
(= edi@2 call31751formal@$ret@0)
(= ebx@2 call31748formal@$val@0)
(= $tMems@6 $tMems@@12)
(= $Mem@6 $Mem@@3)
(= ebp@2 ebp)
(= ecx@4 ecx@1@@2)
(= $fMems@6 $fMems@@4)
(= eax@3 call31766formal@$ret@0)) GeneratedUnifiedExit_correct@@4)))))))))))
(let ((anon13_Then_correct@@0 (=> (! (and %lbl%+31942 true) :lblpos +31942) (=> (Jne $Efl@22) (=> (and
(= call31845formal@$x@0 (OpnReg call31748formal@$val@0))
(= call31845formal@$y@0 (OpnReg ?STACK_EMPTY))) (and
(! (or %lbl%@124928 (OpnOk $Mem@@3 call31845formal@$x@0)) :lblneg @124928)
(=> (OpnOk $Mem@@3 call31845formal@$x@0) (and
(! (or %lbl%@124933 (OpnOk $Mem@@3 call31845formal@$y@0)) :lblneg @124933)
(=> (OpnOk $Mem@@3 call31845formal@$y@0) (=> (FlagsCmp $Efl@26 (EvalOpn $Mem@@3 call31845formal@$x@0) (EvalOpn $Mem@@3 call31845formal@$y@0)) (and
anon14_Then_correct@@0
anon14_Else_correct@@0)))))))))))
(let ((anon12_Then_correct@@1 (=> (! (and %lbl%+31930 true) :lblpos +31930) (=> (Jne $Efl@21) (=> (and
(= call31810formal@$x@0 (OpnReg call31748formal@$val@0))
(= call31810formal@$y@0 (OpnReg ?STACK_INTERRUPTED))) (and
(! (or %lbl%@124172 (OpnOk $Mem@@3 call31810formal@$x@0)) :lblneg @124172)
(=> (OpnOk $Mem@@3 call31810formal@$x@0) (and
(! (or %lbl%@124177 (OpnOk $Mem@@3 call31810formal@$y@0)) :lblneg @124177)
(=> (OpnOk $Mem@@3 call31810formal@$y@0) (=> (FlagsCmp $Efl@22 (EvalOpn $Mem@@3 call31810formal@$x@0) (EvalOpn $Mem@@3 call31810formal@$y@0)) (and
anon13_Then_correct@@0
anon13_Else_correct@@0)))))))))))
(let ((__L35_correct (=> (! (and %lbl%+31929 true) :lblpos +31929) (=> (= $__stackState@0@@0 (store $StackState $S@@0 (StackYielded ebp (+ esp 4) (select $Mem@@3 esp)))) (and
(! (or %lbl%@123330 (isStack $s@@27)) :lblneg @123330)
(=> (isStack $s@@27) (and
(! (or %lbl%@123333 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @123333)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState $s@@27)) (StackTag $s@@27 $tMems@@12))
(=> (IsYielded (select $StackState $s@@27)) (= (select $StackState $s@@27) (StackYielded (StackEbp $s@@27 $tMems@@12) (+ (StackEsp $s@@27 $tMems@@12) 4) (StackRA $s@@27 $tMems@@12 $fMems@@4))))
(= call31694formal@$ret@0 ecx@1@@2)
(= call31697formal@$ret@0 ?FSize)) (and
(! (or %lbl%@123557 (word (* call31694formal@$ret@0 call31697formal@$ret@0))) :lblneg @123557)
(=> (word (* call31694formal@$ret@0 call31697formal@$ret@0)) (=> (and
(= call31702formal@$ret@0 (* call31694formal@$ret@0 call31697formal@$ret@0))
(= call31702formal@$ret@0 (Mult call31694formal@$ret@0 call31697formal@$ret@0))) (and
(! (or %lbl%@123602 (word (+ call31702formal@$ret@0 FLo@@0))) :lblneg @123602)
(=> (word (+ call31702formal@$ret@0 FLo@@0)) (=> (= call31706formal@$ret@0 (+ call31702formal@$ret@0 FLo@@0)) (and
(! (or %lbl%@123635 (word (+ call31706formal@$ret@0 ?StackReserve))) :lblneg @123635)
(=> (word (+ call31706formal@$ret@0 ?StackReserve)) (=> (= call31710formal@$ret@0 (+ call31706formal@$ret@0 ?StackReserve)) (and
(! (or %lbl%@123668 (word (+ call31710formal@$ret@0 ?InterruptReserve))) :lblneg @123668)
(=> (word (+ call31710formal@$ret@0 ?InterruptReserve)) (=> (and
(= call31714formal@$ret@0 (+ call31710formal@$ret@0 ?InterruptReserve))
(= call31717formal@$ret@0 call31714formal@$ret@0)
(= call31720formal@$ret@0 ecx@1@@2)
(= call31723formal@$ret@0 ?TSize)) (and
(! (or %lbl%@123764 (word (* call31720formal@$ret@0 call31723formal@$ret@0))) :lblneg @123764)
(=> (word (* call31720formal@$ret@0 call31723formal@$ret@0)) (=> (and
(= call31728formal@$ret@0 (* call31720formal@$ret@0 call31723formal@$ret@0))
(= call31728formal@$ret@0 (Mult call31720formal@$ret@0 call31723formal@$ret@0))) (and
(! (or %lbl%@123809 (word (+ call31728formal@$ret@0 TLo@@0))) :lblneg @123809)
(=> (word (+ call31728formal@$ret@0 TLo@@0)) (=> (= call31732formal@$ret@0 (+ call31728formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@123837 (and
(TV TLo@@0)
(TO (* 64 $s@@27)))) :lblneg @123837)
(=> (and
(TV TLo@@0)
(TO (* 64 $s@@27))) (and
(! (or %lbl%@123856 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @123856)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@123886 (tAddr $s@@27 call31732formal@$ret@0)) :lblneg @123886)
(=> (tAddr $s@@27 call31732formal@$ret@0) (=> (and
(= (select $Mem@@3 call31732formal@$ret@0) (select (select $tMems@@12 $s@@27) call31732formal@$ret@0))
(memAddr call31732formal@$ret@0)) (and
(! (or %lbl%@123910 (PtrOk call31732formal@$ret@0)) :lblneg @123910)
(=> (PtrOk call31732formal@$ret@0) (=> (word call31748formal@$val@0) (=> (and
(= call31748formal@$val@0 (select $Mem@@3 call31732formal@$ret@0))
(= call31751formal@$ret@0 call31732formal@$ret@0)
(= call31754formal@$ret@0 CurrentStack)
(= call31757formal@$ret@0 ?TSize)) (and
(! (or %lbl%@124008 (word (* call31754formal@$ret@0 call31757formal@$ret@0))) :lblneg @124008)
(=> (word (* call31754formal@$ret@0 call31757formal@$ret@0)) (=> (and
(= call31762formal@$ret@0 (* call31754formal@$ret@0 call31757formal@$ret@0))
(= call31762formal@$ret@0 (Mult call31754formal@$ret@0 call31757formal@$ret@0))) (and
(! (or %lbl%@124053 (word (+ call31762formal@$ret@0 TLo@@0))) :lblneg @124053)
(=> (word (+ call31762formal@$ret@0 TLo@@0)) (=> (= call31766formal@$ret@0 (+ call31762formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@124081 (and
(TV TLo@@0)
(TO (* 64 $S@@0)))) :lblneg @124081)
(=> (and
(TV TLo@@0)
(TO (* 64 $S@@0))) (=> (and
(= call31783formal@$x@0 (OpnReg call31748formal@$val@0))
(= call31783formal@$y@0 (OpnReg ?STACK_YIELDED))) (and
(! (or %lbl%@124114 (OpnOk $Mem@@3 call31783formal@$x@0)) :lblneg @124114)
(=> (OpnOk $Mem@@3 call31783formal@$x@0) (and
(! (or %lbl%@124119 (OpnOk $Mem@@3 call31783formal@$y@0)) :lblneg @124119)
(=> (OpnOk $Mem@@3 call31783formal@$y@0) (=> (FlagsCmp $Efl@21 (EvalOpn $Mem@@3 call31783formal@$x@0) (EvalOpn $Mem@@3 call31783formal@$y@0)) (and
anon12_Then_correct@@1
anon12_Else_correct@@1)))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon11_Then_correct@@1 (=> (! (and %lbl%+31918 true) :lblpos +31918) (=> (and
(Jb $Efl@1@@0)
(= ecx@1@@2 ecx)) __L35_correct))))
(let ((anon0_correct@@18 (=> (! (and %lbl%+31917 true) :lblpos +31917) (=> (= (StackStateTag StackEmpty) ?STACK_EMPTY) (=> (and
(= (StackStateTag StackRunning) ?STACK_RUNNING)
(forall (($ebp@@4 Int) ($esp@@9 Int) ($eip@@3 Int) ) (! (= (StackStateTag (StackYielded $ebp@@4 $esp@@9 $eip@@3)) ?STACK_YIELDED)
 :qid |stacksib.74:17|
 :skolemid |79|
 :pattern ( (StackYielded $ebp@@4 $esp@@9 $eip@@3))
))
(forall (($eax@@1 Int) ($ebx@@1 Int) ($ecx@@1 Int) ($edx@@1 Int) ($esi@@1 Int) ($edi@@1 Int) ($ebp@@5 Int) ($esp@@10 Int) ($eip@@4 Int) ($cs@@1 Int) ($efl@@1 Int) ) (! (= (StackStateTag (StackInterrupted $eax@@1 $ebx@@1 $ecx@@1 $edx@@1 $esi@@1 $edi@@1 $ebp@@5 $esp@@10 $eip@@4 $cs@@1 $efl@@1)) ?STACK_INTERRUPTED)
 :qid |stacksib.75:17|
 :skolemid |80|
 :pattern ( (StackInterrupted $eax@@1 $ebx@@1 $ecx@@1 $edx@@1 $esi@@1 $edi@@1 $ebp@@5 $esp@@10 $eip@@4 $cs@@1 $efl@@1))
))
(forall (($ebp1@@1 Int) ($esp1@@1 Int) ($eip1@@1 Int) ($ebp2@@1 Int) ($esp2@@1 Int) ($eip2@@1 Int) ) (! (=> (= (StackYielded $ebp1@@1 $esp1@@1 $eip1@@1) (StackYielded $ebp2@@1 $esp2@@1 $eip2@@1)) (and
(= $ebp1@@1 $ebp2@@1)
(= $esp1@@1 $esp2@@1)
(= $eip1@@1 $eip2@@1)))
 :qid |stacksib.78:17|
 :skolemid |81|
 :pattern ( (StackYielded $ebp1@@1 $esp1@@1 $eip1@@1) (StackYielded $ebp2@@1 $esp2@@1 $eip2@@1))
))
(forall (($eax1@@0 Int) ($ebx1@@0 Int) ($ecx1@@0 Int) ($edx1@@0 Int) ($esi1@@0 Int) ($edi1@@0 Int) ($ebp1@@2 Int) ($esp1@@2 Int) ($eip1@@2 Int) ($cs1@@0 Int) ($efl1@@0 Int) ($eax2@@0 Int) ($ebx2@@0 Int) ($ecx2@@0 Int) ($edx2@@0 Int) ($esi2@@0 Int) ($edi2@@0 Int) ($ebp2@@2 Int) ($esp2@@2 Int) ($eip2@@2 Int) ($cs2@@0 Int) ($efl2@@0 Int) ) (! (=> (= (StackInterrupted $eax1@@0 $ebx1@@0 $ecx1@@0 $edx1@@0 $esi1@@0 $edi1@@0 $ebp1@@2 $esp1@@2 $eip1@@2 $cs1@@0 $efl1@@0) (StackInterrupted $eax2@@0 $ebx2@@0 $ecx2@@0 $edx2@@0 $esi2@@0 $edi2@@0 $ebp2@@2 $esp2@@2 $eip2@@2 $cs2@@0 $efl2@@0)) (and
(= $eax1@@0 $eax2@@0)
(= $ebx1@@0 $ebx2@@0)
(= $ecx1@@0 $ecx2@@0)
(= $edx1@@0 $edx2@@0)
(= $esi1@@0 $esi2@@0)
(= $edi1@@0 $edi2@@0)
(= $ebp1@@2 $ebp2@@2)
(= $esp1@@2 $esp2@@2)
(= $eip1@@2 $eip2@@2)
(= $cs1@@0 $cs2@@0)
(= $efl1@@0 $efl2@@0)))
 :qid |stacksib.85:17|
 :skolemid |82|
 :pattern ( (StackInterrupted $eax1@@0 $ebx1@@0 $ecx1@@0 $edx1@@0 $esi1@@0 $edi1@@0 $ebp1@@2 $esp1@@2 $eip1@@2 $cs1@@0 $efl1@@0) (StackInterrupted $eax2@@0 $ebx2@@0 $ecx2@@0 $edx2@@0 $esi2@@0 $edi2@@0 $ebp2@@2 $esp2@@2 $eip2@@2 $cs2@@0 $efl2@@0))
))
(word ?KernelEntryPoint)
(= call31663formal@$x@0 (OpnReg ecx))
(= call31663formal@$y@0 (OpnReg ?NumStacks))) (and
(! (or %lbl%@123191 (OpnOk $Mem@@3 call31663formal@$x@0)) :lblneg @123191)
(=> (OpnOk $Mem@@3 call31663formal@$x@0) (and
(! (or %lbl%@123196 (OpnOk $Mem@@3 call31663formal@$y@0)) :lblneg @123196)
(=> (OpnOk $Mem@@3 call31663formal@$y@0) (=> (FlagsCmp $Efl@1@@0 (EvalOpn $Mem@@3 call31663formal@$x@0) (EvalOpn $Mem@@3 call31663formal@$y@0)) (and
anon11_Then_correct@@1
anon11_Else_correct@@1)))))))))))
(let ((PreconditionGeneratedEntry_correct@@18 (=> (! (and %lbl%+121169 true) :lblpos +121169) (=> (= ecx $s@@27) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp)
(SpRequire $S@@0 esp 4)
(= $_stackState@@0 (store (store $StackState $S@@0 (StackYielded ebp (+ esp 4) (select $Mem@@3 esp))) $s@@27 StackRunning))
(or
(and
(= (select $StackState $s@@27) StackRunning)
(= $s@@27 $S@@0)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp))))
(and
(= (select $StackState $s@@27) (StackYielded $ebp@@3 $esp@@8 $eip@@2))
(= $RET@@0 (ReturnToAddr $eip@@2)))
(and
(= (select $StackState $s@@27) (StackInterrupted $eax@@0 $ebx@@0 $ecx@@0 $edx@@0 $esi@@0 $edi@@0 $ebp@@3 $esp@@8 $eip@@2 $cs@@0 $efl@@0))
(= $RET@@0 (ReturnToInterrupted $eip@@2 $cs@@0 $efl@@0)))
(and
(= (select $StackState $s@@27) StackEmpty)
(= $RET@@0 (ReturnToAddr ?KernelEntryPoint))
(= (select $FrameCounts@@2 $s@@27) 0)))) anon0_correct@@18)))))
PreconditionGeneratedEntry_correct@@18))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+32002 () Bool)
(declare-fun call31987formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@127756 () Bool)
(declare-fun %lbl%@127767 () Bool)
(declare-fun esp@0@@8 () Int)
(declare-fun %lbl%@127800 () Bool)
(declare-fun $VgaNextEvent@1 () Int)
(declare-fun $VgaNextEvent () Int)
(declare-sort T@VgaEvent 0)
(declare-fun $VgaEvents@1 () (Array Int T@VgaEvent))
(declare-fun $VgaEvents () (Array Int T@VgaEvent))
(declare-fun VgaTextStore (Int Int) T@VgaEvent)
(declare-fun %lbl%@127839 () Bool)
(declare-fun %lbl%+31999 () Bool)
(declare-fun $Efl@0@@0 () Int)
(declare-fun call31984formal@$ptr@0 () Int)
(declare-fun %lbl%@127678 () Bool)
(declare-fun %lbl%@127681 () Bool)
(declare-fun $VgaNextEvent@0 () Int)
(declare-fun $VgaEvents@0 () (Array Int T@VgaEvent))
(declare-fun %lbl%+31997 () Bool)
(declare-fun %lbl%+31996 () Bool)
(declare-fun call31969formal@$x@0 () T@opn)
(declare-fun call31969formal@$y@0 () T@opn)
(declare-fun %lbl%@127612 () Bool)
(declare-fun %lbl%@127617 () Bool)
(declare-fun %lbl%+127379 () Bool)
(push 1)
(set-info :boogie-vc-id VgaTextWrite)
(assert (not
(let ((__L41_correct (=> (! (and %lbl%+32002 true) :lblpos +32002) (=> (= call31987formal@$oldRA@0 $RET@@0) (and
(! (or %lbl%@127756 (= (ReturnToAddr (select $Mem@@3 esp)) call31987formal@$oldRA@0)) :lblneg @127756)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call31987formal@$oldRA@0) (and
(! (or %lbl%@127767 (Aligned esp)) :lblneg @127767)
(=> (Aligned esp) (=> (and
(= esp@0@@8 (+ esp 4))
(Aligned esp@0@@8)) (and
(! (or %lbl%@127800 (=> (< ecx 4000) (and
(= $VgaNextEvent@1 (+ $VgaNextEvent 1))
(= $VgaEvents@1 (store $VgaEvents $VgaNextEvent (VgaTextStore (+ ?VgaTextLo (* 2 ecx)) edx)))))) :lblneg @127800)
(=> (=> (< ecx 4000) (and
(= $VgaNextEvent@1 (+ $VgaNextEvent 1))
(= $VgaEvents@1 (store $VgaEvents $VgaNextEvent (VgaTextStore (+ ?VgaTextLo (* 2 ecx)) edx))))) (and
(! (or %lbl%@127839 (= esp@0@@8 (+ esp 4))) :lblneg @127839)
(=> (= esp@0@@8 (+ esp 4)) true)))))))))))))
(let ((anon3_Else_correct@@2 (=> (! (and %lbl%+31999 true) :lblpos +31999) (=> (and
(not (Jae $Efl@0@@0))
(= call31984formal@$ptr@0 (+ (+ ecx (* 1 ecx)) 753664))) (and
(! (or %lbl%@127678 (vgaAddr2 call31984formal@$ptr@0)) :lblneg @127678)
(=> (vgaAddr2 call31984formal@$ptr@0) (and
(! (or %lbl%@127681 (word edx)) :lblneg @127681)
(=> (word edx) (=> (and
(= $VgaNextEvent@0 (+ $VgaNextEvent 1))
(= $VgaEvents@0 (store $VgaEvents $VgaNextEvent (VgaTextStore call31984formal@$ptr@0 edx)))
(= $VgaNextEvent@1 $VgaNextEvent@0)
(= $VgaEvents@1 $VgaEvents@0)) __L41_correct)))))))))
(let ((anon3_Then_correct@@2 (=> (! (and %lbl%+31997 true) :lblpos +31997) (=> (Jae $Efl@0@@0) (=> (and
(= $VgaNextEvent@1 $VgaNextEvent)
(= $VgaEvents@1 $VgaEvents)) __L41_correct)))))
(let ((anon0_correct@@19 (=> (! (and %lbl%+31996 true) :lblpos +31996) (=> (and
(= call31969formal@$x@0 (OpnReg ecx))
(= call31969formal@$y@0 (OpnReg 4000))) (and
(! (or %lbl%@127612 (OpnOk $Mem@@3 call31969formal@$x@0)) :lblneg @127612)
(=> (OpnOk $Mem@@3 call31969formal@$x@0) (and
(! (or %lbl%@127617 (OpnOk $Mem@@3 call31969formal@$y@0)) :lblneg @127617)
(=> (OpnOk $Mem@@3 call31969formal@$y@0) (=> (FlagsCmp $Efl@0@@0 (EvalOpn $Mem@@3 call31969formal@$x@0) (EvalOpn $Mem@@3 call31969formal@$y@0)) (and
anon3_Then_correct@@2
anon3_Else_correct@@2))))))))))
(let ((PreconditionGeneratedEntry_correct@@19 (=> (! (and %lbl%+127379 true) :lblpos +127379) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(SpRequire $S@@0 esp 4)) anon0_correct@@19))))
PreconditionGeneratedEntry_correct@@19)))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+127848 () Bool)
(declare-fun %lbl%@128469 () Bool)
(declare-fun $KeyboardAvailable@0 () Int)
(declare-fun $KeyboardDone () Int)
(declare-fun eax@2@@1 () Int)
(declare-fun %lbl%@128480 () Bool)
(declare-fun $KeyboardEvents () (Array Int Int))
(declare-fun %lbl%@128494 () Bool)
(declare-fun esp@2@@2 () Int)
(declare-fun %lbl%+32047 () Bool)
(declare-fun $Efl@2 () Int)
(declare-fun call32023formal@$ret@0 () Int)
(declare-fun call32026formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@128270 () Bool)
(declare-fun %lbl%@128281 () Bool)
(declare-fun esp@0@@9 () Int)
(declare-fun $KeyboardDone@1 () Int)
(declare-fun %lbl%+32045 () Bool)
(declare-fun %lbl%@128315 () Bool)
(declare-fun $KeyboardDone@0 () Int)
(declare-fun eax@1@@1 () Int)
(declare-fun call32032formal@$ret@0 () Int)
(declare-fun call32035formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@128399 () Bool)
(declare-fun %lbl%@128410 () Bool)
(declare-fun esp@1@@4 () Int)
(declare-fun %lbl%+32044 () Bool)
(declare-fun eax@0@@0 () Int)
(declare-fun call32007formal@$ret@0 () Int)
(declare-fun call32014formal@$x@0 () T@opn)
(declare-fun call32014formal@$y@0 () T@opn)
(declare-fun %lbl%@128199 () Bool)
(declare-fun %lbl%@128204 () Bool)
(declare-fun %lbl%+127852 () Bool)
(push 1)
(set-info :boogie-vc-id TryReadKeyboard)
(assert (not
(let ((GeneratedUnifiedExit_correct@@5 (=> (! (and %lbl%+127848 true) :lblpos +127848) (and
(! (or %lbl%@128469 (=> (= $KeyboardAvailable@0 $KeyboardDone) (= eax@2@@1 256))) :lblneg @128469)
(=> (=> (= $KeyboardAvailable@0 $KeyboardDone) (= eax@2@@1 256)) (and
(! (or %lbl%@128480 (=> (> $KeyboardAvailable@0 $KeyboardDone) (= eax@2@@1 (select $KeyboardEvents $KeyboardDone)))) :lblneg @128480)
(=> (=> (> $KeyboardAvailable@0 $KeyboardDone) (= eax@2@@1 (select $KeyboardEvents $KeyboardDone))) (and
(! (or %lbl%@128494 (= esp@2@@2 (+ esp 4))) :lblneg @128494)
(=> (= esp@2@@2 (+ esp 4)) true)))))))))
(let ((anon3_Else_correct@@3 (=> (! (and %lbl%+32047 true) :lblpos +32047) (=> (not (Jne $Efl@2)) (=> (and
(= call32023formal@$ret@0 256)
(= call32026formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@128270 (= (ReturnToAddr (select $Mem@@3 esp)) call32026formal@$oldRA@0)) :lblneg @128270)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32026formal@$oldRA@0) (and
(! (or %lbl%@128281 (Aligned esp)) :lblneg @128281)
(=> (Aligned esp) (=> (= esp@0@@9 (+ esp 4)) (=> (and
(Aligned esp@0@@9)
(= $KeyboardDone@1 $KeyboardDone)
(= esp@2@@2 esp@0@@9)
(= eax@2@@1 call32023formal@$ret@0)) GeneratedUnifiedExit_correct@@5)))))))))))
(let ((anon3_Then_correct@@3 (=> (! (and %lbl%+32045 true) :lblpos +32045) (=> (Jne $Efl@2) (and
(! (or %lbl%@128315 (> $KeyboardAvailable@0 $KeyboardDone)) :lblneg @128315)
(=> (> $KeyboardAvailable@0 $KeyboardDone) (=> (= $KeyboardDone@0 (+ $KeyboardDone 1)) (=> (and
(= (q@and eax@1@@1 255) (select $KeyboardEvents $KeyboardDone))
(= call32032formal@$ret@0 (q@and eax@1@@1 255))
(word call32032formal@$ret@0)
(= call32035formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@128399 (= (ReturnToAddr (select $Mem@@3 esp)) call32035formal@$oldRA@0)) :lblneg @128399)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32035formal@$oldRA@0) (and
(! (or %lbl%@128410 (Aligned esp)) :lblneg @128410)
(=> (Aligned esp) (=> (= esp@1@@4 (+ esp 4)) (=> (and
(Aligned esp@1@@4)
(= $KeyboardDone@1 $KeyboardDone@0)
(= esp@2@@2 esp@1@@4)
(= eax@2@@1 call32032formal@$ret@0)) GeneratedUnifiedExit_correct@@5))))))))))))))
(let ((anon0_correct@@20 (=> (! (and %lbl%+32044 true) :lblpos +32044) (=> (and
(=> (= (q@and eax@0@@0 1) 0) (= $KeyboardAvailable@0 $KeyboardDone))
(=> (not (= (q@and eax@0@@0 1) 0)) (> $KeyboardAvailable@0 $KeyboardDone))) (=> (and
(= call32007formal@$ret@0 (q@and eax@0@@0 1))
(word call32007formal@$ret@0)
(= call32014formal@$x@0 (OpnReg call32007formal@$ret@0))
(= call32014formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@128199 (OpnOk $Mem@@3 call32014formal@$x@0)) :lblneg @128199)
(=> (OpnOk $Mem@@3 call32014formal@$x@0) (and
(! (or %lbl%@128204 (OpnOk $Mem@@3 call32014formal@$y@0)) :lblneg @128204)
(=> (OpnOk $Mem@@3 call32014formal@$y@0) (=> (FlagsCmp $Efl@2 (EvalOpn $Mem@@3 call32014formal@$x@0) (EvalOpn $Mem@@3 call32014formal@$y@0)) (and
anon3_Then_correct@@3
anon3_Else_correct@@3)))))))))))
(let ((PreconditionGeneratedEntry_correct@@20 (=> (! (and %lbl%+127852 true) :lblpos +127852) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(SpRequire $S@@0 esp 4)) anon0_correct@@20))))
PreconditionGeneratedEntry_correct@@20)))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+32056 () Bool)
(declare-fun %lbl%@128670 () Bool)
(declare-fun $TimerSeq@0@@0 () Int)
(declare-fun $TimerFreq@0@@0 () Int)
(declare-fun call32053formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@128722 () Bool)
(declare-fun %lbl%@128733 () Bool)
(declare-fun esp@0@@10 () Int)
(declare-fun %lbl%@128764 () Bool)
(declare-fun %lbl%@128774 () Bool)
(declare-fun %lbl%+128503 () Bool)
(push 1)
(set-info :boogie-vc-id StartTimer)
(assert (not
(let ((anon0_correct@@21 (=> (! (and %lbl%+32056 true) :lblpos +32056) (and
(! (or %lbl%@128670 (word ecx)) :lblneg @128670)
(=> (word ecx) (=> (and
(TimerOk $TimerSeq@0@@0)
(= $TimerFreq@0@@0 ecx)
(= call32053formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@128722 (= (ReturnToAddr (select $Mem@@3 esp)) call32053formal@$oldRA@0)) :lblneg @128722)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32053formal@$oldRA@0) (and
(! (or %lbl%@128733 (Aligned esp)) :lblneg @128733)
(=> (Aligned esp) (=> (and
(= esp@0@@10 (+ esp 4))
(Aligned esp@0@@10)) (and
(! (or %lbl%@128764 (and
(TimerOk $TimerSeq@0@@0)
(= $TimerFreq@0@@0 ecx))) :lblneg @128764)
(=> (and
(TimerOk $TimerSeq@0@@0)
(= $TimerFreq@0@@0 ecx)) (and
(! (or %lbl%@128774 (= esp@0@@10 (+ esp 4))) :lblneg @128774)
(=> (= esp@0@@10 (+ esp 4)) true)))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@21 (=> (! (and %lbl%+128503 true) :lblpos +128503) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(SpRequire $S@@0 esp 4)) anon0_correct@@21))))
PreconditionGeneratedEntry_correct@@21))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+32104 () Bool)
(declare-fun $seq0@0 () Int)
(declare-fun $PicSeq@@0 () (Array Int Int))
(declare-fun $seq1@0 () Int)
(declare-fun call32081formal@$ret@0 () Int)
(declare-fun call32084formal@$ret@0 () Int)
(declare-fun %lbl%@129121 () Bool)
(declare-fun %lbl%@129153 () Bool)
(declare-fun %lbl%@129165 () Bool)
(declare-fun %lbl%@129184 () Bool)
(declare-fun $PicSeq@0 () (Array Int Int))
(declare-fun call32091formal@$ret@0 () Int)
(declare-fun call32094formal@$ret@0 () Int)
(declare-fun %lbl%@129489 () Bool)
(declare-fun %lbl%@129521 () Bool)
(declare-fun %lbl%@129533 () Bool)
(declare-fun %lbl%@129551 () Bool)
(declare-fun $PicSeq@1 () (Array Int Int))
(declare-fun call32101formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@129811 () Bool)
(declare-fun %lbl%@129822 () Bool)
(declare-fun esp@0@@11 () Int)
(declare-fun %lbl%@129853 () Bool)
(declare-fun %lbl%@129869 () Bool)
(declare-fun %lbl%@129885 () Bool)
(declare-fun %lbl%+128783 () Bool)
(push 1)
(set-info :boogie-vc-id SendEoi)
(assert (not
(let ((anon0_correct@@22 (=> (! (and %lbl%+32104 true) :lblpos +32104) (=> (and
(= $seq0@0 (+ (select $PicSeq@@0 0) 1))
(= $seq1@0 (+ (select $PicSeq@@0 1) 1))
(= call32081formal@$ret@0 32)
(= call32084formal@$ret@0 32)) (and
(! (or %lbl%@129121 (or
(and
(= 0 0)
(= call32084formal@$ret@0 (+ 32 0)))
(and
(= 0 1)
(= call32084formal@$ret@0 (+ 160 0))))) :lblneg @129121)
(=> (or
(and
(= 0 0)
(= call32084formal@$ret@0 (+ 32 0)))
(and
(= 0 1)
(= call32084formal@$ret@0 (+ 160 0)))) (and
(! (or %lbl%@129153 (or
(= 0 0)
(= 0 1))) :lblneg @129153)
(=> (or
(= 0 0)
(= 0 1)) (and
(! (or %lbl%@129165 (or
(= $seq0@0 0)
(= $seq0@0 (+ (select $PicSeq@@0 0) 1)))) :lblneg @129165)
(=> (or
(= $seq0@0 0)
(= $seq0@0 (+ (select $PicSeq@@0 0) 1))) (and
(! (or %lbl%@129184 (or
(and
(= $seq0@0 0)
(= 0 0)
(= call32081formal@$ret@0 17))
(and
(= $seq0@0 1)
(= 0 1)
(= 0 0)
(= call32081formal@$ret@0 112))
(and
(= $seq0@0 1)
(= 0 1)
(= 0 1)
(= call32081formal@$ret@0 120))
(and
(= $seq0@0 2)
(= 0 1)
(= 0 0)
(= call32081formal@$ret@0 4))
(and
(= $seq0@0 2)
(= 0 1)
(= 0 1)
(= call32081formal@$ret@0 2))
(and
(= $seq0@0 3)
(= 0 1)
(= call32081formal@$ret@0 1))
(and
(= $seq0@0 4)
(= 0 1)
(= 0 0)
(= call32081formal@$ret@0 254))
(and
(= $seq0@0 4)
(= 0 1)
(= 0 1)
(= call32081formal@$ret@0 255))
(and
(>= $seq0@0 5)
(= 0 0)
(= call32081formal@$ret@0 32)))) :lblneg @129184)
(=> (or
(and
(= $seq0@0 0)
(= 0 0)
(= call32081formal@$ret@0 17))
(and
(= $seq0@0 1)
(= 0 1)
(= 0 0)
(= call32081formal@$ret@0 112))
(and
(= $seq0@0 1)
(= 0 1)
(= 0 1)
(= call32081formal@$ret@0 120))
(and
(= $seq0@0 2)
(= 0 1)
(= 0 0)
(= call32081formal@$ret@0 4))
(and
(= $seq0@0 2)
(= 0 1)
(= 0 1)
(= call32081formal@$ret@0 2))
(and
(= $seq0@0 3)
(= 0 1)
(= call32081formal@$ret@0 1))
(and
(= $seq0@0 4)
(= 0 1)
(= 0 0)
(= call32081formal@$ret@0 254))
(and
(= $seq0@0 4)
(= 0 1)
(= 0 1)
(= call32081formal@$ret@0 255))
(and
(>= $seq0@0 5)
(= 0 0)
(= call32081formal@$ret@0 32))) (=> (= $PicSeq@0 (store $PicSeq@@0 0 $seq0@0)) (=> (and
(= call32091formal@$ret@0 32)
(= call32094formal@$ret@0 160)) (and
(! (or %lbl%@129489 (or
(and
(= 1 0)
(= call32094formal@$ret@0 (+ 32 0)))
(and
(= 1 1)
(= call32094formal@$ret@0 (+ 160 0))))) :lblneg @129489)
(=> (or
(and
(= 1 0)
(= call32094formal@$ret@0 (+ 32 0)))
(and
(= 1 1)
(= call32094formal@$ret@0 (+ 160 0)))) (and
(! (or %lbl%@129521 (or
(= 0 0)
(= 0 1))) :lblneg @129521)
(=> (or
(= 0 0)
(= 0 1)) (and
(! (or %lbl%@129533 (or
(= $seq1@0 0)
(= $seq1@0 (+ (select $PicSeq@0 1) 1)))) :lblneg @129533)
(=> (or
(= $seq1@0 0)
(= $seq1@0 (+ (select $PicSeq@0 1) 1))) (and
(! (or %lbl%@129551 (or
(and
(= $seq1@0 0)
(= 0 0)
(= call32091formal@$ret@0 17))
(and
(= $seq1@0 1)
(= 0 1)
(= 1 0)
(= call32091formal@$ret@0 112))
(and
(= $seq1@0 1)
(= 0 1)
(= 1 1)
(= call32091formal@$ret@0 120))
(and
(= $seq1@0 2)
(= 0 1)
(= 1 0)
(= call32091formal@$ret@0 4))
(and
(= $seq1@0 2)
(= 0 1)
(= 1 1)
(= call32091formal@$ret@0 2))
(and
(= $seq1@0 3)
(= 0 1)
(= call32091formal@$ret@0 1))
(and
(= $seq1@0 4)
(= 0 1)
(= 1 0)
(= call32091formal@$ret@0 254))
(and
(= $seq1@0 4)
(= 0 1)
(= 1 1)
(= call32091formal@$ret@0 255))
(and
(>= $seq1@0 5)
(= 0 0)
(= call32091formal@$ret@0 32)))) :lblneg @129551)
(=> (or
(and
(= $seq1@0 0)
(= 0 0)
(= call32091formal@$ret@0 17))
(and
(= $seq1@0 1)
(= 0 1)
(= 1 0)
(= call32091formal@$ret@0 112))
(and
(= $seq1@0 1)
(= 0 1)
(= 1 1)
(= call32091formal@$ret@0 120))
(and
(= $seq1@0 2)
(= 0 1)
(= 1 0)
(= call32091formal@$ret@0 4))
(and
(= $seq1@0 2)
(= 0 1)
(= 1 1)
(= call32091formal@$ret@0 2))
(and
(= $seq1@0 3)
(= 0 1)
(= call32091formal@$ret@0 1))
(and
(= $seq1@0 4)
(= 0 1)
(= 1 0)
(= call32091formal@$ret@0 254))
(and
(= $seq1@0 4)
(= 0 1)
(= 1 1)
(= call32091formal@$ret@0 255))
(and
(>= $seq1@0 5)
(= 0 0)
(= call32091formal@$ret@0 32))) (=> (and
(= $PicSeq@1 (store $PicSeq@0 1 $seq1@0))
(= call32101formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@129811 (= (ReturnToAddr (select $Mem@@3 esp)) call32101formal@$oldRA@0)) :lblneg @129811)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32101formal@$oldRA@0) (and
(! (or %lbl%@129822 (Aligned esp)) :lblneg @129822)
(=> (Aligned esp) (=> (and
(= esp@0@@11 (+ esp 4))
(Aligned esp@0@@11)) (and
(! (or %lbl%@129853 (= (select $PicSeq@1 0) (+ (select $PicSeq@@0 0) 1))) :lblneg @129853)
(=> (= (select $PicSeq@1 0) (+ (select $PicSeq@@0 0) 1)) (and
(! (or %lbl%@129869 (= (select $PicSeq@1 1) (+ (select $PicSeq@@0 1) 1))) :lblneg @129869)
(=> (= (select $PicSeq@1 1) (+ (select $PicSeq@@0 1) 1)) (and
(! (or %lbl%@129885 (= esp@0@@11 (+ esp 4))) :lblneg @129885)
(=> (= esp@0@@11 (+ esp 4)) true))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@22 (=> (! (and %lbl%+128783 true) :lblpos +128783) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(SpRequire $S@@0 esp 4)
(PicOk $PicSeq@@0)) anon0_correct@@22))))
PreconditionGeneratedEntry_correct@@22))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+32182 () Bool)
(declare-fun call32147formal@$ret@0 () Int)
(declare-fun %lbl%@130063 () Bool)
(declare-fun call32151formal@$ret@0 () Int)
(declare-fun call32155formal@$ret@0 () Int)
(declare-fun call32158formal@$ret@0 () Int)
(declare-fun call32162formal@$ret@0 () Int)
(declare-fun call32166formal@$ret@0 () Int)
(declare-fun call32169formal@$ret@0 () Int)
(declare-fun %lbl%@130235 () Bool)
(declare-fun $id () Int)
(declare-fun $offset () Int)
(declare-fun %lbl%@130254 () Bool)
(declare-fun %lbl%@130259 () Bool)
(declare-fun %lbl%@130262 () Bool)
(declare-fun $PciConfigId@0 () Int)
(declare-fun $PciConfigOffset@0 () Int)
(declare-fun call32175formal@$ret@0 () Int)
(declare-fun %lbl%@130317 () Bool)
(declare-fun %lbl%@130322 () Bool)
(declare-fun %lbl%@130327 () Bool)
(declare-fun %lbl%+129894 () Bool)
(push 1)
(set-info :boogie-vc-id pciConfigAddr)
(assert (not
(let ((anon0_correct@@23 (=> (! (and %lbl%+32182 true) :lblpos +32182) (=> (= call32147formal@$ret@0 ecx) (and
(! (or %lbl%@130063 (< 8 32)) :lblneg @130063)
(=> (< 8 32) (=> (and
(= call32151formal@$ret@0 (shl call32147formal@$ret@0 8))
(word call32151formal@$ret@0)) (=> (and
(= call32155formal@$ret@0 (q@or call32151formal@$ret@0 edx))
(word call32155formal@$ret@0)
(= call32158formal@$ret@0 2147483647)
(word (+ call32158formal@$ret@0 1))
(= call32162formal@$ret@0 (+ call32158formal@$ret@0 1))
(= call32166formal@$ret@0 (q@or call32155formal@$ret@0 call32162formal@$ret@0))
(word call32166formal@$ret@0)
(= call32169formal@$ret@0 3320)) (and
(! (or %lbl%@130235 (= call32166formal@$ret@0 (q@or (q@or (shl $id 8) $offset) (+ 2147483647 1)))) :lblneg @130235)
(=> (= call32166formal@$ret@0 (q@or (q@or (shl $id 8) $offset) (+ 2147483647 1))) (and
(! (or %lbl%@130254 (= call32169formal@$ret@0 3320)) :lblneg @130254)
(=> (= call32169formal@$ret@0 3320) (and
(! (or %lbl%@130259 (IsValidPciId $id)) :lblneg @130259)
(=> (IsValidPciId $id) (and
(! (or %lbl%@130262 (IsValidPciOffset $offset)) :lblneg @130262)
(=> (IsValidPciOffset $offset) (=> (= $PciConfigId@0 $id) (=> (and
(= $PciConfigOffset@0 $offset)
(= call32175formal@$ret@0 3324)) (and
(! (or %lbl%@130317 (= $PciConfigId@0 $id)) :lblneg @130317)
(=> (= $PciConfigId@0 $id) (and
(! (or %lbl%@130322 (= $PciConfigOffset@0 $offset)) :lblneg @130322)
(=> (= $PciConfigOffset@0 $offset) (and
(! (or %lbl%@130327 (= call32175formal@$ret@0 3324)) :lblneg @130327)
(=> (= call32175formal@$ret@0 3324) true))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@23 (=> (! (and %lbl%+129894 true) :lblpos +129894) (=> (and
(IsValidPciId $id)
(IsValidPciOffset $offset)
(= ecx $id)
(= edx $offset)) anon0_correct@@23))))
PreconditionGeneratedEntry_correct@@23))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+32278 () Bool)
(declare-fun %lbl%+32290 () Bool)
(declare-fun %lbl%+32302 () Bool)
(declare-fun %lbl%+32305 () Bool)
(declare-fun edx@5 () Int)
(declare-fun %lbl%@131103 () Bool)
(declare-fun %lbl%@131106 () Bool)
(declare-fun %lbl%@131109 () Bool)
(declare-fun ecx@5 () Int)
(declare-fun %lbl%@131113 () Bool)
(declare-fun $PciConfigId@0@@0 () Int)
(declare-fun $PciConfigOffset@0@@0 () Int)
(declare-fun edx@6 () Int)
(declare-fun %lbl%@131169 () Bool)
(declare-fun %lbl%@131173 () Bool)
(declare-fun %lbl%@131177 () Bool)
(declare-fun %lbl%@131182 () Bool)
(declare-fun %lbl%@131185 () Bool)
(declare-fun PciConfigReadResult (Int Int Int) Bool)
(declare-fun eax@4 () Int)
(declare-fun call32266formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@131294 () Bool)
(declare-fun %lbl%@131305 () Bool)
(declare-fun esp@0@@12 () Int)
(declare-fun %lbl%@131336 () Bool)
(declare-fun %lbl%@131344 () Bool)
(declare-fun %lbl%+32300 () Bool)
(declare-fun $Efl@8@@0 () Int)
(declare-fun edx@3@@0 () Int)
(declare-fun ecx@3@@0 () Int)
(declare-fun %lbl%+32299 () Bool)
(declare-fun call32234formal@$ret@0 () Int)
(declare-fun call32238formal@$ret@0 () Int)
(declare-fun call32245formal@$x@0 () T@opn)
(declare-fun call32245formal@$y@0 () T@opn)
(declare-fun %lbl%@130967 () Bool)
(declare-fun %lbl%@130972 () Bool)
(declare-fun %lbl%+32288 () Bool)
(declare-fun $Efl@3 () Int)
(declare-fun edx@1@@1 () Int)
(declare-fun ecx@1@@3 () Int)
(declare-fun %lbl%+32287 () Bool)
(declare-fun call32221formal@$x@0 () T@opn)
(declare-fun call32221formal@$y@0 () T@opn)
(declare-fun %lbl%@130782 () Bool)
(declare-fun %lbl%@130787 () Bool)
(declare-fun %lbl%+32276 () Bool)
(declare-fun $Efl@0@@1 () Int)
(declare-fun %lbl%+32275 () Bool)
(declare-fun call32204formal@$x@0 () T@opn)
(declare-fun call32204formal@$y@0 () T@opn)
(declare-fun %lbl%@130646 () Bool)
(declare-fun %lbl%@130651 () Bool)
(declare-fun %lbl%+130333 () Bool)
(push 1)
(set-info :boogie-vc-id PciConfigRead32)
(assert (not
(let ((anon7_Else_correct (=> (! (and %lbl%+32278 true) :lblpos +32278) true)))
(let ((anon8_Else_correct@@0 (=> (! (and %lbl%+32290 true) :lblpos +32290) true)))
(let ((anon9_Else_correct@@1 (=> (! (and %lbl%+32302 true) :lblpos +32302) true)))
(let ((__L44_correct (=> (! (and %lbl%+32305 true) :lblpos +32305) (=> (=> (word edx@5) (= (= (q@and edx@5 3) 0) (Aligned edx@5))) (and
(! (or %lbl%@131103 (IsValidPciId ecx)) :lblneg @131103)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@131106 (IsValidPciOffset edx)) :lblneg @131106)
(=> (IsValidPciOffset edx) (and
(! (or %lbl%@131109 (= ecx@5 ecx)) :lblneg @131109)
(=> (= ecx@5 ecx) (and
(! (or %lbl%@131113 (= edx@5 edx)) :lblneg @131113)
(=> (= edx@5 edx) (=> (= $PciConfigId@0@@0 ecx) (=> (and
(= $PciConfigOffset@0@@0 edx)
(= edx@6 3324)) (and
(! (or %lbl%@131169 (= ecx $PciConfigId@0@@0)) :lblneg @131169)
(=> (= ecx $PciConfigId@0@@0) (and
(! (or %lbl%@131173 (= edx $PciConfigOffset@0@@0)) :lblneg @131173)
(=> (= edx $PciConfigOffset@0@@0) (and
(! (or %lbl%@131177 (= edx@6 3324)) :lblneg @131177)
(=> (= edx@6 3324) (and
(! (or %lbl%@131182 (IsValidPciId ecx)) :lblneg @131182)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@131185 (IsValidPciOffset edx)) :lblneg @131185)
(=> (IsValidPciOffset edx) (=> (PciConfigReadResult ecx edx eax@4) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= edx 16)
(= (q@and eax@4 15) 0)) (= (PciMemAddr ecx) eax@4))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= edx 16)) (= (PciMemSize ecx) (+ 1 (neg eax@4))))
(word eax@4)
(= call32266formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@131294 (= (ReturnToAddr (select $Mem@@3 esp)) call32266formal@$oldRA@0)) :lblneg @131294)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32266formal@$oldRA@0) (and
(! (or %lbl%@131305 (Aligned esp)) :lblneg @131305)
(=> (Aligned esp) (=> (and
(= esp@0@@12 (+ esp 4))
(Aligned esp@0@@12)) (and
(! (or %lbl%@131336 (= esp@0@@12 (+ esp 4))) :lblneg @131336)
(=> (= esp@0@@12 (+ esp 4)) (and
(! (or %lbl%@131344 (PciConfigReadResult ecx edx eax@4)) :lblneg @131344)
(=> (PciConfigReadResult ecx edx eax@4) true)))))))))))))))))))))))))))))))))))
(let ((anon9_Then_correct@@1 (=> (! (and %lbl%+32300 true) :lblpos +32300) (=> (Je $Efl@8@@0) (=> (and
(= edx@5 edx@3@@0)
(= ecx@5 ecx@3@@0)) __L44_correct)))))
(let ((__L43_correct (=> (! (and %lbl%+32299 true) :lblpos +32299) (=> (= call32234formal@$ret@0 edx@3@@0) (=> (and
(= call32238formal@$ret@0 (q@and call32234formal@$ret@0 3))
(word call32238formal@$ret@0)
(= call32245formal@$x@0 (OpnReg call32238formal@$ret@0))
(= call32245formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@130967 (OpnOk $Mem@@3 call32245formal@$x@0)) :lblneg @130967)
(=> (OpnOk $Mem@@3 call32245formal@$x@0) (and
(! (or %lbl%@130972 (OpnOk $Mem@@3 call32245formal@$y@0)) :lblneg @130972)
(=> (OpnOk $Mem@@3 call32245formal@$y@0) (=> (FlagsCmp $Efl@8@@0 (EvalOpn $Mem@@3 call32245formal@$x@0) (EvalOpn $Mem@@3 call32245formal@$y@0)) (and
anon9_Then_correct@@1
anon9_Else_correct@@1)))))))))))
(let ((anon8_Then_correct@@0 (=> (! (and %lbl%+32288 true) :lblpos +32288) (=> (Jb $Efl@3) (=> (and
(= edx@3@@0 edx@1@@1)
(= ecx@3@@0 ecx@1@@3)) __L43_correct)))))
(let ((__L42_correct (=> (! (and %lbl%+32287 true) :lblpos +32287) (=> (and
(= call32221formal@$x@0 (OpnReg edx@1@@1))
(= call32221formal@$y@0 (OpnReg 256))) (and
(! (or %lbl%@130782 (OpnOk $Mem@@3 call32221formal@$x@0)) :lblneg @130782)
(=> (OpnOk $Mem@@3 call32221formal@$x@0) (and
(! (or %lbl%@130787 (OpnOk $Mem@@3 call32221formal@$y@0)) :lblneg @130787)
(=> (OpnOk $Mem@@3 call32221formal@$y@0) (=> (FlagsCmp $Efl@3 (EvalOpn $Mem@@3 call32221formal@$x@0) (EvalOpn $Mem@@3 call32221formal@$y@0)) (and
anon8_Then_correct@@0
anon8_Else_correct@@0))))))))))
(let ((anon7_Then_correct (=> (! (and %lbl%+32276 true) :lblpos +32276) (=> (Jb $Efl@0@@1) (=> (and
(= ecx@1@@3 ecx)
(= edx@1@@1 edx)) __L42_correct)))))
(let ((anon0_correct@@24 (=> (! (and %lbl%+32275 true) :lblpos +32275) (=> (and
(= call32204formal@$x@0 (OpnReg ecx))
(= call32204formal@$y@0 (OpnReg 65536))) (and
(! (or %lbl%@130646 (OpnOk $Mem@@3 call32204formal@$x@0)) :lblneg @130646)
(=> (OpnOk $Mem@@3 call32204formal@$x@0) (and
(! (or %lbl%@130651 (OpnOk $Mem@@3 call32204formal@$y@0)) :lblneg @130651)
(=> (OpnOk $Mem@@3 call32204formal@$y@0) (=> (FlagsCmp $Efl@0@@1 (EvalOpn $Mem@@3 call32204formal@$x@0) (EvalOpn $Mem@@3 call32204formal@$y@0)) (and
anon7_Then_correct
anon7_Else_correct))))))))))
(let ((PreconditionGeneratedEntry_correct@@24 (=> (! (and %lbl%+130333 true) :lblpos +130333) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(SpRequire $S@@0 esp 4)) anon0_correct@@24))))
PreconditionGeneratedEntry_correct@@24)))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+32939 () Bool)
(declare-fun %lbl%+32951 () Bool)
(declare-fun %lbl%+32963 () Bool)
(declare-fun %lbl%+32975 () Bool)
(declare-fun %lbl%+32987 () Bool)
(declare-fun %lbl%+32999 () Bool)
(declare-fun %lbl%+33011 () Bool)
(declare-fun %lbl%+33014 () Bool)
(declare-fun call32723formal@$ret@0 () Int)
(declare-fun %lbl%@136681 () Bool)
(declare-fun %lbl%@136684 () Bool)
(declare-fun %lbl%@136687 () Bool)
(declare-fun ecx@13 () Int)
(declare-fun %lbl%@136691 () Bool)
(declare-fun $PciConfigId@8 () Int)
(declare-fun $PciConfigOffset@8 () Int)
(declare-fun edx@11 () Int)
(declare-fun call32730formal@$ptr@0 () Int)
(declare-fun call32343formal@$ret@0 () Int)
(declare-fun %lbl%@136750 () Bool)
(declare-fun $Mem@5@@0 () (Array Int Int))
(declare-fun $sMem@5 () (Array Int Int))
(declare-fun %lbl%@136778 () Bool)
(declare-fun call32735formal@$ptr@0 () Int)
(declare-fun %lbl%@136802 () Bool)
(declare-fun call32735formal@$val@0 () Int)
(declare-fun %lbl%@136835 () Bool)
(declare-fun call32739formal@$ret@0 () Int)
(declare-fun call32742formal@$ret@0 () Int)
(declare-fun call32746formal@$ptr@0 () Int)
(declare-fun %lbl%@136895 () Bool)
(declare-fun %lbl%@136923 () Bool)
(declare-fun call32751formal@$ptr@0 () Int)
(declare-fun %lbl%@136947 () Bool)
(declare-fun call32751formal@$val@0 () Int)
(declare-fun call32755formal@$ret@0 () Int)
(declare-fun %lbl%@137017 () Bool)
(declare-fun %lbl%@137021 () Bool)
(declare-fun %lbl%@137025 () Bool)
(declare-fun %lbl%@137030 () Bool)
(declare-fun %lbl%@137033 () Bool)
(declare-fun %lbl%@137036 () Bool)
(declare-fun %lbl%@137045 () Bool)
(declare-fun eax@4@@0 () Int)
(declare-fun %lbl%@137051 () Bool)
(declare-fun eax@6 () Int)
(declare-fun %lbl%@137057 () Bool)
(declare-fun eax@8 () Int)
(declare-fun %lbl%@137063 () Bool)
(declare-fun eax@10 () Int)
(declare-fun %lbl%@137069 () Bool)
(declare-fun %lbl%@137076 () Bool)
(declare-fun %lbl%@137083 () Bool)
(declare-fun %lbl%@137113 () Bool)
(declare-fun %lbl%@137136 () Bool)
(declare-fun %lbl%@137160 () Bool)
(declare-fun %lbl%@137186 () Bool)
(declare-fun $PciConfigState@0 () (Array Int Int))
(declare-fun call32765formal@$ret@0 () Int)
(declare-fun %lbl%@137263 () Bool)
(declare-fun %lbl%@137266 () Bool)
(declare-fun %lbl%@137269 () Bool)
(declare-fun %lbl%@137273 () Bool)
(declare-fun $PciConfigId@10 () Int)
(declare-fun $PciConfigOffset@10 () Int)
(declare-fun edx@12 () Int)
(declare-fun call32772formal@$ptr@0 () Int)
(declare-fun %lbl%@137331 () Bool)
(declare-fun %lbl%@137359 () Bool)
(declare-fun call32777formal@$ptr@0 () Int)
(declare-fun %lbl%@137383 () Bool)
(declare-fun call32777formal@$val@0 () Int)
(declare-fun %lbl%@137424 () Bool)
(declare-fun %lbl%@137428 () Bool)
(declare-fun %lbl%@137432 () Bool)
(declare-fun %lbl%@137437 () Bool)
(declare-fun %lbl%@137440 () Bool)
(declare-fun %lbl%@137443 () Bool)
(declare-fun %lbl%@137452 () Bool)
(declare-fun %lbl%@137458 () Bool)
(declare-fun %lbl%@137464 () Bool)
(declare-fun %lbl%@137470 () Bool)
(declare-fun %lbl%@137476 () Bool)
(declare-fun %lbl%@137483 () Bool)
(declare-fun %lbl%@137490 () Bool)
(declare-fun %lbl%@137519 () Bool)
(declare-fun %lbl%@137541 () Bool)
(declare-fun %lbl%@137564 () Bool)
(declare-fun %lbl%@137589 () Bool)
(declare-fun $PciConfigState@1 () (Array Int Int))
(declare-fun call32787formal@$ret@0 () Int)
(declare-fun %lbl%@137664 () Bool)
(declare-fun %lbl%@137667 () Bool)
(declare-fun %lbl%@137670 () Bool)
(declare-fun %lbl%@137674 () Bool)
(declare-fun $PciConfigId@12 () Int)
(declare-fun $PciConfigOffset@12 () Int)
(declare-fun edx@13 () Int)
(declare-fun %lbl%@137726 () Bool)
(declare-fun %lbl%@137730 () Bool)
(declare-fun %lbl%@137734 () Bool)
(declare-fun %lbl%@137739 () Bool)
(declare-fun %lbl%@137742 () Bool)
(declare-fun eax@18 () Int)
(declare-fun call32802formal@$ptr@0 () Int)
(declare-fun %lbl%@137856 () Bool)
(declare-fun %lbl%@137884 () Bool)
(declare-fun $sMem@6 () (Array Int Int))
(declare-fun call32807formal@$ptr@0 () Int)
(declare-fun %lbl%@137945 () Bool)
(declare-fun %lbl%@137948 () Bool)
(declare-fun $Mem@6@@0 () (Array Int Int))
(declare-fun call32810formal@$ret@0 () Int)
(declare-fun %lbl%@138001 () Bool)
(declare-fun %lbl%@138004 () Bool)
(declare-fun %lbl%@138007 () Bool)
(declare-fun %lbl%@138011 () Bool)
(declare-fun $PciConfigId@14 () Int)
(declare-fun $PciConfigOffset@14 () Int)
(declare-fun edx@14 () Int)
(declare-fun call32817formal@$ptr@0 () Int)
(declare-fun %lbl%@138069 () Bool)
(declare-fun %lbl%@138097 () Bool)
(declare-fun call32822formal@$ptr@0 () Int)
(declare-fun %lbl%@138121 () Bool)
(declare-fun call32822formal@$val@0 () Int)
(declare-fun %lbl%@138162 () Bool)
(declare-fun %lbl%@138166 () Bool)
(declare-fun %lbl%@138170 () Bool)
(declare-fun %lbl%@138175 () Bool)
(declare-fun %lbl%@138178 () Bool)
(declare-fun %lbl%@138181 () Bool)
(declare-fun %lbl%@138190 () Bool)
(declare-fun %lbl%@138196 () Bool)
(declare-fun %lbl%@138202 () Bool)
(declare-fun %lbl%@138208 () Bool)
(declare-fun %lbl%@138214 () Bool)
(declare-fun %lbl%@138221 () Bool)
(declare-fun %lbl%@138228 () Bool)
(declare-fun %lbl%@138257 () Bool)
(declare-fun %lbl%@138279 () Bool)
(declare-fun %lbl%@138302 () Bool)
(declare-fun %lbl%@138327 () Bool)
(declare-fun $PciConfigState@2 () (Array Int Int))
(declare-fun call32832formal@$ret@0 () Int)
(declare-fun %lbl%@138402 () Bool)
(declare-fun %lbl%@138405 () Bool)
(declare-fun %lbl%@138408 () Bool)
(declare-fun %lbl%@138412 () Bool)
(declare-fun $PciConfigId@16 () Int)
(declare-fun $PciConfigOffset@16 () Int)
(declare-fun edx@15 () Int)
(declare-fun call32839formal@$ptr@0 () Int)
(declare-fun %lbl%@138470 () Bool)
(declare-fun %lbl%@138498 () Bool)
(declare-fun call32844formal@$ptr@0 () Int)
(declare-fun %lbl%@138522 () Bool)
(declare-fun call32844formal@$val@0 () Int)
(declare-fun call32848formal@$ret@0 () Int)
(declare-fun %lbl%@138593 () Bool)
(declare-fun %lbl%@138597 () Bool)
(declare-fun %lbl%@138601 () Bool)
(declare-fun %lbl%@138606 () Bool)
(declare-fun %lbl%@138609 () Bool)
(declare-fun %lbl%@138612 () Bool)
(declare-fun %lbl%@138621 () Bool)
(declare-fun %lbl%@138627 () Bool)
(declare-fun %lbl%@138633 () Bool)
(declare-fun %lbl%@138639 () Bool)
(declare-fun %lbl%@138645 () Bool)
(declare-fun %lbl%@138652 () Bool)
(declare-fun %lbl%@138659 () Bool)
(declare-fun %lbl%@138688 () Bool)
(declare-fun %lbl%@138710 () Bool)
(declare-fun %lbl%@138733 () Bool)
(declare-fun %lbl%@138758 () Bool)
(declare-fun $PciConfigState@3 () (Array Int Int))
(declare-fun call32859formal@$ptr@0 () Int)
(declare-fun %lbl%@138817 () Bool)
(declare-fun %lbl%@138845 () Bool)
(declare-fun call32864formal@$ptr@0 () Int)
(declare-fun %lbl%@138869 () Bool)
(declare-fun call32864formal@$val@0 () Int)
(declare-fun call32867formal@$ret@0 () Int)
(declare-fun call32871formal@$ret@0 () Int)
(declare-fun call32875formal@$ptr@0 () Int)
(declare-fun %lbl%@138967 () Bool)
(declare-fun %lbl%@138995 () Bool)
(declare-fun call32880formal@$ptr@0 () Int)
(declare-fun %lbl%@139019 () Bool)
(declare-fun call32880formal@$val@0 () Int)
(declare-fun call32884formal@$ptr@0 () Int)
(declare-fun %lbl%@139058 () Bool)
(declare-fun %lbl%@139086 () Bool)
(declare-fun call32889formal@$ptr@0 () Int)
(declare-fun %lbl%@139110 () Bool)
(declare-fun call32889formal@$val@0 () Int)
(declare-fun call32894formal@$ptr@0 () Int)
(declare-fun %lbl%@139151 () Bool)
(declare-fun %lbl%@139179 () Bool)
(declare-fun $pciMem@0 () (Array Int Int))
(declare-fun call32899formal@$ptr@0 () Int)
(declare-fun %lbl%@139240 () Bool)
(declare-fun %lbl%@139243 () Bool)
(declare-fun $Mem@7 () (Array Int Int))
(declare-fun call32904formal@$ptr@0 () Int)
(declare-fun %lbl%@139282 () Bool)
(declare-fun %lbl%@139309 () Bool)
(declare-fun $pciMem@1 () (Array Int Int))
(declare-fun call32909formal@$ptr@0 () Int)
(declare-fun %lbl%@139369 () Bool)
(declare-fun %lbl%@139372 () Bool)
(declare-fun $Mem@8 () (Array Int Int))
(declare-fun call32918formal@$oldPciConfigState@0 () (Array Int Int))
(declare-fun call32918formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call32918formal@$oldMem@0 () (Array Int Int))
(declare-fun call32918formal@$oldSMem@0 () (Array Int Int))
(declare-fun %lbl%@139426 () Bool)
(declare-fun %lbl%@139502 () Bool)
(declare-fun %lbl%@139529 () Bool)
(declare-fun call32921formal@$ret@0 () Int)
(declare-fun call32335formal@$ret@0 () Int)
(declare-fun %lbl%@139639 () Bool)
(declare-fun %lbl%@139666 () Bool)
(declare-fun call32927formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@139694 () Bool)
(declare-fun %lbl%@139703 () Bool)
(declare-fun esp@0@@13 () Int)
(declare-fun %lbl%@139732 () Bool)
(declare-fun %lbl%@139740 () Bool)
(declare-fun %lbl%@139746 () Bool)
(declare-fun %lbl%+33009 () Bool)
(declare-fun $Efl@58 () Int)
(declare-fun ecx@11 () Int)
(declare-fun %lbl%+33008 () Bool)
(declare-fun call32694formal@$ptr@0 () Int)
(declare-fun %lbl%@136422 () Bool)
(declare-fun %lbl%@136450 () Bool)
(declare-fun call32699formal@$ptr@0 () Int)
(declare-fun %lbl%@136474 () Bool)
(declare-fun call32699formal@$val@0 () Int)
(declare-fun call32703formal@$ret@0 () Int)
(declare-fun call32710formal@$x@0 () T@opn)
(declare-fun call32710formal@$y@0 () T@opn)
(declare-fun %lbl%@136553 () Bool)
(declare-fun %lbl%@136557 () Bool)
(declare-fun %lbl%+32997 () Bool)
(declare-fun $Efl@53 () Int)
(declare-fun ecx@9 () Int)
(declare-fun %lbl%+32996 () Bool)
(declare-fun call32660formal@$ptr@0 () Int)
(declare-fun %lbl%@136146 () Bool)
(declare-fun %lbl%@136174 () Bool)
(declare-fun call32665formal@$ptr@0 () Int)
(declare-fun %lbl%@136198 () Bool)
(declare-fun call32665formal@$val@0 () Int)
(declare-fun %lbl%@136233 () Bool)
(declare-fun call32669formal@$ret@0 () Int)
(declare-fun call32673formal@$ret@0 () Int)
(declare-fun call32680formal@$x@0 () T@opn)
(declare-fun call32680formal@$y@0 () T@opn)
(declare-fun %lbl%@136312 () Bool)
(declare-fun %lbl%@136316 () Bool)
(declare-fun %lbl%+32985 () Bool)
(declare-fun $Efl@47 () Int)
(declare-fun ecx@7 () Int)
(declare-fun %lbl%+32984 () Bool)
(declare-fun call32630formal@$ptr@0 () Int)
(declare-fun %lbl%@135905 () Bool)
(declare-fun %lbl%@135933 () Bool)
(declare-fun call32635formal@$ptr@0 () Int)
(declare-fun %lbl%@135957 () Bool)
(declare-fun call32635formal@$val@0 () Int)
(declare-fun call32639formal@$ret@0 () Int)
(declare-fun call32646formal@$x@0 () T@opn)
(declare-fun call32646formal@$y@0 () T@opn)
(declare-fun %lbl%@136036 () Bool)
(declare-fun %lbl%@136040 () Bool)
(declare-fun %lbl%+32973 () Bool)
(declare-fun $Efl@42 () Int)
(declare-fun ecx@5@@0 () Int)
(declare-fun %lbl%+32972 () Bool)
(declare-fun %lbl%@134394 () Bool)
(declare-fun call32520formal@$ret@0 () Int)
(declare-fun %lbl%@134445 () Bool)
(declare-fun %lbl%@134448 () Bool)
(declare-fun %lbl%@134451 () Bool)
(declare-fun %lbl%@134455 () Bool)
(declare-fun $PciConfigId@0@@1 () Int)
(declare-fun $PciConfigOffset@0@@1 () Int)
(declare-fun edx@3@@1 () Int)
(declare-fun %lbl%@134510 () Bool)
(declare-fun %lbl%@134514 () Bool)
(declare-fun %lbl%@134518 () Bool)
(declare-fun %lbl%@134523 () Bool)
(declare-fun %lbl%@134526 () Bool)
(declare-fun call32535formal@$ptr@0 () Int)
(declare-fun %lbl%@134642 () Bool)
(declare-fun $Mem@1@@4 () (Array Int Int))
(declare-fun $sMem@1@@2 () (Array Int Int))
(declare-fun %lbl%@134670 () Bool)
(declare-fun $sMem@2@@2 () (Array Int Int))
(declare-fun call32540formal@$ptr@0 () Int)
(declare-fun %lbl%@134731 () Bool)
(declare-fun %lbl%@134734 () Bool)
(declare-fun $Mem@2@@3 () (Array Int Int))
(declare-fun call32543formal@$ret@0 () Int)
(declare-fun %lbl%@134787 () Bool)
(declare-fun %lbl%@134790 () Bool)
(declare-fun %lbl%@134793 () Bool)
(declare-fun %lbl%@134797 () Bool)
(declare-fun $PciConfigId@2 () Int)
(declare-fun $PciConfigOffset@2 () Int)
(declare-fun edx@4 () Int)
(declare-fun %lbl%@134849 () Bool)
(declare-fun %lbl%@134853 () Bool)
(declare-fun %lbl%@134857 () Bool)
(declare-fun %lbl%@134862 () Bool)
(declare-fun %lbl%@134865 () Bool)
(declare-fun call32558formal@$ptr@0 () Int)
(declare-fun %lbl%@134981 () Bool)
(declare-fun %lbl%@135009 () Bool)
(declare-fun $sMem@3@@1 () (Array Int Int))
(declare-fun call32563formal@$ptr@0 () Int)
(declare-fun %lbl%@135070 () Bool)
(declare-fun %lbl%@135073 () Bool)
(declare-fun $Mem@3@@2 () (Array Int Int))
(declare-fun call32566formal@$ret@0 () Int)
(declare-fun %lbl%@135126 () Bool)
(declare-fun %lbl%@135129 () Bool)
(declare-fun %lbl%@135132 () Bool)
(declare-fun %lbl%@135136 () Bool)
(declare-fun $PciConfigId@4 () Int)
(declare-fun $PciConfigOffset@4 () Int)
(declare-fun edx@5@@0 () Int)
(declare-fun %lbl%@135188 () Bool)
(declare-fun %lbl%@135192 () Bool)
(declare-fun %lbl%@135196 () Bool)
(declare-fun %lbl%@135201 () Bool)
(declare-fun %lbl%@135204 () Bool)
(declare-fun call32581formal@$ptr@0 () Int)
(declare-fun %lbl%@135320 () Bool)
(declare-fun %lbl%@135348 () Bool)
(declare-fun $sMem@4@@1 () (Array Int Int))
(declare-fun call32586formal@$ptr@0 () Int)
(declare-fun %lbl%@135409 () Bool)
(declare-fun %lbl%@135412 () Bool)
(declare-fun $Mem@4@@2 () (Array Int Int))
(declare-fun call32589formal@$ret@0 () Int)
(declare-fun %lbl%@135465 () Bool)
(declare-fun %lbl%@135468 () Bool)
(declare-fun %lbl%@135471 () Bool)
(declare-fun %lbl%@135475 () Bool)
(declare-fun $PciConfigId@6 () Int)
(declare-fun $PciConfigOffset@6 () Int)
(declare-fun edx@6@@0 () Int)
(declare-fun %lbl%@135527 () Bool)
(declare-fun %lbl%@135531 () Bool)
(declare-fun %lbl%@135535 () Bool)
(declare-fun %lbl%@135540 () Bool)
(declare-fun %lbl%@135543 () Bool)
(declare-fun call32604formal@$ptr@0 () Int)
(declare-fun %lbl%@135659 () Bool)
(declare-fun %lbl%@135687 () Bool)
(declare-fun call32609formal@$ptr@0 () Int)
(declare-fun %lbl%@135748 () Bool)
(declare-fun %lbl%@135751 () Bool)
(declare-fun call32616formal@$x@0 () T@opn)
(declare-fun call32616formal@$y@0 () T@opn)
(declare-fun %lbl%@135796 () Bool)
(declare-fun %lbl%@135800 () Bool)
(declare-fun %lbl%+32961 () Bool)
(declare-fun $Efl@23 () Int)
(declare-fun ecx@3@@1 () Int)
(declare-fun %lbl%+32960 () Bool)
(declare-fun call32421formal@$ret@0 () Int)
(declare-fun %lbl%@133823 () Bool)
(declare-fun call32425formal@$ret@0 () Int)
(declare-fun %lbl%@133855 () Bool)
(declare-fun call32429formal@$ret@0 () Int)
(declare-fun %lbl%@133887 () Bool)
(declare-fun call32433formal@$ret@0 () Int)
(declare-fun %lbl%@133920 () Bool)
(declare-fun call32437formal@$ret@0 () Int)
(declare-fun call32446formal@$ptr@0 () Int)
(declare-fun %lbl%@133963 () Bool)
(declare-fun $Mem@0@@6 () (Array Int Int))
(declare-fun $sMem@0@@3 () (Array Int Int))
(declare-fun %lbl%@133991 () Bool)
(declare-fun call32451formal@$ptr@0 () Int)
(declare-fun %lbl%@134052 () Bool)
(declare-fun %lbl%@134055 () Bool)
(declare-fun %lbl%@134081 () Bool)
(declare-fun call32473formal@$ptr@0 () Int)
(declare-fun %lbl%@134118 () Bool)
(declare-fun %lbl%@134146 () Bool)
(declare-fun call32478formal@$ptr@0 () Int)
(declare-fun %lbl%@134170 () Bool)
(declare-fun call32478formal@$val@0 () Int)
(declare-fun %lbl%@134200 () Bool)
(declare-fun %lbl%@134228 () Bool)
(declare-fun %lbl%@134244 () Bool)
(declare-fun call32483formal@$val@0 () Int)
(declare-fun call32490formal@$x@0 () T@opn)
(declare-fun call32490formal@$y@0 () T@opn)
(declare-fun %lbl%@134291 () Bool)
(declare-fun %lbl%@134295 () Bool)
(declare-fun %lbl%+32949 () Bool)
(declare-fun $Efl@12@@2 () Int)
(declare-fun ecx@1@@4 () Int)
(declare-fun %lbl%+32948 () Bool)
(declare-fun call32397formal@$ret@0 () Int)
(declare-fun call32401formal@$ret@0 () Int)
(declare-fun call32408formal@$x@0 () T@opn)
(declare-fun call32408formal@$y@0 () T@opn)
(declare-fun %lbl%@133697 () Bool)
(declare-fun %lbl%@133701 () Bool)
(declare-fun %lbl%+32937 () Bool)
(declare-fun $Efl@7@@0 () Int)
(declare-fun %lbl%+32936 () Bool)
(declare-fun %lbl%@132851 () Bool)
(declare-fun %lbl%@132854 () Bool)
(declare-fun call32338formal@$ret@0 () Int)
(declare-fun %lbl%@133075 () Bool)
(declare-fun %lbl%@133219 () Bool)
(declare-fun call32350formal@$ret@0 () Int)
(declare-fun %lbl%@133277 () Bool)
(declare-fun call32354formal@$ret@0 () Int)
(declare-fun %lbl%@133310 () Bool)
(declare-fun call32358formal@$ret@0 () Int)
(declare-fun call32367formal@$ptr@0 () Int)
(declare-fun %lbl%@133353 () Bool)
(declare-fun %lbl%@133383 () Bool)
(declare-fun call32372formal@$ptr@0 () Int)
(declare-fun %lbl%@133446 () Bool)
(declare-fun %lbl%@133449 () Bool)
(declare-fun %lbl%@133501 () Bool)
(declare-fun call32384formal@$x@0 () T@opn)
(declare-fun call32384formal@$y@0 () T@opn)
(declare-fun %lbl%@133524 () Bool)
(declare-fun %lbl%@133528 () Bool)
(declare-fun %lbl%+131353 () Bool)
(push 1)
(set-info :boogie-vc-id PciMemSetup)
(assert (not
(let ((anon15_Else_correct@@0 (=> (! (and %lbl%+32939 true) :lblpos +32939) true)))
(let ((anon16_Else_correct (=> (! (and %lbl%+32951 true) :lblpos +32951) true)))
(let ((anon17_Else_correct (=> (! (and %lbl%+32963 true) :lblpos +32963) true)))
(let ((anon18_Else_correct (=> (! (and %lbl%+32975 true) :lblpos +32975) true)))
(let ((anon19_Else_correct (=> (! (and %lbl%+32987 true) :lblpos +32987) true)))
(let ((anon20_Else_correct (=> (! (and %lbl%+32999 true) :lblpos +32999) true)))
(let ((anon21_Else_correct (=> (! (and %lbl%+33011 true) :lblpos +33011) true)))
(let ((__L51_correct (=> (! (and %lbl%+33014 true) :lblpos +33014) (=> (= call32723formal@$ret@0 4) (and
(! (or %lbl%@136681 (IsValidPciId ecx)) :lblneg @136681)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@136684 (IsValidPciOffset 4)) :lblneg @136684)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@136687 (= ecx@13 ecx)) :lblneg @136687)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@136691 (= call32723formal@$ret@0 4)) :lblneg @136691)
(=> (= call32723formal@$ret@0 4) (=> (and
(= $PciConfigId@8 ecx)
(= $PciConfigOffset@8 4)
(= edx@11 3324)
(= call32730formal@$ptr@0 (+ call32343formal@$ret@0 0))) (and
(! (or %lbl%@136750 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @136750)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@136778 (sAddr call32730formal@$ptr@0)) :lblneg @136778)
(=> (sAddr call32730formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32730formal@$ptr@0) (select $sMem@5 call32730formal@$ptr@0))
(= call32735formal@$ptr@0 (+ call32343formal@$ret@0 0))) (and
(! (or %lbl%@136802 (PtrOk call32735formal@$ptr@0)) :lblneg @136802)
(=> (PtrOk call32735formal@$ptr@0) (=> (and
(word call32735formal@$val@0)
(= call32735formal@$val@0 (select $Mem@5@@0 call32735formal@$ptr@0))) (and
(! (or %lbl%@136835 (word (- call32735formal@$val@0 2))) :lblneg @136835)
(=> (word (- call32735formal@$val@0 2)) (=> (= call32739formal@$ret@0 (- call32735formal@$val@0 2)) (=> (and
(= call32742formal@$ret@0 call32739formal@$ret@0)
(= call32746formal@$ptr@0 (+ call32343formal@$ret@0 12))) (and
(! (or %lbl%@136895 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @136895)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@136923 (sAddr call32746formal@$ptr@0)) :lblneg @136923)
(=> (sAddr call32746formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32746formal@$ptr@0) (select $sMem@5 call32746formal@$ptr@0))
(= call32751formal@$ptr@0 (+ call32343formal@$ret@0 12))) (and
(! (or %lbl%@136947 (PtrOk call32751formal@$ptr@0)) :lblneg @136947)
(=> (PtrOk call32751formal@$ptr@0) (=> (and
(word call32751formal@$val@0)
(= call32751formal@$val@0 (select $Mem@5@@0 call32751formal@$ptr@0))
(= call32755formal@$ret@0 (q@and call32751formal@$val@0 call32742formal@$ret@0))
(word call32755formal@$ret@0)) (and
(! (or %lbl%@137017 (= ecx $PciConfigId@8)) :lblneg @137017)
(=> (= ecx $PciConfigId@8) (and
(! (or %lbl%@137021 (= 4 $PciConfigOffset@8)) :lblneg @137021)
(=> (= 4 $PciConfigOffset@8) (and
(! (or %lbl%@137025 (= edx@11 3324)) :lblneg @137025)
(=> (= edx@11 3324) (and
(! (or %lbl%@137030 (IsValidPciId ecx)) :lblneg @137030)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137033 (IsValidPciOffset 4)) :lblneg @137033)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@137036 (= (q@and ecx 7) 0)) :lblneg @137036)
(=> (= (q@and ecx 7) 0) (and
(! (or %lbl%@137045 (PciConfigReadResult ecx 0 eax@4@@0)) :lblneg @137045)
(=> (PciConfigReadResult ecx 0 eax@4@@0) (and
(! (or %lbl%@137051 (PciConfigReadResult ecx 4 eax@6)) :lblneg @137051)
(=> (PciConfigReadResult ecx 4 eax@6) (and
(! (or %lbl%@137057 (PciConfigReadResult ecx 12 eax@8)) :lblneg @137057)
(=> (PciConfigReadResult ecx 12 eax@8) (and
(! (or %lbl%@137063 (PciConfigReadResult ecx 16 eax@10)) :lblneg @137063)
(=> (PciConfigReadResult ecx 16 eax@10) (and
(! (or %lbl%@137069 (not (= (PciVendorId eax@4@@0) 65535))) :lblneg @137069)
(=> (not (= (PciVendorId eax@4@@0) 65535)) (and
(! (or %lbl%@137076 (= (PciHeaderType eax@8) 0)) :lblneg @137076)
(=> (= (PciHeaderType eax@8) 0) (and
(! (or %lbl%@137083 (=> (= (select $PciConfigState@@0 ecx) 0) (and
(= 4 4)
(= call32755formal@$ret@0 (q@and eax@6 (- ?FFFFFFFF 2)))))) :lblneg @137083)
(=> (=> (= (select $PciConfigState@@0 ecx) 0) (and
(= 4 4)
(= call32755formal@$ret@0 (q@and eax@6 (- ?FFFFFFFF 2))))) (and
(! (or %lbl%@137113 (=> (= (select $PciConfigState@@0 ecx) 1) (and
(= 4 16)
(= call32755formal@$ret@0 ?FFFFFFFF)))) :lblneg @137113)
(=> (=> (= (select $PciConfigState@@0 ecx) 1) (and
(= 4 16)
(= call32755formal@$ret@0 ?FFFFFFFF))) (and
(! (or %lbl%@137136 (=> (= (select $PciConfigState@@0 ecx) 2) (and
(= 4 16)
(= call32755formal@$ret@0 (PciMemAddr ecx))))) :lblneg @137136)
(=> (=> (= (select $PciConfigState@@0 ecx) 2) (and
(= 4 16)
(= call32755formal@$ret@0 (PciMemAddr ecx)))) (and
(! (or %lbl%@137160 (=> (= (select $PciConfigState@@0 ecx) 3) (and
(= 4 4)
(= call32755formal@$ret@0 (q@or eax@6 2))))) :lblneg @137160)
(=> (=> (= (select $PciConfigState@@0 ecx) 3) (and
(= 4 4)
(= call32755formal@$ret@0 (q@or eax@6 2)))) (and
(! (or %lbl%@137186 (not (= (select $PciConfigState@@0 ecx) 4))) :lblneg @137186)
(=> (not (= (select $PciConfigState@@0 ecx) 4)) (=> (and
(= $PciConfigState@0 (store $PciConfigState@@0 ecx (+ 1 (select $PciConfigState@@0 ecx))))
(= call32765formal@$ret@0 16)) (and
(! (or %lbl%@137263 (IsValidPciId ecx)) :lblneg @137263)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137266 (IsValidPciOffset 16)) :lblneg @137266)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@137269 (= ecx@13 ecx)) :lblneg @137269)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@137273 (= call32765formal@$ret@0 16)) :lblneg @137273)
(=> (= call32765formal@$ret@0 16) (=> (and
(= $PciConfigId@10 ecx)
(= $PciConfigOffset@10 16)
(= edx@12 3324)
(= call32772formal@$ptr@0 (+ call32343formal@$ret@0 0))) (and
(! (or %lbl%@137331 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @137331)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@137359 (sAddr call32772formal@$ptr@0)) :lblneg @137359)
(=> (sAddr call32772formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32772formal@$ptr@0) (select $sMem@5 call32772formal@$ptr@0))
(= call32777formal@$ptr@0 (+ call32343formal@$ret@0 0))) (and
(! (or %lbl%@137383 (PtrOk call32777formal@$ptr@0)) :lblneg @137383)
(=> (PtrOk call32777formal@$ptr@0) (=> (and
(word call32777formal@$val@0)
(= call32777formal@$val@0 (select $Mem@5@@0 call32777formal@$ptr@0))) (and
(! (or %lbl%@137424 (= ecx $PciConfigId@10)) :lblneg @137424)
(=> (= ecx $PciConfigId@10) (and
(! (or %lbl%@137428 (= 16 $PciConfigOffset@10)) :lblneg @137428)
(=> (= 16 $PciConfigOffset@10) (and
(! (or %lbl%@137432 (= edx@12 3324)) :lblneg @137432)
(=> (= edx@12 3324) (and
(! (or %lbl%@137437 (IsValidPciId ecx)) :lblneg @137437)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137440 (IsValidPciOffset 16)) :lblneg @137440)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@137443 (= (q@and ecx 7) 0)) :lblneg @137443)
(=> (= (q@and ecx 7) 0) (and
(! (or %lbl%@137452 (PciConfigReadResult ecx 0 eax@4@@0)) :lblneg @137452)
(=> (PciConfigReadResult ecx 0 eax@4@@0) (and
(! (or %lbl%@137458 (PciConfigReadResult ecx 4 eax@6)) :lblneg @137458)
(=> (PciConfigReadResult ecx 4 eax@6) (and
(! (or %lbl%@137464 (PciConfigReadResult ecx 12 eax@8)) :lblneg @137464)
(=> (PciConfigReadResult ecx 12 eax@8) (and
(! (or %lbl%@137470 (PciConfigReadResult ecx 16 eax@10)) :lblneg @137470)
(=> (PciConfigReadResult ecx 16 eax@10) (and
(! (or %lbl%@137476 (not (= (PciVendorId eax@4@@0) 65535))) :lblneg @137476)
(=> (not (= (PciVendorId eax@4@@0) 65535)) (and
(! (or %lbl%@137483 (= (PciHeaderType eax@8) 0)) :lblneg @137483)
(=> (= (PciHeaderType eax@8) 0) (and
(! (or %lbl%@137490 (=> (= (select $PciConfigState@0 ecx) 0) (and
(= 16 4)
(= call32777formal@$val@0 (q@and eax@6 (- ?FFFFFFFF 2)))))) :lblneg @137490)
(=> (=> (= (select $PciConfigState@0 ecx) 0) (and
(= 16 4)
(= call32777formal@$val@0 (q@and eax@6 (- ?FFFFFFFF 2))))) (and
(! (or %lbl%@137519 (=> (= (select $PciConfigState@0 ecx) 1) (and
(= 16 16)
(= call32777formal@$val@0 ?FFFFFFFF)))) :lblneg @137519)
(=> (=> (= (select $PciConfigState@0 ecx) 1) (and
(= 16 16)
(= call32777formal@$val@0 ?FFFFFFFF))) (and
(! (or %lbl%@137541 (=> (= (select $PciConfigState@0 ecx) 2) (and
(= 16 16)
(= call32777formal@$val@0 (PciMemAddr ecx))))) :lblneg @137541)
(=> (=> (= (select $PciConfigState@0 ecx) 2) (and
(= 16 16)
(= call32777formal@$val@0 (PciMemAddr ecx)))) (and
(! (or %lbl%@137564 (=> (= (select $PciConfigState@0 ecx) 3) (and
(= 16 4)
(= call32777formal@$val@0 (q@or eax@6 2))))) :lblneg @137564)
(=> (=> (= (select $PciConfigState@0 ecx) 3) (and
(= 16 4)
(= call32777formal@$val@0 (q@or eax@6 2)))) (and
(! (or %lbl%@137589 (not (= (select $PciConfigState@0 ecx) 4))) :lblneg @137589)
(=> (not (= (select $PciConfigState@0 ecx) 4)) (=> (and
(= $PciConfigState@1 (store $PciConfigState@0 ecx (+ 1 (select $PciConfigState@0 ecx))))
(= call32787formal@$ret@0 16)) (and
(! (or %lbl%@137664 (IsValidPciId ecx)) :lblneg @137664)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137667 (IsValidPciOffset 16)) :lblneg @137667)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@137670 (= ecx@13 ecx)) :lblneg @137670)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@137674 (= call32787formal@$ret@0 16)) :lblneg @137674)
(=> (= call32787formal@$ret@0 16) (=> (= $PciConfigId@12 ecx) (=> (and
(= $PciConfigOffset@12 16)
(= edx@13 3324)) (and
(! (or %lbl%@137726 (= ecx $PciConfigId@12)) :lblneg @137726)
(=> (= ecx $PciConfigId@12) (and
(! (or %lbl%@137730 (= 16 $PciConfigOffset@12)) :lblneg @137730)
(=> (= 16 $PciConfigOffset@12) (and
(! (or %lbl%@137734 (= edx@13 3324)) :lblneg @137734)
(=> (= edx@13 3324) (and
(! (or %lbl%@137739 (IsValidPciId ecx)) :lblneg @137739)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137742 (IsValidPciOffset 16)) :lblneg @137742)
(=> (IsValidPciOffset 16) (=> (PciConfigReadResult ecx 16 eax@18) (=> (and
(=> (and
(= (select $PciConfigState@1 ecx) 0)
(= 16 16)
(= (q@and eax@18 15) 0)) (= (PciMemAddr ecx) eax@18))
(=> (and
(= (select $PciConfigState@1 ecx) 2)
(= 16 16)) (= (PciMemSize ecx) (+ 1 (neg eax@18))))
(word eax@18)
(= call32802formal@$ptr@0 (+ call32343formal@$ret@0 24))) (and
(! (or %lbl%@137856 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @137856)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@137884 (sAddr call32802formal@$ptr@0)) :lblneg @137884)
(=> (sAddr call32802formal@$ptr@0) (=> (MemInv (store $Mem@5@@0 call32802formal@$ptr@0 eax@18) $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@6 (store $sMem@5 call32802formal@$ptr@0 eax@18))
(= call32807formal@$ptr@0 (+ call32343formal@$ret@0 24))) (and
(! (or %lbl%@137945 (PtrOk call32807formal@$ptr@0)) :lblneg @137945)
(=> (PtrOk call32807formal@$ptr@0) (and
(! (or %lbl%@137948 (word eax@18)) :lblneg @137948)
(=> (word eax@18) (=> (and
(= $Mem@6@@0 (store $Mem@5@@0 call32807formal@$ptr@0 eax@18))
(= call32810formal@$ret@0 16)) (and
(! (or %lbl%@138001 (IsValidPciId ecx)) :lblneg @138001)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@138004 (IsValidPciOffset 16)) :lblneg @138004)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@138007 (= ecx@13 ecx)) :lblneg @138007)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@138011 (= call32810formal@$ret@0 16)) :lblneg @138011)
(=> (= call32810formal@$ret@0 16) (=> (and
(= $PciConfigId@14 ecx)
(= $PciConfigOffset@14 16)
(= edx@14 3324)
(= call32817formal@$ptr@0 (+ call32343formal@$ret@0 20))) (and
(! (or %lbl%@138069 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @138069)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@138097 (sAddr call32817formal@$ptr@0)) :lblneg @138097)
(=> (sAddr call32817formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32817formal@$ptr@0) (select $sMem@6 call32817formal@$ptr@0))
(= call32822formal@$ptr@0 (+ call32343formal@$ret@0 20))) (and
(! (or %lbl%@138121 (PtrOk call32822formal@$ptr@0)) :lblneg @138121)
(=> (PtrOk call32822formal@$ptr@0) (=> (and
(word call32822formal@$val@0)
(= call32822formal@$val@0 (select $Mem@6@@0 call32822formal@$ptr@0))) (and
(! (or %lbl%@138162 (= ecx $PciConfigId@14)) :lblneg @138162)
(=> (= ecx $PciConfigId@14) (and
(! (or %lbl%@138166 (= 16 $PciConfigOffset@14)) :lblneg @138166)
(=> (= 16 $PciConfigOffset@14) (and
(! (or %lbl%@138170 (= edx@14 3324)) :lblneg @138170)
(=> (= edx@14 3324) (and
(! (or %lbl%@138175 (IsValidPciId ecx)) :lblneg @138175)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@138178 (IsValidPciOffset 16)) :lblneg @138178)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@138181 (= (q@and ecx 7) 0)) :lblneg @138181)
(=> (= (q@and ecx 7) 0) (and
(! (or %lbl%@138190 (PciConfigReadResult ecx 0 eax@4@@0)) :lblneg @138190)
(=> (PciConfigReadResult ecx 0 eax@4@@0) (and
(! (or %lbl%@138196 (PciConfigReadResult ecx 4 eax@6)) :lblneg @138196)
(=> (PciConfigReadResult ecx 4 eax@6) (and
(! (or %lbl%@138202 (PciConfigReadResult ecx 12 eax@8)) :lblneg @138202)
(=> (PciConfigReadResult ecx 12 eax@8) (and
(! (or %lbl%@138208 (PciConfigReadResult ecx 16 eax@10)) :lblneg @138208)
(=> (PciConfigReadResult ecx 16 eax@10) (and
(! (or %lbl%@138214 (not (= (PciVendorId eax@4@@0) 65535))) :lblneg @138214)
(=> (not (= (PciVendorId eax@4@@0) 65535)) (and
(! (or %lbl%@138221 (= (PciHeaderType eax@8) 0)) :lblneg @138221)
(=> (= (PciHeaderType eax@8) 0) (and
(! (or %lbl%@138228 (=> (= (select $PciConfigState@1 ecx) 0) (and
(= 16 4)
(= call32822formal@$val@0 (q@and eax@6 (- ?FFFFFFFF 2)))))) :lblneg @138228)
(=> (=> (= (select $PciConfigState@1 ecx) 0) (and
(= 16 4)
(= call32822formal@$val@0 (q@and eax@6 (- ?FFFFFFFF 2))))) (and
(! (or %lbl%@138257 (=> (= (select $PciConfigState@1 ecx) 1) (and
(= 16 16)
(= call32822formal@$val@0 ?FFFFFFFF)))) :lblneg @138257)
(=> (=> (= (select $PciConfigState@1 ecx) 1) (and
(= 16 16)
(= call32822formal@$val@0 ?FFFFFFFF))) (and
(! (or %lbl%@138279 (=> (= (select $PciConfigState@1 ecx) 2) (and
(= 16 16)
(= call32822formal@$val@0 (PciMemAddr ecx))))) :lblneg @138279)
(=> (=> (= (select $PciConfigState@1 ecx) 2) (and
(= 16 16)
(= call32822formal@$val@0 (PciMemAddr ecx)))) (and
(! (or %lbl%@138302 (=> (= (select $PciConfigState@1 ecx) 3) (and
(= 16 4)
(= call32822formal@$val@0 (q@or eax@6 2))))) :lblneg @138302)
(=> (=> (= (select $PciConfigState@1 ecx) 3) (and
(= 16 4)
(= call32822formal@$val@0 (q@or eax@6 2)))) (and
(! (or %lbl%@138327 (not (= (select $PciConfigState@1 ecx) 4))) :lblneg @138327)
(=> (not (= (select $PciConfigState@1 ecx) 4)) (=> (and
(= $PciConfigState@2 (store $PciConfigState@1 ecx (+ 1 (select $PciConfigState@1 ecx))))
(= call32832formal@$ret@0 4)) (and
(! (or %lbl%@138402 (IsValidPciId ecx)) :lblneg @138402)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@138405 (IsValidPciOffset 4)) :lblneg @138405)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@138408 (= ecx@13 ecx)) :lblneg @138408)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@138412 (= call32832formal@$ret@0 4)) :lblneg @138412)
(=> (= call32832formal@$ret@0 4) (=> (and
(= $PciConfigId@16 ecx)
(= $PciConfigOffset@16 4)
(= edx@15 3324)
(= call32839formal@$ptr@0 (+ call32343formal@$ret@0 12))) (and
(! (or %lbl%@138470 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @138470)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@138498 (sAddr call32839formal@$ptr@0)) :lblneg @138498)
(=> (sAddr call32839formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32839formal@$ptr@0) (select $sMem@6 call32839formal@$ptr@0))
(= call32844formal@$ptr@0 (+ call32343formal@$ret@0 12))) (and
(! (or %lbl%@138522 (PtrOk call32844formal@$ptr@0)) :lblneg @138522)
(=> (PtrOk call32844formal@$ptr@0) (=> (and
(word call32844formal@$val@0)
(= call32844formal@$val@0 (select $Mem@6@@0 call32844formal@$ptr@0))
(= call32848formal@$ret@0 (q@or call32844formal@$val@0 2))
(word call32848formal@$ret@0)) (and
(! (or %lbl%@138593 (= ecx $PciConfigId@16)) :lblneg @138593)
(=> (= ecx $PciConfigId@16) (and
(! (or %lbl%@138597 (= 4 $PciConfigOffset@16)) :lblneg @138597)
(=> (= 4 $PciConfigOffset@16) (and
(! (or %lbl%@138601 (= edx@15 3324)) :lblneg @138601)
(=> (= edx@15 3324) (and
(! (or %lbl%@138606 (IsValidPciId ecx)) :lblneg @138606)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@138609 (IsValidPciOffset 4)) :lblneg @138609)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@138612 (= (q@and ecx 7) 0)) :lblneg @138612)
(=> (= (q@and ecx 7) 0) (and
(! (or %lbl%@138621 (PciConfigReadResult ecx 0 eax@4@@0)) :lblneg @138621)
(=> (PciConfigReadResult ecx 0 eax@4@@0) (and
(! (or %lbl%@138627 (PciConfigReadResult ecx 4 eax@6)) :lblneg @138627)
(=> (PciConfigReadResult ecx 4 eax@6) (and
(! (or %lbl%@138633 (PciConfigReadResult ecx 12 eax@8)) :lblneg @138633)
(=> (PciConfigReadResult ecx 12 eax@8) (and
(! (or %lbl%@138639 (PciConfigReadResult ecx 16 eax@10)) :lblneg @138639)
(=> (PciConfigReadResult ecx 16 eax@10) (and
(! (or %lbl%@138645 (not (= (PciVendorId eax@4@@0) 65535))) :lblneg @138645)
(=> (not (= (PciVendorId eax@4@@0) 65535)) (and
(! (or %lbl%@138652 (= (PciHeaderType eax@8) 0)) :lblneg @138652)
(=> (= (PciHeaderType eax@8) 0) (and
(! (or %lbl%@138659 (=> (= (select $PciConfigState@2 ecx) 0) (and
(= 4 4)
(= call32848formal@$ret@0 (q@and eax@6 (- ?FFFFFFFF 2)))))) :lblneg @138659)
(=> (=> (= (select $PciConfigState@2 ecx) 0) (and
(= 4 4)
(= call32848formal@$ret@0 (q@and eax@6 (- ?FFFFFFFF 2))))) (and
(! (or %lbl%@138688 (=> (= (select $PciConfigState@2 ecx) 1) (and
(= 4 16)
(= call32848formal@$ret@0 ?FFFFFFFF)))) :lblneg @138688)
(=> (=> (= (select $PciConfigState@2 ecx) 1) (and
(= 4 16)
(= call32848formal@$ret@0 ?FFFFFFFF))) (and
(! (or %lbl%@138710 (=> (= (select $PciConfigState@2 ecx) 2) (and
(= 4 16)
(= call32848formal@$ret@0 (PciMemAddr ecx))))) :lblneg @138710)
(=> (=> (= (select $PciConfigState@2 ecx) 2) (and
(= 4 16)
(= call32848formal@$ret@0 (PciMemAddr ecx)))) (and
(! (or %lbl%@138733 (=> (= (select $PciConfigState@2 ecx) 3) (and
(= 4 4)
(= call32848formal@$ret@0 (q@or eax@6 2))))) :lblneg @138733)
(=> (=> (= (select $PciConfigState@2 ecx) 3) (and
(= 4 4)
(= call32848formal@$ret@0 (q@or eax@6 2)))) (and
(! (or %lbl%@138758 (not (= (select $PciConfigState@2 ecx) 4))) :lblneg @138758)
(=> (not (= (select $PciConfigState@2 ecx) 4)) (=> (and
(= $PciConfigState@3 (store $PciConfigState@2 ecx (+ 1 (select $PciConfigState@2 ecx))))
(= call32859formal@$ptr@0 (+ call32343formal@$ret@0 24))) (and
(! (or %lbl%@138817 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @138817)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@138845 (sAddr call32859formal@$ptr@0)) :lblneg @138845)
(=> (sAddr call32859formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32859formal@$ptr@0) (select $sMem@6 call32859formal@$ptr@0))
(= call32864formal@$ptr@0 (+ call32343formal@$ret@0 24))) (and
(! (or %lbl%@138869 (PtrOk call32864formal@$ptr@0)) :lblneg @138869)
(=> (PtrOk call32864formal@$ptr@0) (=> (word call32864formal@$val@0) (=> (and
(= call32864formal@$val@0 (select $Mem@6@@0 call32864formal@$ptr@0))
(= call32867formal@$ret@0 (neg call32864formal@$val@0))) (=> (and
(word call32867formal@$ret@0)
(word (+ call32867formal@$ret@0 1))
(= call32871formal@$ret@0 (+ call32867formal@$ret@0 1))
(= call32875formal@$ptr@0 (+ call32343formal@$ret@0 4))) (and
(! (or %lbl%@138967 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @138967)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@138995 (sAddr call32875formal@$ptr@0)) :lblneg @138995)
(=> (sAddr call32875formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32875formal@$ptr@0) (select $sMem@6 call32875formal@$ptr@0))
(= call32880formal@$ptr@0 (+ call32343formal@$ret@0 4))) (and
(! (or %lbl%@139019 (PtrOk call32880formal@$ptr@0)) :lblneg @139019)
(=> (PtrOk call32880formal@$ptr@0) (=> (word call32880formal@$val@0) (=> (and
(= call32880formal@$val@0 (select $Mem@6@@0 call32880formal@$ptr@0))
(= call32884formal@$ptr@0 (+ call32343formal@$ret@0 20))) (and
(! (or %lbl%@139058 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139058)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139086 (sAddr call32884formal@$ptr@0)) :lblneg @139086)
(=> (sAddr call32884formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32884formal@$ptr@0) (select $sMem@6 call32884formal@$ptr@0))
(= call32889formal@$ptr@0 (+ call32343formal@$ret@0 20))) (and
(! (or %lbl%@139110 (PtrOk call32889formal@$ptr@0)) :lblneg @139110)
(=> (PtrOk call32889formal@$ptr@0) (=> (word call32889formal@$val@0) (=> (and
(= call32889formal@$val@0 (select $Mem@6@@0 call32889formal@$ptr@0))
(= call32894formal@$ptr@0 (+ call32880formal@$val@0 0))) (and
(! (or %lbl%@139151 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139151)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139179 (pciAddr call32894formal@$ptr@0)) :lblneg @139179)
(=> (pciAddr call32894formal@$ptr@0) (=> (MemInv (store $Mem@6@@0 call32894formal@$ptr@0 call32889formal@$val@0) $sMem@6 $dMem@@0 $pciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $pciMem@0 (store $pciMem@@1 call32894formal@$ptr@0 call32889formal@$val@0))
(= call32899formal@$ptr@0 (+ call32880formal@$val@0 0))) (and
(! (or %lbl%@139240 (PtrOk call32899formal@$ptr@0)) :lblneg @139240)
(=> (PtrOk call32899formal@$ptr@0) (and
(! (or %lbl%@139243 (word call32889formal@$val@0)) :lblneg @139243)
(=> (word call32889formal@$val@0) (=> (and
(= $Mem@7 (store $Mem@6@@0 call32899formal@$ptr@0 call32889formal@$val@0))
(= call32904formal@$ptr@0 (+ call32880formal@$val@0 4))) (and
(! (or %lbl%@139282 (MemInv $Mem@7 $sMem@6 $dMem@@0 $pciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139282)
(=> (MemInv $Mem@7 $sMem@6 $dMem@@0 $pciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139309 (pciAddr call32904formal@$ptr@0)) :lblneg @139309)
(=> (pciAddr call32904formal@$ptr@0) (=> (MemInv (store $Mem@7 call32904formal@$ptr@0 call32871formal@$ret@0) $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $pciMem@1 (store $pciMem@0 call32904formal@$ptr@0 call32871formal@$ret@0))
(= call32909formal@$ptr@0 (+ call32880formal@$val@0 4))) (and
(! (or %lbl%@139369 (PtrOk call32909formal@$ptr@0)) :lblneg @139369)
(=> (PtrOk call32909formal@$ptr@0) (and
(! (or %lbl%@139372 (word call32871formal@$ret@0)) :lblneg @139372)
(=> (word call32871formal@$ret@0) (=> (= $Mem@8 (store $Mem@7 call32909formal@$ptr@0 call32871formal@$ret@0)) (=> (and
(= call32918formal@$oldPciConfigState@0 $PciConfigState@@0)
(= call32918formal@$oldPciMem@0 $pciMem@@1)
(= call32918formal@$oldMem@0 $Mem@@3)
(= call32918formal@$oldSMem@0 $sMem@@5)) (and
(! (or %lbl%@139426 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin call32918formal@$oldMem@0 call32918formal@$oldSMem@0 $dMem@@0 call32918formal@$oldPciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 call32918formal@$oldPciConfigState@0 DmaAddr@@0)) :lblneg @139426)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin call32918formal@$oldMem@0 call32918formal@$oldSMem@0 $dMem@@0 call32918formal@$oldPciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 call32918formal@$oldPciConfigState@0 DmaAddr@@0) (and
(! (or %lbl%@139502 (MemInv $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139502)
(=> (MemInv $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139529 (IoInv $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0 $pciMem@1)) :lblneg @139529)
(=> (IoInv $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0 $pciMem@1) (=> (and
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0)
(= call32921formal@$ret@0 call32335formal@$ret@0)) (and
(! (or %lbl%@139639 (MemInv $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139639)
(=> (MemInv $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139666 (fAddr $S@@0 call32921formal@$ret@0)) :lblneg @139666)
(=> (fAddr $S@@0 call32921formal@$ret@0) (=> (= (select $Mem@8 call32921formal@$ret@0) (select (select $fMems@@4 $S@@0) call32921formal@$ret@0)) (=> (and
(memAddr call32921formal@$ret@0)
(= call32927formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@139694 (= (ReturnToAddr (select $Mem@8 call32921formal@$ret@0)) call32927formal@$oldRA@0)) :lblneg @139694)
(=> (= (ReturnToAddr (select $Mem@8 call32921formal@$ret@0)) call32927formal@$oldRA@0) (and
(! (or %lbl%@139703 (Aligned call32921formal@$ret@0)) :lblneg @139703)
(=> (Aligned call32921formal@$ret@0) (=> (and
(= esp@0@@13 (+ call32921formal@$ret@0 4))
(Aligned esp@0@@13)) (and
(! (or %lbl%@139732 (= esp@0@@13 (+ esp 4))) :lblneg @139732)
(=> (= esp@0@@13 (+ esp 4)) (and
(! (or %lbl%@139740 (= call32871formal@$ret@0 (PciMemSize ecx))) :lblneg @139740)
(=> (= call32871formal@$ret@0 (PciMemSize ecx)) (and
(! (or %lbl%@139746 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0)) :lblneg @139746)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon21_Then_correct (=> (! (and %lbl%+33009 true) :lblpos +33009) (=> (and
(Je $Efl@58)
(= ecx@13 ecx@11)) __L51_correct))))
(let ((__L50_correct (=> (! (and %lbl%+33008 true) :lblpos +33008) (=> (= call32694formal@$ptr@0 (+ call32343formal@$ret@0 20)) (and
(! (or %lbl%@136422 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @136422)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@136450 (sAddr call32694formal@$ptr@0)) :lblneg @136450)
(=> (sAddr call32694formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32694formal@$ptr@0) (select $sMem@5 call32694formal@$ptr@0))
(= call32699formal@$ptr@0 (+ call32343formal@$ret@0 20))) (and
(! (or %lbl%@136474 (PtrOk call32699formal@$ptr@0)) :lblneg @136474)
(=> (PtrOk call32699formal@$ptr@0) (=> (and
(word call32699formal@$val@0)
(= call32699formal@$val@0 (select $Mem@5@@0 call32699formal@$ptr@0))) (=> (and
(= call32703formal@$ret@0 (q@and call32699formal@$val@0 15))
(word call32703formal@$ret@0)
(= call32710formal@$x@0 (OpnReg call32703formal@$ret@0))
(= call32710formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@136553 (OpnOk $Mem@5@@0 call32710formal@$x@0)) :lblneg @136553)
(=> (OpnOk $Mem@5@@0 call32710formal@$x@0) (and
(! (or %lbl%@136557 (OpnOk $Mem@5@@0 call32710formal@$y@0)) :lblneg @136557)
(=> (OpnOk $Mem@5@@0 call32710formal@$y@0) (=> (FlagsCmp $Efl@58 (EvalOpn $Mem@5@@0 call32710formal@$x@0) (EvalOpn $Mem@5@@0 call32710formal@$y@0)) (and
anon21_Then_correct
anon21_Else_correct)))))))))))))))))))
(let ((anon20_Then_correct (=> (! (and %lbl%+32997 true) :lblpos +32997) (=> (and
(Je $Efl@53)
(= ecx@11 ecx@9)) __L50_correct))))
(let ((__L49_correct (=> (! (and %lbl%+32996 true) :lblpos +32996) (=> (= call32660formal@$ptr@0 (+ call32343formal@$ret@0 16)) (and
(! (or %lbl%@136146 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @136146)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@136174 (sAddr call32660formal@$ptr@0)) :lblneg @136174)
(=> (sAddr call32660formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32660formal@$ptr@0) (select $sMem@5 call32660formal@$ptr@0))
(= call32665formal@$ptr@0 (+ call32343formal@$ret@0 16))) (and
(! (or %lbl%@136198 (PtrOk call32665formal@$ptr@0)) :lblneg @136198)
(=> (PtrOk call32665formal@$ptr@0) (=> (and
(word call32665formal@$val@0)
(= call32665formal@$val@0 (select $Mem@5@@0 call32665formal@$ptr@0))) (and
(! (or %lbl%@136233 (< 16 32)) :lblneg @136233)
(=> (< 16 32) (=> (and
(= call32669formal@$ret@0 (shr call32665formal@$val@0 16))
(word call32669formal@$ret@0)) (=> (and
(= call32673formal@$ret@0 (q@and call32669formal@$ret@0 255))
(word call32673formal@$ret@0)
(= call32680formal@$x@0 (OpnReg call32673formal@$ret@0))
(= call32680formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@136312 (OpnOk $Mem@5@@0 call32680formal@$x@0)) :lblneg @136312)
(=> (OpnOk $Mem@5@@0 call32680formal@$x@0) (and
(! (or %lbl%@136316 (OpnOk $Mem@5@@0 call32680formal@$y@0)) :lblneg @136316)
(=> (OpnOk $Mem@5@@0 call32680formal@$y@0) (=> (FlagsCmp $Efl@53 (EvalOpn $Mem@5@@0 call32680formal@$x@0) (EvalOpn $Mem@5@@0 call32680formal@$y@0)) (and
anon20_Then_correct
anon20_Else_correct))))))))))))))))))))))
(let ((anon19_Then_correct (=> (! (and %lbl%+32985 true) :lblpos +32985) (=> (and
(Jne $Efl@47)
(= ecx@9 ecx@7)) __L49_correct))))
(let ((__L48_correct (=> (! (and %lbl%+32984 true) :lblpos +32984) (=> (= call32630formal@$ptr@0 (+ call32343formal@$ret@0 8)) (and
(! (or %lbl%@135905 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @135905)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@135933 (sAddr call32630formal@$ptr@0)) :lblneg @135933)
(=> (sAddr call32630formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32630formal@$ptr@0) (select $sMem@5 call32630formal@$ptr@0))
(= call32635formal@$ptr@0 (+ call32343formal@$ret@0 8))) (and
(! (or %lbl%@135957 (PtrOk call32635formal@$ptr@0)) :lblneg @135957)
(=> (PtrOk call32635formal@$ptr@0) (=> (and
(word call32635formal@$val@0)
(= call32635formal@$val@0 (select $Mem@5@@0 call32635formal@$ptr@0))) (=> (and
(= call32639formal@$ret@0 (q@and call32635formal@$val@0 65535))
(word call32639formal@$ret@0)
(= call32646formal@$x@0 (OpnReg call32639formal@$ret@0))
(= call32646formal@$y@0 (OpnReg 65535))) (and
(! (or %lbl%@136036 (OpnOk $Mem@5@@0 call32646formal@$x@0)) :lblneg @136036)
(=> (OpnOk $Mem@5@@0 call32646formal@$x@0) (and
(! (or %lbl%@136040 (OpnOk $Mem@5@@0 call32646formal@$y@0)) :lblneg @136040)
(=> (OpnOk $Mem@5@@0 call32646formal@$y@0) (=> (FlagsCmp $Efl@47 (EvalOpn $Mem@5@@0 call32646formal@$x@0) (EvalOpn $Mem@5@@0 call32646formal@$y@0)) (and
anon19_Then_correct
anon19_Else_correct)))))))))))))))))))
(let ((anon18_Then_correct (=> (! (and %lbl%+32973 true) :lblpos +32973) (=> (and
(Jne $Efl@42)
(= ecx@7 ecx@5@@0)) __L48_correct))))
(let ((__L47_correct (=> (! (and %lbl%+32972 true) :lblpos +32972) (=> (Aligned 0) (and
(! (or %lbl%@134394 (and
(TV 0)
(TO 1)
(TO 3)
(TO 4))) :lblneg @134394)
(=> (and
(TV 0)
(TO 1)
(TO 3)
(TO 4)) (=> (= call32520formal@$ret@0 0) (and
(! (or %lbl%@134445 (IsValidPciId ecx)) :lblneg @134445)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@134448 (IsValidPciOffset 0)) :lblneg @134448)
(=> (IsValidPciOffset 0) (and
(! (or %lbl%@134451 (= ecx@5@@0 ecx)) :lblneg @134451)
(=> (= ecx@5@@0 ecx) (and
(! (or %lbl%@134455 (= call32520formal@$ret@0 0)) :lblneg @134455)
(=> (= call32520formal@$ret@0 0) (=> (= $PciConfigId@0@@1 ecx) (=> (and
(= $PciConfigOffset@0@@1 0)
(= edx@3@@1 3324)) (and
(! (or %lbl%@134510 (= ecx $PciConfigId@0@@1)) :lblneg @134510)
(=> (= ecx $PciConfigId@0@@1) (and
(! (or %lbl%@134514 (= 0 $PciConfigOffset@0@@1)) :lblneg @134514)
(=> (= 0 $PciConfigOffset@0@@1) (and
(! (or %lbl%@134518 (= edx@3@@1 3324)) :lblneg @134518)
(=> (= edx@3@@1 3324) (and
(! (or %lbl%@134523 (IsValidPciId ecx)) :lblneg @134523)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@134526 (IsValidPciOffset 0)) :lblneg @134526)
(=> (IsValidPciOffset 0) (=> (PciConfigReadResult ecx 0 eax@4@@0) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= 0 16)
(= (q@and eax@4@@0 15) 0)) (= (PciMemAddr ecx) eax@4@@0))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= 0 16)) (= (PciMemSize ecx) (+ 1 (neg eax@4@@0))))
(word eax@4@@0)
(= call32535formal@$ptr@0 (+ call32343formal@$ret@0 8))) (and
(! (or %lbl%@134642 (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @134642)
(=> (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@134670 (sAddr call32535formal@$ptr@0)) :lblneg @134670)
(=> (sAddr call32535formal@$ptr@0) (=> (MemInv (store $Mem@1@@4 call32535formal@$ptr@0 eax@4@@0) $sMem@2@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@2@@2 (store $sMem@1@@2 call32535formal@$ptr@0 eax@4@@0))
(= call32540formal@$ptr@0 (+ call32343formal@$ret@0 8))) (and
(! (or %lbl%@134731 (PtrOk call32540formal@$ptr@0)) :lblneg @134731)
(=> (PtrOk call32540formal@$ptr@0) (and
(! (or %lbl%@134734 (word eax@4@@0)) :lblneg @134734)
(=> (word eax@4@@0) (=> (and
(= $Mem@2@@3 (store $Mem@1@@4 call32540formal@$ptr@0 eax@4@@0))
(= call32543formal@$ret@0 4)) (and
(! (or %lbl%@134787 (IsValidPciId ecx)) :lblneg @134787)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@134790 (IsValidPciOffset 4)) :lblneg @134790)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@134793 (= ecx@5@@0 ecx)) :lblneg @134793)
(=> (= ecx@5@@0 ecx) (and
(! (or %lbl%@134797 (= call32543formal@$ret@0 4)) :lblneg @134797)
(=> (= call32543formal@$ret@0 4) (=> (= $PciConfigId@2 ecx) (=> (and
(= $PciConfigOffset@2 4)
(= edx@4 3324)) (and
(! (or %lbl%@134849 (= ecx $PciConfigId@2)) :lblneg @134849)
(=> (= ecx $PciConfigId@2) (and
(! (or %lbl%@134853 (= 4 $PciConfigOffset@2)) :lblneg @134853)
(=> (= 4 $PciConfigOffset@2) (and
(! (or %lbl%@134857 (= edx@4 3324)) :lblneg @134857)
(=> (= edx@4 3324) (and
(! (or %lbl%@134862 (IsValidPciId ecx)) :lblneg @134862)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@134865 (IsValidPciOffset 4)) :lblneg @134865)
(=> (IsValidPciOffset 4) (=> (PciConfigReadResult ecx 4 eax@6) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= 4 16)
(= (q@and eax@6 15) 0)) (= (PciMemAddr ecx) eax@6))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= 4 16)) (= (PciMemSize ecx) (+ 1 (neg eax@6))))
(word eax@6)
(= call32558formal@$ptr@0 (+ call32343formal@$ret@0 12))) (and
(! (or %lbl%@134981 (MemInv $Mem@2@@3 $sMem@2@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @134981)
(=> (MemInv $Mem@2@@3 $sMem@2@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@135009 (sAddr call32558formal@$ptr@0)) :lblneg @135009)
(=> (sAddr call32558formal@$ptr@0) (=> (MemInv (store $Mem@2@@3 call32558formal@$ptr@0 eax@6) $sMem@3@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@3@@1 (store $sMem@2@@2 call32558formal@$ptr@0 eax@6))
(= call32563formal@$ptr@0 (+ call32343formal@$ret@0 12))) (and
(! (or %lbl%@135070 (PtrOk call32563formal@$ptr@0)) :lblneg @135070)
(=> (PtrOk call32563formal@$ptr@0) (and
(! (or %lbl%@135073 (word eax@6)) :lblneg @135073)
(=> (word eax@6) (=> (and
(= $Mem@3@@2 (store $Mem@2@@3 call32563formal@$ptr@0 eax@6))
(= call32566formal@$ret@0 12)) (and
(! (or %lbl%@135126 (IsValidPciId ecx)) :lblneg @135126)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@135129 (IsValidPciOffset 12)) :lblneg @135129)
(=> (IsValidPciOffset 12) (and
(! (or %lbl%@135132 (= ecx@5@@0 ecx)) :lblneg @135132)
(=> (= ecx@5@@0 ecx) (and
(! (or %lbl%@135136 (= call32566formal@$ret@0 12)) :lblneg @135136)
(=> (= call32566formal@$ret@0 12) (=> (= $PciConfigId@4 ecx) (=> (and
(= $PciConfigOffset@4 12)
(= edx@5@@0 3324)) (and
(! (or %lbl%@135188 (= ecx $PciConfigId@4)) :lblneg @135188)
(=> (= ecx $PciConfigId@4) (and
(! (or %lbl%@135192 (= 12 $PciConfigOffset@4)) :lblneg @135192)
(=> (= 12 $PciConfigOffset@4) (and
(! (or %lbl%@135196 (= edx@5@@0 3324)) :lblneg @135196)
(=> (= edx@5@@0 3324) (and
(! (or %lbl%@135201 (IsValidPciId ecx)) :lblneg @135201)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@135204 (IsValidPciOffset 12)) :lblneg @135204)
(=> (IsValidPciOffset 12) (=> (PciConfigReadResult ecx 12 eax@8) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= 12 16)
(= (q@and eax@8 15) 0)) (= (PciMemAddr ecx) eax@8))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= 12 16)) (= (PciMemSize ecx) (+ 1 (neg eax@8))))
(word eax@8)
(= call32581formal@$ptr@0 (+ call32343formal@$ret@0 16))) (and
(! (or %lbl%@135320 (MemInv $Mem@3@@2 $sMem@3@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @135320)
(=> (MemInv $Mem@3@@2 $sMem@3@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@135348 (sAddr call32581formal@$ptr@0)) :lblneg @135348)
(=> (sAddr call32581formal@$ptr@0) (=> (MemInv (store $Mem@3@@2 call32581formal@$ptr@0 eax@8) $sMem@4@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@4@@1 (store $sMem@3@@1 call32581formal@$ptr@0 eax@8))
(= call32586formal@$ptr@0 (+ call32343formal@$ret@0 16))) (and
(! (or %lbl%@135409 (PtrOk call32586formal@$ptr@0)) :lblneg @135409)
(=> (PtrOk call32586formal@$ptr@0) (and
(! (or %lbl%@135412 (word eax@8)) :lblneg @135412)
(=> (word eax@8) (=> (and
(= $Mem@4@@2 (store $Mem@3@@2 call32586formal@$ptr@0 eax@8))
(= call32589formal@$ret@0 16)) (and
(! (or %lbl%@135465 (IsValidPciId ecx)) :lblneg @135465)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@135468 (IsValidPciOffset 16)) :lblneg @135468)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@135471 (= ecx@5@@0 ecx)) :lblneg @135471)
(=> (= ecx@5@@0 ecx) (and
(! (or %lbl%@135475 (= call32589formal@$ret@0 16)) :lblneg @135475)
(=> (= call32589formal@$ret@0 16) (=> (= $PciConfigId@6 ecx) (=> (and
(= $PciConfigOffset@6 16)
(= edx@6@@0 3324)) (and
(! (or %lbl%@135527 (= ecx $PciConfigId@6)) :lblneg @135527)
(=> (= ecx $PciConfigId@6) (and
(! (or %lbl%@135531 (= 16 $PciConfigOffset@6)) :lblneg @135531)
(=> (= 16 $PciConfigOffset@6) (and
(! (or %lbl%@135535 (= edx@6@@0 3324)) :lblneg @135535)
(=> (= edx@6@@0 3324) (and
(! (or %lbl%@135540 (IsValidPciId ecx)) :lblneg @135540)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@135543 (IsValidPciOffset 16)) :lblneg @135543)
(=> (IsValidPciOffset 16) (=> (PciConfigReadResult ecx 16 eax@10) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= 16 16)
(= (q@and eax@10 15) 0)) (= (PciMemAddr ecx) eax@10))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= 16 16)) (= (PciMemSize ecx) (+ 1 (neg eax@10))))
(word eax@10)
(= call32604formal@$ptr@0 (+ call32343formal@$ret@0 20))) (and
(! (or %lbl%@135659 (MemInv $Mem@4@@2 $sMem@4@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @135659)
(=> (MemInv $Mem@4@@2 $sMem@4@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@135687 (sAddr call32604formal@$ptr@0)) :lblneg @135687)
(=> (sAddr call32604formal@$ptr@0) (=> (MemInv (store $Mem@4@@2 call32604formal@$ptr@0 eax@10) $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@5 (store $sMem@4@@1 call32604formal@$ptr@0 eax@10))
(= call32609formal@$ptr@0 (+ call32343formal@$ret@0 20))) (and
(! (or %lbl%@135748 (PtrOk call32609formal@$ptr@0)) :lblneg @135748)
(=> (PtrOk call32609formal@$ptr@0) (and
(! (or %lbl%@135751 (word eax@10)) :lblneg @135751)
(=> (word eax@10) (=> (= $Mem@5@@0 (store $Mem@4@@2 call32609formal@$ptr@0 eax@10)) (=> (and
(= call32616formal@$x@0 (OpnReg eax@10))
(= call32616formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@135796 (OpnOk $Mem@5@@0 call32616formal@$x@0)) :lblneg @135796)
(=> (OpnOk $Mem@5@@0 call32616formal@$x@0) (and
(! (or %lbl%@135800 (OpnOk $Mem@5@@0 call32616formal@$y@0)) :lblneg @135800)
(=> (OpnOk $Mem@5@@0 call32616formal@$y@0) (=> (FlagsCmp $Efl@42 (EvalOpn $Mem@5@@0 call32616formal@$x@0) (EvalOpn $Mem@5@@0 call32616formal@$y@0)) (and
anon18_Then_correct
anon18_Else_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon17_Then_correct (=> (! (and %lbl%+32961 true) :lblpos +32961) (=> (and
(Je $Efl@23)
(= ecx@5@@0 ecx@3@@1)) __L47_correct))))
(let ((__L46_correct (=> (! (and %lbl%+32960 true) :lblpos +32960) (=> (= call32421formal@$ret@0 ecx@3@@1) (and
(! (or %lbl%@133823 (word (+ call32421formal@$ret@0 call32421formal@$ret@0))) :lblneg @133823)
(=> (word (+ call32421formal@$ret@0 call32421formal@$ret@0)) (=> (= call32425formal@$ret@0 (+ call32421formal@$ret@0 call32421formal@$ret@0)) (and
(! (or %lbl%@133855 (word (+ call32425formal@$ret@0 call32425formal@$ret@0))) :lblneg @133855)
(=> (word (+ call32425formal@$ret@0 call32425formal@$ret@0)) (=> (= call32429formal@$ret@0 (+ call32425formal@$ret@0 call32425formal@$ret@0)) (and
(! (or %lbl%@133887 (word (+ call32429formal@$ret@0 call32429formal@$ret@0))) :lblneg @133887)
(=> (word (+ call32429formal@$ret@0 call32429formal@$ret@0)) (=> (= call32433formal@$ret@0 (+ call32429formal@$ret@0 call32429formal@$ret@0)) (and
(! (or %lbl%@133920 (word (+ call32433formal@$ret@0 PciLo@@0))) :lblneg @133920)
(=> (word (+ call32433formal@$ret@0 PciLo@@0)) (=> (and
(= call32437formal@$ret@0 (+ call32433formal@$ret@0 PciLo@@0))
(= call32446formal@$ptr@0 (+ call32343formal@$ret@0 4))) (and
(! (or %lbl%@133963 (MemInv $Mem@0@@6 $sMem@0@@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @133963)
(=> (MemInv $Mem@0@@6 $sMem@0@@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@133991 (sAddr call32446formal@$ptr@0)) :lblneg @133991)
(=> (sAddr call32446formal@$ptr@0) (=> (MemInv (store $Mem@0@@6 call32446formal@$ptr@0 call32437formal@$ret@0) $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@1@@2 (store $sMem@0@@3 call32446formal@$ptr@0 call32437formal@$ret@0))
(= call32451formal@$ptr@0 (+ call32343formal@$ret@0 4))) (and
(! (or %lbl%@134052 (PtrOk call32451formal@$ptr@0)) :lblneg @134052)
(=> (PtrOk call32451formal@$ptr@0) (and
(! (or %lbl%@134055 (word call32437formal@$ret@0)) :lblneg @134055)
(=> (word call32437formal@$ret@0) (=> (= $Mem@1@@4 (store $Mem@0@@6 call32451formal@$ptr@0 call32437formal@$ret@0)) (and
(! (or %lbl%@134081 (and
(TV PciLo@@0)
(TO (* ecx 2))
(TO (+ (* ecx 2) 1)))) :lblneg @134081)
(=> (and
(TV PciLo@@0)
(TO (* ecx 2))
(TO (+ (* ecx 2) 1))) (=> (= call32473formal@$ptr@0 (+ call32343formal@$ret@0 4)) (and
(! (or %lbl%@134118 (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @134118)
(=> (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@134146 (sAddr call32473formal@$ptr@0)) :lblneg @134146)
(=> (sAddr call32473formal@$ptr@0) (=> (and
(= (select $Mem@1@@4 call32473formal@$ptr@0) (select $sMem@1@@2 call32473formal@$ptr@0))
(= call32478formal@$ptr@0 (+ call32343formal@$ret@0 4))) (and
(! (or %lbl%@134170 (PtrOk call32478formal@$ptr@0)) :lblneg @134170)
(=> (PtrOk call32478formal@$ptr@0) (=> (and
(word call32478formal@$val@0)
(= call32478formal@$val@0 (select $Mem@1@@4 call32478formal@$ptr@0))) (and
(! (or %lbl%@134200 (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @134200)
(=> (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@134228 (pciAddr call32478formal@$val@0)) :lblneg @134228)
(=> (pciAddr call32478formal@$val@0) (=> (= (select $Mem@1@@4 call32478formal@$val@0) (select $pciMem@@1 call32478formal@$val@0)) (and
(! (or %lbl%@134244 (PtrOk call32478formal@$val@0)) :lblneg @134244)
(=> (PtrOk call32478formal@$val@0) (=> (and
(word call32483formal@$val@0)
(= call32483formal@$val@0 (select $Mem@1@@4 call32478formal@$val@0))
(= call32490formal@$x@0 (OpnReg call32483formal@$val@0))
(= call32490formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@134291 (OpnOk $Mem@1@@4 call32490formal@$x@0)) :lblneg @134291)
(=> (OpnOk $Mem@1@@4 call32490formal@$x@0) (and
(! (or %lbl%@134295 (OpnOk $Mem@1@@4 call32490formal@$y@0)) :lblneg @134295)
(=> (OpnOk $Mem@1@@4 call32490formal@$y@0) (=> (FlagsCmp $Efl@23 (EvalOpn $Mem@1@@4 call32490formal@$x@0) (EvalOpn $Mem@1@@4 call32490formal@$y@0)) (and
anon17_Then_correct
anon17_Else_correct))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon16_Then_correct (=> (! (and %lbl%+32949 true) :lblpos +32949) (=> (and
(Je $Efl@12@@2)
(= ecx@3@@1 ecx@1@@4)) __L46_correct))))
(let ((__L45_correct (=> (! (and %lbl%+32948 true) :lblpos +32948) (=> (= call32397formal@$ret@0 ecx@1@@4) (=> (and
(= call32401formal@$ret@0 (q@and call32397formal@$ret@0 7))
(word call32401formal@$ret@0)
(= call32408formal@$x@0 (OpnReg call32401formal@$ret@0))
(= call32408formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@133697 (OpnOk $Mem@0@@6 call32408formal@$x@0)) :lblneg @133697)
(=> (OpnOk $Mem@0@@6 call32408formal@$x@0) (and
(! (or %lbl%@133701 (OpnOk $Mem@0@@6 call32408formal@$y@0)) :lblneg @133701)
(=> (OpnOk $Mem@0@@6 call32408formal@$y@0) (=> (FlagsCmp $Efl@12@@2 (EvalOpn $Mem@0@@6 call32408formal@$x@0) (EvalOpn $Mem@0@@6 call32408formal@$y@0)) (and
anon16_Then_correct
anon16_Else_correct)))))))))))
(let ((anon15_Then_correct@@0 (=> (! (and %lbl%+32937 true) :lblpos +32937) (=> (and
(Jb $Efl@7@@0)
(= ecx@1@@4 ecx)) __L45_correct))))
(let ((anon0_correct@@25 (=> (! (and %lbl%+32936 true) :lblpos +32936) (and
(! (or %lbl%@132851 (isStack 0)) :lblneg @132851)
(=> (isStack 0) (and
(! (or %lbl%@132854 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @132854)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState 0)) (StackTag 0 $tMems@@12))
(=> (IsYielded (select $StackState 0)) (= (select $StackState 0) (StackYielded (StackEbp 0 $tMems@@12) (+ (StackEsp 0 $tMems@@12) 4) (StackRA 0 $tMems@@12 $fMems@@4))))
(= call32335formal@$ret@0 esp)
(= call32338formal@$ret@0 DLo@@0)) (and
(! (or %lbl%@133075 (Aligned call32338formal@$ret@0)) :lblneg @133075)
(=> (Aligned call32338formal@$ret@0) (=> (and
(Aligned (- call32338formal@$ret@0 4))
(Aligned (- call32338formal@$ret@0 8))
(Aligned (- call32338formal@$ret@0 12))
(Aligned (- call32338formal@$ret@0 16))
(Aligned (- call32338formal@$ret@0 20))
(Aligned (- call32338formal@$ret@0 24))
(Aligned (- call32338formal@$ret@0 28))
(Aligned (- call32338formal@$ret@0 32))
(Aligned (- call32338formal@$ret@0 36))
(Aligned (- call32338formal@$ret@0 40))
(Aligned (- call32338formal@$ret@0 44))
(Aligned (- call32338formal@$ret@0 48))
(Aligned (- call32338formal@$ret@0 52))
(Aligned (- call32338formal@$ret@0 56))
(Aligned (- call32338formal@$ret@0 60))
(Aligned (- call32338formal@$ret@0 64))) (and
(! (or %lbl%@133219 (word (- call32338formal@$ret@0 28))) :lblneg @133219)
(=> (word (- call32338formal@$ret@0 28)) (=> (and
(= call32343formal@$ret@0 (- call32338formal@$ret@0 28))
(= call32350formal@$ret@0 2147483647)) (and
(! (or %lbl%@133277 (word (+ call32350formal@$ret@0 2147483647))) :lblneg @133277)
(=> (word (+ call32350formal@$ret@0 2147483647)) (=> (= call32354formal@$ret@0 (+ call32350formal@$ret@0 2147483647)) (and
(! (or %lbl%@133310 (word (+ call32354formal@$ret@0 1))) :lblneg @133310)
(=> (word (+ call32354formal@$ret@0 1)) (=> (and
(= call32358formal@$ret@0 (+ call32354formal@$ret@0 1))
(= call32367formal@$ptr@0 (+ call32343formal@$ret@0 0))) (and
(! (or %lbl%@133353 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @133353)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@133383 (sAddr call32367formal@$ptr@0)) :lblneg @133383)
(=> (sAddr call32367formal@$ptr@0) (=> (MemInv (store $Mem@@3 call32367formal@$ptr@0 call32358formal@$ret@0) $sMem@0@@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0@@3 (store $sMem@@5 call32367formal@$ptr@0 call32358formal@$ret@0))
(= call32372formal@$ptr@0 (+ call32343formal@$ret@0 0))) (and
(! (or %lbl%@133446 (PtrOk call32372formal@$ptr@0)) :lblneg @133446)
(=> (PtrOk call32372formal@$ptr@0) (and
(! (or %lbl%@133449 (word call32358formal@$ret@0)) :lblneg @133449)
(=> (word call32358formal@$ret@0) (=> (and
(= $Mem@0@@6 (store $Mem@@3 call32372formal@$ptr@0 call32358formal@$ret@0))
(forall (($IoMmuEnabled@@1 Bool) ($PciConfigState@@1 (Array Int Int)) (DmaAddr@@1 Int) ($pciMem@@2 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@1 $PciConfigState@@1 DmaAddr@@1 $pciMem@@2) (_IoInv $IoMmuEnabled@@1 $PciConfigState@@1 DmaAddr@@1 $pciMem@@2))
 :qid |Commonib.268:17|
 :skolemid |225|
))) (and
(! (or %lbl%@133501 (TV ecx)) :lblneg @133501)
(=> (TV ecx) (=> (and
(= call32384formal@$x@0 (OpnReg ecx))
(= call32384formal@$y@0 (OpnReg 65536))) (and
(! (or %lbl%@133524 (OpnOk $Mem@0@@6 call32384formal@$x@0)) :lblneg @133524)
(=> (OpnOk $Mem@0@@6 call32384formal@$x@0) (and
(! (or %lbl%@133528 (OpnOk $Mem@0@@6 call32384formal@$y@0)) :lblneg @133528)
(=> (OpnOk $Mem@0@@6 call32384formal@$y@0) (=> (FlagsCmp $Efl@7@@0 (EvalOpn $Mem@0@@6 call32384formal@$x@0) (EvalOpn $Mem@0@@6 call32384formal@$y@0)) (and
anon15_Then_correct@@0
anon15_Else_correct@@0))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@25 (=> (! (and %lbl%+131353 true) :lblpos +131353) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(isStack $S@@0)
(SpRequire $S@@0 esp 4)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@25))))
PreconditionGeneratedEntry_correct@@25)))))))))))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33056 () Bool)
(declare-fun call33041formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@140468 () Bool)
(declare-fun %lbl%@140479 () Bool)
(declare-fun esp@0@@14 () Int)
(declare-fun %lbl%@140512 () Bool)
(declare-fun %lbl%@140520 () Bool)
(declare-fun eax@0@@1 () Int)
(declare-fun %lbl%@140533 () Bool)
(declare-fun %lbl%+33053 () Bool)
(declare-fun $Efl@1@@1 () Int)
(declare-fun %lbl%@140420 () Bool)
(declare-fun call33021formal@$ret@0 () Int)
(declare-fun call33038formal@$ret@0 () Int)
(declare-fun %lbl%+33051 () Bool)
(declare-fun %lbl%+33050 () Bool)
(declare-fun %lbl%@140128 () Bool)
(declare-fun %lbl%@140131 () Bool)
(declare-fun call33028formal@$x@0 () T@opn)
(declare-fun call33028formal@$y@0 () T@opn)
(declare-fun %lbl%@140374 () Bool)
(declare-fun %lbl%@140379 () Bool)
(declare-fun %lbl%+139830 () Bool)
(push 1)
(set-info :boogie-vc-id PciDmaBuffer)
(assert (not
(let ((__L52_correct (=> (! (and %lbl%+33056 true) :lblpos +33056) (=> (= call33041formal@$oldRA@0 $RET@@0) (and
(! (or %lbl%@140468 (= (ReturnToAddr (select $Mem@@3 esp)) call33041formal@$oldRA@0)) :lblneg @140468)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33041formal@$oldRA@0) (and
(! (or %lbl%@140479 (Aligned esp)) :lblneg @140479)
(=> (Aligned esp) (=> (and
(= esp@0@@14 (+ esp 4))
(Aligned esp@0@@14)) (and
(! (or %lbl%@140512 (= esp@0@@14 (+ esp 4))) :lblneg @140512)
(=> (= esp@0@@14 (+ esp 4)) (and
(! (or %lbl%@140520 (=> $IoMmuEnabled@@0 (= eax@0@@1 (- ?dmaLo 8)))) :lblneg @140520)
(=> (=> $IoMmuEnabled@@0 (= eax@0@@1 (- ?dmaLo 8))) (and
(! (or %lbl%@140533 (=> (not $IoMmuEnabled@@0) (= eax@0@@1 0))) :lblneg @140533)
(=> (=> (not $IoMmuEnabled@@0) (= eax@0@@1 0)) true)))))))))))))))
(let ((anon3_Else_correct@@4 (=> (! (and %lbl%+33053 true) :lblpos +33053) (=> (not (Je $Efl@1@@1)) (and
(! (or %lbl%@140420 (word (- call33021formal@$ret@0 8))) :lblneg @140420)
(=> (word (- call33021formal@$ret@0 8)) (=> (and
(= call33038formal@$ret@0 (- call33021formal@$ret@0 8))
(= eax@0@@1 call33038formal@$ret@0)) __L52_correct)))))))
(let ((anon3_Then_correct@@4 (=> (! (and %lbl%+33051 true) :lblpos +33051) (=> (and
(Je $Efl@1@@1)
(= eax@0@@1 call33021formal@$ret@0)) __L52_correct))))
(let ((anon0_correct@@26 (=> (! (and %lbl%+33050 true) :lblpos +33050) (and
(! (or %lbl%@140128 (isStack $S@@0)) :lblneg @140128)
(=> (isStack $S@@0) (and
(! (or %lbl%@140131 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @140131)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(forall (($IoMmuEnabled@@2 Bool) ($PciConfigState@@2 (Array Int Int)) (DmaAddr@@2 Int) ($pciMem@@3 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@2 $PciConfigState@@2 DmaAddr@@2 $pciMem@@3) (_IoInv $IoMmuEnabled@@2 $PciConfigState@@2 DmaAddr@@2 $pciMem@@3))
 :qid |Commonib.268:17|
 :skolemid |225|
))
(= call33021formal@$ret@0 DmaAddr@@0)
(= call33028formal@$x@0 (OpnReg call33021formal@$ret@0))
(= call33028formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@140374 (OpnOk $Mem@@3 call33028formal@$x@0)) :lblneg @140374)
(=> (OpnOk $Mem@@3 call33028formal@$x@0) (and
(! (or %lbl%@140379 (OpnOk $Mem@@3 call33028formal@$y@0)) :lblneg @140379)
(=> (OpnOk $Mem@@3 call33028formal@$y@0) (=> (FlagsCmp $Efl@1@@1 (EvalOpn $Mem@@3 call33028formal@$x@0) (EvalOpn $Mem@@3 call33028formal@$y@0)) (and
anon3_Then_correct@@4
anon3_Else_correct@@4)))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@26 (=> (! (and %lbl%+139830 true) :lblpos +139830) (=> (= $RET@@0 (ReturnToAddr (select $Mem@@3 esp))) (=> (and
(isStack $S@@0)
(SpRequire $S@@0 esp 4)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@26)))))
PreconditionGeneratedEntry_correct@@26)))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33069 () Bool)
(declare-fun %lbl%@140821 () Bool)
(declare-fun %lbl%@140824 () Bool)
(declare-fun call33063formal@$ret@0 () Int)
(declare-fun call33066formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@141056 () Bool)
(declare-fun %lbl%@141067 () Bool)
(declare-fun esp@0@@15 () Int)
(declare-fun %lbl%@141098 () Bool)
(declare-fun %lbl%@141106 () Bool)
(declare-fun %lbl%@141115 () Bool)
(declare-fun %lbl%+140545 () Bool)
(push 1)
(set-info :boogie-vc-id PciDmaPhysicalAddr)
(assert (not
(let ((anon0_correct@@27 (=> (! (and %lbl%+33069 true) :lblpos +33069) (and
(! (or %lbl%@140821 (isStack $S@@0)) :lblneg @140821)
(=> (isStack $S@@0) (and
(! (or %lbl%@140824 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @140824)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $S@@0 CurrentStack)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(forall (($IoMmuEnabled@@3 Bool) ($PciConfigState@@3 (Array Int Int)) (DmaAddr@@3 Int) ($pciMem@@4 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@3 $PciConfigState@@3 DmaAddr@@3 $pciMem@@4) (_IoInv $IoMmuEnabled@@3 $PciConfigState@@3 DmaAddr@@3 $pciMem@@4))
 :qid |Commonib.268:17|
 :skolemid |225|
))
(= call33063formal@$ret@0 DmaAddr@@0)
(= call33066formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@141056 (= (ReturnToAddr (select $Mem@@3 esp)) call33066formal@$oldRA@0)) :lblneg @141056)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33066formal@$oldRA@0) (and
(! (or %lbl%@141067 (Aligned esp)) :lblneg @141067)
(=> (Aligned esp) (=> (and
(= esp@0@@15 (+ esp 4))
(Aligned esp@0@@15)) (and
(! (or %lbl%@141098 (= esp@0@@15 (+ esp 4))) :lblneg @141098)
(=> (= esp@0@@15 (+ esp 4)) (and
(! (or %lbl%@141106 (=> $IoMmuEnabled@@0 (= call33063formal@$ret@0 ?dmaLo))) :lblneg @141106)
(=> (=> $IoMmuEnabled@@0 (= call33063formal@$ret@0 ?dmaLo)) (and
(! (or %lbl%@141115 (=> (not $IoMmuEnabled@@0) (= call33063formal@$ret@0 0))) :lblneg @141115)
(=> (=> (not $IoMmuEnabled@@0) (= call33063formal@$ret@0 0)) true)))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@27 (=> (! (and %lbl%+140545 true) :lblpos +140545) (=> (= $RET@@0 (ReturnToAddr (select $Mem@@3 esp))) (=> (and
(isStack $S@@0)
(SpRequire $S@@0 esp 4)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@27)))))
PreconditionGeneratedEntry_correct@@27))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33235 () Bool)
(declare-fun %lbl%+33247 () Bool)
(declare-fun %lbl%+33259 () Bool)
(declare-fun %lbl%+33271 () Bool)
(declare-fun %lbl%+33274 () Bool)
(declare-fun call33220formal@$ptr@0 () Int)
(declare-fun call33154formal@$val@0 () Int)
(declare-fun edx@7 () Int)
(declare-fun %lbl%@142739 () Bool)
(declare-fun %lbl%@142741 () Bool)
(declare-fun $id@@0 () Int)
(declare-fun %lbl%@142750 () Bool)
(declare-fun PciMemLoaded (Int Int Int) Bool)
(declare-fun call33220formal@$val@0 () Int)
(declare-fun call33223formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@142805 () Bool)
(declare-fun %lbl%@142816 () Bool)
(declare-fun esp@0@@16 () Int)
(declare-fun %lbl%@142847 () Bool)
(declare-fun %lbl%@142855 () Bool)
(declare-fun $offset@@0 () Int)
(declare-fun %lbl%+33269 () Bool)
(declare-fun $Efl@15 () Int)
(declare-fun edx@5@@1 () Int)
(declare-fun %lbl%+33268 () Bool)
(declare-fun call33179formal@$ptr@0 () Int)
(declare-fun call33141formal@$ret@0 () Int)
(declare-fun ecx@5@@1 () Int)
(declare-fun %lbl%@142454 () Bool)
(declare-fun %lbl%@142484 () Bool)
(declare-fun call33188formal@$ptr@0 () Int)
(declare-fun %lbl%@142517 () Bool)
(declare-fun call33188formal@$val@0 () Int)
(declare-fun call33191formal@$ret@0 () Int)
(declare-fun call33195formal@$ret@0 () Int)
(declare-fun call33202formal@$x@0 () T@opn)
(declare-fun call33202formal@$y@0 () T@opn)
(declare-fun %lbl%@142620 () Bool)
(declare-fun %lbl%@142625 () Bool)
(declare-fun %lbl%+33257 () Bool)
(declare-fun $Efl@9@@1 () Int)
(declare-fun ecx@3@@2 () Int)
(declare-fun edx@3@@2 () Int)
(declare-fun %lbl%+33256 () Bool)
(declare-fun call33147formal@$ptr@0 () Int)
(declare-fun %lbl%@142218 () Bool)
(declare-fun %lbl%@142248 () Bool)
(declare-fun call33154formal@$ptr@0 () Int)
(declare-fun %lbl%@142277 () Bool)
(declare-fun call33161formal@$x@0 () T@opn)
(declare-fun call33161formal@$y@0 () T@opn)
(declare-fun %lbl%@142325 () Bool)
(declare-fun %lbl%@142330 () Bool)
(declare-fun %lbl%+33245 () Bool)
(declare-fun $Efl@4 () Int)
(declare-fun edx@1@@2 () Int)
(declare-fun ecx@1@@5 () Int)
(declare-fun %lbl%+33244 () Bool)
(declare-fun call33128formal@$x@0 () T@opn)
(declare-fun call33128formal@$y@0 () T@opn)
(declare-fun %lbl%@142067 () Bool)
(declare-fun %lbl%@142072 () Bool)
(declare-fun %lbl%+33233 () Bool)
(declare-fun $Efl@1@@2 () Int)
(declare-fun %lbl%+33232 () Bool)
(declare-fun %lbl%@141653 () Bool)
(declare-fun %lbl%@141656 () Bool)
(declare-fun %lbl%@141856 () Bool)
(declare-fun call33104formal@$ret@0 () Int)
(declare-fun call33111formal@$x@0 () T@opn)
(declare-fun call33111formal@$y@0 () T@opn)
(declare-fun %lbl%@141933 () Bool)
(declare-fun %lbl%@141938 () Bool)
(declare-fun %lbl%+141127 () Bool)
(push 1)
(set-info :boogie-vc-id PciMemRead32)
(assert (not
(let ((anon9_Else_correct@@2 (=> (! (and %lbl%+33235 true) :lblpos +33235) true)))
(let ((anon10_Else_correct@@1 (=> (! (and %lbl%+33247 true) :lblpos +33247) true)))
(let ((anon11_Else_correct@@2 (=> (! (and %lbl%+33259 true) :lblpos +33259) true)))
(let ((anon12_Else_correct@@2 (=> (! (and %lbl%+33271 true) :lblpos +33271) true)))
(let ((__L56_correct (=> (! (and %lbl%+33274 true) :lblpos +33274) (=> (= call33220formal@$ptr@0 (+ call33154formal@$val@0 (* 1 edx@7))) (and
(! (or %lbl%@142739 $IoMmuEnabled@@0) :lblneg @142739)
(=> $IoMmuEnabled@@0 (and
(! (or %lbl%@142741 (= (select $PciConfigState@@0 $id@@0) 4)) :lblneg @142741)
(=> (= (select $PciConfigState@@0 $id@@0) 4) (and
(! (or %lbl%@142750 (and
(<= (PciMemAddr $id@@0) call33220formal@$ptr@0)
(<= (+ call33220formal@$ptr@0 4) (+ (PciMemAddr $id@@0) (PciMemSize $id@@0))))) :lblneg @142750)
(=> (and
(<= (PciMemAddr $id@@0) call33220formal@$ptr@0)
(<= (+ call33220formal@$ptr@0 4) (+ (PciMemAddr $id@@0) (PciMemSize $id@@0)))) (=> (PciMemLoaded $id@@0 call33220formal@$ptr@0 call33220formal@$val@0) (=> (and
(word call33220formal@$val@0)
(= call33223formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@142805 (= (ReturnToAddr (select $Mem@@3 esp)) call33223formal@$oldRA@0)) :lblneg @142805)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33223formal@$oldRA@0) (and
(! (or %lbl%@142816 (Aligned esp)) :lblneg @142816)
(=> (Aligned esp) (=> (and
(= esp@0@@16 (+ esp 4))
(Aligned esp@0@@16)) (and
(! (or %lbl%@142847 (= esp@0@@16 (+ esp 4))) :lblneg @142847)
(=> (= esp@0@@16 (+ esp 4)) (and
(! (or %lbl%@142855 (PciMemLoaded $id@@0 (+ (PciMemAddr $id@@0) $offset@@0) call33220formal@$val@0)) :lblneg @142855)
(=> (PciMemLoaded $id@@0 (+ (PciMemAddr $id@@0) $offset@@0) call33220formal@$val@0) true)))))))))))))))))))))
(let ((anon12_Then_correct@@2 (=> (! (and %lbl%+33269 true) :lblpos +33269) (=> (and
(Jbe $Efl@15)
(= edx@7 edx@5@@1)) __L56_correct))))
(let ((__L55_correct (=> (! (and %lbl%+33268 true) :lblpos +33268) (=> (= call33179formal@$ptr@0 (+ (+ call33141formal@$ret@0 (* 8 ecx@5@@1)) 4)) (and
(! (or %lbl%@142454 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @142454)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@142484 (pciAddr call33179formal@$ptr@0)) :lblneg @142484)
(=> (pciAddr call33179formal@$ptr@0) (=> (and
(= (select $Mem@@3 call33179formal@$ptr@0) (select $pciMem@@1 call33179formal@$ptr@0))
(= call33188formal@$ptr@0 (+ (+ call33141formal@$ret@0 (* 8 ecx@5@@1)) 4))) (and
(! (or %lbl%@142517 (PtrOk call33188formal@$ptr@0)) :lblneg @142517)
(=> (PtrOk call33188formal@$ptr@0) (=> (word call33188formal@$val@0) (=> (and
(= call33188formal@$val@0 (select $Mem@@3 call33188formal@$ptr@0))
(= call33191formal@$ret@0 edx@5@@1)) (=> (and
(word (+ call33191formal@$ret@0 4))
(= call33195formal@$ret@0 (+ call33191formal@$ret@0 4))
(= call33202formal@$x@0 (OpnReg call33195formal@$ret@0))
(= call33202formal@$y@0 (OpnReg call33188formal@$val@0))) (and
(! (or %lbl%@142620 (OpnOk $Mem@@3 call33202formal@$x@0)) :lblneg @142620)
(=> (OpnOk $Mem@@3 call33202formal@$x@0) (and
(! (or %lbl%@142625 (OpnOk $Mem@@3 call33202formal@$y@0)) :lblneg @142625)
(=> (OpnOk $Mem@@3 call33202formal@$y@0) (=> (FlagsCmp $Efl@15 (EvalOpn $Mem@@3 call33202formal@$x@0) (EvalOpn $Mem@@3 call33202formal@$y@0)) (and
anon12_Then_correct@@2
anon12_Else_correct@@2))))))))))))))))))))
(let ((anon11_Then_correct@@2 (=> (! (and %lbl%+33257 true) :lblpos +33257) (=> (Jne $Efl@9@@1) (=> (and
(= ecx@5@@1 ecx@3@@2)
(= edx@5@@1 edx@3@@2)) __L55_correct)))))
(let ((__L54_correct (=> (! (and %lbl%+33256 true) :lblpos +33256) (=> (and
(= call33141formal@$ret@0 PciLo@@0)
(= call33147formal@$ptr@0 (+ call33141formal@$ret@0 (* 8 ecx@3@@2)))) (and
(! (or %lbl%@142218 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @142218)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@142248 (pciAddr call33147formal@$ptr@0)) :lblneg @142248)
(=> (pciAddr call33147formal@$ptr@0) (=> (and
(= (select $Mem@@3 call33147formal@$ptr@0) (select $pciMem@@1 call33147formal@$ptr@0))
(= call33154formal@$ptr@0 (+ call33141formal@$ret@0 (* 8 ecx@3@@2)))) (and
(! (or %lbl%@142277 (PtrOk call33154formal@$ptr@0)) :lblneg @142277)
(=> (PtrOk call33154formal@$ptr@0) (=> (and
(word call33154formal@$val@0)
(= call33154formal@$val@0 (select $Mem@@3 call33154formal@$ptr@0))
(= call33161formal@$x@0 (OpnReg call33154formal@$val@0))
(= call33161formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@142325 (OpnOk $Mem@@3 call33161formal@$x@0)) :lblneg @142325)
(=> (OpnOk $Mem@@3 call33161formal@$x@0) (and
(! (or %lbl%@142330 (OpnOk $Mem@@3 call33161formal@$y@0)) :lblneg @142330)
(=> (OpnOk $Mem@@3 call33161formal@$y@0) (=> (FlagsCmp $Efl@9@@1 (EvalOpn $Mem@@3 call33161formal@$x@0) (EvalOpn $Mem@@3 call33161formal@$y@0)) (and
anon11_Then_correct@@2
anon11_Else_correct@@2))))))))))))))))))
(let ((anon10_Then_correct@@1 (=> (! (and %lbl%+33245 true) :lblpos +33245) (=> (Jb $Efl@4) (=> (and
(= edx@3@@2 edx@1@@2)
(= ecx@3@@2 ecx@1@@5)) __L54_correct)))))
(let ((__L53_correct (=> (! (and %lbl%+33244 true) :lblpos +33244) (=> (and
(= call33128formal@$x@0 (OpnReg ecx@1@@5))
(= call33128formal@$y@0 (OpnReg 65536))) (and
(! (or %lbl%@142067 (OpnOk $Mem@@3 call33128formal@$x@0)) :lblneg @142067)
(=> (OpnOk $Mem@@3 call33128formal@$x@0) (and
(! (or %lbl%@142072 (OpnOk $Mem@@3 call33128formal@$y@0)) :lblneg @142072)
(=> (OpnOk $Mem@@3 call33128formal@$y@0) (=> (FlagsCmp $Efl@4 (EvalOpn $Mem@@3 call33128formal@$x@0) (EvalOpn $Mem@@3 call33128formal@$y@0)) (and
anon10_Then_correct@@1
anon10_Else_correct@@1))))))))))
(let ((anon9_Then_correct@@2 (=> (! (and %lbl%+33233 true) :lblpos +33233) (=> (Jne $Efl@1@@2) (=> (and
(= edx@1@@2 edx)
(= ecx@1@@5 ecx)) __L53_correct)))))
(let ((anon0_correct@@28 (=> (! (and %lbl%+33232 true) :lblpos +33232) (and
(! (or %lbl%@141653 (isStack $S@@0)) :lblneg @141653)
(=> (isStack $S@@0) (and
(! (or %lbl%@141656 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @141656)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $S@@0 CurrentStack)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (=> (and
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(forall (($IoMmuEnabled@@4 Bool) ($PciConfigState@@4 (Array Int Int)) (DmaAddr@@4 Int) ($pciMem@@5 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@4 $PciConfigState@@4 DmaAddr@@4 $pciMem@@5) (_IoInv $IoMmuEnabled@@4 $PciConfigState@@4 DmaAddr@@4 $pciMem@@5))
 :qid |Commonib.268:17|
 :skolemid |225|
))) (and
(! (or %lbl%@141856 (and
(TV $id@@0)
(TV ?pciLo)
(TO (* 2 ecx))
(TO (+ (* 2 ecx) 1)))) :lblneg @141856)
(=> (and
(TV $id@@0)
(TV ?pciLo)
(TO (* 2 ecx))
(TO (+ (* 2 ecx) 1))) (=> (= call33104formal@$ret@0 DmaAddr@@0) (=> (and
(= call33111formal@$x@0 (OpnReg call33104formal@$ret@0))
(= call33111formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@141933 (OpnOk $Mem@@3 call33111formal@$x@0)) :lblneg @141933)
(=> (OpnOk $Mem@@3 call33111formal@$x@0) (and
(! (or %lbl%@141938 (OpnOk $Mem@@3 call33111formal@$y@0)) :lblneg @141938)
(=> (OpnOk $Mem@@3 call33111formal@$y@0) (=> (FlagsCmp $Efl@1@@2 (EvalOpn $Mem@@3 call33111formal@$x@0) (EvalOpn $Mem@@3 call33111formal@$y@0)) (and
anon9_Then_correct@@2
anon9_Else_correct@@2)))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@28 (=> (! (and %lbl%+141127 true) :lblpos +141127) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(= ecx $id@@0)
(= edx $offset@@0)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(isStack $S@@0)
(SpRequire $S@@0 esp 4)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@28))))
PreconditionGeneratedEntry_correct@@28))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33471 () Bool)
(declare-fun %lbl%+33483 () Bool)
(declare-fun %lbl%+33495 () Bool)
(declare-fun %lbl%+33507 () Bool)
(declare-fun %lbl%+33510 () Bool)
(declare-fun call33443formal@$ptr@0 () Int)
(declare-fun %lbl%@144707 () Bool)
(declare-fun %lbl%@144737 () Bool)
(declare-fun call33448formal@$ptr@0 () Int)
(declare-fun %lbl%@144771 () Bool)
(declare-fun call33448formal@$val@0 () Int)
(declare-fun call33456formal@$ptr@0 () Int)
(declare-fun call33380formal@$val@0 () Int)
(declare-fun edx@7@@0 () Int)
(declare-fun %lbl%@144821 () Bool)
(declare-fun %lbl%@144823 () Bool)
(declare-fun $id@@1 () Int)
(declare-fun %lbl%@144832 () Bool)
(declare-fun %lbl%@144855 () Bool)
(declare-fun PciMemStored (Int Int Int) Bool)
(declare-fun call33459formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@144880 () Bool)
(declare-fun %lbl%@144891 () Bool)
(declare-fun esp@0@@17 () Int)
(declare-fun %lbl%@144922 () Bool)
(declare-fun %lbl%@144930 () Bool)
(declare-fun $offset@@1 () Int)
(declare-fun $val () Int)
(declare-fun %lbl%+33505 () Bool)
(declare-fun $Efl@16@@0 () Int)
(declare-fun edx@5@@2 () Int)
(declare-fun %lbl%+33504 () Bool)
(declare-fun call33405formal@$ptr@0 () Int)
(declare-fun call33367formal@$ret@0 () Int)
(declare-fun ecx@5@@2 () Int)
(declare-fun %lbl%@144424 () Bool)
(declare-fun %lbl%@144454 () Bool)
(declare-fun call33414formal@$ptr@0 () Int)
(declare-fun %lbl%@144487 () Bool)
(declare-fun call33414formal@$val@0 () Int)
(declare-fun call33417formal@$ret@0 () Int)
(declare-fun call33421formal@$ret@0 () Int)
(declare-fun call33428formal@$x@0 () T@opn)
(declare-fun call33428formal@$y@0 () T@opn)
(declare-fun %lbl%@144590 () Bool)
(declare-fun %lbl%@144595 () Bool)
(declare-fun %lbl%+33493 () Bool)
(declare-fun $Efl@10@@1 () Int)
(declare-fun ecx@3@@3 () Int)
(declare-fun edx@3@@3 () Int)
(declare-fun %lbl%+33492 () Bool)
(declare-fun call33373formal@$ptr@0 () Int)
(declare-fun %lbl%@144188 () Bool)
(declare-fun %lbl%@144218 () Bool)
(declare-fun call33380formal@$ptr@0 () Int)
(declare-fun %lbl%@144247 () Bool)
(declare-fun call33387formal@$x@0 () T@opn)
(declare-fun call33387formal@$y@0 () T@opn)
(declare-fun %lbl%@144295 () Bool)
(declare-fun %lbl%@144300 () Bool)
(declare-fun %lbl%+33481 () Bool)
(declare-fun $Efl@5@@0 () Int)
(declare-fun edx@1@@3 () Int)
(declare-fun ecx@1@@6 () Int)
(declare-fun %lbl%+33480 () Bool)
(declare-fun call33354formal@$x@0 () T@opn)
(declare-fun call33354formal@$y@0 () T@opn)
(declare-fun %lbl%@144037 () Bool)
(declare-fun %lbl%@144042 () Bool)
(declare-fun %lbl%+33469 () Bool)
(declare-fun $Efl@2@@0 () Int)
(declare-fun %lbl%+33468 () Bool)
(declare-fun %lbl%@143505 () Bool)
(declare-fun %lbl%@143508 () Bool)
(declare-fun %lbl%@143708 () Bool)
(declare-fun %lbl%@143742 () Bool)
(declare-fun call33322formal@$ptr@0 () Int)
(declare-fun %lbl%@143767 () Bool)
(declare-fun %lbl%@143797 () Bool)
(declare-fun call33327formal@$ptr@0 () Int)
(declare-fun %lbl%@143831 () Bool)
(declare-fun call33327formal@$val@0 () Int)
(declare-fun call33330formal@$ret@0 () Int)
(declare-fun call33337formal@$x@0 () T@opn)
(declare-fun call33337formal@$y@0 () T@opn)
(declare-fun %lbl%@143903 () Bool)
(declare-fun %lbl%@143908 () Bool)
(declare-fun %lbl%+142873 () Bool)
(push 1)
(set-info :boogie-vc-id PciMemWrite32)
(assert (not
(let ((anon9_Else_correct@@3 (=> (! (and %lbl%+33471 true) :lblpos +33471) true)))
(let ((anon10_Else_correct@@2 (=> (! (and %lbl%+33483 true) :lblpos +33483) true)))
(let ((anon11_Else_correct@@3 (=> (! (and %lbl%+33495 true) :lblpos +33495) true)))
(let ((anon12_Else_correct@@3 (=> (! (and %lbl%+33507 true) :lblpos +33507) true)))
(let ((__L60_correct (=> (! (and %lbl%+33510 true) :lblpos +33510) (=> (= call33443formal@$ptr@0 (+ esp 4)) (and
(! (or %lbl%@144707 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @144707)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@144737 (fAddr $S@@0 call33443formal@$ptr@0)) :lblneg @144737)
(=> (fAddr $S@@0 call33443formal@$ptr@0) (=> (= (select $Mem@@3 call33443formal@$ptr@0) (select (select $fMems@@4 $S@@0) call33443formal@$ptr@0)) (=> (and
(memAddr call33443formal@$ptr@0)
(= call33448formal@$ptr@0 (+ esp 4))) (and
(! (or %lbl%@144771 (PtrOk call33448formal@$ptr@0)) :lblneg @144771)
(=> (PtrOk call33448formal@$ptr@0) (=> (word call33448formal@$val@0) (=> (and
(= call33448formal@$val@0 (select $Mem@@3 call33448formal@$ptr@0))
(= call33456formal@$ptr@0 (+ call33380formal@$val@0 (* 1 edx@7@@0)))) (and
(! (or %lbl%@144821 $IoMmuEnabled@@0) :lblneg @144821)
(=> $IoMmuEnabled@@0 (and
(! (or %lbl%@144823 (= (select $PciConfigState@@0 $id@@1) 4)) :lblneg @144823)
(=> (= (select $PciConfigState@@0 $id@@1) 4) (and
(! (or %lbl%@144832 (and
(<= (PciMemAddr $id@@1) call33456formal@$ptr@0)
(<= (+ call33456formal@$ptr@0 4) (+ (PciMemAddr $id@@1) (PciMemSize $id@@1))))) :lblneg @144832)
(=> (and
(<= (PciMemAddr $id@@1) call33456formal@$ptr@0)
(<= (+ call33456formal@$ptr@0 4) (+ (PciMemAddr $id@@1) (PciMemSize $id@@1)))) (and
(! (or %lbl%@144855 (word call33448formal@$val@0)) :lblneg @144855)
(=> (word call33448formal@$val@0) (=> (and
(PciMemStored $id@@1 call33456formal@$ptr@0 call33448formal@$val@0)
(= call33459formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@144880 (= (ReturnToAddr (select $Mem@@3 esp)) call33459formal@$oldRA@0)) :lblneg @144880)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33459formal@$oldRA@0) (and
(! (or %lbl%@144891 (Aligned esp)) :lblneg @144891)
(=> (Aligned esp) (=> (and
(= esp@0@@17 (+ esp 4))
(Aligned esp@0@@17)) (and
(! (or %lbl%@144922 (= esp@0@@17 (+ esp 4))) :lblneg @144922)
(=> (= esp@0@@17 (+ esp 4)) (and
(! (or %lbl%@144930 (PciMemStored $id@@1 (+ (PciMemAddr $id@@1) $offset@@1) $val)) :lblneg @144930)
(=> (PciMemStored $id@@1 (+ (PciMemAddr $id@@1) $offset@@1) $val) true))))))))))))))))))))))))))))))))
(let ((anon12_Then_correct@@3 (=> (! (and %lbl%+33505 true) :lblpos +33505) (=> (and
(Jbe $Efl@16@@0)
(= edx@7@@0 edx@5@@2)) __L60_correct))))
(let ((__L59_correct (=> (! (and %lbl%+33504 true) :lblpos +33504) (=> (= call33405formal@$ptr@0 (+ (+ call33367formal@$ret@0 (* 8 ecx@5@@2)) 4)) (and
(! (or %lbl%@144424 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @144424)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@144454 (pciAddr call33405formal@$ptr@0)) :lblneg @144454)
(=> (pciAddr call33405formal@$ptr@0) (=> (and
(= (select $Mem@@3 call33405formal@$ptr@0) (select $pciMem@@1 call33405formal@$ptr@0))
(= call33414formal@$ptr@0 (+ (+ call33367formal@$ret@0 (* 8 ecx@5@@2)) 4))) (and
(! (or %lbl%@144487 (PtrOk call33414formal@$ptr@0)) :lblneg @144487)
(=> (PtrOk call33414formal@$ptr@0) (=> (word call33414formal@$val@0) (=> (and
(= call33414formal@$val@0 (select $Mem@@3 call33414formal@$ptr@0))
(= call33417formal@$ret@0 edx@5@@2)) (=> (and
(word (+ call33417formal@$ret@0 4))
(= call33421formal@$ret@0 (+ call33417formal@$ret@0 4))
(= call33428formal@$x@0 (OpnReg call33421formal@$ret@0))
(= call33428formal@$y@0 (OpnReg call33414formal@$val@0))) (and
(! (or %lbl%@144590 (OpnOk $Mem@@3 call33428formal@$x@0)) :lblneg @144590)
(=> (OpnOk $Mem@@3 call33428formal@$x@0) (and
(! (or %lbl%@144595 (OpnOk $Mem@@3 call33428formal@$y@0)) :lblneg @144595)
(=> (OpnOk $Mem@@3 call33428formal@$y@0) (=> (FlagsCmp $Efl@16@@0 (EvalOpn $Mem@@3 call33428formal@$x@0) (EvalOpn $Mem@@3 call33428formal@$y@0)) (and
anon12_Then_correct@@3
anon12_Else_correct@@3))))))))))))))))))))
(let ((anon11_Then_correct@@3 (=> (! (and %lbl%+33493 true) :lblpos +33493) (=> (Jne $Efl@10@@1) (=> (and
(= ecx@5@@2 ecx@3@@3)
(= edx@5@@2 edx@3@@3)) __L59_correct)))))
(let ((__L58_correct (=> (! (and %lbl%+33492 true) :lblpos +33492) (=> (and
(= call33367formal@$ret@0 PciLo@@0)
(= call33373formal@$ptr@0 (+ call33367formal@$ret@0 (* 8 ecx@3@@3)))) (and
(! (or %lbl%@144188 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @144188)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@144218 (pciAddr call33373formal@$ptr@0)) :lblneg @144218)
(=> (pciAddr call33373formal@$ptr@0) (=> (and
(= (select $Mem@@3 call33373formal@$ptr@0) (select $pciMem@@1 call33373formal@$ptr@0))
(= call33380formal@$ptr@0 (+ call33367formal@$ret@0 (* 8 ecx@3@@3)))) (and
(! (or %lbl%@144247 (PtrOk call33380formal@$ptr@0)) :lblneg @144247)
(=> (PtrOk call33380formal@$ptr@0) (=> (and
(word call33380formal@$val@0)
(= call33380formal@$val@0 (select $Mem@@3 call33380formal@$ptr@0))
(= call33387formal@$x@0 (OpnReg call33380formal@$val@0))
(= call33387formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@144295 (OpnOk $Mem@@3 call33387formal@$x@0)) :lblneg @144295)
(=> (OpnOk $Mem@@3 call33387formal@$x@0) (and
(! (or %lbl%@144300 (OpnOk $Mem@@3 call33387formal@$y@0)) :lblneg @144300)
(=> (OpnOk $Mem@@3 call33387formal@$y@0) (=> (FlagsCmp $Efl@10@@1 (EvalOpn $Mem@@3 call33387formal@$x@0) (EvalOpn $Mem@@3 call33387formal@$y@0)) (and
anon11_Then_correct@@3
anon11_Else_correct@@3))))))))))))))))))
(let ((anon10_Then_correct@@2 (=> (! (and %lbl%+33481 true) :lblpos +33481) (=> (Jb $Efl@5@@0) (=> (and
(= edx@3@@3 edx@1@@3)
(= ecx@3@@3 ecx@1@@6)) __L58_correct)))))
(let ((__L57_correct (=> (! (and %lbl%+33480 true) :lblpos +33480) (=> (and
(= call33354formal@$x@0 (OpnReg ecx@1@@6))
(= call33354formal@$y@0 (OpnReg 65536))) (and
(! (or %lbl%@144037 (OpnOk $Mem@@3 call33354formal@$x@0)) :lblneg @144037)
(=> (OpnOk $Mem@@3 call33354formal@$x@0) (and
(! (or %lbl%@144042 (OpnOk $Mem@@3 call33354formal@$y@0)) :lblneg @144042)
(=> (OpnOk $Mem@@3 call33354formal@$y@0) (=> (FlagsCmp $Efl@5@@0 (EvalOpn $Mem@@3 call33354formal@$x@0) (EvalOpn $Mem@@3 call33354formal@$y@0)) (and
anon10_Then_correct@@2
anon10_Else_correct@@2))))))))))
(let ((anon9_Then_correct@@3 (=> (! (and %lbl%+33469 true) :lblpos +33469) (=> (Jne $Efl@2@@0) (=> (and
(= edx@1@@3 edx)
(= ecx@1@@6 ecx)) __L57_correct)))))
(let ((anon0_correct@@29 (=> (! (and %lbl%+33468 true) :lblpos +33468) (and
(! (or %lbl%@143505 (isStack $S@@0)) :lblneg @143505)
(=> (isStack $S@@0) (and
(! (or %lbl%@143508 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @143508)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $S@@0 CurrentStack)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (=> (and
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(forall (($IoMmuEnabled@@5 Bool) ($PciConfigState@@5 (Array Int Int)) (DmaAddr@@5 Int) ($pciMem@@6 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@5 $PciConfigState@@5 DmaAddr@@5 $pciMem@@6) (_IoInv $IoMmuEnabled@@5 $PciConfigState@@5 DmaAddr@@5 $pciMem@@6))
 :qid |Commonib.268:17|
 :skolemid |225|
))) (and
(! (or %lbl%@143708 (and
(TV $id@@1)
(TV ?pciLo)
(TO (* 2 ecx))
(TO (+ (* 2 ecx) 1)))) :lblneg @143708)
(=> (and
(TV $id@@1)
(TV ?pciLo)
(TO (* 2 ecx))
(TO (+ (* 2 ecx) 1))) (and
(! (or %lbl%@143742 (and
(TO 1)
(TV esp))) :lblneg @143742)
(=> (and
(TO 1)
(TV esp)) (=> (= call33322formal@$ptr@0 (+ esp 4)) (and
(! (or %lbl%@143767 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @143767)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@143797 (fAddr $S@@0 call33322formal@$ptr@0)) :lblneg @143797)
(=> (fAddr $S@@0 call33322formal@$ptr@0) (=> (= (select $Mem@@3 call33322formal@$ptr@0) (select (select $fMems@@4 $S@@0) call33322formal@$ptr@0)) (=> (and
(memAddr call33322formal@$ptr@0)
(= call33327formal@$ptr@0 (+ esp 4))) (and
(! (or %lbl%@143831 (PtrOk call33327formal@$ptr@0)) :lblneg @143831)
(=> (PtrOk call33327formal@$ptr@0) (=> (word call33327formal@$val@0) (=> (and
(= call33327formal@$val@0 (select $Mem@@3 call33327formal@$ptr@0))
(= call33330formal@$ret@0 DmaAddr@@0)
(= call33337formal@$x@0 (OpnReg call33330formal@$ret@0))
(= call33337formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@143903 (OpnOk $Mem@@3 call33337formal@$x@0)) :lblneg @143903)
(=> (OpnOk $Mem@@3 call33337formal@$x@0) (and
(! (or %lbl%@143908 (OpnOk $Mem@@3 call33337formal@$y@0)) :lblneg @143908)
(=> (OpnOk $Mem@@3 call33337formal@$y@0) (=> (FlagsCmp $Efl@2@@0 (EvalOpn $Mem@@3 call33337formal@$x@0) (EvalOpn $Mem@@3 call33337formal@$y@0)) (and
anon9_Then_correct@@3
anon9_Else_correct@@3))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@29 (=> (! (and %lbl%+142873 true) :lblpos +142873) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(= ecx $id@@1)
(= edx $offset@@1)
(= (select (select $FrameSlices@@2 $S@@0) (+ esp 4)) (select $FrameCounts@@2 $S@@0))
(= (select (select $fMems@@4 $S@@0) (+ esp 4)) $val)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(isStack $S@@0)
(SpRequire $S@@0 esp 8)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 $color StackTop $fs $fn CachePtr CacheSize ColorBase HeapLo HeapHi ReserveMin $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@29))))
PreconditionGeneratedEntry_correct@@29))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33517 () Bool)
(declare-fun call33514formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@145051 () Bool)
(declare-fun %lbl%@145062 () Bool)
(declare-fun esp@0@@18 () Int)
(declare-fun %lbl%@145093 () Bool)
(declare-fun %lbl%+144949 () Bool)
(push 1)
(set-info :boogie-vc-id CycleCounter)
(assert (not
(let ((anon0_correct@@30 (=> (! (and %lbl%+33517 true) :lblpos +33517) (=> (= call33514formal@$oldRA@0 $RET@@0) (and
(! (or %lbl%@145051 (= (ReturnToAddr (select $Mem@@3 esp)) call33514formal@$oldRA@0)) :lblneg @145051)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33514formal@$oldRA@0) (and
(! (or %lbl%@145062 (Aligned esp)) :lblneg @145062)
(=> (Aligned esp) (=> (and
(= esp@0@@18 (+ esp 4))
(Aligned esp@0@@18)) (and
(! (or %lbl%@145093 (= esp@0@@18 (+ esp 4))) :lblneg @145093)
(=> (= esp@0@@18 (+ esp 4)) true)))))))))))
(let ((PreconditionGeneratedEntry_correct@@30 (=> (! (and %lbl%+144949 true) :lblpos +144949) (=> (and
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(SpRequire $S@@0 esp 4)) anon0_correct@@30))))
PreconditionGeneratedEntry_correct@@30))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33558 () Bool)
(declare-fun %lbl%+33561 () Bool)
(declare-fun call33537formal@$ret@0 () Int)
(declare-fun edx@1@@4 () Int)
(declare-fun call33542formal@$addr@0 () Int)
(declare-fun ecx@1@@7 () Int)
(declare-fun %lbl%@145466 () Bool)
(declare-fun call33542formal@$ret@0 () Int)
(declare-fun %lbl%@145488 () Bool)
(declare-fun call33546formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@145536 () Bool)
(declare-fun %lbl%@145547 () Bool)
(declare-fun esp@0@@19 () Int)
(declare-fun %lbl%@145578 () Bool)
(declare-fun %lbl%+33556 () Bool)
(declare-fun $Efl@0@@2 () Int)
(declare-fun %lbl%+33555 () Bool)
(declare-fun call33524formal@$x@0 () T@opn)
(declare-fun call33524formal@$y@0 () T@opn)
(declare-fun %lbl%@145316 () Bool)
(declare-fun %lbl%@145321 () Bool)
(declare-fun %lbl%+145102 () Bool)
(push 1)
(set-info :boogie-vc-id DebugPrintHex)
(assert (not
(let ((anon3_Else_correct@@5 (=> (! (and %lbl%+33558 true) :lblpos +33558) true)))
(let ((__L61_correct (=> (! (and %lbl%+33561 true) :lblpos +33561) (=> (and
(= call33537formal@$ret@0 edx@1@@4)
(= call33542formal@$addr@0 (+ ecx@1@@7 ecx@1@@7))) (and
(! (or %lbl%@145466 (word call33542formal@$addr@0)) :lblneg @145466)
(=> (word call33542formal@$addr@0) (=> (= call33542formal@$ret@0 call33542formal@$addr@0) (and
(! (or %lbl%@145488 (and
(<= 0 call33542formal@$ret@0)
(<= call33542formal@$ret@0 (- 160 16)))) :lblneg @145488)
(=> (and
(<= 0 call33542formal@$ret@0)
(<= call33542formal@$ret@0 (- 160 16))) (=> (= call33546formal@$oldRA@0 $RET@@0) (and
(! (or %lbl%@145536 (= (ReturnToAddr (select $Mem@@3 esp)) call33546formal@$oldRA@0)) :lblneg @145536)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33546formal@$oldRA@0) (and
(! (or %lbl%@145547 (Aligned esp)) :lblneg @145547)
(=> (Aligned esp) (=> (and
(= esp@0@@19 (+ esp 4))
(Aligned esp@0@@19)) (and
(! (or %lbl%@145578 (= esp@0@@19 (+ esp 4))) :lblneg @145578)
(=> (= esp@0@@19 (+ esp 4)) true)))))))))))))))))
(let ((anon3_Then_correct@@5 (=> (! (and %lbl%+33556 true) :lblpos +33556) (=> (Jb $Efl@0@@2) (=> (and
(= edx@1@@4 edx)
(= ecx@1@@7 ecx)) __L61_correct)))))
(let ((anon0_correct@@31 (=> (! (and %lbl%+33555 true) :lblpos +33555) (=> (and
(= call33524formal@$x@0 (OpnReg ecx))
(= call33524formal@$y@0 (OpnReg 72))) (and
(! (or %lbl%@145316 (OpnOk $Mem@@3 call33524formal@$x@0)) :lblneg @145316)
(=> (OpnOk $Mem@@3 call33524formal@$x@0) (and
(! (or %lbl%@145321 (OpnOk $Mem@@3 call33524formal@$y@0)) :lblneg @145321)
(=> (OpnOk $Mem@@3 call33524formal@$y@0) (=> (FlagsCmp $Efl@0@@2 (EvalOpn $Mem@@3 call33524formal@$x@0) (EvalOpn $Mem@@3 call33524formal@$y@0)) (and
anon3_Then_correct@@5
anon3_Else_correct@@5))))))))))
(let ((PreconditionGeneratedEntry_correct@@31 (=> (! (and %lbl%+145102 true) :lblpos +145102) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(SpRequire $S@@0 esp 4)) anon0_correct@@31))))
PreconditionGeneratedEntry_correct@@31)))))
))
(check-sat)
(pop 1)
