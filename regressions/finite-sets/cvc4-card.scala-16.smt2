; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving listFromSet0 - postcondition @ 74:14
(declare-fun start!71 () Bool)

(assert start!71)

(declare-fun b!312 () Bool)

(declare-datatypes () ( (IntList!9 (Cons!10 (head!11 (_ BitVec 32)) (tail!15 IntList!9)) (Nil!10)) ))

(declare-fun acc!0 () IntList!9)

(declare-fun lt!102 () (_ BitVec 32))

(declare-fun s!2 () (Set (_ BitVec 32)))

(declare-fun e!170 () IntList!9)

(declare-fun listFromSet0!0 ((Set (_ BitVec 32)) IntList!9) IntList!9)

(assert (=> b!312 (= e!170 (listFromSet0!0 (setminus s!2 (singleton lt!102)) (Cons!10 lt!102 acc!0)))))

(declare-fun pickOne!0 ((Set (_ BitVec 32))) (_ BitVec 32))

(assert (=> b!312 (= lt!102 (pickOne!0 s!2))))

(declare-fun lt!103 () IntList!9)

(declare-fun listContent!0 (IntList!9) (Set (_ BitVec 32)))

(declare-fun empty!8 () (Set (_ BitVec 32)))

(declare-fun size!0 (IntList!9) Int)

(assert (=> start!71 (and (= (intersection (listContent!0 acc!0) s!2) empty!8) (or (not (= (listContent!0 lt!103) (union (listContent!0 acc!0) s!2))) (not (= (size!0 lt!103) (+ (size!0 acc!0) (card s!2))))))))

(assert (=> start!71 (= lt!103 e!170)))

(declare-fun b!311 () Bool)

(assert (=> start!71 (= b!311 (= s!2 empty!8))))

(assert (=> start!71 (or (not b!311) (not b!312))))

(assert (=> start!71 (or b!311 b!312)))

(assert (=> b!311 (= e!170 acc!0)))

(push 1)

(assert (and (not start!71) (not b!312)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!321 () Bool)

(declare-fun e!176 () Int)

(declare-fun error_value!31 () Int)

(assert (=> b!321 (= e!176 error_value!31)))

(declare-fun b!322 () Bool)

(declare-fun e!175 () Int)

(assert (=> b!322 (= e!175 e!176)))

(declare-fun b!324 () Bool)

(assert (=> b!322 (= b!324 (is-Cons!10 acc!0))))

(assert (=> b!322 (or (not b!324) (not b!321))))

(assert (=> b!322 (or b!324 b!321)))

(declare-fun d!57 () Bool)

(assert (=> d!57 (= (size!0 acc!0) e!175)))

(declare-fun b!323 () Bool)

(assert (=> d!57 (= b!323 (is-Nil!10 acc!0))))

(assert (=> d!57 (or (not b!323) (not b!322))))

(assert (=> d!57 (or b!323 b!322)))

(declare-fun lt!106 () Int)

(assert (=> d!57 (>= lt!106 0)))

(assert (=> d!57 (= lt!106 (size!0 acc!0))))

(assert (=> b!323 (= e!175 0)))

(assert (=> b!324 (= e!176 (+ 1 (size!0 (tail!15 acc!0))))))

(assert (=> start!71 d!57))

(declare-fun d!59 () Bool)

(assert (=> d!59 (= empty!8 (as emptyset (Set (_ BitVec 32))))))

(assert (=> start!71 d!59))

(declare-fun b!325 () Bool)

(declare-fun e!178 () Int)

(declare-fun error_value!32 () Int)

(assert (=> b!325 (= e!178 error_value!32)))

(declare-fun b!326 () Bool)

(declare-fun e!177 () Int)

(assert (=> b!326 (= e!177 e!178)))

(declare-fun b!328 () Bool)

(assert (=> b!326 (= b!328 (is-Cons!10 lt!103))))

(assert (=> b!326 (or (not b!328) (not b!325))))

(assert (=> b!326 (or b!328 b!325)))

(declare-fun d!61 () Bool)

(assert (=> d!61 (= (size!0 lt!103) e!177)))

(declare-fun b!327 () Bool)

(assert (=> d!61 (= b!327 (is-Nil!10 lt!103))))

(assert (=> d!61 (or (not b!327) (not b!326))))

(assert (=> d!61 (or b!327 b!326)))

(declare-fun lt!107 () Int)

(assert (=> d!61 (>= lt!107 0)))

(assert (=> d!61 (= lt!107 (size!0 lt!103))))

(assert (=> b!327 (= e!177 0)))

(assert (=> b!328 (= e!178 (+ 1 (size!0 (tail!15 lt!103))))))

(assert (=> start!71 d!61))

(declare-fun b!337 () Bool)

(declare-fun e!183 () (Set (_ BitVec 32)))

(assert (=> b!337 (= e!183 (union (singleton (head!11 acc!0)) (listContent!0 (tail!15 acc!0))))))

(declare-fun b!338 () Bool)

(declare-fun e!184 () (Set (_ BitVec 32)))

(assert (=> b!338 (= e!184 empty!8)))

(declare-fun d!63 () Bool)

(assert (=> d!63 (= (listContent!0 acc!0) e!184)))

(assert (=> d!63 (= b!338 (is-Nil!10 acc!0))))

(declare-fun b!339 () Bool)

(assert (=> d!63 (or (not b!338) (not b!339))))

(assert (=> d!63 (or b!338 b!339)))

(declare-fun lt!110 () (Set (_ BitVec 32)))

(assert (=> d!63 (<= (card lt!110) (size!0 acc!0))))

(assert (=> d!63 (= lt!110 (listContent!0 acc!0))))

(assert (=> b!339 (= e!184 e!183)))

(assert (=> b!339 (= b!337 (is-Cons!10 acc!0))))

(declare-fun b!340 () Bool)

(assert (=> b!339 (or (not b!337) (not b!340))))

(assert (=> b!339 (or b!337 b!340)))

(declare-fun error_value!33 () (Set (_ BitVec 32)))

(assert (=> b!340 (= e!183 error_value!33)))

(assert (=> start!71 d!63))

(declare-fun b!341 () Bool)

(declare-fun e!185 () (Set (_ BitVec 32)))

(assert (=> b!341 (= e!185 (union (singleton (head!11 lt!103)) (listContent!0 (tail!15 lt!103))))))

(declare-fun b!342 () Bool)

(declare-fun e!186 () (Set (_ BitVec 32)))

(assert (=> b!342 (= e!186 empty!8)))

(declare-fun d!65 () Bool)

(assert (=> d!65 (= (listContent!0 lt!103) e!186)))

(assert (=> d!65 (= b!342 (is-Nil!10 lt!103))))

(declare-fun b!343 () Bool)

(assert (=> d!65 (or (not b!342) (not b!343))))

(assert (=> d!65 (or b!342 b!343)))

(declare-fun lt!111 () (Set (_ BitVec 32)))

(assert (=> d!65 (<= (card lt!111) (size!0 lt!103))))

(assert (=> d!65 (= lt!111 (listContent!0 lt!103))))

(assert (=> b!343 (= e!186 e!185)))

(assert (=> b!343 (= b!341 (is-Cons!10 lt!103))))

(declare-fun b!344 () Bool)

(assert (=> b!343 (or (not b!341) (not b!344))))

(assert (=> b!343 (or b!341 b!344)))

(declare-fun error_value!34 () (Set (_ BitVec 32)))

(assert (=> b!344 (= e!185 error_value!34)))

(assert (=> start!71 d!65))

(declare-fun b!349 () Bool)

(declare-fun e!189 () IntList!9)

(declare-fun lt!117 () (_ BitVec 32))

(assert (=> b!349 (= e!189 (listFromSet0!0 (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117)) (Cons!10 lt!117 (Cons!10 lt!102 acc!0))))))

(assert (=> b!349 (= lt!117 (pickOne!0 (setminus s!2 (singleton lt!102))))))

(declare-fun d!67 () Bool)

(assert (=> (and d!67 (= (intersection (listContent!0 (Cons!10 lt!102 acc!0)) (setminus s!2 (singleton lt!102))) empty!8)) (= (listFromSet0!0 (setminus s!2 (singleton lt!102)) (Cons!10 lt!102 acc!0)) e!189)))

(declare-fun b!350 () Bool)

(assert (=> d!67 (= b!350 (= (setminus s!2 (singleton lt!102)) empty!8))))

(assert (=> d!67 (or (not b!350) (not b!349))))

(assert (=> d!67 (or b!350 b!349)))

(declare-fun lt!116 () IntList!9)

(assert (=> (and d!67 (= (intersection (listContent!0 (Cons!10 lt!102 acc!0)) (setminus s!2 (singleton lt!102))) empty!8)) (and (= (listContent!0 lt!116) (union (listContent!0 (Cons!10 lt!102 acc!0)) (setminus s!2 (singleton lt!102)))) (= (size!0 lt!116) (+ (size!0 (Cons!10 lt!102 acc!0)) (card (setminus s!2 (singleton lt!102))))))))

(assert (=> d!67 (= lt!116 (listFromSet0!0 (setminus s!2 (singleton lt!102)) (Cons!10 lt!102 acc!0)))))

(assert (=> b!350 (= e!189 (Cons!10 lt!102 acc!0))))

(assert (=> b!312 d!67))

(declare-fun d!69 () Bool)

(declare-fun x$3!10 () (_ BitVec 32))

(assert (=> d!69 (= (pickOne!0 s!2) x$3!10)))

(assert (=> d!69 (member x$3!10 s!2)))

(assert (=> b!312 d!69))

(push 1)

(assert (and (and (and (and (and (and (and (and (and (not b!338) (not d!63)) (not d!67)) (not b!337)) (not b!324)) (not b!328)) (not d!65)) (not b!341)) (not b!349)) (not b!342)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!351 () Bool)

(declare-fun e!190 () (Set (_ BitVec 32)))

(assert (=> b!351 (= e!190 (union (singleton (head!11 (tail!15 acc!0))) (listContent!0 (tail!15 (tail!15 acc!0)))))))

(declare-fun b!352 () Bool)

(declare-fun e!191 () (Set (_ BitVec 32)))

(assert (=> b!352 (= e!191 empty!8)))

(declare-fun d!71 () Bool)

(assert (=> d!71 (= (listContent!0 (tail!15 acc!0)) e!191)))

(assert (=> d!71 (= b!352 (is-Nil!10 (tail!15 acc!0)))))

(declare-fun b!353 () Bool)

(assert (=> d!71 (or (not b!352) (not b!353))))

(assert (=> d!71 (or b!352 b!353)))

(declare-fun lt!118 () (Set (_ BitVec 32)))

(assert (=> d!71 (<= (card lt!118) (size!0 (tail!15 acc!0)))))

(assert (=> d!71 (= lt!118 (listContent!0 (tail!15 acc!0)))))

(assert (=> b!353 (= e!191 e!190)))

(assert (=> b!353 (= b!351 (is-Cons!10 (tail!15 acc!0)))))

(declare-fun b!354 () Bool)

(assert (=> b!353 (or (not b!351) (not b!354))))

(assert (=> b!353 (or b!351 b!354)))

(declare-fun error_value!35 () (Set (_ BitVec 32)))

(assert (=> b!354 (= e!190 error_value!35)))

(assert (=> b!337 d!71))

(assert (=> b!342 d!59))

(declare-fun b!355 () Bool)

(declare-fun e!192 () (Set (_ BitVec 32)))

(assert (=> b!355 (= e!192 (union (singleton (head!11 (tail!15 lt!103))) (listContent!0 (tail!15 (tail!15 lt!103)))))))

(declare-fun b!356 () Bool)

(declare-fun e!193 () (Set (_ BitVec 32)))

(assert (=> b!356 (= e!193 empty!8)))

(declare-fun d!73 () Bool)

(assert (=> d!73 (= (listContent!0 (tail!15 lt!103)) e!193)))

(assert (=> d!73 (= b!356 (is-Nil!10 (tail!15 lt!103)))))

(declare-fun b!357 () Bool)

(assert (=> d!73 (or (not b!356) (not b!357))))

(assert (=> d!73 (or b!356 b!357)))

(declare-fun lt!119 () (Set (_ BitVec 32)))

(assert (=> d!73 (<= (card lt!119) (size!0 (tail!15 lt!103)))))

(assert (=> d!73 (= lt!119 (listContent!0 (tail!15 lt!103)))))

(assert (=> b!357 (= e!193 e!192)))

(assert (=> b!357 (= b!355 (is-Cons!10 (tail!15 lt!103)))))

(declare-fun b!358 () Bool)

(assert (=> b!357 (or (not b!355) (not b!358))))

(assert (=> b!357 (or b!355 b!358)))

(declare-fun error_value!36 () (Set (_ BitVec 32)))

(assert (=> b!358 (= e!192 error_value!36)))

(assert (=> b!341 d!73))

(declare-fun b!359 () Bool)

(declare-fun e!195 () Int)

(declare-fun error_value!37 () Int)

(assert (=> b!359 (= e!195 error_value!37)))

(declare-fun b!360 () Bool)

(declare-fun e!194 () Int)

(assert (=> b!360 (= e!194 e!195)))

(declare-fun b!362 () Bool)

(assert (=> b!360 (= b!362 (is-Cons!10 (tail!15 lt!103)))))

(assert (=> b!360 (or (not b!362) (not b!359))))

(assert (=> b!360 (or b!362 b!359)))

(declare-fun d!75 () Bool)

(assert (=> d!75 (= (size!0 (tail!15 lt!103)) e!194)))

(declare-fun b!361 () Bool)

(assert (=> d!75 (= b!361 (is-Nil!10 (tail!15 lt!103)))))

(assert (=> d!75 (or (not b!361) (not b!360))))

(assert (=> d!75 (or b!361 b!360)))

(declare-fun lt!120 () Int)

(assert (=> d!75 (>= lt!120 0)))

(assert (=> d!75 (= lt!120 (size!0 (tail!15 lt!103)))))

(assert (=> b!361 (= e!194 0)))

(assert (=> b!362 (= e!195 (+ 1 (size!0 (tail!15 (tail!15 lt!103)))))))

(assert (=> b!328 d!75))

(assert (=> d!63 d!57))

(assert (=> b!338 d!59))

(declare-fun b!363 () Bool)

(declare-fun e!197 () Int)

(declare-fun error_value!38 () Int)

(assert (=> b!363 (= e!197 error_value!38)))

(declare-fun b!364 () Bool)

(declare-fun e!196 () Int)

(assert (=> b!364 (= e!196 e!197)))

(declare-fun b!366 () Bool)

(assert (=> b!364 (= b!366 (is-Cons!10 (tail!15 acc!0)))))

(assert (=> b!364 (or (not b!366) (not b!363))))

(assert (=> b!364 (or b!366 b!363)))

(declare-fun d!77 () Bool)

(assert (=> d!77 (= (size!0 (tail!15 acc!0)) e!196)))

(declare-fun b!365 () Bool)

(assert (=> d!77 (= b!365 (is-Nil!10 (tail!15 acc!0)))))

(assert (=> d!77 (or (not b!365) (not b!364))))

(assert (=> d!77 (or b!365 b!364)))

(declare-fun lt!121 () Int)

(assert (=> d!77 (>= lt!121 0)))

(assert (=> d!77 (= lt!121 (size!0 (tail!15 acc!0)))))

(assert (=> b!365 (= e!196 0)))

(assert (=> b!366 (= e!197 (+ 1 (size!0 (tail!15 (tail!15 acc!0)))))))

(assert (=> b!324 d!77))

(declare-fun b!367 () Bool)

(declare-fun e!198 () (Set (_ BitVec 32)))

(assert (=> b!367 (= e!198 (union (singleton lt!102) (listContent!0 acc!0)))))

(declare-fun b!368 () Bool)

(declare-fun e!199 () (Set (_ BitVec 32)))

(assert (=> b!368 (= e!199 empty!8)))

(declare-fun d!79 () Bool)

(assert (=> d!79 (= (listContent!0 (Cons!10 lt!102 acc!0)) e!199)))

(assert (=> d!79 (= b!368 (is-Nil!10 (Cons!10 lt!102 acc!0)))))

(declare-fun b!369 () Bool)

(assert (=> d!79 (or (not b!368) (not b!369))))

(assert (=> d!79 (or b!368 b!369)))

(declare-fun lt!122 () (Set (_ BitVec 32)))

(assert (=> d!79 (<= (card lt!122) (size!0 (Cons!10 lt!102 acc!0)))))

(assert (=> d!79 (= lt!122 (listContent!0 (Cons!10 lt!102 acc!0)))))

(assert (=> b!369 (= e!199 e!198)))

(assert (=> b!369 (= b!367 (is-Cons!10 (Cons!10 lt!102 acc!0)))))

(declare-fun b!370 () Bool)

(assert (=> b!369 (or (not b!367) (not b!370))))

(assert (=> b!369 (or b!367 b!370)))

(declare-fun error_value!39 () (Set (_ BitVec 32)))

(assert (=> b!370 (= e!198 error_value!39)))

(assert (=> d!67 d!79))

(declare-fun b!371 () Bool)

(declare-fun e!201 () Int)

(declare-fun error_value!40 () Int)

(assert (=> b!371 (= e!201 error_value!40)))

(declare-fun b!372 () Bool)

(declare-fun e!200 () Int)

(assert (=> b!372 (= e!200 e!201)))

(declare-fun b!374 () Bool)

(assert (=> b!372 (= b!374 (is-Cons!10 (Cons!10 lt!102 acc!0)))))

(assert (=> b!372 (or (not b!374) (not b!371))))

(assert (=> b!372 (or b!374 b!371)))

(declare-fun d!81 () Bool)

(assert (=> d!81 (= (size!0 (Cons!10 lt!102 acc!0)) e!200)))

(declare-fun b!373 () Bool)

(assert (=> d!81 (= b!373 (is-Nil!10 (Cons!10 lt!102 acc!0)))))

(assert (=> d!81 (or (not b!373) (not b!372))))

(assert (=> d!81 (or b!373 b!372)))

(declare-fun lt!123 () Int)

(assert (=> d!81 (>= lt!123 0)))

(assert (=> d!81 (= lt!123 (size!0 (Cons!10 lt!102 acc!0)))))

(assert (=> b!373 (= e!200 0)))

(assert (=> b!374 (= e!201 (+ 1 (size!0 acc!0)))))

(assert (=> d!67 d!81))

(assert (=> d!67 d!59))

(declare-fun b!375 () Bool)

(declare-fun e!202 () (Set (_ BitVec 32)))

(assert (=> b!375 (= e!202 (union (singleton (head!11 lt!116)) (listContent!0 (tail!15 lt!116))))))

(declare-fun b!376 () Bool)

(declare-fun e!203 () (Set (_ BitVec 32)))

(assert (=> b!376 (= e!203 empty!8)))

(declare-fun d!83 () Bool)

(assert (=> d!83 (= (listContent!0 lt!116) e!203)))

(assert (=> d!83 (= b!376 (is-Nil!10 lt!116))))

(declare-fun b!377 () Bool)

(assert (=> d!83 (or (not b!376) (not b!377))))

(assert (=> d!83 (or b!376 b!377)))

(declare-fun lt!124 () (Set (_ BitVec 32)))

(assert (=> d!83 (<= (card lt!124) (size!0 lt!116))))

(assert (=> d!83 (= lt!124 (listContent!0 lt!116))))

(assert (=> b!377 (= e!203 e!202)))

(assert (=> b!377 (= b!375 (is-Cons!10 lt!116))))

(declare-fun b!378 () Bool)

(assert (=> b!377 (or (not b!375) (not b!378))))

(assert (=> b!377 (or b!375 b!378)))

(declare-fun error_value!41 () (Set (_ BitVec 32)))

(assert (=> b!378 (= e!202 error_value!41)))

(assert (=> d!67 d!83))

(declare-fun b!379 () Bool)

(declare-fun e!205 () Int)

(declare-fun error_value!42 () Int)

(assert (=> b!379 (= e!205 error_value!42)))

(declare-fun b!380 () Bool)

(declare-fun e!204 () Int)

(assert (=> b!380 (= e!204 e!205)))

(declare-fun b!382 () Bool)

(assert (=> b!380 (= b!382 (is-Cons!10 lt!116))))

(assert (=> b!380 (or (not b!382) (not b!379))))

(assert (=> b!380 (or b!382 b!379)))

(declare-fun d!85 () Bool)

(assert (=> d!85 (= (size!0 lt!116) e!204)))

(declare-fun b!381 () Bool)

(assert (=> d!85 (= b!381 (is-Nil!10 lt!116))))

(assert (=> d!85 (or (not b!381) (not b!380))))

(assert (=> d!85 (or b!381 b!380)))

(declare-fun lt!125 () Int)

(assert (=> d!85 (>= lt!125 0)))

(assert (=> d!85 (= lt!125 (size!0 lt!116))))

(assert (=> b!381 (= e!204 0)))

(assert (=> b!382 (= e!205 (+ 1 (size!0 (tail!15 lt!116))))))

(assert (=> d!67 d!85))

(assert (=> d!65 d!61))

(declare-fun e!206 () IntList!9)

(declare-fun lt!127 () (_ BitVec 32))

(declare-fun b!383 () Bool)

(assert (=> b!383 (= e!206 (listFromSet0!0 (setminus (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117)) (singleton lt!127)) (Cons!10 lt!127 (Cons!10 lt!117 (Cons!10 lt!102 acc!0)))))))

(assert (=> b!383 (= lt!127 (pickOne!0 (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117))))))

(declare-fun d!87 () Bool)

(assert (=> (and d!87 (= (intersection (listContent!0 (Cons!10 lt!117 (Cons!10 lt!102 acc!0))) (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117))) empty!8)) (= (listFromSet0!0 (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117)) (Cons!10 lt!117 (Cons!10 lt!102 acc!0))) e!206)))

(declare-fun b!384 () Bool)

(assert (=> d!87 (= b!384 (= (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117)) empty!8))))

(assert (=> d!87 (or (not b!384) (not b!383))))

(assert (=> d!87 (or b!384 b!383)))

(declare-fun lt!126 () IntList!9)

(assert (=> (and d!87 (= (intersection (listContent!0 (Cons!10 lt!117 (Cons!10 lt!102 acc!0))) (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117))) empty!8)) (and (= (listContent!0 lt!126) (union (listContent!0 (Cons!10 lt!117 (Cons!10 lt!102 acc!0))) (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117)))) (= (size!0 lt!126) (+ (size!0 (Cons!10 lt!117 (Cons!10 lt!102 acc!0))) (card (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117))))))))

(assert (=> d!87 (= lt!126 (listFromSet0!0 (setminus (setminus s!2 (singleton lt!102)) (singleton lt!117)) (Cons!10 lt!117 (Cons!10 lt!102 acc!0))))))

(assert (=> b!384 (= e!206 (Cons!10 lt!117 (Cons!10 lt!102 acc!0)))))

(assert (=> b!349 d!87))

(declare-fun d!89 () Bool)

(declare-fun x$3!11 () (_ BitVec 32))

(assert (=> d!89 (= (pickOne!0 (setminus s!2 (singleton lt!102))) x$3!11)))

(assert (=> d!89 (member x$3!11 (setminus s!2 (singleton lt!102)))))

(assert (=> b!349 d!89))

(push 1)

(assert (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (and (not b!352) (not d!71)) (not b!356)) (not b!383)) (not b!367)) (not b!374)) (not b!362)) (not b!355)) (not d!87)) (not d!83)) (not b!368)) (not b!351)) (not b!366)) (not b!376)) (not b!375)) (not d!73)) (not d!79)) (not b!382)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

