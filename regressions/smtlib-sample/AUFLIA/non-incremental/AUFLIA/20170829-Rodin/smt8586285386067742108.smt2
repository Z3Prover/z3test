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
(assert (forall ((x208 N) (x209 N)) 
            (exists ((X PNN)) 
                (and 
                    (MS0 x208 x209 X) 
                    (forall ((y2 N) (y3 N)) 
                        (=> 
                            (MS0 y2 y3 X) 
                            (and 
                                (= y2 x208) 
                                (= y3 x209))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x210 N) (x211 Int)) 
            (exists ((X0 PNZ)) 
                (and 
                    (MS x210 x211 X0) 
                    (forall ((y4 N) (y5 Int)) 
                        (=> 
                            (MS y4 y5 X0) 
                            (and 
                                (= y4 x210) 
                                (= y5 x211))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x212 N)) 
            (exists ((X1 PN)) 
                (and 
                    (MS1 x212 X1) 
                    (forall ((y6 N)) 
                        (=> 
                            (MS1 y6 X1) 
                            (= y6 x212)))))))
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
(assert (! (forall ((x63 N) (x64 N)) 
               (= 
                   (MS0 x63 x64 ult) 
                   (or 
                       (and 
                           (MS0 x63 x64 lt) 
                           (not 
                               (MS1 x63 lft))) 
                       (and 
                           (MS0 x63 x64 f) 
                           (MS1 x63 lft)))))
         :named hyp21))
(assert (! (forall ((x65 N) (x66 N) (x67 N)) 
               (=> 
                   (and 
                       (MS0 x65 x66 ult) 
                       (MS0 x65 x67 ult)) 
                   (= x66 x67)))
         :named hyp22))
(assert (! (forall ((x68 N) (x69 N)) 
               (= 
                   (MS0 x68 x69 urt) 
                   (or 
                       (and 
                           (MS0 x68 x69 rt) 
                           (not 
                               (MS1 x68 rht))) 
                       (and 
                           (MS0 x68 x69 f) 
                           (MS1 x68 rht)))))
         :named hyp23))
(assert (! (forall ((x70 N) (x71 N) (x72 N)) 
               (=> 
                   (and 
                       (MS0 x70 x71 urt) 
                       (MS0 x70 x72 urt)) 
                   (= x71 x72)))
         :named hyp24))
(assert (! (forall ((x73 N) (x74 N)) 
               (= 
                   (MS0 x73 x74 h) 
                   (and 
                       (MS0 x73 x74 f) 
                       (= x73 p))))
         :named hyp25))
(assert (! (= n ko)
         :named hyp26))
(assert (! (forall ((x75 N)) 
               (=> 
                   (exists ((x76 N)) 
                       (and 
                           (= x76 p) 
                           (or 
                               (MS0 x76 x75 ult) 
                               (MS0 x76 x75 urt)))) 
                   (MS1 x75 b)))
         :named hyp27))
(assert (! (forall ((x77 N) (x78 N) (x79 N)) 
               (=> 
                   (and 
                       (MS0 x77 x78 h) 
                       (MS0 x77 x79 h)) 
                   (= x78 x79)))
         :named hyp28))
(assert (! (exists ((x80 N)) 
               (and 
                   (MS0 p x80 h) 
                   (MS1 x80 lft)))
         :named hyp29))
(assert (! (exists ((x81 N)) 
               (MS0 p x81 h))
         :named hyp30))
(assert (! (forall ((x82 K)) 
               (or 
                   (= x82 ok) 
                   (= x82 ko)))
         :named hyp31))
(assert (! (not 
               (= ok ko))
         :named hyp32))
(assert (! (not 
               (or 
                   (exists ((x83 N)) 
                       (MS0 nil x83 lt)) 
                   (exists ((x84 N)) 
                       (MS0 nil x84 rt))))
         :named hyp33))
(assert (! (not 
               (or 
                   (exists ((x85 N)) 
                       (MS0 x85 nil lt)) 
                   (exists ((x86 N)) 
                       (MS0 x86 nil rt))))
         :named hyp34))
(assert (! (or 
               (forall ((x87 N)) 
                   (=> 
                       (exists ((x88 N)) 
                           (and 
                               (MS1 x88 b) 
                               (MS0 x88 x87 g))) 
                       (MS1 x87 b))) 
               (and 
                   (not 
                       (forall ((x89 N)) 
                           (=> 
                               (exists ((x90 N)) 
                                   (and 
                                       (MS1 x90 b) 
                                       (MS0 x90 x89 g))) 
                               (MS1 x89 b)))) 
                   (exists ((x91 N) (y N)) 
                       (and 
                           (MS0 x91 y g) 
                           (MS1 x91 b) 
                           (not 
                               (MS1 y b))))))
         :named hyp35))
(assert (! (not 
               (MS1 p lft))
         :named hyp36))
(assert (! (not 
               (MS1 p rht))
         :named hyp37))
(assert (! (not 
               (= p t))
         :named hyp38))
(assert (! (exists ((x92 N)) 
               (MS0 p x92 f))
         :named hyp39))
(assert (! (=> 
               (MS0 p t f) 
               (forall ((x93 N) (x94 N)) 
                   (= 
                       (MS0 x93 x94 f) 
                       (and 
                           (= x93 p) 
                           (= x94 t)))))
         :named hyp40))
(assert (! (forall ((x95 N) (x96 N) (x97 N)) 
               (=> 
                   (and 
                       (MS0 x95 x96 f) 
                       (MS0 x95 x97 f)) 
                   (= x96 x97)))
         :named hyp41))
(assert (! (or 
               (exists ((x98 N)) 
                   (and 
                       (MS0 p x98 h) 
                       (MS1 x98 lft))) 
               (exists ((x99 N)) 
                   (and 
                       (MS0 p x99 h) 
                       (MS1 x99 rht))))
         :named hyp42))
(assert (! (not 
               (= n ok))
         :named hyp43))
(assert (! (not 
               (forall ((x100 N) (x101 N)) 
                   (not 
                       (MS0 x100 x101 f))))
         :named hyp44))
(assert (! (or 
               (and 
                   (not 
                       (forall ((x102 N)) 
                           (=> 
                               (exists ((x103 N)) 
                                   (and 
                                       (= x103 p) 
                                       (MS0 x103 x102 g))) 
                               (MS1 x102 b)))) 
                   (exists ((y0 N)) 
                       (and 
                           (MS0 p y0 g) 
                           (not 
                               (MS1 y0 b))))) 
               (forall ((x104 N)) 
                   (=> 
                       (exists ((x105 N)) 
                           (and 
                               (= x105 p) 
                               (MS0 x105 x104 g))) 
                       (MS1 x104 b))))
         :named hyp45))
(assert (! (or 
               (not 
                   (forall ((x106 N)) 
                       (=> 
                           (exists ((x107 N)) 
                               (and 
                                   (= x107 p) 
                                   (MS0 x107 x106 lt))) 
                           (MS1 x106 b)))) 
               (and 
                   (forall ((x108 N)) 
                       (=> 
                           (exists ((x109 N)) 
                               (and 
                                   (= x109 p) 
                                   (MS0 x109 x108 lt))) 
                           (MS1 x108 b))) 
                   (not 
                       (forall ((x110 N)) 
                           (=> 
                               (exists ((x111 N)) 
                                   (and 
                                       (= x111 p) 
                                       (MS0 x111 x110 rt))) 
                               (MS1 x110 b))))) 
               (and 
                   (forall ((x112 N)) 
                       (=> 
                           (exists ((x113 N)) 
                               (and 
                                   (= x113 p) 
                                   (MS0 x113 x112 lt))) 
                           (MS1 x112 b))) 
                   (forall ((x114 N)) 
                       (=> 
                           (exists ((x115 N)) 
                               (and 
                                   (= x115 p) 
                                   (MS0 x115 x114 rt))) 
                           (MS1 x114 b)))))
         :named hyp46))
(assert (! (forall ((x116 N)) 
               (=> 
                   (exists ((x117 N)) 
                       (and 
                           (= x117 p) 
                           (or 
                               (and 
                                   (MS0 x117 x116 lt) 
                                   (not 
                                       (MS1 x117 lft))) 
                               (and 
                                   (MS0 x117 x116 f) 
                                   (MS1 x117 lft)) 
                               (MS0 x117 x116 urt)))) 
                   (MS1 x116 b)))
         :named hyp47))
(assert (! (or 
               (and 
                   (not 
                       (forall ((x118 N)) 
                           (=> 
                               (exists ((x119 N)) 
                                   (and 
                                       (= x119 p) 
                                       (or 
                                           (MS0 x119 x118 lt) 
                                           (MS0 x119 x118 rt)))) 
                               (MS1 x118 b)))) 
                   (exists ((y1 N)) 
                       (and 
                           (or 
                               (MS0 p y1 lt) 
                               (MS0 p y1 rt)) 
                           (not 
                               (MS1 y1 b))))) 
               (forall ((x120 N)) 
                   (=> 
                       (exists ((x121 N)) 
                           (and 
                               (= x121 p) 
                               (or 
                                   (MS0 x121 x120 lt) 
                                   (MS0 x121 x120 rt)))) 
                       (MS1 x120 b))))
         :named hyp48))
(assert (! (forall ((x122 N)) 
               (=> 
                   (exists ((x123 N)) 
                       (and 
                           (= x123 p) 
                           (or 
                               (and 
                                   (MS0 x123 x122 lt) 
                                   (not 
                                       (MS1 x123 lft))) 
                               (and 
                                   (MS0 x123 x122 f) 
                                   (MS1 x123 lft)) 
                               (and 
                                   (MS0 x123 x122 rt) 
                                   (not 
                                       (MS1 x123 rht))) 
                               (and 
                                   (MS0 x123 x122 f) 
                                   (MS1 x123 rht))))) 
                   (MS1 x122 b)))
         :named hyp49))
(assert (! (forall ((x124 N) (x125 N) (x126 N)) 
               (=> 
                   (and 
                       (MS0 x124 x125 f) 
                       (= x124 p) 
                       (MS0 x124 x126 f)) 
                   (= x125 x126)))
         :named hyp50))
(assert (! (exists ((x127 N)) 
               (and 
                   (MS0 p x127 f) 
                   (MS1 x127 lft)))
         :named hyp51))
(assert (! (or 
               (exists ((x128 N)) 
                   (and 
                       (MS0 p x128 f) 
                       (MS1 x128 lft))) 
               (exists ((x129 N)) 
                   (and 
                       (MS0 p x129 f) 
                       (MS1 x129 rht))))
         :named hyp52))
(assert (! (or 
               (not 
                   (forall ((x130 N)) 
                       (=> 
                           (exists ((x131 N)) 
                               (and 
                                   (= x131 p) 
                                   (MS0 x131 x130 lt))) 
                           (MS1 x130 b)))) 
               (and 
                   (forall ((x132 N)) 
                       (=> 
                           (exists ((x133 N)) 
                               (and 
                                   (= x133 p) 
                                   (MS0 x133 x132 lt))) 
                           (MS1 x132 b))) 
                   (not 
                       (forall ((x134 N)) 
                           (=> 
                               (exists ((x135 N)) 
                                   (and 
                                       (= x135 p) 
                                       (MS0 x135 x134 rt))) 
                               (MS1 x134 b))))) 
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
                           (MS1 x138 b)))) 
               (and 
                   (forall ((x140 N)) 
                       (=> 
                           (exists ((x141 N)) 
                               (and 
                                   (= x141 p) 
                                   (MS0 x141 x140 lt))) 
                           (MS1 x140 b))) 
                   (forall ((x142 N)) 
                       (=> 
                           (exists ((x143 N)) 
                               (and 
                                   (= x143 p) 
                                   (MS0 x143 x142 rt))) 
                           (MS1 x142 b))) 
                   (exists ((x144 N)) 
                       (and 
                           (MS0 p x144 f) 
                           (MS1 x144 rht)))))
         :named hyp53))
(assert (! (or 
               (not 
                   (forall ((x145 N)) 
                       (=> 
                           (exists ((x146 N)) 
                               (and 
                                   (= x146 p) 
                                   (MS0 x146 x145 ult))) 
                           (MS1 x145 b)))) 
               (and 
                   (forall ((x147 N)) 
                       (=> 
                           (exists ((x148 N)) 
                               (and 
                                   (= x148 p) 
                                   (MS0 x148 x147 ult))) 
                           (MS1 x147 b))) 
                   (not 
                       (forall ((x149 N)) 
                           (=> 
                               (exists ((x150 N)) 
                                   (and 
                                       (= x150 p) 
                                       (MS0 x150 x149 urt))) 
                               (MS1 x149 b))))) 
               (and 
                   (forall ((x151 N)) 
                       (=> 
                           (exists ((x152 N)) 
                               (and 
                                   (= x152 p) 
                                   (MS0 x152 x151 ult))) 
                           (MS1 x151 b))) 
                   (forall ((x153 N)) 
                       (=> 
                           (exists ((x154 N)) 
                               (and 
                                   (= x154 p) 
                                   (MS0 x154 x153 urt))) 
                           (MS1 x153 b)))) 
               (and 
                   (forall ((x155 N)) 
                       (=> 
                           (exists ((x156 N)) 
                               (and 
                                   (= x156 p) 
                                   (MS0 x156 x155 ult))) 
                           (MS1 x155 b))) 
                   (forall ((x157 N)) 
                       (=> 
                           (exists ((x158 N)) 
                               (and 
                                   (= x158 p) 
                                   (MS0 x158 x157 urt))) 
                           (MS1 x157 b))) 
                   (exists ((x159 N)) 
                       (and 
                           (MS0 p x159 f) 
                           (MS1 x159 rht)))))
         :named hyp54))
(assert (! (or 
               (not 
                   (forall ((x160 N)) 
                       (=> 
                           (exists ((x161 N)) 
                               (and 
                                   (= x161 p) 
                                   (or 
                                       (and 
                                           (MS0 x161 x160 lt) 
                                           (not 
                                               (MS1 x161 lft))) 
                                       (and 
                                           (MS0 x161 x160 f) 
                                           (MS1 x161 lft))))) 
                           (MS1 x160 b)))) 
               (and 
                   (forall ((x162 N)) 
                       (=> 
                           (exists ((x163 N)) 
                               (and 
                                   (= x163 p) 
                                   (or 
                                       (and 
                                           (MS0 x163 x162 lt) 
                                           (not 
                                               (MS1 x163 lft))) 
                                       (and 
                                           (MS0 x163 x162 f) 
                                           (MS1 x163 lft))))) 
                           (MS1 x162 b))) 
                   (not 
                       (forall ((x164 N)) 
                           (=> 
                               (exists ((x165 N)) 
                                   (and 
                                       (= x165 p) 
                                       (MS0 x165 x164 urt))) 
                               (MS1 x164 b))))) 
               (and 
                   (forall ((x166 N)) 
                       (=> 
                           (exists ((x167 N)) 
                               (and 
                                   (= x167 p) 
                                   (or 
                                       (and 
                                           (MS0 x167 x166 lt) 
                                           (not 
                                               (MS1 x167 lft))) 
                                       (and 
                                           (MS0 x167 x166 f) 
                                           (MS1 x167 lft))))) 
                           (MS1 x166 b))) 
                   (forall ((x168 N)) 
                       (=> 
                           (exists ((x169 N)) 
                               (and 
                                   (= x169 p) 
                                   (MS0 x169 x168 urt))) 
                           (MS1 x168 b)))) 
               (and 
                   (forall ((x170 N)) 
                       (=> 
                           (exists ((x171 N)) 
                               (and 
                                   (= x171 p) 
                                   (or 
                                       (and 
                                           (MS0 x171 x170 lt) 
                                           (not 
                                               (MS1 x171 lft))) 
                                       (and 
                                           (MS0 x171 x170 f) 
                                           (MS1 x171 lft))))) 
                           (MS1 x170 b))) 
                   (forall ((x172 N)) 
                       (=> 
                           (exists ((x173 N)) 
                               (and 
                                   (= x173 p) 
                                   (MS0 x173 x172 urt))) 
                           (MS1 x172 b))) 
                   (exists ((x174 N)) 
                       (and 
                           (MS0 p x174 f) 
                           (MS1 x174 rht)))))
         :named hyp55))
(assert (! (or 
               (not 
                   (forall ((x175 N)) 
                       (=> 
                           (exists ((x176 N)) 
                               (and 
                                   (= x176 p) 
                                   (or 
                                       (and 
                                           (MS0 x176 x175 lt) 
                                           (not 
                                               (MS1 x176 lft))) 
                                       (and 
                                           (MS0 x176 x175 f) 
                                           (MS1 x176 lft))))) 
                           (MS1 x175 b)))) 
               (and 
                   (forall ((x177 N)) 
                       (=> 
                           (exists ((x178 N)) 
                               (and 
                                   (= x178 p) 
                                   (or 
                                       (and 
                                           (MS0 x178 x177 lt) 
                                           (not 
                                               (MS1 x178 lft))) 
                                       (and 
                                           (MS0 x178 x177 f) 
                                           (MS1 x178 lft))))) 
                           (MS1 x177 b))) 
                   (not 
                       (forall ((x179 N)) 
                           (=> 
                               (exists ((x180 N)) 
                                   (and 
                                       (= x180 p) 
                                       (or 
                                           (and 
                                               (MS0 x180 x179 rt) 
                                               (not 
                                                   (MS1 x180 rht))) 
                                           (and 
                                               (MS0 x180 x179 f) 
                                               (MS1 x180 rht))))) 
                               (MS1 x179 b))))) 
               (and 
                   (forall ((x181 N)) 
                       (=> 
                           (exists ((x182 N)) 
                               (and 
                                   (= x182 p) 
                                   (or 
                                       (and 
                                           (MS0 x182 x181 lt) 
                                           (not 
                                               (MS1 x182 lft))) 
                                       (and 
                                           (MS0 x182 x181 f) 
                                           (MS1 x182 lft))))) 
                           (MS1 x181 b))) 
                   (forall ((x183 N)) 
                       (=> 
                           (exists ((x184 N)) 
                               (and 
                                   (= x184 p) 
                                   (or 
                                       (and 
                                           (MS0 x184 x183 rt) 
                                           (not 
                                               (MS1 x184 rht))) 
                                       (and 
                                           (MS0 x184 x183 f) 
                                           (MS1 x184 rht))))) 
                           (MS1 x183 b)))) 
               (and 
                   (forall ((x185 N)) 
                       (=> 
                           (exists ((x186 N)) 
                               (and 
                                   (= x186 p) 
                                   (or 
                                       (and 
                                           (MS0 x186 x185 lt) 
                                           (not 
                                               (MS1 x186 lft))) 
                                       (and 
                                           (MS0 x186 x185 f) 
                                           (MS1 x186 lft))))) 
                           (MS1 x185 b))) 
                   (forall ((x187 N)) 
                       (=> 
                           (exists ((x188 N)) 
                               (and 
                                   (= x188 p) 
                                   (or 
                                       (and 
                                           (MS0 x188 x187 rt) 
                                           (not 
                                               (MS1 x188 rht))) 
                                       (and 
                                           (MS0 x188 x187 f) 
                                           (MS1 x188 rht))))) 
                           (MS1 x187 b))) 
                   (exists ((x189 N)) 
                       (and 
                           (MS0 p x189 f) 
                           (MS1 x189 rht)))))
         :named hyp56))
(assert (! (or 
               (not 
                   (forall ((x190 N)) 
                       (=> 
                           (exists ((x191 N)) 
                               (and 
                                   (= x191 p) 
                                   (MS0 x191 x190 ult))) 
                           (MS1 x190 b)))) 
               (and 
                   (forall ((x192 N)) 
                       (=> 
                           (exists ((x193 N)) 
                               (and 
                                   (= x193 p) 
                                   (MS0 x193 x192 ult))) 
                           (MS1 x192 b))) 
                   (not 
                       (forall ((x194 N)) 
                           (=> 
                               (exists ((x195 N)) 
                                   (and 
                                       (= x195 p) 
                                       (or 
                                           (and 
                                               (MS0 x195 x194 rt) 
                                               (not 
                                                   (MS1 x195 rht))) 
                                           (and 
                                               (MS0 x195 x194 f) 
                                               (MS1 x195 rht))))) 
                               (MS1 x194 b))))) 
               (and 
                   (forall ((x196 N)) 
                       (=> 
                           (exists ((x197 N)) 
                               (and 
                                   (= x197 p) 
                                   (MS0 x197 x196 ult))) 
                           (MS1 x196 b))) 
                   (forall ((x198 N)) 
                       (=> 
                           (exists ((x199 N)) 
                               (and 
                                   (= x199 p) 
                                   (or 
                                       (and 
                                           (MS0 x199 x198 rt) 
                                           (not 
                                               (MS1 x199 rht))) 
                                       (and 
                                           (MS0 x199 x198 f) 
                                           (MS1 x199 rht))))) 
                           (MS1 x198 b)))) 
               (and 
                   (forall ((x200 N)) 
                       (=> 
                           (exists ((x201 N)) 
                               (and 
                                   (= x201 p) 
                                   (MS0 x201 x200 ult))) 
                           (MS1 x200 b))) 
                   (forall ((x202 N)) 
                       (=> 
                           (exists ((x203 N)) 
                               (and 
                                   (= x203 p) 
                                   (or 
                                       (and 
                                           (MS0 x203 x202 rt) 
                                           (not 
                                               (MS1 x203 rht))) 
                                       (and 
                                           (MS0 x203 x202 f) 
                                           (MS1 x203 rht))))) 
                           (MS1 x202 b))) 
                   (exists ((x204 N)) 
                       (and 
                           (MS0 p x204 f) 
                           (MS1 x204 rht)))))
         :named hyp57))
(assert (! (not 
               (forall ((x205 N) (x206 N)) 
                   (= 
                       (or 
                           (and 
                               (or 
                                   (and 
                                       (MS0 x205 x206 lt) 
                                       (not 
                                           (MS1 x205 lft))) 
                                   (and 
                                       (MS0 x205 x206 f) 
                                       (MS1 x205 lft))) 
                               (not 
                                   (exists ((x207 N)) 
                                       (and 
                                           (MS0 p x205 f) 
                                           (= x207 p))))) 
                           (and 
                               (MS0 p x205 f) 
                               (= x206 p))) 
                       (or 
                           (and 
                               (MS0 x205 x206 lt) 
                               (not 
                                   (and 
                                       (MS1 x205 lft) 
                                       (not 
                                           (MS0 p x205 f))))) 
                           (and 
                               (MS0 x205 x206 f) 
                               (not 
                                   (= x205 p)) 
                               (MS1 x205 lft) 
                               (not 
                                   (MS0 p x205 f)))))))
         :named goal))
(check-sat)
(exit)

