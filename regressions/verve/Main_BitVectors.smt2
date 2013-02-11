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
(declare-fun I ((_ BitVec 32)) Int)
(declare-fun B (Int) (_ BitVec 32))
(declare-fun q@and (Int Int) Int)
(declare-fun q@or (Int Int) Int)
(declare-fun q@xor (Int Int) Int)
(declare-fun shl (Int Int) Int)
(declare-fun shr (Int Int) Int)
(declare-fun neg (Int) Int)
(declare-fun Aligned (Int) Bool)
(declare-fun %lbl%+1193 () Bool)
(declare-fun %lbl%@1470 () Bool)
(declare-fun $b1 () (_ BitVec 32))
(declare-fun $b2 () (_ BitVec 32))
(declare-fun %lbl%@1480 () Bool)
(declare-fun %lbl%+1421 () Bool)
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
(assert (= WORD_HI (+ (+ 2147483647 2147483647) 2)))
(assert (= (I #x00000001) 1))
(assert (forall ((i1@@0 Int) (i2@@0 Int) ) (! (=> (and
(word i1@@0)
(word i2@@0)) (= (= i1@@0 i2@@0) (= (B i1@@0) (B i2@@0))))
 :qid |BitVecto.9:15|
 :skolemid |13|
 :pattern ( (B i1@@0) (B i2@@0))
)))
(assert (forall ((b1@@0 (_ BitVec 32)) (b2@@0 (_ BitVec 32)) ) (! (= (= b1@@0 b2@@0) (= (I b1@@0) (I b2@@0)))
 :qid |BitVecto.10:15|
 :skolemid |14|
 :pattern ( (I b1@@0) (I b2@@0))
)))
(assert (forall ((b@@2 (_ BitVec 32)) ) (! (word (I b@@2))
 :qid |BitVecto.12:15|
 :skolemid |15|
 :pattern ( (I b@@2))
)))
(assert (forall ((b@@3 (_ BitVec 32)) ) (! (= (B (I b@@3)) b@@3)
 :qid |BitVecto.13:15|
 :skolemid |16|
 :pattern ( (B (I b@@3)))
)))
(assert (forall ((i@@1 Int) ) (! (=> (word i@@1) (= (I (B i@@1)) i@@1))
 :qid |BitVecto.14:15|
 :skolemid |17|
 :pattern ( (I (B i@@1)))
)))
(assert (forall ((b1@@1 (_ BitVec 32)) (b2@@1 (_ BitVec 32)) ) (! (=> (word (+ (I b1@@1) (I b2@@1))) (= (+ (I b1@@1) (I b2@@1)) (I (bvadd b1@@1 b2@@1))))
 :qid |BitVecto.16:15|
 :skolemid |18|
 :pattern ( (bvadd b1@@1 b2@@1))
 :pattern ( (TBV b1@@1) (TBV b2@@1))
)))
(assert (forall ((b1@@2 (_ BitVec 32)) (b2@@2 (_ BitVec 32)) ) (! (=> (word (- (I b1@@2) (I b2@@2))) (= (- (I b1@@2) (I b2@@2)) (I (bvsub b1@@2 b2@@2))))
 :qid |BitVecto.17:15|
 :skolemid |19|
 :pattern ( (bvsub b1@@2 b2@@2))
 :pattern ( (TBV b1@@2) (TBV b2@@2))
)))
(assert (forall ((b1@@3 (_ BitVec 32)) (b2@@3 (_ BitVec 32)) ) (! (=> (word (* (I b1@@3) (I b2@@3))) (= (* (I b1@@3) (I b2@@3)) (I (bvmul b1@@3 b2@@3))))
 :qid |BitVecto.18:15|
 :skolemid |20|
 :pattern ( (bvmul b1@@3 b2@@3))
 :pattern ( (TBV b1@@3) (TBV b2@@3))
)))
(assert (forall ((b1@@4 (_ BitVec 32)) (b2@@4 (_ BitVec 32)) ) (! (= (<= (I b1@@4) (I b2@@4)) (bvule b1@@4 b2@@4))
 :qid |BitVecto.19:15|
 :skolemid |21|
 :pattern ( (bvule b1@@4 b2@@4))
 :pattern ( (TBV b1@@4) (TBV b2@@4))
)))
(assert (forall ((i1@@1 Int) (i2@@1 Int) ) (! (= (q@and i1@@1 i2@@1) (I (bvand (B i1@@1) (B i2@@1))))
 :qid |BitVecto.20:15|
 :skolemid |22|
 :pattern ( (q@and i1@@1 i2@@1))
)))
(assert (forall ((i1@@2 Int) (i2@@2 Int) ) (! (= (q@or i1@@2 i2@@2) (I (bvor (B i1@@2) (B i2@@2))))
 :qid |BitVecto.21:15|
 :skolemid |23|
 :pattern ( (q@or i1@@2 i2@@2))
)))
(assert (forall ((i1@@3 Int) (i2@@3 Int) ) (! (= (q@xor i1@@3 i2@@3) (I (bvxor (B i1@@3) (B i2@@3))))
 :qid |BitVecto.22:15|
 :skolemid |24|
 :pattern ( (q@xor i1@@3 i2@@3))
)))
(assert (forall ((i1@@4 Int) (i2@@4 Int) ) (! (= (shl i1@@4 i2@@4) (I (bvshl (B i1@@4) (B i2@@4))))
 :qid |BitVecto.23:15|
 :skolemid |25|
 :pattern ( (shl i1@@4 i2@@4))
)))
(assert (forall ((i1@@5 Int) (i2@@5 Int) ) (! (= (shr i1@@5 i2@@5) (I (bvlshr (B i1@@5) (B i2@@5))))
 :qid |BitVecto.24:15|
 :skolemid |26|
 :pattern ( (shr i1@@5 i2@@5))
)))
(assert (forall ((i@@2 Int) ) (! (= (neg i@@2) (I (bvnot (B i@@2))))
 :qid |BitVecto.25:15|
 :skolemid |27|
 :pattern ( (neg i@@2))
)))
(assert (forall ((b@@4 (_ BitVec 32)) ) (! (= (Aligned (I b@@4)) (= (bvand b@@4 #x00000003) #x00000000))
 :qid |BitVecto.27:15|
 :skolemid |28|
 :pattern ( (Aligned (I b@@4)))
)))
(push 1)
(set-info :boogie-vc-id _a)
(assert (not
(let ((anon0_correct (=> (! (and %lbl%+1193 true) :lblpos +1193) (and
(! (or %lbl%@1470 (and
(TBV $b1)
(TBV $b2))) :lblneg @1470)
(=> (and
(TBV $b1)
(TBV $b2)) (and
(! (or %lbl%@1480 (= (+ (I $b1) (I $b2)) (I (bvadd $b1 $b2)))) :lblneg @1480)
(=> (= (+ (I $b1) (I $b2)) (I (bvadd $b1 $b2))) true)))))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+1421 true) :lblpos +1421) (=> (word (+ (I $b1) (I $b2))) anon0_correct))))
PreconditionGeneratedEntry_correct))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+1242 () Bool)
(declare-fun %lbl%@1554 () Bool)
(declare-fun $b1@@0 () (_ BitVec 32))
(declare-fun $b2@@0 () (_ BitVec 32))
(declare-fun %lbl%@1564 () Bool)
(declare-fun %lbl%+1514 () Bool)
(push 1)
(set-info :boogie-vc-id _s)
(assert (not
(let ((anon0_correct@@0 (=> (! (and %lbl%+1242 true) :lblpos +1242) (and
(! (or %lbl%@1554 (and
(TBV $b1@@0)
(TBV $b2@@0))) :lblneg @1554)
(=> (and
(TBV $b1@@0)
(TBV $b2@@0)) (and
(! (or %lbl%@1564 (= (- (I $b1@@0) (I $b2@@0)) (I (bvsub $b1@@0 $b2@@0)))) :lblneg @1564)
(=> (= (- (I $b1@@0) (I $b2@@0)) (I (bvsub $b1@@0 $b2@@0))) true)))))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+1514 true) :lblpos +1514) (=> (word (- (I $b1@@0) (I $b2@@0))) anon0_correct@@0))))
PreconditionGeneratedEntry_correct@@0))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+1259 () Bool)
(declare-fun %lbl%@1599 () Bool)
(declare-fun %lbl%@1609 () Bool)
(declare-fun %lbl%@1635 () Bool)
(declare-fun %lbl%+1585 () Bool)
(push 1)
(set-info :boogie-vc-id __const)
(assert (not
(let ((anon0_correct@@1 (=> (! (and %lbl%+1259 true) :lblpos +1259) (and
(! (or %lbl%@1599 (word 0)) :lblneg @1599)
(=> (word 0) (and
(! (or %lbl%@1609 (word (- (I #x00000001) (I #x00000001)))) :lblneg @1609)
(=> (word (- (I #x00000001) (I #x00000001))) (=> (= (- (I #x00000001) (I #x00000001)) (I (bvsub #x00000001 #x00000001))) (and
(! (or %lbl%@1635 (= 0 (I #x00000000))) :lblneg @1635)
(=> (= 0 (I #x00000000)) true))))))))))
(let ((PreconditionGeneratedEntry_correct@@1 (=> (! (and %lbl%+1585 true) :lblpos +1585) anon0_correct@@1)))
PreconditionGeneratedEntry_correct@@1))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+1288 () Bool)
(declare-fun %lbl%@1705 () Bool)
(declare-fun %lbl%@1733 () Bool)
(declare-fun %lbl%@1746 () Bool)
(declare-fun %lbl%@1765 () Bool)
(declare-fun %lbl%+1644 () Bool)
(push 1)
(set-info :boogie-vc-id proc_XorLemmas)
(assert (not
(let ((anon0_correct@@2 (=> (! (and %lbl%+1288 true) :lblpos +1288) (=> (= 0 (I #x00000000)) (and
(! (or %lbl%@1705 (forall ((x@@0 Int) ) (! (= (I (B (q@xor x@@0 0))) (I (B x@@0)))
 :qid |BitVecto.29:18|
 :skolemid |29|
 :pattern ( (q@xor x@@0 0))
))) :lblneg @1705)
(=> (forall ((x@@1 Int) ) (! (= (I (B (q@xor x@@1 0))) (I (B x@@1)))
 :qid |BitVecto.29:18|
 :skolemid |29|
 :pattern ( (q@xor x@@1 0))
)) (and
(! (or %lbl%@1733 (forall ((x@@2 Int) ) (! (= (q@xor x@@2 x@@2) 0)
 :qid |BitVecto.6:19|
 :skolemid |10|
))) :lblneg @1733)
(=> (forall ((x@@3 Int) ) (! (= (q@xor x@@3 x@@3) 0)
 :qid |BitVecto.6:19|
 :skolemid |10|
)) (and
(! (or %lbl%@1746 (forall ((x@@4 Int) ) (! (=> (word x@@4) (= (q@xor x@@4 0) x@@4))
 :qid |BitVecto.7:19|
 :skolemid |11|
))) :lblneg @1746)
(=> (forall ((x@@5 Int) ) (! (=> (word x@@5) (= (q@xor x@@5 0) x@@5))
 :qid |BitVecto.7:19|
 :skolemid |11|
)) (and
(! (or %lbl%@1765 (forall ((x@@6 Int) (y Int) ) (! (= (q@xor x@@6 y) (q@xor y x@@6))
 :qid |BitVecto.8:19|
 :skolemid |12|
))) :lblneg @1765)
(=> (forall ((x@@7 Int) (y@@0 Int) ) (! (= (q@xor x@@7 y@@0) (q@xor y@@0 x@@7))
 :qid |BitVecto.8:19|
 :skolemid |12|
)) true))))))))))))
(let ((PreconditionGeneratedEntry_correct@@2 (=> (! (and %lbl%+1644 true) :lblpos +1644) anon0_correct@@2)))
PreconditionGeneratedEntry_correct@@2))
))
(check-sat)
(pop 1)
