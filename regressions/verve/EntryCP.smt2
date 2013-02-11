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
(declare-fun %lbl%+85142 () Bool)
(declare-fun %lbl%@86718 () Bool)
(declare-fun esp@1 () Int)
(declare-fun esp () Int)
(declare-fun %lbl%@86726 () Bool)
(declare-fun %lbl%@86734 () Bool)
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
(declare-fun %lbl%@86764 () Bool)
(declare-fun %lbl%@86771 () Bool)
(declare-fun eax@1 () Int)
(declare-fun ecx () Int)
(declare-fun edx@1 () Int)
(declare-fun ebx@1 () Int)
(declare-fun esi@1 () Int)
(declare-fun edi () Int)
(declare-fun ebp () Int)
(declare-fun %lbl%@86807 () Bool)
(declare-fun $ghost_c@1 () Int)
(declare-fun $ghost_N () Int)
(declare-fun %lbl%@86820 () Bool)
(declare-fun %lbl%+25396 () Bool)
(declare-fun $Efl@6 () Int)
(declare-fun %lbl%@86543 () Bool)
(declare-fun call25171formal@$ret@0 () Int)
(declare-fun call25372formal@$ret@0 () Int)
(declare-fun %lbl%@86573 () Bool)
(declare-fun %lbl%@86603 () Bool)
(declare-fun call25377formal@$oldRA@0 () T@ReturnTo)
(declare-fun $RET@@0 () T@ReturnTo)
(declare-fun %lbl%@86625 () Bool)
(declare-fun %lbl%@86635 () Bool)
(declare-fun esp@0 () Int)
(declare-fun $ghost_c@0 () Int)
(declare-fun esi@0 () Int)
(declare-fun ebx@0 () Int)
(declare-fun edx@0 () Int)
(declare-fun eax@0 () Int)
(declare-fun %lbl%+25394 () Bool)
(declare-fun call25206formal@$ret@0 () Int)
(declare-fun call25214formal@$ret@0 () Int)
(declare-fun call25222formal@$ret@0 () Int)
(declare-fun call25230formal@$ret@0 () Int)
(declare-fun %lbl%@86369 () Bool)
(declare-fun %lbl%@86399 () Bool)
(declare-fun %lbl%@86410 () Bool)
(declare-fun %lbl%@86424 () Bool)
(declare-fun %lbl%@86460 () Bool)
(declare-fun %lbl%@86464 () Bool)
(declare-fun %lbl%@86470 () Bool)
(declare-fun %lbl%@86474 () Bool)
(declare-fun %lbl%@86478 () Bool)
(declare-fun %lbl%@86482 () Bool)
(declare-fun %lbl%@86487 () Bool)
(declare-fun %lbl%@86497 () Bool)
(declare-fun %lbl%@86519 () Bool)
(declare-fun %lbl%+25393 () Bool)
(declare-fun $ghost_n@0 () Int)
(declare-fun $ghost_k@0 () Int)
(declare-fun $ghost_m@0 () Int)
(declare-fun call25362formal@$x@0 () T@opn)
(declare-fun call25362formal@$y@0 () T@opn)
(declare-fun %lbl%@86192 () Bool)
(declare-fun %lbl%@86197 () Bool)
(declare-fun %lbl%+25384 () Bool)
(declare-fun %lbl%@85626 () Bool)
(declare-fun %lbl%@85636 () Bool)
(declare-fun call25174formal@$ret@0 () Int)
(declare-fun call25181formal@$ret@0 () Int)
(declare-fun call25188formal@$ret@0 () Int)
(declare-fun call25195formal@$ret@0 () Int)
(declare-fun %lbl%@85765 () Bool)
(declare-fun %lbl%@85795 () Bool)
(declare-fun %lbl%@85806 () Bool)
(declare-fun %lbl%@85820 () Bool)
(declare-fun %lbl%@85856 () Bool)
(declare-fun %lbl%@85860 () Bool)
(declare-fun %lbl%@85866 () Bool)
(declare-fun %lbl%@85870 () Bool)
(declare-fun %lbl%@85874 () Bool)
(declare-fun %lbl%@85878 () Bool)
(declare-fun %lbl%@85883 () Bool)
(declare-fun %lbl%@85893 () Bool)
(declare-fun %lbl%@85915 () Bool)
(declare-fun %lbl%+85146 () Bool)
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
 :qid |CopyingC.37:15|
 :skolemid |226|
)))
(assert (forall (($s@@22 Int) ) (! (= (StackLo $s@@22) (+ ?fLo (* $s@@22 ?FSize)))
 :qid |CopyingC.38:15|
 :skolemid |227|
)))
(assert (forall (($s@@23 Int) (sp Int) (n@@2 Int) ) (! (= (SpRequire $s@@23 sp n@@2) (and
(<= (StackLo $s@@23) sp)
(<= (+ sp n@@2) (StackHi $s@@23))
(Aligned sp)))
 :qid |CopyingC.190:21|
 :skolemid |231|
 :pattern ( (SpRequire $s@@23 sp n@@2))
)))
(assert (forall (($s@@24 Int) (StackCheck Int) ) (! (= (StackCheckInv $s@@24 StackCheck) (and
(<= (+ (+ (StackLo $s@@24) ?StackReserve) ?InterruptReserve) StackCheck)
(<= StackCheck (StackHi $s@@24))))
 :qid |CopyingC.195:25|
 :skolemid |232|
 :pattern ( (StackCheckInv $s@@24 StackCheck))
)))
(assert (forall (($S Int) ($Mem@@2 (Array Int Int)) ($FrameCounts@@1 (Array Int Int)) ($FrameAddrs@@1 (Array Int (Array Int Int))) ($FrameLayouts@@1 (Array Int (Array Int T@$FrameLayout))) ($FrameSlices@@1 (Array Int (Array Int Int))) ($FrameAbss@@1 (Array Int (Array Int (Array Int Int)))) ($FrameOffsets@@1 (Array Int (Array Int Int))) ($ra Int) ($esp@@4 Int) ($ebp Int) ) (! (= (ScanStackInv $S $Mem@@2 $FrameCounts@@1 $FrameAddrs@@1 $FrameLayouts@@1 $FrameSlices@@1 $FrameAbss@@1 $FrameOffsets@@1 $ra $esp@@4 $ebp) (and
(<= 0 (select $FrameCounts@@1 $S))
(= (select (select $FrameSlices@@1 $S) $esp@@4) (select $FrameCounts@@1 $S))
(= (select $Mem@@2 $esp@@4) $ra)
(FrameNextInv (select $FrameCounts@@1 $S) $ra $ebp (select $FrameAddrs@@1 $S) (select $FrameLayouts@@1 $S))
(StackInvS $S $FrameCounts@@1 $FrameAddrs@@1 $FrameLayouts@@1 $FrameSlices@@1 $FrameAbss@@1 $FrameOffsets@@1)))
 :qid |CopyingC.201:24|
 :skolemid |233|
 :pattern ( (ScanStackInv $S $Mem@@2 $FrameCounts@@1 $FrameAddrs@@1 $FrameLayouts@@1 $FrameSlices@@1 $FrameAbss@@1 $FrameOffsets@@1 $ra $esp@@4 $ebp))
)))
(assert (= WORD_HI (+ (+ 2147483647 2147483647) 2)))
(push 1)
(set-info :boogie-vc-id Proc_Cube)
(assert (not
(let ((GeneratedUnifiedExit_correct (=> (! (and %lbl%+85142 true) :lblpos +85142) (and
(! (or %lbl%@86718 (= esp@1 (+ esp 4))) :lblneg @86718)
(=> (= esp@1 (+ esp 4)) (and
(! (or %lbl%@86726 (= esp@1 (+ esp 4))) :lblneg @86726)
(=> (= esp@1 (+ esp 4)) (and
(! (or %lbl%@86734 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @86734)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@86764 (SMemEnsure $sMem@@5 $sMem@@5 esp@1 esp)) :lblneg @86764)
(=> (SMemEnsure $sMem@@5 $sMem@@5 esp@1 esp) (and
(! (or %lbl%@86771 (and
(word eax@1)
(word ecx)
(word edx@1)
(word ebx@1)
(word esi@1)
(word edi)
(word ebp))) :lblneg @86771)
(=> (and
(word eax@1)
(word ecx)
(word edx@1)
(word ebx@1)
(word esi@1)
(word edi)
(word ebp)) (and
(! (or %lbl%@86807 (= $ghost_c@1 (* (* $ghost_N $ghost_N) $ghost_N))) :lblneg @86807)
(=> (= $ghost_c@1 (* (* $ghost_N $ghost_N) $ghost_N)) (and
(! (or %lbl%@86820 (= eax@1 $ghost_c@1)) :lblneg @86820)
(=> (= eax@1 $ghost_c@1) true)))))))))))))))))
(let ((anon2_Else_correct (=> (! (and %lbl%+25396 true) :lblpos +25396) (=> (not (Jb $Efl@6)) (and
(! (or %lbl%@86543 (word (+ call25171formal@$ret@0 0))) :lblneg @86543)
(=> (word (+ call25171formal@$ret@0 0)) (=> (= call25372formal@$ret@0 (+ call25171formal@$ret@0 0)) (and
(! (or %lbl%@86573 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @86573)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@86603 (sAddr call25372formal@$ret@0)) :lblneg @86603)
(=> (sAddr call25372formal@$ret@0) (=> (and
(= (select $Mem@@3 call25372formal@$ret@0) (select $sMem@@5 call25372formal@$ret@0))
(= call25377formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@86625 (= (ReturnToAddr (select $Mem@@3 call25372formal@$ret@0)) call25377formal@$oldRA@0)) :lblneg @86625)
(=> (= (ReturnToAddr (select $Mem@@3 call25372formal@$ret@0)) call25377formal@$oldRA@0) (and
(! (or %lbl%@86635 (Aligned call25372formal@$ret@0)) :lblneg @86635)
(=> (Aligned call25372formal@$ret@0) (=> (and
(= esp@0 (+ call25372formal@$ret@0 4))
(Aligned esp@0)
(= $ghost_c@1 $ghost_c@0)
(= esp@1 esp@0)
(= esi@1 esi@0)
(= ebx@1 ebx@0)
(= edx@1 edx@0)
(= eax@1 eax@0)) GeneratedUnifiedExit_correct)))))))))))))))))
(let ((anon2_Then_correct (=> (! (and %lbl%+25394 true) :lblpos +25394) (=> (Jb $Efl@6) (=> (and
(word (+ eax@0 ebx@0))
(= call25206formal@$ret@0 (+ eax@0 ebx@0))
(word (+ ebx@0 esi@0))
(= call25214formal@$ret@0 (+ ebx@0 esi@0))
(word (+ esi@0 6))
(= call25222formal@$ret@0 (+ esi@0 6))
(word (+ edx@0 1))
(= call25230formal@$ret@0 (+ edx@0 1))) (and
(! (or %lbl%@86369 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @86369)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@86399 (SMemInv $sMem@@5 $sMem@@5 (+ call25171formal@$ret@0 0) esp)) :lblneg @86399)
(=> (SMemInv $sMem@@5 $sMem@@5 (+ call25171formal@$ret@0 0) esp) (and
(! (or %lbl%@86410 (= (ReturnToAddr (select $sMem@@5 (+ call25171formal@$ret@0 0))) $RET@@0)) :lblneg @86410)
(=> (= (ReturnToAddr (select $sMem@@5 (+ call25171formal@$ret@0 0))) $RET@@0) (and
(! (or %lbl%@86424 (and
(word call25206formal@$ret@0)
(word ecx)
(word call25230formal@$ret@0)
(word call25214formal@$ret@0)
(word call25222formal@$ret@0)
(word edi)
(word ebp))) :lblneg @86424)
(=> (and
(word call25206formal@$ret@0)
(word ecx)
(word call25230formal@$ret@0)
(word call25214formal@$ret@0)
(word call25222formal@$ret@0)
(word edi)
(word ebp)) (and
(! (or %lbl%@86460 (= call25230formal@$ret@0 call25230formal@$ret@0)) :lblneg @86460)
(=> (= call25230formal@$ret@0 call25230formal@$ret@0) (and
(! (or %lbl%@86464 (= $ghost_N ecx)) :lblneg @86464)
(=> (= $ghost_N ecx) (and
(! (or %lbl%@86470 (= call25206formal@$ret@0 call25206formal@$ret@0)) :lblneg @86470)
(=> (= call25206formal@$ret@0 call25206formal@$ret@0) (and
(! (or %lbl%@86474 (= call25214formal@$ret@0 call25214formal@$ret@0)) :lblneg @86474)
(=> (= call25214formal@$ret@0 call25214formal@$ret@0) (and
(! (or %lbl%@86478 (= call25222formal@$ret@0 call25222formal@$ret@0)) :lblneg @86478)
(=> (= call25222formal@$ret@0 call25222formal@$ret@0) (and
(! (or %lbl%@86482 (<= call25230formal@$ret@0 $ghost_N)) :lblneg @86482)
(=> (<= call25230formal@$ret@0 $ghost_N) (and
(! (or %lbl%@86487 (= call25206formal@$ret@0 (* (* call25230formal@$ret@0 call25230formal@$ret@0) call25230formal@$ret@0))) :lblneg @86487)
(=> (= call25206formal@$ret@0 (* (* call25230formal@$ret@0 call25230formal@$ret@0) call25230formal@$ret@0)) (and
(! (or %lbl%@86497 (= call25214formal@$ret@0 (+ (+ (* (* 3 call25230formal@$ret@0) call25230formal@$ret@0) (* 3 call25230formal@$ret@0)) 1))) :lblneg @86497)
(=> (= call25214formal@$ret@0 (+ (+ (* (* 3 call25230formal@$ret@0) call25230formal@$ret@0) (* 3 call25230formal@$ret@0)) 1)) (and
(! (or %lbl%@86519 (= call25222formal@$ret@0 (+ (* 6 call25230formal@$ret@0) 6))) :lblneg @86519)
(=> (= call25222formal@$ret@0 (+ (* 6 call25230formal@$ret@0) 6)) true)))))))))))))))))))))))))))))))
(let ((L1_correct (=> (! (and %lbl%+25393 true) :lblpos +25393) (=> (and
(<= 0 eax@0)
(<= 1 ebx@0)
(<= 0 edx@0)
(<= 6 esi@0)
(<= 0 $ghost_n@0)
(<= 1 $ghost_k@0)
(<= 6 $ghost_m@0)
(<= 0 $ghost_c@0)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemInv $sMem@@5 $sMem@@5 (+ call25171formal@$ret@0 0) esp)
(= (ReturnToAddr (select $sMem@@5 (+ call25171formal@$ret@0 0))) $RET@@0)
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
(= call25362formal@$x@0 (OpnReg edx@0))
(= call25362formal@$y@0 (OpnReg ecx))) (and
(! (or %lbl%@86192 (OpnOk $Mem@@3 call25362formal@$x@0)) :lblneg @86192)
(=> (OpnOk $Mem@@3 call25362formal@$x@0) (and
(! (or %lbl%@86197 (OpnOk $Mem@@3 call25362formal@$y@0)) :lblneg @86197)
(=> (OpnOk $Mem@@3 call25362formal@$y@0) (=> (FlagsCmp $Efl@6 (EvalOpn $Mem@@3 call25362formal@$x@0) (EvalOpn $Mem@@3 call25362formal@$y@0)) (and
anon2_Then_correct
anon2_Else_correct))))))))))
(let ((anon0_correct (=> (! (and %lbl%+25384 true) :lblpos +25384) (and
(! (or %lbl%@85626 (TV esp)) :lblneg @85626)
(=> (TV esp) (and
(! (or %lbl%@85636 (word (- esp 0))) :lblneg @85636)
(=> (word (- esp 0)) (=> (= call25171formal@$ret@0 (- esp 0)) (=> (and
(= call25174formal@$ret@0 0)
(= call25181formal@$ret@0 0)
(= call25188formal@$ret@0 1)
(= call25195formal@$ret@0 6)) (and
(! (or %lbl%@85765 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @85765)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@85795 (SMemInv $sMem@@5 $sMem@@5 (+ call25171formal@$ret@0 0) esp)) :lblneg @85795)
(=> (SMemInv $sMem@@5 $sMem@@5 (+ call25171formal@$ret@0 0) esp) (and
(! (or %lbl%@85806 (= (ReturnToAddr (select $sMem@@5 (+ call25171formal@$ret@0 0))) $RET@@0)) :lblneg @85806)
(=> (= (ReturnToAddr (select $sMem@@5 (+ call25171formal@$ret@0 0))) $RET@@0) (and
(! (or %lbl%@85820 (and
(word call25174formal@$ret@0)
(word ecx)
(word call25181formal@$ret@0)
(word call25188formal@$ret@0)
(word call25195formal@$ret@0)
(word edi)
(word ebp))) :lblneg @85820)
(=> (and
(word call25174formal@$ret@0)
(word ecx)
(word call25181formal@$ret@0)
(word call25188formal@$ret@0)
(word call25195formal@$ret@0)
(word edi)
(word ebp)) (and
(! (or %lbl%@85856 (= call25181formal@$ret@0 call25181formal@$ret@0)) :lblneg @85856)
(=> (= call25181formal@$ret@0 call25181formal@$ret@0) (and
(! (or %lbl%@85860 (= $ghost_N ecx)) :lblneg @85860)
(=> (= $ghost_N ecx) (and
(! (or %lbl%@85866 (= call25174formal@$ret@0 call25174formal@$ret@0)) :lblneg @85866)
(=> (= call25174formal@$ret@0 call25174formal@$ret@0) (and
(! (or %lbl%@85870 (= call25188formal@$ret@0 call25188formal@$ret@0)) :lblneg @85870)
(=> (= call25188formal@$ret@0 call25188formal@$ret@0) (and
(! (or %lbl%@85874 (= call25195formal@$ret@0 call25195formal@$ret@0)) :lblneg @85874)
(=> (= call25195formal@$ret@0 call25195formal@$ret@0) (and
(! (or %lbl%@85878 (<= call25181formal@$ret@0 $ghost_N)) :lblneg @85878)
(=> (<= call25181formal@$ret@0 $ghost_N) (and
(! (or %lbl%@85883 (= call25174formal@$ret@0 (* (* call25181formal@$ret@0 call25181formal@$ret@0) call25181formal@$ret@0))) :lblneg @85883)
(=> (= call25174formal@$ret@0 (* (* call25181formal@$ret@0 call25181formal@$ret@0) call25181formal@$ret@0)) (and
(! (or %lbl%@85893 (= call25188formal@$ret@0 (+ (+ (* (* 3 call25181formal@$ret@0) call25181formal@$ret@0) (* 3 call25181formal@$ret@0)) 1))) :lblneg @85893)
(=> (= call25188formal@$ret@0 (+ (+ (* (* 3 call25181formal@$ret@0) call25181formal@$ret@0) (* 3 call25181formal@$ret@0)) 1)) (and
(! (or %lbl%@85915 (= call25195formal@$ret@0 (+ (* 6 call25181formal@$ret@0) 6))) :lblneg @85915)
(=> (= call25195formal@$ret@0 (+ (* 6 call25181formal@$ret@0) 6)) L1_correct)))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+85146 true) :lblpos +85146) (=> (and
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
(declare-fun %lbl%+25626 () Bool)
(declare-fun %lbl%@87256 () Bool)
(declare-fun %lbl%@87266 () Bool)
(declare-fun call25576formal@$ret@0 () Int)
(declare-fun q@xor (Int Int) Int)
(declare-fun call25580formal@$ret@0 () Int)
(declare-fun call25588formal@$ret@0 () Int)
(declare-fun call25596formal@$ret@0 () Int)
(declare-fun call25603formal@$ret@0 () Int)
(declare-fun call25610formal@$ret@0 () Int)
(declare-fun %lbl%@87482 () Bool)
(declare-fun call25614formal@$ret@0 () Int)
(declare-fun %lbl%@87512 () Bool)
(declare-fun %lbl%@87542 () Bool)
(declare-fun call25619formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@87564 () Bool)
(declare-fun %lbl%@87574 () Bool)
(declare-fun esp@0@@0 () Int)
(declare-fun %lbl%@87603 () Bool)
(declare-fun %lbl%@87611 () Bool)
(declare-fun %lbl%@87619 () Bool)
(declare-fun %lbl%@87649 () Bool)
(declare-fun %lbl%@87656 () Bool)
(declare-fun %lbl%@87694 () Bool)
(declare-fun $ghost_a () Int)
(declare-fun %lbl%@87699 () Bool)
(declare-fun %lbl%+86839 () Bool)
(push 1)
(set-info :boogie-vc-id Proc_XorIdentity)
(assert (not
(let ((anon0_correct@@0 (=> (! (and %lbl%+25626 true) :lblpos +25626) (and
(! (or %lbl%@87256 (TV esp)) :lblneg @87256)
(=> (TV esp) (and
(! (or %lbl%@87266 (word (- esp 0))) :lblneg @87266)
(=> (word (- esp 0)) (=> (= call25576formal@$ret@0 (- esp 0)) (=> (and
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
(= call25580formal@$ret@0 ecx)
(= call25588formal@$ret@0 (q@xor call25580formal@$ret@0 ecx))
(word call25588formal@$ret@0)
(= call25596formal@$ret@0 (q@xor call25588formal@$ret@0 ecx))
(word call25596formal@$ret@0)
(= call25603formal@$ret@0 call25596formal@$ret@0)
(= call25610formal@$ret@0 call25603formal@$ret@0)) (and
(! (or %lbl%@87482 (word (+ call25576formal@$ret@0 0))) :lblneg @87482)
(=> (word (+ call25576formal@$ret@0 0)) (=> (= call25614formal@$ret@0 (+ call25576formal@$ret@0 0)) (and
(! (or %lbl%@87512 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @87512)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@87542 (sAddr call25614formal@$ret@0)) :lblneg @87542)
(=> (sAddr call25614formal@$ret@0) (=> (and
(= (select $Mem@@3 call25614formal@$ret@0) (select $sMem@@5 call25614formal@$ret@0))
(= call25619formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@87564 (= (ReturnToAddr (select $Mem@@3 call25614formal@$ret@0)) call25619formal@$oldRA@0)) :lblneg @87564)
(=> (= (ReturnToAddr (select $Mem@@3 call25614formal@$ret@0)) call25619formal@$oldRA@0) (and
(! (or %lbl%@87574 (Aligned call25614formal@$ret@0)) :lblneg @87574)
(=> (Aligned call25614formal@$ret@0) (=> (and
(= esp@0@@0 (+ call25614formal@$ret@0 4))
(Aligned esp@0@@0)) (and
(! (or %lbl%@87603 (= esp@0@@0 (+ esp 4))) :lblneg @87603)
(=> (= esp@0@@0 (+ esp 4)) (and
(! (or %lbl%@87611 (= esp@0@@0 (+ esp 4))) :lblneg @87611)
(=> (= esp@0@@0 (+ esp 4)) (and
(! (or %lbl%@87619 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @87619)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@87649 (SMemEnsure $sMem@@5 $sMem@@5 esp@0@@0 esp)) :lblneg @87649)
(=> (SMemEnsure $sMem@@5 $sMem@@5 esp@0@@0 esp) (and
(! (or %lbl%@87656 (and
(word call25610formal@$ret@0)
(word call25603formal@$ret@0)
(word edx)
(word ebx)
(word esi)
(word edi)
(word ebp))) :lblneg @87656)
(=> (and
(word call25610formal@$ret@0)
(word call25603formal@$ret@0)
(word edx)
(word ebx)
(word esi)
(word edi)
(word ebp)) (and
(! (or %lbl%@87694 (= call25603formal@$ret@0 $ghost_a)) :lblneg @87694)
(=> (= call25603formal@$ret@0 $ghost_a) (and
(! (or %lbl%@87699 (= call25610formal@$ret@0 call25603formal@$ret@0)) :lblneg @87699)
(=> (= call25610formal@$ret@0 call25603formal@$ret@0) true)))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+86839 true) :lblpos +86839) (=> (and
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
(declare-fun %lbl%+25830 () Bool)
(declare-fun %lbl%@87869 () Bool)
(declare-fun %lbl%@88033 () Bool)
(declare-fun %lbl%@88071 () Bool)
(declare-fun %lbl%@88109 () Bool)
(declare-fun %lbl%@88147 () Bool)
(declare-fun %lbl%+87704 () Bool)
(push 1)
(set-info :boogie-vc-id espAligned)
(assert (not
(let ((anon0_correct@@1 (=> (! (and %lbl%+25830 true) :lblpos +25830) (and
(! (or %lbl%@87869 (and
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
(TO (- 0 16)))) :lblneg @87869)
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
(! (or %lbl%@88033 (and
(Aligned (- esp 4))
(Aligned (- esp 8))
(Aligned (- esp 12))
(Aligned (- esp 16)))) :lblneg @88033)
(=> (and
(Aligned (- esp 4))
(Aligned (- esp 8))
(Aligned (- esp 12))
(Aligned (- esp 16))) (and
(! (or %lbl%@88071 (and
(Aligned (- esp 20))
(Aligned (- esp 24))
(Aligned (- esp 28))
(Aligned (- esp 32)))) :lblneg @88071)
(=> (and
(Aligned (- esp 20))
(Aligned (- esp 24))
(Aligned (- esp 28))
(Aligned (- esp 32))) (and
(! (or %lbl%@88109 (and
(Aligned (- esp 36))
(Aligned (- esp 40))
(Aligned (- esp 44))
(Aligned (- esp 48)))) :lblneg @88109)
(=> (and
(Aligned (- esp 36))
(Aligned (- esp 40))
(Aligned (- esp 44))
(Aligned (- esp 48))) (and
(! (or %lbl%@88147 (and
(Aligned (- esp 52))
(Aligned (- esp 56))
(Aligned (- esp 60))
(Aligned (- esp 64)))) :lblneg @88147)
(=> (and
(Aligned (- esp 52))
(Aligned (- esp 56))
(Aligned (- esp 60))
(Aligned (- esp 64))) true)))))))))))))
(let ((PreconditionGeneratedEntry_correct@@1 (=> (! (and %lbl%+87704 true) :lblpos +87704) (=> (Aligned esp) anon0_correct@@1))))
PreconditionGeneratedEntry_correct@@1))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+26002 () Bool)
(declare-fun %lbl%@88351 () Bool)
(declare-fun %lbl%@88451 () Bool)
(declare-fun %lbl%@88489 () Bool)
(declare-fun %lbl%@88527 () Bool)
(declare-fun %lbl%@88565 () Bool)
(declare-fun %lbl%+88186 () Bool)
(push 1)
(set-info :boogie-vc-id espAlignedInline)
(assert (not
(let ((anon0_correct@@2 (=> (! (and %lbl%+26002 true) :lblpos +26002) (and
(! (or %lbl%@88351 (and
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
(TO 16))) :lblneg @88351)
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
(! (or %lbl%@88451 (and
(Aligned (+ esp 4))
(Aligned (+ esp 8))
(Aligned (+ esp 12))
(Aligned (+ esp 16)))) :lblneg @88451)
(=> (and
(Aligned (+ esp 4))
(Aligned (+ esp 8))
(Aligned (+ esp 12))
(Aligned (+ esp 16))) (and
(! (or %lbl%@88489 (and
(Aligned (+ esp 20))
(Aligned (+ esp 24))
(Aligned (+ esp 28))
(Aligned (+ esp 32)))) :lblneg @88489)
(=> (and
(Aligned (+ esp 20))
(Aligned (+ esp 24))
(Aligned (+ esp 28))
(Aligned (+ esp 32))) (and
(! (or %lbl%@88527 (and
(Aligned (+ esp 36))
(Aligned (+ esp 40))
(Aligned (+ esp 44))
(Aligned (+ esp 48)))) :lblneg @88527)
(=> (and
(Aligned (+ esp 36))
(Aligned (+ esp 40))
(Aligned (+ esp 44))
(Aligned (+ esp 48))) (and
(! (or %lbl%@88565 (and
(Aligned (+ esp 52))
(Aligned (+ esp 56))
(Aligned (+ esp 60))
(Aligned (+ esp 64)))) :lblneg @88565)
(=> (and
(Aligned (+ esp 52))
(Aligned (+ esp 56))
(Aligned (+ esp 60))
(Aligned (+ esp 64))) true)))))))))))))
(let ((PreconditionGeneratedEntry_correct@@2 (=> (! (and %lbl%+88186 true) :lblpos +88186) (=> (Aligned esp) anon0_correct@@2))))
PreconditionGeneratedEntry_correct@@2))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+26038 () Bool)
(declare-fun call26024formal@$ret@0 () Int)
(declare-fun %lbl%@88703 () Bool)
(declare-fun $TimerSeq@0 () Int)
(declare-fun $TimerFreq@0 () Int)
(declare-fun call26029formal@$ret@0 () Int)
(declare-fun %lbl%@88761 () Bool)
(declare-fun %lbl%@88773 () Bool)
(declare-fun %lbl%@88784 () Bool)
(declare-fun $TimerSeq@1 () Int)
(declare-fun %lbl%@88827 () Bool)
(declare-fun call26034formal@$ret@0 () Int)
(declare-fun %lbl%@88857 () Bool)
(declare-fun %lbl%@88869 () Bool)
(declare-fun %lbl%@88880 () Bool)
(declare-fun $TimerSeq@2 () Int)
(declare-fun %lbl%@88918 () Bool)
(declare-fun %lbl%+88604 () Bool)
(push 1)
(set-info :boogie-vc-id startTimer)
(assert (not
(let ((anon0_correct@@3 (=> (! (and %lbl%+26038 true) :lblpos +26038) (=> (= call26024formal@$ret@0 48) (and
(! (or %lbl%@88703 (= call26024formal@$ret@0 48)) :lblneg @88703)
(=> (= call26024formal@$ret@0 48) (=> (= $TimerSeq@0 0) (=> (and
(= $TimerFreq@0 ecx)
(= call26029formal@$ret@0 ecx)) (and
(! (or %lbl%@88761 (and
(<= 0 $TimerSeq@0)
(< $TimerSeq@0 2))) :lblneg @88761)
(=> (and
(<= 0 $TimerSeq@0)
(< $TimerSeq@0 2)) (and
(! (or %lbl%@88773 (=> (= $TimerSeq@0 0) (= call26029formal@$ret@0 $TimerFreq@0))) :lblneg @88773)
(=> (=> (= $TimerSeq@0 0) (= call26029formal@$ret@0 $TimerFreq@0)) (and
(! (or %lbl%@88784 (=> (= $TimerSeq@0 1) (= call26029formal@$ret@0 (shr $TimerFreq@0 8)))) :lblneg @88784)
(=> (=> (= $TimerSeq@0 1) (= call26029formal@$ret@0 (shr $TimerFreq@0 8))) (=> (= $TimerSeq@1 (+ $TimerSeq@0 1)) (and
(! (or %lbl%@88827 (< 8 32)) :lblneg @88827)
(=> (< 8 32) (=> (and
(= call26034formal@$ret@0 (shr call26029formal@$ret@0 8))
(word call26034formal@$ret@0)) (and
(! (or %lbl%@88857 (and
(<= 0 $TimerSeq@1)
(< $TimerSeq@1 2))) :lblneg @88857)
(=> (and
(<= 0 $TimerSeq@1)
(< $TimerSeq@1 2)) (and
(! (or %lbl%@88869 (=> (= $TimerSeq@1 0) (= call26034formal@$ret@0 $TimerFreq@0))) :lblneg @88869)
(=> (=> (= $TimerSeq@1 0) (= call26034formal@$ret@0 $TimerFreq@0)) (and
(! (or %lbl%@88880 (=> (= $TimerSeq@1 1) (= call26034formal@$ret@0 (shr $TimerFreq@0 8)))) :lblneg @88880)
(=> (=> (= $TimerSeq@1 1) (= call26034formal@$ret@0 (shr $TimerFreq@0 8))) (=> (= $TimerSeq@2 (+ $TimerSeq@1 1)) (and
(! (or %lbl%@88918 (and
(TimerOk $TimerSeq@2)
(= $TimerFreq@0 ecx))) :lblneg @88918)
(=> (and
(TimerOk $TimerSeq@2)
(= $TimerFreq@0 ecx)) true)))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@3 (=> (! (and %lbl%+88604 true) :lblpos +88604) (=> (word ecx) anon0_correct@@3))))
PreconditionGeneratedEntry_correct@@3))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+26714 () Bool)
(declare-fun $Efl@6@@0 () Int)
(declare-fun %lbl%@90882 () Bool)
(declare-fun call26580formal@$ret@0 () Int)
(declare-fun edx@0@@0 () Int)
(declare-fun %lbl%@90942 () Bool)
(declare-fun call26584formal@$ret@0 () Int)
(declare-fun call26587formal@$ret@0 () Int)
(declare-fun call26592formal@$ptr@0 () Int)
(declare-fun edi@0 () Int)
(declare-fun %lbl%@91004 () Bool)
(declare-fun %lbl%@91007 () Bool)
(declare-fun %lbl%@91010 () Bool)
(declare-fun %lbl%@91013 () Bool)
(declare-fun $IomFrozen () Bool)
(declare-fun $IomMem@1 () (Array Int Int))
(declare-fun $IomMem@0 () (Array Int Int))
(declare-fun call26597formal@$ptr@0 () Int)
(declare-fun %lbl%@91054 () Bool)
(declare-fun %lbl%@91057 () Bool)
(declare-fun %lbl%@91060 () Bool)
(declare-fun %lbl%@91063 () Bool)
(declare-fun $IomMem@2 () (Array Int Int))
(declare-fun call26602formal@$ptr@0 () Int)
(declare-fun %lbl%@91104 () Bool)
(declare-fun %lbl%@91107 () Bool)
(declare-fun %lbl%@91110 () Bool)
(declare-fun %lbl%@91113 () Bool)
(declare-fun $IomMem@3 () (Array Int Int))
(declare-fun call26607formal@$ptr@0 () Int)
(declare-fun %lbl%@91154 () Bool)
(declare-fun %lbl%@91157 () Bool)
(declare-fun %lbl%@91160 () Bool)
(declare-fun %lbl%@91163 () Bool)
(declare-fun $IomMem@4 () (Array Int Int))
(declare-fun call26612formal@$ptr@0 () Int)
(declare-fun %lbl%@91204 () Bool)
(declare-fun %lbl%@91207 () Bool)
(declare-fun %lbl%@91210 () Bool)
(declare-fun %lbl%@91213 () Bool)
(declare-fun $IomMem@5 () (Array Int Int))
(declare-fun call26617formal@$ptr@0 () Int)
(declare-fun %lbl%@91254 () Bool)
(declare-fun %lbl%@91257 () Bool)
(declare-fun %lbl%@91260 () Bool)
(declare-fun %lbl%@91263 () Bool)
(declare-fun $IomMem@6 () (Array Int Int))
(declare-fun call26622formal@$ptr@0 () Int)
(declare-fun %lbl%@91304 () Bool)
(declare-fun %lbl%@91307 () Bool)
(declare-fun %lbl%@91310 () Bool)
(declare-fun %lbl%@91313 () Bool)
(declare-fun $IomMem@7 () (Array Int Int))
(declare-fun call26627formal@$ptr@0 () Int)
(declare-fun %lbl%@91354 () Bool)
(declare-fun %lbl%@91357 () Bool)
(declare-fun %lbl%@91360 () Bool)
(declare-fun %lbl%@91363 () Bool)
(declare-fun $IomMem@8 () (Array Int Int))
(declare-fun $entry@1 () Int)
(declare-fun $entry@0 () Int)
(declare-fun %lbl%@91406 () Bool)
(declare-fun call26637formal@$ret@0 () Int)
(declare-fun %lbl%@91436 () Bool)
(declare-fun %lbl%@91445 () Bool)
(declare-fun %lbl%@91478 () Bool)
(declare-fun call26643formal@$ret@0 () Int)
(declare-fun %lbl%@91509 () Bool)
(declare-fun %lbl%@91529 () Bool)
(declare-fun %lbl%@91541 () Bool)
(declare-fun %lbl%@91550 () Bool)
(declare-fun %lbl%@91562 () Bool)
(declare-fun %lbl%@91574 () Bool)
(declare-fun %lbl%@91635 () Bool)
(declare-fun %lbl%@91712 () Bool)
(declare-fun %lbl%@91789 () Bool)
(declare-fun %lbl%+26725 () Bool)
(declare-fun %lbl%+89003 () Bool)
(declare-fun %lbl%@92094 () Bool)
(declare-fun $IomMem@10 () (Array Int Int))
(declare-fun %lbl%@92099 () Bool)
(declare-fun %lbl%@92204 () Bool)
(declare-fun %lbl%@92282 () Bool)
(declare-fun %lbl%+26729 () Bool)
(declare-fun %lbl%@91934 () Bool)
(declare-fun ecx@2 () Int)
(declare-fun call26685formal@$ret@0 () Int)
(declare-fun %lbl%@91979 () Bool)
(declare-fun call26689formal@$ret@0 () Int)
(declare-fun call26692formal@$ret@0 () Int)
(declare-fun call26701formal@$ptr@0 () Int)
(declare-fun %lbl%@92049 () Bool)
(declare-fun %lbl%@92052 () Bool)
(declare-fun %lbl%@92055 () Bool)
(declare-fun %lbl%@92058 () Bool)
(declare-fun $IomMem@9 () (Array Int Int))
(declare-fun %lbl%+26723 () Bool)
(declare-fun $Efl@9 () Int)
(declare-fun call26653formal@$ret@0 () Int)
(declare-fun %lbl%+26712 () Bool)
(declare-fun call26649formal@$ret@0 () Int)
(declare-fun %lbl%@90792 () Bool)
(declare-fun call26660formal@$x@0 () T@opn)
(declare-fun call26660formal@$y@0 () T@opn)
(declare-fun %lbl%@90841 () Bool)
(declare-fun %lbl%@90846 () Bool)
(declare-fun %lbl%+26711 () Bool)
(declare-fun call26547formal@$x@0 () T@opn)
(declare-fun call26547formal@$y@0 () T@opn)
(declare-fun call26309formal@$ret@0 () Int)
(declare-fun %lbl%@90726 () Bool)
(declare-fun %lbl%@90731 () Bool)
(declare-fun %lbl%+26704 () Bool)
(declare-fun call26299formal@$ret@0 () Int)
(declare-fun call26302formal@$ret@0 () Int)
(declare-fun %lbl%@89870 () Bool)
(declare-fun call26306formal@$ret@0 () Int)
(declare-fun call26312formal@$ret@0 () Int)
(declare-fun %lbl%@89944 () Bool)
(declare-fun %lbl%@89964 () Bool)
(declare-fun %lbl%@89976 () Bool)
(declare-fun %lbl%@89985 () Bool)
(declare-fun %lbl%@89997 () Bool)
(declare-fun %lbl%@90009 () Bool)
(declare-fun $IomMem@@7 () (Array Int Int))
(declare-fun %lbl%@90072 () Bool)
(declare-fun %lbl%@90151 () Bool)
(declare-fun %lbl%@90230 () Bool)
(declare-fun %lbl%+89007 () Bool)
(push 1)
(set-info :boogie-vc-id setupIoTablesHelper1)
(assert (not
(let ((anon5_Else_correct (=> (! (and %lbl%+26714 true) :lblpos +26714) (=> (not (Jae $Efl@6@@0)) (and
(! (or %lbl%@90882 (and
(TO 1024)
(TO 1025)
(TO 2048)
(TO 2049)
(TO 3072)
(TO 3073))) :lblneg @90882)
(=> (and
(TO 1024)
(TO 1025)
(TO 2048)
(TO 2049)
(TO 3072)
(TO 3073)) (=> (= call26580formal@$ret@0 edx@0@@0) (and
(! (or %lbl%@90942 (word (+ call26580formal@$ret@0 3))) :lblneg @90942)
(=> (word (+ call26580formal@$ret@0 3)) (=> (= call26584formal@$ret@0 (+ call26580formal@$ret@0 3)) (=> (and
(= call26587formal@$ret@0 call26584formal@$ret@0)
(= call26592formal@$ptr@0 (+ edi@0 0))) (and
(! (or %lbl%@91004 (iomAddr call26592formal@$ptr@0)) :lblneg @91004)
(=> (iomAddr call26592formal@$ptr@0) (and
(! (or %lbl%@91007 (Aligned call26592formal@$ptr@0)) :lblneg @91007)
(=> (Aligned call26592formal@$ptr@0) (and
(! (or %lbl%@91010 (word call26587formal@$ret@0)) :lblneg @91010)
(=> (word call26587formal@$ret@0) (and
(! (or %lbl%@91013 (not $IomFrozen)) :lblneg @91013)
(=> (not $IomFrozen) (=> (and
(= $IomMem@1 (store $IomMem@0 call26592formal@$ptr@0 call26587formal@$ret@0))
(= call26597formal@$ptr@0 (+ edi@0 4))) (and
(! (or %lbl%@91054 (iomAddr call26597formal@$ptr@0)) :lblneg @91054)
(=> (iomAddr call26597formal@$ptr@0) (and
(! (or %lbl%@91057 (Aligned call26597formal@$ptr@0)) :lblneg @91057)
(=> (Aligned call26597formal@$ptr@0) (and
(! (or %lbl%@91060 (word 0)) :lblneg @91060)
(=> (word 0) (and
(! (or %lbl%@91063 (not $IomFrozen)) :lblneg @91063)
(=> (not $IomFrozen) (=> (and
(= $IomMem@2 (store $IomMem@1 call26597formal@$ptr@0 0))
(= call26602formal@$ptr@0 (+ edi@0 4096))) (and
(! (or %lbl%@91104 (iomAddr call26602formal@$ptr@0)) :lblneg @91104)
(=> (iomAddr call26602formal@$ptr@0) (and
(! (or %lbl%@91107 (Aligned call26602formal@$ptr@0)) :lblneg @91107)
(=> (Aligned call26602formal@$ptr@0) (and
(! (or %lbl%@91110 (word 0)) :lblneg @91110)
(=> (word 0) (and
(! (or %lbl%@91113 (not $IomFrozen)) :lblneg @91113)
(=> (not $IomFrozen) (=> (and
(= $IomMem@3 (store $IomMem@2 call26602formal@$ptr@0 0))
(= call26607formal@$ptr@0 (+ edi@0 4100))) (and
(! (or %lbl%@91154 (iomAddr call26607formal@$ptr@0)) :lblneg @91154)
(=> (iomAddr call26607formal@$ptr@0) (and
(! (or %lbl%@91157 (Aligned call26607formal@$ptr@0)) :lblneg @91157)
(=> (Aligned call26607formal@$ptr@0) (and
(! (or %lbl%@91160 (word 0)) :lblneg @91160)
(=> (word 0) (and
(! (or %lbl%@91163 (not $IomFrozen)) :lblneg @91163)
(=> (not $IomFrozen) (=> (and
(= $IomMem@4 (store $IomMem@3 call26607formal@$ptr@0 0))
(= call26612formal@$ptr@0 (+ edi@0 8192))) (and
(! (or %lbl%@91204 (iomAddr call26612formal@$ptr@0)) :lblneg @91204)
(=> (iomAddr call26612formal@$ptr@0) (and
(! (or %lbl%@91207 (Aligned call26612formal@$ptr@0)) :lblneg @91207)
(=> (Aligned call26612formal@$ptr@0) (and
(! (or %lbl%@91210 (word 0)) :lblneg @91210)
(=> (word 0) (and
(! (or %lbl%@91213 (not $IomFrozen)) :lblneg @91213)
(=> (not $IomFrozen) (=> (and
(= $IomMem@5 (store $IomMem@4 call26612formal@$ptr@0 0))
(= call26617formal@$ptr@0 (+ edi@0 8196))) (and
(! (or %lbl%@91254 (iomAddr call26617formal@$ptr@0)) :lblneg @91254)
(=> (iomAddr call26617formal@$ptr@0) (and
(! (or %lbl%@91257 (Aligned call26617formal@$ptr@0)) :lblneg @91257)
(=> (Aligned call26617formal@$ptr@0) (and
(! (or %lbl%@91260 (word 0)) :lblneg @91260)
(=> (word 0) (and
(! (or %lbl%@91263 (not $IomFrozen)) :lblneg @91263)
(=> (not $IomFrozen) (=> (and
(= $IomMem@6 (store $IomMem@5 call26617formal@$ptr@0 0))
(= call26622formal@$ptr@0 (+ edi@0 12288))) (and
(! (or %lbl%@91304 (iomAddr call26622formal@$ptr@0)) :lblneg @91304)
(=> (iomAddr call26622formal@$ptr@0) (and
(! (or %lbl%@91307 (Aligned call26622formal@$ptr@0)) :lblneg @91307)
(=> (Aligned call26622formal@$ptr@0) (and
(! (or %lbl%@91310 (word 0)) :lblneg @91310)
(=> (word 0) (and
(! (or %lbl%@91313 (not $IomFrozen)) :lblneg @91313)
(=> (not $IomFrozen) (=> (and
(= $IomMem@7 (store $IomMem@6 call26622formal@$ptr@0 0))
(= call26627formal@$ptr@0 (+ edi@0 12292))) (and
(! (or %lbl%@91354 (iomAddr call26627formal@$ptr@0)) :lblneg @91354)
(=> (iomAddr call26627formal@$ptr@0) (and
(! (or %lbl%@91357 (Aligned call26627formal@$ptr@0)) :lblneg @91357)
(=> (Aligned call26627formal@$ptr@0) (and
(! (or %lbl%@91360 (word 0)) :lblneg @91360)
(=> (word 0) (and
(! (or %lbl%@91363 (not $IomFrozen)) :lblneg @91363)
(=> (not $IomFrozen) (=> (and
(= $IomMem@8 (store $IomMem@7 call26627formal@$ptr@0 0))
(= $entry@1 (+ $entry@0 1))) (and
(! (or %lbl%@91406 (word (+ edi@0 8))) :lblneg @91406)
(=> (word (+ edi@0 8)) (=> (= call26637formal@$ret@0 (+ edi@0 8)) (and
(! (or %lbl%@91436 (= (q@and edx@0@@0 4095) 0)) :lblneg @91436)
(=> (= (q@and edx@0@@0 4095) 0) (and
(! (or %lbl%@91445 (and
(word edx@0@@0)
(word (+ edx@0@@0 4096)))) :lblneg @91445)
(=> (and
(word edx@0@@0)
(word (+ edx@0@@0 4096))) (=> (and
(= (q@and (+ edx@0@@0 4096) 4095) 0)
(Aligned edx@0@@0)) (and
(! (or %lbl%@91478 (word (+ edx@0@@0 4096))) :lblneg @91478)
(=> (word (+ edx@0@@0 4096)) (=> (= call26643formal@$ret@0 (+ edx@0@@0 4096)) (and
(! (or %lbl%@91509 (and
(Aligned call26637formal@$ret@0)
(TV call26637formal@$ret@0)
(TO 1)
(TO 2))) :lblneg @91509)
(=> (and
(Aligned call26637formal@$ret@0)
(TV call26637formal@$ret@0)
(TO 1)
(TO 2)) (and
(! (or %lbl%@91529 (= call26643formal@$ret@0 (+ ebx (* $entry@1 4096)))) :lblneg @91529)
(=> (= call26643formal@$ret@0 (+ ebx (* $entry@1 4096))) (and
(! (or %lbl%@91541 (= (q@and call26643formal@$ret@0 4095) 0)) :lblneg @91541)
(=> (= (q@and call26643formal@$ret@0 4095) 0) (and
(! (or %lbl%@91550 (= call26637formal@$ret@0 (+ esi (* 8 $entry@1)))) :lblneg @91550)
(=> (= call26637formal@$ret@0 (+ esi (* 8 $entry@1))) (and
(! (or %lbl%@91562 (and
(<= 0 $entry@1)
(<= $entry@1 512))) :lblneg @91562)
(=> (and
(<= 0 $entry@1)
(<= $entry@1 512)) (and
(! (or %lbl%@91574 (forall ((i@@42 Int) ) (! (=> (and
(TV i@@42)
(<= 0 i@@42)
(< i@@42 $entry@1)) (IoPageTableEntry (select $IomMem@8 (+ esi (* 8 i@@42))) (select $IomMem@8 (+ (+ esi (* 8 i@@42)) 4))))
 :qid |EntryCPb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@42))
))) :lblneg @91574)
(=> (forall ((i@@43 Int) ) (! (=> (and
(TV i@@43)
(<= 0 i@@43)
(< i@@43 $entry@1)) (IoPageTableEntry (select $IomMem@8 (+ esi (* 8 i@@43))) (select $IomMem@8 (+ (+ esi (* 8 i@@43)) 4))))
 :qid |EntryCPb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@43))
)) (and
(! (or %lbl%@91635 (forall ((i@@44 Int) ) (! (=> (and
(TV i@@44)
(<= 0 i@@44)
(< i@@44 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 4096) (* 8 i@@44))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 4096) (* 8 i@@44)) 4)) 0)))
 :qid |EntryCPb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@44))
))) :lblneg @91635)
(=> (forall ((i@@45 Int) ) (! (=> (and
(TV i@@45)
(<= 0 i@@45)
(< i@@45 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 4096) (* 8 i@@45))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 4096) (* 8 i@@45)) 4)) 0)))
 :qid |EntryCPb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@45))
)) (and
(! (or %lbl%@91712 (forall ((i@@46 Int) ) (! (=> (and
(TV i@@46)
(<= 0 i@@46)
(< i@@46 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 8192) (* 8 i@@46))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 8192) (* 8 i@@46)) 4)) 0)))
 :qid |EntryCPb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@46))
))) :lblneg @91712)
(=> (forall ((i@@47 Int) ) (! (=> (and
(TV i@@47)
(<= 0 i@@47)
(< i@@47 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 8192) (* 8 i@@47))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 8192) (* 8 i@@47)) 4)) 0)))
 :qid |EntryCPb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@47))
)) (and
(! (or %lbl%@91789 (forall ((i@@48 Int) ) (! (=> (and
(TV i@@48)
(<= 0 i@@48)
(< i@@48 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 12288) (* 8 i@@48))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 12288) (* 8 i@@48)) 4)) 0)))
 :qid |EntryCPb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@48))
))) :lblneg @91789)
(=> (forall ((i@@49 Int) ) (! (=> (and
(TV i@@49)
(<= 0 i@@49)
(< i@@49 $entry@1)) (and
(= (select $IomMem@8 (+ (+ esi 12288) (* 8 i@@49))) 0)
(= (select $IomMem@8 (+ (+ (+ esi 12288) (* 8 i@@49)) 4)) 0)))
 :qid |EntryCPb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@49))
)) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon6_Else_correct (=> (! (and %lbl%+26725 true) :lblpos +26725) true)))
(let ((GeneratedUnifiedExit_correct@@0 (=> (! (and %lbl%+89003 true) :lblpos +89003) (and
(! (or %lbl%@92094 (IoPageTable $IomMem@10 esi)) :lblneg @92094)
(=> (IoPageTable $IomMem@10 esi) (and
(! (or %lbl%@92099 (forall ((i@@50 Int) ) (! (=> (and
(TV i@@50)
(<= 0 i@@50)
(< i@@50 512)) (and
(or
(= (select $IomMem@10 (+ (+ esi 4096) (* 8 i@@50))) 0)
(= (select $IomMem@10 (+ (+ esi 4096) (* 8 i@@50))) (+ esi 3)))
(= (select $IomMem@10 (+ (+ (+ esi 4096) (* 8 i@@50)) 4)) 0)))
 :qid |EntryCPb.49:17|
 :skolemid |248|
 :pattern ( (TV i@@50))
))) :lblneg @92099)
(=> (forall ((i@@51 Int) ) (! (=> (and
(TV i@@51)
(<= 0 i@@51)
(< i@@51 512)) (and
(or
(= (select $IomMem@10 (+ (+ esi 4096) (* 8 i@@51))) 0)
(= (select $IomMem@10 (+ (+ esi 4096) (* 8 i@@51))) (+ esi 3)))
(= (select $IomMem@10 (+ (+ (+ esi 4096) (* 8 i@@51)) 4)) 0)))
 :qid |EntryCPb.49:17|
 :skolemid |248|
 :pattern ( (TV i@@51))
)) (and
(! (or %lbl%@92204 (forall ((i@@52 Int) ) (! (=> (and
(TV i@@52)
(<= 0 i@@52)
(< i@@52 512)) (and
(= (select $IomMem@10 (+ (+ esi 8192) (* 8 i@@52))) 0)
(= (select $IomMem@10 (+ (+ (+ esi 8192) (* 8 i@@52)) 4)) 0)))
 :qid |EntryCPb.52:17|
 :skolemid |249|
 :pattern ( (TV i@@52))
))) :lblneg @92204)
(=> (forall ((i@@53 Int) ) (! (=> (and
(TV i@@53)
(<= 0 i@@53)
(< i@@53 512)) (and
(= (select $IomMem@10 (+ (+ esi 8192) (* 8 i@@53))) 0)
(= (select $IomMem@10 (+ (+ (+ esi 8192) (* 8 i@@53)) 4)) 0)))
 :qid |EntryCPb.52:17|
 :skolemid |249|
 :pattern ( (TV i@@53))
)) (and
(! (or %lbl%@92282 (forall ((i@@54 Int) ) (! (=> (and
(TV i@@54)
(<= 0 i@@54)
(< i@@54 512)) (and
(= (select $IomMem@10 (+ (+ esi 12288) (* 8 i@@54))) 0)
(= (select $IomMem@10 (+ (+ (+ esi 12288) (* 8 i@@54)) 4)) 0)))
 :qid |EntryCPb.55:17|
 :skolemid |250|
 :pattern ( (TV i@@54))
))) :lblneg @92282)
(=> (forall ((i@@55 Int) ) (! (=> (and
(TV i@@55)
(<= 0 i@@55)
(< i@@55 512)) (and
(= (select $IomMem@10 (+ (+ esi 12288) (* 8 i@@55))) 0)
(= (select $IomMem@10 (+ (+ (+ esi 12288) (* 8 i@@55)) 4)) 0)))
 :qid |EntryCPb.55:17|
 :skolemid |250|
 :pattern ( (TV i@@55))
)) true)))))))))))
(let ((__L3_correct (=> (! (and %lbl%+26729 true) :lblpos +26729) (and
(! (or %lbl%@91934 (and
(TV ecx@2)
(TO (+ (* 2 ecx@2) 1024)))) :lblneg @91934)
(=> (and
(TV ecx@2)
(TO (+ (* 2 ecx@2) 1024))) (=> (= call26685formal@$ret@0 esi) (and
(! (or %lbl%@91979 (word (+ call26685formal@$ret@0 3))) :lblneg @91979)
(=> (word (+ call26685formal@$ret@0 3)) (=> (= call26689formal@$ret@0 (+ call26685formal@$ret@0 3)) (=> (and
(= call26692formal@$ret@0 call26689formal@$ret@0)
(= call26701formal@$ptr@0 (+ (+ esi (* 8 ecx@2)) 4096))) (and
(! (or %lbl%@92049 (iomAddr call26701formal@$ptr@0)) :lblneg @92049)
(=> (iomAddr call26701formal@$ptr@0) (and
(! (or %lbl%@92052 (Aligned call26701formal@$ptr@0)) :lblneg @92052)
(=> (Aligned call26701formal@$ptr@0) (and
(! (or %lbl%@92055 (word call26692formal@$ret@0)) :lblneg @92055)
(=> (word call26692formal@$ret@0) (and
(! (or %lbl%@92058 (not $IomFrozen)) :lblneg @92058)
(=> (not $IomFrozen) (=> (and
(= $IomMem@9 (store $IomMem@0 call26701formal@$ptr@0 call26692formal@$ret@0))
(= $IomMem@10 $IomMem@9)) GeneratedUnifiedExit_correct@@0)))))))))))))))))))
(let ((anon6_Then_correct (=> (! (and %lbl%+26723 true) :lblpos +26723) (=> (and
(Jb $Efl@9)
(= ecx@2 call26653formal@$ret@0)) __L3_correct))))
(let ((anon5_Then_correct (=> (! (and %lbl%+26712 true) :lblpos +26712) (=> (and
(Jae $Efl@6@@0)
(= call26649formal@$ret@0 ebx)) (and
(! (or %lbl%@90792 (< 21 32)) :lblneg @90792)
(=> (< 21 32) (=> (and
(= call26653formal@$ret@0 (shr call26649formal@$ret@0 21))
(word call26653formal@$ret@0)
(= call26660formal@$x@0 (OpnReg call26653formal@$ret@0))
(= call26660formal@$y@0 (OpnReg 512))) (and
(! (or %lbl%@90841 (OpnOk $Mem@@3 call26660formal@$x@0)) :lblneg @90841)
(=> (OpnOk $Mem@@3 call26660formal@$x@0) (and
(! (or %lbl%@90846 (OpnOk $Mem@@3 call26660formal@$y@0)) :lblneg @90846)
(=> (OpnOk $Mem@@3 call26660formal@$y@0) (=> (FlagsCmp $Efl@9 (EvalOpn $Mem@@3 call26660formal@$x@0) (EvalOpn $Mem@@3 call26660formal@$y@0)) (and
anon6_Then_correct
anon6_Else_correct)))))))))))))
(let ((__L1_correct (=> (! (and %lbl%+26711 true) :lblpos +26711) (=> (and
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
 :qid |EntryCPb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@56))
))
(forall ((i@@57 Int) ) (! (=> (and
(TV i@@57)
(<= 0 i@@57)
(< i@@57 $entry@0)) (and
(= (select $IomMem@0 (+ (+ esi 4096) (* 8 i@@57))) 0)
(= (select $IomMem@0 (+ (+ (+ esi 4096) (* 8 i@@57)) 4)) 0)))
 :qid |EntryCPb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@57))
))
(forall ((i@@58 Int) ) (! (=> (and
(TV i@@58)
(<= 0 i@@58)
(< i@@58 $entry@0)) (and
(= (select $IomMem@0 (+ (+ esi 8192) (* 8 i@@58))) 0)
(= (select $IomMem@0 (+ (+ (+ esi 8192) (* 8 i@@58)) 4)) 0)))
 :qid |EntryCPb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@58))
))
(forall ((i@@59 Int) ) (! (=> (and
(TV i@@59)
(<= 0 i@@59)
(< i@@59 $entry@0)) (and
(= (select $IomMem@0 (+ (+ esi 12288) (* 8 i@@59))) 0)
(= (select $IomMem@0 (+ (+ (+ esi 12288) (* 8 i@@59)) 4)) 0)))
 :qid |EntryCPb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@59))
))
(= call26547formal@$x@0 (OpnReg edi@0))
(= call26547formal@$y@0 (OpnReg call26309formal@$ret@0))) (and
(! (or %lbl%@90726 (OpnOk $Mem@@3 call26547formal@$x@0)) :lblneg @90726)
(=> (OpnOk $Mem@@3 call26547formal@$x@0) (and
(! (or %lbl%@90731 (OpnOk $Mem@@3 call26547formal@$y@0)) :lblneg @90731)
(=> (OpnOk $Mem@@3 call26547formal@$y@0) (=> (FlagsCmp $Efl@6@@0 (EvalOpn $Mem@@3 call26547formal@$x@0) (EvalOpn $Mem@@3 call26547formal@$y@0)) (and
anon5_Then_correct
anon5_Else_correct)))))))))))
(let ((anon0_correct@@4 (=> (! (and %lbl%+26704 true) :lblpos +26704) (=> (and
(= call26299formal@$ret@0 esi)
(= call26302formal@$ret@0 call26299formal@$ret@0)) (and
(! (or %lbl%@89870 (word (+ call26302formal@$ret@0 4096))) :lblneg @89870)
(=> (word (+ call26302formal@$ret@0 4096)) (=> (= call26306formal@$ret@0 (+ call26302formal@$ret@0 4096)) (=> (and
(= call26309formal@$ret@0 call26306formal@$ret@0)
(= call26312formal@$ret@0 ebx)) (and
(! (or %lbl%@89944 (and
(Aligned call26299formal@$ret@0)
(TV call26299formal@$ret@0)
(TO 1)
(TO 2))) :lblneg @89944)
(=> (and
(Aligned call26299formal@$ret@0)
(TV call26299formal@$ret@0)
(TO 1)
(TO 2)) (and
(! (or %lbl%@89964 (= call26312formal@$ret@0 (+ ebx (* 0 4096)))) :lblneg @89964)
(=> (= call26312formal@$ret@0 (+ ebx (* 0 4096))) (and
(! (or %lbl%@89976 (= (q@and call26312formal@$ret@0 4095) 0)) :lblneg @89976)
(=> (= (q@and call26312formal@$ret@0 4095) 0) (and
(! (or %lbl%@89985 (= call26299formal@$ret@0 (+ esi (* 8 0)))) :lblneg @89985)
(=> (= call26299formal@$ret@0 (+ esi (* 8 0))) (and
(! (or %lbl%@89997 (and
(<= 0 0)
(<= 0 512))) :lblneg @89997)
(=> (and
(<= 0 0)
(<= 0 512)) (and
(! (or %lbl%@90009 (forall ((i@@60 Int) ) (! (=> (and
(TV i@@60)
(<= 0 i@@60)
(< i@@60 0)) (IoPageTableEntry (select $IomMem@@7 (+ esi (* 8 i@@60))) (select $IomMem@@7 (+ (+ esi (* 8 i@@60)) 4))))
 :qid |EntryCPb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@60))
))) :lblneg @90009)
(=> (forall ((i@@61 Int) ) (! (=> (and
(TV i@@61)
(<= 0 i@@61)
(< i@@61 0)) (IoPageTableEntry (select $IomMem@@7 (+ esi (* 8 i@@61))) (select $IomMem@@7 (+ (+ esi (* 8 i@@61)) 4))))
 :qid |EntryCPb.69:18|
 :skolemid |251|
 :pattern ( (TV i@@61))
)) (and
(! (or %lbl%@90072 (forall ((i@@62 Int) ) (! (=> (and
(TV i@@62)
(<= 0 i@@62)
(< i@@62 0)) (and
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@62))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 4096) (* 8 i@@62)) 4)) 0)))
 :qid |EntryCPb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@62))
))) :lblneg @90072)
(=> (forall ((i@@63 Int) ) (! (=> (and
(TV i@@63)
(<= 0 i@@63)
(< i@@63 0)) (and
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@63))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 4096) (* 8 i@@63)) 4)) 0)))
 :qid |EntryCPb.71:18|
 :skolemid |252|
 :pattern ( (TV i@@63))
)) (and
(! (or %lbl%@90151 (forall ((i@@64 Int) ) (! (=> (and
(TV i@@64)
(<= 0 i@@64)
(< i@@64 0)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@64))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@64)) 4)) 0)))
 :qid |EntryCPb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@64))
))) :lblneg @90151)
(=> (forall ((i@@65 Int) ) (! (=> (and
(TV i@@65)
(<= 0 i@@65)
(< i@@65 0)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@65))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@65)) 4)) 0)))
 :qid |EntryCPb.73:18|
 :skolemid |253|
 :pattern ( (TV i@@65))
)) (and
(! (or %lbl%@90230 (forall ((i@@66 Int) ) (! (=> (and
(TV i@@66)
(<= 0 i@@66)
(< i@@66 0)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@66))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@66)) 4)) 0)))
 :qid |EntryCPb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@66))
))) :lblneg @90230)
(=> (forall ((i@@67 Int) ) (! (=> (and
(TV i@@67)
(<= 0 i@@67)
(< i@@67 0)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@67))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@67)) 4)) 0)))
 :qid |EntryCPb.75:18|
 :skolemid |254|
 :pattern ( (TV i@@67))
)) __L1_correct))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@4 (=> (! (and %lbl%+89007 true) :lblpos +89007) (=> (and
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
(declare-fun %lbl%+27982 () Bool)
(declare-fun $Efl@16 () Int)
(declare-fun call27794formal@$ptr@0 () Int)
(declare-fun edi@0@@0 () Int)
(declare-fun %lbl%@96797 () Bool)
(declare-fun %lbl%@96800 () Bool)
(declare-fun %lbl%@96803 () Bool)
(declare-fun call27403formal@$ret@0 () Int)
(declare-fun %lbl%@96806 () Bool)
(declare-fun $IomMem@5@@0 () (Array Int Int))
(declare-fun $IomMem@0@@0 () (Array Int Int))
(declare-fun call27799formal@$ptr@0 () Int)
(declare-fun %lbl%@96847 () Bool)
(declare-fun %lbl%@96850 () Bool)
(declare-fun %lbl%@96853 () Bool)
(declare-fun %lbl%@96856 () Bool)
(declare-fun $IomMem@6@@0 () (Array Int Int))
(declare-fun call27804formal@$ptr@0 () Int)
(declare-fun %lbl%@96897 () Bool)
(declare-fun %lbl%@96900 () Bool)
(declare-fun %lbl%@96903 () Bool)
(declare-fun %lbl%@96906 () Bool)
(declare-fun $IomMem@7@@0 () (Array Int Int))
(declare-fun call27809formal@$ptr@0 () Int)
(declare-fun %lbl%@96947 () Bool)
(declare-fun %lbl%@96950 () Bool)
(declare-fun %lbl%@96953 () Bool)
(declare-fun %lbl%@96956 () Bool)
(declare-fun $IomMem@8@@0 () (Array Int Int))
(declare-fun %lbl%@96983 () Bool)
(declare-fun call27830formal@$ptr@0 () Int)
(declare-fun %lbl%@97018 () Bool)
(declare-fun %lbl%@97021 () Bool)
(declare-fun %lbl%@97024 () Bool)
(declare-fun call27417formal@$ret@0 () Int)
(declare-fun %lbl%@97027 () Bool)
(declare-fun $IomMem@9@@0 () (Array Int Int))
(declare-fun call27835formal@$ptr@0 () Int)
(declare-fun %lbl%@97068 () Bool)
(declare-fun %lbl%@97071 () Bool)
(declare-fun %lbl%@97074 () Bool)
(declare-fun %lbl%@97077 () Bool)
(declare-fun $IomMem@10@@0 () (Array Int Int))
(declare-fun call27840formal@$ptr@0 () Int)
(declare-fun %lbl%@97118 () Bool)
(declare-fun %lbl%@97121 () Bool)
(declare-fun %lbl%@97124 () Bool)
(declare-fun %lbl%@97127 () Bool)
(declare-fun $IomMem@11 () (Array Int Int))
(declare-fun call27845formal@$ptr@0 () Int)
(declare-fun %lbl%@97168 () Bool)
(declare-fun %lbl%@97171 () Bool)
(declare-fun %lbl%@97174 () Bool)
(declare-fun %lbl%@97177 () Bool)
(declare-fun $IomMem@12 () (Array Int Int))
(declare-fun $entry@1@@0 () Int)
(declare-fun $entry@0@@0 () Int)
(declare-fun %lbl%@97220 () Bool)
(declare-fun call27855formal@$ret@0 () Int)
(declare-fun %lbl%@97251 () Bool)
(declare-fun %lbl%@97283 () Bool)
(declare-fun %lbl%@97299 () Bool)
(declare-fun %lbl%@97311 () Bool)
(declare-fun %lbl%@97316 () Bool)
(declare-fun %lbl%@97421 () Bool)
(declare-fun %lbl%@97499 () Bool)
(declare-fun %lbl%@97577 () Bool)
(declare-fun %lbl%@97720 () Bool)
(declare-fun %lbl%+92425 () Bool)
(declare-fun %lbl%@97874 () Bool)
(declare-fun $IomMem@13 () (Array Int Int))
(declare-fun %lbl%@97879 () Bool)
(declare-fun %lbl%@97900 () Bool)
(declare-fun %lbl%@97913 () Bool)
(declare-fun %lbl%@97934 () Bool)
(declare-fun %lbl%@97947 () Bool)
(declare-fun %lbl%@98052 () Bool)
(declare-fun %lbl%@98130 () Bool)
(declare-fun %lbl%@98208 () Bool)
(declare-fun %lbl%@98352 () Bool)
(declare-fun %lbl%@98496 () Bool)
(declare-fun %lbl%@98509 () Bool)
(declare-fun %lbl%+27980 () Bool)
(declare-fun %lbl%@96082 () Bool)
(declare-fun %lbl%@96086 () Bool)
(declare-fun call27877formal@$ret@0 () Int)
(declare-fun %lbl%@96129 () Bool)
(declare-fun call27881formal@$ret@0 () Int)
(declare-fun %lbl%@96162 () Bool)
(declare-fun call27885formal@$ret@0 () Int)
(declare-fun call27888formal@$ret@0 () Int)
(declare-fun call27893formal@$ptr@0 () Int)
(declare-fun %lbl%@96225 () Bool)
(declare-fun %lbl%@96228 () Bool)
(declare-fun %lbl%@96231 () Bool)
(declare-fun %lbl%@96234 () Bool)
(declare-fun $IomMem@1@@0 () (Array Int Int))
(declare-fun call27896formal@$ret@0 () Int)
(declare-fun %lbl%@96288 () Bool)
(declare-fun call27900formal@$ret@0 () Int)
(declare-fun %lbl%@96321 () Bool)
(declare-fun call27904formal@$ret@0 () Int)
(declare-fun call27907formal@$ret@0 () Int)
(declare-fun call27912formal@$ptr@0 () Int)
(declare-fun %lbl%@96384 () Bool)
(declare-fun %lbl%@96387 () Bool)
(declare-fun %lbl%@96390 () Bool)
(declare-fun %lbl%@96393 () Bool)
(declare-fun $IomMem@2@@0 () (Array Int Int))
(declare-fun call27915formal@$ret@0 () Int)
(declare-fun call27365formal@$ret@0 () Int)
(declare-fun call27919formal@$ret@0 () Int)
(declare-fun call27922formal@$ret@0 () Int)
(declare-fun %lbl%@96495 () Bool)
(declare-fun call27941formal@$ret@0 () Int)
(declare-fun %lbl%@96545 () Bool)
(declare-fun call27945formal@$ret@0 () Int)
(declare-fun call27948formal@$ret@0 () Int)
(declare-fun call27951formal@$ret@0 () Int)
(declare-fun %lbl%@96620 () Bool)
(declare-fun %lbl%@96623 () Bool)
(declare-fun %lbl%@96626 () Bool)
(declare-fun %lbl%@96629 () Bool)
(declare-fun $IomMem@3@@0 () (Array Int Int))
(declare-fun call27957formal@$ret@0 () Int)
(declare-fun %lbl%@96681 () Bool)
(declare-fun call27961formal@$ret@0 () Int)
(declare-fun call27964formal@$ret@0 () Int)
(declare-fun call27969formal@$ptr@0 () Int)
(declare-fun %lbl%@96743 () Bool)
(declare-fun %lbl%@96746 () Bool)
(declare-fun %lbl%@96749 () Bool)
(declare-fun %lbl%@96752 () Bool)
(declare-fun $IomMem@4@@0 () (Array Int Int))
(declare-fun %lbl%+27979 () Bool)
(declare-fun call27783formal@$x@0 () T@opn)
(declare-fun call27783formal@$y@0 () T@opn)
(declare-fun call27389formal@$ret@0 () Int)
(declare-fun %lbl%@96043 () Bool)
(declare-fun %lbl%@96048 () Bool)
(declare-fun %lbl%+27972 () Bool)
(declare-fun call27372formal@$ret@0 () Int)
(declare-fun %lbl%@94410 () Bool)
(declare-fun call27376formal@$ret@0 () Int)
(declare-fun call27379formal@$ret@0 () Int)
(declare-fun call27382formal@$ret@0 () Int)
(declare-fun %lbl%@94485 () Bool)
(declare-fun call27386formal@$ret@0 () Int)
(declare-fun call27392formal@$ret@0 () Int)
(declare-fun %lbl%@94561 () Bool)
(declare-fun call27396formal@$ret@0 () Int)
(declare-fun %lbl%@94594 () Bool)
(declare-fun call27400formal@$ret@0 () Int)
(declare-fun call27406formal@$ret@0 () Int)
(declare-fun %lbl%@94670 () Bool)
(declare-fun call27410formal@$ret@0 () Int)
(declare-fun %lbl%@94703 () Bool)
(declare-fun call27414formal@$ret@0 () Int)
(declare-fun %lbl%@94752 () Bool)
(declare-fun %lbl%@94784 () Bool)
(declare-fun %lbl%@94800 () Bool)
(declare-fun %lbl%@94812 () Bool)
(declare-fun %lbl%@94818 () Bool)
(declare-fun %lbl%@94926 () Bool)
(declare-fun %lbl%@95006 () Bool)
(declare-fun %lbl%@95086 () Bool)
(declare-fun %lbl%@95233 () Bool)
(declare-fun %lbl%+92429 () Bool)
(push 1)
(set-info :boogie-vc-id setupIoTablesHelper2)
(assert (not
(let ((anon3_Else_correct (=> (! (and %lbl%+27982 true) :lblpos +27982) (=> (and
(not (Jae $Efl@16))
(= call27794formal@$ptr@0 (+ edi@0@@0 0))) (and
(! (or %lbl%@96797 (iomAddr call27794formal@$ptr@0)) :lblneg @96797)
(=> (iomAddr call27794formal@$ptr@0) (and
(! (or %lbl%@96800 (Aligned call27794formal@$ptr@0)) :lblneg @96800)
(=> (Aligned call27794formal@$ptr@0) (and
(! (or %lbl%@96803 (word call27403formal@$ret@0)) :lblneg @96803)
(=> (word call27403formal@$ret@0) (and
(! (or %lbl%@96806 (not $IomFrozen)) :lblneg @96806)
(=> (not $IomFrozen) (=> (and
(= $IomMem@5@@0 (store $IomMem@0@@0 call27794formal@$ptr@0 call27403formal@$ret@0))
(= call27799formal@$ptr@0 (+ edi@0@@0 4))) (and
(! (or %lbl%@96847 (iomAddr call27799formal@$ptr@0)) :lblneg @96847)
(=> (iomAddr call27799formal@$ptr@0) (and
(! (or %lbl%@96850 (Aligned call27799formal@$ptr@0)) :lblneg @96850)
(=> (Aligned call27799formal@$ptr@0) (and
(! (or %lbl%@96853 (word 0)) :lblneg @96853)
(=> (word 0) (and
(! (or %lbl%@96856 (not $IomFrozen)) :lblneg @96856)
(=> (not $IomFrozen) (=> (and
(= $IomMem@6@@0 (store $IomMem@5@@0 call27799formal@$ptr@0 0))
(= call27804formal@$ptr@0 (+ edi@0@@0 8))) (and
(! (or %lbl%@96897 (iomAddr call27804formal@$ptr@0)) :lblneg @96897)
(=> (iomAddr call27804formal@$ptr@0) (and
(! (or %lbl%@96900 (Aligned call27804formal@$ptr@0)) :lblneg @96900)
(=> (Aligned call27804formal@$ptr@0) (and
(! (or %lbl%@96903 (word 258)) :lblneg @96903)
(=> (word 258) (and
(! (or %lbl%@96906 (not $IomFrozen)) :lblneg @96906)
(=> (not $IomFrozen) (=> (and
(= $IomMem@7@@0 (store $IomMem@6@@0 call27804formal@$ptr@0 258))
(= call27809formal@$ptr@0 (+ edi@0@@0 12))) (and
(! (or %lbl%@96947 (iomAddr call27809formal@$ptr@0)) :lblneg @96947)
(=> (iomAddr call27809formal@$ptr@0) (and
(! (or %lbl%@96950 (Aligned call27809formal@$ptr@0)) :lblneg @96950)
(=> (Aligned call27809formal@$ptr@0) (and
(! (or %lbl%@96953 (word 0)) :lblneg @96953)
(=> (word 0) (and
(! (or %lbl%@96956 (not $IomFrozen)) :lblneg @96956)
(=> (not $IomFrozen) (=> (= $IomMem@8@@0 (store $IomMem@7@@0 call27809formal@$ptr@0 0)) (and
(! (or %lbl%@96983 (and
(TO 1024)
(TO 1025)
(TO 1026)
(TO 1027))) :lblneg @96983)
(=> (and
(TO 1024)
(TO 1025)
(TO 1026)
(TO 1027)) (=> (= call27830formal@$ptr@0 (+ edi@0@@0 4096)) (and
(! (or %lbl%@97018 (iomAddr call27830formal@$ptr@0)) :lblneg @97018)
(=> (iomAddr call27830formal@$ptr@0) (and
(! (or %lbl%@97021 (Aligned call27830formal@$ptr@0)) :lblneg @97021)
(=> (Aligned call27830formal@$ptr@0) (and
(! (or %lbl%@97024 (word call27417formal@$ret@0)) :lblneg @97024)
(=> (word call27417formal@$ret@0) (and
(! (or %lbl%@97027 (not $IomFrozen)) :lblneg @97027)
(=> (not $IomFrozen) (=> (and
(= $IomMem@9@@0 (store $IomMem@8@@0 call27830formal@$ptr@0 call27417formal@$ret@0))
(= call27835formal@$ptr@0 (+ edi@0@@0 4100))) (and
(! (or %lbl%@97068 (iomAddr call27835formal@$ptr@0)) :lblneg @97068)
(=> (iomAddr call27835formal@$ptr@0) (and
(! (or %lbl%@97071 (Aligned call27835formal@$ptr@0)) :lblneg @97071)
(=> (Aligned call27835formal@$ptr@0) (and
(! (or %lbl%@97074 (word 0)) :lblneg @97074)
(=> (word 0) (and
(! (or %lbl%@97077 (not $IomFrozen)) :lblneg @97077)
(=> (not $IomFrozen) (=> (and
(= $IomMem@10@@0 (store $IomMem@9@@0 call27835formal@$ptr@0 0))
(= call27840formal@$ptr@0 (+ edi@0@@0 4104))) (and
(! (or %lbl%@97118 (iomAddr call27840formal@$ptr@0)) :lblneg @97118)
(=> (iomAddr call27840formal@$ptr@0) (and
(! (or %lbl%@97121 (Aligned call27840formal@$ptr@0)) :lblneg @97121)
(=> (Aligned call27840formal@$ptr@0) (and
(! (or %lbl%@97124 (word 0)) :lblneg @97124)
(=> (word 0) (and
(! (or %lbl%@97127 (not $IomFrozen)) :lblneg @97127)
(=> (not $IomFrozen) (=> (and
(= $IomMem@11 (store $IomMem@10@@0 call27840formal@$ptr@0 0))
(= call27845formal@$ptr@0 (+ edi@0@@0 4108))) (and
(! (or %lbl%@97168 (iomAddr call27845formal@$ptr@0)) :lblneg @97168)
(=> (iomAddr call27845formal@$ptr@0) (and
(! (or %lbl%@97171 (Aligned call27845formal@$ptr@0)) :lblneg @97171)
(=> (Aligned call27845formal@$ptr@0) (and
(! (or %lbl%@97174 (word 0)) :lblneg @97174)
(=> (word 0) (and
(! (or %lbl%@97177 (not $IomFrozen)) :lblneg @97177)
(=> (not $IomFrozen) (=> (and
(= $IomMem@12 (store $IomMem@11 call27845formal@$ptr@0 0))
(= $entry@1@@0 (+ $entry@0@@0 1))) (and
(! (or %lbl%@97220 (word (+ edi@0@@0 16))) :lblneg @97220)
(=> (word (+ edi@0@@0 16)) (=> (= call27855formal@$ret@0 (+ edi@0@@0 16)) (and
(! (or %lbl%@97251 (and
(Aligned call27855formal@$ret@0)
(TV call27855formal@$ret@0)
(TO 1)
(TO 2)
(TO 3)
(TO 4))) :lblneg @97251)
(=> (and
(Aligned call27855formal@$ret@0)
(TV call27855formal@$ret@0)
(TO 1)
(TO 2)
(TO 3)
(TO 4)) (and
(! (or %lbl%@97283 (= call27855formal@$ret@0 (+ (+ esi 16384) (* 16 $entry@1@@0)))) :lblneg @97283)
(=> (= call27855formal@$ret@0 (+ (+ esi 16384) (* 16 $entry@1@@0))) (and
(! (or %lbl%@97299 (and
(<= 0 $entry@1@@0)
(<= $entry@1@@0 256))) :lblneg @97299)
(=> (and
(<= 0 $entry@1@@0)
(<= $entry@1@@0 256)) (and
(! (or %lbl%@97311 (IoPageTable $IomMem@12 esi)) :lblneg @97311)
(=> (IoPageTable $IomMem@12 esi) (and
(! (or %lbl%@97316 (forall ((i@@68 Int) ) (! (=> (and
(TV i@@68)
(<= 0 i@@68)
(< i@@68 512)) (and
(or
(= (select $IomMem@12 (+ (+ esi 4096) (* 8 i@@68))) 0)
(= (select $IomMem@12 (+ (+ esi 4096) (* 8 i@@68))) (+ esi 3)))
(= (select $IomMem@12 (+ (+ (+ esi 4096) (* 8 i@@68)) 4)) 0)))
 :qid |EntryCPb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@68))
))) :lblneg @97316)
(=> (forall ((i@@69 Int) ) (! (=> (and
(TV i@@69)
(<= 0 i@@69)
(< i@@69 512)) (and
(or
(= (select $IomMem@12 (+ (+ esi 4096) (* 8 i@@69))) 0)
(= (select $IomMem@12 (+ (+ esi 4096) (* 8 i@@69))) (+ esi 3)))
(= (select $IomMem@12 (+ (+ (+ esi 4096) (* 8 i@@69)) 4)) 0)))
 :qid |EntryCPb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@69))
)) (and
(! (or %lbl%@97421 (forall ((i@@70 Int) ) (! (=> (and
(TV i@@70)
(<= 0 i@@70)
(< i@@70 512)) (and
(= (select $IomMem@12 (+ (+ esi 8192) (* 8 i@@70))) 0)
(= (select $IomMem@12 (+ (+ (+ esi 8192) (* 8 i@@70)) 4)) 0)))
 :qid |EntryCPb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@70))
))) :lblneg @97421)
(=> (forall ((i@@71 Int) ) (! (=> (and
(TV i@@71)
(<= 0 i@@71)
(< i@@71 512)) (and
(= (select $IomMem@12 (+ (+ esi 8192) (* 8 i@@71))) 0)
(= (select $IomMem@12 (+ (+ (+ esi 8192) (* 8 i@@71)) 4)) 0)))
 :qid |EntryCPb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@71))
)) (and
(! (or %lbl%@97499 (forall ((i@@72 Int) ) (! (=> (and
(TV i@@72)
(<= 0 i@@72)
(< i@@72 512)) (and
(= (select $IomMem@12 (+ (+ esi 12288) (* 8 i@@72))) 0)
(= (select $IomMem@12 (+ (+ (+ esi 12288) (* 8 i@@72)) 4)) 0)))
 :qid |EntryCPb.178:18|
 :skolemid |265|
 :pattern ( (TV i@@72))
))) :lblneg @97499)
(=> (forall ((i@@73 Int) ) (! (=> (and
(TV i@@73)
(<= 0 i@@73)
(< i@@73 512)) (and
(= (select $IomMem@12 (+ (+ esi 12288) (* 8 i@@73))) 0)
(= (select $IomMem@12 (+ (+ (+ esi 12288) (* 8 i@@73)) 4)) 0)))
 :qid |EntryCPb.178:18|
 :skolemid |265|
 :pattern ( (TV i@@73))
)) (and
(! (or %lbl%@97577 (forall ((i@@74 Int) ) (! (=> (and
(TV i@@74)
(<= 0 i@@74)
(< i@@74 $entry@1@@0)) (and
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@74)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@74)) 4)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@74)) 8)) 258)
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@74)) 12)) 0)))
 :qid |EntryCPb.181:18|
 :skolemid |266|
 :pattern ( (TV i@@74))
))) :lblneg @97577)
(=> (forall ((i@@75 Int) ) (! (=> (and
(TV i@@75)
(<= 0 i@@75)
(< i@@75 $entry@1@@0)) (and
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@75)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@75)) 4)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@75)) 8)) 258)
(= (select $IomMem@12 (+ (+ (+ esi 16384) (* 16 i@@75)) 12)) 0)))
 :qid |EntryCPb.181:18|
 :skolemid |266|
 :pattern ( (TV i@@75))
)) (and
(! (or %lbl%@97720 (forall ((i@@76 Int) ) (! (=> (and
(TV i@@76)
(<= 0 i@@76)
(< i@@76 $entry@1@@0)) (and
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@76)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@76)) 4)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@76)) 8)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@76)) 12)) 0)))
 :qid |EntryCPb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@76))
))) :lblneg @97720)
(=> (forall ((i@@77 Int) ) (! (=> (and
(TV i@@77)
(<= 0 i@@77)
(< i@@77 $entry@1@@0)) (and
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@77)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@77)) 4)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@77)) 8)) 0)
(= (select $IomMem@12 (+ (+ (+ esi 20480) (* 16 i@@77)) 12)) 0)))
 :qid |EntryCPb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@77))
)) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((GeneratedUnifiedExit_correct@@1 (=> (! (and %lbl%+92425 true) :lblpos +92425) (and
(! (or %lbl%@97874 (IoPageTable $IomMem@13 esi)) :lblneg @97874)
(=> (IoPageTable $IomMem@13 esi) (and
(! (or %lbl%@97879 (= (select $IomMem@13 (+ esi 8192)) (+ (+ esi 4096) 3))) :lblneg @97879)
(=> (= (select $IomMem@13 (+ esi 8192)) (+ (+ esi 4096) 3)) (and
(! (or %lbl%@97900 (= (select $IomMem@13 (+ esi 8196)) 0)) :lblneg @97900)
(=> (= (select $IomMem@13 (+ esi 8196)) 0) (and
(! (or %lbl%@97913 (= (select $IomMem@13 (+ esi 12288)) (+ (+ esi 8192) 3))) :lblneg @97913)
(=> (= (select $IomMem@13 (+ esi 12288)) (+ (+ esi 8192) 3)) (and
(! (or %lbl%@97934 (= (select $IomMem@13 (+ esi 12292)) 0)) :lblneg @97934)
(=> (= (select $IomMem@13 (+ esi 12292)) 0) (and
(! (or %lbl%@97947 (forall ((i@@78 Int) ) (! (=> (and
(TV i@@78)
(<= 0 i@@78)
(< i@@78 512)) (and
(or
(= (select $IomMem@13 (+ (+ esi 4096) (* 8 i@@78))) 0)
(= (select $IomMem@13 (+ (+ esi 4096) (* 8 i@@78))) (+ esi 3)))
(= (select $IomMem@13 (+ (+ (+ esi 4096) (* 8 i@@78)) 4)) 0)))
 :qid |EntryCPb.138:17|
 :skolemid |258|
 :pattern ( (TV i@@78))
))) :lblneg @97947)
(=> (forall ((i@@79 Int) ) (! (=> (and
(TV i@@79)
(<= 0 i@@79)
(< i@@79 512)) (and
(or
(= (select $IomMem@13 (+ (+ esi 4096) (* 8 i@@79))) 0)
(= (select $IomMem@13 (+ (+ esi 4096) (* 8 i@@79))) (+ esi 3)))
(= (select $IomMem@13 (+ (+ (+ esi 4096) (* 8 i@@79)) 4)) 0)))
 :qid |EntryCPb.138:17|
 :skolemid |258|
 :pattern ( (TV i@@79))
)) (and
(! (or %lbl%@98052 (forall ((i@@80 Int) ) (! (=> (and
(TV i@@80)
(<= 1 i@@80)
(< i@@80 512)) (and
(= (select $IomMem@13 (+ (+ esi 8192) (* 8 i@@80))) 0)
(= (select $IomMem@13 (+ (+ (+ esi 8192) (* 8 i@@80)) 4)) 0)))
 :qid |EntryCPb.141:17|
 :skolemid |259|
 :pattern ( (TV i@@80))
))) :lblneg @98052)
(=> (forall ((i@@81 Int) ) (! (=> (and
(TV i@@81)
(<= 1 i@@81)
(< i@@81 512)) (and
(= (select $IomMem@13 (+ (+ esi 8192) (* 8 i@@81))) 0)
(= (select $IomMem@13 (+ (+ (+ esi 8192) (* 8 i@@81)) 4)) 0)))
 :qid |EntryCPb.141:17|
 :skolemid |259|
 :pattern ( (TV i@@81))
)) (and
(! (or %lbl%@98130 (forall ((i@@82 Int) ) (! (=> (and
(TV i@@82)
(<= 1 i@@82)
(< i@@82 512)) (and
(= (select $IomMem@13 (+ (+ esi 12288) (* 8 i@@82))) 0)
(= (select $IomMem@13 (+ (+ (+ esi 12288) (* 8 i@@82)) 4)) 0)))
 :qid |EntryCPb.144:17|
 :skolemid |260|
 :pattern ( (TV i@@82))
))) :lblneg @98130)
(=> (forall ((i@@83 Int) ) (! (=> (and
(TV i@@83)
(<= 1 i@@83)
(< i@@83 512)) (and
(= (select $IomMem@13 (+ (+ esi 12288) (* 8 i@@83))) 0)
(= (select $IomMem@13 (+ (+ (+ esi 12288) (* 8 i@@83)) 4)) 0)))
 :qid |EntryCPb.144:17|
 :skolemid |260|
 :pattern ( (TV i@@83))
)) (and
(! (or %lbl%@98208 (forall ((i@@84 Int) ) (! (=> (and
(TV i@@84)
(<= 0 i@@84)
(< i@@84 256)) (and
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@84)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@84)) 4)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@84)) 8)) 258)
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@84)) 12)) 0)))
 :qid |EntryCPb.147:17|
 :skolemid |261|
 :pattern ( (TV i@@84))
))) :lblneg @98208)
(=> (forall ((i@@85 Int) ) (! (=> (and
(TV i@@85)
(<= 0 i@@85)
(< i@@85 256)) (and
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@85)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@85)) 4)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@85)) 8)) 258)
(= (select $IomMem@13 (+ (+ (+ esi 16384) (* 16 i@@85)) 12)) 0)))
 :qid |EntryCPb.147:17|
 :skolemid |261|
 :pattern ( (TV i@@85))
)) (and
(! (or %lbl%@98352 (forall ((i@@86 Int) ) (! (=> (and
(TV i@@86)
(<= 0 i@@86)
(< i@@86 256)) (and
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@86)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@86)) 4)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@86)) 8)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@86)) 12)) 0)))
 :qid |EntryCPb.152:17|
 :skolemid |262|
 :pattern ( (TV i@@86))
))) :lblneg @98352)
(=> (forall ((i@@87 Int) ) (! (=> (and
(TV i@@87)
(<= 0 i@@87)
(< i@@87 256)) (and
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@87)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@87)) 4)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@87)) 8)) 0)
(= (select $IomMem@13 (+ (+ (+ esi 20480) (* 16 i@@87)) 12)) 0)))
 :qid |EntryCPb.152:17|
 :skolemid |262|
 :pattern ( (TV i@@87))
)) (and
(! (or %lbl%@98496 (= (select $IomMem@13 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)) :lblneg @98496)
(=> (= (select $IomMem@13 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE) (and
(! (or %lbl%@98509 (= (select $IomMem@13 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) :lblneg @98509)
(=> (= (select $IomMem@13 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo)) true)))))))))))))))))))))))))))
(let ((anon3_Then_correct (=> (! (and %lbl%+27980 true) :lblpos +27980) (=> (Jae $Efl@16) (and
(! (or %lbl%@96082 (TV esi)) :lblneg @96082)
(=> (TV esi) (and
(! (or %lbl%@96086 (and
(TV 0)
(TO 2048)
(TO 3072))) :lblneg @96086)
(=> (and
(TV 0)
(TO 2048)
(TO 3072)) (=> (= call27877formal@$ret@0 esi) (and
(! (or %lbl%@96129 (word (+ call27877formal@$ret@0 4096))) :lblneg @96129)
(=> (word (+ call27877formal@$ret@0 4096)) (=> (= call27881formal@$ret@0 (+ call27877formal@$ret@0 4096)) (and
(! (or %lbl%@96162 (word (+ call27881formal@$ret@0 3))) :lblneg @96162)
(=> (word (+ call27881formal@$ret@0 3)) (=> (= call27885formal@$ret@0 (+ call27881formal@$ret@0 3)) (=> (and
(= call27888formal@$ret@0 call27885formal@$ret@0)
(= call27893formal@$ptr@0 (+ esi 8192))) (and
(! (or %lbl%@96225 (iomAddr call27893formal@$ptr@0)) :lblneg @96225)
(=> (iomAddr call27893formal@$ptr@0) (and
(! (or %lbl%@96228 (Aligned call27893formal@$ptr@0)) :lblneg @96228)
(=> (Aligned call27893formal@$ptr@0) (and
(! (or %lbl%@96231 (word call27888formal@$ret@0)) :lblneg @96231)
(=> (word call27888formal@$ret@0) (and
(! (or %lbl%@96234 (not $IomFrozen)) :lblneg @96234)
(=> (not $IomFrozen) (=> (and
(= $IomMem@1@@0 (store $IomMem@0@@0 call27893formal@$ptr@0 call27888formal@$ret@0))
(= call27896formal@$ret@0 esi)) (and
(! (or %lbl%@96288 (word (+ call27896formal@$ret@0 8192))) :lblneg @96288)
(=> (word (+ call27896formal@$ret@0 8192)) (=> (= call27900formal@$ret@0 (+ call27896formal@$ret@0 8192)) (and
(! (or %lbl%@96321 (word (+ call27900formal@$ret@0 3))) :lblneg @96321)
(=> (word (+ call27900formal@$ret@0 3)) (=> (= call27904formal@$ret@0 (+ call27900formal@$ret@0 3)) (=> (and
(= call27907formal@$ret@0 call27904formal@$ret@0)
(= call27912formal@$ptr@0 (+ esi 12288))) (and
(! (or %lbl%@96384 (iomAddr call27912formal@$ptr@0)) :lblneg @96384)
(=> (iomAddr call27912formal@$ptr@0) (and
(! (or %lbl%@96387 (Aligned call27912formal@$ptr@0)) :lblneg @96387)
(=> (Aligned call27912formal@$ptr@0) (and
(! (or %lbl%@96390 (word call27907formal@$ret@0)) :lblneg @96390)
(=> (word call27907formal@$ret@0) (and
(! (or %lbl%@96393 (not $IomFrozen)) :lblneg @96393)
(=> (not $IomFrozen) (=> (= $IomMem@2@@0 (store $IomMem@1@@0 call27912formal@$ptr@0 call27907formal@$ret@0)) (=> (and
(= call27915formal@$ret@0 call27365formal@$ret@0)
(word (+ call27915formal@$ret@0 18874368))
(= call27919formal@$ret@0 (+ call27915formal@$ret@0 18874368))
(= call27922formal@$ret@0 call27919formal@$ret@0)) (and
(! (or %lbl%@96495 (and
(TV ?dmaLo)
(TO (- 0 1))
(TO (- 0 2)))) :lblneg @96495)
(=> (and
(TV ?dmaLo)
(TO (- 0 1))
(TO (- 0 2))) (=> (= call27941formal@$ret@0 call27365formal@$ret@0) (and
(! (or %lbl%@96545 (word (- call27941formal@$ret@0 8))) :lblneg @96545)
(=> (word (- call27941formal@$ret@0 8)) (=> (= call27945formal@$ret@0 (- call27941formal@$ret@0 8)) (=> (and
(= call27948formal@$ret@0 call27945formal@$ret@0)
(= call27951formal@$ret@0 ?BYTE_VECTOR_VTABLE)) (and
(! (or %lbl%@96620 (iomAddr call27948formal@$ret@0)) :lblneg @96620)
(=> (iomAddr call27948formal@$ret@0) (and
(! (or %lbl%@96623 (Aligned call27948formal@$ret@0)) :lblneg @96623)
(=> (Aligned call27948formal@$ret@0) (and
(! (or %lbl%@96626 (word call27951formal@$ret@0)) :lblneg @96626)
(=> (word call27951formal@$ret@0) (and
(! (or %lbl%@96629 (not $IomFrozen)) :lblneg @96629)
(=> (not $IomFrozen) (=> (and
(= $IomMem@3@@0 (store $IomMem@2@@0 call27948formal@$ret@0 call27951formal@$ret@0))
(= call27957formal@$ret@0 call27922formal@$ret@0)) (and
(! (or %lbl%@96681 (word (- call27957formal@$ret@0 call27365formal@$ret@0))) :lblneg @96681)
(=> (word (- call27957formal@$ret@0 call27365formal@$ret@0)) (=> (= call27961formal@$ret@0 (- call27957formal@$ret@0 call27365formal@$ret@0)) (=> (and
(= call27964formal@$ret@0 call27961formal@$ret@0)
(= call27969formal@$ptr@0 (+ call27948formal@$ret@0 4))) (and
(! (or %lbl%@96743 (iomAddr call27969formal@$ptr@0)) :lblneg @96743)
(=> (iomAddr call27969formal@$ptr@0) (and
(! (or %lbl%@96746 (Aligned call27969formal@$ptr@0)) :lblneg @96746)
(=> (Aligned call27969formal@$ptr@0) (and
(! (or %lbl%@96749 (word call27964formal@$ret@0)) :lblneg @96749)
(=> (word call27964formal@$ret@0) (and
(! (or %lbl%@96752 (not $IomFrozen)) :lblneg @96752)
(=> (not $IomFrozen) (=> (and
(= $IomMem@4@@0 (store $IomMem@3@@0 call27969formal@$ptr@0 call27964formal@$ret@0))
(= $IomMem@13 $IomMem@4@@0)) GeneratedUnifiedExit_correct@@1)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((__L4_correct (=> (! (and %lbl%+27979 true) :lblpos +27979) (=> (and
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
 :qid |EntryCPb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@88))
))
(forall ((i@@89 Int) ) (! (=> (and
(TV i@@89)
(<= 0 i@@89)
(< i@@89 512)) (and
(= (select $IomMem@0@@0 (+ (+ esi 8192) (* 8 i@@89))) 0)
(= (select $IomMem@0@@0 (+ (+ (+ esi 8192) (* 8 i@@89)) 4)) 0)))
 :qid |EntryCPb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@89))
))
(forall ((i@@90 Int) ) (! (=> (and
(TV i@@90)
(<= 0 i@@90)
(< i@@90 512)) (and
(= (select $IomMem@0@@0 (+ (+ esi 12288) (* 8 i@@90))) 0)
(= (select $IomMem@0@@0 (+ (+ (+ esi 12288) (* 8 i@@90)) 4)) 0)))
 :qid |EntryCPb.178:18|
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
 :qid |EntryCPb.181:18|
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
 :qid |EntryCPb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@92))
))
(= call27783formal@$x@0 (OpnReg edi@0@@0))
(= call27783formal@$y@0 (OpnReg call27389formal@$ret@0))) (and
(! (or %lbl%@96043 (OpnOk $Mem@@3 call27783formal@$x@0)) :lblneg @96043)
(=> (OpnOk $Mem@@3 call27783formal@$x@0) (and
(! (or %lbl%@96048 (OpnOk $Mem@@3 call27783formal@$y@0)) :lblneg @96048)
(=> (OpnOk $Mem@@3 call27783formal@$y@0) (=> (FlagsCmp $Efl@16 (EvalOpn $Mem@@3 call27783formal@$x@0) (EvalOpn $Mem@@3 call27783formal@$y@0)) (and
anon3_Then_correct
anon3_Else_correct)))))))))))
(let ((anon0_correct@@5 (=> (! (and %lbl%+27972 true) :lblpos +27972) (=> (and
(= call27365formal@$ret@0 ecx)
(= call27372formal@$ret@0 esi)) (and
(! (or %lbl%@94410 (word (+ call27372formal@$ret@0 16384))) :lblneg @94410)
(=> (word (+ call27372formal@$ret@0 16384)) (=> (= call27376formal@$ret@0 (+ call27372formal@$ret@0 16384)) (=> (and
(= call27379formal@$ret@0 call27376formal@$ret@0)
(= call27382formal@$ret@0 call27379formal@$ret@0)) (and
(! (or %lbl%@94485 (word (+ call27382formal@$ret@0 4096))) :lblneg @94485)
(=> (word (+ call27382formal@$ret@0 4096)) (=> (= call27386formal@$ret@0 (+ call27382formal@$ret@0 4096)) (=> (and
(= call27389formal@$ret@0 call27386formal@$ret@0)
(= call27392formal@$ret@0 esi)) (and
(! (or %lbl%@94561 (word (+ call27392formal@$ret@0 12288))) :lblneg @94561)
(=> (word (+ call27392formal@$ret@0 12288)) (=> (= call27396formal@$ret@0 (+ call27392formal@$ret@0 12288)) (and
(! (or %lbl%@94594 (word (+ call27396formal@$ret@0 3))) :lblneg @94594)
(=> (word (+ call27396formal@$ret@0 3)) (=> (= call27400formal@$ret@0 (+ call27396formal@$ret@0 3)) (=> (and
(= call27403formal@$ret@0 call27400formal@$ret@0)
(= call27406formal@$ret@0 esi)) (and
(! (or %lbl%@94670 (word (+ call27406formal@$ret@0 16384))) :lblneg @94670)
(=> (word (+ call27406formal@$ret@0 16384)) (=> (= call27410formal@$ret@0 (+ call27406formal@$ret@0 16384)) (and
(! (or %lbl%@94703 (word (+ call27410formal@$ret@0 1))) :lblneg @94703)
(=> (word (+ call27410formal@$ret@0 1)) (=> (and
(= call27414formal@$ret@0 (+ call27410formal@$ret@0 1))
(= call27417formal@$ret@0 call27414formal@$ret@0)) (and
(! (or %lbl%@94752 (and
(Aligned call27379formal@$ret@0)
(TV call27379formal@$ret@0)
(TO 1)
(TO 2)
(TO 3)
(TO 4))) :lblneg @94752)
(=> (and
(Aligned call27379formal@$ret@0)
(TV call27379formal@$ret@0)
(TO 1)
(TO 2)
(TO 3)
(TO 4)) (and
(! (or %lbl%@94784 (= call27379formal@$ret@0 (+ (+ esi 16384) (* 16 0)))) :lblneg @94784)
(=> (= call27379formal@$ret@0 (+ (+ esi 16384) (* 16 0))) (and
(! (or %lbl%@94800 (and
(<= 0 0)
(<= 0 256))) :lblneg @94800)
(=> (and
(<= 0 0)
(<= 0 256)) (and
(! (or %lbl%@94812 (IoPageTable $IomMem@@7 esi)) :lblneg @94812)
(=> (IoPageTable $IomMem@@7 esi) (and
(! (or %lbl%@94818 (forall ((i@@93 Int) ) (! (=> (and
(TV i@@93)
(<= 0 i@@93)
(< i@@93 512)) (and
(or
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@93))) 0)
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@93))) (+ esi 3)))
(= (select $IomMem@@7 (+ (+ (+ esi 4096) (* 8 i@@93)) 4)) 0)))
 :qid |EntryCPb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@93))
))) :lblneg @94818)
(=> (forall ((i@@94 Int) ) (! (=> (and
(TV i@@94)
(<= 0 i@@94)
(< i@@94 512)) (and
(or
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@94))) 0)
(= (select $IomMem@@7 (+ (+ esi 4096) (* 8 i@@94))) (+ esi 3)))
(= (select $IomMem@@7 (+ (+ (+ esi 4096) (* 8 i@@94)) 4)) 0)))
 :qid |EntryCPb.172:18|
 :skolemid |263|
 :pattern ( (TV i@@94))
)) (and
(! (or %lbl%@94926 (forall ((i@@95 Int) ) (! (=> (and
(TV i@@95)
(<= 0 i@@95)
(< i@@95 512)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@95))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@95)) 4)) 0)))
 :qid |EntryCPb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@95))
))) :lblneg @94926)
(=> (forall ((i@@96 Int) ) (! (=> (and
(TV i@@96)
(<= 0 i@@96)
(< i@@96 512)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@96))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@96)) 4)) 0)))
 :qid |EntryCPb.175:18|
 :skolemid |264|
 :pattern ( (TV i@@96))
)) (and
(! (or %lbl%@95006 (forall ((i@@97 Int) ) (! (=> (and
(TV i@@97)
(<= 0 i@@97)
(< i@@97 512)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@97))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@97)) 4)) 0)))
 :qid |EntryCPb.178:18|
 :skolemid |265|
 :pattern ( (TV i@@97))
))) :lblneg @95006)
(=> (forall ((i@@98 Int) ) (! (=> (and
(TV i@@98)
(<= 0 i@@98)
(< i@@98 512)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@98))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@98)) 4)) 0)))
 :qid |EntryCPb.178:18|
 :skolemid |265|
 :pattern ( (TV i@@98))
)) (and
(! (or %lbl%@95086 (forall ((i@@99 Int) ) (! (=> (and
(TV i@@99)
(<= 0 i@@99)
(< i@@99 0)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@99)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@99)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@99)) 8)) 258)
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@99)) 12)) 0)))
 :qid |EntryCPb.181:18|
 :skolemid |266|
 :pattern ( (TV i@@99))
))) :lblneg @95086)
(=> (forall ((i@@100 Int) ) (! (=> (and
(TV i@@100)
(<= 0 i@@100)
(< i@@100 0)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@100)) 0)) (+ (+ esi 12288) 3))
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@100)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@100)) 8)) 258)
(= (select $IomMem@@7 (+ (+ (+ esi 16384) (* 16 i@@100)) 12)) 0)))
 :qid |EntryCPb.181:18|
 :skolemid |266|
 :pattern ( (TV i@@100))
)) (and
(! (or %lbl%@95233 (forall ((i@@101 Int) ) (! (=> (and
(TV i@@101)
(<= 0 i@@101)
(< i@@101 0)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@101)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@101)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@101)) 8)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@101)) 12)) 0)))
 :qid |EntryCPb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@101))
))) :lblneg @95233)
(=> (forall ((i@@102 Int) ) (! (=> (and
(TV i@@102)
(<= 0 i@@102)
(< i@@102 0)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@102)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@102)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@102)) 8)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@102)) 12)) 0)))
 :qid |EntryCPb.186:18|
 :skolemid |267|
 :pattern ( (TV i@@102))
)) __L4_correct)))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@5 (=> (! (and %lbl%+92429 true) :lblpos +92429) (=> (and
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
 :qid |EntryCPb.113:18|
 :skolemid |255|
 :pattern ( (TV i@@103))
))
(forall ((i@@104 Int) ) (! (=> (and
(TV i@@104)
(<= 0 i@@104)
(< i@@104 512)) (and
(= (select $IomMem@@7 (+ (+ esi 8192) (* 8 i@@104))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 8192) (* 8 i@@104)) 4)) 0)))
 :qid |EntryCPb.116:18|
 :skolemid |256|
 :pattern ( (TV i@@104))
))
(forall ((i@@105 Int) ) (! (=> (and
(TV i@@105)
(<= 0 i@@105)
(< i@@105 512)) (and
(= (select $IomMem@@7 (+ (+ esi 12288) (* 8 i@@105))) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 12288) (* 8 i@@105)) 4)) 0)))
 :qid |EntryCPb.119:18|
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
(declare-fun %lbl%+28092 () Bool)
(declare-fun %lbl%@98884 () Bool)
(declare-fun %lbl%+98528 () Bool)
(push 1)
(set-info :boogie-vc-id setupIoTablesHelper3)
(assert (not
(let ((anon0_correct@@6 (=> (! (and %lbl%+28092 true) :lblpos +28092) (and
(! (or %lbl%@98884 (IoRootTable $IomMem@@7 (+ esi 20480))) :lblneg @98884)
(=> (IoRootTable $IomMem@@7 (+ esi 20480)) true)))))
(let ((PreconditionGeneratedEntry_correct@@6 (=> (! (and %lbl%+98528 true) :lblpos +98528) (=> (= (q@and (+ esi 20480) 4095) 0) (=> (and
(IoContextTable $IomMem@@7 (+ esi 16384))
(forall ((i@@106 Int) ) (! (=> (and
(TV i@@106)
(<= 0 i@@106)
(< i@@106 256)) (and
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@106)) 0)) (+ (+ esi 16384) 1))
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@106)) 4)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@106)) 8)) 0)
(= (select $IomMem@@7 (+ (+ (+ esi 20480) (* 16 i@@106)) 12)) 0)))
 :qid |EntryCPb.227:18|
 :skolemid |268|
 :pattern ( (TV i@@106))
))) anon0_correct@@6)))))
PreconditionGeneratedEntry_correct@@6))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+28397 () Bool)
(declare-fun %lbl%@99423 () Bool)
(declare-fun %lbl%@99585 () Bool)
(declare-fun call28214formal@$ret@0 () Int)
(declare-fun call28217formal@$ret@0 () Int)
(declare-fun %lbl%@99642 () Bool)
(declare-fun call28221formal@$ret@0 () Int)
(declare-fun call28230formal@$ptr@0 () Int)
(declare-fun %lbl%@99685 () Bool)
(declare-fun %lbl%@99715 () Bool)
(declare-fun $sMem@0 () (Array Int Int))
(declare-fun call28235formal@$ptr@0 () Int)
(declare-fun %lbl%@99778 () Bool)
(declare-fun %lbl%@99781 () Bool)
(declare-fun $Mem@0 () (Array Int Int))
(declare-fun %lbl%@99814 () Bool)
(declare-fun call28239formal@$ret@0 () Int)
(declare-fun call28242formal@$ret@0 () Int)
(declare-fun %lbl%@99868 () Bool)
(declare-fun call28246formal@$ret@0 () Int)
(declare-fun call28249formal@$ret@0 () Int)
(declare-fun %lbl%@99919 () Bool)
(declare-fun call28260formal@$x@0 () Int)
(declare-fun %lbl%@99985 () Bool)
(declare-fun %lbl%@99994 () Bool)
(declare-fun call28269formal@$x@0 () Int)
(declare-fun %lbl%@100040 () Bool)
(declare-fun %lbl%@100049 () Bool)
(declare-fun call28278formal@$x@0 () Int)
(declare-fun %lbl%@100095 () Bool)
(declare-fun %lbl%@100104 () Bool)
(declare-fun call28287formal@$x@0 () Int)
(declare-fun %lbl%@100150 () Bool)
(declare-fun %lbl%@100159 () Bool)
(declare-fun call28296formal@$x@0 () Int)
(declare-fun %lbl%@100205 () Bool)
(declare-fun %lbl%@100214 () Bool)
(declare-fun call28305formal@$x@0 () Int)
(declare-fun %lbl%@100260 () Bool)
(declare-fun %lbl%@100269 () Bool)
(declare-fun call28309formal@$ret@0 () Int)
(declare-fun %lbl%@100331 () Bool)
(declare-fun call28313formal@$ret@0 () Int)
(declare-fun %lbl%@100359 () Bool)
(declare-fun call28321formal@$ptr@0 () Int)
(declare-fun %lbl%@100373 () Bool)
(declare-fun %lbl%@100401 () Bool)
(declare-fun call28326formal@$ptr@0 () Int)
(declare-fun %lbl%@100425 () Bool)
(declare-fun call28326formal@$val@0 () Int)
(declare-fun %lbl%@100458 () Bool)
(declare-fun call28330formal@$ret@0 () Int)
(declare-fun call28333formal@$ret@0 () Int)
(declare-fun call28336formal@$ret@0 () Int)
(declare-fun %lbl%@100533 () Bool)
(declare-fun call28340formal@$ret@0 () Int)
(declare-fun call28343formal@$ret@0 () Int)
(declare-fun %lbl%@100584 () Bool)
(declare-fun call28349formal@$ret@0 () Int)
(declare-fun %lbl%@100679 () Bool)
(declare-fun call28353formal@$ret@0 () Int)
(declare-fun %lbl%@100707 () Bool)
(declare-fun %lbl%@100723 () Bool)
(declare-fun %lbl%@100729 () Bool)
(declare-fun %lbl%@100738 () Bool)
(declare-fun %lbl%@100758 () Bool)
(declare-fun %lbl%@100761 () Bool)
(declare-fun %lbl%@100777 () Bool)
(declare-fun %lbl%@100790 () Bool)
(declare-fun %lbl%@100803 () Bool)
(declare-fun %lbl%@100816 () Bool)
(declare-fun %lbl%@100829 () Bool)
(declare-fun $IomMem@0@@1 () (Array Int Int))
(declare-fun call28358formal@$ptr@0 () Int)
(declare-fun %lbl%@101150 () Bool)
(declare-fun %lbl%@101178 () Bool)
(declare-fun call28363formal@$ptr@0 () Int)
(declare-fun %lbl%@101202 () Bool)
(declare-fun call28363formal@$val@0 () Int)
(declare-fun %lbl%@101230 () Bool)
(declare-fun %lbl%@101240 () Bool)
(declare-fun %lbl%@101244 () Bool)
(declare-fun %lbl%@101250 () Bool)
(declare-fun %lbl%@101255 () Bool)
(declare-fun %lbl%@101259 () Bool)
(declare-fun %lbl%@101360 () Bool)
(declare-fun %lbl%@101436 () Bool)
(declare-fun %lbl%@101512 () Bool)
(declare-fun %lbl%@101515 () Bool)
(declare-fun %lbl%@101522 () Bool)
(declare-fun %lbl%@101538 () Bool)
(declare-fun %lbl%@101551 () Bool)
(declare-fun %lbl%@101564 () Bool)
(declare-fun %lbl%@101577 () Bool)
(declare-fun %lbl%@101590 () Bool)
(declare-fun %lbl%@101603 () Bool)
(declare-fun $IomMem@1@@1 () (Array Int Int))
(declare-fun %lbl%@102279 () Bool)
(declare-fun %lbl%@102292 () Bool)
(declare-fun %lbl%@102300 () Bool)
(declare-fun call28368formal@$ret@0 () Int)
(declare-fun %lbl%@102473 () Bool)
(declare-fun call28372formal@$ret@0 () Int)
(declare-fun %lbl%@102506 () Bool)
(declare-fun call28376formal@$ret@0 () Int)
(declare-fun call28391formal@$oldMem@0 () (Array Int Int))
(declare-fun call28391formal@$oldSMem@0 () (Array Int Int))
(declare-fun call28391formal@$oldDMem@0 () (Array Int Int))
(declare-fun call28391formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call28391formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call28391formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call28391formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@102588 () Bool)
(declare-fun %lbl%@102616 () Bool)
(declare-fun %lbl%@102639 () Bool)
(declare-fun %lbl%@102649 () Bool)
(declare-fun call28394formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@102680 () Bool)
(declare-fun %lbl%@102689 () Bool)
(declare-fun esp@0@@1 () Int)
(declare-fun %lbl%@102718 () Bool)
(declare-fun %lbl%@102722 () Bool)
(declare-fun %lbl%@102735 () Bool)
(declare-fun %lbl%@102752 () Bool)
(declare-fun %lbl%@102780 () Bool)
(declare-fun %lbl%+98895 () Bool)
(push 1)
(set-info :boogie-vc-id SetupIoTables)
(assert (not
(let ((anon0_correct@@7 (=> (! (and %lbl%+28397 true) :lblpos +28397) (and
(! (or %lbl%@99423 (Aligned esp)) :lblneg @99423)
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
(! (or %lbl%@99585 (word (- esp 4))) :lblneg @99585)
(=> (word (- esp 4)) (=> (and
(= call28214formal@$ret@0 (- esp 4))
(= call28217formal@$ret@0 ecx)) (and
(! (or %lbl%@99642 (word (+ call28217formal@$ret@0 65536))) :lblneg @99642)
(=> (word (+ call28217formal@$ret@0 65536)) (=> (and
(= call28221formal@$ret@0 (+ call28217formal@$ret@0 65536))
(= call28230formal@$ptr@0 (+ call28214formal@$ret@0 0))) (and
(! (or %lbl%@99685 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @99685)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@99715 (sAddr call28230formal@$ptr@0)) :lblneg @99715)
(=> (sAddr call28230formal@$ptr@0) (=> (MemInv (store $Mem@@3 call28230formal@$ptr@0 call28221formal@$ret@0) $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0 (store $sMem@@5 call28230formal@$ptr@0 call28221formal@$ret@0))
(= call28235formal@$ptr@0 (+ call28214formal@$ret@0 0))) (and
(! (or %lbl%@99778 (PtrOk call28235formal@$ptr@0)) :lblneg @99778)
(=> (PtrOk call28235formal@$ptr@0) (and
(! (or %lbl%@99781 (word call28221formal@$ret@0)) :lblneg @99781)
(=> (word call28221formal@$ret@0) (=> (= $Mem@0 (store $Mem@@3 call28235formal@$ptr@0 call28221formal@$ret@0)) (and
(! (or %lbl%@99814 (word (+ ecx 4096))) :lblneg @99814)
(=> (word (+ ecx 4096)) (=> (and
(= call28239formal@$ret@0 (+ ecx 4096))
(= call28242formal@$ret@0 call28239formal@$ret@0)) (and
(! (or %lbl%@99868 (word (+ call28242formal@$ret@0 4096))) :lblneg @99868)
(=> (word (+ call28242formal@$ret@0 4096)) (=> (and
(= call28246formal@$ret@0 (+ call28242formal@$ret@0 4096))
(= call28249formal@$ret@0 call28246formal@$ret@0)) (and
(! (or %lbl%@99919 (and
(word call28239formal@$ret@0)
(word (- call28239formal@$ret@0 4096)))) :lblneg @99919)
(=> (and
(word call28239formal@$ret@0)
(word (- call28239formal@$ret@0 4096))) (=> (= (q@and (- call28239formal@$ret@0 (q@and call28239formal@$ret@0 4095)) 4095) 0) (=> (and
(<= 0 (q@and call28239formal@$ret@0 4095))
(<= (q@and call28239formal@$ret@0 4095) 4095)
(= call28260formal@$x@0 (+ (- call28239formal@$ret@0 (q@and call28239formal@$ret@0 4095)) 0))) (and
(! (or %lbl%@99985 (= (q@and call28260formal@$x@0 4095) 0)) :lblneg @99985)
(=> (= (q@and call28260formal@$x@0 4095) 0) (and
(! (or %lbl%@99994 (and
(word call28260formal@$x@0)
(word (+ call28260formal@$x@0 4096)))) :lblneg @99994)
(=> (and
(word call28260formal@$x@0)
(word (+ call28260formal@$x@0 4096))) (=> (= (q@and (+ call28260formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28260formal@$x@0)
(= call28269formal@$x@0 (+ (- call28239formal@$ret@0 (q@and call28239formal@$ret@0 4095)) 4096))) (and
(! (or %lbl%@100040 (= (q@and call28269formal@$x@0 4095) 0)) :lblneg @100040)
(=> (= (q@and call28269formal@$x@0 4095) 0) (and
(! (or %lbl%@100049 (and
(word call28269formal@$x@0)
(word (+ call28269formal@$x@0 4096)))) :lblneg @100049)
(=> (and
(word call28269formal@$x@0)
(word (+ call28269formal@$x@0 4096))) (=> (= (q@and (+ call28269formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28269formal@$x@0)
(= call28278formal@$x@0 (+ (- call28239formal@$ret@0 (q@and call28239formal@$ret@0 4095)) 8192))) (and
(! (or %lbl%@100095 (= (q@and call28278formal@$x@0 4095) 0)) :lblneg @100095)
(=> (= (q@and call28278formal@$x@0 4095) 0) (and
(! (or %lbl%@100104 (and
(word call28278formal@$x@0)
(word (+ call28278formal@$x@0 4096)))) :lblneg @100104)
(=> (and
(word call28278formal@$x@0)
(word (+ call28278formal@$x@0 4096))) (=> (= (q@and (+ call28278formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28278formal@$x@0)
(= call28287formal@$x@0 (+ (- call28239formal@$ret@0 (q@and call28239formal@$ret@0 4095)) 12288))) (and
(! (or %lbl%@100150 (= (q@and call28287formal@$x@0 4095) 0)) :lblneg @100150)
(=> (= (q@and call28287formal@$x@0 4095) 0) (and
(! (or %lbl%@100159 (and
(word call28287formal@$x@0)
(word (+ call28287formal@$x@0 4096)))) :lblneg @100159)
(=> (and
(word call28287formal@$x@0)
(word (+ call28287formal@$x@0 4096))) (=> (= (q@and (+ call28287formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28287formal@$x@0)
(= call28296formal@$x@0 (+ (- call28239formal@$ret@0 (q@and call28239formal@$ret@0 4095)) 16384))) (and
(! (or %lbl%@100205 (= (q@and call28296formal@$x@0 4095) 0)) :lblneg @100205)
(=> (= (q@and call28296formal@$x@0 4095) 0) (and
(! (or %lbl%@100214 (and
(word call28296formal@$x@0)
(word (+ call28296formal@$x@0 4096)))) :lblneg @100214)
(=> (and
(word call28296formal@$x@0)
(word (+ call28296formal@$x@0 4096))) (=> (= (q@and (+ call28296formal@$x@0 4096) 4095) 0) (=> (and
(Aligned call28296formal@$x@0)
(= call28305formal@$x@0 (+ (- call28239formal@$ret@0 (q@and call28239formal@$ret@0 4095)) 20480))) (and
(! (or %lbl%@100260 (= (q@and call28305formal@$x@0 4095) 0)) :lblneg @100260)
(=> (= (q@and call28305formal@$x@0 4095) 0) (and
(! (or %lbl%@100269 (and
(word call28305formal@$x@0)
(word (+ call28305formal@$x@0 4096)))) :lblneg @100269)
(=> (and
(word call28305formal@$x@0)
(word (+ call28305formal@$x@0 4096))) (=> (and
(= (q@and (+ call28305formal@$x@0 4096) 4095) 0)
(Aligned call28305formal@$x@0)
(= call28309formal@$ret@0 (q@and call28239formal@$ret@0 4095))
(word call28309formal@$ret@0)) (and
(! (or %lbl%@100331 (word (- call28249formal@$ret@0 call28309formal@$ret@0))) :lblneg @100331)
(=> (word (- call28249formal@$ret@0 call28309formal@$ret@0)) (=> (= call28313formal@$ret@0 (- call28249formal@$ret@0 call28309formal@$ret@0)) (and
(! (or %lbl%@100359 (TV call28313formal@$ret@0)) :lblneg @100359)
(=> (TV call28313formal@$ret@0) (=> (= call28321formal@$ptr@0 (+ call28214formal@$ret@0 0)) (and
(! (or %lbl%@100373 (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @100373)
(=> (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@100401 (sAddr call28321formal@$ptr@0)) :lblneg @100401)
(=> (sAddr call28321formal@$ptr@0) (=> (and
(= (select $Mem@0 call28321formal@$ptr@0) (select $sMem@0 call28321formal@$ptr@0))
(= call28326formal@$ptr@0 (+ call28214formal@$ret@0 0))) (and
(! (or %lbl%@100425 (PtrOk call28326formal@$ptr@0)) :lblneg @100425)
(=> (PtrOk call28326formal@$ptr@0) (=> (and
(word call28326formal@$val@0)
(= call28326formal@$val@0 (select $Mem@0 call28326formal@$ptr@0))) (and
(! (or %lbl%@100458 (word (+ call28326formal@$val@0 2097152))) :lblneg @100458)
(=> (word (+ call28326formal@$val@0 2097152)) (=> (= call28330formal@$ret@0 (+ call28326formal@$val@0 2097152)) (=> (and
(= call28333formal@$ret@0 call28330formal@$ret@0)
(= call28336formal@$ret@0 call28333formal@$ret@0)) (and
(! (or %lbl%@100533 (word (+ call28336formal@$ret@0 2097152))) :lblneg @100533)
(=> (word (+ call28336formal@$ret@0 2097152)) (=> (and
(= call28340formal@$ret@0 (+ call28336formal@$ret@0 2097152))
(= call28343formal@$ret@0 call28340formal@$ret@0)) (and
(! (or %lbl%@100584 (and
(word call28333formal@$ret@0)
(word (- call28333formal@$ret@0 2097152))
(word (+ call28333formal@$ret@0 2097152)))) :lblneg @100584)
(=> (and
(word call28333formal@$ret@0)
(word (- call28333formal@$ret@0 2097152))
(word (+ call28333formal@$ret@0 2097152))) (=> (= (q@and (- (+ call28333formal@$ret@0 2097152) (q@and call28333formal@$ret@0 2097151)) 4095) 0) (=> (and
(<= 0 (q@and call28333formal@$ret@0 2097151))
(<= (q@and call28333formal@$ret@0 2097151) 2097151)
(= call28349formal@$ret@0 (q@and call28333formal@$ret@0 2097151))
(word call28349formal@$ret@0)) (and
(! (or %lbl%@100679 (word (- call28343formal@$ret@0 call28349formal@$ret@0))) :lblneg @100679)
(=> (word (- call28343formal@$ret@0 call28349formal@$ret@0)) (=> (= call28353formal@$ret@0 (- call28343formal@$ret@0 call28349formal@$ret@0)) (and
(! (or %lbl%@100707 (and
(word ?iomLo)
(word ?iomHi)
(word ?dmaHi))) :lblneg @100707)
(=> (and
(word ?iomLo)
(word ?iomHi)
(word ?dmaHi)) (and
(! (or %lbl%@100723 (= ?dmaLo ?iomHi)) :lblneg @100723)
(=> (= ?dmaLo ?iomHi) (and
(! (or %lbl%@100729 (= (q@and call28353formal@$ret@0 4095) 0)) :lblneg @100729)
(=> (= (q@and call28353formal@$ret@0 4095) 0) (and
(! (or %lbl%@100738 (and
(<= ?dmaLo call28353formal@$ret@0)
(<= (+ (+ call28353formal@$ret@0 2097152) 4096) ?dmaHi))) :lblneg @100738)
(=> (and
(<= ?dmaLo call28353formal@$ret@0)
(<= (+ (+ call28353formal@$ret@0 2097152) 4096) ?dmaHi)) (and
(! (or %lbl%@100758 (Aligned call28313formal@$ret@0)) :lblneg @100758)
(=> (Aligned call28313formal@$ret@0) (and
(! (or %lbl%@100761 (and
(<= ?iomLo call28313formal@$ret@0)
(<= (+ call28313formal@$ret@0 32768) ?iomHi))) :lblneg @100761)
(=> (and
(<= ?iomLo call28313formal@$ret@0)
(<= (+ call28313formal@$ret@0 32768) ?iomHi)) (and
(! (or %lbl%@100777 (= (q@and (+ call28313formal@$ret@0 0) 4095) 0)) :lblneg @100777)
(=> (= (q@and (+ call28313formal@$ret@0 0) 4095) 0) (and
(! (or %lbl%@100790 (= (q@and (+ call28313formal@$ret@0 4096) 4095) 0)) :lblneg @100790)
(=> (= (q@and (+ call28313formal@$ret@0 4096) 4095) 0) (and
(! (or %lbl%@100803 (= (q@and (+ call28313formal@$ret@0 8192) 4095) 0)) :lblneg @100803)
(=> (= (q@and (+ call28313formal@$ret@0 8192) 4095) 0) (and
(! (or %lbl%@100816 (= (q@and (+ call28313formal@$ret@0 12288) 4095) 0)) :lblneg @100816)
(=> (= (q@and (+ call28313formal@$ret@0 12288) 4095) 0) (and
(! (or %lbl%@100829 (not $IomFrozen)) :lblneg @100829)
(=> (not $IomFrozen) (=> (IoPageTable $IomMem@0@@1 call28313formal@$ret@0) (=> (and
(forall ((i@@107 Int) ) (! (=> (and
(TV i@@107)
(<= 0 i@@107)
(< i@@107 512)) (and
(or
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 4096) (* 8 i@@107))) 0)
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 4096) (* 8 i@@107))) (+ call28313formal@$ret@0 3)))
(= (select $IomMem@0@@1 (+ (+ (+ call28313formal@$ret@0 4096) (* 8 i@@107)) 4)) 0)))
 :qid |EntryCPb.49:17|
 :skolemid |248|
 :pattern ( (TV i@@107))
))
(forall ((i@@108 Int) ) (! (=> (and
(TV i@@108)
(<= 0 i@@108)
(< i@@108 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 8192) (* 8 i@@108))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28313formal@$ret@0 8192) (* 8 i@@108)) 4)) 0)))
 :qid |EntryCPb.52:17|
 :skolemid |249|
 :pattern ( (TV i@@108))
))
(forall ((i@@109 Int) ) (! (=> (and
(TV i@@109)
(<= 0 i@@109)
(< i@@109 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 12288) (* 8 i@@109))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28313formal@$ret@0 12288) (* 8 i@@109)) 4)) 0)))
 :qid |EntryCPb.55:17|
 :skolemid |250|
 :pattern ( (TV i@@109))
))
(= call28358formal@$ptr@0 (+ call28214formal@$ret@0 0))) (and
(! (or %lbl%@101150 (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @101150)
(=> (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@101178 (sAddr call28358formal@$ptr@0)) :lblneg @101178)
(=> (sAddr call28358formal@$ptr@0) (=> (and
(= (select $Mem@0 call28358formal@$ptr@0) (select $sMem@0 call28358formal@$ptr@0))
(= call28363formal@$ptr@0 (+ call28214formal@$ret@0 0))) (and
(! (or %lbl%@101202 (PtrOk call28363formal@$ptr@0)) :lblneg @101202)
(=> (PtrOk call28363formal@$ptr@0) (=> (and
(word call28363formal@$val@0)
(= call28363formal@$val@0 (select $Mem@0 call28363formal@$ptr@0))) (and
(! (or %lbl%@101230 (and
(word ?iomLo)
(word ?iomHi))) :lblneg @101230)
(=> (and
(word ?iomLo)
(word ?iomHi)) (and
(! (or %lbl%@101240 (Aligned ?dmaLo)) :lblneg @101240)
(=> (Aligned ?dmaLo) (and
(! (or %lbl%@101244 (= ?dmaLo ?iomHi)) :lblneg @101244)
(=> (= ?dmaLo ?iomHi) (and
(! (or %lbl%@101250 (= call28363formal@$val@0 ?dmaLo)) :lblneg @101250)
(=> (= call28363formal@$val@0 ?dmaLo) (and
(! (or %lbl%@101255 (IoPageTable $IomMem@0@@1 call28313formal@$ret@0)) :lblneg @101255)
(=> (IoPageTable $IomMem@0@@1 call28313formal@$ret@0) (and
(! (or %lbl%@101259 (forall ((i@@110 Int) ) (! (=> (and
(TV i@@110)
(<= 0 i@@110)
(< i@@110 512)) (and
(or
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 4096) (* 8 i@@110))) 0)
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 4096) (* 8 i@@110))) (+ call28313formal@$ret@0 3)))
(= (select $IomMem@0@@1 (+ (+ (+ call28313formal@$ret@0 4096) (* 8 i@@110)) 4)) 0)))
 :qid |EntryCPb.113:18|
 :skolemid |255|
 :pattern ( (TV i@@110))
))) :lblneg @101259)
(=> (forall ((i@@111 Int) ) (! (=> (and
(TV i@@111)
(<= 0 i@@111)
(< i@@111 512)) (and
(or
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 4096) (* 8 i@@111))) 0)
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 4096) (* 8 i@@111))) (+ call28313formal@$ret@0 3)))
(= (select $IomMem@0@@1 (+ (+ (+ call28313formal@$ret@0 4096) (* 8 i@@111)) 4)) 0)))
 :qid |EntryCPb.113:18|
 :skolemid |255|
 :pattern ( (TV i@@111))
)) (and
(! (or %lbl%@101360 (forall ((i@@112 Int) ) (! (=> (and
(TV i@@112)
(<= 0 i@@112)
(< i@@112 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 8192) (* 8 i@@112))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28313formal@$ret@0 8192) (* 8 i@@112)) 4)) 0)))
 :qid |EntryCPb.116:18|
 :skolemid |256|
 :pattern ( (TV i@@112))
))) :lblneg @101360)
(=> (forall ((i@@113 Int) ) (! (=> (and
(TV i@@113)
(<= 0 i@@113)
(< i@@113 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 8192) (* 8 i@@113))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28313formal@$ret@0 8192) (* 8 i@@113)) 4)) 0)))
 :qid |EntryCPb.116:18|
 :skolemid |256|
 :pattern ( (TV i@@113))
)) (and
(! (or %lbl%@101436 (forall ((i@@114 Int) ) (! (=> (and
(TV i@@114)
(<= 0 i@@114)
(< i@@114 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 12288) (* 8 i@@114))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28313formal@$ret@0 12288) (* 8 i@@114)) 4)) 0)))
 :qid |EntryCPb.119:18|
 :skolemid |257|
 :pattern ( (TV i@@114))
))) :lblneg @101436)
(=> (forall ((i@@115 Int) ) (! (=> (and
(TV i@@115)
(<= 0 i@@115)
(< i@@115 512)) (and
(= (select $IomMem@0@@1 (+ (+ call28313formal@$ret@0 12288) (* 8 i@@115))) 0)
(= (select $IomMem@0@@1 (+ (+ (+ call28313formal@$ret@0 12288) (* 8 i@@115)) 4)) 0)))
 :qid |EntryCPb.119:18|
 :skolemid |257|
 :pattern ( (TV i@@115))
)) (and
(! (or %lbl%@101512 (Aligned call28313formal@$ret@0)) :lblneg @101512)
(=> (Aligned call28313formal@$ret@0) (and
(! (or %lbl%@101515 (Aligned (+ call28313formal@$ret@0 16384))) :lblneg @101515)
(=> (Aligned (+ call28313formal@$ret@0 16384)) (and
(! (or %lbl%@101522 (and
(<= ?iomLo call28313formal@$ret@0)
(<= (+ call28313formal@$ret@0 32768) ?iomHi))) :lblneg @101522)
(=> (and
(<= ?iomLo call28313formal@$ret@0)
(<= (+ call28313formal@$ret@0 32768) ?iomHi)) (and
(! (or %lbl%@101538 (= (q@and (+ call28313formal@$ret@0 4096) 4095) 0)) :lblneg @101538)
(=> (= (q@and (+ call28313formal@$ret@0 4096) 4095) 0) (and
(! (or %lbl%@101551 (= (q@and (+ call28313formal@$ret@0 8192) 4095) 0)) :lblneg @101551)
(=> (= (q@and (+ call28313formal@$ret@0 8192) 4095) 0) (and
(! (or %lbl%@101564 (= (q@and (+ call28313formal@$ret@0 12288) 4095) 0)) :lblneg @101564)
(=> (= (q@and (+ call28313formal@$ret@0 12288) 4095) 0) (and
(! (or %lbl%@101577 (= (q@and (+ call28313formal@$ret@0 16384) 4095) 0)) :lblneg @101577)
(=> (= (q@and (+ call28313formal@$ret@0 16384) 4095) 0) (and
(! (or %lbl%@101590 (= (q@and (+ call28313formal@$ret@0 20480) 4095) 0)) :lblneg @101590)
(=> (= (q@and (+ call28313formal@$ret@0 20480) 4095) 0) (and
(! (or %lbl%@101603 (not $IomFrozen)) :lblneg @101603)
(=> (not $IomFrozen) (=> (and
(IoPageTable $IomMem@1@@1 call28313formal@$ret@0)
(= (select $IomMem@1@@1 (+ call28313formal@$ret@0 8192)) (+ (+ call28313formal@$ret@0 4096) 3))
(= (select $IomMem@1@@1 (+ call28313formal@$ret@0 8196)) 0)
(= (select $IomMem@1@@1 (+ call28313formal@$ret@0 12288)) (+ (+ call28313formal@$ret@0 8192) 3))) (=> (and
(= (select $IomMem@1@@1 (+ call28313formal@$ret@0 12292)) 0)
(forall ((i@@116 Int) ) (! (=> (and
(TV i@@116)
(<= 0 i@@116)
(< i@@116 512)) (and
(or
(= (select $IomMem@1@@1 (+ (+ call28313formal@$ret@0 4096) (* 8 i@@116))) 0)
(= (select $IomMem@1@@1 (+ (+ call28313formal@$ret@0 4096) (* 8 i@@116))) (+ call28313formal@$ret@0 3)))
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 4096) (* 8 i@@116)) 4)) 0)))
 :qid |EntryCPb.138:17|
 :skolemid |258|
 :pattern ( (TV i@@116))
))
(forall ((i@@117 Int) ) (! (=> (and
(TV i@@117)
(<= 1 i@@117)
(< i@@117 512)) (and
(= (select $IomMem@1@@1 (+ (+ call28313formal@$ret@0 8192) (* 8 i@@117))) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 8192) (* 8 i@@117)) 4)) 0)))
 :qid |EntryCPb.141:17|
 :skolemid |259|
 :pattern ( (TV i@@117))
))
(forall ((i@@118 Int) ) (! (=> (and
(TV i@@118)
(<= 1 i@@118)
(< i@@118 512)) (and
(= (select $IomMem@1@@1 (+ (+ call28313formal@$ret@0 12288) (* 8 i@@118))) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 12288) (* 8 i@@118)) 4)) 0)))
 :qid |EntryCPb.144:17|
 :skolemid |260|
 :pattern ( (TV i@@118))
))
(forall ((i@@119 Int) ) (! (=> (and
(TV i@@119)
(<= 0 i@@119)
(< i@@119 256)) (and
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 16384) (* 16 i@@119)) 0)) (+ (+ call28313formal@$ret@0 12288) 3))
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 16384) (* 16 i@@119)) 4)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 16384) (* 16 i@@119)) 8)) 258)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 16384) (* 16 i@@119)) 12)) 0)))
 :qid |EntryCPb.147:17|
 :skolemid |261|
 :pattern ( (TV i@@119))
))
(forall ((i@@120 Int) ) (! (=> (and
(TV i@@120)
(<= 0 i@@120)
(< i@@120 256)) (and
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@120)) 0)) (+ (+ call28313formal@$ret@0 16384) 1))
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@120)) 4)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@120)) 8)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@120)) 12)) 0)))
 :qid |EntryCPb.152:17|
 :skolemid |262|
 :pattern ( (TV i@@120))
))
(= (select $IomMem@1@@1 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)
(= (select $IomMem@1@@1 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) (and
(! (or %lbl%@102279 (= (q@and (+ call28313formal@$ret@0 20480) 4095) 0)) :lblneg @102279)
(=> (= (q@and (+ call28313formal@$ret@0 20480) 4095) 0) (and
(! (or %lbl%@102292 (IoContextTable $IomMem@1@@1 (+ call28313formal@$ret@0 16384))) :lblneg @102292)
(=> (IoContextTable $IomMem@1@@1 (+ call28313formal@$ret@0 16384)) (and
(! (or %lbl%@102300 (forall ((i@@121 Int) ) (! (=> (and
(TV i@@121)
(<= 0 i@@121)
(< i@@121 256)) (and
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@121)) 0)) (+ (+ call28313formal@$ret@0 16384) 1))
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@121)) 4)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@121)) 8)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@121)) 12)) 0)))
 :qid |EntryCPb.227:18|
 :skolemid |268|
 :pattern ( (TV i@@121))
))) :lblneg @102300)
(=> (forall ((i@@122 Int) ) (! (=> (and
(TV i@@122)
(<= 0 i@@122)
(< i@@122 256)) (and
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@122)) 0)) (+ (+ call28313formal@$ret@0 16384) 1))
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@122)) 4)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@122)) 8)) 0)
(= (select $IomMem@1@@1 (+ (+ (+ call28313formal@$ret@0 20480) (* 16 i@@122)) 12)) 0)))
 :qid |EntryCPb.227:18|
 :skolemid |268|
 :pattern ( (TV i@@122))
)) (=> (and
(IoRootTable $IomMem@1@@1 (+ call28313formal@$ret@0 20480))
(= call28368formal@$ret@0 call28313formal@$ret@0)) (and
(! (or %lbl%@102473 (word (+ call28368formal@$ret@0 20480))) :lblneg @102473)
(=> (word (+ call28368formal@$ret@0 20480)) (=> (= call28372formal@$ret@0 (+ call28368formal@$ret@0 20480)) (and
(! (or %lbl%@102506 (word (+ call28214formal@$ret@0 4))) :lblneg @102506)
(=> (word (+ call28214formal@$ret@0 4)) (=> (and
(= call28376formal@$ret@0 (+ call28214formal@$ret@0 4))
(= call28391formal@$oldMem@0 $Mem@@3)
(= call28391formal@$oldSMem@0 $sMem@@5)
(= call28391formal@$oldDMem@0 $dMem@@0)
(= call28391formal@$oldPciMem@0 $pciMem@@1)
(= call28391formal@$oldTMem@0 $tMems@@12)
(= call28391formal@$oldFMem@0 $fMems@@4)
(= call28391formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@102588 (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @102588)
(=> (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@102616 (MemInv call28391formal@$oldMem@0 call28391formal@$oldSMem@0 call28391formal@$oldDMem@0 call28391formal@$oldPciMem@0 call28391formal@$oldTMem@0 call28391formal@$oldFMem@0 call28391formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @102616)
(=> (MemInv call28391formal@$oldMem@0 call28391formal@$oldSMem@0 call28391formal@$oldDMem@0 call28391formal@$oldPciMem@0 call28391formal@$oldTMem@0 call28391formal@$oldFMem@0 call28391formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@102639 (= (select $sMem@0 call28376formal@$ret@0) (select call28391formal@$oldSMem@0 call28376formal@$ret@0))) :lblneg @102639)
(=> (= (select $sMem@0 call28376formal@$ret@0) (select call28391formal@$oldSMem@0 call28376formal@$ret@0)) (and
(! (or %lbl%@102649 (sAddr call28376formal@$ret@0)) :lblneg @102649)
(=> (sAddr call28376formal@$ret@0) (=> (= (select $Mem@0 call28376formal@$ret@0) (select call28391formal@$oldMem@0 call28376formal@$ret@0)) (=> (and
(= (select $Mem@0 call28376formal@$ret@0) (select $sMem@0 call28376formal@$ret@0))
(= call28394formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@102680 (= (ReturnToAddr (select $Mem@0 call28376formal@$ret@0)) call28394formal@$oldRA@0)) :lblneg @102680)
(=> (= (ReturnToAddr (select $Mem@0 call28376formal@$ret@0)) call28394formal@$oldRA@0) (and
(! (or %lbl%@102689 (Aligned call28376formal@$ret@0)) :lblneg @102689)
(=> (Aligned call28376formal@$ret@0) (=> (and
(= esp@0@@1 (+ call28376formal@$ret@0 4))
(Aligned esp@0@@1)) (and
(! (or %lbl%@102718 (IoRootTable $IomMem@1@@1 call28372formal@$ret@0)) :lblneg @102718)
(=> (IoRootTable $IomMem@1@@1 call28372formal@$ret@0) (and
(! (or %lbl%@102722 (= (select $IomMem@1@@1 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)) :lblneg @102722)
(=> (= (select $IomMem@1@@1 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE) (and
(! (or %lbl%@102735 (= (select $IomMem@1@@1 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) :lblneg @102735)
(=> (= (select $IomMem@1@@1 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo)) (and
(! (or %lbl%@102752 (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @102752)
(=> (MemInv $Mem@0 $sMem@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@102780 (SMemEnsure $sMem@0 $sMem@@5 esp@0@@1 esp)) :lblneg @102780)
(=> (SMemEnsure $sMem@0 $sMem@@5 esp@0@@1 esp) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@7 (=> (! (and %lbl%+98895 true) :lblpos +98895) (=> (and
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
(declare-fun %lbl%+28497 () Bool)
(declare-fun call28460formal@$ptr@0 () Int)
(declare-fun %lbl%@102992 () Bool)
(declare-fun $IoMmuState () (Array Int Int))
(declare-fun $entry@@0 () Int)
(declare-fun $IoMmuState@0 () (Array Int Int))
(declare-fun $IomFrozen@0 () Bool)
(declare-fun call28466formal@$ptr@0 () Int)
(declare-fun %lbl%@103184 () Bool)
(declare-fun $IoMmuState@1 () (Array Int Int))
(declare-fun $IomFrozen@1 () Bool)
(declare-fun call28469formal@$ret@0 () Int)
(declare-fun %lbl%@103377 () Bool)
(declare-fun call28473formal@$ret@0 () Int)
(declare-fun call28479formal@$ptr@0 () Int)
(declare-fun %lbl%@103424 () Bool)
(declare-fun $IoMmuState@2 () (Array Int Int))
(declare-fun $IomFrozen@2 () Bool)
(declare-fun call28482formal@$ret@0 () Int)
(declare-fun %lbl%@103617 () Bool)
(declare-fun call28486formal@$ret@0 () Int)
(declare-fun call28492formal@$ptr@0 () Int)
(declare-fun %lbl%@103664 () Bool)
(declare-fun $IoMmuState@3 () (Array Int Int))
(declare-fun $IomFrozen@3 () Bool)
(declare-fun %lbl%@103830 () Bool)
(declare-fun %lbl%@103839 () Bool)
(declare-fun %lbl%+102787 () Bool)
(push 1)
(set-info :boogie-vc-id setIoMmuRegs)
(assert (not
(let ((anon0_correct@@8 (=> (! (and %lbl%+28497 true) :lblpos +28497) (=> (= call28460formal@$ptr@0 (+ esi 32)) (and
(! (or %lbl%@102992 (or
(and
(= (select $IoMmuState $entry@@0) 0)
(= call28460formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 ebx))
(and
(= (select $IoMmuState $entry@@0) 1)
(= call28460formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= ebx 0))
(and
(= (select $IoMmuState $entry@@0) 2)
(= call28460formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= ebx (shl 1 30)))
(and
(= (select $IoMmuState $entry@@0) 3)
(= call28460formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= ebx (shl 1 31))))) :lblneg @102992)
(=> (or
(and
(= (select $IoMmuState $entry@@0) 0)
(= call28460formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 ebx))
(and
(= (select $IoMmuState $entry@@0) 1)
(= call28460formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= ebx 0))
(and
(= (select $IoMmuState $entry@@0) 2)
(= call28460formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= ebx (shl 1 30)))
(and
(= (select $IoMmuState $entry@@0) 3)
(= call28460formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= ebx (shl 1 31)))) (=> (= $IoMmuState@0 (store $IoMmuState $entry@@0 (+ 1 (select $IoMmuState $entry@@0)))) (=> (and
$IomFrozen@0
(= call28466formal@$ptr@0 (+ esi 36))) (and
(! (or %lbl%@103184 (or
(and
(= (select $IoMmuState@0 $entry@@0) 0)
(= call28466formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 0))
(and
(= (select $IoMmuState@0 $entry@@0) 1)
(= call28466formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= 0 0))
(and
(= (select $IoMmuState@0 $entry@@0) 2)
(= call28466formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= 0 (shl 1 30)))
(and
(= (select $IoMmuState@0 $entry@@0) 3)
(= call28466formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= 0 (shl 1 31))))) :lblneg @103184)
(=> (or
(and
(= (select $IoMmuState@0 $entry@@0) 0)
(= call28466formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 0))
(and
(= (select $IoMmuState@0 $entry@@0) 1)
(= call28466formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= 0 0))
(and
(= (select $IoMmuState@0 $entry@@0) 2)
(= call28466formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= 0 (shl 1 30)))
(and
(= (select $IoMmuState@0 $entry@@0) 3)
(= call28466formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= 0 (shl 1 31)))) (=> (= $IoMmuState@1 (store $IoMmuState@0 $entry@@0 (+ 1 (select $IoMmuState@0 $entry@@0)))) (=> (and
$IomFrozen@1
(= call28469formal@$ret@0 1)) (and
(! (or %lbl%@103377 (< 30 32)) :lblneg @103377)
(=> (< 30 32) (=> (= call28473formal@$ret@0 (shl call28469formal@$ret@0 30)) (=> (and
(word call28473formal@$ret@0)
(= call28479formal@$ptr@0 (+ esi 24))) (and
(! (or %lbl%@103424 (or
(and
(= (select $IoMmuState@1 $entry@@0) 0)
(= call28479formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 call28473formal@$ret@0))
(and
(= (select $IoMmuState@1 $entry@@0) 1)
(= call28479formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= call28473formal@$ret@0 0))
(and
(= (select $IoMmuState@1 $entry@@0) 2)
(= call28479formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28473formal@$ret@0 (shl 1 30)))
(and
(= (select $IoMmuState@1 $entry@@0) 3)
(= call28479formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28473formal@$ret@0 (shl 1 31))))) :lblneg @103424)
(=> (or
(and
(= (select $IoMmuState@1 $entry@@0) 0)
(= call28479formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 call28473formal@$ret@0))
(and
(= (select $IoMmuState@1 $entry@@0) 1)
(= call28479formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= call28473formal@$ret@0 0))
(and
(= (select $IoMmuState@1 $entry@@0) 2)
(= call28479formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28473formal@$ret@0 (shl 1 30)))
(and
(= (select $IoMmuState@1 $entry@@0) 3)
(= call28479formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28473formal@$ret@0 (shl 1 31)))) (=> (= $IoMmuState@2 (store $IoMmuState@1 $entry@@0 (+ 1 (select $IoMmuState@1 $entry@@0)))) (=> (and
$IomFrozen@2
(= call28482formal@$ret@0 1)) (and
(! (or %lbl%@103617 (< 31 32)) :lblneg @103617)
(=> (< 31 32) (=> (= call28486formal@$ret@0 (shl call28482formal@$ret@0 31)) (=> (and
(word call28486formal@$ret@0)
(= call28492formal@$ptr@0 (+ esi 24))) (and
(! (or %lbl%@103664 (or
(and
(= (select $IoMmuState@2 $entry@@0) 0)
(= call28492formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 call28486formal@$ret@0))
(and
(= (select $IoMmuState@2 $entry@@0) 1)
(= call28492formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= call28486formal@$ret@0 0))
(and
(= (select $IoMmuState@2 $entry@@0) 2)
(= call28492formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28486formal@$ret@0 (shl 1 30)))
(and
(= (select $IoMmuState@2 $entry@@0) 3)
(= call28492formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28486formal@$ret@0 (shl 1 31))))) :lblneg @103664)
(=> (or
(and
(= (select $IoMmuState@2 $entry@@0) 0)
(= call28492formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 32))
(IoRootTable $IomMem@@7 call28486formal@$ret@0))
(and
(= (select $IoMmuState@2 $entry@@0) 1)
(= call28492formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 36))
(= call28486formal@$ret@0 0))
(and
(= (select $IoMmuState@2 $entry@@0) 2)
(= call28492formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28486formal@$ret@0 (shl 1 30)))
(and
(= (select $IoMmuState@2 $entry@@0) 3)
(= call28492formal@$ptr@0 (+ (select ?DrhdRegs $entry@@0) 24))
(= call28486formal@$ret@0 (shl 1 31)))) (=> (and
(= $IoMmuState@3 (store $IoMmuState@2 $entry@@0 (+ 1 (select $IoMmuState@2 $entry@@0))))
$IomFrozen@3) (and
(! (or %lbl%@103830 (= (select $IoMmuState@3 $entry@@0) 4)) :lblneg @103830)
(=> (= (select $IoMmuState@3 $entry@@0) 4) (and
(! (or %lbl%@103839 (forall ((i@@123 Int) ) (! (=> (not (= i@@123 $entry@@0)) (= (select $IoMmuState@3 i@@123) (select $IoMmuState i@@123)))
 :qid |EntryCPb.295:17|
 :skolemid |269|
 :pattern ( (select $IoMmuState@3 i@@123))
))) :lblneg @103839)
(=> (forall ((i@@124 Int) ) (! (=> (not (= i@@124 $entry@@0)) (= (select $IoMmuState@3 i@@124) (select $IoMmuState i@@124)))
 :qid |EntryCPb.295:17|
 :skolemid |269|
 :pattern ( (select $IoMmuState@3 i@@124))
)) true)))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@8 (=> (! (and %lbl%+102787 true) :lblpos +102787) (=> (= esi (select ?DrhdRegs $entry@@0)) (=> (and
(IoRootTable $IomMem@@7 ebx)
(= (select $IoMmuState $entry@@0) 0)) anon0_correct@@8)))))
PreconditionGeneratedEntry_correct@@8))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+28933 () Bool)
(declare-fun %lbl%+28936 () Bool)
(declare-fun call28831formal@$ptr@0 () Int)
(declare-fun edi@0@@1 () Int)
(declare-fun %lbl%@105756 () Bool)
(declare-fun call28831formal@$val@0 () Int)
(declare-fun call28840formal@$ptr@0 () Int)
(declare-fun call28622formal@$ret@0 () Int)
(declare-fun %lbl%@105802 () Bool)
(declare-fun $Mem@1 () (Array Int Int))
(declare-fun $sMem@1 () (Array Int Int))
(declare-fun %lbl%@105830 () Bool)
(declare-fun ecx@2@@0 () Int)
(declare-fun $sMem@2 () (Array Int Int))
(declare-fun call28845formal@$ptr@0 () Int)
(declare-fun %lbl%@105891 () Bool)
(declare-fun %lbl%@105894 () Bool)
(declare-fun $Mem@2 () (Array Int Int))
(declare-fun %lbl%@105922 () Bool)
(declare-fun $entry@0@@1 () Int)
(declare-fun %lbl%@105930 () Bool)
(declare-fun %lbl%@105936 () Bool)
(declare-fun $IoMmuState@0@@0 () (Array Int Int))
(declare-fun $IoMmuState@1@@0 () (Array Int Int))
(declare-fun call28851formal@$ptr@0 () Int)
(declare-fun %lbl%@106038 () Bool)
(declare-fun %lbl%@106066 () Bool)
(declare-fun call28856formal@$ptr@0 () Int)
(declare-fun %lbl%@106090 () Bool)
(declare-fun call28856formal@$val@0 () Int)
(declare-fun $entry@1@@1 () Int)
(declare-fun %lbl%@106133 () Bool)
(declare-fun call28866formal@$ret@0 () Int)
(declare-fun %lbl%@106164 () Bool)
(declare-fun call28634formal@$ret@0 () Int)
(declare-fun %lbl%@106175 () Bool)
(declare-fun %lbl%@106178 () Bool)
(declare-fun %lbl%@106198 () Bool)
(declare-fun %lbl%@106202 () Bool)
(declare-fun %lbl%@106227 () Bool)
(declare-fun %lbl%@106260 () Bool)
(declare-fun %lbl%@106288 () Bool)
(declare-fun %lbl%+28931 () Bool)
(declare-fun $Efl@12 () Int)
(declare-fun call28782formal@$val@0 () Int)
(declare-fun %lbl%+28920 () Bool)
(declare-fun $Efl@10 () Int)
(declare-fun %lbl%@105493 () Bool)
(declare-fun %lbl%@105497 () Bool)
(declare-fun %lbl%@105506 () Bool)
(declare-fun call28809formal@$ptr@0 () Int)
(declare-fun %lbl%@105549 () Bool)
(declare-fun call28809formal@$val@0 () Int)
(declare-fun call28816formal@$x@0 () T@opn)
(declare-fun call28816formal@$y@0 () T@opn)
(declare-fun %lbl%@105597 () Bool)
(declare-fun %lbl%@105601 () Bool)
(declare-fun %lbl%+28941 () Bool)
(declare-fun %lbl%+28940 () Bool)
(declare-fun %lbl%+28922 () Bool)
(declare-fun %lbl%@105638 () Bool)
(declare-fun %lbl%@105642 () Bool)
(declare-fun ?DrhdCount () Int)
(declare-fun %lbl%+28912 () Bool)
(declare-fun $Efl@7 () Int)
(declare-fun call28777formal@$ptr@0 () Int)
(declare-fun %lbl%@105366 () Bool)
(declare-fun call28777formal@$val@0 () Int)
(declare-fun call28782formal@$ptr@0 () Int)
(declare-fun %lbl%@105406 () Bool)
(declare-fun call28789formal@$x@0 () T@opn)
(declare-fun call28789formal@$y@0 () T@opn)
(declare-fun %lbl%@105454 () Bool)
(declare-fun %lbl%@105458 () Bool)
(declare-fun %lbl%+28910 () Bool)
(declare-fun %lbl%@105325 () Bool)
(declare-fun %lbl%@105329 () Bool)
(declare-fun %lbl%+28909 () Bool)
(declare-fun call28757formal@$ptr@0 () Int)
(declare-fun %lbl%@105223 () Bool)
(declare-fun %lbl%@105251 () Bool)
(declare-fun call28766formal@$x@0 () T@opn)
(declare-fun call28766formal@$y@0 () T@opn)
(declare-fun %lbl%@105286 () Bool)
(declare-fun %lbl%@105290 () Bool)
(declare-fun %lbl%+28902 () Bool)
(declare-fun %lbl%@104431 () Bool)
(declare-fun %lbl%@104593 () Bool)
(declare-fun call28627formal@$ptr@0 () Int)
(declare-fun %lbl%@104635 () Bool)
(declare-fun call28627formal@$val@0 () Int)
(declare-fun call28630formal@$ret@0 () Int)
(declare-fun %lbl%@104690 () Bool)
(declare-fun call28643formal@$ptr@0 () Int)
(declare-fun %lbl%@104733 () Bool)
(declare-fun %lbl%@104763 () Bool)
(declare-fun $sMem@0@@0 () (Array Int Int))
(declare-fun call28648formal@$ptr@0 () Int)
(declare-fun %lbl%@104826 () Bool)
(declare-fun %lbl%@104829 () Bool)
(declare-fun $Mem@0@@0 () (Array Int Int))
(declare-fun %lbl%@104865 () Bool)
(declare-fun call28656formal@$ret@0 () Int)
(declare-fun %lbl%@104893 () Bool)
(declare-fun %lbl%@104904 () Bool)
(declare-fun %lbl%@104907 () Bool)
(declare-fun %lbl%@104927 () Bool)
(declare-fun %lbl%@104931 () Bool)
(declare-fun %lbl%@104958 () Bool)
(declare-fun %lbl%@104993 () Bool)
(declare-fun %lbl%@105021 () Bool)
(declare-fun %lbl%+103955 () Bool)
(push 1)
(set-info :boogie-vc-id ReadDmar)
(assert (not
(let ((anon10_Else_correct (=> (! (and %lbl%+28933 true) :lblpos +28933) true)))
(let ((__L9_correct (=> (! (and %lbl%+28936 true) :lblpos +28936) (=> (= call28831formal@$ptr@0 (+ edi@0@@1 8)) (and
(! (or %lbl%@105756 (inRo call28831formal@$ptr@0 4)) :lblneg @105756)
(=> (inRo call28831formal@$ptr@0 4) (=> (word call28831formal@$val@0) (=> (and
(= call28831formal@$val@0 (ro32 call28831formal@$ptr@0))
(= call28840formal@$ptr@0 (+ call28622formal@$ret@0 4))) (and
(! (or %lbl%@105802 (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @105802)
(=> (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@105830 (sAddr call28840formal@$ptr@0)) :lblneg @105830)
(=> (sAddr call28840formal@$ptr@0) (=> (MemInv (store $Mem@1 call28840formal@$ptr@0 ecx@2@@0) $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@2 (store $sMem@1 call28840formal@$ptr@0 ecx@2@@0))
(= call28845formal@$ptr@0 (+ call28622formal@$ret@0 4))) (and
(! (or %lbl%@105891 (PtrOk call28845formal@$ptr@0)) :lblneg @105891)
(=> (PtrOk call28845formal@$ptr@0) (and
(! (or %lbl%@105894 (word ecx@2@@0)) :lblneg @105894)
(=> (word ecx@2@@0) (=> (= $Mem@2 (store $Mem@1 call28845formal@$ptr@0 ecx@2@@0)) (and
(! (or %lbl%@105922 (= call28831formal@$val@0 (select ?DrhdRegs $entry@0@@1))) :lblneg @105922)
(=> (= call28831formal@$val@0 (select ?DrhdRegs $entry@0@@1)) (and
(! (or %lbl%@105930 (IoRootTable $IomMem@@7 ebx)) :lblneg @105930)
(=> (IoRootTable $IomMem@@7 ebx) (and
(! (or %lbl%@105936 (= (select $IoMmuState@0@@0 $entry@0@@1) 0)) :lblneg @105936)
(=> (= (select $IoMmuState@0@@0 $entry@0@@1) 0) (=> (= (select $IoMmuState@1@@0 $entry@0@@1) 4) (=> (and
(forall ((i@@125 Int) ) (! (=> (not (= i@@125 $entry@0@@1)) (= (select $IoMmuState@1@@0 i@@125) (select $IoMmuState@0@@0 i@@125)))
 :qid |EntryCPb.295:17|
 :skolemid |269|
 :pattern ( (select $IoMmuState@1@@0 i@@125))
))
(= call28851formal@$ptr@0 (+ call28622formal@$ret@0 4))) (and
(! (or %lbl%@106038 (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @106038)
(=> (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@106066 (sAddr call28851formal@$ptr@0)) :lblneg @106066)
(=> (sAddr call28851formal@$ptr@0) (=> (and
(= (select $Mem@2 call28851formal@$ptr@0) (select $sMem@2 call28851formal@$ptr@0))
(= call28856formal@$ptr@0 (+ call28622formal@$ret@0 4))) (and
(! (or %lbl%@106090 (PtrOk call28856formal@$ptr@0)) :lblneg @106090)
(=> (PtrOk call28856formal@$ptr@0) (=> (word call28856formal@$val@0) (=> (and
(= call28856formal@$val@0 (select $Mem@2 call28856formal@$ptr@0))
(= $entry@1@@1 (+ $entry@0@@1 1))) (and
(! (or %lbl%@106133 (word (+ edi@0@@1 call28856formal@$val@0))) :lblneg @106133)
(=> (word (+ edi@0@@1 call28856formal@$val@0)) (=> (= call28866formal@$ret@0 (+ edi@0@@1 call28856formal@$val@0)) (and
(! (or %lbl%@106164 (= call28634formal@$ret@0 (select $sMem@2 (+ call28622formal@$ret@0 0)))) :lblneg @106164)
(=> (= call28634formal@$ret@0 (select $sMem@2 (+ call28622formal@$ret@0 0))) (and
(! (or %lbl%@106175 (TV $entry@1@@1)) :lblneg @106175)
(=> (TV $entry@1@@1) (and
(! (or %lbl%@106178 (and
(<= (+ ?DmarPtr 48) call28866formal@$ret@0)
(<= call28866formal@$ret@0 (+ ?DmarPtr ?DmarLen)))) :lblneg @106178)
(=> (and
(<= (+ ?DmarPtr 48) call28866formal@$ret@0)
(<= call28866formal@$ret@0 (+ ?DmarPtr ?DmarLen))) (and
(! (or %lbl%@106198 (MaybeDrhd call28866formal@$ret@0 $entry@1@@1)) :lblneg @106198)
(=> (MaybeDrhd call28866formal@$ret@0 $entry@1@@1) (and
(! (or %lbl%@106202 (forall ((i@@126 Int) ) (! (=> (>= i@@126 $entry@1@@1) (= (select $IoMmuState@1@@0 i@@126) 0))
 :qid |EntryCPb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState@1@@0 i@@126))
))) :lblneg @106202)
(=> (forall ((i@@127 Int) ) (! (=> (>= i@@127 $entry@1@@1) (= (select $IoMmuState@1@@0 i@@127) 0))
 :qid |EntryCPb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState@1@@0 i@@127))
)) (and
(! (or %lbl%@106227 (forall ((i@@128 Int) ) (! (=> (and
(<= 0 i@@128)
(< i@@128 $entry@1@@1)) (= (select $IoMmuState@1@@0 i@@128) 4))
 :qid |EntryCPb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState@1@@0 i@@128))
))) :lblneg @106227)
(=> (forall ((i@@129 Int) ) (! (=> (and
(<= 0 i@@129)
(< i@@129 $entry@1@@1)) (= (select $IoMmuState@1@@0 i@@129) 4))
 :qid |EntryCPb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState@1@@0 i@@129))
)) (and
(! (or %lbl%@106260 (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @106260)
(=> (MemInv $Mem@2 $sMem@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@106288 (SMemInv $sMem@2 $sMem@@5 (+ call28622formal@$ret@0 8) esp)) :lblneg @106288)
(=> (SMemInv $sMem@2 $sMem@@5 (+ call28622formal@$ret@0 8) esp) true)))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon10_Then_correct (=> (! (and %lbl%+28931 true) :lblpos +28931) (=> (and
(Je $Efl@12)
(= ecx@2@@0 call28782formal@$val@0)) __L9_correct))))
(let ((anon9_Then_correct (=> (! (and %lbl%+28920 true) :lblpos +28920) (=> (Je $Efl@10) (and
(! (or %lbl%@105493 (MaybeDrhd edi@0@@1 $entry@0@@1)) :lblneg @105493)
(=> (MaybeDrhd edi@0@@1 $entry@0@@1) (and
(! (or %lbl%@105497 (< edi@0@@1 (+ ?DmarPtr ?DmarLen))) :lblneg @105497)
(=> (< edi@0@@1 (+ ?DmarPtr ?DmarLen)) (and
(! (or %lbl%@105506 (MatchesDrhd edi@0@@1)) :lblneg @105506)
(=> (MatchesDrhd edi@0@@1) (=> (and
(= (select ?DrhdPtr $entry@0@@1) edi@0@@1)
(MaybeDrhd (+ edi@0@@1 (roU16 (+ edi@0@@1 2))) (+ $entry@0@@1 1))
(DrhdInv edi@0@@1 $entry@0@@1)
(= call28809formal@$ptr@0 (+ edi@0@@1 12))) (and
(! (or %lbl%@105549 (inRo call28809formal@$ptr@0 4)) :lblneg @105549)
(=> (inRo call28809formal@$ptr@0 4) (=> (and
(word call28809formal@$val@0)
(= call28809formal@$val@0 (ro32 call28809formal@$ptr@0))
(= call28816formal@$x@0 (OpnReg call28809formal@$val@0))
(= call28816formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@105597 (OpnOk $Mem@1 call28816formal@$x@0)) :lblneg @105597)
(=> (OpnOk $Mem@1 call28816formal@$x@0) (and
(! (or %lbl%@105601 (OpnOk $Mem@1 call28816formal@$y@0)) :lblneg @105601)
(=> (OpnOk $Mem@1 call28816formal@$y@0) (=> (FlagsCmp $Efl@12 (EvalOpn $Mem@1 call28816formal@$x@0) (EvalOpn $Mem@1 call28816formal@$y@0)) (and
anon10_Then_correct
anon10_Else_correct))))))))))))))))))))
(let ((infloop_correct (=> (! (and %lbl%+28941 true) :lblpos +28941) true)))
(let ((done_correct (=> (! (and %lbl%+28940 true) :lblpos +28940) infloop_correct)))
(let ((anon9_Else_correct (=> (! (and %lbl%+28922 true) :lblpos +28922) (=> (not (Je $Efl@10)) (and
(! (or %lbl%@105638 (MaybeDrhd edi@0@@1 $entry@0@@1)) :lblneg @105638)
(=> (MaybeDrhd edi@0@@1 $entry@0@@1) (and
(! (or %lbl%@105642 (or
(= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(not (MatchesDrhd edi@0@@1)))) :lblneg @105642)
(=> (or
(= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(not (MatchesDrhd edi@0@@1))) (=> (= ?DrhdCount $entry@0@@1) done_correct)))))))))
(let ((anon8_Else_correct (=> (! (and %lbl%+28912 true) :lblpos +28912) (=> (and
(not (Jae $Efl@7))
(= call28777formal@$ptr@0 (+ edi@0@@1 0))) (and
(! (or %lbl%@105366 (inRo call28777formal@$ptr@0 2)) :lblneg @105366)
(=> (inRo call28777formal@$ptr@0 2) (=> (word call28777formal@$val@0) (=> (and
(= call28777formal@$val@0 (roU16 call28777formal@$ptr@0))
(= call28782formal@$ptr@0 (+ edi@0@@1 2))) (and
(! (or %lbl%@105406 (inRo call28782formal@$ptr@0 2)) :lblneg @105406)
(=> (inRo call28782formal@$ptr@0 2) (=> (and
(word call28782formal@$val@0)
(= call28782formal@$val@0 (roU16 call28782formal@$ptr@0))
(= call28789formal@$x@0 (OpnReg call28777formal@$val@0))
(= call28789formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@105454 (OpnOk $Mem@1 call28789formal@$x@0)) :lblneg @105454)
(=> (OpnOk $Mem@1 call28789formal@$x@0) (and
(! (or %lbl%@105458 (OpnOk $Mem@1 call28789formal@$y@0)) :lblneg @105458)
(=> (OpnOk $Mem@1 call28789formal@$y@0) (=> (FlagsCmp $Efl@10 (EvalOpn $Mem@1 call28789formal@$x@0) (EvalOpn $Mem@1 call28789formal@$y@0)) (and
anon9_Then_correct
anon9_Else_correct)))))))))))))))))
(let ((anon8_Then_correct (=> (! (and %lbl%+28910 true) :lblpos +28910) (=> (Jae $Efl@7) (and
(! (or %lbl%@105325 (MaybeDrhd edi@0@@1 $entry@0@@1)) :lblneg @105325)
(=> (MaybeDrhd edi@0@@1 $entry@0@@1) (and
(! (or %lbl%@105329 (or
(= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(not (MatchesDrhd edi@0@@1)))) :lblneg @105329)
(=> (or
(= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(not (MatchesDrhd edi@0@@1))) (=> (= ?DrhdCount $entry@0@@1) infloop_correct)))))))))
(let ((__L6_correct (=> (! (and %lbl%+28909 true) :lblpos +28909) (=> (<= 0 $entry@0@@1) (=> (and
(= call28634formal@$ret@0 (select $sMem@1 (+ call28622formal@$ret@0 0)))
(TV $entry@0@@1)) (=> (and
(<= (+ ?DmarPtr 48) edi@0@@1)
(<= edi@0@@1 (+ ?DmarPtr ?DmarLen))
(MaybeDrhd edi@0@@1 $entry@0@@1)
(forall ((i@@130 Int) ) (! (=> (>= i@@130 $entry@0@@1) (= (select $IoMmuState@0@@0 i@@130) 0))
 :qid |EntryCPb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState@0@@0 i@@130))
))
(forall ((i@@131 Int) ) (! (=> (and
(<= 0 i@@131)
(< i@@131 $entry@0@@1)) (= (select $IoMmuState@0@@0 i@@131) 4))
 :qid |EntryCPb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState@0@@0 i@@131))
))
(MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemInv $sMem@1 $sMem@@5 (+ call28622formal@$ret@0 8) esp)
(= call28757formal@$ptr@0 (+ call28622formal@$ret@0 0))) (and
(! (or %lbl%@105223 (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @105223)
(=> (MemInv $Mem@1 $sMem@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@105251 (sAddr call28757formal@$ptr@0)) :lblneg @105251)
(=> (sAddr call28757formal@$ptr@0) (=> (= (select $Mem@1 call28757formal@$ptr@0) (select $sMem@1 call28757formal@$ptr@0)) (=> (and
(= call28766formal@$x@0 (OpnReg edi@0@@1))
(= call28766formal@$y@0 (OpnMem (+ call28622formal@$ret@0 0)))) (and
(! (or %lbl%@105286 (OpnOk $Mem@1 call28766formal@$x@0)) :lblneg @105286)
(=> (OpnOk $Mem@1 call28766formal@$x@0) (and
(! (or %lbl%@105290 (OpnOk $Mem@1 call28766formal@$y@0)) :lblneg @105290)
(=> (OpnOk $Mem@1 call28766formal@$y@0) (=> (FlagsCmp $Efl@7 (EvalOpn $Mem@1 call28766formal@$x@0) (EvalOpn $Mem@1 call28766formal@$y@0)) (and
anon8_Then_correct
anon8_Else_correct))))))))))))))))))
(let ((anon0_correct@@9 (=> (! (and %lbl%+28902 true) :lblpos +28902) (and
(! (or %lbl%@104431 (Aligned esp)) :lblneg @104431)
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
(! (or %lbl%@104593 (word (- esp 8))) :lblneg @104593)
(=> (word (- esp 8)) (=> (and
(= call28622formal@$ret@0 (- esp 8))
(= call28627formal@$ptr@0 (+ edi 4))) (and
(! (or %lbl%@104635 (inRo call28627formal@$ptr@0 4)) :lblneg @104635)
(=> (inRo call28627formal@$ptr@0 4) (=> (word call28627formal@$val@0) (=> (and
(= call28627formal@$val@0 (ro32 call28627formal@$ptr@0))
(= call28630formal@$ret@0 edi)) (and
(! (or %lbl%@104690 (word (+ call28630formal@$ret@0 call28627formal@$val@0))) :lblneg @104690)
(=> (word (+ call28630formal@$ret@0 call28627formal@$val@0)) (=> (and
(= call28634formal@$ret@0 (+ call28630formal@$ret@0 call28627formal@$val@0))
(= call28643formal@$ptr@0 (+ call28622formal@$ret@0 0))) (and
(! (or %lbl%@104733 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @104733)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@104763 (sAddr call28643formal@$ptr@0)) :lblneg @104763)
(=> (sAddr call28643formal@$ptr@0) (=> (MemInv (store $Mem@@3 call28643formal@$ptr@0 call28634formal@$ret@0) $sMem@0@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0@@0 (store $sMem@@5 call28643formal@$ptr@0 call28634formal@$ret@0))
(= call28648formal@$ptr@0 (+ call28622formal@$ret@0 0))) (and
(! (or %lbl%@104826 (PtrOk call28648formal@$ptr@0)) :lblneg @104826)
(=> (PtrOk call28648formal@$ptr@0) (and
(! (or %lbl%@104829 (word call28634formal@$ret@0)) :lblneg @104829)
(=> (word call28634formal@$ret@0) (=> (= $Mem@0@@0 (store $Mem@@3 call28648formal@$ptr@0 call28634formal@$ret@0)) (and
(! (or %lbl%@104865 (word (+ edi 48))) :lblneg @104865)
(=> (word (+ edi 48)) (=> (= call28656formal@$ret@0 (+ edi 48)) (and
(! (or %lbl%@104893 (= call28634formal@$ret@0 (select $sMem@0@@0 (+ call28622formal@$ret@0 0)))) :lblneg @104893)
(=> (= call28634formal@$ret@0 (select $sMem@0@@0 (+ call28622formal@$ret@0 0))) (and
(! (or %lbl%@104904 (TV 0)) :lblneg @104904)
(=> (TV 0) (and
(! (or %lbl%@104907 (and
(<= (+ ?DmarPtr 48) call28656formal@$ret@0)
(<= call28656formal@$ret@0 (+ ?DmarPtr ?DmarLen)))) :lblneg @104907)
(=> (and
(<= (+ ?DmarPtr 48) call28656formal@$ret@0)
(<= call28656formal@$ret@0 (+ ?DmarPtr ?DmarLen))) (and
(! (or %lbl%@104927 (MaybeDrhd call28656formal@$ret@0 0)) :lblneg @104927)
(=> (MaybeDrhd call28656formal@$ret@0 0) (and
(! (or %lbl%@104931 (forall ((i@@132 Int) ) (! (=> (>= i@@132 0) (= (select $IoMmuState i@@132) 0))
 :qid |EntryCPb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState i@@132))
))) :lblneg @104931)
(=> (forall ((i@@133 Int) ) (! (=> (>= i@@133 0) (= (select $IoMmuState i@@133) 0))
 :qid |EntryCPb.338:18|
 :skolemid |271|
 :pattern ( (select $IoMmuState i@@133))
)) (and
(! (or %lbl%@104958 (forall ((i@@134 Int) ) (! (=> (and
(<= 0 i@@134)
(< i@@134 0)) (= (select $IoMmuState i@@134) 4))
 :qid |EntryCPb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState i@@134))
))) :lblneg @104958)
(=> (forall ((i@@135 Int) ) (! (=> (and
(<= 0 i@@135)
(< i@@135 0)) (= (select $IoMmuState i@@135) 4))
 :qid |EntryCPb.339:18|
 :skolemid |272|
 :pattern ( (select $IoMmuState i@@135))
)) (and
(! (or %lbl%@104993 (MemInv $Mem@0@@0 $sMem@0@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @104993)
(=> (MemInv $Mem@0@@0 $sMem@0@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@105021 (SMemInv $sMem@0@@0 $sMem@@5 (+ call28622formal@$ret@0 8) esp)) :lblneg @105021)
(=> (SMemInv $sMem@0@@0 $sMem@@5 (+ call28622formal@$ret@0 8) esp) __L6_correct))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@9 (=> (! (and %lbl%+103955 true) :lblpos +103955) (=> (and
?DmarExists
(= edi ?DmarPtr)
(IoRootTable $IomMem@@7 ebx)
(= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)
(= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))
(forall ((i@@136 Int) ) (! (= (select $IoMmuState i@@136) 0)
 :qid |EntryCPb.317:18|
 :skolemid |270|
 :pattern ( (select $IoMmuState i@@136))
))
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 116 $sMem@@5 esp $RET@@0)) anon0_correct@@9))))
PreconditionGeneratedEntry_correct@@9))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+29501 () Bool)
(declare-fun $Efl@24 () Int)
(declare-fun $entry@4 () Int)
(declare-fun $entry@3 () Int)
(declare-fun %lbl%@109320 () Bool)
(declare-fun esi@1@@0 () Int)
(declare-fun call29395formal@$ret@0 () Int)
(declare-fun %lbl%@109351 () Bool)
(declare-fun $sMem@0@@1 () (Array Int Int))
(declare-fun call29091formal@$ret@0 () Int)
(declare-fun %lbl%@109362 () Bool)
(declare-fun %lbl%@109365 () Bool)
(declare-fun %lbl%@109381 () Bool)
(declare-fun %lbl%@109393 () Bool)
(declare-fun $entry@0@@2 () Int)
(declare-fun %lbl%+29479 () Bool)
(declare-fun $Efl@12@@0 () Int)
(declare-fun $entry@1@@2 () Int)
(declare-fun %lbl%@108054 () Bool)
(declare-fun esi@0@@0 () Int)
(declare-fun call29429formal@$ret@0 () Int)
(declare-fun %lbl%@108085 () Bool)
(declare-fun %lbl%@108096 () Bool)
(declare-fun %lbl%@108099 () Bool)
(declare-fun %lbl%@108115 () Bool)
(declare-fun %lbl%@108127 () Bool)
(declare-fun %lbl%@108176 () Bool)
(declare-fun $Mem@0@@1 () (Array Int Int))
(declare-fun %lbl%@108204 () Bool)
(declare-fun %lbl%+106434 () Bool)
(declare-fun %lbl%@109839 () Bool)
(declare-fun DmaAddr@1 () Int)
(declare-fun $IoMmuEnabled@2 () Bool)
(declare-fun %lbl%@109859 () Bool)
(declare-fun $Mem@4 () (Array Int Int))
(declare-fun $sMem@4 () (Array Int Int))
(declare-fun %lbl%@109887 () Bool)
(declare-fun esp@4 () Int)
(declare-fun %lbl%+29510 () Bool)
(declare-fun %lbl%@109562 () Bool)
(declare-fun esp@2 () Int)
(declare-fun call29439formal@$ret@0 () Int)
(declare-fun call29454formal@$oldMem@0 () (Array Int Int))
(declare-fun call29454formal@$oldSMem@0 () (Array Int Int))
(declare-fun call29454formal@$oldDMem@0 () (Array Int Int))
(declare-fun call29454formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call29454formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call29454formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call29454formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@109646 () Bool)
(declare-fun $Mem@3 () (Array Int Int))
(declare-fun $sMem@3 () (Array Int Int))
(declare-fun %lbl%@109674 () Bool)
(declare-fun %lbl%@109697 () Bool)
(declare-fun %lbl%@109707 () Bool)
(declare-fun call29457formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@109737 () Bool)
(declare-fun %lbl%@109746 () Bool)
(declare-fun esp@3 () Int)
(declare-fun DmaAddr@0 () Int)
(declare-fun $IoMmuEnabled@1 () Bool)
(declare-fun %lbl%+29503 () Bool)
(declare-fun call29382formal@$ret@0 () Int)
(declare-fun $RET@1 () T@ReturnTo)
(declare-fun $IoMmuEnabled@@0 () Bool)
(declare-fun %lbl%+29493 () Bool)
(declare-fun $Efl@17 () Int)
(declare-fun call29361formal@$ptr@0 () Int)
(declare-fun %lbl%@109181 () Bool)
(declare-fun call29361formal@$val@0 () Int)
(declare-fun call29366formal@$ptr@0 () Int)
(declare-fun %lbl%@109221 () Bool)
(declare-fun call29366formal@$val@0 () Int)
(declare-fun call29373formal@$x@0 () T@opn)
(declare-fun call29373formal@$y@0 () T@opn)
(declare-fun %lbl%@109269 () Bool)
(declare-fun %lbl%@109273 () Bool)
(declare-fun %lbl%+29491 () Bool)
(declare-fun %lbl%@108580 () Bool)
(declare-fun call29262formal@$ret@0 () Int)
(declare-fun %lbl%@108598 () Bool)
(declare-fun %lbl%@108600 () Bool)
(declare-fun %lbl%@108612 () Bool)
(declare-fun %lbl%@108615 () Bool)
(declare-fun %lbl%@108679 () Bool)
(declare-fun %lbl%@108707 () Bool)
(declare-fun $sMem@1@@0 () (Array Int Int))
(declare-fun NextEip (Int) Int)
(declare-fun $Eip@21 () Int)
(declare-fun %lbl%@108771 () Bool)
(declare-fun %lbl%@108778 () Bool)
(declare-fun esp@0@@2 () Int)
(declare-fun $RET@0 () T@ReturnTo)
(declare-fun $Mem@1@@0 () (Array Int Int))
(declare-fun %lbl%@108836 () Bool)
(declare-fun %lbl%@108838 () Bool)
(declare-fun %lbl%@108843 () Bool)
(declare-fun %lbl%@108849 () Bool)
(declare-fun %lbl%@108863 () Bool)
(declare-fun %lbl%@108881 () Bool)
(declare-fun %lbl%@108901 () Bool)
(declare-fun %lbl%@108929 () Bool)
(declare-fun $IoMmuEnabled@0 () Bool)
(declare-fun $Mem@2@@0 () (Array Int Int))
(declare-fun $sMem@2@@0 () (Array Int Int))
(declare-fun esp@1@@0 () Int)
(declare-fun call29408formal@$ptr@0 () Int)
(declare-fun %lbl%@109061 () Bool)
(declare-fun %lbl%@109089 () Bool)
(declare-fun call29413formal@$ptr@0 () Int)
(declare-fun %lbl%@109113 () Bool)
(declare-fun call29413formal@$val@0 () Int)
(declare-fun call29416formal@$ret@0 () Int)
(declare-fun %lbl%+29490 () Bool)
(declare-fun call29350formal@$x@0 () T@opn)
(declare-fun call29350formal@$y@0 () T@opn)
(declare-fun call29120formal@$ret@0 () Int)
(declare-fun %lbl%@108541 () Bool)
(declare-fun %lbl%@108545 () Bool)
(declare-fun %lbl%+29481 () Bool)
(declare-fun call29237formal@$val@0 () Int)
(declare-fun %lbl%@108244 () Bool)
(declare-fun $entry@2 () Int)
(declare-fun %lbl%@108263 () Bool)
(declare-fun call29276formal@$ret@0 () Int)
(declare-fun %lbl%@108291 () Bool)
(declare-fun %lbl%@108302 () Bool)
(declare-fun %lbl%@108305 () Bool)
(declare-fun %lbl%@108321 () Bool)
(declare-fun %lbl%@108333 () Bool)
(declare-fun %lbl%+29471 () Bool)
(declare-fun $Efl@8 () Int)
(declare-fun call29237formal@$ptr@0 () Int)
(declare-fun %lbl%@107915 () Bool)
(declare-fun call29242formal@$ptr@0 () Int)
(declare-fun %lbl%@107955 () Bool)
(declare-fun call29242formal@$val@0 () Int)
(declare-fun call29249formal@$x@0 () T@opn)
(declare-fun call29249formal@$y@0 () T@opn)
(declare-fun %lbl%@108003 () Bool)
(declare-fun %lbl%@108007 () Bool)
(declare-fun %lbl%+29469 () Bool)
(declare-fun call29435formal@$ret@0 () Int)
(declare-fun %lbl%+29468 () Bool)
(declare-fun call29226formal@$x@0 () T@opn)
(declare-fun call29226formal@$y@0 () T@opn)
(declare-fun %lbl%@107842 () Bool)
(declare-fun %lbl%@107846 () Bool)
(declare-fun %lbl%+29461 () Bool)
(declare-fun %lbl%@107051 () Bool)
(declare-fun %lbl%@107213 () Bool)
(declare-fun call29100formal@$ptr@0 () Int)
(declare-fun %lbl%@107260 () Bool)
(declare-fun %lbl%@107290 () Bool)
(declare-fun call29105formal@$ptr@0 () Int)
(declare-fun %lbl%@107354 () Bool)
(declare-fun %lbl%@107357 () Bool)
(declare-fun call29110formal@$ptr@0 () Int)
(declare-fun %lbl%@107396 () Bool)
(declare-fun call29110formal@$val@0 () Int)
(declare-fun call29113formal@$ret@0 () Int)
(declare-fun %lbl%@107451 () Bool)
(declare-fun call29117formal@$ret@0 () Int)
(declare-fun %lbl%@107509 () Bool)
(declare-fun call29128formal@$ret@0 () Int)
(declare-fun %lbl%@107537 () Bool)
(declare-fun %lbl%@107548 () Bool)
(declare-fun %lbl%@107551 () Bool)
(declare-fun %lbl%@107567 () Bool)
(declare-fun %lbl%@107579 () Bool)
(declare-fun %lbl%@107628 () Bool)
(declare-fun %lbl%@107656 () Bool)
(declare-fun %lbl%+106439 () Bool)
(push 1)
(set-info :boogie-vc-id ReadRsdt)
(assert (not
(let ((anon12_Then_correct (=> (! (and %lbl%+29501 true) :lblpos +29501) (=> (and
(Jne $Efl@24)
(= $entry@4 (+ $entry@3 1))) (and
(! (or %lbl%@109320 (word (+ esi@1@@0 4))) :lblneg @109320)
(=> (word (+ esi@1@@0 4)) (=> (= call29395formal@$ret@0 (+ esi@1@@0 4)) (and
(! (or %lbl%@109351 (= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0)))) :lblneg @109351)
(=> (= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0))) (and
(! (or %lbl%@109362 (TV $entry@4)) :lblneg @109362)
(=> (TV $entry@4) (and
(! (or %lbl%@109365 (= call29395formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@4)))) :lblneg @109365)
(=> (= call29395formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@4))) (and
(! (or %lbl%@109381 (and
(<= 0 $entry@4)
(<= $entry@4 ?RsdtCount))) :lblneg @109381)
(=> (and
(<= 0 $entry@4)
(<= $entry@4 ?RsdtCount)) (and
(! (or %lbl%@109393 (forall ((j@@27 Int) ) (! (=> (and
(TV j@@27)
(<= 0 j@@27)
(< j@@27 $entry@4)
(not (= j@@27 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@27))))))
 :qid |EntryCPb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@27))
))) :lblneg @109393)
(=> (forall ((j@@28 Int) ) (! (=> (and
(TV j@@28)
(<= 0 j@@28)
(< j@@28 $entry@4)
(not (= j@@28 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@28))))))
 :qid |EntryCPb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@28))
)) true)))))))))))))))))
(let ((anon10_Then_correct@@0 (=> (! (and %lbl%+29479 true) :lblpos +29479) (=> (and
(Jne $Efl@12@@0)
(= $entry@1@@2 (+ $entry@0@@2 1))) (and
(! (or %lbl%@108054 (word (+ esi@0@@0 4))) :lblneg @108054)
(=> (word (+ esi@0@@0 4)) (=> (= call29429formal@$ret@0 (+ esi@0@@0 4)) (and
(! (or %lbl%@108085 (= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0)))) :lblneg @108085)
(=> (= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0))) (and
(! (or %lbl%@108096 (TV $entry@1@@2)) :lblneg @108096)
(=> (TV $entry@1@@2) (and
(! (or %lbl%@108099 (= call29429formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@1@@2)))) :lblneg @108099)
(=> (= call29429formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@1@@2))) (and
(! (or %lbl%@108115 (and
(<= 0 $entry@1@@2)
(<= $entry@1@@2 ?RsdtCount))) :lblneg @108115)
(=> (and
(<= 0 $entry@1@@2)
(<= $entry@1@@2 ?RsdtCount)) (and
(! (or %lbl%@108127 (forall ((j@@29 Int) ) (! (=> (and
(TV j@@29)
(<= 0 j@@29)
(< j@@29 $entry@1@@2)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@29))))))
 :qid |EntryCPb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@29))
))) :lblneg @108127)
(=> (forall ((j@@30 Int) ) (! (=> (and
(TV j@@30)
(<= 0 j@@30)
(< j@@30 $entry@1@@2)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@30))))))
 :qid |EntryCPb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@30))
)) (and
(! (or %lbl%@108176 (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @108176)
(=> (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@108204 (SMemInv $sMem@0@@1 $sMem@@5 (+ call29091formal@$ret@0 4) esp)) :lblneg @108204)
(=> (SMemInv $sMem@0@@1 $sMem@@5 (+ call29091formal@$ret@0 4) esp) true)))))))))))))))))))))
(let ((GeneratedUnifiedExit_correct@@2 (=> (! (and %lbl%+106434 true) :lblpos +106434) (and
(! (or %lbl%@109839 (or
(and
(= DmaAddr@1 0)
(not $IoMmuEnabled@2))
(and
(= DmaAddr@1 ?dmaLo)
$IoMmuEnabled@2))) :lblneg @109839)
(=> (or
(and
(= DmaAddr@1 0)
(not $IoMmuEnabled@2))
(and
(= DmaAddr@1 ?dmaLo)
$IoMmuEnabled@2)) (and
(! (or %lbl%@109859 (MemInv $Mem@4 $sMem@4 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @109859)
(=> (MemInv $Mem@4 $sMem@4 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@109887 (SMemEnsure $sMem@4 $sMem@@5 esp@4 esp)) :lblneg @109887)
(=> (SMemEnsure $sMem@4 $sMem@@5 esp@4 esp) true)))))))))
(let ((done_correct@@0 (=> (! (and %lbl%+29510 true) :lblpos +29510) (and
(! (or %lbl%@109562 (word (+ esp@2 4))) :lblneg @109562)
(=> (word (+ esp@2 4)) (=> (and
(= call29439formal@$ret@0 (+ esp@2 4))
(= call29454formal@$oldMem@0 $Mem@@3)
(= call29454formal@$oldSMem@0 $sMem@@5)
(= call29454formal@$oldDMem@0 $dMem@@0)
(= call29454formal@$oldPciMem@0 $pciMem@@1)
(= call29454formal@$oldTMem@0 $tMems@@12)
(= call29454formal@$oldFMem@0 $fMems@@4)
(= call29454formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@109646 (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @109646)
(=> (MemInv $Mem@3 $sMem@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@109674 (MemInv call29454formal@$oldMem@0 call29454formal@$oldSMem@0 call29454formal@$oldDMem@0 call29454formal@$oldPciMem@0 call29454formal@$oldTMem@0 call29454formal@$oldFMem@0 call29454formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @109674)
(=> (MemInv call29454formal@$oldMem@0 call29454formal@$oldSMem@0 call29454formal@$oldDMem@0 call29454formal@$oldPciMem@0 call29454formal@$oldTMem@0 call29454formal@$oldFMem@0 call29454formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@109697 (= (select $sMem@3 call29439formal@$ret@0) (select call29454formal@$oldSMem@0 call29439formal@$ret@0))) :lblneg @109697)
(=> (= (select $sMem@3 call29439formal@$ret@0) (select call29454formal@$oldSMem@0 call29439formal@$ret@0)) (and
(! (or %lbl%@109707 (sAddr call29439formal@$ret@0)) :lblneg @109707)
(=> (sAddr call29439formal@$ret@0) (=> (= (select $Mem@3 call29439formal@$ret@0) (select call29454formal@$oldMem@0 call29439formal@$ret@0)) (=> (and
(= (select $Mem@3 call29439formal@$ret@0) (select $sMem@3 call29439formal@$ret@0))
(= call29457formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@109737 (= (ReturnToAddr (select $Mem@3 call29439formal@$ret@0)) call29457formal@$oldRA@0)) :lblneg @109737)
(=> (= (ReturnToAddr (select $Mem@3 call29439formal@$ret@0)) call29457formal@$oldRA@0) (and
(! (or %lbl%@109746 (Aligned call29439formal@$ret@0)) :lblneg @109746)
(=> (Aligned call29439formal@$ret@0) (=> (= esp@3 (+ call29439formal@$ret@0 4)) (=> (and
(Aligned esp@3)
(= DmaAddr@1 DmaAddr@0)) (=> (and
(= $IoMmuEnabled@2 $IoMmuEnabled@1)
(= $sMem@4 $sMem@3)
(= esp@4 esp@3)
(= $Mem@4 $Mem@3)) GeneratedUnifiedExit_correct@@2)))))))))))))))))))))))
(let ((anon12_Else_correct (=> (! (and %lbl%+29503 true) :lblpos +29503) (=> (and
(not (Jne $Efl@24))
(= call29382formal@$ret@0 0)
(= DmaAddr@0 call29382formal@$ret@0)
(= $Mem@3 $Mem@0@@1)
(= $RET@1 $RET@@0)
(= $IoMmuEnabled@1 $IoMmuEnabled@@0)
(= esp@2 call29091formal@$ret@0)
(= $sMem@3 $sMem@0@@1)) done_correct@@0))))
(let ((anon11_Else_correct (=> (! (and %lbl%+29493 true) :lblpos +29493) (=> (and
(not (Jae $Efl@17))
(= call29361formal@$ptr@0 (+ esi@1@@0 0))) (and
(! (or %lbl%@109181 (inRo call29361formal@$ptr@0 4)) :lblneg @109181)
(=> (inRo call29361formal@$ptr@0 4) (=> (word call29361formal@$val@0) (=> (and
(= call29361formal@$val@0 (ro32 call29361formal@$ptr@0))
(= call29366formal@$ptr@0 (+ call29361formal@$val@0 0))) (and
(! (or %lbl%@109221 (inRo call29366formal@$ptr@0 4)) :lblneg @109221)
(=> (inRo call29366formal@$ptr@0 4) (=> (and
(word call29366formal@$val@0)
(= call29366formal@$val@0 (ro32 call29366formal@$ptr@0))
(= call29373formal@$x@0 (OpnReg call29366formal@$val@0))
(= call29373formal@$y@0 (OpnReg 1380011332))) (and
(! (or %lbl%@109269 (OpnOk $Mem@0@@1 call29373formal@$x@0)) :lblneg @109269)
(=> (OpnOk $Mem@0@@1 call29373formal@$x@0) (and
(! (or %lbl%@109273 (OpnOk $Mem@0@@1 call29373formal@$y@0)) :lblneg @109273)
(=> (OpnOk $Mem@0@@1 call29373formal@$y@0) (=> (FlagsCmp $Efl@24 (EvalOpn $Mem@0@@1 call29373formal@$x@0) (EvalOpn $Mem@0@@1 call29373formal@$y@0)) (and
anon12_Then_correct
anon12_Else_correct)))))))))))))))))
(let ((anon11_Then_correct (=> (! (and %lbl%+29491 true) :lblpos +29491) (=> (Jae $Efl@17) (and
(! (or %lbl%@108580 (= call29262formal@$ret@0 (ro32 (+ (+ ?RsdtPtr 36) (* 4 $entry@0@@2))))) :lblneg @108580)
(=> (= call29262formal@$ret@0 (ro32 (+ (+ ?RsdtPtr 36) (* 4 $entry@0@@2)))) (and
(! (or %lbl%@108598 ?RsdpExists) :lblneg @108598)
(=> ?RsdpExists (and
(! (or %lbl%@108600 (and
(<= 0 $entry@0@@2)
(< $entry@0@@2 ?RsdtCount))) :lblneg @108600)
(=> (and
(<= 0 $entry@0@@2)
(< $entry@0@@2 ?RsdtCount)) (and
(! (or %lbl%@108612 (MatchesDmar call29262formal@$ret@0)) :lblneg @108612)
(=> (MatchesDmar call29262formal@$ret@0) (and
(! (or %lbl%@108615 (forall ((j@@31 Int) ) (! (=> (and
(TV j@@31)
(<= 0 j@@31)
(< j@@31 ?RsdtCount)
(not (= $entry@0@@2 j@@31))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@31))))))
 :qid |Ioibpl.125:20|
 :skolemid |32|
 :pattern ( (TV j@@31))
))) :lblneg @108615)
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
(= ?DmarPtr call29262formal@$ret@0)) (and
(! (or %lbl%@108679 (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @108679)
(=> (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@108707 (sAddr (- call29091formal@$ret@0 4))) :lblneg @108707)
(=> (sAddr (- call29091formal@$ret@0 4)) (=> (and
(= $sMem@1@@0 (store $sMem@0@@1 (- call29091formal@$ret@0 4) (NextEip $Eip@21)))
(MemInv (store $Mem@0@@1 (- call29091formal@$ret@0 4) (NextEip $Eip@21)) $sMem@1@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (and
(! (or %lbl%@108771 (memAddr (- call29091formal@$ret@0 4))) :lblneg @108771)
(=> (memAddr (- call29091formal@$ret@0 4)) (and
(! (or %lbl%@108778 (Aligned call29091formal@$ret@0)) :lblneg @108778)
(=> (Aligned call29091formal@$ret@0) (=> (and
(= esp@0@@2 (- call29091formal@$ret@0 4))
(Aligned esp@0@@2)
(= $RET@0 (ReturnToAddr (NextEip $Eip@21)))
(= $Mem@1@@0 (store $Mem@0@@1 esp@0@@2 (NextEip $Eip@21)))) (and
(! (or %lbl%@108836 ?DmarExists) :lblneg @108836)
(=> ?DmarExists (and
(! (or %lbl%@108838 (= call29262formal@$ret@0 ?DmarPtr)) :lblneg @108838)
(=> (= call29262formal@$ret@0 ?DmarPtr) (and
(! (or %lbl%@108843 (IoRootTable $IomMem@@7 ebx)) :lblneg @108843)
(=> (IoRootTable $IomMem@@7 ebx) (and
(! (or %lbl%@108849 (= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)) :lblneg @108849)
(=> (= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE) (and
(! (or %lbl%@108863 (= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) :lblneg @108863)
(=> (= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo)) (and
(! (or %lbl%@108881 (forall ((i@@137 Int) ) (! (= (select $IoMmuState i@@137) 0)
 :qid |EntryCPb.317:18|
 :skolemid |270|
 :pattern ( (select $IoMmuState i@@137))
))) :lblneg @108881)
(=> (forall ((i@@138 Int) ) (! (= (select $IoMmuState i@@138) 0)
 :qid |EntryCPb.317:18|
 :skolemid |270|
 :pattern ( (select $IoMmuState i@@138))
)) (and
(! (or %lbl%@108901 (MemInv $Mem@1@@0 $sMem@1@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @108901)
(=> (MemInv $Mem@1@@0 $sMem@1@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@108929 (SMemRequireRA 116 $sMem@1@@0 esp@0@@2 $RET@0)) :lblneg @108929)
(=> (SMemRequireRA 116 $sMem@1@@0 esp@0@@2 $RET@0) (=> (and
$IoMmuEnabled@0
(MemInv $Mem@2@@0 $sMem@2@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemEnsure $sMem@2@@0 $sMem@1@@0 esp@1@@0 esp@0@@2)
(= call29408formal@$ptr@0 (+ esp@1@@0 0))) (and
(! (or %lbl%@109061 (MemInv $Mem@2@@0 $sMem@2@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @109061)
(=> (MemInv $Mem@2@@0 $sMem@2@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@109089 (sAddr call29408formal@$ptr@0)) :lblneg @109089)
(=> (sAddr call29408formal@$ptr@0) (=> (and
(= (select $Mem@2@@0 call29408formal@$ptr@0) (select $sMem@2@@0 call29408formal@$ptr@0))
(= call29413formal@$ptr@0 (+ esp@1@@0 0))) (and
(! (or %lbl%@109113 (PtrOk call29413formal@$ptr@0)) :lblneg @109113)
(=> (PtrOk call29413formal@$ptr@0) (=> (word call29413formal@$val@0) (=> (and
(= call29413formal@$val@0 (select $Mem@2@@0 call29413formal@$ptr@0))
(= call29416formal@$ret@0 call29413formal@$val@0)
(= DmaAddr@0 call29416formal@$ret@0)
(= $Mem@3 $Mem@2@@0)
(= $RET@1 $RET@0)
(= $IoMmuEnabled@1 $IoMmuEnabled@0)
(= esp@2 esp@1@@0)
(= $sMem@3 $sMem@2@@0)) done_correct@@0)))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((__L13_correct (=> (! (and %lbl%+29490 true) :lblpos +29490) (=> (and
(not $IoMmuEnabled@@0)
(<= 0 $entry@0@@2)
(<= 1 $entry@3)
(= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0)))
(TV $entry@3)
(= esi@1@@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@3)))
(<= 0 $entry@3)
(<= $entry@3 ?RsdtCount)
(forall ((j@@33 Int) ) (! (=> (and
(TV j@@33)
(<= 0 j@@33)
(< j@@33 $entry@3)
(not (= j@@33 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@33))))))
 :qid |EntryCPb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@33))
))
(= call29350formal@$x@0 (OpnReg esi@1@@0))
(= call29350formal@$y@0 (OpnReg call29120formal@$ret@0))) (and
(! (or %lbl%@108541 (OpnOk $Mem@0@@1 call29350formal@$x@0)) :lblneg @108541)
(=> (OpnOk $Mem@0@@1 call29350formal@$x@0) (and
(! (or %lbl%@108545 (OpnOk $Mem@0@@1 call29350formal@$y@0)) :lblneg @108545)
(=> (OpnOk $Mem@0@@1 call29350formal@$y@0) (=> (FlagsCmp $Efl@17 (EvalOpn $Mem@0@@1 call29350formal@$x@0) (EvalOpn $Mem@0@@1 call29350formal@$y@0)) (and
anon11_Then_correct
anon11_Else_correct))))))))))
(let ((anon10_Else_correct@@0 (=> (! (and %lbl%+29481 true) :lblpos +29481) (=> (and
(not (Jne $Efl@12@@0))
(= call29262formal@$ret@0 call29237formal@$val@0)) (and
(! (or %lbl%@108244 (MatchesDmar call29262formal@$ret@0)) :lblneg @108244)
(=> (MatchesDmar call29262formal@$ret@0) (=> (= $entry@2 (+ $entry@0@@2 1)) (and
(! (or %lbl%@108263 (word (+ esi@0@@0 4))) :lblneg @108263)
(=> (word (+ esi@0@@0 4)) (=> (= call29276formal@$ret@0 (+ esi@0@@0 4)) (and
(! (or %lbl%@108291 (= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0)))) :lblneg @108291)
(=> (= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0))) (and
(! (or %lbl%@108302 (TV $entry@2)) :lblneg @108302)
(=> (TV $entry@2) (and
(! (or %lbl%@108305 (= call29276formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@2)))) :lblneg @108305)
(=> (= call29276formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@2))) (and
(! (or %lbl%@108321 (and
(<= 0 $entry@2)
(<= $entry@2 ?RsdtCount))) :lblneg @108321)
(=> (and
(<= 0 $entry@2)
(<= $entry@2 ?RsdtCount)) (and
(! (or %lbl%@108333 (forall ((j@@34 Int) ) (! (=> (and
(TV j@@34)
(<= 0 j@@34)
(< j@@34 $entry@2)
(not (= j@@34 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@34))))))
 :qid |EntryCPb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@34))
))) :lblneg @108333)
(=> (forall ((j@@35 Int) ) (! (=> (and
(TV j@@35)
(<= 0 j@@35)
(< j@@35 $entry@2)
(not (= j@@35 $entry@0@@2))) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@35))))))
 :qid |EntryCPb.428:18|
 :skolemid |275|
 :pattern ( (TV j@@35))
)) __L13_correct))))))))))))))))))))
(let ((anon9_Else_correct@@0 (=> (! (and %lbl%+29471 true) :lblpos +29471) (=> (and
(not (Jae $Efl@8))
(= call29237formal@$ptr@0 (+ esi@0@@0 0))) (and
(! (or %lbl%@107915 (inRo call29237formal@$ptr@0 4)) :lblneg @107915)
(=> (inRo call29237formal@$ptr@0 4) (=> (word call29237formal@$val@0) (=> (and
(= call29237formal@$val@0 (ro32 call29237formal@$ptr@0))
(= call29242formal@$ptr@0 (+ call29237formal@$val@0 0))) (and
(! (or %lbl%@107955 (inRo call29242formal@$ptr@0 4)) :lblneg @107955)
(=> (inRo call29242formal@$ptr@0 4) (=> (and
(word call29242formal@$val@0)
(= call29242formal@$val@0 (ro32 call29242formal@$ptr@0))
(= call29249formal@$x@0 (OpnReg call29242formal@$val@0))
(= call29249formal@$y@0 (OpnReg 1380011332))) (and
(! (or %lbl%@108003 (OpnOk $Mem@0@@1 call29249formal@$x@0)) :lblneg @108003)
(=> (OpnOk $Mem@0@@1 call29249formal@$x@0) (and
(! (or %lbl%@108007 (OpnOk $Mem@0@@1 call29249formal@$y@0)) :lblneg @108007)
(=> (OpnOk $Mem@0@@1 call29249formal@$y@0) (=> (FlagsCmp $Efl@12@@0 (EvalOpn $Mem@0@@1 call29249formal@$x@0) (EvalOpn $Mem@0@@1 call29249formal@$y@0)) (and
anon10_Then_correct@@0
anon10_Else_correct@@0)))))))))))))))))
(let ((anon9_Then_correct@@0 (=> (! (and %lbl%+29469 true) :lblpos +29469) (=> (and
(Jae $Efl@8)
(= call29435formal@$ret@0 0)
(= DmaAddr@0 call29435formal@$ret@0)
(= $Mem@3 $Mem@0@@1)
(= $RET@1 $RET@@0)
(= $IoMmuEnabled@1 $IoMmuEnabled@@0)
(= esp@2 call29091formal@$ret@0)
(= $sMem@3 $sMem@0@@1)) done_correct@@0))))
(let ((__L10_correct (=> (! (and %lbl%+29468 true) :lblpos +29468) (=> (and
(not $IoMmuEnabled@@0)
(<= 0 $entry@0@@2)
(= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0)))
(TV $entry@0@@2)
(= esi@0@@0 (+ (+ ?RsdtPtr 36) (* 4 $entry@0@@2)))
(<= 0 $entry@0@@2)
(<= $entry@0@@2 ?RsdtCount)
(forall ((j@@36 Int) ) (! (=> (and
(TV j@@36)
(<= 0 j@@36)
(< j@@36 $entry@0@@2)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@36))))))
 :qid |EntryCPb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@36))
))
(MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemInv $sMem@0@@1 $sMem@@5 (+ call29091formal@$ret@0 4) esp)
(= call29226formal@$x@0 (OpnReg esi@0@@0))
(= call29226formal@$y@0 (OpnReg call29120formal@$ret@0))) (and
(! (or %lbl%@107842 (OpnOk $Mem@0@@1 call29226formal@$x@0)) :lblneg @107842)
(=> (OpnOk $Mem@0@@1 call29226formal@$x@0) (and
(! (or %lbl%@107846 (OpnOk $Mem@0@@1 call29226formal@$y@0)) :lblneg @107846)
(=> (OpnOk $Mem@0@@1 call29226formal@$y@0) (=> (FlagsCmp $Efl@8 (EvalOpn $Mem@0@@1 call29226formal@$x@0) (EvalOpn $Mem@0@@1 call29226formal@$y@0)) (and
anon9_Then_correct@@0
anon9_Else_correct@@0))))))))))
(let ((anon0_correct@@10 (=> (! (and %lbl%+29461 true) :lblpos +29461) (and
(! (or %lbl%@107051 (Aligned esp)) :lblneg @107051)
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
(! (or %lbl%@107213 (word (- esp 4))) :lblneg @107213)
(=> (word (- esp 4)) (=> (and
(= call29091formal@$ret@0 (- esp 4))
(= call29100formal@$ptr@0 (+ call29091formal@$ret@0 0))) (and
(! (or %lbl%@107260 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @107260)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@107290 (sAddr call29100formal@$ptr@0)) :lblneg @107290)
(=> (sAddr call29100formal@$ptr@0) (=> (MemInv (store $Mem@@3 call29100formal@$ptr@0 ebp) $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0@@1 (store $sMem@@5 call29100formal@$ptr@0 ebp))
(= call29105formal@$ptr@0 (+ call29091formal@$ret@0 0))) (and
(! (or %lbl%@107354 (PtrOk call29105formal@$ptr@0)) :lblneg @107354)
(=> (PtrOk call29105formal@$ptr@0) (and
(! (or %lbl%@107357 (word ebp)) :lblneg @107357)
(=> (word ebp) (=> (and
(= $Mem@0@@1 (store $Mem@@3 call29105formal@$ptr@0 ebp))
(= call29110formal@$ptr@0 (+ esi 4))) (and
(! (or %lbl%@107396 (inRo call29110formal@$ptr@0 4)) :lblneg @107396)
(=> (inRo call29110formal@$ptr@0 4) (=> (word call29110formal@$val@0) (=> (and
(= call29110formal@$val@0 (ro32 call29110formal@$ptr@0))
(= call29113formal@$ret@0 esi)) (and
(! (or %lbl%@107451 (word (+ call29113formal@$ret@0 call29110formal@$val@0))) :lblneg @107451)
(=> (word (+ call29113formal@$ret@0 call29110formal@$val@0)) (=> (and
(= call29117formal@$ret@0 (+ call29113formal@$ret@0 call29110formal@$val@0))
(= call29120formal@$ret@0 call29117formal@$ret@0)) (and
(! (or %lbl%@107509 (word (+ esi 36))) :lblneg @107509)
(=> (word (+ esi 36)) (=> (= call29128formal@$ret@0 (+ esi 36)) (and
(! (or %lbl%@107537 (= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0)))) :lblneg @107537)
(=> (= ebp (select $sMem@0@@1 (+ call29091formal@$ret@0 0))) (and
(! (or %lbl%@107548 (TV 0)) :lblneg @107548)
(=> (TV 0) (and
(! (or %lbl%@107551 (= call29128formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 0)))) :lblneg @107551)
(=> (= call29128formal@$ret@0 (+ (+ ?RsdtPtr 36) (* 4 0))) (and
(! (or %lbl%@107567 (and
(<= 0 0)
(<= 0 ?RsdtCount))) :lblneg @107567)
(=> (and
(<= 0 0)
(<= 0 ?RsdtCount)) (and
(! (or %lbl%@107579 (forall ((j@@37 Int) ) (! (=> (and
(TV j@@37)
(<= 0 j@@37)
(< j@@37 0)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@37))))))
 :qid |EntryCPb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@37))
))) :lblneg @107579)
(=> (forall ((j@@38 Int) ) (! (=> (and
(TV j@@38)
(<= 0 j@@38)
(< j@@38 0)) (not (MatchesDmar (ro32 (+ (+ ?RsdtPtr 36) (* 4 j@@38))))))
 :qid |EntryCPb.409:18|
 :skolemid |274|
 :pattern ( (TV j@@38))
)) (and
(! (or %lbl%@107628 (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @107628)
(=> (MemInv $Mem@0@@1 $sMem@0@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@107656 (SMemInv $sMem@0@@1 $sMem@@5 (+ call29091formal@$ret@0 4) esp)) :lblneg @107656)
(=> (SMemInv $sMem@0@@1 $sMem@@5 (+ call29091formal@$ret@0 4) esp) __L10_correct))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@10 (=> (! (and %lbl%+106439 true) :lblpos +106439) (=> ?RsdpExists (=> (and
(not $IoMmuEnabled@@0)
(= esi ?RsdtPtr)) (=> (and
(= ebp ?dmaLo)
(word ebp)
(IoRootTable $IomMem@@7 ebx)
(= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)
(= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))
(forall ((i@@139 Int) ) (! (= (select $IoMmuState i@@139) 0)
 :qid |EntryCPb.387:18|
 :skolemid |273|
 :pattern ( (select $IoMmuState i@@139))
))
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 124 $sMem@@5 esp $RET@@0)) anon0_correct@@10))))))
PreconditionGeneratedEntry_correct@@10))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+29987 () Bool)
(declare-fun $Efl@17@@0 () Int)
(declare-fun %lbl%@111895 () Bool)
(declare-fun edi@1 () Int)
(declare-fun call29852formal@$val@0 () Int)
(declare-fun ebp@1 () Int)
(declare-fun call29856formal@$ret@0 () Int)
(declare-fun %lbl%@111961 () Bool)
(declare-fun call29860formal@$ret@0 () Int)
(declare-fun %lbl%@111992 () Bool)
(declare-fun $sMem@0@@2 () (Array Int Int))
(declare-fun call29650formal@$ret@0 () Int)
(declare-fun %lbl%@112003 () Bool)
(declare-fun esi@0@@1 () Int)
(declare-fun %lbl%@112011 () Bool)
(declare-fun %lbl%@112025 () Bool)
(declare-fun %lbl%+30004 () Bool)
(declare-fun $entry@1@@3 () Int)
(declare-fun $entry@0@@3 () Int)
(declare-fun %lbl%@112959 () Bool)
(declare-fun call29913formal@$ret@0 () Int)
(declare-fun %lbl%@112992 () Bool)
(declare-fun %lbl%@113003 () Bool)
(declare-fun %lbl%@113006 () Bool)
(declare-fun %lbl%@113018 () Bool)
(declare-fun %lbl%@113034 () Bool)
(declare-fun %lbl%+30003 () Bool)
(declare-fun %lbl%+29996 () Bool)
(declare-fun $Efl@19 () Int)
(declare-fun %lbl%+29973 () Bool)
(declare-fun $Efl@11 () Int)
(declare-fun %lbl%+29963 () Bool)
(declare-fun $Efl@10@@0 () Int)
(declare-fun %lbl%+110010 () Bool)
(declare-fun %lbl%@113149 () Bool)
(declare-fun DmaAddr@2 () Int)
(declare-fun $IoMmuEnabled@2@@0 () Bool)
(declare-fun %lbl%@113169 () Bool)
(declare-fun $Mem@4@@0 () (Array Int Int))
(declare-fun $sMem@4@@0 () (Array Int Int))
(declare-fun %lbl%@113197 () Bool)
(declare-fun esp@4@@0 () Int)
(declare-fun %lbl%+30007 () Bool)
(declare-fun %lbl%@112730 () Bool)
(declare-fun esp@2@@0 () Int)
(declare-fun call29923formal@$ret@0 () Int)
(declare-fun call29938formal@$oldMem@0 () (Array Int Int))
(declare-fun call29938formal@$oldSMem@0 () (Array Int Int))
(declare-fun call29938formal@$oldDMem@0 () (Array Int Int))
(declare-fun call29938formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call29938formal@$oldTMem@0 () (Array Int (Array Int Int)))
(declare-fun call29938formal@$oldFMem@0 () (Array Int (Array Int Int)))
(declare-fun call29938formal@$oldGcMem@0 () (Array Int Int))
(declare-fun %lbl%@112814 () Bool)
(declare-fun $Mem@3@@0 () (Array Int Int))
(declare-fun $sMem@3@@0 () (Array Int Int))
(declare-fun %lbl%@112842 () Bool)
(declare-fun %lbl%@112865 () Bool)
(declare-fun %lbl%@112875 () Bool)
(declare-fun call29941formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@112905 () Bool)
(declare-fun %lbl%@112914 () Bool)
(declare-fun esp@3@@0 () Int)
(declare-fun $IoMmuEnabled@1@@0 () Bool)
(declare-fun DmaAddr@1@@0 () Int)
(declare-fun %lbl%+29998 () Bool)
(declare-fun %lbl%@112046 () Bool)
(declare-fun %lbl%@112058 () Bool)
(declare-fun %lbl%@112061 () Bool)
(declare-fun %lbl%@112064 () Bool)
(declare-fun call29888formal@$ptr@0 () Int)
(declare-fun %lbl%@112131 () Bool)
(declare-fun call29888formal@$val@0 () Int)
(declare-fun call29892formal@$ptr@0 () Int)
(declare-fun %lbl%@112171 () Bool)
(declare-fun $Mem@0@@2 () (Array Int Int))
(declare-fun %lbl%@112199 () Bool)
(declare-fun call29897formal@$ptr@0 () Int)
(declare-fun %lbl%@112223 () Bool)
(declare-fun call29897formal@$val@0 () Int)
(declare-fun %lbl%@112251 () Bool)
(declare-fun %lbl%@112279 () Bool)
(declare-fun $sMem@1@@1 () (Array Int Int))
(declare-fun $Eip@30 () Int)
(declare-fun %lbl%@112343 () Bool)
(declare-fun %lbl%@112350 () Bool)
(declare-fun esp@0@@3 () Int)
(declare-fun $RET@0@@0 () T@ReturnTo)
(declare-fun $Mem@1@@1 () (Array Int Int))
(declare-fun %lbl%@112408 () Bool)
(declare-fun %lbl%@112410 () Bool)
(declare-fun %lbl%@112414 () Bool)
(declare-fun %lbl%@112419 () Bool)
(declare-fun %lbl%@112429 () Bool)
(declare-fun %lbl%@112435 () Bool)
(declare-fun %lbl%@112449 () Bool)
(declare-fun %lbl%@112467 () Bool)
(declare-fun %lbl%@112487 () Bool)
(declare-fun %lbl%@112515 () Bool)
(declare-fun DmaAddr@0@@0 () Int)
(declare-fun $IoMmuEnabled@0@@0 () Bool)
(declare-fun $Mem@2@@1 () (Array Int Int))
(declare-fun $sMem@2@@1 () (Array Int Int))
(declare-fun esp@1@@1 () Int)
(declare-fun $RET@2 () T@ReturnTo)
(declare-fun $RET@1@@0 () T@ReturnTo)
(declare-fun %lbl%+29985 () Bool)
(declare-fun call29867formal@$ret@0 () Int)
(declare-fun call29874formal@$x@0 () T@opn)
(declare-fun call29874formal@$y@0 () T@opn)
(declare-fun %lbl%@111856 () Bool)
(declare-fun %lbl%@111860 () Bool)
(declare-fun %lbl%+29984 () Bool)
(declare-fun call29832formal@$ret@0 () Int)
(declare-fun %lbl%@111726 () Bool)
(declare-fun call29836formal@$ret@0 () Int)
(declare-fun call29843formal@$x@0 () T@opn)
(declare-fun call29843formal@$y@0 () T@opn)
(declare-fun %lbl%@111772 () Bool)
(declare-fun %lbl%@111776 () Bool)
(declare-fun %lbl%+29975 () Bool)
(declare-fun call29793formal@$ret@0 () Int)
(declare-fun call29796formal@$ret@0 () Int)
(declare-fun %lbl%@111580 () Bool)
(declare-fun %lbl%@111591 () Bool)
(declare-fun %lbl%@111599 () Bool)
(declare-fun %lbl%@111613 () Bool)
(declare-fun %lbl%+29965 () Bool)
(declare-fun call29784formal@$x@0 () T@opn)
(declare-fun call29764formal@$val@0 () Int)
(declare-fun call29784formal@$y@0 () T@opn)
(declare-fun %lbl%@111497 () Bool)
(declare-fun %lbl%@111501 () Bool)
(declare-fun %lbl%+29955 () Bool)
(declare-fun $Efl@6@@1 () Int)
(declare-fun call29759formal@$ptr@0 () Int)
(declare-fun %lbl%@111350 () Bool)
(declare-fun call29759formal@$val@0 () Int)
(declare-fun call29764formal@$ptr@0 () Int)
(declare-fun %lbl%@111390 () Bool)
(declare-fun call29771formal@$x@0 () T@opn)
(declare-fun call29771formal@$y@0 () T@opn)
(declare-fun %lbl%@111438 () Bool)
(declare-fun %lbl%@111442 () Bool)
(declare-fun %lbl%+29953 () Bool)
(declare-fun call29919formal@$ret@0 () Int)
(declare-fun %lbl%+29952 () Bool)
(declare-fun call29737formal@$ret@0 () Int)
(declare-fun %lbl%@111231 () Bool)
(declare-fun call29741formal@$ret@0 () Int)
(declare-fun call29748formal@$x@0 () T@opn)
(declare-fun call29748formal@$y@0 () T@opn)
(declare-fun %lbl%@111277 () Bool)
(declare-fun %lbl%@111281 () Bool)
(declare-fun %lbl%+29945 () Bool)
(declare-fun %lbl%@110619 () Bool)
(declare-fun %lbl%@110781 () Bool)
(declare-fun call29659formal@$ptr@0 () Int)
(declare-fun %lbl%@110828 () Bool)
(declare-fun %lbl%@110858 () Bool)
(declare-fun call29664formal@$ptr@0 () Int)
(declare-fun %lbl%@110922 () Bool)
(declare-fun %lbl%@110925 () Bool)
(declare-fun call29671formal@$ret@0 () Int)
(declare-fun %lbl%@110977 () Bool)
(declare-fun %lbl%@110988 () Bool)
(declare-fun %lbl%@110991 () Bool)
(declare-fun %lbl%@111003 () Bool)
(declare-fun %lbl%@111019 () Bool)
(declare-fun %lbl%+110015 () Bool)
(push 1)
(set-info :boogie-vc-id StartIoMmu)
(assert (not
(let ((anon14_Else_correct (=> (! (and %lbl%+29987 true) :lblpos +29987) (=> (not (Jae $Efl@17@@0)) (and
(! (or %lbl%@111895 (inRo edi@1 1)) :lblneg @111895)
(=> (inRo edi@1 1) (=> (and
(word call29852formal@$val@0)
(= call29852formal@$val@0 (roU8 edi@1))
(word (+ ebp@1 call29852formal@$val@0))
(= call29856formal@$ret@0 (+ ebp@1 call29852formal@$val@0))) (and
(! (or %lbl%@111961 (word (+ edi@1 1))) :lblneg @111961)
(=> (word (+ edi@1 1)) (=> (= call29860formal@$ret@0 (+ edi@1 1)) (and
(! (or %lbl%@111992 (= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0)))) :lblneg @111992)
(=> (= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0))) (and
(! (or %lbl%@112003 (and
(TV esi@0@@1)
(TV call29860formal@$ret@0))) :lblneg @112003)
(=> (and
(TV esi@0@@1)
(TV call29860formal@$ret@0)) (and
(! (or %lbl%@112011 (and
(<= esi@0@@1 call29860formal@$ret@0)
(<= call29860formal@$ret@0 (+ esi@0@@1 20)))) :lblneg @112011)
(=> (and
(<= esi@0@@1 call29860formal@$ret@0)
(<= call29860formal@$ret@0 (+ esi@0@@1 20))) (and
(! (or %lbl%@112025 (= call29856formal@$ret@0 (ByteSum esi@0@@1 call29860formal@$ret@0))) :lblneg @112025)
(=> (= call29856formal@$ret@0 (ByteSum esi@0@@1 call29860formal@$ret@0)) true))))))))))))))))))
(let ((__L18_correct (=> (! (and %lbl%+30004 true) :lblpos +30004) (=> (= $entry@1@@3 (+ $entry@0@@3 1)) (and
(! (or %lbl%@112959 (word (+ esi@0@@1 16))) :lblneg @112959)
(=> (word (+ esi@0@@1 16)) (=> (= call29913formal@$ret@0 (+ esi@0@@1 16)) (and
(! (or %lbl%@112992 (= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0)))) :lblneg @112992)
(=> (= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0))) (and
(! (or %lbl%@113003 (TV $entry@1@@3)) :lblneg @113003)
(=> (TV $entry@1@@3) (and
(! (or %lbl%@113006 (= call29913formal@$ret@0 (+ ?RoBiosLo (* 16 $entry@1@@3)))) :lblneg @113006)
(=> (= call29913formal@$ret@0 (+ ?RoBiosLo (* 16 $entry@1@@3))) (and
(! (or %lbl%@113018 (and
(<= ?RoBiosLo call29913formal@$ret@0)
(<= call29913formal@$ret@0 (- ?RoBiosHi 16)))) :lblneg @113018)
(=> (and
(<= ?RoBiosLo call29913formal@$ret@0)
(<= call29913formal@$ret@0 (- ?RoBiosHi 16))) (and
(! (or %lbl%@113034 (forall ((j@@39 Int) ) (! (=> (and
(TV j@@39)
(< j@@39 $entry@1@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@39)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@39)))))
 :qid |EntryCPb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@39))
))) :lblneg @113034)
(=> (forall ((j@@40 Int) ) (! (=> (and
(TV j@@40)
(< j@@40 $entry@1@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@40)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@40)))))
 :qid |EntryCPb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@40))
)) true)))))))))))))))))
(let ((__L19_correct (=> (! (and %lbl%+30003 true) :lblpos +30003) __L18_correct)))
(let ((anon15_Then_correct (=> (! (and %lbl%+29996 true) :lblpos +29996) (=> (Jne $Efl@19) __L19_correct))))
(let ((anon13_Then_correct (=> (! (and %lbl%+29973 true) :lblpos +29973) (=> (Jne $Efl@11) __L18_correct))))
(let ((anon12_Then_correct@@0 (=> (! (and %lbl%+29963 true) :lblpos +29963) (=> (Jne $Efl@10@@0) __L18_correct))))
(let ((GeneratedUnifiedExit_correct@@3 (=> (! (and %lbl%+110010 true) :lblpos +110010) (and
(! (or %lbl%@113149 (or
(and
(= DmaAddr@2 0)
(not $IoMmuEnabled@2@@0))
(and
(= DmaAddr@2 ?dmaLo)
$IoMmuEnabled@2@@0))) :lblneg @113149)
(=> (or
(and
(= DmaAddr@2 0)
(not $IoMmuEnabled@2@@0))
(and
(= DmaAddr@2 ?dmaLo)
$IoMmuEnabled@2@@0)) (and
(! (or %lbl%@113169 (MemInv $Mem@4@@0 $sMem@4@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @113169)
(=> (MemInv $Mem@4@@0 $sMem@4@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@113197 (SMemEnsure $sMem@4@@0 $sMem@@5 esp@4@@0 esp)) :lblneg @113197)
(=> (SMemEnsure $sMem@4@@0 $sMem@@5 esp@4@@0 esp) true)))))))))
(let ((done_correct@@1 (=> (! (and %lbl%+30007 true) :lblpos +30007) (and
(! (or %lbl%@112730 (word (+ esp@2@@0 4))) :lblneg @112730)
(=> (word (+ esp@2@@0 4)) (=> (and
(= call29923formal@$ret@0 (+ esp@2@@0 4))
(= call29938formal@$oldMem@0 $Mem@@3)
(= call29938formal@$oldSMem@0 $sMem@@5)
(= call29938formal@$oldDMem@0 $dMem@@0)
(= call29938formal@$oldPciMem@0 $pciMem@@1)
(= call29938formal@$oldTMem@0 $tMems@@12)
(= call29938formal@$oldFMem@0 $fMems@@4)
(= call29938formal@$oldGcMem@0 $gcMem@@4)) (and
(! (or %lbl%@112814 (MemInv $Mem@3@@0 $sMem@3@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112814)
(=> (MemInv $Mem@3@@0 $sMem@3@@0 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112842 (MemInv call29938formal@$oldMem@0 call29938formal@$oldSMem@0 call29938formal@$oldDMem@0 call29938formal@$oldPciMem@0 call29938formal@$oldTMem@0 call29938formal@$oldFMem@0 call29938formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112842)
(=> (MemInv call29938formal@$oldMem@0 call29938formal@$oldSMem@0 call29938formal@$oldDMem@0 call29938formal@$oldPciMem@0 call29938formal@$oldTMem@0 call29938formal@$oldFMem@0 call29938formal@$oldGcMem@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112865 (= (select $sMem@3@@0 call29923formal@$ret@0) (select call29938formal@$oldSMem@0 call29923formal@$ret@0))) :lblneg @112865)
(=> (= (select $sMem@3@@0 call29923formal@$ret@0) (select call29938formal@$oldSMem@0 call29923formal@$ret@0)) (and
(! (or %lbl%@112875 (sAddr call29923formal@$ret@0)) :lblneg @112875)
(=> (sAddr call29923formal@$ret@0) (=> (= (select $Mem@3@@0 call29923formal@$ret@0) (select call29938formal@$oldMem@0 call29923formal@$ret@0)) (=> (and
(= (select $Mem@3@@0 call29923formal@$ret@0) (select $sMem@3@@0 call29923formal@$ret@0))
(= call29941formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@112905 (= (ReturnToAddr (select $Mem@3@@0 call29923formal@$ret@0)) call29941formal@$oldRA@0)) :lblneg @112905)
(=> (= (ReturnToAddr (select $Mem@3@@0 call29923formal@$ret@0)) call29941formal@$oldRA@0) (and
(! (or %lbl%@112914 (Aligned call29923formal@$ret@0)) :lblneg @112914)
(=> (Aligned call29923formal@$ret@0) (=> (= esp@3@@0 (+ call29923formal@$ret@0 4)) (=> (and
(Aligned esp@3@@0)
(= $IoMmuEnabled@2@@0 $IoMmuEnabled@1@@0)) (=> (and
(= esp@4@@0 esp@3@@0)
(= $sMem@4@@0 $sMem@3@@0)
(= $Mem@4@@0 $Mem@3@@0)
(= DmaAddr@2 DmaAddr@1@@0)) GeneratedUnifiedExit_correct@@3)))))))))))))))))))))))
(let ((anon15_Else_correct (=> (! (and %lbl%+29998 true) :lblpos +29998) (=> (not (Jne $Efl@19)) (and
(! (or %lbl%@112046 (= esi@0@@1 (+ ?RoBiosLo (* 16 $entry@0@@3)))) :lblneg @112046)
(=> (= esi@0@@1 (+ ?RoBiosLo (* 16 $entry@0@@3))) (and
(! (or %lbl%@112058 (inBiosRo esi@0@@1)) :lblneg @112058)
(=> (inBiosRo esi@0@@1) (and
(! (or %lbl%@112061 (MatchesRsdp esi@0@@1)) :lblneg @112061)
(=> (MatchesRsdp esi@0@@1) (and
(! (or %lbl%@112064 (forall ((j@@41 Int) ) (! (=> (and
(TV j@@41)
(< j@@41 $entry@0@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@41)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@41)))))
 :qid |Ioibpl.115:20|
 :skolemid |31|
 :pattern ( (TV j@@41))
))) :lblneg @112064)
(=> (forall ((j@@42 Int) ) (! (=> (and
(TV j@@42)
(< j@@42 $entry@0@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@42)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@42)))))
 :qid |Ioibpl.115:20|
 :skolemid |31|
 :pattern ( (TV j@@42))
)) (=> ?RsdpExists (=> (and
(= ?RsdpPtr esi@0@@1)
(= call29888formal@$ptr@0 (+ esi@0@@1 16))) (and
(! (or %lbl%@112131 (inRo call29888formal@$ptr@0 4)) :lblneg @112131)
(=> (inRo call29888formal@$ptr@0 4) (=> (word call29888formal@$val@0) (=> (and
(= call29888formal@$val@0 (ro32 call29888formal@$ptr@0))
(= call29892formal@$ptr@0 (+ call29650formal@$ret@0 0))) (and
(! (or %lbl%@112171 (MemInv $Mem@0@@2 $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112171)
(=> (MemInv $Mem@0@@2 $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112199 (sAddr call29892formal@$ptr@0)) :lblneg @112199)
(=> (sAddr call29892formal@$ptr@0) (=> (and
(= (select $Mem@0@@2 call29892formal@$ptr@0) (select $sMem@0@@2 call29892formal@$ptr@0))
(= call29897formal@$ptr@0 (+ call29650formal@$ret@0 0))) (and
(! (or %lbl%@112223 (PtrOk call29897formal@$ptr@0)) :lblneg @112223)
(=> (PtrOk call29897formal@$ptr@0) (=> (and
(word call29897formal@$val@0)
(= call29897formal@$val@0 (select $Mem@0@@2 call29897formal@$ptr@0))) (and
(! (or %lbl%@112251 (MemInv $Mem@0@@2 $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112251)
(=> (MemInv $Mem@0@@2 $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112279 (sAddr (- call29650formal@$ret@0 4))) :lblneg @112279)
(=> (sAddr (- call29650formal@$ret@0 4)) (=> (and
(= $sMem@1@@1 (store $sMem@0@@2 (- call29650formal@$ret@0 4) (NextEip $Eip@30)))
(MemInv (store $Mem@0@@2 (- call29650formal@$ret@0 4) (NextEip $Eip@30)) $sMem@1@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (and
(! (or %lbl%@112343 (memAddr (- call29650formal@$ret@0 4))) :lblneg @112343)
(=> (memAddr (- call29650formal@$ret@0 4)) (and
(! (or %lbl%@112350 (Aligned call29650formal@$ret@0)) :lblneg @112350)
(=> (Aligned call29650formal@$ret@0) (=> (and
(= esp@0@@3 (- call29650formal@$ret@0 4))
(Aligned esp@0@@3)
(= $RET@0@@0 (ReturnToAddr (NextEip $Eip@30)))
(= $Mem@1@@1 (store $Mem@0@@2 esp@0@@3 (NextEip $Eip@30)))) (and
(! (or %lbl%@112408 ?RsdpExists) :lblneg @112408)
(=> ?RsdpExists (and
(! (or %lbl%@112410 (not $IoMmuEnabled@@0)) :lblneg @112410)
(=> (not $IoMmuEnabled@@0) (and
(! (or %lbl%@112414 (= call29888formal@$val@0 ?RsdtPtr)) :lblneg @112414)
(=> (= call29888formal@$val@0 ?RsdtPtr) (and
(! (or %lbl%@112419 (and
(= call29897formal@$val@0 ?dmaLo)
(word call29897formal@$val@0))) :lblneg @112419)
(=> (and
(= call29897formal@$val@0 ?dmaLo)
(word call29897formal@$val@0)) (and
(! (or %lbl%@112429 (IoRootTable $IomMem@@7 ebx)) :lblneg @112429)
(=> (IoRootTable $IomMem@@7 ebx) (and
(! (or %lbl%@112435 (= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)) :lblneg @112435)
(=> (= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE) (and
(! (or %lbl%@112449 (= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))) :lblneg @112449)
(=> (= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo)) (and
(! (or %lbl%@112467 (forall ((i@@140 Int) ) (! (= (select $IoMmuState i@@140) 0)
 :qid |EntryCPb.387:18|
 :skolemid |273|
 :pattern ( (select $IoMmuState i@@140))
))) :lblneg @112467)
(=> (forall ((i@@141 Int) ) (! (= (select $IoMmuState i@@141) 0)
 :qid |EntryCPb.387:18|
 :skolemid |273|
 :pattern ( (select $IoMmuState i@@141))
)) (and
(! (or %lbl%@112487 (MemInv $Mem@1@@1 $sMem@1@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @112487)
(=> (MemInv $Mem@1@@1 $sMem@1@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@112515 (SMemRequireRA 124 $sMem@1@@1 esp@0@@3 $RET@0@@0)) :lblneg @112515)
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
(let ((anon14_Then_correct (=> (! (and %lbl%+29985 true) :lblpos +29985) (=> (Jae $Efl@17@@0) (=> (and
(= call29867formal@$ret@0 (q@and ebp@1 255))
(word call29867formal@$ret@0)
(= call29874formal@$x@0 (OpnReg call29867formal@$ret@0))
(= call29874formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@111856 (OpnOk $Mem@0@@2 call29874formal@$x@0)) :lblneg @111856)
(=> (OpnOk $Mem@0@@2 call29874formal@$x@0) (and
(! (or %lbl%@111860 (OpnOk $Mem@0@@2 call29874formal@$y@0)) :lblneg @111860)
(=> (OpnOk $Mem@0@@2 call29874formal@$y@0) (=> (FlagsCmp $Efl@19 (EvalOpn $Mem@0@@2 call29874formal@$x@0) (EvalOpn $Mem@0@@2 call29874formal@$y@0)) (and
anon15_Then_correct
anon15_Else_correct)))))))))))
(let ((__L20_correct (=> (! (and %lbl%+29984 true) :lblpos +29984) (=> (and
(not $IoMmuEnabled@@0)
(<= 917504 esi@0@@1)
(<= 917504 edi@1)
(<= 0 $entry@0@@3)
(= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0)))
(TV esi@0@@1)
(TV edi@1)
(<= esi@0@@1 edi@1)
(<= edi@1 (+ esi@0@@1 20))
(= ebp@1 (ByteSum esi@0@@1 edi@1))
(= call29832formal@$ret@0 esi@0@@1)) (and
(! (or %lbl%@111726 (word (+ call29832formal@$ret@0 20))) :lblneg @111726)
(=> (word (+ call29832formal@$ret@0 20)) (=> (= call29836formal@$ret@0 (+ call29832formal@$ret@0 20)) (=> (and
(= call29843formal@$x@0 (OpnReg edi@1))
(= call29843formal@$y@0 (OpnReg call29836formal@$ret@0))) (and
(! (or %lbl%@111772 (OpnOk $Mem@0@@2 call29843formal@$x@0)) :lblneg @111772)
(=> (OpnOk $Mem@0@@2 call29843formal@$x@0) (and
(! (or %lbl%@111776 (OpnOk $Mem@0@@2 call29843formal@$y@0)) :lblneg @111776)
(=> (OpnOk $Mem@0@@2 call29843formal@$y@0) (=> (FlagsCmp $Efl@17@@0 (EvalOpn $Mem@0@@2 call29843formal@$x@0) (EvalOpn $Mem@0@@2 call29843formal@$y@0)) (and
anon14_Then_correct
anon14_Else_correct))))))))))))))
(let ((anon13_Else_correct (=> (! (and %lbl%+29975 true) :lblpos +29975) (=> (not (Jne $Efl@11)) (=> (and
(= call29793formal@$ret@0 esi@0@@1)
(= call29796formal@$ret@0 0)) (and
(! (or %lbl%@111580 (= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0)))) :lblneg @111580)
(=> (= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0))) (and
(! (or %lbl%@111591 (and
(TV esi@0@@1)
(TV call29793formal@$ret@0))) :lblneg @111591)
(=> (and
(TV esi@0@@1)
(TV call29793formal@$ret@0)) (and
(! (or %lbl%@111599 (and
(<= esi@0@@1 call29793formal@$ret@0)
(<= call29793formal@$ret@0 (+ esi@0@@1 20)))) :lblneg @111599)
(=> (and
(<= esi@0@@1 call29793formal@$ret@0)
(<= call29793formal@$ret@0 (+ esi@0@@1 20))) (and
(! (or %lbl%@111613 (= call29796formal@$ret@0 (ByteSum esi@0@@1 call29793formal@$ret@0))) :lblneg @111613)
(=> (= call29796formal@$ret@0 (ByteSum esi@0@@1 call29793formal@$ret@0)) __L20_correct)))))))))))))
(let ((anon12_Else_correct@@0 (=> (! (and %lbl%+29965 true) :lblpos +29965) (=> (not (Jne $Efl@10@@0)) (=> (and
(= call29784formal@$x@0 (OpnReg call29764formal@$val@0))
(= call29784formal@$y@0 (OpnReg 542266448))) (and
(! (or %lbl%@111497 (OpnOk $Mem@0@@2 call29784formal@$x@0)) :lblneg @111497)
(=> (OpnOk $Mem@0@@2 call29784formal@$x@0) (and
(! (or %lbl%@111501 (OpnOk $Mem@0@@2 call29784formal@$y@0)) :lblneg @111501)
(=> (OpnOk $Mem@0@@2 call29784formal@$y@0) (=> (FlagsCmp $Efl@11 (EvalOpn $Mem@0@@2 call29784formal@$x@0) (EvalOpn $Mem@0@@2 call29784formal@$y@0)) (and
anon13_Then_correct
anon13_Else_correct)))))))))))
(let ((anon11_Else_correct@@0 (=> (! (and %lbl%+29955 true) :lblpos +29955) (=> (and
(not (Jae $Efl@6@@1))
(= call29759formal@$ptr@0 (+ esi@0@@1 0))) (and
(! (or %lbl%@111350 (inRo call29759formal@$ptr@0 4)) :lblneg @111350)
(=> (inRo call29759formal@$ptr@0 4) (=> (word call29759formal@$val@0) (=> (and
(= call29759formal@$val@0 (ro32 call29759formal@$ptr@0))
(= call29764formal@$ptr@0 (+ esi@0@@1 4))) (and
(! (or %lbl%@111390 (inRo call29764formal@$ptr@0 4)) :lblneg @111390)
(=> (inRo call29764formal@$ptr@0 4) (=> (and
(word call29764formal@$val@0)
(= call29764formal@$val@0 (ro32 call29764formal@$ptr@0))
(= call29771formal@$x@0 (OpnReg call29759formal@$val@0))
(= call29771formal@$y@0 (OpnReg 541348690))) (and
(! (or %lbl%@111438 (OpnOk $Mem@0@@2 call29771formal@$x@0)) :lblneg @111438)
(=> (OpnOk $Mem@0@@2 call29771formal@$x@0) (and
(! (or %lbl%@111442 (OpnOk $Mem@0@@2 call29771formal@$y@0)) :lblneg @111442)
(=> (OpnOk $Mem@0@@2 call29771formal@$y@0) (=> (FlagsCmp $Efl@10@@0 (EvalOpn $Mem@0@@2 call29771formal@$x@0) (EvalOpn $Mem@0@@2 call29771formal@$y@0)) (and
anon12_Then_correct@@0
anon12_Else_correct@@0)))))))))))))))))
(let ((anon11_Then_correct@@0 (=> (! (and %lbl%+29953 true) :lblpos +29953) (=> (and
(Jae $Efl@6@@1)
(= call29919formal@$ret@0 0)
(= $IoMmuEnabled@1@@0 $IoMmuEnabled@@0)
(= $RET@2 $RET@@0)
(= $sMem@3@@0 $sMem@0@@2)
(= DmaAddr@1@@0 call29919formal@$ret@0)
(= esp@2@@0 call29650formal@$ret@0)
(= $Mem@3@@0 $Mem@0@@2)) done_correct@@1))))
(let ((__L16_correct (=> (! (and %lbl%+29952 true) :lblpos +29952) (=> (and
(not $IoMmuEnabled@@0)
(<= 917504 esi@0@@1)
(<= 0 $entry@0@@3)
(= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0)))
(TV $entry@0@@3)
(= esi@0@@1 (+ ?RoBiosLo (* 16 $entry@0@@3)))
(<= ?RoBiosLo esi@0@@1)
(<= esi@0@@1 (- ?RoBiosHi 16))
(forall ((j@@43 Int) ) (! (=> (and
(TV j@@43)
(< j@@43 $entry@0@@3)
(inBiosRo (+ ?RoBiosLo (* 16 j@@43)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@43)))))
 :qid |EntryCPb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@43))
))
(= call29737formal@$ret@0 ?RoBiosHi)) (and
(! (or %lbl%@111231 (word (- call29737formal@$ret@0 16))) :lblneg @111231)
(=> (word (- call29737formal@$ret@0 16)) (=> (= call29741formal@$ret@0 (- call29737formal@$ret@0 16)) (=> (and
(= call29748formal@$x@0 (OpnReg esi@0@@1))
(= call29748formal@$y@0 (OpnReg call29741formal@$ret@0))) (and
(! (or %lbl%@111277 (OpnOk $Mem@0@@2 call29748formal@$x@0)) :lblneg @111277)
(=> (OpnOk $Mem@0@@2 call29748formal@$x@0) (and
(! (or %lbl%@111281 (OpnOk $Mem@0@@2 call29748formal@$y@0)) :lblneg @111281)
(=> (OpnOk $Mem@0@@2 call29748formal@$y@0) (=> (FlagsCmp $Efl@6@@1 (EvalOpn $Mem@0@@2 call29748formal@$x@0) (EvalOpn $Mem@0@@2 call29748formal@$y@0)) (and
anon11_Then_correct@@0
anon11_Else_correct@@0))))))))))))))
(let ((anon0_correct@@11 (=> (! (and %lbl%+29945 true) :lblpos +29945) (and
(! (or %lbl%@110619 (Aligned esp)) :lblneg @110619)
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
(! (or %lbl%@110781 (word (- esp 4))) :lblneg @110781)
(=> (word (- esp 4)) (=> (and
(= call29650formal@$ret@0 (- esp 4))
(= call29659formal@$ptr@0 (+ call29650formal@$ret@0 0))) (and
(! (or %lbl%@110828 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @110828)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@110858 (sAddr call29659formal@$ptr@0)) :lblneg @110858)
(=> (sAddr call29659formal@$ptr@0) (=> (MemInv (store $Mem@@3 call29659formal@$ptr@0 ebp) $sMem@0@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0@@2 (store $sMem@@5 call29659formal@$ptr@0 ebp))
(= call29664formal@$ptr@0 (+ call29650formal@$ret@0 0))) (and
(! (or %lbl%@110922 (PtrOk call29664formal@$ptr@0)) :lblneg @110922)
(=> (PtrOk call29664formal@$ptr@0) (and
(! (or %lbl%@110925 (word ebp)) :lblneg @110925)
(=> (word ebp) (=> (and
(= $Mem@0@@2 (store $Mem@@3 call29664formal@$ptr@0 ebp))
(= call29671formal@$ret@0 ?RoBiosLo)) (and
(! (or %lbl%@110977 (= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0)))) :lblneg @110977)
(=> (= ebp (select $sMem@0@@2 (+ call29650formal@$ret@0 0))) (and
(! (or %lbl%@110988 (TV 0)) :lblneg @110988)
(=> (TV 0) (and
(! (or %lbl%@110991 (= call29671formal@$ret@0 (+ ?RoBiosLo (* 16 0)))) :lblneg @110991)
(=> (= call29671formal@$ret@0 (+ ?RoBiosLo (* 16 0))) (and
(! (or %lbl%@111003 (and
(<= ?RoBiosLo call29671formal@$ret@0)
(<= call29671formal@$ret@0 (- ?RoBiosHi 16)))) :lblneg @111003)
(=> (and
(<= ?RoBiosLo call29671formal@$ret@0)
(<= call29671formal@$ret@0 (- ?RoBiosHi 16))) (and
(! (or %lbl%@111019 (forall ((j@@44 Int) ) (! (=> (and
(TV j@@44)
(< j@@44 0)
(inBiosRo (+ ?RoBiosLo (* 16 j@@44)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@44)))))
 :qid |EntryCPb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@44))
))) :lblneg @111019)
(=> (forall ((j@@45 Int) ) (! (=> (and
(TV j@@45)
(< j@@45 0)
(inBiosRo (+ ?RoBiosLo (* 16 j@@45)))) (not (MatchesRsdp (+ ?RoBiosLo (* 16 j@@45)))))
 :qid |EntryCPb.482:18|
 :skolemid |277|
 :pattern ( (TV j@@45))
)) __L16_correct))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@11 (=> (! (and %lbl%+110015 true) :lblpos +110015) (=> (and
(IoRootTable $IomMem@@7 ebx)
(not $IoMmuEnabled@@0)) (=> (and
(= ebp ?dmaLo)
(word ebp)
(= (select $IomMem@@7 (- ?dmaLo 8)) ?BYTE_VECTOR_VTABLE)
(= (select $IomMem@@7 (- ?dmaLo 4)) (- ?dmaHi ?dmaLo))
(forall ((i@@142 Int) ) (! (= (select $IoMmuState i@@142) 0)
 :qid |EntryCPb.464:18|
 :skolemid |276|
 :pattern ( (select $IoMmuState i@@142))
))
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(SMemRequireRA 132 $sMem@@5 esp $RET@@0)) anon0_correct@@11)))))
PreconditionGeneratedEntry_correct@@11))))))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+30141 () Bool)
(declare-fun call30015formal@$ret@0 () Int)
(declare-fun %lbl%@113560 () Bool)
(declare-fun call30019formal@$ret@0 () Int)
(declare-fun call30022formal@$ret@0 () Int)
(declare-fun call30025formal@$ret@0 () Int)
(declare-fun %lbl%@113631 () Bool)
(declare-fun call30029formal@$ret@0 () Int)
(declare-fun %lbl%@113675 () Bool)
(declare-fun call30033formal@$ret@0 () Int)
(declare-fun call30036formal@$ret@0 () Int)
(declare-fun call30039formal@$ret@0 () Int)
(declare-fun %lbl%@113746 () Bool)
(declare-fun call30043formal@$ret@0 () Int)
(declare-fun %lbl%@113790 () Bool)
(declare-fun call30047formal@$ret@0 () Int)
(declare-fun call30050formal@$ret@0 () Int)
(declare-fun call30053formal@$ret@0 () Int)
(declare-fun %lbl%@113861 () Bool)
(declare-fun call30057formal@$ret@0 () Int)
(declare-fun %lbl%@113905 () Bool)
(declare-fun call30061formal@$ret@0 () Int)
(declare-fun call30064formal@$ret@0 () Int)
(declare-fun call30067formal@$ret@0 () Int)
(declare-fun %lbl%@113976 () Bool)
(declare-fun call30071formal@$ret@0 () Int)
(declare-fun %lbl%@114020 () Bool)
(declare-fun call30075formal@$ret@0 () Int)
(declare-fun call30078formal@$ret@0 () Int)
(declare-fun call30081formal@$ret@0 () Int)
(declare-fun %lbl%@114091 () Bool)
(declare-fun call30085formal@$ret@0 () Int)
(declare-fun %lbl%@114135 () Bool)
(declare-fun call30089formal@$ret@0 () Int)
(declare-fun call30092formal@$ret@0 () Int)
(declare-fun call30095formal@$ret@0 () Int)
(declare-fun %lbl%@114206 () Bool)
(declare-fun call30099formal@$ret@0 () Int)
(declare-fun %lbl%@114250 () Bool)
(declare-fun call30103formal@$ret@0 () Int)
(declare-fun call30106formal@$ret@0 () Int)
(declare-fun call30109formal@$ret@0 () Int)
(declare-fun %lbl%@114321 () Bool)
(declare-fun call30113formal@$ret@0 () Int)
(declare-fun %lbl%@114365 () Bool)
(declare-fun call30117formal@$ret@0 () Int)
(declare-fun call30120formal@$ret@0 () Int)
(declare-fun call30123formal@$ret@0 () Int)
(declare-fun %lbl%@114436 () Bool)
(declare-fun call30127formal@$ret@0 () Int)
(declare-fun %lbl%@114480 () Bool)
(declare-fun call30131formal@$ret@0 () Int)
(declare-fun call30134formal@$ret@0 () Int)
(declare-fun call30137formal@$ret@0 () Int)
(declare-fun %lbl%@114551 () Bool)
(declare-fun %lbl%+113206 () Bool)
(push 1)
(set-info :boogie-vc-id initializeSerialPort)
(assert (not
(let ((anon0_correct@@12 (=> (! (and %lbl%+30141 true) :lblpos +30141) (=> (= call30015formal@$ret@0 1016) (and
(! (or %lbl%@113560 (word (+ call30015formal@$ret@0 3))) :lblneg @113560)
(=> (word (+ call30015formal@$ret@0 3)) (=> (= call30019formal@$ret@0 (+ call30015formal@$ret@0 3)) (=> (and
(= call30022formal@$ret@0 call30019formal@$ret@0)
(= call30025formal@$ret@0 128)) (and
(! (or %lbl%@113631 (and
(>= call30022formal@$ret@0 1016)
(<= call30022formal@$ret@0 1020))) :lblneg @113631)
(=> (and
(>= call30022formal@$ret@0 1016)
(<= call30022formal@$ret@0 1020)) (=> (= call30029formal@$ret@0 1016) (and
(! (or %lbl%@113675 (word (+ call30029formal@$ret@0 0))) :lblneg @113675)
(=> (word (+ call30029formal@$ret@0 0)) (=> (= call30033formal@$ret@0 (+ call30029formal@$ret@0 0)) (=> (and
(= call30036formal@$ret@0 call30033formal@$ret@0)
(= call30039formal@$ret@0 1)) (and
(! (or %lbl%@113746 (and
(>= call30036formal@$ret@0 1016)
(<= call30036formal@$ret@0 1020))) :lblneg @113746)
(=> (and
(>= call30036formal@$ret@0 1016)
(<= call30036formal@$ret@0 1020)) (=> (= call30043formal@$ret@0 1016) (and
(! (or %lbl%@113790 (word (+ call30043formal@$ret@0 1))) :lblneg @113790)
(=> (word (+ call30043formal@$ret@0 1)) (=> (= call30047formal@$ret@0 (+ call30043formal@$ret@0 1)) (=> (and
(= call30050formal@$ret@0 call30047formal@$ret@0)
(= call30053formal@$ret@0 0)) (and
(! (or %lbl%@113861 (and
(>= call30050formal@$ret@0 1016)
(<= call30050formal@$ret@0 1020))) :lblneg @113861)
(=> (and
(>= call30050formal@$ret@0 1016)
(<= call30050formal@$ret@0 1020)) (=> (= call30057formal@$ret@0 1016) (and
(! (or %lbl%@113905 (word (+ call30057formal@$ret@0 3))) :lblneg @113905)
(=> (word (+ call30057formal@$ret@0 3)) (=> (= call30061formal@$ret@0 (+ call30057formal@$ret@0 3)) (=> (and
(= call30064formal@$ret@0 call30061formal@$ret@0)
(= call30067formal@$ret@0 3)) (and
(! (or %lbl%@113976 (and
(>= call30064formal@$ret@0 1016)
(<= call30064formal@$ret@0 1020))) :lblneg @113976)
(=> (and
(>= call30064formal@$ret@0 1016)
(<= call30064formal@$ret@0 1020)) (=> (= call30071formal@$ret@0 1016) (and
(! (or %lbl%@114020 (word (+ call30071formal@$ret@0 1))) :lblneg @114020)
(=> (word (+ call30071formal@$ret@0 1)) (=> (= call30075formal@$ret@0 (+ call30071formal@$ret@0 1)) (=> (and
(= call30078formal@$ret@0 call30075formal@$ret@0)
(= call30081formal@$ret@0 0)) (and
(! (or %lbl%@114091 (and
(>= call30078formal@$ret@0 1016)
(<= call30078formal@$ret@0 1020))) :lblneg @114091)
(=> (and
(>= call30078formal@$ret@0 1016)
(<= call30078formal@$ret@0 1020)) (=> (= call30085formal@$ret@0 1016) (and
(! (or %lbl%@114135 (word (+ call30085formal@$ret@0 2))) :lblneg @114135)
(=> (word (+ call30085formal@$ret@0 2)) (=> (= call30089formal@$ret@0 (+ call30085formal@$ret@0 2)) (=> (and
(= call30092formal@$ret@0 call30089formal@$ret@0)
(= call30095formal@$ret@0 1)) (and
(! (or %lbl%@114206 (and
(>= call30092formal@$ret@0 1016)
(<= call30092formal@$ret@0 1020))) :lblneg @114206)
(=> (and
(>= call30092formal@$ret@0 1016)
(<= call30092formal@$ret@0 1020)) (=> (= call30099formal@$ret@0 1016) (and
(! (or %lbl%@114250 (word (+ call30099formal@$ret@0 2))) :lblneg @114250)
(=> (word (+ call30099formal@$ret@0 2)) (=> (= call30103formal@$ret@0 (+ call30099formal@$ret@0 2)) (=> (and
(= call30106formal@$ret@0 call30103formal@$ret@0)
(= call30109formal@$ret@0 7)) (and
(! (or %lbl%@114321 (and
(>= call30106formal@$ret@0 1016)
(<= call30106formal@$ret@0 1020))) :lblneg @114321)
(=> (and
(>= call30106formal@$ret@0 1016)
(<= call30106formal@$ret@0 1020)) (=> (= call30113formal@$ret@0 1016) (and
(! (or %lbl%@114365 (word (+ call30113formal@$ret@0 2))) :lblneg @114365)
(=> (word (+ call30113formal@$ret@0 2)) (=> (= call30117formal@$ret@0 (+ call30113formal@$ret@0 2)) (=> (and
(= call30120formal@$ret@0 call30117formal@$ret@0)
(= call30123formal@$ret@0 1)) (and
(! (or %lbl%@114436 (and
(>= call30120formal@$ret@0 1016)
(<= call30120formal@$ret@0 1020))) :lblneg @114436)
(=> (and
(>= call30120formal@$ret@0 1016)
(<= call30120formal@$ret@0 1020)) (=> (= call30127formal@$ret@0 1016) (and
(! (or %lbl%@114480 (word (+ call30127formal@$ret@0 4))) :lblneg @114480)
(=> (word (+ call30127formal@$ret@0 4)) (=> (= call30131formal@$ret@0 (+ call30127formal@$ret@0 4)) (=> (and
(= call30134formal@$ret@0 call30131formal@$ret@0)
(= call30137formal@$ret@0 3)) (and
(! (or %lbl%@114551 (and
(>= call30134formal@$ret@0 1016)
(<= call30134formal@$ret@0 1020))) :lblneg @114551)
(=> (and
(>= call30134formal@$ret@0 1016)
(<= call30134formal@$ret@0 1020)) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@12 (=> (! (and %lbl%+113206 true) :lblpos +113206) anon0_correct@@12)))
PreconditionGeneratedEntry_correct@@12))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+30199 () Bool)
(declare-fun $Efl@5 () Int)
(declare-fun call30177formal@$ret@0 () Int)
(declare-fun %lbl%@114892 () Bool)
(declare-fun call30181formal@$ret@0 () Int)
(declare-fun call30184formal@$ret@0 () Int)
(declare-fun call30187formal@$ret@0 () Int)
(declare-fun %lbl%@114963 () Bool)
(declare-fun %lbl%+30197 () Bool)
(declare-fun %lbl%+30196 () Bool)
(declare-fun call30149formal@$ret@0 () Int)
(declare-fun %lbl%@114716 () Bool)
(declare-fun call30153formal@$ret@0 () Int)
(declare-fun call30156formal@$ret@0 () Int)
(declare-fun %lbl%@114765 () Bool)
(declare-fun call30161formal@$ret@0 () Int)
(declare-fun call30168formal@$x@0 () T@opn)
(declare-fun call30168formal@$y@0 () T@opn)
(declare-fun %lbl%@114824 () Bool)
(declare-fun %lbl%@114829 () Bool)
(declare-fun %lbl%+114592 () Bool)
(push 1)
(set-info :boogie-vc-id serialDbgDataOut8)
(assert (not
(let ((anon2_Else_correct@@0 (=> (! (and %lbl%+30199 true) :lblpos +30199) (=> (and
(not (Je $Efl@5))
(= call30177formal@$ret@0 1016)) (and
(! (or %lbl%@114892 (word (+ call30177formal@$ret@0 0))) :lblneg @114892)
(=> (word (+ call30177formal@$ret@0 0)) (=> (= call30181formal@$ret@0 (+ call30177formal@$ret@0 0)) (=> (and
(= call30184formal@$ret@0 call30181formal@$ret@0)
(= call30187formal@$ret@0 ecx)) (and
(! (or %lbl%@114963 (and
(>= call30184formal@$ret@0 1016)
(<= call30184formal@$ret@0 1020))) :lblneg @114963)
(=> (and
(>= call30184formal@$ret@0 1016)
(<= call30184formal@$ret@0 1020)) true))))))))))
(let ((anon2_Then_correct@@0 (=> (! (and %lbl%+30197 true) :lblpos +30197) true)))
(let ((waitForSerialPort_correct (=> (! (and %lbl%+30196 true) :lblpos +30196) (=> (= call30149formal@$ret@0 1016) (and
(! (or %lbl%@114716 (word (+ call30149formal@$ret@0 5))) :lblneg @114716)
(=> (word (+ call30149formal@$ret@0 5)) (=> (and
(= call30153formal@$ret@0 (+ call30149formal@$ret@0 5))
(= call30156formal@$ret@0 call30153formal@$ret@0)) (and
(! (or %lbl%@114765 (= call30156formal@$ret@0 1021)) :lblneg @114765)
(=> (= call30156formal@$ret@0 1021) (=> (and
(= call30161formal@$ret@0 (q@and call30153formal@$ret@0 32))
(word call30161formal@$ret@0)
(= call30168formal@$x@0 (OpnReg call30161formal@$ret@0))
(= call30168formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@114824 (OpnOk $Mem@@3 call30168formal@$x@0)) :lblneg @114824)
(=> (OpnOk $Mem@@3 call30168formal@$x@0) (and
(! (or %lbl%@114829 (OpnOk $Mem@@3 call30168formal@$y@0)) :lblneg @114829)
(=> (OpnOk $Mem@@3 call30168formal@$y@0) (=> (FlagsCmp $Efl@5 (EvalOpn $Mem@@3 call30168formal@$x@0) (EvalOpn $Mem@@3 call30168formal@$y@0)) (and
anon2_Then_correct@@0
anon2_Else_correct@@0))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@13 (=> (! (and %lbl%+114592 true) :lblpos +114592) waitForSerialPort_correct)))
PreconditionGeneratedEntry_correct@@13))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31207 () Bool)
(declare-fun %lbl%+114998 () Bool)
(declare-fun $smap () Int)
(declare-fun $PciConfigState@@0 () (Array Int Int))
(push 1)
(set-info :boogie-vc-id NucleusEntryPoint)
(assert (not
(let ((serialInfLoop_correct (=> (! (and %lbl%+31207 true) :lblpos +31207) true)))
(let ((anon0_correct@@13 (=> (! (and %lbl%+114998 true) :lblpos +114998) (=> (inRo (+ ecx 40) 4) (=> (and
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
 :qid |EntryCPi.30:20|
 :skolemid |246|
 :pattern ( (select $PciConfigState@@0 i@@143))
))
(forall ((i@@144 Int) ) (! (= (select $IoMmuState i@@144) 0)
 :qid |EntryCPi.31:20|
 :skolemid |247|
 :pattern ( (select $IoMmuState i@@144))
))
(not $IomFrozen)
(not $IoMmuEnabled@@0)) serialInfLoop_correct))))))
anon0_correct@@13))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31396 () Bool)
(declare-fun %lbl%+31399 () Bool)
(declare-fun %lbl%@117422 () Bool)
(declare-fun ecx@1 () Int)
(declare-fun %lbl%@117426 () Bool)
(declare-fun $__stackState@0 () (Array Int T@StackState))
(declare-fun StackYielded (Int Int Int) T@StackState)
(declare-fun $ebp@@0 () Int)
(declare-fun $esp@@5 () Int)
(declare-fun $eip () Int)
(declare-fun %lbl%@117442 () Bool)
(declare-fun call31352formal@$ret@0 () Int)
(declare-fun %lbl%@117445 () Bool)
(declare-fun %lbl%@117457 () Bool)
(declare-fun NucleusInv (Int (Array Int T@StackState) (Array Int Int) (Array Int (Array Int Int)) Int (Array Int Int) Int Int Int Int Int Int Int Int Int Int (Array Int Int) (Array Int Int) (Array Int Int) (Array Int Int) (Array Int (Array Int Int)) (Array Int (Array Int Int)) (Array Int Int) Int Int Int Int Int Int Int (Array Int Int) (Array Int (Array Int Int)) (Array Int (Array Int T@$FrameLayout)) (Array Int (Array Int Int)) (Array Int (Array Int (Array Int Int))) (Array Int (Array Int Int)) Bool (Array Int Int) Int) Bool)
(declare-fun $S@@0 () Int)
(declare-fun $toAbs@@4 () (Array Int Int))
(declare-fun $AbsMem@@3 () (Array Int (Array Int Int)))
(declare-fun CurrentStack () Int)
(declare-fun $gcSlice@@3 () (Array Int Int))
(declare-fun BF () Int)
(declare-fun BT () Int)
(declare-fun HeapLo () Int)
(declare-fun Fi () Int)
(declare-fun Fk () Int)
(declare-fun Fl () Int)
(declare-fun Ti () Int)
(declare-fun Tj () Int)
(declare-fun Tk () Int)
(declare-fun Tl () Int)
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
(declare-fun call31384formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@117724 () Bool)
(declare-fun %lbl%@117733 () Bool)
(declare-fun esp@1@@2 () Int)
(declare-fun %lbl%@117762 () Bool)
(declare-fun call31346formal@$ret@0 () Int)
(declare-fun %lbl%@117767 () Bool)
(declare-fun $StackState () (Array Int T@StackState))
(declare-fun $_stackState () (Array Int T@StackState))
(declare-fun %lbl%+31394 () Bool)
(declare-fun $Efl@12@@1 () Int)
(declare-fun call31349formal@$ret@0 () Int)
(declare-fun %lbl%+31393 () Bool)
(declare-fun StackEmpty () T@StackState)
(declare-fun %lbl%@116343 () Bool)
(declare-fun %lbl%@116346 () Bool)
(declare-fun IoInv (Bool (Array Int Int) Int (Array Int Int)) Bool)
(declare-fun call31305formal@$ret@0 () Int)
(declare-fun call31308formal@$ret@0 () Int)
(declare-fun %lbl%@116571 () Bool)
(declare-fun call31313formal@$ret@0 () Int)
(declare-fun %lbl%@116616 () Bool)
(declare-fun call31317formal@$ret@0 () Int)
(declare-fun %lbl%@116644 () Bool)
(declare-fun %lbl%@116661 () Bool)
(declare-fun %lbl%@116664 () Bool)
(declare-fun %lbl%@116676 () Bool)
(declare-fun %lbl%@116679 () Bool)
(declare-fun %lbl%@116889 () Bool)
(declare-fun %lbl%@116892 () Bool)
(declare-fun call31335formal@$ret@0 () Int)
(declare-fun %lbl%@117083 () Bool)
(declare-fun call31339formal@$ret@0 () Int)
(declare-fun %lbl%@117116 () Bool)
(declare-fun call31343formal@$ret@0 () Int)
(declare-fun %lbl%@117214 () Bool)
(declare-fun %lbl%@117241 () Bool)
(declare-fun %lbl%@117263 () Bool)
(declare-fun call31358formal@$val@0 () Int)
(declare-fun call31365formal@$x@0 () T@opn)
(declare-fun call31365formal@$y@0 () T@opn)
(declare-fun %lbl%@117310 () Bool)
(declare-fun %lbl%@117314 () Bool)
(declare-fun %lbl%+115598 () Bool)
(push 1)
(set-info :boogie-vc-id Throw)
(assert (not
(let ((anon3_Else_correct@@0 (=> (! (and %lbl%+31396 true) :lblpos +31396) true)))
(let ((__L31_correct (=> (! (and %lbl%+31399 true) :lblpos +31399) (and
(! (or %lbl%@117422 (= ecx@1 ?InterruptStack)) :lblneg @117422)
(=> (= ecx@1 ?InterruptStack) (and
(! (or %lbl%@117426 (and
(isStack ?InterruptStack)
(= (select $__stackState@0 ?InterruptStack) (StackYielded $ebp@@0 $esp@@5 $eip)))) :lblneg @117426)
(=> (and
(isStack ?InterruptStack)
(= (select $__stackState@0 ?InterruptStack) (StackYielded $ebp@@0 $esp@@5 $eip))) (and
(! (or %lbl%@117442 (Aligned call31352formal@$ret@0)) :lblneg @117442)
(=> (Aligned call31352formal@$ret@0) (and
(! (or %lbl%@117445 (= call31352formal@$ret@0 (+ ?tLo (* ?InterruptStack ?TSize)))) :lblneg @117445)
(=> (= call31352formal@$ret@0 (+ ?tLo (* ?InterruptStack ?TSize))) (and
(! (or %lbl%@117457 (NucleusInv $S@@0 $__stackState@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @117457)
(=> (NucleusInv $S@@0 $__stackState@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(NucleusInv ?InterruptStack (store $__stackState@0 ?InterruptStack StackRunning) $toAbs@@4 $AbsMem@@3 CurrentStack@0 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@1@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@1 $fMems@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= esp@0@@4 (- $esp@@5 4))) (=> (and
(= ebp@0 $ebp@@0)
(Aligned esp@0@@4)
(= (select $Mem@1@@2 (- $esp@@5 4)) $eip)
(= call31384formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@117724 (= (ReturnToAddr (select $Mem@1@@2 esp@0@@4)) call31384formal@$oldRA@0)) :lblneg @117724)
(=> (= (ReturnToAddr (select $Mem@1@@2 esp@0@@4)) call31384formal@$oldRA@0) (and
(! (or %lbl%@117733 (Aligned esp@0@@4)) :lblneg @117733)
(=> (Aligned esp@0@@4) (=> (and
(= esp@1@@2 (+ esp@0@@4 4))
(Aligned esp@1@@2)) (and
(! (or %lbl%@117762 (StackCheckInv ?InterruptStack call31346formal@$ret@0)) :lblneg @117762)
(=> (StackCheckInv ?InterruptStack call31346formal@$ret@0) (and
(! (or %lbl%@117767 (=> (= (StackStateTag (select $StackState ?InterruptStack)) ?STACK_YIELDED) (and
(NucleusInv ?InterruptStack $_stackState $toAbs@@4 $AbsMem@@3 CurrentStack@0 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@1@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@1 $fMems@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@0 $ebp@@0)
(= esp@1@@2 $esp@@5)))) :lblneg @117767)
(=> (=> (= (StackStateTag (select $StackState ?InterruptStack)) ?STACK_YIELDED) (and
(NucleusInv ?InterruptStack $_stackState $toAbs@@4 $AbsMem@@3 CurrentStack@0 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@1@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@1 $fMems@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@0 $ebp@@0)
(= esp@1@@2 $esp@@5))) true))))))))))))))))))))))))
(let ((anon3_Then_correct@@0 (=> (! (and %lbl%+31394 true) :lblpos +31394) (=> (and
(Je $Efl@12@@1)
(= ecx@1 call31349formal@$ret@0)) __L31_correct))))
(let ((anon0_correct@@14 (=> (! (and %lbl%+31393 true) :lblpos +31393) (=> (= $__stackState@0 (store $StackState $S@@0 StackEmpty)) (and
(! (or %lbl%@116343 (isStack $S@@0)) :lblneg @116343)
(=> (isStack $S@@0) (and
(! (or %lbl%@116346 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @116346)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(= call31305formal@$ret@0 CurrentStack)
(= call31308formal@$ret@0 ?TSize)) (and
(! (or %lbl%@116571 (word (* call31305formal@$ret@0 call31308formal@$ret@0))) :lblneg @116571)
(=> (word (* call31305formal@$ret@0 call31308formal@$ret@0)) (=> (and
(= call31313formal@$ret@0 (* call31305formal@$ret@0 call31308formal@$ret@0))
(= call31313formal@$ret@0 (Mult call31305formal@$ret@0 call31308formal@$ret@0))) (and
(! (or %lbl%@116616 (word (+ call31313formal@$ret@0 TLo@@0))) :lblneg @116616)
(=> (word (+ call31313formal@$ret@0 TLo@@0)) (=> (= call31317formal@$ret@0 (+ call31313formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@116644 (and
(TV TLo@@0)
(TO (* 64 $S@@0)))) :lblneg @116644)
(=> (and
(TV TLo@@0)
(TO (* 64 $S@@0))) (and
(! (or %lbl%@116661 (Aligned call31317formal@$ret@0)) :lblneg @116661)
(=> (Aligned call31317formal@$ret@0) (and
(! (or %lbl%@116664 (= call31317formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize)))) :lblneg @116664)
(=> (= call31317formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize))) (and
(! (or %lbl%@116676 (isStack $S@@0)) :lblneg @116676)
(=> (isStack $S@@0) (and
(! (or %lbl%@116679 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @116679)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(NucleusInv $S@@0 (store $StackState $S@@0 StackEmpty) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= $Mem@0@@3 (store $Mem@@3 call31317formal@$ret@0 ?STACK_EMPTY))) (and
(! (or %lbl%@116889 (isStack ?InterruptStack)) :lblneg @116889)
(=> (isStack ?InterruptStack) (and
(! (or %lbl%@116892 (NucleusInv $S@@0 $__stackState@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @116892)
(=> (NucleusInv $S@@0 $__stackState@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $S@@0 CurrentStack)
(MemInv $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (=> (and
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $__stackState@0 ?InterruptStack)) (StackTag ?InterruptStack $tMems@0))
(=> (IsYielded (select $__stackState@0 ?InterruptStack)) (= (select $__stackState@0 ?InterruptStack) (StackYielded (StackEbp ?InterruptStack $tMems@0) (+ (StackEsp ?InterruptStack $tMems@0) 4) (StackRA ?InterruptStack $tMems@0 $fMems@0))))
(= call31335formal@$ret@0 FLo@@0)) (and
(! (or %lbl%@117083 (word (+ call31335formal@$ret@0 ?StackReserve))) :lblneg @117083)
(=> (word (+ call31335formal@$ret@0 ?StackReserve)) (=> (= call31339formal@$ret@0 (+ call31335formal@$ret@0 ?StackReserve)) (and
(! (or %lbl%@117116 (word (+ call31339formal@$ret@0 ?InterruptReserve))) :lblneg @117116)
(=> (word (+ call31339formal@$ret@0 ?InterruptReserve)) (=> (and
(= call31343formal@$ret@0 (+ call31339formal@$ret@0 ?InterruptReserve))
(= call31346formal@$ret@0 call31343formal@$ret@0)
(= call31349formal@$ret@0 0)
(= call31352formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@117214 (MemInv $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @117214)
(=> (MemInv $Mem@0@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0 $fMems@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@117241 (tAddr ?InterruptStack call31352formal@$ret@0)) :lblneg @117241)
(=> (tAddr ?InterruptStack call31352formal@$ret@0) (=> (and
(= (select $Mem@0@@3 call31352formal@$ret@0) (select (select $tMems@0 ?InterruptStack) call31352formal@$ret@0))
(memAddr call31352formal@$ret@0)) (and
(! (or %lbl%@117263 (PtrOk call31352formal@$ret@0)) :lblneg @117263)
(=> (PtrOk call31352formal@$ret@0) (=> (and
(word call31358formal@$val@0)
(= call31358formal@$val@0 (select $Mem@0@@3 call31352formal@$ret@0))
(= call31365formal@$x@0 (OpnReg call31358formal@$val@0))
(= call31365formal@$y@0 (OpnReg ?STACK_YIELDED))) (and
(! (or %lbl%@117310 (OpnOk $Mem@0@@3 call31365formal@$x@0)) :lblneg @117310)
(=> (OpnOk $Mem@0@@3 call31365formal@$x@0) (and
(! (or %lbl%@117314 (OpnOk $Mem@0@@3 call31365formal@$y@0)) :lblneg @117314)
(=> (OpnOk $Mem@0@@3 call31365formal@$y@0) (=> (FlagsCmp $Efl@12@@1 (EvalOpn $Mem@0@@3 call31365formal@$x@0) (EvalOpn $Mem@0@@3 call31365formal@$y@0)) (and
anon3_Then_correct@@0
anon3_Else_correct@@0))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@14 (=> (! (and %lbl%+115598 true) :lblpos +115598) (=> (and
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
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(SpRequire $S@@0 esp 4)
(= $_stackState (store (store $StackState $S@@0 StackEmpty) ?InterruptStack StackRunning))
(=> (= (StackStateTag (select $StackState ?InterruptStack)) ?STACK_YIELDED) (and
(= $RET@@0 (ReturnToAddr $eip))
(= (select $StackState ?InterruptStack) (StackYielded $ebp@@0 $esp@@5 $eip))))) anon0_correct@@14))))
PreconditionGeneratedEntry_correct@@14)))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31409 () Bool)
(declare-fun %lbl%+117873 () Bool)
(push 1)
(set-info :boogie-vc-id FatalHandler)
(assert (not
(let ((anon0_correct@@15 (=> (! (and %lbl%+31409 true) :lblpos +31409) true)))
(let ((PreconditionGeneratedEntry_correct@@15 (=> (! (and %lbl%+117873 true) :lblpos +117873) anon0_correct@@15)))
PreconditionGeneratedEntry_correct@@15))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31478 () Bool)
(declare-fun %lbl%+31481 () Bool)
(declare-fun %lbl%@118597 () Bool)
(declare-fun $s@@25 () Int)
(declare-fun %lbl%@118600 () Bool)
(declare-fun call31435formal@$ret@0 () Int)
(declare-fun ecx@1@@0 () Int)
(declare-fun call31438formal@$ret@0 () Int)
(declare-fun %lbl%@118824 () Bool)
(declare-fun call31443formal@$ret@0 () Int)
(declare-fun %lbl%@118869 () Bool)
(declare-fun call31447formal@$ret@0 () Int)
(declare-fun %lbl%@118897 () Bool)
(declare-fun %lbl%@118916 () Bool)
(declare-fun %lbl%@118946 () Bool)
(declare-fun %lbl%@118970 () Bool)
(declare-fun call31463formal@$val@0 () Int)
(declare-fun call31466formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@119007 () Bool)
(declare-fun %lbl%@119018 () Bool)
(declare-fun esp@0@@5 () Int)
(declare-fun %lbl%@119049 () Bool)
(declare-fun %lbl%@119129 () Bool)
(declare-fun %lbl%@119140 () Bool)
(declare-fun %lbl%@119146 () Bool)
(declare-fun %lbl%+31476 () Bool)
(declare-fun $Efl@0 () Int)
(declare-fun %lbl%+31475 () Bool)
(declare-fun call31419formal@$x@0 () T@opn)
(declare-fun call31419formal@$y@0 () T@opn)
(declare-fun %lbl%@118484 () Bool)
(declare-fun %lbl%@118489 () Bool)
(declare-fun %lbl%+118009 () Bool)
(push 1)
(set-info :boogie-vc-id GetStackState)
(assert (not
(let ((anon3_Else_correct@@1 (=> (! (and %lbl%+31478 true) :lblpos +31478) true)))
(let ((__L32_correct (=> (! (and %lbl%+31481 true) :lblpos +31481) (and
(! (or %lbl%@118597 (isStack $s@@25)) :lblneg @118597)
(=> (isStack $s@@25) (and
(! (or %lbl%@118600 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @118600)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState $s@@25)) (StackTag $s@@25 $tMems@@12))
(=> (IsYielded (select $StackState $s@@25)) (= (select $StackState $s@@25) (StackYielded (StackEbp $s@@25 $tMems@@12) (+ (StackEsp $s@@25 $tMems@@12) 4) (StackRA $s@@25 $tMems@@12 $fMems@@4))))
(= call31435formal@$ret@0 ecx@1@@0)
(= call31438formal@$ret@0 ?TSize)) (and
(! (or %lbl%@118824 (word (* call31435formal@$ret@0 call31438formal@$ret@0))) :lblneg @118824)
(=> (word (* call31435formal@$ret@0 call31438formal@$ret@0)) (=> (and
(= call31443formal@$ret@0 (* call31435formal@$ret@0 call31438formal@$ret@0))
(= call31443formal@$ret@0 (Mult call31435formal@$ret@0 call31438formal@$ret@0))) (and
(! (or %lbl%@118869 (word (+ call31443formal@$ret@0 TLo@@0))) :lblneg @118869)
(=> (word (+ call31443formal@$ret@0 TLo@@0)) (=> (= call31447formal@$ret@0 (+ call31443formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@118897 (and
(TV TLo@@0)
(TO (* 64 $s@@25)))) :lblneg @118897)
(=> (and
(TV TLo@@0)
(TO (* 64 $s@@25))) (and
(! (or %lbl%@118916 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @118916)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@118946 (tAddr $s@@25 call31447formal@$ret@0)) :lblneg @118946)
(=> (tAddr $s@@25 call31447formal@$ret@0) (=> (and
(= (select $Mem@@3 call31447formal@$ret@0) (select (select $tMems@@12 $s@@25) call31447formal@$ret@0))
(memAddr call31447formal@$ret@0)) (and
(! (or %lbl%@118970 (PtrOk call31447formal@$ret@0)) :lblneg @118970)
(=> (PtrOk call31447formal@$ret@0) (=> (word call31463formal@$val@0) (=> (and
(= call31463formal@$val@0 (select $Mem@@3 call31447formal@$ret@0))
(= call31466formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@119007 (= (ReturnToAddr (select $Mem@@3 esp)) call31466formal@$oldRA@0)) :lblneg @119007)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call31466formal@$oldRA@0) (and
(! (or %lbl%@119018 (Aligned esp)) :lblneg @119018)
(=> (Aligned esp) (=> (and
(= esp@0@@5 (+ esp 4))
(Aligned esp@0@@5)) (and
(! (or %lbl%@119049 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @119049)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@119129 (= call31463formal@$val@0 (StackStateTag (select $StackState $s@@25)))) :lblneg @119129)
(=> (= call31463formal@$val@0 (StackStateTag (select $StackState $s@@25))) (and
(! (or %lbl%@119140 (= ebp ebp)) :lblneg @119140)
(=> (= ebp ebp) (and
(! (or %lbl%@119146 (= esp@0@@5 (+ esp 4))) :lblneg @119146)
(=> (= esp@0@@5 (+ esp 4)) true))))))))))))))))))))))))))))))))))))))))
(let ((anon3_Then_correct@@1 (=> (! (and %lbl%+31476 true) :lblpos +31476) (=> (and
(Jb $Efl@0)
(= ecx@1@@0 ecx)) __L32_correct))))
(let ((anon0_correct@@16 (=> (! (and %lbl%+31475 true) :lblpos +31475) (=> (and
(= call31419formal@$x@0 (OpnReg ecx))
(= call31419formal@$y@0 (OpnReg ?NumStacks))) (and
(! (or %lbl%@118484 (OpnOk $Mem@@3 call31419formal@$x@0)) :lblneg @118484)
(=> (OpnOk $Mem@@3 call31419formal@$x@0) (and
(! (or %lbl%@118489 (OpnOk $Mem@@3 call31419formal@$y@0)) :lblneg @118489)
(=> (OpnOk $Mem@@3 call31419formal@$y@0) (=> (FlagsCmp $Efl@0 (EvalOpn $Mem@@3 call31419formal@$x@0) (EvalOpn $Mem@@3 call31419formal@$y@0)) (and
anon3_Then_correct@@1
anon3_Else_correct@@1))))))))))
(let ((PreconditionGeneratedEntry_correct@@16 (=> (! (and %lbl%+118009 true) :lblpos +118009) (=> (word ecx) (=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)) (=> (and
(= ecx $s@@25)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= (ReturnToAddr (select $Mem@@3 esp)) $RET@@0)
(SpRequire $S@@0 esp 4)) anon0_correct@@16))))))
PreconditionGeneratedEntry_correct@@16)))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31570 () Bool)
(declare-fun %lbl%+31582 () Bool)
(declare-fun %lbl%+31585 () Bool)
(declare-fun %lbl%@120752 () Bool)
(declare-fun eax@2 () Int)
(declare-fun %lbl%@120755 () Bool)
(declare-fun $s@@26 () Int)
(declare-fun %lbl%@120767 () Bool)
(declare-fun %lbl%@120770 () Bool)
(declare-fun $Mem@0@@4 () (Array Int Int))
(declare-fun $tMems@0@@0 () (Array Int (Array Int Int)))
(declare-fun $fMems@0@@0 () (Array Int (Array Int Int)))
(declare-fun call31558formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@120984 () Bool)
(declare-fun %lbl%@120994 () Bool)
(declare-fun esp@0@@6 () Int)
(declare-fun %lbl%@121025 () Bool)
(declare-fun %lbl%@121108 () Bool)
(declare-fun %lbl%@121113 () Bool)
(declare-fun %lbl%+31580 () Bool)
(declare-fun $Efl@9@@0 () Int)
(declare-fun call31520formal@$ret@0 () Int)
(declare-fun %lbl%+31579 () Bool)
(declare-fun %lbl%@120226 () Bool)
(declare-fun %lbl%@120229 () Bool)
(declare-fun call31508formal@$ret@0 () Int)
(declare-fun ecx@1@@1 () Int)
(declare-fun call31511formal@$ret@0 () Int)
(declare-fun %lbl%@120453 () Bool)
(declare-fun call31516formal@$ret@0 () Int)
(declare-fun %lbl%@120498 () Bool)
(declare-fun %lbl%@120526 () Bool)
(declare-fun %lbl%@120545 () Bool)
(declare-fun %lbl%@120575 () Bool)
(declare-fun %lbl%@120599 () Bool)
(declare-fun call31536formal@$val@0 () Int)
(declare-fun call31543formal@$x@0 () T@opn)
(declare-fun call31543formal@$y@0 () T@opn)
(declare-fun %lbl%@120647 () Bool)
(declare-fun %lbl%@120652 () Bool)
(declare-fun %lbl%+31568 () Bool)
(declare-fun $Efl@1 () Int)
(declare-fun %lbl%+31567 () Bool)
(declare-fun StackInterrupted (Int Int Int Int Int Int Int Int Int Int Int) T@StackState)
(declare-fun call31492formal@$x@0 () T@opn)
(declare-fun call31492formal@$y@0 () T@opn)
(declare-fun %lbl%@120115 () Bool)
(declare-fun %lbl%@120120 () Bool)
(declare-fun %lbl%+119156 () Bool)
(push 1)
(set-info :boogie-vc-id ResetStack)
(assert (not
(let ((anon5_Else_correct@@0 (=> (! (and %lbl%+31570 true) :lblpos +31570) true)))
(let ((anon6_Else_correct@@0 (=> (! (and %lbl%+31582 true) :lblpos +31582) true)))
(let ((__L34_correct (=> (! (and %lbl%+31585 true) :lblpos +31585) (and
(! (or %lbl%@120752 (Aligned eax@2)) :lblneg @120752)
(=> (Aligned eax@2) (and
(! (or %lbl%@120755 (= eax@2 (+ ?tLo (* $s@@26 ?TSize)))) :lblneg @120755)
(=> (= eax@2 (+ ?tLo (* $s@@26 ?TSize))) (and
(! (or %lbl%@120767 (isStack $s@@26)) :lblneg @120767)
(=> (isStack $s@@26) (and
(! (or %lbl%@120770 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @120770)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (NucleusInv $S@@0 (store $StackState $s@@26 StackEmpty) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@4 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@0 $fMems@0@@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $Mem@0@@4 (store $Mem@@3 eax@2 ?STACK_EMPTY))
(= call31558formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@120984 (= (ReturnToAddr (select $Mem@0@@4 esp)) call31558formal@$oldRA@0)) :lblneg @120984)
(=> (= (ReturnToAddr (select $Mem@0@@4 esp)) call31558formal@$oldRA@0) (and
(! (or %lbl%@120994 (Aligned esp)) :lblneg @120994)
(=> (Aligned esp) (=> (and
(= esp@0@@6 (+ esp 4))
(Aligned esp@0@@6)) (and
(! (or %lbl%@121025 (NucleusInv $S@@0 (store $StackState $s@@26 StackEmpty) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@4 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@0 $fMems@0@@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @121025)
(=> (NucleusInv $S@@0 (store $StackState $s@@26 StackEmpty) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@4 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@0 $fMems@0@@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@121108 (= ebp ebp)) :lblneg @121108)
(=> (= ebp ebp) (and
(! (or %lbl%@121113 (= esp@0@@6 (+ esp 4))) :lblneg @121113)
(=> (= esp@0@@6 (+ esp 4)) true))))))))))))))))))))))))
(let ((anon6_Then_correct@@0 (=> (! (and %lbl%+31580 true) :lblpos +31580) (=> (and
(Jne $Efl@9@@0)
(= eax@2 call31520formal@$ret@0)) __L34_correct))))
(let ((__L33_correct (=> (! (and %lbl%+31579 true) :lblpos +31579) (and
(! (or %lbl%@120226 (isStack $s@@26)) :lblneg @120226)
(=> (isStack $s@@26) (and
(! (or %lbl%@120229 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @120229)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState $s@@26)) (StackTag $s@@26 $tMems@@12))
(=> (IsYielded (select $StackState $s@@26)) (= (select $StackState $s@@26) (StackYielded (StackEbp $s@@26 $tMems@@12) (+ (StackEsp $s@@26 $tMems@@12) 4) (StackRA $s@@26 $tMems@@12 $fMems@@4))))
(= call31508formal@$ret@0 ecx@1@@1)
(= call31511formal@$ret@0 ?TSize)) (and
(! (or %lbl%@120453 (word (* call31508formal@$ret@0 call31511formal@$ret@0))) :lblneg @120453)
(=> (word (* call31508formal@$ret@0 call31511formal@$ret@0)) (=> (and
(= call31516formal@$ret@0 (* call31508formal@$ret@0 call31511formal@$ret@0))
(= call31516formal@$ret@0 (Mult call31508formal@$ret@0 call31511formal@$ret@0))) (and
(! (or %lbl%@120498 (word (+ call31516formal@$ret@0 TLo@@0))) :lblneg @120498)
(=> (word (+ call31516formal@$ret@0 TLo@@0)) (=> (= call31520formal@$ret@0 (+ call31516formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@120526 (and
(TV TLo@@0)
(TO (* 64 $s@@26)))) :lblneg @120526)
(=> (and
(TV TLo@@0)
(TO (* 64 $s@@26))) (and
(! (or %lbl%@120545 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @120545)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@120575 (tAddr $s@@26 call31520formal@$ret@0)) :lblneg @120575)
(=> (tAddr $s@@26 call31520formal@$ret@0) (=> (and
(= (select $Mem@@3 call31520formal@$ret@0) (select (select $tMems@@12 $s@@26) call31520formal@$ret@0))
(memAddr call31520formal@$ret@0)) (and
(! (or %lbl%@120599 (PtrOk call31520formal@$ret@0)) :lblneg @120599)
(=> (PtrOk call31520formal@$ret@0) (=> (and
(word call31536formal@$val@0)
(= call31536formal@$val@0 (select $Mem@@3 call31520formal@$ret@0))
(= call31543formal@$x@0 (OpnReg call31536formal@$val@0))
(= call31543formal@$y@0 (OpnReg ?STACK_RUNNING))) (and
(! (or %lbl%@120647 (OpnOk $Mem@@3 call31543formal@$x@0)) :lblneg @120647)
(=> (OpnOk $Mem@@3 call31543formal@$x@0) (and
(! (or %lbl%@120652 (OpnOk $Mem@@3 call31543formal@$y@0)) :lblneg @120652)
(=> (OpnOk $Mem@@3 call31543formal@$y@0) (=> (FlagsCmp $Efl@9@@0 (EvalOpn $Mem@@3 call31543formal@$x@0) (EvalOpn $Mem@@3 call31543formal@$y@0)) (and
anon6_Then_correct@@0
anon6_Else_correct@@0))))))))))))))))))))))))))))))))
(let ((anon5_Then_correct@@0 (=> (! (and %lbl%+31568 true) :lblpos +31568) (=> (and
(Jb $Efl@1)
(= ecx@1@@1 ecx)) __L33_correct))))
(let ((anon0_correct@@17 (=> (! (and %lbl%+31567 true) :lblpos +31567) (=> (= (StackStateTag StackEmpty) ?STACK_EMPTY) (=> (and
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
(= call31492formal@$x@0 (OpnReg ecx))
(= call31492formal@$y@0 (OpnReg ?NumStacks))) (and
(! (or %lbl%@120115 (OpnOk $Mem@@3 call31492formal@$x@0)) :lblneg @120115)
(=> (OpnOk $Mem@@3 call31492formal@$x@0) (and
(! (or %lbl%@120120 (OpnOk $Mem@@3 call31492formal@$y@0)) :lblneg @120120)
(=> (OpnOk $Mem@@3 call31492formal@$y@0) (=> (FlagsCmp $Efl@1 (EvalOpn $Mem@@3 call31492formal@$x@0) (EvalOpn $Mem@@3 call31492formal@$y@0)) (and
anon5_Then_correct@@0
anon5_Else_correct@@0)))))))))))
(let ((PreconditionGeneratedEntry_correct@@17 (=> (! (and %lbl%+119156 true) :lblpos +119156) (=> (word ecx) (=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)
(= ecx $s@@26)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp)
(=> (not (= (select $StackState $s@@26) StackRunning)) (= (ReturnToAddr (select $Mem@@3 esp)) $RET@@0))
(SpRequire $S@@0 esp 4)) anon0_correct@@17)))))
PreconditionGeneratedEntry_correct@@17))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+31896 () Bool)
(declare-fun %lbl%+121124 () Bool)
(declare-fun %lbl%@126840 () Bool)
(declare-fun $s@@27 () Int)
(declare-fun call31693formal@$ret@0 () Int)
(declare-fun %lbl%@126845 () Bool)
(declare-fun CurrentStack@3 () Int)
(declare-fun $Mem@6 () (Array Int Int))
(declare-fun $tMems@6 () (Array Int (Array Int Int)))
(declare-fun $fMems@6 () (Array Int (Array Int Int)))
(declare-fun ebp@2 () Int)
(declare-fun esp@6 () Int)
(declare-fun %lbl%@126949 () Bool)
(declare-fun $ebp@@3 () Int)
(declare-fun $esp@@8 () Int)
(declare-fun $eip@@2 () Int)
(declare-fun $_stackState@@0 () (Array Int T@StackState))
(declare-fun %lbl%@127057 () Bool)
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
(declare-fun %lbl%@127223 () Bool)
(declare-fun %lbl%+31908 () Bool)
(declare-fun $Efl@21 () Int)
(declare-fun %lbl%@124174 () Bool)
(declare-fun %lbl%@124178 () Bool)
(declare-fun %lbl%@124184 () Bool)
(declare-fun call31742formal@$ret@0 () Int)
(declare-fun %lbl%@124187 () Bool)
(declare-fun %lbl%@124200 () Bool)
(declare-fun %lbl%@124210 () Bool)
(declare-fun %lbl%@124226 () Bool)
(declare-fun %lbl%@124306 () Bool)
(declare-fun $Mem@0@@5 () (Array Int Int))
(declare-fun $tMems@0@@1 () (Array Int (Array Int Int)))
(declare-fun $fMems@0@@1 () (Array Int (Array Int Int)))
(declare-fun %lbl%@124532 () Bool)
(declare-fun ecx@1@@2 () Int)
(declare-fun %lbl%@124536 () Bool)
(declare-fun $__stackState@0@@0 () (Array Int T@StackState))
(declare-fun %lbl%@124552 () Bool)
(declare-fun call31727formal@$ret@0 () Int)
(declare-fun %lbl%@124555 () Bool)
(declare-fun %lbl%@124567 () Bool)
(declare-fun CurrentStack@0@@0 () Int)
(declare-fun $Mem@1@@3 () (Array Int Int))
(declare-fun $tMems@1@@0 () (Array Int (Array Int Int)))
(declare-fun $fMems@1@@0 () (Array Int (Array Int Int)))
(declare-fun esp@0@@7 () Int)
(declare-fun ebp@0@@0 () Int)
(declare-fun call31775formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@124829 () Bool)
(declare-fun %lbl%@124838 () Bool)
(declare-fun esp@1@@3 () Int)
(declare-fun edx@1@@0 () Int)
(declare-fun esi@0@@2 () Int)
(declare-fun edi@0@@2 () Int)
(declare-fun ebx@0@@0 () Int)
(declare-fun ecx@2@@1 () Int)
(declare-fun eax@1@@0 () Int)
(declare-fun %lbl%+31920 () Bool)
(declare-fun $Efl@22 () Int)
(declare-fun %lbl%@124930 () Bool)
(declare-fun %lbl%@124934 () Bool)
(declare-fun %lbl%@124940 () Bool)
(declare-fun %lbl%@124943 () Bool)
(declare-fun %lbl%@124956 () Bool)
(declare-fun %lbl%@124966 () Bool)
(declare-fun %lbl%@124982 () Bool)
(declare-fun %lbl%@125062 () Bool)
(declare-fun $Mem@2@@2 () (Array Int Int))
(declare-fun $tMems@2 () (Array Int (Array Int Int)))
(declare-fun $fMems@2 () (Array Int (Array Int Int)))
(declare-fun %lbl%@125312 () Bool)
(declare-fun %lbl%@125316 () Bool)
(declare-fun %lbl%@125340 () Bool)
(declare-fun %lbl%@125343 () Bool)
(declare-fun %lbl%@125355 () Bool)
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
(declare-fun call31810formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@125675 () Bool)
(declare-fun ReturnToInterrupted (Int Int Int) T@ReturnTo)
(declare-fun %lbl%@125700 () Bool)
(declare-fun esp@3@@1 () Int)
(declare-fun %lbl%+31932 () Bool)
(declare-fun $Efl@26 () Int)
(declare-fun %lbl%@125786 () Bool)
(declare-fun %lbl%@125790 () Bool)
(declare-fun %lbl%@125796 () Bool)
(declare-fun %lbl%@125799 () Bool)
(declare-fun %lbl%@125812 () Bool)
(declare-fun %lbl%@125822 () Bool)
(declare-fun %lbl%@125838 () Bool)
(declare-fun %lbl%@125918 () Bool)
(declare-fun $Mem@4@@1 () (Array Int Int))
(declare-fun $tMems@4 () (Array Int (Array Int Int)))
(declare-fun $fMems@4 () (Array Int (Array Int Int)))
(declare-fun call31831formal@$ret@0 () Int)
(declare-fun call31834formal@$ret@0 () Int)
(declare-fun %lbl%@126177 () Bool)
(declare-fun call31839formal@$ret@0 () Int)
(declare-fun %lbl%@126222 () Bool)
(declare-fun call31843formal@$ret@0 () Int)
(declare-fun %lbl%@126250 () Bool)
(declare-fun call31868formal@$addr@0 () Int)
(declare-fun %lbl%@126293 () Bool)
(declare-fun call31868formal@$ret@0 () Int)
(declare-fun call31871formal@$ret@0 () Int)
(declare-fun %lbl%@126342 () Bool)
(declare-fun %lbl%@126346 () Bool)
(declare-fun %lbl%@126349 () Bool)
(declare-fun %lbl%@126352 () Bool)
(declare-fun %lbl%@126355 () Bool)
(declare-fun %lbl%@126365 () Bool)
(declare-fun %lbl%@126377 () Bool)
(declare-fun %lbl%@126380 () Bool)
(declare-fun %lbl%@126456 () Bool)
(declare-fun $Mem@5 () (Array Int Int))
(declare-fun CurrentStack@2 () Int)
(declare-fun $tMems@5 () (Array Int (Array Int Int)))
(declare-fun $fMems@5 () (Array Int (Array Int Int)))
(declare-fun call31877formal@$ret@0 () Int)
(declare-fun call31880formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@126615 () Bool)
(declare-fun %lbl%@126624 () Bool)
(declare-fun esp@5 () Int)
(declare-fun call31839formal@$hi@0 () Int)
(declare-fun call31724formal@$val@0 () Int)
(declare-fun %lbl%+31930 () Bool)
(declare-fun call31884formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@125739 () Bool)
(declare-fun %lbl%@125750 () Bool)
(declare-fun esp@4@@1 () Int)
(declare-fun call31738formal@$hi@0 () Int)
(declare-fun %lbl%+31918 () Bool)
(declare-fun call31821formal@$x@0 () T@opn)
(declare-fun call31821formal@$y@0 () T@opn)
(declare-fun %lbl%@124889 () Bool)
(declare-fun %lbl%@124894 () Bool)
(declare-fun %lbl%+31906 () Bool)
(declare-fun call31786formal@$x@0 () T@opn)
(declare-fun call31786formal@$y@0 () T@opn)
(declare-fun %lbl%@124133 () Bool)
(declare-fun %lbl%@124138 () Bool)
(declare-fun %lbl%+31905 () Bool)
(declare-fun %lbl%@123291 () Bool)
(declare-fun %lbl%@123294 () Bool)
(declare-fun call31670formal@$ret@0 () Int)
(declare-fun call31673formal@$ret@0 () Int)
(declare-fun %lbl%@123518 () Bool)
(declare-fun call31678formal@$ret@0 () Int)
(declare-fun %lbl%@123563 () Bool)
(declare-fun call31682formal@$ret@0 () Int)
(declare-fun %lbl%@123596 () Bool)
(declare-fun call31686formal@$ret@0 () Int)
(declare-fun %lbl%@123629 () Bool)
(declare-fun call31690formal@$ret@0 () Int)
(declare-fun call31696formal@$ret@0 () Int)
(declare-fun call31699formal@$ret@0 () Int)
(declare-fun %lbl%@123725 () Bool)
(declare-fun call31704formal@$ret@0 () Int)
(declare-fun %lbl%@123770 () Bool)
(declare-fun call31708formal@$ret@0 () Int)
(declare-fun %lbl%@123798 () Bool)
(declare-fun %lbl%@123817 () Bool)
(declare-fun %lbl%@123847 () Bool)
(declare-fun %lbl%@123871 () Bool)
(declare-fun call31730formal@$ret@0 () Int)
(declare-fun call31733formal@$ret@0 () Int)
(declare-fun %lbl%@123969 () Bool)
(declare-fun call31738formal@$ret@0 () Int)
(declare-fun %lbl%@124014 () Bool)
(declare-fun %lbl%@124042 () Bool)
(declare-fun call31759formal@$x@0 () T@opn)
(declare-fun call31759formal@$y@0 () T@opn)
(declare-fun %lbl%@124075 () Bool)
(declare-fun %lbl%@124080 () Bool)
(declare-fun %lbl%+31894 () Bool)
(declare-fun $Efl@1@@0 () Int)
(declare-fun %lbl%+31893 () Bool)
(declare-fun call31639formal@$x@0 () T@opn)
(declare-fun call31639formal@$y@0 () T@opn)
(declare-fun %lbl%@123152 () Bool)
(declare-fun %lbl%@123157 () Bool)
(declare-fun %lbl%+121130 () Bool)
(push 1)
(set-info :boogie-vc-id YieldTo)
(assert (not
(let ((anon11_Else_correct@@1 (=> (! (and %lbl%+31896 true) :lblpos +31896) true)))
(let ((GeneratedUnifiedExit_correct@@4 (=> (! (and %lbl%+121124 true) :lblpos +121124) (and
(! (or %lbl%@126840 (StackCheckInv $s@@27 call31693formal@$ret@0)) :lblneg @126840)
(=> (StackCheckInv $s@@27 call31693formal@$ret@0) (and
(! (or %lbl%@126845 (=> (= (select $StackState $s@@27) StackRunning) (and
(NucleusInv $s@@27 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 ebp)
(= esp@6 (+ esp 4))))) :lblneg @126845)
(=> (=> (= (select $StackState $s@@27) StackRunning) (and
(NucleusInv $s@@27 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 ebp)
(= esp@6 (+ esp 4)))) (and
(! (or %lbl%@126949 (=> (= (select $StackState $s@@27) (StackYielded $ebp@@3 $esp@@8 $eip@@2)) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 $ebp@@3)
(= esp@6 $esp@@8)))) :lblneg @126949)
(=> (=> (= (select $StackState $s@@27) (StackYielded $ebp@@3 $esp@@8 $eip@@2)) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 $ebp@@3)
(= esp@6 $esp@@8))) (and
(! (or %lbl%@127057 (=> (= (select $StackState $s@@27) (StackInterrupted $eax@@0 $ebx@@0 $ecx@@0 $edx@@0 $esi@@0 $edi@@0 $ebp@@3 $esp@@8 $eip@@2 $cs@@0 $efl@@0)) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 $ebp@@3)
(= esp@6 $esp@@8)
(= eax@3 $eax@@0)
(= ebx@2 $ebx@@0)
(= ecx@4 $ecx@@0)
(= edx@3 $edx@@0)
(= esi@2 $esi@@0)
(= edi@2 $edi@@0)))) :lblneg @127057)
(=> (=> (= (select $StackState $s@@27) (StackInterrupted $eax@@0 $ebx@@0 $ecx@@0 $edx@@0 $esi@@0 $edi@@0 $ebp@@3 $esp@@8 $eip@@2 $cs@@0 $efl@@0)) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= ebp@2 $ebp@@3)
(= esp@6 $esp@@8)
(= eax@3 $eax@@0)
(= ebx@2 $ebx@@0)
(= ecx@4 $ecx@@0)
(= edx@3 $edx@@0)
(= esi@2 $esi@@0)
(= edi@2 $edi@@0))) (and
(! (or %lbl%@127223 (=> (= (select $StackState $s@@27) StackEmpty) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= esp@6 (- (StackHi $s@@27) 4))
(= ebp@2 0)))) :lblneg @127223)
(=> (=> (= (select $StackState $s@@27) StackEmpty) (and
(NucleusInv $s@@27 $_stackState@@0 $toAbs@@4 $AbsMem@@3 CurrentStack@3 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@6 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@6 $fMems@6 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= esp@6 (- (StackHi $s@@27) 4))
(= ebp@2 0))) true)))))))))))))
(let ((anon12_Else_correct@@1 (=> (! (and %lbl%+31908 true) :lblpos +31908) (=> (not (Jne $Efl@21)) (and
(! (or %lbl%@124174 (Aligned esp)) :lblneg @124174)
(=> (Aligned esp) (and
(! (or %lbl%@124178 (fAddr $S@@0 esp)) :lblneg @124178)
(=> (fAddr $S@@0 esp) (and
(! (or %lbl%@124184 (Aligned call31742formal@$ret@0)) :lblneg @124184)
(=> (Aligned call31742formal@$ret@0) (and
(! (or %lbl%@124187 (= call31742formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize)))) :lblneg @124187)
(=> (= call31742formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize))) (and
(! (or %lbl%@124200 (and
(word ebp)
(word esp))) :lblneg @124200)
(=> (and
(word ebp)
(word esp)) (and
(! (or %lbl%@124210 (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning))) :lblneg @124210)
(=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)) (and
(! (or %lbl%@124226 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @124226)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@124306 (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp)) :lblneg @124306)
(=> (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp) (=> (NucleusInv $S@@0 (store $StackState $S@@0 (StackYielded ebp (+ esp 4) (select $Mem@0@@5 esp))) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@1 $fMems@0@@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(MemInv $Mem@0@@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@1 $fMems@0@@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(= $Mem@0@@5 (store (store (store $Mem@@3 call31742formal@$ret@0 ?STACK_YIELDED) (+ call31742formal@$ret@0 4) esp) (+ call31742formal@$ret@0 8) ebp))) (and
(! (or %lbl%@124532 (= ecx@1@@2 $s@@27)) :lblneg @124532)
(=> (= ecx@1@@2 $s@@27) (and
(! (or %lbl%@124536 (and
(isStack $s@@27)
(= (select $__stackState@0@@0 $s@@27) (StackYielded $ebp@@3 $esp@@8 $eip@@2)))) :lblneg @124536)
(=> (and
(isStack $s@@27)
(= (select $__stackState@0@@0 $s@@27) (StackYielded $ebp@@3 $esp@@8 $eip@@2))) (and
(! (or %lbl%@124552 (Aligned call31727formal@$ret@0)) :lblneg @124552)
(=> (Aligned call31727formal@$ret@0) (and
(! (or %lbl%@124555 (= call31727formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize)))) :lblneg @124555)
(=> (= call31727formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize))) (and
(! (or %lbl%@124567 (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@1 $fMems@0@@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @124567)
(=> (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@0@@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@0@@1 $fMems@0@@1 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(NucleusInv $s@@27 (store $__stackState@0@@0 $s@@27 StackRunning) $toAbs@@4 $AbsMem@@3 CurrentStack@0@@0 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@1@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@1@@0 $fMems@1@@0 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= esp@0@@7 (- $esp@@8 4))) (=> (and
(= ebp@0@@0 $ebp@@3)
(Aligned esp@0@@7)
(= (select $Mem@1@@3 (- $esp@@8 4)) $eip@@2)
(= call31775formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@124829 (= (ReturnToAddr (select $Mem@1@@3 esp@0@@7)) call31775formal@$oldRA@0)) :lblneg @124829)
(=> (= (ReturnToAddr (select $Mem@1@@3 esp@0@@7)) call31775formal@$oldRA@0) (and
(! (or %lbl%@124838 (Aligned esp@0@@7)) :lblneg @124838)
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
(let ((anon13_Else_correct@@0 (=> (! (and %lbl%+31920 true) :lblpos +31920) (=> (not (Jne $Efl@22)) (and
(! (or %lbl%@124930 (Aligned esp)) :lblneg @124930)
(=> (Aligned esp) (and
(! (or %lbl%@124934 (fAddr $S@@0 esp)) :lblneg @124934)
(=> (fAddr $S@@0 esp) (and
(! (or %lbl%@124940 (Aligned call31742formal@$ret@0)) :lblneg @124940)
(=> (Aligned call31742formal@$ret@0) (and
(! (or %lbl%@124943 (= call31742formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize)))) :lblneg @124943)
(=> (= call31742formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize))) (and
(! (or %lbl%@124956 (and
(word ebp)
(word esp))) :lblneg @124956)
(=> (and
(word ebp)
(word esp)) (and
(! (or %lbl%@124966 (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning))) :lblneg @124966)
(=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)) (and
(! (or %lbl%@124982 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @124982)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@125062 (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp)) :lblneg @125062)
(=> (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp) (=> (NucleusInv $S@@0 (store $StackState $S@@0 (StackYielded ebp (+ esp 4) (select $Mem@2@@2 esp))) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@2@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@2 $fMems@2 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(MemInv $Mem@2@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@2 $fMems@2 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(= $Mem@2@@2 (store (store (store $Mem@@3 call31742formal@$ret@0 ?STACK_YIELDED) (+ call31742formal@$ret@0 4) esp) (+ call31742formal@$ret@0 8) ebp))) (and
(! (or %lbl%@125312 (= ecx@1@@2 $s@@27)) :lblneg @125312)
(=> (= ecx@1@@2 $s@@27) (and
(! (or %lbl%@125316 (and
(isStack $s@@27)
(= (select $__stackState@0@@0 $s@@27) (StackInterrupted $eax@@0 $ebx@@0 $ecx@@0 $edx@@0 $esi@@0 $edi@@0 $ebp@@3 $esp@@8 $eip@@2 $cs@@0 $efl@@0)))) :lblneg @125316)
(=> (and
(isStack $s@@27)
(= (select $__stackState@0@@0 $s@@27) (StackInterrupted $eax@@0 $ebx@@0 $ecx@@0 $edx@@0 $esi@@0 $edi@@0 $ebp@@3 $esp@@8 $eip@@2 $cs@@0 $efl@@0))) (and
(! (or %lbl%@125340 (Aligned call31727formal@$ret@0)) :lblneg @125340)
(=> (Aligned call31727formal@$ret@0) (and
(! (or %lbl%@125343 (= call31727formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize)))) :lblneg @125343)
(=> (= call31727formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize))) (and
(! (or %lbl%@125355 (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@2@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@2 $fMems@2 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @125355)
(=> (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@2@@2 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@2 $fMems@2 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(NucleusInv $s@@27 (store $__stackState@0@@0 $s@@27 StackRunning) $toAbs@@4 $AbsMem@@3 CurrentStack@1 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@3@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@3 $fMems@3 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
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
(= call31810formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@125675 (= (ReturnToInterrupted (select $Mem@3@@1 esp@2@@1) (select $Mem@3@@1 (+ esp@2@@1 4)) (select $Mem@3@@1 (+ esp@2@@1 8))) call31810formal@$oldRA@0)) :lblneg @125675)
(=> (= (ReturnToInterrupted (select $Mem@3@@1 esp@2@@1) (select $Mem@3@@1 (+ esp@2@@1 4)) (select $Mem@3@@1 (+ esp@2@@1 8))) call31810formal@$oldRA@0) (and
(! (or %lbl%@125700 (Aligned esp@2@@1)) :lblneg @125700)
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
(let ((anon14_Else_correct@@0 (=> (! (and %lbl%+31932 true) :lblpos +31932) (=> (not (Jne $Efl@26)) (and
(! (or %lbl%@125786 (Aligned esp)) :lblneg @125786)
(=> (Aligned esp) (and
(! (or %lbl%@125790 (fAddr $S@@0 esp)) :lblneg @125790)
(=> (fAddr $S@@0 esp) (and
(! (or %lbl%@125796 (Aligned call31742formal@$ret@0)) :lblneg @125796)
(=> (Aligned call31742formal@$ret@0) (and
(! (or %lbl%@125799 (= call31742formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize)))) :lblneg @125799)
(=> (= call31742formal@$ret@0 (+ ?tLo (* $S@@0 ?TSize))) (and
(! (or %lbl%@125812 (and
(word ebp)
(word esp))) :lblneg @125812)
(=> (and
(word ebp)
(word esp)) (and
(! (or %lbl%@125822 (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning))) :lblneg @125822)
(=> (and
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)) (and
(! (or %lbl%@125838 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @125838)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@125918 (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp)) :lblneg @125918)
(=> (ScanStackInv $S@@0 $Mem@@3 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 (select $Mem@@3 esp) esp ebp) (=> (NucleusInv $S@@0 (store $StackState $S@@0 (StackYielded ebp (+ esp 4) (select $Mem@4@@1 esp))) $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@4@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@4 $fMems@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(MemInv $Mem@4@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@4 $fMems@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(= $Mem@4@@1 (store (store (store $Mem@@3 call31742formal@$ret@0 ?STACK_YIELDED) (+ call31742formal@$ret@0 4) esp) (+ call31742formal@$ret@0 8) ebp))
(= call31831formal@$ret@0 ecx@1@@2)
(= call31834formal@$ret@0 ?FSize)) (and
(! (or %lbl%@126177 (word (* call31831formal@$ret@0 call31834formal@$ret@0))) :lblneg @126177)
(=> (word (* call31831formal@$ret@0 call31834formal@$ret@0)) (=> (and
(= call31839formal@$ret@0 (* call31831formal@$ret@0 call31834formal@$ret@0))
(= call31839formal@$ret@0 (Mult call31831formal@$ret@0 call31834formal@$ret@0))) (and
(! (or %lbl%@126222 (word (+ call31839formal@$ret@0 FLo@@0))) :lblneg @126222)
(=> (word (+ call31839formal@$ret@0 FLo@@0)) (=> (= call31843formal@$ret@0 (+ call31839formal@$ret@0 FLo@@0)) (and
(! (or %lbl%@126250 (and
(TV FLo@@0)
(TO (+ (* $s@@27 4096) 4094))
(TO (+ (* $s@@27 4096) 4095)))) :lblneg @126250)
(=> (and
(TV FLo@@0)
(TO (+ (* $s@@27 4096) 4094))
(TO (+ (* $s@@27 4096) 4095))) (=> (= call31868formal@$addr@0 (+ call31843formal@$ret@0 16376)) (and
(! (or %lbl%@126293 (word call31868formal@$addr@0)) :lblneg @126293)
(=> (word call31868formal@$addr@0) (=> (and
(= call31868formal@$ret@0 call31868formal@$addr@0)
(= call31871formal@$ret@0 ?KernelEntryPoint)) (and
(! (or %lbl%@126342 (= ecx@1@@2 $s@@27)) :lblneg @126342)
(=> (= ecx@1@@2 $s@@27) (and
(! (or %lbl%@126346 (isStack $s@@27)) :lblneg @126346)
(=> (isStack $s@@27) (and
(! (or %lbl%@126349 (Aligned call31868formal@$ret@0)) :lblneg @126349)
(=> (Aligned call31868formal@$ret@0) (and
(! (or %lbl%@126352 (Aligned call31727formal@$ret@0)) :lblneg @126352)
(=> (Aligned call31727formal@$ret@0) (and
(! (or %lbl%@126355 (= call31868formal@$ret@0 (- (StackHi $s@@27) 8))) :lblneg @126355)
(=> (= call31868formal@$ret@0 (- (StackHi $s@@27) 8)) (and
(! (or %lbl%@126365 (= call31727formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize)))) :lblneg @126365)
(=> (= call31727formal@$ret@0 (+ ?tLo (* $s@@27 ?TSize))) (and
(! (or %lbl%@126377 (word call31871formal@$ret@0)) :lblneg @126377)
(=> (word call31871formal@$ret@0) (and
(! (or %lbl%@126380 (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@4@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@4 $fMems@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @126380)
(=> (NucleusInv $S@@0 $__stackState@0@@0 $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@4@@1 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@4 $fMems@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (and
(! (or %lbl%@126456 (= (select $FrameCounts@@2 $s@@27) 0)) :lblneg @126456)
(=> (= (select $FrameCounts@@2 $s@@27) 0) (=> (and
(= (select $Mem@5 (+ call31868formal@$ret@0 0)) call31871formal@$ret@0)
(NucleusInv $s@@27 (store $__stackState@0@@0 $s@@27 StackRunning) $toAbs@@4 $AbsMem@@3 CurrentStack@2 $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@5 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@5 $fMems@5 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
(= call31877formal@$ret@0 0)
(= call31880formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@126615 (= (ReturnToAddr (select $Mem@5 call31868formal@$ret@0)) call31880formal@$oldRA@0)) :lblneg @126615)
(=> (= (ReturnToAddr (select $Mem@5 call31868formal@$ret@0)) call31880formal@$oldRA@0) (and
(! (or %lbl%@126624 (Aligned call31868formal@$ret@0)) :lblneg @126624)
(=> (Aligned call31868formal@$ret@0) (=> (and
(= esp@5 (+ call31868formal@$ret@0 4))
(Aligned esp@5)) (=> (and
(= esp@6 esp@5)
(= CurrentStack@3 CurrentStack@2)
(= edx@3 call31839formal@$hi@0)
(= esi@2 esi)) (=> (and
(= edi@2 call31727formal@$ret@0)
(= ebx@2 call31724formal@$val@0)
(= $tMems@6 $tMems@5)
(= $Mem@6 $Mem@5)
(= ebp@2 call31877formal@$ret@0)
(= ecx@4 ecx@1@@2)
(= $fMems@6 $fMems@5)
(= eax@3 call31871formal@$ret@0)) GeneratedUnifiedExit_correct@@4))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon14_Then_correct@@0 (=> (! (and %lbl%+31930 true) :lblpos +31930) (=> (and
(Jne $Efl@26)
(= call31884formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@125739 (= (ReturnToAddr (select $Mem@@3 esp)) call31884formal@$oldRA@0)) :lblneg @125739)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call31884formal@$oldRA@0) (and
(! (or %lbl%@125750 (Aligned esp)) :lblneg @125750)
(=> (Aligned esp) (=> (and
(= esp@4@@1 (+ esp 4))
(Aligned esp@4@@1)) (=> (and
(= esp@6 esp@4@@1)
(= CurrentStack@3 CurrentStack)
(= edx@3 call31738formal@$hi@0)
(= esi@2 esi)) (=> (and
(= edi@2 call31727formal@$ret@0)
(= ebx@2 call31724formal@$val@0)
(= $tMems@6 $tMems@@12)
(= $Mem@6 $Mem@@3)
(= ebp@2 ebp)
(= ecx@4 ecx@1@@2)
(= $fMems@6 $fMems@@4)
(= eax@3 call31742formal@$ret@0)) GeneratedUnifiedExit_correct@@4)))))))))))
(let ((anon13_Then_correct@@0 (=> (! (and %lbl%+31918 true) :lblpos +31918) (=> (Jne $Efl@22) (=> (and
(= call31821formal@$x@0 (OpnReg call31724formal@$val@0))
(= call31821formal@$y@0 (OpnReg ?STACK_EMPTY))) (and
(! (or %lbl%@124889 (OpnOk $Mem@@3 call31821formal@$x@0)) :lblneg @124889)
(=> (OpnOk $Mem@@3 call31821formal@$x@0) (and
(! (or %lbl%@124894 (OpnOk $Mem@@3 call31821formal@$y@0)) :lblneg @124894)
(=> (OpnOk $Mem@@3 call31821formal@$y@0) (=> (FlagsCmp $Efl@26 (EvalOpn $Mem@@3 call31821formal@$x@0) (EvalOpn $Mem@@3 call31821formal@$y@0)) (and
anon14_Then_correct@@0
anon14_Else_correct@@0)))))))))))
(let ((anon12_Then_correct@@1 (=> (! (and %lbl%+31906 true) :lblpos +31906) (=> (Jne $Efl@21) (=> (and
(= call31786formal@$x@0 (OpnReg call31724formal@$val@0))
(= call31786formal@$y@0 (OpnReg ?STACK_INTERRUPTED))) (and
(! (or %lbl%@124133 (OpnOk $Mem@@3 call31786formal@$x@0)) :lblneg @124133)
(=> (OpnOk $Mem@@3 call31786formal@$x@0) (and
(! (or %lbl%@124138 (OpnOk $Mem@@3 call31786formal@$y@0)) :lblneg @124138)
(=> (OpnOk $Mem@@3 call31786formal@$y@0) (=> (FlagsCmp $Efl@22 (EvalOpn $Mem@@3 call31786formal@$x@0) (EvalOpn $Mem@@3 call31786formal@$y@0)) (and
anon13_Then_correct@@0
anon13_Else_correct@@0)))))))))))
(let ((__L35_correct (=> (! (and %lbl%+31905 true) :lblpos +31905) (=> (= $__stackState@0@@0 (store $StackState $S@@0 (StackYielded ebp (+ esp 4) (select $Mem@@3 esp)))) (and
(! (or %lbl%@123291 (isStack $s@@27)) :lblneg @123291)
(=> (isStack $s@@27) (and
(! (or %lbl%@123294 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @123294)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState $s@@27)) (StackTag $s@@27 $tMems@@12))
(=> (IsYielded (select $StackState $s@@27)) (= (select $StackState $s@@27) (StackYielded (StackEbp $s@@27 $tMems@@12) (+ (StackEsp $s@@27 $tMems@@12) 4) (StackRA $s@@27 $tMems@@12 $fMems@@4))))
(= call31670formal@$ret@0 ecx@1@@2)
(= call31673formal@$ret@0 ?FSize)) (and
(! (or %lbl%@123518 (word (* call31670formal@$ret@0 call31673formal@$ret@0))) :lblneg @123518)
(=> (word (* call31670formal@$ret@0 call31673formal@$ret@0)) (=> (and
(= call31678formal@$ret@0 (* call31670formal@$ret@0 call31673formal@$ret@0))
(= call31678formal@$ret@0 (Mult call31670formal@$ret@0 call31673formal@$ret@0))) (and
(! (or %lbl%@123563 (word (+ call31678formal@$ret@0 FLo@@0))) :lblneg @123563)
(=> (word (+ call31678formal@$ret@0 FLo@@0)) (=> (= call31682formal@$ret@0 (+ call31678formal@$ret@0 FLo@@0)) (and
(! (or %lbl%@123596 (word (+ call31682formal@$ret@0 ?StackReserve))) :lblneg @123596)
(=> (word (+ call31682formal@$ret@0 ?StackReserve)) (=> (= call31686formal@$ret@0 (+ call31682formal@$ret@0 ?StackReserve)) (and
(! (or %lbl%@123629 (word (+ call31686formal@$ret@0 ?InterruptReserve))) :lblneg @123629)
(=> (word (+ call31686formal@$ret@0 ?InterruptReserve)) (=> (and
(= call31690formal@$ret@0 (+ call31686formal@$ret@0 ?InterruptReserve))
(= call31693formal@$ret@0 call31690formal@$ret@0)
(= call31696formal@$ret@0 ecx@1@@2)
(= call31699formal@$ret@0 ?TSize)) (and
(! (or %lbl%@123725 (word (* call31696formal@$ret@0 call31699formal@$ret@0))) :lblneg @123725)
(=> (word (* call31696formal@$ret@0 call31699formal@$ret@0)) (=> (and
(= call31704formal@$ret@0 (* call31696formal@$ret@0 call31699formal@$ret@0))
(= call31704formal@$ret@0 (Mult call31696formal@$ret@0 call31699formal@$ret@0))) (and
(! (or %lbl%@123770 (word (+ call31704formal@$ret@0 TLo@@0))) :lblneg @123770)
(=> (word (+ call31704formal@$ret@0 TLo@@0)) (=> (= call31708formal@$ret@0 (+ call31704formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@123798 (and
(TV TLo@@0)
(TO (* 64 $s@@27)))) :lblneg @123798)
(=> (and
(TV TLo@@0)
(TO (* 64 $s@@27))) (and
(! (or %lbl%@123817 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @123817)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@123847 (tAddr $s@@27 call31708formal@$ret@0)) :lblneg @123847)
(=> (tAddr $s@@27 call31708formal@$ret@0) (=> (and
(= (select $Mem@@3 call31708formal@$ret@0) (select (select $tMems@@12 $s@@27) call31708formal@$ret@0))
(memAddr call31708formal@$ret@0)) (and
(! (or %lbl%@123871 (PtrOk call31708formal@$ret@0)) :lblneg @123871)
(=> (PtrOk call31708formal@$ret@0) (=> (word call31724formal@$val@0) (=> (and
(= call31724formal@$val@0 (select $Mem@@3 call31708formal@$ret@0))
(= call31727formal@$ret@0 call31708formal@$ret@0)
(= call31730formal@$ret@0 CurrentStack)
(= call31733formal@$ret@0 ?TSize)) (and
(! (or %lbl%@123969 (word (* call31730formal@$ret@0 call31733formal@$ret@0))) :lblneg @123969)
(=> (word (* call31730formal@$ret@0 call31733formal@$ret@0)) (=> (and
(= call31738formal@$ret@0 (* call31730formal@$ret@0 call31733formal@$ret@0))
(= call31738formal@$ret@0 (Mult call31730formal@$ret@0 call31733formal@$ret@0))) (and
(! (or %lbl%@124014 (word (+ call31738formal@$ret@0 TLo@@0))) :lblneg @124014)
(=> (word (+ call31738formal@$ret@0 TLo@@0)) (=> (= call31742formal@$ret@0 (+ call31738formal@$ret@0 TLo@@0)) (and
(! (or %lbl%@124042 (and
(TV TLo@@0)
(TO (* 64 $S@@0)))) :lblneg @124042)
(=> (and
(TV TLo@@0)
(TO (* 64 $S@@0))) (=> (and
(= call31759formal@$x@0 (OpnReg call31724formal@$val@0))
(= call31759formal@$y@0 (OpnReg ?STACK_YIELDED))) (and
(! (or %lbl%@124075 (OpnOk $Mem@@3 call31759formal@$x@0)) :lblneg @124075)
(=> (OpnOk $Mem@@3 call31759formal@$x@0) (and
(! (or %lbl%@124080 (OpnOk $Mem@@3 call31759formal@$y@0)) :lblneg @124080)
(=> (OpnOk $Mem@@3 call31759formal@$y@0) (=> (FlagsCmp $Efl@21 (EvalOpn $Mem@@3 call31759formal@$x@0) (EvalOpn $Mem@@3 call31759formal@$y@0)) (and
anon12_Then_correct@@1
anon12_Else_correct@@1)))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon11_Then_correct@@1 (=> (! (and %lbl%+31894 true) :lblpos +31894) (=> (and
(Jb $Efl@1@@0)
(= ecx@1@@2 ecx)) __L35_correct))))
(let ((anon0_correct@@18 (=> (! (and %lbl%+31893 true) :lblpos +31893) (=> (= (StackStateTag StackEmpty) ?STACK_EMPTY) (=> (and
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
(= call31639formal@$x@0 (OpnReg ecx))
(= call31639formal@$y@0 (OpnReg ?NumStacks))) (and
(! (or %lbl%@123152 (OpnOk $Mem@@3 call31639formal@$x@0)) :lblneg @123152)
(=> (OpnOk $Mem@@3 call31639formal@$x@0) (and
(! (or %lbl%@123157 (OpnOk $Mem@@3 call31639formal@$y@0)) :lblneg @123157)
(=> (OpnOk $Mem@@3 call31639formal@$y@0) (=> (FlagsCmp $Efl@1@@0 (EvalOpn $Mem@@3 call31639formal@$x@0) (EvalOpn $Mem@@3 call31639formal@$y@0)) (and
anon11_Then_correct@@1
anon11_Else_correct@@1)))))))))))
(let ((PreconditionGeneratedEntry_correct@@18 (=> (! (and %lbl%+121130 true) :lblpos +121130) (=> (= ecx $s@@27) (=> (and
(word eax)
(word ebx)
(word ecx)
(word edx)
(word esi)
(word edi)
(word ebp)
(isStack $S@@0)
(= (select $StackState $S@@0) StackRunning)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)
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
(declare-fun %lbl%+31978 () Bool)
(declare-fun call31963formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@127710 () Bool)
(declare-fun %lbl%@127721 () Bool)
(declare-fun esp@0@@8 () Int)
(declare-fun %lbl%@127754 () Bool)
(declare-fun $VgaNextEvent@1 () Int)
(declare-fun $VgaNextEvent () Int)
(declare-sort T@VgaEvent 0)
(declare-fun $VgaEvents@1 () (Array Int T@VgaEvent))
(declare-fun $VgaEvents () (Array Int T@VgaEvent))
(declare-fun VgaTextStore (Int Int) T@VgaEvent)
(declare-fun %lbl%@127793 () Bool)
(declare-fun %lbl%+31975 () Bool)
(declare-fun $Efl@0@@0 () Int)
(declare-fun call31960formal@$ptr@0 () Int)
(declare-fun %lbl%@127632 () Bool)
(declare-fun %lbl%@127635 () Bool)
(declare-fun $VgaNextEvent@0 () Int)
(declare-fun $VgaEvents@0 () (Array Int T@VgaEvent))
(declare-fun %lbl%+31973 () Bool)
(declare-fun %lbl%+31972 () Bool)
(declare-fun call31945formal@$x@0 () T@opn)
(declare-fun call31945formal@$y@0 () T@opn)
(declare-fun %lbl%@127566 () Bool)
(declare-fun %lbl%@127571 () Bool)
(declare-fun %lbl%+127333 () Bool)
(push 1)
(set-info :boogie-vc-id VgaTextWrite)
(assert (not
(let ((__L41_correct (=> (! (and %lbl%+31978 true) :lblpos +31978) (=> (= call31963formal@$oldRA@0 $RET@@0) (and
(! (or %lbl%@127710 (= (ReturnToAddr (select $Mem@@3 esp)) call31963formal@$oldRA@0)) :lblneg @127710)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call31963formal@$oldRA@0) (and
(! (or %lbl%@127721 (Aligned esp)) :lblneg @127721)
(=> (Aligned esp) (=> (and
(= esp@0@@8 (+ esp 4))
(Aligned esp@0@@8)) (and
(! (or %lbl%@127754 (=> (< ecx 4000) (and
(= $VgaNextEvent@1 (+ $VgaNextEvent 1))
(= $VgaEvents@1 (store $VgaEvents $VgaNextEvent (VgaTextStore (+ ?VgaTextLo (* 2 ecx)) edx)))))) :lblneg @127754)
(=> (=> (< ecx 4000) (and
(= $VgaNextEvent@1 (+ $VgaNextEvent 1))
(= $VgaEvents@1 (store $VgaEvents $VgaNextEvent (VgaTextStore (+ ?VgaTextLo (* 2 ecx)) edx))))) (and
(! (or %lbl%@127793 (= esp@0@@8 (+ esp 4))) :lblneg @127793)
(=> (= esp@0@@8 (+ esp 4)) true)))))))))))))
(let ((anon3_Else_correct@@2 (=> (! (and %lbl%+31975 true) :lblpos +31975) (=> (and
(not (Jae $Efl@0@@0))
(= call31960formal@$ptr@0 (+ (+ ecx (* 1 ecx)) 753664))) (and
(! (or %lbl%@127632 (vgaAddr2 call31960formal@$ptr@0)) :lblneg @127632)
(=> (vgaAddr2 call31960formal@$ptr@0) (and
(! (or %lbl%@127635 (word edx)) :lblneg @127635)
(=> (word edx) (=> (and
(= $VgaNextEvent@0 (+ $VgaNextEvent 1))
(= $VgaEvents@0 (store $VgaEvents $VgaNextEvent (VgaTextStore call31960formal@$ptr@0 edx)))
(= $VgaNextEvent@1 $VgaNextEvent@0)
(= $VgaEvents@1 $VgaEvents@0)) __L41_correct)))))))))
(let ((anon3_Then_correct@@2 (=> (! (and %lbl%+31973 true) :lblpos +31973) (=> (Jae $Efl@0@@0) (=> (and
(= $VgaNextEvent@1 $VgaNextEvent)
(= $VgaEvents@1 $VgaEvents)) __L41_correct)))))
(let ((anon0_correct@@19 (=> (! (and %lbl%+31972 true) :lblpos +31972) (=> (and
(= call31945formal@$x@0 (OpnReg ecx))
(= call31945formal@$y@0 (OpnReg 4000))) (and
(! (or %lbl%@127566 (OpnOk $Mem@@3 call31945formal@$x@0)) :lblneg @127566)
(=> (OpnOk $Mem@@3 call31945formal@$x@0) (and
(! (or %lbl%@127571 (OpnOk $Mem@@3 call31945formal@$y@0)) :lblneg @127571)
(=> (OpnOk $Mem@@3 call31945formal@$y@0) (=> (FlagsCmp $Efl@0@@0 (EvalOpn $Mem@@3 call31945formal@$x@0) (EvalOpn $Mem@@3 call31945formal@$y@0)) (and
anon3_Then_correct@@2
anon3_Else_correct@@2))))))))))
(let ((PreconditionGeneratedEntry_correct@@19 (=> (! (and %lbl%+127333 true) :lblpos +127333) (=> (and
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
(declare-fun %lbl%+127802 () Bool)
(declare-fun %lbl%@128423 () Bool)
(declare-fun $KeyboardAvailable@0 () Int)
(declare-fun $KeyboardDone () Int)
(declare-fun eax@2@@1 () Int)
(declare-fun %lbl%@128434 () Bool)
(declare-fun $KeyboardEvents () (Array Int Int))
(declare-fun %lbl%@128448 () Bool)
(declare-fun esp@2@@2 () Int)
(declare-fun %lbl%+32023 () Bool)
(declare-fun $Efl@2 () Int)
(declare-fun call31999formal@$ret@0 () Int)
(declare-fun call32002formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@128224 () Bool)
(declare-fun %lbl%@128235 () Bool)
(declare-fun esp@0@@9 () Int)
(declare-fun $KeyboardDone@1 () Int)
(declare-fun %lbl%+32021 () Bool)
(declare-fun %lbl%@128269 () Bool)
(declare-fun $KeyboardDone@0 () Int)
(declare-fun eax@1@@1 () Int)
(declare-fun call32008formal@$ret@0 () Int)
(declare-fun call32011formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@128353 () Bool)
(declare-fun %lbl%@128364 () Bool)
(declare-fun esp@1@@4 () Int)
(declare-fun %lbl%+32020 () Bool)
(declare-fun eax@0@@0 () Int)
(declare-fun call31983formal@$ret@0 () Int)
(declare-fun call31990formal@$x@0 () T@opn)
(declare-fun call31990formal@$y@0 () T@opn)
(declare-fun %lbl%@128153 () Bool)
(declare-fun %lbl%@128158 () Bool)
(declare-fun %lbl%+127806 () Bool)
(push 1)
(set-info :boogie-vc-id TryReadKeyboard)
(assert (not
(let ((GeneratedUnifiedExit_correct@@5 (=> (! (and %lbl%+127802 true) :lblpos +127802) (and
(! (or %lbl%@128423 (=> (= $KeyboardAvailable@0 $KeyboardDone) (= eax@2@@1 256))) :lblneg @128423)
(=> (=> (= $KeyboardAvailable@0 $KeyboardDone) (= eax@2@@1 256)) (and
(! (or %lbl%@128434 (=> (> $KeyboardAvailable@0 $KeyboardDone) (= eax@2@@1 (select $KeyboardEvents $KeyboardDone)))) :lblneg @128434)
(=> (=> (> $KeyboardAvailable@0 $KeyboardDone) (= eax@2@@1 (select $KeyboardEvents $KeyboardDone))) (and
(! (or %lbl%@128448 (= esp@2@@2 (+ esp 4))) :lblneg @128448)
(=> (= esp@2@@2 (+ esp 4)) true)))))))))
(let ((anon3_Else_correct@@3 (=> (! (and %lbl%+32023 true) :lblpos +32023) (=> (not (Jne $Efl@2)) (=> (and
(= call31999formal@$ret@0 256)
(= call32002formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@128224 (= (ReturnToAddr (select $Mem@@3 esp)) call32002formal@$oldRA@0)) :lblneg @128224)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32002formal@$oldRA@0) (and
(! (or %lbl%@128235 (Aligned esp)) :lblneg @128235)
(=> (Aligned esp) (=> (= esp@0@@9 (+ esp 4)) (=> (and
(Aligned esp@0@@9)
(= $KeyboardDone@1 $KeyboardDone)
(= esp@2@@2 esp@0@@9)
(= eax@2@@1 call31999formal@$ret@0)) GeneratedUnifiedExit_correct@@5)))))))))))
(let ((anon3_Then_correct@@3 (=> (! (and %lbl%+32021 true) :lblpos +32021) (=> (Jne $Efl@2) (and
(! (or %lbl%@128269 (> $KeyboardAvailable@0 $KeyboardDone)) :lblneg @128269)
(=> (> $KeyboardAvailable@0 $KeyboardDone) (=> (= $KeyboardDone@0 (+ $KeyboardDone 1)) (=> (and
(= (q@and eax@1@@1 255) (select $KeyboardEvents $KeyboardDone))
(= call32008formal@$ret@0 (q@and eax@1@@1 255))
(word call32008formal@$ret@0)
(= call32011formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@128353 (= (ReturnToAddr (select $Mem@@3 esp)) call32011formal@$oldRA@0)) :lblneg @128353)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32011formal@$oldRA@0) (and
(! (or %lbl%@128364 (Aligned esp)) :lblneg @128364)
(=> (Aligned esp) (=> (= esp@1@@4 (+ esp 4)) (=> (and
(Aligned esp@1@@4)
(= $KeyboardDone@1 $KeyboardDone@0)
(= esp@2@@2 esp@1@@4)
(= eax@2@@1 call32008formal@$ret@0)) GeneratedUnifiedExit_correct@@5))))))))))))))
(let ((anon0_correct@@20 (=> (! (and %lbl%+32020 true) :lblpos +32020) (=> (and
(=> (= (q@and eax@0@@0 1) 0) (= $KeyboardAvailable@0 $KeyboardDone))
(=> (not (= (q@and eax@0@@0 1) 0)) (> $KeyboardAvailable@0 $KeyboardDone))) (=> (and
(= call31983formal@$ret@0 (q@and eax@0@@0 1))
(word call31983formal@$ret@0)
(= call31990formal@$x@0 (OpnReg call31983formal@$ret@0))
(= call31990formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@128153 (OpnOk $Mem@@3 call31990formal@$x@0)) :lblneg @128153)
(=> (OpnOk $Mem@@3 call31990formal@$x@0) (and
(! (or %lbl%@128158 (OpnOk $Mem@@3 call31990formal@$y@0)) :lblneg @128158)
(=> (OpnOk $Mem@@3 call31990formal@$y@0) (=> (FlagsCmp $Efl@2 (EvalOpn $Mem@@3 call31990formal@$x@0) (EvalOpn $Mem@@3 call31990formal@$y@0)) (and
anon3_Then_correct@@3
anon3_Else_correct@@3)))))))))))
(let ((PreconditionGeneratedEntry_correct@@20 (=> (! (and %lbl%+127806 true) :lblpos +127806) (=> (and
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
(declare-fun %lbl%+32032 () Bool)
(declare-fun %lbl%@128624 () Bool)
(declare-fun $TimerSeq@0@@0 () Int)
(declare-fun $TimerFreq@0@@0 () Int)
(declare-fun call32029formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@128676 () Bool)
(declare-fun %lbl%@128687 () Bool)
(declare-fun esp@0@@10 () Int)
(declare-fun %lbl%@128718 () Bool)
(declare-fun %lbl%@128728 () Bool)
(declare-fun %lbl%+128457 () Bool)
(push 1)
(set-info :boogie-vc-id StartTimer)
(assert (not
(let ((anon0_correct@@21 (=> (! (and %lbl%+32032 true) :lblpos +32032) (and
(! (or %lbl%@128624 (word ecx)) :lblneg @128624)
(=> (word ecx) (=> (and
(TimerOk $TimerSeq@0@@0)
(= $TimerFreq@0@@0 ecx)
(= call32029formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@128676 (= (ReturnToAddr (select $Mem@@3 esp)) call32029formal@$oldRA@0)) :lblneg @128676)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32029formal@$oldRA@0) (and
(! (or %lbl%@128687 (Aligned esp)) :lblneg @128687)
(=> (Aligned esp) (=> (and
(= esp@0@@10 (+ esp 4))
(Aligned esp@0@@10)) (and
(! (or %lbl%@128718 (and
(TimerOk $TimerSeq@0@@0)
(= $TimerFreq@0@@0 ecx))) :lblneg @128718)
(=> (and
(TimerOk $TimerSeq@0@@0)
(= $TimerFreq@0@@0 ecx)) (and
(! (or %lbl%@128728 (= esp@0@@10 (+ esp 4))) :lblneg @128728)
(=> (= esp@0@@10 (+ esp 4)) true)))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@21 (=> (! (and %lbl%+128457 true) :lblpos +128457) (=> (and
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
(declare-fun %lbl%+32080 () Bool)
(declare-fun $seq0@0 () Int)
(declare-fun $PicSeq@@0 () (Array Int Int))
(declare-fun $seq1@0 () Int)
(declare-fun call32057formal@$ret@0 () Int)
(declare-fun call32060formal@$ret@0 () Int)
(declare-fun %lbl%@129075 () Bool)
(declare-fun %lbl%@129107 () Bool)
(declare-fun %lbl%@129119 () Bool)
(declare-fun %lbl%@129138 () Bool)
(declare-fun $PicSeq@0 () (Array Int Int))
(declare-fun call32067formal@$ret@0 () Int)
(declare-fun call32070formal@$ret@0 () Int)
(declare-fun %lbl%@129443 () Bool)
(declare-fun %lbl%@129475 () Bool)
(declare-fun %lbl%@129487 () Bool)
(declare-fun %lbl%@129505 () Bool)
(declare-fun $PicSeq@1 () (Array Int Int))
(declare-fun call32077formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@129765 () Bool)
(declare-fun %lbl%@129776 () Bool)
(declare-fun esp@0@@11 () Int)
(declare-fun %lbl%@129807 () Bool)
(declare-fun %lbl%@129823 () Bool)
(declare-fun %lbl%@129839 () Bool)
(declare-fun %lbl%+128737 () Bool)
(push 1)
(set-info :boogie-vc-id SendEoi)
(assert (not
(let ((anon0_correct@@22 (=> (! (and %lbl%+32080 true) :lblpos +32080) (=> (and
(= $seq0@0 (+ (select $PicSeq@@0 0) 1))
(= $seq1@0 (+ (select $PicSeq@@0 1) 1))
(= call32057formal@$ret@0 32)
(= call32060formal@$ret@0 32)) (and
(! (or %lbl%@129075 (or
(and
(= 0 0)
(= call32060formal@$ret@0 (+ 32 0)))
(and
(= 0 1)
(= call32060formal@$ret@0 (+ 160 0))))) :lblneg @129075)
(=> (or
(and
(= 0 0)
(= call32060formal@$ret@0 (+ 32 0)))
(and
(= 0 1)
(= call32060formal@$ret@0 (+ 160 0)))) (and
(! (or %lbl%@129107 (or
(= 0 0)
(= 0 1))) :lblneg @129107)
(=> (or
(= 0 0)
(= 0 1)) (and
(! (or %lbl%@129119 (or
(= $seq0@0 0)
(= $seq0@0 (+ (select $PicSeq@@0 0) 1)))) :lblneg @129119)
(=> (or
(= $seq0@0 0)
(= $seq0@0 (+ (select $PicSeq@@0 0) 1))) (and
(! (or %lbl%@129138 (or
(and
(= $seq0@0 0)
(= 0 0)
(= call32057formal@$ret@0 17))
(and
(= $seq0@0 1)
(= 0 1)
(= 0 0)
(= call32057formal@$ret@0 112))
(and
(= $seq0@0 1)
(= 0 1)
(= 0 1)
(= call32057formal@$ret@0 120))
(and
(= $seq0@0 2)
(= 0 1)
(= 0 0)
(= call32057formal@$ret@0 4))
(and
(= $seq0@0 2)
(= 0 1)
(= 0 1)
(= call32057formal@$ret@0 2))
(and
(= $seq0@0 3)
(= 0 1)
(= call32057formal@$ret@0 1))
(and
(= $seq0@0 4)
(= 0 1)
(= 0 0)
(= call32057formal@$ret@0 254))
(and
(= $seq0@0 4)
(= 0 1)
(= 0 1)
(= call32057formal@$ret@0 255))
(and
(>= $seq0@0 5)
(= 0 0)
(= call32057formal@$ret@0 32)))) :lblneg @129138)
(=> (or
(and
(= $seq0@0 0)
(= 0 0)
(= call32057formal@$ret@0 17))
(and
(= $seq0@0 1)
(= 0 1)
(= 0 0)
(= call32057formal@$ret@0 112))
(and
(= $seq0@0 1)
(= 0 1)
(= 0 1)
(= call32057formal@$ret@0 120))
(and
(= $seq0@0 2)
(= 0 1)
(= 0 0)
(= call32057formal@$ret@0 4))
(and
(= $seq0@0 2)
(= 0 1)
(= 0 1)
(= call32057formal@$ret@0 2))
(and
(= $seq0@0 3)
(= 0 1)
(= call32057formal@$ret@0 1))
(and
(= $seq0@0 4)
(= 0 1)
(= 0 0)
(= call32057formal@$ret@0 254))
(and
(= $seq0@0 4)
(= 0 1)
(= 0 1)
(= call32057formal@$ret@0 255))
(and
(>= $seq0@0 5)
(= 0 0)
(= call32057formal@$ret@0 32))) (=> (= $PicSeq@0 (store $PicSeq@@0 0 $seq0@0)) (=> (and
(= call32067formal@$ret@0 32)
(= call32070formal@$ret@0 160)) (and
(! (or %lbl%@129443 (or
(and
(= 1 0)
(= call32070formal@$ret@0 (+ 32 0)))
(and
(= 1 1)
(= call32070formal@$ret@0 (+ 160 0))))) :lblneg @129443)
(=> (or
(and
(= 1 0)
(= call32070formal@$ret@0 (+ 32 0)))
(and
(= 1 1)
(= call32070formal@$ret@0 (+ 160 0)))) (and
(! (or %lbl%@129475 (or
(= 0 0)
(= 0 1))) :lblneg @129475)
(=> (or
(= 0 0)
(= 0 1)) (and
(! (or %lbl%@129487 (or
(= $seq1@0 0)
(= $seq1@0 (+ (select $PicSeq@0 1) 1)))) :lblneg @129487)
(=> (or
(= $seq1@0 0)
(= $seq1@0 (+ (select $PicSeq@0 1) 1))) (and
(! (or %lbl%@129505 (or
(and
(= $seq1@0 0)
(= 0 0)
(= call32067formal@$ret@0 17))
(and
(= $seq1@0 1)
(= 0 1)
(= 1 0)
(= call32067formal@$ret@0 112))
(and
(= $seq1@0 1)
(= 0 1)
(= 1 1)
(= call32067formal@$ret@0 120))
(and
(= $seq1@0 2)
(= 0 1)
(= 1 0)
(= call32067formal@$ret@0 4))
(and
(= $seq1@0 2)
(= 0 1)
(= 1 1)
(= call32067formal@$ret@0 2))
(and
(= $seq1@0 3)
(= 0 1)
(= call32067formal@$ret@0 1))
(and
(= $seq1@0 4)
(= 0 1)
(= 1 0)
(= call32067formal@$ret@0 254))
(and
(= $seq1@0 4)
(= 0 1)
(= 1 1)
(= call32067formal@$ret@0 255))
(and
(>= $seq1@0 5)
(= 0 0)
(= call32067formal@$ret@0 32)))) :lblneg @129505)
(=> (or
(and
(= $seq1@0 0)
(= 0 0)
(= call32067formal@$ret@0 17))
(and
(= $seq1@0 1)
(= 0 1)
(= 1 0)
(= call32067formal@$ret@0 112))
(and
(= $seq1@0 1)
(= 0 1)
(= 1 1)
(= call32067formal@$ret@0 120))
(and
(= $seq1@0 2)
(= 0 1)
(= 1 0)
(= call32067formal@$ret@0 4))
(and
(= $seq1@0 2)
(= 0 1)
(= 1 1)
(= call32067formal@$ret@0 2))
(and
(= $seq1@0 3)
(= 0 1)
(= call32067formal@$ret@0 1))
(and
(= $seq1@0 4)
(= 0 1)
(= 1 0)
(= call32067formal@$ret@0 254))
(and
(= $seq1@0 4)
(= 0 1)
(= 1 1)
(= call32067formal@$ret@0 255))
(and
(>= $seq1@0 5)
(= 0 0)
(= call32067formal@$ret@0 32))) (=> (and
(= $PicSeq@1 (store $PicSeq@0 1 $seq1@0))
(= call32077formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@129765 (= (ReturnToAddr (select $Mem@@3 esp)) call32077formal@$oldRA@0)) :lblneg @129765)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32077formal@$oldRA@0) (and
(! (or %lbl%@129776 (Aligned esp)) :lblneg @129776)
(=> (Aligned esp) (=> (and
(= esp@0@@11 (+ esp 4))
(Aligned esp@0@@11)) (and
(! (or %lbl%@129807 (= (select $PicSeq@1 0) (+ (select $PicSeq@@0 0) 1))) :lblneg @129807)
(=> (= (select $PicSeq@1 0) (+ (select $PicSeq@@0 0) 1)) (and
(! (or %lbl%@129823 (= (select $PicSeq@1 1) (+ (select $PicSeq@@0 1) 1))) :lblneg @129823)
(=> (= (select $PicSeq@1 1) (+ (select $PicSeq@@0 1) 1)) (and
(! (or %lbl%@129839 (= esp@0@@11 (+ esp 4))) :lblneg @129839)
(=> (= esp@0@@11 (+ esp 4)) true))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@22 (=> (! (and %lbl%+128737 true) :lblpos +128737) (=> (and
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
(declare-fun %lbl%+32158 () Bool)
(declare-fun call32123formal@$ret@0 () Int)
(declare-fun %lbl%@130017 () Bool)
(declare-fun call32127formal@$ret@0 () Int)
(declare-fun call32131formal@$ret@0 () Int)
(declare-fun call32134formal@$ret@0 () Int)
(declare-fun call32138formal@$ret@0 () Int)
(declare-fun call32142formal@$ret@0 () Int)
(declare-fun call32145formal@$ret@0 () Int)
(declare-fun %lbl%@130189 () Bool)
(declare-fun $id () Int)
(declare-fun $offset () Int)
(declare-fun %lbl%@130208 () Bool)
(declare-fun %lbl%@130213 () Bool)
(declare-fun %lbl%@130216 () Bool)
(declare-fun $PciConfigId@0 () Int)
(declare-fun $PciConfigOffset@0 () Int)
(declare-fun call32151formal@$ret@0 () Int)
(declare-fun %lbl%@130271 () Bool)
(declare-fun %lbl%@130276 () Bool)
(declare-fun %lbl%@130281 () Bool)
(declare-fun %lbl%+129848 () Bool)
(push 1)
(set-info :boogie-vc-id pciConfigAddr)
(assert (not
(let ((anon0_correct@@23 (=> (! (and %lbl%+32158 true) :lblpos +32158) (=> (= call32123formal@$ret@0 ecx) (and
(! (or %lbl%@130017 (< 8 32)) :lblneg @130017)
(=> (< 8 32) (=> (and
(= call32127formal@$ret@0 (shl call32123formal@$ret@0 8))
(word call32127formal@$ret@0)) (=> (and
(= call32131formal@$ret@0 (q@or call32127formal@$ret@0 edx))
(word call32131formal@$ret@0)
(= call32134formal@$ret@0 2147483647)
(word (+ call32134formal@$ret@0 1))
(= call32138formal@$ret@0 (+ call32134formal@$ret@0 1))
(= call32142formal@$ret@0 (q@or call32131formal@$ret@0 call32138formal@$ret@0))
(word call32142formal@$ret@0)
(= call32145formal@$ret@0 3320)) (and
(! (or %lbl%@130189 (= call32142formal@$ret@0 (q@or (q@or (shl $id 8) $offset) (+ 2147483647 1)))) :lblneg @130189)
(=> (= call32142formal@$ret@0 (q@or (q@or (shl $id 8) $offset) (+ 2147483647 1))) (and
(! (or %lbl%@130208 (= call32145formal@$ret@0 3320)) :lblneg @130208)
(=> (= call32145formal@$ret@0 3320) (and
(! (or %lbl%@130213 (IsValidPciId $id)) :lblneg @130213)
(=> (IsValidPciId $id) (and
(! (or %lbl%@130216 (IsValidPciOffset $offset)) :lblneg @130216)
(=> (IsValidPciOffset $offset) (=> (= $PciConfigId@0 $id) (=> (and
(= $PciConfigOffset@0 $offset)
(= call32151formal@$ret@0 3324)) (and
(! (or %lbl%@130271 (= $PciConfigId@0 $id)) :lblneg @130271)
(=> (= $PciConfigId@0 $id) (and
(! (or %lbl%@130276 (= $PciConfigOffset@0 $offset)) :lblneg @130276)
(=> (= $PciConfigOffset@0 $offset) (and
(! (or %lbl%@130281 (= call32151formal@$ret@0 3324)) :lblneg @130281)
(=> (= call32151formal@$ret@0 3324) true))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@23 (=> (! (and %lbl%+129848 true) :lblpos +129848) (=> (and
(IsValidPciId $id)
(IsValidPciOffset $offset)
(= ecx $id)
(= edx $offset)) anon0_correct@@23))))
PreconditionGeneratedEntry_correct@@23))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+32254 () Bool)
(declare-fun %lbl%+32266 () Bool)
(declare-fun %lbl%+32278 () Bool)
(declare-fun %lbl%+32281 () Bool)
(declare-fun edx@5 () Int)
(declare-fun %lbl%@131057 () Bool)
(declare-fun %lbl%@131060 () Bool)
(declare-fun %lbl%@131063 () Bool)
(declare-fun ecx@5 () Int)
(declare-fun %lbl%@131067 () Bool)
(declare-fun $PciConfigId@0@@0 () Int)
(declare-fun $PciConfigOffset@0@@0 () Int)
(declare-fun edx@6 () Int)
(declare-fun %lbl%@131123 () Bool)
(declare-fun %lbl%@131127 () Bool)
(declare-fun %lbl%@131131 () Bool)
(declare-fun %lbl%@131136 () Bool)
(declare-fun %lbl%@131139 () Bool)
(declare-fun PciConfigReadResult (Int Int Int) Bool)
(declare-fun eax@4 () Int)
(declare-fun call32242formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@131248 () Bool)
(declare-fun %lbl%@131259 () Bool)
(declare-fun esp@0@@12 () Int)
(declare-fun %lbl%@131290 () Bool)
(declare-fun %lbl%@131298 () Bool)
(declare-fun %lbl%+32276 () Bool)
(declare-fun $Efl@8@@0 () Int)
(declare-fun edx@3@@0 () Int)
(declare-fun ecx@3@@0 () Int)
(declare-fun %lbl%+32275 () Bool)
(declare-fun call32210formal@$ret@0 () Int)
(declare-fun call32214formal@$ret@0 () Int)
(declare-fun call32221formal@$x@0 () T@opn)
(declare-fun call32221formal@$y@0 () T@opn)
(declare-fun %lbl%@130921 () Bool)
(declare-fun %lbl%@130926 () Bool)
(declare-fun %lbl%+32264 () Bool)
(declare-fun $Efl@3 () Int)
(declare-fun edx@1@@1 () Int)
(declare-fun ecx@1@@3 () Int)
(declare-fun %lbl%+32263 () Bool)
(declare-fun call32197formal@$x@0 () T@opn)
(declare-fun call32197formal@$y@0 () T@opn)
(declare-fun %lbl%@130736 () Bool)
(declare-fun %lbl%@130741 () Bool)
(declare-fun %lbl%+32252 () Bool)
(declare-fun $Efl@0@@1 () Int)
(declare-fun %lbl%+32251 () Bool)
(declare-fun call32180formal@$x@0 () T@opn)
(declare-fun call32180formal@$y@0 () T@opn)
(declare-fun %lbl%@130600 () Bool)
(declare-fun %lbl%@130605 () Bool)
(declare-fun %lbl%+130287 () Bool)
(push 1)
(set-info :boogie-vc-id PciConfigRead32)
(assert (not
(let ((anon7_Else_correct (=> (! (and %lbl%+32254 true) :lblpos +32254) true)))
(let ((anon8_Else_correct@@0 (=> (! (and %lbl%+32266 true) :lblpos +32266) true)))
(let ((anon9_Else_correct@@1 (=> (! (and %lbl%+32278 true) :lblpos +32278) true)))
(let ((__L44_correct (=> (! (and %lbl%+32281 true) :lblpos +32281) (=> (=> (word edx@5) (= (= (q@and edx@5 3) 0) (Aligned edx@5))) (and
(! (or %lbl%@131057 (IsValidPciId ecx)) :lblneg @131057)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@131060 (IsValidPciOffset edx)) :lblneg @131060)
(=> (IsValidPciOffset edx) (and
(! (or %lbl%@131063 (= ecx@5 ecx)) :lblneg @131063)
(=> (= ecx@5 ecx) (and
(! (or %lbl%@131067 (= edx@5 edx)) :lblneg @131067)
(=> (= edx@5 edx) (=> (= $PciConfigId@0@@0 ecx) (=> (and
(= $PciConfigOffset@0@@0 edx)
(= edx@6 3324)) (and
(! (or %lbl%@131123 (= ecx $PciConfigId@0@@0)) :lblneg @131123)
(=> (= ecx $PciConfigId@0@@0) (and
(! (or %lbl%@131127 (= edx $PciConfigOffset@0@@0)) :lblneg @131127)
(=> (= edx $PciConfigOffset@0@@0) (and
(! (or %lbl%@131131 (= edx@6 3324)) :lblneg @131131)
(=> (= edx@6 3324) (and
(! (or %lbl%@131136 (IsValidPciId ecx)) :lblneg @131136)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@131139 (IsValidPciOffset edx)) :lblneg @131139)
(=> (IsValidPciOffset edx) (=> (PciConfigReadResult ecx edx eax@4) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= edx 16)
(= (q@and eax@4 15) 0)) (= (PciMemAddr ecx) eax@4))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= edx 16)) (= (PciMemSize ecx) (+ 1 (neg eax@4))))
(word eax@4)
(= call32242formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@131248 (= (ReturnToAddr (select $Mem@@3 esp)) call32242formal@$oldRA@0)) :lblneg @131248)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call32242formal@$oldRA@0) (and
(! (or %lbl%@131259 (Aligned esp)) :lblneg @131259)
(=> (Aligned esp) (=> (and
(= esp@0@@12 (+ esp 4))
(Aligned esp@0@@12)) (and
(! (or %lbl%@131290 (= esp@0@@12 (+ esp 4))) :lblneg @131290)
(=> (= esp@0@@12 (+ esp 4)) (and
(! (or %lbl%@131298 (PciConfigReadResult ecx edx eax@4)) :lblneg @131298)
(=> (PciConfigReadResult ecx edx eax@4) true)))))))))))))))))))))))))))))))))))
(let ((anon9_Then_correct@@1 (=> (! (and %lbl%+32276 true) :lblpos +32276) (=> (Je $Efl@8@@0) (=> (and
(= edx@5 edx@3@@0)
(= ecx@5 ecx@3@@0)) __L44_correct)))))
(let ((__L43_correct (=> (! (and %lbl%+32275 true) :lblpos +32275) (=> (= call32210formal@$ret@0 edx@3@@0) (=> (and
(= call32214formal@$ret@0 (q@and call32210formal@$ret@0 3))
(word call32214formal@$ret@0)
(= call32221formal@$x@0 (OpnReg call32214formal@$ret@0))
(= call32221formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@130921 (OpnOk $Mem@@3 call32221formal@$x@0)) :lblneg @130921)
(=> (OpnOk $Mem@@3 call32221formal@$x@0) (and
(! (or %lbl%@130926 (OpnOk $Mem@@3 call32221formal@$y@0)) :lblneg @130926)
(=> (OpnOk $Mem@@3 call32221formal@$y@0) (=> (FlagsCmp $Efl@8@@0 (EvalOpn $Mem@@3 call32221formal@$x@0) (EvalOpn $Mem@@3 call32221formal@$y@0)) (and
anon9_Then_correct@@1
anon9_Else_correct@@1)))))))))))
(let ((anon8_Then_correct@@0 (=> (! (and %lbl%+32264 true) :lblpos +32264) (=> (Jb $Efl@3) (=> (and
(= edx@3@@0 edx@1@@1)
(= ecx@3@@0 ecx@1@@3)) __L43_correct)))))
(let ((__L42_correct (=> (! (and %lbl%+32263 true) :lblpos +32263) (=> (and
(= call32197formal@$x@0 (OpnReg edx@1@@1))
(= call32197formal@$y@0 (OpnReg 256))) (and
(! (or %lbl%@130736 (OpnOk $Mem@@3 call32197formal@$x@0)) :lblneg @130736)
(=> (OpnOk $Mem@@3 call32197formal@$x@0) (and
(! (or %lbl%@130741 (OpnOk $Mem@@3 call32197formal@$y@0)) :lblneg @130741)
(=> (OpnOk $Mem@@3 call32197formal@$y@0) (=> (FlagsCmp $Efl@3 (EvalOpn $Mem@@3 call32197formal@$x@0) (EvalOpn $Mem@@3 call32197formal@$y@0)) (and
anon8_Then_correct@@0
anon8_Else_correct@@0))))))))))
(let ((anon7_Then_correct (=> (! (and %lbl%+32252 true) :lblpos +32252) (=> (Jb $Efl@0@@1) (=> (and
(= ecx@1@@3 ecx)
(= edx@1@@1 edx)) __L42_correct)))))
(let ((anon0_correct@@24 (=> (! (and %lbl%+32251 true) :lblpos +32251) (=> (and
(= call32180formal@$x@0 (OpnReg ecx))
(= call32180formal@$y@0 (OpnReg 65536))) (and
(! (or %lbl%@130600 (OpnOk $Mem@@3 call32180formal@$x@0)) :lblneg @130600)
(=> (OpnOk $Mem@@3 call32180formal@$x@0) (and
(! (or %lbl%@130605 (OpnOk $Mem@@3 call32180formal@$y@0)) :lblneg @130605)
(=> (OpnOk $Mem@@3 call32180formal@$y@0) (=> (FlagsCmp $Efl@0@@1 (EvalOpn $Mem@@3 call32180formal@$x@0) (EvalOpn $Mem@@3 call32180formal@$y@0)) (and
anon7_Then_correct
anon7_Else_correct))))))))))
(let ((PreconditionGeneratedEntry_correct@@24 (=> (! (and %lbl%+130287 true) :lblpos +130287) (=> (and
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
(declare-fun %lbl%+32915 () Bool)
(declare-fun %lbl%+32927 () Bool)
(declare-fun %lbl%+32939 () Bool)
(declare-fun %lbl%+32951 () Bool)
(declare-fun %lbl%+32963 () Bool)
(declare-fun %lbl%+32975 () Bool)
(declare-fun %lbl%+32987 () Bool)
(declare-fun %lbl%+32990 () Bool)
(declare-fun call32699formal@$ret@0 () Int)
(declare-fun %lbl%@136635 () Bool)
(declare-fun %lbl%@136638 () Bool)
(declare-fun %lbl%@136641 () Bool)
(declare-fun ecx@13 () Int)
(declare-fun %lbl%@136645 () Bool)
(declare-fun $PciConfigId@8 () Int)
(declare-fun $PciConfigOffset@8 () Int)
(declare-fun edx@11 () Int)
(declare-fun call32706formal@$ptr@0 () Int)
(declare-fun call32319formal@$ret@0 () Int)
(declare-fun %lbl%@136704 () Bool)
(declare-fun $Mem@5@@0 () (Array Int Int))
(declare-fun $sMem@5 () (Array Int Int))
(declare-fun %lbl%@136732 () Bool)
(declare-fun call32711formal@$ptr@0 () Int)
(declare-fun %lbl%@136756 () Bool)
(declare-fun call32711formal@$val@0 () Int)
(declare-fun %lbl%@136789 () Bool)
(declare-fun call32715formal@$ret@0 () Int)
(declare-fun call32718formal@$ret@0 () Int)
(declare-fun call32722formal@$ptr@0 () Int)
(declare-fun %lbl%@136849 () Bool)
(declare-fun %lbl%@136877 () Bool)
(declare-fun call32727formal@$ptr@0 () Int)
(declare-fun %lbl%@136901 () Bool)
(declare-fun call32727formal@$val@0 () Int)
(declare-fun call32731formal@$ret@0 () Int)
(declare-fun %lbl%@136971 () Bool)
(declare-fun %lbl%@136975 () Bool)
(declare-fun %lbl%@136979 () Bool)
(declare-fun %lbl%@136984 () Bool)
(declare-fun %lbl%@136987 () Bool)
(declare-fun %lbl%@136990 () Bool)
(declare-fun %lbl%@136999 () Bool)
(declare-fun eax@4@@0 () Int)
(declare-fun %lbl%@137005 () Bool)
(declare-fun eax@6 () Int)
(declare-fun %lbl%@137011 () Bool)
(declare-fun eax@8 () Int)
(declare-fun %lbl%@137017 () Bool)
(declare-fun eax@10 () Int)
(declare-fun %lbl%@137023 () Bool)
(declare-fun %lbl%@137030 () Bool)
(declare-fun %lbl%@137037 () Bool)
(declare-fun %lbl%@137067 () Bool)
(declare-fun %lbl%@137090 () Bool)
(declare-fun %lbl%@137114 () Bool)
(declare-fun %lbl%@137140 () Bool)
(declare-fun $PciConfigState@0 () (Array Int Int))
(declare-fun call32741formal@$ret@0 () Int)
(declare-fun %lbl%@137217 () Bool)
(declare-fun %lbl%@137220 () Bool)
(declare-fun %lbl%@137223 () Bool)
(declare-fun %lbl%@137227 () Bool)
(declare-fun $PciConfigId@10 () Int)
(declare-fun $PciConfigOffset@10 () Int)
(declare-fun edx@12 () Int)
(declare-fun call32748formal@$ptr@0 () Int)
(declare-fun %lbl%@137285 () Bool)
(declare-fun %lbl%@137313 () Bool)
(declare-fun call32753formal@$ptr@0 () Int)
(declare-fun %lbl%@137337 () Bool)
(declare-fun call32753formal@$val@0 () Int)
(declare-fun %lbl%@137378 () Bool)
(declare-fun %lbl%@137382 () Bool)
(declare-fun %lbl%@137386 () Bool)
(declare-fun %lbl%@137391 () Bool)
(declare-fun %lbl%@137394 () Bool)
(declare-fun %lbl%@137397 () Bool)
(declare-fun %lbl%@137406 () Bool)
(declare-fun %lbl%@137412 () Bool)
(declare-fun %lbl%@137418 () Bool)
(declare-fun %lbl%@137424 () Bool)
(declare-fun %lbl%@137430 () Bool)
(declare-fun %lbl%@137437 () Bool)
(declare-fun %lbl%@137444 () Bool)
(declare-fun %lbl%@137473 () Bool)
(declare-fun %lbl%@137495 () Bool)
(declare-fun %lbl%@137518 () Bool)
(declare-fun %lbl%@137543 () Bool)
(declare-fun $PciConfigState@1 () (Array Int Int))
(declare-fun call32763formal@$ret@0 () Int)
(declare-fun %lbl%@137618 () Bool)
(declare-fun %lbl%@137621 () Bool)
(declare-fun %lbl%@137624 () Bool)
(declare-fun %lbl%@137628 () Bool)
(declare-fun $PciConfigId@12 () Int)
(declare-fun $PciConfigOffset@12 () Int)
(declare-fun edx@13 () Int)
(declare-fun %lbl%@137680 () Bool)
(declare-fun %lbl%@137684 () Bool)
(declare-fun %lbl%@137688 () Bool)
(declare-fun %lbl%@137693 () Bool)
(declare-fun %lbl%@137696 () Bool)
(declare-fun eax@18 () Int)
(declare-fun call32778formal@$ptr@0 () Int)
(declare-fun %lbl%@137810 () Bool)
(declare-fun %lbl%@137838 () Bool)
(declare-fun $sMem@6 () (Array Int Int))
(declare-fun call32783formal@$ptr@0 () Int)
(declare-fun %lbl%@137899 () Bool)
(declare-fun %lbl%@137902 () Bool)
(declare-fun $Mem@6@@0 () (Array Int Int))
(declare-fun call32786formal@$ret@0 () Int)
(declare-fun %lbl%@137955 () Bool)
(declare-fun %lbl%@137958 () Bool)
(declare-fun %lbl%@137961 () Bool)
(declare-fun %lbl%@137965 () Bool)
(declare-fun $PciConfigId@14 () Int)
(declare-fun $PciConfigOffset@14 () Int)
(declare-fun edx@14 () Int)
(declare-fun call32793formal@$ptr@0 () Int)
(declare-fun %lbl%@138023 () Bool)
(declare-fun %lbl%@138051 () Bool)
(declare-fun call32798formal@$ptr@0 () Int)
(declare-fun %lbl%@138075 () Bool)
(declare-fun call32798formal@$val@0 () Int)
(declare-fun %lbl%@138116 () Bool)
(declare-fun %lbl%@138120 () Bool)
(declare-fun %lbl%@138124 () Bool)
(declare-fun %lbl%@138129 () Bool)
(declare-fun %lbl%@138132 () Bool)
(declare-fun %lbl%@138135 () Bool)
(declare-fun %lbl%@138144 () Bool)
(declare-fun %lbl%@138150 () Bool)
(declare-fun %lbl%@138156 () Bool)
(declare-fun %lbl%@138162 () Bool)
(declare-fun %lbl%@138168 () Bool)
(declare-fun %lbl%@138175 () Bool)
(declare-fun %lbl%@138182 () Bool)
(declare-fun %lbl%@138211 () Bool)
(declare-fun %lbl%@138233 () Bool)
(declare-fun %lbl%@138256 () Bool)
(declare-fun %lbl%@138281 () Bool)
(declare-fun $PciConfigState@2 () (Array Int Int))
(declare-fun call32808formal@$ret@0 () Int)
(declare-fun %lbl%@138356 () Bool)
(declare-fun %lbl%@138359 () Bool)
(declare-fun %lbl%@138362 () Bool)
(declare-fun %lbl%@138366 () Bool)
(declare-fun $PciConfigId@16 () Int)
(declare-fun $PciConfigOffset@16 () Int)
(declare-fun edx@15 () Int)
(declare-fun call32815formal@$ptr@0 () Int)
(declare-fun %lbl%@138424 () Bool)
(declare-fun %lbl%@138452 () Bool)
(declare-fun call32820formal@$ptr@0 () Int)
(declare-fun %lbl%@138476 () Bool)
(declare-fun call32820formal@$val@0 () Int)
(declare-fun call32824formal@$ret@0 () Int)
(declare-fun %lbl%@138547 () Bool)
(declare-fun %lbl%@138551 () Bool)
(declare-fun %lbl%@138555 () Bool)
(declare-fun %lbl%@138560 () Bool)
(declare-fun %lbl%@138563 () Bool)
(declare-fun %lbl%@138566 () Bool)
(declare-fun %lbl%@138575 () Bool)
(declare-fun %lbl%@138581 () Bool)
(declare-fun %lbl%@138587 () Bool)
(declare-fun %lbl%@138593 () Bool)
(declare-fun %lbl%@138599 () Bool)
(declare-fun %lbl%@138606 () Bool)
(declare-fun %lbl%@138613 () Bool)
(declare-fun %lbl%@138642 () Bool)
(declare-fun %lbl%@138664 () Bool)
(declare-fun %lbl%@138687 () Bool)
(declare-fun %lbl%@138712 () Bool)
(declare-fun $PciConfigState@3 () (Array Int Int))
(declare-fun call32835formal@$ptr@0 () Int)
(declare-fun %lbl%@138771 () Bool)
(declare-fun %lbl%@138799 () Bool)
(declare-fun call32840formal@$ptr@0 () Int)
(declare-fun %lbl%@138823 () Bool)
(declare-fun call32840formal@$val@0 () Int)
(declare-fun call32843formal@$ret@0 () Int)
(declare-fun call32847formal@$ret@0 () Int)
(declare-fun call32851formal@$ptr@0 () Int)
(declare-fun %lbl%@138921 () Bool)
(declare-fun %lbl%@138949 () Bool)
(declare-fun call32856formal@$ptr@0 () Int)
(declare-fun %lbl%@138973 () Bool)
(declare-fun call32856formal@$val@0 () Int)
(declare-fun call32860formal@$ptr@0 () Int)
(declare-fun %lbl%@139012 () Bool)
(declare-fun %lbl%@139040 () Bool)
(declare-fun call32865formal@$ptr@0 () Int)
(declare-fun %lbl%@139064 () Bool)
(declare-fun call32865formal@$val@0 () Int)
(declare-fun call32870formal@$ptr@0 () Int)
(declare-fun %lbl%@139105 () Bool)
(declare-fun %lbl%@139133 () Bool)
(declare-fun $pciMem@0 () (Array Int Int))
(declare-fun call32875formal@$ptr@0 () Int)
(declare-fun %lbl%@139194 () Bool)
(declare-fun %lbl%@139197 () Bool)
(declare-fun $Mem@7 () (Array Int Int))
(declare-fun call32880formal@$ptr@0 () Int)
(declare-fun %lbl%@139236 () Bool)
(declare-fun %lbl%@139263 () Bool)
(declare-fun $pciMem@1 () (Array Int Int))
(declare-fun call32885formal@$ptr@0 () Int)
(declare-fun %lbl%@139323 () Bool)
(declare-fun %lbl%@139326 () Bool)
(declare-fun $Mem@8 () (Array Int Int))
(declare-fun call32894formal@$oldPciConfigState@0 () (Array Int Int))
(declare-fun call32894formal@$oldPciMem@0 () (Array Int Int))
(declare-fun call32894formal@$oldMem@0 () (Array Int Int))
(declare-fun call32894formal@$oldSMem@0 () (Array Int Int))
(declare-fun %lbl%@139380 () Bool)
(declare-fun %lbl%@139456 () Bool)
(declare-fun %lbl%@139483 () Bool)
(declare-fun call32897formal@$ret@0 () Int)
(declare-fun call32311formal@$ret@0 () Int)
(declare-fun %lbl%@139593 () Bool)
(declare-fun %lbl%@139620 () Bool)
(declare-fun call32903formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@139648 () Bool)
(declare-fun %lbl%@139657 () Bool)
(declare-fun esp@0@@13 () Int)
(declare-fun %lbl%@139686 () Bool)
(declare-fun %lbl%@139694 () Bool)
(declare-fun %lbl%@139700 () Bool)
(declare-fun %lbl%+32985 () Bool)
(declare-fun $Efl@58 () Int)
(declare-fun ecx@11 () Int)
(declare-fun %lbl%+32984 () Bool)
(declare-fun call32670formal@$ptr@0 () Int)
(declare-fun %lbl%@136376 () Bool)
(declare-fun %lbl%@136404 () Bool)
(declare-fun call32675formal@$ptr@0 () Int)
(declare-fun %lbl%@136428 () Bool)
(declare-fun call32675formal@$val@0 () Int)
(declare-fun call32679formal@$ret@0 () Int)
(declare-fun call32686formal@$x@0 () T@opn)
(declare-fun call32686formal@$y@0 () T@opn)
(declare-fun %lbl%@136507 () Bool)
(declare-fun %lbl%@136511 () Bool)
(declare-fun %lbl%+32973 () Bool)
(declare-fun $Efl@53 () Int)
(declare-fun ecx@9 () Int)
(declare-fun %lbl%+32972 () Bool)
(declare-fun call32636formal@$ptr@0 () Int)
(declare-fun %lbl%@136100 () Bool)
(declare-fun %lbl%@136128 () Bool)
(declare-fun call32641formal@$ptr@0 () Int)
(declare-fun %lbl%@136152 () Bool)
(declare-fun call32641formal@$val@0 () Int)
(declare-fun %lbl%@136187 () Bool)
(declare-fun call32645formal@$ret@0 () Int)
(declare-fun call32649formal@$ret@0 () Int)
(declare-fun call32656formal@$x@0 () T@opn)
(declare-fun call32656formal@$y@0 () T@opn)
(declare-fun %lbl%@136266 () Bool)
(declare-fun %lbl%@136270 () Bool)
(declare-fun %lbl%+32961 () Bool)
(declare-fun $Efl@47 () Int)
(declare-fun ecx@7 () Int)
(declare-fun %lbl%+32960 () Bool)
(declare-fun call32606formal@$ptr@0 () Int)
(declare-fun %lbl%@135859 () Bool)
(declare-fun %lbl%@135887 () Bool)
(declare-fun call32611formal@$ptr@0 () Int)
(declare-fun %lbl%@135911 () Bool)
(declare-fun call32611formal@$val@0 () Int)
(declare-fun call32615formal@$ret@0 () Int)
(declare-fun call32622formal@$x@0 () T@opn)
(declare-fun call32622formal@$y@0 () T@opn)
(declare-fun %lbl%@135990 () Bool)
(declare-fun %lbl%@135994 () Bool)
(declare-fun %lbl%+32949 () Bool)
(declare-fun $Efl@42 () Int)
(declare-fun ecx@5@@0 () Int)
(declare-fun %lbl%+32948 () Bool)
(declare-fun %lbl%@134348 () Bool)
(declare-fun call32496formal@$ret@0 () Int)
(declare-fun %lbl%@134399 () Bool)
(declare-fun %lbl%@134402 () Bool)
(declare-fun %lbl%@134405 () Bool)
(declare-fun %lbl%@134409 () Bool)
(declare-fun $PciConfigId@0@@1 () Int)
(declare-fun $PciConfigOffset@0@@1 () Int)
(declare-fun edx@3@@1 () Int)
(declare-fun %lbl%@134464 () Bool)
(declare-fun %lbl%@134468 () Bool)
(declare-fun %lbl%@134472 () Bool)
(declare-fun %lbl%@134477 () Bool)
(declare-fun %lbl%@134480 () Bool)
(declare-fun call32511formal@$ptr@0 () Int)
(declare-fun %lbl%@134596 () Bool)
(declare-fun $Mem@1@@4 () (Array Int Int))
(declare-fun $sMem@1@@2 () (Array Int Int))
(declare-fun %lbl%@134624 () Bool)
(declare-fun $sMem@2@@2 () (Array Int Int))
(declare-fun call32516formal@$ptr@0 () Int)
(declare-fun %lbl%@134685 () Bool)
(declare-fun %lbl%@134688 () Bool)
(declare-fun $Mem@2@@3 () (Array Int Int))
(declare-fun call32519formal@$ret@0 () Int)
(declare-fun %lbl%@134741 () Bool)
(declare-fun %lbl%@134744 () Bool)
(declare-fun %lbl%@134747 () Bool)
(declare-fun %lbl%@134751 () Bool)
(declare-fun $PciConfigId@2 () Int)
(declare-fun $PciConfigOffset@2 () Int)
(declare-fun edx@4 () Int)
(declare-fun %lbl%@134803 () Bool)
(declare-fun %lbl%@134807 () Bool)
(declare-fun %lbl%@134811 () Bool)
(declare-fun %lbl%@134816 () Bool)
(declare-fun %lbl%@134819 () Bool)
(declare-fun call32534formal@$ptr@0 () Int)
(declare-fun %lbl%@134935 () Bool)
(declare-fun %lbl%@134963 () Bool)
(declare-fun $sMem@3@@1 () (Array Int Int))
(declare-fun call32539formal@$ptr@0 () Int)
(declare-fun %lbl%@135024 () Bool)
(declare-fun %lbl%@135027 () Bool)
(declare-fun $Mem@3@@2 () (Array Int Int))
(declare-fun call32542formal@$ret@0 () Int)
(declare-fun %lbl%@135080 () Bool)
(declare-fun %lbl%@135083 () Bool)
(declare-fun %lbl%@135086 () Bool)
(declare-fun %lbl%@135090 () Bool)
(declare-fun $PciConfigId@4 () Int)
(declare-fun $PciConfigOffset@4 () Int)
(declare-fun edx@5@@0 () Int)
(declare-fun %lbl%@135142 () Bool)
(declare-fun %lbl%@135146 () Bool)
(declare-fun %lbl%@135150 () Bool)
(declare-fun %lbl%@135155 () Bool)
(declare-fun %lbl%@135158 () Bool)
(declare-fun call32557formal@$ptr@0 () Int)
(declare-fun %lbl%@135274 () Bool)
(declare-fun %lbl%@135302 () Bool)
(declare-fun $sMem@4@@1 () (Array Int Int))
(declare-fun call32562formal@$ptr@0 () Int)
(declare-fun %lbl%@135363 () Bool)
(declare-fun %lbl%@135366 () Bool)
(declare-fun $Mem@4@@2 () (Array Int Int))
(declare-fun call32565formal@$ret@0 () Int)
(declare-fun %lbl%@135419 () Bool)
(declare-fun %lbl%@135422 () Bool)
(declare-fun %lbl%@135425 () Bool)
(declare-fun %lbl%@135429 () Bool)
(declare-fun $PciConfigId@6 () Int)
(declare-fun $PciConfigOffset@6 () Int)
(declare-fun edx@6@@0 () Int)
(declare-fun %lbl%@135481 () Bool)
(declare-fun %lbl%@135485 () Bool)
(declare-fun %lbl%@135489 () Bool)
(declare-fun %lbl%@135494 () Bool)
(declare-fun %lbl%@135497 () Bool)
(declare-fun call32580formal@$ptr@0 () Int)
(declare-fun %lbl%@135613 () Bool)
(declare-fun %lbl%@135641 () Bool)
(declare-fun call32585formal@$ptr@0 () Int)
(declare-fun %lbl%@135702 () Bool)
(declare-fun %lbl%@135705 () Bool)
(declare-fun call32592formal@$x@0 () T@opn)
(declare-fun call32592formal@$y@0 () T@opn)
(declare-fun %lbl%@135750 () Bool)
(declare-fun %lbl%@135754 () Bool)
(declare-fun %lbl%+32937 () Bool)
(declare-fun $Efl@23 () Int)
(declare-fun ecx@3@@1 () Int)
(declare-fun %lbl%+32936 () Bool)
(declare-fun call32397formal@$ret@0 () Int)
(declare-fun %lbl%@133777 () Bool)
(declare-fun call32401formal@$ret@0 () Int)
(declare-fun %lbl%@133809 () Bool)
(declare-fun call32405formal@$ret@0 () Int)
(declare-fun %lbl%@133841 () Bool)
(declare-fun call32409formal@$ret@0 () Int)
(declare-fun %lbl%@133874 () Bool)
(declare-fun call32413formal@$ret@0 () Int)
(declare-fun call32422formal@$ptr@0 () Int)
(declare-fun %lbl%@133917 () Bool)
(declare-fun $Mem@0@@6 () (Array Int Int))
(declare-fun $sMem@0@@3 () (Array Int Int))
(declare-fun %lbl%@133945 () Bool)
(declare-fun call32427formal@$ptr@0 () Int)
(declare-fun %lbl%@134006 () Bool)
(declare-fun %lbl%@134009 () Bool)
(declare-fun %lbl%@134035 () Bool)
(declare-fun call32449formal@$ptr@0 () Int)
(declare-fun %lbl%@134072 () Bool)
(declare-fun %lbl%@134100 () Bool)
(declare-fun call32454formal@$ptr@0 () Int)
(declare-fun %lbl%@134124 () Bool)
(declare-fun call32454formal@$val@0 () Int)
(declare-fun %lbl%@134154 () Bool)
(declare-fun %lbl%@134182 () Bool)
(declare-fun %lbl%@134198 () Bool)
(declare-fun call32459formal@$val@0 () Int)
(declare-fun call32466formal@$x@0 () T@opn)
(declare-fun call32466formal@$y@0 () T@opn)
(declare-fun %lbl%@134245 () Bool)
(declare-fun %lbl%@134249 () Bool)
(declare-fun %lbl%+32925 () Bool)
(declare-fun $Efl@12@@2 () Int)
(declare-fun ecx@1@@4 () Int)
(declare-fun %lbl%+32924 () Bool)
(declare-fun call32373formal@$ret@0 () Int)
(declare-fun call32377formal@$ret@0 () Int)
(declare-fun call32384formal@$x@0 () T@opn)
(declare-fun call32384formal@$y@0 () T@opn)
(declare-fun %lbl%@133651 () Bool)
(declare-fun %lbl%@133655 () Bool)
(declare-fun %lbl%+32913 () Bool)
(declare-fun $Efl@7@@0 () Int)
(declare-fun %lbl%+32912 () Bool)
(declare-fun %lbl%@132805 () Bool)
(declare-fun %lbl%@132808 () Bool)
(declare-fun call32314formal@$ret@0 () Int)
(declare-fun %lbl%@133029 () Bool)
(declare-fun %lbl%@133173 () Bool)
(declare-fun call32326formal@$ret@0 () Int)
(declare-fun %lbl%@133231 () Bool)
(declare-fun call32330formal@$ret@0 () Int)
(declare-fun %lbl%@133264 () Bool)
(declare-fun call32334formal@$ret@0 () Int)
(declare-fun call32343formal@$ptr@0 () Int)
(declare-fun %lbl%@133307 () Bool)
(declare-fun %lbl%@133337 () Bool)
(declare-fun call32348formal@$ptr@0 () Int)
(declare-fun %lbl%@133400 () Bool)
(declare-fun %lbl%@133403 () Bool)
(declare-fun %lbl%@133455 () Bool)
(declare-fun call32360formal@$x@0 () T@opn)
(declare-fun call32360formal@$y@0 () T@opn)
(declare-fun %lbl%@133478 () Bool)
(declare-fun %lbl%@133482 () Bool)
(declare-fun %lbl%+131307 () Bool)
(push 1)
(set-info :boogie-vc-id PciMemSetup)
(assert (not
(let ((anon15_Else_correct@@0 (=> (! (and %lbl%+32915 true) :lblpos +32915) true)))
(let ((anon16_Else_correct (=> (! (and %lbl%+32927 true) :lblpos +32927) true)))
(let ((anon17_Else_correct (=> (! (and %lbl%+32939 true) :lblpos +32939) true)))
(let ((anon18_Else_correct (=> (! (and %lbl%+32951 true) :lblpos +32951) true)))
(let ((anon19_Else_correct (=> (! (and %lbl%+32963 true) :lblpos +32963) true)))
(let ((anon20_Else_correct (=> (! (and %lbl%+32975 true) :lblpos +32975) true)))
(let ((anon21_Else_correct (=> (! (and %lbl%+32987 true) :lblpos +32987) true)))
(let ((__L51_correct (=> (! (and %lbl%+32990 true) :lblpos +32990) (=> (= call32699formal@$ret@0 4) (and
(! (or %lbl%@136635 (IsValidPciId ecx)) :lblneg @136635)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@136638 (IsValidPciOffset 4)) :lblneg @136638)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@136641 (= ecx@13 ecx)) :lblneg @136641)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@136645 (= call32699formal@$ret@0 4)) :lblneg @136645)
(=> (= call32699formal@$ret@0 4) (=> (and
(= $PciConfigId@8 ecx)
(= $PciConfigOffset@8 4)
(= edx@11 3324)
(= call32706formal@$ptr@0 (+ call32319formal@$ret@0 0))) (and
(! (or %lbl%@136704 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @136704)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@136732 (sAddr call32706formal@$ptr@0)) :lblneg @136732)
(=> (sAddr call32706formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32706formal@$ptr@0) (select $sMem@5 call32706formal@$ptr@0))
(= call32711formal@$ptr@0 (+ call32319formal@$ret@0 0))) (and
(! (or %lbl%@136756 (PtrOk call32711formal@$ptr@0)) :lblneg @136756)
(=> (PtrOk call32711formal@$ptr@0) (=> (and
(word call32711formal@$val@0)
(= call32711formal@$val@0 (select $Mem@5@@0 call32711formal@$ptr@0))) (and
(! (or %lbl%@136789 (word (- call32711formal@$val@0 2))) :lblneg @136789)
(=> (word (- call32711formal@$val@0 2)) (=> (= call32715formal@$ret@0 (- call32711formal@$val@0 2)) (=> (and
(= call32718formal@$ret@0 call32715formal@$ret@0)
(= call32722formal@$ptr@0 (+ call32319formal@$ret@0 12))) (and
(! (or %lbl%@136849 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @136849)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@136877 (sAddr call32722formal@$ptr@0)) :lblneg @136877)
(=> (sAddr call32722formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32722formal@$ptr@0) (select $sMem@5 call32722formal@$ptr@0))
(= call32727formal@$ptr@0 (+ call32319formal@$ret@0 12))) (and
(! (or %lbl%@136901 (PtrOk call32727formal@$ptr@0)) :lblneg @136901)
(=> (PtrOk call32727formal@$ptr@0) (=> (and
(word call32727formal@$val@0)
(= call32727formal@$val@0 (select $Mem@5@@0 call32727formal@$ptr@0))
(= call32731formal@$ret@0 (q@and call32727formal@$val@0 call32718formal@$ret@0))
(word call32731formal@$ret@0)) (and
(! (or %lbl%@136971 (= ecx $PciConfigId@8)) :lblneg @136971)
(=> (= ecx $PciConfigId@8) (and
(! (or %lbl%@136975 (= 4 $PciConfigOffset@8)) :lblneg @136975)
(=> (= 4 $PciConfigOffset@8) (and
(! (or %lbl%@136979 (= edx@11 3324)) :lblneg @136979)
(=> (= edx@11 3324) (and
(! (or %lbl%@136984 (IsValidPciId ecx)) :lblneg @136984)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@136987 (IsValidPciOffset 4)) :lblneg @136987)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@136990 (= (q@and ecx 7) 0)) :lblneg @136990)
(=> (= (q@and ecx 7) 0) (and
(! (or %lbl%@136999 (PciConfigReadResult ecx 0 eax@4@@0)) :lblneg @136999)
(=> (PciConfigReadResult ecx 0 eax@4@@0) (and
(! (or %lbl%@137005 (PciConfigReadResult ecx 4 eax@6)) :lblneg @137005)
(=> (PciConfigReadResult ecx 4 eax@6) (and
(! (or %lbl%@137011 (PciConfigReadResult ecx 12 eax@8)) :lblneg @137011)
(=> (PciConfigReadResult ecx 12 eax@8) (and
(! (or %lbl%@137017 (PciConfigReadResult ecx 16 eax@10)) :lblneg @137017)
(=> (PciConfigReadResult ecx 16 eax@10) (and
(! (or %lbl%@137023 (not (= (PciVendorId eax@4@@0) 65535))) :lblneg @137023)
(=> (not (= (PciVendorId eax@4@@0) 65535)) (and
(! (or %lbl%@137030 (= (PciHeaderType eax@8) 0)) :lblneg @137030)
(=> (= (PciHeaderType eax@8) 0) (and
(! (or %lbl%@137037 (=> (= (select $PciConfigState@@0 ecx) 0) (and
(= 4 4)
(= call32731formal@$ret@0 (q@and eax@6 (- ?FFFFFFFF 2)))))) :lblneg @137037)
(=> (=> (= (select $PciConfigState@@0 ecx) 0) (and
(= 4 4)
(= call32731formal@$ret@0 (q@and eax@6 (- ?FFFFFFFF 2))))) (and
(! (or %lbl%@137067 (=> (= (select $PciConfigState@@0 ecx) 1) (and
(= 4 16)
(= call32731formal@$ret@0 ?FFFFFFFF)))) :lblneg @137067)
(=> (=> (= (select $PciConfigState@@0 ecx) 1) (and
(= 4 16)
(= call32731formal@$ret@0 ?FFFFFFFF))) (and
(! (or %lbl%@137090 (=> (= (select $PciConfigState@@0 ecx) 2) (and
(= 4 16)
(= call32731formal@$ret@0 (PciMemAddr ecx))))) :lblneg @137090)
(=> (=> (= (select $PciConfigState@@0 ecx) 2) (and
(= 4 16)
(= call32731formal@$ret@0 (PciMemAddr ecx)))) (and
(! (or %lbl%@137114 (=> (= (select $PciConfigState@@0 ecx) 3) (and
(= 4 4)
(= call32731formal@$ret@0 (q@or eax@6 2))))) :lblneg @137114)
(=> (=> (= (select $PciConfigState@@0 ecx) 3) (and
(= 4 4)
(= call32731formal@$ret@0 (q@or eax@6 2)))) (and
(! (or %lbl%@137140 (not (= (select $PciConfigState@@0 ecx) 4))) :lblneg @137140)
(=> (not (= (select $PciConfigState@@0 ecx) 4)) (=> (and
(= $PciConfigState@0 (store $PciConfigState@@0 ecx (+ 1 (select $PciConfigState@@0 ecx))))
(= call32741formal@$ret@0 16)) (and
(! (or %lbl%@137217 (IsValidPciId ecx)) :lblneg @137217)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137220 (IsValidPciOffset 16)) :lblneg @137220)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@137223 (= ecx@13 ecx)) :lblneg @137223)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@137227 (= call32741formal@$ret@0 16)) :lblneg @137227)
(=> (= call32741formal@$ret@0 16) (=> (and
(= $PciConfigId@10 ecx)
(= $PciConfigOffset@10 16)
(= edx@12 3324)
(= call32748formal@$ptr@0 (+ call32319formal@$ret@0 0))) (and
(! (or %lbl%@137285 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @137285)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@137313 (sAddr call32748formal@$ptr@0)) :lblneg @137313)
(=> (sAddr call32748formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32748formal@$ptr@0) (select $sMem@5 call32748formal@$ptr@0))
(= call32753formal@$ptr@0 (+ call32319formal@$ret@0 0))) (and
(! (or %lbl%@137337 (PtrOk call32753formal@$ptr@0)) :lblneg @137337)
(=> (PtrOk call32753formal@$ptr@0) (=> (and
(word call32753formal@$val@0)
(= call32753formal@$val@0 (select $Mem@5@@0 call32753formal@$ptr@0))) (and
(! (or %lbl%@137378 (= ecx $PciConfigId@10)) :lblneg @137378)
(=> (= ecx $PciConfigId@10) (and
(! (or %lbl%@137382 (= 16 $PciConfigOffset@10)) :lblneg @137382)
(=> (= 16 $PciConfigOffset@10) (and
(! (or %lbl%@137386 (= edx@12 3324)) :lblneg @137386)
(=> (= edx@12 3324) (and
(! (or %lbl%@137391 (IsValidPciId ecx)) :lblneg @137391)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137394 (IsValidPciOffset 16)) :lblneg @137394)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@137397 (= (q@and ecx 7) 0)) :lblneg @137397)
(=> (= (q@and ecx 7) 0) (and
(! (or %lbl%@137406 (PciConfigReadResult ecx 0 eax@4@@0)) :lblneg @137406)
(=> (PciConfigReadResult ecx 0 eax@4@@0) (and
(! (or %lbl%@137412 (PciConfigReadResult ecx 4 eax@6)) :lblneg @137412)
(=> (PciConfigReadResult ecx 4 eax@6) (and
(! (or %lbl%@137418 (PciConfigReadResult ecx 12 eax@8)) :lblneg @137418)
(=> (PciConfigReadResult ecx 12 eax@8) (and
(! (or %lbl%@137424 (PciConfigReadResult ecx 16 eax@10)) :lblneg @137424)
(=> (PciConfigReadResult ecx 16 eax@10) (and
(! (or %lbl%@137430 (not (= (PciVendorId eax@4@@0) 65535))) :lblneg @137430)
(=> (not (= (PciVendorId eax@4@@0) 65535)) (and
(! (or %lbl%@137437 (= (PciHeaderType eax@8) 0)) :lblneg @137437)
(=> (= (PciHeaderType eax@8) 0) (and
(! (or %lbl%@137444 (=> (= (select $PciConfigState@0 ecx) 0) (and
(= 16 4)
(= call32753formal@$val@0 (q@and eax@6 (- ?FFFFFFFF 2)))))) :lblneg @137444)
(=> (=> (= (select $PciConfigState@0 ecx) 0) (and
(= 16 4)
(= call32753formal@$val@0 (q@and eax@6 (- ?FFFFFFFF 2))))) (and
(! (or %lbl%@137473 (=> (= (select $PciConfigState@0 ecx) 1) (and
(= 16 16)
(= call32753formal@$val@0 ?FFFFFFFF)))) :lblneg @137473)
(=> (=> (= (select $PciConfigState@0 ecx) 1) (and
(= 16 16)
(= call32753formal@$val@0 ?FFFFFFFF))) (and
(! (or %lbl%@137495 (=> (= (select $PciConfigState@0 ecx) 2) (and
(= 16 16)
(= call32753formal@$val@0 (PciMemAddr ecx))))) :lblneg @137495)
(=> (=> (= (select $PciConfigState@0 ecx) 2) (and
(= 16 16)
(= call32753formal@$val@0 (PciMemAddr ecx)))) (and
(! (or %lbl%@137518 (=> (= (select $PciConfigState@0 ecx) 3) (and
(= 16 4)
(= call32753formal@$val@0 (q@or eax@6 2))))) :lblneg @137518)
(=> (=> (= (select $PciConfigState@0 ecx) 3) (and
(= 16 4)
(= call32753formal@$val@0 (q@or eax@6 2)))) (and
(! (or %lbl%@137543 (not (= (select $PciConfigState@0 ecx) 4))) :lblneg @137543)
(=> (not (= (select $PciConfigState@0 ecx) 4)) (=> (and
(= $PciConfigState@1 (store $PciConfigState@0 ecx (+ 1 (select $PciConfigState@0 ecx))))
(= call32763formal@$ret@0 16)) (and
(! (or %lbl%@137618 (IsValidPciId ecx)) :lblneg @137618)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137621 (IsValidPciOffset 16)) :lblneg @137621)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@137624 (= ecx@13 ecx)) :lblneg @137624)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@137628 (= call32763formal@$ret@0 16)) :lblneg @137628)
(=> (= call32763formal@$ret@0 16) (=> (= $PciConfigId@12 ecx) (=> (and
(= $PciConfigOffset@12 16)
(= edx@13 3324)) (and
(! (or %lbl%@137680 (= ecx $PciConfigId@12)) :lblneg @137680)
(=> (= ecx $PciConfigId@12) (and
(! (or %lbl%@137684 (= 16 $PciConfigOffset@12)) :lblneg @137684)
(=> (= 16 $PciConfigOffset@12) (and
(! (or %lbl%@137688 (= edx@13 3324)) :lblneg @137688)
(=> (= edx@13 3324) (and
(! (or %lbl%@137693 (IsValidPciId ecx)) :lblneg @137693)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137696 (IsValidPciOffset 16)) :lblneg @137696)
(=> (IsValidPciOffset 16) (=> (PciConfigReadResult ecx 16 eax@18) (=> (and
(=> (and
(= (select $PciConfigState@1 ecx) 0)
(= 16 16)
(= (q@and eax@18 15) 0)) (= (PciMemAddr ecx) eax@18))
(=> (and
(= (select $PciConfigState@1 ecx) 2)
(= 16 16)) (= (PciMemSize ecx) (+ 1 (neg eax@18))))
(word eax@18)
(= call32778formal@$ptr@0 (+ call32319formal@$ret@0 24))) (and
(! (or %lbl%@137810 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @137810)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@137838 (sAddr call32778formal@$ptr@0)) :lblneg @137838)
(=> (sAddr call32778formal@$ptr@0) (=> (MemInv (store $Mem@5@@0 call32778formal@$ptr@0 eax@18) $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@6 (store $sMem@5 call32778formal@$ptr@0 eax@18))
(= call32783formal@$ptr@0 (+ call32319formal@$ret@0 24))) (and
(! (or %lbl%@137899 (PtrOk call32783formal@$ptr@0)) :lblneg @137899)
(=> (PtrOk call32783formal@$ptr@0) (and
(! (or %lbl%@137902 (word eax@18)) :lblneg @137902)
(=> (word eax@18) (=> (and
(= $Mem@6@@0 (store $Mem@5@@0 call32783formal@$ptr@0 eax@18))
(= call32786formal@$ret@0 16)) (and
(! (or %lbl%@137955 (IsValidPciId ecx)) :lblneg @137955)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@137958 (IsValidPciOffset 16)) :lblneg @137958)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@137961 (= ecx@13 ecx)) :lblneg @137961)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@137965 (= call32786formal@$ret@0 16)) :lblneg @137965)
(=> (= call32786formal@$ret@0 16) (=> (and
(= $PciConfigId@14 ecx)
(= $PciConfigOffset@14 16)
(= edx@14 3324)
(= call32793formal@$ptr@0 (+ call32319formal@$ret@0 20))) (and
(! (or %lbl%@138023 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @138023)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@138051 (sAddr call32793formal@$ptr@0)) :lblneg @138051)
(=> (sAddr call32793formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32793formal@$ptr@0) (select $sMem@6 call32793formal@$ptr@0))
(= call32798formal@$ptr@0 (+ call32319formal@$ret@0 20))) (and
(! (or %lbl%@138075 (PtrOk call32798formal@$ptr@0)) :lblneg @138075)
(=> (PtrOk call32798formal@$ptr@0) (=> (and
(word call32798formal@$val@0)
(= call32798formal@$val@0 (select $Mem@6@@0 call32798formal@$ptr@0))) (and
(! (or %lbl%@138116 (= ecx $PciConfigId@14)) :lblneg @138116)
(=> (= ecx $PciConfigId@14) (and
(! (or %lbl%@138120 (= 16 $PciConfigOffset@14)) :lblneg @138120)
(=> (= 16 $PciConfigOffset@14) (and
(! (or %lbl%@138124 (= edx@14 3324)) :lblneg @138124)
(=> (= edx@14 3324) (and
(! (or %lbl%@138129 (IsValidPciId ecx)) :lblneg @138129)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@138132 (IsValidPciOffset 16)) :lblneg @138132)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@138135 (= (q@and ecx 7) 0)) :lblneg @138135)
(=> (= (q@and ecx 7) 0) (and
(! (or %lbl%@138144 (PciConfigReadResult ecx 0 eax@4@@0)) :lblneg @138144)
(=> (PciConfigReadResult ecx 0 eax@4@@0) (and
(! (or %lbl%@138150 (PciConfigReadResult ecx 4 eax@6)) :lblneg @138150)
(=> (PciConfigReadResult ecx 4 eax@6) (and
(! (or %lbl%@138156 (PciConfigReadResult ecx 12 eax@8)) :lblneg @138156)
(=> (PciConfigReadResult ecx 12 eax@8) (and
(! (or %lbl%@138162 (PciConfigReadResult ecx 16 eax@10)) :lblneg @138162)
(=> (PciConfigReadResult ecx 16 eax@10) (and
(! (or %lbl%@138168 (not (= (PciVendorId eax@4@@0) 65535))) :lblneg @138168)
(=> (not (= (PciVendorId eax@4@@0) 65535)) (and
(! (or %lbl%@138175 (= (PciHeaderType eax@8) 0)) :lblneg @138175)
(=> (= (PciHeaderType eax@8) 0) (and
(! (or %lbl%@138182 (=> (= (select $PciConfigState@1 ecx) 0) (and
(= 16 4)
(= call32798formal@$val@0 (q@and eax@6 (- ?FFFFFFFF 2)))))) :lblneg @138182)
(=> (=> (= (select $PciConfigState@1 ecx) 0) (and
(= 16 4)
(= call32798formal@$val@0 (q@and eax@6 (- ?FFFFFFFF 2))))) (and
(! (or %lbl%@138211 (=> (= (select $PciConfigState@1 ecx) 1) (and
(= 16 16)
(= call32798formal@$val@0 ?FFFFFFFF)))) :lblneg @138211)
(=> (=> (= (select $PciConfigState@1 ecx) 1) (and
(= 16 16)
(= call32798formal@$val@0 ?FFFFFFFF))) (and
(! (or %lbl%@138233 (=> (= (select $PciConfigState@1 ecx) 2) (and
(= 16 16)
(= call32798formal@$val@0 (PciMemAddr ecx))))) :lblneg @138233)
(=> (=> (= (select $PciConfigState@1 ecx) 2) (and
(= 16 16)
(= call32798formal@$val@0 (PciMemAddr ecx)))) (and
(! (or %lbl%@138256 (=> (= (select $PciConfigState@1 ecx) 3) (and
(= 16 4)
(= call32798formal@$val@0 (q@or eax@6 2))))) :lblneg @138256)
(=> (=> (= (select $PciConfigState@1 ecx) 3) (and
(= 16 4)
(= call32798formal@$val@0 (q@or eax@6 2)))) (and
(! (or %lbl%@138281 (not (= (select $PciConfigState@1 ecx) 4))) :lblneg @138281)
(=> (not (= (select $PciConfigState@1 ecx) 4)) (=> (and
(= $PciConfigState@2 (store $PciConfigState@1 ecx (+ 1 (select $PciConfigState@1 ecx))))
(= call32808formal@$ret@0 4)) (and
(! (or %lbl%@138356 (IsValidPciId ecx)) :lblneg @138356)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@138359 (IsValidPciOffset 4)) :lblneg @138359)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@138362 (= ecx@13 ecx)) :lblneg @138362)
(=> (= ecx@13 ecx) (and
(! (or %lbl%@138366 (= call32808formal@$ret@0 4)) :lblneg @138366)
(=> (= call32808formal@$ret@0 4) (=> (and
(= $PciConfigId@16 ecx)
(= $PciConfigOffset@16 4)
(= edx@15 3324)
(= call32815formal@$ptr@0 (+ call32319formal@$ret@0 12))) (and
(! (or %lbl%@138424 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @138424)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@138452 (sAddr call32815formal@$ptr@0)) :lblneg @138452)
(=> (sAddr call32815formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32815formal@$ptr@0) (select $sMem@6 call32815formal@$ptr@0))
(= call32820formal@$ptr@0 (+ call32319formal@$ret@0 12))) (and
(! (or %lbl%@138476 (PtrOk call32820formal@$ptr@0)) :lblneg @138476)
(=> (PtrOk call32820formal@$ptr@0) (=> (and
(word call32820formal@$val@0)
(= call32820formal@$val@0 (select $Mem@6@@0 call32820formal@$ptr@0))
(= call32824formal@$ret@0 (q@or call32820formal@$val@0 2))
(word call32824formal@$ret@0)) (and
(! (or %lbl%@138547 (= ecx $PciConfigId@16)) :lblneg @138547)
(=> (= ecx $PciConfigId@16) (and
(! (or %lbl%@138551 (= 4 $PciConfigOffset@16)) :lblneg @138551)
(=> (= 4 $PciConfigOffset@16) (and
(! (or %lbl%@138555 (= edx@15 3324)) :lblneg @138555)
(=> (= edx@15 3324) (and
(! (or %lbl%@138560 (IsValidPciId ecx)) :lblneg @138560)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@138563 (IsValidPciOffset 4)) :lblneg @138563)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@138566 (= (q@and ecx 7) 0)) :lblneg @138566)
(=> (= (q@and ecx 7) 0) (and
(! (or %lbl%@138575 (PciConfigReadResult ecx 0 eax@4@@0)) :lblneg @138575)
(=> (PciConfigReadResult ecx 0 eax@4@@0) (and
(! (or %lbl%@138581 (PciConfigReadResult ecx 4 eax@6)) :lblneg @138581)
(=> (PciConfigReadResult ecx 4 eax@6) (and
(! (or %lbl%@138587 (PciConfigReadResult ecx 12 eax@8)) :lblneg @138587)
(=> (PciConfigReadResult ecx 12 eax@8) (and
(! (or %lbl%@138593 (PciConfigReadResult ecx 16 eax@10)) :lblneg @138593)
(=> (PciConfigReadResult ecx 16 eax@10) (and
(! (or %lbl%@138599 (not (= (PciVendorId eax@4@@0) 65535))) :lblneg @138599)
(=> (not (= (PciVendorId eax@4@@0) 65535)) (and
(! (or %lbl%@138606 (= (PciHeaderType eax@8) 0)) :lblneg @138606)
(=> (= (PciHeaderType eax@8) 0) (and
(! (or %lbl%@138613 (=> (= (select $PciConfigState@2 ecx) 0) (and
(= 4 4)
(= call32824formal@$ret@0 (q@and eax@6 (- ?FFFFFFFF 2)))))) :lblneg @138613)
(=> (=> (= (select $PciConfigState@2 ecx) 0) (and
(= 4 4)
(= call32824formal@$ret@0 (q@and eax@6 (- ?FFFFFFFF 2))))) (and
(! (or %lbl%@138642 (=> (= (select $PciConfigState@2 ecx) 1) (and
(= 4 16)
(= call32824formal@$ret@0 ?FFFFFFFF)))) :lblneg @138642)
(=> (=> (= (select $PciConfigState@2 ecx) 1) (and
(= 4 16)
(= call32824formal@$ret@0 ?FFFFFFFF))) (and
(! (or %lbl%@138664 (=> (= (select $PciConfigState@2 ecx) 2) (and
(= 4 16)
(= call32824formal@$ret@0 (PciMemAddr ecx))))) :lblneg @138664)
(=> (=> (= (select $PciConfigState@2 ecx) 2) (and
(= 4 16)
(= call32824formal@$ret@0 (PciMemAddr ecx)))) (and
(! (or %lbl%@138687 (=> (= (select $PciConfigState@2 ecx) 3) (and
(= 4 4)
(= call32824formal@$ret@0 (q@or eax@6 2))))) :lblneg @138687)
(=> (=> (= (select $PciConfigState@2 ecx) 3) (and
(= 4 4)
(= call32824formal@$ret@0 (q@or eax@6 2)))) (and
(! (or %lbl%@138712 (not (= (select $PciConfigState@2 ecx) 4))) :lblneg @138712)
(=> (not (= (select $PciConfigState@2 ecx) 4)) (=> (and
(= $PciConfigState@3 (store $PciConfigState@2 ecx (+ 1 (select $PciConfigState@2 ecx))))
(= call32835formal@$ptr@0 (+ call32319formal@$ret@0 24))) (and
(! (or %lbl%@138771 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @138771)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@138799 (sAddr call32835formal@$ptr@0)) :lblneg @138799)
(=> (sAddr call32835formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32835formal@$ptr@0) (select $sMem@6 call32835formal@$ptr@0))
(= call32840formal@$ptr@0 (+ call32319formal@$ret@0 24))) (and
(! (or %lbl%@138823 (PtrOk call32840formal@$ptr@0)) :lblneg @138823)
(=> (PtrOk call32840formal@$ptr@0) (=> (word call32840formal@$val@0) (=> (and
(= call32840formal@$val@0 (select $Mem@6@@0 call32840formal@$ptr@0))
(= call32843formal@$ret@0 (neg call32840formal@$val@0))) (=> (and
(word call32843formal@$ret@0)
(word (+ call32843formal@$ret@0 1))
(= call32847formal@$ret@0 (+ call32843formal@$ret@0 1))
(= call32851formal@$ptr@0 (+ call32319formal@$ret@0 4))) (and
(! (or %lbl%@138921 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @138921)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@138949 (sAddr call32851formal@$ptr@0)) :lblneg @138949)
(=> (sAddr call32851formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32851formal@$ptr@0) (select $sMem@6 call32851formal@$ptr@0))
(= call32856formal@$ptr@0 (+ call32319formal@$ret@0 4))) (and
(! (or %lbl%@138973 (PtrOk call32856formal@$ptr@0)) :lblneg @138973)
(=> (PtrOk call32856formal@$ptr@0) (=> (word call32856formal@$val@0) (=> (and
(= call32856formal@$val@0 (select $Mem@6@@0 call32856formal@$ptr@0))
(= call32860formal@$ptr@0 (+ call32319formal@$ret@0 20))) (and
(! (or %lbl%@139012 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139012)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139040 (sAddr call32860formal@$ptr@0)) :lblneg @139040)
(=> (sAddr call32860formal@$ptr@0) (=> (and
(= (select $Mem@6@@0 call32860formal@$ptr@0) (select $sMem@6 call32860formal@$ptr@0))
(= call32865formal@$ptr@0 (+ call32319formal@$ret@0 20))) (and
(! (or %lbl%@139064 (PtrOk call32865formal@$ptr@0)) :lblneg @139064)
(=> (PtrOk call32865formal@$ptr@0) (=> (word call32865formal@$val@0) (=> (and
(= call32865formal@$val@0 (select $Mem@6@@0 call32865formal@$ptr@0))
(= call32870formal@$ptr@0 (+ call32856formal@$val@0 0))) (and
(! (or %lbl%@139105 (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139105)
(=> (MemInv $Mem@6@@0 $sMem@6 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139133 (pciAddr call32870formal@$ptr@0)) :lblneg @139133)
(=> (pciAddr call32870formal@$ptr@0) (=> (MemInv (store $Mem@6@@0 call32870formal@$ptr@0 call32865formal@$val@0) $sMem@6 $dMem@@0 $pciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $pciMem@0 (store $pciMem@@1 call32870formal@$ptr@0 call32865formal@$val@0))
(= call32875formal@$ptr@0 (+ call32856formal@$val@0 0))) (and
(! (or %lbl%@139194 (PtrOk call32875formal@$ptr@0)) :lblneg @139194)
(=> (PtrOk call32875formal@$ptr@0) (and
(! (or %lbl%@139197 (word call32865formal@$val@0)) :lblneg @139197)
(=> (word call32865formal@$val@0) (=> (and
(= $Mem@7 (store $Mem@6@@0 call32875formal@$ptr@0 call32865formal@$val@0))
(= call32880formal@$ptr@0 (+ call32856formal@$val@0 4))) (and
(! (or %lbl%@139236 (MemInv $Mem@7 $sMem@6 $dMem@@0 $pciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139236)
(=> (MemInv $Mem@7 $sMem@6 $dMem@@0 $pciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139263 (pciAddr call32880formal@$ptr@0)) :lblneg @139263)
(=> (pciAddr call32880formal@$ptr@0) (=> (MemInv (store $Mem@7 call32880formal@$ptr@0 call32847formal@$ret@0) $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $pciMem@1 (store $pciMem@0 call32880formal@$ptr@0 call32847formal@$ret@0))
(= call32885formal@$ptr@0 (+ call32856formal@$val@0 4))) (and
(! (or %lbl%@139323 (PtrOk call32885formal@$ptr@0)) :lblneg @139323)
(=> (PtrOk call32885formal@$ptr@0) (and
(! (or %lbl%@139326 (word call32847formal@$ret@0)) :lblneg @139326)
(=> (word call32847formal@$ret@0) (=> (= $Mem@8 (store $Mem@7 call32885formal@$ptr@0 call32847formal@$ret@0)) (=> (and
(= call32894formal@$oldPciConfigState@0 $PciConfigState@@0)
(= call32894formal@$oldPciMem@0 $pciMem@@1)
(= call32894formal@$oldMem@0 $Mem@@3)
(= call32894formal@$oldSMem@0 $sMem@@5)) (and
(! (or %lbl%@139380 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl call32894formal@$oldMem@0 call32894formal@$oldSMem@0 $dMem@@0 call32894formal@$oldPciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 call32894formal@$oldPciConfigState@0 DmaAddr@@0)) :lblneg @139380)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl call32894formal@$oldMem@0 call32894formal@$oldSMem@0 $dMem@@0 call32894formal@$oldPciMem@0 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 call32894formal@$oldPciConfigState@0 DmaAddr@@0) (and
(! (or %lbl%@139456 (MemInv $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139456)
(=> (MemInv $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139483 (IoInv $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0 $pciMem@1)) :lblneg @139483)
(=> (IoInv $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0 $pciMem@1) (=> (and
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0)
(= call32897formal@$ret@0 call32311formal@$ret@0)) (and
(! (or %lbl%@139593 (MemInv $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @139593)
(=> (MemInv $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@139620 (fAddr $S@@0 call32897formal@$ret@0)) :lblneg @139620)
(=> (fAddr $S@@0 call32897formal@$ret@0) (=> (= (select $Mem@8 call32897formal@$ret@0) (select (select $fMems@@4 $S@@0) call32897formal@$ret@0)) (=> (and
(memAddr call32897formal@$ret@0)
(= call32903formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@139648 (= (ReturnToAddr (select $Mem@8 call32897formal@$ret@0)) call32903formal@$oldRA@0)) :lblneg @139648)
(=> (= (ReturnToAddr (select $Mem@8 call32897formal@$ret@0)) call32903formal@$oldRA@0) (and
(! (or %lbl%@139657 (Aligned call32897formal@$ret@0)) :lblneg @139657)
(=> (Aligned call32897formal@$ret@0) (=> (and
(= esp@0@@13 (+ call32897formal@$ret@0 4))
(Aligned esp@0@@13)) (and
(! (or %lbl%@139686 (= esp@0@@13 (+ esp 4))) :lblneg @139686)
(=> (= esp@0@@13 (+ esp 4)) (and
(! (or %lbl%@139694 (= call32847formal@$ret@0 (PciMemSize ecx))) :lblneg @139694)
(=> (= call32847formal@$ret@0 (PciMemSize ecx)) (and
(! (or %lbl%@139700 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0)) :lblneg @139700)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@8 $sMem@6 $dMem@@0 $pciMem@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@3 DmaAddr@@0) true))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon21_Then_correct (=> (! (and %lbl%+32985 true) :lblpos +32985) (=> (and
(Je $Efl@58)
(= ecx@13 ecx@11)) __L51_correct))))
(let ((__L50_correct (=> (! (and %lbl%+32984 true) :lblpos +32984) (=> (= call32670formal@$ptr@0 (+ call32319formal@$ret@0 20)) (and
(! (or %lbl%@136376 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @136376)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@136404 (sAddr call32670formal@$ptr@0)) :lblneg @136404)
(=> (sAddr call32670formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32670formal@$ptr@0) (select $sMem@5 call32670formal@$ptr@0))
(= call32675formal@$ptr@0 (+ call32319formal@$ret@0 20))) (and
(! (or %lbl%@136428 (PtrOk call32675formal@$ptr@0)) :lblneg @136428)
(=> (PtrOk call32675formal@$ptr@0) (=> (and
(word call32675formal@$val@0)
(= call32675formal@$val@0 (select $Mem@5@@0 call32675formal@$ptr@0))) (=> (and
(= call32679formal@$ret@0 (q@and call32675formal@$val@0 15))
(word call32679formal@$ret@0)
(= call32686formal@$x@0 (OpnReg call32679formal@$ret@0))
(= call32686formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@136507 (OpnOk $Mem@5@@0 call32686formal@$x@0)) :lblneg @136507)
(=> (OpnOk $Mem@5@@0 call32686formal@$x@0) (and
(! (or %lbl%@136511 (OpnOk $Mem@5@@0 call32686formal@$y@0)) :lblneg @136511)
(=> (OpnOk $Mem@5@@0 call32686formal@$y@0) (=> (FlagsCmp $Efl@58 (EvalOpn $Mem@5@@0 call32686formal@$x@0) (EvalOpn $Mem@5@@0 call32686formal@$y@0)) (and
anon21_Then_correct
anon21_Else_correct)))))))))))))))))))
(let ((anon20_Then_correct (=> (! (and %lbl%+32973 true) :lblpos +32973) (=> (and
(Je $Efl@53)
(= ecx@11 ecx@9)) __L50_correct))))
(let ((__L49_correct (=> (! (and %lbl%+32972 true) :lblpos +32972) (=> (= call32636formal@$ptr@0 (+ call32319formal@$ret@0 16)) (and
(! (or %lbl%@136100 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @136100)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@136128 (sAddr call32636formal@$ptr@0)) :lblneg @136128)
(=> (sAddr call32636formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32636formal@$ptr@0) (select $sMem@5 call32636formal@$ptr@0))
(= call32641formal@$ptr@0 (+ call32319formal@$ret@0 16))) (and
(! (or %lbl%@136152 (PtrOk call32641formal@$ptr@0)) :lblneg @136152)
(=> (PtrOk call32641formal@$ptr@0) (=> (and
(word call32641formal@$val@0)
(= call32641formal@$val@0 (select $Mem@5@@0 call32641formal@$ptr@0))) (and
(! (or %lbl%@136187 (< 16 32)) :lblneg @136187)
(=> (< 16 32) (=> (and
(= call32645formal@$ret@0 (shr call32641formal@$val@0 16))
(word call32645formal@$ret@0)) (=> (and
(= call32649formal@$ret@0 (q@and call32645formal@$ret@0 255))
(word call32649formal@$ret@0)
(= call32656formal@$x@0 (OpnReg call32649formal@$ret@0))
(= call32656formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@136266 (OpnOk $Mem@5@@0 call32656formal@$x@0)) :lblneg @136266)
(=> (OpnOk $Mem@5@@0 call32656formal@$x@0) (and
(! (or %lbl%@136270 (OpnOk $Mem@5@@0 call32656formal@$y@0)) :lblneg @136270)
(=> (OpnOk $Mem@5@@0 call32656formal@$y@0) (=> (FlagsCmp $Efl@53 (EvalOpn $Mem@5@@0 call32656formal@$x@0) (EvalOpn $Mem@5@@0 call32656formal@$y@0)) (and
anon20_Then_correct
anon20_Else_correct))))))))))))))))))))))
(let ((anon19_Then_correct (=> (! (and %lbl%+32961 true) :lblpos +32961) (=> (and
(Jne $Efl@47)
(= ecx@9 ecx@7)) __L49_correct))))
(let ((__L48_correct (=> (! (and %lbl%+32960 true) :lblpos +32960) (=> (= call32606formal@$ptr@0 (+ call32319formal@$ret@0 8)) (and
(! (or %lbl%@135859 (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @135859)
(=> (MemInv $Mem@5@@0 $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@135887 (sAddr call32606formal@$ptr@0)) :lblneg @135887)
(=> (sAddr call32606formal@$ptr@0) (=> (and
(= (select $Mem@5@@0 call32606formal@$ptr@0) (select $sMem@5 call32606formal@$ptr@0))
(= call32611formal@$ptr@0 (+ call32319formal@$ret@0 8))) (and
(! (or %lbl%@135911 (PtrOk call32611formal@$ptr@0)) :lblneg @135911)
(=> (PtrOk call32611formal@$ptr@0) (=> (and
(word call32611formal@$val@0)
(= call32611formal@$val@0 (select $Mem@5@@0 call32611formal@$ptr@0))) (=> (and
(= call32615formal@$ret@0 (q@and call32611formal@$val@0 65535))
(word call32615formal@$ret@0)
(= call32622formal@$x@0 (OpnReg call32615formal@$ret@0))
(= call32622formal@$y@0 (OpnReg 65535))) (and
(! (or %lbl%@135990 (OpnOk $Mem@5@@0 call32622formal@$x@0)) :lblneg @135990)
(=> (OpnOk $Mem@5@@0 call32622formal@$x@0) (and
(! (or %lbl%@135994 (OpnOk $Mem@5@@0 call32622formal@$y@0)) :lblneg @135994)
(=> (OpnOk $Mem@5@@0 call32622formal@$y@0) (=> (FlagsCmp $Efl@47 (EvalOpn $Mem@5@@0 call32622formal@$x@0) (EvalOpn $Mem@5@@0 call32622formal@$y@0)) (and
anon19_Then_correct
anon19_Else_correct)))))))))))))))))))
(let ((anon18_Then_correct (=> (! (and %lbl%+32949 true) :lblpos +32949) (=> (and
(Jne $Efl@42)
(= ecx@7 ecx@5@@0)) __L48_correct))))
(let ((__L47_correct (=> (! (and %lbl%+32948 true) :lblpos +32948) (=> (Aligned 0) (and
(! (or %lbl%@134348 (and
(TV 0)
(TO 1)
(TO 3)
(TO 4))) :lblneg @134348)
(=> (and
(TV 0)
(TO 1)
(TO 3)
(TO 4)) (=> (= call32496formal@$ret@0 0) (and
(! (or %lbl%@134399 (IsValidPciId ecx)) :lblneg @134399)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@134402 (IsValidPciOffset 0)) :lblneg @134402)
(=> (IsValidPciOffset 0) (and
(! (or %lbl%@134405 (= ecx@5@@0 ecx)) :lblneg @134405)
(=> (= ecx@5@@0 ecx) (and
(! (or %lbl%@134409 (= call32496formal@$ret@0 0)) :lblneg @134409)
(=> (= call32496formal@$ret@0 0) (=> (= $PciConfigId@0@@1 ecx) (=> (and
(= $PciConfigOffset@0@@1 0)
(= edx@3@@1 3324)) (and
(! (or %lbl%@134464 (= ecx $PciConfigId@0@@1)) :lblneg @134464)
(=> (= ecx $PciConfigId@0@@1) (and
(! (or %lbl%@134468 (= 0 $PciConfigOffset@0@@1)) :lblneg @134468)
(=> (= 0 $PciConfigOffset@0@@1) (and
(! (or %lbl%@134472 (= edx@3@@1 3324)) :lblneg @134472)
(=> (= edx@3@@1 3324) (and
(! (or %lbl%@134477 (IsValidPciId ecx)) :lblneg @134477)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@134480 (IsValidPciOffset 0)) :lblneg @134480)
(=> (IsValidPciOffset 0) (=> (PciConfigReadResult ecx 0 eax@4@@0) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= 0 16)
(= (q@and eax@4@@0 15) 0)) (= (PciMemAddr ecx) eax@4@@0))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= 0 16)) (= (PciMemSize ecx) (+ 1 (neg eax@4@@0))))
(word eax@4@@0)
(= call32511formal@$ptr@0 (+ call32319formal@$ret@0 8))) (and
(! (or %lbl%@134596 (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @134596)
(=> (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@134624 (sAddr call32511formal@$ptr@0)) :lblneg @134624)
(=> (sAddr call32511formal@$ptr@0) (=> (MemInv (store $Mem@1@@4 call32511formal@$ptr@0 eax@4@@0) $sMem@2@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@2@@2 (store $sMem@1@@2 call32511formal@$ptr@0 eax@4@@0))
(= call32516formal@$ptr@0 (+ call32319formal@$ret@0 8))) (and
(! (or %lbl%@134685 (PtrOk call32516formal@$ptr@0)) :lblneg @134685)
(=> (PtrOk call32516formal@$ptr@0) (and
(! (or %lbl%@134688 (word eax@4@@0)) :lblneg @134688)
(=> (word eax@4@@0) (=> (and
(= $Mem@2@@3 (store $Mem@1@@4 call32516formal@$ptr@0 eax@4@@0))
(= call32519formal@$ret@0 4)) (and
(! (or %lbl%@134741 (IsValidPciId ecx)) :lblneg @134741)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@134744 (IsValidPciOffset 4)) :lblneg @134744)
(=> (IsValidPciOffset 4) (and
(! (or %lbl%@134747 (= ecx@5@@0 ecx)) :lblneg @134747)
(=> (= ecx@5@@0 ecx) (and
(! (or %lbl%@134751 (= call32519formal@$ret@0 4)) :lblneg @134751)
(=> (= call32519formal@$ret@0 4) (=> (= $PciConfigId@2 ecx) (=> (and
(= $PciConfigOffset@2 4)
(= edx@4 3324)) (and
(! (or %lbl%@134803 (= ecx $PciConfigId@2)) :lblneg @134803)
(=> (= ecx $PciConfigId@2) (and
(! (or %lbl%@134807 (= 4 $PciConfigOffset@2)) :lblneg @134807)
(=> (= 4 $PciConfigOffset@2) (and
(! (or %lbl%@134811 (= edx@4 3324)) :lblneg @134811)
(=> (= edx@4 3324) (and
(! (or %lbl%@134816 (IsValidPciId ecx)) :lblneg @134816)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@134819 (IsValidPciOffset 4)) :lblneg @134819)
(=> (IsValidPciOffset 4) (=> (PciConfigReadResult ecx 4 eax@6) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= 4 16)
(= (q@and eax@6 15) 0)) (= (PciMemAddr ecx) eax@6))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= 4 16)) (= (PciMemSize ecx) (+ 1 (neg eax@6))))
(word eax@6)
(= call32534formal@$ptr@0 (+ call32319formal@$ret@0 12))) (and
(! (or %lbl%@134935 (MemInv $Mem@2@@3 $sMem@2@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @134935)
(=> (MemInv $Mem@2@@3 $sMem@2@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@134963 (sAddr call32534formal@$ptr@0)) :lblneg @134963)
(=> (sAddr call32534formal@$ptr@0) (=> (MemInv (store $Mem@2@@3 call32534formal@$ptr@0 eax@6) $sMem@3@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@3@@1 (store $sMem@2@@2 call32534formal@$ptr@0 eax@6))
(= call32539formal@$ptr@0 (+ call32319formal@$ret@0 12))) (and
(! (or %lbl%@135024 (PtrOk call32539formal@$ptr@0)) :lblneg @135024)
(=> (PtrOk call32539formal@$ptr@0) (and
(! (or %lbl%@135027 (word eax@6)) :lblneg @135027)
(=> (word eax@6) (=> (and
(= $Mem@3@@2 (store $Mem@2@@3 call32539formal@$ptr@0 eax@6))
(= call32542formal@$ret@0 12)) (and
(! (or %lbl%@135080 (IsValidPciId ecx)) :lblneg @135080)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@135083 (IsValidPciOffset 12)) :lblneg @135083)
(=> (IsValidPciOffset 12) (and
(! (or %lbl%@135086 (= ecx@5@@0 ecx)) :lblneg @135086)
(=> (= ecx@5@@0 ecx) (and
(! (or %lbl%@135090 (= call32542formal@$ret@0 12)) :lblneg @135090)
(=> (= call32542formal@$ret@0 12) (=> (= $PciConfigId@4 ecx) (=> (and
(= $PciConfigOffset@4 12)
(= edx@5@@0 3324)) (and
(! (or %lbl%@135142 (= ecx $PciConfigId@4)) :lblneg @135142)
(=> (= ecx $PciConfigId@4) (and
(! (or %lbl%@135146 (= 12 $PciConfigOffset@4)) :lblneg @135146)
(=> (= 12 $PciConfigOffset@4) (and
(! (or %lbl%@135150 (= edx@5@@0 3324)) :lblneg @135150)
(=> (= edx@5@@0 3324) (and
(! (or %lbl%@135155 (IsValidPciId ecx)) :lblneg @135155)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@135158 (IsValidPciOffset 12)) :lblneg @135158)
(=> (IsValidPciOffset 12) (=> (PciConfigReadResult ecx 12 eax@8) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= 12 16)
(= (q@and eax@8 15) 0)) (= (PciMemAddr ecx) eax@8))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= 12 16)) (= (PciMemSize ecx) (+ 1 (neg eax@8))))
(word eax@8)
(= call32557formal@$ptr@0 (+ call32319formal@$ret@0 16))) (and
(! (or %lbl%@135274 (MemInv $Mem@3@@2 $sMem@3@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @135274)
(=> (MemInv $Mem@3@@2 $sMem@3@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@135302 (sAddr call32557formal@$ptr@0)) :lblneg @135302)
(=> (sAddr call32557formal@$ptr@0) (=> (MemInv (store $Mem@3@@2 call32557formal@$ptr@0 eax@8) $sMem@4@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@4@@1 (store $sMem@3@@1 call32557formal@$ptr@0 eax@8))
(= call32562formal@$ptr@0 (+ call32319formal@$ret@0 16))) (and
(! (or %lbl%@135363 (PtrOk call32562formal@$ptr@0)) :lblneg @135363)
(=> (PtrOk call32562formal@$ptr@0) (and
(! (or %lbl%@135366 (word eax@8)) :lblneg @135366)
(=> (word eax@8) (=> (and
(= $Mem@4@@2 (store $Mem@3@@2 call32562formal@$ptr@0 eax@8))
(= call32565formal@$ret@0 16)) (and
(! (or %lbl%@135419 (IsValidPciId ecx)) :lblneg @135419)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@135422 (IsValidPciOffset 16)) :lblneg @135422)
(=> (IsValidPciOffset 16) (and
(! (or %lbl%@135425 (= ecx@5@@0 ecx)) :lblneg @135425)
(=> (= ecx@5@@0 ecx) (and
(! (or %lbl%@135429 (= call32565formal@$ret@0 16)) :lblneg @135429)
(=> (= call32565formal@$ret@0 16) (=> (= $PciConfigId@6 ecx) (=> (and
(= $PciConfigOffset@6 16)
(= edx@6@@0 3324)) (and
(! (or %lbl%@135481 (= ecx $PciConfigId@6)) :lblneg @135481)
(=> (= ecx $PciConfigId@6) (and
(! (or %lbl%@135485 (= 16 $PciConfigOffset@6)) :lblneg @135485)
(=> (= 16 $PciConfigOffset@6) (and
(! (or %lbl%@135489 (= edx@6@@0 3324)) :lblneg @135489)
(=> (= edx@6@@0 3324) (and
(! (or %lbl%@135494 (IsValidPciId ecx)) :lblneg @135494)
(=> (IsValidPciId ecx) (and
(! (or %lbl%@135497 (IsValidPciOffset 16)) :lblneg @135497)
(=> (IsValidPciOffset 16) (=> (PciConfigReadResult ecx 16 eax@10) (=> (and
(=> (and
(= (select $PciConfigState@@0 ecx) 0)
(= 16 16)
(= (q@and eax@10 15) 0)) (= (PciMemAddr ecx) eax@10))
(=> (and
(= (select $PciConfigState@@0 ecx) 2)
(= 16 16)) (= (PciMemSize ecx) (+ 1 (neg eax@10))))
(word eax@10)
(= call32580formal@$ptr@0 (+ call32319formal@$ret@0 20))) (and
(! (or %lbl%@135613 (MemInv $Mem@4@@2 $sMem@4@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @135613)
(=> (MemInv $Mem@4@@2 $sMem@4@@1 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@135641 (sAddr call32580formal@$ptr@0)) :lblneg @135641)
(=> (sAddr call32580formal@$ptr@0) (=> (MemInv (store $Mem@4@@2 call32580formal@$ptr@0 eax@10) $sMem@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@5 (store $sMem@4@@1 call32580formal@$ptr@0 eax@10))
(= call32585formal@$ptr@0 (+ call32319formal@$ret@0 20))) (and
(! (or %lbl%@135702 (PtrOk call32585formal@$ptr@0)) :lblneg @135702)
(=> (PtrOk call32585formal@$ptr@0) (and
(! (or %lbl%@135705 (word eax@10)) :lblneg @135705)
(=> (word eax@10) (=> (= $Mem@5@@0 (store $Mem@4@@2 call32585formal@$ptr@0 eax@10)) (=> (and
(= call32592formal@$x@0 (OpnReg eax@10))
(= call32592formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@135750 (OpnOk $Mem@5@@0 call32592formal@$x@0)) :lblneg @135750)
(=> (OpnOk $Mem@5@@0 call32592formal@$x@0) (and
(! (or %lbl%@135754 (OpnOk $Mem@5@@0 call32592formal@$y@0)) :lblneg @135754)
(=> (OpnOk $Mem@5@@0 call32592formal@$y@0) (=> (FlagsCmp $Efl@42 (EvalOpn $Mem@5@@0 call32592formal@$x@0) (EvalOpn $Mem@5@@0 call32592formal@$y@0)) (and
anon18_Then_correct
anon18_Else_correct))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon17_Then_correct (=> (! (and %lbl%+32937 true) :lblpos +32937) (=> (and
(Je $Efl@23)
(= ecx@5@@0 ecx@3@@1)) __L47_correct))))
(let ((__L46_correct (=> (! (and %lbl%+32936 true) :lblpos +32936) (=> (= call32397formal@$ret@0 ecx@3@@1) (and
(! (or %lbl%@133777 (word (+ call32397formal@$ret@0 call32397formal@$ret@0))) :lblneg @133777)
(=> (word (+ call32397formal@$ret@0 call32397formal@$ret@0)) (=> (= call32401formal@$ret@0 (+ call32397formal@$ret@0 call32397formal@$ret@0)) (and
(! (or %lbl%@133809 (word (+ call32401formal@$ret@0 call32401formal@$ret@0))) :lblneg @133809)
(=> (word (+ call32401formal@$ret@0 call32401formal@$ret@0)) (=> (= call32405formal@$ret@0 (+ call32401formal@$ret@0 call32401formal@$ret@0)) (and
(! (or %lbl%@133841 (word (+ call32405formal@$ret@0 call32405formal@$ret@0))) :lblneg @133841)
(=> (word (+ call32405formal@$ret@0 call32405formal@$ret@0)) (=> (= call32409formal@$ret@0 (+ call32405formal@$ret@0 call32405formal@$ret@0)) (and
(! (or %lbl%@133874 (word (+ call32409formal@$ret@0 PciLo@@0))) :lblneg @133874)
(=> (word (+ call32409formal@$ret@0 PciLo@@0)) (=> (and
(= call32413formal@$ret@0 (+ call32409formal@$ret@0 PciLo@@0))
(= call32422formal@$ptr@0 (+ call32319formal@$ret@0 4))) (and
(! (or %lbl%@133917 (MemInv $Mem@0@@6 $sMem@0@@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @133917)
(=> (MemInv $Mem@0@@6 $sMem@0@@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@133945 (sAddr call32422formal@$ptr@0)) :lblneg @133945)
(=> (sAddr call32422formal@$ptr@0) (=> (MemInv (store $Mem@0@@6 call32422formal@$ptr@0 call32413formal@$ret@0) $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@1@@2 (store $sMem@0@@3 call32422formal@$ptr@0 call32413formal@$ret@0))
(= call32427formal@$ptr@0 (+ call32319formal@$ret@0 4))) (and
(! (or %lbl%@134006 (PtrOk call32427formal@$ptr@0)) :lblneg @134006)
(=> (PtrOk call32427formal@$ptr@0) (and
(! (or %lbl%@134009 (word call32413formal@$ret@0)) :lblneg @134009)
(=> (word call32413formal@$ret@0) (=> (= $Mem@1@@4 (store $Mem@0@@6 call32427formal@$ptr@0 call32413formal@$ret@0)) (and
(! (or %lbl%@134035 (and
(TV PciLo@@0)
(TO (* ecx 2))
(TO (+ (* ecx 2) 1)))) :lblneg @134035)
(=> (and
(TV PciLo@@0)
(TO (* ecx 2))
(TO (+ (* ecx 2) 1))) (=> (= call32449formal@$ptr@0 (+ call32319formal@$ret@0 4)) (and
(! (or %lbl%@134072 (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @134072)
(=> (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@134100 (sAddr call32449formal@$ptr@0)) :lblneg @134100)
(=> (sAddr call32449formal@$ptr@0) (=> (and
(= (select $Mem@1@@4 call32449formal@$ptr@0) (select $sMem@1@@2 call32449formal@$ptr@0))
(= call32454formal@$ptr@0 (+ call32319formal@$ret@0 4))) (and
(! (or %lbl%@134124 (PtrOk call32454formal@$ptr@0)) :lblneg @134124)
(=> (PtrOk call32454formal@$ptr@0) (=> (and
(word call32454formal@$val@0)
(= call32454formal@$val@0 (select $Mem@1@@4 call32454formal@$ptr@0))) (and
(! (or %lbl%@134154 (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @134154)
(=> (MemInv $Mem@1@@4 $sMem@1@@2 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@134182 (pciAddr call32454formal@$val@0)) :lblneg @134182)
(=> (pciAddr call32454formal@$val@0) (=> (= (select $Mem@1@@4 call32454formal@$val@0) (select $pciMem@@1 call32454formal@$val@0)) (and
(! (or %lbl%@134198 (PtrOk call32454formal@$val@0)) :lblneg @134198)
(=> (PtrOk call32454formal@$val@0) (=> (and
(word call32459formal@$val@0)
(= call32459formal@$val@0 (select $Mem@1@@4 call32454formal@$val@0))
(= call32466formal@$x@0 (OpnReg call32459formal@$val@0))
(= call32466formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@134245 (OpnOk $Mem@1@@4 call32466formal@$x@0)) :lblneg @134245)
(=> (OpnOk $Mem@1@@4 call32466formal@$x@0) (and
(! (or %lbl%@134249 (OpnOk $Mem@1@@4 call32466formal@$y@0)) :lblneg @134249)
(=> (OpnOk $Mem@1@@4 call32466formal@$y@0) (=> (FlagsCmp $Efl@23 (EvalOpn $Mem@1@@4 call32466formal@$x@0) (EvalOpn $Mem@1@@4 call32466formal@$y@0)) (and
anon17_Then_correct
anon17_Else_correct))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((anon16_Then_correct (=> (! (and %lbl%+32925 true) :lblpos +32925) (=> (and
(Je $Efl@12@@2)
(= ecx@3@@1 ecx@1@@4)) __L46_correct))))
(let ((__L45_correct (=> (! (and %lbl%+32924 true) :lblpos +32924) (=> (= call32373formal@$ret@0 ecx@1@@4) (=> (and
(= call32377formal@$ret@0 (q@and call32373formal@$ret@0 7))
(word call32377formal@$ret@0)
(= call32384formal@$x@0 (OpnReg call32377formal@$ret@0))
(= call32384formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@133651 (OpnOk $Mem@0@@6 call32384formal@$x@0)) :lblneg @133651)
(=> (OpnOk $Mem@0@@6 call32384formal@$x@0) (and
(! (or %lbl%@133655 (OpnOk $Mem@0@@6 call32384formal@$y@0)) :lblneg @133655)
(=> (OpnOk $Mem@0@@6 call32384formal@$y@0) (=> (FlagsCmp $Efl@12@@2 (EvalOpn $Mem@0@@6 call32384formal@$x@0) (EvalOpn $Mem@0@@6 call32384formal@$y@0)) (and
anon16_Then_correct
anon16_Else_correct)))))))))))
(let ((anon15_Then_correct@@0 (=> (! (and %lbl%+32913 true) :lblpos +32913) (=> (and
(Jb $Efl@7@@0)
(= ecx@1@@4 ecx)) __L45_correct))))
(let ((anon0_correct@@25 (=> (! (and %lbl%+32912 true) :lblpos +32912) (and
(! (or %lbl%@132805 (isStack 0)) :lblneg @132805)
(=> (isStack 0) (and
(! (or %lbl%@132808 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @132808)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)) (=> (and
(= (StackStateTag (select $StackState 0)) (StackTag 0 $tMems@@12))
(=> (IsYielded (select $StackState 0)) (= (select $StackState 0) (StackYielded (StackEbp 0 $tMems@@12) (+ (StackEsp 0 $tMems@@12) 4) (StackRA 0 $tMems@@12 $fMems@@4))))
(= call32311formal@$ret@0 esp)
(= call32314formal@$ret@0 DLo@@0)) (and
(! (or %lbl%@133029 (Aligned call32314formal@$ret@0)) :lblneg @133029)
(=> (Aligned call32314formal@$ret@0) (=> (and
(Aligned (- call32314formal@$ret@0 4))
(Aligned (- call32314formal@$ret@0 8))
(Aligned (- call32314formal@$ret@0 12))
(Aligned (- call32314formal@$ret@0 16))
(Aligned (- call32314formal@$ret@0 20))
(Aligned (- call32314formal@$ret@0 24))
(Aligned (- call32314formal@$ret@0 28))
(Aligned (- call32314formal@$ret@0 32))
(Aligned (- call32314formal@$ret@0 36))
(Aligned (- call32314formal@$ret@0 40))
(Aligned (- call32314formal@$ret@0 44))
(Aligned (- call32314formal@$ret@0 48))
(Aligned (- call32314formal@$ret@0 52))
(Aligned (- call32314formal@$ret@0 56))
(Aligned (- call32314formal@$ret@0 60))
(Aligned (- call32314formal@$ret@0 64))) (and
(! (or %lbl%@133173 (word (- call32314formal@$ret@0 28))) :lblneg @133173)
(=> (word (- call32314formal@$ret@0 28)) (=> (and
(= call32319formal@$ret@0 (- call32314formal@$ret@0 28))
(= call32326formal@$ret@0 2147483647)) (and
(! (or %lbl%@133231 (word (+ call32326formal@$ret@0 2147483647))) :lblneg @133231)
(=> (word (+ call32326formal@$ret@0 2147483647)) (=> (= call32330formal@$ret@0 (+ call32326formal@$ret@0 2147483647)) (and
(! (or %lbl%@133264 (word (+ call32330formal@$ret@0 1))) :lblneg @133264)
(=> (word (+ call32330formal@$ret@0 1)) (=> (and
(= call32334formal@$ret@0 (+ call32330formal@$ret@0 1))
(= call32343formal@$ptr@0 (+ call32319formal@$ret@0 0))) (and
(! (or %lbl%@133307 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @133307)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@133337 (sAddr call32343formal@$ptr@0)) :lblneg @133337)
(=> (sAddr call32343formal@$ptr@0) (=> (MemInv (store $Mem@@3 call32343formal@$ptr@0 call32334formal@$ret@0) $sMem@0@@3 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (=> (and
(= $sMem@0@@3 (store $sMem@@5 call32343formal@$ptr@0 call32334formal@$ret@0))
(= call32348formal@$ptr@0 (+ call32319formal@$ret@0 0))) (and
(! (or %lbl%@133400 (PtrOk call32348formal@$ptr@0)) :lblneg @133400)
(=> (PtrOk call32348formal@$ptr@0) (and
(! (or %lbl%@133403 (word call32334formal@$ret@0)) :lblneg @133403)
(=> (word call32334formal@$ret@0) (=> (and
(= $Mem@0@@6 (store $Mem@@3 call32348formal@$ptr@0 call32334formal@$ret@0))
(forall (($IoMmuEnabled@@1 Bool) ($PciConfigState@@1 (Array Int Int)) (DmaAddr@@1 Int) ($pciMem@@2 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@1 $PciConfigState@@1 DmaAddr@@1 $pciMem@@2) (_IoInv $IoMmuEnabled@@1 $PciConfigState@@1 DmaAddr@@1 $pciMem@@2))
 :qid |Commonib.268:17|
 :skolemid |225|
))) (and
(! (or %lbl%@133455 (TV ecx)) :lblneg @133455)
(=> (TV ecx) (=> (and
(= call32360formal@$x@0 (OpnReg ecx))
(= call32360formal@$y@0 (OpnReg 65536))) (and
(! (or %lbl%@133478 (OpnOk $Mem@0@@6 call32360formal@$x@0)) :lblneg @133478)
(=> (OpnOk $Mem@0@@6 call32360formal@$x@0) (and
(! (or %lbl%@133482 (OpnOk $Mem@0@@6 call32360formal@$y@0)) :lblneg @133482)
(=> (OpnOk $Mem@0@@6 call32360formal@$y@0) (=> (FlagsCmp $Efl@7@@0 (EvalOpn $Mem@0@@6 call32360formal@$x@0) (EvalOpn $Mem@0@@6 call32360formal@$y@0)) (and
anon15_Then_correct@@0
anon15_Else_correct@@0))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@25 (=> (! (and %lbl%+131307 true) :lblpos +131307) (=> (and
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
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@25))))
PreconditionGeneratedEntry_correct@@25)))))))))))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33032 () Bool)
(declare-fun call33017formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@140422 () Bool)
(declare-fun %lbl%@140433 () Bool)
(declare-fun esp@0@@14 () Int)
(declare-fun %lbl%@140466 () Bool)
(declare-fun %lbl%@140474 () Bool)
(declare-fun eax@0@@1 () Int)
(declare-fun %lbl%@140487 () Bool)
(declare-fun %lbl%+33029 () Bool)
(declare-fun $Efl@1@@1 () Int)
(declare-fun %lbl%@140374 () Bool)
(declare-fun call32997formal@$ret@0 () Int)
(declare-fun call33014formal@$ret@0 () Int)
(declare-fun %lbl%+33027 () Bool)
(declare-fun %lbl%+33026 () Bool)
(declare-fun %lbl%@140082 () Bool)
(declare-fun %lbl%@140085 () Bool)
(declare-fun call33004formal@$x@0 () T@opn)
(declare-fun call33004formal@$y@0 () T@opn)
(declare-fun %lbl%@140328 () Bool)
(declare-fun %lbl%@140333 () Bool)
(declare-fun %lbl%+139784 () Bool)
(push 1)
(set-info :boogie-vc-id PciDmaBuffer)
(assert (not
(let ((__L52_correct (=> (! (and %lbl%+33032 true) :lblpos +33032) (=> (= call33017formal@$oldRA@0 $RET@@0) (and
(! (or %lbl%@140422 (= (ReturnToAddr (select $Mem@@3 esp)) call33017formal@$oldRA@0)) :lblneg @140422)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33017formal@$oldRA@0) (and
(! (or %lbl%@140433 (Aligned esp)) :lblneg @140433)
(=> (Aligned esp) (=> (and
(= esp@0@@14 (+ esp 4))
(Aligned esp@0@@14)) (and
(! (or %lbl%@140466 (= esp@0@@14 (+ esp 4))) :lblneg @140466)
(=> (= esp@0@@14 (+ esp 4)) (and
(! (or %lbl%@140474 (=> $IoMmuEnabled@@0 (= eax@0@@1 (- ?dmaLo 8)))) :lblneg @140474)
(=> (=> $IoMmuEnabled@@0 (= eax@0@@1 (- ?dmaLo 8))) (and
(! (or %lbl%@140487 (=> (not $IoMmuEnabled@@0) (= eax@0@@1 0))) :lblneg @140487)
(=> (=> (not $IoMmuEnabled@@0) (= eax@0@@1 0)) true)))))))))))))))
(let ((anon3_Else_correct@@4 (=> (! (and %lbl%+33029 true) :lblpos +33029) (=> (not (Je $Efl@1@@1)) (and
(! (or %lbl%@140374 (word (- call32997formal@$ret@0 8))) :lblneg @140374)
(=> (word (- call32997formal@$ret@0 8)) (=> (and
(= call33014formal@$ret@0 (- call32997formal@$ret@0 8))
(= eax@0@@1 call33014formal@$ret@0)) __L52_correct)))))))
(let ((anon3_Then_correct@@4 (=> (! (and %lbl%+33027 true) :lblpos +33027) (=> (and
(Je $Efl@1@@1)
(= eax@0@@1 call32997formal@$ret@0)) __L52_correct))))
(let ((anon0_correct@@26 (=> (! (and %lbl%+33026 true) :lblpos +33026) (and
(! (or %lbl%@140082 (isStack $S@@0)) :lblneg @140082)
(=> (isStack $S@@0) (and
(! (or %lbl%@140085 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @140085)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (= $S@@0 CurrentStack) (=> (and
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(forall (($IoMmuEnabled@@2 Bool) ($PciConfigState@@2 (Array Int Int)) (DmaAddr@@2 Int) ($pciMem@@3 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@2 $PciConfigState@@2 DmaAddr@@2 $pciMem@@3) (_IoInv $IoMmuEnabled@@2 $PciConfigState@@2 DmaAddr@@2 $pciMem@@3))
 :qid |Commonib.268:17|
 :skolemid |225|
))
(= call32997formal@$ret@0 DmaAddr@@0)
(= call33004formal@$x@0 (OpnReg call32997formal@$ret@0))
(= call33004formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@140328 (OpnOk $Mem@@3 call33004formal@$x@0)) :lblneg @140328)
(=> (OpnOk $Mem@@3 call33004formal@$x@0) (and
(! (or %lbl%@140333 (OpnOk $Mem@@3 call33004formal@$y@0)) :lblneg @140333)
(=> (OpnOk $Mem@@3 call33004formal@$y@0) (=> (FlagsCmp $Efl@1@@1 (EvalOpn $Mem@@3 call33004formal@$x@0) (EvalOpn $Mem@@3 call33004formal@$y@0)) (and
anon3_Then_correct@@4
anon3_Else_correct@@4)))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@26 (=> (! (and %lbl%+139784 true) :lblpos +139784) (=> (= $RET@@0 (ReturnToAddr (select $Mem@@3 esp))) (=> (and
(isStack $S@@0)
(SpRequire $S@@0 esp 4)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@26)))))
PreconditionGeneratedEntry_correct@@26)))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33045 () Bool)
(declare-fun %lbl%@140775 () Bool)
(declare-fun %lbl%@140778 () Bool)
(declare-fun call33039formal@$ret@0 () Int)
(declare-fun call33042formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@141010 () Bool)
(declare-fun %lbl%@141021 () Bool)
(declare-fun esp@0@@15 () Int)
(declare-fun %lbl%@141052 () Bool)
(declare-fun %lbl%@141060 () Bool)
(declare-fun %lbl%@141069 () Bool)
(declare-fun %lbl%+140499 () Bool)
(push 1)
(set-info :boogie-vc-id PciDmaPhysicalAddr)
(assert (not
(let ((anon0_correct@@27 (=> (! (and %lbl%+33045 true) :lblpos +33045) (and
(! (or %lbl%@140775 (isStack $S@@0)) :lblneg @140775)
(=> (isStack $S@@0) (and
(! (or %lbl%@140778 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @140778)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $S@@0 CurrentStack)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(forall (($IoMmuEnabled@@3 Bool) ($PciConfigState@@3 (Array Int Int)) (DmaAddr@@3 Int) ($pciMem@@4 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@3 $PciConfigState@@3 DmaAddr@@3 $pciMem@@4) (_IoInv $IoMmuEnabled@@3 $PciConfigState@@3 DmaAddr@@3 $pciMem@@4))
 :qid |Commonib.268:17|
 :skolemid |225|
))
(= call33039formal@$ret@0 DmaAddr@@0)
(= call33042formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@141010 (= (ReturnToAddr (select $Mem@@3 esp)) call33042formal@$oldRA@0)) :lblneg @141010)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33042formal@$oldRA@0) (and
(! (or %lbl%@141021 (Aligned esp)) :lblneg @141021)
(=> (Aligned esp) (=> (and
(= esp@0@@15 (+ esp 4))
(Aligned esp@0@@15)) (and
(! (or %lbl%@141052 (= esp@0@@15 (+ esp 4))) :lblneg @141052)
(=> (= esp@0@@15 (+ esp 4)) (and
(! (or %lbl%@141060 (=> $IoMmuEnabled@@0 (= call33039formal@$ret@0 ?dmaLo))) :lblneg @141060)
(=> (=> $IoMmuEnabled@@0 (= call33039formal@$ret@0 ?dmaLo)) (and
(! (or %lbl%@141069 (=> (not $IoMmuEnabled@@0) (= call33039formal@$ret@0 0))) :lblneg @141069)
(=> (=> (not $IoMmuEnabled@@0) (= call33039formal@$ret@0 0)) true)))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@27 (=> (! (and %lbl%+140499 true) :lblpos +140499) (=> (= $RET@@0 (ReturnToAddr (select $Mem@@3 esp))) (=> (and
(isStack $S@@0)
(SpRequire $S@@0 esp 4)
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@27)))))
PreconditionGeneratedEntry_correct@@27))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33211 () Bool)
(declare-fun %lbl%+33223 () Bool)
(declare-fun %lbl%+33235 () Bool)
(declare-fun %lbl%+33247 () Bool)
(declare-fun %lbl%+33250 () Bool)
(declare-fun call33196formal@$ptr@0 () Int)
(declare-fun call33130formal@$val@0 () Int)
(declare-fun edx@7 () Int)
(declare-fun %lbl%@142693 () Bool)
(declare-fun %lbl%@142695 () Bool)
(declare-fun $id@@0 () Int)
(declare-fun %lbl%@142704 () Bool)
(declare-fun PciMemLoaded (Int Int Int) Bool)
(declare-fun call33196formal@$val@0 () Int)
(declare-fun call33199formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@142759 () Bool)
(declare-fun %lbl%@142770 () Bool)
(declare-fun esp@0@@16 () Int)
(declare-fun %lbl%@142801 () Bool)
(declare-fun %lbl%@142809 () Bool)
(declare-fun $offset@@0 () Int)
(declare-fun %lbl%+33245 () Bool)
(declare-fun $Efl@15 () Int)
(declare-fun edx@5@@1 () Int)
(declare-fun %lbl%+33244 () Bool)
(declare-fun call33155formal@$ptr@0 () Int)
(declare-fun call33117formal@$ret@0 () Int)
(declare-fun ecx@5@@1 () Int)
(declare-fun %lbl%@142408 () Bool)
(declare-fun %lbl%@142438 () Bool)
(declare-fun call33164formal@$ptr@0 () Int)
(declare-fun %lbl%@142471 () Bool)
(declare-fun call33164formal@$val@0 () Int)
(declare-fun call33167formal@$ret@0 () Int)
(declare-fun call33171formal@$ret@0 () Int)
(declare-fun call33178formal@$x@0 () T@opn)
(declare-fun call33178formal@$y@0 () T@opn)
(declare-fun %lbl%@142574 () Bool)
(declare-fun %lbl%@142579 () Bool)
(declare-fun %lbl%+33233 () Bool)
(declare-fun $Efl@9@@1 () Int)
(declare-fun ecx@3@@2 () Int)
(declare-fun edx@3@@2 () Int)
(declare-fun %lbl%+33232 () Bool)
(declare-fun call33123formal@$ptr@0 () Int)
(declare-fun %lbl%@142172 () Bool)
(declare-fun %lbl%@142202 () Bool)
(declare-fun call33130formal@$ptr@0 () Int)
(declare-fun %lbl%@142231 () Bool)
(declare-fun call33137formal@$x@0 () T@opn)
(declare-fun call33137formal@$y@0 () T@opn)
(declare-fun %lbl%@142279 () Bool)
(declare-fun %lbl%@142284 () Bool)
(declare-fun %lbl%+33221 () Bool)
(declare-fun $Efl@4 () Int)
(declare-fun edx@1@@2 () Int)
(declare-fun ecx@1@@5 () Int)
(declare-fun %lbl%+33220 () Bool)
(declare-fun call33104formal@$x@0 () T@opn)
(declare-fun call33104formal@$y@0 () T@opn)
(declare-fun %lbl%@142021 () Bool)
(declare-fun %lbl%@142026 () Bool)
(declare-fun %lbl%+33209 () Bool)
(declare-fun $Efl@1@@2 () Int)
(declare-fun %lbl%+33208 () Bool)
(declare-fun %lbl%@141607 () Bool)
(declare-fun %lbl%@141610 () Bool)
(declare-fun %lbl%@141810 () Bool)
(declare-fun call33080formal@$ret@0 () Int)
(declare-fun call33087formal@$x@0 () T@opn)
(declare-fun call33087formal@$y@0 () T@opn)
(declare-fun %lbl%@141887 () Bool)
(declare-fun %lbl%@141892 () Bool)
(declare-fun %lbl%+141081 () Bool)
(push 1)
(set-info :boogie-vc-id PciMemRead32)
(assert (not
(let ((anon9_Else_correct@@2 (=> (! (and %lbl%+33211 true) :lblpos +33211) true)))
(let ((anon10_Else_correct@@1 (=> (! (and %lbl%+33223 true) :lblpos +33223) true)))
(let ((anon11_Else_correct@@2 (=> (! (and %lbl%+33235 true) :lblpos +33235) true)))
(let ((anon12_Else_correct@@2 (=> (! (and %lbl%+33247 true) :lblpos +33247) true)))
(let ((__L56_correct (=> (! (and %lbl%+33250 true) :lblpos +33250) (=> (= call33196formal@$ptr@0 (+ call33130formal@$val@0 (* 1 edx@7))) (and
(! (or %lbl%@142693 $IoMmuEnabled@@0) :lblneg @142693)
(=> $IoMmuEnabled@@0 (and
(! (or %lbl%@142695 (= (select $PciConfigState@@0 $id@@0) 4)) :lblneg @142695)
(=> (= (select $PciConfigState@@0 $id@@0) 4) (and
(! (or %lbl%@142704 (and
(<= (PciMemAddr $id@@0) call33196formal@$ptr@0)
(<= (+ call33196formal@$ptr@0 4) (+ (PciMemAddr $id@@0) (PciMemSize $id@@0))))) :lblneg @142704)
(=> (and
(<= (PciMemAddr $id@@0) call33196formal@$ptr@0)
(<= (+ call33196formal@$ptr@0 4) (+ (PciMemAddr $id@@0) (PciMemSize $id@@0)))) (=> (PciMemLoaded $id@@0 call33196formal@$ptr@0 call33196formal@$val@0) (=> (and
(word call33196formal@$val@0)
(= call33199formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@142759 (= (ReturnToAddr (select $Mem@@3 esp)) call33199formal@$oldRA@0)) :lblneg @142759)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33199formal@$oldRA@0) (and
(! (or %lbl%@142770 (Aligned esp)) :lblneg @142770)
(=> (Aligned esp) (=> (and
(= esp@0@@16 (+ esp 4))
(Aligned esp@0@@16)) (and
(! (or %lbl%@142801 (= esp@0@@16 (+ esp 4))) :lblneg @142801)
(=> (= esp@0@@16 (+ esp 4)) (and
(! (or %lbl%@142809 (PciMemLoaded $id@@0 (+ (PciMemAddr $id@@0) $offset@@0) call33196formal@$val@0)) :lblneg @142809)
(=> (PciMemLoaded $id@@0 (+ (PciMemAddr $id@@0) $offset@@0) call33196formal@$val@0) true)))))))))))))))))))))
(let ((anon12_Then_correct@@2 (=> (! (and %lbl%+33245 true) :lblpos +33245) (=> (and
(Jbe $Efl@15)
(= edx@7 edx@5@@1)) __L56_correct))))
(let ((__L55_correct (=> (! (and %lbl%+33244 true) :lblpos +33244) (=> (= call33155formal@$ptr@0 (+ (+ call33117formal@$ret@0 (* 8 ecx@5@@1)) 4)) (and
(! (or %lbl%@142408 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @142408)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@142438 (pciAddr call33155formal@$ptr@0)) :lblneg @142438)
(=> (pciAddr call33155formal@$ptr@0) (=> (and
(= (select $Mem@@3 call33155formal@$ptr@0) (select $pciMem@@1 call33155formal@$ptr@0))
(= call33164formal@$ptr@0 (+ (+ call33117formal@$ret@0 (* 8 ecx@5@@1)) 4))) (and
(! (or %lbl%@142471 (PtrOk call33164formal@$ptr@0)) :lblneg @142471)
(=> (PtrOk call33164formal@$ptr@0) (=> (word call33164formal@$val@0) (=> (and
(= call33164formal@$val@0 (select $Mem@@3 call33164formal@$ptr@0))
(= call33167formal@$ret@0 edx@5@@1)) (=> (and
(word (+ call33167formal@$ret@0 4))
(= call33171formal@$ret@0 (+ call33167formal@$ret@0 4))
(= call33178formal@$x@0 (OpnReg call33171formal@$ret@0))
(= call33178formal@$y@0 (OpnReg call33164formal@$val@0))) (and
(! (or %lbl%@142574 (OpnOk $Mem@@3 call33178formal@$x@0)) :lblneg @142574)
(=> (OpnOk $Mem@@3 call33178formal@$x@0) (and
(! (or %lbl%@142579 (OpnOk $Mem@@3 call33178formal@$y@0)) :lblneg @142579)
(=> (OpnOk $Mem@@3 call33178formal@$y@0) (=> (FlagsCmp $Efl@15 (EvalOpn $Mem@@3 call33178formal@$x@0) (EvalOpn $Mem@@3 call33178formal@$y@0)) (and
anon12_Then_correct@@2
anon12_Else_correct@@2))))))))))))))))))))
(let ((anon11_Then_correct@@2 (=> (! (and %lbl%+33233 true) :lblpos +33233) (=> (Jne $Efl@9@@1) (=> (and
(= ecx@5@@1 ecx@3@@2)
(= edx@5@@1 edx@3@@2)) __L55_correct)))))
(let ((__L54_correct (=> (! (and %lbl%+33232 true) :lblpos +33232) (=> (and
(= call33117formal@$ret@0 PciLo@@0)
(= call33123formal@$ptr@0 (+ call33117formal@$ret@0 (* 8 ecx@3@@2)))) (and
(! (or %lbl%@142172 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @142172)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@142202 (pciAddr call33123formal@$ptr@0)) :lblneg @142202)
(=> (pciAddr call33123formal@$ptr@0) (=> (and
(= (select $Mem@@3 call33123formal@$ptr@0) (select $pciMem@@1 call33123formal@$ptr@0))
(= call33130formal@$ptr@0 (+ call33117formal@$ret@0 (* 8 ecx@3@@2)))) (and
(! (or %lbl%@142231 (PtrOk call33130formal@$ptr@0)) :lblneg @142231)
(=> (PtrOk call33130formal@$ptr@0) (=> (and
(word call33130formal@$val@0)
(= call33130formal@$val@0 (select $Mem@@3 call33130formal@$ptr@0))
(= call33137formal@$x@0 (OpnReg call33130formal@$val@0))
(= call33137formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@142279 (OpnOk $Mem@@3 call33137formal@$x@0)) :lblneg @142279)
(=> (OpnOk $Mem@@3 call33137formal@$x@0) (and
(! (or %lbl%@142284 (OpnOk $Mem@@3 call33137formal@$y@0)) :lblneg @142284)
(=> (OpnOk $Mem@@3 call33137formal@$y@0) (=> (FlagsCmp $Efl@9@@1 (EvalOpn $Mem@@3 call33137formal@$x@0) (EvalOpn $Mem@@3 call33137formal@$y@0)) (and
anon11_Then_correct@@2
anon11_Else_correct@@2))))))))))))))))))
(let ((anon10_Then_correct@@1 (=> (! (and %lbl%+33221 true) :lblpos +33221) (=> (Jb $Efl@4) (=> (and
(= edx@3@@2 edx@1@@2)
(= ecx@3@@2 ecx@1@@5)) __L54_correct)))))
(let ((__L53_correct (=> (! (and %lbl%+33220 true) :lblpos +33220) (=> (and
(= call33104formal@$x@0 (OpnReg ecx@1@@5))
(= call33104formal@$y@0 (OpnReg 65536))) (and
(! (or %lbl%@142021 (OpnOk $Mem@@3 call33104formal@$x@0)) :lblneg @142021)
(=> (OpnOk $Mem@@3 call33104formal@$x@0) (and
(! (or %lbl%@142026 (OpnOk $Mem@@3 call33104formal@$y@0)) :lblneg @142026)
(=> (OpnOk $Mem@@3 call33104formal@$y@0) (=> (FlagsCmp $Efl@4 (EvalOpn $Mem@@3 call33104formal@$x@0) (EvalOpn $Mem@@3 call33104formal@$y@0)) (and
anon10_Then_correct@@1
anon10_Else_correct@@1))))))))))
(let ((anon9_Then_correct@@2 (=> (! (and %lbl%+33209 true) :lblpos +33209) (=> (Jne $Efl@1@@2) (=> (and
(= edx@1@@2 edx)
(= ecx@1@@5 ecx)) __L53_correct)))))
(let ((anon0_correct@@28 (=> (! (and %lbl%+33208 true) :lblpos +33208) (and
(! (or %lbl%@141607 (isStack $S@@0)) :lblneg @141607)
(=> (isStack $S@@0) (and
(! (or %lbl%@141610 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @141610)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $S@@0 CurrentStack)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (=> (and
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(forall (($IoMmuEnabled@@4 Bool) ($PciConfigState@@4 (Array Int Int)) (DmaAddr@@4 Int) ($pciMem@@5 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@4 $PciConfigState@@4 DmaAddr@@4 $pciMem@@5) (_IoInv $IoMmuEnabled@@4 $PciConfigState@@4 DmaAddr@@4 $pciMem@@5))
 :qid |Commonib.268:17|
 :skolemid |225|
))) (and
(! (or %lbl%@141810 (and
(TV $id@@0)
(TV ?pciLo)
(TO (* 2 ecx))
(TO (+ (* 2 ecx) 1)))) :lblneg @141810)
(=> (and
(TV $id@@0)
(TV ?pciLo)
(TO (* 2 ecx))
(TO (+ (* 2 ecx) 1))) (=> (= call33080formal@$ret@0 DmaAddr@@0) (=> (and
(= call33087formal@$x@0 (OpnReg call33080formal@$ret@0))
(= call33087formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@141887 (OpnOk $Mem@@3 call33087formal@$x@0)) :lblneg @141887)
(=> (OpnOk $Mem@@3 call33087formal@$x@0) (and
(! (or %lbl%@141892 (OpnOk $Mem@@3 call33087formal@$y@0)) :lblneg @141892)
(=> (OpnOk $Mem@@3 call33087formal@$y@0) (=> (FlagsCmp $Efl@1@@2 (EvalOpn $Mem@@3 call33087formal@$x@0) (EvalOpn $Mem@@3 call33087formal@$y@0)) (and
anon9_Then_correct@@2
anon9_Else_correct@@2)))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@28 (=> (! (and %lbl%+141081 true) :lblpos +141081) (=> (and
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
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@28))))
PreconditionGeneratedEntry_correct@@28))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33447 () Bool)
(declare-fun %lbl%+33459 () Bool)
(declare-fun %lbl%+33471 () Bool)
(declare-fun %lbl%+33483 () Bool)
(declare-fun %lbl%+33486 () Bool)
(declare-fun call33419formal@$ptr@0 () Int)
(declare-fun %lbl%@144661 () Bool)
(declare-fun %lbl%@144691 () Bool)
(declare-fun call33424formal@$ptr@0 () Int)
(declare-fun %lbl%@144725 () Bool)
(declare-fun call33424formal@$val@0 () Int)
(declare-fun call33432formal@$ptr@0 () Int)
(declare-fun call33356formal@$val@0 () Int)
(declare-fun edx@7@@0 () Int)
(declare-fun %lbl%@144775 () Bool)
(declare-fun %lbl%@144777 () Bool)
(declare-fun $id@@1 () Int)
(declare-fun %lbl%@144786 () Bool)
(declare-fun %lbl%@144809 () Bool)
(declare-fun PciMemStored (Int Int Int) Bool)
(declare-fun call33435formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@144834 () Bool)
(declare-fun %lbl%@144845 () Bool)
(declare-fun esp@0@@17 () Int)
(declare-fun %lbl%@144876 () Bool)
(declare-fun %lbl%@144884 () Bool)
(declare-fun $offset@@1 () Int)
(declare-fun $val () Int)
(declare-fun %lbl%+33481 () Bool)
(declare-fun $Efl@16@@0 () Int)
(declare-fun edx@5@@2 () Int)
(declare-fun %lbl%+33480 () Bool)
(declare-fun call33381formal@$ptr@0 () Int)
(declare-fun call33343formal@$ret@0 () Int)
(declare-fun ecx@5@@2 () Int)
(declare-fun %lbl%@144378 () Bool)
(declare-fun %lbl%@144408 () Bool)
(declare-fun call33390formal@$ptr@0 () Int)
(declare-fun %lbl%@144441 () Bool)
(declare-fun call33390formal@$val@0 () Int)
(declare-fun call33393formal@$ret@0 () Int)
(declare-fun call33397formal@$ret@0 () Int)
(declare-fun call33404formal@$x@0 () T@opn)
(declare-fun call33404formal@$y@0 () T@opn)
(declare-fun %lbl%@144544 () Bool)
(declare-fun %lbl%@144549 () Bool)
(declare-fun %lbl%+33469 () Bool)
(declare-fun $Efl@10@@1 () Int)
(declare-fun ecx@3@@3 () Int)
(declare-fun edx@3@@3 () Int)
(declare-fun %lbl%+33468 () Bool)
(declare-fun call33349formal@$ptr@0 () Int)
(declare-fun %lbl%@144142 () Bool)
(declare-fun %lbl%@144172 () Bool)
(declare-fun call33356formal@$ptr@0 () Int)
(declare-fun %lbl%@144201 () Bool)
(declare-fun call33363formal@$x@0 () T@opn)
(declare-fun call33363formal@$y@0 () T@opn)
(declare-fun %lbl%@144249 () Bool)
(declare-fun %lbl%@144254 () Bool)
(declare-fun %lbl%+33457 () Bool)
(declare-fun $Efl@5@@0 () Int)
(declare-fun edx@1@@3 () Int)
(declare-fun ecx@1@@6 () Int)
(declare-fun %lbl%+33456 () Bool)
(declare-fun call33330formal@$x@0 () T@opn)
(declare-fun call33330formal@$y@0 () T@opn)
(declare-fun %lbl%@143991 () Bool)
(declare-fun %lbl%@143996 () Bool)
(declare-fun %lbl%+33445 () Bool)
(declare-fun $Efl@2@@0 () Int)
(declare-fun %lbl%+33444 () Bool)
(declare-fun %lbl%@143459 () Bool)
(declare-fun %lbl%@143462 () Bool)
(declare-fun %lbl%@143662 () Bool)
(declare-fun %lbl%@143696 () Bool)
(declare-fun call33298formal@$ptr@0 () Int)
(declare-fun %lbl%@143721 () Bool)
(declare-fun %lbl%@143751 () Bool)
(declare-fun call33303formal@$ptr@0 () Int)
(declare-fun %lbl%@143785 () Bool)
(declare-fun call33303formal@$val@0 () Int)
(declare-fun call33306formal@$ret@0 () Int)
(declare-fun call33313formal@$x@0 () T@opn)
(declare-fun call33313formal@$y@0 () T@opn)
(declare-fun %lbl%@143857 () Bool)
(declare-fun %lbl%@143862 () Bool)
(declare-fun %lbl%+142827 () Bool)
(push 1)
(set-info :boogie-vc-id PciMemWrite32)
(assert (not
(let ((anon9_Else_correct@@3 (=> (! (and %lbl%+33447 true) :lblpos +33447) true)))
(let ((anon10_Else_correct@@2 (=> (! (and %lbl%+33459 true) :lblpos +33459) true)))
(let ((anon11_Else_correct@@3 (=> (! (and %lbl%+33471 true) :lblpos +33471) true)))
(let ((anon12_Else_correct@@3 (=> (! (and %lbl%+33483 true) :lblpos +33483) true)))
(let ((__L60_correct (=> (! (and %lbl%+33486 true) :lblpos +33486) (=> (= call33419formal@$ptr@0 (+ esp 4)) (and
(! (or %lbl%@144661 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @144661)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@144691 (fAddr $S@@0 call33419formal@$ptr@0)) :lblneg @144691)
(=> (fAddr $S@@0 call33419formal@$ptr@0) (=> (= (select $Mem@@3 call33419formal@$ptr@0) (select (select $fMems@@4 $S@@0) call33419formal@$ptr@0)) (=> (and
(memAddr call33419formal@$ptr@0)
(= call33424formal@$ptr@0 (+ esp 4))) (and
(! (or %lbl%@144725 (PtrOk call33424formal@$ptr@0)) :lblneg @144725)
(=> (PtrOk call33424formal@$ptr@0) (=> (word call33424formal@$val@0) (=> (and
(= call33424formal@$val@0 (select $Mem@@3 call33424formal@$ptr@0))
(= call33432formal@$ptr@0 (+ call33356formal@$val@0 (* 1 edx@7@@0)))) (and
(! (or %lbl%@144775 $IoMmuEnabled@@0) :lblneg @144775)
(=> $IoMmuEnabled@@0 (and
(! (or %lbl%@144777 (= (select $PciConfigState@@0 $id@@1) 4)) :lblneg @144777)
(=> (= (select $PciConfigState@@0 $id@@1) 4) (and
(! (or %lbl%@144786 (and
(<= (PciMemAddr $id@@1) call33432formal@$ptr@0)
(<= (+ call33432formal@$ptr@0 4) (+ (PciMemAddr $id@@1) (PciMemSize $id@@1))))) :lblneg @144786)
(=> (and
(<= (PciMemAddr $id@@1) call33432formal@$ptr@0)
(<= (+ call33432formal@$ptr@0 4) (+ (PciMemAddr $id@@1) (PciMemSize $id@@1)))) (and
(! (or %lbl%@144809 (word call33424formal@$val@0)) :lblneg @144809)
(=> (word call33424formal@$val@0) (=> (and
(PciMemStored $id@@1 call33432formal@$ptr@0 call33424formal@$val@0)
(= call33435formal@$oldRA@0 $RET@@0)) (and
(! (or %lbl%@144834 (= (ReturnToAddr (select $Mem@@3 esp)) call33435formal@$oldRA@0)) :lblneg @144834)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33435formal@$oldRA@0) (and
(! (or %lbl%@144845 (Aligned esp)) :lblneg @144845)
(=> (Aligned esp) (=> (and
(= esp@0@@17 (+ esp 4))
(Aligned esp@0@@17)) (and
(! (or %lbl%@144876 (= esp@0@@17 (+ esp 4))) :lblneg @144876)
(=> (= esp@0@@17 (+ esp 4)) (and
(! (or %lbl%@144884 (PciMemStored $id@@1 (+ (PciMemAddr $id@@1) $offset@@1) $val)) :lblneg @144884)
(=> (PciMemStored $id@@1 (+ (PciMemAddr $id@@1) $offset@@1) $val) true))))))))))))))))))))))))))))))))
(let ((anon12_Then_correct@@3 (=> (! (and %lbl%+33481 true) :lblpos +33481) (=> (and
(Jbe $Efl@16@@0)
(= edx@7@@0 edx@5@@2)) __L60_correct))))
(let ((__L59_correct (=> (! (and %lbl%+33480 true) :lblpos +33480) (=> (= call33381formal@$ptr@0 (+ (+ call33343formal@$ret@0 (* 8 ecx@5@@2)) 4)) (and
(! (or %lbl%@144378 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @144378)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@144408 (pciAddr call33381formal@$ptr@0)) :lblneg @144408)
(=> (pciAddr call33381formal@$ptr@0) (=> (and
(= (select $Mem@@3 call33381formal@$ptr@0) (select $pciMem@@1 call33381formal@$ptr@0))
(= call33390formal@$ptr@0 (+ (+ call33343formal@$ret@0 (* 8 ecx@5@@2)) 4))) (and
(! (or %lbl%@144441 (PtrOk call33390formal@$ptr@0)) :lblneg @144441)
(=> (PtrOk call33390formal@$ptr@0) (=> (word call33390formal@$val@0) (=> (and
(= call33390formal@$val@0 (select $Mem@@3 call33390formal@$ptr@0))
(= call33393formal@$ret@0 edx@5@@2)) (=> (and
(word (+ call33393formal@$ret@0 4))
(= call33397formal@$ret@0 (+ call33393formal@$ret@0 4))
(= call33404formal@$x@0 (OpnReg call33397formal@$ret@0))
(= call33404formal@$y@0 (OpnReg call33390formal@$val@0))) (and
(! (or %lbl%@144544 (OpnOk $Mem@@3 call33404formal@$x@0)) :lblneg @144544)
(=> (OpnOk $Mem@@3 call33404formal@$x@0) (and
(! (or %lbl%@144549 (OpnOk $Mem@@3 call33404formal@$y@0)) :lblneg @144549)
(=> (OpnOk $Mem@@3 call33404formal@$y@0) (=> (FlagsCmp $Efl@16@@0 (EvalOpn $Mem@@3 call33404formal@$x@0) (EvalOpn $Mem@@3 call33404formal@$y@0)) (and
anon12_Then_correct@@3
anon12_Else_correct@@3))))))))))))))))))))
(let ((anon11_Then_correct@@3 (=> (! (and %lbl%+33469 true) :lblpos +33469) (=> (Jne $Efl@10@@1) (=> (and
(= ecx@5@@2 ecx@3@@3)
(= edx@5@@2 edx@3@@3)) __L59_correct)))))
(let ((__L58_correct (=> (! (and %lbl%+33468 true) :lblpos +33468) (=> (and
(= call33343formal@$ret@0 PciLo@@0)
(= call33349formal@$ptr@0 (+ call33343formal@$ret@0 (* 8 ecx@3@@3)))) (and
(! (or %lbl%@144142 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @144142)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@144172 (pciAddr call33349formal@$ptr@0)) :lblneg @144172)
(=> (pciAddr call33349formal@$ptr@0) (=> (and
(= (select $Mem@@3 call33349formal@$ptr@0) (select $pciMem@@1 call33349formal@$ptr@0))
(= call33356formal@$ptr@0 (+ call33343formal@$ret@0 (* 8 ecx@3@@3)))) (and
(! (or %lbl%@144201 (PtrOk call33356formal@$ptr@0)) :lblneg @144201)
(=> (PtrOk call33356formal@$ptr@0) (=> (and
(word call33356formal@$val@0)
(= call33356formal@$val@0 (select $Mem@@3 call33356formal@$ptr@0))
(= call33363formal@$x@0 (OpnReg call33356formal@$val@0))
(= call33363formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@144249 (OpnOk $Mem@@3 call33363formal@$x@0)) :lblneg @144249)
(=> (OpnOk $Mem@@3 call33363formal@$x@0) (and
(! (or %lbl%@144254 (OpnOk $Mem@@3 call33363formal@$y@0)) :lblneg @144254)
(=> (OpnOk $Mem@@3 call33363formal@$y@0) (=> (FlagsCmp $Efl@10@@1 (EvalOpn $Mem@@3 call33363formal@$x@0) (EvalOpn $Mem@@3 call33363formal@$y@0)) (and
anon11_Then_correct@@3
anon11_Else_correct@@3))))))))))))))))))
(let ((anon10_Then_correct@@2 (=> (! (and %lbl%+33457 true) :lblpos +33457) (=> (Jb $Efl@5@@0) (=> (and
(= edx@3@@3 edx@1@@3)
(= ecx@3@@3 ecx@1@@6)) __L58_correct)))))
(let ((__L57_correct (=> (! (and %lbl%+33456 true) :lblpos +33456) (=> (and
(= call33330formal@$x@0 (OpnReg ecx@1@@6))
(= call33330formal@$y@0 (OpnReg 65536))) (and
(! (or %lbl%@143991 (OpnOk $Mem@@3 call33330formal@$x@0)) :lblneg @143991)
(=> (OpnOk $Mem@@3 call33330formal@$x@0) (and
(! (or %lbl%@143996 (OpnOk $Mem@@3 call33330formal@$y@0)) :lblneg @143996)
(=> (OpnOk $Mem@@3 call33330formal@$y@0) (=> (FlagsCmp $Efl@5@@0 (EvalOpn $Mem@@3 call33330formal@$x@0) (EvalOpn $Mem@@3 call33330formal@$y@0)) (and
anon10_Then_correct@@2
anon10_Else_correct@@2))))))))))
(let ((anon9_Then_correct@@3 (=> (! (and %lbl%+33445 true) :lblpos +33445) (=> (Jne $Efl@2@@0) (=> (and
(= edx@1@@3 edx)
(= ecx@1@@6 ecx)) __L57_correct)))))
(let ((anon0_correct@@29 (=> (! (and %lbl%+33444 true) :lblpos +33444) (and
(! (or %lbl%@143459 (isStack $S@@0)) :lblneg @143459)
(=> (isStack $S@@0) (and
(! (or %lbl%@143462 (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) :lblneg @143462)
(=> (NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0) (=> (and
(= $S@@0 CurrentStack)
(MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) (=> (and
(IoInv $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0 $pciMem@@1)
(= (StackStateTag (select $StackState $S@@0)) (StackTag $S@@0 $tMems@@12))
(=> (IsYielded (select $StackState $S@@0)) (= (select $StackState $S@@0) (StackYielded (StackEbp $S@@0 $tMems@@12) (+ (StackEsp $S@@0 $tMems@@12) 4) (StackRA $S@@0 $tMems@@12 $fMems@@4))))
(forall (($IoMmuEnabled@@5 Bool) ($PciConfigState@@5 (Array Int Int)) (DmaAddr@@5 Int) ($pciMem@@6 (Array Int Int)) ) (! (= (IoInv $IoMmuEnabled@@5 $PciConfigState@@5 DmaAddr@@5 $pciMem@@6) (_IoInv $IoMmuEnabled@@5 $PciConfigState@@5 DmaAddr@@5 $pciMem@@6))
 :qid |Commonib.268:17|
 :skolemid |225|
))) (and
(! (or %lbl%@143662 (and
(TV $id@@1)
(TV ?pciLo)
(TO (* 2 ecx))
(TO (+ (* 2 ecx) 1)))) :lblneg @143662)
(=> (and
(TV $id@@1)
(TV ?pciLo)
(TO (* 2 ecx))
(TO (+ (* 2 ecx) 1))) (and
(! (or %lbl%@143696 (and
(TO 1)
(TV esp))) :lblneg @143696)
(=> (and
(TO 1)
(TV esp)) (=> (= call33298formal@$ptr@0 (+ esp 4)) (and
(! (or %lbl%@143721 (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0)) :lblneg @143721)
(=> (MemInv $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(! (or %lbl%@143751 (fAddr $S@@0 call33298formal@$ptr@0)) :lblneg @143751)
(=> (fAddr $S@@0 call33298formal@$ptr@0) (=> (= (select $Mem@@3 call33298formal@$ptr@0) (select (select $fMems@@4 $S@@0) call33298formal@$ptr@0)) (=> (and
(memAddr call33298formal@$ptr@0)
(= call33303formal@$ptr@0 (+ esp 4))) (and
(! (or %lbl%@143785 (PtrOk call33303formal@$ptr@0)) :lblneg @143785)
(=> (PtrOk call33303formal@$ptr@0) (=> (word call33303formal@$val@0) (=> (and
(= call33303formal@$val@0 (select $Mem@@3 call33303formal@$ptr@0))
(= call33306formal@$ret@0 DmaAddr@@0)
(= call33313formal@$x@0 (OpnReg call33306formal@$ret@0))
(= call33313formal@$y@0 (OpnReg 0))) (and
(! (or %lbl%@143857 (OpnOk $Mem@@3 call33313formal@$x@0)) :lblneg @143857)
(=> (OpnOk $Mem@@3 call33313formal@$x@0) (and
(! (or %lbl%@143862 (OpnOk $Mem@@3 call33313formal@$y@0)) :lblneg @143862)
(=> (OpnOk $Mem@@3 call33313formal@$y@0) (=> (FlagsCmp $Efl@2@@0 (EvalOpn $Mem@@3 call33313formal@$x@0) (EvalOpn $Mem@@3 call33313formal@$y@0)) (and
anon9_Then_correct@@3
anon9_Else_correct@@3))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@29 (=> (! (and %lbl%+142827 true) :lblpos +142827) (=> (and
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
(NucleusInv $S@@0 $StackState $toAbs@@4 $AbsMem@@3 CurrentStack $gcSlice@@3 BF BT HeapLo Fi Fk Fl Ti Tj Tk Tl $Mem@@3 $sMem@@5 $dMem@@0 $pciMem@@1 $tMems@@12 $fMems@@4 $gcMem@@4 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0 $FrameCounts@@2 $FrameAddrs@@2 $FrameLayouts@@2 $FrameSlices@@2 $FrameAbss@@2 $FrameOffsets@@2 $IoMmuEnabled@@0 $PciConfigState@@0 DmaAddr@@0)) anon0_correct@@29))))
PreconditionGeneratedEntry_correct@@29))))))))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33493 () Bool)
(declare-fun call33490formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@145005 () Bool)
(declare-fun %lbl%@145016 () Bool)
(declare-fun esp@0@@18 () Int)
(declare-fun %lbl%@145047 () Bool)
(declare-fun %lbl%+144903 () Bool)
(push 1)
(set-info :boogie-vc-id CycleCounter)
(assert (not
(let ((anon0_correct@@30 (=> (! (and %lbl%+33493 true) :lblpos +33493) (=> (= call33490formal@$oldRA@0 $RET@@0) (and
(! (or %lbl%@145005 (= (ReturnToAddr (select $Mem@@3 esp)) call33490formal@$oldRA@0)) :lblneg @145005)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33490formal@$oldRA@0) (and
(! (or %lbl%@145016 (Aligned esp)) :lblneg @145016)
(=> (Aligned esp) (=> (and
(= esp@0@@18 (+ esp 4))
(Aligned esp@0@@18)) (and
(! (or %lbl%@145047 (= esp@0@@18 (+ esp 4))) :lblneg @145047)
(=> (= esp@0@@18 (+ esp 4)) true)))))))))))
(let ((PreconditionGeneratedEntry_correct@@30 (=> (! (and %lbl%+144903 true) :lblpos +144903) (=> (and
(= $RET@@0 (ReturnToAddr (select $Mem@@3 esp)))
(SpRequire $S@@0 esp 4)) anon0_correct@@30))))
PreconditionGeneratedEntry_correct@@30))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+33534 () Bool)
(declare-fun %lbl%+33537 () Bool)
(declare-fun call33513formal@$ret@0 () Int)
(declare-fun edx@1@@4 () Int)
(declare-fun call33518formal@$addr@0 () Int)
(declare-fun ecx@1@@7 () Int)
(declare-fun %lbl%@145420 () Bool)
(declare-fun call33518formal@$ret@0 () Int)
(declare-fun %lbl%@145442 () Bool)
(declare-fun call33522formal@$oldRA@0 () T@ReturnTo)
(declare-fun %lbl%@145490 () Bool)
(declare-fun %lbl%@145501 () Bool)
(declare-fun esp@0@@19 () Int)
(declare-fun %lbl%@145532 () Bool)
(declare-fun %lbl%+33532 () Bool)
(declare-fun $Efl@0@@2 () Int)
(declare-fun %lbl%+33531 () Bool)
(declare-fun call33500formal@$x@0 () T@opn)
(declare-fun call33500formal@$y@0 () T@opn)
(declare-fun %lbl%@145270 () Bool)
(declare-fun %lbl%@145275 () Bool)
(declare-fun %lbl%+145056 () Bool)
(push 1)
(set-info :boogie-vc-id DebugPrintHex)
(assert (not
(let ((anon3_Else_correct@@5 (=> (! (and %lbl%+33534 true) :lblpos +33534) true)))
(let ((__L61_correct (=> (! (and %lbl%+33537 true) :lblpos +33537) (=> (and
(= call33513formal@$ret@0 edx@1@@4)
(= call33518formal@$addr@0 (+ ecx@1@@7 ecx@1@@7))) (and
(! (or %lbl%@145420 (word call33518formal@$addr@0)) :lblneg @145420)
(=> (word call33518formal@$addr@0) (=> (= call33518formal@$ret@0 call33518formal@$addr@0) (and
(! (or %lbl%@145442 (and
(<= 0 call33518formal@$ret@0)
(<= call33518formal@$ret@0 (- 160 16)))) :lblneg @145442)
(=> (and
(<= 0 call33518formal@$ret@0)
(<= call33518formal@$ret@0 (- 160 16))) (=> (= call33522formal@$oldRA@0 $RET@@0) (and
(! (or %lbl%@145490 (= (ReturnToAddr (select $Mem@@3 esp)) call33522formal@$oldRA@0)) :lblneg @145490)
(=> (= (ReturnToAddr (select $Mem@@3 esp)) call33522formal@$oldRA@0) (and
(! (or %lbl%@145501 (Aligned esp)) :lblneg @145501)
(=> (Aligned esp) (=> (and
(= esp@0@@19 (+ esp 4))
(Aligned esp@0@@19)) (and
(! (or %lbl%@145532 (= esp@0@@19 (+ esp 4))) :lblneg @145532)
(=> (= esp@0@@19 (+ esp 4)) true)))))))))))))))))
(let ((anon3_Then_correct@@5 (=> (! (and %lbl%+33532 true) :lblpos +33532) (=> (Jb $Efl@0@@2) (=> (and
(= edx@1@@4 edx)
(= ecx@1@@7 ecx)) __L61_correct)))))
(let ((anon0_correct@@31 (=> (! (and %lbl%+33531 true) :lblpos +33531) (=> (and
(= call33500formal@$x@0 (OpnReg ecx))
(= call33500formal@$y@0 (OpnReg 72))) (and
(! (or %lbl%@145270 (OpnOk $Mem@@3 call33500formal@$x@0)) :lblneg @145270)
(=> (OpnOk $Mem@@3 call33500formal@$x@0) (and
(! (or %lbl%@145275 (OpnOk $Mem@@3 call33500formal@$y@0)) :lblneg @145275)
(=> (OpnOk $Mem@@3 call33500formal@$y@0) (=> (FlagsCmp $Efl@0@@2 (EvalOpn $Mem@@3 call33500formal@$x@0) (EvalOpn $Mem@@3 call33500formal@$y@0)) (and
anon3_Then_correct@@5
anon3_Else_correct@@5))))))))))
(let ((PreconditionGeneratedEntry_correct@@31 (=> (! (and %lbl%+145056 true) :lblpos +145056) (=> (and
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
