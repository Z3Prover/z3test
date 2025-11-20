; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving treeContent - postcondition @ 48:15
(declare-fun start!31 () Bool)

(assert start!31)

(declare-fun b!145 () Bool)

(declare-fun e!88 () (Set (_ BitVec 32)))

(declare-fun empty!3 () (Set (_ BitVec 32)))

(assert (=> b!145 (= e!88 empty!3)))

(declare-fun b!146 () Bool)

(declare-fun e!87 () (Set (_ BitVec 32)))

(declare-fun error_value!14 () (Set (_ BitVec 32)))

(assert (=> b!146 (= e!87 error_value!14)))

(declare-fun lt!50 () (Set (_ BitVec 32)))

(declare-datatypes () ( (IntTree!5 (Leaf!5) (Node!5 (left!9 IntTree!5) (value!5 (_ BitVec 32)) (right!9 IntTree!5))) ))

(declare-fun tree!2 () IntTree!5)

(declare-fun size!1 (IntTree!5) Int)

(assert (=> start!31 (> (card lt!50) (size!1 tree!2))))

(assert (=> start!31 (= lt!50 e!88)))

(assert (=> start!31 (= b!145 (is-Leaf!5 tree!2))))

(declare-fun b!148 () Bool)

(assert (=> start!31 (or (not b!145) (not b!148))))

(assert (=> start!31 (or b!145 b!148)))

(declare-fun b!147 () Bool)

(declare-fun treeContent!0 (IntTree!5) (Set (_ BitVec 32)))

(assert (=> b!147 (= e!87 (union (union (treeContent!0 (left!9 tree!2)) (singleton (value!5 tree!2))) (treeContent!0 (right!9 tree!2))))))

(assert (=> b!148 (= e!88 e!87)))

(assert (=> b!148 (= b!147 (is-Node!5 tree!2))))

(assert (=> b!148 (or (not b!147) (not b!146))))

(assert (=> b!148 (or b!147 b!146)))

(push 1)

(assert (and (and (not b!145) (not start!31)) (not b!147)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun d!23 () Bool)

(assert (=> d!23 (= empty!3 (as emptyset (Set (_ BitVec 32))))))

(assert (=> b!145 d!23))

(declare-fun b!157 () Bool)

(declare-fun e!93 () Int)

(assert (=> b!157 (= e!93 (+ (+ 1 (size!1 (left!9 tree!2))) (size!1 (right!9 tree!2))))))

(declare-fun b!158 () Bool)

(declare-fun e!94 () Int)

(assert (=> b!158 (= e!94 0)))

(declare-fun b!159 () Bool)

(assert (=> b!159 (= e!94 e!93)))

(assert (=> b!159 (= b!157 (is-Node!5 tree!2))))

(declare-fun b!160 () Bool)

(assert (=> b!159 (or (not b!157) (not b!160))))

(assert (=> b!159 (or b!157 b!160)))

(declare-fun d!25 () Bool)

(assert (=> d!25 (= (size!1 tree!2) e!94)))

(assert (=> d!25 (= b!158 (is-Leaf!5 tree!2))))

(assert (=> d!25 (or (not b!158) (not b!159))))

(assert (=> d!25 (or b!158 b!159)))

(declare-fun lt!53 () Int)

(assert (=> d!25 (>= lt!53 0)))

(assert (=> d!25 (= lt!53 (size!1 tree!2))))

(declare-fun error_value!15 () Int)

(assert (=> b!160 (= e!93 error_value!15)))

(assert (=> start!31 d!25))

(declare-fun b!169 () Bool)

(declare-fun e!100 () (Set (_ BitVec 32)))

(declare-fun e!99 () (Set (_ BitVec 32)))

(assert (=> b!169 (= e!100 e!99)))

(declare-fun b!170 () Bool)

(assert (=> b!169 (= b!170 (is-Node!5 (left!9 tree!2)))))

(declare-fun b!171 () Bool)

(assert (=> b!169 (or (not b!170) (not b!171))))

(assert (=> b!169 (or b!170 b!171)))

(declare-fun d!27 () Bool)

(assert (=> d!27 (= (treeContent!0 (left!9 tree!2)) e!100)))

(declare-fun b!172 () Bool)

(assert (=> d!27 (= b!172 (is-Leaf!5 (left!9 tree!2)))))

(assert (=> d!27 (or (not b!172) (not b!169))))

(assert (=> d!27 (or b!172 b!169)))

(declare-fun lt!56 () (Set (_ BitVec 32)))

(assert (=> d!27 (<= (card lt!56) (size!1 (left!9 tree!2)))))

(assert (=> d!27 (= lt!56 (treeContent!0 (left!9 tree!2)))))

(assert (=> b!170 (= e!99 (union (union (treeContent!0 (left!9 (left!9 tree!2))) (singleton (value!5 (left!9 tree!2)))) (treeContent!0 (right!9 (left!9 tree!2)))))))

(declare-fun error_value!16 () (Set (_ BitVec 32)))

(assert (=> b!171 (= e!99 error_value!16)))

(assert (=> b!172 (= e!100 empty!3)))

(assert (=> b!147 d!27))

(declare-fun b!173 () Bool)

(declare-fun e!102 () (Set (_ BitVec 32)))

(declare-fun e!101 () (Set (_ BitVec 32)))

(assert (=> b!173 (= e!102 e!101)))

(declare-fun b!174 () Bool)

(assert (=> b!173 (= b!174 (is-Node!5 (right!9 tree!2)))))

(declare-fun b!175 () Bool)

(assert (=> b!173 (or (not b!174) (not b!175))))

(assert (=> b!173 (or b!174 b!175)))

(declare-fun d!29 () Bool)

(assert (=> d!29 (= (treeContent!0 (right!9 tree!2)) e!102)))

(declare-fun b!176 () Bool)

(assert (=> d!29 (= b!176 (is-Leaf!5 (right!9 tree!2)))))

(assert (=> d!29 (or (not b!176) (not b!173))))

(assert (=> d!29 (or b!176 b!173)))

(declare-fun lt!57 () (Set (_ BitVec 32)))

(assert (=> d!29 (<= (card lt!57) (size!1 (right!9 tree!2)))))

(assert (=> d!29 (= lt!57 (treeContent!0 (right!9 tree!2)))))

(assert (=> b!174 (= e!101 (union (union (treeContent!0 (left!9 (right!9 tree!2))) (singleton (value!5 (right!9 tree!2)))) (treeContent!0 (right!9 (right!9 tree!2)))))))

(declare-fun error_value!17 () (Set (_ BitVec 32)))

(assert (=> b!175 (= e!101 error_value!17)))

(assert (=> b!176 (= e!102 empty!3)))

(assert (=> b!147 d!29))

(push 1)

(assert (and (and (and (and (and (and (not b!174) (not b!176)) (not d!27)) (not b!172)) (not b!157)) (not d!29)) (not b!170)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

