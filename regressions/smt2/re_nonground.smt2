; -------------------------------------------------
; tests involving regexes with nonground components
; -------------------------------------------------

(set-option :model_validate true)
(set-logic QF_SLIA)
(declare-const i7 Int)
(declare-const Str3 String)
(declare-const Str7 String)
(declare-const Str14 String)
(declare-const Str11 String)
(declare-fun a () String)
(declare-fun b () String)
(declare-fun c () String)

; repro for soundess bug #4651 (with concrete strings shortened compared to the report)
(push)
(set-info :status sat)
(assert (str.in_re Str14 (str.to_re (str.substr Str14 0 (abs i7)))))
(assert (str.in_re (str.++ Str3 "ppr" Str7 "") (re.++ (str.to_re (str.substr Str14 0 (abs i7))) (str.to_re "qb"))))
(check-sat)
(pop)

; repro for soundess bug #4651 (a variant using ite instead of abs in one case)
(push)
(set-info :status sat)
(assert (str.in_re Str14 (str.to_re (str.substr Str14 0 (abs i7)))))
(assert (str.in_re (str.++ Str3 "ppr" Str7 "")
                   (re.++ (ite (>= i7 0) (str.to_re (str.substr Str14 0 i7)) (str.to_re (str.substr Str14 0 (* (- 1) i7))))
		          (str.to_re "qb"))))
(check-sat)
(pop)

; repro for soundess bug #4651 (a variant without abs)
(push)
(set-info :status sat)
(assert (str.in_re Str14 (str.to_re (str.substr Str14 0 i7))))
(assert (str.in_re (str.++ Str3 "ppr" Str7 "") (re.++ (str.to_re (str.substr Str14 0 i7)) (str.to_re "qb"))))
(check-sat)
(pop)

; repro for another soundness bug reported in #4651
(push)
(set-info :status unsat)
(assert (str.in_re (str.++ "" "wyeuem" "" "mpzyyy" Str11) (re.opt (str.to_re Str11))))
(check-sat)
(pop)

; repro involving incorrect model reported in issue #4655
; observe that model_validate=true to make sure generated model is correct
(push)
(set-info :status sat)
(assert (str.in_re (str.substr a 0 (str.len b)) (re.opt (str.to_re "A"))))
(assert (= 0 (str.len (str.substr a (str.len b) (str.len c)))))
(check-sat)
(pop)