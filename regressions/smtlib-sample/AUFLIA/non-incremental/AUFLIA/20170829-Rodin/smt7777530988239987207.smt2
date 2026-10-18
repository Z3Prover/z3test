(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort M 0)
(declare-sort PS 0)
(declare-sort PSSZ 0)
(declare-sort PSZ 0)
(declare-sort PZS 0)
(declare-sort S 0)
(declare-fun MS0 (Int S PZS) Bool)
(declare-fun MS1 (S Int PSZ) Bool)
(declare-fun MS2 (S PS) Bool)
(declare-fun MS3 (S S Int PSSZ) Bool)
(declare-fun a (S S) Bool)
(declare-fun b (S PZS) Bool)
(declare-fun c (S S) Bool)
(declare-fun d (S S) Bool)
(declare-fun p (M S) Bool)
(declare-fun da () PS)
(declare-fun k () Int)
(declare-fun l () S)
(declare-fun n () Int)
(declare-fun r () PSZ)
(declare-fun s () S)
(declare-fun s0 () S)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x143 S) (x144 Int)) 
            (exists ((X PSZ)) 
                (and 
                    (MS1 x143 x144 X) 
                    (forall ((y S) (y0 Int)) 
                        (=> 
                            (MS1 y y0 X) 
                            (and 
                                (= y x143) 
                                (= y0 x144))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x145 S)) 
            (exists ((X0 PS)) 
                (and 
                    (MS2 x145 X0) 
                    (forall ((y1 S)) 
                        (=> 
                            (MS2 y1 X0) 
                            (= y1 x145)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x146 Int) (x147 S)) 
            (exists ((X1 PZS)) 
                (and 
                    (MS0 x146 x147 X1) 
                    (forall ((y2 Int) (y3 S)) 
                        (=> 
                            (MS0 y2 y3 X1) 
                            (and 
                                (= y2 x146) 
                                (= y3 x147))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x148 S) (x149 S) (x150 Int)) 
            (exists ((X2 PSSZ)) 
                (and 
                    (MS3 x148 x149 x150 X2) 
                    (forall ((y4 S) (y5 S) (y6 Int)) 
                        (=> 
                            (MS3 y4 y5 y6 X2) 
                            (and 
                                (= y4 x148) 
                                (= y5 x149) 
                                (= y6 x150))))))))
(assert (! (exists ((x S) (x0 PZS)) 
               (and 
                   (b s x0) 
                   (MS0 n x x0)))
         :named hyp1))
(assert (! (forall ((x1 Int)) 
               (=> 
                   (MS1 s x1 r) 
                   (< n x1)))
         :named hyp2))
(assert (! (forall ((s1 S)) 
               (=> 
                   (and 
                       (not 
                           (exists ((x2 PZS)) 
                               (and 
                                   (forall ((x3 Int) (x4 S)) 
                                       (not 
                                           (MS0 x3 x4 x2))) 
                                   (b s1 x2)))) 
                       (exists ((x5 Int)) 
                           (and 
                               (exists ((x6 S) (x7 PZS)) 
                                   (and 
                                       (b s1 x7) 
                                       (MS0 x5 x6 x7))) 
                               (forall ((x8 Int)) 
                                   (=> 
                                       (MS1 s1 x8 r) 
                                       (< x8 x5)))))) 
                   (exists ((x9 S)) 
                       (a s1 x9))))
         :named hyp3))
(assert (! (not 
               (= s0 s))
         :named hyp4))
(assert (! (not 
               (exists ((x10 PZS)) 
                   (and 
                       (forall ((x11 Int) (x12 S)) 
                           (not 
                               (MS0 x11 x12 x10))) 
                       (b s0 x10))))
         :named hyp5))
(assert (! (exists ((x13 Int)) 
               (and 
                   (exists ((x14 S) (x15 PZS)) 
                       (and 
                           (b s0 x15) 
                           (MS0 x13 x14 x15))) 
                   (forall ((x16 Int)) 
                       (=> 
                           (MS1 s0 x16 r) 
                           (< x16 x13)))))
         :named hyp6))
(assert (! (forall ((a0 Int)) 
               (exists ((b0 Int) (f PSZ)) 
                   (and 
                       (forall ((x17 S) (x18 Int)) 
                           (=> 
                               (MS1 x17 x18 f) 
                               (and 
                                   (<= a0 x18) 
                                   (<= x18 b0)))) 
                       (forall ((x19 S) (x20 Int) (x21 Int)) 
                           (=> 
                               (and 
                                   (MS1 x19 x20 f) 
                                   (MS1 x19 x21 f)) 
                               (= x20 x21))) 
                       (forall ((x22 S)) 
                           (exists ((x23 Int)) 
                               (MS1 x22 x23 f))) 
                       (forall ((x24 Int) (x25 S) (x26 S)) 
                           (=> 
                               (and 
                                   (MS1 x25 x24 f) 
                                   (MS1 x26 x24 f)) 
                               (= x25 x26))))))
         :named hyp7))
(assert (! (and 
               (forall ((x27 S) (x28 S)) 
                   (=> 
                       (c x27 x28) 
                       (not 
                           (= x27 l)))) 
               (forall ((x29 S) (x30 S) (x31 S)) 
                   (=> 
                       (and 
                           (c x29 x30) 
                           (c x29 x31)) 
                       (= x30 x31))) 
               (forall ((x32 S)) 
                   (=> 
                       (not 
                           (= x32 l)) 
                       (exists ((x33 S)) 
                           (c x32 x33)))))
         :named hyp8))
(assert (! (forall ((x34 M) (x35 S) (x36 S)) 
               (=> 
                   (and 
                       (p x34 x35) 
                       (p x34 x36)) 
                   (= x35 x36)))
         :named hyp9))
(assert (! (and 
               (forall ((x37 S) (x38 S)) 
                   (=> 
                       (d x37 x38) 
                       (not 
                           (= x37 l)))) 
               (forall ((x39 S) (x40 S) (x41 S)) 
                   (=> 
                       (and 
                           (d x39 x40) 
                           (d x39 x41)) 
                       (= x40 x41))))
         :named hyp10))
(assert (! (and 
               (forall ((x42 S) (x43 S)) 
                   (=> 
                       (a x42 x43) 
                       (not 
                           (= x42 l)))) 
               (forall ((x44 S) (x45 S) (x46 S)) 
                   (=> 
                       (and 
                           (a x44 x45) 
                           (a x44 x46)) 
                       (= x45 x46))))
         :named hyp11))
(assert (! (forall ((x47 S) (x48 S)) 
               (= 
                   (c x47 x48) 
                   (or 
                       (and 
                           (d x47 x48) 
                           (not 
                               (exists ((x49 S)) 
                                   (a x47 x49)))) 
                       (a x47 x48))))
         :named hyp12))
(assert (! (forall ((x50 S)) 
               (= 
                   (exists ((x51 S)) 
                       (a x50 x51)) 
                   (and 
                       (MS2 x50 da) 
                       (not 
                           (= x50 l)))))
         :named hyp13))
(assert (! (forall ((a1 Int)) 
               (exists ((b1 Int) (f0 PSSZ)) 
                   (and 
                       (forall ((x52 S) (x53 S) (x54 Int)) 
                           (=> 
                               (MS3 x52 x53 x54 f0) 
                               (and 
                                   (a x52 x53) 
                                   (<= a1 x54) 
                                   (<= x54 b1)))) 
                       (forall ((x55 S) (x56 S) (x57 Int) (x58 Int)) 
                           (=> 
                               (and 
                                   (MS3 x55 x56 x57 f0) 
                                   (MS3 x55 x56 x58 f0)) 
                               (= x57 x58))) 
                       (forall ((x59 S) (x60 S)) 
                           (=> 
                               (a x59 x60) 
                               (exists ((x61 Int)) 
                                   (MS3 x59 x60 x61 f0)))) 
                       (forall ((x62 Int) (x63 S) (x64 S) (x65 S) (x66 S)) 
                           (=> 
                               (and 
                                   (MS3 x63 x64 x62 f0) 
                                   (MS3 x65 x66 x62 f0)) 
                               (and 
                                   (= x63 x65) 
                                   (= x64 x66)))))))
         :named hyp14))
(assert (! (and 
               (forall ((x67 S) (x68 Int)) 
                   (=> 
                       (MS1 x67 x68 r) 
                       (<= 0 x68))) 
               (forall ((x69 S) (x70 Int) (x71 Int)) 
                   (=> 
                       (and 
                           (MS1 x69 x70 r) 
                           (MS1 x69 x71 r)) 
                       (= x70 x71))) 
               (forall ((x72 S)) 
                   (exists ((x73 Int)) 
                       (MS1 x72 x73 r))))
         :named hyp15))
(assert (! (and 
               (forall ((x74 S) (x75 PZS)) 
                   (=> 
                       (b x74 x75) 
                       (and 
                           (forall ((x76 Int) (x77 S)) 
                               (=> 
                                   (MS0 x76 x77 x75) 
                                   (<= 0 x76))) 
                           (forall ((x78 Int) (x79 S) (x80 S)) 
                               (=> 
                                   (and 
                                       (MS0 x78 x79 x75) 
                                       (MS0 x78 x80 x75)) 
                                   (= x79 x80)))))) 
               (forall ((x81 S) (x82 PZS) (x83 PZS)) 
                   (=> 
                       (and 
                           (b x81 x82) 
                           (b x81 x83)) 
                       (forall ((x84 Int) (x85 S)) 
                           (= 
                               (MS0 x84 x85 x82) 
                               (MS0 x84 x85 x83))))) 
               (forall ((x86 S)) 
                   (exists ((x87 PZS)) 
                       (b x86 x87))))
         :named hyp16))
(assert (! (forall ((s2 S)) 
               (=> 
                   (exists ((x88 S)) 
                       (a s2 x88)) 
                   (exists ((x89 S)) 
                       (and 
                           (exists ((x90 PZS)) 
                               (and 
                                   (b s2 x90) 
                                   (exists ((x91 Int)) 
                                       (and 
                                           (exists ((x92 S) (x93 PZS)) 
                                               (and 
                                                   (b s2 x93) 
                                                   (MS0 x91 x92 x93))) 
                                           (forall ((x94 Int)) 
                                               (=> 
                                                   (exists ((x95 S) (x96 PZS)) 
                                                       (and 
                                                           (b s2 x96) 
                                                           (MS0 x94 x95 x96))) 
                                                   (<= x94 x91))) 
                                           (MS0 x91 x89 x90))))) 
                           (a s2 x89)))))
         :named hyp17))
(assert (! (MS1 l k r)
         :named hyp18))
(assert (! (exists ((x97 Int)) 
               (MS1 l x97 r))
         :named hyp19))
(assert (! (forall ((x98 S) (x99 Int) (x100 Int)) 
               (=> 
                   (and 
                       (MS1 x98 x99 r) 
                       (MS1 x98 x100 r)) 
                   (= x99 x100)))
         :named hyp20))
(assert (! (forall ((s3 S)) 
               (=> 
                   (exists ((x101 S)) 
                       (a s3 x101)) 
                   (exists ((x102 Int)) 
                       (and 
                           (exists ((x103 S) (x104 PZS)) 
                               (and 
                                   (b s3 x104) 
                                   (MS0 x102 x103 x104))) 
                           (forall ((x105 Int)) 
                               (=> 
                                   (MS1 s3 x105 r) 
                                   (< x105 x102)))))))
         :named hyp21))
(assert (! (forall ((s4 S) (x106 Int)) 
               (=> 
                   (MS1 s4 x106 r) 
                   (<= x106 k)))
         :named hyp22))
(assert (! (exists ((x107 PZS)) 
               (b s x107))
         :named hyp23))
(assert (! (forall ((x108 S) (x109 PZS) (x110 PZS)) 
               (=> 
                   (and 
                       (b x108 x109) 
                       (b x108 x110)) 
                   (forall ((x111 Int) (x112 S)) 
                       (= 
                           (MS0 x111 x112 x109) 
                           (MS0 x111 x112 x110)))))
         :named hyp24))
(assert (! (exists ((x113 Int)) 
               (MS1 s x113 r))
         :named hyp25))
(assert (! (forall ((s5 S)) 
               (=> 
                   (exists ((x114 S)) 
                       (a s5 x114)) 
                   (not 
                       (exists ((x115 PZS)) 
                           (and 
                               (forall ((x116 Int) (x117 S)) 
                                   (not 
                                       (MS0 x116 x117 x115))) 
                               (b s5 x115))))))
         :named hyp26))
(assert (! (forall ((s6 S)) 
               (not 
                   (exists ((x118 S) (x119 PZS)) 
                       (and 
                           (b s6 x119) 
                           (exists ((x120 Int)) 
                               (and 
                                   (MS1 s6 x120 r) 
                                   (MS0 x120 x118 x119)))))))
         :named hyp27))
(assert (! (forall ((U PS)) 
               (=> 
                   (forall ((x121 S)) 
                       (=> 
                           (MS2 x121 U) 
                           (exists ((x122 S)) 
                               (and 
                                   (MS2 x122 U) 
                                   (c x121 x122))))) 
                   (forall ((x123 S)) 
                       (not 
                           (MS2 x123 U)))))
         :named hyp28))
(assert (! (forall ((s7 S) (x124 Int)) 
               (=> 
                   (exists ((x125 S) (x126 PZS)) 
                       (and 
                           (b s7 x126) 
                           (MS0 x124 x125 x126))) 
                   (and 
                       (<= 0 x124) 
                       (<= x124 k))))
         :named hyp29))
(assert (! (forall ((s8 S) (n0 Int)) 
               (=> 
                   (and 
                       (exists ((x127 S) (x128 PZS)) 
                           (and 
                               (b s8 x128) 
                               (MS0 n0 x127 x128))) 
                       (forall ((x129 Int)) 
                           (=> 
                               (MS1 s8 x129 r) 
                               (< x129 n0)))) 
                   (and 
                       (exists ((x130 S) (x131 PZS)) 
                           (and 
                               (b s8 x131) 
                               (MS0 n0 x130 x131))) 
                       (forall ((x132 Int)) 
                           (=> 
                               (exists ((x133 S) (x134 PZS)) 
                                   (and 
                                       (b s8 x134) 
                                       (MS0 x132 x133 x134))) 
                               (<= x132 n0))))))
         :named hyp30))
(assert (! (forall ((s9 S)) 
               (=> 
                   (not 
                       (= s9 l)) 
                   (forall ((x135 Int)) 
                       (=> 
                           (MS1 s9 x135 r) 
                           (<= x135 k)))))
         :named hyp31))
(assert (! (forall ((s10 S)) 
               (=> 
                   (not 
                       (exists ((x136 PZS)) 
                           (and 
                               (forall ((x137 Int) (x138 S)) 
                                   (not 
                                       (MS0 x137 x138 x136))) 
                               (b s10 x136)))) 
                   (forall ((x139 Int)) 
                       (=> 
                           (exists ((x140 S) (x141 PZS)) 
                               (and 
                                   (b s10 x141) 
                                   (MS0 x139 x140 x141))) 
                           (<= x139 k)))))
         :named hyp32))
(assert (! (not 
               (exists ((x142 S)) 
                   (a s0 x142)))
         :named goal))
(check-sat)
(exit)

