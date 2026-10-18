(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort D 0)
(declare-sort PZZ 0)
(declare-fun MS (Int Int PZZ) Bool)
(declare-fun idata (Int PZZ) Bool)
(declare-fun rd (Int D) Bool)
(declare-fun wt (Int D) Bool)
(declare-fun wtp (Int D) Bool)
(declare-fun adr_r () Int)
(declare-fun adr_w () Int)
(declare-fun f () PZZ)
(declare-fun g () PZZ)
(declare-fun indx_r () Int)
(declare-fun indx_wp () Int)
(declare-fun latest () Int)
(declare-fun m () Int)
(declare-fun pair_w () Int)
(declare-fun r () Int)
(declare-fun reading () Int)
(declare-fun slot () PZZ)
(declare-fun u () Int)
(declare-fun w () Int)
(declare-fun y () D)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x167 Int) (x168 Int)) 
            (exists ((X PZZ)) 
                (and 
                    (MS x167 x168 X) 
                    (forall ((y0 Int) (y1 Int)) 
                        (=> 
                            (MS y0 y1 X) 
                            (and 
                                (= y0 x167) 
                                (= y1 x168))))))))
(assert (! (or 
               (= reading 0) 
               (= reading 1))
         :named hyp1))
(assert (! (or 
               (= pair_w 0) 
               (= pair_w 1))
         :named hyp2))
(assert (! (or 
               (= latest 0) 
               (= latest 1))
         :named hyp3))
(assert (! (or 
               (= indx_r 0) 
               (= indx_r 1))
         :named hyp4))
(assert (! (or 
               (= indx_wp 0) 
               (= indx_wp 1))
         :named hyp5))
(assert (! (and 
               (forall ((x Int) (x0 Int)) 
                   (=> 
                       (MS x x0 slot) 
                       (and 
                           (or 
                               (= x 0) 
                               (= x 1)) 
                           (or 
                               (= x0 0) 
                               (= x0 1))))) 
               (forall ((x1 Int) (x2 Int) (x3 Int)) 
                   (=> 
                       (and 
                           (MS x1 x2 slot) 
                           (MS x1 x3 slot)) 
                       (= x2 x3))) 
               (forall ((x4 Int)) 
                   (=> 
                       (or 
                           (= x4 0) 
                           (= x4 1)) 
                       (exists ((x5 Int)) 
                           (MS x4 x5 slot)))))
         :named hyp6))
(assert (! (and 
               (forall ((x6 Int) (x7 PZZ)) 
                   (=> 
                       (idata x6 x7) 
                       (and 
                           (or 
                               (= x6 0) 
                               (= x6 1)) 
                           (forall ((x8 Int) (x9 Int)) 
                               (=> 
                                   (MS x8 x9 x7) 
                                   (and 
                                       (or 
                                           (= x8 0) 
                                           (= x8 1)) 
                                       (exists ((x10 D)) 
                                           (wtp x9 x10))))) 
                           (forall ((x11 Int) (x12 Int) (x13 Int)) 
                               (=> 
                                   (and 
                                       (MS x11 x12 x7) 
                                       (MS x11 x13 x7)) 
                                   (= x12 x13))) 
                           (forall ((x14 Int)) 
                               (=> 
                                   (or 
                                       (= x14 0) 
                                       (= x14 1)) 
                                   (exists ((x15 Int)) 
                                       (MS x14 x15 x7))))))) 
               (forall ((x16 Int) (x17 PZZ) (x18 PZZ)) 
                   (=> 
                       (and 
                           (idata x16 x17) 
                           (idata x16 x18)) 
                       (forall ((x19 Int) (x20 Int)) 
                           (= 
                               (MS x19 x20 x17) 
                               (MS x19 x20 x18))))) 
               (forall ((x21 Int)) 
                   (=> 
                       (or 
                           (= x21 0) 
                           (= x21 1)) 
                       (exists ((x22 PZZ)) 
                           (idata x21 x22)))))
         :named hyp7))
(assert (! (=> 
               (= adr_r 3) 
               (exists ((x23 PZZ)) 
                   (and 
                       (idata reading x23) 
                       (MS indx_r m x23))))
         :named hyp8))
(assert (! (exists ((x24 PZZ)) 
               (and 
                   (idata latest x24) 
                   (exists ((x25 Int)) 
                       (and 
                           (MS latest x25 slot) 
                           (MS x25 w x24)))))
         :named hyp9))
(assert (! (=> 
               (= adr_w 1) 
               (= pair_w latest))
         :named hyp10))
(assert (! (=> 
               (= reading pair_w) 
               (= latest reading))
         :named hyp11))
(assert (! (=> 
               (or 
                   (= adr_w 1) 
                   (= adr_w 5)) 
               (MS pair_w indx_wp slot))
         :named hyp12))
(assert (! (=> 
               (or 
                   (= adr_w 2) 
                   (= adr_w 3) 
                   (= adr_w 4)) 
               (forall ((x26 Int)) 
                   (=> 
                       (MS pair_w x26 slot) 
                       (= indx_wp (- 1 x26)))))
         :named hyp13))
(assert (! (exists ((x27 PZZ)) 
               (and 
                   (idata pair_w x27) 
                   (exists ((x28 Int)) 
                       (and 
                           (exists ((x29 D)) 
                               (wtp x28 x29)) 
                           (forall ((x30 Int)) 
                               (=> 
                                   (exists ((x31 D)) 
                                       (wtp x30 x31)) 
                                   (<= x30 x28))) 
                           (MS indx_wp x28 x27)))))
         :named hyp14))
(assert (! (not 
               (= reading (- 1 reading)))
         :named hyp15))
(assert (! (=> 
               (= adr_r 2) 
               (and 
                   (forall ((x32 Int)) 
                       (=> 
                           (exists ((x33 PZZ)) 
                               (and 
                                   (idata reading x33) 
                                   (exists ((x34 Int)) 
                                       (and 
                                           (MS reading x34 slot) 
                                           (MS x34 x32 x33))))) 
                           (<= u x32))) 
                   (forall ((x35 Int) (x36 Int)) 
                       (=> 
                           (and 
                               (exists ((x37 PZZ)) 
                                   (and 
                                       (idata reading x37) 
                                       (exists ((x38 Int)) 
                                           (and 
                                               (MS reading x38 slot) 
                                               (MS x38 x36 x37))))) 
                               (exists ((x39 PZZ)) 
                                   (and 
                                       (idata latest x39) 
                                       (exists ((x40 Int)) 
                                           (and 
                                               (MS latest x40 slot) 
                                               (MS x40 x35 x39)))))) 
                           (<= x36 x35)))))
         :named hyp16))
(assert (! (=> 
               (and 
                   (= adr_w 5) 
                   (= latest pair_w)) 
               (forall ((x41 Int)) 
                   (= 
                       (exists ((x42 D)) 
                           (wtp x41 x42)) 
                       (and 
                           (<= 1 x41) 
                           (forall ((x43 Int)) 
                               (=> 
                                   (exists ((x44 PZZ)) 
                                       (and 
                                           (idata latest x44) 
                                           (exists ((x45 Int)) 
                                               (and 
                                                   (MS latest x45 slot) 
                                                   (MS x45 x43 x44))))) 
                                   (<= x41 x43)))))))
         :named hyp17))
(assert (! (=> 
               (and 
                   (= adr_w 5) 
                   (forall ((x46 Int)) 
                       (= 
                           (exists ((x47 D)) 
                               (wtp x46 x47)) 
                           (and 
                               (<= 1 x46) 
                               (forall ((x48 Int)) 
                                   (=> 
                                       (exists ((x49 PZZ)) 
                                           (and 
                                               (idata latest x49) 
                                               (exists ((x50 Int)) 
                                                   (and 
                                                       (MS latest x50 slot) 
                                                       (MS x50 x48 x49))))) 
                                       (<= x46 x48))))))) 
               (= latest pair_w))
         :named hyp18))
(assert (! (< 0 w)
         :named hyp19))
(assert (! (and 
               (forall ((x51 Int) (x52 D)) 
                   (=> 
                       (wt x51 x52) 
                       (and 
                           (<= 1 x51) 
                           (<= x51 w)))) 
               (forall ((x53 Int) (x54 D) (x55 D)) 
                   (=> 
                       (and 
                           (wt x53 x54) 
                           (wt x53 x55)) 
                       (= x54 x55))) 
               (forall ((x56 Int)) 
                   (=> 
                       (and 
                           (<= 1 x56) 
                           (<= x56 w)) 
                       (exists ((x57 D)) 
                           (wt x56 x57)))))
         :named hyp20))
(assert (! (and 
               (forall ((x58 Int) (x59 D)) 
                   (=> 
                       (rd x58 x59) 
                       (and 
                           (<= 1 x58) 
                           (<= x58 r)))) 
               (forall ((x60 Int) (x61 D) (x62 D)) 
                   (=> 
                       (and 
                           (rd x60 x61) 
                           (rd x60 x62)) 
                       (= x61 x62))) 
               (forall ((x63 Int)) 
                   (=> 
                       (and 
                           (<= 1 x63) 
                           (<= x63 r)) 
                       (exists ((x64 D)) 
                           (rd x63 x64)))))
         :named hyp21))
(assert (! (and 
               (forall ((x65 Int) (x66 Int)) 
                   (=> 
                       (MS x65 x66 f) 
                       (and 
                           (<= 1 x65) 
                           (<= x65 r) 
                           (<= 1 x66) 
                           (<= x66 w)))) 
               (forall ((x67 Int) (x68 Int) (x69 Int)) 
                   (=> 
                       (and 
                           (MS x67 x68 f) 
                           (MS x67 x69 f)) 
                       (= x68 x69))) 
               (forall ((x70 Int)) 
                   (=> 
                       (and 
                           (<= 1 x70) 
                           (<= x70 r)) 
                       (exists ((x71 Int)) 
                           (MS x70 x71 f)))))
         :named hyp22))
(assert (! (and 
               (forall ((x72 Int) (x73 Int)) 
                   (=> 
                       (MS x72 x73 g) 
                       (and 
                           (<= 1 x72) 
                           (<= x72 r) 
                           (<= 1 x73) 
                           (<= x73 w)))) 
               (forall ((x74 Int) (x75 Int) (x76 Int)) 
                   (=> 
                       (and 
                           (MS x74 x75 g) 
                           (MS x74 x76 g)) 
                       (= x75 x76))) 
               (forall ((x77 Int)) 
                   (=> 
                       (and 
                           (<= 1 x77) 
                           (<= x77 r)) 
                       (exists ((x78 Int)) 
                           (MS x77 x78 g)))))
         :named hyp23))
(assert (! (forall ((x79 Int) (x80 D)) 
               (= 
                   (rd x79 x80) 
                   (exists ((x81 Int)) 
                       (and 
                           (MS x79 x81 f) 
                           (wt x81 x80)))))
         :named hyp24))
(assert (! (or 
               (= adr_w 1) 
               (= adr_w 2) 
               (= adr_w 3) 
               (= adr_w 4) 
               (= adr_w 5))
         :named hyp25))
(assert (! (or 
               (= adr_r 1) 
               (= adr_r 2) 
               (= adr_r 3))
         :named hyp26))
(assert (! (MS r u g)
         :named hyp27))
(assert (! (MS r m f)
         :named hyp28))
(assert (! (and 
               (forall ((x82 Int) (x83 D)) 
                   (=> 
                       (wtp x82 x83) 
                       (< 0 x82))) 
               (forall ((x84 Int) (x85 D) (x86 D)) 
                   (=> 
                       (and 
                           (wtp x84 x85) 
                           (wtp x84 x86)) 
                       (= x85 x86))))
         :named hyp29))
(assert (! (=> 
               (= adr_r 1) 
               (rd r y))
         :named hyp30))
(assert (! (=> 
               (= adr_r 1) 
               (and 
                   (exists ((x87 D)) 
                       (rd r x87)) 
                   (forall ((x88 Int) (x89 D) (x90 D)) 
                       (=> 
                           (and 
                               (rd x88 x89) 
                               (rd x88 x90)) 
                           (= x89 x90)))))
         :named hyp31))
(assert (! (forall ((x91 Int) (x92 D)) 
               (=> 
                   (wt x91 x92) 
                   (wtp x91 x92)))
         :named hyp32))
(assert (! (=> 
               (= adr_w 1) 
               (forall ((x93 Int)) 
                   (= 
                       (exists ((x94 D)) 
                           (wtp x93 x94)) 
                       (and 
                           (<= 1 x93) 
                           (<= x93 w)))))
         :named hyp33))
(assert (! (=> 
               (or 
                   (= adr_w 2) 
                   (= adr_w 3) 
                   (= adr_w 4)) 
               (forall ((x95 Int)) 
                   (= 
                       (exists ((x96 D)) 
                           (wtp x95 x96)) 
                       (and 
                           (<= 1 x95) 
                           (<= x95 (+ w 1))))))
         :named hyp34))
(assert (! (=> 
               (= adr_w 5) 
               (or 
                   (forall ((x97 Int)) 
                       (= 
                           (exists ((x98 D)) 
                               (wtp x97 x98)) 
                           (and 
                               (<= 1 x97) 
                               (<= x97 w)))) 
                   (forall ((x99 Int)) 
                       (= 
                           (exists ((x100 D)) 
                               (wtp x99 x100)) 
                           (and 
                               (<= 1 x99) 
                               (<= x99 (+ w 1)))))))
         :named hyp35))
(assert (! (=> 
               (= adr_r 2) 
               (and 
                   (forall ((x101 Int)) 
                       (=> 
                           (exists ((x102 PZZ)) 
                               (and 
                                   (idata reading x102) 
                                   (exists ((x103 Int)) 
                                       (and 
                                           (MS reading x103 slot) 
                                           (MS x103 x101 x102))))) 
                           (<= u x101))) 
                   (forall ((x104 Int)) 
                       (=> 
                           (exists ((x105 PZZ)) 
                               (and 
                                   (idata reading x105) 
                                   (exists ((x106 Int)) 
                                       (and 
                                           (MS reading x106 slot) 
                                           (MS x106 x104 x105))))) 
                           (<= x104 w)))))
         :named hyp36))
(assert (! (exists ((x107 PZZ)) 
               (idata latest x107))
         :named hyp37))
(assert (! (forall ((x108 Int) (x109 PZZ) (x110 PZZ)) 
               (=> 
                   (and 
                       (idata x108 x109) 
                       (idata x108 x110)) 
                   (forall ((x111 Int) (x112 Int)) 
                       (= 
                           (MS x111 x112 x109) 
                           (MS x111 x112 x110)))))
         :named hyp38))
(assert (! (exists ((x113 Int)) 
               (MS latest x113 slot))
         :named hyp39))
(assert (! (forall ((x114 Int) (x115 Int) (x116 Int)) 
               (=> 
                   (and 
                       (MS x114 x115 slot) 
                       (MS x114 x116 slot)) 
                   (= x115 x116)))
         :named hyp40))
(assert (! (exists ((x117 Int) (x118 PZZ)) 
               (and 
                   (idata latest x118) 
                   (exists ((x119 Int)) 
                       (and 
                           (MS latest x119 slot) 
                           (MS x119 x117 x118)))))
         :named hyp41))
(assert (! (forall ((x120 Int) (x121 Int) (x122 Int)) 
               (=> 
                   (and 
                       (exists ((x123 PZZ)) 
                           (and 
                               (idata latest x123) 
                               (MS x120 x121 x123))) 
                       (exists ((x124 PZZ)) 
                           (and 
                               (idata latest x124) 
                               (MS x120 x122 x124)))) 
                   (= x121 x122)))
         :named hyp42))
(assert (! (=> 
               (and 
                   (= adr_w 5) 
                   (= latest pair_w)) 
               (forall ((x125 Int)) 
                   (= 
                       (exists ((x126 D)) 
                           (wtp x125 x126)) 
                       (and 
                           (<= 1 x125) 
                           (<= x125 w)))))
         :named hyp43))
(assert (! (=> 
               (and 
                   (= adr_w 5) 
                   (forall ((x127 Int)) 
                       (= 
                           (exists ((x128 D)) 
                               (wtp x127 x128)) 
                           (and 
                               (<= 1 x127) 
                               (<= x127 w))))) 
               (= latest pair_w))
         :named hyp44))
(assert (! (exists ((x129 PZZ)) 
               (idata pair_w x129))
         :named hyp45))
(assert (! (exists ((x130 Int) (x131 PZZ)) 
               (and 
                   (idata pair_w x131) 
                   (MS indx_wp x130 x131)))
         :named hyp46))
(assert (! (forall ((x132 Int) (x133 Int) (x134 Int)) 
               (=> 
                   (and 
                       (exists ((x135 PZZ)) 
                           (and 
                               (idata pair_w x135) 
                               (MS x132 x133 x135))) 
                       (exists ((x136 PZZ)) 
                           (and 
                               (idata pair_w x136) 
                               (MS x132 x134 x136)))) 
                   (= x133 x134)))
         :named hyp47))
(assert (! (exists ((b Int)) 
               (forall ((x137 Int)) 
                   (=> 
                       (exists ((x138 D)) 
                           (wtp x137 x138)) 
                       (<= x137 b))))
         :named hyp48))
(assert (! (exists ((x139 Int) (x140 Int)) 
               (and 
                   (= x140 (- 1 reading)) 
                   (MS x140 x139 slot)))
         :named hyp49))
(assert (! (not 
               (forall ((x141 Int) (x142 D)) 
                   (not 
                       (wtp x141 x142))))
         :named hyp50))
(assert (! (=> 
               (= adr_r 2) 
               (and 
                   (exists ((x143 PZZ)) 
                       (idata reading x143)) 
                   (exists ((x144 Int)) 
                       (MS reading x144 slot)) 
                   (exists ((x145 Int) (x146 PZZ)) 
                       (and 
                           (idata reading x146) 
                           (exists ((x147 Int)) 
                               (and 
                                   (MS reading x147 slot) 
                                   (MS x147 x145 x146))))) 
                   (forall ((x148 Int) (x149 Int) (x150 Int)) 
                       (=> 
                           (and 
                               (exists ((x151 PZZ)) 
                                   (and 
                                       (idata reading x151) 
                                       (MS x148 x149 x151))) 
                               (exists ((x152 PZZ)) 
                                   (and 
                                       (idata reading x152) 
                                       (MS x148 x150 x152)))) 
                           (= x149 x150)))))
         :named hyp51))
(assert (! (=> 
               (= adr_r 3) 
               (and 
                   (exists ((x153 PZZ)) 
                       (idata reading x153)) 
                   (exists ((x154 Int) (x155 PZZ)) 
                       (and 
                           (idata reading x155) 
                           (MS indx_r x154 x155))) 
                   (forall ((x156 Int) (x157 Int) (x158 Int)) 
                       (=> 
                           (and 
                               (exists ((x159 PZZ)) 
                                   (and 
                                       (idata reading x159) 
                                       (MS x156 x157 x159))) 
                               (exists ((x160 PZZ)) 
                                   (and 
                                       (idata reading x160) 
                                       (MS x156 x158 x160)))) 
                           (= x157 x158)))))
         :named hyp52))
(assert (! (=> 
               (or 
                   (= adr_w 1) 
                   (= adr_w 5)) 
               (exists ((x161 Int)) 
                   (MS pair_w x161 slot)))
         :named hyp53))
(assert (! (=> 
               (or 
                   (= adr_w 2) 
                   (= adr_w 3) 
                   (= adr_w 4)) 
               (exists ((x162 Int)) 
                   (MS pair_w x162 slot)))
         :named hyp54))
(assert (! (not 
               (not 
                   (exists ((x163 Int) (x164 Int)) 
                       (and 
                           (= x163 (- 1 reading)) 
                           (forall ((x165 Int)) 
                               (=> 
                                   (exists ((x166 Int)) 
                                       (and 
                                           (= x166 (- 1 reading)) 
                                           (MS x166 x165 slot))) 
                                   (= x164 (- 1 x165)))) 
                           (MS x163 x164 slot)))))
         :named goal))
(check-sat)
(exit)

