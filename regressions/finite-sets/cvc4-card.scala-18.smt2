; Options: -q --produce-models --no-incremental --tear-down-incremental --rewrite-divk --print-success --lang smt
; Solving treeToList0 - postcondition @ 87:14
(declare-fun start!91 () Bool)

(assert start!91)

(declare-datatypes () ( (IntList!11 (Cons!12 (head!13 (_ BitVec 32)) (tail!17 IntList!11)) (Nil!12)) ))

(declare-fun lt!134 () IntList!11)

(declare-datatypes () ( (IntTree!9 (Leaf!9) (Node!9 (left!13 IntTree!9) (value!9 (_ BitVec 32)) (right!13 IntTree!9))) ))

(declare-fun tree!4 () IntTree!9)

(declare-fun acc!1 () IntList!11)

(declare-fun listContent!0 (IntList!11) (FiniteSet (_ BitVec 32)))

(declare-fun treeContent!0 (IntTree!9) (FiniteSet (_ BitVec 32)))

(assert (=> start!91 (not (= (set.size (listContent!0 lt!134)) (+ (set.size (treeContent!0 tree!4)) (set.size (listContent!0 acc!1)))))))

(declare-fun e!227 () IntList!11)

(assert (=> start!91 (= lt!134 e!227)))

(declare-fun b!420 () Bool)

(assert (=> start!91 (= b!420 (is-Leaf!9 tree!4))))

(declare-fun b!417 () Bool)

(assert (=> start!91 (or (not b!420) (not b!417))))

(assert (=> start!91 (or b!420 b!417)))

(declare-fun e!225 () IntList!11)

(assert (=> b!417 (= e!227 e!225)))

(declare-fun b!424 () Bool)

(assert (=> b!417 (= b!424 (is-Node!9 tree!4))))

(declare-fun b!418 () Bool)

(assert (=> b!417 (or (not b!424) (not b!418))))

(assert (=> b!417 (or b!424 b!418)))

(declare-fun error_value!45 () IntList!11)

(assert (=> b!418 (= e!225 error_value!45)))

(declare-fun b!419 () Bool)

(declare-fun e!226 () IntList!11)

(declare-fun treeToList0!0 (IntTree!9 IntList!11) IntList!11)

(assert (=> b!419 (= e!226 (treeToList0!0 (right!13 tree!4) (Cons!12 (value!9 tree!4) acc!1)))))

(assert (=> b!420 (= e!227 acc!1)))

(declare-fun b!421 () Bool)

(declare-fun e!224 () IntList!11)

(declare-fun error_value!46 () IntList!11)

(assert (=> b!421 (= e!224 error_value!46)))

(declare-fun b!422 () Bool)

(assert (=> b!422 (= e!224 (treeToList0!0 (Node!9 (left!13 (left!13 tree!4)) (value!9 (left!13 tree!4)) (Node!9 (right!13 (left!13 tree!4)) (value!9 tree!4) (right!13 tree!4))) acc!1))))

(declare-fun b!423 () Bool)

(assert (=> b!423 (= e!226 e!224)))

(assert (=> b!423 (= b!422 (is-Node!9 (left!13 tree!4)))))

(assert (=> b!423 (or (not b!422) (not b!421))))

(assert (=> b!423 (or b!422 b!421)))

(assert (=> b!424 (= e!225 e!226)))

(assert (=> b!424 (= b!419 (is-Leaf!9 (left!13 tree!4)))))

(assert (=> b!424 (or (not b!419) (not b!423))))

(assert (=> b!424 (or b!419 b!423)))

(push 1)

(assert (and (and (not b!419) (not b!422)) (not start!91)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

(declare-fun b!441 () Bool)

(declare-fun e!237 () IntList!11)

(declare-fun error_value!47 () IntList!11)

(assert (=> b!441 (= e!237 error_value!47)))

(declare-fun b!442 () Bool)

(declare-fun e!238 () IntList!11)

(declare-fun e!239 () IntList!11)

(assert (=> b!442 (= e!238 e!239)))

(declare-fun b!445 () Bool)

(assert (=> b!442 (= b!445 (is-Leaf!9 (left!13 (right!13 tree!4))))))

(declare-fun b!443 () Bool)

(assert (=> b!442 (or (not b!445) (not b!443))))

(assert (=> b!442 (or b!445 b!443)))

(declare-fun d!99 () Bool)

(declare-fun e!236 () IntList!11)

(assert (=> d!99 (= (treeToList0!0 (right!13 tree!4) (Cons!12 (value!9 tree!4) acc!1)) e!236)))

(declare-fun b!444 () Bool)

(assert (=> d!99 (= b!444 (is-Leaf!9 (right!13 tree!4)))))

(declare-fun b!448 () Bool)

(assert (=> d!99 (or (not b!444) (not b!448))))

(assert (=> d!99 (or b!444 b!448)))

(declare-fun lt!137 () IntList!11)

(assert (=> d!99 (= (set.size (listContent!0 lt!137)) (+ (set.size (treeContent!0 (right!13 tree!4))) (set.size (listContent!0 (Cons!12 (value!9 tree!4) acc!1)))))))

(assert (=> d!99 (= lt!137 (treeToList0!0 (right!13 tree!4) (Cons!12 (value!9 tree!4) acc!1)))))

(assert (=> b!443 (= e!239 e!237)))

(declare-fun b!447 () Bool)

(assert (=> b!443 (= b!447 (is-Node!9 (left!13 (right!13 tree!4))))))

(assert (=> b!443 (or (not b!447) (not b!441))))

(assert (=> b!443 (or b!447 b!441)))

(assert (=> b!444 (= e!236 (Cons!12 (value!9 tree!4) acc!1))))

(assert (=> b!445 (= e!239 (treeToList0!0 (right!13 (right!13 tree!4)) (Cons!12 (value!9 (right!13 tree!4)) (Cons!12 (value!9 tree!4) acc!1))))))

(declare-fun b!446 () Bool)

(declare-fun error_value!48 () IntList!11)

(assert (=> b!446 (= e!238 error_value!48)))

(assert (=> b!447 (= e!237 (treeToList0!0 (Node!9 (left!13 (left!13 (right!13 tree!4))) (value!9 (left!13 (right!13 tree!4))) (Node!9 (right!13 (left!13 (right!13 tree!4))) (value!9 (right!13 tree!4)) (right!13 (right!13 tree!4)))) (Cons!12 (value!9 tree!4) acc!1)))))

(assert (=> b!448 (= e!236 e!238)))

(assert (=> b!448 (= b!442 (is-Node!9 (right!13 tree!4)))))

(assert (=> b!448 (or (not b!442) (not b!446))))

(assert (=> b!448 (or b!442 b!446)))

(assert (=> b!419 d!99))

(declare-fun b!449 () Bool)

(declare-fun e!241 () IntList!11)

(declare-fun error_value!49 () IntList!11)

(assert (=> b!449 (= e!241 error_value!49)))

(declare-fun b!450 () Bool)

(declare-fun e!242 () IntList!11)

(declare-fun e!243 () IntList!11)

(assert (=> b!450 (= e!242 e!243)))

(declare-fun b!453 () Bool)

(assert (=> b!450 (= b!453 (is-Leaf!9 (left!13 (left!13 tree!4))))))

(declare-fun b!451 () Bool)

(assert (=> b!450 (or (not b!453) (not b!451))))

(assert (=> b!450 (or b!453 b!451)))

(declare-fun d!101 () Bool)

(declare-fun e!240 () IntList!11)

(assert (=> d!101 (= (treeToList0!0 (Node!9 (left!13 (left!13 tree!4)) (value!9 (left!13 tree!4)) (Node!9 (right!13 (left!13 tree!4)) (value!9 tree!4) (right!13 tree!4))) acc!1) e!240)))

(declare-fun b!452 () Bool)

(assert (=> d!101 (= b!452 (is-Leaf!9 (Node!9 (left!13 (left!13 tree!4)) (value!9 (left!13 tree!4)) (Node!9 (right!13 (left!13 tree!4)) (value!9 tree!4) (right!13 tree!4)))))))

(declare-fun b!456 () Bool)

(assert (=> d!101 (or (not b!452) (not b!456))))

(assert (=> d!101 (or b!452 b!456)))

(declare-fun lt!138 () IntList!11)

(assert (=> d!101 (= (set.size (listContent!0 lt!138)) (+ (set.size (treeContent!0 (Node!9 (left!13 (left!13 tree!4)) (value!9 (left!13 tree!4)) (Node!9 (right!13 (left!13 tree!4)) (value!9 tree!4) (right!13 tree!4))))) (set.size (listContent!0 acc!1))))))

(assert (=> d!101 (= lt!138 (treeToList0!0 (Node!9 (left!13 (left!13 tree!4)) (value!9 (left!13 tree!4)) (Node!9 (right!13 (left!13 tree!4)) (value!9 tree!4) (right!13 tree!4))) acc!1))))

(assert (=> b!451 (= e!243 e!241)))

(declare-fun b!455 () Bool)

(assert (=> b!451 (= b!455 (is-Node!9 (left!13 (left!13 tree!4))))))

(assert (=> b!451 (or (not b!455) (not b!449))))

(assert (=> b!451 (or b!455 b!449)))

(assert (=> b!452 (= e!240 acc!1)))

(assert (=> b!453 (= e!243 (treeToList0!0 (Node!9 (right!13 (left!13 tree!4)) (value!9 tree!4) (right!13 tree!4)) (Cons!12 (value!9 (left!13 tree!4)) acc!1)))))

(declare-fun b!454 () Bool)

(declare-fun error_value!50 () IntList!11)

(assert (=> b!454 (= e!242 error_value!50)))

(assert (=> b!455 (= e!241 (treeToList0!0 (Node!9 (left!13 (left!13 (left!13 tree!4))) (value!9 (left!13 (left!13 tree!4))) (Node!9 (right!13 (left!13 (left!13 tree!4))) (value!9 (left!13 tree!4)) (Node!9 (right!13 (left!13 tree!4)) (value!9 tree!4) (right!13 tree!4)))) acc!1))))

(assert (=> b!456 (= e!240 e!242)))

(assert (=> b!456 (= b!450 (is-Node!9 (Node!9 (left!13 (left!13 tree!4)) (value!9 (left!13 tree!4)) (Node!9 (right!13 (left!13 tree!4)) (value!9 tree!4) (right!13 tree!4)))))))

(assert (=> b!456 (or (not b!450) (not b!454))))

(assert (=> b!456 (or b!450 b!454)))

(assert (=> b!422 d!101))

(declare-fun b!465 () Bool)

(declare-fun e!249 () (FiniteSet (_ BitVec 32)))

(assert (=> b!465 (= e!249 (set.union (set.singleton (head!13 lt!134)) (listContent!0 (tail!17 lt!134))))))

(declare-fun d!103 () Bool)

(declare-fun e!248 () (FiniteSet (_ BitVec 32)))

(assert (=> d!103 (= (listContent!0 lt!134) e!248)))

(declare-fun b!467 () Bool)

(assert (=> d!103 (= b!467 (is-Nil!12 lt!134))))

(declare-fun b!468 () Bool)

(assert (=> d!103 (or (not b!467) (not b!468))))

(assert (=> d!103 (or b!467 b!468)))

(declare-fun lt!141 () (FiniteSet (_ BitVec 32)))

(declare-fun size!0 (IntList!11) Int)

(assert (=> d!103 (<= (set.size lt!141) (size!0 lt!134))))

(assert (=> d!103 (= lt!141 (listContent!0 lt!134))))

(declare-fun b!466 () Bool)

(declare-fun error_value!51 () (FiniteSet (_ BitVec 32)))

(assert (=> b!466 (= e!249 error_value!51)))

(declare-fun empty!10 () (FiniteSet (_ BitVec 32)))

(assert (=> b!467 (= e!248 empty!10)))

(assert (=> b!468 (= e!248 e!249)))

(assert (=> b!468 (= b!465 (is-Cons!12 lt!134))))

(assert (=> b!468 (or (not b!465) (not b!466))))

(assert (=> b!468 (or b!465 b!466)))

(assert (=> start!91 d!103))

(declare-fun b!477 () Bool)

(declare-fun e!254 () (FiniteSet (_ BitVec 32)))

(declare-fun e!255 () (FiniteSet (_ BitVec 32)))

(assert (=> b!477 (= e!254 e!255)))

(declare-fun b!478 () Bool)

(assert (=> b!477 (= b!478 (is-Node!9 tree!4))))

(declare-fun b!480 () Bool)

(assert (=> b!477 (or (not b!478) (not b!480))))

(assert (=> b!477 (or b!478 b!480)))

(assert (=> b!478 (= e!255 (set.union (set.union (treeContent!0 (left!13 tree!4)) (set.singleton (value!9 tree!4))) (treeContent!0 (right!13 tree!4))))))

(declare-fun d!105 () Bool)

(assert (=> d!105 (= (treeContent!0 tree!4) e!254)))

(declare-fun b!479 () Bool)

(assert (=> d!105 (= b!479 (is-Leaf!9 tree!4))))

(assert (=> d!105 (or (not b!479) (not b!477))))

(assert (=> d!105 (or b!479 b!477)))

(declare-fun lt!144 () (FiniteSet (_ BitVec 32)))

(declare-fun size!1 (IntTree!9) Int)

(assert (=> d!105 (<= (set.size lt!144) (size!1 tree!4))))

(assert (=> d!105 (= lt!144 (treeContent!0 tree!4))))

(assert (=> b!479 (= e!254 empty!10)))

(declare-fun error_value!52 () (FiniteSet (_ BitVec 32)))

(assert (=> b!480 (= e!255 error_value!52)))

(assert (=> start!91 d!105))

(declare-fun b!481 () Bool)

(declare-fun e!257 () (FiniteSet (_ BitVec 32)))

(assert (=> b!481 (= e!257 (set.union (set.singleton (head!13 acc!1)) (listContent!0 (tail!17 acc!1))))))

(declare-fun d!107 () Bool)

(declare-fun e!256 () (FiniteSet (_ BitVec 32)))

(assert (=> d!107 (= (listContent!0 acc!1) e!256)))

(declare-fun b!483 () Bool)

(assert (=> d!107 (= b!483 (is-Nil!12 acc!1))))

(declare-fun b!484 () Bool)

(assert (=> d!107 (or (not b!483) (not b!484))))

(assert (=> d!107 (or b!483 b!484)))

(declare-fun lt!145 () (FiniteSet (_ BitVec 32)))

(assert (=> d!107 (<= (set.size lt!145) (size!0 acc!1))))

(assert (=> d!107 (= lt!145 (listContent!0 acc!1))))

(declare-fun b!482 () Bool)

(declare-fun error_value!53 () (FiniteSet (_ BitVec 32)))

(assert (=> b!482 (= e!257 error_value!53)))

(assert (=> b!483 (= e!256 empty!10)))

(assert (=> b!484 (= e!256 e!257)))

(assert (=> b!484 (= b!481 (is-Cons!12 acc!1))))

(assert (=> b!484 (or (not b!481) (not b!482))))

(assert (=> b!484 (or b!481 b!482)))

(assert (=> start!91 d!107))

(push 1)

(assert (and (and (and (and (and (and (and (and (and (and (and (and (and (and (not b!453) (not d!107)) (not b!483)) (not d!99)) (not d!101)) (not b!447)) (not b!481)) (not b!478)) (not b!445)) (not d!105)) (not b!479)) (not d!103)) (not b!455)) (not b!467)) (not b!465)))

(check-sat)

(pop 1)

(push 1)

(assert true)

(check-sat)

(pop 1)

