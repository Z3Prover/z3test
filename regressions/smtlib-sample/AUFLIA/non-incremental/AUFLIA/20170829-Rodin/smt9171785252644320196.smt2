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
(declare-sort PN 0)
(declare-sort PNN 0)
(declare-sort PNZ 0)
(declare-fun MS (N Int PNZ) Bool)
(declare-fun MS0 (N N PNN) Bool)
(declare-fun MS1 (N PN) Bool)
(declare-fun clr (N CLR) Bool)
(declare-fun dirp (N DIR) Bool)
(declare-fun b () PN)
(declare-fun black () CLR)
(declare-fun c () PNN)
(declare-fun f () PNN)
(declare-fun g () PNN)
(declare-fun h () PNN)
(declare-fun ko () K)
(declare-fun left () DIR)
(declare-fun lft () PN)
(declare-fun lt () PNN)
(declare-fun ltp () PNN)
(declare-fun n () K)
(declare-fun nil () N)
(declare-fun ok () K)
(declare-fun p () N)
(declare-fun q () N)
(declare-fun rht () PN)
(declare-fun right () DIR)
(declare-fun rt () PNN)
(declare-fun rtp () PNN)
(declare-fun t () N)
(declare-fun ult () PNN)
(declare-fun urt () PNN)
(declare-fun vlt () PNN)
(declare-fun vrt () PNN)
(declare-fun white () CLR)
(declare-fun wlt () PNN)
(declare-fun wrt () PNN)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x709 N) (x710 N)) 
            (exists ((X PNN)) 
                (and 
                    (MS0 x709 x710 X) 
                    (forall ((y3 N) (y4 N)) 
                        (=> 
                            (MS0 y3 y4 X) 
                            (and 
                                (= y3 x709) 
                                (= y4 x710))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x711 N) (x712 Int)) 
            (exists ((X0 PNZ)) 
                (and 
                    (MS x711 x712 X0) 
                    (forall ((y5 N) (y6 Int)) 
                        (=> 
                            (MS y5 y6 X0) 
                            (and 
                                (= y5 x711) 
                                (= y6 x712))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x713 N)) 
            (exists ((X1 PN)) 
                (and 
                    (MS1 x713 X1) 
                    (forall ((y7 N)) 
                        (=> 
                            (MS1 y7 X1) 
                            (= y7 x713)))))))
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
(assert (! (MS1 t b)
         :named hyp12))
(assert (! (=> 
               (forall ((x45 N)) 
                   (=> 
                       (exists ((x46 N)) 
                           (and 
                               (MS1 x46 b) 
                               (MS0 x46 x45 g))) 
                       (MS1 x45 b))) 
               (forall ((x47 N)) 
                   (=> 
                       (exists ((x48 N)) 
                           (and 
                               (MS1 x48 b) 
                               (MS0 x48 x47 c))) 
                       (MS1 x47 b))))
         :named hyp13))
(assert (! (forall ((x49 N)) 
               (=> 
                   (MS1 x49 b) 
                   (exists ((x50 N)) 
                       (and 
                           (= x50 t) 
                           (MS0 x50 x49 c)))))
         :named hyp14))
(assert (! (MS1 p b)
         :named hyp15))
(assert (! (and 
               (forall ((x51 N) (x52 N)) 
                   (=> 
                       (MS0 x51 x52 f) 
                       (and 
                           (MS1 x51 b) 
                           (not 
                               (= x51 t)) 
                           (MS1 x52 b) 
                           (not 
                               (= x52 p))))) 
               (forall ((x53 N) (x54 N) (x55 N)) 
                   (=> 
                       (and 
                           (MS0 x53 x54 f) 
                           (MS0 x53 x55 f)) 
                       (= x54 x55))) 
               (forall ((x56 N) (x57 N) (x58 N)) 
                   (=> 
                       (and 
                           (MS0 x57 x56 f) 
                           (MS0 x58 x56 f)) 
                       (= x57 x58))))
         :named hyp16))
(assert (! (forall ((x59 N)) 
               (= 
                   (or 
                       (exists ((x60 N)) 
                           (MS0 x59 x60 f)) 
                       (= x59 t)) 
                   (or 
                       (exists ((x61 N)) 
                           (MS0 x61 x59 f)) 
                       (= x59 p))))
         :named hyp17))
(assert (! (forall ((s PN)) 
               (=> 
                   (and 
                       (forall ((x62 N)) 
                           (=> 
                               (MS1 x62 s) 
                               (or 
                                   (exists ((x63 N)) 
                                       (MS0 x62 x63 f)) 
                                   (= x62 t)))) 
                       (forall ((x64 N)) 
                           (=> 
                               (MS1 x64 s) 
                               (exists ((x65 N)) 
                                   (and 
                                       (MS1 x65 s) 
                                       (MS0 x64 x65 f)))))) 
                   (forall ((x66 N)) 
                       (not 
                           (MS1 x66 s)))))
         :named hyp18))
(assert (! (forall ((x67 N) (x68 N)) 
               (=> 
                   (MS0 x68 x67 f) 
                   (MS0 x67 x68 g)))
         :named hyp19))
(assert (! (forall ((x69 N)) 
               (=> 
                   (exists ((x70 N)) 
                       (and 
                           (MS1 x70 b) 
                           (not 
                               (or 
                                   (exists ((x71 N)) 
                                       (MS0 x70 x71 f)) 
                                   (= x70 t))) 
                           (MS0 x70 x69 g))) 
                   (MS1 x69 b)))
         :named hyp20))
(assert (! (=> 
               (= n ok) 
               (forall ((x72 N)) 
                   (=> 
                       (exists ((x73 N)) 
                           (and 
                               (MS1 x73 b) 
                               (MS0 x73 x72 g))) 
                       (MS1 x72 b))))
         :named hyp21))
(assert (! (=> 
               (= n ok) 
               (= p t))
         :named hyp22))
(assert (! (=> 
               (= p t) 
               (forall ((x74 N) (x75 N)) 
                   (not 
                       (MS0 x74 x75 f))))
         :named hyp23))
(assert (! (=> 
               (forall ((x76 N) (x77 N)) 
                   (not 
                       (MS0 x76 x77 f))) 
               (= p t))
         :named hyp24))
(assert (! (forall ((x78 N)) 
               (= 
                   (or 
                       (MS1 x78 lft) 
                       (MS1 x78 rht)) 
                   (exists ((x79 N)) 
                       (MS0 x79 x78 f))))
         :named hyp25))
(assert (! (forall ((x80 N)) 
               (not 
                   (and 
                       (MS1 x80 lft) 
                       (MS1 x80 rht))))
         :named hyp26))
(assert (! (forall ((x81 N) (x82 N)) 
               (=> 
                   (and 
                       (MS0 x82 x81 f) 
                       (MS1 x81 lft)) 
                   (MS0 x81 x82 lt)))
         :named hyp27))
(assert (! (forall ((x83 N) (x84 N)) 
               (=> 
                   (and 
                       (MS0 x84 x83 f) 
                       (MS1 x83 rht)) 
                   (MS0 x83 x84 rt)))
         :named hyp28))
(assert (! (=> 
               (forall ((x85 N) (x86 N)) 
                   (not 
                       (MS0 x85 x86 f))) 
               (and 
                   (forall ((x87 N)) 
                       (not 
                           (MS1 x87 lft))) 
                   (forall ((x88 N)) 
                       (not 
                           (MS1 x88 rht)))))
         :named hyp29))
(assert (! (=> 
               (= n ok) 
               (forall ((x89 N) (x90 N)) 
                   (not 
                       (MS0 x89 x90 f))))
         :named hyp30))
(assert (! (=> 
               (= n ok) 
               (and 
                   (forall ((x91 N)) 
                       (not 
                           (MS1 x91 lft))) 
                   (forall ((x92 N)) 
                       (not 
                           (MS1 x92 rht)))))
         :named hyp31))
(assert (! (forall ((x93 N) (x94 N)) 
               (= 
                   (MS0 x93 x94 ult) 
                   (or 
                       (and 
                           (MS0 x93 x94 lt) 
                           (not 
                               (MS1 x93 lft))) 
                       (and 
                           (MS0 x93 x94 f) 
                           (MS1 x93 lft)))))
         :named hyp32))
(assert (! (forall ((x95 N) (x96 N) (x97 N)) 
               (=> 
                   (and 
                       (MS0 x95 x96 ult) 
                       (MS0 x95 x97 ult)) 
                   (= x96 x97)))
         :named hyp33))
(assert (! (forall ((x98 N) (x99 N)) 
               (= 
                   (MS0 x98 x99 urt) 
                   (or 
                       (and 
                           (MS0 x98 x99 rt) 
                           (not 
                               (MS1 x98 rht))) 
                       (and 
                           (MS0 x98 x99 f) 
                           (MS1 x98 rht)))))
         :named hyp34))
(assert (! (forall ((x100 N) (x101 N) (x102 N)) 
               (=> 
                   (and 
                       (MS0 x100 x101 urt) 
                       (MS0 x100 x102 urt)) 
                   (= x101 x102)))
         :named hyp35))
(assert (! (forall ((x103 N) (x104 N)) 
               (= 
                   (MS0 x103 x104 h) 
                   (and 
                       (MS0 x103 x104 f) 
                       (= x103 p))))
         :named hyp36))
(assert (! (=> 
               (= n ok) 
               (forall ((x105 N) (x106 N)) 
                   (= 
                       (MS0 x105 x106 ult) 
                       (MS0 x105 x106 lt))))
         :named hyp37))
(assert (! (=> 
               (= n ok) 
               (forall ((x107 N) (x108 N)) 
                   (= 
                       (MS0 x107 x108 urt) 
                       (MS0 x107 x108 rt))))
         :named hyp38))
(assert (! (forall ((x109 N) (x110 N)) 
               (= 
                   (MS0 x109 x110 vlt) 
                   (or 
                       (and 
                           (MS0 x109 x110 ult) 
                           (not 
                               (exists ((x111 N)) 
                                   (and 
                                       (= x109 t) 
                                       (= x111 nil) 
                                       (MS1 x109 lft))))) 
                       (and 
                           (= x109 t) 
                           (= x110 nil) 
                           (MS1 x109 lft)))))
         :named hyp39))
(assert (! (forall ((x112 N) (x113 N) (x114 N)) 
               (=> 
                   (and 
                       (MS0 x112 x113 vlt) 
                       (MS0 x112 x114 vlt)) 
                   (= x113 x114)))
         :named hyp40))
(assert (! (forall ((x115 N) (x116 N)) 
               (= 
                   (MS0 x115 x116 vrt) 
                   (or 
                       (and 
                           (MS0 x115 x116 urt) 
                           (not 
                               (exists ((x117 N)) 
                                   (and 
                                       (= x115 t) 
                                       (= x117 nil) 
                                       (MS1 x115 rht))))) 
                       (and 
                           (= x115 t) 
                           (= x116 nil) 
                           (MS1 x115 rht)))))
         :named hyp41))
(assert (! (forall ((x118 N) (x119 N) (x120 N)) 
               (=> 
                   (and 
                       (MS0 x118 x119 vrt) 
                       (MS0 x118 x120 vrt)) 
                   (= x119 x120)))
         :named hyp42))
(assert (! (=> 
               (= p t) 
               (= q nil))
         :named hyp43))
(assert (! (=> 
               (= n ok) 
               (forall ((x121 N) (x122 N)) 
                   (= 
                       (MS0 x121 x122 vlt) 
                       (MS0 x121 x122 lt))))
         :named hyp44))
(assert (! (=> 
               (= n ok) 
               (forall ((x123 N) (x124 N)) 
                   (= 
                       (MS0 x123 x124 vrt) 
                       (MS0 x123 x124 rt))))
         :named hyp45))
(assert (! (and 
               (forall ((x125 N) (x126 N) (x127 N)) 
                   (=> 
                       (and 
                           (MS0 x125 x126 wlt) 
                           (MS0 x125 x127 wlt)) 
                       (= x126 x127))) 
               (forall ((x128 N)) 
                   (exists ((x129 N)) 
                       (MS0 x128 x129 wlt))))
         :named hyp46))
(assert (! (and 
               (forall ((x130 N) (x131 N) (x132 N)) 
                   (=> 
                       (and 
                           (MS0 x130 x131 wrt) 
                           (MS0 x130 x132 wrt)) 
                       (= x131 x132))) 
               (forall ((x133 N)) 
                   (exists ((x134 N)) 
                       (MS0 x133 x134 wrt))))
         :named hyp47))
(assert (! (forall ((x135 N) (x136 N)) 
               (= 
                   (MS0 x135 x136 wlt) 
                   (or 
                       (and 
                           (= x136 nil) 
                           (not 
                               (exists ((x137 N)) 
                                   (MS0 x135 x137 vlt)))) 
                       (MS0 x135 x136 vlt))))
         :named hyp48))
(assert (! (forall ((x138 N) (x139 N)) 
               (= 
                   (MS0 x138 x139 wrt) 
                   (or 
                       (and 
                           (= x139 nil) 
                           (not 
                               (exists ((x140 N)) 
                                   (MS0 x138 x140 vrt)))) 
                       (MS0 x138 x139 vrt))))
         :named hyp49))
(assert (! (=> 
               (= n ok) 
               (forall ((x141 N) (x142 N)) 
                   (= 
                       (MS0 x141 x142 wlt) 
                       (MS0 x141 x142 ltp))))
         :named hyp50))
(assert (! (=> 
               (= n ok) 
               (forall ((x143 N) (x144 N)) 
                   (= 
                       (MS0 x143 x144 wrt) 
                       (MS0 x143 x144 rtp))))
         :named hyp51))
(assert (! (and 
               (forall ((x145 N) (x146 CLR) (x147 CLR)) 
                   (=> 
                       (and 
                           (clr x145 x146) 
                           (clr x145 x147)) 
                       (= x146 x147))) 
               (forall ((x148 N)) 
                   (exists ((x149 CLR)) 
                       (clr x148 x149))))
         :named hyp52))
(assert (! (forall ((x150 N)) 
               (= 
                   (MS1 x150 b) 
                   (exists ((x151 CLR)) 
                       (and 
                           (= x151 black) 
                           (clr x150 x151)))))
         :named hyp53))
(assert (! (and 
               (forall ((x152 N) (x153 DIR)) 
                   (=> 
                       (dirp x152 x153) 
                       (and 
                           (or 
                               (MS1 x152 lft) 
                               (MS1 x152 rht)) 
                           (or 
                               (= x153 left) 
                               (= x153 right))))) 
               (forall ((x154 N) (x155 DIR) (x156 DIR)) 
                   (=> 
                       (and 
                           (dirp x154 x155) 
                           (dirp x154 x156)) 
                       (= x155 x156))) 
               (forall ((x157 N)) 
                   (=> 
                       (or 
                           (MS1 x157 lft) 
                           (MS1 x157 rht)) 
                       (exists ((x158 DIR)) 
                           (dirp x157 x158)))))
         :named hyp54))
(assert (! (forall ((x159 N)) 
               (= 
                   (MS1 x159 lft) 
                   (exists ((x160 DIR)) 
                       (and 
                           (= x160 left) 
                           (dirp x159 x160)))))
         :named hyp55))
(assert (! (forall ((x161 N)) 
               (= 
                   (MS1 x161 rht) 
                   (exists ((x162 DIR)) 
                       (and 
                           (= x162 right) 
                           (dirp x161 x162)))))
         :named hyp56))
(assert (! (forall ((x163 CLR)) 
               (or 
                   (= x163 black) 
                   (= x163 white)))
         :named hyp57))
(assert (! (exists ((x164 CLR) (x165 N)) 
               (and 
                   (MS0 p x165 wlt) 
                   (clr x165 x164)))
         :named hyp58))
(assert (! (exists ((x166 N)) 
               (MS0 p x166 wlt))
         :named hyp59))
(assert (! (forall ((x167 N) (x168 N) (x169 N)) 
               (=> 
                   (and 
                       (MS0 x167 x168 wlt) 
                       (MS0 x167 x169 wlt)) 
                   (= x168 x169)))
         :named hyp60))
(assert (! (= 
               (exists ((x170 N)) 
                   (and 
                       (MS0 p x170 wlt) 
                       (MS1 x170 b))) 
               (exists ((x171 N)) 
                   (and 
                       (MS0 p x171 wlt) 
                       (clr x171 black))))
         :named hyp61))
(assert (! (forall ((x172 N) (x173 CLR) (x174 CLR)) 
               (=> 
                   (and 
                       (clr x172 x173) 
                       (clr x172 x174)) 
                   (= x173 x174)))
         :named hyp62))
(assert (! (exists ((x175 CLR) (x176 N)) 
               (and 
                   (MS0 p x176 wrt) 
                   (clr x176 x175)))
         :named hyp63))
(assert (! (exists ((x177 N)) 
               (MS0 p x177 wrt))
         :named hyp64))
(assert (! (forall ((x178 N) (x179 N) (x180 N)) 
               (=> 
                   (and 
                       (MS0 x178 x179 wrt) 
                       (MS0 x178 x180 wrt)) 
                   (= x179 x180)))
         :named hyp65))
(assert (! (or 
               (exists ((x181 N)) 
                   (and 
                       (MS0 p x181 wlt) 
                       (clr x181 black))) 
               (exists ((x182 N)) 
                   (and 
                       (MS0 p x182 wlt) 
                       (clr x182 white))))
         :named hyp66))
(assert (! (or 
               (exists ((x183 N)) 
                   (and 
                       (MS0 p x183 wrt) 
                       (clr x183 black))) 
               (exists ((x184 N)) 
                   (and 
                       (MS0 p x184 wrt) 
                       (clr x184 white))))
         :named hyp67))
(assert (! (exists ((x185 N)) 
               (and 
                   (MS0 p x185 wrt) 
                   (clr x185 white)))
         :named hyp68))
(assert (! (= n ko)
         :named hyp69))
(assert (! (forall ((x186 K)) 
               (or 
                   (= x186 ok) 
                   (= x186 ko)))
         :named hyp70))
(assert (! (not 
               (= ok ko))
         :named hyp71))
(assert (! (not 
               (= black white))
         :named hyp72))
(assert (! (forall ((x187 DIR)) 
               (or 
                   (= x187 left) 
                   (= x187 right)))
         :named hyp73))
(assert (! (not 
               (= left right))
         :named hyp74))
(assert (! (not 
               (or 
                   (exists ((x188 N)) 
                       (MS0 nil x188 lt)) 
                   (exists ((x189 N)) 
                       (MS0 nil x189 rt))))
         :named hyp75))
(assert (! (not 
               (or 
                   (exists ((x190 N)) 
                       (MS0 x190 nil lt)) 
                   (exists ((x191 N)) 
                       (MS0 x191 nil rt))))
         :named hyp76))
(assert (! (or 
               (forall ((x192 N)) 
                   (=> 
                       (exists ((x193 N)) 
                           (and 
                               (MS1 x193 b) 
                               (MS0 x193 x192 g))) 
                       (MS1 x192 b))) 
               (and 
                   (not 
                       (forall ((x194 N)) 
                           (=> 
                               (exists ((x195 N)) 
                                   (and 
                                       (MS1 x195 b) 
                                       (MS0 x195 x194 g))) 
                               (MS1 x194 b)))) 
                   (exists ((x196 N) (y N)) 
                       (and 
                           (MS0 x196 y g) 
                           (MS1 x196 b) 
                           (not 
                               (MS1 y b))))))
         :named hyp77))
(assert (! (=> 
               (not 
                   (= p t)) 
               (exists ((x197 N)) 
                   (MS0 p x197 f)))
         :named hyp78))
(assert (! (=> 
               (and 
                   (not 
                       (= p t)) 
                   (MS0 p t f)) 
               (forall ((x198 N) (x199 N)) 
                   (= 
                       (MS0 x198 x199 f) 
                       (and 
                           (= x198 p) 
                           (= x199 t)))))
         :named hyp79))
(assert (! (=> 
               (not 
                   (= p t)) 
               (and 
                   (exists ((x200 N)) 
                       (MS0 p x200 f)) 
                   (forall ((x201 N) (x202 N) (x203 N)) 
                       (=> 
                           (and 
                               (MS0 x201 x202 f) 
                               (MS0 x201 x203 f)) 
                           (= x202 x203)))))
         :named hyp80))
(assert (! (not 
               (MS1 p lft))
         :named hyp81))
(assert (! (not 
               (MS1 p rht))
         :named hyp82))
(assert (! (=> 
               (not 
                   (= p t)) 
               (or 
                   (exists ((x204 N)) 
                       (and 
                           (MS0 p x204 h) 
                           (MS1 x204 lft))) 
                   (exists ((x205 N)) 
                       (and 
                           (MS0 p x205 h) 
                           (MS1 x205 rht)))))
         :named hyp83))
(assert (! (=> 
               (not 
                   (= p t)) 
               (and 
                   (exists ((x206 N)) 
                       (MS0 p x206 h)) 
                   (forall ((x207 N) (x208 N) (x209 N)) 
                       (=> 
                           (and 
                               (MS0 x207 x208 h) 
                               (MS0 x207 x209 h)) 
                           (= x208 x209)))))
         :named hyp84))
(assert (! (=> 
               (not 
                   (= p t)) 
               (MS0 p q h))
         :named hyp85))
(assert (! (=> 
               (not 
                   (= p t)) 
               (or 
                   (MS1 q lft) 
                   (MS1 q rht)))
         :named hyp86))
(assert (! (not 
               (MS0 p nil wrt))
         :named hyp87))
(assert (! (=> 
               (not 
                   (MS0 p nil wlt)) 
               (exists ((x210 N)) 
                   (and 
                       (MS0 p x210 wlt) 
                       (clr x210 black))))
         :named hyp88))
(assert (! (or 
               (and 
                   (not 
                       (forall ((x211 N)) 
                           (=> 
                               (exists ((x212 N)) 
                                   (and 
                                       (= x212 p) 
                                       (MS0 x212 x211 g))) 
                               (MS1 x211 b)))) 
                   (exists ((y0 N)) 
                       (and 
                           (MS0 p y0 g) 
                           (not 
                               (MS1 y0 b))))) 
               (and 
                   (forall ((x213 N)) 
                       (=> 
                           (exists ((x214 N)) 
                               (and 
                                   (= x214 p) 
                                   (MS0 x214 x213 g))) 
                           (MS1 x213 b))) 
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x215 N)) 
                       (=> 
                           (exists ((x216 N)) 
                               (and 
                                   (= x216 p) 
                                   (MS0 x216 x215 g))) 
                           (MS1 x215 b))) 
                   (= p t)) 
               (= n ok))
         :named hyp89))
(assert (! (or 
               (not 
                   (forall ((x217 N)) 
                       (=> 
                           (exists ((x218 N)) 
                               (and 
                                   (= x218 p) 
                                   (MS0 x218 x217 lt))) 
                           (MS1 x217 b)))) 
               (and 
                   (forall ((x219 N)) 
                       (=> 
                           (exists ((x220 N)) 
                               (and 
                                   (= x220 p) 
                                   (MS0 x220 x219 lt))) 
                           (MS1 x219 b))) 
                   (not 
                       (forall ((x221 N)) 
                           (=> 
                               (exists ((x222 N)) 
                                   (and 
                                       (= x222 p) 
                                       (MS0 x222 x221 rt))) 
                               (MS1 x221 b))))) 
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
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x227 N)) 
                       (=> 
                           (exists ((x228 N)) 
                               (and 
                                   (= x228 p) 
                                   (MS0 x228 x227 lt))) 
                           (MS1 x227 b))) 
                   (forall ((x229 N)) 
                       (=> 
                           (exists ((x230 N)) 
                               (and 
                                   (= x230 p) 
                                   (MS0 x230 x229 rt))) 
                           (MS1 x229 b))) 
                   (= p t)) 
               (= n ok))
         :named hyp90))
(assert (! (or 
               (not 
                   (forall ((x231 N)) 
                       (=> 
                           (exists ((x232 N)) 
                               (and 
                                   (= x232 p) 
                                   (MS0 x232 x231 lt))) 
                           (MS1 x231 b)))) 
               (and 
                   (forall ((x233 N)) 
                       (=> 
                           (exists ((x234 N)) 
                               (and 
                                   (= x234 p) 
                                   (MS0 x234 x233 lt))) 
                           (MS1 x233 b))) 
                   (not 
                       (forall ((x235 N)) 
                           (=> 
                               (exists ((x236 N)) 
                                   (and 
                                       (= x236 p) 
                                       (MS0 x236 x235 rt))) 
                               (MS1 x235 b))))) 
               (and 
                   (forall ((x237 N)) 
                       (=> 
                           (exists ((x238 N)) 
                               (and 
                                   (= x238 p) 
                                   (MS0 x238 x237 lt))) 
                           (MS1 x237 b))) 
                   (forall ((x239 N)) 
                       (=> 
                           (exists ((x240 N)) 
                               (and 
                                   (= x240 p) 
                                   (MS0 x240 x239 rt))) 
                           (MS1 x239 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x241 N)) 
                       (and 
                           (MS0 p x241 f) 
                           (MS1 x241 lft)))) 
               (and 
                   (forall ((x242 N)) 
                       (=> 
                           (exists ((x243 N)) 
                               (and 
                                   (= x243 p) 
                                   (MS0 x243 x242 lt))) 
                           (MS1 x242 b))) 
                   (forall ((x244 N)) 
                       (=> 
                           (exists ((x245 N)) 
                               (and 
                                   (= x245 p) 
                                   (MS0 x245 x244 rt))) 
                           (MS1 x244 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x246 N)) 
                       (and 
                           (MS0 p x246 f) 
                           (MS1 x246 rht)))) 
               (and 
                   (forall ((x247 N)) 
                       (=> 
                           (exists ((x248 N)) 
                               (and 
                                   (= x248 p) 
                                   (MS0 x248 x247 lt))) 
                           (MS1 x247 b))) 
                   (forall ((x249 N)) 
                       (=> 
                           (exists ((x250 N)) 
                               (and 
                                   (= x250 p) 
                                   (MS0 x250 x249 rt))) 
                           (MS1 x249 b))) 
                   (= p t)) 
               (= n ok))
         :named hyp91))
(assert (! (or 
               (not 
                   (forall ((x251 N)) 
                       (=> 
                           (exists ((x252 N)) 
                               (and 
                                   (= x252 p) 
                                   (MS0 x252 x251 lt))) 
                           (MS1 x251 b)))) 
               (and 
                   (forall ((x253 N)) 
                       (=> 
                           (exists ((x254 N)) 
                               (and 
                                   (= x254 p) 
                                   (MS0 x254 x253 lt))) 
                           (MS1 x253 b))) 
                   (not 
                       (forall ((x255 N)) 
                           (=> 
                               (exists ((x256 N)) 
                                   (and 
                                       (= x256 p) 
                                       (MS0 x256 x255 rt))) 
                               (MS1 x255 b))))) 
               (and 
                   (=> 
                       (and 
                           (forall ((x257 N)) 
                               (=> 
                                   (exists ((x258 N)) 
                                       (and 
                                           (= x258 p) 
                                           (MS0 x258 x257 lt))) 
                                   (MS1 x257 b))) 
                           (forall ((x259 N)) 
                               (=> 
                                   (exists ((x260 N)) 
                                       (and 
                                           (= x260 p) 
                                           (MS0 x260 x259 rt))) 
                                   (MS1 x259 b))) 
                           (not 
                               (= p t))) 
                       (and 
                           (exists ((x261 N)) 
                               (MS0 p x261 f)) 
                           (forall ((x262 N) (x263 N) (x264 N)) 
                               (=> 
                                   (and 
                                       (MS0 x262 x263 f) 
                                       (MS0 x262 x264 f)) 
                                   (= x263 x264))))) 
                   (or 
                       (and 
                           (forall ((x265 N)) 
                               (=> 
                                   (exists ((x266 N)) 
                                       (and 
                                           (= x266 p) 
                                           (MS0 x266 x265 lt))) 
                                   (MS1 x265 b))) 
                           (forall ((x267 N)) 
                               (=> 
                                   (exists ((x268 N)) 
                                       (and 
                                           (= x268 p) 
                                           (MS0 x268 x267 rt))) 
                                   (MS1 x267 b))) 
                           (not 
                               (= p t)) 
                           (exists ((x269 N)) 
                               (and 
                                   (MS0 p x269 f) 
                                   (MS1 x269 lft)))) 
                       (=> 
                           (and 
                               (forall ((x270 N)) 
                                   (=> 
                                       (exists ((x271 N)) 
                                           (and 
                                               (= x271 p) 
                                               (MS0 x271 x270 lt))) 
                                       (MS1 x270 b))) 
                               (forall ((x272 N)) 
                                   (=> 
                                       (exists ((x273 N)) 
                                           (and 
                                               (= x273 p) 
                                               (MS0 x273 x272 rt))) 
                                       (MS1 x272 b))) 
                               (not 
                                   (= p t))) 
                           (and 
                               (exists ((x274 N)) 
                                   (MS0 p x274 f)) 
                               (forall ((x275 N) (x276 N) (x277 N)) 
                                   (=> 
                                       (and 
                                           (MS0 x275 x276 f) 
                                           (MS0 x275 x277 f)) 
                                       (= x276 x277))))))))
         :named hyp92))
(assert (! (or 
               (not 
                   (forall ((x278 N)) 
                       (=> 
                           (exists ((x279 N)) 
                               (and 
                                   (= x279 p) 
                                   (MS0 x279 x278 ult))) 
                           (MS1 x278 b)))) 
               (and 
                   (forall ((x280 N)) 
                       (=> 
                           (exists ((x281 N)) 
                               (and 
                                   (= x281 p) 
                                   (MS0 x281 x280 ult))) 
                           (MS1 x280 b))) 
                   (not 
                       (forall ((x282 N)) 
                           (=> 
                               (exists ((x283 N)) 
                                   (and 
                                       (= x283 p) 
                                       (MS0 x283 x282 urt))) 
                               (MS1 x282 b))))) 
               (and 
                   (forall ((x284 N)) 
                       (=> 
                           (exists ((x285 N)) 
                               (and 
                                   (= x285 p) 
                                   (MS0 x285 x284 ult))) 
                           (MS1 x284 b))) 
                   (forall ((x286 N)) 
                       (=> 
                           (exists ((x287 N)) 
                               (and 
                                   (= x287 p) 
                                   (MS0 x287 x286 urt))) 
                           (MS1 x286 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x288 N)) 
                       (and 
                           (MS0 p x288 f) 
                           (MS1 x288 lft)))) 
               (and 
                   (forall ((x289 N)) 
                       (=> 
                           (exists ((x290 N)) 
                               (and 
                                   (= x290 p) 
                                   (MS0 x290 x289 ult))) 
                           (MS1 x289 b))) 
                   (forall ((x291 N)) 
                       (=> 
                           (exists ((x292 N)) 
                               (and 
                                   (= x292 p) 
                                   (MS0 x292 x291 urt))) 
                           (MS1 x291 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x293 N)) 
                       (and 
                           (MS0 p x293 f) 
                           (MS1 x293 rht)))) 
               (and 
                   (forall ((x294 N)) 
                       (=> 
                           (exists ((x295 N)) 
                               (and 
                                   (= x295 p) 
                                   (MS0 x295 x294 ult))) 
                           (MS1 x294 b))) 
                   (forall ((x296 N)) 
                       (=> 
                           (exists ((x297 N)) 
                               (and 
                                   (= x297 p) 
                                   (MS0 x297 x296 urt))) 
                           (MS1 x296 b))) 
                   (= p t)) 
               (= n ok))
         :named hyp93))
(assert (! (or 
               (not 
                   (forall ((x298 N)) 
                       (=> 
                           (exists ((x299 N)) 
                               (and 
                                   (= x299 p) 
                                   (MS0 x299 x298 ult))) 
                           (MS1 x298 b)))) 
               (and 
                   (forall ((x300 N)) 
                       (=> 
                           (exists ((x301 N)) 
                               (and 
                                   (= x301 p) 
                                   (MS0 x301 x300 ult))) 
                           (MS1 x300 b))) 
                   (not 
                       (forall ((x302 N)) 
                           (=> 
                               (exists ((x303 N)) 
                                   (and 
                                       (= x303 p) 
                                       (MS0 x303 x302 urt))) 
                               (MS1 x302 b))))) 
               (and 
                   (=> 
                       (and 
                           (forall ((x304 N)) 
                               (=> 
                                   (exists ((x305 N)) 
                                       (and 
                                           (= x305 p) 
                                           (MS0 x305 x304 ult))) 
                                   (MS1 x304 b))) 
                           (forall ((x306 N)) 
                               (=> 
                                   (exists ((x307 N)) 
                                       (and 
                                           (= x307 p) 
                                           (MS0 x307 x306 urt))) 
                                   (MS1 x306 b))) 
                           (not 
                               (= p t))) 
                       (and 
                           (exists ((x308 N)) 
                               (MS0 p x308 f)) 
                           (forall ((x309 N) (x310 N) (x311 N)) 
                               (=> 
                                   (and 
                                       (MS0 x309 x310 f) 
                                       (MS0 x309 x311 f)) 
                                   (= x310 x311))))) 
                   (or 
                       (and 
                           (forall ((x312 N)) 
                               (=> 
                                   (exists ((x313 N)) 
                                       (and 
                                           (= x313 p) 
                                           (MS0 x313 x312 ult))) 
                                   (MS1 x312 b))) 
                           (forall ((x314 N)) 
                               (=> 
                                   (exists ((x315 N)) 
                                       (and 
                                           (= x315 p) 
                                           (MS0 x315 x314 urt))) 
                                   (MS1 x314 b))) 
                           (not 
                               (= p t)) 
                           (exists ((x316 N)) 
                               (and 
                                   (MS0 p x316 f) 
                                   (MS1 x316 lft)))) 
                       (=> 
                           (and 
                               (forall ((x317 N)) 
                                   (=> 
                                       (exists ((x318 N)) 
                                           (and 
                                               (= x318 p) 
                                               (MS0 x318 x317 ult))) 
                                       (MS1 x317 b))) 
                               (forall ((x319 N)) 
                                   (=> 
                                       (exists ((x320 N)) 
                                           (and 
                                               (= x320 p) 
                                               (MS0 x320 x319 urt))) 
                                       (MS1 x319 b))) 
                               (not 
                                   (= p t))) 
                           (and 
                               (exists ((x321 N)) 
                                   (MS0 p x321 f)) 
                               (forall ((x322 N) (x323 N) (x324 N)) 
                                   (=> 
                                       (and 
                                           (MS0 x322 x323 f) 
                                           (MS0 x322 x324 f)) 
                                       (= x323 x324))))))))
         :named hyp94))
(assert (! (or 
               (not 
                   (forall ((x325 N)) 
                       (=> 
                           (exists ((x326 N)) 
                               (and 
                                   (= x326 p) 
                                   (MS0 x326 x325 vlt))) 
                           (MS1 x325 b)))) 
               (and 
                   (forall ((x327 N)) 
                       (=> 
                           (exists ((x328 N)) 
                               (and 
                                   (= x328 p) 
                                   (MS0 x328 x327 vlt))) 
                           (MS1 x327 b))) 
                   (not 
                       (forall ((x329 N)) 
                           (=> 
                               (exists ((x330 N)) 
                                   (and 
                                       (= x330 p) 
                                       (MS0 x330 x329 vrt))) 
                               (MS1 x329 b))))) 
               (and 
                   (forall ((x331 N)) 
                       (=> 
                           (exists ((x332 N)) 
                               (and 
                                   (= x332 p) 
                                   (MS0 x332 x331 vlt))) 
                           (MS1 x331 b))) 
                   (forall ((x333 N)) 
                       (=> 
                           (exists ((x334 N)) 
                               (and 
                                   (= x334 p) 
                                   (MS0 x334 x333 vrt))) 
                           (MS1 x333 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x335 N)) 
                       (and 
                           (MS0 p x335 h) 
                           (MS1 x335 lft)))) 
               (and 
                   (forall ((x336 N)) 
                       (=> 
                           (exists ((x337 N)) 
                               (and 
                                   (= x337 p) 
                                   (MS0 x337 x336 vlt))) 
                           (MS1 x336 b))) 
                   (forall ((x338 N)) 
                       (=> 
                           (exists ((x339 N)) 
                               (and 
                                   (= x339 p) 
                                   (MS0 x339 x338 vrt))) 
                           (MS1 x338 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x340 N)) 
                       (and 
                           (MS0 p x340 h) 
                           (MS1 x340 rht)))) 
               (and 
                   (forall ((x341 N)) 
                       (=> 
                           (exists ((x342 N)) 
                               (and 
                                   (= x342 p) 
                                   (MS0 x342 x341 vlt))) 
                           (MS1 x341 b))) 
                   (forall ((x343 N)) 
                       (=> 
                           (exists ((x344 N)) 
                               (and 
                                   (= x344 p) 
                                   (MS0 x344 x343 vrt))) 
                           (MS1 x343 b))) 
                   (= p t)) 
               (= n ok))
         :named hyp95))
(assert (! (or 
               (not 
                   (forall ((x345 N)) 
                       (=> 
                           (exists ((x346 N)) 
                               (and 
                                   (= x346 p) 
                                   (MS0 x346 x345 vlt))) 
                           (MS1 x345 b)))) 
               (and 
                   (forall ((x347 N)) 
                       (=> 
                           (exists ((x348 N)) 
                               (and 
                                   (= x348 p) 
                                   (MS0 x348 x347 vlt))) 
                           (MS1 x347 b))) 
                   (not 
                       (forall ((x349 N)) 
                           (=> 
                               (exists ((x350 N)) 
                                   (and 
                                       (= x350 p) 
                                       (MS0 x350 x349 vrt))) 
                               (MS1 x349 b))))) 
               (and 
                   (=> 
                       (and 
                           (forall ((x351 N)) 
                               (=> 
                                   (exists ((x352 N)) 
                                       (and 
                                           (= x352 p) 
                                           (MS0 x352 x351 vlt))) 
                                   (MS1 x351 b))) 
                           (forall ((x353 N)) 
                               (=> 
                                   (exists ((x354 N)) 
                                       (and 
                                           (= x354 p) 
                                           (MS0 x354 x353 vrt))) 
                                   (MS1 x353 b))) 
                           (not 
                               (= p t))) 
                       (and 
                           (exists ((x355 N)) 
                               (MS0 p x355 h)) 
                           (forall ((x356 N) (x357 N) (x358 N)) 
                               (=> 
                                   (and 
                                       (MS0 x356 x357 h) 
                                       (MS0 x356 x358 h)) 
                                   (= x357 x358))))) 
                   (or 
                       (and 
                           (forall ((x359 N)) 
                               (=> 
                                   (exists ((x360 N)) 
                                       (and 
                                           (= x360 p) 
                                           (MS0 x360 x359 vlt))) 
                                   (MS1 x359 b))) 
                           (forall ((x361 N)) 
                               (=> 
                                   (exists ((x362 N)) 
                                       (and 
                                           (= x362 p) 
                                           (MS0 x362 x361 vrt))) 
                                   (MS1 x361 b))) 
                           (not 
                               (= p t)) 
                           (exists ((x363 N)) 
                               (and 
                                   (MS0 p x363 h) 
                                   (MS1 x363 lft)))) 
                       (=> 
                           (and 
                               (forall ((x364 N)) 
                                   (=> 
                                       (exists ((x365 N)) 
                                           (and 
                                               (= x365 p) 
                                               (MS0 x365 x364 vlt))) 
                                       (MS1 x364 b))) 
                               (forall ((x366 N)) 
                                   (=> 
                                       (exists ((x367 N)) 
                                           (and 
                                               (= x367 p) 
                                               (MS0 x367 x366 vrt))) 
                                       (MS1 x366 b))) 
                               (not 
                                   (= p t))) 
                           (and 
                               (exists ((x368 N)) 
                                   (MS0 p x368 h)) 
                               (forall ((x369 N) (x370 N) (x371 N)) 
                                   (=> 
                                       (and 
                                           (MS0 x369 x370 h) 
                                           (MS0 x369 x371 h)) 
                                       (= x370 x371))))))))
         :named hyp96))
(assert (! (forall ((x372 N)) 
               (=> 
                   (and 
                       (exists ((x373 N)) 
                           (MS0 x372 x373 vrt)) 
                       (not 
                           (= x372 t))) 
                   (not 
                       (MS0 x372 nil wrt))))
         :named hyp97))
(assert (! (forall ((x374 N)) 
               (=> 
                   (and 
                       (exists ((x375 N)) 
                           (MS0 x374 x375 vlt)) 
                       (not 
                           (= x374 t))) 
                   (not 
                       (MS0 x374 nil wlt))))
         :named hyp98))
(assert (! (forall ((x376 N)) 
               (=> 
                   (not 
                       (MS0 x376 nil wlt)) 
                   (exists ((x377 N)) 
                       (MS0 x376 x377 vlt))))
         :named hyp99))
(assert (! (forall ((x378 N)) 
               (=> 
                   (not 
                       (MS0 x378 nil wrt)) 
                   (exists ((x379 N)) 
                       (MS0 x378 x379 vrt))))
         :named hyp100))
(assert (! (forall ((x380 CLR)) 
               (or 
                   (= x380 black) 
                   (exists ((x381 N)) 
                       (and 
                           (MS0 p x381 wrt) 
                           (clr x381 x380)))))
         :named hyp101))
(assert (! (not 
               (exists ((x382 N)) 
                   (and 
                       (MS0 p x382 wrt) 
                       (clr x382 black))))
         :named hyp102))
(assert (! (not 
               (exists ((x383 N)) 
                   (and 
                       (MS0 p x383 wrt) 
                       (MS1 x383 b))))
         :named hyp103))
(assert (! (or 
               (and 
                   (not 
                       (MS0 p nil wlt)) 
                   (not 
                       (exists ((x384 N)) 
                           (and 
                               (MS0 p x384 wlt) 
                               (MS1 x384 b))))) 
               (=> 
                   (not 
                       (MS0 p nil wlt)) 
                   (exists ((x385 N)) 
                       (and 
                           (MS0 p x385 wlt) 
                           (MS1 x385 b)))) 
               (= n ok))
         :named hyp104))
(assert (! (or 
               (and 
                   (not 
                       (forall ((x386 N)) 
                           (=> 
                               (exists ((x387 N)) 
                                   (and 
                                       (= x387 p) 
                                       (MS0 x387 x386 g))) 
                               (MS1 x386 b)))) 
                   (exists ((y1 N)) 
                       (and 
                           (MS0 p y1 g) 
                           (not 
                               (MS1 y1 b))))) 
               (and 
                   (forall ((x388 N)) 
                       (=> 
                           (exists ((x389 N)) 
                               (and 
                                   (= x389 p) 
                                   (MS0 x389 x388 g))) 
                           (MS1 x388 b))) 
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x390 N)) 
                       (=> 
                           (exists ((x391 N)) 
                               (and 
                                   (= x391 p) 
                                   (MS0 x391 x390 g))) 
                           (MS1 x390 b))) 
                   (= p t)))
         :named hyp105))
(assert (! (or 
               (not 
                   (forall ((x392 N)) 
                       (=> 
                           (exists ((x393 N)) 
                               (and 
                                   (= x393 p) 
                                   (MS0 x393 x392 lt))) 
                           (MS1 x392 b)))) 
               (and 
                   (forall ((x394 N)) 
                       (=> 
                           (exists ((x395 N)) 
                               (and 
                                   (= x395 p) 
                                   (MS0 x395 x394 lt))) 
                           (MS1 x394 b))) 
                   (not 
                       (forall ((x396 N)) 
                           (=> 
                               (exists ((x397 N)) 
                                   (and 
                                       (= x397 p) 
                                       (MS0 x397 x396 rt))) 
                               (MS1 x396 b))))) 
               (and 
                   (forall ((x398 N)) 
                       (=> 
                           (exists ((x399 N)) 
                               (and 
                                   (= x399 p) 
                                   (MS0 x399 x398 lt))) 
                           (MS1 x398 b))) 
                   (forall ((x400 N)) 
                       (=> 
                           (exists ((x401 N)) 
                               (and 
                                   (= x401 p) 
                                   (MS0 x401 x400 rt))) 
                           (MS1 x400 b))) 
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x402 N)) 
                       (=> 
                           (exists ((x403 N)) 
                               (and 
                                   (= x403 p) 
                                   (MS0 x403 x402 lt))) 
                           (MS1 x402 b))) 
                   (forall ((x404 N)) 
                       (=> 
                           (exists ((x405 N)) 
                               (and 
                                   (= x405 p) 
                                   (MS0 x405 x404 rt))) 
                           (MS1 x404 b))) 
                   (= p t)))
         :named hyp106))
(assert (! (or 
               (not 
                   (forall ((x406 N)) 
                       (=> 
                           (exists ((x407 N)) 
                               (and 
                                   (= x407 p) 
                                   (MS0 x407 x406 lt))) 
                           (MS1 x406 b)))) 
               (and 
                   (forall ((x408 N)) 
                       (=> 
                           (exists ((x409 N)) 
                               (and 
                                   (= x409 p) 
                                   (MS0 x409 x408 lt))) 
                           (MS1 x408 b))) 
                   (not 
                       (forall ((x410 N)) 
                           (=> 
                               (exists ((x411 N)) 
                                   (and 
                                       (= x411 p) 
                                       (MS0 x411 x410 rt))) 
                               (MS1 x410 b))))) 
               (and 
                   (forall ((x412 N)) 
                       (=> 
                           (exists ((x413 N)) 
                               (and 
                                   (= x413 p) 
                                   (MS0 x413 x412 lt))) 
                           (MS1 x412 b))) 
                   (forall ((x414 N)) 
                       (=> 
                           (exists ((x415 N)) 
                               (and 
                                   (= x415 p) 
                                   (MS0 x415 x414 rt))) 
                           (MS1 x414 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x416 N)) 
                       (and 
                           (MS0 p x416 f) 
                           (MS1 x416 lft)))) 
               (and 
                   (forall ((x417 N)) 
                       (=> 
                           (exists ((x418 N)) 
                               (and 
                                   (= x418 p) 
                                   (MS0 x418 x417 lt))) 
                           (MS1 x417 b))) 
                   (forall ((x419 N)) 
                       (=> 
                           (exists ((x420 N)) 
                               (and 
                                   (= x420 p) 
                                   (MS0 x420 x419 rt))) 
                           (MS1 x419 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x421 N)) 
                       (and 
                           (MS0 p x421 f) 
                           (MS1 x421 rht)))) 
               (and 
                   (forall ((x422 N)) 
                       (=> 
                           (exists ((x423 N)) 
                               (and 
                                   (= x423 p) 
                                   (MS0 x423 x422 lt))) 
                           (MS1 x422 b))) 
                   (forall ((x424 N)) 
                       (=> 
                           (exists ((x425 N)) 
                               (and 
                                   (= x425 p) 
                                   (MS0 x425 x424 rt))) 
                           (MS1 x424 b))) 
                   (= p t)))
         :named hyp107))
(assert (! (or 
               (not 
                   (forall ((x426 N)) 
                       (=> 
                           (exists ((x427 N)) 
                               (and 
                                   (= x427 p) 
                                   (MS0 x427 x426 ult))) 
                           (MS1 x426 b)))) 
               (and 
                   (forall ((x428 N)) 
                       (=> 
                           (exists ((x429 N)) 
                               (and 
                                   (= x429 p) 
                                   (MS0 x429 x428 ult))) 
                           (MS1 x428 b))) 
                   (not 
                       (forall ((x430 N)) 
                           (=> 
                               (exists ((x431 N)) 
                                   (and 
                                       (= x431 p) 
                                       (MS0 x431 x430 urt))) 
                               (MS1 x430 b))))) 
               (and 
                   (forall ((x432 N)) 
                       (=> 
                           (exists ((x433 N)) 
                               (and 
                                   (= x433 p) 
                                   (MS0 x433 x432 ult))) 
                           (MS1 x432 b))) 
                   (forall ((x434 N)) 
                       (=> 
                           (exists ((x435 N)) 
                               (and 
                                   (= x435 p) 
                                   (MS0 x435 x434 urt))) 
                           (MS1 x434 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x436 N)) 
                       (and 
                           (MS0 p x436 f) 
                           (MS1 x436 lft)))) 
               (and 
                   (forall ((x437 N)) 
                       (=> 
                           (exists ((x438 N)) 
                               (and 
                                   (= x438 p) 
                                   (MS0 x438 x437 ult))) 
                           (MS1 x437 b))) 
                   (forall ((x439 N)) 
                       (=> 
                           (exists ((x440 N)) 
                               (and 
                                   (= x440 p) 
                                   (MS0 x440 x439 urt))) 
                           (MS1 x439 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x441 N)) 
                       (and 
                           (MS0 p x441 f) 
                           (MS1 x441 rht)))) 
               (and 
                   (forall ((x442 N)) 
                       (=> 
                           (exists ((x443 N)) 
                               (and 
                                   (= x443 p) 
                                   (MS0 x443 x442 ult))) 
                           (MS1 x442 b))) 
                   (forall ((x444 N)) 
                       (=> 
                           (exists ((x445 N)) 
                               (and 
                                   (= x445 p) 
                                   (MS0 x445 x444 urt))) 
                           (MS1 x444 b))) 
                   (= p t)))
         :named hyp108))
(assert (! (or 
               (not 
                   (forall ((x446 N)) 
                       (=> 
                           (exists ((x447 N)) 
                               (and 
                                   (= x447 p) 
                                   (MS0 x447 x446 vlt))) 
                           (MS1 x446 b)))) 
               (and 
                   (forall ((x448 N)) 
                       (=> 
                           (exists ((x449 N)) 
                               (and 
                                   (= x449 p) 
                                   (MS0 x449 x448 vlt))) 
                           (MS1 x448 b))) 
                   (not 
                       (forall ((x450 N)) 
                           (=> 
                               (exists ((x451 N)) 
                                   (and 
                                       (= x451 p) 
                                       (MS0 x451 x450 vrt))) 
                               (MS1 x450 b))))) 
               (and 
                   (forall ((x452 N)) 
                       (=> 
                           (exists ((x453 N)) 
                               (and 
                                   (= x453 p) 
                                   (MS0 x453 x452 vlt))) 
                           (MS1 x452 b))) 
                   (forall ((x454 N)) 
                       (=> 
                           (exists ((x455 N)) 
                               (and 
                                   (= x455 p) 
                                   (MS0 x455 x454 vrt))) 
                           (MS1 x454 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x456 N)) 
                       (and 
                           (MS0 p x456 h) 
                           (MS1 x456 lft)))) 
               (and 
                   (forall ((x457 N)) 
                       (=> 
                           (exists ((x458 N)) 
                               (and 
                                   (= x458 p) 
                                   (MS0 x458 x457 vlt))) 
                           (MS1 x457 b))) 
                   (forall ((x459 N)) 
                       (=> 
                           (exists ((x460 N)) 
                               (and 
                                   (= x460 p) 
                                   (MS0 x460 x459 vrt))) 
                           (MS1 x459 b))) 
                   (not 
                       (= p t)) 
                   (exists ((x461 N)) 
                       (and 
                           (MS0 p x461 h) 
                           (MS1 x461 rht)))) 
               (and 
                   (forall ((x462 N)) 
                       (=> 
                           (exists ((x463 N)) 
                               (and 
                                   (= x463 p) 
                                   (MS0 x463 x462 vlt))) 
                           (MS1 x462 b))) 
                   (forall ((x464 N)) 
                       (=> 
                           (exists ((x465 N)) 
                               (and 
                                   (= x465 p) 
                                   (MS0 x465 x464 vrt))) 
                           (MS1 x464 b))) 
                   (= p t)))
         :named hyp109))
(assert (! (or 
               (and 
                   (not 
                       (MS0 p nil wlt)) 
                   (not 
                       (exists ((x466 N)) 
                           (and 
                               (MS0 p x466 wlt) 
                               (MS1 x466 b))))) 
               (=> 
                   (not 
                       (MS0 p nil wlt)) 
                   (exists ((x467 N)) 
                       (and 
                           (MS0 p x467 wlt) 
                           (MS1 x467 b)))))
         :named hyp110))
(assert (! (or 
               (not 
                   (forall ((x468 N)) 
                       (=> 
                           (exists ((x469 N)) 
                               (and 
                                   (= x469 p) 
                                   (MS0 x469 x468 lt))) 
                           (exists ((x470 CLR)) 
                               (and 
                                   (= x470 black) 
                                   (clr x468 x470)))))) 
               (and 
                   (forall ((x471 N)) 
                       (=> 
                           (exists ((x472 N)) 
                               (and 
                                   (= x472 p) 
                                   (MS0 x472 x471 lt))) 
                           (exists ((x473 CLR)) 
                               (and 
                                   (= x473 black) 
                                   (clr x471 x473))))) 
                   (not 
                       (forall ((x474 N)) 
                           (=> 
                               (exists ((x475 N)) 
                                   (and 
                                       (= x475 p) 
                                       (MS0 x475 x474 rt))) 
                               (exists ((x476 CLR)) 
                                   (and 
                                       (= x476 black) 
                                       (clr x474 x476))))))) 
               (and 
                   (=> 
                       (and 
                           (forall ((x477 N)) 
                               (=> 
                                   (exists ((x478 N)) 
                                       (and 
                                           (= x478 p) 
                                           (MS0 x478 x477 lt))) 
                                   (exists ((x479 CLR)) 
                                       (and 
                                           (= x479 black) 
                                           (clr x477 x479))))) 
                           (forall ((x480 N)) 
                               (=> 
                                   (exists ((x481 N)) 
                                       (and 
                                           (= x481 p) 
                                           (MS0 x481 x480 rt))) 
                                   (exists ((x482 CLR)) 
                                       (and 
                                           (= x482 black) 
                                           (clr x480 x482))))) 
                           (not 
                               (= p t))) 
                       (and 
                           (exists ((x483 N)) 
                               (MS0 p x483 f)) 
                           (forall ((x484 N) (x485 N) (x486 N)) 
                               (=> 
                                   (and 
                                       (MS0 x484 x485 f) 
                                       (MS0 x484 x486 f)) 
                                   (= x485 x486))))) 
                   (or 
                       (and 
                           (forall ((x487 N)) 
                               (=> 
                                   (exists ((x488 N)) 
                                       (and 
                                           (= x488 p) 
                                           (MS0 x488 x487 lt))) 
                                   (exists ((x489 CLR)) 
                                       (and 
                                           (= x489 black) 
                                           (clr x487 x489))))) 
                           (forall ((x490 N)) 
                               (=> 
                                   (exists ((x491 N)) 
                                       (and 
                                           (= x491 p) 
                                           (MS0 x491 x490 rt))) 
                                   (exists ((x492 CLR)) 
                                       (and 
                                           (= x492 black) 
                                           (clr x490 x492))))) 
                           (not 
                               (= p t)) 
                           (exists ((x493 N)) 
                               (and 
                                   (MS0 p x493 f) 
                                   (MS1 x493 lft)))) 
                       (=> 
                           (and 
                               (forall ((x494 N)) 
                                   (=> 
                                       (exists ((x495 N)) 
                                           (and 
                                               (= x495 p) 
                                               (MS0 x495 x494 lt))) 
                                       (exists ((x496 CLR)) 
                                           (and 
                                               (= x496 black) 
                                               (clr x494 x496))))) 
                               (forall ((x497 N)) 
                                   (=> 
                                       (exists ((x498 N)) 
                                           (and 
                                               (= x498 p) 
                                               (MS0 x498 x497 rt))) 
                                       (exists ((x499 CLR)) 
                                           (and 
                                               (= x499 black) 
                                               (clr x497 x499))))) 
                               (not 
                                   (= p t))) 
                           (and 
                               (exists ((x500 N)) 
                                   (MS0 p x500 f)) 
                               (forall ((x501 N) (x502 N) (x503 N)) 
                                   (=> 
                                       (and 
                                           (MS0 x501 x502 f) 
                                           (MS0 x501 x503 f)) 
                                       (= x502 x503))))))))
         :named hyp111))
(assert (! (or 
               (not 
                   (forall ((x504 N)) 
                       (=> 
                           (exists ((x505 N)) 
                               (and 
                                   (= x505 p) 
                                   (MS0 x505 x504 ult))) 
                           (exists ((x506 CLR)) 
                               (and 
                                   (= x506 black) 
                                   (clr x504 x506)))))) 
               (and 
                   (forall ((x507 N)) 
                       (=> 
                           (exists ((x508 N)) 
                               (and 
                                   (= x508 p) 
                                   (MS0 x508 x507 ult))) 
                           (exists ((x509 CLR)) 
                               (and 
                                   (= x509 black) 
                                   (clr x507 x509))))) 
                   (not 
                       (forall ((x510 N)) 
                           (=> 
                               (exists ((x511 N)) 
                                   (and 
                                       (= x511 p) 
                                       (MS0 x511 x510 urt))) 
                               (exists ((x512 CLR)) 
                                   (and 
                                       (= x512 black) 
                                       (clr x510 x512))))))) 
               (and 
                   (=> 
                       (and 
                           (forall ((x513 N)) 
                               (=> 
                                   (exists ((x514 N)) 
                                       (and 
                                           (= x514 p) 
                                           (MS0 x514 x513 ult))) 
                                   (exists ((x515 CLR)) 
                                       (and 
                                           (= x515 black) 
                                           (clr x513 x515))))) 
                           (forall ((x516 N)) 
                               (=> 
                                   (exists ((x517 N)) 
                                       (and 
                                           (= x517 p) 
                                           (MS0 x517 x516 urt))) 
                                   (exists ((x518 CLR)) 
                                       (and 
                                           (= x518 black) 
                                           (clr x516 x518))))) 
                           (not 
                               (= p t))) 
                       (and 
                           (exists ((x519 N)) 
                               (MS0 p x519 f)) 
                           (forall ((x520 N) (x521 N) (x522 N)) 
                               (=> 
                                   (and 
                                       (MS0 x520 x521 f) 
                                       (MS0 x520 x522 f)) 
                                   (= x521 x522))))) 
                   (or 
                       (and 
                           (forall ((x523 N)) 
                               (=> 
                                   (exists ((x524 N)) 
                                       (and 
                                           (= x524 p) 
                                           (MS0 x524 x523 ult))) 
                                   (exists ((x525 CLR)) 
                                       (and 
                                           (= x525 black) 
                                           (clr x523 x525))))) 
                           (forall ((x526 N)) 
                               (=> 
                                   (exists ((x527 N)) 
                                       (and 
                                           (= x527 p) 
                                           (MS0 x527 x526 urt))) 
                                   (exists ((x528 CLR)) 
                                       (and 
                                           (= x528 black) 
                                           (clr x526 x528))))) 
                           (not 
                               (= p t)) 
                           (exists ((x529 N)) 
                               (and 
                                   (MS0 p x529 f) 
                                   (MS1 x529 lft)))) 
                       (=> 
                           (and 
                               (forall ((x530 N)) 
                                   (=> 
                                       (exists ((x531 N)) 
                                           (and 
                                               (= x531 p) 
                                               (MS0 x531 x530 ult))) 
                                       (exists ((x532 CLR)) 
                                           (and 
                                               (= x532 black) 
                                               (clr x530 x532))))) 
                               (forall ((x533 N)) 
                                   (=> 
                                       (exists ((x534 N)) 
                                           (and 
                                               (= x534 p) 
                                               (MS0 x534 x533 urt))) 
                                       (exists ((x535 CLR)) 
                                           (and 
                                               (= x535 black) 
                                               (clr x533 x535))))) 
                               (not 
                                   (= p t))) 
                           (and 
                               (exists ((x536 N)) 
                                   (MS0 p x536 f)) 
                               (forall ((x537 N) (x538 N) (x539 N)) 
                                   (=> 
                                       (and 
                                           (MS0 x537 x538 f) 
                                           (MS0 x537 x539 f)) 
                                       (= x538 x539))))))))
         :named hyp112))
(assert (! (or 
               (not 
                   (forall ((x540 N)) 
                       (=> 
                           (exists ((x541 N)) 
                               (and 
                                   (= x541 p) 
                                   (MS0 x541 x540 vlt))) 
                           (exists ((x542 CLR)) 
                               (and 
                                   (= x542 black) 
                                   (clr x540 x542)))))) 
               (and 
                   (forall ((x543 N)) 
                       (=> 
                           (exists ((x544 N)) 
                               (and 
                                   (= x544 p) 
                                   (MS0 x544 x543 vlt))) 
                           (exists ((x545 CLR)) 
                               (and 
                                   (= x545 black) 
                                   (clr x543 x545))))) 
                   (not 
                       (forall ((x546 N)) 
                           (=> 
                               (exists ((x547 N)) 
                                   (and 
                                       (= x547 p) 
                                       (MS0 x547 x546 vrt))) 
                               (exists ((x548 CLR)) 
                                   (and 
                                       (= x548 black) 
                                       (clr x546 x548))))))) 
               (and 
                   (=> 
                       (and 
                           (forall ((x549 N)) 
                               (=> 
                                   (exists ((x550 N)) 
                                       (and 
                                           (= x550 p) 
                                           (MS0 x550 x549 vlt))) 
                                   (exists ((x551 CLR)) 
                                       (and 
                                           (= x551 black) 
                                           (clr x549 x551))))) 
                           (forall ((x552 N)) 
                               (=> 
                                   (exists ((x553 N)) 
                                       (and 
                                           (= x553 p) 
                                           (MS0 x553 x552 vrt))) 
                                   (exists ((x554 CLR)) 
                                       (and 
                                           (= x554 black) 
                                           (clr x552 x554))))) 
                           (not 
                               (= p t))) 
                       (and 
                           (exists ((x555 N)) 
                               (MS0 p x555 h)) 
                           (forall ((x556 N) (x557 N) (x558 N)) 
                               (=> 
                                   (and 
                                       (MS0 x556 x557 h) 
                                       (MS0 x556 x558 h)) 
                                   (= x557 x558))))) 
                   (or 
                       (and 
                           (forall ((x559 N)) 
                               (=> 
                                   (exists ((x560 N)) 
                                       (and 
                                           (= x560 p) 
                                           (MS0 x560 x559 vlt))) 
                                   (exists ((x561 CLR)) 
                                       (and 
                                           (= x561 black) 
                                           (clr x559 x561))))) 
                           (forall ((x562 N)) 
                               (=> 
                                   (exists ((x563 N)) 
                                       (and 
                                           (= x563 p) 
                                           (MS0 x563 x562 vrt))) 
                                   (exists ((x564 CLR)) 
                                       (and 
                                           (= x564 black) 
                                           (clr x562 x564))))) 
                           (not 
                               (= p t)) 
                           (exists ((x565 N)) 
                               (and 
                                   (MS0 p x565 h) 
                                   (MS1 x565 lft)))) 
                       (=> 
                           (and 
                               (forall ((x566 N)) 
                                   (=> 
                                       (exists ((x567 N)) 
                                           (and 
                                               (= x567 p) 
                                               (MS0 x567 x566 vlt))) 
                                       (exists ((x568 CLR)) 
                                           (and 
                                               (= x568 black) 
                                               (clr x566 x568))))) 
                               (forall ((x569 N)) 
                                   (=> 
                                       (exists ((x570 N)) 
                                           (and 
                                               (= x570 p) 
                                               (MS0 x570 x569 vrt))) 
                                       (exists ((x571 CLR)) 
                                           (and 
                                               (= x571 black) 
                                               (clr x569 x571))))) 
                               (not 
                                   (= p t))) 
                           (and 
                               (exists ((x572 N)) 
                                   (MS0 p x572 h)) 
                               (forall ((x573 N) (x574 N) (x575 N)) 
                                   (=> 
                                       (and 
                                           (MS0 x573 x574 h) 
                                           (MS0 x573 x575 h)) 
                                       (= x574 x575))))))))
         :named hyp113))
(assert (! (not 
               (exists ((x576 CLR)) 
                   (and 
                       (= x576 black) 
                       (exists ((x577 N)) 
                           (and 
                               (MS0 p x577 wrt) 
                               (clr x577 x576))))))
         :named hyp114))
(assert (! (or 
               (and 
                   (not 
                       (forall ((x578 N)) 
                           (=> 
                               (exists ((x579 N)) 
                                   (and 
                                       (= x579 p) 
                                       (MS0 x579 x578 g))) 
                               (exists ((x580 CLR)) 
                                   (and 
                                       (= x580 black) 
                                       (clr x578 x580)))))) 
                   (exists ((y2 N)) 
                       (and 
                           (MS0 p y2 g) 
                           (not 
                               (exists ((x581 CLR)) 
                                   (and 
                                       (= x581 black) 
                                       (clr y2 x581))))))) 
               (and 
                   (forall ((x582 N)) 
                       (=> 
                           (exists ((x583 N)) 
                               (and 
                                   (= x583 p) 
                                   (MS0 x583 x582 g))) 
                           (exists ((x584 CLR)) 
                               (and 
                                   (= x584 black) 
                                   (clr x582 x584))))) 
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x585 N)) 
                       (=> 
                           (exists ((x586 N)) 
                               (and 
                                   (= x586 p) 
                                   (MS0 x586 x585 g))) 
                           (exists ((x587 CLR)) 
                               (and 
                                   (= x587 black) 
                                   (clr x585 x587))))) 
                   (= p t)))
         :named hyp115))
(assert (! (or 
               (not 
                   (forall ((x588 N)) 
                       (=> 
                           (exists ((x589 N)) 
                               (and 
                                   (= x589 p) 
                                   (MS0 x589 x588 lt))) 
                           (exists ((x590 CLR)) 
                               (and 
                                   (= x590 black) 
                                   (clr x588 x590)))))) 
               (and 
                   (forall ((x591 N)) 
                       (=> 
                           (exists ((x592 N)) 
                               (and 
                                   (= x592 p) 
                                   (MS0 x592 x591 lt))) 
                           (exists ((x593 CLR)) 
                               (and 
                                   (= x593 black) 
                                   (clr x591 x593))))) 
                   (not 
                       (forall ((x594 N)) 
                           (=> 
                               (exists ((x595 N)) 
                                   (and 
                                       (= x595 p) 
                                       (MS0 x595 x594 rt))) 
                               (exists ((x596 CLR)) 
                                   (and 
                                       (= x596 black) 
                                       (clr x594 x596))))))) 
               (and 
                   (forall ((x597 N)) 
                       (=> 
                           (exists ((x598 N)) 
                               (and 
                                   (= x598 p) 
                                   (MS0 x598 x597 lt))) 
                           (exists ((x599 CLR)) 
                               (and 
                                   (= x599 black) 
                                   (clr x597 x599))))) 
                   (forall ((x600 N)) 
                       (=> 
                           (exists ((x601 N)) 
                               (and 
                                   (= x601 p) 
                                   (MS0 x601 x600 rt))) 
                           (exists ((x602 CLR)) 
                               (and 
                                   (= x602 black) 
                                   (clr x600 x602))))) 
                   (not 
                       (= p t))) 
               (and 
                   (forall ((x603 N)) 
                       (=> 
                           (exists ((x604 N)) 
                               (and 
                                   (= x604 p) 
                                   (MS0 x604 x603 lt))) 
                           (exists ((x605 CLR)) 
                               (and 
                                   (= x605 black) 
                                   (clr x603 x605))))) 
                   (forall ((x606 N)) 
                       (=> 
                           (exists ((x607 N)) 
                               (and 
                                   (= x607 p) 
                                   (MS0 x607 x606 rt))) 
                           (exists ((x608 CLR)) 
                               (and 
                                   (= x608 black) 
                                   (clr x606 x608))))) 
                   (= p t)))
         :named hyp116))
(assert (! (or 
               (not 
                   (forall ((x609 N)) 
                       (=> 
                           (exists ((x610 N)) 
                               (and 
                                   (= x610 p) 
                                   (MS0 x610 x609 lt))) 
                           (exists ((x611 CLR)) 
                               (and 
                                   (= x611 black) 
                                   (clr x609 x611)))))) 
               (and 
                   (forall ((x612 N)) 
                       (=> 
                           (exists ((x613 N)) 
                               (and 
                                   (= x613 p) 
                                   (MS0 x613 x612 lt))) 
                           (exists ((x614 CLR)) 
                               (and 
                                   (= x614 black) 
                                   (clr x612 x614))))) 
                   (not 
                       (forall ((x615 N)) 
                           (=> 
                               (exists ((x616 N)) 
                                   (and 
                                       (= x616 p) 
                                       (MS0 x616 x615 rt))) 
                               (exists ((x617 CLR)) 
                                   (and 
                                       (= x617 black) 
                                       (clr x615 x617))))))) 
               (and 
                   (forall ((x618 N)) 
                       (=> 
                           (exists ((x619 N)) 
                               (and 
                                   (= x619 p) 
                                   (MS0 x619 x618 lt))) 
                           (exists ((x620 CLR)) 
                               (and 
                                   (= x620 black) 
                                   (clr x618 x620))))) 
                   (forall ((x621 N)) 
                       (=> 
                           (exists ((x622 N)) 
                               (and 
                                   (= x622 p) 
                                   (MS0 x622 x621 rt))) 
                           (exists ((x623 CLR)) 
                               (and 
                                   (= x623 black) 
                                   (clr x621 x623))))) 
                   (not 
                       (= p t)) 
                   (exists ((x624 N)) 
                       (and 
                           (MS0 p x624 f) 
                           (MS1 x624 lft)))) 
               (and 
                   (forall ((x625 N)) 
                       (=> 
                           (exists ((x626 N)) 
                               (and 
                                   (= x626 p) 
                                   (MS0 x626 x625 lt))) 
                           (exists ((x627 CLR)) 
                               (and 
                                   (= x627 black) 
                                   (clr x625 x627))))) 
                   (forall ((x628 N)) 
                       (=> 
                           (exists ((x629 N)) 
                               (and 
                                   (= x629 p) 
                                   (MS0 x629 x628 rt))) 
                           (exists ((x630 CLR)) 
                               (and 
                                   (= x630 black) 
                                   (clr x628 x630))))) 
                   (not 
                       (= p t)) 
                   (exists ((x631 N)) 
                       (and 
                           (MS0 p x631 f) 
                           (MS1 x631 rht)))) 
               (and 
                   (forall ((x632 N)) 
                       (=> 
                           (exists ((x633 N)) 
                               (and 
                                   (= x633 p) 
                                   (MS0 x633 x632 lt))) 
                           (exists ((x634 CLR)) 
                               (and 
                                   (= x634 black) 
                                   (clr x632 x634))))) 
                   (forall ((x635 N)) 
                       (=> 
                           (exists ((x636 N)) 
                               (and 
                                   (= x636 p) 
                                   (MS0 x636 x635 rt))) 
                           (exists ((x637 CLR)) 
                               (and 
                                   (= x637 black) 
                                   (clr x635 x637))))) 
                   (= p t)))
         :named hyp117))
(assert (! (or 
               (not 
                   (forall ((x638 N)) 
                       (=> 
                           (exists ((x639 N)) 
                               (and 
                                   (= x639 p) 
                                   (MS0 x639 x638 ult))) 
                           (exists ((x640 CLR)) 
                               (and 
                                   (= x640 black) 
                                   (clr x638 x640)))))) 
               (and 
                   (forall ((x641 N)) 
                       (=> 
                           (exists ((x642 N)) 
                               (and 
                                   (= x642 p) 
                                   (MS0 x642 x641 ult))) 
                           (exists ((x643 CLR)) 
                               (and 
                                   (= x643 black) 
                                   (clr x641 x643))))) 
                   (not 
                       (forall ((x644 N)) 
                           (=> 
                               (exists ((x645 N)) 
                                   (and 
                                       (= x645 p) 
                                       (MS0 x645 x644 urt))) 
                               (exists ((x646 CLR)) 
                                   (and 
                                       (= x646 black) 
                                       (clr x644 x646))))))) 
               (and 
                   (forall ((x647 N)) 
                       (=> 
                           (exists ((x648 N)) 
                               (and 
                                   (= x648 p) 
                                   (MS0 x648 x647 ult))) 
                           (exists ((x649 CLR)) 
                               (and 
                                   (= x649 black) 
                                   (clr x647 x649))))) 
                   (forall ((x650 N)) 
                       (=> 
                           (exists ((x651 N)) 
                               (and 
                                   (= x651 p) 
                                   (MS0 x651 x650 urt))) 
                           (exists ((x652 CLR)) 
                               (and 
                                   (= x652 black) 
                                   (clr x650 x652))))) 
                   (not 
                       (= p t)) 
                   (exists ((x653 N)) 
                       (and 
                           (MS0 p x653 f) 
                           (MS1 x653 lft)))) 
               (and 
                   (forall ((x654 N)) 
                       (=> 
                           (exists ((x655 N)) 
                               (and 
                                   (= x655 p) 
                                   (MS0 x655 x654 ult))) 
                           (exists ((x656 CLR)) 
                               (and 
                                   (= x656 black) 
                                   (clr x654 x656))))) 
                   (forall ((x657 N)) 
                       (=> 
                           (exists ((x658 N)) 
                               (and 
                                   (= x658 p) 
                                   (MS0 x658 x657 urt))) 
                           (exists ((x659 CLR)) 
                               (and 
                                   (= x659 black) 
                                   (clr x657 x659))))) 
                   (not 
                       (= p t)) 
                   (exists ((x660 N)) 
                       (and 
                           (MS0 p x660 f) 
                           (MS1 x660 rht)))) 
               (and 
                   (forall ((x661 N)) 
                       (=> 
                           (exists ((x662 N)) 
                               (and 
                                   (= x662 p) 
                                   (MS0 x662 x661 ult))) 
                           (exists ((x663 CLR)) 
                               (and 
                                   (= x663 black) 
                                   (clr x661 x663))))) 
                   (forall ((x664 N)) 
                       (=> 
                           (exists ((x665 N)) 
                               (and 
                                   (= x665 p) 
                                   (MS0 x665 x664 urt))) 
                           (exists ((x666 CLR)) 
                               (and 
                                   (= x666 black) 
                                   (clr x664 x666))))) 
                   (= p t)))
         :named hyp118))
(assert (! (or 
               (not 
                   (forall ((x667 N)) 
                       (=> 
                           (exists ((x668 N)) 
                               (and 
                                   (= x668 p) 
                                   (MS0 x668 x667 vlt))) 
                           (exists ((x669 CLR)) 
                               (and 
                                   (= x669 black) 
                                   (clr x667 x669)))))) 
               (and 
                   (forall ((x670 N)) 
                       (=> 
                           (exists ((x671 N)) 
                               (and 
                                   (= x671 p) 
                                   (MS0 x671 x670 vlt))) 
                           (exists ((x672 CLR)) 
                               (and 
                                   (= x672 black) 
                                   (clr x670 x672))))) 
                   (not 
                       (forall ((x673 N)) 
                           (=> 
                               (exists ((x674 N)) 
                                   (and 
                                       (= x674 p) 
                                       (MS0 x674 x673 vrt))) 
                               (exists ((x675 CLR)) 
                                   (and 
                                       (= x675 black) 
                                       (clr x673 x675))))))) 
               (and 
                   (forall ((x676 N)) 
                       (=> 
                           (exists ((x677 N)) 
                               (and 
                                   (= x677 p) 
                                   (MS0 x677 x676 vlt))) 
                           (exists ((x678 CLR)) 
                               (and 
                                   (= x678 black) 
                                   (clr x676 x678))))) 
                   (forall ((x679 N)) 
                       (=> 
                           (exists ((x680 N)) 
                               (and 
                                   (= x680 p) 
                                   (MS0 x680 x679 vrt))) 
                           (exists ((x681 CLR)) 
                               (and 
                                   (= x681 black) 
                                   (clr x679 x681))))) 
                   (not 
                       (= p t)) 
                   (exists ((x682 N)) 
                       (and 
                           (MS0 p x682 h) 
                           (MS1 x682 lft)))) 
               (and 
                   (forall ((x683 N)) 
                       (=> 
                           (exists ((x684 N)) 
                               (and 
                                   (= x684 p) 
                                   (MS0 x684 x683 vlt))) 
                           (exists ((x685 CLR)) 
                               (and 
                                   (= x685 black) 
                                   (clr x683 x685))))) 
                   (forall ((x686 N)) 
                       (=> 
                           (exists ((x687 N)) 
                               (and 
                                   (= x687 p) 
                                   (MS0 x687 x686 vrt))) 
                           (exists ((x688 CLR)) 
                               (and 
                                   (= x688 black) 
                                   (clr x686 x688))))) 
                   (not 
                       (= p t)) 
                   (exists ((x689 N)) 
                       (and 
                           (MS0 p x689 h) 
                           (MS1 x689 rht)))) 
               (and 
                   (forall ((x690 N)) 
                       (=> 
                           (exists ((x691 N)) 
                               (and 
                                   (= x691 p) 
                                   (MS0 x691 x690 vlt))) 
                           (exists ((x692 CLR)) 
                               (and 
                                   (= x692 black) 
                                   (clr x690 x692))))) 
                   (forall ((x693 N)) 
                       (=> 
                           (exists ((x694 N)) 
                               (and 
                                   (= x694 p) 
                                   (MS0 x694 x693 vrt))) 
                           (exists ((x695 CLR)) 
                               (and 
                                   (= x695 black) 
                                   (clr x693 x695))))) 
                   (= p t)))
         :named hyp119))
(assert (! (or 
               (and 
                   (not 
                       (MS0 p nil wlt)) 
                   (not 
                       (exists ((x696 CLR)) 
                           (and 
                               (= x696 black) 
                               (exists ((x697 N)) 
                                   (and 
                                       (MS0 p x697 wlt) 
                                       (clr x697 x696))))))) 
               (=> 
                   (not 
                       (MS0 p nil wlt)) 
                   (exists ((x698 CLR)) 
                       (and 
                           (= x698 black) 
                           (exists ((x699 N)) 
                               (and 
                                   (MS0 p x699 wlt) 
                                   (clr x699 x698)))))))
         :named hyp120))
(assert (! (not 
               (and 
                   (forall ((x700 N) (x701 CLR) (x702 CLR)) 
                       (=> 
                           (and 
                               (or 
                                   (and 
                                       (clr x700 x701) 
                                       (not 
                                           (exists ((x703 CLR)) 
                                               (and 
                                                   (MS0 p x700 wrt) 
                                                   (= x703 black))))) 
                                   (and 
                                       (MS0 p x700 wrt) 
                                       (= x701 black))) 
                               (or 
                                   (and 
                                       (clr x700 x702) 
                                       (not 
                                           (exists ((x704 CLR)) 
                                               (and 
                                                   (MS0 p x700 wrt) 
                                                   (= x704 black))))) 
                                   (and 
                                       (MS0 p x700 wrt) 
                                       (= x702 black)))) 
                           (= x701 x702))) 
                   (forall ((x705 N)) 
                       (or 
                           (exists ((x706 CLR)) 
                               (and 
                                   (clr x705 x706) 
                                   (not 
                                       (exists ((x707 CLR)) 
                                           (and 
                                               (MS0 p x705 wrt) 
                                               (= x707 black)))))) 
                           (exists ((x708 CLR)) 
                               (and 
                                   (MS0 p x705 wrt) 
                                   (= x708 black)))))))
         :named goal))
(check-sat)
(exit)

