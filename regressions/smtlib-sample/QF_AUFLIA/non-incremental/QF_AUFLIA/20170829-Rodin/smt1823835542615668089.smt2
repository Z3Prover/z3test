(set-info :smt-lib-version 2.6)
(set-logic QF_AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-fun a () Int)
(declare-fun b () Int)

(assert (! (<= 0 b)
         :named hyp1))
(assert (! (< 0 b)
         :named hyp2))
(assert (! (= a 0)
         :named hyp3))
(assert (! (not 
               (<= 0 (- b 1)))
         :named goal))
(check-sat)
(exit)

