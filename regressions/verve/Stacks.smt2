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
(declare-fun %lbl%+6542 () Bool)
(declare-fun %lbl%+6740 () Bool)
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
(assert (= WORD_HI (+ (+ 2147483647 2147483647) 2)))
(push 1)
(set-info :boogie-vc-id stacksProofs)
(assert (not
(let ((infloop_correct (=> (! (and %lbl%+6542 true) :lblpos +6542) true)))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+6740 true) :lblpos +6740) infloop_correct)))
PreconditionGeneratedEntry_correct))
))
(check-sat)
(pop 1)
