; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving listFromSet - postcondition @ 62:76
(declare-fun start!57 () Bool)

(assert start!57)

(declare-datatypes () ( (IntList!7 (Cons!8 (head!9 (_ BitVec 32)) (tail!13 IntList!7)) (Nil!8)) ))

(declare-fun lt!82 () IntList!7)

(declare-fun s!1 () (FiniteSet (_ BitVec 32)))

(declare-fun listContent!0 (IntList!7) (FiniteSet (_ BitVec 32)))

(declare-fun size!0 (IntList!7) Int)

(assert (=> start!57 (or (not (= (listContent!0 lt!82) s!1)) (not (= (size!0 lt!82) (set.size s!1))))))

(declare-fun listFromSet0!0 ((FiniteSet (_ BitVec 32)) IntList!7) IntList!7)

(assert (=> start!57 (= lt!82 (listFromSet0!0 s!1 Nil!8))))

(push 1)

(assert (not start!57))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!273 () Bool)

(declare-fun e!151 () (FiniteSet (_ BitVec 32)))

(declare-fun e!152 () (FiniteSet (_ BitVec 32)))

(assert (=> b!273 (= e!151 e!152)))

(declare-fun b!274 () Bool)

(assert (=> b!273 (= b!274 (is-Cons!8 lt!82))))

(declare-fun b!275 () Bool)

(assert (=> b!273 (or (not b!274) (not b!275))))

(assert (=> b!273 (or b!274 b!275)))

(assert (=> b!274 (= e!152 (set.union (set.singleton (head!9 lt!82)) (listContent!0 (tail!13 lt!82))))))

(declare-fun error_value!28 () (FiniteSet (_ BitVec 32)))

(assert (=> b!275 (= e!152 error_value!28)))

(declare-fun b!276 () Bool)

(declare-fun empty!6 () (FiniteSet (_ BitVec 32)))

(assert (=> b!276 (= e!151 empty!6)))

(declare-fun d!47 () Bool)

(assert (=> d!47 (= (listContent!0 lt!82) e!151)))

(assert (=> d!47 (= b!276 (is-Nil!8 lt!82))))

(assert (=> d!47 (or (not b!276) (not b!273))))

(assert (=> d!47 (or b!276 b!273)))

(declare-fun lt!85 () (FiniteSet (_ BitVec 32)))

(assert (=> d!47 (<= (set.size lt!85) (size!0 lt!82))))

(assert (=> d!47 (= lt!85 (listContent!0 lt!82))))

(assert (=> start!57 d!47))

(declare-fun b!285 () Bool)

(declare-fun e!157 () Int)

(assert (=> b!285 (= e!157 (+ 1 (size!0 (tail!13 lt!82))))))

(declare-fun b!286 () Bool)

(declare-fun e!158 () Int)

(assert (=> b!286 (= e!158 0)))

(declare-fun b!287 () Bool)

(assert (=> b!287 (= e!158 e!157)))

(assert (=> b!287 (= b!285 (is-Cons!8 lt!82))))

(declare-fun b!288 () Bool)

(assert (=> b!287 (or (not b!285) (not b!288))))

(assert (=> b!287 (or b!285 b!288)))

(declare-fun error_value!29 () Int)

(assert (=> b!288 (= e!157 error_value!29)))

(declare-fun d!49 () Bool)

(assert (=> d!49 (= (size!0 lt!82) e!158)))

(assert (=> d!49 (= b!286 (is-Nil!8 lt!82))))

(assert (=> d!49 (or (not b!286) (not b!287))))

(assert (=> d!49 (or b!286 b!287)))

(declare-fun lt!88 () Int)

(assert (=> d!49 (>= lt!88 0)))

(assert (=> d!49 (= lt!88 (size!0 lt!82))))

(assert (=> start!57 d!49))

(declare-fun b!294 () Bool)

(declare-fun e!161 () IntList!7)

(declare-fun lt!94 () (_ BitVec 32))

(assert (=> b!294 (= e!161 (listFromSet0!0 (set.difference s!1 (set.singleton lt!94)) (Cons!8 lt!94 Nil!8)))))

(declare-fun pickOne!0 ((FiniteSet (_ BitVec 32))) (_ BitVec 32))

(assert (=> b!294 (= lt!94 (pickOne!0 s!1))))

(declare-fun d!51 () Bool)

(assert (=> (and d!51 (= (set.intersect (listContent!0 Nil!8) s!1) empty!6)) (= (listFromSet0!0 s!1 Nil!8) e!161)))

(declare-fun b!293 () Bool)

(assert (=> d!51 (= b!293 (= s!1 empty!6))))

(assert (=> d!51 (or (not b!293) (not b!294))))

(assert (=> d!51 (or b!293 b!294)))

(declare-fun lt!93 () IntList!7)

(assert (=> (and d!51 (= (set.intersect (listContent!0 Nil!8) s!1) empty!6)) (and (= (listContent!0 lt!93) (set.union (listContent!0 Nil!8) s!1)) (= (size!0 lt!93) (+ (size!0 Nil!8) (set.size s!1))))))

(assert (=> d!51 (= lt!93 (listFromSet0!0 s!1 Nil!8))))

(assert (=> b!293 (= e!161 Nil!8)))

(assert (=> start!57 d!51))

(push 1)

(assert (and (and (and (and (and (not b!276) (not d!51)) (not b!294)) (not b!285)) (not d!47)) (not b!274)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

