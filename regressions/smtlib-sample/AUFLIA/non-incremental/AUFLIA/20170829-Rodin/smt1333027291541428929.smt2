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
(declare-fun h () PNN)
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
(declare-fun ult () PNN)
(declare-fun urt () PNN)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x228 N) (x229 N)) 
            (exists ((X PNN)) 
                (and 
                    (MS0 x228 x229 X) 
                    (forall ((y2 N) (y3 N)) 
                        (=> 
                            (MS0 y2 y3 X) 
                            (and 
                                (= y2 x228) 
                                (= y3 x229))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x230 N) (x231 Int)) 
            (exists ((X0 PNZ)) 
                (and 
                    (MS x230 x231 X0) 
                    (forall ((y4 N) (y5 Int)) 
                        (=> 
                            (MS y4 y5 X0) 
                            (and 
                                (= y4 x230) 
                                (= y5 x231))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x232 N)) 
            (exists ((X1 PN)) 
                (and 
                    (MS1 x232 X1) 
                    (forall ((y6 N)) 
                        (=> 
                            (MS1 y6 X1) 
                            (= y6 x232)))))))
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
(assert (! (=> 
               (= n ok) 
               (forall ((x56 N)) 
                   (=> 
                       (exists ((x57 N)) 
                           (and 
                               (MS1 x57 b) 
                               (MS0 x57 x56 g))) 
                       (MS1 x56 b))))
         :named hyp17))
(assert (! (=> 
               (= n ok) 
               (= p t))
         :named hyp18))
(assert (! (=> 
               (= p t) 
               (forall ((x58 N) (x59 N)) 
                   (not 
                       (MS0 x58 x59 f))))
         :named hyp19))
(assert (! (=> 
               (forall ((x60 N) (x61 N)) 
                   (not 
                       (MS0 x60 x61 f))) 
               (= p t))
         :named hyp20))
(assert (! (forall ((x62 N)) 
               (= 
                   (or 
                       (MS1 x62 lft) 
                       (MS1 x62 rht)) 
                   (exists ((x63 N)) 
                       (MS0 x63 x62 f))))
         :named hyp21))
(assert (! (forall ((x64 N)) 
               (not 
                   (and 
                       (MS1 x64 lft) 
                       (MS1 x64 rht))))
         :named hyp22))
(assert (! (forall ((x65 N) (x66 N)) 
               (=> 
                   (and 
                       (MS0 x66 x65 f) 
                       (MS1 x65 lft)) 
                   (MS0 x65 x66 lt)))
         :named hyp23))
(assert (! (forall ((x67 N) (x68 N)) 
               (=> 
                   (and 
                       (MS0 x68 x67 f) 
                       (MS1 x67 rht)) 
                   (MS0 x67 x68 rt)))
         :named hyp24))
(assert (! (=> 
               (forall ((x69 N) (x70 N)) 
                   (not 
                       (MS0 x69 x70 f))) 
               (and 
                   (forall ((x71 N)) 
                       (not 
                           (MS1 x71 lft))) 
                   (forall ((x72 N)) 
                       (not 
                           (MS1 x72 rht)))))
         :named hyp25))
(assert (! (=> 
               (= n ok) 
               (forall ((x73 N) (x74 N)) 
                   (not 
                       (MS0 x73 x74 f))))
         :named hyp26))
(assert (! (=> 
               (= n ok) 
               (and 
                   (forall ((x75 N)) 
                       (not 
                           (MS1 x75 lft))) 
                   (forall ((x76 N)) 
                       (not 
                           (MS1 x76 rht)))))
         :named hyp27))
(assert (! (forall ((x77 N) (x78 N)) 
               (= 
                   (MS0 x77 x78 ult) 
                   (or 
                       (and 
                           (MS0 x77 x78 lt) 
                           (not 
                               (MS1 x77 lft))) 
                       (and 
                           (MS0 x77 x78 f) 
                           (MS1 x77 lft)))))
         :named hyp28))
(assert (! (forall ((x79 N) (x80 N) (x81 N)) 
               (=> 
                   (and 
                       (MS0 x79 x80 ult) 
                       (MS0 x79 x81 ult)) 
                   (= x80 x81)))
         :named hyp29))
(assert (! (forall ((x82 N) (x83 N)) 
               (= 
                   (MS0 x82 x83 urt) 
                   (or 
                       (and 
                           (MS0 x82 x83 rt) 
                           (not 
                               (MS1 x82 rht))) 
                       (and 
                           (MS0 x82 x83 f) 
                           (MS1 x82 rht)))))
         :named hyp30))
(assert (! (forall ((x84 N) (x85 N) (x86 N)) 
               (=> 
                   (and 
                       (MS0 x84 x85 urt) 
                       (MS0 x84 x86 urt)) 
                   (= x85 x86)))
         :named hyp31))
(assert (! (forall ((x87 N) (x88 N)) 
               (= 
                   (MS0 x87 x88 h) 
                   (and 
                       (MS0 x87 x88 f) 
                       (= x87 p))))
         :named hyp32))
(assert (! (=> 
               (= n ok) 
               (forall ((x89 N) (x90 N)) 
                   (= 
                       (MS0 x89 x90 ult) 
                       (MS0 x89 x90 lt))))
         :named hyp33))
(assert (! (=> 
               (= n ok) 
               (forall ((x91 N) (x92 N)) 
                   (= 
                       (MS0 x91 x92 urt) 
                       (MS0 x91 x92 rt))))
         :named hyp34))
(assert (! (= n ko)
         :named hyp35))
(assert (! (forall ((x93 N)) 
               (=> 
                   (exists ((x94 N)) 
                       (and 
                           (= x94 p) 
                           (MS0 x94 x93 ult))) 
                   (MS1 x93 b)))
         :named hyp36))
(assert (! (forall ((x95 K)) 
               (or 
                   (= x95 ok) 
                   (= x95 ko)))
         :named hyp37))
(assert (! (not 
               (= ok ko))
         :named hyp38))
(assert (! (not 
               (or 
                   (exists ((x96 N)) 
                       (MS0 nil x96 lt)) 
                   (exists ((x97 N)) 
                       (MS0 nil x97 rt))))
         :named hyp39))
(assert (! (not 
               (or 
                   (exists ((x98 N)) 
                       (MS0 x98 nil lt)) 
                   (exists ((x99 N)) 
                       (MS0 x99 nil rt))))
         :named hyp40))
(assert (! (or 
               (forall ((x100 N)) 
                   (=> 
                       (exists ((x101 N)) 
                           (and 
                               (MS1 x101 b) 
                               (MS0 x101 x100 g))) 
                       (MS1 x100 b))) 
               (and 
                   (not 
                       (forall ((x102 N)) 
                           (=> 
                               (exists ((x103 N)) 
                                   (and 
                                       (MS1 x103 b) 
                                       (MS0 x103 x102 g))) 
                               (MS1 x102 b)))) 
                   (exists ((x104 N) (y N)) 
                       (and 
                           (MS0 x104 y g) 
                           (MS1 x104 b) 
                           (not 
                               (MS1 y b))))))
         :named hyp41))
(assert (! (=> 
               (not 
                   (= p t)) 
               (exists ((x105 N)) 
                   (MS0 p x105 f)))
         :named hyp42))
(assert (! (=> 
               (and 
                   (not 
                       (= p t)) 
                   (MS0 p t f)) 
               (forall ((x106 N) (x107 N)) 
                   (= 
                       (MS0 x106 x107 f) 
                       (and 
                           (= x106 p) 
                           (= x107 t)))))
         :named hyp43))
(assert (! (=> 
               (not 
                   (= p t)) 
               (and 
                   (exists ((x108 N)) 
                       (MS0 p x108 f)) 
                   (forall ((x109 N) (x110 N) (x111 N)) 
                       (=> 
                           (and 
                               (MS0 x109 x110 f) 
                               (MS0 x109 x111 f)) 
                           (= x110 x111)))))
         :named hyp44))
(assert (! (not 
               (MS1 p lft))
         :named hyp45))
(assert (! (not 
               (MS1 p rht))
         :named hyp46))
(assert (! (=> 
               (not 
                   (= p t)) 
               (or 
                   (exists ((x112 N)) 
                       (and 
                           (MS0 p x112 h) 
                           (MS1 x112 lft))) 
                   (exists ((x113 N)) 
                       (and 
                           (MS0 p x113 h) 
                           (MS1 x113 rht)))))
         :named hyp47))
(assert (! (=> 
               (not 
                   (= p t)) 
               (and 
                   (exists ((x114 N)) 
                       (MS0 p x114 h)) 
                   (forall ((x115 N) (x116 N) (x117 N)) 
                       (=> 
                           (and 
                               (MS0 x115 x116 h) 
                               (MS0 x115 x117 h)) 
                           (= x116 x117)))))
         :named hyp48))
(assert (! (not 
               (forall ((x118 N)) 
                   (=> 
                       (exists ((x119 N)) 
                           (and 
                               (= x119 p) 
                               (MS0 x119 x118 urt))) 
                       (MS1 x118 b))))
         :named hyp49))
(assert (! (or 
               (and 
                   (not 
                       (forall ((x120 N)) 
                           (=> 
                               (exists ((x121 N)) 
                                   (and 
                                       (= x121 p) 
                                       (MS0 x121 x120 g))) 
                               (MS1 x120 b)))) 
                   (exists ((y0 N)) 
                       (and 
                           (MS0 p y0 g) 
                           (not 
                               (MS1 y0 b))))) 
               (and 
                   (forall ((x122 N)) 
                       (=> 
                           (exists ((x123 N)) 
                               (and 
                                   (= x123 p) 
                                   (MS0 x123 x122 g))) 
                           (MS1 x122 b))) 
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x124 N)) 
                       (=> 
                           (exists ((x125 N)) 
                               (and 
                                   (= x125 p) 
                                   (MS0 x125 x124 g))) 
                           (MS1 x124 b))) 
                   (= p t)) 
               (= n ok))
         :named hyp50))
(assert (! (or 
               (not 
                   (forall ((x126 N)) 
                       (=> 
                           (exists ((x127 N)) 
                               (and 
                                   (= x127 p) 
                                   (MS0 x127 x126 lt))) 
                           (MS1 x126 b)))) 
               (and 
                   (forall ((x128 N)) 
                       (=> 
                           (exists ((x129 N)) 
                               (and 
                                   (= x129 p) 
                                   (MS0 x129 x128 lt))) 
                           (MS1 x128 b))) 
                   (not 
                       (forall ((x130 N)) 
                           (=> 
                               (exists ((x131 N)) 
                                   (and 
                                       (= x131 p) 
                                       (MS0 x131 x130 rt))) 
                               (MS1 x130 b))))) 
               (and 
                   (forall ((x132 N)) 
                       (=> 
                           (exists ((x133 N)) 
                               (and 
                                   (= x133 p) 
                                   (MS0 x133 x132 lt))) 
                           (MS1 x132 b))) 
                   (forall ((x134 N)) 
                       (=> 
                           (exists ((x135 N)) 
                               (and 
                                   (= x135 p) 
                                   (MS0 x135 x134 rt))) 
                           (MS1 x134 b))) 
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x136 N)) 
                       (=> 
                           (exists ((x137 N)) 
                               (and 
                                   (= x137 p) 
                                   (MS0 x137 x136 lt))) 
                           (MS1 x136 b))) 
                   (forall ((x138 N)) 
                       (=> 
                           (exists ((x139 N)) 
                               (and 
                                   (= x139 p) 
                                   (MS0 x139 x138 rt))) 
                           (MS1 x138 b))) 
                   (= p t)) 
               (= n ok))
         :named hyp51))
(assert (! (or 
               (not 
                   (forall ((x140 N)) 
                       (=> 
                           (exists ((x141 N)) 
                               (and 
                                   (= x141 p) 
                                   (MS0 x141 x140 lt))) 
                           (MS1 x140 b)))) 
               (and 
                   (forall ((x142 N)) 
                       (=> 
                           (exists ((x143 N)) 
                               (and 
                                   (= x143 p) 
                                   (MS0 x143 x142 lt))) 
                           (MS1 x142 b))) 
                   (not 
                       (forall ((x144 N)) 
                           (=> 
                               (exists ((x145 N)) 
                                   (and 
                                       (= x145 p) 
                                       (MS0 x145 x144 rt))) 
                               (MS1 x144 b))))) 
               (and 
                   (forall ((x146 N)) 
                       (=> 
                           (exists ((x147 N)) 
                               (and 
                                   (= x147 p) 
                                   (MS0 x147 x146 lt))) 
                           (MS1 x146 b))) 
                   (forall ((x148 N)) 
                       (=> 
                           (exists ((x149 N)) 
                               (and 
                                   (= x149 p) 
                                   (MS0 x149 x148 rt))) 
                           (MS1 x148 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x150 N)) 
                       (and 
                           (MS0 p x150 f) 
                           (MS1 x150 lft)))) 
               (and 
                   (forall ((x151 N)) 
                       (=> 
                           (exists ((x152 N)) 
                               (and 
                                   (= x152 p) 
                                   (MS0 x152 x151 lt))) 
                           (MS1 x151 b))) 
                   (forall ((x153 N)) 
                       (=> 
                           (exists ((x154 N)) 
                               (and 
                                   (= x154 p) 
                                   (MS0 x154 x153 rt))) 
                           (MS1 x153 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x155 N)) 
                       (and 
                           (MS0 p x155 f) 
                           (MS1 x155 rht)))) 
               (and 
                   (forall ((x156 N)) 
                       (=> 
                           (exists ((x157 N)) 
                               (and 
                                   (= x157 p) 
                                   (MS0 x157 x156 lt))) 
                           (MS1 x156 b))) 
                   (forall ((x158 N)) 
                       (=> 
                           (exists ((x159 N)) 
                               (and 
                                   (= x159 p) 
                                   (MS0 x159 x158 rt))) 
                           (MS1 x158 b))) 
                   (= p t)) 
               (= n ok))
         :named hyp52))
(assert (! (or 
               (not 
                   (forall ((x160 N)) 
                       (=> 
                           (exists ((x161 N)) 
                               (and 
                                   (= x161 p) 
                                   (MS0 x161 x160 lt))) 
                           (MS1 x160 b)))) 
               (and 
                   (forall ((x162 N)) 
                       (=> 
                           (exists ((x163 N)) 
                               (and 
                                   (= x163 p) 
                                   (MS0 x163 x162 lt))) 
                           (MS1 x162 b))) 
                   (not 
                       (forall ((x164 N)) 
                           (=> 
                               (exists ((x165 N)) 
                                   (and 
                                       (= x165 p) 
                                       (MS0 x165 x164 rt))) 
                               (MS1 x164 b))))) 
               (and 
                   (=> 
                       (and 
                           (forall ((x166 N)) 
                               (=> 
                                   (exists ((x167 N)) 
                                       (and 
                                           (= x167 p) 
                                           (MS0 x167 x166 lt))) 
                                   (MS1 x166 b))) 
                           (forall ((x168 N)) 
                               (=> 
                                   (exists ((x169 N)) 
                                       (and 
                                           (= x169 p) 
                                           (MS0 x169 x168 rt))) 
                                   (MS1 x168 b))) 
                           (not 
                               (= p t))) 
                       (and 
                           (exists ((x170 N)) 
                               (MS0 p x170 f)) 
                           (forall ((x171 N) (x172 N) (x173 N)) 
                               (=> 
                                   (and 
                                       (MS0 x171 x172 f) 
                                       (MS0 x171 x173 f)) 
                                   (= x172 x173))))) 
                   (or 
                       (and 
                           (forall ((x174 N)) 
                               (=> 
                                   (exists ((x175 N)) 
                                       (and 
                                           (= x175 p) 
                                           (MS0 x175 x174 lt))) 
                                   (MS1 x174 b))) 
                           (forall ((x176 N)) 
                               (=> 
                                   (exists ((x177 N)) 
                                       (and 
                                           (= x177 p) 
                                           (MS0 x177 x176 rt))) 
                                   (MS1 x176 b))) 
                           (not 
                               (= p t)) 
                           (exists ((x178 N)) 
                               (and 
                                   (MS0 p x178 f) 
                                   (MS1 x178 lft)))) 
                       (=> 
                           (and 
                               (forall ((x179 N)) 
                                   (=> 
                                       (exists ((x180 N)) 
                                           (and 
                                               (= x180 p) 
                                               (MS0 x180 x179 lt))) 
                                       (MS1 x179 b))) 
                               (forall ((x181 N)) 
                                   (=> 
                                       (exists ((x182 N)) 
                                           (and 
                                               (= x182 p) 
                                               (MS0 x182 x181 rt))) 
                                       (MS1 x181 b))) 
                               (not 
                                   (= p t))) 
                           (and 
                               (exists ((x183 N)) 
                                   (MS0 p x183 f)) 
                               (forall ((x184 N) (x185 N) (x186 N)) 
                                   (=> 
                                       (and 
                                           (MS0 x184 x185 f) 
                                           (MS0 x184 x186 f)) 
                                       (= x185 x186))))))))
         :named hyp53))
(assert (! (or 
               (and 
                   (not 
                       (forall ((x187 N)) 
                           (=> 
                               (exists ((x188 N)) 
                                   (and 
                                       (= x188 p) 
                                       (MS0 x188 x187 g))) 
                               (MS1 x187 b)))) 
                   (exists ((y1 N)) 
                       (and 
                           (MS0 p y1 g) 
                           (not 
                               (MS1 y1 b))))) 
               (and 
                   (forall ((x189 N)) 
                       (=> 
                           (exists ((x190 N)) 
                               (and 
                                   (= x190 p) 
                                   (MS0 x190 x189 g))) 
                           (MS1 x189 b))) 
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x191 N)) 
                       (=> 
                           (exists ((x192 N)) 
                               (and 
                                   (= x192 p) 
                                   (MS0 x192 x191 g))) 
                           (MS1 x191 b))) 
                   (= p t)))
         :named hyp54))
(assert (! (or 
               (not 
                   (forall ((x193 N)) 
                       (=> 
                           (exists ((x194 N)) 
                               (and 
                                   (= x194 p) 
                                   (MS0 x194 x193 lt))) 
                           (MS1 x193 b)))) 
               (and 
                   (forall ((x195 N)) 
                       (=> 
                           (exists ((x196 N)) 
                               (and 
                                   (= x196 p) 
                                   (MS0 x196 x195 lt))) 
                           (MS1 x195 b))) 
                   (not 
                       (forall ((x197 N)) 
                           (=> 
                               (exists ((x198 N)) 
                                   (and 
                                       (= x198 p) 
                                       (MS0 x198 x197 rt))) 
                               (MS1 x197 b))))) 
               (and 
                   (forall ((x199 N)) 
                       (=> 
                           (exists ((x200 N)) 
                               (and 
                                   (= x200 p) 
                                   (MS0 x200 x199 lt))) 
                           (MS1 x199 b))) 
                   (forall ((x201 N)) 
                       (=> 
                           (exists ((x202 N)) 
                               (and 
                                   (= x202 p) 
                                   (MS0 x202 x201 rt))) 
                           (MS1 x201 b))) 
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x203 N)) 
                       (=> 
                           (exists ((x204 N)) 
                               (and 
                                   (= x204 p) 
                                   (MS0 x204 x203 lt))) 
                           (MS1 x203 b))) 
                   (forall ((x205 N)) 
                       (=> 
                           (exists ((x206 N)) 
                               (and 
                                   (= x206 p) 
                                   (MS0 x206 x205 rt))) 
                           (MS1 x205 b))) 
                   (= p t)))
         :named hyp55))
(assert (! (or 
               (not 
                   (forall ((x207 N)) 
                       (=> 
                           (exists ((x208 N)) 
                               (and 
                                   (= x208 p) 
                                   (MS0 x208 x207 lt))) 
                           (MS1 x207 b)))) 
               (and 
                   (forall ((x209 N)) 
                       (=> 
                           (exists ((x210 N)) 
                               (and 
                                   (= x210 p) 
                                   (MS0 x210 x209 lt))) 
                           (MS1 x209 b))) 
                   (not 
                       (forall ((x211 N)) 
                           (=> 
                               (exists ((x212 N)) 
                                   (and 
                                       (= x212 p) 
                                       (MS0 x212 x211 rt))) 
                               (MS1 x211 b))))) 
               (and 
                   (forall ((x213 N)) 
                       (=> 
                           (exists ((x214 N)) 
                               (and 
                                   (= x214 p) 
                                   (MS0 x214 x213 lt))) 
                           (MS1 x213 b))) 
                   (forall ((x215 N)) 
                       (=> 
                           (exists ((x216 N)) 
                               (and 
                                   (= x216 p) 
                                   (MS0 x216 x215 rt))) 
                           (MS1 x215 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x217 N)) 
                       (and 
                           (MS0 p x217 f) 
                           (MS1 x217 lft)))) 
               (and 
                   (forall ((x218 N)) 
                       (=> 
                           (exists ((x219 N)) 
                               (and 
                                   (= x219 p) 
                                   (MS0 x219 x218 lt))) 
                           (MS1 x218 b))) 
                   (forall ((x220 N)) 
                       (=> 
                           (exists ((x221 N)) 
                               (and 
                                   (= x221 p) 
                                   (MS0 x221 x220 rt))) 
                           (MS1 x220 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x222 N)) 
                       (and 
                           (MS0 p x222 f) 
                           (MS1 x222 rht)))) 
               (and 
                   (forall ((x223 N)) 
                       (=> 
                           (exists ((x224 N)) 
                               (and 
                                   (= x224 p) 
                                   (MS0 x224 x223 lt))) 
                           (MS1 x223 b))) 
                   (forall ((x225 N)) 
                       (=> 
                           (exists ((x226 N)) 
                               (and 
                                   (= x226 p) 
                                   (MS0 x226 x225 rt))) 
                           (MS1 x225 b))) 
                   (= p t)))
         :named hyp56))
(assert (! (not 
               (exists ((x227 N)) 
                   (MS0 p x227 urt)))
         :named goal))
(check-sat)
(exit)

