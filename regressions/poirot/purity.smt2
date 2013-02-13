

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
(declare-fun %lbl%+75 () Bool)
(declare-sort T@X 0)
(declare-fun D () (Array T@X Bool))
(declare-fun F () (Array T@X Int))
(declare-fun F@0 () (Array T@X Int))
(declare-fun %lbl%@813 () Bool)
(declare-fun %lbl%+699 () Bool)
(push 1)
(set-info :boogie-vc-id Client)
(assert (not
(let ((anon0_correct (=> (! (and %lbl%+75 true) :lblpos +75) (=> (forall ((x T@X) ) (! (=> (select D x) (= (select F x) (select F@0 x)))
 :qid |puritybp.18:17|
 :skolemid |2|
)) (and
(! (or %lbl%@813 (forall ((x@@0 T@X) ) (! (=> (select D x@@0) (= (select F@0 x@@0) 42))
 :qid |puritybp.11:17|
 :skolemid |1|
))) :lblneg @813)
(=> (forall ((x@@1 T@X) ) (! (=> (select D x@@1) (= (select F@0 x@@1) 42))
 :qid |puritybp.11:17|
 :skolemid |1|
)) true))))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+699 true) :lblpos +699) (=> (forall ((x@@2 T@X) ) (! (=> (select D x@@2) (= (select F x@@2) 42))
 :qid |puritybp.10:18|
 :skolemid |0|
)) anon0_correct))))
PreconditionGeneratedEntry_correct))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+137 () Bool)
(declare-fun D@0 () (Array T@X Bool))
(declare-fun call122formal@x@0 () T@X)
(declare-fun D@1 () (Array T@X Bool))
(declare-fun F@1 () (Array T@X Int))
(declare-fun F@0@@0 () (Array T@X Int))
(declare-fun y@1 () Int)
(declare-fun %lbl%@999 () Bool)
(declare-fun %lbl%+856 () Bool)
(declare-fun %lbl%@1041 () Bool)
(declare-fun F@2 () (Array T@X Int))
(declare-fun %lbl%+139 () Bool)
(declare-fun D@2 () (Array T@X Bool))
(declare-fun %lbl%+135 () Bool)
(declare-fun %lbl%+133 () Bool)
(declare-fun %lbl%@898 () Bool)
(declare-fun %lbl%+860 () Bool)
(push 1)
(set-info :boogie-vc-id AllocateAndModify)
(assert (not
(let ((anon2_LoopBody_correct (=> (! (and %lbl%+137 true) :lblpos +137) (=> (and
(not (select D@0 call122formal@x@0))
(= D@1 (store D@0 call122formal@x@0 true))
(= F@1 (store F@0@@0 call122formal@x@0 y@1))) (and
(! (or %lbl%@999 (forall ((x@@3 T@X) ) (! (=> (select D x@@3) (= (select F x@@3) (select F@1 x@@3)))
 :qid |puritybp.24:23|
 :skolemid |3|
))) :lblneg @999)
(=> (forall ((x@@4 T@X) ) (! (=> (select D x@@4) (= (select F x@@4) (select F@1 x@@4)))
 :qid |puritybp.24:23|
 :skolemid |3|
)) true))))))
(let ((GeneratedUnifiedExit_correct (=> (! (and %lbl%+856 true) :lblpos +856) (and
(! (or %lbl%@1041 (forall ((x@@5 T@X) ) (! (=> (select D x@@5) (= (select F x@@5) (select F@2 x@@5)))
 :qid |puritybp.18:17|
 :skolemid |2|
))) :lblneg @1041)
(=> (forall ((x@@6 T@X) ) (! (=> (select D x@@6) (= (select F x@@6) (select F@2 x@@6)))
 :qid |puritybp.18:17|
 :skolemid |2|
)) true)))))
(let ((anon2_LoopDone_correct (=> (! (and %lbl%+139 true) :lblpos +139) (=> (and
(= F@2 F@0@@0)
(= D@2 D@0)) GeneratedUnifiedExit_correct))))
(let ((anon2_LoopHead_correct (=> (! (and %lbl%+135 true) :lblpos +135) (=> (forall ((x@@7 T@X) ) (! (=> (select D x@@7) (= (select F x@@7) (select F@0@@0 x@@7)))
 :qid |puritybp.24:23|
 :skolemid |3|
)) (and
anon2_LoopDone_correct
anon2_LoopBody_correct)))))
(let ((anon0_correct@@0 (=> (! (and %lbl%+133 true) :lblpos +133) (and
(! (or %lbl%@898 (forall ((x@@8 T@X) ) (! (=> (select D x@@8) (= (select F x@@8) (select F x@@8)))
 :qid |puritybp.24:23|
 :skolemid |3|
))) :lblneg @898)
(=> (forall ((x@@9 T@X) ) (! (=> (select D x@@9) (= (select F x@@9) (select F x@@9)))
 :qid |puritybp.24:23|
 :skolemid |3|
)) anon2_LoopHead_correct)))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+860 true) :lblpos +860) anon0_correct@@0)))
PreconditionGeneratedEntry_correct@@0))))))
))
(check-sat)
(get-info :reason-unknown)
(labels)
(get-model)
(assert %lbl%@999)
(check-sat)
(pop 1)
