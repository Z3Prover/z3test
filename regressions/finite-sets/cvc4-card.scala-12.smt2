; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving treeMirror - postcondition @ 60:15
(declare-fun start!49 () Bool)

(assert start!49)

(declare-fun b!229 () Bool)

(declare-datatypes () ( (IntTree!7 (Leaf!7) (Node!7 (left!11 IntTree!7) (value!7 (_ BitVec 32)) (right!11 IntTree!7))) ))

(declare-fun e!129 () IntTree!7)

(declare-fun error_value!23 () IntTree!7)

(assert (=> b!229 (= e!129 error_value!23)))

(declare-fun b!230 () Bool)

(declare-fun e!130 () IntTree!7)

(assert (=> b!230 (= e!130 e!129)))

(declare-fun b!232 () Bool)

(declare-fun tree!3 () IntTree!7)

(assert (=> b!230 (= b!232 (is-Node!7 tree!3))))

(assert (=> b!230 (or (not b!232) (not b!229))))

(assert (=> b!230 (or b!232 b!229)))

(declare-fun b!231 () Bool)

(assert (=> b!231 (= e!130 Leaf!7)))

(declare-fun lt!71 () IntTree!7)

(declare-fun treeContent!0 (IntTree!7) (Set (_ BitVec 32)))

(assert (=> start!49 (not (= (treeContent!0 lt!71) (treeContent!0 tree!3)))))

(assert (=> start!49 (= lt!71 e!130)))

(assert (=> start!49 (= b!231 (is-Leaf!7 tree!3))))

(assert (=> start!49 (or (not b!231) (not b!230))))

(assert (=> start!49 (or b!231 b!230)))

(declare-fun treeMirror!0 (IntTree!7) IntTree!7)

(assert (=> b!232 (= e!129 (Node!7 (treeMirror!0 (right!11 tree!3)) (value!7 tree!3) (treeMirror!0 (left!11 tree!3))))))

(push 1)

(assert (and (not b!232) (not start!49)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!241 () Bool)

(declare-fun e!136 () IntTree!7)

(declare-fun e!135 () IntTree!7)

(assert (=> b!241 (= e!136 e!135)))

(declare-fun b!242 () Bool)

(assert (=> b!241 (= b!242 (is-Node!7 (right!11 tree!3)))))

(declare-fun b!244 () Bool)

(assert (=> b!241 (or (not b!242) (not b!244))))

(assert (=> b!241 (or b!242 b!244)))

(assert (=> b!242 (= e!135 (Node!7 (treeMirror!0 (right!11 (right!11 tree!3))) (value!7 (right!11 tree!3)) (treeMirror!0 (left!11 (right!11 tree!3)))))))

(declare-fun d!39 () Bool)

(assert (=> d!39 (= (treeMirror!0 (right!11 tree!3)) e!136)))

(declare-fun b!243 () Bool)

(assert (=> d!39 (= b!243 (is-Leaf!7 (right!11 tree!3)))))

(assert (=> d!39 (or (not b!243) (not b!241))))

(assert (=> d!39 (or b!243 b!241)))

(declare-fun lt!74 () IntTree!7)

(assert (=> d!39 (= (treeContent!0 lt!74) (treeContent!0 (right!11 tree!3)))))

(assert (=> d!39 (= lt!74 (treeMirror!0 (right!11 tree!3)))))

(assert (=> b!243 (= e!136 Leaf!7)))

(declare-fun error_value!24 () IntTree!7)

(assert (=> b!244 (= e!135 error_value!24)))

(assert (=> b!232 d!39))

(declare-fun b!245 () Bool)

(declare-fun e!138 () IntTree!7)

(declare-fun e!137 () IntTree!7)

(assert (=> b!245 (= e!138 e!137)))

(declare-fun b!246 () Bool)

(assert (=> b!245 (= b!246 (is-Node!7 (left!11 tree!3)))))

(declare-fun b!248 () Bool)

(assert (=> b!245 (or (not b!246) (not b!248))))

(assert (=> b!245 (or b!246 b!248)))

(assert (=> b!246 (= e!137 (Node!7 (treeMirror!0 (right!11 (left!11 tree!3))) (value!7 (left!11 tree!3)) (treeMirror!0 (left!11 (left!11 tree!3)))))))

(declare-fun d!41 () Bool)

(assert (=> d!41 (= (treeMirror!0 (left!11 tree!3)) e!138)))

(declare-fun b!247 () Bool)

(assert (=> d!41 (= b!247 (is-Leaf!7 (left!11 tree!3)))))

(assert (=> d!41 (or (not b!247) (not b!245))))

(assert (=> d!41 (or b!247 b!245)))

(declare-fun lt!75 () IntTree!7)

(assert (=> d!41 (= (treeContent!0 lt!75) (treeContent!0 (left!11 tree!3)))))

(assert (=> d!41 (= lt!75 (treeMirror!0 (left!11 tree!3)))))

(assert (=> b!247 (= e!138 Leaf!7)))

(declare-fun error_value!25 () IntTree!7)

(assert (=> b!248 (= e!137 error_value!25)))

(assert (=> b!232 d!41))

(declare-fun b!257 () Bool)

(declare-fun e!144 () (Set (_ BitVec 32)))

(declare-fun empty!5 () (Set (_ BitVec 32)))

(assert (=> b!257 (= e!144 empty!5)))

(declare-fun d!43 () Bool)

(assert (=> d!43 (= (treeContent!0 lt!71) e!144)))

(assert (=> d!43 (= b!257 (is-Leaf!7 lt!71))))

(declare-fun b!258 () Bool)

(assert (=> d!43 (or (not b!257) (not b!258))))

(assert (=> d!43 (or b!257 b!258)))

(declare-fun lt!78 () (Set (_ BitVec 32)))

(declare-fun size!1 (IntTree!7) Int)

(assert (=> d!43 (<= (card lt!78) (size!1 lt!71))))

(assert (=> d!43 (= lt!78 (treeContent!0 lt!71))))

(declare-fun e!143 () (Set (_ BitVec 32)))

(assert (=> b!258 (= e!144 e!143)))

(declare-fun b!259 () Bool)

(assert (=> b!258 (= b!259 (is-Node!7 lt!71))))

(declare-fun b!260 () Bool)

(assert (=> b!258 (or (not b!259) (not b!260))))

(assert (=> b!258 (or b!259 b!260)))

(assert (=> b!259 (= e!143 (union (union (treeContent!0 (left!11 lt!71)) (singleton (value!7 lt!71))) (treeContent!0 (right!11 lt!71))))))

(declare-fun error_value!26 () (Set (_ BitVec 32)))

(assert (=> b!260 (= e!143 error_value!26)))

(assert (=> start!49 d!43))

(declare-fun b!261 () Bool)

(declare-fun e!146 () (Set (_ BitVec 32)))

(assert (=> b!261 (= e!146 empty!5)))

(declare-fun d!45 () Bool)

(assert (=> d!45 (= (treeContent!0 tree!3) e!146)))

(assert (=> d!45 (= b!261 (is-Leaf!7 tree!3))))

(declare-fun b!262 () Bool)

(assert (=> d!45 (or (not b!261) (not b!262))))

(assert (=> d!45 (or b!261 b!262)))

(declare-fun lt!79 () (Set (_ BitVec 32)))

(assert (=> d!45 (<= (card lt!79) (size!1 tree!3))))

(assert (=> d!45 (= lt!79 (treeContent!0 tree!3))))

(declare-fun e!145 () (Set (_ BitVec 32)))

(assert (=> b!262 (= e!146 e!145)))

(declare-fun b!263 () Bool)

(assert (=> b!262 (= b!263 (is-Node!7 tree!3))))

(declare-fun b!264 () Bool)

(assert (=> b!262 (or (not b!263) (not b!264))))

(assert (=> b!262 (or b!263 b!264)))

(assert (=> b!263 (= e!145 (union (union (treeContent!0 (left!11 tree!3)) (singleton (value!7 tree!3))) (treeContent!0 (right!11 tree!3))))))

(declare-fun error_value!27 () (Set (_ BitVec 32)))

(assert (=> b!264 (= e!145 error_value!27)))

(assert (=> start!49 d!45))

(push 1)

(assert (and (and (and (and (and (and (and (and (and (not d!45) (not b!257)) (not b!261)) (not d!41)) (not d!43)) (not b!259)) (not d!39)) (not b!246)) (not b!242)) (not b!263)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

