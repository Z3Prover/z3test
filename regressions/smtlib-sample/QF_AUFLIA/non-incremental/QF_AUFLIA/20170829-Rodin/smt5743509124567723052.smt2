(set-info :smt-lib-version 2.6)
(set-logic QF_AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-fun circuit () Bool)
(declare-fun flash () Int)
(declare-fun nf () Int)
(declare-fun nf0 () Int)

(assert (! (<= 0 nf0)
         :named hyp1))
(assert (! (not 
               circuit)
         :named hyp2))
(assert (! (= nf nf0)
         :named hyp3))
(assert (! (= flash nf0)
         :named hyp4))
(assert (! (not 
               (<= 0 (+ nf0 1)))
         :named goal))
(check-sat)
(exit)

