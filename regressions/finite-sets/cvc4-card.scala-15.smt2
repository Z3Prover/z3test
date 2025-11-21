; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving listFromSet - precond. (call listFromSet0(s, Nil())) @ 62:44
(declare-fun start!65 () Bool)

(assert start!65)

(declare-fun s!1 () (FiniteSet (_ BitVec 32)))

(declare-datatypes () ( (IntList!8 (Cons!9 (head!10 (_ BitVec 32)) (tail!14 IntList!8)) (Nil!9)) ))

(declare-fun listContent!0 (IntList!8) (FiniteSet (_ BitVec 32)))

(declare-fun empty!7 () (FiniteSet (_ BitVec 32)))

(assert (=> start!65 (not (= (set.intersect (listContent!0 Nil!9) s!1) empty!7))))

(push 1)

(assert (not start!65))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!303 () Bool)

(declare-fun e!166 () (FiniteSet (_ BitVec 32)))

(declare-fun e!167 () (FiniteSet (_ BitVec 32)))

(assert (=> b!303 (= e!166 e!167)))

(declare-fun b!305 () Bool)

(assert (=> b!303 (= b!305 (is-Cons!9 Nil!9))))

(declare-fun b!304 () Bool)

(assert (=> b!303 (or (not b!305) (not b!304))))

(assert (=> b!303 (or b!305 b!304)))

(declare-fun error_value!30 () (FiniteSet (_ BitVec 32)))

(assert (=> b!304 (= e!167 error_value!30)))

(assert (=> b!305 (= e!167 (set.union (set.singleton (head!10 Nil!9)) (listContent!0 (tail!14 Nil!9))))))

(declare-fun d!53 () Bool)

(assert (=> d!53 (= (listContent!0 Nil!9) e!166)))

(declare-fun b!306 () Bool)

(assert (=> d!53 (= b!306 (is-Nil!9 Nil!9))))

(assert (=> d!53 (or (not b!306) (not b!303))))

(assert (=> d!53 (or b!306 b!303)))

(declare-fun lt!97 () (FiniteSet (_ BitVec 32)))

(declare-fun size!0 (IntList!8) Int)

(assert (=> d!53 (<= (set.size lt!97) (size!0 Nil!9))))

(assert (=> d!53 (= lt!97 (listContent!0 Nil!9))))

(assert (=> b!306 (= e!166 empty!7)))

(assert (=> start!65 d!53))

(declare-fun d!55 () Bool)

(assert (=> d!55 (= empty!7 (as set.empty (FiniteSet (_ BitVec 32))))))

(assert (=> start!65 d!55))

(push 1)

(assert (and (and (not b!305) (not d!53)) (not b!306)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

