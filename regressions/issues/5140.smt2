(set-option :model_validate true)

(set-info :status sat)
; Use these definitions and problem is sat
;(define-const a String "")
;(define-const b String "z")
(declare-const a String)
(declare-const b String)
;original b := (str.replace_re_all "z" (str.to_re "") "")
(assert (str.in_re a (re.* (str.to_re "z"))))
(assert (str.in_re a (re.* (re.range "a" "b"))))
(assert (not (str.in_re (str.++ a "za") (re.* (re.union (str.to_re "a") (re.++ (re.union (str.to_re "z") (str.to_re "b")) (str.to_re b) ))))))
(check-sat)
(reset)

(set-info :status sat)
(declare-const a String)
(check-sat)
(assert (str.in_re a (re.++ (str.to_re "BBBA") re.allchar (ite (str.in_re a (re.++ (re.* re.allchar) (str.to_re "A") (str.to_re "B"))) (str.to_re "B") (str.to_re "A")) (str.to_re "AA"))))
(check-sat)
(get-model)
(reset)

(set-info :status sat)
(declare-fun a () Int)
(assert (= (str.replace_all "-1" "" "") (str.from_int a)))
(check-sat)
(reset)


(simplify (str.replace_all "B" "A" ""))

; TODO str.replace_all is not simplified.
(set-info :status sat)
(declare-fun s () String)
(assert
 (not
  (str.in_re (str.++ s "BA")
   (re.*
    (re.union (str.to_re "AB")
     (re.++ (re.union (str.to_re "A") (str.to_re "B"))
      (re.union (str.to_re "B") (str.to_re (str.replace_all "B" "A" "")))))))))
(check-sat (= s ""))
(set-info :status unknown)
(reset)


(set-option :rewriter.cache_all true)
(set-option :model_validate true)
(declare-fun a () String)
(declare-fun b () String)
(assert (str.in_re (str.++ a "z" b) (re.++ (re.* (re.+ (re.union
  (str.to_re "z")))) (re.++ (ite (str.in_re b (re.++ (re.* (re.union
  (re.union (str.to_re "aaa") (re.* (str.to_re ""))))) (re.++
  (str.to_re "b")))) (str.to_re "z") (re.+ (str.to_re "b"))) (re.* (str.to_re "a"))))))
(check-sat)
(get-model)
(set-option :rewriter.cache_all false)
(reset)


(declare-fun a () String)
(assert
 (str.in_re a
  (re.+
   (re.++ (str.to_re "AA")
    (ite (str.in_re a (re.++ (str.to_re a) (re.union (str.to_re "A") (str.to_re "B"))))
     (re.union (str.to_re "A") (str.to_re ""))
     (re.union (str.to_re "A") (str.to_re "B")))))))
(check-sat)
(get-model)
(reset)

(set-info :status sat)
(declare-fun s () String)
(assert
 (str.in_re s
  (re.++
   (re.union
    (re.inter (re.opt (str.to_re "a")) (str.to_re ""))
    (str.to_re "b"))
   (re.diff (str.to_re "b") (str.to_re ""))
   (str.to_re "AA")
   (ite
    (str.in_re s
     (re.++ (str.to_re (str.replace s "" ""))
      (re.diff (re.opt (str.to_re "b")) (str.to_re ""))))
    (re.union (str.to_re "a") (str.to_re ""))
    (re.++ (str.to_re "aa")
     (re.* (re.union (str.to_re (str.++ "b" s)) (str.to_re s))))))))
(check-sat)

(set-info :status sat)
(declare-fun a () String)
(declare-fun b () String)
(assert (str.in_re (str.++ a "z" b) (re.++ (re.* (re.union (str.to_re "z") (str.to_re "a"))) (str.to_re "b"))))
(assert (str.in_re (str.++ a "z" b) (re.++ (re.* (re.union (str.to_re
   "z") (re.++ (re.union (str.to_re "b") (str.to_re "a")) (re.union
   (str.to_re "z") (str.to_re "b"))))) (ite (str.in_re b (re.*
   (str.to_re "z"))) (re.* (re.union (str.to_re "z"))) (re.union
   (str.to_re "z") (re.++ (re.union (str.to_re "b") (str.to_re "a"))
   (re.union (str.to_re "z") (str.to_re "b"))))))))
(check-sat)
(get-model)


(set-option :rewriter.pull_cheap_ite true)
(set-option :smt.arith.bprop_on_pivoted_rows false)
(set-option :rewriter.flat false)
(set-info :status sat)
(declare-fun a () String)
(assert (str.contains (str.substr a (+ (str.indexof a "C" 0) 1) (- (str.len a) (+ (str.indexof a "C" 0) 1))) "C"))
(assert (= (ite (= (str.at a (- (str.len a) 1)) "A") 1 0) (+ (str.indexof a "C" 0) 1)))
(assert (not (str.contains (str.substr a (div 1 (ite (= (str.at a 0) "A") 1 0)) (- (+ (str.indexof a "C" 0) 1) (- (str.len a) 1 (ite (= (str.at a 0) "AA") 1 0) (ite (= (str.at a 0) "A") 1 0)))) "B")))
(assert (>= (str.indexof a "C" 0) (ite (= (str.at a 0) "B") 1 0)))
(check-sat)
(set-option :rewriter.pull_cheap_ite false)
(set-option :smt.arith.bprop_on_pivoted_rows true)
(set-option :rewriter.flat true)
(reset)

(set-info :status sat)
(declare-fun a () String)
(check-sat
 (not
  (str.in_re (str.++ "auzb" a)
   (re.++
    (re.*
     (re.union (re.opt (str.to_re "b"))
      (re.union
       (re.++ (str.to_re "b")
        (re.union (str.to_re "zb") (str.to_re "z") (str.to_re "a")))
       (str.to_re a))))
    (str.to_re "b")))))
(assert (<= (str.len a) 0))
(set-info :status sat)
(check-sat)
(reset)


(set-info :status sat)
(declare-fun s () String)
(declare-fun i () Int)
(assert (str.contains s "aaaaaaa"))
(assert (= (str.len s) i))
(assert (= (not (= (str.indexof s "aaaaaaa" (- (+ i i) 30)) (- 1))) (str.contains s "bbbbbbbbbbaaaaaaab") (> i 0)))
(check-sat)
(reset)

; ----

(exit)

(set-option :model_validate true)
(declare-fun a () String)
(declare-fun b () String)
(assert (str.in_re (str.++ a "z" b) (re.++ (re.* (re.union (str.to_re "z") (str.to_re "a"))) (str.to_re "b"))))
(assert (str.in_re (str.++ a "z" b) (re.++ (re.* (re.union (str.to_re
   "z") (re.++ (re.union (str.to_re "b") (str.to_re "a")) (re.union
   (str.to_re "z") (str.to_re "b"))))) (ite (str.in_re b (re.*
   (str.to_re "z"))) (re.* (re.union (str.to_re "z"))) (re.union
   (str.to_re "z") (re.++ (re.union (str.to_re "b") (str.to_re "a"))
   (re.union (str.to_re "z") (str.to_re "b"))))))))
(check-sat)
(get-model)
(exit)

(declare-fun s () String)
(assert
 (str.in_re s
  (re.++
   (re.union
    (re.inter (re.opt (str.to_re "a")) (str.to_re ""))
    (str.to_re "b"))
   (re.diff (str.to_re "b") (str.to_re ""))
   (str.to_re "AA")
   (ite
    (str.in_re s
     (re.++ (str.to_re (str.replace s "" ""))
      (re.diff (re.opt (str.to_re "b")) (str.to_re ""))))
    (re.union (str.to_re "a") (str.to_re ""))
    (re.++ (str.to_re "aa")
     (re.* (re.union (str.to_re (str.++ "b" s)) (str.to_re s))))))))
(check-sat)
(exit)

(set-option :rewriter.cache_all false)
(declare-fun a () String)
(assert (str.in_re a (re.* (str.to_re "a"))))
(assert (str.in_re a (re.* (str.to_re "b"))))
(assert
 (ite (str.in_re a (re.* (re.comp (str.to_re ""))))
  (= a "")
  (str.in_re (str.++ "aaab" a)
   (re.*
    (re.++ (re.comp (re.* (str.to_re "b")))
     (str.to_re (str.from_int (str.len a))))))))
(check-sat)
(reset)


(declare-fun a () String)
(assert (= (and (str.in_re a (re.range "u" "u")) (str.in_re "a" (re.* (re.range (str.replace_re "u" (str.to_re "u") "u") "u"))) (str.in_re a (re.range "u" "u"))) true))
(check-sat)
(reset)

(declare-fun a () String)
(assert (= a ""))
(assert (=> (str.in_re a (re.* (str.to_re "A"))) (str.in_re a (re.comp (re.+ (str.to_re "A")))) (not (str.in_re "u" (re.* (re.range a "A"))))))
(check-sat)
(reset)
(assert (= "" ""))
(assert (=> (str.in_re "" (re.* (str.to_re "A"))) (str.in_re "" (re.comp (re.+ (str.to_re "A")))) (not (str.in_re "u" (re.* (re.range "" "A"))))))
(check-sat)
(reset)

(declare-fun s () String)
(assert (let (($x25 (str.in_re s (re.++ ((_ re.loop 2) (str.to_re "{")) ((_ re.loop 2) re.none)))))))
(check-sat)
(reset)

(declare-fun a () String)
(assert (str.in_re a (re.* (str.to_re "z"))))
(assert (str.in_re a (re.* (re.range "a" "u"))))
(assert (not (str.in_re (str.++ a "za") (re.* (re.union (str.to_re "a") (re.++ (re.union (str.to_re "z") (str.to_re "b")) (re.union (str.to_re (str.replace_re_all "z" (str.to_re "") "")) (str.to_re "b")) (re.* (str.to_re "z"))))))))
(check-sat)
(reset)

(declare-fun a () String)
(assert (str.in_re "AA" (re.range a "A")))
(assert (not (str.in_re a (re.* (str.to_re "A")))))
(assert (str.in_re a (re.range "A" "B")))
(check-sat-using (then ctx-solver-simplify smt))
(get-model)
(reset)

(declare-fun a () String)
(assert
 (str.in_re
  (ite (str.in_re (ite (str.in_re a (re.* (re.union (str.to_re "a") (str.to_re "b")))) a "")
        (re.* (re.union (re.inter (re.range a "u") (str.to_re "b")) (str.to_re "a")))) a "")
  (str.to_re "b")))
(check-sat)
(get-model)
(reset)

(set-option :model_validate true)
(set-option :smt.arith.eager_eq_axioms false)
(declare-fun y () Int)
(declare-fun c () (Seq Int))
(declare-fun b () (Seq Int))
(assert (and (> y 0) (not (= (seq.nth b 1) (seq.nth c y)))))
(check-sat)
(exit)

;(set-option :rewriter.pull_cheap_ite true)
(declare-fun a () String)
;(define-const a String "b")
(assert
 (str.in_re
  (ite (str.in_re (ite (str.in_re a (re.* (re.union (str.to_re "a") (str.to_re "b")))) a "")
        (re.* (re.union (re.inter (re.range a "u") (str.to_re "b")) (str.to_re "a")))) a "")
  (str.to_re "b")))
(check-sat)
(get-model)
(exit)

(declare-fun a () String)
(assert
 (ite (= a "\u\u\u\u\u\u\u\u")
  (str.in_re a (re.* re.allchar))
  (str.in_re a
   (re.++
    (str.to_re
     (ite (str.in_re a (str.to_re "\u\u\u\u\u\u\u\u")) a "\u\u\u\u\u\u\u\u"))
    (re.* re.allchar)))))
(check-sat)
(get-model)
(exit)

(set-option :model_validate true)
(declare-fun v16 () Bool)
(declare-fun i5 () Int)
(declare-fun str7 () String)
(push)
(assert v16)
(assert (distinct "ed\u01a5\u01f1\u0241\xa8{r\u01ef\u02" str7 (str.from_int i5)))
(push)
(pop)
(check-sat)
(get-model)
(exit)

(declare-fun a () String)
(assert
 (str.in_re a
 (re.++
  (str.to_re
  (ite (str.in_re a (re.++ (str.to_re "\u\u\u\u\u") (re.* re.allchar))) a "\u\u\u\u\u"))
  (re.* re.allchar))))
(check-sat)

(exit)

(declare-fun a () String)
(declare-fun b () String)
(set-option :model_validate true)
(assert (str.in_re a
     (re.diff (re.union (re.* (str.to_re "b")) (str.to_re "z")) (re.++ (re.* (str.to_re "z")) (str.to_re b)))))
(assert (= 0 (str.len b)))
(check-sat)
(get-model)

(declare-fun a () String)
(declare-fun b () String)
(assert
 (str.in_re (str.++ a "z" b)
  (re.++ (re.union (re.* (str.to_re "z")) re.none)
   (re.++ (re.* (re.* (re.* (str.to_re "z"))))
    (re.union
     (re.inter (re.++ (re.* (str.to_re "z")) (str.to_re "a"))
      (str.to_re (str.replace "" (str.++ a "") (str.++ "" ""))))
     (str.to_re "a"))))))
(assert
 (xor (str.in_re b (re.* (re.union (str.to_re "a") re.none)))
  (str.in_re b (re.range "a" "u"))))
(check-sat)
(reset)

(declare-const a String)
(assert (str.in_re a (re.* (str.to_re (str.from_int (str.len a))))))
(check-sat)
(reset)
