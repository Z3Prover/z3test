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
(declare-fun DA (S Bool) Bool)
(declare-fun MS0 (S Int PSZ) Bool)
(declare-fun MS1 (S PS) Bool)
(declare-fun MS2 (S S Int PSSZ) Bool)
(declare-fun MS3 (Int S PZS) Bool)
(declare-fun a0 (S S) Bool)
(declare-fun b1 (S PZS) Bool)
(declare-fun c (S S) Bool)
(declare-fun d (S S) Bool)
(declare-fun p (M S) Bool)
(declare-fun da () PS)
(declare-fun k () Int)
(declare-fun l () S)
(declare-fun r () PSZ)
(declare-fun s () S)
(declare-fun x () S)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x141 S) (x142 Int)) 
            (exists ((X PSZ)) 
                (and 
                    (MS0 x141 x142 X) 
                    (forall ((y S) (y0 Int)) 
                        (=> 
                            (MS0 y y0 X) 
                            (and 
                                (= y x141) 
                                (= y0 x142))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x143 S)) 
            (exists ((X0 PS)) 
                (and 
                    (MS1 x143 X0) 
                    (forall ((y1 S)) 
                        (=> 
                            (MS1 y1 X0) 
                            (= y1 x143)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x144 Int) (x145 S)) 
            (exists ((X1 PZS)) 
                (and 
                    (MS3 x144 x145 X1) 
                    (forall ((y2 Int) (y3 S)) 
                        (=> 
                            (MS3 y2 y3 X1) 
                            (and 
                                (= y2 x144) 
                                (= y3 x145))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x146 S) (x147 S) (x148 Int)) 
            (exists ((X2 PSSZ)) 
                (and 
                    (MS2 x146 x147 x148 X2) 
                    (forall ((y4 S) (y5 S) (y6 Int)) 
                        (=> 
                            (MS2 y4 y5 y6 X2) 
                            (and 
                                (= y4 x146) 
                                (= y5 x147) 
                                (= y6 x148))))))))
(assert (! (forall ((a Int)) 
               (exists ((b Int) (f PSZ)) 
                   (and 
                       (forall ((x0 S) (x1 Int)) 
                           (=> 
                               (MS0 x0 x1 f) 
                               (and 
                                   (<= a x1) 
                                   (<= x1 b)))) 
                       (forall ((x2 S) (x3 Int) (x4 Int)) 
                           (=> 
                               (and 
                                   (MS0 x2 x3 f) 
                                   (MS0 x2 x4 f)) 
                               (= x3 x4))) 
                       (forall ((x5 S)) 
                           (exists ((x6 Int)) 
                               (MS0 x5 x6 f))) 
                       (forall ((x7 Int) (x8 S) (x9 S)) 
                           (=> 
                               (and 
                                   (MS0 x8 x7 f) 
                                   (MS0 x9 x7 f)) 
                               (= x8 x9))))))
         :named hyp1))
(assert (! (and 
               (forall ((x10 S) (x11 S)) 
                   (=> 
                       (c x10 x11) 
                       (not 
                           (= x10 l)))) 
               (forall ((x12 S) (x13 S) (x14 S)) 
                   (=> 
                       (and 
                           (c x12 x13) 
                           (c x12 x14)) 
                       (= x13 x14))) 
               (forall ((x15 S)) 
                   (=> 
                       (not 
                           (= x15 l)) 
                       (exists ((x16 S)) 
                           (c x15 x16)))))
         :named hyp2))
(assert (! (forall ((x17 M) (x18 S) (x19 S)) 
               (=> 
                   (and 
                       (p x17 x18) 
                       (p x17 x19)) 
                   (= x18 x19)))
         :named hyp3))
(assert (! (and 
               (forall ((x20 S) (x21 S)) 
                   (=> 
                       (d x20 x21) 
                       (not 
                           (= x20 l)))) 
               (forall ((x22 S) (x23 S) (x24 S)) 
                   (=> 
                       (and 
                           (d x22 x23) 
                           (d x22 x24)) 
                       (= x23 x24))))
         :named hyp4))
(assert (! (and 
               (forall ((x25 S) (x26 S)) 
                   (=> 
                       (a0 x25 x26) 
                       (not 
                           (= x25 l)))) 
               (forall ((x27 S) (x28 S) (x29 S)) 
                   (=> 
                       (and 
                           (a0 x27 x28) 
                           (a0 x27 x29)) 
                       (= x28 x29))))
         :named hyp5))
(assert (! (forall ((x30 S) (x31 S)) 
               (= 
                   (c x30 x31) 
                   (or 
                       (and 
                           (d x30 x31) 
                           (not 
                               (exists ((x32 S)) 
                                   (a0 x30 x32)))) 
                       (a0 x30 x31))))
         :named hyp6))
(assert (! (forall ((x33 S)) 
               (= 
                   (exists ((x34 S)) 
                       (a0 x33 x34)) 
                   (and 
                       (MS1 x33 da) 
                       (not 
                           (= x33 l)))))
         :named hyp7))
(assert (! (forall ((a1 Int)) 
               (exists ((b0 Int) (f0 PSSZ)) 
                   (and 
                       (forall ((x35 S) (x36 S) (x37 Int)) 
                           (=> 
                               (MS2 x35 x36 x37 f0) 
                               (and 
                                   (a0 x35 x36) 
                                   (<= a1 x37) 
                                   (<= x37 b0)))) 
                       (forall ((x38 S) (x39 S) (x40 Int) (x41 Int)) 
                           (=> 
                               (and 
                                   (MS2 x38 x39 x40 f0) 
                                   (MS2 x38 x39 x41 f0)) 
                               (= x40 x41))) 
                       (forall ((x42 S) (x43 S)) 
                           (=> 
                               (a0 x42 x43) 
                               (exists ((x44 Int)) 
                                   (MS2 x42 x43 x44 f0)))) 
                       (forall ((x45 Int) (x46 S) (x47 S) (x48 S) (x49 S)) 
                           (=> 
                               (and 
                                   (MS2 x46 x47 x45 f0) 
                                   (MS2 x48 x49 x45 f0)) 
                               (and 
                                   (= x46 x48) 
                                   (= x47 x49)))))))
         :named hyp8))
(assert (! (<= 0 k)
         :named hyp9))
(assert (! (and 
               (forall ((x50 S) (x51 Int)) 
                   (=> 
                       (MS0 x50 x51 r) 
                       (<= 0 x51))) 
               (forall ((x52 S) (x53 Int) (x54 Int)) 
                   (=> 
                       (and 
                           (MS0 x52 x53 r) 
                           (MS0 x52 x54 r)) 
                       (= x53 x54))) 
               (forall ((x55 S)) 
                   (exists ((x56 Int)) 
                       (MS0 x55 x56 r))))
         :named hyp10))
(assert (! (and 
               (forall ((x57 S) (x58 PZS)) 
                   (=> 
                       (b1 x57 x58) 
                       (and 
                           (forall ((x59 Int) (x60 S)) 
                               (=> 
                                   (MS3 x59 x60 x58) 
                                   (<= 0 x59))) 
                           (forall ((x61 Int) (x62 S) (x63 S)) 
                               (=> 
                                   (and 
                                       (MS3 x61 x62 x58) 
                                       (MS3 x61 x63 x58)) 
                                   (= x62 x63)))))) 
               (forall ((x64 S) (x65 PZS) (x66 PZS)) 
                   (=> 
                       (and 
                           (b1 x64 x65) 
                           (b1 x64 x66)) 
                       (forall ((x67 Int) (x68 S)) 
                           (= 
                               (MS3 x67 x68 x65) 
                               (MS3 x67 x68 x66))))) 
               (forall ((x69 S)) 
                   (exists ((x70 PZS)) 
                       (b1 x69 x70))))
         :named hyp11))
(assert (! (forall ((s0 S)) 
               (=> 
                   (exists ((x71 S)) 
                       (a0 s0 x71)) 
                   (exists ((x72 S)) 
                       (and 
                           (exists ((x73 PZS)) 
                               (and 
                                   (b1 s0 x73) 
                                   (exists ((x74 Int)) 
                                       (and 
                                           (exists ((x75 S) (x76 PZS)) 
                                               (and 
                                                   (b1 s0 x76) 
                                                   (MS3 x74 x75 x76))) 
                                           (forall ((x77 Int)) 
                                               (=> 
                                                   (exists ((x78 S) (x79 PZS)) 
                                                       (and 
                                                           (b1 s0 x79) 
                                                           (MS3 x77 x78 x79))) 
                                                   (<= x77 x74))) 
                                           (MS3 x74 x72 x73))))) 
                           (a0 s0 x72)))))
         :named hyp12))
(assert (! (MS0 l k r)
         :named hyp13))
(assert (! (exists ((x80 Int)) 
               (MS0 l x80 r))
         :named hyp14))
(assert (! (forall ((x81 S) (x82 Int) (x83 Int)) 
               (=> 
                   (and 
                       (MS0 x81 x82 r) 
                       (MS0 x81 x83 r)) 
                   (= x82 x83)))
         :named hyp15))
(assert (! (forall ((s1 S)) 
               (=> 
                   (exists ((x84 S)) 
                       (a0 s1 x84)) 
                   (exists ((x85 Int)) 
                       (and 
                           (exists ((x86 S) (x87 PZS)) 
                               (and 
                                   (b1 s1 x87) 
                                   (MS3 x85 x86 x87))) 
                           (forall ((x88 Int)) 
                               (=> 
                                   (MS0 s1 x88 r) 
                                   (< x88 x85)))))))
         :named hyp16))
(assert (! (forall ((s2 S) (x89 Int)) 
               (=> 
                   (MS0 s2 x89 r) 
                   (<= x89 k)))
         :named hyp17))
(assert (! (and 
               (forall ((x90 S) (x91 Bool) (x92 Bool)) 
                   (=> 
                       (and 
                           (DA x90 x91) 
                           (DA x90 x92)) 
                       (= 
                           x91 
                           x92))) 
               (forall ((x93 S)) 
                   (exists ((x94 Bool)) 
                       (DA x93 x94))))
         :named hyp18))
(assert (! (exists ((x95 Bool)) 
               (and 
                   x95 
                   (DA l x95)))
         :named hyp19))
(assert (! (exists ((x96 Bool)) 
               (DA l x96))
         :named hyp20))
(assert (! (forall ((x97 S) (x98 Bool) (x99 Bool)) 
               (=> 
                   (and 
                       (DA x97 x98) 
                       (DA x97 x99)) 
                   (= 
                       x98 
                       x99)))
         :named hyp21))
(assert (! (forall ((s3 S)) 
               (=> 
                   (exists ((x100 S)) 
                       (a0 s3 x100)) 
                   (not 
                       (exists ((x101 PZS)) 
                           (and 
                               (forall ((x102 Int) (x103 S)) 
                                   (not 
                                       (MS3 x102 x103 x101))) 
                               (b1 s3 x101))))))
         :named hyp22))
(assert (! (forall ((s4 S)) 
               (not 
                   (exists ((x104 S) (x105 PZS)) 
                       (and 
                           (b1 s4 x105) 
                           (exists ((x106 Int)) 
                               (and 
                                   (MS0 s4 x106 r) 
                                   (MS3 x106 x104 x105)))))))
         :named hyp23))
(assert (! (not 
               (= s l))
         :named hyp24))
(assert (! (forall ((U PS)) 
               (=> 
                   (forall ((x107 S)) 
                       (=> 
                           (MS1 x107 U) 
                           (exists ((x108 S)) 
                               (and 
                                   (MS1 x108 U) 
                                   (c x107 x108))))) 
                   (forall ((x109 S)) 
                       (not 
                           (MS1 x109 U)))))
         :named hyp25))
(assert (! (forall ((s5 S) (x110 Int)) 
               (=> 
                   (exists ((x111 S) (x112 PZS)) 
                       (and 
                           (b1 s5 x112) 
                           (MS3 x110 x111 x112))) 
                   (and 
                       (<= 0 x110) 
                       (<= x110 k))))
         :named hyp26))
(assert (! (forall ((s6 S) (n Int)) 
               (=> 
                   (and 
                       (exists ((x113 S) (x114 PZS)) 
                           (and 
                               (b1 s6 x114) 
                               (MS3 n x113 x114))) 
                       (forall ((x115 Int)) 
                           (=> 
                               (MS0 s6 x115 r) 
                               (< x115 n)))) 
                   (and 
                       (exists ((x116 S) (x117 PZS)) 
                           (and 
                               (b1 s6 x117) 
                               (MS3 n x116 x117))) 
                       (forall ((x118 Int)) 
                           (=> 
                               (exists ((x119 S) (x120 PZS)) 
                                   (and 
                                       (b1 s6 x120) 
                                       (MS3 x118 x119 x120))) 
                               (<= x118 n))))))
         :named hyp27))
(assert (! (forall ((x121 S)) 
               (=> 
                   (MS1 x121 da) 
                   (exists ((x122 Bool)) 
                       (and 
                           x122 
                           (DA x121 x122)))))
         :named hyp28))
(assert (! (forall ((x123 S)) 
               (=> 
                   (exists ((x124 Bool)) 
                       (and 
                           x124 
                           (DA x123 x124))) 
                   (MS1 x123 da)))
         :named hyp29))
(assert (! (forall ((s7 S)) 
               (=> 
                   (and 
                       (not 
                           (exists ((x125 PZS)) 
                               (and 
                                   (forall ((x126 Int) (x127 S)) 
                                       (not 
                                           (MS3 x126 x127 x125))) 
                                   (b1 s7 x125)))) 
                       (exists ((x128 Int)) 
                           (and 
                               (exists ((x129 S) (x130 PZS)) 
                                   (and 
                                       (b1 s7 x130) 
                                       (MS3 x128 x129 x130))) 
                               (forall ((x131 Int)) 
                                   (=> 
                                       (MS0 s7 x131 r) 
                                       (< x131 x128)))))) 
                   (exists ((x132 S)) 
                       (a0 s7 x132))))
         :named hyp30))
(assert (! (forall ((s8 S)) 
               (=> 
                   (not 
                       (= s8 l)) 
                   (forall ((x133 Int)) 
                       (=> 
                           (MS0 s8 x133 r) 
                           (<= x133 k)))))
         :named hyp31))
(assert (! (forall ((s9 S)) 
               (=> 
                   (not 
                       (exists ((x134 PZS)) 
                           (and 
                               (forall ((x135 Int) (x136 S)) 
                                   (not 
                                       (MS3 x135 x136 x134))) 
                               (b1 s9 x134)))) 
                   (forall ((x137 Int)) 
                       (=> 
                           (exists ((x138 S) (x139 PZS)) 
                               (and 
                                   (b1 s9 x139) 
                                   (MS3 x137 x138 x139))) 
                           (<= x137 k)))))
         :named hyp32))
(assert (! (not 
               (= x s))
         :named hyp33))
(assert (! (exists ((x140 Bool)) 
               (and 
                   x140 
                   (DA x x140)))
         :named hyp34))
(assert (! (not 
               (and 
                   (MS1 x da) 
                   (not 
                       (= x s))))
         :named goal))
(check-sat)
(exit)

