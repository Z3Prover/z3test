
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
(declare-fun %lbl%+773 () Bool)
(declare-fun x@1 () Int)
(declare-fun x@0 () Int)
(declare-fun %lbl%@1300 () Bool)
(declare-fun %lbl%@1305 () Bool)
(declare-fun Set@1 () (Array Int Bool))
(declare-fun Contents@1 () (Array Int Int))
(declare-fun %lbl%+767 () Bool)
(declare-fun Contents@0 () (Array Int Int))
(declare-fun i@1 () Int)
(declare-fun Set@0 () (Array Int Bool))
(declare-fun %lbl%+771 () Bool)
(declare-fun %lbl%+860 () Bool)
(declare-fun %lbl%@1419 () Bool)
(declare-fun inline$GetNext$0$x@1 () Int)
(declare-fun inline$GetNext$0$i@2 () Int)
(declare-fun %lbl%+854 () Bool)
(declare-fun Enumerator@1 () (Array Int Bool))
(declare-fun Enumerator@2 () (Array Int Bool))
(declare-fun %lbl%+794 () Bool)
(declare-fun Enumerator@0 () (Array Int Bool))
(declare-fun %lbl%+728 () Bool)
(declare-fun %lbl%+726 () Bool)
(declare-fun %lbl%@1144 () Bool)
(declare-fun %lbl%@1149 () Bool)
(declare-fun Set () (Array Int Bool))
(declare-fun Contents () (Array Int Int))
(declare-fun %lbl%+1082 () Bool)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((anon4_LoopBody$1_correct (=> (! (and %lbl%+773 true) :lblpos +773) (=> (= x@1 (+ x@0 1)) (and
(! (or %lbl%@1300 (<= 0 x@1)) :lblneg @1300)
(=> (<= 0 x@1) (and
(! (or %lbl%@1305 (forall ((c Int) ) (! (=> (select Set@1 c) (and
(<= 0 c)
(< c x@1)
(<= 0 (select Contents@1 c))))
 :qid |dictiona.40:23|
 :skolemid |0|
))) :lblneg @1305)
(=> (forall ((c@@0 Int) ) (! (=> (select Set@1 c@@0) (and
(<= 0 c@@0)
(< c@@0 x@1)
(<= 0 (select Contents@1 c@@0))))
 :qid |dictiona.40:23|
 :skolemid |0|
)) true))))))))
(let ((inline$Add$0$anon0_correct (=> (! (and %lbl%+767 true) :lblpos +767) (=> (and
(= Contents@1 (store Contents@0 x@0 i@1))
(= Set@1 (store Set@0 x@0 true))) anon4_LoopBody$1_correct))))
(let ((anon4_LoopBody_correct (=> (! (and %lbl%+771 true) :lblpos +771) (=> (<= 0 i@1) inline$Add$0$anon0_correct))))
(let ((anon5_LoopBody$1_correct (=> (! (and %lbl%+860 true) :lblpos +860) (and
(! (or %lbl%@1419 (and
(<= 0 inline$GetNext$0$x@1)
(< inline$GetNext$0$x@1 x@0)
(<= 0 inline$GetNext$0$i@2))) :lblneg @1419)
(=> (and
(<= 0 inline$GetNext$0$x@1)
(< inline$GetNext$0$x@1 x@0)
(<= 0 inline$GetNext$0$i@2)) true)))))
(let ((inline$GetNext$0$anon0_correct (=> (! (and %lbl%+854 true) :lblpos +854) (=> (and
(select Set@0 inline$GetNext$0$x@1)
(not (select Enumerator@1 inline$GetNext$0$x@1))
(= Enumerator@2 (store Enumerator@1 inline$GetNext$0$x@1 true))
(= inline$GetNext$0$i@2 (select Contents@0 inline$GetNext$0$x@1))) anon5_LoopBody$1_correct))))
(let ((inline$BeginEnumerate$0$anon0_correct (=> (! (and %lbl%+794 true) :lblpos +794) (=> (= Enumerator@0 ((as const (Array Int Bool)) false)) inline$GetNext$0$anon0_correct))))
(let ((anon4_LoopHead_correct (=> (! (and %lbl%+728 true) :lblpos +728) (=> (and
(<= 0 x@0)
(forall ((c@@1 Int) ) (! (=> (select Set@0 c@@1) (and
(<= 0 c@@1)
(< c@@1 x@0)
(<= 0 (select Contents@0 c@@1))))
 :qid |dictiona.40:23|
 :skolemid |0|
))) (and
inline$BeginEnumerate$0$anon0_correct
anon4_LoopBody_correct)))))
(let ((anon0_correct (=> (! (and %lbl%+726 true) :lblpos +726) (and
(! (or %lbl%@1144 (<= 0 0)) :lblneg @1144)
(=> (<= 0 0) (and
(! (or %lbl%@1149 (forall ((c@@2 Int) ) (! (=> (select Set c@@2) (and
(<= 0 c@@2)
(< c@@2 0)
(<= 0 (select Contents c@@2))))
 :qid |dictiona.40:23|
 :skolemid |0|
))) :lblneg @1149)
(=> (forall ((c@@3 Int) ) (! (=> (select Set c@@3) (and
(<= 0 c@@3)
(< c@@3 0)
(<= 0 (select Contents c@@3))))
 :qid |dictiona.40:23|
 :skolemid |0|
)) anon4_LoopHead_correct)))))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+1082 true) :lblpos +1082) (=> (= Set ((as const (Array Int Bool)) false)) anon0_correct))))
PreconditionGeneratedEntry_correct)))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+935 () Bool)
(declare-fun x@1@@0 () Int)
(declare-fun x@0@@0 () Int)
(declare-fun %lbl%@1680 () Bool)
(declare-fun %lbl%@1685 () Bool)
(declare-fun Set@1@@0 () (Array Int Bool))
(declare-fun Contents@1@@0 () (Array Int Int))
(declare-fun %lbl%+929 () Bool)
(declare-fun Contents@0@@0 () (Array Int Int))
(declare-fun i@1@@0 () Int)
(declare-fun Set@0@@0 () (Array Int Bool))
(declare-fun %lbl%+933 () Bool)
(declare-fun %lbl%+1022 () Bool)
(declare-fun %lbl%@1799 () Bool)
(declare-fun inline$GetNext$0$x@1@@0 () Int)
(declare-fun inline$GetNext$0$i@2@@0 () Int)
(declare-fun %lbl%+1016 () Bool)
(declare-fun Enumerator@1@@0 () (Array Int Bool))
(declare-fun Enumerator@2@@0 () (Array Int Bool))
(declare-fun %lbl%+956 () Bool)
(declare-fun Enumerator@0@@0 () (Array Int Bool))
(declare-fun %lbl%+890 () Bool)
(declare-fun %lbl%+888 () Bool)
(declare-fun %lbl%@1524 () Bool)
(declare-fun %lbl%@1529 () Bool)
(declare-fun %lbl%+1487 () Bool)
(push 1)
(set-info :boogie-vc-id main_buggy)
(assert (not
(let ((anon4_LoopBody$1_correct@@0 (=> (! (and %lbl%+935 true) :lblpos +935) (=> (= x@1@@0 (+ x@0@@0 1)) (and
(! (or %lbl%@1680 (<= 0 x@1@@0)) :lblneg @1680)
(=> (<= 0 x@1@@0) (and
(! (or %lbl%@1685 (forall ((c@@4 Int) ) (! (=> (select Set@1@@0 c@@4) (and
(<= 0 c@@4)
(< c@@4 x@1@@0)
(<= 0 (select Contents@1@@0 c@@4))))
 :qid |dictiona.67:23|
 :skolemid |1|
))) :lblneg @1685)
(=> (forall ((c@@5 Int) ) (! (=> (select Set@1@@0 c@@5) (and
(<= 0 c@@5)
(< c@@5 x@1@@0)
(<= 0 (select Contents@1@@0 c@@5))))
 :qid |dictiona.67:23|
 :skolemid |1|
)) true))))))))
(let ((inline$Add$0$anon0_correct@@0 (=> (! (and %lbl%+929 true) :lblpos +929) (=> (and
(= Contents@1@@0 (store Contents@0@@0 x@0@@0 i@1@@0))
(= Set@1@@0 (store Set@0@@0 x@0@@0 true))) anon4_LoopBody$1_correct@@0))))
(let ((anon4_LoopBody_correct@@0 (=> (! (and %lbl%+933 true) :lblpos +933) (=> (<= 0 i@1@@0) inline$Add$0$anon0_correct@@0))))
(let ((anon5_LoopBody$1_correct@@0 (=> (! (and %lbl%+1022 true) :lblpos +1022) (and
(! (or %lbl%@1799 (and
(<= 0 inline$GetNext$0$x@1@@0)
(< inline$GetNext$0$x@1@@0 x@0@@0)
(<= 0 inline$GetNext$0$i@2@@0))) :lblneg @1799)
(=> (and
(<= 0 inline$GetNext$0$x@1@@0)
(< inline$GetNext$0$x@1@@0 x@0@@0)
(<= 0 inline$GetNext$0$i@2@@0)) true)))))
(let ((inline$GetNext$0$anon0_correct@@0 (=> (! (and %lbl%+1016 true) :lblpos +1016) (=> (and
(select Set@0@@0 inline$GetNext$0$x@1@@0)
(not (select Enumerator@1@@0 inline$GetNext$0$x@1@@0))
(= Enumerator@2@@0 (store Enumerator@1@@0 inline$GetNext$0$x@1@@0 true))
(= inline$GetNext$0$i@2@@0 (select Contents@0@@0 inline$GetNext$0$x@1@@0))) anon5_LoopBody$1_correct@@0))))
(let ((inline$BeginEnumerate$0$anon0_correct@@0 (=> (! (and %lbl%+956 true) :lblpos +956) (=> (= Enumerator@0@@0 ((as const (Array Int Bool)) false)) inline$GetNext$0$anon0_correct@@0))))
(let ((anon4_LoopHead_correct@@0 (=> (! (and %lbl%+890 true) :lblpos +890) (=> (and
(<= 0 x@0@@0)
(forall ((c@@6 Int) ) (! (=> (select Set@0@@0 c@@6) (and
(<= 0 c@@6)
(< c@@6 x@0@@0)
(<= 0 (select Contents@0@@0 c@@6))))
 :qid |dictiona.67:23|
 :skolemid |1|
))) (and
inline$BeginEnumerate$0$anon0_correct@@0
anon4_LoopBody_correct@@0)))))
(let ((anon0_correct@@0 (=> (! (and %lbl%+888 true) :lblpos +888) (and
(! (or %lbl%@1524 (<= 0 0)) :lblneg @1524)
(=> (<= 0 0) (and
(! (or %lbl%@1529 (forall ((c@@7 Int) ) (! (=> (select Set c@@7) (and
(<= 0 c@@7)
(< c@@7 0)
(<= 0 (select Contents c@@7))))
 :qid |dictiona.67:23|
 :skolemid |1|
))) :lblneg @1529)
(=> (forall ((c@@8 Int) ) (! (=> (select Set c@@8) (and
(<= 0 c@@8)
(< c@@8 0)
(<= 0 (select Contents c@@8))))
 :qid |dictiona.67:23|
 :skolemid |1|
)) anon4_LoopHead_correct@@0)))))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+1487 true) :lblpos +1487) anon0_correct@@0)))
PreconditionGeneratedEntry_correct@@0)))))))))
))
(check-sat)
(get-info :reason-unknown)
(labels)
(assert %lbl%@1529)
(check-sat)
(pop 1)
