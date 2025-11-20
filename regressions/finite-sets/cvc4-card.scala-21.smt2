; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving concatReverse0 - postcondition @ 99:14
(declare-fun start!103 () Bool)

(assert start!103)

(declare-fun b!501 () Bool)

(declare-datatypes () ( (IntList!12 (Cons!13 (head!14 (_ BitVec 32)) (tail!18 IntList!12)) (Nil!13)) ))

(declare-fun e!269 () IntList!12)

(declare-fun e!267 () IntList!12)

(assert (=> b!501 (= e!269 e!267)))

(declare-fun b!502 () Bool)

(declare-fun l1!1 () IntList!12)

(assert (=> b!501 (= b!502 (is-Cons!13 l1!1))))

(declare-fun b!506 () Bool)

(assert (=> b!501 (or (not b!502) (not b!506))))

(assert (=> b!501 (or b!502 b!506)))

(declare-fun acc!2 () IntList!12)

(declare-fun l2!1 () IntList!12)

(declare-fun concatReverse0!0 (IntList!12 IntList!12 IntList!12) IntList!12)

(assert (=> b!502 (= e!267 (concatReverse0!0 (tail!18 l1!1) l2!1 (Cons!13 (head!14 l1!1) acc!2)))))

(declare-fun b!503 () Bool)

(declare-fun e!266 () IntList!12)

(assert (=> b!503 (= e!269 e!266)))

(declare-fun b!508 () Bool)

(assert (=> b!503 (= b!508 (is-Nil!13 l2!1))))

(declare-fun b!507 () Bool)

(assert (=> b!503 (or (not b!508) (not b!507))))

(assert (=> b!503 (or b!508 b!507)))

(declare-fun b!504 () Bool)

(declare-fun e!268 () IntList!12)

(assert (=> b!504 (= e!268 (concatReverse0!0 Nil!13 (tail!18 l2!1) (Cons!13 (head!14 l2!1) acc!2)))))

(declare-fun b!505 () Bool)

(declare-fun error_value!54 () IntList!12)

(assert (=> b!505 (= e!268 error_value!54)))

(declare-fun error_value!55 () IntList!12)

(assert (=> b!506 (= e!267 error_value!55)))

(assert (=> b!507 (= e!266 e!268)))

(assert (=> b!507 (= b!504 (is-Cons!13 l2!1))))

(assert (=> b!507 (or (not b!504) (not b!505))))

(assert (=> b!507 (or b!504 b!505)))

(declare-fun lt!148 () IntList!12)

(declare-fun listContent!0 (IntList!12) (Set (_ BitVec 32)))

(assert (=> start!103 (not (= (listContent!0 lt!148) (union (union (listContent!0 l1!1) (listContent!0 l2!1)) (listContent!0 acc!2))))))

(assert (=> start!103 (= lt!148 e!269)))

(assert (=> start!103 (= b!503 (is-Nil!13 l1!1))))

(assert (=> start!103 (or (not b!503) (not b!501))))

(assert (=> start!103 (or b!503 b!501)))

(assert (=> b!508 (= e!266 acc!2)))

(push 1)

(assert (and (and (not b!502) (not b!504)) (not start!103)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!525 () Bool)

(declare-fun e!281 () IntList!12)

(declare-fun error_value!56 () IntList!12)

(assert (=> b!525 (= e!281 error_value!56)))

(declare-fun b!526 () Bool)

(declare-fun e!279 () IntList!12)

(declare-fun e!278 () IntList!12)

(assert (=> b!526 (= e!279 e!278)))

(declare-fun b!527 () Bool)

(assert (=> b!526 (= b!527 (is-Cons!13 l2!1))))

(declare-fun b!529 () Bool)

(assert (=> b!526 (or (not b!527) (not b!529))))

(assert (=> b!526 (or b!527 b!529)))

(assert (=> b!527 (= e!278 (concatReverse0!0 Nil!13 (tail!18 l2!1) (Cons!13 (head!14 l2!1) (Cons!13 (head!14 l1!1) acc!2))))))

(declare-fun b!528 () Bool)

(assert (=> b!528 (= e!281 (concatReverse0!0 (tail!18 (tail!18 l1!1)) l2!1 (Cons!13 (head!14 (tail!18 l1!1)) (Cons!13 (head!14 l1!1) acc!2))))))

(declare-fun error_value!57 () IntList!12)

(assert (=> b!529 (= e!278 error_value!57)))

(declare-fun b!530 () Bool)

(declare-fun e!280 () IntList!12)

(assert (=> b!530 (= e!280 e!281)))

(assert (=> b!530 (= b!528 (is-Cons!13 (tail!18 l1!1)))))

(assert (=> b!530 (or (not b!528) (not b!525))))

(assert (=> b!530 (or b!528 b!525)))

(declare-fun d!109 () Bool)

(assert (=> d!109 (= (concatReverse0!0 (tail!18 l1!1) l2!1 (Cons!13 (head!14 l1!1) acc!2)) e!280)))

(declare-fun b!531 () Bool)

(assert (=> d!109 (= b!531 (is-Nil!13 (tail!18 l1!1)))))

(assert (=> d!109 (or (not b!531) (not b!530))))

(assert (=> d!109 (or b!531 b!530)))

(declare-fun lt!151 () IntList!12)

(assert (=> d!109 (= (listContent!0 lt!151) (union (union (listContent!0 (tail!18 l1!1)) (listContent!0 l2!1)) (listContent!0 (Cons!13 (head!14 l1!1) acc!2))))))

(assert (=> d!109 (= lt!151 (concatReverse0!0 (tail!18 l1!1) l2!1 (Cons!13 (head!14 l1!1) acc!2)))))

(assert (=> b!531 (= e!280 e!279)))

(declare-fun b!532 () Bool)

(assert (=> b!531 (= b!532 (is-Nil!13 l2!1))))

(assert (=> b!531 (or (not b!532) (not b!526))))

(assert (=> b!531 (or b!532 b!526)))

(assert (=> b!532 (= e!279 (Cons!13 (head!14 l1!1) acc!2))))

(assert (=> b!502 d!109))

(declare-fun b!533 () Bool)

(declare-fun e!285 () IntList!12)

(declare-fun error_value!58 () IntList!12)

(assert (=> b!533 (= e!285 error_value!58)))

(declare-fun b!534 () Bool)

(declare-fun e!283 () IntList!12)

(declare-fun e!282 () IntList!12)

(assert (=> b!534 (= e!283 e!282)))

(declare-fun b!535 () Bool)

(assert (=> b!534 (= b!535 (is-Cons!13 (tail!18 l2!1)))))

(declare-fun b!537 () Bool)

(assert (=> b!534 (or (not b!535) (not b!537))))

(assert (=> b!534 (or b!535 b!537)))

(assert (=> b!535 (= e!282 (concatReverse0!0 Nil!13 (tail!18 (tail!18 l2!1)) (Cons!13 (head!14 (tail!18 l2!1)) (Cons!13 (head!14 l2!1) acc!2))))))

(declare-fun b!536 () Bool)

(assert (=> b!536 (= e!285 (concatReverse0!0 (tail!18 Nil!13) (tail!18 l2!1) (Cons!13 (head!14 Nil!13) (Cons!13 (head!14 l2!1) acc!2))))))

(declare-fun error_value!59 () IntList!12)

(assert (=> b!537 (= e!282 error_value!59)))

(declare-fun b!538 () Bool)

(declare-fun e!284 () IntList!12)

(assert (=> b!538 (= e!284 e!285)))

(assert (=> b!538 (= b!536 (is-Cons!13 Nil!13))))

(assert (=> b!538 (or (not b!536) (not b!533))))

(assert (=> b!538 (or b!536 b!533)))

(declare-fun d!111 () Bool)

(assert (=> d!111 (= (concatReverse0!0 Nil!13 (tail!18 l2!1) (Cons!13 (head!14 l2!1) acc!2)) e!284)))

(declare-fun b!539 () Bool)

(assert (=> d!111 (= b!539 (is-Nil!13 Nil!13))))

(assert (=> d!111 (or (not b!539) (not b!538))))

(assert (=> d!111 (or b!539 b!538)))

(declare-fun lt!152 () IntList!12)

(assert (=> d!111 (= (listContent!0 lt!152) (union (union (listContent!0 Nil!13) (listContent!0 (tail!18 l2!1))) (listContent!0 (Cons!13 (head!14 l2!1) acc!2))))))

(assert (=> d!111 (= lt!152 (concatReverse0!0 Nil!13 (tail!18 l2!1) (Cons!13 (head!14 l2!1) acc!2)))))

(assert (=> b!539 (= e!284 e!283)))

(declare-fun b!540 () Bool)

(assert (=> b!539 (= b!540 (is-Nil!13 (tail!18 l2!1)))))

(assert (=> b!539 (or (not b!540) (not b!534))))

(assert (=> b!539 (or b!540 b!534)))

(assert (=> b!540 (= e!283 (Cons!13 (head!14 l2!1) acc!2))))

(assert (=> b!504 d!111))

(declare-fun b!549 () Bool)

(declare-fun e!291 () (Set (_ BitVec 32)))

(declare-fun empty!11 () (Set (_ BitVec 32)))

(assert (=> b!549 (= e!291 empty!11)))

(declare-fun d!113 () Bool)

(assert (=> d!113 (= (listContent!0 lt!148) e!291)))

(assert (=> d!113 (= b!549 (is-Nil!13 lt!148))))

(declare-fun b!551 () Bool)

(assert (=> d!113 (or (not b!549) (not b!551))))

(assert (=> d!113 (or b!549 b!551)))

(declare-fun lt!155 () (Set (_ BitVec 32)))

(declare-fun size!0 (IntList!12) Int)

(assert (=> d!113 (<= (card lt!155) (size!0 lt!148))))

(assert (=> d!113 (= lt!155 (listContent!0 lt!148))))

(declare-fun b!550 () Bool)

(declare-fun e!290 () (Set (_ BitVec 32)))

(declare-fun error_value!60 () (Set (_ BitVec 32)))

(assert (=> b!550 (= e!290 error_value!60)))

(assert (=> b!551 (= e!291 e!290)))

(declare-fun b!552 () Bool)

(assert (=> b!551 (= b!552 (is-Cons!13 lt!148))))

(assert (=> b!551 (or (not b!552) (not b!550))))

(assert (=> b!551 (or b!552 b!550)))

(assert (=> b!552 (= e!290 (union (singleton (head!14 lt!148)) (listContent!0 (tail!18 lt!148))))))

(assert (=> start!103 d!113))

(declare-fun b!553 () Bool)

(declare-fun e!293 () (Set (_ BitVec 32)))

(assert (=> b!553 (= e!293 empty!11)))

(declare-fun d!115 () Bool)

(assert (=> d!115 (= (listContent!0 l1!1) e!293)))

(assert (=> d!115 (= b!553 (is-Nil!13 l1!1))))

(declare-fun b!555 () Bool)

(assert (=> d!115 (or (not b!553) (not b!555))))

(assert (=> d!115 (or b!553 b!555)))

(declare-fun lt!156 () (Set (_ BitVec 32)))

(assert (=> d!115 (<= (card lt!156) (size!0 l1!1))))

(assert (=> d!115 (= lt!156 (listContent!0 l1!1))))

(declare-fun b!554 () Bool)

(declare-fun e!292 () (Set (_ BitVec 32)))

(declare-fun error_value!61 () (Set (_ BitVec 32)))

(assert (=> b!554 (= e!292 error_value!61)))

(assert (=> b!555 (= e!293 e!292)))

(declare-fun b!556 () Bool)

(assert (=> b!555 (= b!556 (is-Cons!13 l1!1))))

(assert (=> b!555 (or (not b!556) (not b!554))))

(assert (=> b!555 (or b!556 b!554)))

(assert (=> b!556 (= e!292 (union (singleton (head!14 l1!1)) (listContent!0 (tail!18 l1!1))))))

(assert (=> start!103 d!115))

(declare-fun b!557 () Bool)

(declare-fun e!295 () (Set (_ BitVec 32)))

(assert (=> b!557 (= e!295 empty!11)))

(declare-fun d!117 () Bool)

(assert (=> d!117 (= (listContent!0 l2!1) e!295)))

(assert (=> d!117 (= b!557 (is-Nil!13 l2!1))))

(declare-fun b!559 () Bool)

(assert (=> d!117 (or (not b!557) (not b!559))))

(assert (=> d!117 (or b!557 b!559)))

(declare-fun lt!157 () (Set (_ BitVec 32)))

(assert (=> d!117 (<= (card lt!157) (size!0 l2!1))))

(assert (=> d!117 (= lt!157 (listContent!0 l2!1))))

(declare-fun b!558 () Bool)

(declare-fun e!294 () (Set (_ BitVec 32)))

(declare-fun error_value!62 () (Set (_ BitVec 32)))

(assert (=> b!558 (= e!294 error_value!62)))

(assert (=> b!559 (= e!295 e!294)))

(declare-fun b!560 () Bool)

(assert (=> b!559 (= b!560 (is-Cons!13 l2!1))))

(assert (=> b!559 (or (not b!560) (not b!558))))

(assert (=> b!559 (or b!560 b!558)))

(assert (=> b!560 (= e!294 (union (singleton (head!14 l2!1)) (listContent!0 (tail!18 l2!1))))))

(assert (=> start!103 d!117))

(declare-fun b!561 () Bool)

(declare-fun e!297 () (Set (_ BitVec 32)))

(assert (=> b!561 (= e!297 empty!11)))

(declare-fun d!119 () Bool)

(assert (=> d!119 (= (listContent!0 acc!2) e!297)))

(assert (=> d!119 (= b!561 (is-Nil!13 acc!2))))

(declare-fun b!563 () Bool)

(assert (=> d!119 (or (not b!561) (not b!563))))

(assert (=> d!119 (or b!561 b!563)))

(declare-fun lt!158 () (Set (_ BitVec 32)))

(assert (=> d!119 (<= (card lt!158) (size!0 acc!2))))

(assert (=> d!119 (= lt!158 (listContent!0 acc!2))))

(declare-fun b!562 () Bool)

(declare-fun e!296 () (Set (_ BitVec 32)))

(declare-fun error_value!63 () (Set (_ BitVec 32)))

(assert (=> b!562 (= e!296 error_value!63)))

(assert (=> b!563 (= e!297 e!296)))

(declare-fun b!564 () Bool)

(assert (=> b!563 (= b!564 (is-Cons!13 acc!2))))

(assert (=> b!563 (or (not b!564) (not b!562))))

(assert (=> b!563 (or b!564 b!562)))

(assert (=> b!564 (= e!296 (union (singleton (head!14 acc!2)) (listContent!0 (tail!18 acc!2))))))

(assert (=> start!103 d!119))

(push 1)

(assert (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (not b!527) (not d!113)) (not b!561)) (not b!535)) (not d!119)) (not b!556)) (not d!117)) (not d!111)) (not d!109)) (not b!560)) (not b!553)) (not b!557)) (not b!552)) (not b!528)) (not b!549)) (not d!115)) (not b!564)) (not b!536)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

