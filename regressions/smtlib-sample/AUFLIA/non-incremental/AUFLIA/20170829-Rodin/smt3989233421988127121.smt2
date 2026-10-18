(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort PZS 0)
(declare-sort S 0)
(declare-fun MS (Int S PZS) Bool)
(declare-fun a (S S) Bool)
(declare-fun b (S PZS) Bool)
(declare-fun r (S Int) Bool)
(declare-fun n () Int)
(declare-fun s () S)
(declare-fun s0 () S)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x20 Int) (x21 S)) 
            (exists ((X PZS)) 
                (and 
                    (MS x20 x21 X) 
                    (forall ((y Int) (y0 S)) 
                        (=> 
                            (MS y y0 X) 
                            (and 
                                (= y x20) 
                                (= y0 x21))))))))
(assert (! (forall ((s1 S)) 
               (=> 
                   (exists ((x S)) 
                       (a s1 x)) 
                   (exists ((x0 S)) 
                       (and 
                           (exists ((x1 PZS)) 
                               (and 
                                   (b s1 x1) 
                                   (exists ((x2 Int)) 
                                       (and 
                                           (exists ((x3 S) (x4 PZS)) 
                                               (and 
                                                   (b s1 x4) 
                                                   (MS x2 x3 x4))) 
                                           (forall ((x5 Int)) 
                                               (=> 
                                                   (exists ((x6 S) (x7 PZS)) 
                                                       (and 
                                                           (b s1 x7) 
                                                           (MS x5 x6 x7))) 
                                                   (<= x5 x2))) 
                                           (MS x2 x0 x1))))) 
                           (a s1 x0)))))
         :named hyp1))
(assert (! (exists ((x8 S) (x9 PZS)) 
               (and 
                   (b s x9) 
                   (MS n x8 x9)))
         :named hyp2))
(assert (! (forall ((x10 Int)) 
               (=> 
                   (r s x10) 
                   (< n x10)))
         :named hyp3))
(assert (! (exists ((x11 S)) 
               (a s0 x11))
         :named hyp4))
(assert (! (not 
               (= s0 s))
         :named hyp5))
(assert (! (not 
               (exists ((x12 S)) 
                   (and 
                       (exists ((x13 PZS)) 
                           (and 
                               (b s0 x13) 
                               (exists ((x14 Int)) 
                                   (and 
                                       (exists ((x15 S) (x16 PZS)) 
                                           (and 
                                               (b s0 x16) 
                                               (MS x14 x15 x16))) 
                                       (forall ((x17 Int)) 
                                           (=> 
                                               (exists ((x18 S) (x19 PZS)) 
                                                   (and 
                                                       (b s0 x19) 
                                                       (MS x17 x18 x19))) 
                                               (<= x17 x14))) 
                                       (MS x14 x12 x13))))) 
                       (a s0 x12))))
         :named goal))
(check-sat)
(exit)

