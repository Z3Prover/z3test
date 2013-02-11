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
(declare-fun TBV ((_ BitVec 32)) Bool)
(declare-fun bbvec4 ((Array Int Int) Int Int (Array Int Int) Int Int Int Int Int) Bool)
(declare-fun Aligned (Int) Bool)
(declare-fun BitIndex (Int Int) Int)
(declare-fun BitZero (Int Int Int) Bool)
(declare-fun bb2vec4 ((Array Int Int) Int (Array Int Int) Int Int Int Int Int) Bool)
(declare-fun ColorIndex (Int Int) Int)
(declare-fun ColorGet (Int Int Int) Int)
(declare-fun $Aligned ((_ BitVec 32)) Bool)
(declare-fun $and ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))
(declare-fun $bbvec4 ((Array Int Int) Int Int (Array Int Int) Int Int Int Int Int) Bool)
(declare-fun B (Int) (_ BitVec 32))
(declare-fun I ((_ BitVec 32)) Int)
(declare-fun $shr ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))
(declare-fun $shl ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))
(declare-fun $bb2vec4 ((Array Int Int) Int (Array Int Int) Int Int Int Int Int) Bool)
(declare-fun $add ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))
(declare-fun $sub ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))
(declare-fun $mul ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))
(declare-fun $le ((_ BitVec 32) (_ BitVec 32)) Bool)
(declare-fun q@and (Int Int) Int)
(declare-fun q@or (Int Int) Int)
(declare-fun $or ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))
(declare-fun q@xor (Int Int) Int)
(declare-fun $xor ((_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))
(declare-fun shl (Int Int) Int)
(declare-fun shr (Int Int) Int)
(declare-fun neg (Int) Int)
(declare-fun $not ((_ BitVec 32)) (_ BitVec 32))
(declare-fun %lbl%+4629 () Bool)
(declare-fun %lbl%@14153 () Bool)
(declare-fun $b1 () (_ BitVec 32))
(declare-fun $b2 () (_ BitVec 32))
(declare-fun %lbl%@14163 () Bool)
(declare-fun %lbl%+14104 () Bool)
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
(assert (forall ((b@@1 (_ BitVec 32)) ) (! (= (TBV b@@1) true)
 :qid |BitVecto.18:29|
 :skolemid |9|
 :pattern ( (TBV b@@1))
)))
(assert (forall ((a@@2 (Array Int Int)) (off Int) (aBase Int) (bb (Array Int Int)) (i0 Int) (i1@@0 Int) (i2@@0 Int) (g1 Int) (g2 Int) ) (! (= (bbvec4 a@@2 off aBase bb i0 i1@@0 i2@@0 g1 g2) (forall ((i@@1 Int) ) (! (=> (and
(TV i@@1)
(<= i1@@0 i@@1)
(< i@@1 i2@@0)
(Aligned (- i@@1 i0))) (and
(between g1 g2 (+ g1 (BitIndex i0 i@@1)))
(= (= (select a@@2 (+ aBase (- i@@1 i0))) off) (BitZero (select bb (+ g1 (BitIndex i0 i@@1))) i0 i@@1))))
 :qid |BitVecto.12:11|
 :skolemid |10|
 :pattern ( (TV i@@1))
)))
 :qid |BitVecto.10:17|
 :skolemid |11|
 :pattern ( (bbvec4 a@@2 off aBase bb i0 i1@@0 i2@@0 g1 g2))
)))
(assert (forall ((a@@3 (Array Int Int)) (aBase@@0 Int) (bb@@0 (Array Int Int)) (i0@@0 Int) (i1@@1 Int) (i2@@1 Int) (g1@@0 Int) (g2@@0 Int) ) (! (= (bb2vec4 a@@3 aBase@@0 bb@@0 i0@@0 i1@@1 i2@@1 g1@@0 g2@@0) (forall ((i@@2 Int) ) (! (=> (and
(TV i@@2)
(word (- i@@2 i0@@0))
(<= i1@@1 i@@2)
(< i@@2 i2@@1)
(Aligned (- i@@2 i0@@0))) (and
(between g1@@0 g2@@0 (+ g1@@0 (ColorIndex i0@@0 i@@2)))
(= (select a@@3 (+ aBase@@0 (- i@@2 i0@@0))) (ColorGet (select bb@@0 (+ g1@@0 (ColorIndex i0@@0 i@@2))) i0@@0 i@@2))))
 :qid |BitVecto.20:11|
 :skolemid |12|
 :pattern ( (TV i@@2))
)))
 :qid |BitVecto.18:18|
 :skolemid |13|
 :pattern ( (bb2vec4 a@@3 aBase@@0 bb@@0 i0@@0 i1@@1 i2@@1 g1@@0 g2@@0))
)))
(assert (forall ((b@@2 (_ BitVec 32)) ) (! (= ($Aligned b@@2) (= ($and b@@2 #x00000003) #x00000000))
 :qid |BitVecto.12:19|
 :skolemid |16|
 :pattern ( ($Aligned b@@2))
)))
(assert (forall ((a@@4 (Array Int Int)) (off@@0 Int) (aBase@@1 Int) (bb@@1 (Array Int Int)) (i0@@1 Int) (i1@@2 Int) (i2@@2 Int) (g1@@1 Int) (g2@@1 Int) ) (! (= ($bbvec4 a@@4 off@@0 aBase@@1 bb@@1 i0@@1 i1@@2 i2@@2 g1@@1 g2@@1) (forall ((i@@3 Int) ) (! (=> (and
(TV i@@3)
(word (- i@@3 i0@@1))
(<= i1@@2 i@@3)
(< i@@3 i2@@2)
($Aligned (B (- i@@3 i0@@1)))) (and
(between g1@@1 g2@@1 (+ g1@@1 (* 4 (I ($shr (B (- i@@3 i0@@1)) #x00000007)))))
(= (= (select a@@4 (+ aBase@@1 (- i@@3 i0@@1))) off@@0) (= #x00000000 ($and (B (select bb@@1 (+ g1@@1 (* 4 (I ($shr (B (- i@@3 i0@@1)) #x00000007)))))) ($shl #x00000001 ($and ($shr (B (- i@@3 i0@@1)) #x00000002) #x0000001f)))))))
 :qid |BitVecto.19:11|
 :skolemid |17|
 :pattern ( (TV i@@3))
)))
 :qid |BitVecto.17:18|
 :skolemid |18|
 :pattern ( ($bbvec4 a@@4 off@@0 aBase@@1 bb@@1 i0@@1 i1@@2 i2@@2 g1@@1 g2@@1))
)))
(assert (forall ((a@@5 (Array Int Int)) (aBase@@2 Int) (bb@@2 (Array Int Int)) (i0@@2 Int) (i1@@3 Int) (i2@@3 Int) (g1@@2 Int) (g2@@2 Int) ) (! (= ($bb2vec4 a@@5 aBase@@2 bb@@2 i0@@2 i1@@3 i2@@3 g1@@2 g2@@2) (forall ((i@@4 Int) ) (! (=> (and
(TV i@@4)
(word (- i@@4 i0@@2))
(<= i1@@3 i@@4)
(< i@@4 i2@@3)
($Aligned (B (- i@@4 i0@@2)))) (and
(between g1@@2 g2@@2 (+ g1@@2 (* 4 (I ($shr (B (- i@@4 i0@@2)) #x00000006)))))
(= (B (select a@@5 (+ aBase@@2 (- i@@4 i0@@2)))) ($and ($shr (B (select bb@@2 (+ g1@@2 (* 4 (I ($shr (B (- i@@4 i0@@2)) #x00000006)))))) ($and ($shr (B (- i@@4 i0@@2)) #x00000001) #x0000001f)) #x00000003))))
 :qid |BitVecto.28:11|
 :skolemid |19|
 :pattern ( (TV i@@4))
)))
 :qid |BitVecto.26:19|
 :skolemid |20|
 :pattern ( ($bb2vec4 a@@5 aBase@@2 bb@@2 i0@@2 i1@@3 i2@@3 g1@@2 g2@@2))
)))
(assert (= WORD_HI (+ (+ 2147483647 2147483647) 2)))
(assert (= (I #x00000001) 1))
(assert (forall ((i1@@4 Int) (i2@@4 Int) ) (! (=> (and
(word i1@@4)
(word i2@@4)) (= (= i1@@4 i2@@4) (= (B i1@@4) (B i2@@4))))
 :qid |BitVecto.9:15|
 :skolemid |25|
 :pattern ( (B i1@@4) (B i2@@4))
)))
(assert (forall ((b1@@0 (_ BitVec 32)) (b2@@0 (_ BitVec 32)) ) (! (= (= b1@@0 b2@@0) (= (I b1@@0) (I b2@@0)))
 :qid |BitVecto.10:15|
 :skolemid |26|
 :pattern ( (I b1@@0) (I b2@@0))
)))
(assert (forall ((b@@3 (_ BitVec 32)) ) (! (word (I b@@3))
 :qid |BitVecto.12:15|
 :skolemid |27|
 :pattern ( (I b@@3))
)))
(assert (forall ((b@@4 (_ BitVec 32)) ) (! (= (B (I b@@4)) b@@4)
 :qid |BitVecto.13:15|
 :skolemid |28|
 :pattern ( (B (I b@@4)))
)))
(assert (forall ((i@@5 Int) ) (! (=> (word i@@5) (= (I (B i@@5)) i@@5))
 :qid |BitVecto.14:15|
 :skolemid |29|
 :pattern ( (I (B i@@5)))
)))
(assert (forall ((b1@@1 (_ BitVec 32)) (b2@@1 (_ BitVec 32)) ) (! (=> (word (+ (I b1@@1) (I b2@@1))) (= (+ (I b1@@1) (I b2@@1)) (I ($add b1@@1 b2@@1))))
 :qid |BitVecto.16:15|
 :skolemid |30|
 :pattern ( ($add b1@@1 b2@@1))
 :pattern ( (TBV b1@@1) (TBV b2@@1))
)))
(assert (forall ((b1@@2 (_ BitVec 32)) (b2@@2 (_ BitVec 32)) ) (! (=> (word (- (I b1@@2) (I b2@@2))) (= (- (I b1@@2) (I b2@@2)) (I ($sub b1@@2 b2@@2))))
 :qid |BitVecto.17:15|
 :skolemid |31|
 :pattern ( ($sub b1@@2 b2@@2))
 :pattern ( (TBV b1@@2) (TBV b2@@2))
)))
(assert (forall ((b1@@3 (_ BitVec 32)) (b2@@3 (_ BitVec 32)) ) (! (=> (word (* (I b1@@3) (I b2@@3))) (= (* (I b1@@3) (I b2@@3)) (I ($mul b1@@3 b2@@3))))
 :qid |BitVecto.18:15|
 :skolemid |32|
 :pattern ( ($mul b1@@3 b2@@3))
 :pattern ( (TBV b1@@3) (TBV b2@@3))
)))
(assert (forall ((b1@@4 (_ BitVec 32)) (b2@@4 (_ BitVec 32)) ) (! (= (<= (I b1@@4) (I b2@@4)) ($le b1@@4 b2@@4))
 :qid |BitVecto.19:15|
 :skolemid |33|
 :pattern ( ($le b1@@4 b2@@4))
 :pattern ( (TBV b1@@4) (TBV b2@@4))
)))
(assert (forall ((i1@@5 Int) (i2@@5 Int) ) (! (= (q@and i1@@5 i2@@5) (I ($and (B i1@@5) (B i2@@5))))
 :qid |BitVecto.20:15|
 :skolemid |34|
 :pattern ( (q@and i1@@5 i2@@5))
)))
(assert (forall ((i1@@6 Int) (i2@@6 Int) ) (! (= (q@or i1@@6 i2@@6) (I ($or (B i1@@6) (B i2@@6))))
 :qid |BitVecto.21:15|
 :skolemid |35|
 :pattern ( (q@or i1@@6 i2@@6))
)))
(assert (forall ((i1@@7 Int) (i2@@7 Int) ) (! (= (q@xor i1@@7 i2@@7) (I ($xor (B i1@@7) (B i2@@7))))
 :qid |BitVecto.22:15|
 :skolemid |36|
 :pattern ( (q@xor i1@@7 i2@@7))
)))
(assert (forall ((i1@@8 Int) (i2@@8 Int) ) (! (= (shl i1@@8 i2@@8) (I ($shl (B i1@@8) (B i2@@8))))
 :qid |BitVecto.23:15|
 :skolemid |37|
 :pattern ( (shl i1@@8 i2@@8))
)))
(assert (forall ((i1@@9 Int) (i2@@9 Int) ) (! (= (shr i1@@9 i2@@9) (I ($shr (B i1@@9) (B i2@@9))))
 :qid |BitVecto.24:15|
 :skolemid |38|
 :pattern ( (shr i1@@9 i2@@9))
)))
(assert (forall ((i@@6 Int) ) (! (= (neg i@@6) (I ($not (B i@@6))))
 :qid |BitVecto.25:15|
 :skolemid |39|
 :pattern ( (neg i@@6))
)))
(assert (forall ((b@@5 (_ BitVec 32)) ) (! (= (Aligned (I b@@5)) (= ($and b@@5 #x00000003) #x00000000))
 :qid |BitVecto.27:15|
 :skolemid |40|
 :pattern ( (Aligned (I b@@5)))
)))
(assert (forall ((i0@@3 Int) (i@@7 Int) ) (! (= (BitIndex i0@@3 i@@7) (* 4 (shr (- i@@7 i0@@3) 7)))
 :qid |BitVecto.10:15|
 :skolemid |41|
)))
(assert (forall ((x@@0 Int) (i0@@4 Int) (i@@8 Int) ) (! (= (BitZero x@@0 i0@@4 i@@8) (= 0 (q@and x@@0 (shl 1 (q@and (shr (- i@@8 i0@@4) 2) 31)))))
 :qid |BitVecto.12:15|
 :skolemid |42|
)))
(assert (forall ((i0@@5 Int) (i@@9 Int) ) (! (= (ColorIndex i0@@5 i@@9) (* 4 (shr (- i@@9 i0@@5) 6)))
 :qid |BitVecto.15:15|
 :skolemid |43|
)))
(assert (forall ((x@@1 Int) (i0@@6 Int) (i@@10 Int) ) (! (= (ColorGet x@@1 i0@@6 i@@10) (q@and (shr x@@1 (q@and (shr (- i@@10 i0@@6) 1) 31)) 3))
 :qid |BitVecto.17:15|
 :skolemid |44|
)))
(push 1)
(set-info :boogie-vc-id _a)
(assert (not
(let ((anon0_correct (=> (! (and %lbl%+4629 true) :lblpos +4629) (and
(! (or %lbl%@14153 (and
(TBV $b1)
(TBV $b2))) :lblneg @14153)
(=> (and
(TBV $b1)
(TBV $b2)) (and
(! (or %lbl%@14163 (= (+ (I $b1) (I $b2)) (I ($add $b1 $b2)))) :lblneg @14163)
(=> (= (+ (I $b1) (I $b2)) (I ($add $b1 $b2))) true)))))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+14104 true) :lblpos +14104) (=> (word (+ (I $b1) (I $b2))) anon0_correct))))
PreconditionGeneratedEntry_correct))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+4678 () Bool)
(declare-fun %lbl%@14237 () Bool)
(declare-fun $b1@@0 () (_ BitVec 32))
(declare-fun $b2@@0 () (_ BitVec 32))
(declare-fun %lbl%@14247 () Bool)
(declare-fun %lbl%+14197 () Bool)
(push 1)
(set-info :boogie-vc-id _s)
(assert (not
(let ((anon0_correct@@0 (=> (! (and %lbl%+4678 true) :lblpos +4678) (and
(! (or %lbl%@14237 (and
(TBV $b1@@0)
(TBV $b2@@0))) :lblneg @14237)
(=> (and
(TBV $b1@@0)
(TBV $b2@@0)) (and
(! (or %lbl%@14247 (= (- (I $b1@@0) (I $b2@@0)) (I ($sub $b1@@0 $b2@@0)))) :lblneg @14247)
(=> (= (- (I $b1@@0) (I $b2@@0)) (I ($sub $b1@@0 $b2@@0))) true)))))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+14197 true) :lblpos +14197) (=> (word (- (I $b1@@0) (I $b2@@0))) anon0_correct@@0))))
PreconditionGeneratedEntry_correct@@0))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+4727 () Bool)
(declare-fun %lbl%@14308 () Bool)
(declare-fun $b1@@1 () (_ BitVec 32))
(declare-fun $b2@@1 () (_ BitVec 32))
(declare-fun %lbl%@14318 () Bool)
(declare-fun %lbl%+14268 () Bool)
(push 1)
(set-info :boogie-vc-id _m)
(assert (not
(let ((anon0_correct@@1 (=> (! (and %lbl%+4727 true) :lblpos +4727) (and
(! (or %lbl%@14308 (and
(TBV $b1@@1)
(TBV $b2@@1))) :lblneg @14308)
(=> (and
(TBV $b1@@1)
(TBV $b2@@1)) (and
(! (or %lbl%@14318 (= (* (I $b1@@1) (I $b2@@1)) (I ($mul $b1@@1 $b2@@1)))) :lblneg @14318)
(=> (= (* (I $b1@@1) (I $b2@@1)) (I ($mul $b1@@1 $b2@@1))) true)))))))
(let ((PreconditionGeneratedEntry_correct@@1 (=> (! (and %lbl%+14268 true) :lblpos +14268) (=> (word (* (I $b1@@1) (I $b2@@1))) anon0_correct@@1))))
PreconditionGeneratedEntry_correct@@1))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5027 () Bool)
(declare-fun %lbl%@14912 () Bool)
(declare-fun %lbl%@14922 () Bool)
(declare-fun %lbl%@14948 () Bool)
(declare-fun %lbl%@14958 () Bool)
(declare-fun %lbl%@14984 () Bool)
(declare-fun %lbl%@14994 () Bool)
(declare-fun %lbl%@15020 () Bool)
(declare-fun %lbl%@15030 () Bool)
(declare-fun %lbl%@15056 () Bool)
(declare-fun %lbl%@15066 () Bool)
(declare-fun %lbl%@15092 () Bool)
(declare-fun %lbl%@15102 () Bool)
(declare-fun %lbl%@15128 () Bool)
(declare-fun %lbl%@15138 () Bool)
(declare-fun %lbl%@15164 () Bool)
(declare-fun %lbl%@15174 () Bool)
(declare-fun %lbl%@15200 () Bool)
(declare-fun %lbl%@15210 () Bool)
(declare-fun %lbl%@15236 () Bool)
(declare-fun %lbl%@15246 () Bool)
(declare-fun %lbl%@15272 () Bool)
(declare-fun %lbl%@15282 () Bool)
(declare-fun %lbl%@15308 () Bool)
(declare-fun %lbl%@15318 () Bool)
(declare-fun %lbl%@15344 () Bool)
(declare-fun %lbl%@15354 () Bool)
(declare-fun %lbl%@15380 () Bool)
(declare-fun %lbl%@15390 () Bool)
(declare-fun %lbl%@15416 () Bool)
(declare-fun %lbl%@15434 () Bool)
(declare-fun %lbl%@15460 () Bool)
(declare-fun %lbl%@15470 () Bool)
(declare-fun %lbl%@15496 () Bool)
(declare-fun %lbl%@15506 () Bool)
(declare-fun %lbl%@15532 () Bool)
(declare-fun %lbl%@15542 () Bool)
(declare-fun %lbl%@15568 () Bool)
(declare-fun %lbl%@15578 () Bool)
(declare-fun %lbl%@15604 () Bool)
(declare-fun %lbl%@15614 () Bool)
(declare-fun %lbl%@15640 () Bool)
(declare-fun %lbl%@15662 () Bool)
(declare-fun %lbl%@15688 () Bool)
(declare-fun %lbl%@15698 () Bool)
(declare-fun %lbl%@15724 () Bool)
(declare-fun %lbl%@15734 () Bool)
(declare-fun %lbl%@15760 () Bool)
(declare-fun %lbl%@15770 () Bool)
(declare-fun %lbl%@15796 () Bool)
(declare-fun %lbl%@15806 () Bool)
(declare-fun %lbl%@15832 () Bool)
(declare-fun %lbl%@15840 () Bool)
(declare-fun %lbl%@15848 () Bool)
(declare-fun %lbl%@15856 () Bool)
(declare-fun %lbl%@15864 () Bool)
(declare-fun %lbl%@15872 () Bool)
(declare-fun %lbl%@15880 () Bool)
(declare-fun %lbl%@15888 () Bool)
(declare-fun %lbl%@15896 () Bool)
(declare-fun %lbl%@15904 () Bool)
(declare-fun %lbl%@15912 () Bool)
(declare-fun %lbl%@15920 () Bool)
(declare-fun %lbl%@15928 () Bool)
(declare-fun %lbl%@15936 () Bool)
(declare-fun %lbl%@15944 () Bool)
(declare-fun %lbl%@15952 () Bool)
(declare-fun %lbl%@15960 () Bool)
(declare-fun %lbl%@15968 () Bool)
(declare-fun %lbl%+14339 () Bool)
(push 1)
(set-info :boogie-vc-id __const)
(assert (not
(let ((anon0_correct@@2 (=> (! (and %lbl%+5027 true) :lblpos +5027) (=> (= ($sub #x00000001 #x00000001) #x00000000) (=> (and
(= ($add #x00000001 #x00000001) #x00000002)
(= ($add #x00000002 #x00000001) #x00000003)) (=> (and
(= ($add #x00000002 #x00000002) #x00000004)
(= ($add #x00000004 #x00000001) #x00000005)
(= ($add #x00000005 #x00000001) #x00000006)
(= ($add #x00000005 #x00000002) #x00000007)) (=> (and
(= ($mul #x00000004 #x00000004) #x00000010)
(= ($add #x00000010 #x00000010) #x00000020)
(= ($sub #x00000020 #x00000001) #x0000001f)
(= ($add #x00000020 #x00000020) #x00000040)
(= ($sub #x00000040 #x00000001) #x0000003f)
(= ($mul #x00000020 #x00000004) #x00000080)
(= ($sub #x00000080 #x00000001) #x0000007f)
(= ($mul #x00000010 #x00000010) #x00000100)) (=> (and
(= ($add #x00000100 #x00000100) #x00000200)
(= ($mul #x00000040 #x00000040) #x00001000)
(= ($sub #x00001000 #x00000001) #x00000fff)
(= ($mul #x00000100 #x00000100) #x00010000)
(= ($sub #x00010000 #x00000001) #x0000ffff)
(= ($mul #x00010000 #x00000020) #x00200000)
(= ($sub #x00200000 #x00000001) #x001fffff)
(= ($mul #x00010000 #x00000100) #x01000000)
(= ($sub #x01000000 #x00000001) #x00ffffff)
(= ($mul #x00010000 #x00000200) #x02000000)
(= ($sub #x02000000 #x00000001) #x01ffffff)
(= ($add #x02000000 #x02000000) #x04000000)
(= ($sub #x04000000 #x00000001) #x03ffffff)
(= ($mul #x00010000 #x0000ffff) #xffff0000)
(= ($add #xffff0000 #x0000ffff) #xffffffff)
(= ($sub #xffffffff #x00000003) #xfffffffc)) (and
(! (or %lbl%@14912 (word 0)) :lblneg @14912)
(=> (word 0) (and
(! (or %lbl%@14922 (word (- (I #x00000001) (I #x00000001)))) :lblneg @14922)
(=> (word (- (I #x00000001) (I #x00000001))) (=> (= (- (I #x00000001) (I #x00000001)) (I ($sub #x00000001 #x00000001))) (and
(! (or %lbl%@14948 (word 2)) :lblneg @14948)
(=> (word 2) (and
(! (or %lbl%@14958 (word (+ (I #x00000001) (I #x00000001)))) :lblneg @14958)
(=> (word (+ (I #x00000001) (I #x00000001))) (=> (= (+ (I #x00000001) (I #x00000001)) (I ($add #x00000001 #x00000001))) (and
(! (or %lbl%@14984 (word 3)) :lblneg @14984)
(=> (word 3) (and
(! (or %lbl%@14994 (word (+ (I #x00000002) (I #x00000001)))) :lblneg @14994)
(=> (word (+ (I #x00000002) (I #x00000001))) (=> (= (+ (I #x00000002) (I #x00000001)) (I ($add #x00000002 #x00000001))) (and
(! (or %lbl%@15020 (word 4)) :lblneg @15020)
(=> (word 4) (and
(! (or %lbl%@15030 (word (+ (I #x00000002) (I #x00000002)))) :lblneg @15030)
(=> (word (+ (I #x00000002) (I #x00000002))) (=> (= (+ (I #x00000002) (I #x00000002)) (I ($add #x00000002 #x00000002))) (and
(! (or %lbl%@15056 (word 5)) :lblneg @15056)
(=> (word 5) (and
(! (or %lbl%@15066 (word (+ (I #x00000004) (I #x00000001)))) :lblneg @15066)
(=> (word (+ (I #x00000004) (I #x00000001))) (=> (= (+ (I #x00000004) (I #x00000001)) (I ($add #x00000004 #x00000001))) (and
(! (or %lbl%@15092 (word 6)) :lblneg @15092)
(=> (word 6) (and
(! (or %lbl%@15102 (word (+ (I #x00000005) (I #x00000001)))) :lblneg @15102)
(=> (word (+ (I #x00000005) (I #x00000001))) (=> (= (+ (I #x00000005) (I #x00000001)) (I ($add #x00000005 #x00000001))) (and
(! (or %lbl%@15128 (word 7)) :lblneg @15128)
(=> (word 7) (and
(! (or %lbl%@15138 (word (+ (I #x00000005) (I #x00000002)))) :lblneg @15138)
(=> (word (+ (I #x00000005) (I #x00000002))) (=> (= (+ (I #x00000005) (I #x00000002)) (I ($add #x00000005 #x00000002))) (and
(! (or %lbl%@15164 (word 16)) :lblneg @15164)
(=> (word 16) (and
(! (or %lbl%@15174 (word (* (I #x00000004) (I #x00000004)))) :lblneg @15174)
(=> (word (* (I #x00000004) (I #x00000004))) (=> (= (* (I #x00000004) (I #x00000004)) (I ($mul #x00000004 #x00000004))) (and
(! (or %lbl%@15200 (word 32)) :lblneg @15200)
(=> (word 32) (and
(! (or %lbl%@15210 (word (+ (I #x00000010) (I #x00000010)))) :lblneg @15210)
(=> (word (+ (I #x00000010) (I #x00000010))) (=> (= (+ (I #x00000010) (I #x00000010)) (I ($add #x00000010 #x00000010))) (and
(! (or %lbl%@15236 (word 31)) :lblneg @15236)
(=> (word 31) (and
(! (or %lbl%@15246 (word (- (I #x00000020) (I #x00000001)))) :lblneg @15246)
(=> (word (- (I #x00000020) (I #x00000001))) (=> (= (- (I #x00000020) (I #x00000001)) (I ($sub #x00000020 #x00000001))) (and
(! (or %lbl%@15272 (word 64)) :lblneg @15272)
(=> (word 64) (and
(! (or %lbl%@15282 (word (+ (I #x00000020) (I #x00000020)))) :lblneg @15282)
(=> (word (+ (I #x00000020) (I #x00000020))) (=> (= (+ (I #x00000020) (I #x00000020)) (I ($add #x00000020 #x00000020))) (and
(! (or %lbl%@15308 (word 63)) :lblneg @15308)
(=> (word 63) (and
(! (or %lbl%@15318 (word (- (I #x00000040) (I #x00000001)))) :lblneg @15318)
(=> (word (- (I #x00000040) (I #x00000001))) (=> (= (- (I #x00000040) (I #x00000001)) (I ($sub #x00000040 #x00000001))) (and
(! (or %lbl%@15344 (word 128)) :lblneg @15344)
(=> (word 128) (and
(! (or %lbl%@15354 (word (* (I #x00000020) (I #x00000004)))) :lblneg @15354)
(=> (word (* (I #x00000020) (I #x00000004))) (=> (= (* (I #x00000020) (I #x00000004)) (I ($mul #x00000020 #x00000004))) (and
(! (or %lbl%@15380 (word 127)) :lblneg @15380)
(=> (word 127) (and
(! (or %lbl%@15390 (word (- (I #x00000080) (I #x00000001)))) :lblneg @15390)
(=> (word (- (I #x00000080) (I #x00000001))) (=> (= (- (I #x00000080) (I #x00000001)) (I ($sub #x00000080 #x00000001))) (and
(! (or %lbl%@15416 (word (* (I #x00000010) (I #x00000010)))) :lblneg @15416)
(=> (word (* (I #x00000010) (I #x00000010))) (and
(! (or %lbl%@15434 (word (* (I #x00000010) (I #x00000010)))) :lblneg @15434)
(=> (word (* (I #x00000010) (I #x00000010))) (=> (= (* (I #x00000010) (I #x00000010)) (I ($mul #x00000010 #x00000010))) (and
(! (or %lbl%@15460 (word 512)) :lblneg @15460)
(=> (word 512) (and
(! (or %lbl%@15470 (word (+ (I #x00000100) (I #x00000100)))) :lblneg @15470)
(=> (word (+ (I #x00000100) (I #x00000100))) (=> (= (+ (I #x00000100) (I #x00000100)) (I ($add #x00000100 #x00000100))) (and
(! (or %lbl%@15496 (word 65536)) :lblneg @15496)
(=> (word 65536) (and
(! (or %lbl%@15506 (word (* (I #x00000100) (I #x00000100)))) :lblneg @15506)
(=> (word (* (I #x00000100) (I #x00000100))) (=> (= (* (I #x00000100) (I #x00000100)) (I ($mul #x00000100 #x00000100))) (and
(! (or %lbl%@15532 (word 65535)) :lblneg @15532)
(=> (word 65535) (and
(! (or %lbl%@15542 (word (- (I #x00010000) (I #x00000001)))) :lblneg @15542)
(=> (word (- (I #x00010000) (I #x00000001))) (=> (= (- (I #x00010000) (I #x00000001)) (I ($sub #x00010000 #x00000001))) (and
(! (or %lbl%@15568 (word 16777216)) :lblneg @15568)
(=> (word 16777216) (and
(! (or %lbl%@15578 (word (* (I #x00010000) (I #x00000100)))) :lblneg @15578)
(=> (word (* (I #x00010000) (I #x00000100))) (=> (= (* (I #x00010000) (I #x00000100)) (I ($mul #x00010000 #x00000100))) (and
(! (or %lbl%@15604 (word 16777215)) :lblneg @15604)
(=> (word 16777215) (and
(! (or %lbl%@15614 (word (- (I #x01000000) (I #x00000001)))) :lblneg @15614)
(=> (word (- (I #x01000000) (I #x00000001))) (=> (= (- (I #x01000000) (I #x00000001)) (I ($sub #x01000000 #x00000001))) (and
(! (or %lbl%@15640 (word (- (+ (+ 2147483647 2147483647) 2) 65536))) :lblneg @15640)
(=> (word (- (+ (+ 2147483647 2147483647) 2) 65536)) (and
(! (or %lbl%@15662 (word (* (I #x00010000) (I #x0000ffff)))) :lblneg @15662)
(=> (word (* (I #x00010000) (I #x0000ffff))) (=> (= (* (I #x00010000) (I #x0000ffff)) (I ($mul #x00010000 #x0000ffff))) (and
(! (or %lbl%@15688 (word 33554432)) :lblneg @15688)
(=> (word 33554432) (and
(! (or %lbl%@15698 (word (* (I #x00010000) (I #x00000200)))) :lblneg @15698)
(=> (word (* (I #x00010000) (I #x00000200))) (=> (= (* (I #x00010000) (I #x00000200)) (I ($mul #x00010000 #x00000200))) (and
(! (or %lbl%@15724 (word 33554431)) :lblneg @15724)
(=> (word 33554431) (and
(! (or %lbl%@15734 (word (- (I #x02000000) (I #x00000001)))) :lblneg @15734)
(=> (word (- (I #x02000000) (I #x00000001))) (=> (= (- (I #x02000000) (I #x00000001)) (I ($sub #x02000000 #x00000001))) (and
(! (or %lbl%@15760 (word 67108864)) :lblneg @15760)
(=> (word 67108864) (and
(! (or %lbl%@15770 (word (+ (I #x02000000) (I #x02000000)))) :lblneg @15770)
(=> (word (+ (I #x02000000) (I #x02000000))) (=> (= (+ (I #x02000000) (I #x02000000)) (I ($add #x02000000 #x02000000))) (and
(! (or %lbl%@15796 (word 67108863)) :lblneg @15796)
(=> (word 67108863) (and
(! (or %lbl%@15806 (word (- (I #x04000000) (I #x00000001)))) :lblneg @15806)
(=> (word (- (I #x04000000) (I #x00000001))) (=> (= (- (I #x04000000) (I #x00000001)) (I ($sub #x04000000 #x00000001))) (and
(! (or %lbl%@15832 (= 0 (I #x00000000))) :lblneg @15832)
(=> (= 0 (I #x00000000)) (and
(! (or %lbl%@15840 (= 2 (I #x00000002))) :lblneg @15840)
(=> (= 2 (I #x00000002)) (and
(! (or %lbl%@15848 (= 3 (I #x00000003))) :lblneg @15848)
(=> (= 3 (I #x00000003)) (and
(! (or %lbl%@15856 (= 4 (I #x00000004))) :lblneg @15856)
(=> (= 4 (I #x00000004)) (and
(! (or %lbl%@15864 (= 5 (I #x00000005))) :lblneg @15864)
(=> (= 5 (I #x00000005)) (and
(! (or %lbl%@15872 (= 6 (I #x00000006))) :lblneg @15872)
(=> (= 6 (I #x00000006)) (and
(! (or %lbl%@15880 (= 7 (I #x00000007))) :lblneg @15880)
(=> (= 7 (I #x00000007)) (and
(! (or %lbl%@15888 (= 16 (I #x00000010))) :lblneg @15888)
(=> (= 16 (I #x00000010)) (and
(! (or %lbl%@15896 (= 32 (I #x00000020))) :lblneg @15896)
(=> (= 32 (I #x00000020)) (and
(! (or %lbl%@15904 (= 31 (I #x0000001f))) :lblneg @15904)
(=> (= 31 (I #x0000001f)) (and
(! (or %lbl%@15912 (= 64 (I #x00000040))) :lblneg @15912)
(=> (= 64 (I #x00000040)) (and
(! (or %lbl%@15920 (= 63 (I #x0000003f))) :lblneg @15920)
(=> (= 63 (I #x0000003f)) (and
(! (or %lbl%@15928 (= 128 (I #x00000080))) :lblneg @15928)
(=> (= 128 (I #x00000080)) (and
(! (or %lbl%@15936 (= 127 (I #x0000007f))) :lblneg @15936)
(=> (= 127 (I #x0000007f)) (and
(! (or %lbl%@15944 (= 256 (I #x00000100))) :lblneg @15944)
(=> (= 256 (I #x00000100)) (and
(! (or %lbl%@15952 (= 16777215 (I #x00ffffff))) :lblneg @15952)
(=> (= 16777215 (I #x00ffffff)) (and
(! (or %lbl%@15960 (= 33554431 (I #x01ffffff))) :lblneg @15960)
(=> (= 33554431 (I #x01ffffff)) (and
(! (or %lbl%@15968 (= 67108863 (I #x03ffffff))) :lblneg @15968)
(=> (= 67108863 (I #x03ffffff)) true)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@2 (=> (! (and %lbl%+14339 true) :lblpos +14339) anon0_correct@@2)))
PreconditionGeneratedEntry_correct@@2))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5077 () Bool)
(declare-fun %lbl%@16474 () Bool)
(declare-fun %lbl%@16492 () Bool)
(declare-fun %lbl%@16518 () Bool)
(declare-fun %lbl%@16536 () Bool)
(declare-fun %lbl%@16562 () Bool)
(declare-fun %lbl%@16578 () Bool)
(declare-fun %lbl%+15977 () Bool)
(push 1)
(set-info :boogie-vc-id __const2)
(assert (not
(let ((anon0_correct@@3 (=> (! (and %lbl%+5077 true) :lblpos +5077) (=> (= 0 (I #x00000000)) (=> (and
(= 2 (I #x00000002))
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))) (=> (and
(= 67108863 (I #x03ffffff))
(= ($sub #x00000001 #x00000001) #x00000000)
(= ($add #x00000001 #x00000001) #x00000002)
(= ($add #x00000002 #x00000001) #x00000003)
(= ($add #x00000002 #x00000002) #x00000004)
(= ($add #x00000004 #x00000001) #x00000005)
(= ($add #x00000005 #x00000001) #x00000006)
(= ($add #x00000005 #x00000002) #x00000007)
(= ($mul #x00000004 #x00000004) #x00000010)
(= ($add #x00000010 #x00000010) #x00000020)
(= ($sub #x00000020 #x00000001) #x0000001f)
(= ($add #x00000020 #x00000020) #x00000040)
(= ($sub #x00000040 #x00000001) #x0000003f)
(= ($mul #x00000020 #x00000004) #x00000080)
(= ($sub #x00000080 #x00000001) #x0000007f)
(= ($mul #x00000010 #x00000010) #x00000100)
(= ($add #x00000100 #x00000100) #x00000200)
(= ($mul #x00000040 #x00000040) #x00001000)
(= ($sub #x00001000 #x00000001) #x00000fff)
(= ($mul #x00000100 #x00000100) #x00010000)
(= ($sub #x00010000 #x00000001) #x0000ffff)
(= ($mul #x00010000 #x00000020) #x00200000)
(= ($sub #x00200000 #x00000001) #x001fffff)
(= ($mul #x00010000 #x00000100) #x01000000)
(= ($sub #x01000000 #x00000001) #x00ffffff)
(= ($mul #x00010000 #x00000200) #x02000000)
(= ($sub #x02000000 #x00000001) #x01ffffff)
(= ($add #x02000000 #x02000000) #x04000000)
(= ($sub #x04000000 #x00000001) #x03ffffff)
(= ($mul #x00010000 #x0000ffff) #xffff0000)
(= ($add #xffff0000 #x0000ffff) #xffffffff)
(= ($sub #xffffffff #x00000003) #xfffffffc)) (and
(! (or %lbl%@16474 (word (+ (+ 2147483647 2147483647) 1))) :lblneg @16474)
(=> (word (+ (+ 2147483647 2147483647) 1)) (and
(! (or %lbl%@16492 (word (+ (I #xffff0000) (I #x0000ffff)))) :lblneg @16492)
(=> (word (+ (I #xffff0000) (I #x0000ffff))) (=> (= (+ (I #xffff0000) (I #x0000ffff)) (I ($add #xffff0000 #x0000ffff))) (and
(! (or %lbl%@16518 (word (- (I #xffffffff) (I #x00000003)))) :lblneg @16518)
(=> (word (- (I #xffffffff) (I #x00000003))) (and
(! (or %lbl%@16536 (word (- (I #xffffffff) (I #x00000003)))) :lblneg @16536)
(=> (word (- (I #xffffffff) (I #x00000003))) (=> (= (- (I #xffffffff) (I #x00000003)) (I ($sub #xffffffff #x00000003))) (and
(! (or %lbl%@16562 (= (+ (+ 2147483647 2147483647) 1) (I #xffffffff))) :lblneg @16562)
(=> (= (+ (+ 2147483647 2147483647) 1) (I #xffffffff)) (and
(! (or %lbl%@16578 (= (- (+ 2147483647 2147483647) 2) (I #xfffffffc))) :lblneg @16578)
(=> (= (- (+ 2147483647 2147483647) 2) (I #xfffffffc)) true))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@3 (=> (! (and %lbl%+15977 true) :lblpos +15977) anon0_correct@@3)))
PreconditionGeneratedEntry_correct@@3))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5119 () Bool)
(declare-fun %lbl%@17076 () Bool)
(declare-fun %lbl%@17080 () Bool)
(declare-fun %lbl%@17098 () Bool)
(declare-fun %lbl%@17124 () Bool)
(declare-fun %lbl%@17134 () Bool)
(declare-fun %lbl%@17160 () Bool)
(declare-fun %lbl%@17168 () Bool)
(declare-fun %lbl%+16595 () Bool)
(push 1)
(set-info :boogie-vc-id __const3)
(assert (not
(let ((anon0_correct@@4 (=> (! (and %lbl%+5119 true) :lblpos +5119) (=> (= 0 (I #x00000000)) (=> (and
(= 2 (I #x00000002))
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))) (=> (and
(= 67108863 (I #x03ffffff))
(= ($sub #x00000001 #x00000001) #x00000000)
(= ($add #x00000001 #x00000001) #x00000002)
(= ($add #x00000002 #x00000001) #x00000003)
(= ($add #x00000002 #x00000002) #x00000004)
(= ($add #x00000004 #x00000001) #x00000005)
(= ($add #x00000005 #x00000001) #x00000006)
(= ($add #x00000005 #x00000002) #x00000007)
(= ($mul #x00000004 #x00000004) #x00000010)
(= ($add #x00000010 #x00000010) #x00000020)
(= ($sub #x00000020 #x00000001) #x0000001f)
(= ($add #x00000020 #x00000020) #x00000040)
(= ($sub #x00000040 #x00000001) #x0000003f)
(= ($mul #x00000020 #x00000004) #x00000080)
(= ($sub #x00000080 #x00000001) #x0000007f)
(= ($mul #x00000010 #x00000010) #x00000100)
(= ($add #x00000100 #x00000100) #x00000200)
(= ($mul #x00000040 #x00000040) #x00001000)
(= ($sub #x00001000 #x00000001) #x00000fff)
(= ($mul #x00000100 #x00000100) #x00010000)
(= ($sub #x00010000 #x00000001) #x0000ffff)
(= ($mul #x00010000 #x00000020) #x00200000)
(= ($sub #x00200000 #x00000001) #x001fffff)
(= ($mul #x00010000 #x00000100) #x01000000)
(= ($sub #x01000000 #x00000001) #x00ffffff)
(= ($mul #x00010000 #x00000200) #x02000000)
(= ($sub #x02000000 #x00000001) #x01ffffff)
(= ($add #x02000000 #x02000000) #x04000000)
(= ($sub #x04000000 #x00000001) #x03ffffff)
(= ($mul #x00010000 #x0000ffff) #xffff0000)
(= ($add #xffff0000 #x0000ffff) #xffffffff)
(= ($sub #xffffffff #x00000003) #xfffffffc)) (and
(! (or %lbl%@17076 (word 4096)) :lblneg @17076)
(=> (word 4096) (and
(! (or %lbl%@17080 (word (* (I #x00000040) (I #x00000040)))) :lblneg @17080)
(=> (word (* (I #x00000040) (I #x00000040))) (and
(! (or %lbl%@17098 (word (* (I #x00000040) (I #x00000040)))) :lblneg @17098)
(=> (word (* (I #x00000040) (I #x00000040))) (=> (= (* (I #x00000040) (I #x00000040)) (I ($mul #x00000040 #x00000040))) (and
(! (or %lbl%@17124 (word 4095)) :lblneg @17124)
(=> (word 4095) (and
(! (or %lbl%@17134 (word (- (I #x00001000) (I #x00000001)))) :lblneg @17134)
(=> (word (- (I #x00001000) (I #x00000001))) (=> (= (- (I #x00001000) (I #x00000001)) (I ($sub #x00001000 #x00000001))) (and
(! (or %lbl%@17160 (= 4096 (I #x00001000))) :lblneg @17160)
(=> (= 4096 (I #x00001000)) (and
(! (or %lbl%@17168 (= 4095 (I #x00000fff))) :lblneg @17168)
(=> (= 4095 (I #x00000fff)) true))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@4 (=> (! (and %lbl%+16595 true) :lblpos +16595) anon0_correct@@4)))
PreconditionGeneratedEntry_correct@@4))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5161 () Bool)
(declare-fun %lbl%@17658 () Bool)
(declare-fun %lbl%@17662 () Bool)
(declare-fun %lbl%@17680 () Bool)
(declare-fun %lbl%@17706 () Bool)
(declare-fun %lbl%@17716 () Bool)
(declare-fun %lbl%@17742 () Bool)
(declare-fun %lbl%@17750 () Bool)
(declare-fun %lbl%+17177 () Bool)
(push 1)
(set-info :boogie-vc-id __const4)
(assert (not
(let ((anon0_correct@@5 (=> (! (and %lbl%+5161 true) :lblpos +5161) (=> (= 0 (I #x00000000)) (=> (and
(= 2 (I #x00000002))
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))) (=> (and
(= 67108863 (I #x03ffffff))
(= ($sub #x00000001 #x00000001) #x00000000)
(= ($add #x00000001 #x00000001) #x00000002)
(= ($add #x00000002 #x00000001) #x00000003)
(= ($add #x00000002 #x00000002) #x00000004)
(= ($add #x00000004 #x00000001) #x00000005)
(= ($add #x00000005 #x00000001) #x00000006)
(= ($add #x00000005 #x00000002) #x00000007)
(= ($mul #x00000004 #x00000004) #x00000010)
(= ($add #x00000010 #x00000010) #x00000020)
(= ($sub #x00000020 #x00000001) #x0000001f)
(= ($add #x00000020 #x00000020) #x00000040)
(= ($sub #x00000040 #x00000001) #x0000003f)
(= ($mul #x00000020 #x00000004) #x00000080)
(= ($sub #x00000080 #x00000001) #x0000007f)
(= ($mul #x00000010 #x00000010) #x00000100)
(= ($add #x00000100 #x00000100) #x00000200)
(= ($mul #x00000040 #x00000040) #x00001000)
(= ($sub #x00001000 #x00000001) #x00000fff)
(= ($mul #x00000100 #x00000100) #x00010000)
(= ($sub #x00010000 #x00000001) #x0000ffff)
(= ($mul #x00010000 #x00000020) #x00200000)
(= ($sub #x00200000 #x00000001) #x001fffff)
(= ($mul #x00010000 #x00000100) #x01000000)
(= ($sub #x01000000 #x00000001) #x00ffffff)
(= ($mul #x00010000 #x00000200) #x02000000)
(= ($sub #x02000000 #x00000001) #x01ffffff)
(= ($add #x02000000 #x02000000) #x04000000)
(= ($sub #x04000000 #x00000001) #x03ffffff)
(= ($mul #x00010000 #x0000ffff) #xffff0000)
(= ($add #xffff0000 #x0000ffff) #xffffffff)
(= ($sub #xffffffff #x00000003) #xfffffffc)) (and
(! (or %lbl%@17658 (word 2097152)) :lblneg @17658)
(=> (word 2097152) (and
(! (or %lbl%@17662 (word (* (I #x00000020) (I #x00010000)))) :lblneg @17662)
(=> (word (* (I #x00000020) (I #x00010000))) (and
(! (or %lbl%@17680 (word (* (I #x00000020) (I #x00010000)))) :lblneg @17680)
(=> (word (* (I #x00000020) (I #x00010000))) (=> (= (* (I #x00000020) (I #x00010000)) (I ($mul #x00000020 #x00010000))) (and
(! (or %lbl%@17706 (word 2097151)) :lblneg @17706)
(=> (word 2097151) (and
(! (or %lbl%@17716 (word (- (I #x00200000) (I #x00000001)))) :lblneg @17716)
(=> (word (- (I #x00200000) (I #x00000001))) (=> (= (- (I #x00200000) (I #x00000001)) (I ($sub #x00200000 #x00000001))) (and
(! (or %lbl%@17742 (= 2097152 (I #x00200000))) :lblneg @17742)
(=> (= 2097152 (I #x00200000)) (and
(! (or %lbl%@17750 (= 2097151 (I #x001fffff))) :lblneg @17750)
(=> (= 2097151 (I #x001fffff)) true))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@5 (=> (! (and %lbl%+17177 true) :lblpos +17177) anon0_correct@@5)))
PreconditionGeneratedEntry_correct@@5))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5167 () Bool)
(declare-fun %lbl%@17913 () Bool)
(declare-fun %lbl%+17759 () Bool)
(push 1)
(set-info :boogie-vc-id __zeroAligned)
(assert (not
(let ((anon0_correct@@6 (=> (! (and %lbl%+5167 true) :lblpos +5167) (=> (= 0 (I #x00000000)) (=> (and
(= 2 (I #x00000002))
(= 3 (I #x00000003))) (=> (and
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
($Aligned #x00000000)) (and
(! (or %lbl%@17913 (Aligned 0)) :lblneg @17913)
(=> (Aligned 0) true))))))))
(let ((PreconditionGeneratedEntry_correct@@6 (=> (! (and %lbl%+17759 true) :lblpos +17759) anon0_correct@@6)))
PreconditionGeneratedEntry_correct@@6))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5192 () Bool)
(declare-fun call5175formal@$x@0 () (_ BitVec 32))
(declare-fun $x () Int)
(declare-fun %lbl%@18109 () Bool)
(declare-fun %lbl%@18125 () Bool)
(declare-fun %lbl%+17918 () Bool)
(push 1)
(set-info :boogie-vc-id __andAligned)
(assert (not
(let ((anon0_correct@@7 (=> (! (and %lbl%+5192 true) :lblpos +5192) (=> (and
(= 0 (I #x00000000))
(= 2 (I #x00000002))
(= 3 (I #x00000003))
(= 4 (I #x00000004))) (=> (and
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
(= call5175formal@$x@0 (B $x))
(= (= ($and call5175formal@$x@0 #x00000003) #x00000000) ($Aligned call5175formal@$x@0))) (and
(! (or %lbl%@18109 (= (Aligned (I (B $x))) ($Aligned (B $x)))) :lblneg @18109)
(=> (= (Aligned (I (B $x))) ($Aligned (B $x))) (and
(! (or %lbl%@18125 (=> (word $x) (= (= (q@and $x 3) 0) (Aligned $x)))) :lblneg @18125)
(=> (=> (word $x) (= (= (q@and $x 3) 0) (Aligned $x))) true)))))))))
(let ((PreconditionGeneratedEntry_correct@@7 (=> (! (and %lbl%+17918 true) :lblpos +17918) anon0_correct@@7)))
PreconditionGeneratedEntry_correct@@7))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5249 () Bool)
(declare-fun call5206formal@$x@0 () (_ BitVec 32))
(declare-fun $x@@0 () Int)
(declare-fun call5206formal@$y@0 () (_ BitVec 32))
(declare-fun $y () Int)
(declare-fun %lbl%@18368 () Bool)
(declare-fun %lbl%@18422 () Bool)
(declare-fun %lbl%+18148 () Bool)
(push 1)
(set-info :boogie-vc-id __addAligned)
(assert (not
(let ((anon0_correct@@8 (=> (! (and %lbl%+5249 true) :lblpos +5249) (=> (= 0 (I #x00000000)) (=> (and
(= 2 (I #x00000002))
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))) (=> (and
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
(= call5206formal@$x@0 (B $x@@0))
(= call5206formal@$y@0 (B $y))
(=> ($Aligned call5206formal@$x@0) (= ($Aligned call5206formal@$y@0) ($Aligned ($add call5206formal@$x@0 call5206formal@$y@0))))) (and
(! (or %lbl%@18368 (=> (and
(word $x@@0)
(word $y)
(word (+ $x@@0 $y))
(Aligned (I (B $x@@0)))) (= (Aligned (I (B $y))) (Aligned (I (B (+ $x@@0 $y))))))) :lblneg @18368)
(=> (=> (and
(word $x@@0)
(word $y)
(word (+ $x@@0 $y))
(Aligned (I (B $x@@0)))) (= (Aligned (I (B $y))) (Aligned (I (B (+ $x@@0 $y)))))) (and
(! (or %lbl%@18422 (=> (and
(word $x@@0)
(word $y)
(word (+ $x@@0 $y))
(Aligned $x@@0)) (= (Aligned $y) (Aligned (+ $x@@0 $y))))) :lblneg @18422)
(=> (=> (and
(word $x@@0)
(word $y)
(word (+ $x@@0 $y))
(Aligned $x@@0)) (= (Aligned $y) (Aligned (+ $x@@0 $y)))) true))))))))))
(let ((PreconditionGeneratedEntry_correct@@8 (=> (! (and %lbl%+18148 true) :lblpos +18148) anon0_correct@@8)))
PreconditionGeneratedEntry_correct@@8))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5306 () Bool)
(declare-fun call5263formal@$x@0 () (_ BitVec 32))
(declare-fun $x@@1 () Int)
(declare-fun call5263formal@$y@0 () (_ BitVec 32))
(declare-fun $y@@0 () Int)
(declare-fun %lbl%@18685 () Bool)
(declare-fun %lbl%@18739 () Bool)
(declare-fun %lbl%+18465 () Bool)
(push 1)
(set-info :boogie-vc-id __subAligned)
(assert (not
(let ((anon0_correct@@9 (=> (! (and %lbl%+5306 true) :lblpos +5306) (=> (= 0 (I #x00000000)) (=> (and
(= 2 (I #x00000002))
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))) (=> (and
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
(= call5263formal@$x@0 (B $x@@1))
(= call5263formal@$y@0 (B $y@@0))
(=> ($Aligned call5263formal@$x@0) (= ($Aligned call5263formal@$y@0) ($Aligned ($sub call5263formal@$x@0 call5263formal@$y@0))))) (and
(! (or %lbl%@18685 (=> (and
(word $x@@1)
(word $y@@0)
(word (- $x@@1 $y@@0))
(Aligned (I (B $x@@1)))) (= (Aligned (I (B $y@@0))) (Aligned (I (B (- $x@@1 $y@@0))))))) :lblneg @18685)
(=> (=> (and
(word $x@@1)
(word $y@@0)
(word (- $x@@1 $y@@0))
(Aligned (I (B $x@@1)))) (= (Aligned (I (B $y@@0))) (Aligned (I (B (- $x@@1 $y@@0)))))) (and
(! (or %lbl%@18739 (=> (and
(word $x@@1)
(word $y@@0)
(word (- $x@@1 $y@@0))
(Aligned $x@@1)) (= (Aligned $y@@0) (Aligned (- $x@@1 $y@@0))))) :lblneg @18739)
(=> (=> (and
(word $x@@1)
(word $y@@0)
(word (- $x@@1 $y@@0))
(Aligned $x@@1)) (= (Aligned $y@@0) (Aligned (- $x@@1 $y@@0)))) true))))))))))
(let ((PreconditionGeneratedEntry_correct@@9 (=> (! (and %lbl%+18465 true) :lblpos +18465) anon0_correct@@9)))
PreconditionGeneratedEntry_correct@@9))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5336 () Bool)
(declare-fun %lbl%@19029 () Bool)
(declare-fun $i () Int)
(declare-fun call5325formal@$b@0 () (_ BitVec 32))
(declare-fun %lbl%@19051 () Bool)
(declare-fun %lbl%@19086 () Bool)
(declare-fun %lbl%@19100 () Bool)
(declare-fun %lbl%@19110 () Bool)
(declare-fun %lbl%@19120 () Bool)
(declare-fun %lbl%@19130 () Bool)
(declare-fun %lbl%@19138 () Bool)
(declare-fun %lbl%@19146 () Bool)
(declare-fun %lbl%+18782 () Bool)
(push 1)
(set-info :boogie-vc-id __notAligned)
(assert (not
(let ((anon0_correct@@10 (=> (! (and %lbl%+5336 true) :lblpos +5336) (=> (and
(= 0 (I #x00000000))
(= 2 (I #x00000002))
(= 3 (I #x00000003))
(= 4 (I #x00000004))) (=> (and
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
(= (+ (+ 2147483647 2147483647) 1) (I #xffffffff))
(= (- (+ 2147483647 2147483647) 2) (I #xfffffffc))) (and
(! (or %lbl%@19029 (and
(TBV (B $i))
(TBV #xfffffffc))) :lblneg @19029)
(=> (and
(TBV (B $i))
(TBV #xfffffffc)) (=> (= call5325formal@$b@0 (B $i)) (and
(! (or %lbl%@19051 ($Aligned call5325formal@$b@0)) :lblneg @19051)
(=> ($Aligned call5325formal@$b@0) (=> (and
(not ($Aligned ($add call5325formal@$b@0 #x00000001)))
(not ($Aligned ($add call5325formal@$b@0 #x00000002)))
(not ($Aligned ($add call5325formal@$b@0 #x00000003)))
($le call5325formal@$b@0 #xfffffffc)) (and
(! (or %lbl%@19086 (<= $i (- (+ 2147483647 2147483647) 2))) :lblneg @19086)
(=> (<= $i (- (+ 2147483647 2147483647) 2)) (and
(! (or %lbl%@19100 (not (Aligned (+ $i 1)))) :lblneg @19100)
(=> (not (Aligned (+ $i 1))) (and
(! (or %lbl%@19110 (not (Aligned (+ $i 2)))) :lblneg @19110)
(=> (not (Aligned (+ $i 2))) (and
(! (or %lbl%@19120 (not (Aligned (+ $i 3)))) :lblneg @19120)
(=> (not (Aligned (+ $i 3))) (and
(! (or %lbl%@19130 (word (+ $i 1))) :lblneg @19130)
(=> (word (+ $i 1)) (and
(! (or %lbl%@19138 (word (+ $i 2))) :lblneg @19138)
(=> (word (+ $i 2)) (and
(! (or %lbl%@19146 (word (+ $i 3))) :lblneg @19146)
(=> (word (+ $i 3)) true)))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@10 (=> (! (and %lbl%+18782 true) :lblpos +18782) (=> (and
(Aligned $i)
(word $i)) anon0_correct@@10))))
PreconditionGeneratedEntry_correct@@10))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5348 () Bool)
(declare-fun call5345formal@$x@0 () (_ BitVec 32))
(declare-fun $x@@2 () Int)
(declare-fun %lbl%@19428 () Bool)
(declare-fun %lbl%@19446 () Bool)
(declare-fun %lbl%+19155 () Bool)
(push 1)
(set-info :boogie-vc-id __is4kAligned)
(assert (not
(let ((anon0_correct@@11 (=> (! (and %lbl%+5348 true) :lblpos +5348) (=> (and
(= 0 (I #x00000000))
(= 2 (I #x00000002))
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))) (=> (and
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
(= 4096 (I #x00001000))
(= 4095 (I #x00000fff))
(= call5345formal@$x@0 (B $x@@2))
(= ($and ($sub call5345formal@$x@0 ($and call5345formal@$x@0 #x00000fff)) #x00000fff) #x00000000)
($le #x00000000 ($and call5345formal@$x@0 #x00000fff))
($le ($and call5345formal@$x@0 #x00000fff) #x00000fff)) (and
(! (or %lbl%@19428 (= (q@and (- $x@@2 (q@and $x@@2 4095)) 4095) 0)) :lblneg @19428)
(=> (= (q@and (- $x@@2 (q@and $x@@2 4095)) 4095) 0) (and
(! (or %lbl%@19446 (and
(<= 0 (q@and $x@@2 4095))
(<= (q@and $x@@2 4095) 4095))) :lblneg @19446)
(=> (and
(<= 0 (q@and $x@@2 4095))
(<= (q@and $x@@2 4095) 4095)) true)))))))))
(let ((PreconditionGeneratedEntry_correct@@11 (=> (! (and %lbl%+19155 true) :lblpos +19155) (=> (and
(word $x@@2)
(word (- $x@@2 4096))) anon0_correct@@11))))
PreconditionGeneratedEntry_correct@@11))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5361 () Bool)
(declare-fun call5358formal@$x@0 () (_ BitVec 32))
(declare-fun $x@@3 () Int)
(declare-fun %lbl%@19785 () Bool)
(declare-fun %lbl%@19807 () Bool)
(declare-fun %lbl%+19469 () Bool)
(push 1)
(set-info :boogie-vc-id __is2m4kAligned)
(assert (not
(let ((anon0_correct@@12 (=> (! (and %lbl%+5361 true) :lblpos +5361) (=> (and
(= 0 (I #x00000000))
(= 2 (I #x00000002))) (=> (and
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))) (=> (and
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
(= 4096 (I #x00001000))
(= 4095 (I #x00000fff))
(= 2097152 (I #x00200000))
(= 2097151 (I #x001fffff))
(= call5358formal@$x@0 (B $x@@3))
(= ($and ($sub ($add call5358formal@$x@0 #x00200000) ($and call5358formal@$x@0 #x001fffff)) #x00000fff) #x00000000)
($le #x00000000 ($and call5358formal@$x@0 #x001fffff))
($le ($and call5358formal@$x@0 #x001fffff) #x001fffff)) (and
(! (or %lbl%@19785 (= (q@and (- (+ $x@@3 2097152) (q@and $x@@3 2097151)) 4095) 0)) :lblneg @19785)
(=> (= (q@and (- (+ $x@@3 2097152) (q@and $x@@3 2097151)) 4095) 0) (and
(! (or %lbl%@19807 (and
(<= 0 (q@and $x@@3 2097151))
(<= (q@and $x@@3 2097151) 2097151))) :lblneg @19807)
(=> (and
(<= 0 (q@and $x@@3 2097151))
(<= (q@and $x@@3 2097151) 2097151)) true))))))))))
(let ((PreconditionGeneratedEntry_correct@@12 (=> (! (and %lbl%+19469 true) :lblpos +19469) (=> (and
(word $x@@3)
(word (- $x@@3 2097152))
(word (+ $x@@3 2097152))) anon0_correct@@12))))
PreconditionGeneratedEntry_correct@@12))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5373 () Bool)
(declare-fun call5370formal@$x@0 () (_ BitVec 32))
(declare-fun $x@@4 () Int)
(declare-fun %lbl%@20066 () Bool)
(declare-fun %lbl%@20091 () Bool)
(declare-fun %lbl%@20105 () Bool)
(declare-fun %lbl%+19830 () Bool)
(push 1)
(set-info :boogie-vc-id __add4kAligned)
(assert (not
(let ((anon0_correct@@13 (=> (! (and %lbl%+5373 true) :lblpos +5373) (=> (= 0 (I #x00000000)) (=> (and
(= 2 (I #x00000002))
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))) (=> (and
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
(= 4096 (I #x00001000))
(= 4095 (I #x00000fff))
(= call5370formal@$x@0 (B $x@@4))) (and
(! (or %lbl%@20066 (= ($and call5370formal@$x@0 #x00000fff) #x00000000)) :lblneg @20066)
(=> (= ($and call5370formal@$x@0 #x00000fff) #x00000000) (=> (and
(= ($and ($add call5370formal@$x@0 #x00001000) #x00000fff) #x00000000)
($Aligned call5370formal@$x@0)) (and
(! (or %lbl%@20091 (= (q@and (+ $x@@4 4096) 4095) 0)) :lblneg @20091)
(=> (= (q@and (+ $x@@4 4096) 4095) 0) (and
(! (or %lbl%@20105 (Aligned $x@@4)) :lblneg @20105)
(=> (Aligned $x@@4) true)))))))))))))
(let ((PreconditionGeneratedEntry_correct@@13 (=> (! (and %lbl%+19830 true) :lblpos +19830) (=> (= (q@and $x@@4 4095) 0) (=> (and
(word $x@@4)
(word (+ $x@@4 4096))) anon0_correct@@13)))))
PreconditionGeneratedEntry_correct@@13))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5422 () Bool)
(declare-fun %lbl%@20319 () Bool)
(declare-fun $unitSize () Int)
(declare-fun call5393formal@$unitSize@0 () (_ BitVec 32))
(declare-fun %lbl%@20339 () Bool)
(declare-fun %lbl%@20381 () Bool)
(declare-fun $heapLo () Int)
(declare-fun %lbl%@20403 () Bool)
(declare-fun %lbl%@20425 () Bool)
(declare-fun %lbl%@20435 () Bool)
(declare-fun %lbl%@20457 () Bool)
(declare-fun %lbl%+20110 () Bool)
(push 1)
(set-info :boogie-vc-id __initialize)
(assert (not
(let ((anon0_correct@@14 (=> (! (and %lbl%+5422 true) :lblpos +5422) (=> (and
(= 0 (I #x00000000))
(= 2 (I #x00000002))) (=> (and
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))) (and
(! (or %lbl%@20319 ($le (B $unitSize) (B 16777215))) :lblneg @20319)
(=> ($le (B $unitSize) (B 16777215)) (=> (= call5393formal@$unitSize@0 (B $unitSize)) (and
(! (or %lbl%@20339 ($le call5393formal@$unitSize@0 #x00ffffff)) :lblneg @20339)
(=> ($le call5393formal@$unitSize@0 #x00ffffff) (=> (= ($shr #x00000000 #x00000007) #x00000000) (=> (and
(= ($shr ($mul #x00000080 call5393formal@$unitSize@0) #x00000007) call5393formal@$unitSize@0)
(= ($shr ($mul #x00000100 call5393formal@$unitSize@0) #x00000007) ($add call5393formal@$unitSize@0 call5393formal@$unitSize@0))) (and
(! (or %lbl%@20381 (= (BitIndex $heapLo (+ $heapLo (* 128 $unitSize))) (* 4 $unitSize))) :lblneg @20381)
(=> (= (BitIndex $heapLo (+ $heapLo (* 128 $unitSize))) (* 4 $unitSize)) (and
(! (or %lbl%@20403 (= (BitIndex $heapLo (+ $heapLo (* 256 $unitSize))) (* 8 $unitSize))) :lblneg @20403)
(=> (= (BitIndex $heapLo (+ $heapLo (* 256 $unitSize))) (* 8 $unitSize)) (and
(! (or %lbl%@20425 (= (BitIndex $heapLo $heapLo) 0)) :lblneg @20425)
(=> (= (BitIndex $heapLo $heapLo) 0) (and
(! (or %lbl%@20435 (= (BitIndex $heapLo (+ $heapLo (* 128 $unitSize))) (* 4 $unitSize))) :lblneg @20435)
(=> (= (BitIndex $heapLo (+ $heapLo (* 128 $unitSize))) (* 4 $unitSize)) (and
(! (or %lbl%@20457 (= (BitIndex $heapLo (+ $heapLo (* 256 $unitSize))) (* 8 $unitSize))) :lblneg @20457)
(=> (= (BitIndex $heapLo (+ $heapLo (* 256 $unitSize))) (* 8 $unitSize)) true))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@14 (=> (! (and %lbl%+20110 true) :lblpos +20110) (=> (word (* $unitSize 256)) anon0_correct@@14))))
PreconditionGeneratedEntry_correct@@14))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5576 () Bool)
(declare-fun %lbl%@20962 () Bool)
(declare-fun $idx () Int)
(declare-fun $g1 () Int)
(declare-fun %lbl%@20972 () Bool)
(declare-fun %lbl%@20988 () Bool)
(declare-fun $i2 () Int)
(declare-fun $i0 () Int)
(declare-fun %lbl%@21044 () Bool)
(declare-fun $i1 () Int)
(declare-fun %lbl%@21138 () Bool)
(declare-fun $a () (Array Int Int))
(declare-fun $aBase () Int)
(declare-fun $off () Int)
(declare-fun %lbl%@21184 () Bool)
(declare-fun $bb () (Array Int Int))
(declare-fun $g2 () Int)
(declare-fun %lbl%@21195 () Bool)
(declare-fun %lbl%@21207 () Bool)
(declare-fun %lbl%@21227 () Bool)
(declare-fun %lbl%@21231 () Bool)
(declare-fun %lbl%@21293 () Bool)
(declare-fun %lbl%@21361 () Bool)
(declare-fun %lbl%@21366 () Bool)
(declare-fun %lbl%@21394 () Bool)
(declare-fun %lbl%+20480 () Bool)
(push 1)
(set-info :boogie-vc-id __bb4Zero)
(assert (not
(let ((anon0_correct@@15 (=> (! (and %lbl%+5576 true) :lblpos +5576) (=> (and
(= 0 (I #x00000000))
(= 2 (I #x00000002))) (=> (and
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))) (and
(! (or %lbl%@20962 (and
(word $idx)
(word $g1))) :lblneg @20962)
(=> (and
(word $idx)
(word $g1)) (and
(! (or %lbl%@20972 (word (- (I (B $idx)) (I (B $g1))))) :lblneg @20972)
(=> (word (- (I (B $idx)) (I (B $g1)))) (and
(! (or %lbl%@20988 (=> ($le ($shr (B (- $i2 $i0)) #x00000007) #x01ffffff) (= (I ($mul #x00000080 ($shr (B (- $i2 $i0)) #x00000007))) (* 128 (I ($shr (B (- $i2 $i0)) #x00000007)))))) :lblneg @20988)
(=> (=> ($le ($shr (B (- $i2 $i0)) #x00000007) #x01ffffff) (= (I ($mul #x00000080 ($shr (B (- $i2 $i0)) #x00000007))) (* 128 (I ($shr (B (- $i2 $i0)) #x00000007))))) (and
(! (or %lbl%@21044 (forall (($i@@0 Int) ) (! (=> (and
(TV $i@@0)
(word (- $i@@0 $i0))
(<= $i1 $i@@0)
(< $i@@0 $i2)) (= (Aligned (I (B (- $i@@0 $i0)))) ($Aligned (B (- $i@@0 $i0)))))
 :qid |BitVecto.226:19|
 :skolemid |45|
 :pattern ( (TV $i@@0))
))) :lblneg @21044)
(=> (forall (($i@@1 Int) ) (! (=> (and
(TV $i@@1)
(word (- $i@@1 $i0))
(<= $i1 $i@@1)
(< $i@@1 $i2)) (= (Aligned (I (B (- $i@@1 $i0)))) ($Aligned (B (- $i@@1 $i0)))))
 :qid |BitVecto.226:19|
 :skolemid |45|
 :pattern ( (TV $i@@1))
)) (and
(! (or %lbl%@21138 (forall ((i@@11 Int) ) (! (=> (and
(TV i@@11)
(<= $i1 i@@11)
(< i@@11 (+ $i2 128))) (= (select $a (+ $aBase (- i@@11 $i0))) $off))
 :qid |BitVecto.80:20|
 :skolemid |21|
 :pattern ( (TV i@@11))
))) :lblneg @21138)
(=> (forall ((i@@12 Int) ) (! (=> (and
(TV i@@12)
(<= $i1 i@@12)
(< i@@12 (+ $i2 128))) (= (select $a (+ $aBase (- i@@12 $i0))) $off))
 :qid |BitVecto.80:20|
 :skolemid |21|
 :pattern ( (TV i@@12))
)) (and
(! (or %lbl%@21184 ($bbvec4 $a $off $aBase $bb $i0 $i1 $i2 $g1 $g2)) :lblneg @21184)
(=> ($bbvec4 $a $off $aBase $bb $i0 $i1 $i2 $g1 $g2) (and
(! (or %lbl%@21195 (and
($Aligned (B $idx))
($Aligned (B $g1)))) :lblneg @21195)
(=> (and
($Aligned (B $idx))
($Aligned (B $g1))) (and
(! (or %lbl%@21207 (= (B (- $i2 $i0)) ($mul #x00000020 ($sub (B $idx) (B $g1))))) :lblneg @21207)
(=> (= (B (- $i2 $i0)) ($mul #x00000020 ($sub (B $idx) (B $g1)))) (and
(! (or %lbl%@21227 (= $i1 $i0)) :lblneg @21227)
(=> (= $i1 $i0) (and
(! (or %lbl%@21231 (=> (and
($le ($shr (B (- $i2 $i0)) #x00000007) #x01ffffff)
(= ($mul #x00000080 ($shr (B (- $i2 $i0)) #x00000007)) (B (- $i2 $i0)))) (= (- $idx $g1) (* 4 (I ($shr (B (- $i2 $i0)) #x00000007)))))) :lblneg @21231)
(=> (=> (and
($le ($shr (B (- $i2 $i0)) #x00000007) #x01ffffff)
(= ($mul #x00000080 ($shr (B (- $i2 $i0)) #x00000007)) (B (- $i2 $i0)))) (= (- $idx $g1) (* 4 (I ($shr (B (- $i2 $i0)) #x00000007))))) (and
(! (or %lbl%@21293 (forall ((i@@13 Int) ) (! (=> (and
(TV i@@13)
(<= $i2 i@@13)
(< i@@13 (+ $i2 128))) (and
($le (B (- $i2 $i0)) (B (- i@@13 $i0)))
($le (B (- i@@13 $i0)) ($add (B (- $i2 $i0)) #x0000007f))))
 :qid |BitVecto.87:20|
 :skolemid |22|
 :pattern ( (TV i@@13))
))) :lblneg @21293)
(=> (forall ((i@@14 Int) ) (! (=> (and
(TV i@@14)
(<= $i2 i@@14)
(< i@@14 (+ $i2 128))) (and
($le (B (- $i2 $i0)) (B (- i@@14 $i0)))
($le (B (- i@@14 $i0)) ($add (B (- $i2 $i0)) #x0000007f))))
 :qid |BitVecto.87:20|
 :skolemid |22|
 :pattern ( (TV i@@14))
)) (and
(! (or %lbl%@21361 (between $g1 $g2 $idx)) :lblneg @21361)
(=> (between $g1 $g2 $idx) (and
(! (or %lbl%@21366 (= (B 0) #x00000000)) :lblneg @21366)
(=> (= (B 0) #x00000000) (=> ($bbvec4 $a $off $aBase (store $bb $idx 0) $i0 $i1 (+ $i2 128) $g1 $g2) (and
(! (or %lbl%@21394 (bbvec4 $a $off $aBase (store $bb $idx 0) $i0 $i1 (+ $i2 128) $g1 $g2)) :lblneg @21394)
(=> (bbvec4 $a $off $aBase (store $bb $idx 0) $i0 $i1 (+ $i2 128) $g1 $g2) true))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@15 (=> (! (and %lbl%+20480 true) :lblpos +20480) (=> (and
(forall (($i@@2 Int) ) (! (=> (and
(TV $i@@2)
(<= $i1 $i@@2)
(< $i@@2 (+ $i2 128))) (= (select $a (+ $aBase (- $i@@2 $i0))) $off))
 :qid |BitVecto.73:20|
 :skolemid |14|
 :pattern ( (TV $i@@2))
))
(bbvec4 $a $off $aBase $bb $i0 $i1 $i2 $g1 $g2)) (=> (and
(word (- $i1 $i0))
(word (- $i2 $i0))
(word (- $i2 $i1))
(word (- (+ $i2 128) $i0))
(word $idx)
(word $g1)
(Aligned $idx)
(Aligned $g1)
(= (- $i2 $i1) (* 32 (- $idx $g1)))
(= $i1 $i0)
(between $g1 $g2 $idx)) anon0_correct@@15)))))
PreconditionGeneratedEntry_correct@@15))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5623 () Bool)
(declare-fun $k () Int)
(declare-fun $i0@@0 () Int)
(declare-fun %lbl%@21871 () Bool)
(declare-fun $g1@@0 () Int)
(declare-fun $g2@@0 () Int)
(declare-fun $idx@@0 () Int)
(declare-fun %lbl%@21879 () Bool)
(declare-fun %lbl%@21897 () Bool)
(declare-fun $bbb () Int)
(declare-fun $a@@0 () (Array Int Int))
(declare-fun $aBase@@0 () Int)
(declare-fun $off@@0 () Int)
(declare-fun %lbl%+21425 () Bool)
(declare-fun $bb@@0 () (Array Int Int))
(declare-fun $i1@@0 () Int)
(declare-fun $i2@@0 () Int)
(push 1)
(set-info :boogie-vc-id __bb4GetBit)
(assert (not
(let ((anon0_correct@@16 (=> (! (and %lbl%+5623 true) :lblpos +5623) (=> (= 0 (I #x00000000)) (=> (and
(= 2 (I #x00000002))
(= 3 (I #x00000003))) (=> (and
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
($le ($and ($shr (B (- $k $i0@@0)) #x00000002) #x0000001f) #x0000001f)) (and
(! (or %lbl%@21871 (between $g1@@0 $g2@@0 $idx@@0)) :lblneg @21871)
(=> (between $g1@@0 $g2@@0 $idx@@0) (and
(! (or %lbl%@21879 (< (q@and (shr (- $k $i0@@0) 2) 31) 32)) :lblneg @21879)
(=> (< (q@and (shr (- $k $i0@@0) 2) 31) 32) (and
(! (or %lbl%@21897 (= (= $bbb 0) (= (select $a@@0 (+ $aBase@@0 (- $k $i0@@0))) $off@@0))) :lblneg @21897)
(=> (= (= $bbb 0) (= (select $a@@0 (+ $aBase@@0 (- $k $i0@@0))) $off@@0)) true))))))))))))
(let ((PreconditionGeneratedEntry_correct@@16 (=> (! (and %lbl%+21425 true) :lblpos +21425) (=> (bbvec4 $a@@0 $off@@0 $aBase@@0 $bb@@0 $i0@@0 $i1@@0 $i2@@0 $g1@@0 $g2@@0) (=> (and
(TV $k)
(word (- $k $i0@@0))
(<= $i1@@0 $k)
(< $k $i2@@0)
(Aligned (- $k $i0@@0))
(= $idx@@0 (+ $g1@@0 (* 4 (shr (- $k $i0@@0) 7))))
(= $bbb (q@and (select $bb@@0 $idx@@0) (shl 1 (q@and (shr (- $k $i0@@0) 2) 31))))
(word (- $i1@@0 $i0@@0))
(word (- $i2@@0 $i0@@0))) anon0_correct@@16)))))
PreconditionGeneratedEntry_correct@@16))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5781 () Bool)
(declare-fun %lbl%@22420 () Bool)
(declare-fun $k@@0 () Int)
(declare-fun $i0@@1 () Int)
(declare-fun %lbl%@22446 () Bool)
(declare-fun %lbl%@22458 () Bool)
(declare-fun $i1@@1 () Int)
(declare-fun $i2@@1 () Int)
(declare-fun %lbl%@22564 () Bool)
(declare-fun $a@@1 () (Array Int Int))
(declare-fun $off@@1 () Int)
(declare-fun $aBase@@1 () Int)
(declare-fun $bb@@1 () (Array Int Int))
(declare-fun $g1@@1 () Int)
(declare-fun $g2@@1 () Int)
(declare-fun %lbl%@22575 () Bool)
(declare-fun %lbl%@22608 () Bool)
(declare-fun $on () Int)
(declare-fun %lbl%@22612 () Bool)
(declare-fun $idx@@1 () Int)
(declare-fun %lbl%@22634 () Bool)
(declare-fun $bbb@@0 () Int)
(declare-fun %lbl%@22665 () Bool)
(declare-fun $ret () (Array Int Int))
(declare-fun %lbl%@22717 () Bool)
(declare-fun %lbl%@22751 () Bool)
(declare-fun %lbl%@22785 () Bool)
(declare-fun %lbl%@22793 () Bool)
(declare-fun %lbl%@22811 () Bool)
(declare-fun %lbl%+21924 () Bool)
(push 1)
(set-info :boogie-vc-id __bb4SetBit)
(assert (not
(let ((anon0_correct@@17 (=> (! (and %lbl%+5781 true) :lblpos +5781) (=> (and
(= 0 (I #x00000000))
(= 2 (I #x00000002))) (=> (and
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))) (and
(! (or %lbl%@22420 (= (B (shr (- $k@@0 $i0@@1) 7)) ($shr (B (- $k@@0 $i0@@1)) #x00000007))) :lblneg @22420)
(=> (= (B (shr (- $k@@0 $i0@@1) 7)) ($shr (B (- $k@@0 $i0@@1)) #x00000007)) (and
(! (or %lbl%@22446 (Aligned (I (B (- $k@@0 $i0@@1))))) :lblneg @22446)
(=> (Aligned (I (B (- $k@@0 $i0@@1)))) (and
(! (or %lbl%@22458 (forall (($i@@3 Int) ) (! (=> (and
(TV $i@@3)
(word (- $i@@3 $i0@@1))
(<= $i1@@1 $i@@3)
(< $i@@3 $i2@@1)) (= (Aligned (I (B (- $i@@3 $i0@@1)))) ($Aligned (B (- $i@@3 $i0@@1)))))
 :qid |BitVecto.243:19|
 :skolemid |46|
 :pattern ( (TV $i@@3))
))) :lblneg @22458)
(=> (forall (($i@@4 Int) ) (! (=> (and
(TV $i@@4)
(word (- $i@@4 $i0@@1))
(<= $i1@@1 $i@@4)
(< $i@@4 $i2@@1)) (= (Aligned (I (B (- $i@@4 $i0@@1)))) ($Aligned (B (- $i@@4 $i0@@1)))))
 :qid |BitVecto.243:19|
 :skolemid |46|
 :pattern ( (TV $i@@4))
)) (and
(! (or %lbl%@22564 ($bbvec4 $a@@1 $off@@1 $aBase@@1 $bb@@1 $i0@@1 $i1@@1 $i2@@1 $g1@@1 $g2@@1)) :lblneg @22564)
(=> ($bbvec4 $a@@1 $off@@1 $aBase@@1 $bb@@1 $i0@@1 $i1@@1 $i2@@1 $g1@@1 $g2@@1) (and
(! (or %lbl%@22575 (and
(TV $k@@0)
(word (- $k@@0 $i0@@1))
(<= $i1@@1 $k@@0)
(< $k@@0 $i2@@1)
($Aligned (B (- $k@@0 $i0@@1))))) :lblneg @22575)
(=> (and
(TV $k@@0)
(word (- $k@@0 $i0@@1))
(<= $i1@@1 $k@@0)
(< $k@@0 $i2@@1)
($Aligned (B (- $k@@0 $i0@@1)))) (and
(! (or %lbl%@22608 (not (= $on $off@@1))) :lblneg @22608)
(=> (not (= $on $off@@1)) (and
(! (or %lbl%@22612 (= $idx@@1 (+ $g1@@1 (* 4 (I ($shr (B (- $k@@0 $i0@@1)) #x00000007)))))) :lblneg @22612)
(=> (= $idx@@1 (+ $g1@@1 (* 4 (I ($shr (B (- $k@@0 $i0@@1)) #x00000007))))) (and
(! (or %lbl%@22634 (= (B $bbb@@0) ($or (B (select $bb@@1 $idx@@1)) ($shl #x00000001 ($and ($shr (B (- $k@@0 $i0@@1)) #x00000002) #x0000001f))))) :lblneg @22634)
(=> (= (B $bbb@@0) ($or (B (select $bb@@1 $idx@@1)) ($shl #x00000001 ($and ($shr (B (- $k@@0 $i0@@1)) #x00000002) #x0000001f)))) (and
(! (or %lbl%@22665 (= $ret (store $bb@@1 $idx@@1 $bbb@@0))) :lblneg @22665)
(=> (= $ret (store $bb@@1 $idx@@1 $bbb@@0)) (=> ($bbvec4 (store $a@@1 (+ $aBase@@1 (- $k@@0 $i0@@1)) $on) $off@@1 $aBase@@1 $ret $i0@@1 $i1@@1 $i2@@1 $g1@@1 $g2@@1) (=> (and
(between $g1@@1 $g2@@1 $idx@@1)
($le ($and ($shr (B (- $k@@0 $i0@@1)) #x00000002) #x0000001f) #x0000001f)) (and
(! (or %lbl%@22717 ($bbvec4 (store $a@@1 (+ $aBase@@1 (- $k@@0 $i0@@1)) $on) $off@@1 $aBase@@1 $ret $i0@@1 $i1@@1 $i2@@1 $g1@@1 $g2@@1)) :lblneg @22717)
(=> ($bbvec4 (store $a@@1 (+ $aBase@@1 (- $k@@0 $i0@@1)) $on) $off@@1 $aBase@@1 $ret $i0@@1 $i1@@1 $i2@@1 $g1@@1 $g2@@1) (and
(! (or %lbl%@22751 (bbvec4 (store $a@@1 (+ $aBase@@1 (- $k@@0 $i0@@1)) $on) $off@@1 $aBase@@1 $ret $i0@@1 $i1@@1 $i2@@1 $g1@@1 $g2@@1)) :lblneg @22751)
(=> (bbvec4 (store $a@@1 (+ $aBase@@1 (- $k@@0 $i0@@1)) $on) $off@@1 $aBase@@1 $ret $i0@@1 $i1@@1 $i2@@1 $g1@@1 $g2@@1) (and
(! (or %lbl%@22785 (between $g1@@1 $g2@@1 $idx@@1)) :lblneg @22785)
(=> (between $g1@@1 $g2@@1 $idx@@1) (and
(! (or %lbl%@22793 (< (q@and (shr (- $k@@0 $i0@@1) 2) 31) 32)) :lblneg @22793)
(=> (< (q@and (shr (- $k@@0 $i0@@1) 2) 31) 32) (and
(! (or %lbl%@22811 (= (* 4 (shr (- $k@@0 $i0@@1) 7)) (BitIndex $i0@@1 $k@@0))) :lblneg @22811)
(=> (= (* 4 (shr (- $k@@0 $i0@@1) 7)) (BitIndex $i0@@1 $k@@0)) true)))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@17 (=> (! (and %lbl%+21924 true) :lblpos +21924) (=> (bbvec4 $a@@1 $off@@1 $aBase@@1 $bb@@1 $i0@@1 $i1@@1 $i2@@1 $g1@@1 $g2@@1) (=> (and
(TV $k@@0)
(word (- $k@@0 $i0@@1))
(<= $i1@@1 $k@@0)
(< $k@@0 $i2@@1)
(Aligned (- $k@@0 $i0@@1))
(not (= $on $off@@1))
(= $idx@@1 (+ $g1@@1 (* 4 (shr (- $k@@0 $i0@@1) 7))))
(= $bbb@@0 (q@or (select $bb@@1 $idx@@1) (shl 1 (q@and (shr (- $k@@0 $i0@@1) 2) 31))))
(= $ret (store $bb@@1 $idx@@1 $bbb@@0))
(word (- $i1@@1 $i0@@1))
(word (- $i2@@1 $i0@@1))) anon0_correct@@17)))))
PreconditionGeneratedEntry_correct@@17))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5931 () Bool)
(declare-fun %lbl%@23311 () Bool)
(declare-fun $idx@@2 () Int)
(declare-fun $g1@@2 () Int)
(declare-fun %lbl%@23321 () Bool)
(declare-fun %lbl%@23337 () Bool)
(declare-fun $i2@@2 () Int)
(declare-fun $i0@@2 () Int)
(declare-fun %lbl%@23393 () Bool)
(declare-fun $i1@@2 () Int)
(declare-fun %lbl%@23484 () Bool)
(declare-fun $a@@2 () (Array Int Int))
(declare-fun $aBase@@2 () Int)
(declare-fun %lbl%@23531 () Bool)
(declare-fun $bb@@2 () (Array Int Int))
(declare-fun $g2@@2 () Int)
(declare-fun %lbl%@23541 () Bool)
(declare-fun %lbl%@23553 () Bool)
(declare-fun %lbl%@23573 () Bool)
(declare-fun %lbl%@23577 () Bool)
(declare-fun %lbl%@23639 () Bool)
(declare-fun %lbl%@23707 () Bool)
(declare-fun %lbl%@23712 () Bool)
(declare-fun %lbl%@23739 () Bool)
(declare-fun %lbl%+22834 () Bool)
(push 1)
(set-info :boogie-vc-id __bb4Zero2)
(assert (not
(let ((anon0_correct@@18 (=> (! (and %lbl%+5931 true) :lblpos +5931) (=> (and
(= 0 (I #x00000000))
(= 2 (I #x00000002))) (=> (and
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))) (and
(! (or %lbl%@23311 (and
(word $idx@@2)
(word $g1@@2))) :lblneg @23311)
(=> (and
(word $idx@@2)
(word $g1@@2)) (and
(! (or %lbl%@23321 (word (- (I (B $idx@@2)) (I (B $g1@@2))))) :lblneg @23321)
(=> (word (- (I (B $idx@@2)) (I (B $g1@@2)))) (and
(! (or %lbl%@23337 (=> ($le ($shr (B (- $i2@@2 $i0@@2)) #x00000006) #x03ffffff) (= (I ($mul #x00000040 ($shr (B (- $i2@@2 $i0@@2)) #x00000006))) (* 64 (I ($shr (B (- $i2@@2 $i0@@2)) #x00000006)))))) :lblneg @23337)
(=> (=> ($le ($shr (B (- $i2@@2 $i0@@2)) #x00000006) #x03ffffff) (= (I ($mul #x00000040 ($shr (B (- $i2@@2 $i0@@2)) #x00000006))) (* 64 (I ($shr (B (- $i2@@2 $i0@@2)) #x00000006))))) (and
(! (or %lbl%@23393 (forall (($i@@5 Int) ) (! (=> (and
(TV $i@@5)
(word (- $i@@5 $i0@@2))
(<= $i1@@2 $i@@5)
(< $i@@5 $i2@@2)) (= (Aligned (I (B (- $i@@5 $i0@@2)))) ($Aligned (B (- $i@@5 $i0@@2)))))
 :qid |BitVecto.257:19|
 :skolemid |47|
 :pattern ( (TV $i@@5))
))) :lblneg @23393)
(=> (forall (($i@@6 Int) ) (! (=> (and
(TV $i@@6)
(word (- $i@@6 $i0@@2))
(<= $i1@@2 $i@@6)
(< $i@@6 $i2@@2)) (= (Aligned (I (B (- $i@@6 $i0@@2)))) ($Aligned (B (- $i@@6 $i0@@2)))))
 :qid |BitVecto.257:19|
 :skolemid |47|
 :pattern ( (TV $i@@6))
)) (and
(! (or %lbl%@23484 (forall ((i@@15 Int) ) (! (=> (and
(TV i@@15)
(<= $i1@@2 i@@15)
(< i@@15 (+ $i2@@2 64))) (= (select $a@@2 (+ $aBase@@2 (- i@@15 $i0@@2))) 0))
 :qid |BitVecto.108:20|
 :skolemid |23|
 :pattern ( (TV i@@15))
))) :lblneg @23484)
(=> (forall ((i@@16 Int) ) (! (=> (and
(TV i@@16)
(<= $i1@@2 i@@16)
(< i@@16 (+ $i2@@2 64))) (= (select $a@@2 (+ $aBase@@2 (- i@@16 $i0@@2))) 0))
 :qid |BitVecto.108:20|
 :skolemid |23|
 :pattern ( (TV i@@16))
)) (and
(! (or %lbl%@23531 ($bb2vec4 $a@@2 $aBase@@2 $bb@@2 $i0@@2 $i1@@2 $i2@@2 $g1@@2 $g2@@2)) :lblneg @23531)
(=> ($bb2vec4 $a@@2 $aBase@@2 $bb@@2 $i0@@2 $i1@@2 $i2@@2 $g1@@2 $g2@@2) (and
(! (or %lbl%@23541 (and
($Aligned (B $idx@@2))
($Aligned (B $g1@@2)))) :lblneg @23541)
(=> (and
($Aligned (B $idx@@2))
($Aligned (B $g1@@2))) (and
(! (or %lbl%@23553 (= (B (- $i2@@2 $i0@@2)) ($mul #x00000010 ($sub (B $idx@@2) (B $g1@@2))))) :lblneg @23553)
(=> (= (B (- $i2@@2 $i0@@2)) ($mul #x00000010 ($sub (B $idx@@2) (B $g1@@2)))) (and
(! (or %lbl%@23573 (= $i1@@2 $i0@@2)) :lblneg @23573)
(=> (= $i1@@2 $i0@@2) (and
(! (or %lbl%@23577 (=> (and
($le ($shr (B (- $i2@@2 $i0@@2)) #x00000006) #x03ffffff)
(= ($mul #x00000040 ($shr (B (- $i2@@2 $i0@@2)) #x00000006)) (B (- $i2@@2 $i0@@2)))) (= (- $idx@@2 $g1@@2) (* 4 (I ($shr (B (- $i2@@2 $i0@@2)) #x00000006)))))) :lblneg @23577)
(=> (=> (and
($le ($shr (B (- $i2@@2 $i0@@2)) #x00000006) #x03ffffff)
(= ($mul #x00000040 ($shr (B (- $i2@@2 $i0@@2)) #x00000006)) (B (- $i2@@2 $i0@@2)))) (= (- $idx@@2 $g1@@2) (* 4 (I ($shr (B (- $i2@@2 $i0@@2)) #x00000006))))) (and
(! (or %lbl%@23639 (forall ((i@@17 Int) ) (! (=> (and
(TV i@@17)
(<= $i2@@2 i@@17)
(< i@@17 (+ $i2@@2 64))) (and
($le (B (- $i2@@2 $i0@@2)) (B (- i@@17 $i0@@2)))
($le (B (- i@@17 $i0@@2)) ($add (B (- $i2@@2 $i0@@2)) #x0000003f))))
 :qid |BitVecto.115:20|
 :skolemid |24|
 :pattern ( (TV i@@17))
))) :lblneg @23639)
(=> (forall ((i@@18 Int) ) (! (=> (and
(TV i@@18)
(<= $i2@@2 i@@18)
(< i@@18 (+ $i2@@2 64))) (and
($le (B (- $i2@@2 $i0@@2)) (B (- i@@18 $i0@@2)))
($le (B (- i@@18 $i0@@2)) ($add (B (- $i2@@2 $i0@@2)) #x0000003f))))
 :qid |BitVecto.115:20|
 :skolemid |24|
 :pattern ( (TV i@@18))
)) (and
(! (or %lbl%@23707 (between $g1@@2 $g2@@2 $idx@@2)) :lblneg @23707)
(=> (between $g1@@2 $g2@@2 $idx@@2) (and
(! (or %lbl%@23712 (= (B 0) #x00000000)) :lblneg @23712)
(=> (= (B 0) #x00000000) (=> ($bb2vec4 $a@@2 $aBase@@2 (store $bb@@2 $idx@@2 0) $i0@@2 $i1@@2 (+ $i2@@2 64) $g1@@2 $g2@@2) (and
(! (or %lbl%@23739 (bb2vec4 $a@@2 $aBase@@2 (store $bb@@2 $idx@@2 0) $i0@@2 $i1@@2 (+ $i2@@2 64) $g1@@2 $g2@@2)) :lblneg @23739)
(=> (bb2vec4 $a@@2 $aBase@@2 (store $bb@@2 $idx@@2 0) $i0@@2 $i1@@2 (+ $i2@@2 64) $g1@@2 $g2@@2) true))))))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@18 (=> (! (and %lbl%+22834 true) :lblpos +22834) (=> (and
(forall (($i@@7 Int) ) (! (=> (and
(TV $i@@7)
(<= $i1@@2 $i@@7)
(< $i@@7 (+ $i2@@2 64))) (= (select $a@@2 (+ $aBase@@2 (- $i@@7 $i0@@2))) 0))
 :qid |BitVecto.107:20|
 :skolemid |15|
 :pattern ( (TV $i@@7))
))
(bb2vec4 $a@@2 $aBase@@2 $bb@@2 $i0@@2 $i1@@2 $i2@@2 $g1@@2 $g2@@2)) (=> (and
(word (- $i1@@2 $i0@@2))
(word (- $i2@@2 $i0@@2))
(word (- $i2@@2 $i1@@2))
(word (- (+ $i2@@2 64) $i0@@2))
(word $idx@@2)
(word $g1@@2)
(Aligned $idx@@2)
(Aligned $g1@@2)
(= (- $i2@@2 $i1@@2) (* 16 (- $idx@@2 $g1@@2)))
(= $i1@@2 $i0@@2)
(between $g1@@2 $g2@@2 $idx@@2)) anon0_correct@@18)))))
PreconditionGeneratedEntry_correct@@18))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+5975 () Bool)
(declare-fun $k@@1 () Int)
(declare-fun $i0@@3 () Int)
(declare-fun %lbl%@24172 () Bool)
(declare-fun $a@@3 () (Array Int Int))
(declare-fun $aBase@@3 () Int)
(declare-fun $bbb@@1 () Int)
(declare-fun %lbl%@24190 () Bool)
(declare-fun $g1@@3 () Int)
(declare-fun $g2@@3 () Int)
(declare-fun $idx@@3 () Int)
(declare-fun %lbl%@24198 () Bool)
(declare-fun %lbl%+23768 () Bool)
(declare-fun $bb@@3 () (Array Int Int))
(declare-fun $i1@@3 () Int)
(declare-fun $i2@@3 () Int)
(push 1)
(set-info :boogie-vc-id __bb4Get2Bit)
(assert (not
(let ((anon0_correct@@19 (=> (! (and %lbl%+5975 true) :lblpos +5975) (=> (= 0 (I #x00000000)) (=> (and
(= 2 (I #x00000002))
(= 3 (I #x00000003))) (=> (and
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))
($le ($and ($shr (B (- $k@@1 $i0@@3)) #x00000001) #x0000001f) #x0000001f)) (and
(! (or %lbl%@24172 (= (select $a@@3 (+ $aBase@@3 (- $k@@1 $i0@@3))) $bbb@@1)) :lblneg @24172)
(=> (= (select $a@@3 (+ $aBase@@3 (- $k@@1 $i0@@3))) $bbb@@1) (and
(! (or %lbl%@24190 (between $g1@@3 $g2@@3 $idx@@3)) :lblneg @24190)
(=> (between $g1@@3 $g2@@3 $idx@@3) (and
(! (or %lbl%@24198 (<= (q@and (shr (- $k@@1 $i0@@3) 1) 31) 31)) :lblneg @24198)
(=> (<= (q@and (shr (- $k@@1 $i0@@3) 1) 31) 31) true))))))))))))
(let ((PreconditionGeneratedEntry_correct@@19 (=> (! (and %lbl%+23768 true) :lblpos +23768) (=> (bb2vec4 $a@@3 $aBase@@3 $bb@@3 $i0@@3 $i1@@3 $i2@@3 $g1@@3 $g2@@3) (=> (and
(TV $k@@1)
(word (- $k@@1 $i0@@3))
(<= $i1@@3 $k@@1)
(< $k@@1 $i2@@3)
(Aligned (- $k@@1 $i0@@3))
(= $idx@@3 (+ $g1@@3 (* 4 (shr (- $k@@1 $i0@@3) 6))))
(= $bbb@@1 (q@and (shr (select $bb@@3 $idx@@3) (q@and (shr (- $k@@1 $i0@@3) 1) 31)) 3))) anon0_correct@@19)))))
PreconditionGeneratedEntry_correct@@19))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+6086 () Bool)
(declare-fun %lbl%@24744 () Bool)
(declare-fun $i0@@4 () Int)
(declare-fun $i1@@4 () Int)
(declare-fun $i2@@4 () Int)
(declare-fun %lbl%@24850 () Bool)
(declare-fun $a@@4 () (Array Int Int))
(declare-fun $aBase@@4 () Int)
(declare-fun $bb@@4 () (Array Int Int))
(declare-fun $g1@@4 () Int)
(declare-fun $g2@@4 () Int)
(declare-fun %lbl%@24860 () Bool)
(declare-fun $k@@2 () Int)
(declare-fun %lbl%@24893 () Bool)
(declare-fun $idx@@4 () Int)
(declare-fun %lbl%@24915 () Bool)
(declare-fun $val () Int)
(declare-fun %lbl%@24922 () Bool)
(declare-fun $bbb@@2 () Int)
(declare-fun %lbl%@24955 () Bool)
(declare-fun $_bbb () Int)
(declare-fun %lbl%@24984 () Bool)
(declare-fun $ret@@0 () (Array Int Int))
(declare-fun %lbl%@25035 () Bool)
(declare-fun %lbl%@25067 () Bool)
(declare-fun %lbl%@25075 () Bool)
(declare-fun %lbl%@25093 () Bool)
(declare-fun %lbl%+24217 () Bool)
(push 1)
(set-info :boogie-vc-id __bb4Set2Bit)
(assert (not
(let ((anon0_correct@@20 (=> (! (and %lbl%+6086 true) :lblpos +6086) (=> (and
(= 0 (I #x00000000))
(= 2 (I #x00000002))) (=> (and
(= 3 (I #x00000003))
(= 4 (I #x00000004))
(= 5 (I #x00000005))
(= 6 (I #x00000006))
(= 7 (I #x00000007))
(= 16 (I #x00000010))
(= 32 (I #x00000020))
(= 31 (I #x0000001f))
(= 64 (I #x00000040))
(= 63 (I #x0000003f))
(= 128 (I #x00000080))
(= 127 (I #x0000007f))
(= 256 (I #x00000100))
(= 16777215 (I #x00ffffff))
(= 33554431 (I #x01ffffff))
(= 67108863 (I #x03ffffff))) (and
(! (or %lbl%@24744 (forall (($i@@8 Int) ) (! (=> (and
(TV $i@@8)
(word (- $i@@8 $i0@@4))
(<= $i1@@4 $i@@8)
(< $i@@8 $i2@@4)) (= (Aligned (I (B (- $i@@8 $i0@@4)))) ($Aligned (B (- $i@@8 $i0@@4)))))
 :qid |BitVecto.272:19|
 :skolemid |48|
 :pattern ( (TV $i@@8))
))) :lblneg @24744)
(=> (forall (($i@@9 Int) ) (! (=> (and
(TV $i@@9)
(word (- $i@@9 $i0@@4))
(<= $i1@@4 $i@@9)
(< $i@@9 $i2@@4)) (= (Aligned (I (B (- $i@@9 $i0@@4)))) ($Aligned (B (- $i@@9 $i0@@4)))))
 :qid |BitVecto.272:19|
 :skolemid |48|
 :pattern ( (TV $i@@9))
)) (and
(! (or %lbl%@24850 ($bb2vec4 $a@@4 $aBase@@4 $bb@@4 $i0@@4 $i1@@4 $i2@@4 $g1@@4 $g2@@4)) :lblneg @24850)
(=> ($bb2vec4 $a@@4 $aBase@@4 $bb@@4 $i0@@4 $i1@@4 $i2@@4 $g1@@4 $g2@@4) (and
(! (or %lbl%@24860 (and
(TV $k@@2)
(word (- $k@@2 $i0@@4))
(<= $i1@@4 $k@@2)
(< $k@@2 $i2@@4)
($Aligned (B (- $k@@2 $i0@@4))))) :lblneg @24860)
(=> (and
(TV $k@@2)
(word (- $k@@2 $i0@@4))
(<= $i1@@4 $k@@2)
(< $k@@2 $i2@@4)
($Aligned (B (- $k@@2 $i0@@4)))) (and
(! (or %lbl%@24893 (= $idx@@4 (+ $g1@@4 (* 4 (I ($shr (B (- $k@@2 $i0@@4)) #x00000006)))))) :lblneg @24893)
(=> (= $idx@@4 (+ $g1@@4 (* 4 (I ($shr (B (- $k@@2 $i0@@4)) #x00000006))))) (and
(! (or %lbl%@24915 ($le (B $val) #x00000003)) :lblneg @24915)
(=> ($le (B $val) #x00000003) (and
(! (or %lbl%@24922 (= (B $bbb@@2) ($and (B (select $bb@@4 $idx@@4)) ($not ($shl #x00000003 ($and ($shr (B (- $k@@2 $i0@@4)) #x00000001) #x0000001f)))))) :lblneg @24922)
(=> (= (B $bbb@@2) ($and (B (select $bb@@4 $idx@@4)) ($not ($shl #x00000003 ($and ($shr (B (- $k@@2 $i0@@4)) #x00000001) #x0000001f))))) (and
(! (or %lbl%@24955 (= (B $_bbb) ($or (B $bbb@@2) ($shl (B $val) ($and ($shr (B (- $k@@2 $i0@@4)) #x00000001) #x0000001f))))) :lblneg @24955)
(=> (= (B $_bbb) ($or (B $bbb@@2) ($shl (B $val) ($and ($shr (B (- $k@@2 $i0@@4)) #x00000001) #x0000001f)))) (and
(! (or %lbl%@24984 (= $ret@@0 (store $bb@@4 $idx@@4 $_bbb))) :lblneg @24984)
(=> (= $ret@@0 (store $bb@@4 $idx@@4 $_bbb)) (=> ($bb2vec4 (store $a@@4 (+ $aBase@@4 (- $k@@2 $i0@@4)) $val) $aBase@@4 $ret@@0 $i0@@4 $i1@@4 $i2@@4 $g1@@4 $g2@@4) (=> (and
(between $g1@@4 $g2@@4 $idx@@4)
($le ($and ($shr (B (- $k@@2 $i0@@4)) #x00000001) #x0000001f) #x0000001f)) (and
(! (or %lbl%@25035 (bb2vec4 (store $a@@4 (+ $aBase@@4 (- $k@@2 $i0@@4)) $val) $aBase@@4 $ret@@0 $i0@@4 $i1@@4 $i2@@4 $g1@@4 $g2@@4)) :lblneg @25035)
(=> (bb2vec4 (store $a@@4 (+ $aBase@@4 (- $k@@2 $i0@@4)) $val) $aBase@@4 $ret@@0 $i0@@4 $i1@@4 $i2@@4 $g1@@4 $g2@@4) (and
(! (or %lbl%@25067 (between $g1@@4 $g2@@4 $idx@@4)) :lblneg @25067)
(=> (between $g1@@4 $g2@@4 $idx@@4) (and
(! (or %lbl%@25075 (<= (q@and (shr (- $k@@2 $i0@@4) 1) 31) 31)) :lblneg @25075)
(=> (<= (q@and (shr (- $k@@2 $i0@@4) 1) 31) 31) (and
(! (or %lbl%@25093 (= (* 4 (shr (- $k@@2 $i0@@4) 6)) (ColorIndex $i0@@4 $k@@2))) :lblneg @25093)
(=> (= (* 4 (shr (- $k@@2 $i0@@4) 6)) (ColorIndex $i0@@4 $k@@2)) true)))))))))))))))))))))))))))))))
(let ((PreconditionGeneratedEntry_correct@@20 (=> (! (and %lbl%+24217 true) :lblpos +24217) (=> (bb2vec4 $a@@4 $aBase@@4 $bb@@4 $i0@@4 $i1@@4 $i2@@4 $g1@@4 $g2@@4) (=> (and
(TV $k@@2)
(word (- $k@@2 $i0@@4))
(<= $i1@@4 $k@@2)
(< $k@@2 $i2@@4)
(Aligned (- $k@@2 $i0@@4))
(= $idx@@4 (+ $g1@@4 (* 4 (shr (- $k@@2 $i0@@4) 6))))
(<= 0 $val)
(<= $val 3)
(= $bbb@@2 (q@and (select $bb@@4 $idx@@4) (neg (shl 3 (q@and (shr (- $k@@2 $i0@@4) 1) 31)))))
(= $_bbb (q@or $bbb@@2 (shl $val (q@and (shr (- $k@@2 $i0@@4) 1) 31))))
(= $ret@@0 (store $bb@@4 $idx@@4 $_bbb))) anon0_correct@@20)))))
PreconditionGeneratedEntry_correct@@20))
))
(check-sat)
(pop 1)
