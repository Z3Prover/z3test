(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort CLR 0)
(declare-sort DIR 0)
(declare-sort K 0)
(declare-sort N 0)
(declare-sort PNN 0)
(declare-sort PNZ 0)
(declare-fun MS (N Int PNZ) Bool)
(declare-fun MS0 (N N PNN) Bool)
(declare-fun black () CLR)
(declare-fun c () PNN)
(declare-fun g () PNN)
(declare-fun ko () K)
(declare-fun left () DIR)
(declare-fun lt () PNN)
(declare-fun ltp () PNN)
(declare-fun nil () N)
(declare-fun ok () K)
(declare-fun right () DIR)
(declare-fun rt () PNN)
(declare-fun rtp () PNN)
(declare-fun t () N)
(declare-fun white () CLR)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x61 N) (x62 N)) 
            (exists ((X PNN)) 
                (and 
                    (MS0 x61 x62 X) 
                    (forall ((y N) (y0 N)) 
                        (=> 
                            (MS0 y y0 X) 
                            (and 
                                (= y x61) 
                                (= y0 x62))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x63 N) (x64 Int)) 
            (exists ((X0 PNZ)) 
                (and 
                    (MS x63 x64 X0) 
                    (forall ((y1 N) (y2 Int)) 
                        (=> 
                            (MS y1 y2 X0) 
                            (and 
                                (= y1 x63) 
                                (= y2 x64))))))))
(assert (! (forall ((a Int)) 
               (exists ((b Int) (f PNZ)) 
                   (and 
                       (forall ((x N) (x0 Int)) 
                           (=> 
                               (MS x x0 f) 
                               (and 
                                   (<= a x0) 
                                   (<= x0 b)))) 
                       (forall ((x1 N) (x2 Int) (x3 Int)) 
                           (=> 
                               (and 
                                   (MS x1 x2 f) 
                                   (MS x1 x3 f)) 
                               (= x2 x3))) 
                       (forall ((x4 N)) 
                           (exists ((x5 Int)) 
                               (MS x4 x5 f))) 
                       (forall ((x6 Int) (x7 N) (x8 N)) 
                           (=> 
                               (and 
                                   (MS x7 x6 f) 
                                   (MS x8 x6 f)) 
                               (= x7 x8))))))
         :named hyp1))
(assert (! (forall ((x9 N) (x10 N)) 
               (=> 
                   (= x9 x10) 
                   (MS0 x9 x10 c)))
         :named hyp2))
(assert (! (forall ((x11 N) (x12 N)) 
               (=> 
                   (exists ((x13 N)) 
                       (and 
                           (MS0 x11 x13 c) 
                           (MS0 x13 x12 g))) 
                   (MS0 x11 x12 c)))
         :named hyp3))
(assert (! (forall ((r PNN)) 
               (=> 
                   (and 
                       (forall ((x14 N) (x15 N)) 
                           (=> 
                               (= x14 x15) 
                               (MS0 x14 x15 r))) 
                       (forall ((x16 N) (x17 N)) 
                           (=> 
                               (exists ((x18 N)) 
                                   (and 
                                       (MS0 x16 x18 r) 
                                       (MS0 x18 x17 g))) 
                               (MS0 x16 x17 r)))) 
                   (forall ((x19 N) (x20 N)) 
                       (=> 
                           (MS0 x19 x20 c) 
                           (MS0 x19 x20 r)))))
         :named hyp4))
(assert (! (forall ((x21 N) (x22 N) (x23 N)) 
               (=> 
                   (and 
                       (MS0 x21 x22 lt) 
                       (MS0 x21 x23 lt)) 
                   (= x22 x23)))
         :named hyp5))
(assert (! (forall ((x24 N) (x25 N) (x26 N)) 
               (=> 
                   (and 
                       (MS0 x24 x25 rt) 
                       (MS0 x24 x26 rt)) 
                   (= x25 x26)))
         :named hyp6))
(assert (! (forall ((x27 N) (x28 N)) 
               (= 
                   (MS0 x27 x28 g) 
                   (or 
                       (MS0 x27 x28 lt) 
                       (MS0 x27 x28 rt))))
         :named hyp7))
(assert (! (and 
               (forall ((x29 N) (x30 N) (x31 N)) 
                   (=> 
                       (and 
                           (MS0 x29 x30 ltp) 
                           (MS0 x29 x31 ltp)) 
                       (= x30 x31))) 
               (forall ((x32 N)) 
                   (exists ((x33 N)) 
                       (MS0 x32 x33 ltp))))
         :named hyp8))
(assert (! (and 
               (forall ((x34 N) (x35 N) (x36 N)) 
                   (=> 
                       (and 
                           (MS0 x34 x35 rtp) 
                           (MS0 x34 x36 rtp)) 
                       (= x35 x36))) 
               (forall ((x37 N)) 
                   (exists ((x38 N)) 
                       (MS0 x37 x38 rtp))))
         :named hyp9))
(assert (! (forall ((x39 N) (x40 N)) 
               (= 
                   (MS0 x39 x40 ltp) 
                   (or 
                       (and 
                           (= x40 nil) 
                           (not 
                               (exists ((x41 N)) 
                                   (MS0 x39 x41 lt)))) 
                       (MS0 x39 x40 lt))))
         :named hyp10))
(assert (! (forall ((x42 N) (x43 N)) 
               (= 
                   (MS0 x42 x43 rtp) 
                   (or 
                       (and 
                           (= x43 nil) 
                           (not 
                               (exists ((x44 N)) 
                                   (MS0 x42 x44 rt)))) 
                       (MS0 x42 x43 rt))))
         :named hyp11))
(assert (! (forall ((x45 K)) 
               (or 
                   (= x45 ok) 
                   (= x45 ko)))
         :named hyp12))
(assert (! (not 
               (= ok ko))
         :named hyp13))
(assert (! (forall ((x46 CLR)) 
               (or 
                   (= x46 black) 
                   (= x46 white)))
         :named hyp14))
(assert (! (not 
               (= black white))
         :named hyp15))
(assert (! (forall ((x47 DIR)) 
               (or 
                   (= x47 left) 
                   (= x47 right)))
         :named hyp16))
(assert (! (not 
               (= left right))
         :named hyp17))
(assert (! (not 
               (or 
                   (exists ((x48 N)) 
                       (MS0 nil x48 lt)) 
                   (exists ((x49 N)) 
                       (MS0 nil x49 rt))))
         :named hyp18))
(assert (! (not 
               (or 
                   (exists ((x50 N)) 
                       (MS0 x50 nil lt)) 
                   (exists ((x51 N)) 
                       (MS0 x51 nil rt))))
         :named hyp19))
(assert (! (not 
               (and 
                   (forall ((x52 N) (x53 CLR) (x54 CLR)) 
                       (=> 
                           (and 
                               (or 
                                   (and 
                                       (= x53 white) 
                                       (not 
                                           (exists ((x55 CLR)) 
                                               (and 
                                                   (= x52 t) 
                                                   (= x55 black))))) 
                                   (and 
                                       (= x52 t) 
                                       (= x53 black))) 
                               (or 
                                   (and 
                                       (= x54 white) 
                                       (not 
                                           (exists ((x56 CLR)) 
                                               (and 
                                                   (= x52 t) 
                                                   (= x56 black))))) 
                                   (and 
                                       (= x52 t) 
                                       (= x54 black)))) 
                           (= x53 x54))) 
                   (forall ((x57 N)) 
                       (or 
                           (exists ((x58 CLR)) 
                               (and 
                                   (= x58 white) 
                                   (not 
                                       (exists ((x59 CLR)) 
                                           (and 
                                               (= x57 t) 
                                               (= x59 black)))))) 
                           (exists ((x60 CLR)) 
                               (and 
                                   (= x57 t) 
                                   (= x60 black)))))))
         :named goal))
(check-sat)
(exit)

