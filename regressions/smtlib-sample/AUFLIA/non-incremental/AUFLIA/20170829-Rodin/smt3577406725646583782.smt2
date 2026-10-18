(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort A 0)
(declare-sort PAA 0)
(declare-sort PZA 0)
(declare-fun MS (Int A PZA) Bool)
(declare-fun MS0 (A A PAA) Bool)
(declare-fun a (A) Bool)
(declare-fun candidate (A) Bool)
(declare-fun length (PZA Int) Bool)
(declare-fun path (A A PZA) Bool)
(declare-fun seq (PZA) Bool)
(declare-fun c () PAA)
(declare-fun i () Int)
(declare-fun r () PAA)
(declare-fun s1 () PZA)
(declare-fun s2 () PZA)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x208 A) (x209 A)) 
            (exists ((X PAA)) 
                (and 
                    (MS0 x208 x209 X) 
                    (forall ((y3 A) (y4 A)) 
                        (=> 
                            (MS0 y3 y4 X) 
                            (and 
                                (= y3 x208) 
                                (= y4 x209))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x210 Int) (x211 A)) 
            (exists ((X0 PZA)) 
                (and 
                    (MS x210 x211 X0) 
                    (forall ((y5 Int) (y6 A)) 
                        (=> 
                            (MS y5 y6 X0) 
                            (and 
                                (= y5 x210) 
                                (= y6 x211))))))))
(assert (! (forall ((x PZA)) 
               (= 
                   (seq x) 
                   (exists ((s PZA)) 
                       (and 
                           (exists ((n Int)) 
                               (and 
                                   (<= 0 n) 
                                   (forall ((x0 Int) (x1 A)) 
                                       (=> 
                                           (MS x0 x1 s) 
                                           (and 
                                               (<= 1 x0) 
                                               (<= x0 n)))) 
                                   (forall ((x2 Int) (x3 A) (x4 A)) 
                                       (=> 
                                           (and 
                                               (MS x2 x3 s) 
                                               (MS x2 x4 s)) 
                                           (= x3 x4))) 
                                   (forall ((x5 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x5) 
                                               (<= x5 n)) 
                                           (exists ((x6 A)) 
                                               (MS x5 x6 s)))))) 
                           (forall ((x7 Int) (x8 A)) 
                               (= 
                                   (MS x7 x8 x) 
                                   (MS x7 x8 s)))))))
         :named hyp1))
(assert (! (forall ((n0 Int) (s0 PZA)) 
               (=> 
                   (and 
                       (<= 0 n0) 
                       (forall ((x9 Int) (x10 A)) 
                           (=> 
                               (MS x9 x10 s0) 
                               (and 
                                   (<= 1 x9) 
                                   (<= x9 n0)))) 
                       (forall ((x11 Int) (x12 A) (x13 A)) 
                           (=> 
                               (and 
                                   (MS x11 x12 s0) 
                                   (MS x11 x13 s0)) 
                               (= x12 x13))) 
                       (forall ((x14 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x14) 
                                   (<= x14 n0)) 
                               (exists ((x15 A)) 
                                   (MS x14 x15 s0))))) 
                   (length s0 n0)))
         :named hyp2))
(assert (! (and 
               (<= 1 i) 
               (forall ((x16 Int)) 
                   (=> 
                       (length s1 x16) 
                       (<= i x16))))
         :named hyp3))
(assert (! (and 
               (forall ((x17 PZA) (x18 Int)) 
                   (=> 
                       (length x17 x18) 
                       (and 
                           (exists ((s3 PZA)) 
                               (and 
                                   (exists ((n1 Int)) 
                                       (and 
                                           (<= 0 n1) 
                                           (forall ((x19 Int) (x20 A)) 
                                               (=> 
                                                   (MS x19 x20 s3) 
                                                   (and 
                                                       (<= 1 x19) 
                                                       (<= x19 n1)))) 
                                           (forall ((x21 Int) (x22 A) (x23 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x21 x22 s3) 
                                                       (MS x21 x23 s3)) 
                                                   (= x22 x23))) 
                                           (forall ((x24 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x24) 
                                                       (<= x24 n1)) 
                                                   (exists ((x25 A)) 
                                                       (MS x24 x25 s3)))))) 
                                   (forall ((x26 Int) (x27 A)) 
                                       (= 
                                           (MS x26 x27 x17) 
                                           (MS x26 x27 s3))))) 
                           (<= 0 x18)))) 
               (forall ((x28 PZA) (x29 Int) (x30 Int)) 
                   (=> 
                       (and 
                           (length x28 x29) 
                           (length x28 x30)) 
                       (= x29 x30))) 
               (forall ((x31 PZA)) 
                   (=> 
                       (exists ((s4 PZA)) 
                           (and 
                               (exists ((n2 Int)) 
                                   (and 
                                       (<= 0 n2) 
                                       (forall ((x32 Int) (x33 A)) 
                                           (=> 
                                               (MS x32 x33 s4) 
                                               (and 
                                                   (<= 1 x32) 
                                                   (<= x32 n2)))) 
                                       (forall ((x34 Int) (x35 A) (x36 A)) 
                                           (=> 
                                               (and 
                                                   (MS x34 x35 s4) 
                                                   (MS x34 x36 s4)) 
                                               (= x35 x36))) 
                                       (forall ((x37 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x37) 
                                                   (<= x37 n2)) 
                                               (exists ((x38 A)) 
                                                   (MS x37 x38 s4)))))) 
                               (forall ((x39 Int) (x40 A)) 
                                   (= 
                                       (MS x39 x40 x31) 
                                       (MS x39 x40 s4))))) 
                       (exists ((x41 Int)) 
                           (length x31 x41)))))
         :named hyp4))
(assert (! (forall ((n3 Int) (s5 PZA)) 
               (=> 
                   (and 
                       (<= 0 n3) 
                       (forall ((x42 Int) (x43 A)) 
                           (=> 
                               (MS x42 x43 s5) 
                               (and 
                                   (<= 1 x42) 
                                   (<= x42 n3)))) 
                       (forall ((x44 Int) (x45 A) (x46 A)) 
                           (=> 
                               (and 
                                   (MS x44 x45 s5) 
                                   (MS x44 x46 s5)) 
                               (= x45 x46))) 
                       (forall ((x47 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x47) 
                                   (<= x47 n3)) 
                               (exists ((x48 A)) 
                                   (MS x47 x48 s5))))) 
                   (exists ((n4 Int)) 
                       (and 
                           (<= 0 n4) 
                           (forall ((x49 Int) (x50 A)) 
                               (=> 
                                   (MS x49 x50 s5) 
                                   (and 
                                       (<= 1 x49) 
                                       (<= x49 n4)))) 
                           (forall ((x51 Int) (x52 A) (x53 A)) 
                               (=> 
                                   (and 
                                       (MS x51 x52 s5) 
                                       (MS x51 x53 s5)) 
                                   (= x52 x53))) 
                           (forall ((x54 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x54) 
                                       (<= x54 n4)) 
                                   (exists ((x55 A)) 
                                       (MS x54 x55 s5))))))))
         :named hyp5))
(assert (! (forall ((s6 PZA)) 
               (=> 
                   (exists ((n5 Int)) 
                       (and 
                           (<= 0 n5) 
                           (forall ((x56 Int) (x57 A)) 
                               (=> 
                                   (MS x56 x57 s6) 
                                   (and 
                                       (<= 1 x56) 
                                       (<= x56 n5)))) 
                           (forall ((x58 Int) (x59 A) (x60 A)) 
                               (=> 
                                   (and 
                                       (MS x58 x59 s6) 
                                       (MS x58 x60 s6)) 
                                   (= x59 x60))) 
                           (forall ((x61 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x61) 
                                       (<= x61 n5)) 
                                   (exists ((x62 A)) 
                                       (MS x61 x62 s6)))))) 
                   (and 
                       (forall ((x63 Int) (x64 A)) 
                           (=> 
                               (MS x63 x64 s6) 
                               (and 
                                   (<= 1 x63) 
                                   (forall ((x65 Int)) 
                                       (=> 
                                           (length s6 x65) 
                                           (<= x63 x65)))))) 
                       (forall ((x66 Int) (x67 A) (x68 A)) 
                           (=> 
                               (and 
                                   (MS x66 x67 s6) 
                                   (MS x66 x68 s6)) 
                               (= x67 x68))) 
                       (forall ((x69 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x69) 
                                   (forall ((x70 Int)) 
                                       (=> 
                                           (length s6 x70) 
                                           (<= x69 x70)))) 
                               (exists ((x71 A)) 
                                   (MS x69 x71 s6)))))))
         :named hyp6))
(assert (! (exists ((n6 Int)) 
               (and 
                   (<= 0 n6) 
                   (forall ((x72 Int) (x73 A)) 
                       (=> 
                           (MS x72 x73 s1) 
                           (and 
                               (<= 1 x72) 
                               (<= x72 n6)))) 
                   (forall ((x74 Int) (x75 A) (x76 A)) 
                       (=> 
                           (and 
                               (MS x74 x75 s1) 
                               (MS x74 x76 s1)) 
                           (= x75 x76))) 
                   (forall ((x77 Int)) 
                       (=> 
                           (and 
                               (<= 1 x77) 
                               (<= x77 n6)) 
                           (exists ((x78 A)) 
                               (MS x77 x78 s1))))))
         :named hyp7))
(assert (! (exists ((n7 Int)) 
               (and 
                   (<= 0 n7) 
                   (forall ((x79 Int) (x80 A)) 
                       (=> 
                           (MS x79 x80 s2) 
                           (and 
                               (<= 1 x79) 
                               (<= x79 n7)))) 
                   (forall ((x81 Int) (x82 A) (x83 A)) 
                       (=> 
                           (and 
                               (MS x81 x82 s2) 
                               (MS x81 x83 s2)) 
                           (= x82 x83))) 
                   (forall ((x84 Int)) 
                       (=> 
                           (and 
                               (<= 1 x84) 
                               (<= x84 n7)) 
                           (exists ((x85 A)) 
                               (MS x84 x85 s2))))))
         :named hyp8))
(assert (! (forall ((x86 A) (x87 A)) 
               (=> 
                   (MS0 x86 x87 r) 
                   (and 
                       (a x86) 
                       (a x87))))
         :named hyp9))
(assert (! (not 
               (forall ((x88 A) (x89 A)) 
                   (not 
                       (MS0 x88 x89 r))))
         :named hyp10))
(assert (! (forall ((x90 A) (x91 A)) 
               (=> 
                   (MS0 x90 x91 c) 
                   (and 
                       (a x90) 
                       (a x91))))
         :named hyp11))
(assert (! (forall ((x92 A) (x93 A)) 
               (=> 
                   (MS0 x92 x93 r) 
                   (MS0 x92 x93 c)))
         :named hyp12))
(assert (! (forall ((x94 A) (x95 A)) 
               (=> 
                   (exists ((x96 A)) 
                       (and 
                           (MS0 x94 x96 c) 
                           (MS0 x96 x95 r))) 
                   (MS0 x94 x95 c)))
         :named hyp13))
(assert (! (forall ((s7 PAA)) 
               (=> 
                   (and 
                       (forall ((x97 A) (x98 A)) 
                           (=> 
                               (MS0 x97 x98 s7) 
                               (and 
                                   (a x97) 
                                   (a x98)))) 
                       (forall ((x99 A) (x100 A)) 
                           (=> 
                               (MS0 x99 x100 r) 
                               (MS0 x99 x100 s7))) 
                       (forall ((x101 A) (x102 A)) 
                           (=> 
                               (exists ((x103 A)) 
                                   (and 
                                       (MS0 x101 x103 s7) 
                                       (MS0 x103 x102 r))) 
                               (MS0 x101 x102 s7)))) 
                   (forall ((x104 A) (x105 A)) 
                       (=> 
                           (MS0 x104 x105 c) 
                           (MS0 x104 x105 s7)))))
         :named hyp14))
(assert (! (forall ((x106 A)) 
               (= 
                   (exists ((x107 A)) 
                       (MS0 x106 x107 r)) 
                   (a x106)))
         :named hyp15))
(assert (! (forall ((x108 A)) 
               (= 
                   (exists ((x109 A)) 
                       (MS0 x108 x109 c)) 
                   (a x108)))
         :named hyp16))
(assert (! (forall ((x110 A)) 
               (=> 
                   (exists ((x111 A)) 
                       (MS0 x110 x111 r)) 
                   (exists ((x112 A)) 
                       (MS0 x110 x112 c))))
         :named hyp17))
(assert (! (forall ((x113 A) (x114 A)) 
               (= 
                   (MS0 x113 x114 c) 
                   (or 
                       (MS0 x113 x114 r) 
                       (exists ((x115 A)) 
                           (and 
                               (MS0 x113 x115 c) 
                               (MS0 x115 x114 r))))))
         :named hyp18))
(assert (! (forall ((x116 A) (y A)) 
               (=> 
                   (and 
                       (a x116) 
                       (a y)) 
                   (forall ((s8 PZA) (n8 Int)) 
                       (=> 
                           (and 
                               (<= 0 n8) 
                               (< 1 n8) 
                               (forall ((x117 Int) (x118 A)) 
                                   (=> 
                                       (MS x117 x118 s8) 
                                       (and 
                                           (<= 1 x117) 
                                           (<= x117 n8) 
                                           (a x118)))) 
                               (forall ((x119 Int) (x120 A) (x121 A)) 
                                   (=> 
                                       (and 
                                           (MS x119 x120 s8) 
                                           (MS x119 x121 s8)) 
                                       (= x120 x121))) 
                               (forall ((x122 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x122) 
                                           (<= x122 n8)) 
                                       (exists ((x123 A)) 
                                           (MS x122 x123 s8))))) 
                           (and 
                               (exists ((x124 A) (x125 Int)) 
                                   (and 
                                       (= x125 1) 
                                       (MS x125 x124 s8))) 
                               (forall ((x126 Int) (x127 A) (x128 A)) 
                                   (=> 
                                       (and 
                                           (MS x126 x127 s8) 
                                           (MS x126 x128 s8)) 
                                       (= x127 x128))) 
                               (=> 
                                   (exists ((x129 Int)) 
                                       (and 
                                           (= x129 1) 
                                           (MS x129 x116 s8))) 
                                   (and 
                                       (exists ((x130 A)) 
                                           (MS n8 x130 s8)) 
                                       (=> 
                                           (MS n8 y s8) 
                                           (forall ((i0 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i0) 
                                                       (<= i0 (- n8 1))) 
                                                   (and 
                                                       (exists ((x131 A)) 
                                                           (MS i0 x131 s8)) 
                                                       (exists ((x132 A) (x133 Int)) 
                                                           (and 
                                                               (= x133 (+ i0 1)) 
                                                               (MS x133 x132 s8))))))))))))))
         :named hyp19))
(assert (! (forall ((x134 A) (x135 A)) 
               (=> 
                   (exists ((x136 PZA)) 
                       (path x134 x135 x136)) 
                   (MS0 x134 x135 c)))
         :named hyp20))
(assert (! (forall ((x137 A) (x138 A)) 
               (=> 
                   (MS0 x137 x138 c) 
                   (exists ((x139 PZA)) 
                       (path x137 x138 x139))))
         :named hyp21))
(assert (! (forall ((x140 A) (x141 A)) 
               (=> 
                   (and 
                       (a x140) 
                       (a x141)) 
                   (exists ((x142 PZA)) 
                       (path x140 x141 x142))))
         :named hyp22))
(assert (! (forall ((n9 Int) (s9 PZA)) 
               (=> 
                   (and 
                       (<= 0 n9) 
                       (forall ((x143 Int) (x144 A)) 
                           (=> 
                               (MS x143 x144 s9) 
                               (and 
                                   (<= 1 x143) 
                                   (<= x143 n9)))) 
                       (forall ((x145 Int) (x146 A) (x147 A)) 
                           (=> 
                               (and 
                                   (MS x145 x146 s9) 
                                   (MS x145 x147 s9)) 
                               (= x146 x147))) 
                       (forall ((x148 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x148) 
                                   (<= x148 n9)) 
                               (exists ((x149 A)) 
                                   (MS x148 x149 s9))))) 
                   (seq s9)))
         :named hyp23))
(assert (! (and 
               (forall ((x150 PZA) (x151 Int)) 
                   (=> 
                       (length x150 x151) 
                       (and 
                           (seq x150) 
                           (<= 0 x151)))) 
               (forall ((x152 PZA) (x153 Int) (x154 Int)) 
                   (=> 
                       (and 
                           (length x152 x153) 
                           (length x152 x154)) 
                       (= x153 x154))) 
               (forall ((x155 PZA)) 
                   (=> 
                       (seq x155) 
                       (exists ((x156 Int)) 
                           (length x155 x156)))))
         :named hyp24))
(assert (! (forall ((s10 PZA)) 
               (=> 
                   (seq s10) 
                   (and 
                       (forall ((x157 Int) (x158 A)) 
                           (=> 
                               (MS x157 x158 s10) 
                               (and 
                                   (<= 1 x157) 
                                   (forall ((x159 Int)) 
                                       (=> 
                                           (length s10 x159) 
                                           (<= x157 x159)))))) 
                       (forall ((x160 Int) (x161 A) (x162 A)) 
                           (=> 
                               (and 
                                   (MS x160 x161 s10) 
                                   (MS x160 x162 s10)) 
                               (= x161 x162))) 
                       (forall ((x163 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x163) 
                                   (forall ((x164 Int)) 
                                       (=> 
                                           (length s10 x164) 
                                           (<= x163 x164)))) 
                               (exists ((x165 A)) 
                                   (MS x163 x165 s10)))))))
         :named hyp25))
(assert (! (forall ((x166 A) (x167 A) (x168 PZA)) 
               (= 
                   (path x166 x167 x168) 
                   (exists ((x169 A) (y0 A) (p PZA)) 
                       (and 
                           (a x169) 
                           (a y0) 
                           (exists ((n10 Int)) 
                               (and 
                                   (<= 0 n10) 
                                   (< 1 n10) 
                                   (forall ((x170 Int) (x171 A)) 
                                       (=> 
                                           (MS x170 x171 p) 
                                           (and 
                                               (<= 1 x170) 
                                               (<= x170 n10) 
                                               (a x171)))) 
                                   (forall ((x172 Int) (x173 A) (x174 A)) 
                                       (=> 
                                           (and 
                                               (MS x172 x173 p) 
                                               (MS x172 x174 p)) 
                                           (= x173 x174))) 
                                   (forall ((x175 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x175) 
                                               (<= x175 n10)) 
                                           (exists ((x176 A)) 
                                               (MS x175 x176 p)))) 
                                   (exists ((x177 Int)) 
                                       (and 
                                           (= x177 1) 
                                           (MS x177 x169 p))) 
                                   (MS n10 y0 p) 
                                   (forall ((i1 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 i1) 
                                               (<= i1 (- n10 1))) 
                                           (exists ((x178 A) (x179 A)) 
                                               (and 
                                                   (MS i1 x178 p) 
                                                   (exists ((x180 Int)) 
                                                       (and 
                                                           (= x180 (+ i1 1)) 
                                                           (MS x180 x179 p))) 
                                                   (MS0 x178 x179 r))))))) 
                           (= x166 x169) 
                           (= x167 y0) 
                           (forall ((x181 Int) (x182 A)) 
                               (= 
                                   (MS x181 x182 x168) 
                                   (MS x181 x182 p)))))))
         :named hyp26))
(assert (! (forall ((x183 A)) 
               (= 
                   (candidate x183) 
                   (exists ((z A)) 
                       (and 
                           (a z) 
                           (forall ((x184 A) (y1 A)) 
                               (=> 
                                   (and 
                                       (a x184) 
                                       (not 
                                           (= x184 z)) 
                                       (a y1) 
                                       (not 
                                           (= y1 z)) 
                                       (not 
                                           (= x184 y1))) 
                                   (exists ((p0 PZA)) 
                                       (and 
                                           (exists ((x185 A) (x186 A)) 
                                               (and 
                                                   (= x185 x184) 
                                                   (= x186 y1) 
                                                   (path x185 x186 p0))) 
                                           (not 
                                               (exists ((x187 Int)) 
                                                   (MS x187 z p0))))))) 
                           (= x183 z)))))
         :named hyp27))
(assert (! (forall ((u A)) 
               (=> 
                   (candidate u) 
                   (forall ((x188 A) (x189 A)) 
                       (=> 
                           (and 
                               (a x188) 
                               (not 
                                   (= x188 u)) 
                               (a x189) 
                               (not 
                                   (= x189 u)) 
                               (not 
                                   (= x188 x189))) 
                           (exists ((x190 A) (y2 A) (p1 PZA)) 
                               (and 
                                   (a x190) 
                                   (not 
                                       (= x190 u)) 
                                   (a y2) 
                                   (not 
                                       (= y2 u)) 
                                   (not 
                                       (= x190 y2)) 
                                   (exists ((n11 Int)) 
                                       (and 
                                           (<= 0 n11) 
                                           (< 1 n11) 
                                           (forall ((x191 Int) (x192 A)) 
                                               (=> 
                                                   (MS x191 x192 p1) 
                                                   (and 
                                                       (<= 1 x191) 
                                                       (<= x191 n11) 
                                                       (a x192) 
                                                       (not 
                                                           (= x192 u))))) 
                                           (forall ((x193 Int) (x194 A) (x195 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x193 x194 p1) 
                                                       (MS x193 x195 p1)) 
                                                   (= x194 x195))) 
                                           (forall ((x196 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x196) 
                                                       (<= x196 n11)) 
                                                   (exists ((x197 A)) 
                                                       (MS x196 x197 p1)))) 
                                           (exists ((x198 Int)) 
                                               (and 
                                                   (= x198 1) 
                                                   (MS x198 x190 p1))) 
                                           (MS n11 y2 p1) 
                                           (forall ((i2 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i2) 
                                                       (<= i2 (- n11 1))) 
                                                   (exists ((x199 A) (x200 A)) 
                                                       (and 
                                                           (MS i2 x199 p1) 
                                                           (exists ((x201 Int)) 
                                                               (and 
                                                                   (= x201 (+ i2 1)) 
                                                                   (MS x201 x200 p1))) 
                                                           (MS0 x199 x200 r))))))) 
                                   (= x188 x190) 
                                   (= x189 y2)))))))
         :named hyp28))
(assert (! (forall ((x202 A) (x203 A)) 
               (=> 
                   (and 
                       (a x202) 
                       (a x203)) 
                   (MS0 x202 x203 c)))
         :named hyp29))
(assert (! (not 
               (forall ((x204 A)) 
                   (a x204)))
         :named hyp30))
(assert (! (seq s1)
         :named hyp31))
(assert (! (seq s2)
         :named hyp32))
(assert (! (not 
               (forall ((x205 Int) (x206 A) (x207 A)) 
                   (=> 
                       (and 
                           (MS x205 x206 s1) 
                           (MS x205 x207 s1)) 
                       (= x206 x207))))
         :named goal))
(check-sat)
(exit)

