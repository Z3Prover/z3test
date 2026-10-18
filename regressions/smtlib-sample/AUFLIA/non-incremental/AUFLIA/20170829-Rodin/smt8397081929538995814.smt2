(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort A 0)
(declare-sort PA 0)
(declare-sort PAA 0)
(declare-sort PZA 0)
(declare-fun MS (Int A PZA) Bool)
(declare-fun MS0 (A A PAA) Bool)
(declare-fun MS1 (A PA) Bool)
(declare-fun cnc (PZA PZA PZA) Bool)
(declare-fun dist (A A Int) Bool)
(declare-fun length (PZA Int) Bool)
(declare-fun path (A A PZA) Bool)
(declare-fun seq (PZA) Bool)
(declare-fun a () PA)
(declare-fun c () PAA)
(declare-fun candidate () PA)
(declare-fun i () Int)
(declare-fun r () PAA)
(declare-fun s () PZA)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x972 A) (x973 A)) 
            (exists ((X PAA)) 
                (and 
                    (MS0 x972 x973 X) 
                    (forall ((y10 A) (y11 A)) 
                        (=> 
                            (MS0 y10 y11 X) 
                            (and 
                                (= y10 x972) 
                                (= y11 x973))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x974 A)) 
            (exists ((X0 PA)) 
                (and 
                    (MS1 x974 X0) 
                    (forall ((y12 A)) 
                        (=> 
                            (MS1 y12 X0) 
                            (= y12 x974)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x975 Int) (x976 A)) 
            (exists ((X1 PZA)) 
                (and 
                    (MS x975 x976 X1) 
                    (forall ((y13 Int) (y14 A)) 
                        (=> 
                            (MS y13 y14 X1) 
                            (and 
                                (= y13 x975) 
                                (= y14 x976))))))))
(assert (! (forall ((x PZA)) 
               (= 
                   (seq x) 
                   (exists ((s0 PZA)) 
                       (and 
                           (exists ((n Int)) 
                               (and 
                                   (<= 0 n) 
                                   (forall ((x0 Int) (x1 A)) 
                                       (=> 
                                           (MS x0 x1 s0) 
                                           (and 
                                               (<= 1 x0) 
                                               (<= x0 n)))) 
                                   (forall ((x2 Int) (x3 A) (x4 A)) 
                                       (=> 
                                           (and 
                                               (MS x2 x3 s0) 
                                               (MS x2 x4 s0)) 
                                           (= x3 x4))) 
                                   (forall ((x5 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x5) 
                                               (<= x5 n)) 
                                           (exists ((x6 A)) 
                                               (MS x5 x6 s0)))))) 
                           (forall ((x7 Int) (x8 A)) 
                               (= 
                                   (MS x7 x8 x) 
                                   (MS x7 x8 s0)))))))
         :named hyp1))
(assert (! (forall ((n0 Int) (s1 PZA)) 
               (=> 
                   (and 
                       (<= 0 n0) 
                       (forall ((x9 Int) (x10 A)) 
                           (=> 
                               (MS x9 x10 s1) 
                               (and 
                                   (<= 1 x9) 
                                   (<= x9 n0)))) 
                       (forall ((x11 Int) (x12 A) (x13 A)) 
                           (=> 
                               (and 
                                   (MS x11 x12 s1) 
                                   (MS x11 x13 s1)) 
                               (= x12 x13))) 
                       (forall ((x14 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x14) 
                                   (<= x14 n0)) 
                               (exists ((x15 A)) 
                                   (MS x14 x15 s1))))) 
                   (length s1 n0)))
         :named hyp2))
(assert (! (forall ((x16 A) (x17 A)) 
               (not 
                   (and 
                       (MS0 x16 x17 r) 
                       (= x16 x17))))
         :named hyp3))
(assert (! (and 
               (forall ((x18 A) (x19 A) (x20 Int)) 
                   (=> 
                       (dist x18 x19 x20) 
                       (and 
                           (MS1 x18 a) 
                           (MS1 x19 a) 
                           (<= 0 x20)))) 
               (forall ((x21 A) (x22 A) (x23 Int) (x24 Int)) 
                   (=> 
                       (and 
                           (dist x21 x22 x23) 
                           (dist x21 x22 x24)) 
                       (= x23 x24))) 
               (forall ((x25 A) (x26 A)) 
                   (=> 
                       (and 
                           (MS1 x25 a) 
                           (MS1 x26 a)) 
                       (exists ((x27 Int)) 
                           (dist x25 x26 x27)))))
         :named hyp4))
(assert (! (and 
               (<= 1 i) 
               (forall ((x28 Int)) 
                   (=> 
                       (length s x28) 
                       (<= i x28))))
         :named hyp5))
(assert (! (and 
               (forall ((x29 PZA) (x30 Int)) 
                   (=> 
                       (length x29 x30) 
                       (and 
                           (exists ((s2 PZA)) 
                               (and 
                                   (exists ((n1 Int)) 
                                       (and 
                                           (<= 0 n1) 
                                           (forall ((x31 Int) (x32 A)) 
                                               (=> 
                                                   (MS x31 x32 s2) 
                                                   (and 
                                                       (<= 1 x31) 
                                                       (<= x31 n1)))) 
                                           (forall ((x33 Int) (x34 A) (x35 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x33 x34 s2) 
                                                       (MS x33 x35 s2)) 
                                                   (= x34 x35))) 
                                           (forall ((x36 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x36) 
                                                       (<= x36 n1)) 
                                                   (exists ((x37 A)) 
                                                       (MS x36 x37 s2)))))) 
                                   (forall ((x38 Int) (x39 A)) 
                                       (= 
                                           (MS x38 x39 x29) 
                                           (MS x38 x39 s2))))) 
                           (<= 0 x30)))) 
               (forall ((x40 PZA) (x41 Int) (x42 Int)) 
                   (=> 
                       (and 
                           (length x40 x41) 
                           (length x40 x42)) 
                       (= x41 x42))) 
               (forall ((x43 PZA)) 
                   (=> 
                       (exists ((s3 PZA)) 
                           (and 
                               (exists ((n2 Int)) 
                                   (and 
                                       (<= 0 n2) 
                                       (forall ((x44 Int) (x45 A)) 
                                           (=> 
                                               (MS x44 x45 s3) 
                                               (and 
                                                   (<= 1 x44) 
                                                   (<= x44 n2)))) 
                                       (forall ((x46 Int) (x47 A) (x48 A)) 
                                           (=> 
                                               (and 
                                                   (MS x46 x47 s3) 
                                                   (MS x46 x48 s3)) 
                                               (= x47 x48))) 
                                       (forall ((x49 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x49) 
                                                   (<= x49 n2)) 
                                               (exists ((x50 A)) 
                                                   (MS x49 x50 s3)))))) 
                               (forall ((x51 Int) (x52 A)) 
                                   (= 
                                       (MS x51 x52 x43) 
                                       (MS x51 x52 s3))))) 
                       (exists ((x53 Int)) 
                           (length x43 x53)))))
         :named hyp6))
(assert (! (forall ((n3 Int) (s4 PZA)) 
               (=> 
                   (and 
                       (<= 0 n3) 
                       (forall ((x54 Int) (x55 A)) 
                           (=> 
                               (MS x54 x55 s4) 
                               (and 
                                   (<= 1 x54) 
                                   (<= x54 n3)))) 
                       (forall ((x56 Int) (x57 A) (x58 A)) 
                           (=> 
                               (and 
                                   (MS x56 x57 s4) 
                                   (MS x56 x58 s4)) 
                               (= x57 x58))) 
                       (forall ((x59 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x59) 
                                   (<= x59 n3)) 
                               (exists ((x60 A)) 
                                   (MS x59 x60 s4))))) 
                   (exists ((n4 Int)) 
                       (and 
                           (<= 0 n4) 
                           (forall ((x61 Int) (x62 A)) 
                               (=> 
                                   (MS x61 x62 s4) 
                                   (and 
                                       (<= 1 x61) 
                                       (<= x61 n4)))) 
                           (forall ((x63 Int) (x64 A) (x65 A)) 
                               (=> 
                                   (and 
                                       (MS x63 x64 s4) 
                                       (MS x63 x65 s4)) 
                                   (= x64 x65))) 
                           (forall ((x66 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x66) 
                                       (<= x66 n4)) 
                                   (exists ((x67 A)) 
                                       (MS x66 x67 s4))))))))
         :named hyp7))
(assert (! (forall ((s5 PZA)) 
               (=> 
                   (exists ((n5 Int)) 
                       (and 
                           (<= 0 n5) 
                           (forall ((x68 Int) (x69 A)) 
                               (=> 
                                   (MS x68 x69 s5) 
                                   (and 
                                       (<= 1 x68) 
                                       (<= x68 n5)))) 
                           (forall ((x70 Int) (x71 A) (x72 A)) 
                               (=> 
                                   (and 
                                       (MS x70 x71 s5) 
                                       (MS x70 x72 s5)) 
                                   (= x71 x72))) 
                           (forall ((x73 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x73) 
                                       (<= x73 n5)) 
                                   (exists ((x74 A)) 
                                       (MS x73 x74 s5)))))) 
                   (and 
                       (forall ((x75 Int) (x76 A)) 
                           (=> 
                               (MS x75 x76 s5) 
                               (and 
                                   (<= 1 x75) 
                                   (forall ((x77 Int)) 
                                       (=> 
                                           (length s5 x77) 
                                           (<= x75 x77)))))) 
                       (forall ((x78 Int) (x79 A) (x80 A)) 
                           (=> 
                               (and 
                                   (MS x78 x79 s5) 
                                   (MS x78 x80 s5)) 
                               (= x79 x80))) 
                       (forall ((x81 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x81) 
                                   (forall ((x82 Int)) 
                                       (=> 
                                           (length s5 x82) 
                                           (<= x81 x82)))) 
                               (exists ((x83 A)) 
                                   (MS x81 x83 s5)))))))
         :named hyp8))
(assert (! (forall ((x84 PZA) (x85 PZA) (x86 PZA)) 
               (= 
                   (cnc x84 x85 x86) 
                   (exists ((s10 PZA) (s20 PZA)) 
                       (and 
                           (exists ((n6 Int)) 
                               (and 
                                   (<= 0 n6) 
                                   (forall ((x87 Int) (x88 A)) 
                                       (=> 
                                           (MS x87 x88 s10) 
                                           (and 
                                               (<= 1 x87) 
                                               (<= x87 n6)))) 
                                   (forall ((x89 Int) (x90 A) (x91 A)) 
                                       (=> 
                                           (and 
                                               (MS x89 x90 s10) 
                                               (MS x89 x91 s10)) 
                                           (= x90 x91))) 
                                   (forall ((x92 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x92) 
                                               (<= x92 n6)) 
                                           (exists ((x93 A)) 
                                               (MS x92 x93 s10)))))) 
                           (exists ((n7 Int)) 
                               (and 
                                   (<= 0 n7) 
                                   (forall ((x94 Int) (x95 A)) 
                                       (=> 
                                           (MS x94 x95 s20) 
                                           (and 
                                               (<= 1 x94) 
                                               (<= x94 n7)))) 
                                   (forall ((x96 Int) (x97 A) (x98 A)) 
                                       (=> 
                                           (and 
                                               (MS x96 x97 s20) 
                                               (MS x96 x98 s20)) 
                                           (= x97 x98))) 
                                   (forall ((x99 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x99) 
                                               (<= x99 n7)) 
                                           (exists ((x100 A)) 
                                               (MS x99 x100 s20)))))) 
                           (forall ((x101 Int) (x102 A)) 
                               (= 
                                   (MS x101 x102 x84) 
                                   (MS x101 x102 s10))) 
                           (forall ((x103 Int) (x104 A)) 
                               (= 
                                   (MS x103 x104 x85) 
                                   (MS x103 x104 s20))) 
                           (forall ((x105 Int) (x106 A)) 
                               (= 
                                   (MS x105 x106 x86) 
                                   (or 
                                       (exists ((i0 Int)) 
                                           (and 
                                               (<= 1 i0) 
                                               (forall ((x107 Int)) 
                                                   (=> 
                                                       (length s10 x107) 
                                                       (<= i0 x107))) 
                                               (= x105 i0) 
                                               (MS i0 x106 s10))) 
                                       (exists ((i1 Int)) 
                                           (and 
                                               (forall ((x108 Int)) 
                                                   (=> 
                                                       (length s10 x108) 
                                                       (<= (+ x108 1) i1))) 
                                               (forall ((x109 Int) (x110 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s10 x110) 
                                                           (length s20 x109)) 
                                                       (<= i1 (+ x110 x109)))) 
                                               (= x105 i1) 
                                               (exists ((x111 Int)) 
                                                   (and 
                                                       (forall ((x112 Int)) 
                                                           (=> 
                                                               (length s10 x112) 
                                                               (= x111 (- i1 x112)))) 
                                                       (MS x111 x106 s20))))))))))))
         :named hyp9))
(assert (! (forall ((x113 A) (x114 A) (x115 PZA)) 
               (= 
                   (path x113 x114 x115) 
                   (exists ((x116 A) (y A) (p PZA)) 
                       (and 
                           (exists ((n8 Int)) 
                               (and 
                                   (<= 0 n8) 
                                   (forall ((x117 Int) (x118 A)) 
                                       (=> 
                                           (MS x117 x118 p) 
                                           (and 
                                               (<= 1 x117) 
                                               (<= x117 n8)))) 
                                   (forall ((x119 Int) (x120 A) (x121 A)) 
                                       (=> 
                                           (and 
                                               (MS x119 x120 p) 
                                               (MS x119 x121 p)) 
                                           (= x120 x121))) 
                                   (forall ((x122 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x122) 
                                               (<= x122 n8)) 
                                           (exists ((x123 A)) 
                                               (MS x122 x123 p)))))) 
                           (forall ((x124 A)) 
                               (=> 
                                   (exists ((x125 Int)) 
                                       (MS x125 x124 p)) 
                                   (MS1 x124 a))) 
                           (forall ((x126 Int)) 
                               (=> 
                                   (length p x126) 
                                   (< 1 x126))) 
                           (exists ((x127 Int)) 
                               (and 
                                   (= x127 1) 
                                   (MS x127 x116 p))) 
                           (exists ((x128 Int)) 
                               (and 
                                   (length p x128) 
                                   (MS x128 y p))) 
                           (forall ((i2 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 i2) 
                                       (forall ((x129 Int)) 
                                           (=> 
                                               (length p x129) 
                                               (<= i2 (- x129 1))))) 
                                   (exists ((x130 A) (x131 A)) 
                                       (and 
                                           (MS i2 x130 p) 
                                           (exists ((x132 Int)) 
                                               (and 
                                                   (= x132 (+ i2 1)) 
                                                   (MS x132 x131 p))) 
                                           (MS0 x130 x131 r))))) 
                           (= x113 x116) 
                           (= x114 y) 
                           (forall ((x133 Int) (x134 A)) 
                               (= 
                                   (MS x133 x134 x115) 
                                   (MS x133 x134 p)))))))
         :named hyp10))
(assert (! (exists ((n9 Int)) 
               (and 
                   (<= 0 n9) 
                   (forall ((x135 Int) (x136 A)) 
                       (=> 
                           (MS x135 x136 s) 
                           (and 
                               (<= 1 x135) 
                               (<= x135 n9)))) 
                   (forall ((x137 Int) (x138 A) (x139 A)) 
                       (=> 
                           (and 
                               (MS x137 x138 s) 
                               (MS x137 x139 s)) 
                           (= x138 x139))) 
                   (forall ((x140 Int)) 
                       (=> 
                           (and 
                               (<= 1 x140) 
                               (<= x140 n9)) 
                           (exists ((x141 A)) 
                               (MS x140 x141 s))))))
         :named hyp11))
(assert (! (and 
               (forall ((x142 PZA) (x143 PZA) (x144 PZA)) 
                   (=> 
                       (exists ((s11 PZA) (s21 PZA)) 
                           (and 
                               (exists ((n10 Int)) 
                                   (and 
                                       (<= 0 n10) 
                                       (forall ((x145 Int) (x146 A)) 
                                           (=> 
                                               (MS x145 x146 s11) 
                                               (and 
                                                   (<= 1 x145) 
                                                   (<= x145 n10)))) 
                                       (forall ((x147 Int) (x148 A) (x149 A)) 
                                           (=> 
                                               (and 
                                                   (MS x147 x148 s11) 
                                                   (MS x147 x149 s11)) 
                                               (= x148 x149))) 
                                       (forall ((x150 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x150) 
                                                   (<= x150 n10)) 
                                               (exists ((x151 A)) 
                                                   (MS x150 x151 s11)))))) 
                               (exists ((n11 Int)) 
                                   (and 
                                       (<= 0 n11) 
                                       (forall ((x152 Int) (x153 A)) 
                                           (=> 
                                               (MS x152 x153 s21) 
                                               (and 
                                                   (<= 1 x152) 
                                                   (<= x152 n11)))) 
                                       (forall ((x154 Int) (x155 A) (x156 A)) 
                                           (=> 
                                               (and 
                                                   (MS x154 x155 s21) 
                                                   (MS x154 x156 s21)) 
                                               (= x155 x156))) 
                                       (forall ((x157 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x157) 
                                                   (<= x157 n11)) 
                                               (exists ((x158 A)) 
                                                   (MS x157 x158 s21)))))) 
                               (forall ((x159 Int) (x160 A)) 
                                   (= 
                                       (MS x159 x160 x142) 
                                       (MS x159 x160 s11))) 
                               (forall ((x161 Int) (x162 A)) 
                                   (= 
                                       (MS x161 x162 x143) 
                                       (MS x161 x162 s21))) 
                               (forall ((x163 Int) (x164 A)) 
                                   (= 
                                       (MS x163 x164 x144) 
                                       (or 
                                           (exists ((i3 Int)) 
                                               (and 
                                                   (<= 1 i3) 
                                                   (forall ((x165 Int)) 
                                                       (=> 
                                                           (length s11 x165) 
                                                           (<= i3 x165))) 
                                                   (= x163 i3) 
                                                   (MS i3 x164 s11))) 
                                           (exists ((i4 Int)) 
                                               (and 
                                                   (forall ((x166 Int)) 
                                                       (=> 
                                                           (length s11 x166) 
                                                           (<= (+ x166 1) i4))) 
                                                   (forall ((x167 Int) (x168 Int)) 
                                                       (=> 
                                                           (and 
                                                               (length s11 x168) 
                                                               (length s21 x167)) 
                                                           (<= i4 (+ x168 x167)))) 
                                                   (= x163 i4) 
                                                   (exists ((x169 Int)) 
                                                       (and 
                                                           (forall ((x170 Int)) 
                                                               (=> 
                                                                   (length s11 x170) 
                                                                   (= x169 (- i4 x170)))) 
                                                           (MS x169 x164 s21)))))))))) 
                       (and 
                           (exists ((s6 PZA)) 
                               (and 
                                   (exists ((n12 Int)) 
                                       (and 
                                           (<= 0 n12) 
                                           (forall ((x171 Int) (x172 A)) 
                                               (=> 
                                                   (MS x171 x172 s6) 
                                                   (and 
                                                       (<= 1 x171) 
                                                       (<= x171 n12)))) 
                                           (forall ((x173 Int) (x174 A) (x175 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x173 x174 s6) 
                                                       (MS x173 x175 s6)) 
                                                   (= x174 x175))) 
                                           (forall ((x176 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x176) 
                                                       (<= x176 n12)) 
                                                   (exists ((x177 A)) 
                                                       (MS x176 x177 s6)))))) 
                                   (forall ((x178 Int) (x179 A)) 
                                       (= 
                                           (MS x178 x179 x142) 
                                           (MS x178 x179 s6))))) 
                           (exists ((s7 PZA)) 
                               (and 
                                   (exists ((n13 Int)) 
                                       (and 
                                           (<= 0 n13) 
                                           (forall ((x180 Int) (x181 A)) 
                                               (=> 
                                                   (MS x180 x181 s7) 
                                                   (and 
                                                       (<= 1 x180) 
                                                       (<= x180 n13)))) 
                                           (forall ((x182 Int) (x183 A) (x184 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x182 x183 s7) 
                                                       (MS x182 x184 s7)) 
                                                   (= x183 x184))) 
                                           (forall ((x185 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x185) 
                                                       (<= x185 n13)) 
                                                   (exists ((x186 A)) 
                                                       (MS x185 x186 s7)))))) 
                                   (forall ((x187 Int) (x188 A)) 
                                       (= 
                                           (MS x187 x188 x143) 
                                           (MS x187 x188 s7))))) 
                           (exists ((s8 PZA)) 
                               (and 
                                   (exists ((n14 Int)) 
                                       (and 
                                           (<= 0 n14) 
                                           (forall ((x189 Int) (x190 A)) 
                                               (=> 
                                                   (MS x189 x190 s8) 
                                                   (and 
                                                       (<= 1 x189) 
                                                       (<= x189 n14)))) 
                                           (forall ((x191 Int) (x192 A) (x193 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x191 x192 s8) 
                                                       (MS x191 x193 s8)) 
                                                   (= x192 x193))) 
                                           (forall ((x194 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x194) 
                                                       (<= x194 n14)) 
                                                   (exists ((x195 A)) 
                                                       (MS x194 x195 s8)))))) 
                                   (forall ((x196 Int) (x197 A)) 
                                       (= 
                                           (MS x196 x197 x144) 
                                           (MS x196 x197 s8)))))))) 
               (forall ((x198 PZA) (x199 PZA) (x200 PZA) (x201 PZA)) 
                   (=> 
                       (and 
                           (exists ((s12 PZA) (s22 PZA)) 
                               (and 
                                   (exists ((n15 Int)) 
                                       (and 
                                           (<= 0 n15) 
                                           (forall ((x202 Int) (x203 A)) 
                                               (=> 
                                                   (MS x202 x203 s12) 
                                                   (and 
                                                       (<= 1 x202) 
                                                       (<= x202 n15)))) 
                                           (forall ((x204 Int) (x205 A) (x206 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x204 x205 s12) 
                                                       (MS x204 x206 s12)) 
                                                   (= x205 x206))) 
                                           (forall ((x207 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x207) 
                                                       (<= x207 n15)) 
                                                   (exists ((x208 A)) 
                                                       (MS x207 x208 s12)))))) 
                                   (exists ((n16 Int)) 
                                       (and 
                                           (<= 0 n16) 
                                           (forall ((x209 Int) (x210 A)) 
                                               (=> 
                                                   (MS x209 x210 s22) 
                                                   (and 
                                                       (<= 1 x209) 
                                                       (<= x209 n16)))) 
                                           (forall ((x211 Int) (x212 A) (x213 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x211 x212 s22) 
                                                       (MS x211 x213 s22)) 
                                                   (= x212 x213))) 
                                           (forall ((x214 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x214) 
                                                       (<= x214 n16)) 
                                                   (exists ((x215 A)) 
                                                       (MS x214 x215 s22)))))) 
                                   (forall ((x216 Int) (x217 A)) 
                                       (= 
                                           (MS x216 x217 x198) 
                                           (MS x216 x217 s12))) 
                                   (forall ((x218 Int) (x219 A)) 
                                       (= 
                                           (MS x218 x219 x199) 
                                           (MS x218 x219 s22))) 
                                   (forall ((x220 Int) (x221 A)) 
                                       (= 
                                           (MS x220 x221 x200) 
                                           (or 
                                               (exists ((i5 Int)) 
                                                   (and 
                                                       (<= 1 i5) 
                                                       (forall ((x222 Int)) 
                                                           (=> 
                                                               (length s12 x222) 
                                                               (<= i5 x222))) 
                                                       (= x220 i5) 
                                                       (MS i5 x221 s12))) 
                                               (exists ((i6 Int)) 
                                                   (and 
                                                       (forall ((x223 Int)) 
                                                           (=> 
                                                               (length s12 x223) 
                                                               (<= (+ x223 1) i6))) 
                                                       (forall ((x224 Int) (x225 Int)) 
                                                           (=> 
                                                               (and 
                                                                   (length s12 x225) 
                                                                   (length s22 x224)) 
                                                               (<= i6 (+ x225 x224)))) 
                                                       (= x220 i6) 
                                                       (exists ((x226 Int)) 
                                                           (and 
                                                               (forall ((x227 Int)) 
                                                                   (=> 
                                                                       (length s12 x227) 
                                                                       (= x226 (- i6 x227)))) 
                                                               (MS x226 x221 s22)))))))))) 
                           (exists ((s13 PZA) (s23 PZA)) 
                               (and 
                                   (exists ((n17 Int)) 
                                       (and 
                                           (<= 0 n17) 
                                           (forall ((x228 Int) (x229 A)) 
                                               (=> 
                                                   (MS x228 x229 s13) 
                                                   (and 
                                                       (<= 1 x228) 
                                                       (<= x228 n17)))) 
                                           (forall ((x230 Int) (x231 A) (x232 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x230 x231 s13) 
                                                       (MS x230 x232 s13)) 
                                                   (= x231 x232))) 
                                           (forall ((x233 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x233) 
                                                       (<= x233 n17)) 
                                                   (exists ((x234 A)) 
                                                       (MS x233 x234 s13)))))) 
                                   (exists ((n18 Int)) 
                                       (and 
                                           (<= 0 n18) 
                                           (forall ((x235 Int) (x236 A)) 
                                               (=> 
                                                   (MS x235 x236 s23) 
                                                   (and 
                                                       (<= 1 x235) 
                                                       (<= x235 n18)))) 
                                           (forall ((x237 Int) (x238 A) (x239 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x237 x238 s23) 
                                                       (MS x237 x239 s23)) 
                                                   (= x238 x239))) 
                                           (forall ((x240 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x240) 
                                                       (<= x240 n18)) 
                                                   (exists ((x241 A)) 
                                                       (MS x240 x241 s23)))))) 
                                   (forall ((x242 Int) (x243 A)) 
                                       (= 
                                           (MS x242 x243 x198) 
                                           (MS x242 x243 s13))) 
                                   (forall ((x244 Int) (x245 A)) 
                                       (= 
                                           (MS x244 x245 x199) 
                                           (MS x244 x245 s23))) 
                                   (forall ((x246 Int) (x247 A)) 
                                       (= 
                                           (MS x246 x247 x201) 
                                           (or 
                                               (exists ((i7 Int)) 
                                                   (and 
                                                       (<= 1 i7) 
                                                       (forall ((x248 Int)) 
                                                           (=> 
                                                               (length s13 x248) 
                                                               (<= i7 x248))) 
                                                       (= x246 i7) 
                                                       (MS i7 x247 s13))) 
                                               (exists ((i8 Int)) 
                                                   (and 
                                                       (forall ((x249 Int)) 
                                                           (=> 
                                                               (length s13 x249) 
                                                               (<= (+ x249 1) i8))) 
                                                       (forall ((x250 Int) (x251 Int)) 
                                                           (=> 
                                                               (and 
                                                                   (length s13 x251) 
                                                                   (length s23 x250)) 
                                                               (<= i8 (+ x251 x250)))) 
                                                       (= x246 i8) 
                                                       (exists ((x252 Int)) 
                                                           (and 
                                                               (forall ((x253 Int)) 
                                                                   (=> 
                                                                       (length s13 x253) 
                                                                       (= x252 (- i8 x253)))) 
                                                               (MS x252 x247 s23))))))))))) 
                       (forall ((x254 Int) (x255 A)) 
                           (= 
                               (MS x254 x255 x200) 
                               (MS x254 x255 x201))))) 
               (forall ((x256 PZA) (x257 PZA)) 
                   (=> 
                       (and 
                           (exists ((s9 PZA)) 
                               (and 
                                   (exists ((n19 Int)) 
                                       (and 
                                           (<= 0 n19) 
                                           (forall ((x258 Int) (x259 A)) 
                                               (=> 
                                                   (MS x258 x259 s9) 
                                                   (and 
                                                       (<= 1 x258) 
                                                       (<= x258 n19)))) 
                                           (forall ((x260 Int) (x261 A) (x262 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x260 x261 s9) 
                                                       (MS x260 x262 s9)) 
                                                   (= x261 x262))) 
                                           (forall ((x263 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x263) 
                                                       (<= x263 n19)) 
                                                   (exists ((x264 A)) 
                                                       (MS x263 x264 s9)))))) 
                                   (forall ((x265 Int) (x266 A)) 
                                       (= 
                                           (MS x265 x266 x256) 
                                           (MS x265 x266 s9))))) 
                           (exists ((s14 PZA)) 
                               (and 
                                   (exists ((n20 Int)) 
                                       (and 
                                           (<= 0 n20) 
                                           (forall ((x267 Int) (x268 A)) 
                                               (=> 
                                                   (MS x267 x268 s14) 
                                                   (and 
                                                       (<= 1 x267) 
                                                       (<= x267 n20)))) 
                                           (forall ((x269 Int) (x270 A) (x271 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x269 x270 s14) 
                                                       (MS x269 x271 s14)) 
                                                   (= x270 x271))) 
                                           (forall ((x272 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x272) 
                                                       (<= x272 n20)) 
                                                   (exists ((x273 A)) 
                                                       (MS x272 x273 s14)))))) 
                                   (forall ((x274 Int) (x275 A)) 
                                       (= 
                                           (MS x274 x275 x257) 
                                           (MS x274 x275 s14)))))) 
                       (exists ((x276 PZA) (s15 PZA) (s24 PZA)) 
                           (and 
                               (exists ((n21 Int)) 
                                   (and 
                                       (<= 0 n21) 
                                       (forall ((x277 Int) (x278 A)) 
                                           (=> 
                                               (MS x277 x278 s15) 
                                               (and 
                                                   (<= 1 x277) 
                                                   (<= x277 n21)))) 
                                       (forall ((x279 Int) (x280 A) (x281 A)) 
                                           (=> 
                                               (and 
                                                   (MS x279 x280 s15) 
                                                   (MS x279 x281 s15)) 
                                               (= x280 x281))) 
                                       (forall ((x282 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x282) 
                                                   (<= x282 n21)) 
                                               (exists ((x283 A)) 
                                                   (MS x282 x283 s15)))))) 
                               (exists ((n22 Int)) 
                                   (and 
                                       (<= 0 n22) 
                                       (forall ((x284 Int) (x285 A)) 
                                           (=> 
                                               (MS x284 x285 s24) 
                                               (and 
                                                   (<= 1 x284) 
                                                   (<= x284 n22)))) 
                                       (forall ((x286 Int) (x287 A) (x288 A)) 
                                           (=> 
                                               (and 
                                                   (MS x286 x287 s24) 
                                                   (MS x286 x288 s24)) 
                                               (= x287 x288))) 
                                       (forall ((x289 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x289) 
                                                   (<= x289 n22)) 
                                               (exists ((x290 A)) 
                                                   (MS x289 x290 s24)))))) 
                               (forall ((x291 Int) (x292 A)) 
                                   (= 
                                       (MS x291 x292 x256) 
                                       (MS x291 x292 s15))) 
                               (forall ((x293 Int) (x294 A)) 
                                   (= 
                                       (MS x293 x294 x257) 
                                       (MS x293 x294 s24))) 
                               (forall ((x295 Int) (x296 A)) 
                                   (= 
                                       (MS x295 x296 x276) 
                                       (or 
                                           (exists ((i9 Int)) 
                                               (and 
                                                   (<= 1 i9) 
                                                   (forall ((x297 Int)) 
                                                       (=> 
                                                           (length s15 x297) 
                                                           (<= i9 x297))) 
                                                   (= x295 i9) 
                                                   (MS i9 x296 s15))) 
                                           (exists ((i10 Int)) 
                                               (and 
                                                   (forall ((x298 Int)) 
                                                       (=> 
                                                           (length s15 x298) 
                                                           (<= (+ x298 1) i10))) 
                                                   (forall ((x299 Int) (x300 Int)) 
                                                       (=> 
                                                           (and 
                                                               (length s15 x300) 
                                                               (length s24 x299)) 
                                                           (<= i10 (+ x300 x299)))) 
                                                   (= x295 i10) 
                                                   (exists ((x301 Int)) 
                                                       (and 
                                                           (forall ((x302 Int)) 
                                                               (=> 
                                                                   (length s15 x302) 
                                                                   (= x301 (- i10 x302)))) 
                                                           (MS x301 x296 s24)))))))))))))
         :named hyp12))
(assert (! (forall ((s16 PZA) (s25 PZA)) 
               (=> 
                   (and 
                       (exists ((n23 Int)) 
                           (and 
                               (<= 0 n23) 
                               (forall ((x303 Int) (x304 A)) 
                                   (=> 
                                       (MS x303 x304 s16) 
                                       (and 
                                           (<= 1 x303) 
                                           (<= x303 n23)))) 
                               (forall ((x305 Int) (x306 A) (x307 A)) 
                                   (=> 
                                       (and 
                                           (MS x305 x306 s16) 
                                           (MS x305 x307 s16)) 
                                       (= x306 x307))) 
                               (forall ((x308 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x308) 
                                           (<= x308 n23)) 
                                       (exists ((x309 A)) 
                                           (MS x308 x309 s16)))))) 
                       (exists ((n24 Int)) 
                           (and 
                               (<= 0 n24) 
                               (forall ((x310 Int) (x311 A)) 
                                   (=> 
                                       (MS x310 x311 s25) 
                                       (and 
                                           (<= 1 x310) 
                                           (<= x310 n24)))) 
                               (forall ((x312 Int) (x313 A) (x314 A)) 
                                   (=> 
                                       (and 
                                           (MS x312 x313 s25) 
                                           (MS x312 x314 s25)) 
                                       (= x313 x314))) 
                               (forall ((x315 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x315) 
                                           (<= x315 n24)) 
                                       (exists ((x316 A)) 
                                           (MS x315 x316 s25))))))) 
                   (exists ((x317 PZA) (x318 Int)) 
                       (and 
                           (forall ((x319 Int) (x320 A)) 
                               (= 
                                   (MS x319 x320 x317) 
                                   (or 
                                       (exists ((i11 Int)) 
                                           (and 
                                               (<= 1 i11) 
                                               (forall ((x321 Int)) 
                                                   (=> 
                                                       (length s16 x321) 
                                                       (<= i11 x321))) 
                                               (= x319 i11) 
                                               (MS i11 x320 s16))) 
                                       (exists ((i12 Int)) 
                                           (and 
                                               (forall ((x322 Int)) 
                                                   (=> 
                                                       (length s16 x322) 
                                                       (<= (+ x322 1) i12))) 
                                               (forall ((x323 Int) (x324 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s16 x324) 
                                                           (length s25 x323)) 
                                                       (<= i12 (+ x324 x323)))) 
                                               (= x319 i12) 
                                               (exists ((x325 Int)) 
                                                   (and 
                                                       (forall ((x326 Int)) 
                                                           (=> 
                                                               (length s16 x326) 
                                                               (= x325 (- i12 x326)))) 
                                                       (MS x325 x320 s25)))))))) 
                           (forall ((x327 Int) (x328 Int)) 
                               (=> 
                                   (and 
                                       (length s16 x328) 
                                       (length s25 x327)) 
                                   (= x318 (+ x328 x327)))) 
                           (length x317 x318)))))
         :named hyp13))
(assert (! (forall ((s17 PZA) (s26 PZA)) 
               (=> 
                   (and 
                       (exists ((n25 Int)) 
                           (and 
                               (<= 0 n25) 
                               (forall ((x329 Int) (x330 A)) 
                                   (=> 
                                       (MS x329 x330 s17) 
                                       (and 
                                           (<= 1 x329) 
                                           (<= x329 n25)))) 
                               (forall ((x331 Int) (x332 A) (x333 A)) 
                                   (=> 
                                       (and 
                                           (MS x331 x332 s17) 
                                           (MS x331 x333 s17)) 
                                       (= x332 x333))) 
                               (forall ((x334 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x334) 
                                           (<= x334 n25)) 
                                       (exists ((x335 A)) 
                                           (MS x334 x335 s17)))))) 
                       (exists ((n26 Int)) 
                           (and 
                               (<= 0 n26) 
                               (forall ((x336 Int) (x337 A)) 
                                   (=> 
                                       (MS x336 x337 s26) 
                                       (and 
                                           (<= 1 x336) 
                                           (<= x336 n26)))) 
                               (forall ((x338 Int) (x339 A) (x340 A)) 
                                   (=> 
                                       (and 
                                           (MS x338 x339 s26) 
                                           (MS x338 x340 s26)) 
                                       (= x339 x340))) 
                               (forall ((x341 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x341) 
                                           (<= x341 n26)) 
                                       (exists ((x342 A)) 
                                           (MS x341 x342 s26))))))) 
                   (forall ((x343 Int)) 
                       (= 
                           (or 
                               (exists ((x344 A)) 
                                   (exists ((i13 Int)) 
                                       (and 
                                           (<= 1 i13) 
                                           (forall ((x345 Int)) 
                                               (=> 
                                                   (length s17 x345) 
                                                   (<= i13 x345))) 
                                           (= x343 i13) 
                                           (MS i13 x344 s17)))) 
                               (exists ((x346 A)) 
                                   (exists ((i14 Int)) 
                                       (and 
                                           (forall ((x347 Int)) 
                                               (=> 
                                                   (length s17 x347) 
                                                   (<= (+ x347 1) i14))) 
                                           (forall ((x348 Int) (x349 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s17 x349) 
                                                       (length s26 x348)) 
                                                   (<= i14 (+ x349 x348)))) 
                                           (= x343 i14) 
                                           (exists ((x350 Int)) 
                                               (and 
                                                   (forall ((x351 Int)) 
                                                       (=> 
                                                           (length s17 x351) 
                                                           (= x350 (- i14 x351)))) 
                                                   (MS x350 x346 s26))))))) 
                           (and 
                               (<= 1 x343) 
                               (forall ((x352 Int) (x353 Int)) 
                                   (=> 
                                       (and 
                                           (length s17 x353) 
                                           (length s26 x352)) 
                                       (<= x343 (+ x353 x352)))))))))
         :named hyp14))
(assert (! (forall ((s18 PZA) (s27 PZA)) 
               (=> 
                   (and 
                       (exists ((n27 Int)) 
                           (and 
                               (<= 0 n27) 
                               (forall ((x354 Int) (x355 A)) 
                                   (=> 
                                       (MS x354 x355 s18) 
                                       (and 
                                           (<= 1 x354) 
                                           (<= x354 n27)))) 
                               (forall ((x356 Int) (x357 A) (x358 A)) 
                                   (=> 
                                       (and 
                                           (MS x356 x357 s18) 
                                           (MS x356 x358 s18)) 
                                       (= x357 x358))) 
                               (forall ((x359 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x359) 
                                           (<= x359 n27)) 
                                       (exists ((x360 A)) 
                                           (MS x359 x360 s18)))))) 
                       (exists ((n28 Int)) 
                           (and 
                               (<= 0 n28) 
                               (forall ((x361 Int) (x362 A)) 
                                   (=> 
                                       (MS x361 x362 s27) 
                                       (and 
                                           (<= 1 x361) 
                                           (<= x361 n28)))) 
                               (forall ((x363 Int) (x364 A) (x365 A)) 
                                   (=> 
                                       (and 
                                           (MS x363 x364 s27) 
                                           (MS x363 x365 s27)) 
                                       (= x364 x365))) 
                               (forall ((x366 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x366) 
                                           (<= x366 n28)) 
                                       (exists ((x367 A)) 
                                           (MS x366 x367 s27))))))) 
                   (forall ((x368 A)) 
                       (= 
                           (or 
                               (exists ((x369 Int)) 
                                   (exists ((i15 Int)) 
                                       (and 
                                           (<= 1 i15) 
                                           (forall ((x370 Int)) 
                                               (=> 
                                                   (length s18 x370) 
                                                   (<= i15 x370))) 
                                           (= x369 i15) 
                                           (MS i15 x368 s18)))) 
                               (exists ((x371 Int)) 
                                   (exists ((i16 Int)) 
                                       (and 
                                           (forall ((x372 Int)) 
                                               (=> 
                                                   (length s18 x372) 
                                                   (<= (+ x372 1) i16))) 
                                           (forall ((x373 Int) (x374 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s18 x374) 
                                                       (length s27 x373)) 
                                                   (<= i16 (+ x374 x373)))) 
                                           (= x371 i16) 
                                           (exists ((x375 Int)) 
                                               (and 
                                                   (forall ((x376 Int)) 
                                                       (=> 
                                                           (length s18 x376) 
                                                           (= x375 (- i16 x376)))) 
                                                   (MS x375 x368 s27))))))) 
                           (or 
                               (exists ((x377 Int)) 
                                   (MS x377 x368 s18)) 
                               (exists ((x378 Int)) 
                                   (MS x378 x368 s27)))))))
         :named hyp15))
(assert (! (forall ((s19 PZA) (s28 PZA) (i17 Int)) 
               (=> 
                   (and 
                       (exists ((n29 Int)) 
                           (and 
                               (<= 0 n29) 
                               (forall ((x379 Int) (x380 A)) 
                                   (=> 
                                       (MS x379 x380 s19) 
                                       (and 
                                           (<= 1 x379) 
                                           (<= x379 n29)))) 
                               (forall ((x381 Int) (x382 A) (x383 A)) 
                                   (=> 
                                       (and 
                                           (MS x381 x382 s19) 
                                           (MS x381 x383 s19)) 
                                       (= x382 x383))) 
                               (forall ((x384 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x384) 
                                           (<= x384 n29)) 
                                       (exists ((x385 A)) 
                                           (MS x384 x385 s19)))))) 
                       (exists ((n30 Int)) 
                           (and 
                               (<= 0 n30) 
                               (forall ((x386 Int) (x387 A)) 
                                   (=> 
                                       (MS x386 x387 s28) 
                                       (and 
                                           (<= 1 x386) 
                                           (<= x386 n30)))) 
                               (forall ((x388 Int) (x389 A) (x390 A)) 
                                   (=> 
                                       (and 
                                           (MS x388 x389 s28) 
                                           (MS x388 x390 s28)) 
                                       (= x389 x390))) 
                               (forall ((x391 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x391) 
                                           (<= x391 n30)) 
                                       (exists ((x392 A)) 
                                           (MS x391 x392 s28)))))) 
                       (<= 1 i17) 
                       (forall ((x393 Int)) 
                           (=> 
                               (length s19 x393) 
                               (<= i17 x393)))) 
                   (or 
                       (exists ((i18 Int)) 
                           (and 
                               (<= 1 i18) 
                               (forall ((x394 Int)) 
                                   (=> 
                                       (length s19 x394) 
                                       (<= i18 x394))) 
                               (= i17 i18) 
                               (exists ((x395 A)) 
                                   (and 
                                       (MS i18 x395 s19) 
                                       (MS i17 x395 s19))))) 
                       (exists ((i19 Int)) 
                           (and 
                               (forall ((x396 Int)) 
                                   (=> 
                                       (length s19 x396) 
                                       (<= (+ x396 1) i19))) 
                               (forall ((x397 Int) (x398 Int)) 
                                   (=> 
                                       (and 
                                           (length s19 x398) 
                                           (length s28 x397)) 
                                       (<= i19 (+ x398 x397)))) 
                               (= i17 i19) 
                               (exists ((x399 A)) 
                                   (and 
                                       (exists ((x400 Int)) 
                                           (and 
                                               (forall ((x401 Int)) 
                                                   (=> 
                                                       (length s19 x401) 
                                                       (= x400 (- i19 x401)))) 
                                               (MS x400 x399 s28))) 
                                       (MS i17 x399 s19))))))))
         :named hyp16))
(assert (! (forall ((s110 PZA) (s29 PZA) (i20 Int)) 
               (=> 
                   (and 
                       (exists ((n31 Int)) 
                           (and 
                               (<= 0 n31) 
                               (forall ((x402 Int) (x403 A)) 
                                   (=> 
                                       (MS x402 x403 s110) 
                                       (and 
                                           (<= 1 x402) 
                                           (<= x402 n31)))) 
                               (forall ((x404 Int) (x405 A) (x406 A)) 
                                   (=> 
                                       (and 
                                           (MS x404 x405 s110) 
                                           (MS x404 x406 s110)) 
                                       (= x405 x406))) 
                               (forall ((x407 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x407) 
                                           (<= x407 n31)) 
                                       (exists ((x408 A)) 
                                           (MS x407 x408 s110)))))) 
                       (exists ((n32 Int)) 
                           (and 
                               (<= 0 n32) 
                               (forall ((x409 Int) (x410 A)) 
                                   (=> 
                                       (MS x409 x410 s29) 
                                       (and 
                                           (<= 1 x409) 
                                           (<= x409 n32)))) 
                               (forall ((x411 Int) (x412 A) (x413 A)) 
                                   (=> 
                                       (and 
                                           (MS x411 x412 s29) 
                                           (MS x411 x413 s29)) 
                                       (= x412 x413))) 
                               (forall ((x414 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x414) 
                                           (<= x414 n32)) 
                                       (exists ((x415 A)) 
                                           (MS x414 x415 s29)))))) 
                       (forall ((x416 Int)) 
                           (=> 
                               (length s110 x416) 
                               (<= (+ x416 1) i20))) 
                       (forall ((x417 Int) (x418 Int)) 
                           (=> 
                               (and 
                                   (length s110 x418) 
                                   (length s29 x417)) 
                               (<= i20 (+ x418 x417))))) 
                   (or 
                       (exists ((i21 Int)) 
                           (and 
                               (<= 1 i21) 
                               (forall ((x419 Int)) 
                                   (=> 
                                       (length s110 x419) 
                                       (<= i21 x419))) 
                               (= i20 i21) 
                               (exists ((x420 Int) (x421 A)) 
                                   (and 
                                       (forall ((x422 Int)) 
                                           (=> 
                                               (length s110 x422) 
                                               (= x420 (- i20 x422)))) 
                                       (MS i21 x421 s110) 
                                       (MS x420 x421 s29))))) 
                       (exists ((i22 Int)) 
                           (and 
                               (forall ((x423 Int)) 
                                   (=> 
                                       (length s110 x423) 
                                       (<= (+ x423 1) i22))) 
                               (forall ((x424 Int) (x425 Int)) 
                                   (=> 
                                       (and 
                                           (length s110 x425) 
                                           (length s29 x424)) 
                                       (<= i22 (+ x425 x424)))) 
                               (= i20 i22) 
                               (exists ((x426 Int) (x427 A)) 
                                   (and 
                                       (forall ((x428 Int)) 
                                           (=> 
                                               (length s110 x428) 
                                               (= x426 (- i20 x428)))) 
                                       (exists ((x429 Int)) 
                                           (and 
                                               (forall ((x430 Int)) 
                                                   (=> 
                                                       (length s110 x430) 
                                                       (= x429 (- i22 x430)))) 
                                               (MS x429 x427 s29))) 
                                       (MS x426 x427 s29))))))))
         :named hyp17))
(assert (! (forall ((s111 PZA) (s210 PZA) (b PA)) 
               (=> 
                   (and 
                       (exists ((n33 Int)) 
                           (and 
                               (<= 0 n33) 
                               (forall ((x431 Int) (x432 A)) 
                                   (=> 
                                       (MS x431 x432 s111) 
                                       (and 
                                           (<= 1 x431) 
                                           (<= x431 n33)))) 
                               (forall ((x433 Int) (x434 A) (x435 A)) 
                                   (=> 
                                       (and 
                                           (MS x433 x434 s111) 
                                           (MS x433 x435 s111)) 
                                       (= x434 x435))) 
                               (forall ((x436 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x436) 
                                           (<= x436 n33)) 
                                       (exists ((x437 A)) 
                                           (MS x436 x437 s111)))))) 
                       (exists ((n34 Int)) 
                           (and 
                               (<= 0 n34) 
                               (forall ((x438 Int) (x439 A)) 
                                   (=> 
                                       (MS x438 x439 s210) 
                                       (and 
                                           (<= 1 x438) 
                                           (<= x438 n34)))) 
                               (forall ((x440 Int) (x441 A) (x442 A)) 
                                   (=> 
                                       (and 
                                           (MS x440 x441 s210) 
                                           (MS x440 x442 s210)) 
                                       (= x441 x442))) 
                               (forall ((x443 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x443) 
                                           (<= x443 n34)) 
                                       (exists ((x444 A)) 
                                           (MS x443 x444 s210)))))) 
                       (forall ((x445 A)) 
                           (=> 
                               (exists ((x446 Int)) 
                                   (MS x446 x445 s111)) 
                               (MS1 x445 b))) 
                       (forall ((x447 A)) 
                           (=> 
                               (exists ((x448 Int)) 
                                   (MS x448 x447 s210)) 
                               (MS1 x447 b)))) 
                   (and 
                       (forall ((x449 Int) (x450 A)) 
                           (=> 
                               (or 
                                   (exists ((i23 Int)) 
                                       (and 
                                           (<= 1 i23) 
                                           (forall ((x451 Int)) 
                                               (=> 
                                                   (length s111 x451) 
                                                   (<= i23 x451))) 
                                           (= x449 i23) 
                                           (MS i23 x450 s111))) 
                                   (exists ((i24 Int)) 
                                       (and 
                                           (forall ((x452 Int)) 
                                               (=> 
                                                   (length s111 x452) 
                                                   (<= (+ x452 1) i24))) 
                                           (forall ((x453 Int) (x454 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s111 x454) 
                                                       (length s210 x453)) 
                                                   (<= i24 (+ x454 x453)))) 
                                           (= x449 i24) 
                                           (exists ((x455 Int)) 
                                               (and 
                                                   (forall ((x456 Int)) 
                                                       (=> 
                                                           (length s111 x456) 
                                                           (= x455 (- i24 x456)))) 
                                                   (MS x455 x450 s210)))))) 
                               (and 
                                   (<= 1 x449) 
                                   (forall ((x457 Int) (x458 Int)) 
                                       (=> 
                                           (and 
                                               (length s111 x458) 
                                               (length s210 x457)) 
                                           (<= x449 (+ x458 x457)))) 
                                   (MS1 x450 b)))) 
                       (forall ((x459 Int) (x460 A) (x461 A)) 
                           (=> 
                               (and 
                                   (or 
                                       (exists ((i25 Int)) 
                                           (and 
                                               (<= 1 i25) 
                                               (forall ((x462 Int)) 
                                                   (=> 
                                                       (length s111 x462) 
                                                       (<= i25 x462))) 
                                               (= x459 i25) 
                                               (MS i25 x460 s111))) 
                                       (exists ((i26 Int)) 
                                           (and 
                                               (forall ((x463 Int)) 
                                                   (=> 
                                                       (length s111 x463) 
                                                       (<= (+ x463 1) i26))) 
                                               (forall ((x464 Int) (x465 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s111 x465) 
                                                           (length s210 x464)) 
                                                       (<= i26 (+ x465 x464)))) 
                                               (= x459 i26) 
                                               (exists ((x466 Int)) 
                                                   (and 
                                                       (forall ((x467 Int)) 
                                                           (=> 
                                                               (length s111 x467) 
                                                               (= x466 (- i26 x467)))) 
                                                       (MS x466 x460 s210)))))) 
                                   (or 
                                       (exists ((i27 Int)) 
                                           (and 
                                               (<= 1 i27) 
                                               (forall ((x468 Int)) 
                                                   (=> 
                                                       (length s111 x468) 
                                                       (<= i27 x468))) 
                                               (= x459 i27) 
                                               (MS i27 x461 s111))) 
                                       (exists ((i28 Int)) 
                                           (and 
                                               (forall ((x469 Int)) 
                                                   (=> 
                                                       (length s111 x469) 
                                                       (<= (+ x469 1) i28))) 
                                               (forall ((x470 Int) (x471 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s111 x471) 
                                                           (length s210 x470)) 
                                                       (<= i28 (+ x471 x470)))) 
                                               (= x459 i28) 
                                               (exists ((x472 Int)) 
                                                   (and 
                                                       (forall ((x473 Int)) 
                                                           (=> 
                                                               (length s111 x473) 
                                                               (= x472 (- i28 x473)))) 
                                                       (MS x472 x461 s210))))))) 
                               (= x460 x461))) 
                       (forall ((x474 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x474) 
                                   (forall ((x475 Int) (x476 Int)) 
                                       (=> 
                                           (and 
                                               (length s111 x476) 
                                               (length s210 x475)) 
                                           (<= x474 (+ x476 x475))))) 
                               (or 
                                   (exists ((x477 A)) 
                                       (exists ((i29 Int)) 
                                           (and 
                                               (<= 1 i29) 
                                               (forall ((x478 Int)) 
                                                   (=> 
                                                       (length s111 x478) 
                                                       (<= i29 x478))) 
                                               (= x474 i29) 
                                               (MS i29 x477 s111)))) 
                                   (exists ((x479 A)) 
                                       (exists ((i30 Int)) 
                                           (and 
                                               (forall ((x480 Int)) 
                                                   (=> 
                                                       (length s111 x480) 
                                                       (<= (+ x480 1) i30))) 
                                               (forall ((x481 Int) (x482 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s111 x482) 
                                                           (length s210 x481)) 
                                                       (<= i30 (+ x482 x481)))) 
                                               (= x474 i30) 
                                               (exists ((x483 Int)) 
                                                   (and 
                                                       (forall ((x484 Int)) 
                                                           (=> 
                                                               (length s111 x484) 
                                                               (= x483 (- i30 x484)))) 
                                                       (MS x483 x479 s210))))))))))))
         :named hyp18))
(assert (! (forall ((x485 A) (y0 A)) 
               (=> 
                   (and 
                       (MS1 x485 a) 
                       (MS1 y0 a)) 
                   (exists ((x486 Int)) 
                       (and 
                           (exists ((x487 PZA)) 
                               (and 
                                   (exists ((x488 A) (x489 A)) 
                                       (and 
                                           (= x488 x485) 
                                           (= x489 y0) 
                                           (exists ((x490 A) (y1 A) (p0 PZA)) 
                                               (and 
                                                   (exists ((n35 Int)) 
                                                       (and 
                                                           (<= 0 n35) 
                                                           (forall ((x491 Int) (x492 A)) 
                                                               (=> 
                                                                   (MS x491 x492 p0) 
                                                                   (and 
                                                                       (<= 1 x491) 
                                                                       (<= x491 n35)))) 
                                                           (forall ((x493 Int) (x494 A) (x495 A)) 
                                                               (=> 
                                                                   (and 
                                                                       (MS x493 x494 p0) 
                                                                       (MS x493 x495 p0)) 
                                                                   (= x494 x495))) 
                                                           (forall ((x496 Int)) 
                                                               (=> 
                                                                   (and 
                                                                       (<= 1 x496) 
                                                                       (<= x496 n35)) 
                                                                   (exists ((x497 A)) 
                                                                       (MS x496 x497 p0)))))) 
                                                   (forall ((x498 A)) 
                                                       (=> 
                                                           (exists ((x499 Int)) 
                                                               (MS x499 x498 p0)) 
                                                           (MS1 x498 a))) 
                                                   (forall ((x500 Int)) 
                                                       (=> 
                                                           (length p0 x500) 
                                                           (< 1 x500))) 
                                                   (exists ((x501 Int)) 
                                                       (and 
                                                           (= x501 1) 
                                                           (MS x501 x490 p0))) 
                                                   (exists ((x502 Int)) 
                                                       (and 
                                                           (length p0 x502) 
                                                           (MS x502 y1 p0))) 
                                                   (forall ((i31 Int)) 
                                                       (=> 
                                                           (and 
                                                               (<= 1 i31) 
                                                               (forall ((x503 Int)) 
                                                                   (=> 
                                                                       (length p0 x503) 
                                                                       (<= i31 (- x503 1))))) 
                                                           (exists ((x504 A) (x505 A)) 
                                                               (and 
                                                                   (MS i31 x504 p0) 
                                                                   (exists ((x506 Int)) 
                                                                       (and 
                                                                           (= x506 (+ i31 1)) 
                                                                           (MS x506 x505 p0))) 
                                                                   (MS0 x504 x505 r))))) 
                                                   (= x488 x490) 
                                                   (= x489 y1) 
                                                   (forall ((x507 Int) (x508 A)) 
                                                       (= 
                                                           (MS x507 x508 x487) 
                                                           (MS x507 x508 p0))))))) 
                                   (length x487 x486))) 
                           (forall ((x509 Int)) 
                               (=> 
                                   (exists ((x510 PZA)) 
                                       (and 
                                           (exists ((x511 A) (x512 A)) 
                                               (and 
                                                   (= x511 x485) 
                                                   (= x512 y0) 
                                                   (exists ((x513 A) (y2 A) (p1 PZA)) 
                                                       (and 
                                                           (exists ((n36 Int)) 
                                                               (and 
                                                                   (<= 0 n36) 
                                                                   (forall ((x514 Int) (x515 A)) 
                                                                       (=> 
                                                                           (MS x514 x515 p1) 
                                                                           (and 
                                                                               (<= 1 x514) 
                                                                               (<= x514 n36)))) 
                                                                   (forall ((x516 Int) (x517 A) (x518 A)) 
                                                                       (=> 
                                                                           (and 
                                                                               (MS x516 x517 p1) 
                                                                               (MS x516 x518 p1)) 
                                                                           (= x517 x518))) 
                                                                   (forall ((x519 Int)) 
                                                                       (=> 
                                                                           (and 
                                                                               (<= 1 x519) 
                                                                               (<= x519 n36)) 
                                                                           (exists ((x520 A)) 
                                                                               (MS x519 x520 p1)))))) 
                                                           (forall ((x521 A)) 
                                                               (=> 
                                                                   (exists ((x522 Int)) 
                                                                       (MS x522 x521 p1)) 
                                                                   (MS1 x521 a))) 
                                                           (forall ((x523 Int)) 
                                                               (=> 
                                                                   (length p1 x523) 
                                                                   (< 1 x523))) 
                                                           (exists ((x524 Int)) 
                                                               (and 
                                                                   (= x524 1) 
                                                                   (MS x524 x513 p1))) 
                                                           (exists ((x525 Int)) 
                                                               (and 
                                                                   (length p1 x525) 
                                                                   (MS x525 y2 p1))) 
                                                           (forall ((i32 Int)) 
                                                               (=> 
                                                                   (and 
                                                                       (<= 1 i32) 
                                                                       (forall ((x526 Int)) 
                                                                           (=> 
                                                                               (length p1 x526) 
                                                                               (<= i32 (- x526 1))))) 
                                                                   (exists ((x527 A) (x528 A)) 
                                                                       (and 
                                                                           (MS i32 x527 p1) 
                                                                           (exists ((x529 Int)) 
                                                                               (and 
                                                                                   (= x529 (+ i32 1)) 
                                                                                   (MS x529 x528 p1))) 
                                                                           (MS0 x527 x528 r))))) 
                                                           (= x511 x513) 
                                                           (= x512 y2) 
                                                           (forall ((x530 Int) (x531 A)) 
                                                               (= 
                                                                   (MS x530 x531 x510) 
                                                                   (MS x530 x531 p1))))))) 
                                           (length x510 x509))) 
                                   (<= x486 x509))) 
                           (dist x485 y0 x486)))))
         :named hyp19))
(assert (! (forall ((x532 A) (x533 A)) 
               (=> 
                   (MS0 x532 x533 r) 
                   (and 
                       (MS1 x532 a) 
                       (MS1 x533 a))))
         :named hyp20))
(assert (! (not 
               (forall ((x534 A) (x535 A)) 
                   (not 
                       (MS0 x534 x535 r))))
         :named hyp21))
(assert (! (forall ((x536 A) (x537 A)) 
               (=> 
                   (MS0 x536 x537 c) 
                   (and 
                       (MS1 x536 a) 
                       (MS1 x537 a))))
         :named hyp22))
(assert (! (forall ((x538 A) (x539 A)) 
               (=> 
                   (MS0 x538 x539 r) 
                   (MS0 x538 x539 c)))
         :named hyp23))
(assert (! (forall ((x540 A) (x541 A)) 
               (=> 
                   (exists ((x542 A)) 
                       (and 
                           (MS0 x540 x542 c) 
                           (MS0 x542 x541 r))) 
                   (MS0 x540 x541 c)))
         :named hyp24))
(assert (! (forall ((s30 PAA)) 
               (=> 
                   (and 
                       (forall ((x543 A) (x544 A)) 
                           (=> 
                               (MS0 x543 x544 s30) 
                               (and 
                                   (MS1 x543 a) 
                                   (MS1 x544 a)))) 
                       (forall ((x545 A) (x546 A)) 
                           (=> 
                               (MS0 x545 x546 r) 
                               (MS0 x545 x546 s30))) 
                       (forall ((x547 A) (x548 A)) 
                           (=> 
                               (exists ((x549 A)) 
                                   (and 
                                       (MS0 x547 x549 s30) 
                                       (MS0 x549 x548 r))) 
                               (MS0 x547 x548 s30)))) 
                   (forall ((x550 A) (x551 A)) 
                       (=> 
                           (MS0 x550 x551 c) 
                           (MS0 x550 x551 s30)))))
         :named hyp25))
(assert (! (forall ((x552 A)) 
               (= 
                   (exists ((x553 A)) 
                       (MS0 x552 x553 r)) 
                   (MS1 x552 a)))
         :named hyp26))
(assert (! (forall ((x554 A)) 
               (= 
                   (exists ((x555 A)) 
                       (MS0 x554 x555 c)) 
                   (MS1 x554 a)))
         :named hyp27))
(assert (! (forall ((x556 A)) 
               (=> 
                   (exists ((x557 A)) 
                       (MS0 x556 x557 r)) 
                   (exists ((x558 A)) 
                       (MS0 x556 x558 c))))
         :named hyp28))
(assert (! (forall ((x559 A) (x560 A)) 
               (= 
                   (MS0 x559 x560 c) 
                   (or 
                       (MS0 x559 x560 r) 
                       (exists ((x561 A)) 
                           (and 
                               (MS0 x559 x561 c) 
                               (MS0 x561 x560 r))))))
         :named hyp29))
(assert (! (forall ((x562 A) (y3 A)) 
               (=> 
                   (and 
                       (MS1 x562 a) 
                       (MS1 y3 a)) 
                   (forall ((s31 PZA) (n37 Int)) 
                       (=> 
                           (and 
                               (<= 0 n37) 
                               (< 1 n37) 
                               (forall ((x563 Int) (x564 A)) 
                                   (=> 
                                       (MS x563 x564 s31) 
                                       (and 
                                           (<= 1 x563) 
                                           (<= x563 n37) 
                                           (MS1 x564 a)))) 
                               (forall ((x565 Int) (x566 A) (x567 A)) 
                                   (=> 
                                       (and 
                                           (MS x565 x566 s31) 
                                           (MS x565 x567 s31)) 
                                       (= x566 x567))) 
                               (forall ((x568 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x568) 
                                           (<= x568 n37)) 
                                       (exists ((x569 A)) 
                                           (MS x568 x569 s31))))) 
                           (and 
                               (exists ((x570 A) (x571 Int)) 
                                   (and 
                                       (= x571 1) 
                                       (MS x571 x570 s31))) 
                               (forall ((x572 Int) (x573 A) (x574 A)) 
                                   (=> 
                                       (and 
                                           (MS x572 x573 s31) 
                                           (MS x572 x574 s31)) 
                                       (= x573 x574))) 
                               (=> 
                                   (exists ((x575 Int)) 
                                       (and 
                                           (= x575 1) 
                                           (MS x575 x562 s31))) 
                                   (and 
                                       (exists ((x576 A)) 
                                           (MS n37 x576 s31)) 
                                       (=> 
                                           (MS n37 y3 s31) 
                                           (forall ((i33 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i33) 
                                                       (<= i33 (- n37 1))) 
                                                   (and 
                                                       (exists ((x577 A)) 
                                                           (MS i33 x577 s31)) 
                                                       (exists ((x578 A) (x579 Int)) 
                                                           (and 
                                                               (= x579 (+ i33 1)) 
                                                               (MS x579 x578 s31))))))))))))))
         :named hyp30))
(assert (! (forall ((x580 A) (x581 A)) 
               (=> 
                   (exists ((x582 PZA)) 
                       (path x580 x581 x582)) 
                   (MS0 x580 x581 c)))
         :named hyp31))
(assert (! (forall ((x583 A) (x584 A)) 
               (=> 
                   (MS0 x583 x584 c) 
                   (exists ((x585 PZA)) 
                       (path x583 x584 x585))))
         :named hyp32))
(assert (! (forall ((x586 A) (x587 A)) 
               (=> 
                   (and 
                       (MS1 x586 a) 
                       (MS1 x587 a)) 
                   (exists ((x588 PZA)) 
                       (path x586 x587 x588))))
         :named hyp33))
(assert (! (forall ((n38 Int) (s32 PZA)) 
               (=> 
                   (and 
                       (<= 0 n38) 
                       (forall ((x589 Int) (x590 A)) 
                           (=> 
                               (MS x589 x590 s32) 
                               (and 
                                   (<= 1 x589) 
                                   (<= x589 n38)))) 
                       (forall ((x591 Int) (x592 A) (x593 A)) 
                           (=> 
                               (and 
                                   (MS x591 x592 s32) 
                                   (MS x591 x593 s32)) 
                               (= x592 x593))) 
                       (forall ((x594 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x594) 
                                   (<= x594 n38)) 
                               (exists ((x595 A)) 
                                   (MS x594 x595 s32))))) 
                   (seq s32)))
         :named hyp34))
(assert (! (and 
               (forall ((x596 PZA) (x597 Int)) 
                   (=> 
                       (length x596 x597) 
                       (and 
                           (seq x596) 
                           (<= 0 x597)))) 
               (forall ((x598 PZA) (x599 Int) (x600 Int)) 
                   (=> 
                       (and 
                           (length x598 x599) 
                           (length x598 x600)) 
                       (= x599 x600))) 
               (forall ((x601 PZA)) 
                   (=> 
                       (seq x601) 
                       (exists ((x602 Int)) 
                           (length x601 x602)))))
         :named hyp35))
(assert (! (forall ((s33 PZA)) 
               (=> 
                   (seq s33) 
                   (and 
                       (forall ((x603 Int) (x604 A)) 
                           (=> 
                               (MS x603 x604 s33) 
                               (and 
                                   (<= 1 x603) 
                                   (forall ((x605 Int)) 
                                       (=> 
                                           (length s33 x605) 
                                           (<= x603 x605)))))) 
                       (forall ((x606 Int) (x607 A) (x608 A)) 
                           (=> 
                               (and 
                                   (MS x606 x607 s33) 
                                   (MS x606 x608 s33)) 
                               (= x607 x608))) 
                       (forall ((x609 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x609) 
                                   (forall ((x610 Int)) 
                                       (=> 
                                           (length s33 x610) 
                                           (<= x609 x610)))) 
                               (exists ((x611 A)) 
                                   (MS x609 x611 s33)))))))
         :named hyp36))
(assert (! (forall ((x612 PZA) (x613 PZA) (x614 PZA)) 
               (= 
                   (cnc x612 x613 x614) 
                   (exists ((s112 PZA) (s211 PZA)) 
                       (and 
                           (seq s112) 
                           (seq s211) 
                           (forall ((x615 Int) (x616 A)) 
                               (= 
                                   (MS x615 x616 x612) 
                                   (MS x615 x616 s112))) 
                           (forall ((x617 Int) (x618 A)) 
                               (= 
                                   (MS x617 x618 x613) 
                                   (MS x617 x618 s211))) 
                           (forall ((x619 Int) (x620 A)) 
                               (= 
                                   (MS x619 x620 x614) 
                                   (or 
                                       (exists ((i34 Int)) 
                                           (and 
                                               (<= 1 i34) 
                                               (forall ((x621 Int)) 
                                                   (=> 
                                                       (length s112 x621) 
                                                       (<= i34 x621))) 
                                               (= x619 i34) 
                                               (MS i34 x620 s112))) 
                                       (exists ((i35 Int)) 
                                           (and 
                                               (forall ((x622 Int)) 
                                                   (=> 
                                                       (length s112 x622) 
                                                       (<= (+ x622 1) i35))) 
                                               (forall ((x623 Int) (x624 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s112 x624) 
                                                           (length s211 x623)) 
                                                       (<= i35 (+ x624 x623)))) 
                                               (= x619 i35) 
                                               (exists ((x625 Int)) 
                                                   (and 
                                                       (forall ((x626 Int)) 
                                                           (=> 
                                                               (length s112 x626) 
                                                               (= x625 (- i35 x626)))) 
                                                       (MS x625 x620 s211))))))))))))
         :named hyp37))
(assert (! (and 
               (forall ((x627 PZA) (x628 PZA) (x629 PZA)) 
                   (=> 
                       (cnc x627 x628 x629) 
                       (and 
                           (seq x627) 
                           (seq x628) 
                           (seq x629)))) 
               (forall ((x630 PZA) (x631 PZA) (x632 PZA) (x633 PZA)) 
                   (=> 
                       (and 
                           (cnc x630 x631 x632) 
                           (cnc x630 x631 x633)) 
                       (forall ((x634 Int) (x635 A)) 
                           (= 
                               (MS x634 x635 x632) 
                               (MS x634 x635 x633))))) 
               (forall ((x636 PZA) (x637 PZA)) 
                   (=> 
                       (and 
                           (seq x636) 
                           (seq x637)) 
                       (exists ((x638 PZA)) 
                           (cnc x636 x637 x638)))))
         :named hyp38))
(assert (! (forall ((s113 PZA) (s212 PZA)) 
               (=> 
                   (and 
                       (seq s113) 
                       (seq s212)) 
                   (exists ((x639 PZA) (x640 Int)) 
                       (and 
                           (cnc s113 s212 x639) 
                           (forall ((x641 Int) (x642 Int)) 
                               (=> 
                                   (and 
                                       (length s113 x642) 
                                       (length s212 x641)) 
                                   (= x640 (+ x642 x641)))) 
                           (length x639 x640)))))
         :named hyp39))
(assert (! (forall ((s114 PZA) (s213 PZA)) 
               (=> 
                   (and 
                       (seq s114) 
                       (seq s213)) 
                   (forall ((x643 Int)) 
                       (= 
                           (exists ((x644 A) (x645 PZA)) 
                               (and 
                                   (cnc s114 s213 x645) 
                                   (MS x643 x644 x645))) 
                           (and 
                               (<= 1 x643) 
                               (forall ((x646 Int) (x647 Int)) 
                                   (=> 
                                       (and 
                                           (length s114 x647) 
                                           (length s213 x646)) 
                                       (<= x643 (+ x647 x646)))))))))
         :named hyp40))
(assert (! (forall ((s115 PZA) (s214 PZA)) 
               (=> 
                   (and 
                       (seq s115) 
                       (seq s214)) 
                   (forall ((x648 A)) 
                       (= 
                           (exists ((x649 Int) (x650 PZA)) 
                               (and 
                                   (cnc s115 s214 x650) 
                                   (MS x649 x648 x650))) 
                           (or 
                               (exists ((x651 Int)) 
                                   (MS x651 x648 s115)) 
                               (exists ((x652 Int)) 
                                   (MS x652 x648 s214)))))))
         :named hyp41))
(assert (! (forall ((s116 PZA) (s215 PZA) (i36 Int)) 
               (=> 
                   (and 
                       (seq s116) 
                       (seq s215) 
                       (<= 1 i36) 
                       (forall ((x653 Int)) 
                           (=> 
                               (length s116 x653) 
                               (<= i36 x653)))) 
                   (exists ((x654 PZA)) 
                       (and 
                           (cnc s116 s215 x654) 
                           (exists ((x655 A)) 
                               (and 
                                   (MS i36 x655 s116) 
                                   (MS i36 x655 x654)))))))
         :named hyp42))
(assert (! (forall ((s117 PZA) (s216 PZA) (i37 Int)) 
               (=> 
                   (and 
                       (seq s117) 
                       (seq s216) 
                       (forall ((x656 Int)) 
                           (=> 
                               (length s117 x656) 
                               (<= (+ x656 1) i37))) 
                       (forall ((x657 Int) (x658 Int)) 
                           (=> 
                               (and 
                                   (length s117 x658) 
                                   (length s216 x657)) 
                               (<= i37 (+ x658 x657))))) 
                   (exists ((x659 PZA)) 
                       (and 
                           (cnc s117 s216 x659) 
                           (exists ((x660 A)) 
                               (and 
                                   (exists ((x661 Int)) 
                                       (and 
                                           (forall ((x662 Int)) 
                                               (=> 
                                                   (length s117 x662) 
                                                   (= x661 (- i37 x662)))) 
                                           (MS x661 x660 s216))) 
                                   (MS i37 x660 x659)))))))
         :named hyp43))
(assert (! (forall ((x663 A) (y4 A)) 
               (=> 
                   (and 
                       (MS1 x663 a) 
                       (MS1 y4 a)) 
                   (exists ((x664 Int)) 
                       (and 
                           (exists ((x665 PZA)) 
                               (and 
                                   (exists ((x666 A) (x667 A)) 
                                       (and 
                                           (= x666 x663) 
                                           (= x667 y4) 
                                           (path x666 x667 x665))) 
                                   (length x665 x664))) 
                           (forall ((x668 Int)) 
                               (=> 
                                   (exists ((x669 PZA)) 
                                       (and 
                                           (exists ((x670 A) (x671 A)) 
                                               (and 
                                                   (= x670 x663) 
                                                   (= x671 y4) 
                                                   (path x670 x671 x669))) 
                                           (length x669 x668))) 
                                   (<= x664 x668))) 
                           (dist x663 y4 x664)))))
         :named hyp44))
(assert (! (forall ((x672 A) (x673 A) (x674 PZA)) 
               (= 
                   (path x672 x673 x674) 
                   (exists ((x675 A) (y5 A) (p2 PZA)) 
                       (and 
                           (MS1 x675 a) 
                           (MS1 y5 a) 
                           (exists ((n39 Int)) 
                               (and 
                                   (<= 0 n39) 
                                   (< 1 n39) 
                                   (forall ((x676 Int) (x677 A)) 
                                       (=> 
                                           (MS x676 x677 p2) 
                                           (and 
                                               (<= 1 x676) 
                                               (<= x676 n39) 
                                               (MS1 x677 a)))) 
                                   (forall ((x678 Int) (x679 A) (x680 A)) 
                                       (=> 
                                           (and 
                                               (MS x678 x679 p2) 
                                               (MS x678 x680 p2)) 
                                           (= x679 x680))) 
                                   (forall ((x681 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x681) 
                                               (<= x681 n39)) 
                                           (exists ((x682 A)) 
                                               (MS x681 x682 p2)))) 
                                   (exists ((x683 Int)) 
                                       (and 
                                           (= x683 1) 
                                           (MS x683 x675 p2))) 
                                   (MS n39 y5 p2) 
                                   (forall ((i38 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 i38) 
                                               (<= i38 (- n39 1))) 
                                           (exists ((x684 A) (x685 A)) 
                                               (and 
                                                   (MS i38 x684 p2) 
                                                   (exists ((x686 Int)) 
                                                       (and 
                                                           (= x686 (+ i38 1)) 
                                                           (MS x686 x685 p2))) 
                                                   (MS0 x684 x685 r))))))) 
                           (= x672 x675) 
                           (= x673 y5) 
                           (forall ((x687 Int) (x688 A)) 
                               (= 
                                   (MS x687 x688 x674) 
                                   (MS x687 x688 p2)))))))
         :named hyp45))
(assert (! (forall ((x689 A)) 
               (= 
                   (MS1 x689 candidate) 
                   (exists ((z A)) 
                       (and 
                           (MS1 z a) 
                           (forall ((x690 A) (y6 A)) 
                               (=> 
                                   (and 
                                       (MS1 x690 a) 
                                       (not 
                                           (= x690 z)) 
                                       (MS1 y6 a) 
                                       (not 
                                           (= y6 z)) 
                                       (not 
                                           (= x690 y6))) 
                                   (exists ((p3 PZA)) 
                                       (and 
                                           (exists ((x691 A) (x692 A)) 
                                               (and 
                                                   (= x691 x690) 
                                                   (= x692 y6) 
                                                   (path x691 x692 p3))) 
                                           (not 
                                               (exists ((x693 Int)) 
                                                   (MS x693 z p3))))))) 
                           (= x689 z)))))
         :named hyp46))
(assert (! (forall ((u A)) 
               (=> 
                   (MS1 u candidate) 
                   (forall ((x694 A) (x695 A)) 
                       (=> 
                           (and 
                               (MS1 x694 a) 
                               (not 
                                   (= x694 u)) 
                               (MS1 x695 a) 
                               (not 
                                   (= x695 u)) 
                               (not 
                                   (= x694 x695))) 
                           (exists ((x696 A) (y7 A) (p4 PZA)) 
                               (and 
                                   (MS1 x696 a) 
                                   (not 
                                       (= x696 u)) 
                                   (MS1 y7 a) 
                                   (not 
                                       (= y7 u)) 
                                   (not 
                                       (= x696 y7)) 
                                   (exists ((n40 Int)) 
                                       (and 
                                           (<= 0 n40) 
                                           (< 1 n40) 
                                           (forall ((x697 Int) (x698 A)) 
                                               (=> 
                                                   (MS x697 x698 p4) 
                                                   (and 
                                                       (<= 1 x697) 
                                                       (<= x697 n40) 
                                                       (MS1 x698 a) 
                                                       (not 
                                                           (= x698 u))))) 
                                           (forall ((x699 Int) (x700 A) (x701 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x699 x700 p4) 
                                                       (MS x699 x701 p4)) 
                                                   (= x700 x701))) 
                                           (forall ((x702 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x702) 
                                                       (<= x702 n40)) 
                                                   (exists ((x703 A)) 
                                                       (MS x702 x703 p4)))) 
                                           (exists ((x704 Int)) 
                                               (and 
                                                   (= x704 1) 
                                                   (MS x704 x696 p4))) 
                                           (MS n40 y7 p4) 
                                           (forall ((i39 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i39) 
                                                       (<= i39 (- n40 1))) 
                                                   (exists ((x705 A) (x706 A)) 
                                                       (and 
                                                           (MS i39 x705 p4) 
                                                           (exists ((x707 Int)) 
                                                               (and 
                                                                   (= x707 (+ i39 1)) 
                                                                   (MS x707 x706 p4))) 
                                                           (MS0 x705 x706 r))))))) 
                                   (= x694 x696) 
                                   (= x695 y7)))))))
         :named hyp47))
(assert (! (forall ((s118 PZA) (s217 PZA)) 
               (=> 
                   (and 
                       (seq s118) 
                       (seq s217)) 
                   (and 
                       (exists ((x708 Int)) 
                           (length s118 x708)) 
                       (forall ((x709 PZA) (x710 Int) (x711 Int)) 
                           (=> 
                               (and 
                                   (length x709 x710) 
                                   (length x709 x711)) 
                               (= x710 x711))) 
                       (forall ((i40 Int)) 
                           (=> 
                               (and 
                                   (<= 1 i40) 
                                   (forall ((x712 Int)) 
                                       (=> 
                                           (length s118 x712) 
                                           (<= i40 x712)))) 
                               (and 
                                   (exists ((x713 A)) 
                                       (MS i40 x713 s118)) 
                                   (forall ((x714 Int) (x715 A) (x716 A)) 
                                       (=> 
                                           (and 
                                               (MS x714 x715 s118) 
                                               (MS x714 x716 s118)) 
                                           (= x715 x716)))))) 
                       (exists ((x717 Int)) 
                           (length s217 x717)) 
                       (forall ((i41 Int)) 
                           (=> 
                               (and 
                                   (forall ((x718 Int)) 
                                       (=> 
                                           (length s118 x718) 
                                           (<= (+ x718 1) i41))) 
                                   (forall ((x719 Int) (x720 Int)) 
                                       (=> 
                                           (and 
                                               (length s118 x720) 
                                               (length s217 x719)) 
                                           (<= i41 (+ x720 x719))))) 
                               (and 
                                   (exists ((x721 A) (x722 Int)) 
                                       (and 
                                           (forall ((x723 Int)) 
                                               (=> 
                                                   (length s118 x723) 
                                                   (= x722 (- i41 x723)))) 
                                           (MS x722 x721 s217))) 
                                   (forall ((x724 Int) (x725 A) (x726 A)) 
                                       (=> 
                                           (and 
                                               (MS x724 x725 s217) 
                                               (MS x724 x726 s217)) 
                                           (= x725 x726)))))))))
         :named hyp48))
(assert (! (forall ((x727 A) (x728 A)) 
               (=> 
                   (and 
                       (MS1 x727 a) 
                       (MS1 x728 a)) 
                   (MS0 x727 x728 c)))
         :named hyp49))
(assert (! (not 
               (forall ((x729 A)) 
                   (MS1 x729 a)))
         :named hyp50))
(assert (! (forall ((s119 PZA) (s218 PZA) (b0 PA)) 
               (=> 
                   (and 
                       (seq s119) 
                       (seq s218) 
                       (forall ((x730 A)) 
                           (=> 
                               (exists ((x731 Int)) 
                                   (MS x731 x730 s119)) 
                               (MS1 x730 b0))) 
                       (forall ((x732 A)) 
                           (=> 
                               (exists ((x733 Int)) 
                                   (MS x733 x732 s218)) 
                               (MS1 x732 b0)))) 
                   (and 
                       (forall ((x734 Int) (x735 A)) 
                           (=> 
                               (exists ((x736 PZA)) 
                                   (and 
                                       (cnc s119 s218 x736) 
                                       (MS x734 x735 x736))) 
                               (and 
                                   (<= 1 x734) 
                                   (forall ((x737 Int) (x738 Int)) 
                                       (=> 
                                           (and 
                                               (length s119 x738) 
                                               (length s218 x737)) 
                                           (<= x734 (+ x738 x737)))) 
                                   (MS1 x735 b0)))) 
                       (forall ((x739 Int) (x740 A) (x741 A)) 
                           (=> 
                               (and 
                                   (exists ((x742 PZA)) 
                                       (and 
                                           (cnc s119 s218 x742) 
                                           (MS x739 x740 x742))) 
                                   (exists ((x743 PZA)) 
                                       (and 
                                           (cnc s119 s218 x743) 
                                           (MS x739 x741 x743)))) 
                               (= x740 x741))) 
                       (forall ((x744 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x744) 
                                   (forall ((x745 Int) (x746 Int)) 
                                       (=> 
                                           (and 
                                               (length s119 x746) 
                                               (length s218 x745)) 
                                           (<= x744 (+ x746 x745))))) 
                               (exists ((x747 A) (x748 PZA)) 
                                   (and 
                                       (cnc s119 s218 x748) 
                                       (MS x744 x747 x748))))))))
         :named hyp51))
(assert (! (forall ((x749 A) (x750 A) (x751 PZA)) 
               (= 
                   (path x749 x750 x751) 
                   (exists ((x752 A) (y8 A) (p5 PZA)) 
                       (and 
                           (seq p5) 
                           (forall ((x753 A)) 
                               (=> 
                                   (exists ((x754 Int)) 
                                       (MS x754 x753 p5)) 
                                   (MS1 x753 a))) 
                           (forall ((x755 Int)) 
                               (=> 
                                   (length p5 x755) 
                                   (< 1 x755))) 
                           (exists ((x756 Int)) 
                               (and 
                                   (= x756 1) 
                                   (MS x756 x752 p5))) 
                           (exists ((x757 Int)) 
                               (and 
                                   (length p5 x757) 
                                   (MS x757 y8 p5))) 
                           (forall ((i42 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 i42) 
                                       (forall ((x758 Int)) 
                                           (=> 
                                               (length p5 x758) 
                                               (<= i42 (- x758 1))))) 
                                   (exists ((x759 A) (x760 A)) 
                                       (and 
                                           (MS i42 x759 p5) 
                                           (exists ((x761 Int)) 
                                               (and 
                                                   (= x761 (+ i42 1)) 
                                                   (MS x761 x760 p5))) 
                                           (MS0 x759 x760 r))))) 
                           (= x749 x752) 
                           (= x750 y8) 
                           (forall ((x762 Int) (x763 A)) 
                               (= 
                                   (MS x762 x763 x751) 
                                   (MS x762 x763 p5)))))))
         :named hyp52))
(assert (! (forall ((x764 A) (y9 A) (p6 PZA)) 
               (=> 
                   (and 
                       (seq p6) 
                       (forall ((x765 A)) 
                           (=> 
                               (exists ((x766 Int)) 
                                   (MS x766 x765 p6)) 
                               (MS1 x765 a)))) 
                   (and 
                       (exists ((x767 Int)) 
                           (length p6 x767)) 
                       (forall ((x768 PZA) (x769 Int) (x770 Int)) 
                           (=> 
                               (and 
                                   (length x768 x769) 
                                   (length x768 x770)) 
                               (= x769 x770))) 
                       (=> 
                           (forall ((x771 Int)) 
                               (=> 
                                   (length p6 x771) 
                                   (< 1 x771))) 
                           (and 
                               (exists ((x772 A) (x773 Int)) 
                                   (and 
                                       (= x773 1) 
                                       (MS x773 x772 p6))) 
                               (forall ((x774 Int) (x775 A) (x776 A)) 
                                   (=> 
                                       (and 
                                           (MS x774 x775 p6) 
                                           (MS x774 x776 p6)) 
                                       (= x775 x776))) 
                               (=> 
                                   (exists ((x777 Int)) 
                                       (and 
                                           (= x777 1) 
                                           (MS x777 x764 p6))) 
                                   (and 
                                       (exists ((x778 A) (x779 Int)) 
                                           (and 
                                               (length p6 x779) 
                                               (MS x779 x778 p6))) 
                                       (=> 
                                           (exists ((x780 Int)) 
                                               (and 
                                                   (length p6 x780) 
                                                   (MS x780 y9 p6))) 
                                           (forall ((i43 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i43) 
                                                       (forall ((x781 Int)) 
                                                           (=> 
                                                               (length p6 x781) 
                                                               (<= i43 (- x781 1))))) 
                                                   (and 
                                                       (exists ((x782 A)) 
                                                           (MS i43 x782 p6)) 
                                                       (exists ((x783 A) (x784 Int)) 
                                                           (and 
                                                               (= x784 (+ i43 1)) 
                                                               (MS x784 x783 p6))))))))))))))
         :named hyp53))
(assert (! (seq s)
         :named hyp54))
(assert (! (and 
               (forall ((x785 PZA) (x786 PZA) (x787 PZA)) 
                   (=> 
                       (cnc x785 x786 x787) 
                       (and 
                           (exists ((s34 PZA)) 
                               (and 
                                   (exists ((n41 Int)) 
                                       (and 
                                           (<= 0 n41) 
                                           (forall ((x788 Int) (x789 A)) 
                                               (=> 
                                                   (MS x788 x789 s34) 
                                                   (and 
                                                       (<= 1 x788) 
                                                       (<= x788 n41)))) 
                                           (forall ((x790 Int) (x791 A) (x792 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x790 x791 s34) 
                                                       (MS x790 x792 s34)) 
                                                   (= x791 x792))) 
                                           (forall ((x793 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x793) 
                                                       (<= x793 n41)) 
                                                   (exists ((x794 A)) 
                                                       (MS x793 x794 s34)))))) 
                                   (forall ((x795 Int) (x796 A)) 
                                       (= 
                                           (MS x795 x796 x785) 
                                           (MS x795 x796 s34))))) 
                           (exists ((s35 PZA)) 
                               (and 
                                   (exists ((n42 Int)) 
                                       (and 
                                           (<= 0 n42) 
                                           (forall ((x797 Int) (x798 A)) 
                                               (=> 
                                                   (MS x797 x798 s35) 
                                                   (and 
                                                       (<= 1 x797) 
                                                       (<= x797 n42)))) 
                                           (forall ((x799 Int) (x800 A) (x801 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x799 x800 s35) 
                                                       (MS x799 x801 s35)) 
                                                   (= x800 x801))) 
                                           (forall ((x802 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x802) 
                                                       (<= x802 n42)) 
                                                   (exists ((x803 A)) 
                                                       (MS x802 x803 s35)))))) 
                                   (forall ((x804 Int) (x805 A)) 
                                       (= 
                                           (MS x804 x805 x786) 
                                           (MS x804 x805 s35))))) 
                           (exists ((s36 PZA)) 
                               (and 
                                   (exists ((n43 Int)) 
                                       (and 
                                           (<= 0 n43) 
                                           (forall ((x806 Int) (x807 A)) 
                                               (=> 
                                                   (MS x806 x807 s36) 
                                                   (and 
                                                       (<= 1 x806) 
                                                       (<= x806 n43)))) 
                                           (forall ((x808 Int) (x809 A) (x810 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x808 x809 s36) 
                                                       (MS x808 x810 s36)) 
                                                   (= x809 x810))) 
                                           (forall ((x811 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x811) 
                                                       (<= x811 n43)) 
                                                   (exists ((x812 A)) 
                                                       (MS x811 x812 s36)))))) 
                                   (forall ((x813 Int) (x814 A)) 
                                       (= 
                                           (MS x813 x814 x787) 
                                           (MS x813 x814 s36)))))))) 
               (forall ((x815 PZA) (x816 PZA) (x817 PZA) (x818 PZA)) 
                   (=> 
                       (and 
                           (cnc x815 x816 x817) 
                           (cnc x815 x816 x818)) 
                       (forall ((x819 Int) (x820 A)) 
                           (= 
                               (MS x819 x820 x817) 
                               (MS x819 x820 x818))))) 
               (forall ((x821 PZA) (x822 PZA)) 
                   (=> 
                       (and 
                           (exists ((s37 PZA)) 
                               (and 
                                   (exists ((n44 Int)) 
                                       (and 
                                           (<= 0 n44) 
                                           (forall ((x823 Int) (x824 A)) 
                                               (=> 
                                                   (MS x823 x824 s37) 
                                                   (and 
                                                       (<= 1 x823) 
                                                       (<= x823 n44)))) 
                                           (forall ((x825 Int) (x826 A) (x827 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x825 x826 s37) 
                                                       (MS x825 x827 s37)) 
                                                   (= x826 x827))) 
                                           (forall ((x828 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x828) 
                                                       (<= x828 n44)) 
                                                   (exists ((x829 A)) 
                                                       (MS x828 x829 s37)))))) 
                                   (forall ((x830 Int) (x831 A)) 
                                       (= 
                                           (MS x830 x831 x821) 
                                           (MS x830 x831 s37))))) 
                           (exists ((s38 PZA)) 
                               (and 
                                   (exists ((n45 Int)) 
                                       (and 
                                           (<= 0 n45) 
                                           (forall ((x832 Int) (x833 A)) 
                                               (=> 
                                                   (MS x832 x833 s38) 
                                                   (and 
                                                       (<= 1 x832) 
                                                       (<= x832 n45)))) 
                                           (forall ((x834 Int) (x835 A) (x836 A)) 
                                               (=> 
                                                   (and 
                                                       (MS x834 x835 s38) 
                                                       (MS x834 x836 s38)) 
                                                   (= x835 x836))) 
                                           (forall ((x837 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x837) 
                                                       (<= x837 n45)) 
                                                   (exists ((x838 A)) 
                                                       (MS x837 x838 s38)))))) 
                                   (forall ((x839 Int) (x840 A)) 
                                       (= 
                                           (MS x839 x840 x822) 
                                           (MS x839 x840 s38)))))) 
                       (exists ((x841 PZA)) 
                           (cnc x821 x822 x841)))))
         :named hyp55))
(assert (! (forall ((s120 PZA) (s219 PZA)) 
               (=> 
                   (and 
                       (exists ((n46 Int)) 
                           (and 
                               (<= 0 n46) 
                               (forall ((x842 Int) (x843 A)) 
                                   (=> 
                                       (MS x842 x843 s120) 
                                       (and 
                                           (<= 1 x842) 
                                           (<= x842 n46)))) 
                               (forall ((x844 Int) (x845 A) (x846 A)) 
                                   (=> 
                                       (and 
                                           (MS x844 x845 s120) 
                                           (MS x844 x846 s120)) 
                                       (= x845 x846))) 
                               (forall ((x847 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x847) 
                                           (<= x847 n46)) 
                                       (exists ((x848 A)) 
                                           (MS x847 x848 s120)))))) 
                       (exists ((n47 Int)) 
                           (and 
                               (<= 0 n47) 
                               (forall ((x849 Int) (x850 A)) 
                                   (=> 
                                       (MS x849 x850 s219) 
                                       (and 
                                           (<= 1 x849) 
                                           (<= x849 n47)))) 
                               (forall ((x851 Int) (x852 A) (x853 A)) 
                                   (=> 
                                       (and 
                                           (MS x851 x852 s219) 
                                           (MS x851 x853 s219)) 
                                       (= x852 x853))) 
                               (forall ((x854 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x854) 
                                           (<= x854 n47)) 
                                       (exists ((x855 A)) 
                                           (MS x854 x855 s219))))))) 
                   (exists ((x856 PZA) (x857 Int)) 
                       (and 
                           (cnc s120 s219 x856) 
                           (forall ((x858 Int) (x859 Int)) 
                               (=> 
                                   (and 
                                       (length s120 x859) 
                                       (length s219 x858)) 
                                   (= x857 (+ x859 x858)))) 
                           (length x856 x857)))))
         :named hyp56))
(assert (! (forall ((s121 PZA) (s220 PZA)) 
               (=> 
                   (and 
                       (exists ((n48 Int)) 
                           (and 
                               (<= 0 n48) 
                               (forall ((x860 Int) (x861 A)) 
                                   (=> 
                                       (MS x860 x861 s121) 
                                       (and 
                                           (<= 1 x860) 
                                           (<= x860 n48)))) 
                               (forall ((x862 Int) (x863 A) (x864 A)) 
                                   (=> 
                                       (and 
                                           (MS x862 x863 s121) 
                                           (MS x862 x864 s121)) 
                                       (= x863 x864))) 
                               (forall ((x865 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x865) 
                                           (<= x865 n48)) 
                                       (exists ((x866 A)) 
                                           (MS x865 x866 s121)))))) 
                       (exists ((n49 Int)) 
                           (and 
                               (<= 0 n49) 
                               (forall ((x867 Int) (x868 A)) 
                                   (=> 
                                       (MS x867 x868 s220) 
                                       (and 
                                           (<= 1 x867) 
                                           (<= x867 n49)))) 
                               (forall ((x869 Int) (x870 A) (x871 A)) 
                                   (=> 
                                       (and 
                                           (MS x869 x870 s220) 
                                           (MS x869 x871 s220)) 
                                       (= x870 x871))) 
                               (forall ((x872 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x872) 
                                           (<= x872 n49)) 
                                       (exists ((x873 A)) 
                                           (MS x872 x873 s220))))))) 
                   (forall ((x874 Int)) 
                       (= 
                           (exists ((x875 A) (x876 PZA)) 
                               (and 
                                   (cnc s121 s220 x876) 
                                   (MS x874 x875 x876))) 
                           (and 
                               (<= 1 x874) 
                               (forall ((x877 Int) (x878 Int)) 
                                   (=> 
                                       (and 
                                           (length s121 x878) 
                                           (length s220 x877)) 
                                       (<= x874 (+ x878 x877)))))))))
         :named hyp57))
(assert (! (forall ((s122 PZA) (s221 PZA)) 
               (=> 
                   (and 
                       (exists ((n50 Int)) 
                           (and 
                               (<= 0 n50) 
                               (forall ((x879 Int) (x880 A)) 
                                   (=> 
                                       (MS x879 x880 s122) 
                                       (and 
                                           (<= 1 x879) 
                                           (<= x879 n50)))) 
                               (forall ((x881 Int) (x882 A) (x883 A)) 
                                   (=> 
                                       (and 
                                           (MS x881 x882 s122) 
                                           (MS x881 x883 s122)) 
                                       (= x882 x883))) 
                               (forall ((x884 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x884) 
                                           (<= x884 n50)) 
                                       (exists ((x885 A)) 
                                           (MS x884 x885 s122)))))) 
                       (exists ((n51 Int)) 
                           (and 
                               (<= 0 n51) 
                               (forall ((x886 Int) (x887 A)) 
                                   (=> 
                                       (MS x886 x887 s221) 
                                       (and 
                                           (<= 1 x886) 
                                           (<= x886 n51)))) 
                               (forall ((x888 Int) (x889 A) (x890 A)) 
                                   (=> 
                                       (and 
                                           (MS x888 x889 s221) 
                                           (MS x888 x890 s221)) 
                                       (= x889 x890))) 
                               (forall ((x891 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x891) 
                                           (<= x891 n51)) 
                                       (exists ((x892 A)) 
                                           (MS x891 x892 s221))))))) 
                   (forall ((x893 A)) 
                       (= 
                           (exists ((x894 Int) (x895 PZA)) 
                               (and 
                                   (cnc s122 s221 x895) 
                                   (MS x894 x893 x895))) 
                           (or 
                               (exists ((x896 Int)) 
                                   (MS x896 x893 s122)) 
                               (exists ((x897 Int)) 
                                   (MS x897 x893 s221)))))))
         :named hyp58))
(assert (! (forall ((s123 PZA) (s222 PZA) (i44 Int)) 
               (=> 
                   (and 
                       (exists ((n52 Int)) 
                           (and 
                               (<= 0 n52) 
                               (forall ((x898 Int) (x899 A)) 
                                   (=> 
                                       (MS x898 x899 s123) 
                                       (and 
                                           (<= 1 x898) 
                                           (<= x898 n52)))) 
                               (forall ((x900 Int) (x901 A) (x902 A)) 
                                   (=> 
                                       (and 
                                           (MS x900 x901 s123) 
                                           (MS x900 x902 s123)) 
                                       (= x901 x902))) 
                               (forall ((x903 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x903) 
                                           (<= x903 n52)) 
                                       (exists ((x904 A)) 
                                           (MS x903 x904 s123)))))) 
                       (exists ((n53 Int)) 
                           (and 
                               (<= 0 n53) 
                               (forall ((x905 Int) (x906 A)) 
                                   (=> 
                                       (MS x905 x906 s222) 
                                       (and 
                                           (<= 1 x905) 
                                           (<= x905 n53)))) 
                               (forall ((x907 Int) (x908 A) (x909 A)) 
                                   (=> 
                                       (and 
                                           (MS x907 x908 s222) 
                                           (MS x907 x909 s222)) 
                                       (= x908 x909))) 
                               (forall ((x910 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x910) 
                                           (<= x910 n53)) 
                                       (exists ((x911 A)) 
                                           (MS x910 x911 s222)))))) 
                       (<= 1 i44) 
                       (forall ((x912 Int)) 
                           (=> 
                               (length s123 x912) 
                               (<= i44 x912)))) 
                   (exists ((x913 PZA)) 
                       (and 
                           (cnc s123 s222 x913) 
                           (exists ((x914 A)) 
                               (and 
                                   (MS i44 x914 s123) 
                                   (MS i44 x914 x913)))))))
         :named hyp59))
(assert (! (forall ((s124 PZA) (s223 PZA) (i45 Int)) 
               (=> 
                   (and 
                       (exists ((n54 Int)) 
                           (and 
                               (<= 0 n54) 
                               (forall ((x915 Int) (x916 A)) 
                                   (=> 
                                       (MS x915 x916 s124) 
                                       (and 
                                           (<= 1 x915) 
                                           (<= x915 n54)))) 
                               (forall ((x917 Int) (x918 A) (x919 A)) 
                                   (=> 
                                       (and 
                                           (MS x917 x918 s124) 
                                           (MS x917 x919 s124)) 
                                       (= x918 x919))) 
                               (forall ((x920 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x920) 
                                           (<= x920 n54)) 
                                       (exists ((x921 A)) 
                                           (MS x920 x921 s124)))))) 
                       (exists ((n55 Int)) 
                           (and 
                               (<= 0 n55) 
                               (forall ((x922 Int) (x923 A)) 
                                   (=> 
                                       (MS x922 x923 s223) 
                                       (and 
                                           (<= 1 x922) 
                                           (<= x922 n55)))) 
                               (forall ((x924 Int) (x925 A) (x926 A)) 
                                   (=> 
                                       (and 
                                           (MS x924 x925 s223) 
                                           (MS x924 x926 s223)) 
                                       (= x925 x926))) 
                               (forall ((x927 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x927) 
                                           (<= x927 n55)) 
                                       (exists ((x928 A)) 
                                           (MS x927 x928 s223)))))) 
                       (forall ((x929 Int)) 
                           (=> 
                               (length s124 x929) 
                               (<= (+ x929 1) i45))) 
                       (forall ((x930 Int) (x931 Int)) 
                           (=> 
                               (and 
                                   (length s124 x931) 
                                   (length s223 x930)) 
                               (<= i45 (+ x931 x930))))) 
                   (exists ((x932 PZA)) 
                       (and 
                           (cnc s124 s223 x932) 
                           (exists ((x933 A)) 
                               (and 
                                   (exists ((x934 Int)) 
                                       (and 
                                           (forall ((x935 Int)) 
                                               (=> 
                                                   (length s124 x935) 
                                                   (= x934 (- i45 x935)))) 
                                           (MS x934 x933 s223))) 
                                   (MS i45 x933 x932)))))))
         :named hyp60))
(assert (! (forall ((s125 PZA) (s224 PZA) (b1 PA)) 
               (=> 
                   (and 
                       (exists ((n56 Int)) 
                           (and 
                               (<= 0 n56) 
                               (forall ((x936 Int) (x937 A)) 
                                   (=> 
                                       (MS x936 x937 s125) 
                                       (and 
                                           (<= 1 x936) 
                                           (<= x936 n56)))) 
                               (forall ((x938 Int) (x939 A) (x940 A)) 
                                   (=> 
                                       (and 
                                           (MS x938 x939 s125) 
                                           (MS x938 x940 s125)) 
                                       (= x939 x940))) 
                               (forall ((x941 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x941) 
                                           (<= x941 n56)) 
                                       (exists ((x942 A)) 
                                           (MS x941 x942 s125)))))) 
                       (exists ((n57 Int)) 
                           (and 
                               (<= 0 n57) 
                               (forall ((x943 Int) (x944 A)) 
                                   (=> 
                                       (MS x943 x944 s224) 
                                       (and 
                                           (<= 1 x943) 
                                           (<= x943 n57)))) 
                               (forall ((x945 Int) (x946 A) (x947 A)) 
                                   (=> 
                                       (and 
                                           (MS x945 x946 s224) 
                                           (MS x945 x947 s224)) 
                                       (= x946 x947))) 
                               (forall ((x948 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x948) 
                                           (<= x948 n57)) 
                                       (exists ((x949 A)) 
                                           (MS x948 x949 s224)))))) 
                       (forall ((x950 A)) 
                           (=> 
                               (exists ((x951 Int)) 
                                   (MS x951 x950 s125)) 
                               (MS1 x950 b1))) 
                       (forall ((x952 A)) 
                           (=> 
                               (exists ((x953 Int)) 
                                   (MS x953 x952 s224)) 
                               (MS1 x952 b1)))) 
                   (and 
                       (forall ((x954 Int) (x955 A)) 
                           (=> 
                               (exists ((x956 PZA)) 
                                   (and 
                                       (cnc s125 s224 x956) 
                                       (MS x954 x955 x956))) 
                               (and 
                                   (<= 1 x954) 
                                   (forall ((x957 Int) (x958 Int)) 
                                       (=> 
                                           (and 
                                               (length s125 x958) 
                                               (length s224 x957)) 
                                           (<= x954 (+ x958 x957)))) 
                                   (MS1 x955 b1)))) 
                       (forall ((x959 Int) (x960 A) (x961 A)) 
                           (=> 
                               (and 
                                   (exists ((x962 PZA)) 
                                       (and 
                                           (cnc s125 s224 x962) 
                                           (MS x959 x960 x962))) 
                                   (exists ((x963 PZA)) 
                                       (and 
                                           (cnc s125 s224 x963) 
                                           (MS x959 x961 x963)))) 
                               (= x960 x961))) 
                       (forall ((x964 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x964) 
                                   (forall ((x965 Int) (x966 Int)) 
                                       (=> 
                                           (and 
                                               (length s125 x966) 
                                               (length s224 x965)) 
                                           (<= x964 (+ x966 x965))))) 
                               (exists ((x967 A) (x968 PZA)) 
                                   (and 
                                       (cnc s125 s224 x968) 
                                       (MS x964 x967 x968))))))))
         :named hyp61))
(assert (! (not 
               (forall ((x969 Int) (x970 A) (x971 A)) 
                   (=> 
                       (and 
                           (MS x969 x970 s) 
                           (MS x969 x971 s)) 
                       (= x970 x971))))
         :named goal))
(check-sat)
(exit)

