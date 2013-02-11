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
(declare-sort T@Time 0)
(declare-fun reached (Int T@Time) Bool)
(declare-fun %lbl%+12819 () Bool)
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
(assert (forall ((rev (Array Int Int)) (ptr@@14 Int) (q@abs Int) ) (! (= (Pointer rev ptr@@14 q@abs) (and
(gcAddr ptr@@14)
(Aligned ptr@@14)
(not (= q@abs NO_ABS))
(= (select rev ptr@@14) q@abs)))
 :qid |GcMemory.38:19|
 :skolemid |94|
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
 :skolemid |95|
 :pattern ( (InteriorValue isPtr rev@@0 val@@1 q@abs@@0 offset))
)))
(assert (forall ((isPtr@@0 Bool) (rev@@1 (Array Int Int)) (val@@2 Int) (q@abs@@1 Int) ) (! (= (Value isPtr@@0 rev@@1 val@@2 q@abs@@1) (InteriorValue isPtr@@0 rev@@1 val@@2 q@abs@@1 0))
 :qid |GcMemory.55:17|
 :skolemid |96|
 :pattern ( (Value isPtr@@0 rev@@1 val@@2 q@abs@@1))
)))
(assert (forall (($toAbs (Array Int Int)) ) (! (= (WellFormed $toAbs) (forall ((i1@@0 Int) (i2@@0 Int) ) (! (=> (and
(TV i1@@0)
(TV i2@@0)
(gcAddr i1@@0)
(gcAddr i2@@0)
(not (= i1@@0 i2@@0))
(not (= (select $toAbs i1@@0) NO_ABS))
(not (= (select $toAbs i2@@0) NO_ABS))) (not (= (select $toAbs i1@@0) (select $toAbs i2@@0))))
 :qid |GcMemory.83:11|
 :skolemid |97|
 :pattern ( (TV i1@@0) (TV i2@@0))
)))
 :qid |GcMemory.80:22|
 :skolemid |98|
 :pattern ( (WellFormed $toAbs))
)))
(assert (forall ((slot Int) ) (! (= (TSlot slot) true)
 :qid |Bartokib.10:32|
 :skolemid |99|
 :pattern ( (TSlot slot))
)))
(assert (forall ((table Int) ) (! (= (TT table) true)
 :qid |Bartokib.13:29|
 :skolemid |100|
 :pattern ( (TT table))
)))
(assert (forall ((x@@6 Int) (i@@25 Int) ) (! (= (getBit x@@6 i@@25) (= 1 (q@and (shr x@@6 i@@25) 1)))
 :qid |Bartokib.19:18|
 :skolemid |101|
 :pattern ( (getBit x@@6 i@@25))
)))
(assert (forall ((x@@7 Int) (i@@26 Int) ) (! (= (getNib x@@7 i@@26) (q@and (shr x@@7 i@@26) 15))
 :qid |Bartokib.20:18|
 :skolemid |102|
 :pattern ( (getNib x@@7 i@@26))
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
 :skolemid |103|
 :pattern ( (isOtherTag t))
)))
(assert (forall ((t@@0 Int) ) (! (= (isVarSize t@@0) (or
(= t@@0 ?PTR_VECTOR_TAG)
(= t@@0 ?OTHER_VECTOR_TAG)
(= t@@0 ?PTR_ARRAY_TAG)
(= t@@0 ?OTHER_ARRAY_TAG)
(= t@@0 ?STRING_TAG)))
 :qid |Bartokib.40:21|
 :skolemid |104|
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
 :skolemid |105|
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
 :skolemid |106|
 :pattern ( (mask vt))
)))
(assert (forall ((vt@@0 Int) ) (! (= (tag@@1 vt@@0) (q@and (mask vt@@0) 15))
 :qid |Bartokib.67:15|
 :skolemid |107|
 :pattern ( (tag@@1 vt@@0))
)))
(assert (forall ((vt@@1 Int) ) (! (= (baseLength vt@@1) (ro32 (+ vt@@1 ?VT_BASE_LENGTH)))
 :qid |Bartokib.68:22|
 :skolemid |108|
 :pattern ( (baseLength vt@@1))
)))
(assert (forall ((vt@@2 Int) ) (! (= (arrayElementSize vt@@2) (ro32 (+ vt@@2 ?VT_ARRAY_ELEMENT_SIZE)))
 :qid |Bartokib.69:28|
 :skolemid |109|
 :pattern ( (arrayElementSize vt@@2))
)))
(assert (forall ((vt@@3 Int) ) (! (= (arrayElementClass vt@@3) (ro32 (+ vt@@3 ?VT_ARRAY_ELEMENT_CLASS)))
 :qid |Bartokib.70:29|
 :skolemid |110|
 :pattern ( (arrayElementClass vt@@3))
)))
(assert (forall ((vt@@4 Int) ) (! (= (arrayOf vt@@4) (ro32 (+ vt@@4 ?VT_ARRAY_OF)))
 :qid |Bartokib.71:19|
 :skolemid |111|
 :pattern ( (arrayOf vt@@4))
)))
(assert (forall ((vt@@5 Int) ) (! (= (baseWords vt@@5) (shr (baseLength vt@@5) 2))
 :qid |Bartokib.73:21|
 :skolemid |112|
 :pattern ( (baseWords vt@@5))
)))
(assert (forall ((vt@@6 Int) ) (! (= (arrayElementWords vt@@6) (shr (arrayElementSize vt@@6) 2))
 :qid |Bartokib.74:29|
 :skolemid |113|
 :pattern ( (arrayElementWords vt@@6))
)))
(assert (= ?TYPE_STRUCT 3))
(assert (forall ((q@abs@@2 Int) (vt@@7 Int) (j@@1 Int) (field Int) ) (! (= (Sparse1 q@abs@@2 vt@@7 j@@1 field) (and
(= (VFieldPtr q@abs@@2 j@@1) (not (= (fieldToSlot vt@@7 field) 0)))
(=> (not (= (fieldToSlot vt@@7 field) 0)) (and
(between 1 8 (fieldToSlot vt@@7 field))
(= (- (getNib (mask vt@@7) (* 4 (fieldToSlot vt@@7 field))) 1) field)))))
 :qid |Bartokib.85:19|
 :skolemid |114|
 :pattern ( (Sparse1 q@abs@@2 vt@@7 j@@1 field))
)))
(assert (forall ((vt@@8 Int) (nFields Int) ) (! (= (Sparse2 vt@@8 nFields) (forall ((k Int) ) (! (=> (TSlot k) (=> (and
(<= 1 k)
(< k 8)
(not (= (getNib (mask vt@@8) (* 4 k)) 0))) (and
(between 0 nFields (- (getNib (mask vt@@8) (* 4 k)) 1))
(= (fieldToSlot vt@@8 (- (getNib (mask vt@@8) (* 4 k)) 1)) k))))
 :qid |Bartokib.95:11|
 :skolemid |115|
 :pattern ( (TSlot k))
)))
 :qid |Bartokib.92:19|
 :skolemid |116|
 :pattern ( (Sparse2 vt@@8 nFields))
)))
(assert (forall ((q@abs@@3 Int) (vt@@9 Int) ) (! (= (TVT q@abs@@3 vt@@9) true)
 :qid |Bartokib.99:30|
 :skolemid |117|
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
 :skolemid |118|
 :pattern ( (TO j@@2))
)))
(=> (= (tag@@1 vt@@10) ?SPARSE_TAG) (and
(forall ((j@@3 Int) ) (! (=> (TO j@@3) (Sparse1 q@abs@@4 vt@@10 j@@3 (- j@@3 2)))
 :qid |Bartokib.101:271|
 :skolemid |119|
 :pattern ( (TO j@@3))
))
(Sparse2 vt@@10 (- (numFields q@abs@@4) 2))))
(=> (= (tag@@1 vt@@10) ?STRING_TAG) (forall ((j@@4 Int) ) (! (=> (TO j@@4) (not (VFieldPtr q@abs@@4 j@@4)))
 :qid |Bartokib.101:381|
 :skolemid |120|
 :pattern ( (TO j@@4))
)))
(=> (= (tag@@1 vt@@10) ?PTR_VECTOR_TAG) (and
(between 3 (numFields q@abs@@4) (baseWords vt@@10))
(forall ((j@@5 Int) ) (! (=> (TO j@@5) (= (and
(<= (baseWords vt@@10) j@@5)
(< j@@5 (numFields q@abs@@4))) (VFieldPtr q@abs@@4 j@@5)))
 :qid |Bartokib.101:502|
 :skolemid |121|
 :pattern ( (TO j@@5))
))))
(=> (= (tag@@1 vt@@10) ?OTHER_VECTOR_TAG) (and
(not (VFieldPtr q@abs@@4 2))
(inRo (+ (arrayElementClass vt@@10) ?VT_MASK) 4)
(between 3 (numFields q@abs@@4) (baseWords vt@@10))
(=> (not (= (arrayOf vt@@10) ?TYPE_STRUCT)) (forall ((j@@6 Int) ) (! (=> (TO j@@6) (not (VFieldPtr q@abs@@4 j@@6)))
 :qid |Bartokib.101:759|
 :skolemid |122|
 :pattern ( (TO j@@6))
)))
(=> (= (arrayOf vt@@10) ?TYPE_STRUCT) (not (isVarSize (tag@@1 (arrayElementClass vt@@10)))))
(=> (and
(= (arrayOf vt@@10) ?TYPE_STRUCT)
(= (mask (arrayElementClass vt@@10)) ?SPARSE_TAG)) (forall ((j@@7 Int) ) (! (=> (TO j@@7) (not (VFieldPtr q@abs@@4 j@@7)))
 :qid |Bartokib.101:953|
 :skolemid |123|
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
 :skolemid |124|
 :pattern ( (TO m@@0))
)))))
 :qid |Bartokib.101:1076|
 :skolemid |125|
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
 :skolemid |126|
 :pattern ( (TO j@@9))
))))
(=> (= (tag@@1 vt@@10) ?OTHER_ARRAY_TAG) (and
(not (VFieldPtr q@abs@@4 2))
(not (VFieldPtr q@abs@@4 3))
(between 4 (numFields q@abs@@4) (baseWords vt@@10))
(=> (not (= (arrayOf vt@@10) ?TYPE_STRUCT)) (forall ((j@@10 Int) ) (! (=> (TO j@@10) (not (VFieldPtr q@abs@@4 j@@10)))
 :qid |Bartokib.101:1868|
 :skolemid |127|
 :pattern ( (TO j@@10))
)))))
(=> (isOtherTag (tag@@1 vt@@10)) (and
(forall ((j@@11 Int) ) (! (=> (TO j@@11) (and
(= (VFieldPtr q@abs@@4 j@@11) (not (= (fieldToSlot vt@@10 j@@11) 0)))
(=> (not (= (fieldToSlot vt@@10 j@@11) 0)) (and
(between 1 (+ 1 (ro32 (mask vt@@10))) (fieldToSlot vt@@10 j@@11))
(= (+ (ro32 (+ (mask vt@@10) (* 4 (fieldToSlot vt@@10 j@@11)))) 1) j@@11)))))
 :qid |Bartokib.101:1946|
 :skolemid |128|
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
 :skolemid |129|
 :pattern ( (TSlot k@@0))
))
(inRo (mask vt@@10) 4)
(>= (ro32 (mask vt@@10)) 0)))))
 :qid |Bartokib.101:15|
 :skolemid |130|
 :pattern ( (TVT q@abs@@4 vt@@10))
)))
(assert (forall ((i@@27 Int) ) (! (= (pad i@@27) (q@and (+ i@@27 3) (neg 3)))
 :qid |Bartokib.163:15|
 :skolemid |131|
 :pattern ( (pad i@@27))
)))
(assert (forall ((q@abs@@5 Int) ) (! (= (TVL q@abs@@5) true)
 :qid |Bartokib.168:30|
 :skolemid |132|
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
 :skolemid |133|
 :pattern ( (TVL q@abs@@6) (ObjSize q@abs@@6 vt@@11 nElems1 nElems2))
)))
(assert (forall ((layout T@$FrameLayout) (j@@12 Int) ) (! (= (inFrame layout j@@12) (and
(<= (- 0 (frameLayoutLocals layout)) j@@12)
(< j@@12 (+ 2 (frameLayoutArgs layout)))))
 :qid |Bartokib.195:19|
 :skolemid |134|
 :pattern ( (inFrame layout j@@12))
)))
(assert (forall ((l T@$FrameLayout) ) (! (= (TVF l) true)
 :qid |Bartokib.200:30|
 :skolemid |135|
 :pattern ( (TVF l))
)))
(assert (= ?SectionCount 3735928559))
(assert (= ?StaticDataPointerBitMap 3735928559))
(assert (= ?DataSectionEnd 3735928559))
(assert (= ?DataSectionBase 3735928559))
(assert (forall ((section Int) ) (! (= (sectionBase section) (ro32 (+ ?DataSectionBase (* 4 section))))
 :qid |Bartokib.208:23|
 :skolemid |136|
 :pattern ( (sectionBase section))
)))
(assert (forall ((section@@0 Int) ) (! (= (sectionEnd section@@0) (ro32 (+ ?DataSectionEnd (* 4 section@@0))))
 :qid |Bartokib.209:22|
 :skolemid |137|
 :pattern ( (sectionEnd section@@0))
)))
(assert (forall ((s@@5 Int) (j@@13 Int) ) (! (= (TVS s@@5 j@@13) true)
 :qid |Bartokib.214:30|
 :skolemid |138|
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
 :skolemid |139|
 :pattern ( (LookupDesc t@@2 j@@14))
)))
(assert (forall ((t@@3 Int) (j@@15 Int) ) (! (= (InTable t@@3 j@@15) (and
(<= 0 t@@3)
(< t@@3 ?CallSiteTableCount)
(<= 0 j@@15)
(< j@@15 (ro32 (ro32 (+ ?CallSiteSetCount (* 4 t@@3)))))))
 :qid |Bartokib.229:19|
 :skolemid |140|
 :pattern ( (InTable t@@3 j@@15))
)))
(assert (forall ((t@@4 Int) (j@@16 Int) (retaddr Int) ) (! (= (RetAddrAt t@@4 j@@16 retaddr) (and
(InTable t@@4 j@@16)
(between (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@4))) (* 4 j@@16))) (ro32 (+ (ro32 (+ ?ReturnAddressToCallSiteSetNumbers (* 4 t@@4))) (* 4 (+ j@@16 1)))) (- retaddr (ro32 (+ ?CodeBaseStartTable (* 4 t@@4)))))))
 :qid |Bartokib.234:21|
 :skolemid |141|
 :pattern ( (RetAddrAt t@@4 j@@16 retaddr))
)))
(assert (forall ((f@@5 Int) ) (! (= (TVFT f@@5) true)
 :qid |Bartokib.242:31|
 :skolemid |142|
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
 :skolemid |143|
 :pattern ( (TT t@@5) (TO j@@17))
))
(forall ((t@@6 Int) (j@@18 Int) ) (! (=> (and
(TT t@@6)
(TO j@@18)) (=> (RetAddrAt t@@6 j@@18 ra) (= (frameDescriptor (select $FrameLayout (- f@@6 1))) (LookupDesc t@@6 j@@18))))
 :qid |Bartokib.245:353|
 :skolemid |144|
 :pattern ( (TT t@@6) (TO j@@18))
))))))
 :qid |Bartokib.245:15|
 :skolemid |145|
 :pattern ( (TVFT f@@6) (FrameNextInv f@@6 ra nextFp $FrameAddr $FrameLayout))
)))
(assert (forall ((f@@7 Int) (l@@0 T@$FrameLayout) ($FrameAddr@@0 (Array Int Int)) ($FrameSlice (Array Int Int)) ($FrameLayout@@0 (Array Int T@$FrameLayout)) ($FrameAbs (Array Int (Array Int Int))) ($FrameOffset (Array Int Int)) ) (! (= (FrameInv f@@7 l@@0 $FrameAddr@@0 $FrameSlice $FrameLayout@@0 $FrameAbs $FrameOffset) (and
(FrameNextInv f@@7 (select (select $FrameAbs f@@7) 1) (select (select $FrameAbs f@@7) 0) $FrameAddr@@0 $FrameLayout@@0)
(forall ((j@@19 Int) ) (! (=> (TO j@@19) (=> (inFrame l@@0 j@@19) (= (select $FrameSlice (+ (select $FrameAddr@@0 f@@7) (* 4 j@@19))) f@@7)))
 :qid |Bartokib.259:97|
 :skolemid |146|
 :pattern ( (TO j@@19))
))
(forall ((j@@20 Int) ) (! (=> (TO j@@20) (=> (= (select $FrameSlice (+ (select $FrameAddr@@0 f@@7) (* 4 j@@20))) f@@7) (word (+ (select $FrameAddr@@0 f@@7) (* 4 j@@20)))))
 :qid |Bartokib.259:185|
 :skolemid |147|
 :pattern ( (TO j@@20))
))))
 :qid |Bartokib.256:20|
 :skolemid |148|
 :pattern ( (FrameInv f@@7 l@@0 $FrameAddr@@0 $FrameSlice $FrameLayout@@0 $FrameAbs $FrameOffset))
)))
(assert (forall (($FrameCount Int) ($FrameAddr@@1 (Array Int Int)) ($FrameLayout@@1 (Array Int T@$FrameLayout)) ($FrameSlice@@0 (Array Int Int)) ($FrameAbs@@0 (Array Int (Array Int Int))) ($FrameOffset@@0 (Array Int Int)) ) (! (= (StackInv $FrameCount $FrameAddr@@1 $FrameLayout@@1 $FrameSlice@@0 $FrameAbs@@0 $FrameOffset@@0) (forall ((f@@8 Int) ) (! (=> (TV f@@8) (=> (and
(<= 0 f@@8)
(< f@@8 $FrameCount)) (FrameInv f@@8 (select $FrameLayout@@1 f@@8) $FrameAddr@@1 $FrameSlice@@0 $FrameLayout@@1 $FrameAbs@@0 $FrameOffset@@0)))
 :qid |Bartokib.268:11|
 :skolemid |149|
 :pattern ( (TV f@@8))
)))
 :qid |Bartokib.265:20|
 :skolemid |150|
 :pattern ( (StackInv $FrameCount $FrameAddr@@1 $FrameLayout@@1 $FrameSlice@@0 $FrameAbs@@0 $FrameOffset@@0))
)))
(assert (forall (($s Int) ($FrameCounts (Array Int Int)) ($FrameAddrs (Array Int (Array Int Int))) ($FrameLayouts (Array Int (Array Int T@$FrameLayout))) ($FrameSlices (Array Int (Array Int Int))) ($FrameAbss (Array Int (Array Int (Array Int Int)))) ($FrameOffsets (Array Int (Array Int Int))) ) (! (= (StackInvS $s $FrameCounts $FrameAddrs $FrameLayouts $FrameSlices $FrameAbss $FrameOffsets) (StackInv (select $FrameCounts $s) (select $FrameAddrs $s) (select $FrameLayouts $s) (select $FrameSlices $s) (select $FrameAbss $s) (select $FrameOffsets $s)))
 :qid |Bartokib.272:21|
 :skolemid |151|
 :pattern ( (StackInvS $s $FrameCounts $FrameAddrs $FrameLayouts $FrameSlices $FrameAbss $FrameOffsets))
)))
(assert (forall ((s@@6 Int) (i1@@1 Int) (i2@@1 Int) (r (Array Int Int)) ($SectionMem (Array Int Int)) ($SectionAbs (Array Int (Array Int Int))) ) (! (= (SectionInv s@@6 i1@@1 i2@@1 r $SectionMem $SectionAbs) (forall ((j@@21 Int) ) (! (=> (TO j@@21) (=> (and
(<= 0 j@@21)
(< (+ i1@@1 (* 4 j@@21)) i2@@1)) (and
(= (sectionSlice (+ i1@@1 (* 4 j@@21))) s@@6)
(Value (sectionHasPtr s@@6 j@@21) r (select $SectionMem (+ i1@@1 (* 4 j@@21))) (select (select $SectionAbs s@@6) j@@21)))))
 :qid |Bartokib.284:11|
 :skolemid |152|
 :pattern ( (TO j@@21))
)))
 :qid |Bartokib.281:22|
 :skolemid |153|
 :pattern ( (SectionInv s@@6 i1@@1 i2@@1 r $SectionMem $SectionAbs))
)))
(assert (forall ((r@@0 (Array Int Int)) ($SectionMem@@0 (Array Int Int)) ($SectionAbs@@0 (Array Int (Array Int Int))) ) (! (= (StaticInv r@@0 $SectionMem@@0 $SectionAbs@@0) (forall ((s@@7 Int) ) (! (=> (TV s@@7) (=> (and
(<= 0 s@@7)
(< s@@7 ?SectionCount)) (SectionInv s@@7 (sectionBase s@@7) (sectionEnd s@@7) r@@0 $SectionMem@@0 $SectionAbs@@0)))
 :qid |Bartokib.292:11|
 :skolemid |154|
 :pattern ( (TV s@@7))
)))
 :qid |Bartokib.289:21|
 :skolemid |155|
 :pattern ( (StaticInv r@@0 $SectionMem@@0 $SectionAbs@@0))
)))
(assert (forall ((a@@3 Int) (t@@7 T@Time) ) (! (= (reached a@@3 t@@7) true)
 :qid |Reachbpl.5:15|
 :skolemid |165|
)))
(push 1)
(set-info :boogie-vc-id newTime)
(assert (not
(let ((anon0_correct (=> (! (and %lbl%+12819 true) :lblpos +12819) true)))
anon0_correct)
))
(check-sat)
(pop 1)
(declare-fun %lbl%+12280 () Bool)
(declare-fun %lbl%@12939 () Bool)
(declare-fun $FrameAbss@@0 () (Array Int (Array Int (Array Int Int))))
(declare-fun $s@@0 () Int)
(declare-fun $frame () Int)
(declare-fun $j () Int)
(declare-fun $t () T@Time)
(declare-fun %lbl%+12843 () Bool)
(declare-fun $FrameSlices@@0 () (Array Int (Array Int Int)))
(declare-fun $FrameAddrs@@0 () (Array Int (Array Int Int)))
(declare-fun frameHasPtr (T@$FrameLayout Int) Bool)
(declare-fun $FrameLayouts@@0 () (Array Int (Array Int T@$FrameLayout)))
(push 1)
(set-info :boogie-vc-id reachStackRoot)
(assert (not
(let ((anon0_correct@@0 (=> (! (and %lbl%+12280 true) :lblpos +12280) (and
(! (or %lbl%@12939 (reached (select (select (select $FrameAbss@@0 $s@@0) $frame) $j) $t)) :lblneg @12939)
(=> (reached (select (select (select $FrameAbss@@0 $s@@0) $frame) $j) $t) true)))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+12843 true) :lblpos +12843) (=> (and
(= (select (select $FrameSlices@@0 $s@@0) (+ (select (select $FrameAddrs@@0 $s@@0) $frame) (* 4 $j))) $frame)
(frameHasPtr (select (select $FrameLayouts@@0 $s@@0) $frame) $j)) anon0_correct@@0))))
PreconditionGeneratedEntry_correct))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+12292 () Bool)
(declare-fun %lbl%@12981 () Bool)
(declare-fun $SectionAbs@@1 () (Array Int (Array Int Int)))
(declare-fun $s@@1 () Int)
(declare-fun $j@@0 () Int)
(declare-fun $t@@0 () T@Time)
(declare-fun %lbl%+12958 () Bool)
(push 1)
(set-info :boogie-vc-id reachStaticRoot)
(assert (not
(let ((anon0_correct@@1 (=> (! (and %lbl%+12292 true) :lblpos +12292) (and
(! (or %lbl%@12981 (reached (select (select $SectionAbs@@1 $s@@1) $j@@0) $t@@0)) :lblneg @12981)
(=> (reached (select (select $SectionAbs@@1 $s@@1) $j@@0) $t@@0) true)))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+12958 true) :lblpos +12958) (=> (sectionHasPtr $s@@1 $j@@0) anon0_correct@@1))))
PreconditionGeneratedEntry_correct@@0))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+12304 () Bool)
(declare-fun %lbl%@13045 () Bool)
(declare-fun $AbsMem () (Array Int (Array Int Int)))
(declare-fun $a () Int)
(declare-fun $j@@1 () Int)
(declare-fun $t@@1 () T@Time)
(declare-fun %lbl%+12996 () Bool)
(push 1)
(set-info :boogie-vc-id reach)
(assert (not
(let ((anon0_correct@@2 (=> (! (and %lbl%+12304 true) :lblpos +12304) (and
(! (or %lbl%@13045 (reached (select (select $AbsMem $a) $j@@1) $t@@1)) :lblneg @13045)
(=> (reached (select (select $AbsMem $a) $j@@1) $t@@1) true)))))
(let ((PreconditionGeneratedEntry_correct@@1 (=> (! (and %lbl%+12996 true) :lblpos +12996) (=> (and
(reached $a $t@@1)
(not (= (select (select $AbsMem $a) $j@@1) NO_ABS))) anon0_correct@@2))))
PreconditionGeneratedEntry_correct@@1))
))
(check-sat)
(pop 1)
