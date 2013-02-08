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
(declare-fun %lbl%+161 () Bool)
(declare-fun b@1 () (Array Int Bool))
(declare-fun b@0 () (Array Int Bool))
(declare-fun i@0 () Int)
(declare-fun a () (Array Int Int))
(declare-fun i@1 () Int)
(declare-fun %lbl%@616 () Bool)
(declare-fun spot@1 () Int)
(declare-fun length () Int)
(declare-fun %lbl%@633 () Bool)
(declare-fun %lbl%+159 () Bool)
(declare-fun spot@0 () Int)
(declare-fun %lbl%+157 () Bool)
(declare-fun %lbl%+155 () Bool)
(declare-fun %lbl%+349 () Bool)
(declare-fun %lbl%@685 () Bool)
(declare-fun spot@2 () Int)
(declare-fun b@2 () (Array Int Bool))
(declare-fun %lbl%@696 () Bool)
(declare-fun %lbl%+163 () Bool)
(declare-fun %lbl%+148 () Bool)
(declare-fun %lbl%+146 () Bool)
(declare-fun %lbl%@421 () Bool)
(declare-fun b () (Array Int Bool))
(declare-fun %lbl%@439 () Bool)
(declare-fun %lbl%+357 () Bool)
(push 1)
(set-info :boogie-vc-id find)
(assert (not
(let ((anon3_correct (=> (! (and %lbl%+161 true) :lblpos +161) (=> (and
(= b@1 (store b@0 i@0 (not (= (select a i@0) 0))))
(= i@1 (+ i@0 1))) (and
(! (or %lbl%@616 (or
(= spot@1 length)
(and
(select b@1 spot@1)
(< spot@1 i@1)))) :lblneg @616)
(=> (or
(= spot@1 length)
(and
(select b@1 spot@1)
(< spot@1 i@1))) (and
(! (or %lbl%@633 (forall ((j Int) ) (! (=> (and
(<= 0 j)
(< j i@1)
(< j spot@1)) (not (select b@1 j)))
 :qid |findbpl.11:23|
 :skolemid |1|
))) :lblneg @633)
(=> (forall ((j@@0 Int) ) (! (=> (and
(<= 0 j@@0)
(< j@@0 i@1)
(< j@@0 spot@1)) (not (select b@1 j@@0)))
 :qid |findbpl.11:23|
 :skolemid |1|
)) true))))))))
(let ((anon5_Else_correct (=> (! (and %lbl%+159 true) :lblpos +159) (=> (and
(not (and
(= spot@0 length)
(not (= (select a i@0) 0))))
(= spot@1 spot@0)) anon3_correct))))
(let ((anon5_Then_correct (=> (! (and %lbl%+157 true) :lblpos +157) (=> (and
(= spot@0 length)
(not (= (select a i@0) 0))
(= spot@1 i@0)) anon3_correct))))
(let ((anon4_LoopBody_correct (=> (! (and %lbl%+155 true) :lblpos +155) (=> (< i@0 length) (and
anon5_Then_correct
anon5_Else_correct)))))
(let ((GeneratedUnifiedExit_correct (=> (! (and %lbl%+349 true) :lblpos +349) (and
(! (or %lbl%@685 (or
(= spot@2 length)
(select b@2 spot@2))) :lblneg @685)
(=> (or
(= spot@2 length)
(select b@2 spot@2)) (and
(! (or %lbl%@696 (forall ((j@@1 Int) ) (! (=> (and
(<= 0 j@@1)
(< j@@1 spot@2)) (not (select b@2 j@@1)))
 :qid |findbpl.3:17|
 :skolemid |0|
))) :lblneg @696)
(=> (forall ((j@@2 Int) ) (! (=> (and
(<= 0 j@@2)
(< j@@2 spot@2)) (not (select b@2 j@@2)))
 :qid |findbpl.3:17|
 :skolemid |0|
)) true)))))))
(let ((anon4_LoopDone_correct (=> (! (and %lbl%+163 true) :lblpos +163) (=> (<= length i@0) (=> (and
(= spot@2 spot@0)
(= b@2 b@0)) GeneratedUnifiedExit_correct)))))
(let ((anon4_LoopHead_correct (=> (! (and %lbl%+148 true) :lblpos +148) (=> (and
(or
(= spot@0 length)
(and
(select b@0 spot@0)
(< spot@0 i@0)))
(forall ((j@@3 Int) ) (! (=> (and
(<= 0 j@@3)
(< j@@3 i@0)
(< j@@3 spot@0)) (not (select b@0 j@@3)))
 :qid |findbpl.11:23|
 :skolemid |1|
))) (and
anon4_LoopDone_correct
anon4_LoopBody_correct)))))
(let ((anon0_correct (=> (! (and %lbl%+146 true) :lblpos +146) (and
(! (or %lbl%@421 (or
(= length length)
(and
(select b length)
(< length 0)))) :lblneg @421)
(=> (or
(= length length)
(and
(select b length)
(< length 0))) (and
(! (or %lbl%@439 (forall ((j@@4 Int) ) (! (=> (and
(<= 0 j@@4)
(< j@@4 0)
(< j@@4 length)) (not (select b j@@4)))
 :qid |findbpl.11:23|
 :skolemid |1|
))) :lblneg @439)
(=> (forall ((j@@5 Int) ) (! (=> (and
(<= 0 j@@5)
(< j@@5 0)
(< j@@5 length)) (not (select b j@@5)))
 :qid |findbpl.11:23|
 :skolemid |1|
)) anon4_LoopHead_correct)))))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+357 true) :lblpos +357) anon0_correct)))
PreconditionGeneratedEntry_correct)))))))))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+310 () Bool)
(declare-fun b@1@@0 () (Array Int Bool))
(declare-fun b@0@@0 () (Array Int Bool))
(declare-fun i@0@@0 () Int)
(declare-fun a@@0 () (Array Int Int))
(declare-fun i@1@@0 () Int)
(declare-fun %lbl%@990 () Bool)
(declare-fun spot@1@@0 () Int)
(declare-fun length@@0 () Int)
(declare-fun %lbl%@1007 () Bool)
(declare-fun %lbl%+308 () Bool)
(declare-fun spot@0@@0 () Int)
(declare-fun %lbl%+306 () Bool)
(declare-fun %lbl%+304 () Bool)
(declare-fun %lbl%+748 () Bool)
(declare-fun %lbl%@1059 () Bool)
(declare-fun spot@2@@0 () Int)
(declare-fun b@2@@0 () (Array Int Bool))
(declare-fun %lbl%@1070 () Bool)
(declare-fun %lbl%+312 () Bool)
(declare-fun %lbl%+297 () Bool)
(declare-fun %lbl%+295 () Bool)
(declare-fun %lbl%@811 () Bool)
(declare-fun b@@0 () (Array Int Bool))
(declare-fun %lbl%@829 () Bool)
(declare-fun %lbl%+756 () Bool)
(push 1)
(set-info :boogie-vc-id find_buggy)
(assert (not
(let ((anon3_correct@@0 (=> (! (and %lbl%+310 true) :lblpos +310) (=> (and
(= b@1@@0 (store b@0@@0 i@0@@0 (not (= (select a@@0 i@0@@0) 0))))
(= i@1@@0 (+ i@0@@0 1))) (and
(! (or %lbl%@990 (or
(= spot@1@@0 length@@0)
(and
(select b@1@@0 spot@1@@0)
(< spot@1@@0 i@1@@0)))) :lblneg @990)
(=> (or
(= spot@1@@0 length@@0)
(and
(select b@1@@0 spot@1@@0)
(< spot@1@@0 i@1@@0))) (and
(! (or %lbl%@1007 (forall ((j@@6 Int) ) (! (=> (and
(<= 0 j@@6)
(< j@@6 i@1@@0)
(< j@@6 spot@1@@0)) (not (select b@1@@0 j@@6)))
 :qid |findbpl.32:23|
 :skolemid |3|
))) :lblneg @1007)
(=> (forall ((j@@7 Int) ) (! (=> (and
(<= 0 j@@7)
(< j@@7 i@1@@0)
(< j@@7 spot@1@@0)) (not (select b@1@@0 j@@7)))
 :qid |findbpl.32:23|
 :skolemid |3|
)) true))))))))
(let ((anon5_Else_correct@@0 (=> (! (and %lbl%+308 true) :lblpos +308) (=> (and
(= (select a@@0 i@0@@0) 0)
(= spot@1@@0 spot@0@@0)) anon3_correct@@0))))
(let ((anon5_Then_correct@@0 (=> (! (and %lbl%+306 true) :lblpos +306) (=> (and
(not (= (select a@@0 i@0@@0) 0))
(= spot@1@@0 i@0@@0)) anon3_correct@@0))))
(let ((anon4_LoopBody_correct@@0 (=> (! (and %lbl%+304 true) :lblpos +304) (=> (< i@0@@0 length@@0) (and
anon5_Then_correct@@0
anon5_Else_correct@@0)))))
(let ((GeneratedUnifiedExit_correct@@0 (=> (! (and %lbl%+748 true) :lblpos +748) (and
(! (or %lbl%@1059 (or
(= spot@2@@0 length@@0)
(select b@2@@0 spot@2@@0))) :lblneg @1059)
(=> (or
(= spot@2@@0 length@@0)
(select b@2@@0 spot@2@@0)) (and
(! (or %lbl%@1070 (forall ((j@@8 Int) ) (! (=> (and
(<= 0 j@@8)
(< j@@8 spot@2@@0)) (not (select b@2@@0 j@@8)))
 :qid |findbpl.24:17|
 :skolemid |2|
))) :lblneg @1070)
(=> (forall ((j@@9 Int) ) (! (=> (and
(<= 0 j@@9)
(< j@@9 spot@2@@0)) (not (select b@2@@0 j@@9)))
 :qid |findbpl.24:17|
 :skolemid |2|
)) true)))))))
(let ((anon4_LoopDone_correct@@0 (=> (! (and %lbl%+312 true) :lblpos +312) (=> (<= length@@0 i@0@@0) (=> (and
(= spot@2@@0 spot@0@@0)
(= b@2@@0 b@0@@0)) GeneratedUnifiedExit_correct@@0)))))
(let ((anon4_LoopHead_correct@@0 (=> (! (and %lbl%+297 true) :lblpos +297) (=> (and
(or
(= spot@0@@0 length@@0)
(and
(select b@0@@0 spot@0@@0)
(< spot@0@@0 i@0@@0)))
(forall ((j@@10 Int) ) (! (=> (and
(<= 0 j@@10)
(< j@@10 i@0@@0)
(< j@@10 spot@0@@0)) (not (select b@0@@0 j@@10)))
 :qid |findbpl.32:23|
 :skolemid |3|
))) (and
anon4_LoopDone_correct@@0
anon4_LoopBody_correct@@0)))))
(let ((anon0_correct@@0 (=> (! (and %lbl%+295 true) :lblpos +295) (and
(! (or %lbl%@811 (or
(= length@@0 length@@0)
(and
(select b@@0 length@@0)
(< length@@0 0)))) :lblneg @811)
(=> (or
(= length@@0 length@@0)
(and
(select b@@0 length@@0)
(< length@@0 0))) (and
(! (or %lbl%@829 (forall ((j@@11 Int) ) (! (=> (and
(<= 0 j@@11)
(< j@@11 0)
(< j@@11 length@@0)) (not (select b@@0 j@@11)))
 :qid |findbpl.32:23|
 :skolemid |3|
))) :lblneg @829)
(=> (forall ((j@@12 Int) ) (! (=> (and
(<= 0 j@@12)
(< j@@12 0)
(< j@@12 length@@0)) (not (select b@@0 j@@12)))
 :qid |findbpl.32:23|
 :skolemid |3|
)) anon4_LoopHead_correct@@0)))))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+756 true) :lblpos +756) anon0_correct@@0)))
PreconditionGeneratedEntry_correct@@0)))))))))
))
(check-sat)
(get-info :reason-unknown)
(labels)
(assert %lbl%@1007)
(check-sat)
(pop 1)
