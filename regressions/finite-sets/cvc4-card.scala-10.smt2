; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving listReverse - postcondition @ 55:14
(declare-fun start!41 () Bool)

(assert start!41)

(declare-fun b!185 () Bool)

(declare-datatypes () ( (IntList!5 (Cons!6 (head!7 (_ BitVec 32)) (tail!11 IntList!5)) (Nil!6)) ))

(declare-fun e!107 () IntList!5)

(declare-fun tsil!0 () IntList!5)

(assert (=> b!185 (= e!107 tsil!0)))

(declare-fun b!186 () Bool)

(declare-fun e!108 () IntList!5)

(assert (=> b!186 (= e!107 e!108)))

(declare-fun b!187 () Bool)

(declare-fun list!2 () IntList!5)

(assert (=> b!186 (= b!187 (is-Cons!6 list!2))))

(declare-fun b!188 () Bool)

(assert (=> b!186 (or (not b!187) (not b!188))))

(assert (=> b!186 (or b!187 b!188)))

(declare-fun listReverse!0 (IntList!5 IntList!5) IntList!5)

(assert (=> b!187 (= e!108 (listReverse!0 (tail!11 list!2) (Cons!6 (head!7 list!2) tsil!0)))))

(declare-fun lt!60 () IntList!5)

(declare-fun listContent!0 (IntList!5) (FiniteSet (_ BitVec 32)))

(assert (=> start!41 (not (= (listContent!0 lt!60) (set.union (listContent!0 list!2) (listContent!0 tsil!0))))))

(assert (=> start!41 (= lt!60 e!107)))

(assert (=> start!41 (= b!185 (is-Nil!6 list!2))))

(assert (=> start!41 (or (not b!185) (not b!186))))

(assert (=> start!41 (or b!185 b!186)))

(declare-fun error_value!18 () IntList!5)

(assert (=> b!188 (= e!108 error_value!18)))

(push 1)

(assert (and (not b!187) (not start!41)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!197 () Bool)

(declare-fun e!113 () IntList!5)

(declare-fun e!114 () IntList!5)

(assert (=> b!197 (= e!113 e!114)))

(declare-fun b!198 () Bool)

(assert (=> b!197 (= b!198 (is-Cons!6 (tail!11 list!2)))))

(declare-fun b!199 () Bool)

(assert (=> b!197 (or (not b!198) (not b!199))))

(assert (=> b!197 (or b!198 b!199)))

(assert (=> b!198 (= e!114 (listReverse!0 (tail!11 (tail!11 list!2)) (Cons!6 (head!7 (tail!11 list!2)) (Cons!6 (head!7 list!2) tsil!0))))))

(declare-fun d!31 () Bool)

(assert (=> d!31 (= (listReverse!0 (tail!11 list!2) (Cons!6 (head!7 list!2) tsil!0)) e!113)))

(declare-fun b!200 () Bool)

(assert (=> d!31 (= b!200 (is-Nil!6 (tail!11 list!2)))))

(assert (=> d!31 (or (not b!200) (not b!197))))

(assert (=> d!31 (or b!200 b!197)))

(declare-fun lt!63 () IntList!5)

(assert (=> d!31 (= (listContent!0 lt!63) (set.union (listContent!0 (tail!11 list!2)) (listContent!0 (Cons!6 (head!7 list!2) tsil!0))))))

(assert (=> d!31 (= lt!63 (listReverse!0 (tail!11 list!2) (Cons!6 (head!7 list!2) tsil!0)))))

(declare-fun error_value!19 () IntList!5)

(assert (=> b!199 (= e!114 error_value!19)))

(assert (=> b!200 (= e!113 (Cons!6 (head!7 list!2) tsil!0))))

(assert (=> b!187 d!31))

(declare-fun b!209 () Bool)

(declare-fun e!120 () (FiniteSet (_ BitVec 32)))

(declare-fun empty!4 () (FiniteSet (_ BitVec 32)))

(assert (=> b!209 (= e!120 empty!4)))

(declare-fun b!210 () Bool)

(declare-fun e!119 () (FiniteSet (_ BitVec 32)))

(declare-fun error_value!20 () (FiniteSet (_ BitVec 32)))

(assert (=> b!210 (= e!119 error_value!20)))

(declare-fun d!33 () Bool)

(assert (=> d!33 (= (listContent!0 lt!60) e!120)))

(assert (=> d!33 (= b!209 (is-Nil!6 lt!60))))

(declare-fun b!212 () Bool)

(assert (=> d!33 (or (not b!209) (not b!212))))

(assert (=> d!33 (or b!209 b!212)))

(declare-fun lt!66 () (FiniteSet (_ BitVec 32)))

(declare-fun size!0 (IntList!5) Int)

(assert (=> d!33 (<= (set.size lt!66) (size!0 lt!60))))

(assert (=> d!33 (= lt!66 (listContent!0 lt!60))))

(declare-fun b!211 () Bool)

(assert (=> b!211 (= e!119 (set.union (set.singleton (head!7 lt!60)) (listContent!0 (tail!11 lt!60))))))

(assert (=> b!212 (= e!120 e!119)))

(assert (=> b!212 (= b!211 (is-Cons!6 lt!60))))

(assert (=> b!212 (or (not b!211) (not b!210))))

(assert (=> b!212 (or b!211 b!210)))

(assert (=> start!41 d!33))

(declare-fun b!213 () Bool)

(declare-fun e!122 () (FiniteSet (_ BitVec 32)))

(assert (=> b!213 (= e!122 empty!4)))

(declare-fun b!214 () Bool)

(declare-fun e!121 () (FiniteSet (_ BitVec 32)))

(declare-fun error_value!21 () (FiniteSet (_ BitVec 32)))

(assert (=> b!214 (= e!121 error_value!21)))

(declare-fun d!35 () Bool)

(assert (=> d!35 (= (listContent!0 list!2) e!122)))

(assert (=> d!35 (= b!213 (is-Nil!6 list!2))))

(declare-fun b!216 () Bool)

(assert (=> d!35 (or (not b!213) (not b!216))))

(assert (=> d!35 (or b!213 b!216)))

(declare-fun lt!67 () (FiniteSet (_ BitVec 32)))

(assert (=> d!35 (<= (set.size lt!67) (size!0 list!2))))

(assert (=> d!35 (= lt!67 (listContent!0 list!2))))

(declare-fun b!215 () Bool)

(assert (=> b!215 (= e!121 (set.union (set.singleton (head!7 list!2)) (listContent!0 (tail!11 list!2))))))

(assert (=> b!216 (= e!122 e!121)))

(assert (=> b!216 (= b!215 (is-Cons!6 list!2))))

(assert (=> b!216 (or (not b!215) (not b!214))))

(assert (=> b!216 (or b!215 b!214)))

(assert (=> start!41 d!35))

(declare-fun b!217 () Bool)

(declare-fun e!124 () (FiniteSet (_ BitVec 32)))

(assert (=> b!217 (= e!124 empty!4)))

(declare-fun b!218 () Bool)

(declare-fun e!123 () (FiniteSet (_ BitVec 32)))

(declare-fun error_value!22 () (FiniteSet (_ BitVec 32)))

(assert (=> b!218 (= e!123 error_value!22)))

(declare-fun d!37 () Bool)

(assert (=> d!37 (= (listContent!0 tsil!0) e!124)))

(assert (=> d!37 (= b!217 (is-Nil!6 tsil!0))))

(declare-fun b!220 () Bool)

(assert (=> d!37 (or (not b!217) (not b!220))))

(assert (=> d!37 (or b!217 b!220)))

(declare-fun lt!68 () (FiniteSet (_ BitVec 32)))

(assert (=> d!37 (<= (set.size lt!68) (size!0 tsil!0))))

(assert (=> d!37 (= lt!68 (listContent!0 tsil!0))))

(declare-fun b!219 () Bool)

(assert (=> b!219 (= e!123 (set.union (set.singleton (head!7 tsil!0)) (listContent!0 (tail!11 tsil!0))))))

(assert (=> b!220 (= e!124 e!123)))

(assert (=> b!220 (= b!219 (is-Cons!6 tsil!0))))

(assert (=> b!220 (or (not b!219) (not b!218))))

(assert (=> b!220 (or b!219 b!218)))

(assert (=> start!41 d!37))

(push 1)

(assert (and (and (and (and (and (and (and (and (and (and (not d!35) (not d!37)) (not d!33)) (not b!213)) (not b!211)) (not b!198)) (not b!219)) (not b!215)) (not b!217)) (not d!31)) (not b!209)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

