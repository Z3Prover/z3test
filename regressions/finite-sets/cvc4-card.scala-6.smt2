; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving listContent - postcondition @ 43:15
(declare-fun start!21 () Bool)

(assert start!21)

(declare-fun b!101 () Bool)

(declare-fun e!66 () (Set (_ BitVec 32)))

(declare-fun error_value!9 () (Set (_ BitVec 32)))

(assert (=> b!101 (= e!66 error_value!9)))

(declare-fun b!102 () Bool)

(declare-fun e!65 () (Set (_ BitVec 32)))

(assert (=> b!102 (= e!65 e!66)))

(declare-fun b!104 () Bool)

(declare-datatypes () ( (IntList!3 (Cons!4 (head!5 (_ BitVec 32)) (tail!9 IntList!3)) (Nil!4)) ))

(declare-fun list!1 () IntList!3)

(assert (=> b!102 (= b!104 (is-Cons!4 list!1))))

(assert (=> b!102 (or (not b!104) (not b!101))))

(assert (=> b!102 (or b!104 b!101)))

(declare-fun b!103 () Bool)

(declare-fun empty!2 () (Set (_ BitVec 32)))

(assert (=> b!103 (= e!65 empty!2)))

(declare-fun lt!39 () (Set (_ BitVec 32)))

(declare-fun size!0 (IntList!3) Int)

(assert (=> start!21 (> (card lt!39) (size!0 list!1))))

(assert (=> start!21 (= lt!39 e!65)))

(assert (=> start!21 (= b!103 (is-Nil!4 list!1))))

(assert (=> start!21 (or (not b!103) (not b!102))))

(assert (=> start!21 (or b!103 b!102)))

(declare-fun listContent!0 (IntList!3) (Set (_ BitVec 32)))

(assert (=> b!104 (= e!66 (union (singleton (head!5 list!1)) (listContent!0 (tail!9 list!1))))))

(push 1)

(assert (and (and (not b!103) (not b!104)) (not start!21)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun d!13 () Bool)

(assert (=> d!13 (= empty!2 (as emptyset (Set (_ BitVec 32))))))

(assert (=> b!103 d!13))

(declare-fun b!113 () Bool)

(declare-fun e!72 () (Set (_ BitVec 32)))

(assert (=> b!113 (= e!72 empty!2)))

(declare-fun d!15 () Bool)

(assert (=> d!15 (= (listContent!0 (tail!9 list!1)) e!72)))

(assert (=> d!15 (= b!113 (is-Nil!4 (tail!9 list!1)))))

(declare-fun b!115 () Bool)

(assert (=> d!15 (or (not b!113) (not b!115))))

(assert (=> d!15 (or b!113 b!115)))

(declare-fun lt!42 () (Set (_ BitVec 32)))

(assert (=> d!15 (<= (card lt!42) (size!0 (tail!9 list!1)))))

(assert (=> d!15 (= lt!42 (listContent!0 (tail!9 list!1)))))

(declare-fun b!114 () Bool)

(declare-fun e!71 () (Set (_ BitVec 32)))

(declare-fun error_value!10 () (Set (_ BitVec 32)))

(assert (=> b!114 (= e!71 error_value!10)))

(assert (=> b!115 (= e!72 e!71)))

(declare-fun b!116 () Bool)

(assert (=> b!115 (= b!116 (is-Cons!4 (tail!9 list!1)))))

(assert (=> b!115 (or (not b!116) (not b!114))))

(assert (=> b!115 (or b!116 b!114)))

(assert (=> b!116 (= e!71 (union (singleton (head!5 (tail!9 list!1))) (listContent!0 (tail!9 (tail!9 list!1)))))))

(assert (=> b!104 d!15))

(declare-fun b!125 () Bool)

(declare-fun e!78 () Int)

(assert (=> b!125 (= e!78 (+ 1 (size!0 (tail!9 list!1))))))

(declare-fun b!126 () Bool)

(declare-fun e!77 () Int)

(assert (=> b!126 (= e!77 0)))

(declare-fun d!17 () Bool)

(assert (=> d!17 (= (size!0 list!1) e!77)))

(assert (=> d!17 (= b!126 (is-Nil!4 list!1))))

(declare-fun b!128 () Bool)

(assert (=> d!17 (or (not b!126) (not b!128))))

(assert (=> d!17 (or b!126 b!128)))

(declare-fun lt!45 () Int)

(assert (=> d!17 (>= lt!45 0)))

(assert (=> d!17 (= lt!45 (size!0 list!1))))

(declare-fun b!127 () Bool)

(declare-fun error_value!11 () Int)

(assert (=> b!127 (= e!78 error_value!11)))

(assert (=> b!128 (= e!77 e!78)))

(assert (=> b!128 (= b!125 (is-Cons!4 list!1))))

(assert (=> b!128 (or (not b!125) (not b!127))))

(assert (=> b!128 (or b!125 b!127)))

(assert (=> start!21 d!17))

(push 1)

(assert (and (and (and (not d!15) (not b!113)) (not b!125)) (not b!116)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!129 () Bool)

(declare-fun e!80 () Int)

(assert (=> b!129 (= e!80 (+ 1 (size!0 (tail!9 (tail!9 list!1)))))))

(declare-fun b!130 () Bool)

(declare-fun e!79 () Int)

(assert (=> b!130 (= e!79 0)))

(declare-fun d!19 () Bool)

(assert (=> d!19 (= (size!0 (tail!9 list!1)) e!79)))

(assert (=> d!19 (= b!130 (is-Nil!4 (tail!9 list!1)))))

(declare-fun b!132 () Bool)

(assert (=> d!19 (or (not b!130) (not b!132))))

(assert (=> d!19 (or b!130 b!132)))

(declare-fun lt!46 () Int)

(assert (=> d!19 (>= lt!46 0)))

(assert (=> d!19 (= lt!46 (size!0 (tail!9 list!1)))))

(declare-fun b!131 () Bool)

(declare-fun error_value!12 () Int)

(assert (=> b!131 (= e!80 error_value!12)))

(assert (=> b!132 (= e!79 e!80)))

(assert (=> b!132 (= b!129 (is-Cons!4 (tail!9 list!1)))))

(assert (=> b!132 (or (not b!129) (not b!131))))

(assert (=> b!132 (or b!129 b!131)))

(assert (=> d!15 d!19))

(assert (=> b!113 d!13))

(assert (=> b!125 d!19))

(declare-fun b!133 () Bool)

(declare-fun e!82 () (Set (_ BitVec 32)))

(assert (=> b!133 (= e!82 empty!2)))

(declare-fun d!21 () Bool)

(assert (=> d!21 (= (listContent!0 (tail!9 (tail!9 list!1))) e!82)))

(assert (=> d!21 (= b!133 (is-Nil!4 (tail!9 (tail!9 list!1))))))

(declare-fun b!135 () Bool)

(assert (=> d!21 (or (not b!133) (not b!135))))

(assert (=> d!21 (or b!133 b!135)))

(declare-fun lt!47 () (Set (_ BitVec 32)))

(assert (=> d!21 (<= (card lt!47) (size!0 (tail!9 (tail!9 list!1))))))

(assert (=> d!21 (= lt!47 (listContent!0 (tail!9 (tail!9 list!1))))))

(declare-fun b!134 () Bool)

(declare-fun e!81 () (Set (_ BitVec 32)))

(declare-fun error_value!13 () (Set (_ BitVec 32)))

(assert (=> b!134 (= e!81 error_value!13)))

(assert (=> b!135 (= e!82 e!81)))

(declare-fun b!136 () Bool)

(assert (=> b!135 (= b!136 (is-Cons!4 (tail!9 (tail!9 list!1))))))

(assert (=> b!135 (or (not b!136) (not b!134))))

(assert (=> b!135 (or b!136 b!134)))

(assert (=> b!136 (= e!81 (union (singleton (head!5 (tail!9 (tail!9 list!1)))) (listContent!0 (tail!9 (tail!9 (tail!9 list!1))))))))

(assert (=> b!116 d!21))

(push 1)

(assert (and (and (and (not b!129) (not b!133)) (not b!136)) (not d!21)))

(check-sat)
