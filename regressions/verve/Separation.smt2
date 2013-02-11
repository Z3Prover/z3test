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
(declare-fun %lbl%+9046 () Bool)
(declare-fun %lbl%+9050 () Bool)
(declare-fun %lbl%@11600 () Bool)
(declare-fun $Mem@@3 () (Array Int Int))
(declare-fun $tMems@0 () (Array Int (Array Int Int)))
(declare-fun $fMems@0 () (Array Int (Array Int Int)))
(declare-fun call8861formal@$ret@0 () Int)
(declare-fun call8876formal@$ret@0 () Int)
(declare-fun call8891formal@$ret@0 () Int)
(declare-fun call8908formal@$ret@0 () Int)
(declare-fun call8923formal@$ret@0 () Int)
(declare-fun call8938formal@$ret@0 () Int)
(declare-fun call8941formal@$ret@0 () Int)
(declare-fun %lbl%@11617 () Bool)
(declare-fun %lbl%@11623 () Bool)
(declare-fun %lbl%@11627 () Bool)
(declare-fun %lbl%@11631 () Bool)
(declare-fun %lbl%@11635 () Bool)
(declare-fun %lbl%@11639 () Bool)
(declare-fun %lbl%@11643 () Bool)
(declare-fun %lbl%@11647 () Bool)
(declare-fun %lbl%@11651 () Bool)
(declare-fun %lbl%@11656 () Bool)
(declare-fun %lbl%@11661 () Bool)
(declare-fun %lbl%@11666 () Bool)
(declare-fun %lbl%@11671 () Bool)
(declare-fun %lbl%@11676 () Bool)
(declare-fun %lbl%@11681 () Bool)
(declare-fun %lbl%@11686 () Bool)
(declare-fun %lbl%@11703 () Bool)
(declare-fun esp () Int)
(declare-fun %lbl%+9044 () Bool)
(declare-fun $Efl@12 () Int)
(declare-fun %lbl%+9043 () Bool)
(declare-fun ecx () Int)
(declare-fun %lbl%@11144 () Bool)
(declare-fun call8873formal@$ret@0 () Int)
(declare-fun %lbl%@11209 () Bool)
(declare-fun call8888formal@$ret@0 () Int)
(declare-fun %lbl%@11272 () Bool)
(declare-fun call8905formal@$ret@0 () Int)
(declare-fun %lbl%@11339 () Bool)
(declare-fun call8920formal@$ret@0 () Int)
(declare-fun %lbl%@11402 () Bool)
(declare-fun call8935formal@$ret@0 () Int)
(declare-fun edx () Int)
(declare-fun call8948formal@$x@0 () T@opn)
(declare-fun call8948formal@$y@0 () T@opn)
(declare-fun %lbl%@11506 () Bool)
(declare-fun %lbl%@11511 () Bool)
(declare-fun %lbl%+10854 () Bool)
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
(assert (forall (($Mem@@0 (Array Int Int)) (s Int) (i@@11 Int) ) (! (= (select (select (MapStacksToMem $Mem@@0) s) i@@11) (select $Mem@@0 i@@11))
 :qid |Utilibpl.20:15|
 :skolemid |72|
 :pattern ( (select (select (MapStacksToMem $Mem@@0) s) i@@11))
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
 :qid |Stacksib.61:27|
 :skolemid |73|
 :pattern ( (IsStackStateTag tag))
)))
(assert (forall ((tag@@0 Int) (state T@StackState) ) (! (= (IsStackStateTagFor tag@@0 state) (and
(IsStackStateTag tag@@0)
(= tag@@0 (StackStateTag state))))
 :qid |Stacksib.62:30|
 :skolemid |74|
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
(assert (forall ((i@@12 Int) ) (! (= (gcAddr i@@12) (and
(<= ?gcLo i@@12)
(< i@@12 ?gcHi)))
 :qid |Separati.58:18|
 :skolemid |79|
 :pattern ( (gcAddr i@@12))
)))
(assert (forall ((i@@13 Int) ) (! (= (gcAddrEx i@@13) (and
(<= ?gcLo i@@13)
(<= i@@13 ?gcHi)))
 :qid |Separati.59:20|
 :skolemid |80|
 :pattern ( (gcAddrEx i@@13))
)))
(assert (forall ((s@@0 Int) ) (! (= (isStack s@@0) (and
(<= 0 s@@0)
(< s@@0 ?NumStacks)))
 :qid |Separati.61:19|
 :skolemid |81|
 :pattern ( (isStack s@@0))
)))
(assert (forall ((i@@14 Int) ) (! (= (sAddr i@@14) (and
(<= ?sLo i@@14)
(< i@@14 ?sHi)))
 :qid |Separati.63:17|
 :skolemid |82|
 :pattern ( (sAddr i@@14))
)))
(assert (forall ((i@@15 Int) ) (! (= (sAddrEx i@@15) (and
(<= ?sLo i@@15)
(<= i@@15 ?sHi)))
 :qid |Separati.64:19|
 :skolemid |83|
 :pattern ( (sAddrEx i@@15))
)))
(assert (forall ((i@@16 Int) ) (! (= (dAddr i@@16) (and
(<= ?dLo i@@16)
(< i@@16 ?dHi)))
 :qid |Separati.66:17|
 :skolemid |84|
 :pattern ( (dAddr i@@16))
)))
(assert (forall ((i@@17 Int) ) (! (= (dAddrEx i@@17) (and
(<= ?dLo i@@17)
(<= i@@17 ?dHi)))
 :qid |Separati.67:19|
 :skolemid |85|
 :pattern ( (dAddrEx i@@17))
)))
(assert (forall ((i@@18 Int) ) (! (= (pciAddr i@@18) (and
(<= ?pciLo i@@18)
(< i@@18 ?pciHi)))
 :qid |Separati.69:19|
 :skolemid |86|
 :pattern ( (pciAddr i@@18))
)))
(assert (forall ((i@@19 Int) ) (! (= (pciAddrEx i@@19) (and
(<= ?pciLo i@@19)
(<= i@@19 ?pciHi)))
 :qid |Separati.70:21|
 :skolemid |87|
 :pattern ( (pciAddrEx i@@19))
)))
(assert (forall ((s@@1 Int) (i@@20 Int) ) (! (= (fAddr s@@1 i@@20) (and
(isStack s@@1)
(<= (+ ?fLo (* s@@1 ?FSize)) i@@20)
(< i@@20 (+ (+ ?fLo (* s@@1 ?FSize)) ?FSize))))
 :qid |Separati.72:17|
 :skolemid |88|
 :pattern ( (fAddr s@@1 i@@20))
)))
(assert (forall ((s@@2 Int) (i@@21 Int) ) (! (= (fAddrEx s@@2 i@@21) (and
(isStack s@@2)
(<= (+ ?fLo (* s@@2 ?FSize)) i@@21)
(<= i@@21 (+ (+ ?fLo (* s@@2 ?FSize)) ?FSize))))
 :qid |Separati.73:19|
 :skolemid |89|
 :pattern ( (fAddrEx s@@2 i@@21))
)))
(assert (forall ((s@@3 Int) (i@@22 Int) ) (! (= (tAddr s@@3 i@@22) (and
(isStack s@@3)
(<= (+ ?tLo (* s@@3 ?TSize)) i@@22)
(< i@@22 (+ (+ ?tLo (* s@@3 ?TSize)) ?TSize))))
 :qid |Separati.75:17|
 :skolemid |90|
 :pattern ( (tAddr s@@3 i@@22))
)))
(assert (forall ((s@@4 Int) (i@@23 Int) ) (! (= (tAddrEx s@@4 i@@23) (and
(isStack s@@4)
(<= (+ ?tLo (* s@@4 ?TSize)) i@@23)
(<= i@@23 (+ (+ ?tLo (* s@@4 ?TSize)) ?TSize))))
 :qid |Separati.76:19|
 :skolemid |91|
 :pattern ( (tAddrEx s@@4 i@@23))
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
 :qid |Separati.80:18|
 :skolemid |92|
 :pattern ( (MemInv $Mem@@1 $sMem $dMem $pciMem $tMems $fMems $gcMem SLo DLo PciLo TLo FLo GcLo GcHi))
)))
(assert (forall ((n Int) ($sMem@@0 (Array Int Int)) ($esp Int) ) (! (= (SMemRequire n $sMem@@0 $esp) (and
(Aligned $esp)
(<= (+ ?sLo n) $esp)
(<= $esp ?sHi)))
 :qid |Separati.198:23|
 :skolemid |93|
 :pattern ( (SMemRequire n $sMem@@0 $esp))
)))
(assert (forall ((n@@0 Int) (m Int) ($sMem@@1 (Array Int Int)) ($esp@@0 Int) ) (! (= (SMemRequireInline n@@0 m $sMem@@1 $esp@@0) (and
(Aligned $esp@@0)
(Aligned (+ $esp@@0 m))
(<= (+ ?sLo n@@0) $esp@@0)
(<= (+ $esp@@0 m) ?sHi)))
 :qid |Separati.205:29|
 :skolemid |94|
 :pattern ( (SMemRequireInline n@@0 m $sMem@@1 $esp@@0))
)))
(assert (forall ((n@@1 Int) ($sMem@@2 (Array Int Int)) ($esp@@1 Int) ($RET T@ReturnTo) ) (! (= (SMemRequireRA n@@1 $sMem@@2 $esp@@1 $RET) (and
(SMemRequire n@@1 $sMem@@2 $esp@@1)
(<= (+ ?sLo n@@1) $esp@@1)
(<= $esp@@1 (- ?sHi 4))
(= (ReturnToAddr (select $sMem@@2 $esp@@1)) $RET)))
 :qid |Separati.213:25|
 :skolemid |95|
 :pattern ( (SMemRequireRA n@@1 $sMem@@2 $esp@@1 $RET))
)))
(assert (forall (($sMem@@3 (Array Int Int)) (oldSMem (Array Int Int)) ($esp@@2 Int) (oldEsp Int) ) (! (= (SMemInv $sMem@@3 oldSMem $esp@@2 oldEsp) (and
(= $esp@@2 oldEsp)
(forall ((i@@24 Int) ) (! (=> (<= $esp@@2 i@@24) (= (select $sMem@@3 i@@24) (select oldSMem i@@24)))
 :qid |Separati.224:27|
 :skolemid |96|
 :pattern ( (select $sMem@@3 i@@24))
))))
 :qid |Separati.221:19|
 :skolemid |97|
 :pattern ( (SMemInv $sMem@@3 oldSMem $esp@@2 oldEsp))
)))
(assert (forall (($sMem@@4 (Array Int Int)) (oldSMem@@0 (Array Int Int)) ($esp@@3 Int) (oldEsp@@0 Int) ) (! (= (SMemEnsure $sMem@@4 oldSMem@@0 $esp@@3 oldEsp@@0) (and
(= $esp@@3 (+ oldEsp@@0 4))
(forall ((i@@25 Int) ) (! (=> (<= $esp@@3 i@@25) (= (select $sMem@@4 i@@25) (select oldSMem@@0 i@@25)))
 :qid |Separati.231:29|
 :skolemid |98|
 :pattern ( (select $sMem@@4 i@@25))
))))
 :qid |Separati.228:22|
 :skolemid |99|
 :pattern ( (SMemEnsure $sMem@@4 oldSMem@@0 $esp@@3 oldEsp@@0))
)))
(assert (= WORD_HI (+ (+ 2147483647 2147483647) 2)))
(assert (forall (($Mem@@2 (Array Int Int)) ($sMem@@5 (Array Int Int)) ($dMem@@0 (Array Int Int)) ($pciMem@@0 (Array Int Int)) ($tMems@@0 (Array Int (Array Int Int))) ($fMems@@0 (Array Int (Array Int Int))) ($gcMem@@0 (Array Int Int)) (SLo@@0 Int) (DLo@@0 Int) (PciLo@@0 Int) (TLo@@0 Int) (FLo@@0 Int) (GcLo@@0 Int) (GcHi@@0 Int) ) (! (= (MemSepInv $Mem@@2 $sMem@@5 $dMem@@0 $pciMem@@0 $tMems@@0 $fMems@@0 $gcMem@@0 SLo@@0 DLo@@0 PciLo@@0 TLo@@0 FLo@@0 GcLo@@0 GcHi@@0) (and
(forall ((i@@26 Int) ) (! (=> (sAddr i@@26) (= (select $Mem@@2 i@@26) (select $sMem@@5 i@@26)))
 :qid |Separati.5:312|
 :skolemid |101|
 :pattern ( (select $Mem@@2 i@@26))
))
(forall ((i@@27 Int) ) (! (=> (dAddr i@@27) (= (select $Mem@@2 i@@27) (select $dMem@@0 i@@27)))
 :qid |Separati.5:373|
 :skolemid |102|
 :pattern ( (select $Mem@@2 i@@27))
))
(forall ((i@@28 Int) ) (! (=> (pciAddr i@@28) (= (select $Mem@@2 i@@28) (select $pciMem@@0 i@@28)))
 :qid |Separati.5:435|
 :skolemid |103|
 :pattern ( (select $Mem@@2 i@@28))
))
(forall ((i@@29 Int) ) (! (=> (gcAddr i@@29) (= (select $Mem@@2 i@@29) (select $gcMem@@0 i@@29)))
 :qid |Separati.5:501|
 :skolemid |104|
 :pattern ( (select $Mem@@2 i@@29))
))
(forall ((s@@5 Int) (i@@30 Int) ) (! (=> (fAddr s@@5 i@@30) (= (select $Mem@@2 i@@30) (select (select $fMems@@0 s@@5) i@@30)))
 :qid |Separati.5:565|
 :skolemid |105|
 :pattern ( (select (select $fMems@@0 s@@5) i@@30))
))
(forall ((s@@6 Int) (i@@31 Int) ) (! (=> (tAddr s@@6 i@@31) (= (select $Mem@@2 i@@31) (select (select $tMems@@0 s@@6) i@@31)))
 :qid |Separati.5:648|
 :skolemid |106|
 :pattern ( (select (select $tMems@@0 s@@6) i@@31))
))))
 :qid |Separati.5:15|
 :skolemid |107|
)))
(push 1)
(set-info :boogie-vc-id initSeparation)
(assert (not
(let ((anon3_Else_correct (=> (! (and %lbl%+9046 true) :lblpos +9046) true)))
(let ((__L1_correct (=> (! (and %lbl%+9050 true) :lblpos +9050) (and
(! (or %lbl%@11600 (MemSepInv $Mem@@3 $Mem@@3 $Mem@@3 $Mem@@3 $tMems@0 $fMems@0 $Mem@@3 call8861formal@$ret@0 call8876formal@$ret@0 call8891formal@$ret@0 call8908formal@$ret@0 call8923formal@$ret@0 call8938formal@$ret@0 call8941formal@$ret@0)) :lblneg @11600)
(=> (MemSepInv $Mem@@3 $Mem@@3 $Mem@@3 $Mem@@3 $tMems@0 $fMems@0 $Mem@@3 call8861formal@$ret@0 call8876formal@$ret@0 call8891formal@$ret@0 call8908formal@$ret@0 call8923formal@$ret@0 call8938formal@$ret@0 call8941formal@$ret@0) (and
(! (or %lbl%@11617 (<= ?gcLo ?gcHi)) :lblneg @11617)
(=> (<= ?gcLo ?gcHi) (and
(! (or %lbl%@11623 (Aligned ?sLo)) :lblneg @11623)
(=> (Aligned ?sLo) (and
(! (or %lbl%@11627 (Aligned ?dLo)) :lblneg @11627)
(=> (Aligned ?dLo) (and
(! (or %lbl%@11631 (Aligned ?pciLo)) :lblneg @11631)
(=> (Aligned ?pciLo) (and
(! (or %lbl%@11635 (Aligned ?tLo)) :lblneg @11635)
(=> (Aligned ?tLo) (and
(! (or %lbl%@11639 (Aligned ?fLo)) :lblneg @11639)
(=> (Aligned ?fLo) (and
(! (or %lbl%@11643 (Aligned ?gcLo)) :lblneg @11643)
(=> (Aligned ?gcLo) (and
(! (or %lbl%@11647 (Aligned ?gcHi)) :lblneg @11647)
(=> (Aligned ?gcHi) (and
(! (or %lbl%@11651 (= call8861formal@$ret@0 ?sLo)) :lblneg @11651)
(=> (= call8861formal@$ret@0 ?sLo) (and
(! (or %lbl%@11656 (= call8876formal@$ret@0 ?dLo)) :lblneg @11656)
(=> (= call8876formal@$ret@0 ?dLo) (and
(! (or %lbl%@11661 (= call8891formal@$ret@0 ?pciLo)) :lblneg @11661)
(=> (= call8891formal@$ret@0 ?pciLo) (and
(! (or %lbl%@11666 (= call8908formal@$ret@0 ?tLo)) :lblneg @11666)
(=> (= call8908formal@$ret@0 ?tLo) (and
(! (or %lbl%@11671 (= call8923formal@$ret@0 ?fLo)) :lblneg @11671)
(=> (= call8923formal@$ret@0 ?fLo) (and
(! (or %lbl%@11676 (= call8938formal@$ret@0 ?gcLo)) :lblneg @11676)
(=> (= call8938formal@$ret@0 ?gcLo) (and
(! (or %lbl%@11681 (= call8941formal@$ret@0 ?gcHi)) :lblneg @11681)
(=> (= call8941formal@$ret@0 ?gcHi) (and
(! (or %lbl%@11686 (MemInv $Mem@@3 $Mem@@3 $Mem@@3 $Mem@@3 $tMems@0 $fMems@0 $Mem@@3 call8861formal@$ret@0 call8876formal@$ret@0 call8891formal@$ret@0 call8908formal@$ret@0 call8923formal@$ret@0 call8938formal@$ret@0 call8941formal@$ret@0)) :lblneg @11686)
(=> (MemInv $Mem@@3 $Mem@@3 $Mem@@3 $Mem@@3 $tMems@0 $fMems@0 $Mem@@3 call8861formal@$ret@0 call8876formal@$ret@0 call8891formal@$ret@0 call8908formal@$ret@0 call8923formal@$ret@0 call8938formal@$ret@0 call8941formal@$ret@0) (and
(! (or %lbl%@11703 (= esp esp)) :lblneg @11703)
(=> (= esp esp) true)))))))))))))))))))))))))))))))))))))))
(let ((anon3_Then_correct (=> (! (and %lbl%+9044 true) :lblpos +9044) (=> (Jbe $Efl@12) __L1_correct))))
(let ((anon0_correct (=> (! (and %lbl%+9043 true) :lblpos +9043) (=> (= $tMems@0 (MapStacksToMem $Mem@@3)) (=> (and
(= $fMems@0 (MapStacksToMem $Mem@@3))
(= call8861formal@$ret@0 ecx)) (and
(! (or %lbl%@11144 (and
(TV ecx)
(TO 256))) :lblneg @11144)
(=> (and
(TV ecx)
(TO 256)) (=> (word (+ ecx 1024)) (=> (and
(= call8873formal@$ret@0 (+ ecx 1024))
(= call8876formal@$ret@0 call8873formal@$ret@0)) (and
(! (or %lbl%@11209 (and
(TV call8873formal@$ret@0)
(TO 256))) :lblneg @11209)
(=> (and
(TV call8873formal@$ret@0)
(TO 256)) (=> (word (+ call8873formal@$ret@0 1024)) (=> (and
(= call8888formal@$ret@0 (+ call8873formal@$ret@0 1024))
(= call8891formal@$ret@0 call8888formal@$ret@0)) (and
(! (or %lbl%@11272 (and
(TV call8888formal@$ret@0)
(TO (* 2 65536)))) :lblneg @11272)
(=> (and
(TV call8888formal@$ret@0)
(TO (* 2 65536))) (=> (word (+ call8888formal@$ret@0 524288)) (=> (and
(= call8905formal@$ret@0 (+ call8888formal@$ret@0 524288))
(= call8908formal@$ret@0 call8905formal@$ret@0)) (and
(! (or %lbl%@11339 (and
(TV call8905formal@$ret@0)
(TO 4096))) :lblneg @11339)
(=> (and
(TV call8905formal@$ret@0)
(TO 4096)) (=> (word (+ call8905formal@$ret@0 16384)) (=> (and
(= call8920formal@$ret@0 (+ call8905formal@$ret@0 16384))
(= call8923formal@$ret@0 call8920formal@$ret@0)) (and
(! (or %lbl%@11402 (and
(TV call8920formal@$ret@0)
(TO 273920))) :lblneg @11402)
(=> (and
(TV call8920formal@$ret@0)
(TO 273920)) (=> (and
(word (+ call8920formal@$ret@0 1095680))
(= call8935formal@$ret@0 (+ call8920formal@$ret@0 1095680))) (=> (and
(= call8938formal@$ret@0 call8935formal@$ret@0)
(= call8941formal@$ret@0 edx)
(= call8948formal@$x@0 (OpnReg call8935formal@$ret@0))
(= call8948formal@$y@0 (OpnReg edx))) (and
(! (or %lbl%@11506 (OpnOk $Mem@@3 call8948formal@$x@0)) :lblneg @11506)
(=> (OpnOk $Mem@@3 call8948formal@$x@0) (and
(! (or %lbl%@11511 (OpnOk $Mem@@3 call8948formal@$y@0)) :lblneg @11511)
(=> (OpnOk $Mem@@3 call8948formal@$y@0) (=> (FlagsCmp $Efl@12 (EvalOpn $Mem@@3 call8948formal@$x@0) (EvalOpn $Mem@@3 call8948formal@$y@0)) (and
anon3_Then_correct
anon3_Else_correct)))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+10854 true) :lblpos +10854) (=> (and
(Aligned ?memLo)
(Aligned ?memHi)
(= ecx ?memLo)
(= edx ?memHi)) anon0_correct))))
PreconditionGeneratedEntry_correct)))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9056 () Bool)
(declare-fun %lbl%@11804 () Bool)
(declare-fun $ptr () Int)
(declare-fun $sMem@@6 () (Array Int Int))
(declare-fun %lbl%+11723 () Bool)
(declare-fun $dMem@@1 () (Array Int Int))
(declare-fun $pciMem@@1 () (Array Int Int))
(declare-fun $tMems@@1 () (Array Int (Array Int Int)))
(declare-fun $fMems@@1 () (Array Int (Array Int Int)))
(declare-fun $gcMem@@1 () (Array Int Int))
(declare-fun SLo@@1 () Int)
(declare-fun DLo@@1 () Int)
(declare-fun PciLo@@1 () Int)
(declare-fun TLo@@1 () Int)
(declare-fun FLo@@1 () Int)
(declare-fun GcLo@@1 () Int)
(declare-fun GcHi@@1 () Int)
(push 1)
(set-info :boogie-vc-id sLoad)
(assert (not
(let ((anon0_correct@@0 (=> (! (and %lbl%+9056 true) :lblpos +9056) (and
(! (or %lbl%@11804 (= (select $Mem@@3 $ptr) (select $sMem@@6 $ptr))) :lblneg @11804)
(=> (= (select $Mem@@3 $ptr) (select $sMem@@6 $ptr)) true)))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+11723 true) :lblpos +11723) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(sAddr $ptr)) anon0_correct@@0))))
PreconditionGeneratedEntry_correct@@0))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9072 () Bool)
(declare-fun $sMem@0 () (Array Int Int))
(declare-fun $ptr@@0 () Int)
(declare-fun $val () Int)
(declare-fun %lbl%@11951 () Bool)
(declare-fun %lbl%@11986 () Bool)
(declare-fun %lbl%+11819 () Bool)
(push 1)
(set-info :boogie-vc-id sStore)
(assert (not
(let ((anon0_correct@@1 (=> (! (and %lbl%+9072 true) :lblpos +9072) (=> (= $sMem@0 (store $sMem@@6 $ptr@@0 $val)) (and
(! (or %lbl%@11951 (MemInv (store $Mem@@3 $ptr@@0 $val) $sMem@0 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)) :lblneg @11951)
(=> (MemInv (store $Mem@@3 $ptr@@0 $val) $sMem@0 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1) (and
(! (or %lbl%@11986 (= $sMem@0 (store $sMem@@6 $ptr@@0 $val))) :lblneg @11986)
(=> (= $sMem@0 (store $sMem@@6 $ptr@@0 $val)) true))))))))
(let ((PreconditionGeneratedEntry_correct@@1 (=> (! (and %lbl%+11819 true) :lblpos +11819) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(sAddr $ptr@@0)) anon0_correct@@1))))
PreconditionGeneratedEntry_correct@@1))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9078 () Bool)
(declare-fun %lbl%@12078 () Bool)
(declare-fun $ptr@@1 () Int)
(declare-fun %lbl%+11997 () Bool)
(push 1)
(set-info :boogie-vc-id dLoad)
(assert (not
(let ((anon0_correct@@2 (=> (! (and %lbl%+9078 true) :lblpos +9078) (and
(! (or %lbl%@12078 (= (select $Mem@@3 $ptr@@1) (select $dMem@@1 $ptr@@1))) :lblneg @12078)
(=> (= (select $Mem@@3 $ptr@@1) (select $dMem@@1 $ptr@@1)) true)))))
(let ((PreconditionGeneratedEntry_correct@@2 (=> (! (and %lbl%+11997 true) :lblpos +11997) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(dAddr $ptr@@1)) anon0_correct@@2))))
PreconditionGeneratedEntry_correct@@2))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9094 () Bool)
(declare-fun $dMem@0 () (Array Int Int))
(declare-fun $ptr@@2 () Int)
(declare-fun $val@@0 () Int)
(declare-fun %lbl%@12225 () Bool)
(declare-fun %lbl%@12260 () Bool)
(declare-fun %lbl%+12093 () Bool)
(push 1)
(set-info :boogie-vc-id dStore)
(assert (not
(let ((anon0_correct@@3 (=> (! (and %lbl%+9094 true) :lblpos +9094) (=> (= $dMem@0 (store $dMem@@1 $ptr@@2 $val@@0)) (and
(! (or %lbl%@12225 (MemInv (store $Mem@@3 $ptr@@2 $val@@0) $sMem@@6 $dMem@0 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)) :lblneg @12225)
(=> (MemInv (store $Mem@@3 $ptr@@2 $val@@0) $sMem@@6 $dMem@0 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1) (and
(! (or %lbl%@12260 (= $dMem@0 (store $dMem@@1 $ptr@@2 $val@@0))) :lblneg @12260)
(=> (= $dMem@0 (store $dMem@@1 $ptr@@2 $val@@0)) true))))))))
(let ((PreconditionGeneratedEntry_correct@@3 (=> (! (and %lbl%+12093 true) :lblpos +12093) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(dAddr $ptr@@2)) anon0_correct@@3))))
PreconditionGeneratedEntry_correct@@3))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9100 () Bool)
(declare-fun %lbl%@12352 () Bool)
(declare-fun $ptr@@3 () Int)
(declare-fun %lbl%+12271 () Bool)
(push 1)
(set-info :boogie-vc-id pciLoad)
(assert (not
(let ((anon0_correct@@4 (=> (! (and %lbl%+9100 true) :lblpos +9100) (and
(! (or %lbl%@12352 (= (select $Mem@@3 $ptr@@3) (select $pciMem@@1 $ptr@@3))) :lblneg @12352)
(=> (= (select $Mem@@3 $ptr@@3) (select $pciMem@@1 $ptr@@3)) true)))))
(let ((PreconditionGeneratedEntry_correct@@4 (=> (! (and %lbl%+12271 true) :lblpos +12271) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(pciAddr $ptr@@3)) anon0_correct@@4))))
PreconditionGeneratedEntry_correct@@4))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9116 () Bool)
(declare-fun $pciMem@0 () (Array Int Int))
(declare-fun $ptr@@4 () Int)
(declare-fun $val@@1 () Int)
(declare-fun %lbl%@12499 () Bool)
(declare-fun %lbl%@12534 () Bool)
(declare-fun %lbl%+12367 () Bool)
(push 1)
(set-info :boogie-vc-id pciStore)
(assert (not
(let ((anon0_correct@@5 (=> (! (and %lbl%+9116 true) :lblpos +9116) (=> (= $pciMem@0 (store $pciMem@@1 $ptr@@4 $val@@1)) (and
(! (or %lbl%@12499 (MemInv (store $Mem@@3 $ptr@@4 $val@@1) $sMem@@6 $dMem@@1 $pciMem@0 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)) :lblneg @12499)
(=> (MemInv (store $Mem@@3 $ptr@@4 $val@@1) $sMem@@6 $dMem@@1 $pciMem@0 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1) (and
(! (or %lbl%@12534 (= $pciMem@0 (store $pciMem@@1 $ptr@@4 $val@@1))) :lblneg @12534)
(=> (= $pciMem@0 (store $pciMem@@1 $ptr@@4 $val@@1)) true))))))))
(let ((PreconditionGeneratedEntry_correct@@5 (=> (! (and %lbl%+12367 true) :lblpos +12367) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(pciAddr $ptr@@4)) anon0_correct@@5))))
PreconditionGeneratedEntry_correct@@5))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9122 () Bool)
(declare-fun %lbl%@12641 () Bool)
(declare-fun $ptr@@5 () Int)
(declare-fun %lbl%@12655 () Bool)
(declare-fun %lbl%+12545 () Bool)
(push 1)
(set-info :boogie-vc-id gcLoad)
(assert (not
(let ((anon0_correct@@6 (=> (! (and %lbl%+9122 true) :lblpos +9122) (and
(! (or %lbl%@12641 (= (select $Mem@@3 $ptr@@5) (select $gcMem@@1 $ptr@@5))) :lblneg @12641)
(=> (= (select $Mem@@3 $ptr@@5) (select $gcMem@@1 $ptr@@5)) (and
(! (or %lbl%@12655 (TV (select $Mem@@3 $ptr@@5))) :lblneg @12655)
(=> (TV (select $Mem@@3 $ptr@@5)) true)))))))
(let ((PreconditionGeneratedEntry_correct@@6 (=> (! (and %lbl%+12545 true) :lblpos +12545) (=> (MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1) (=> (and
(gcAddr $ptr@@5)
(TV $ptr@@5)) anon0_correct@@6)))))
PreconditionGeneratedEntry_correct@@6))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9138 () Bool)
(declare-fun $gcMem@0 () (Array Int Int))
(declare-fun $ptr@@6 () Int)
(declare-fun $val@@2 () Int)
(declare-fun %lbl%@12814 () Bool)
(declare-fun %lbl%@12849 () Bool)
(declare-fun %lbl%+12664 () Bool)
(push 1)
(set-info :boogie-vc-id gcStore)
(assert (not
(let ((anon0_correct@@7 (=> (! (and %lbl%+9138 true) :lblpos +9138) (=> (= $gcMem@0 (store $gcMem@@1 $ptr@@6 $val@@2)) (and
(! (or %lbl%@12814 (MemInv (store $Mem@@3 $ptr@@6 $val@@2) $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@0 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)) :lblneg @12814)
(=> (MemInv (store $Mem@@3 $ptr@@6 $val@@2) $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@0 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1) (and
(! (or %lbl%@12849 (= $gcMem@0 (store $gcMem@@1 $ptr@@6 $val@@2))) :lblneg @12849)
(=> (= $gcMem@0 (store $gcMem@@1 $ptr@@6 $val@@2)) true))))))))
(let ((PreconditionGeneratedEntry_correct@@7 (=> (! (and %lbl%+12664 true) :lblpos +12664) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(gcAddr $ptr@@6)
(TV $ptr@@6)
(TV $val@@2)) anon0_correct@@7))))
PreconditionGeneratedEntry_correct@@7))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9147 () Bool)
(declare-fun %lbl%@12951 () Bool)
(declare-fun $ptr@@7 () Int)
(declare-fun $s () Int)
(declare-fun %lbl%@12969 () Bool)
(declare-fun %lbl%+12860 () Bool)
(push 1)
(set-info :boogie-vc-id fLoad)
(assert (not
(let ((anon0_correct@@8 (=> (! (and %lbl%+9147 true) :lblpos +9147) (and
(! (or %lbl%@12951 (= (select $Mem@@3 $ptr@@7) (select (select $fMems@@1 $s) $ptr@@7))) :lblneg @12951)
(=> (= (select $Mem@@3 $ptr@@7) (select (select $fMems@@1 $s) $ptr@@7)) (and
(! (or %lbl%@12969 (memAddr $ptr@@7)) :lblneg @12969)
(=> (memAddr $ptr@@7) true)))))))
(let ((PreconditionGeneratedEntry_correct@@8 (=> (! (and %lbl%+12860 true) :lblpos +12860) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(fAddr $s $ptr@@7)) anon0_correct@@8))))
PreconditionGeneratedEntry_correct@@8))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9171 () Bool)
(declare-fun $fMems@0@@0 () (Array Int (Array Int Int)))
(declare-fun $s@@0 () Int)
(declare-fun $ptr@@8 () Int)
(declare-fun $val@@3 () Int)
(declare-fun %lbl%@13133 () Bool)
(declare-fun %lbl%@13168 () Bool)
(declare-fun %lbl%@13187 () Bool)
(declare-fun %lbl%+12974 () Bool)
(push 1)
(set-info :boogie-vc-id fStore)
(assert (not
(let ((anon0_correct@@9 (=> (! (and %lbl%+9171 true) :lblpos +9171) (=> (= $fMems@0@@0 (store $fMems@@1 $s@@0 (store (select $fMems@@1 $s@@0) $ptr@@8 $val@@3))) (and
(! (or %lbl%@13133 (MemInv (store $Mem@@3 $ptr@@8 $val@@3) $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@0@@0 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)) :lblneg @13133)
(=> (MemInv (store $Mem@@3 $ptr@@8 $val@@3) $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@0@@0 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1) (and
(! (or %lbl%@13168 (= $fMems@0@@0 (store $fMems@@1 $s@@0 (store (select $fMems@@1 $s@@0) $ptr@@8 $val@@3)))) :lblneg @13168)
(=> (= $fMems@0@@0 (store $fMems@@1 $s@@0 (store (select $fMems@@1 $s@@0) $ptr@@8 $val@@3))) (and
(! (or %lbl%@13187 (memAddr $ptr@@8)) :lblneg @13187)
(=> (memAddr $ptr@@8) true))))))))))
(let ((PreconditionGeneratedEntry_correct@@9 (=> (! (and %lbl%+12974 true) :lblpos +12974) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(fAddr $s@@0 $ptr@@8)) anon0_correct@@9))))
PreconditionGeneratedEntry_correct@@9))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9180 () Bool)
(declare-fun %lbl%@13283 () Bool)
(declare-fun $ptr@@9 () Int)
(declare-fun $s@@1 () Int)
(declare-fun %lbl%@13301 () Bool)
(declare-fun %lbl%+13192 () Bool)
(push 1)
(set-info :boogie-vc-id tLoad)
(assert (not
(let ((anon0_correct@@10 (=> (! (and %lbl%+9180 true) :lblpos +9180) (and
(! (or %lbl%@13283 (= (select $Mem@@3 $ptr@@9) (select (select $tMems@@1 $s@@1) $ptr@@9))) :lblneg @13283)
(=> (= (select $Mem@@3 $ptr@@9) (select (select $tMems@@1 $s@@1) $ptr@@9)) (and
(! (or %lbl%@13301 (memAddr $ptr@@9)) :lblneg @13301)
(=> (memAddr $ptr@@9) true)))))))
(let ((PreconditionGeneratedEntry_correct@@10 (=> (! (and %lbl%+13192 true) :lblpos +13192) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(tAddr $s@@1 $ptr@@9)) anon0_correct@@10))))
PreconditionGeneratedEntry_correct@@10))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9204 () Bool)
(declare-fun $tMems@0@@0 () (Array Int (Array Int Int)))
(declare-fun $s@@2 () Int)
(declare-fun $ptr@@10 () Int)
(declare-fun $val@@4 () Int)
(declare-fun %lbl%@13465 () Bool)
(declare-fun %lbl%@13500 () Bool)
(declare-fun %lbl%@13519 () Bool)
(declare-fun %lbl%+13306 () Bool)
(push 1)
(set-info :boogie-vc-id tStore)
(assert (not
(let ((anon0_correct@@11 (=> (! (and %lbl%+9204 true) :lblpos +9204) (=> (= $tMems@0@@0 (store $tMems@@1 $s@@2 (store (select $tMems@@1 $s@@2) $ptr@@10 $val@@4))) (and
(! (or %lbl%@13465 (MemInv (store $Mem@@3 $ptr@@10 $val@@4) $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@0@@0 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)) :lblneg @13465)
(=> (MemInv (store $Mem@@3 $ptr@@10 $val@@4) $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@0@@0 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1) (and
(! (or %lbl%@13500 (= $tMems@0@@0 (store $tMems@@1 $s@@2 (store (select $tMems@@1 $s@@2) $ptr@@10 $val@@4)))) :lblneg @13500)
(=> (= $tMems@0@@0 (store $tMems@@1 $s@@2 (store (select $tMems@@1 $s@@2) $ptr@@10 $val@@4))) (and
(! (or %lbl%@13519 (memAddr $ptr@@10)) :lblneg @13519)
(=> (memAddr $ptr@@10) true))))))))))
(let ((PreconditionGeneratedEntry_correct@@11 (=> (! (and %lbl%+13306 true) :lblpos +13306) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(tAddr $s@@2 $ptr@@10)) anon0_correct@@11))))
PreconditionGeneratedEntry_correct@@11))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9207 () Bool)
(declare-fun %lbl%@13626 () Bool)
(declare-fun %lbl%+13524 () Bool)
(push 1)
(set-info :boogie-vc-id revealFMem)
(assert (not
(let ((anon0_correct@@12 (=> (! (and %lbl%+9207 true) :lblpos +9207) (and
(! (or %lbl%@13626 (forall ((s@@7 Int) (i@@32 Int) ) (! (=> (fAddr s@@7 i@@32) (= (select $Mem@@3 i@@32) (select (select $fMems@@1 s@@7) i@@32)))
 :qid |Separati.236:17|
 :skolemid |100|
 :pattern ( (select (select $fMems@@1 s@@7) i@@32))
))) :lblneg @13626)
(=> (forall ((s@@8 Int) (i@@33 Int) ) (! (=> (fAddr s@@8 i@@33) (= (select $Mem@@3 i@@33) (select (select $fMems@@1 s@@8) i@@33)))
 :qid |Separati.236:17|
 :skolemid |100|
 :pattern ( (select (select $fMems@@1 s@@8) i@@33))
)) true)))))
(let ((PreconditionGeneratedEntry_correct@@12 (=> (! (and %lbl%+13524 true) :lblpos +13524) (=> (MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1) anon0_correct@@12))))
PreconditionGeneratedEntry_correct@@12))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9221 () Bool)
(declare-fun $sMem@0@@0 () (Array Int Int))
(declare-fun NextEip (Int) Int)
(declare-fun $Eip () Int)
(declare-fun %lbl%@13830 () Bool)
(declare-fun %lbl%@13846 () Bool)
(declare-fun %lbl%+13667 () Bool)
(push 1)
(set-info :boogie-vc-id _call)
(assert (not
(let ((anon0_correct@@13 (=> (! (and %lbl%+9221 true) :lblpos +9221) (=> (= $sMem@0@@0 (store $sMem@@6 (- esp 4) (NextEip $Eip))) (and
(! (or %lbl%@13830 (= $sMem@0@@0 (store $sMem@@6 (- esp 4) (NextEip $Eip)))) :lblneg @13830)
(=> (= $sMem@0@@0 (store $sMem@@6 (- esp 4) (NextEip $Eip))) (and
(! (or %lbl%@13846 (MemInv (store $Mem@@3 (- esp 4) (NextEip $Eip)) $sMem@0@@0 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)) :lblneg @13846)
(=> (MemInv (store $Mem@@3 (- esp 4) (NextEip $Eip)) $sMem@0@@0 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1) true))))))))
(let ((PreconditionGeneratedEntry_correct@@13 (=> (! (and %lbl%+13667 true) :lblpos +13667) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(sAddr (- esp 4))) anon0_correct@@13))))
PreconditionGeneratedEntry_correct@@13))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+9263 () Bool)
(declare-fun %lbl%@14066 () Bool)
(declare-fun $oldMem () (Array Int Int))
(declare-fun %lbl%@14080 () Bool)
(declare-fun %lbl%+13888 () Bool)
(declare-fun $oldSMem () (Array Int Int))
(declare-fun $oldDMem () (Array Int Int))
(declare-fun $oldPciMem () (Array Int Int))
(declare-fun $oldTMem () (Array Int (Array Int Int)))
(declare-fun $oldFMem () (Array Int (Array Int Int)))
(declare-fun $oldGcMem () (Array Int Int))
(push 1)
(set-info :boogie-vc-id _ret)
(assert (not
(let ((anon0_correct@@14 (=> (! (and %lbl%+9263 true) :lblpos +9263) (and
(! (or %lbl%@14066 (= (select $Mem@@3 esp) (select $oldMem esp))) :lblneg @14066)
(=> (= (select $Mem@@3 esp) (select $oldMem esp)) (and
(! (or %lbl%@14080 (= (select $Mem@@3 esp) (select $sMem@@6 esp))) :lblneg @14080)
(=> (= (select $Mem@@3 esp) (select $sMem@@6 esp)) true)))))))
(let ((PreconditionGeneratedEntry_correct@@14 (=> (! (and %lbl%+13888 true) :lblpos +13888) (=> (and
(MemInv $Mem@@3 $sMem@@6 $dMem@@1 $pciMem@@1 $tMems@@1 $fMems@@1 $gcMem@@1 SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(MemInv $oldMem $oldSMem $oldDMem $oldPciMem $oldTMem $oldFMem $oldGcMem SLo@@1 DLo@@1 PciLo@@1 TLo@@1 FLo@@1 GcLo@@1 GcHi@@1)
(= (select $sMem@@6 esp) (select $oldSMem esp))
(sAddr esp)) anon0_correct@@14))))
PreconditionGeneratedEntry_correct@@14))
))
(check-sat)
(pop 1)
