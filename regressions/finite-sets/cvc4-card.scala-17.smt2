; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving listFromSet0 - precond. (call listFromSet0(s -- FiniteSet[Int](e), Cons(e, a ...) @ 72:7
(declare-fun start!83 () Bool)

(assert start!83)

(declare-datatypes () ( (IntList!10 (Cons!11 (head!12 (_ BitVec 32)) (tail!16 IntList!10)) (Nil!11)) ))

(declare-fun acc!0 () IntList!10)

(declare-fun s!2 () (FiniteSet (_ BitVec 32)))

(declare-fun e!5 () (_ BitVec 32))

(declare-fun listContent!0 (IntList!10) (FiniteSet (_ BitVec 32)))

(declare-fun empty!9 () (FiniteSet (_ BitVec 32)))

(declare-fun pickOne!0 ((FiniteSet (_ BitVec 32))) (_ BitVec 32))

(assert (=> start!83 (and (and (and (= (set.intersect (listContent!0 acc!0) s!2) empty!9) (not (= s!2 empty!9))) (= e!5 (pickOne!0 s!2))) (not (= (set.intersect (listContent!0 (Cons!11 e!5 acc!0)) (set.difference s!2 (set.singleton e!5))) empty!9)))))

(push 1)

(assert (not start!83))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!393 () Bool)

(declare-fun e!213 () (FiniteSet (_ BitVec 32)))

(assert (=> b!393 (= e!213 empty!9)))

(declare-fun b!394 () Bool)

(declare-fun e!212 () (FiniteSet (_ BitVec 32)))

(declare-fun error_value!43 () (FiniteSet (_ BitVec 32)))

(assert (=> b!394 (= e!212 error_value!43)))

(declare-fun d!91 () Bool)

(assert (=> d!91 (= (listContent!0 acc!0) e!213)))

(assert (=> d!91 (= b!393 (is-Nil!11 acc!0))))

(declare-fun b!396 () Bool)

(assert (=> d!91 (or (not b!393) (not b!396))))

(assert (=> d!91 (or b!393 b!396)))

(declare-fun lt!130 () (FiniteSet (_ BitVec 32)))

(declare-fun size!0 (IntList!10) Int)

(assert (=> d!91 (<= (set.size lt!130) (size!0 acc!0))))

(assert (=> d!91 (= lt!130 (listContent!0 acc!0))))

(declare-fun b!395 () Bool)

(assert (=> b!395 (= e!212 (set.union (set.singleton (head!12 acc!0)) (listContent!0 (tail!16 acc!0))))))

(assert (=> b!396 (= e!213 e!212)))

(assert (=> b!396 (= b!395 (is-Cons!11 acc!0))))

(assert (=> b!396 (or (not b!395) (not b!394))))

(assert (=> b!396 (or b!395 b!394)))

(assert (=> start!83 d!91))

(declare-fun d!93 () Bool)

(assert (=> d!93 (= empty!9 (as set.empty (FiniteSet (_ BitVec 32))))))

(assert (=> start!83 d!93))

(declare-fun d!95 () Bool)

(declare-fun x$3!14 () (_ BitVec 32))

(assert (=> d!95 (= (pickOne!0 s!2) x$3!14)))

(assert (=> d!95 (set.in x$3!14 s!2)))

(assert (=> start!83 d!95))

(declare-fun b!397 () Bool)

(declare-fun e!215 () (FiniteSet (_ BitVec 32)))

(assert (=> b!397 (= e!215 empty!9)))

(declare-fun b!398 () Bool)

(declare-fun e!214 () (FiniteSet (_ BitVec 32)))

(declare-fun error_value!44 () (FiniteSet (_ BitVec 32)))

(assert (=> b!398 (= e!214 error_value!44)))

(declare-fun d!97 () Bool)

(assert (=> d!97 (= (listContent!0 (Cons!11 e!5 acc!0)) e!215)))

(assert (=> d!97 (= b!397 (is-Nil!11 (Cons!11 e!5 acc!0)))))

(declare-fun b!400 () Bool)

(assert (=> d!97 (or (not b!397) (not b!400))))

(assert (=> d!97 (or b!397 b!400)))

(declare-fun lt!131 () (FiniteSet (_ BitVec 32)))

(assert (=> d!97 (<= (set.size lt!131) (size!0 (Cons!11 e!5 acc!0)))))

(assert (=> d!97 (= lt!131 (listContent!0 (Cons!11 e!5 acc!0)))))

(declare-fun b!399 () Bool)

(assert (=> b!399 (= e!214 (set.union (set.singleton e!5) (listContent!0 acc!0)))))

(assert (=> b!400 (= e!215 e!214)))

(assert (=> b!400 (= b!399 (is-Cons!11 (Cons!11 e!5 acc!0)))))

(assert (=> b!400 (or (not b!399) (not b!398))))

(assert (=> b!400 (or b!399 b!398)))

(assert (=> start!83 d!97))

(push 1)

(assert (and (and (and (and (and (not d!97) (not b!397)) (not b!399)) (not b!393)) (not d!91)) (not b!395)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

