(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort K 0)
(declare-sort N 0)
(declare-sort PN 0)
(declare-sort PNN 0)
(declare-sort PNZ 0)
(declare-fun MS (N Int PNZ) Bool)
(declare-fun MS0 (N N PNN) Bool)
(declare-fun MS1 (N PN) Bool)
(declare-fun b () PN)
(declare-fun c () PNN)
(declare-fun f () PNN)
(declare-fun g () PNN)
(declare-fun ko () K)
(declare-fun lft () PN)
(declare-fun lt () PNN)
(declare-fun n () K)
(declare-fun nil () N)
(declare-fun ok () K)
(declare-fun p () N)
(declare-fun rht () PN)
(declare-fun rt () PNN)
(declare-fun t () N)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x91 N) (x92 N)) 
            (exists ((X PNN)) 
                (and 
                    (MS0 x91 x92 X) 
                    (forall ((y1 N) (y2 N)) 
                        (=> 
                            (MS0 y1 y2 X) 
                            (and 
                                (= y1 x91) 
                                (= y2 x92))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x93 N) (x94 Int)) 
            (exists ((X0 PNZ)) 
                (and 
                    (MS x93 x94 X0) 
                    (forall ((y3 N) (y4 Int)) 
                        (=> 
                            (MS y3 y4 X0) 
                            (and 
                                (= y3 x93) 
                                (= y4 x94))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x95 N)) 
            (exists ((X1 PN)) 
                (and 
                    (MS1 x95 X1) 
                    (forall ((y5 N)) 
                        (=> 
                            (MS1 y5 X1) 
                            (= y5 x95)))))))
(assert (! (forall ((a Int)) 
               (exists ((b0 Int) (f0 PNZ)) 
                   (and 
                       (forall ((x N) (x0 Int)) 
                           (=> 
                               (MS x x0 f0) 
                               (and 
                                   (<= a x0) 
                                   (<= x0 b0)))) 
                       (forall ((x1 N) (x2 Int) (x3 Int)) 
                           (=> 
                               (and 
                                   (MS x1 x2 f0) 
                                   (MS x1 x3 f0)) 
                               (= x2 x3))) 
                       (forall ((x4 N)) 
                           (exists ((x5 Int)) 
                               (MS x4 x5 f0))) 
                       (forall ((x6 Int) (x7 N) (x8 N)) 
                           (=> 
                               (and 
                                   (MS x7 x6 f0) 
                                   (MS x8 x6 f0)) 
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
(assert (! (MS1 t b)
         :named hyp8))
(assert (! (=> 
               (forall ((x29 N)) 
                   (=> 
                       (exists ((x30 N)) 
                           (and 
                               (MS1 x30 b) 
                               (MS0 x30 x29 g))) 
                       (MS1 x29 b))) 
               (forall ((x31 N)) 
                   (=> 
                       (exists ((x32 N)) 
                           (and 
                               (MS1 x32 b) 
                               (MS0 x32 x31 c))) 
                       (MS1 x31 b))))
         :named hyp9))
(assert (! (forall ((x33 N)) 
               (=> 
                   (MS1 x33 b) 
                   (exists ((x34 N)) 
                       (and 
                           (= x34 t) 
                           (MS0 x34 x33 c)))))
         :named hyp10))
(assert (! (MS1 p b)
         :named hyp11))
(assert (! (and 
               (forall ((x35 N) (x36 N)) 
                   (=> 
                       (MS0 x35 x36 f) 
                       (and 
                           (MS1 x35 b) 
                           (not 
                               (= x35 t)) 
                           (MS1 x36 b) 
                           (not 
                               (= x36 p))))) 
               (forall ((x37 N) (x38 N) (x39 N)) 
                   (=> 
                       (and 
                           (MS0 x37 x38 f) 
                           (MS0 x37 x39 f)) 
                       (= x38 x39))) 
               (forall ((x40 N) (x41 N) (x42 N)) 
                   (=> 
                       (and 
                           (MS0 x41 x40 f) 
                           (MS0 x42 x40 f)) 
                       (= x41 x42))))
         :named hyp12))
(assert (! (forall ((x43 N)) 
               (= 
                   (or 
                       (exists ((x44 N)) 
                           (MS0 x43 x44 f)) 
                       (= x43 t)) 
                   (or 
                       (exists ((x45 N)) 
                           (MS0 x45 x43 f)) 
                       (= x43 p))))
         :named hyp13))
(assert (! (forall ((s PN)) 
               (=> 
                   (and 
                       (forall ((x46 N)) 
                           (=> 
                               (MS1 x46 s) 
                               (or 
                                   (exists ((x47 N)) 
                                       (MS0 x46 x47 f)) 
                                   (= x46 t)))) 
                       (forall ((x48 N)) 
                           (=> 
                               (MS1 x48 s) 
                               (exists ((x49 N)) 
                                   (and 
                                       (MS1 x49 s) 
                                       (MS0 x48 x49 f)))))) 
                   (forall ((x50 N)) 
                       (not 
                           (MS1 x50 s)))))
         :named hyp14))
(assert (! (forall ((x51 N) (x52 N)) 
               (=> 
                   (MS0 x52 x51 f) 
                   (MS0 x51 x52 g)))
         :named hyp15))
(assert (! (forall ((x53 N)) 
               (=> 
                   (exists ((x54 N)) 
                       (and 
                           (MS1 x54 b) 
                           (not 
                               (or 
                                   (exists ((x55 N)) 
                                       (MS0 x54 x55 f)) 
                                   (= x54 t))) 
                           (MS0 x54 x53 g))) 
                   (MS1 x53 b)))
         :named hyp16))
(assert (! (forall ((x56 N)) 
               (= 
                   (or 
                       (MS1 x56 lft) 
                       (MS1 x56 rht)) 
                   (exists ((x57 N)) 
                       (MS0 x57 x56 f))))
         :named hyp17))
(assert (! (forall ((x58 N)) 
               (not 
                   (and 
                       (MS1 x58 lft) 
                       (MS1 x58 rht))))
         :named hyp18))
(assert (! (forall ((x59 N) (x60 N)) 
               (=> 
                   (and 
                       (MS0 x60 x59 f) 
                       (MS1 x59 lft)) 
                   (MS0 x59 x60 lt)))
         :named hyp19))
(assert (! (forall ((x61 N) (x62 N)) 
               (=> 
                   (and 
                       (MS0 x62 x61 f) 
                       (MS1 x61 rht)) 
                   (MS0 x61 x62 rt)))
         :named hyp20))
(assert (! (forall ((x63 K)) 
               (or 
                   (= x63 ok) 
                   (= x63 ko)))
         :named hyp21))
(assert (! (not 
               (= ok ko))
         :named hyp22))
(assert (! (not 
               (or 
                   (exists ((x64 N)) 
                       (MS0 nil x64 lt)) 
                   (exists ((x65 N)) 
                       (MS0 nil x65 rt))))
         :named hyp23))
(assert (! (not 
               (or 
                   (exists ((x66 N)) 
                       (MS0 x66 nil lt)) 
                   (exists ((x67 N)) 
                       (MS0 x67 nil rt))))
         :named hyp24))
(assert (! (or 
               (forall ((x68 N)) 
                   (=> 
                       (exists ((x69 N)) 
                           (and 
                               (MS1 x69 b) 
                               (MS0 x69 x68 g))) 
                       (MS1 x68 b))) 
               (and 
                   (not 
                       (forall ((x70 N)) 
                           (=> 
                               (exists ((x71 N)) 
                                   (and 
                                       (MS1 x71 b) 
                                       (MS0 x71 x70 g))) 
                               (MS1 x70 b)))) 
                   (exists ((x72 N) (y N)) 
                       (and 
                           (MS0 x72 y g) 
                           (MS1 x72 b) 
                           (not 
                               (MS1 y b))))))
         :named hyp25))
(assert (! (not 
               (MS1 p lft))
         :named hyp26))
(assert (! (not 
               (MS1 p rht))
         :named hyp27))
(assert (! (= n ko)
         :named hyp28))
(assert (! (forall ((x73 N)) 
               (=> 
                   (exists ((x74 N)) 
                       (and 
                           (= x74 p) 
                           (MS0 x74 x73 lt))) 
                   (MS1 x73 b)))
         :named hyp29))
(assert (! (forall ((x75 N)) 
               (=> 
                   (exists ((x76 N)) 
                       (and 
                           (= x76 p) 
                           (MS0 x76 x75 rt))) 
                   (MS1 x75 b)))
         :named hyp30))
(assert (! (not 
               (= p t))
         :named hyp31))
(assert (! (not 
               (forall ((x77 N) (x78 N)) 
                   (not 
                       (MS0 x77 x78 f))))
         :named hyp32))
(assert (! (exists ((x79 N)) 
               (MS0 p x79 f))
         :named hyp33))
(assert (! (=> 
               (MS0 p t f) 
               (forall ((x80 N) (x81 N)) 
                   (= 
                       (MS0 x80 x81 f) 
                       (and 
                           (= x80 p) 
                           (= x81 t)))))
         :named hyp34))
(assert (! (forall ((x82 N) (x83 N) (x84 N)) 
               (=> 
                   (and 
                       (MS0 x82 x83 f) 
                       (MS0 x82 x84 f)) 
                   (= x83 x84)))
         :named hyp35))
(assert (! (or 
               (and 
                   (not 
                       (forall ((x85 N)) 
                           (=> 
                               (exists ((x86 N)) 
                                   (and 
                                       (= x86 p) 
                                       (MS0 x86 x85 g))) 
                               (MS1 x85 b)))) 
                   (exists ((y0 N)) 
                       (and 
                           (MS0 p y0 g) 
                           (not 
                               (MS1 y0 b))))) 
               (forall ((x87 N)) 
                   (=> 
                       (exists ((x88 N)) 
                           (and 
                               (= x88 p) 
                               (MS0 x88 x87 g))) 
                       (MS1 x87 b))))
         :named hyp36))
(assert (! (not 
               (or 
                   (exists ((x89 N)) 
                       (and 
                           (MS0 p x89 f) 
                           (MS1 x89 lft))) 
                   (exists ((x90 N)) 
                       (and 
                           (MS0 p x90 f) 
                           (MS1 x90 rht))) 
                   (= n ok)))
         :named goal))
(check-sat)
(exit)

