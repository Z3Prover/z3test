(set-info :smt-lib-version 2.6)
(set-logic QF_AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-fun chg () Bool)
(declare-fun circuit () Bool)
(declare-fun c () Int)

(assert (! (not 
               circuit)
         :named hyp1))
(assert (! (not 
               chg)
         :named hyp2))
(assert (! (= c 1)
         :named hyp3))
(assert (! (and 
               (<= 0 1) 
               (<= 1 10))
         :named hyp4))
(assert (! (not 
               (and 
                   (<= 0 0) 
                   (<= 0 10)))
         :named goal))
(check-sat)
(exit)

