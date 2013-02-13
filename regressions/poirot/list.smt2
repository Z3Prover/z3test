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
(declare-fun %lbl%+163 () Bool)
(declare-sort T@X 0)
(declare-fun allocator_Mem () (Array T@X Bool))
(declare-fun M@0 () (Array T@X Bool))
(declare-fun allocator_Mem@0 () (Array T@X Bool))
(declare-fun D () (Array T@X Bool))
(declare-fun allocator_Mem@1 () (Array T@X Bool))
(declare-fun call142formal@M@0 () (Array T@X Bool))
(declare-fun call142formal@x@0 () T@X)
(declare-fun D@0 () (Array T@X Bool))
(declare-fun Next@0 () (Array T@X T@X))
(declare-fun Next () (Array T@X T@X))
(declare-fun tail () T@X)
(declare-fun Next@1 () (Array T@X T@X))
(declare-fun nil () T@X)
(declare-fun allocator_Mem@2 () (Array T@X Bool))
(declare-fun %lbl%@2290 () Bool)
(declare-fun head () T@X)
(declare-fun %lbl%@2301 () Bool)
(declare-fun %lbl%@2332 () Bool)
(declare-fun %lbl%+1781 () Bool)
(push 1)
(set-info :boogie-vc-id one)
(assert (not
(let ((anon0_correct (=> (! (and %lbl%+163 true) :lblpos +163) (=> (= allocator_Mem ((_ map or) M@0 allocator_Mem@0)) (=> (and
(exists ((partition_Mem (Array T@X Int)) ) (! (and
(= ((_ map =>) M@0 ((_ map (= (Int Int) Bool)) partition_Mem ((as const (Array T@X Int)) 2))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) D ((_ map (= (Int Int) Bool)) partition_Mem ((as const (Array T@X Int)) 1))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) allocator_Mem@0 ((_ map (= (Int Int) Bool)) partition_Mem ((as const (Array T@X Int)) 0))) ((as const (Array T@X Bool)) true))
true)
 :qid |unknown.0:0|
 :skolemid |9|
))
(= allocator_Mem@1 ((_ map or) allocator_Mem@0 M@0))
(= call142formal@M@0 (store ((as const (Array T@X Bool)) false) call142formal@x@0 true))
(exists ((partition_Mem@@0 (Array T@X Int)) ) (! (and
(= ((_ map =>) call142formal@M@0 ((_ map (= (Int Int) Bool)) partition_Mem@@0 ((as const (Array T@X Int)) 2))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) D ((_ map (= (Int Int) Bool)) partition_Mem@@0 ((as const (Array T@X Int)) 1))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) allocator_Mem@1 ((_ map (= (Int Int) Bool)) partition_Mem@@0 ((as const (Array T@X Int)) 0))) ((as const (Array T@X Bool)) true))
true)
 :qid |unknown.0:0|
 :skolemid |8|
))
(= ((_ map or) D call142formal@M@0) D@0)
(= Next@0 (store Next tail call142formal@x@0))
(= Next@1 (store Next@0 call142formal@x@0 nil))
(= allocator_Mem@2 ((_ map or) allocator_Mem@1 call142formal@M@0))) (and
(! (or %lbl%@2290 (and
(select D@0 head)
(select D@0 call142formal@x@0))) :lblneg @2290)
(=> (and
(select D@0 head)
(select D@0 call142formal@x@0)) (and
(! (or %lbl%@2301 (forall ((d T@X) ) (! (=> (select D@0 d) (or
(select D@0 (select Next@1 d))
(= d call142formal@x@0)))
 :qid |listbpl.18:17|
 :skolemid |1|
 :pattern ( (select D@0 d))
))) :lblneg @2301)
(=> (forall ((d@@0 T@X) ) (! (=> (select D@0 d@@0) (or
(select D@0 (select Next@1 d@@0))
(= d@@0 call142formal@x@0)))
 :qid |listbpl.18:17|
 :skolemid |1|
 :pattern ( (select D@0 d@@0))
)) (and
(! (or %lbl%@2332 (not (= head call142formal@x@0))) :lblneg @2332)
(=> (not (= head call142formal@x@0)) true)))))))))))
(let ((PreconditionGeneratedEntry_correct (=> (! (and %lbl%+1781 true) :lblpos +1781) (=> (and
(select D head)
(select D tail)
(forall ((d@@1 T@X) ) (! (=> (select D d@@1) (or
(select D (select Next d@@1))
(= d@@1 tail)))
 :qid |listbpl.16:18|
 :skolemid |0|
 :pattern ( (select D d@@1))
))
(exists ((partition_Mem@@1 (Array T@X Int)) ) (! (and
(= ((_ map =>) D ((_ map (= (Int Int) Bool)) partition_Mem@@1 ((as const (Array T@X Int)) 1))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) allocator_Mem ((_ map (= (Int Int) Bool)) partition_Mem@@1 ((as const (Array T@X Int)) 0))) ((as const (Array T@X Bool)) true))
true)
 :qid |unknown.0:0|
 :skolemid |12|
))) anon0_correct))))
PreconditionGeneratedEntry_correct))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+259 () Bool)
(declare-fun M@0@@0 () (Array T@X Bool))
(declare-fun allocator_Mem@0@@0 () (Array T@X Bool))
(declare-fun allocator_Mem@1@@0 () (Array T@X Bool))
(declare-fun call240formal@M@0 () (Array T@X Bool))
(declare-fun call240formal@x@0 () T@X)
(declare-fun Next@0@@0 () (Array T@X T@X))
(declare-fun Next@1@@0 () (Array T@X T@X))
(declare-fun allocator_Mem@2@@0 () (Array T@X Bool))
(declare-fun %lbl%@2832 () Bool)
(declare-fun %lbl%@2845 () Bool)
(declare-fun %lbl%@2879 () Bool)
(declare-fun %lbl%+2351 () Bool)
(push 1)
(set-info :boogie-vc-id one_buggy)
(assert (not
(let ((anon0_correct@@0 (=> (! (and %lbl%+259 true) :lblpos +259) (=> (and
(= allocator_Mem ((_ map or) M@0@@0 allocator_Mem@0@@0))
(exists ((partition_Mem@@2 (Array T@X Int)) ) (! (and
(= ((_ map =>) M@0@@0 ((_ map (= (Int Int) Bool)) partition_Mem@@2 ((as const (Array T@X Int)) 2))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) D ((_ map (= (Int Int) Bool)) partition_Mem@@2 ((as const (Array T@X Int)) 1))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) allocator_Mem@0@@0 ((_ map (= (Int Int) Bool)) partition_Mem@@2 ((as const (Array T@X Int)) 0))) ((as const (Array T@X Bool)) true))
true)
 :qid |unknown.0:0|
 :skolemid |11|
))
(= allocator_Mem@1@@0 ((_ map or) allocator_Mem@0@@0 M@0@@0))
(= call240formal@M@0 (store ((as const (Array T@X Bool)) false) call240formal@x@0 true))
(exists ((partition_Mem@@3 (Array T@X Int)) ) (! (and
(= ((_ map =>) call240formal@M@0 ((_ map (= (Int Int) Bool)) partition_Mem@@3 ((as const (Array T@X Int)) 2))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) D ((_ map (= (Int Int) Bool)) partition_Mem@@3 ((as const (Array T@X Int)) 1))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) allocator_Mem@1@@0 ((_ map (= (Int Int) Bool)) partition_Mem@@3 ((as const (Array T@X Int)) 0))) ((as const (Array T@X Bool)) true))
true)
 :qid |unknown.0:0|
 :skolemid |10|
))
(= Next@0@@0 (store Next tail call240formal@x@0))
(= Next@1@@0 (store Next@0@@0 call240formal@x@0 nil))
(= allocator_Mem@2@@0 ((_ map or) allocator_Mem@1@@0 call240formal@M@0))) (and
(! (or %lbl%@2832 (and
(select D head)
(select D call240formal@x@0))) :lblneg @2832)
(=> (and
(select D head)
(select D call240formal@x@0)) (and
(! (or %lbl%@2845 (forall ((d@@2 T@X) ) (! (=> (select D d@@2) (or
(select D (select Next@1@@0 d@@2))
(= d@@2 call240formal@x@0)))
 :qid |listbpl.35:17|
 :skolemid |3|
 :pattern ( (select D d@@2))
))) :lblneg @2845)
(=> (forall ((d@@3 T@X) ) (! (=> (select D d@@3) (or
(select D (select Next@1@@0 d@@3))
(= d@@3 call240formal@x@0)))
 :qid |listbpl.35:17|
 :skolemid |3|
 :pattern ( (select D d@@3))
)) (and
(! (or %lbl%@2879 (not (= head call240formal@x@0))) :lblneg @2879)
(=> (not (= head call240formal@x@0)) true))))))))))
(let ((PreconditionGeneratedEntry_correct@@0 (=> (! (and %lbl%+2351 true) :lblpos +2351) (=> (and
(select D head)
(select D tail)
(forall ((d@@4 T@X) ) (! (=> (select D d@@4) (or
(select D (select Next d@@4))
(= d@@4 tail)))
 :qid |listbpl.33:18|
 :skolemid |2|
 :pattern ( (select D d@@4))
))
(exists ((partition_Mem@@4 (Array T@X Int)) ) (! (and
(= ((_ map =>) D ((_ map (= (Int Int) Bool)) partition_Mem@@4 ((as const (Array T@X Int)) 1))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) allocator_Mem ((_ map (= (Int Int) Bool)) partition_Mem@@4 ((as const (Array T@X Int)) 0))) ((as const (Array T@X Bool)) true))
true)
 :qid |unknown.0:0|
 :skolemid |13|
))) anon0_correct@@0))))
PreconditionGeneratedEntry_correct@@0))
))
(check-sat)
(get-info :reason-unknown)
(labels)
(assert %lbl%@2832)
(check-sat)
(pop 1)
(declare-fun %lbl%+333 () Bool)
(declare-fun head@0 () T@X)
(declare-fun %lbl%@3154 () Bool)
(declare-fun %lbl%@3190 () Bool)
(declare-fun %lbl%+2885 () Bool)
(push 1)
(set-info :boogie-vc-id two)
(assert (not
(let ((anon0_correct@@1 (=> (! (and %lbl%+333 true) :lblpos +333) (=> (= head@0 (select Next head)) (and
(! (or %lbl%@3154 (forall ((d@@5 T@X) ) (! (=> (select D d@@5) (or
(select D (select Next d@@5))
(= d@@5 tail)))
 :qid |listbpl.52:17|
 :skolemid |5|
 :pattern ( (select D d@@5))
))) :lblneg @3154)
(=> (forall ((d@@6 T@X) ) (! (=> (select D d@@6) (or
(select D (select Next d@@6))
(= d@@6 tail)))
 :qid |listbpl.52:17|
 :skolemid |5|
 :pattern ( (select D d@@6))
)) (and
(! (or %lbl%@3190 (and
(select D head@0)
(select D tail))) :lblneg @3190)
(=> (and
(select D head@0)
(select D tail)) true))))))))
(let ((PreconditionGeneratedEntry_correct@@1 (=> (! (and %lbl%+2885 true) :lblpos +2885) (=> (not (= head tail)) (=> (and
(select D head)
(select D tail)
(forall ((d@@7 T@X) ) (! (=> (select D d@@7) (or
(select D (select Next d@@7))
(= d@@7 tail)))
 :qid |listbpl.51:18|
 :skolemid |4|
 :pattern ( (select D d@@7))
))
(exists ((partition_Mem@@5 (Array T@X Int)) ) (! (and
(= ((_ map =>) D ((_ map (= (Int Int) Bool)) partition_Mem@@5 ((as const (Array T@X Int)) 1))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) allocator_Mem ((_ map (= (Int Int) Bool)) partition_Mem@@5 ((as const (Array T@X Int)) 0))) ((as const (Array T@X Bool)) true))
true)
 :qid |unknown.0:0|
 :skolemid |14|
))) anon0_correct@@1)))))
PreconditionGeneratedEntry_correct@@1))
))
(check-sat)
(pop 1)
(declare-fun %lbl%+403 () Bool)
(declare-fun head@0@@0 () T@X)
(declare-fun %lbl%@3461 () Bool)
(declare-fun %lbl%@3497 () Bool)
(declare-fun %lbl%+3204 () Bool)
(push 1)
(set-info :boogie-vc-id two_buggy)
(assert (not
(let ((anon0_correct@@2 (=> (! (and %lbl%+403 true) :lblpos +403) (=> (= head@0@@0 (select Next head)) (and
(! (or %lbl%@3461 (forall ((d@@8 T@X) ) (! (=> (select D d@@8) (or
(select D (select Next d@@8))
(= d@@8 tail)))
 :qid |listbpl.62:17|
 :skolemid |7|
 :pattern ( (select D d@@8))
))) :lblneg @3461)
(=> (forall ((d@@9 T@X) ) (! (=> (select D d@@9) (or
(select D (select Next d@@9))
(= d@@9 tail)))
 :qid |listbpl.62:17|
 :skolemid |7|
 :pattern ( (select D d@@9))
)) (and
(! (or %lbl%@3497 (and
(select D head@0@@0)
(select D tail))) :lblneg @3497)
(=> (and
(select D head@0@@0)
(select D tail)) true))))))))
(let ((PreconditionGeneratedEntry_correct@@2 (=> (! (and %lbl%+3204 true) :lblpos +3204) (=> (and
(select D head)
(select D tail)
(forall ((d@@10 T@X) ) (! (=> (select D d@@10) (or
(select D (select Next d@@10))
(= d@@10 tail)))
 :qid |listbpl.61:18|
 :skolemid |6|
 :pattern ( (select D d@@10))
))
(exists ((partition_Mem@@6 (Array T@X Int)) ) (! (and
(= ((_ map =>) D ((_ map (= (Int Int) Bool)) partition_Mem@@6 ((as const (Array T@X Int)) 1))) ((as const (Array T@X Bool)) true))
(= ((_ map =>) allocator_Mem ((_ map (= (Int Int) Bool)) partition_Mem@@6 ((as const (Array T@X Int)) 0))) ((as const (Array T@X Bool)) true))
true)
 :qid |unknown.0:0|
 :skolemid |15|
))) anon0_correct@@2))))
PreconditionGeneratedEntry_correct@@2))
))
(check-sat)
(get-info :reason-unknown)
(labels)
(assert %lbl%@3497)
(check-sat)
(pop 1)
