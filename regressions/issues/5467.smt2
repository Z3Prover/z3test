(set-option :model_validate true)

(declare-fun str6 () String)
(assert (str.in_re str6 (re.++ re.all (str.to_re "qk") (str.to_re "C"))))
(exit)

(declare-fun a () String)
(declare-fun b () String)
(assert (= b "A"))
(assert (not (str.in_re (str.++ a "BA" b) (re.++ (re.* (str.to_re "A")) (str.to_re "B") (str.to_re "A") (str.to_re "A")))))
(check-sat)
(get-model)
(exit)

(declare-fun a () Int)
(declare-fun b () String)
(assert (str.in_re (str.++ b "A") (re.* (str.to_re (str.substr b 1 a)))))
(check-sat)
(get-model)
(exit)


(declare-fun a () String)
(declare-fun b () Int)
(declare-fun c () Int)
(assert (str.in_re (str.++ a "A") (re.* (str.to_re (str.substr "B" b c)))))
(check-sat)
(exit)

(declare-fun a () String)
(assert (str.in_re a (re.++ (re.opt (str.to_re "A")) (str.to_re "A") (str.to_re "A") (str.to_re "A"))))
(check-sat)
(reset)
(exit)

(declare-fun z () (Seq Bool))
(assert (not (seq.nth (as seq.empty (Seq Bool)) 0)))
(assert (seq.nth (seq.extract z 1 (- (seq.len z) 1)) 0))
(check-sat)
(reset)

(set-option :rewriter.eq2ineq true)
(declare-fun z () Int)
(declare-fun b () (Seq Int))
(declare-fun y () Int)
(declare-fun a () (Seq Int))
(declare-fun x () Int)
(assert (and (= 1 z) (distinct (seq.nth b x) (seq.nth a z)) (= (seq.nth b y) (seq.nth b 1))))
(assert (> x 0))
(assert (> z 0))
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
(check-sat)
(reset)

(set-option :rewriter.pull_cheap_ite true)
(set-option :smt.arith.bprop_on_pivoted_rows false)

(declare-fun a () String)
(assert (str.contains (str.substr a (+ (str.indexof a "C" 0) 1) (- (str.len a) (+ (str.indexof a "C" 0) 1))) "C"))
(assert (= (ite (= (str.at a (- (str.len a) 1)) "A") 1 0) (+ (str.indexof a "C" 0) 1)))
(assert (not (str.contains (str.substr a (div 1 (ite (= (str.at a 0) "A") 1 0)) (- (+ (str.indexof a "C" 0) 1) (- (str.len a) 1 (ite (= (str.at a 0) "AA") 1 0) (ite (= (str.at a 0) "A") 1 0)))) "B")))
(assert (>= (str.indexof a "C" 0) (ite (= (str.at a 0) "B") 1 0)))
(check-sat)