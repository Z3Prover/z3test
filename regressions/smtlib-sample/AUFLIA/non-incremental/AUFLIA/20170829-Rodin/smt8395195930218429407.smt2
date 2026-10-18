(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort A 0)
(declare-sort PA 0)
(declare-sort PAA 0)
(declare-sort PZ 0)
(declare-sort PZA 0)
(declare-fun MS (A A PAA) Bool)
(declare-fun MS0 (A PA) Bool)
(declare-fun MS1 (Int A PZA) Bool)
(declare-fun MS2 (Int PZ) Bool)
(declare-fun cnc (PZA PZA PZA) Bool)
(declare-fun dist (A A Int) Bool)
(declare-fun length (PZA Int) Bool)
(declare-fun path (A A PZA) Bool)
(declare-fun reverse (PZA PZA) Bool)
(declare-fun seq (PZA) Bool)
(declare-fun a () PA)
(declare-fun c () PAA)
(declare-fun candidate () PA)
(declare-fun r () PAA)
(declare-fun x () A)
(declare-fun y () A)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x1395 A) (x1396 A)) 
            (exists ((X PAA)) 
                (and 
                    (MS x1395 x1396 X) 
                    (forall ((y19 A) (y20 A)) 
                        (=> 
                            (MS y19 y20 X) 
                            (and 
                                (= y19 x1395) 
                                (= y20 x1396))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x1397 A)) 
            (exists ((X0 PA)) 
                (and 
                    (MS0 x1397 X0) 
                    (forall ((y21 A)) 
                        (=> 
                            (MS0 y21 X0) 
                            (= y21 x1397)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x1398 Int)) 
            (exists ((X1 PZ)) 
                (and 
                    (MS2 x1398 X1) 
                    (forall ((y22 Int)) 
                        (=> 
                            (MS2 y22 X1) 
                            (= y22 x1398)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x1399 Int) (x1400 A)) 
            (exists ((X2 PZA)) 
                (and 
                    (MS1 x1399 x1400 X2) 
                    (forall ((y23 Int) (y24 A)) 
                        (=> 
                            (MS1 y23 y24 X2) 
                            (and 
                                (= y23 x1399) 
                                (= y24 x1400))))))))
(assert (! (forall ((x0 A) (x1 A)) 
               (=> 
                   (MS x0 x1 r) 
                   (and 
                       (MS0 x0 a) 
                       (MS0 x1 a))))
         :named hyp1))
(assert (! (not 
               (forall ((x2 A) (x3 A)) 
                   (not 
                       (MS x2 x3 r))))
         :named hyp2))
(assert (! (forall ((x4 A) (x5 A)) 
               (=> 
                   (MS x4 x5 c) 
                   (and 
                       (MS0 x4 a) 
                       (MS0 x5 a))))
         :named hyp3))
(assert (! (forall ((x6 A) (x7 A)) 
               (=> 
                   (MS x6 x7 r) 
                   (MS x6 x7 c)))
         :named hyp4))
(assert (! (forall ((x8 A) (x9 A)) 
               (=> 
                   (exists ((x10 A)) 
                       (and 
                           (MS x8 x10 c) 
                           (MS x10 x9 r))) 
                   (MS x8 x9 c)))
         :named hyp5))
(assert (! (forall ((s PAA)) 
               (=> 
                   (and 
                       (forall ((x11 A) (x12 A)) 
                           (=> 
                               (MS x11 x12 s) 
                               (and 
                                   (MS0 x11 a) 
                                   (MS0 x12 a)))) 
                       (forall ((x13 A) (x14 A)) 
                           (=> 
                               (MS x13 x14 r) 
                               (MS x13 x14 s))) 
                       (forall ((x15 A) (x16 A)) 
                           (=> 
                               (exists ((x17 A)) 
                                   (and 
                                       (MS x15 x17 s) 
                                       (MS x17 x16 r))) 
                               (MS x15 x16 s)))) 
                   (forall ((x18 A) (x19 A)) 
                       (=> 
                           (MS x18 x19 c) 
                           (MS x18 x19 s)))))
         :named hyp6))
(assert (! (forall ((x20 A)) 
               (= 
                   (exists ((x21 A)) 
                       (MS x20 x21 r)) 
                   (MS0 x20 a)))
         :named hyp7))
(assert (! (forall ((x22 A)) 
               (= 
                   (exists ((x23 A)) 
                       (MS x22 x23 c)) 
                   (MS0 x22 a)))
         :named hyp8))
(assert (! (forall ((x24 A)) 
               (=> 
                   (exists ((x25 A)) 
                       (MS x24 x25 r)) 
                   (exists ((x26 A)) 
                       (MS x24 x26 c))))
         :named hyp9))
(assert (! (forall ((x27 A) (x28 A)) 
               (= 
                   (MS x27 x28 c) 
                   (or 
                       (MS x27 x28 r) 
                       (exists ((x29 A)) 
                           (and 
                               (MS x27 x29 c) 
                               (MS x29 x28 r))))))
         :named hyp10))
(assert (! (forall ((x30 A) (y0 A)) 
               (=> 
                   (and 
                       (MS0 x30 a) 
                       (MS0 y0 a)) 
                   (forall ((s0 PZA) (n Int)) 
                       (=> 
                           (and 
                               (<= 0 n) 
                               (< 1 n) 
                               (forall ((x31 Int) (x32 A)) 
                                   (=> 
                                       (MS1 x31 x32 s0) 
                                       (and 
                                           (<= 1 x31) 
                                           (<= x31 n) 
                                           (MS0 x32 a)))) 
                               (forall ((x33 Int) (x34 A) (x35 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x33 x34 s0) 
                                           (MS1 x33 x35 s0)) 
                                       (= x34 x35))) 
                               (forall ((x36 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x36) 
                                           (<= x36 n)) 
                                       (exists ((x37 A)) 
                                           (MS1 x36 x37 s0))))) 
                           (and 
                               (exists ((x38 A) (x39 Int)) 
                                   (and 
                                       (= x39 1) 
                                       (MS1 x39 x38 s0))) 
                               (forall ((x40 Int) (x41 A) (x42 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x40 x41 s0) 
                                           (MS1 x40 x42 s0)) 
                                       (= x41 x42))) 
                               (=> 
                                   (exists ((x43 Int)) 
                                       (and 
                                           (= x43 1) 
                                           (MS1 x43 x30 s0))) 
                                   (and 
                                       (exists ((x44 A)) 
                                           (MS1 n x44 s0)) 
                                       (=> 
                                           (MS1 n y0 s0) 
                                           (forall ((i Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i) 
                                                       (<= i (- n 1))) 
                                                   (and 
                                                       (exists ((x45 A)) 
                                                           (MS1 i x45 s0)) 
                                                       (exists ((x46 A) (x47 Int)) 
                                                           (and 
                                                               (= x47 (+ i 1)) 
                                                               (MS1 x47 x46 s0))))))))))))))
         :named hyp11))
(assert (! (forall ((s1 PZ) (n0 Int)) 
               (=> 
                   (and 
                       (< 1 n0) 
                       (forall ((x48 Int)) 
                           (=> 
                               (MS2 x48 s1) 
                               (and 
                                   (<= 2 x48) 
                                   (<= x48 n0)))) 
                       (exists ((x49 Int)) 
                           (and 
                               (= x49 2) 
                               (MS2 x49 s1))) 
                       (forall ((i0 Int)) 
                           (=> 
                               (and 
                                   (<= 2 i0) 
                                   (<= i0 (- n0 1)) 
                                   (MS2 i0 s1)) 
                               (exists ((x50 Int)) 
                                   (and 
                                       (= x50 (+ i0 1)) 
                                       (MS2 x50 s1)))))) 
                   (forall ((x51 Int)) 
                       (=> 
                           (and 
                               (<= 2 x51) 
                               (<= x51 n0)) 
                           (MS2 x51 s1)))))
         :named hyp12))
(assert (! (forall ((x52 A) (x53 A)) 
               (=> 
                   (exists ((x54 PZA)) 
                       (path x52 x53 x54)) 
                   (MS x52 x53 c)))
         :named hyp13))
(assert (! (forall ((x55 A) (x56 A)) 
               (=> 
                   (MS x55 x56 c) 
                   (exists ((x57 PZA)) 
                       (path x55 x56 x57))))
         :named hyp14))
(assert (! (forall ((x58 A) (x59 A)) 
               (=> 
                   (and 
                       (MS0 x58 a) 
                       (MS0 x59 a)) 
                   (exists ((x60 PZA)) 
                       (path x58 x59 x60))))
         :named hyp15))
(assert (! (forall ((x61 PZA)) 
               (= 
                   (seq x61) 
                   (exists ((s2 PZA)) 
                       (and 
                           (exists ((n1 Int)) 
                               (and 
                                   (<= 0 n1) 
                                   (forall ((x62 Int) (x63 A)) 
                                       (=> 
                                           (MS1 x62 x63 s2) 
                                           (and 
                                               (<= 1 x62) 
                                               (<= x62 n1)))) 
                                   (forall ((x64 Int) (x65 A) (x66 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x64 x65 s2) 
                                               (MS1 x64 x66 s2)) 
                                           (= x65 x66))) 
                                   (forall ((x67 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x67) 
                                               (<= x67 n1)) 
                                           (exists ((x68 A)) 
                                               (MS1 x67 x68 s2)))))) 
                           (forall ((x69 Int) (x70 A)) 
                               (= 
                                   (MS1 x69 x70 x61) 
                                   (MS1 x69 x70 s2)))))))
         :named hyp16))
(assert (! (forall ((n2 Int) (s3 PZA)) 
               (=> 
                   (and 
                       (<= 0 n2) 
                       (forall ((x71 Int) (x72 A)) 
                           (=> 
                               (MS1 x71 x72 s3) 
                               (and 
                                   (<= 1 x71) 
                                   (<= x71 n2)))) 
                       (forall ((x73 Int) (x74 A) (x75 A)) 
                           (=> 
                               (and 
                                   (MS1 x73 x74 s3) 
                                   (MS1 x73 x75 s3)) 
                               (= x74 x75))) 
                       (forall ((x76 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x76) 
                                   (<= x76 n2)) 
                               (exists ((x77 A)) 
                                   (MS1 x76 x77 s3))))) 
                   (seq s3)))
         :named hyp17))
(assert (! (and 
               (forall ((x78 PZA) (x79 Int)) 
                   (=> 
                       (length x78 x79) 
                       (and 
                           (seq x78) 
                           (<= 0 x79)))) 
               (forall ((x80 PZA) (x81 Int) (x82 Int)) 
                   (=> 
                       (and 
                           (length x80 x81) 
                           (length x80 x82)) 
                       (= x81 x82))) 
               (forall ((x83 PZA)) 
                   (=> 
                       (seq x83) 
                       (exists ((x84 Int)) 
                           (length x83 x84)))))
         :named hyp18))
(assert (! (forall ((n3 Int) (s4 PZA)) 
               (=> 
                   (and 
                       (<= 0 n3) 
                       (forall ((x85 Int) (x86 A)) 
                           (=> 
                               (MS1 x85 x86 s4) 
                               (and 
                                   (<= 1 x85) 
                                   (<= x85 n3)))) 
                       (forall ((x87 Int) (x88 A) (x89 A)) 
                           (=> 
                               (and 
                                   (MS1 x87 x88 s4) 
                                   (MS1 x87 x89 s4)) 
                               (= x88 x89))) 
                       (forall ((x90 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x90) 
                                   (<= x90 n3)) 
                               (exists ((x91 A)) 
                                   (MS1 x90 x91 s4))))) 
                   (length s4 n3)))
         :named hyp19))
(assert (! (forall ((s5 PZA)) 
               (=> 
                   (seq s5) 
                   (and 
                       (forall ((x92 Int) (x93 A)) 
                           (=> 
                               (MS1 x92 x93 s5) 
                               (and 
                                   (<= 1 x92) 
                                   (forall ((x94 Int)) 
                                       (=> 
                                           (length s5 x94) 
                                           (<= x92 x94)))))) 
                       (forall ((x95 Int) (x96 A) (x97 A)) 
                           (=> 
                               (and 
                                   (MS1 x95 x96 s5) 
                                   (MS1 x95 x97 s5)) 
                               (= x96 x97))) 
                       (forall ((x98 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x98) 
                                   (forall ((x99 Int)) 
                                       (=> 
                                           (length s5 x99) 
                                           (<= x98 x99)))) 
                               (exists ((x100 A)) 
                                   (MS1 x98 x100 s5)))))))
         :named hyp20))
(assert (! (forall ((x101 PZA) (x102 PZA) (x103 PZA)) 
               (= 
                   (cnc x101 x102 x103) 
                   (exists ((s10 PZA) (s20 PZA)) 
                       (and 
                           (seq s10) 
                           (seq s20) 
                           (forall ((x104 Int) (x105 A)) 
                               (= 
                                   (MS1 x104 x105 x101) 
                                   (MS1 x104 x105 s10))) 
                           (forall ((x106 Int) (x107 A)) 
                               (= 
                                   (MS1 x106 x107 x102) 
                                   (MS1 x106 x107 s20))) 
                           (forall ((x108 Int) (x109 A)) 
                               (= 
                                   (MS1 x108 x109 x103) 
                                   (or 
                                       (exists ((i1 Int)) 
                                           (and 
                                               (<= 1 i1) 
                                               (forall ((x110 Int)) 
                                                   (=> 
                                                       (length s10 x110) 
                                                       (<= i1 x110))) 
                                               (= x108 i1) 
                                               (MS1 i1 x109 s10))) 
                                       (exists ((i2 Int)) 
                                           (and 
                                               (forall ((x111 Int)) 
                                                   (=> 
                                                       (length s10 x111) 
                                                       (<= (+ x111 1) i2))) 
                                               (forall ((x112 Int) (x113 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s10 x113) 
                                                           (length s20 x112)) 
                                                       (<= i2 (+ x113 x112)))) 
                                               (= x108 i2) 
                                               (exists ((x114 Int)) 
                                                   (and 
                                                       (forall ((x115 Int)) 
                                                           (=> 
                                                               (length s10 x115) 
                                                               (= x114 (- i2 x115)))) 
                                                       (MS1 x114 x109 s20))))))))))))
         :named hyp21))
(assert (! (and 
               (forall ((x116 PZA) (x117 PZA) (x118 PZA)) 
                   (=> 
                       (cnc x116 x117 x118) 
                       (and 
                           (seq x116) 
                           (seq x117) 
                           (seq x118)))) 
               (forall ((x119 PZA) (x120 PZA) (x121 PZA) (x122 PZA)) 
                   (=> 
                       (and 
                           (cnc x119 x120 x121) 
                           (cnc x119 x120 x122)) 
                       (forall ((x123 Int) (x124 A)) 
                           (= 
                               (MS1 x123 x124 x121) 
                               (MS1 x123 x124 x122))))) 
               (forall ((x125 PZA) (x126 PZA)) 
                   (=> 
                       (and 
                           (seq x125) 
                           (seq x126)) 
                       (exists ((x127 PZA)) 
                           (cnc x125 x126 x127)))))
         :named hyp22))
(assert (! (forall ((s11 PZA) (s21 PZA)) 
               (=> 
                   (and 
                       (seq s11) 
                       (seq s21)) 
                   (exists ((x128 PZA) (x129 Int)) 
                       (and 
                           (cnc s11 s21 x128) 
                           (forall ((x130 Int) (x131 Int)) 
                               (=> 
                                   (and 
                                       (length s11 x131) 
                                       (length s21 x130)) 
                                   (= x129 (+ x131 x130)))) 
                           (length x128 x129)))))
         :named hyp23))
(assert (! (forall ((s12 PZA) (s22 PZA)) 
               (=> 
                   (and 
                       (seq s12) 
                       (seq s22)) 
                   (forall ((x132 Int)) 
                       (= 
                           (exists ((x133 A) (x134 PZA)) 
                               (and 
                                   (cnc s12 s22 x134) 
                                   (MS1 x132 x133 x134))) 
                           (and 
                               (<= 1 x132) 
                               (forall ((x135 Int) (x136 Int)) 
                                   (=> 
                                       (and 
                                           (length s12 x136) 
                                           (length s22 x135)) 
                                       (<= x132 (+ x136 x135)))))))))
         :named hyp24))
(assert (! (forall ((s13 PZA) (s23 PZA)) 
               (=> 
                   (and 
                       (seq s13) 
                       (seq s23)) 
                   (forall ((x137 A)) 
                       (= 
                           (exists ((x138 Int) (x139 PZA)) 
                               (and 
                                   (cnc s13 s23 x139) 
                                   (MS1 x138 x137 x139))) 
                           (or 
                               (exists ((x140 Int)) 
                                   (MS1 x140 x137 s13)) 
                               (exists ((x141 Int)) 
                                   (MS1 x141 x137 s23)))))))
         :named hyp25))
(assert (! (forall ((s14 PZA) (s24 PZA) (i3 Int)) 
               (=> 
                   (and 
                       (seq s14) 
                       (seq s24) 
                       (<= 1 i3) 
                       (forall ((x142 Int)) 
                           (=> 
                               (length s14 x142) 
                               (<= i3 x142)))) 
                   (exists ((x143 PZA)) 
                       (and 
                           (cnc s14 s24 x143) 
                           (exists ((x144 A)) 
                               (and 
                                   (MS1 i3 x144 s14) 
                                   (MS1 i3 x144 x143)))))))
         :named hyp26))
(assert (! (forall ((s15 PZA) (s25 PZA) (i4 Int)) 
               (=> 
                   (and 
                       (seq s15) 
                       (seq s25) 
                       (forall ((x145 Int)) 
                           (=> 
                               (length s15 x145) 
                               (<= (+ x145 1) i4))) 
                       (forall ((x146 Int) (x147 Int)) 
                           (=> 
                               (and 
                                   (length s15 x147) 
                                   (length s25 x146)) 
                               (<= i4 (+ x147 x146))))) 
                   (exists ((x148 PZA)) 
                       (and 
                           (cnc s15 s25 x148) 
                           (exists ((x149 A)) 
                               (and 
                                   (exists ((x150 Int)) 
                                       (and 
                                           (forall ((x151 Int)) 
                                               (=> 
                                                   (length s15 x151) 
                                                   (= x150 (- i4 x151)))) 
                                           (MS1 x150 x149 s25))) 
                                   (MS1 i4 x149 x148)))))))
         :named hyp27))
(assert (! (forall ((x152 A) (x153 A)) 
               (not 
                   (and 
                       (MS x152 x153 r) 
                       (= x152 x153))))
         :named hyp28))
(assert (! (and 
               (forall ((x154 A) (x155 A) (x156 Int)) 
                   (=> 
                       (dist x154 x155 x156) 
                       (and 
                           (MS0 x154 a) 
                           (MS0 x155 a) 
                           (<= 0 x156)))) 
               (forall ((x157 A) (x158 A) (x159 Int) (x160 Int)) 
                   (=> 
                       (and 
                           (dist x157 x158 x159) 
                           (dist x157 x158 x160)) 
                       (= x159 x160))) 
               (forall ((x161 A) (x162 A)) 
                   (=> 
                       (and 
                           (MS0 x161 a) 
                           (MS0 x162 a)) 
                       (exists ((x163 Int)) 
                           (dist x161 x162 x163)))))
         :named hyp29))
(assert (! (forall ((x164 A) (y1 A)) 
               (=> 
                   (and 
                       (MS0 x164 a) 
                       (MS0 y1 a)) 
                   (exists ((x165 Int)) 
                       (and 
                           (exists ((x166 PZA)) 
                               (and 
                                   (exists ((x167 A) (x168 A)) 
                                       (and 
                                           (= x167 x164) 
                                           (= x168 y1) 
                                           (path x167 x168 x166))) 
                                   (length x166 x165))) 
                           (forall ((x169 Int)) 
                               (=> 
                                   (exists ((x170 PZA)) 
                                       (and 
                                           (exists ((x171 A) (x172 A)) 
                                               (and 
                                                   (= x171 x164) 
                                                   (= x172 y1) 
                                                   (path x171 x172 x170))) 
                                           (length x170 x169))) 
                                   (<= x165 x169))) 
                           (dist x164 y1 x165)))))
         :named hyp30))
(assert (! (forall ((x173 PZA) (x174 PZA)) 
               (= 
                   (reverse x173 x174) 
                   (exists ((s6 PZA)) 
                       (and 
                           (seq s6) 
                           (forall ((x175 Int) (x176 A)) 
                               (= 
                                   (MS1 x175 x176 x173) 
                                   (MS1 x175 x176 s6))) 
                           (forall ((x177 Int) (x178 A)) 
                               (= 
                                   (MS1 x177 x178 x174) 
                                   (exists ((i5 Int)) 
                                       (and 
                                           (<= 1 i5) 
                                           (forall ((x179 Int)) 
                                               (=> 
                                                   (length s6 x179) 
                                                   (<= i5 x179))) 
                                           (= x177 i5) 
                                           (exists ((x180 Int)) 
                                               (and 
                                                   (forall ((x181 Int)) 
                                                       (=> 
                                                           (length s6 x181) 
                                                           (= x180 (+ (- x181 i5) 1)))) 
                                                   (MS1 x180 x178 s6)))))))))))
         :named hyp31))
(assert (! (and 
               (forall ((x182 PZA) (x183 PZA)) 
                   (=> 
                       (reverse x182 x183) 
                       (and 
                           (seq x182) 
                           (seq x183)))) 
               (forall ((x184 PZA) (x185 PZA) (x186 PZA)) 
                   (=> 
                       (and 
                           (reverse x184 x185) 
                           (reverse x184 x186)) 
                       (forall ((x187 Int) (x188 A)) 
                           (= 
                               (MS1 x187 x188 x185) 
                               (MS1 x187 x188 x186))))) 
               (forall ((x189 PZA)) 
                   (=> 
                       (seq x189) 
                       (exists ((x190 PZA)) 
                           (reverse x189 x190)))))
         :named hyp32))
(assert (! (forall ((s7 PZA)) 
               (=> 
                   (seq s7) 
                   (exists ((x191 PZA) (x192 Int)) 
                       (and 
                           (reverse s7 x191) 
                           (length s7 x192) 
                           (length x191 x192)))))
         :named hyp33))
(assert (! (forall ((s8 PZA)) 
               (=> 
                   (seq s8) 
                   (forall ((x193 A)) 
                       (= 
                           (exists ((x194 Int) (x195 PZA)) 
                               (and 
                                   (reverse s8 x195) 
                                   (MS1 x194 x193 x195))) 
                           (exists ((x196 Int)) 
                               (MS1 x196 x193 s8))))))
         :named hyp34))
(assert (! (forall ((s9 PZA)) 
               (=> 
                   (seq s9) 
                   (exists ((x197 PZA)) 
                       (and 
                           (reverse s9 x197) 
                           (reverse x197 s9)))))
         :named hyp35))
(assert (! (forall ((x198 A) (x199 A)) 
               (=> 
                   (MS x198 x199 r) 
                   (MS x199 x198 r)))
         :named hyp36))
(assert (! (forall ((x200 A) (y2 A) (p PZA)) 
               (=> 
                   (path x200 y2 p) 
                   (exists ((x201 PZA)) 
                       (and 
                           (reverse p x201) 
                           (path y2 x200 x201)))))
         :named hyp37))
(assert (! (forall ((x202 A) (y3 A)) 
               (=> 
                   (and 
                       (MS0 x202 a) 
                       (MS0 y3 a)) 
                   (forall ((x203 PZA)) 
                       (= 
                           (exists ((x204 A) (x205 A)) 
                               (and 
                                   (= x204 y3) 
                                   (= x205 x202) 
                                   (path x204 x205 x203))) 
                           (exists ((x206 PZA)) 
                               (and 
                                   (exists ((x207 A) (x208 A)) 
                                       (and 
                                           (= x207 x202) 
                                           (= x208 y3) 
                                           (path x207 x208 x206))) 
                                   (reverse x206 x203)))))))
         :named hyp38))
(assert (! (forall ((x209 A) (x210 A) (x211 PZA)) 
               (= 
                   (path x209 x210 x211) 
                   (exists ((x212 A) (y4 A) (p0 PZA)) 
                       (and 
                           (MS0 x212 a) 
                           (MS0 y4 a) 
                           (exists ((n4 Int)) 
                               (and 
                                   (<= 0 n4) 
                                   (< 1 n4) 
                                   (forall ((x213 Int) (x214 A)) 
                                       (=> 
                                           (MS1 x213 x214 p0) 
                                           (and 
                                               (<= 1 x213) 
                                               (<= x213 n4) 
                                               (MS0 x214 a)))) 
                                   (forall ((x215 Int) (x216 A) (x217 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x215 x216 p0) 
                                               (MS1 x215 x217 p0)) 
                                           (= x216 x217))) 
                                   (forall ((x218 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x218) 
                                               (<= x218 n4)) 
                                           (exists ((x219 A)) 
                                               (MS1 x218 x219 p0)))) 
                                   (exists ((x220 Int)) 
                                       (and 
                                           (= x220 1) 
                                           (MS1 x220 x212 p0))) 
                                   (MS1 n4 y4 p0) 
                                   (forall ((i6 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 i6) 
                                               (<= i6 (- n4 1))) 
                                           (exists ((x221 A) (x222 A)) 
                                               (and 
                                                   (MS1 i6 x221 p0) 
                                                   (exists ((x223 Int)) 
                                                       (and 
                                                           (= x223 (+ i6 1)) 
                                                           (MS1 x223 x222 p0))) 
                                                   (MS x221 x222 r))))))) 
                           (= x209 x212) 
                           (= x210 y4) 
                           (forall ((x224 Int) (x225 A)) 
                               (= 
                                   (MS1 x224 x225 x211) 
                                   (MS1 x224 x225 p0)))))))
         :named hyp39))
(assert (! (forall ((x226 A)) 
               (= 
                   (MS0 x226 candidate) 
                   (exists ((z A)) 
                       (and 
                           (MS0 z a) 
                           (forall ((x227 A) (y5 A)) 
                               (=> 
                                   (and 
                                       (MS0 x227 a) 
                                       (not 
                                           (= x227 z)) 
                                       (MS0 y5 a) 
                                       (not 
                                           (= y5 z)) 
                                       (not 
                                           (= x227 y5))) 
                                   (exists ((p1 PZA)) 
                                       (and 
                                           (exists ((x228 A) (x229 A)) 
                                               (and 
                                                   (= x228 x227) 
                                                   (= x229 y5) 
                                                   (path x228 x229 p1))) 
                                           (not 
                                               (exists ((x230 Int)) 
                                                   (MS1 x230 z p1))))))) 
                           (= x226 z)))))
         :named hyp40))
(assert (! (forall ((u A)) 
               (=> 
                   (MS0 u candidate) 
                   (forall ((x231 A) (x232 A)) 
                       (=> 
                           (and 
                               (MS0 x231 a) 
                               (not 
                                   (= x231 u)) 
                               (MS0 x232 a) 
                               (not 
                                   (= x232 u)) 
                               (not 
                                   (= x231 x232))) 
                           (exists ((x233 A) (y6 A) (p2 PZA)) 
                               (and 
                                   (MS0 x233 a) 
                                   (not 
                                       (= x233 u)) 
                                   (MS0 y6 a) 
                                   (not 
                                       (= y6 u)) 
                                   (not 
                                       (= x233 y6)) 
                                   (exists ((n5 Int)) 
                                       (and 
                                           (<= 0 n5) 
                                           (< 1 n5) 
                                           (forall ((x234 Int) (x235 A)) 
                                               (=> 
                                                   (MS1 x234 x235 p2) 
                                                   (and 
                                                       (<= 1 x234) 
                                                       (<= x234 n5) 
                                                       (MS0 x235 a) 
                                                       (not 
                                                           (= x235 u))))) 
                                           (forall ((x236 Int) (x237 A) (x238 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x236 x237 p2) 
                                                       (MS1 x236 x238 p2)) 
                                                   (= x237 x238))) 
                                           (forall ((x239 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x239) 
                                                       (<= x239 n5)) 
                                                   (exists ((x240 A)) 
                                                       (MS1 x239 x240 p2)))) 
                                           (exists ((x241 Int)) 
                                               (and 
                                                   (= x241 1) 
                                                   (MS1 x241 x233 p2))) 
                                           (MS1 n5 y6 p2) 
                                           (forall ((i7 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i7) 
                                                       (<= i7 (- n5 1))) 
                                                   (exists ((x242 A) (x243 A)) 
                                                       (and 
                                                           (MS1 i7 x242 p2) 
                                                           (exists ((x244 Int)) 
                                                               (and 
                                                                   (= x244 (+ i7 1)) 
                                                                   (MS1 x244 x243 p2))) 
                                                           (MS x242 x243 r))))))) 
                                   (= x231 x233) 
                                   (= x232 y6)))))))
         :named hyp41))
(assert (! (forall ((s16 PZA) (s26 PZA)) 
               (=> 
                   (and 
                       (seq s16) 
                       (seq s26)) 
                   (and 
                       (exists ((x245 Int)) 
                           (length s16 x245)) 
                       (forall ((x246 PZA) (x247 Int) (x248 Int)) 
                           (=> 
                               (and 
                                   (length x246 x247) 
                                   (length x246 x248)) 
                               (= x247 x248))) 
                       (forall ((i8 Int)) 
                           (=> 
                               (and 
                                   (<= 1 i8) 
                                   (forall ((x249 Int)) 
                                       (=> 
                                           (length s16 x249) 
                                           (<= i8 x249)))) 
                               (and 
                                   (exists ((x250 A)) 
                                       (MS1 i8 x250 s16)) 
                                   (forall ((x251 Int) (x252 A) (x253 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x251 x252 s16) 
                                               (MS1 x251 x253 s16)) 
                                           (= x252 x253)))))) 
                       (exists ((x254 Int)) 
                           (length s26 x254)) 
                       (forall ((i9 Int)) 
                           (=> 
                               (and 
                                   (forall ((x255 Int)) 
                                       (=> 
                                           (length s16 x255) 
                                           (<= (+ x255 1) i9))) 
                                   (forall ((x256 Int) (x257 Int)) 
                                       (=> 
                                           (and 
                                               (length s16 x257) 
                                               (length s26 x256)) 
                                           (<= i9 (+ x257 x256))))) 
                               (and 
                                   (exists ((x258 A) (x259 Int)) 
                                       (and 
                                           (forall ((x260 Int)) 
                                               (=> 
                                                   (length s16 x260) 
                                                   (= x259 (- i9 x260)))) 
                                           (MS1 x259 x258 s26))) 
                                   (forall ((x261 Int) (x262 A) (x263 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x261 x262 s26) 
                                               (MS1 x261 x263 s26)) 
                                           (= x262 x263)))))))))
         :named hyp42))
(assert (! (forall ((s17 PZA)) 
               (=> 
                   (seq s17) 
                   (and 
                       (exists ((x264 Int)) 
                           (length s17 x264)) 
                       (forall ((x265 PZA) (x266 Int) (x267 Int)) 
                           (=> 
                               (and 
                                   (length x265 x266) 
                                   (length x265 x267)) 
                               (= x266 x267))) 
                       (forall ((i10 Int)) 
                           (=> 
                               (and 
                                   (<= 1 i10) 
                                   (forall ((x268 Int)) 
                                       (=> 
                                           (length s17 x268) 
                                           (<= i10 x268)))) 
                               (and 
                                   (exists ((x269 A) (x270 Int)) 
                                       (and 
                                           (forall ((x271 Int)) 
                                               (=> 
                                                   (length s17 x271) 
                                                   (= x270 (+ (- x271 i10) 1)))) 
                                           (MS1 x270 x269 s17))) 
                                   (forall ((x272 Int) (x273 A) (x274 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x272 x273 s17) 
                                               (MS1 x272 x274 s17)) 
                                           (= x273 x274)))))))))
         :named hyp43))
(assert (! (forall ((x275 A) (x276 A)) 
               (=> 
                   (and 
                       (MS0 x275 a) 
                       (MS0 x276 a)) 
                   (MS x275 x276 c)))
         :named hyp44))
(assert (! (not 
               (forall ((x277 A)) 
                   (MS0 x277 a)))
         :named hyp45))
(assert (! (forall ((s18 PZA) (s27 PZA) (b PA)) 
               (=> 
                   (and 
                       (seq s18) 
                       (seq s27) 
                       (forall ((x278 A)) 
                           (=> 
                               (exists ((x279 Int)) 
                                   (MS1 x279 x278 s18)) 
                               (MS0 x278 b))) 
                       (forall ((x280 A)) 
                           (=> 
                               (exists ((x281 Int)) 
                                   (MS1 x281 x280 s27)) 
                               (MS0 x280 b)))) 
                   (and 
                       (forall ((x282 Int) (x283 A)) 
                           (=> 
                               (exists ((x284 PZA)) 
                                   (and 
                                       (cnc s18 s27 x284) 
                                       (MS1 x282 x283 x284))) 
                               (and 
                                   (<= 1 x282) 
                                   (forall ((x285 Int) (x286 Int)) 
                                       (=> 
                                           (and 
                                               (length s18 x286) 
                                               (length s27 x285)) 
                                           (<= x282 (+ x286 x285)))) 
                                   (MS0 x283 b)))) 
                       (forall ((x287 Int) (x288 A) (x289 A)) 
                           (=> 
                               (and 
                                   (exists ((x290 PZA)) 
                                       (and 
                                           (cnc s18 s27 x290) 
                                           (MS1 x287 x288 x290))) 
                                   (exists ((x291 PZA)) 
                                       (and 
                                           (cnc s18 s27 x291) 
                                           (MS1 x287 x289 x291)))) 
                               (= x288 x289))) 
                       (forall ((x292 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x292) 
                                   (forall ((x293 Int) (x294 Int)) 
                                       (=> 
                                           (and 
                                               (length s18 x294) 
                                               (length s27 x293)) 
                                           (<= x292 (+ x294 x293))))) 
                               (exists ((x295 A) (x296 PZA)) 
                                   (and 
                                       (cnc s18 s27 x296) 
                                       (MS1 x292 x295 x296))))))))
         :named hyp46))
(assert (! (forall ((x297 A) (x298 A) (x299 PZA)) 
               (= 
                   (path x297 x298 x299) 
                   (exists ((x300 A) (y7 A) (p3 PZA)) 
                       (and 
                           (seq p3) 
                           (forall ((x301 A)) 
                               (=> 
                                   (exists ((x302 Int)) 
                                       (MS1 x302 x301 p3)) 
                                   (MS0 x301 a))) 
                           (forall ((x303 Int)) 
                               (=> 
                                   (length p3 x303) 
                                   (< 1 x303))) 
                           (exists ((x304 Int)) 
                               (and 
                                   (= x304 1) 
                                   (MS1 x304 x300 p3))) 
                           (exists ((x305 Int)) 
                               (and 
                                   (length p3 x305) 
                                   (MS1 x305 y7 p3))) 
                           (forall ((i11 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 i11) 
                                       (forall ((x306 Int)) 
                                           (=> 
                                               (length p3 x306) 
                                               (<= i11 (- x306 1))))) 
                                   (exists ((x307 A) (x308 A)) 
                                       (and 
                                           (MS1 i11 x307 p3) 
                                           (exists ((x309 Int)) 
                                               (and 
                                                   (= x309 (+ i11 1)) 
                                                   (MS1 x309 x308 p3))) 
                                           (MS x307 x308 r))))) 
                           (= x297 x300) 
                           (= x298 y7) 
                           (forall ((x310 Int) (x311 A)) 
                               (= 
                                   (MS1 x310 x311 x299) 
                                   (MS1 x310 x311 p3)))))))
         :named hyp47))
(assert (! (forall ((x312 A) (y8 A) (p4 PZA)) 
               (=> 
                   (and 
                       (seq p4) 
                       (forall ((x313 A)) 
                           (=> 
                               (exists ((x314 Int)) 
                                   (MS1 x314 x313 p4)) 
                               (MS0 x313 a)))) 
                   (and 
                       (exists ((x315 Int)) 
                           (length p4 x315)) 
                       (forall ((x316 PZA) (x317 Int) (x318 Int)) 
                           (=> 
                               (and 
                                   (length x316 x317) 
                                   (length x316 x318)) 
                               (= x317 x318))) 
                       (=> 
                           (forall ((x319 Int)) 
                               (=> 
                                   (length p4 x319) 
                                   (< 1 x319))) 
                           (and 
                               (exists ((x320 A) (x321 Int)) 
                                   (and 
                                       (= x321 1) 
                                       (MS1 x321 x320 p4))) 
                               (forall ((x322 Int) (x323 A) (x324 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x322 x323 p4) 
                                           (MS1 x322 x324 p4)) 
                                       (= x323 x324))) 
                               (=> 
                                   (exists ((x325 Int)) 
                                       (and 
                                           (= x325 1) 
                                           (MS1 x325 x312 p4))) 
                                   (and 
                                       (exists ((x326 A) (x327 Int)) 
                                           (and 
                                               (length p4 x327) 
                                               (MS1 x327 x326 p4))) 
                                       (=> 
                                           (exists ((x328 Int)) 
                                               (and 
                                                   (length p4 x328) 
                                                   (MS1 x328 y8 p4))) 
                                           (forall ((i12 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i12) 
                                                       (forall ((x329 Int)) 
                                                           (=> 
                                                               (length p4 x329) 
                                                               (<= i12 (- x329 1))))) 
                                                   (and 
                                                       (exists ((x330 A)) 
                                                           (MS1 i12 x330 p4)) 
                                                       (exists ((x331 A) (x332 Int)) 
                                                           (and 
                                                               (= x332 (+ i12 1)) 
                                                               (MS1 x332 x331 p4))))))))))))))
         :named hyp48))
(assert (! (MS0 x a)
         :named hyp49))
(assert (! (MS0 y a)
         :named hyp50))
(assert (! (and 
               (forall ((x333 PZA) (x334 Int)) 
                   (=> 
                       (length x333 x334) 
                       (and 
                           (exists ((s19 PZA)) 
                               (and 
                                   (exists ((n6 Int)) 
                                       (and 
                                           (<= 0 n6) 
                                           (forall ((x335 Int) (x336 A)) 
                                               (=> 
                                                   (MS1 x335 x336 s19) 
                                                   (and 
                                                       (<= 1 x335) 
                                                       (<= x335 n6)))) 
                                           (forall ((x337 Int) (x338 A) (x339 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x337 x338 s19) 
                                                       (MS1 x337 x339 s19)) 
                                                   (= x338 x339))) 
                                           (forall ((x340 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x340) 
                                                       (<= x340 n6)) 
                                                   (exists ((x341 A)) 
                                                       (MS1 x340 x341 s19)))))) 
                                   (forall ((x342 Int) (x343 A)) 
                                       (= 
                                           (MS1 x342 x343 x333) 
                                           (MS1 x342 x343 s19))))) 
                           (<= 0 x334)))) 
               (forall ((x344 PZA) (x345 Int) (x346 Int)) 
                   (=> 
                       (and 
                           (length x344 x345) 
                           (length x344 x346)) 
                       (= x345 x346))) 
               (forall ((x347 PZA)) 
                   (=> 
                       (exists ((s28 PZA)) 
                           (and 
                               (exists ((n7 Int)) 
                                   (and 
                                       (<= 0 n7) 
                                       (forall ((x348 Int) (x349 A)) 
                                           (=> 
                                               (MS1 x348 x349 s28) 
                                               (and 
                                                   (<= 1 x348) 
                                                   (<= x348 n7)))) 
                                       (forall ((x350 Int) (x351 A) (x352 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x350 x351 s28) 
                                                   (MS1 x350 x352 s28)) 
                                               (= x351 x352))) 
                                       (forall ((x353 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x353) 
                                                   (<= x353 n7)) 
                                               (exists ((x354 A)) 
                                                   (MS1 x353 x354 s28)))))) 
                               (forall ((x355 Int) (x356 A)) 
                                   (= 
                                       (MS1 x355 x356 x347) 
                                       (MS1 x355 x356 s28))))) 
                       (exists ((x357 Int)) 
                           (length x347 x357)))))
         :named hyp51))
(assert (! (and 
               (forall ((x358 PZA) (x359 PZA) (x360 PZA)) 
                   (=> 
                       (cnc x358 x359 x360) 
                       (and 
                           (exists ((s29 PZA)) 
                               (and 
                                   (exists ((n8 Int)) 
                                       (and 
                                           (<= 0 n8) 
                                           (forall ((x361 Int) (x362 A)) 
                                               (=> 
                                                   (MS1 x361 x362 s29) 
                                                   (and 
                                                       (<= 1 x361) 
                                                       (<= x361 n8)))) 
                                           (forall ((x363 Int) (x364 A) (x365 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x363 x364 s29) 
                                                       (MS1 x363 x365 s29)) 
                                                   (= x364 x365))) 
                                           (forall ((x366 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x366) 
                                                       (<= x366 n8)) 
                                                   (exists ((x367 A)) 
                                                       (MS1 x366 x367 s29)))))) 
                                   (forall ((x368 Int) (x369 A)) 
                                       (= 
                                           (MS1 x368 x369 x358) 
                                           (MS1 x368 x369 s29))))) 
                           (exists ((s30 PZA)) 
                               (and 
                                   (exists ((n9 Int)) 
                                       (and 
                                           (<= 0 n9) 
                                           (forall ((x370 Int) (x371 A)) 
                                               (=> 
                                                   (MS1 x370 x371 s30) 
                                                   (and 
                                                       (<= 1 x370) 
                                                       (<= x370 n9)))) 
                                           (forall ((x372 Int) (x373 A) (x374 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x372 x373 s30) 
                                                       (MS1 x372 x374 s30)) 
                                                   (= x373 x374))) 
                                           (forall ((x375 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x375) 
                                                       (<= x375 n9)) 
                                                   (exists ((x376 A)) 
                                                       (MS1 x375 x376 s30)))))) 
                                   (forall ((x377 Int) (x378 A)) 
                                       (= 
                                           (MS1 x377 x378 x359) 
                                           (MS1 x377 x378 s30))))) 
                           (exists ((s31 PZA)) 
                               (and 
                                   (exists ((n10 Int)) 
                                       (and 
                                           (<= 0 n10) 
                                           (forall ((x379 Int) (x380 A)) 
                                               (=> 
                                                   (MS1 x379 x380 s31) 
                                                   (and 
                                                       (<= 1 x379) 
                                                       (<= x379 n10)))) 
                                           (forall ((x381 Int) (x382 A) (x383 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x381 x382 s31) 
                                                       (MS1 x381 x383 s31)) 
                                                   (= x382 x383))) 
                                           (forall ((x384 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x384) 
                                                       (<= x384 n10)) 
                                                   (exists ((x385 A)) 
                                                       (MS1 x384 x385 s31)))))) 
                                   (forall ((x386 Int) (x387 A)) 
                                       (= 
                                           (MS1 x386 x387 x360) 
                                           (MS1 x386 x387 s31)))))))) 
               (forall ((x388 PZA) (x389 PZA) (x390 PZA) (x391 PZA)) 
                   (=> 
                       (and 
                           (cnc x388 x389 x390) 
                           (cnc x388 x389 x391)) 
                       (forall ((x392 Int) (x393 A)) 
                           (= 
                               (MS1 x392 x393 x390) 
                               (MS1 x392 x393 x391))))) 
               (forall ((x394 PZA) (x395 PZA)) 
                   (=> 
                       (and 
                           (exists ((s32 PZA)) 
                               (and 
                                   (exists ((n11 Int)) 
                                       (and 
                                           (<= 0 n11) 
                                           (forall ((x396 Int) (x397 A)) 
                                               (=> 
                                                   (MS1 x396 x397 s32) 
                                                   (and 
                                                       (<= 1 x396) 
                                                       (<= x396 n11)))) 
                                           (forall ((x398 Int) (x399 A) (x400 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x398 x399 s32) 
                                                       (MS1 x398 x400 s32)) 
                                                   (= x399 x400))) 
                                           (forall ((x401 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x401) 
                                                       (<= x401 n11)) 
                                                   (exists ((x402 A)) 
                                                       (MS1 x401 x402 s32)))))) 
                                   (forall ((x403 Int) (x404 A)) 
                                       (= 
                                           (MS1 x403 x404 x394) 
                                           (MS1 x403 x404 s32))))) 
                           (exists ((s33 PZA)) 
                               (and 
                                   (exists ((n12 Int)) 
                                       (and 
                                           (<= 0 n12) 
                                           (forall ((x405 Int) (x406 A)) 
                                               (=> 
                                                   (MS1 x405 x406 s33) 
                                                   (and 
                                                       (<= 1 x405) 
                                                       (<= x405 n12)))) 
                                           (forall ((x407 Int) (x408 A) (x409 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x407 x408 s33) 
                                                       (MS1 x407 x409 s33)) 
                                                   (= x408 x409))) 
                                           (forall ((x410 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x410) 
                                                       (<= x410 n12)) 
                                                   (exists ((x411 A)) 
                                                       (MS1 x410 x411 s33)))))) 
                                   (forall ((x412 Int) (x413 A)) 
                                       (= 
                                           (MS1 x412 x413 x395) 
                                           (MS1 x412 x413 s33)))))) 
                       (exists ((x414 PZA)) 
                           (cnc x394 x395 x414)))))
         :named hyp52))
(assert (! (and 
               (forall ((x415 PZA) (x416 PZA)) 
                   (=> 
                       (reverse x415 x416) 
                       (and 
                           (exists ((s34 PZA)) 
                               (and 
                                   (exists ((n13 Int)) 
                                       (and 
                                           (<= 0 n13) 
                                           (forall ((x417 Int) (x418 A)) 
                                               (=> 
                                                   (MS1 x417 x418 s34) 
                                                   (and 
                                                       (<= 1 x417) 
                                                       (<= x417 n13)))) 
                                           (forall ((x419 Int) (x420 A) (x421 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x419 x420 s34) 
                                                       (MS1 x419 x421 s34)) 
                                                   (= x420 x421))) 
                                           (forall ((x422 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x422) 
                                                       (<= x422 n13)) 
                                                   (exists ((x423 A)) 
                                                       (MS1 x422 x423 s34)))))) 
                                   (forall ((x424 Int) (x425 A)) 
                                       (= 
                                           (MS1 x424 x425 x415) 
                                           (MS1 x424 x425 s34))))) 
                           (exists ((s35 PZA)) 
                               (and 
                                   (exists ((n14 Int)) 
                                       (and 
                                           (<= 0 n14) 
                                           (forall ((x426 Int) (x427 A)) 
                                               (=> 
                                                   (MS1 x426 x427 s35) 
                                                   (and 
                                                       (<= 1 x426) 
                                                       (<= x426 n14)))) 
                                           (forall ((x428 Int) (x429 A) (x430 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x428 x429 s35) 
                                                       (MS1 x428 x430 s35)) 
                                                   (= x429 x430))) 
                                           (forall ((x431 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x431) 
                                                       (<= x431 n14)) 
                                                   (exists ((x432 A)) 
                                                       (MS1 x431 x432 s35)))))) 
                                   (forall ((x433 Int) (x434 A)) 
                                       (= 
                                           (MS1 x433 x434 x416) 
                                           (MS1 x433 x434 s35)))))))) 
               (forall ((x435 PZA) (x436 PZA) (x437 PZA)) 
                   (=> 
                       (and 
                           (reverse x435 x436) 
                           (reverse x435 x437)) 
                       (forall ((x438 Int) (x439 A)) 
                           (= 
                               (MS1 x438 x439 x436) 
                               (MS1 x438 x439 x437))))) 
               (forall ((x440 PZA)) 
                   (=> 
                       (exists ((s36 PZA)) 
                           (and 
                               (exists ((n15 Int)) 
                                   (and 
                                       (<= 0 n15) 
                                       (forall ((x441 Int) (x442 A)) 
                                           (=> 
                                               (MS1 x441 x442 s36) 
                                               (and 
                                                   (<= 1 x441) 
                                                   (<= x441 n15)))) 
                                       (forall ((x443 Int) (x444 A) (x445 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x443 x444 s36) 
                                                   (MS1 x443 x445 s36)) 
                                               (= x444 x445))) 
                                       (forall ((x446 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x446) 
                                                   (<= x446 n15)) 
                                               (exists ((x447 A)) 
                                                   (MS1 x446 x447 s36)))))) 
                               (forall ((x448 Int) (x449 A)) 
                                   (= 
                                       (MS1 x448 x449 x440) 
                                       (MS1 x448 x449 s36))))) 
                       (exists ((x450 PZA)) 
                           (reverse x440 x450)))))
         :named hyp53))
(assert (! (forall ((n16 Int) (s37 PZA)) 
               (=> 
                   (and 
                       (<= 0 n16) 
                       (forall ((x451 Int) (x452 A)) 
                           (=> 
                               (MS1 x451 x452 s37) 
                               (and 
                                   (<= 1 x451) 
                                   (<= x451 n16)))) 
                       (forall ((x453 Int) (x454 A) (x455 A)) 
                           (=> 
                               (and 
                                   (MS1 x453 x454 s37) 
                                   (MS1 x453 x455 s37)) 
                               (= x454 x455))) 
                       (forall ((x456 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x456) 
                                   (<= x456 n16)) 
                               (exists ((x457 A)) 
                                   (MS1 x456 x457 s37))))) 
                   (exists ((n17 Int)) 
                       (and 
                           (<= 0 n17) 
                           (forall ((x458 Int) (x459 A)) 
                               (=> 
                                   (MS1 x458 x459 s37) 
                                   (and 
                                       (<= 1 x458) 
                                       (<= x458 n17)))) 
                           (forall ((x460 Int) (x461 A) (x462 A)) 
                               (=> 
                                   (and 
                                       (MS1 x460 x461 s37) 
                                       (MS1 x460 x462 s37)) 
                                   (= x461 x462))) 
                           (forall ((x463 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x463) 
                                       (<= x463 n17)) 
                                   (exists ((x464 A)) 
                                       (MS1 x463 x464 s37))))))))
         :named hyp54))
(assert (! (forall ((s38 PZA)) 
               (=> 
                   (exists ((n18 Int)) 
                       (and 
                           (<= 0 n18) 
                           (forall ((x465 Int) (x466 A)) 
                               (=> 
                                   (MS1 x465 x466 s38) 
                                   (and 
                                       (<= 1 x465) 
                                       (<= x465 n18)))) 
                           (forall ((x467 Int) (x468 A) (x469 A)) 
                               (=> 
                                   (and 
                                       (MS1 x467 x468 s38) 
                                       (MS1 x467 x469 s38)) 
                                   (= x468 x469))) 
                           (forall ((x470 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x470) 
                                       (<= x470 n18)) 
                                   (exists ((x471 A)) 
                                       (MS1 x470 x471 s38)))))) 
                   (and 
                       (forall ((x472 Int) (x473 A)) 
                           (=> 
                               (MS1 x472 x473 s38) 
                               (and 
                                   (<= 1 x472) 
                                   (forall ((x474 Int)) 
                                       (=> 
                                           (length s38 x474) 
                                           (<= x472 x474)))))) 
                       (forall ((x475 Int) (x476 A) (x477 A)) 
                           (=> 
                               (and 
                                   (MS1 x475 x476 s38) 
                                   (MS1 x475 x477 s38)) 
                               (= x476 x477))) 
                       (forall ((x478 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x478) 
                                   (forall ((x479 Int)) 
                                       (=> 
                                           (length s38 x479) 
                                           (<= x478 x479)))) 
                               (exists ((x480 A)) 
                                   (MS1 x478 x480 s38)))))))
         :named hyp55))
(assert (! (forall ((x481 PZA) (x482 PZA) (x483 PZA)) 
               (= 
                   (cnc x481 x482 x483) 
                   (exists ((s110 PZA) (s210 PZA)) 
                       (and 
                           (exists ((n19 Int)) 
                               (and 
                                   (<= 0 n19) 
                                   (forall ((x484 Int) (x485 A)) 
                                       (=> 
                                           (MS1 x484 x485 s110) 
                                           (and 
                                               (<= 1 x484) 
                                               (<= x484 n19)))) 
                                   (forall ((x486 Int) (x487 A) (x488 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x486 x487 s110) 
                                               (MS1 x486 x488 s110)) 
                                           (= x487 x488))) 
                                   (forall ((x489 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x489) 
                                               (<= x489 n19)) 
                                           (exists ((x490 A)) 
                                               (MS1 x489 x490 s110)))))) 
                           (exists ((n20 Int)) 
                               (and 
                                   (<= 0 n20) 
                                   (forall ((x491 Int) (x492 A)) 
                                       (=> 
                                           (MS1 x491 x492 s210) 
                                           (and 
                                               (<= 1 x491) 
                                               (<= x491 n20)))) 
                                   (forall ((x493 Int) (x494 A) (x495 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x493 x494 s210) 
                                               (MS1 x493 x495 s210)) 
                                           (= x494 x495))) 
                                   (forall ((x496 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x496) 
                                               (<= x496 n20)) 
                                           (exists ((x497 A)) 
                                               (MS1 x496 x497 s210)))))) 
                           (forall ((x498 Int) (x499 A)) 
                               (= 
                                   (MS1 x498 x499 x481) 
                                   (MS1 x498 x499 s110))) 
                           (forall ((x500 Int) (x501 A)) 
                               (= 
                                   (MS1 x500 x501 x482) 
                                   (MS1 x500 x501 s210))) 
                           (forall ((x502 Int) (x503 A)) 
                               (= 
                                   (MS1 x502 x503 x483) 
                                   (or 
                                       (exists ((i13 Int)) 
                                           (and 
                                               (<= 1 i13) 
                                               (forall ((x504 Int)) 
                                                   (=> 
                                                       (length s110 x504) 
                                                       (<= i13 x504))) 
                                               (= x502 i13) 
                                               (MS1 i13 x503 s110))) 
                                       (exists ((i14 Int)) 
                                           (and 
                                               (forall ((x505 Int)) 
                                                   (=> 
                                                       (length s110 x505) 
                                                       (<= (+ x505 1) i14))) 
                                               (forall ((x506 Int) (x507 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s110 x507) 
                                                           (length s210 x506)) 
                                                       (<= i14 (+ x507 x506)))) 
                                               (= x502 i14) 
                                               (exists ((x508 Int)) 
                                                   (and 
                                                       (forall ((x509 Int)) 
                                                           (=> 
                                                               (length s110 x509) 
                                                               (= x508 (- i14 x509)))) 
                                                       (MS1 x508 x503 s210))))))))))))
         :named hyp56))
(assert (! (forall ((s111 PZA) (s211 PZA)) 
               (=> 
                   (and 
                       (exists ((n21 Int)) 
                           (and 
                               (<= 0 n21) 
                               (forall ((x510 Int) (x511 A)) 
                                   (=> 
                                       (MS1 x510 x511 s111) 
                                       (and 
                                           (<= 1 x510) 
                                           (<= x510 n21)))) 
                               (forall ((x512 Int) (x513 A) (x514 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x512 x513 s111) 
                                           (MS1 x512 x514 s111)) 
                                       (= x513 x514))) 
                               (forall ((x515 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x515) 
                                           (<= x515 n21)) 
                                       (exists ((x516 A)) 
                                           (MS1 x515 x516 s111)))))) 
                       (exists ((n22 Int)) 
                           (and 
                               (<= 0 n22) 
                               (forall ((x517 Int) (x518 A)) 
                                   (=> 
                                       (MS1 x517 x518 s211) 
                                       (and 
                                           (<= 1 x517) 
                                           (<= x517 n22)))) 
                               (forall ((x519 Int) (x520 A) (x521 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x519 x520 s211) 
                                           (MS1 x519 x521 s211)) 
                                       (= x520 x521))) 
                               (forall ((x522 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x522) 
                                           (<= x522 n22)) 
                                       (exists ((x523 A)) 
                                           (MS1 x522 x523 s211))))))) 
                   (exists ((x524 PZA) (x525 Int)) 
                       (and 
                           (cnc s111 s211 x524) 
                           (forall ((x526 Int) (x527 Int)) 
                               (=> 
                                   (and 
                                       (length s111 x527) 
                                       (length s211 x526)) 
                                   (= x525 (+ x527 x526)))) 
                           (length x524 x525)))))
         :named hyp57))
(assert (! (forall ((s112 PZA) (s212 PZA)) 
               (=> 
                   (and 
                       (exists ((n23 Int)) 
                           (and 
                               (<= 0 n23) 
                               (forall ((x528 Int) (x529 A)) 
                                   (=> 
                                       (MS1 x528 x529 s112) 
                                       (and 
                                           (<= 1 x528) 
                                           (<= x528 n23)))) 
                               (forall ((x530 Int) (x531 A) (x532 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x530 x531 s112) 
                                           (MS1 x530 x532 s112)) 
                                       (= x531 x532))) 
                               (forall ((x533 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x533) 
                                           (<= x533 n23)) 
                                       (exists ((x534 A)) 
                                           (MS1 x533 x534 s112)))))) 
                       (exists ((n24 Int)) 
                           (and 
                               (<= 0 n24) 
                               (forall ((x535 Int) (x536 A)) 
                                   (=> 
                                       (MS1 x535 x536 s212) 
                                       (and 
                                           (<= 1 x535) 
                                           (<= x535 n24)))) 
                               (forall ((x537 Int) (x538 A) (x539 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x537 x538 s212) 
                                           (MS1 x537 x539 s212)) 
                                       (= x538 x539))) 
                               (forall ((x540 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x540) 
                                           (<= x540 n24)) 
                                       (exists ((x541 A)) 
                                           (MS1 x540 x541 s212))))))) 
                   (forall ((x542 Int)) 
                       (= 
                           (exists ((x543 A) (x544 PZA)) 
                               (and 
                                   (cnc s112 s212 x544) 
                                   (MS1 x542 x543 x544))) 
                           (and 
                               (<= 1 x542) 
                               (forall ((x545 Int) (x546 Int)) 
                                   (=> 
                                       (and 
                                           (length s112 x546) 
                                           (length s212 x545)) 
                                       (<= x542 (+ x546 x545)))))))))
         :named hyp58))
(assert (! (forall ((s113 PZA) (s213 PZA)) 
               (=> 
                   (and 
                       (exists ((n25 Int)) 
                           (and 
                               (<= 0 n25) 
                               (forall ((x547 Int) (x548 A)) 
                                   (=> 
                                       (MS1 x547 x548 s113) 
                                       (and 
                                           (<= 1 x547) 
                                           (<= x547 n25)))) 
                               (forall ((x549 Int) (x550 A) (x551 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x549 x550 s113) 
                                           (MS1 x549 x551 s113)) 
                                       (= x550 x551))) 
                               (forall ((x552 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x552) 
                                           (<= x552 n25)) 
                                       (exists ((x553 A)) 
                                           (MS1 x552 x553 s113)))))) 
                       (exists ((n26 Int)) 
                           (and 
                               (<= 0 n26) 
                               (forall ((x554 Int) (x555 A)) 
                                   (=> 
                                       (MS1 x554 x555 s213) 
                                       (and 
                                           (<= 1 x554) 
                                           (<= x554 n26)))) 
                               (forall ((x556 Int) (x557 A) (x558 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x556 x557 s213) 
                                           (MS1 x556 x558 s213)) 
                                       (= x557 x558))) 
                               (forall ((x559 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x559) 
                                           (<= x559 n26)) 
                                       (exists ((x560 A)) 
                                           (MS1 x559 x560 s213))))))) 
                   (forall ((x561 A)) 
                       (= 
                           (exists ((x562 Int) (x563 PZA)) 
                               (and 
                                   (cnc s113 s213 x563) 
                                   (MS1 x562 x561 x563))) 
                           (or 
                               (exists ((x564 Int)) 
                                   (MS1 x564 x561 s113)) 
                               (exists ((x565 Int)) 
                                   (MS1 x565 x561 s213)))))))
         :named hyp59))
(assert (! (forall ((s114 PZA) (s214 PZA) (i15 Int)) 
               (=> 
                   (and 
                       (exists ((n27 Int)) 
                           (and 
                               (<= 0 n27) 
                               (forall ((x566 Int) (x567 A)) 
                                   (=> 
                                       (MS1 x566 x567 s114) 
                                       (and 
                                           (<= 1 x566) 
                                           (<= x566 n27)))) 
                               (forall ((x568 Int) (x569 A) (x570 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x568 x569 s114) 
                                           (MS1 x568 x570 s114)) 
                                       (= x569 x570))) 
                               (forall ((x571 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x571) 
                                           (<= x571 n27)) 
                                       (exists ((x572 A)) 
                                           (MS1 x571 x572 s114)))))) 
                       (exists ((n28 Int)) 
                           (and 
                               (<= 0 n28) 
                               (forall ((x573 Int) (x574 A)) 
                                   (=> 
                                       (MS1 x573 x574 s214) 
                                       (and 
                                           (<= 1 x573) 
                                           (<= x573 n28)))) 
                               (forall ((x575 Int) (x576 A) (x577 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x575 x576 s214) 
                                           (MS1 x575 x577 s214)) 
                                       (= x576 x577))) 
                               (forall ((x578 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x578) 
                                           (<= x578 n28)) 
                                       (exists ((x579 A)) 
                                           (MS1 x578 x579 s214)))))) 
                       (<= 1 i15) 
                       (forall ((x580 Int)) 
                           (=> 
                               (length s114 x580) 
                               (<= i15 x580)))) 
                   (exists ((x581 PZA)) 
                       (and 
                           (cnc s114 s214 x581) 
                           (exists ((x582 A)) 
                               (and 
                                   (MS1 i15 x582 s114) 
                                   (MS1 i15 x582 x581)))))))
         :named hyp60))
(assert (! (forall ((s115 PZA) (s215 PZA) (i16 Int)) 
               (=> 
                   (and 
                       (exists ((n29 Int)) 
                           (and 
                               (<= 0 n29) 
                               (forall ((x583 Int) (x584 A)) 
                                   (=> 
                                       (MS1 x583 x584 s115) 
                                       (and 
                                           (<= 1 x583) 
                                           (<= x583 n29)))) 
                               (forall ((x585 Int) (x586 A) (x587 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x585 x586 s115) 
                                           (MS1 x585 x587 s115)) 
                                       (= x586 x587))) 
                               (forall ((x588 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x588) 
                                           (<= x588 n29)) 
                                       (exists ((x589 A)) 
                                           (MS1 x588 x589 s115)))))) 
                       (exists ((n30 Int)) 
                           (and 
                               (<= 0 n30) 
                               (forall ((x590 Int) (x591 A)) 
                                   (=> 
                                       (MS1 x590 x591 s215) 
                                       (and 
                                           (<= 1 x590) 
                                           (<= x590 n30)))) 
                               (forall ((x592 Int) (x593 A) (x594 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x592 x593 s215) 
                                           (MS1 x592 x594 s215)) 
                                       (= x593 x594))) 
                               (forall ((x595 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x595) 
                                           (<= x595 n30)) 
                                       (exists ((x596 A)) 
                                           (MS1 x595 x596 s215)))))) 
                       (forall ((x597 Int)) 
                           (=> 
                               (length s115 x597) 
                               (<= (+ x597 1) i16))) 
                       (forall ((x598 Int) (x599 Int)) 
                           (=> 
                               (and 
                                   (length s115 x599) 
                                   (length s215 x598)) 
                               (<= i16 (+ x599 x598))))) 
                   (exists ((x600 PZA)) 
                       (and 
                           (cnc s115 s215 x600) 
                           (exists ((x601 A)) 
                               (and 
                                   (exists ((x602 Int)) 
                                       (and 
                                           (forall ((x603 Int)) 
                                               (=> 
                                                   (length s115 x603) 
                                                   (= x602 (- i16 x603)))) 
                                           (MS1 x602 x601 s215))) 
                                   (MS1 i16 x601 x600)))))))
         :named hyp61))
(assert (! (forall ((x604 PZA) (x605 PZA)) 
               (= 
                   (reverse x604 x605) 
                   (exists ((s39 PZA)) 
                       (and 
                           (exists ((n31 Int)) 
                               (and 
                                   (<= 0 n31) 
                                   (forall ((x606 Int) (x607 A)) 
                                       (=> 
                                           (MS1 x606 x607 s39) 
                                           (and 
                                               (<= 1 x606) 
                                               (<= x606 n31)))) 
                                   (forall ((x608 Int) (x609 A) (x610 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x608 x609 s39) 
                                               (MS1 x608 x610 s39)) 
                                           (= x609 x610))) 
                                   (forall ((x611 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x611) 
                                               (<= x611 n31)) 
                                           (exists ((x612 A)) 
                                               (MS1 x611 x612 s39)))))) 
                           (forall ((x613 Int) (x614 A)) 
                               (= 
                                   (MS1 x613 x614 x604) 
                                   (MS1 x613 x614 s39))) 
                           (forall ((x615 Int) (x616 A)) 
                               (= 
                                   (MS1 x615 x616 x605) 
                                   (exists ((i17 Int)) 
                                       (and 
                                           (<= 1 i17) 
                                           (forall ((x617 Int)) 
                                               (=> 
                                                   (length s39 x617) 
                                                   (<= i17 x617))) 
                                           (= x615 i17) 
                                           (exists ((x618 Int)) 
                                               (and 
                                                   (forall ((x619 Int)) 
                                                       (=> 
                                                           (length s39 x619) 
                                                           (= x618 (+ (- x619 i17) 1)))) 
                                                   (MS1 x618 x616 s39)))))))))))
         :named hyp62))
(assert (! (forall ((s40 PZA)) 
               (=> 
                   (exists ((n32 Int)) 
                       (and 
                           (<= 0 n32) 
                           (forall ((x620 Int) (x621 A)) 
                               (=> 
                                   (MS1 x620 x621 s40) 
                                   (and 
                                       (<= 1 x620) 
                                       (<= x620 n32)))) 
                           (forall ((x622 Int) (x623 A) (x624 A)) 
                               (=> 
                                   (and 
                                       (MS1 x622 x623 s40) 
                                       (MS1 x622 x624 s40)) 
                                   (= x623 x624))) 
                           (forall ((x625 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x625) 
                                       (<= x625 n32)) 
                                   (exists ((x626 A)) 
                                       (MS1 x625 x626 s40)))))) 
                   (exists ((x627 PZA) (x628 Int)) 
                       (and 
                           (reverse s40 x627) 
                           (length s40 x628) 
                           (length x627 x628)))))
         :named hyp63))
(assert (! (forall ((s41 PZA)) 
               (=> 
                   (exists ((n33 Int)) 
                       (and 
                           (<= 0 n33) 
                           (forall ((x629 Int) (x630 A)) 
                               (=> 
                                   (MS1 x629 x630 s41) 
                                   (and 
                                       (<= 1 x629) 
                                       (<= x629 n33)))) 
                           (forall ((x631 Int) (x632 A) (x633 A)) 
                               (=> 
                                   (and 
                                       (MS1 x631 x632 s41) 
                                       (MS1 x631 x633 s41)) 
                                   (= x632 x633))) 
                           (forall ((x634 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x634) 
                                       (<= x634 n33)) 
                                   (exists ((x635 A)) 
                                       (MS1 x634 x635 s41)))))) 
                   (forall ((x636 A)) 
                       (= 
                           (exists ((x637 Int) (x638 PZA)) 
                               (and 
                                   (reverse s41 x638) 
                                   (MS1 x637 x636 x638))) 
                           (exists ((x639 Int)) 
                               (MS1 x639 x636 s41))))))
         :named hyp64))
(assert (! (forall ((s42 PZA)) 
               (=> 
                   (exists ((n34 Int)) 
                       (and 
                           (<= 0 n34) 
                           (forall ((x640 Int) (x641 A)) 
                               (=> 
                                   (MS1 x640 x641 s42) 
                                   (and 
                                       (<= 1 x640) 
                                       (<= x640 n34)))) 
                           (forall ((x642 Int) (x643 A) (x644 A)) 
                               (=> 
                                   (and 
                                       (MS1 x642 x643 s42) 
                                       (MS1 x642 x644 s42)) 
                                   (= x643 x644))) 
                           (forall ((x645 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x645) 
                                       (<= x645 n34)) 
                                   (exists ((x646 A)) 
                                       (MS1 x645 x646 s42)))))) 
                   (exists ((x647 PZA)) 
                       (and 
                           (reverse s42 x647) 
                           (reverse x647 s42)))))
         :named hyp65))
(assert (! (forall ((s116 PZA) (s216 PZA) (b0 PA)) 
               (=> 
                   (and 
                       (exists ((n35 Int)) 
                           (and 
                               (<= 0 n35) 
                               (forall ((x648 Int) (x649 A)) 
                                   (=> 
                                       (MS1 x648 x649 s116) 
                                       (and 
                                           (<= 1 x648) 
                                           (<= x648 n35)))) 
                               (forall ((x650 Int) (x651 A) (x652 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x650 x651 s116) 
                                           (MS1 x650 x652 s116)) 
                                       (= x651 x652))) 
                               (forall ((x653 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x653) 
                                           (<= x653 n35)) 
                                       (exists ((x654 A)) 
                                           (MS1 x653 x654 s116)))))) 
                       (exists ((n36 Int)) 
                           (and 
                               (<= 0 n36) 
                               (forall ((x655 Int) (x656 A)) 
                                   (=> 
                                       (MS1 x655 x656 s216) 
                                       (and 
                                           (<= 1 x655) 
                                           (<= x655 n36)))) 
                               (forall ((x657 Int) (x658 A) (x659 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x657 x658 s216) 
                                           (MS1 x657 x659 s216)) 
                                       (= x658 x659))) 
                               (forall ((x660 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x660) 
                                           (<= x660 n36)) 
                                       (exists ((x661 A)) 
                                           (MS1 x660 x661 s216)))))) 
                       (forall ((x662 A)) 
                           (=> 
                               (exists ((x663 Int)) 
                                   (MS1 x663 x662 s116)) 
                               (MS0 x662 b0))) 
                       (forall ((x664 A)) 
                           (=> 
                               (exists ((x665 Int)) 
                                   (MS1 x665 x664 s216)) 
                               (MS0 x664 b0)))) 
                   (and 
                       (forall ((x666 Int) (x667 A)) 
                           (=> 
                               (exists ((x668 PZA)) 
                                   (and 
                                       (cnc s116 s216 x668) 
                                       (MS1 x666 x667 x668))) 
                               (and 
                                   (<= 1 x666) 
                                   (forall ((x669 Int) (x670 Int)) 
                                       (=> 
                                           (and 
                                               (length s116 x670) 
                                               (length s216 x669)) 
                                           (<= x666 (+ x670 x669)))) 
                                   (MS0 x667 b0)))) 
                       (forall ((x671 Int) (x672 A) (x673 A)) 
                           (=> 
                               (and 
                                   (exists ((x674 PZA)) 
                                       (and 
                                           (cnc s116 s216 x674) 
                                           (MS1 x671 x672 x674))) 
                                   (exists ((x675 PZA)) 
                                       (and 
                                           (cnc s116 s216 x675) 
                                           (MS1 x671 x673 x675)))) 
                               (= x672 x673))) 
                       (forall ((x676 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x676) 
                                   (forall ((x677 Int) (x678 Int)) 
                                       (=> 
                                           (and 
                                               (length s116 x678) 
                                               (length s216 x677)) 
                                           (<= x676 (+ x678 x677))))) 
                               (exists ((x679 A) (x680 PZA)) 
                                   (and 
                                       (cnc s116 s216 x680) 
                                       (MS1 x676 x679 x680))))))))
         :named hyp66))
(assert (! (forall ((x681 A) (x682 A) (x683 PZA)) 
               (= 
                   (path x681 x682 x683) 
                   (exists ((x684 A) (y9 A) (p5 PZA)) 
                       (and 
                           (exists ((n37 Int)) 
                               (and 
                                   (<= 0 n37) 
                                   (forall ((x685 Int) (x686 A)) 
                                       (=> 
                                           (MS1 x685 x686 p5) 
                                           (and 
                                               (<= 1 x685) 
                                               (<= x685 n37)))) 
                                   (forall ((x687 Int) (x688 A) (x689 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x687 x688 p5) 
                                               (MS1 x687 x689 p5)) 
                                           (= x688 x689))) 
                                   (forall ((x690 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x690) 
                                               (<= x690 n37)) 
                                           (exists ((x691 A)) 
                                               (MS1 x690 x691 p5)))))) 
                           (forall ((x692 A)) 
                               (=> 
                                   (exists ((x693 Int)) 
                                       (MS1 x693 x692 p5)) 
                                   (MS0 x692 a))) 
                           (forall ((x694 Int)) 
                               (=> 
                                   (length p5 x694) 
                                   (< 1 x694))) 
                           (exists ((x695 Int)) 
                               (and 
                                   (= x695 1) 
                                   (MS1 x695 x684 p5))) 
                           (exists ((x696 Int)) 
                               (and 
                                   (length p5 x696) 
                                   (MS1 x696 y9 p5))) 
                           (forall ((i18 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 i18) 
                                       (forall ((x697 Int)) 
                                           (=> 
                                               (length p5 x697) 
                                               (<= i18 (- x697 1))))) 
                                   (exists ((x698 A) (x699 A)) 
                                       (and 
                                           (MS1 i18 x698 p5) 
                                           (exists ((x700 Int)) 
                                               (and 
                                                   (= x700 (+ i18 1)) 
                                                   (MS1 x700 x699 p5))) 
                                           (MS x698 x699 r))))) 
                           (= x681 x684) 
                           (= x682 y9) 
                           (forall ((x701 Int) (x702 A)) 
                               (= 
                                   (MS1 x701 x702 x683) 
                                   (MS1 x701 x702 p5)))))))
         :named hyp67))
(assert (! (and 
               (forall ((x703 PZA) (x704 PZA) (x705 PZA)) 
                   (=> 
                       (exists ((s117 PZA) (s217 PZA)) 
                           (and 
                               (exists ((n38 Int)) 
                                   (and 
                                       (<= 0 n38) 
                                       (forall ((x706 Int) (x707 A)) 
                                           (=> 
                                               (MS1 x706 x707 s117) 
                                               (and 
                                                   (<= 1 x706) 
                                                   (<= x706 n38)))) 
                                       (forall ((x708 Int) (x709 A) (x710 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x708 x709 s117) 
                                                   (MS1 x708 x710 s117)) 
                                               (= x709 x710))) 
                                       (forall ((x711 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x711) 
                                                   (<= x711 n38)) 
                                               (exists ((x712 A)) 
                                                   (MS1 x711 x712 s117)))))) 
                               (exists ((n39 Int)) 
                                   (and 
                                       (<= 0 n39) 
                                       (forall ((x713 Int) (x714 A)) 
                                           (=> 
                                               (MS1 x713 x714 s217) 
                                               (and 
                                                   (<= 1 x713) 
                                                   (<= x713 n39)))) 
                                       (forall ((x715 Int) (x716 A) (x717 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x715 x716 s217) 
                                                   (MS1 x715 x717 s217)) 
                                               (= x716 x717))) 
                                       (forall ((x718 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x718) 
                                                   (<= x718 n39)) 
                                               (exists ((x719 A)) 
                                                   (MS1 x718 x719 s217)))))) 
                               (forall ((x720 Int) (x721 A)) 
                                   (= 
                                       (MS1 x720 x721 x703) 
                                       (MS1 x720 x721 s117))) 
                               (forall ((x722 Int) (x723 A)) 
                                   (= 
                                       (MS1 x722 x723 x704) 
                                       (MS1 x722 x723 s217))) 
                               (forall ((x724 Int) (x725 A)) 
                                   (= 
                                       (MS1 x724 x725 x705) 
                                       (or 
                                           (exists ((i19 Int)) 
                                               (and 
                                                   (<= 1 i19) 
                                                   (forall ((x726 Int)) 
                                                       (=> 
                                                           (length s117 x726) 
                                                           (<= i19 x726))) 
                                                   (= x724 i19) 
                                                   (MS1 i19 x725 s117))) 
                                           (exists ((i20 Int)) 
                                               (and 
                                                   (forall ((x727 Int)) 
                                                       (=> 
                                                           (length s117 x727) 
                                                           (<= (+ x727 1) i20))) 
                                                   (forall ((x728 Int) (x729 Int)) 
                                                       (=> 
                                                           (and 
                                                               (length s117 x729) 
                                                               (length s217 x728)) 
                                                           (<= i20 (+ x729 x728)))) 
                                                   (= x724 i20) 
                                                   (exists ((x730 Int)) 
                                                       (and 
                                                           (forall ((x731 Int)) 
                                                               (=> 
                                                                   (length s117 x731) 
                                                                   (= x730 (- i20 x731)))) 
                                                           (MS1 x730 x725 s217)))))))))) 
                       (and 
                           (exists ((s43 PZA)) 
                               (and 
                                   (exists ((n40 Int)) 
                                       (and 
                                           (<= 0 n40) 
                                           (forall ((x732 Int) (x733 A)) 
                                               (=> 
                                                   (MS1 x732 x733 s43) 
                                                   (and 
                                                       (<= 1 x732) 
                                                       (<= x732 n40)))) 
                                           (forall ((x734 Int) (x735 A) (x736 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x734 x735 s43) 
                                                       (MS1 x734 x736 s43)) 
                                                   (= x735 x736))) 
                                           (forall ((x737 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x737) 
                                                       (<= x737 n40)) 
                                                   (exists ((x738 A)) 
                                                       (MS1 x737 x738 s43)))))) 
                                   (forall ((x739 Int) (x740 A)) 
                                       (= 
                                           (MS1 x739 x740 x703) 
                                           (MS1 x739 x740 s43))))) 
                           (exists ((s44 PZA)) 
                               (and 
                                   (exists ((n41 Int)) 
                                       (and 
                                           (<= 0 n41) 
                                           (forall ((x741 Int) (x742 A)) 
                                               (=> 
                                                   (MS1 x741 x742 s44) 
                                                   (and 
                                                       (<= 1 x741) 
                                                       (<= x741 n41)))) 
                                           (forall ((x743 Int) (x744 A) (x745 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x743 x744 s44) 
                                                       (MS1 x743 x745 s44)) 
                                                   (= x744 x745))) 
                                           (forall ((x746 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x746) 
                                                       (<= x746 n41)) 
                                                   (exists ((x747 A)) 
                                                       (MS1 x746 x747 s44)))))) 
                                   (forall ((x748 Int) (x749 A)) 
                                       (= 
                                           (MS1 x748 x749 x704) 
                                           (MS1 x748 x749 s44))))) 
                           (exists ((s45 PZA)) 
                               (and 
                                   (exists ((n42 Int)) 
                                       (and 
                                           (<= 0 n42) 
                                           (forall ((x750 Int) (x751 A)) 
                                               (=> 
                                                   (MS1 x750 x751 s45) 
                                                   (and 
                                                       (<= 1 x750) 
                                                       (<= x750 n42)))) 
                                           (forall ((x752 Int) (x753 A) (x754 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x752 x753 s45) 
                                                       (MS1 x752 x754 s45)) 
                                                   (= x753 x754))) 
                                           (forall ((x755 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x755) 
                                                       (<= x755 n42)) 
                                                   (exists ((x756 A)) 
                                                       (MS1 x755 x756 s45)))))) 
                                   (forall ((x757 Int) (x758 A)) 
                                       (= 
                                           (MS1 x757 x758 x705) 
                                           (MS1 x757 x758 s45)))))))) 
               (forall ((x759 PZA) (x760 PZA) (x761 PZA) (x762 PZA)) 
                   (=> 
                       (and 
                           (exists ((s118 PZA) (s218 PZA)) 
                               (and 
                                   (exists ((n43 Int)) 
                                       (and 
                                           (<= 0 n43) 
                                           (forall ((x763 Int) (x764 A)) 
                                               (=> 
                                                   (MS1 x763 x764 s118) 
                                                   (and 
                                                       (<= 1 x763) 
                                                       (<= x763 n43)))) 
                                           (forall ((x765 Int) (x766 A) (x767 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x765 x766 s118) 
                                                       (MS1 x765 x767 s118)) 
                                                   (= x766 x767))) 
                                           (forall ((x768 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x768) 
                                                       (<= x768 n43)) 
                                                   (exists ((x769 A)) 
                                                       (MS1 x768 x769 s118)))))) 
                                   (exists ((n44 Int)) 
                                       (and 
                                           (<= 0 n44) 
                                           (forall ((x770 Int) (x771 A)) 
                                               (=> 
                                                   (MS1 x770 x771 s218) 
                                                   (and 
                                                       (<= 1 x770) 
                                                       (<= x770 n44)))) 
                                           (forall ((x772 Int) (x773 A) (x774 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x772 x773 s218) 
                                                       (MS1 x772 x774 s218)) 
                                                   (= x773 x774))) 
                                           (forall ((x775 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x775) 
                                                       (<= x775 n44)) 
                                                   (exists ((x776 A)) 
                                                       (MS1 x775 x776 s218)))))) 
                                   (forall ((x777 Int) (x778 A)) 
                                       (= 
                                           (MS1 x777 x778 x759) 
                                           (MS1 x777 x778 s118))) 
                                   (forall ((x779 Int) (x780 A)) 
                                       (= 
                                           (MS1 x779 x780 x760) 
                                           (MS1 x779 x780 s218))) 
                                   (forall ((x781 Int) (x782 A)) 
                                       (= 
                                           (MS1 x781 x782 x761) 
                                           (or 
                                               (exists ((i21 Int)) 
                                                   (and 
                                                       (<= 1 i21) 
                                                       (forall ((x783 Int)) 
                                                           (=> 
                                                               (length s118 x783) 
                                                               (<= i21 x783))) 
                                                       (= x781 i21) 
                                                       (MS1 i21 x782 s118))) 
                                               (exists ((i22 Int)) 
                                                   (and 
                                                       (forall ((x784 Int)) 
                                                           (=> 
                                                               (length s118 x784) 
                                                               (<= (+ x784 1) i22))) 
                                                       (forall ((x785 Int) (x786 Int)) 
                                                           (=> 
                                                               (and 
                                                                   (length s118 x786) 
                                                                   (length s218 x785)) 
                                                               (<= i22 (+ x786 x785)))) 
                                                       (= x781 i22) 
                                                       (exists ((x787 Int)) 
                                                           (and 
                                                               (forall ((x788 Int)) 
                                                                   (=> 
                                                                       (length s118 x788) 
                                                                       (= x787 (- i22 x788)))) 
                                                               (MS1 x787 x782 s218)))))))))) 
                           (exists ((s119 PZA) (s219 PZA)) 
                               (and 
                                   (exists ((n45 Int)) 
                                       (and 
                                           (<= 0 n45) 
                                           (forall ((x789 Int) (x790 A)) 
                                               (=> 
                                                   (MS1 x789 x790 s119) 
                                                   (and 
                                                       (<= 1 x789) 
                                                       (<= x789 n45)))) 
                                           (forall ((x791 Int) (x792 A) (x793 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x791 x792 s119) 
                                                       (MS1 x791 x793 s119)) 
                                                   (= x792 x793))) 
                                           (forall ((x794 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x794) 
                                                       (<= x794 n45)) 
                                                   (exists ((x795 A)) 
                                                       (MS1 x794 x795 s119)))))) 
                                   (exists ((n46 Int)) 
                                       (and 
                                           (<= 0 n46) 
                                           (forall ((x796 Int) (x797 A)) 
                                               (=> 
                                                   (MS1 x796 x797 s219) 
                                                   (and 
                                                       (<= 1 x796) 
                                                       (<= x796 n46)))) 
                                           (forall ((x798 Int) (x799 A) (x800 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x798 x799 s219) 
                                                       (MS1 x798 x800 s219)) 
                                                   (= x799 x800))) 
                                           (forall ((x801 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x801) 
                                                       (<= x801 n46)) 
                                                   (exists ((x802 A)) 
                                                       (MS1 x801 x802 s219)))))) 
                                   (forall ((x803 Int) (x804 A)) 
                                       (= 
                                           (MS1 x803 x804 x759) 
                                           (MS1 x803 x804 s119))) 
                                   (forall ((x805 Int) (x806 A)) 
                                       (= 
                                           (MS1 x805 x806 x760) 
                                           (MS1 x805 x806 s219))) 
                                   (forall ((x807 Int) (x808 A)) 
                                       (= 
                                           (MS1 x807 x808 x762) 
                                           (or 
                                               (exists ((i23 Int)) 
                                                   (and 
                                                       (<= 1 i23) 
                                                       (forall ((x809 Int)) 
                                                           (=> 
                                                               (length s119 x809) 
                                                               (<= i23 x809))) 
                                                       (= x807 i23) 
                                                       (MS1 i23 x808 s119))) 
                                               (exists ((i24 Int)) 
                                                   (and 
                                                       (forall ((x810 Int)) 
                                                           (=> 
                                                               (length s119 x810) 
                                                               (<= (+ x810 1) i24))) 
                                                       (forall ((x811 Int) (x812 Int)) 
                                                           (=> 
                                                               (and 
                                                                   (length s119 x812) 
                                                                   (length s219 x811)) 
                                                               (<= i24 (+ x812 x811)))) 
                                                       (= x807 i24) 
                                                       (exists ((x813 Int)) 
                                                           (and 
                                                               (forall ((x814 Int)) 
                                                                   (=> 
                                                                       (length s119 x814) 
                                                                       (= x813 (- i24 x814)))) 
                                                               (MS1 x813 x808 s219))))))))))) 
                       (forall ((x815 Int) (x816 A)) 
                           (= 
                               (MS1 x815 x816 x761) 
                               (MS1 x815 x816 x762))))) 
               (forall ((x817 PZA) (x818 PZA)) 
                   (=> 
                       (and 
                           (exists ((s46 PZA)) 
                               (and 
                                   (exists ((n47 Int)) 
                                       (and 
                                           (<= 0 n47) 
                                           (forall ((x819 Int) (x820 A)) 
                                               (=> 
                                                   (MS1 x819 x820 s46) 
                                                   (and 
                                                       (<= 1 x819) 
                                                       (<= x819 n47)))) 
                                           (forall ((x821 Int) (x822 A) (x823 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x821 x822 s46) 
                                                       (MS1 x821 x823 s46)) 
                                                   (= x822 x823))) 
                                           (forall ((x824 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x824) 
                                                       (<= x824 n47)) 
                                                   (exists ((x825 A)) 
                                                       (MS1 x824 x825 s46)))))) 
                                   (forall ((x826 Int) (x827 A)) 
                                       (= 
                                           (MS1 x826 x827 x817) 
                                           (MS1 x826 x827 s46))))) 
                           (exists ((s47 PZA)) 
                               (and 
                                   (exists ((n48 Int)) 
                                       (and 
                                           (<= 0 n48) 
                                           (forall ((x828 Int) (x829 A)) 
                                               (=> 
                                                   (MS1 x828 x829 s47) 
                                                   (and 
                                                       (<= 1 x828) 
                                                       (<= x828 n48)))) 
                                           (forall ((x830 Int) (x831 A) (x832 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x830 x831 s47) 
                                                       (MS1 x830 x832 s47)) 
                                                   (= x831 x832))) 
                                           (forall ((x833 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x833) 
                                                       (<= x833 n48)) 
                                                   (exists ((x834 A)) 
                                                       (MS1 x833 x834 s47)))))) 
                                   (forall ((x835 Int) (x836 A)) 
                                       (= 
                                           (MS1 x835 x836 x818) 
                                           (MS1 x835 x836 s47)))))) 
                       (exists ((x837 PZA) (s120 PZA) (s220 PZA)) 
                           (and 
                               (exists ((n49 Int)) 
                                   (and 
                                       (<= 0 n49) 
                                       (forall ((x838 Int) (x839 A)) 
                                           (=> 
                                               (MS1 x838 x839 s120) 
                                               (and 
                                                   (<= 1 x838) 
                                                   (<= x838 n49)))) 
                                       (forall ((x840 Int) (x841 A) (x842 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x840 x841 s120) 
                                                   (MS1 x840 x842 s120)) 
                                               (= x841 x842))) 
                                       (forall ((x843 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x843) 
                                                   (<= x843 n49)) 
                                               (exists ((x844 A)) 
                                                   (MS1 x843 x844 s120)))))) 
                               (exists ((n50 Int)) 
                                   (and 
                                       (<= 0 n50) 
                                       (forall ((x845 Int) (x846 A)) 
                                           (=> 
                                               (MS1 x845 x846 s220) 
                                               (and 
                                                   (<= 1 x845) 
                                                   (<= x845 n50)))) 
                                       (forall ((x847 Int) (x848 A) (x849 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x847 x848 s220) 
                                                   (MS1 x847 x849 s220)) 
                                               (= x848 x849))) 
                                       (forall ((x850 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x850) 
                                                   (<= x850 n50)) 
                                               (exists ((x851 A)) 
                                                   (MS1 x850 x851 s220)))))) 
                               (forall ((x852 Int) (x853 A)) 
                                   (= 
                                       (MS1 x852 x853 x817) 
                                       (MS1 x852 x853 s120))) 
                               (forall ((x854 Int) (x855 A)) 
                                   (= 
                                       (MS1 x854 x855 x818) 
                                       (MS1 x854 x855 s220))) 
                               (forall ((x856 Int) (x857 A)) 
                                   (= 
                                       (MS1 x856 x857 x837) 
                                       (or 
                                           (exists ((i25 Int)) 
                                               (and 
                                                   (<= 1 i25) 
                                                   (forall ((x858 Int)) 
                                                       (=> 
                                                           (length s120 x858) 
                                                           (<= i25 x858))) 
                                                   (= x856 i25) 
                                                   (MS1 i25 x857 s120))) 
                                           (exists ((i26 Int)) 
                                               (and 
                                                   (forall ((x859 Int)) 
                                                       (=> 
                                                           (length s120 x859) 
                                                           (<= (+ x859 1) i26))) 
                                                   (forall ((x860 Int) (x861 Int)) 
                                                       (=> 
                                                           (and 
                                                               (length s120 x861) 
                                                               (length s220 x860)) 
                                                           (<= i26 (+ x861 x860)))) 
                                                   (= x856 i26) 
                                                   (exists ((x862 Int)) 
                                                       (and 
                                                           (forall ((x863 Int)) 
                                                               (=> 
                                                                   (length s120 x863) 
                                                                   (= x862 (- i26 x863)))) 
                                                           (MS1 x862 x857 s220)))))))))))))
         :named hyp68))
(assert (! (forall ((s121 PZA) (s221 PZA)) 
               (=> 
                   (and 
                       (exists ((n51 Int)) 
                           (and 
                               (<= 0 n51) 
                               (forall ((x864 Int) (x865 A)) 
                                   (=> 
                                       (MS1 x864 x865 s121) 
                                       (and 
                                           (<= 1 x864) 
                                           (<= x864 n51)))) 
                               (forall ((x866 Int) (x867 A) (x868 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x866 x867 s121) 
                                           (MS1 x866 x868 s121)) 
                                       (= x867 x868))) 
                               (forall ((x869 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x869) 
                                           (<= x869 n51)) 
                                       (exists ((x870 A)) 
                                           (MS1 x869 x870 s121)))))) 
                       (exists ((n52 Int)) 
                           (and 
                               (<= 0 n52) 
                               (forall ((x871 Int) (x872 A)) 
                                   (=> 
                                       (MS1 x871 x872 s221) 
                                       (and 
                                           (<= 1 x871) 
                                           (<= x871 n52)))) 
                               (forall ((x873 Int) (x874 A) (x875 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x873 x874 s221) 
                                           (MS1 x873 x875 s221)) 
                                       (= x874 x875))) 
                               (forall ((x876 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x876) 
                                           (<= x876 n52)) 
                                       (exists ((x877 A)) 
                                           (MS1 x876 x877 s221))))))) 
                   (exists ((x878 PZA) (x879 Int)) 
                       (and 
                           (forall ((x880 Int) (x881 A)) 
                               (= 
                                   (MS1 x880 x881 x878) 
                                   (or 
                                       (exists ((i27 Int)) 
                                           (and 
                                               (<= 1 i27) 
                                               (forall ((x882 Int)) 
                                                   (=> 
                                                       (length s121 x882) 
                                                       (<= i27 x882))) 
                                               (= x880 i27) 
                                               (MS1 i27 x881 s121))) 
                                       (exists ((i28 Int)) 
                                           (and 
                                               (forall ((x883 Int)) 
                                                   (=> 
                                                       (length s121 x883) 
                                                       (<= (+ x883 1) i28))) 
                                               (forall ((x884 Int) (x885 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s121 x885) 
                                                           (length s221 x884)) 
                                                       (<= i28 (+ x885 x884)))) 
                                               (= x880 i28) 
                                               (exists ((x886 Int)) 
                                                   (and 
                                                       (forall ((x887 Int)) 
                                                           (=> 
                                                               (length s121 x887) 
                                                               (= x886 (- i28 x887)))) 
                                                       (MS1 x886 x881 s221)))))))) 
                           (forall ((x888 Int) (x889 Int)) 
                               (=> 
                                   (and 
                                       (length s121 x889) 
                                       (length s221 x888)) 
                                   (= x879 (+ x889 x888)))) 
                           (length x878 x879)))))
         :named hyp69))
(assert (! (forall ((s122 PZA) (s222 PZA)) 
               (=> 
                   (and 
                       (exists ((n53 Int)) 
                           (and 
                               (<= 0 n53) 
                               (forall ((x890 Int) (x891 A)) 
                                   (=> 
                                       (MS1 x890 x891 s122) 
                                       (and 
                                           (<= 1 x890) 
                                           (<= x890 n53)))) 
                               (forall ((x892 Int) (x893 A) (x894 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x892 x893 s122) 
                                           (MS1 x892 x894 s122)) 
                                       (= x893 x894))) 
                               (forall ((x895 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x895) 
                                           (<= x895 n53)) 
                                       (exists ((x896 A)) 
                                           (MS1 x895 x896 s122)))))) 
                       (exists ((n54 Int)) 
                           (and 
                               (<= 0 n54) 
                               (forall ((x897 Int) (x898 A)) 
                                   (=> 
                                       (MS1 x897 x898 s222) 
                                       (and 
                                           (<= 1 x897) 
                                           (<= x897 n54)))) 
                               (forall ((x899 Int) (x900 A) (x901 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x899 x900 s222) 
                                           (MS1 x899 x901 s222)) 
                                       (= x900 x901))) 
                               (forall ((x902 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x902) 
                                           (<= x902 n54)) 
                                       (exists ((x903 A)) 
                                           (MS1 x902 x903 s222))))))) 
                   (forall ((x904 Int)) 
                       (= 
                           (or 
                               (exists ((x905 A)) 
                                   (exists ((i29 Int)) 
                                       (and 
                                           (<= 1 i29) 
                                           (forall ((x906 Int)) 
                                               (=> 
                                                   (length s122 x906) 
                                                   (<= i29 x906))) 
                                           (= x904 i29) 
                                           (MS1 i29 x905 s122)))) 
                               (exists ((x907 A)) 
                                   (exists ((i30 Int)) 
                                       (and 
                                           (forall ((x908 Int)) 
                                               (=> 
                                                   (length s122 x908) 
                                                   (<= (+ x908 1) i30))) 
                                           (forall ((x909 Int) (x910 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s122 x910) 
                                                       (length s222 x909)) 
                                                   (<= i30 (+ x910 x909)))) 
                                           (= x904 i30) 
                                           (exists ((x911 Int)) 
                                               (and 
                                                   (forall ((x912 Int)) 
                                                       (=> 
                                                           (length s122 x912) 
                                                           (= x911 (- i30 x912)))) 
                                                   (MS1 x911 x907 s222))))))) 
                           (and 
                               (<= 1 x904) 
                               (forall ((x913 Int) (x914 Int)) 
                                   (=> 
                                       (and 
                                           (length s122 x914) 
                                           (length s222 x913)) 
                                       (<= x904 (+ x914 x913)))))))))
         :named hyp70))
(assert (! (forall ((s123 PZA) (s223 PZA)) 
               (=> 
                   (and 
                       (exists ((n55 Int)) 
                           (and 
                               (<= 0 n55) 
                               (forall ((x915 Int) (x916 A)) 
                                   (=> 
                                       (MS1 x915 x916 s123) 
                                       (and 
                                           (<= 1 x915) 
                                           (<= x915 n55)))) 
                               (forall ((x917 Int) (x918 A) (x919 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x917 x918 s123) 
                                           (MS1 x917 x919 s123)) 
                                       (= x918 x919))) 
                               (forall ((x920 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x920) 
                                           (<= x920 n55)) 
                                       (exists ((x921 A)) 
                                           (MS1 x920 x921 s123)))))) 
                       (exists ((n56 Int)) 
                           (and 
                               (<= 0 n56) 
                               (forall ((x922 Int) (x923 A)) 
                                   (=> 
                                       (MS1 x922 x923 s223) 
                                       (and 
                                           (<= 1 x922) 
                                           (<= x922 n56)))) 
                               (forall ((x924 Int) (x925 A) (x926 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x924 x925 s223) 
                                           (MS1 x924 x926 s223)) 
                                       (= x925 x926))) 
                               (forall ((x927 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x927) 
                                           (<= x927 n56)) 
                                       (exists ((x928 A)) 
                                           (MS1 x927 x928 s223))))))) 
                   (forall ((x929 A)) 
                       (= 
                           (or 
                               (exists ((x930 Int)) 
                                   (exists ((i31 Int)) 
                                       (and 
                                           (<= 1 i31) 
                                           (forall ((x931 Int)) 
                                               (=> 
                                                   (length s123 x931) 
                                                   (<= i31 x931))) 
                                           (= x930 i31) 
                                           (MS1 i31 x929 s123)))) 
                               (exists ((x932 Int)) 
                                   (exists ((i32 Int)) 
                                       (and 
                                           (forall ((x933 Int)) 
                                               (=> 
                                                   (length s123 x933) 
                                                   (<= (+ x933 1) i32))) 
                                           (forall ((x934 Int) (x935 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s123 x935) 
                                                       (length s223 x934)) 
                                                   (<= i32 (+ x935 x934)))) 
                                           (= x932 i32) 
                                           (exists ((x936 Int)) 
                                               (and 
                                                   (forall ((x937 Int)) 
                                                       (=> 
                                                           (length s123 x937) 
                                                           (= x936 (- i32 x937)))) 
                                                   (MS1 x936 x929 s223))))))) 
                           (or 
                               (exists ((x938 Int)) 
                                   (MS1 x938 x929 s123)) 
                               (exists ((x939 Int)) 
                                   (MS1 x939 x929 s223)))))))
         :named hyp71))
(assert (! (forall ((s124 PZA) (s224 PZA) (i33 Int)) 
               (=> 
                   (and 
                       (exists ((n57 Int)) 
                           (and 
                               (<= 0 n57) 
                               (forall ((x940 Int) (x941 A)) 
                                   (=> 
                                       (MS1 x940 x941 s124) 
                                       (and 
                                           (<= 1 x940) 
                                           (<= x940 n57)))) 
                               (forall ((x942 Int) (x943 A) (x944 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x942 x943 s124) 
                                           (MS1 x942 x944 s124)) 
                                       (= x943 x944))) 
                               (forall ((x945 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x945) 
                                           (<= x945 n57)) 
                                       (exists ((x946 A)) 
                                           (MS1 x945 x946 s124)))))) 
                       (exists ((n58 Int)) 
                           (and 
                               (<= 0 n58) 
                               (forall ((x947 Int) (x948 A)) 
                                   (=> 
                                       (MS1 x947 x948 s224) 
                                       (and 
                                           (<= 1 x947) 
                                           (<= x947 n58)))) 
                               (forall ((x949 Int) (x950 A) (x951 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x949 x950 s224) 
                                           (MS1 x949 x951 s224)) 
                                       (= x950 x951))) 
                               (forall ((x952 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x952) 
                                           (<= x952 n58)) 
                                       (exists ((x953 A)) 
                                           (MS1 x952 x953 s224)))))) 
                       (<= 1 i33) 
                       (forall ((x954 Int)) 
                           (=> 
                               (length s124 x954) 
                               (<= i33 x954)))) 
                   (or 
                       (exists ((i34 Int)) 
                           (and 
                               (<= 1 i34) 
                               (forall ((x955 Int)) 
                                   (=> 
                                       (length s124 x955) 
                                       (<= i34 x955))) 
                               (= i33 i34) 
                               (exists ((x956 A)) 
                                   (and 
                                       (MS1 i34 x956 s124) 
                                       (MS1 i33 x956 s124))))) 
                       (exists ((i35 Int)) 
                           (and 
                               (forall ((x957 Int)) 
                                   (=> 
                                       (length s124 x957) 
                                       (<= (+ x957 1) i35))) 
                               (forall ((x958 Int) (x959 Int)) 
                                   (=> 
                                       (and 
                                           (length s124 x959) 
                                           (length s224 x958)) 
                                       (<= i35 (+ x959 x958)))) 
                               (= i33 i35) 
                               (exists ((x960 A)) 
                                   (and 
                                       (exists ((x961 Int)) 
                                           (and 
                                               (forall ((x962 Int)) 
                                                   (=> 
                                                       (length s124 x962) 
                                                       (= x961 (- i35 x962)))) 
                                               (MS1 x961 x960 s224))) 
                                       (MS1 i33 x960 s124))))))))
         :named hyp72))
(assert (! (forall ((s125 PZA) (s225 PZA) (i36 Int)) 
               (=> 
                   (and 
                       (exists ((n59 Int)) 
                           (and 
                               (<= 0 n59) 
                               (forall ((x963 Int) (x964 A)) 
                                   (=> 
                                       (MS1 x963 x964 s125) 
                                       (and 
                                           (<= 1 x963) 
                                           (<= x963 n59)))) 
                               (forall ((x965 Int) (x966 A) (x967 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x965 x966 s125) 
                                           (MS1 x965 x967 s125)) 
                                       (= x966 x967))) 
                               (forall ((x968 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x968) 
                                           (<= x968 n59)) 
                                       (exists ((x969 A)) 
                                           (MS1 x968 x969 s125)))))) 
                       (exists ((n60 Int)) 
                           (and 
                               (<= 0 n60) 
                               (forall ((x970 Int) (x971 A)) 
                                   (=> 
                                       (MS1 x970 x971 s225) 
                                       (and 
                                           (<= 1 x970) 
                                           (<= x970 n60)))) 
                               (forall ((x972 Int) (x973 A) (x974 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x972 x973 s225) 
                                           (MS1 x972 x974 s225)) 
                                       (= x973 x974))) 
                               (forall ((x975 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x975) 
                                           (<= x975 n60)) 
                                       (exists ((x976 A)) 
                                           (MS1 x975 x976 s225)))))) 
                       (forall ((x977 Int)) 
                           (=> 
                               (length s125 x977) 
                               (<= (+ x977 1) i36))) 
                       (forall ((x978 Int) (x979 Int)) 
                           (=> 
                               (and 
                                   (length s125 x979) 
                                   (length s225 x978)) 
                               (<= i36 (+ x979 x978))))) 
                   (or 
                       (exists ((i37 Int)) 
                           (and 
                               (<= 1 i37) 
                               (forall ((x980 Int)) 
                                   (=> 
                                       (length s125 x980) 
                                       (<= i37 x980))) 
                               (= i36 i37) 
                               (exists ((x981 Int) (x982 A)) 
                                   (and 
                                       (forall ((x983 Int)) 
                                           (=> 
                                               (length s125 x983) 
                                               (= x981 (- i36 x983)))) 
                                       (MS1 i37 x982 s125) 
                                       (MS1 x981 x982 s225))))) 
                       (exists ((i38 Int)) 
                           (and 
                               (forall ((x984 Int)) 
                                   (=> 
                                       (length s125 x984) 
                                       (<= (+ x984 1) i38))) 
                               (forall ((x985 Int) (x986 Int)) 
                                   (=> 
                                       (and 
                                           (length s125 x986) 
                                           (length s225 x985)) 
                                       (<= i38 (+ x986 x985)))) 
                               (= i36 i38) 
                               (exists ((x987 Int) (x988 A)) 
                                   (and 
                                       (forall ((x989 Int)) 
                                           (=> 
                                               (length s125 x989) 
                                               (= x987 (- i36 x989)))) 
                                       (exists ((x990 Int)) 
                                           (and 
                                               (forall ((x991 Int)) 
                                                   (=> 
                                                       (length s125 x991) 
                                                       (= x990 (- i38 x991)))) 
                                               (MS1 x990 x988 s225))) 
                                       (MS1 x987 x988 s225))))))))
         :named hyp73))
(assert (! (forall ((s126 PZA) (s226 PZA) (b1 PA)) 
               (=> 
                   (and 
                       (exists ((n61 Int)) 
                           (and 
                               (<= 0 n61) 
                               (forall ((x992 Int) (x993 A)) 
                                   (=> 
                                       (MS1 x992 x993 s126) 
                                       (and 
                                           (<= 1 x992) 
                                           (<= x992 n61)))) 
                               (forall ((x994 Int) (x995 A) (x996 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x994 x995 s126) 
                                           (MS1 x994 x996 s126)) 
                                       (= x995 x996))) 
                               (forall ((x997 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x997) 
                                           (<= x997 n61)) 
                                       (exists ((x998 A)) 
                                           (MS1 x997 x998 s126)))))) 
                       (exists ((n62 Int)) 
                           (and 
                               (<= 0 n62) 
                               (forall ((x999 Int) (x1000 A)) 
                                   (=> 
                                       (MS1 x999 x1000 s226) 
                                       (and 
                                           (<= 1 x999) 
                                           (<= x999 n62)))) 
                               (forall ((x1001 Int) (x1002 A) (x1003 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x1001 x1002 s226) 
                                           (MS1 x1001 x1003 s226)) 
                                       (= x1002 x1003))) 
                               (forall ((x1004 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x1004) 
                                           (<= x1004 n62)) 
                                       (exists ((x1005 A)) 
                                           (MS1 x1004 x1005 s226)))))) 
                       (forall ((x1006 A)) 
                           (=> 
                               (exists ((x1007 Int)) 
                                   (MS1 x1007 x1006 s126)) 
                               (MS0 x1006 b1))) 
                       (forall ((x1008 A)) 
                           (=> 
                               (exists ((x1009 Int)) 
                                   (MS1 x1009 x1008 s226)) 
                               (MS0 x1008 b1)))) 
                   (and 
                       (forall ((x1010 Int) (x1011 A)) 
                           (=> 
                               (or 
                                   (exists ((i39 Int)) 
                                       (and 
                                           (<= 1 i39) 
                                           (forall ((x1012 Int)) 
                                               (=> 
                                                   (length s126 x1012) 
                                                   (<= i39 x1012))) 
                                           (= x1010 i39) 
                                           (MS1 i39 x1011 s126))) 
                                   (exists ((i40 Int)) 
                                       (and 
                                           (forall ((x1013 Int)) 
                                               (=> 
                                                   (length s126 x1013) 
                                                   (<= (+ x1013 1) i40))) 
                                           (forall ((x1014 Int) (x1015 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s126 x1015) 
                                                       (length s226 x1014)) 
                                                   (<= i40 (+ x1015 x1014)))) 
                                           (= x1010 i40) 
                                           (exists ((x1016 Int)) 
                                               (and 
                                                   (forall ((x1017 Int)) 
                                                       (=> 
                                                           (length s126 x1017) 
                                                           (= x1016 (- i40 x1017)))) 
                                                   (MS1 x1016 x1011 s226)))))) 
                               (and 
                                   (<= 1 x1010) 
                                   (forall ((x1018 Int) (x1019 Int)) 
                                       (=> 
                                           (and 
                                               (length s126 x1019) 
                                               (length s226 x1018)) 
                                           (<= x1010 (+ x1019 x1018)))) 
                                   (MS0 x1011 b1)))) 
                       (forall ((x1020 Int) (x1021 A) (x1022 A)) 
                           (=> 
                               (and 
                                   (or 
                                       (exists ((i41 Int)) 
                                           (and 
                                               (<= 1 i41) 
                                               (forall ((x1023 Int)) 
                                                   (=> 
                                                       (length s126 x1023) 
                                                       (<= i41 x1023))) 
                                               (= x1020 i41) 
                                               (MS1 i41 x1021 s126))) 
                                       (exists ((i42 Int)) 
                                           (and 
                                               (forall ((x1024 Int)) 
                                                   (=> 
                                                       (length s126 x1024) 
                                                       (<= (+ x1024 1) i42))) 
                                               (forall ((x1025 Int) (x1026 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s126 x1026) 
                                                           (length s226 x1025)) 
                                                       (<= i42 (+ x1026 x1025)))) 
                                               (= x1020 i42) 
                                               (exists ((x1027 Int)) 
                                                   (and 
                                                       (forall ((x1028 Int)) 
                                                           (=> 
                                                               (length s126 x1028) 
                                                               (= x1027 (- i42 x1028)))) 
                                                       (MS1 x1027 x1021 s226)))))) 
                                   (or 
                                       (exists ((i43 Int)) 
                                           (and 
                                               (<= 1 i43) 
                                               (forall ((x1029 Int)) 
                                                   (=> 
                                                       (length s126 x1029) 
                                                       (<= i43 x1029))) 
                                               (= x1020 i43) 
                                               (MS1 i43 x1022 s126))) 
                                       (exists ((i44 Int)) 
                                           (and 
                                               (forall ((x1030 Int)) 
                                                   (=> 
                                                       (length s126 x1030) 
                                                       (<= (+ x1030 1) i44))) 
                                               (forall ((x1031 Int) (x1032 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s126 x1032) 
                                                           (length s226 x1031)) 
                                                       (<= i44 (+ x1032 x1031)))) 
                                               (= x1020 i44) 
                                               (exists ((x1033 Int)) 
                                                   (and 
                                                       (forall ((x1034 Int)) 
                                                           (=> 
                                                               (length s126 x1034) 
                                                               (= x1033 (- i44 x1034)))) 
                                                       (MS1 x1033 x1022 s226))))))) 
                               (= x1021 x1022))) 
                       (forall ((x1035 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x1035) 
                                   (forall ((x1036 Int) (x1037 Int)) 
                                       (=> 
                                           (and 
                                               (length s126 x1037) 
                                               (length s226 x1036)) 
                                           (<= x1035 (+ x1037 x1036))))) 
                               (or 
                                   (exists ((x1038 A)) 
                                       (exists ((i45 Int)) 
                                           (and 
                                               (<= 1 i45) 
                                               (forall ((x1039 Int)) 
                                                   (=> 
                                                       (length s126 x1039) 
                                                       (<= i45 x1039))) 
                                               (= x1035 i45) 
                                               (MS1 i45 x1038 s126)))) 
                                   (exists ((x1040 A)) 
                                       (exists ((i46 Int)) 
                                           (and 
                                               (forall ((x1041 Int)) 
                                                   (=> 
                                                       (length s126 x1041) 
                                                       (<= (+ x1041 1) i46))) 
                                               (forall ((x1042 Int) (x1043 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s126 x1043) 
                                                           (length s226 x1042)) 
                                                       (<= i46 (+ x1043 x1042)))) 
                                               (= x1035 i46) 
                                               (exists ((x1044 Int)) 
                                                   (and 
                                                       (forall ((x1045 Int)) 
                                                           (=> 
                                                               (length s126 x1045) 
                                                               (= x1044 (- i46 x1045)))) 
                                                       (MS1 x1044 x1040 s226))))))))))))
         :named hyp74))
(assert (! (forall ((x1046 A) (y10 A)) 
               (=> 
                   (and 
                       (MS0 x1046 a) 
                       (MS0 y10 a)) 
                   (forall ((x1047 PZA)) 
                       (= 
                           (exists ((x1048 A) (x1049 A)) 
                               (and 
                                   (= x1048 y10) 
                                   (= x1049 x1046) 
                                   (path x1048 x1049 x1047))) 
                           (exists ((x1050 PZA)) 
                               (and 
                                   (exists ((x1051 A) (x1052 A)) 
                                       (and 
                                           (= x1051 x1046) 
                                           (= x1052 y10) 
                                           (path x1051 x1052 x1050))) 
                                   (exists ((s48 PZA)) 
                                       (and 
                                           (exists ((n63 Int)) 
                                               (and 
                                                   (<= 0 n63) 
                                                   (forall ((x1053 Int) (x1054 A)) 
                                                       (=> 
                                                           (MS1 x1053 x1054 s48) 
                                                           (and 
                                                               (<= 1 x1053) 
                                                               (<= x1053 n63)))) 
                                                   (forall ((x1055 Int) (x1056 A) (x1057 A)) 
                                                       (=> 
                                                           (and 
                                                               (MS1 x1055 x1056 s48) 
                                                               (MS1 x1055 x1057 s48)) 
                                                           (= x1056 x1057))) 
                                                   (forall ((x1058 Int)) 
                                                       (=> 
                                                           (and 
                                                               (<= 1 x1058) 
                                                               (<= x1058 n63)) 
                                                           (exists ((x1059 A)) 
                                                               (MS1 x1058 x1059 s48)))))) 
                                           (forall ((x1060 Int) (x1061 A)) 
                                               (= 
                                                   (MS1 x1060 x1061 x1050) 
                                                   (MS1 x1060 x1061 s48))) 
                                           (forall ((x1062 Int) (x1063 A)) 
                                               (= 
                                                   (MS1 x1062 x1063 x1047) 
                                                   (exists ((i47 Int)) 
                                                       (and 
                                                           (<= 1 i47) 
                                                           (forall ((x1064 Int)) 
                                                               (=> 
                                                                   (length s48 x1064) 
                                                                   (<= i47 x1064))) 
                                                           (= x1062 i47) 
                                                           (exists ((x1065 Int)) 
                                                               (and 
                                                                   (forall ((x1066 Int)) 
                                                                       (=> 
                                                                           (length s48 x1066) 
                                                                           (= x1065 (+ (- x1066 i47) 1)))) 
                                                                   (MS1 x1065 x1063 s48)))))))))))))))
         :named hyp75))
(assert (! (and 
               (forall ((x1067 PZA) (x1068 PZA)) 
                   (=> 
                       (exists ((s49 PZA)) 
                           (and 
                               (exists ((n64 Int)) 
                                   (and 
                                       (<= 0 n64) 
                                       (forall ((x1069 Int) (x1070 A)) 
                                           (=> 
                                               (MS1 x1069 x1070 s49) 
                                               (and 
                                                   (<= 1 x1069) 
                                                   (<= x1069 n64)))) 
                                       (forall ((x1071 Int) (x1072 A) (x1073 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x1071 x1072 s49) 
                                                   (MS1 x1071 x1073 s49)) 
                                               (= x1072 x1073))) 
                                       (forall ((x1074 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x1074) 
                                                   (<= x1074 n64)) 
                                               (exists ((x1075 A)) 
                                                   (MS1 x1074 x1075 s49)))))) 
                               (forall ((x1076 Int) (x1077 A)) 
                                   (= 
                                       (MS1 x1076 x1077 x1067) 
                                       (MS1 x1076 x1077 s49))) 
                               (forall ((x1078 Int) (x1079 A)) 
                                   (= 
                                       (MS1 x1078 x1079 x1068) 
                                       (exists ((i48 Int)) 
                                           (and 
                                               (<= 1 i48) 
                                               (forall ((x1080 Int)) 
                                                   (=> 
                                                       (length s49 x1080) 
                                                       (<= i48 x1080))) 
                                               (= x1078 i48) 
                                               (exists ((x1081 Int)) 
                                                   (and 
                                                       (forall ((x1082 Int)) 
                                                           (=> 
                                                               (length s49 x1082) 
                                                               (= x1081 (+ (- x1082 i48) 1)))) 
                                                       (MS1 x1081 x1079 s49))))))))) 
                       (and 
                           (exists ((s50 PZA)) 
                               (and 
                                   (exists ((n65 Int)) 
                                       (and 
                                           (<= 0 n65) 
                                           (forall ((x1083 Int) (x1084 A)) 
                                               (=> 
                                                   (MS1 x1083 x1084 s50) 
                                                   (and 
                                                       (<= 1 x1083) 
                                                       (<= x1083 n65)))) 
                                           (forall ((x1085 Int) (x1086 A) (x1087 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x1085 x1086 s50) 
                                                       (MS1 x1085 x1087 s50)) 
                                                   (= x1086 x1087))) 
                                           (forall ((x1088 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x1088) 
                                                       (<= x1088 n65)) 
                                                   (exists ((x1089 A)) 
                                                       (MS1 x1088 x1089 s50)))))) 
                                   (forall ((x1090 Int) (x1091 A)) 
                                       (= 
                                           (MS1 x1090 x1091 x1067) 
                                           (MS1 x1090 x1091 s50))))) 
                           (exists ((s51 PZA)) 
                               (and 
                                   (exists ((n66 Int)) 
                                       (and 
                                           (<= 0 n66) 
                                           (forall ((x1092 Int) (x1093 A)) 
                                               (=> 
                                                   (MS1 x1092 x1093 s51) 
                                                   (and 
                                                       (<= 1 x1092) 
                                                       (<= x1092 n66)))) 
                                           (forall ((x1094 Int) (x1095 A) (x1096 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x1094 x1095 s51) 
                                                       (MS1 x1094 x1096 s51)) 
                                                   (= x1095 x1096))) 
                                           (forall ((x1097 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x1097) 
                                                       (<= x1097 n66)) 
                                                   (exists ((x1098 A)) 
                                                       (MS1 x1097 x1098 s51)))))) 
                                   (forall ((x1099 Int) (x1100 A)) 
                                       (= 
                                           (MS1 x1099 x1100 x1068) 
                                           (MS1 x1099 x1100 s51)))))))) 
               (forall ((x1101 PZA) (x1102 PZA) (x1103 PZA)) 
                   (=> 
                       (and 
                           (exists ((s52 PZA)) 
                               (and 
                                   (exists ((n67 Int)) 
                                       (and 
                                           (<= 0 n67) 
                                           (forall ((x1104 Int) (x1105 A)) 
                                               (=> 
                                                   (MS1 x1104 x1105 s52) 
                                                   (and 
                                                       (<= 1 x1104) 
                                                       (<= x1104 n67)))) 
                                           (forall ((x1106 Int) (x1107 A) (x1108 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x1106 x1107 s52) 
                                                       (MS1 x1106 x1108 s52)) 
                                                   (= x1107 x1108))) 
                                           (forall ((x1109 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x1109) 
                                                       (<= x1109 n67)) 
                                                   (exists ((x1110 A)) 
                                                       (MS1 x1109 x1110 s52)))))) 
                                   (forall ((x1111 Int) (x1112 A)) 
                                       (= 
                                           (MS1 x1111 x1112 x1101) 
                                           (MS1 x1111 x1112 s52))) 
                                   (forall ((x1113 Int) (x1114 A)) 
                                       (= 
                                           (MS1 x1113 x1114 x1102) 
                                           (exists ((i49 Int)) 
                                               (and 
                                                   (<= 1 i49) 
                                                   (forall ((x1115 Int)) 
                                                       (=> 
                                                           (length s52 x1115) 
                                                           (<= i49 x1115))) 
                                                   (= x1113 i49) 
                                                   (exists ((x1116 Int)) 
                                                       (and 
                                                           (forall ((x1117 Int)) 
                                                               (=> 
                                                                   (length s52 x1117) 
                                                                   (= x1116 (+ (- x1117 i49) 1)))) 
                                                           (MS1 x1116 x1114 s52))))))))) 
                           (exists ((s53 PZA)) 
                               (and 
                                   (exists ((n68 Int)) 
                                       (and 
                                           (<= 0 n68) 
                                           (forall ((x1118 Int) (x1119 A)) 
                                               (=> 
                                                   (MS1 x1118 x1119 s53) 
                                                   (and 
                                                       (<= 1 x1118) 
                                                       (<= x1118 n68)))) 
                                           (forall ((x1120 Int) (x1121 A) (x1122 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x1120 x1121 s53) 
                                                       (MS1 x1120 x1122 s53)) 
                                                   (= x1121 x1122))) 
                                           (forall ((x1123 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x1123) 
                                                       (<= x1123 n68)) 
                                                   (exists ((x1124 A)) 
                                                       (MS1 x1123 x1124 s53)))))) 
                                   (forall ((x1125 Int) (x1126 A)) 
                                       (= 
                                           (MS1 x1125 x1126 x1101) 
                                           (MS1 x1125 x1126 s53))) 
                                   (forall ((x1127 Int) (x1128 A)) 
                                       (= 
                                           (MS1 x1127 x1128 x1103) 
                                           (exists ((i50 Int)) 
                                               (and 
                                                   (<= 1 i50) 
                                                   (forall ((x1129 Int)) 
                                                       (=> 
                                                           (length s53 x1129) 
                                                           (<= i50 x1129))) 
                                                   (= x1127 i50) 
                                                   (exists ((x1130 Int)) 
                                                       (and 
                                                           (forall ((x1131 Int)) 
                                                               (=> 
                                                                   (length s53 x1131) 
                                                                   (= x1130 (+ (- x1131 i50) 1)))) 
                                                           (MS1 x1130 x1128 s53)))))))))) 
                       (forall ((x1132 Int) (x1133 A)) 
                           (= 
                               (MS1 x1132 x1133 x1102) 
                               (MS1 x1132 x1133 x1103))))) 
               (forall ((x1134 PZA)) 
                   (=> 
                       (exists ((s54 PZA)) 
                           (and 
                               (exists ((n69 Int)) 
                                   (and 
                                       (<= 0 n69) 
                                       (forall ((x1135 Int) (x1136 A)) 
                                           (=> 
                                               (MS1 x1135 x1136 s54) 
                                               (and 
                                                   (<= 1 x1135) 
                                                   (<= x1135 n69)))) 
                                       (forall ((x1137 Int) (x1138 A) (x1139 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x1137 x1138 s54) 
                                                   (MS1 x1137 x1139 s54)) 
                                               (= x1138 x1139))) 
                                       (forall ((x1140 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x1140) 
                                                   (<= x1140 n69)) 
                                               (exists ((x1141 A)) 
                                                   (MS1 x1140 x1141 s54)))))) 
                               (forall ((x1142 Int) (x1143 A)) 
                                   (= 
                                       (MS1 x1142 x1143 x1134) 
                                       (MS1 x1142 x1143 s54))))) 
                       (exists ((x1144 PZA) (s55 PZA)) 
                           (and 
                               (exists ((n70 Int)) 
                                   (and 
                                       (<= 0 n70) 
                                       (forall ((x1145 Int) (x1146 A)) 
                                           (=> 
                                               (MS1 x1145 x1146 s55) 
                                               (and 
                                                   (<= 1 x1145) 
                                                   (<= x1145 n70)))) 
                                       (forall ((x1147 Int) (x1148 A) (x1149 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x1147 x1148 s55) 
                                                   (MS1 x1147 x1149 s55)) 
                                               (= x1148 x1149))) 
                                       (forall ((x1150 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x1150) 
                                                   (<= x1150 n70)) 
                                               (exists ((x1151 A)) 
                                                   (MS1 x1150 x1151 s55)))))) 
                               (forall ((x1152 Int) (x1153 A)) 
                                   (= 
                                       (MS1 x1152 x1153 x1134) 
                                       (MS1 x1152 x1153 s55))) 
                               (forall ((x1154 Int) (x1155 A)) 
                                   (= 
                                       (MS1 x1154 x1155 x1144) 
                                       (exists ((i51 Int)) 
                                           (and 
                                               (<= 1 i51) 
                                               (forall ((x1156 Int)) 
                                                   (=> 
                                                       (length s55 x1156) 
                                                       (<= i51 x1156))) 
                                               (= x1154 i51) 
                                               (exists ((x1157 Int)) 
                                                   (and 
                                                       (forall ((x1158 Int)) 
                                                           (=> 
                                                               (length s55 x1158) 
                                                               (= x1157 (+ (- x1158 i51) 1)))) 
                                                       (MS1 x1157 x1155 s55))))))))))))
         :named hyp76))
(assert (! (forall ((x1159 A) (y11 A) (p6 PZA)) 
               (=> 
                   (path x1159 y11 p6) 
                   (exists ((x1160 PZA)) 
                       (and 
                           (forall ((x1161 Int) (x1162 A)) 
                               (= 
                                   (MS1 x1161 x1162 x1160) 
                                   (exists ((i52 Int)) 
                                       (and 
                                           (<= 1 i52) 
                                           (forall ((x1163 Int)) 
                                               (=> 
                                                   (length p6 x1163) 
                                                   (<= i52 x1163))) 
                                           (= x1161 i52) 
                                           (exists ((x1164 Int)) 
                                               (and 
                                                   (forall ((x1165 Int)) 
                                                       (=> 
                                                           (length p6 x1165) 
                                                           (= x1164 (+ (- x1165 i52) 1)))) 
                                                   (MS1 x1164 x1162 p6))))))) 
                           (path y11 x1159 x1160)))))
         :named hyp77))
(assert (! (forall ((s56 PZA)) 
               (=> 
                   (exists ((n71 Int)) 
                       (and 
                           (<= 0 n71) 
                           (forall ((x1166 Int) (x1167 A)) 
                               (=> 
                                   (MS1 x1166 x1167 s56) 
                                   (and 
                                       (<= 1 x1166) 
                                       (<= x1166 n71)))) 
                           (forall ((x1168 Int) (x1169 A) (x1170 A)) 
                               (=> 
                                   (and 
                                       (MS1 x1168 x1169 s56) 
                                       (MS1 x1168 x1170 s56)) 
                                   (= x1169 x1170))) 
                           (forall ((x1171 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x1171) 
                                       (<= x1171 n71)) 
                                   (exists ((x1172 A)) 
                                       (MS1 x1171 x1172 s56)))))) 
                   (exists ((x1173 PZA) (x1174 Int)) 
                       (and 
                           (forall ((x1175 Int) (x1176 A)) 
                               (= 
                                   (MS1 x1175 x1176 x1173) 
                                   (exists ((i53 Int)) 
                                       (and 
                                           (<= 1 i53) 
                                           (forall ((x1177 Int)) 
                                               (=> 
                                                   (length s56 x1177) 
                                                   (<= i53 x1177))) 
                                           (= x1175 i53) 
                                           (exists ((x1178 Int)) 
                                               (and 
                                                   (forall ((x1179 Int)) 
                                                       (=> 
                                                           (length s56 x1179) 
                                                           (= x1178 (+ (- x1179 i53) 1)))) 
                                                   (MS1 x1178 x1176 s56))))))) 
                           (length s56 x1174) 
                           (length x1173 x1174)))))
         :named hyp78))
(assert (! (forall ((s57 PZA)) 
               (=> 
                   (exists ((n72 Int)) 
                       (and 
                           (<= 0 n72) 
                           (forall ((x1180 Int) (x1181 A)) 
                               (=> 
                                   (MS1 x1180 x1181 s57) 
                                   (and 
                                       (<= 1 x1180) 
                                       (<= x1180 n72)))) 
                           (forall ((x1182 Int) (x1183 A) (x1184 A)) 
                               (=> 
                                   (and 
                                       (MS1 x1182 x1183 s57) 
                                       (MS1 x1182 x1184 s57)) 
                                   (= x1183 x1184))) 
                           (forall ((x1185 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x1185) 
                                       (<= x1185 n72)) 
                                   (exists ((x1186 A)) 
                                       (MS1 x1185 x1186 s57)))))) 
                   (forall ((x1187 A)) 
                       (= 
                           (exists ((i54 Int)) 
                               (and 
                                   (<= 1 i54) 
                                   (forall ((x1188 Int)) 
                                       (=> 
                                           (length s57 x1188) 
                                           (<= i54 x1188))) 
                                   (exists ((x1189 Int)) 
                                       (and 
                                           (forall ((x1190 Int)) 
                                               (=> 
                                                   (length s57 x1190) 
                                                   (= x1189 (+ (- x1190 i54) 1)))) 
                                           (MS1 x1189 x1187 s57))))) 
                           (exists ((x1191 Int)) 
                               (MS1 x1191 x1187 s57))))))
         :named hyp79))
(assert (! (forall ((s58 PZA)) 
               (=> 
                   (exists ((n73 Int)) 
                       (and 
                           (<= 0 n73) 
                           (forall ((x1192 Int) (x1193 A)) 
                               (=> 
                                   (MS1 x1192 x1193 s58) 
                                   (and 
                                       (<= 1 x1192) 
                                       (<= x1192 n73)))) 
                           (forall ((x1194 Int) (x1195 A) (x1196 A)) 
                               (=> 
                                   (and 
                                       (MS1 x1194 x1195 s58) 
                                       (MS1 x1194 x1196 s58)) 
                                   (= x1195 x1196))) 
                           (forall ((x1197 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x1197) 
                                       (<= x1197 n73)) 
                                   (exists ((x1198 A)) 
                                       (MS1 x1197 x1198 s58)))))) 
                   (forall ((x1199 Int) (x1200 A)) 
                       (= 
                           (exists ((i55 Int)) 
                               (and 
                                   (<= 1 i55) 
                                   (forall ((x1201 Int)) 
                                       (=> 
                                           (exists ((x1202 PZA)) 
                                               (and 
                                                   (forall ((x1203 Int) (x1204 A)) 
                                                       (= 
                                                           (MS1 x1203 x1204 x1202) 
                                                           (exists ((i56 Int)) 
                                                               (and 
                                                                   (<= 1 i56) 
                                                                   (forall ((x1205 Int)) 
                                                                       (=> 
                                                                           (length s58 x1205) 
                                                                           (<= i56 x1205))) 
                                                                   (= x1203 i56) 
                                                                   (exists ((x1206 Int)) 
                                                                       (and 
                                                                           (forall ((x1207 Int)) 
                                                                               (=> 
                                                                                   (length s58 x1207) 
                                                                                   (= x1206 (+ (- x1207 i56) 1)))) 
                                                                           (MS1 x1206 x1204 s58))))))) 
                                                   (length x1202 x1201))) 
                                           (<= i55 x1201))) 
                                   (= x1199 i55) 
                                   (exists ((x1208 Int)) 
                                       (and 
                                           (forall ((x1209 Int) (x1210 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s58 x1210) 
                                                       (exists ((x1211 PZA)) 
                                                           (and 
                                                               (forall ((x1212 Int) (x1213 A)) 
                                                                   (= 
                                                                       (MS1 x1212 x1213 x1211) 
                                                                       (exists ((i57 Int)) 
                                                                           (and 
                                                                               (<= 1 i57) 
                                                                               (forall ((x1214 Int)) 
                                                                                   (=> 
                                                                                       (length s58 x1214) 
                                                                                       (<= i57 x1214))) 
                                                                               (= x1212 i57) 
                                                                               (exists ((x1215 Int)) 
                                                                                   (and 
                                                                                       (forall ((x1216 Int)) 
                                                                                           (=> 
                                                                                               (length s58 x1216) 
                                                                                               (= x1215 (+ (- x1216 i57) 1)))) 
                                                                                       (MS1 x1215 x1213 s58))))))) 
                                                               (length x1211 x1209)))) 
                                                   (= x1208 (+ (- x1210 (+ (- x1209 i55) 1)) 1)))) 
                                           (MS1 x1208 x1200 s58))))) 
                           (MS1 x1199 x1200 s58)))))
         :named hyp80))
(assert (! (forall ((x1217 A) (y12 A)) 
               (=> 
                   (and 
                       (MS0 x1217 a) 
                       (MS0 y12 a)) 
                   (exists ((x1218 Int)) 
                       (and 
                           (exists ((x1219 PZA)) 
                               (and 
                                   (exists ((x1220 A) (x1221 A)) 
                                       (and 
                                           (= x1220 x1217) 
                                           (= x1221 y12) 
                                           (exists ((x1222 A) (y13 A) (p7 PZA)) 
                                               (and 
                                                   (exists ((n74 Int)) 
                                                       (and 
                                                           (<= 0 n74) 
                                                           (forall ((x1223 Int) (x1224 A)) 
                                                               (=> 
                                                                   (MS1 x1223 x1224 p7) 
                                                                   (and 
                                                                       (<= 1 x1223) 
                                                                       (<= x1223 n74)))) 
                                                           (forall ((x1225 Int) (x1226 A) (x1227 A)) 
                                                               (=> 
                                                                   (and 
                                                                       (MS1 x1225 x1226 p7) 
                                                                       (MS1 x1225 x1227 p7)) 
                                                                   (= x1226 x1227))) 
                                                           (forall ((x1228 Int)) 
                                                               (=> 
                                                                   (and 
                                                                       (<= 1 x1228) 
                                                                       (<= x1228 n74)) 
                                                                   (exists ((x1229 A)) 
                                                                       (MS1 x1228 x1229 p7)))))) 
                                                   (forall ((x1230 A)) 
                                                       (=> 
                                                           (exists ((x1231 Int)) 
                                                               (MS1 x1231 x1230 p7)) 
                                                           (MS0 x1230 a))) 
                                                   (forall ((x1232 Int)) 
                                                       (=> 
                                                           (length p7 x1232) 
                                                           (< 1 x1232))) 
                                                   (exists ((x1233 Int)) 
                                                       (and 
                                                           (= x1233 1) 
                                                           (MS1 x1233 x1222 p7))) 
                                                   (exists ((x1234 Int)) 
                                                       (and 
                                                           (length p7 x1234) 
                                                           (MS1 x1234 y13 p7))) 
                                                   (forall ((i58 Int)) 
                                                       (=> 
                                                           (and 
                                                               (<= 1 i58) 
                                                               (forall ((x1235 Int)) 
                                                                   (=> 
                                                                       (length p7 x1235) 
                                                                       (<= i58 (- x1235 1))))) 
                                                           (exists ((x1236 A) (x1237 A)) 
                                                               (and 
                                                                   (MS1 i58 x1236 p7) 
                                                                   (exists ((x1238 Int)) 
                                                                       (and 
                                                                           (= x1238 (+ i58 1)) 
                                                                           (MS1 x1238 x1237 p7))) 
                                                                   (MS x1236 x1237 r))))) 
                                                   (= x1220 x1222) 
                                                   (= x1221 y13) 
                                                   (forall ((x1239 Int) (x1240 A)) 
                                                       (= 
                                                           (MS1 x1239 x1240 x1219) 
                                                           (MS1 x1239 x1240 p7))))))) 
                                   (length x1219 x1218))) 
                           (forall ((x1241 Int)) 
                               (=> 
                                   (exists ((x1242 PZA)) 
                                       (and 
                                           (exists ((x1243 A) (x1244 A)) 
                                               (and 
                                                   (= x1243 x1217) 
                                                   (= x1244 y12) 
                                                   (exists ((x1245 A) (y14 A) (p8 PZA)) 
                                                       (and 
                                                           (exists ((n75 Int)) 
                                                               (and 
                                                                   (<= 0 n75) 
                                                                   (forall ((x1246 Int) (x1247 A)) 
                                                                       (=> 
                                                                           (MS1 x1246 x1247 p8) 
                                                                           (and 
                                                                               (<= 1 x1246) 
                                                                               (<= x1246 n75)))) 
                                                                   (forall ((x1248 Int) (x1249 A) (x1250 A)) 
                                                                       (=> 
                                                                           (and 
                                                                               (MS1 x1248 x1249 p8) 
                                                                               (MS1 x1248 x1250 p8)) 
                                                                           (= x1249 x1250))) 
                                                                   (forall ((x1251 Int)) 
                                                                       (=> 
                                                                           (and 
                                                                               (<= 1 x1251) 
                                                                               (<= x1251 n75)) 
                                                                           (exists ((x1252 A)) 
                                                                               (MS1 x1251 x1252 p8)))))) 
                                                           (forall ((x1253 A)) 
                                                               (=> 
                                                                   (exists ((x1254 Int)) 
                                                                       (MS1 x1254 x1253 p8)) 
                                                                   (MS0 x1253 a))) 
                                                           (forall ((x1255 Int)) 
                                                               (=> 
                                                                   (length p8 x1255) 
                                                                   (< 1 x1255))) 
                                                           (exists ((x1256 Int)) 
                                                               (and 
                                                                   (= x1256 1) 
                                                                   (MS1 x1256 x1245 p8))) 
                                                           (exists ((x1257 Int)) 
                                                               (and 
                                                                   (length p8 x1257) 
                                                                   (MS1 x1257 y14 p8))) 
                                                           (forall ((i59 Int)) 
                                                               (=> 
                                                                   (and 
                                                                       (<= 1 i59) 
                                                                       (forall ((x1258 Int)) 
                                                                           (=> 
                                                                               (length p8 x1258) 
                                                                               (<= i59 (- x1258 1))))) 
                                                                   (exists ((x1259 A) (x1260 A)) 
                                                                       (and 
                                                                           (MS1 i59 x1259 p8) 
                                                                           (exists ((x1261 Int)) 
                                                                               (and 
                                                                                   (= x1261 (+ i59 1)) 
                                                                                   (MS1 x1261 x1260 p8))) 
                                                                           (MS x1259 x1260 r))))) 
                                                           (= x1243 x1245) 
                                                           (= x1244 y14) 
                                                           (forall ((x1262 Int) (x1263 A)) 
                                                               (= 
                                                                   (MS1 x1262 x1263 x1242) 
                                                                   (MS1 x1262 x1263 p8))))))) 
                                           (length x1242 x1241))) 
                                   (<= x1218 x1241))) 
                           (dist x1217 y12 x1218)))))
         :named hyp81))
(assert (! (forall ((x1264 A) (y15 A)) 
               (=> 
                   (and 
                       (MS0 x1264 a) 
                       (MS0 y15 a)) 
                   (forall ((x1265 PZA)) 
                       (= 
                           (exists ((x1266 A) (x1267 A)) 
                               (and 
                                   (= x1266 y15) 
                                   (= x1267 x1264) 
                                   (exists ((x1268 A) (y16 A) (p9 PZA)) 
                                       (and 
                                           (exists ((n76 Int)) 
                                               (and 
                                                   (<= 0 n76) 
                                                   (forall ((x1269 Int) (x1270 A)) 
                                                       (=> 
                                                           (MS1 x1269 x1270 p9) 
                                                           (and 
                                                               (<= 1 x1269) 
                                                               (<= x1269 n76)))) 
                                                   (forall ((x1271 Int) (x1272 A) (x1273 A)) 
                                                       (=> 
                                                           (and 
                                                               (MS1 x1271 x1272 p9) 
                                                               (MS1 x1271 x1273 p9)) 
                                                           (= x1272 x1273))) 
                                                   (forall ((x1274 Int)) 
                                                       (=> 
                                                           (and 
                                                               (<= 1 x1274) 
                                                               (<= x1274 n76)) 
                                                           (exists ((x1275 A)) 
                                                               (MS1 x1274 x1275 p9)))))) 
                                           (forall ((x1276 A)) 
                                               (=> 
                                                   (exists ((x1277 Int)) 
                                                       (MS1 x1277 x1276 p9)) 
                                                   (MS0 x1276 a))) 
                                           (forall ((x1278 Int)) 
                                               (=> 
                                                   (length p9 x1278) 
                                                   (< 1 x1278))) 
                                           (exists ((x1279 Int)) 
                                               (and 
                                                   (= x1279 1) 
                                                   (MS1 x1279 x1268 p9))) 
                                           (exists ((x1280 Int)) 
                                               (and 
                                                   (length p9 x1280) 
                                                   (MS1 x1280 y16 p9))) 
                                           (forall ((i60 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i60) 
                                                       (forall ((x1281 Int)) 
                                                           (=> 
                                                               (length p9 x1281) 
                                                               (<= i60 (- x1281 1))))) 
                                                   (exists ((x1282 A) (x1283 A)) 
                                                       (and 
                                                           (MS1 i60 x1282 p9) 
                                                           (exists ((x1284 Int)) 
                                                               (and 
                                                                   (= x1284 (+ i60 1)) 
                                                                   (MS1 x1284 x1283 p9))) 
                                                           (MS x1282 x1283 r))))) 
                                           (= x1266 x1268) 
                                           (= x1267 y16) 
                                           (forall ((x1285 Int) (x1286 A)) 
                                               (= 
                                                   (MS1 x1285 x1286 x1265) 
                                                   (MS1 x1285 x1286 p9))))))) 
                           (exists ((x1287 PZA)) 
                               (and 
                                   (exists ((x1288 A) (x1289 A)) 
                                       (and 
                                           (= x1288 x1264) 
                                           (= x1289 y15) 
                                           (exists ((x1290 A) (y17 A) (p10 PZA)) 
                                               (and 
                                                   (exists ((n77 Int)) 
                                                       (and 
                                                           (<= 0 n77) 
                                                           (forall ((x1291 Int) (x1292 A)) 
                                                               (=> 
                                                                   (MS1 x1291 x1292 p10) 
                                                                   (and 
                                                                       (<= 1 x1291) 
                                                                       (<= x1291 n77)))) 
                                                           (forall ((x1293 Int) (x1294 A) (x1295 A)) 
                                                               (=> 
                                                                   (and 
                                                                       (MS1 x1293 x1294 p10) 
                                                                       (MS1 x1293 x1295 p10)) 
                                                                   (= x1294 x1295))) 
                                                           (forall ((x1296 Int)) 
                                                               (=> 
                                                                   (and 
                                                                       (<= 1 x1296) 
                                                                       (<= x1296 n77)) 
                                                                   (exists ((x1297 A)) 
                                                                       (MS1 x1296 x1297 p10)))))) 
                                                   (forall ((x1298 A)) 
                                                       (=> 
                                                           (exists ((x1299 Int)) 
                                                               (MS1 x1299 x1298 p10)) 
                                                           (MS0 x1298 a))) 
                                                   (forall ((x1300 Int)) 
                                                       (=> 
                                                           (length p10 x1300) 
                                                           (< 1 x1300))) 
                                                   (exists ((x1301 Int)) 
                                                       (and 
                                                           (= x1301 1) 
                                                           (MS1 x1301 x1290 p10))) 
                                                   (exists ((x1302 Int)) 
                                                       (and 
                                                           (length p10 x1302) 
                                                           (MS1 x1302 y17 p10))) 
                                                   (forall ((i61 Int)) 
                                                       (=> 
                                                           (and 
                                                               (<= 1 i61) 
                                                               (forall ((x1303 Int)) 
                                                                   (=> 
                                                                       (length p10 x1303) 
                                                                       (<= i61 (- x1303 1))))) 
                                                           (exists ((x1304 A) (x1305 A)) 
                                                               (and 
                                                                   (MS1 i61 x1304 p10) 
                                                                   (exists ((x1306 Int)) 
                                                                       (and 
                                                                           (= x1306 (+ i61 1)) 
                                                                           (MS1 x1306 x1305 p10))) 
                                                                   (MS x1304 x1305 r))))) 
                                                   (= x1288 x1290) 
                                                   (= x1289 y17) 
                                                   (forall ((x1307 Int) (x1308 A)) 
                                                       (= 
                                                           (MS1 x1307 x1308 x1287) 
                                                           (MS1 x1307 x1308 p10))))))) 
                                   (exists ((s59 PZA)) 
                                       (and 
                                           (exists ((n78 Int)) 
                                               (and 
                                                   (<= 0 n78) 
                                                   (forall ((x1309 Int) (x1310 A)) 
                                                       (=> 
                                                           (MS1 x1309 x1310 s59) 
                                                           (and 
                                                               (<= 1 x1309) 
                                                               (<= x1309 n78)))) 
                                                   (forall ((x1311 Int) (x1312 A) (x1313 A)) 
                                                       (=> 
                                                           (and 
                                                               (MS1 x1311 x1312 s59) 
                                                               (MS1 x1311 x1313 s59)) 
                                                           (= x1312 x1313))) 
                                                   (forall ((x1314 Int)) 
                                                       (=> 
                                                           (and 
                                                               (<= 1 x1314) 
                                                               (<= x1314 n78)) 
                                                           (exists ((x1315 A)) 
                                                               (MS1 x1314 x1315 s59)))))) 
                                           (forall ((x1316 Int) (x1317 A)) 
                                               (= 
                                                   (MS1 x1316 x1317 x1287) 
                                                   (MS1 x1316 x1317 s59))) 
                                           (forall ((x1318 Int) (x1319 A)) 
                                               (= 
                                                   (MS1 x1318 x1319 x1265) 
                                                   (exists ((i62 Int)) 
                                                       (and 
                                                           (<= 1 i62) 
                                                           (forall ((x1320 Int)) 
                                                               (=> 
                                                                   (length s59 x1320) 
                                                                   (<= i62 x1320))) 
                                                           (= x1318 i62) 
                                                           (exists ((x1321 Int)) 
                                                               (and 
                                                                   (forall ((x1322 Int)) 
                                                                       (=> 
                                                                           (length s59 x1322) 
                                                                           (= x1321 (+ (- x1322 i62) 1)))) 
                                                                   (MS1 x1321 x1319 s59)))))))))))))))
         :named hyp82))
(assert (! (forall ((x1323 A) (y18 A) (p11 PZA)) 
               (=> 
                   (and 
                       (exists ((n79 Int)) 
                           (and 
                               (<= 0 n79) 
                               (forall ((x1324 Int) (x1325 A)) 
                                   (=> 
                                       (MS1 x1324 x1325 p11) 
                                       (and 
                                           (<= 1 x1324) 
                                           (<= x1324 n79)))) 
                               (forall ((x1326 Int) (x1327 A) (x1328 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x1326 x1327 p11) 
                                           (MS1 x1326 x1328 p11)) 
                                       (= x1327 x1328))) 
                               (forall ((x1329 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x1329) 
                                           (<= x1329 n79)) 
                                       (exists ((x1330 A)) 
                                           (MS1 x1329 x1330 p11)))))) 
                       (forall ((x1331 A)) 
                           (=> 
                               (exists ((x1332 Int)) 
                                   (MS1 x1332 x1331 p11)) 
                               (MS0 x1331 a))) 
                       (forall ((x1333 Int)) 
                           (=> 
                               (length p11 x1333) 
                               (< 1 x1333))) 
                       (exists ((x1334 Int)) 
                           (and 
                               (= x1334 1) 
                               (MS1 x1334 x1323 p11))) 
                       (exists ((x1335 Int)) 
                           (and 
                               (length p11 x1335) 
                               (MS1 x1335 y18 p11))) 
                       (forall ((i63 Int)) 
                           (=> 
                               (and 
                                   (<= 1 i63) 
                                   (forall ((x1336 Int)) 
                                       (=> 
                                           (length p11 x1336) 
                                           (<= i63 (- x1336 1))))) 
                               (exists ((x1337 A) (x1338 A)) 
                                   (and 
                                       (MS1 i63 x1337 p11) 
                                       (exists ((x1339 Int)) 
                                           (and 
                                               (= x1339 (+ i63 1)) 
                                               (MS1 x1339 x1338 p11))) 
                                       (MS x1337 x1338 r)))))) 
                   (and 
                       (exists ((n80 Int)) 
                           (and 
                               (<= 0 n80) 
                               (forall ((x1340 Int) (x1341 A)) 
                                   (=> 
                                       (exists ((i64 Int)) 
                                           (and 
                                               (<= 1 i64) 
                                               (forall ((x1342 Int)) 
                                                   (=> 
                                                       (length p11 x1342) 
                                                       (<= i64 x1342))) 
                                               (= x1340 i64) 
                                               (exists ((x1343 Int)) 
                                                   (and 
                                                       (forall ((x1344 Int)) 
                                                           (=> 
                                                               (length p11 x1344) 
                                                               (= x1343 (+ (- x1344 i64) 1)))) 
                                                       (MS1 x1343 x1341 p11))))) 
                                       (and 
                                           (<= 1 x1340) 
                                           (<= x1340 n80)))) 
                               (forall ((x1345 Int) (x1346 A) (x1347 A)) 
                                   (=> 
                                       (and 
                                           (exists ((i65 Int)) 
                                               (and 
                                                   (<= 1 i65) 
                                                   (forall ((x1348 Int)) 
                                                       (=> 
                                                           (length p11 x1348) 
                                                           (<= i65 x1348))) 
                                                   (= x1345 i65) 
                                                   (exists ((x1349 Int)) 
                                                       (and 
                                                           (forall ((x1350 Int)) 
                                                               (=> 
                                                                   (length p11 x1350) 
                                                                   (= x1349 (+ (- x1350 i65) 1)))) 
                                                           (MS1 x1349 x1346 p11))))) 
                                           (exists ((i66 Int)) 
                                               (and 
                                                   (<= 1 i66) 
                                                   (forall ((x1351 Int)) 
                                                       (=> 
                                                           (length p11 x1351) 
                                                           (<= i66 x1351))) 
                                                   (= x1345 i66) 
                                                   (exists ((x1352 Int)) 
                                                       (and 
                                                           (forall ((x1353 Int)) 
                                                               (=> 
                                                                   (length p11 x1353) 
                                                                   (= x1352 (+ (- x1353 i66) 1)))) 
                                                           (MS1 x1352 x1347 p11)))))) 
                                       (= x1346 x1347))) 
                               (forall ((x1354 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x1354) 
                                           (<= x1354 n80)) 
                                       (exists ((x1355 A) (i67 Int)) 
                                           (and 
                                               (<= 1 i67) 
                                               (forall ((x1356 Int)) 
                                                   (=> 
                                                       (length p11 x1356) 
                                                       (<= i67 x1356))) 
                                               (= x1354 i67) 
                                               (exists ((x1357 Int)) 
                                                   (and 
                                                       (forall ((x1358 Int)) 
                                                           (=> 
                                                               (length p11 x1358) 
                                                               (= x1357 (+ (- x1358 i67) 1)))) 
                                                       (MS1 x1357 x1355 p11))))))))) 
                       (forall ((i68 Int)) 
                           (=> 
                               (and 
                                   (<= 1 i68) 
                                   (forall ((x1359 Int)) 
                                       (=> 
                                           (length p11 x1359) 
                                           (<= i68 x1359)))) 
                               (exists ((x1360 A)) 
                                   (and 
                                       (exists ((x1361 Int)) 
                                           (and 
                                               (forall ((x1362 Int)) 
                                                   (=> 
                                                       (length p11 x1362) 
                                                       (= x1361 (+ (- x1362 i68) 1)))) 
                                               (MS1 x1361 x1360 p11))) 
                                       (MS0 x1360 a))))) 
                       (forall ((x1363 Int)) 
                           (=> 
                               (exists ((x1364 PZA)) 
                                   (and 
                                       (forall ((x1365 Int) (x1366 A)) 
                                           (= 
                                               (MS1 x1365 x1366 x1364) 
                                               (exists ((i69 Int)) 
                                                   (and 
                                                       (<= 1 i69) 
                                                       (forall ((x1367 Int)) 
                                                           (=> 
                                                               (length p11 x1367) 
                                                               (<= i69 x1367))) 
                                                       (= x1365 i69) 
                                                       (exists ((x1368 Int)) 
                                                           (and 
                                                               (forall ((x1369 Int)) 
                                                                   (=> 
                                                                       (length p11 x1369) 
                                                                       (= x1368 (+ (- x1369 i69) 1)))) 
                                                               (MS1 x1368 x1366 p11))))))) 
                                       (length x1364 x1363))) 
                               (< 1 x1363))) 
                       (exists ((x1370 Int)) 
                           (and 
                               (forall ((x1371 Int)) 
                                   (=> 
                                       (length p11 x1371) 
                                       (= x1370 (+ (- x1371 1) 1)))) 
                               (MS1 x1370 y18 p11))) 
                       (exists ((x1372 Int)) 
                           (and 
                               (forall ((x1373 Int) (x1374 Int)) 
                                   (=> 
                                       (and 
                                           (length p11 x1374) 
                                           (exists ((x1375 PZA)) 
                                               (and 
                                                   (forall ((x1376 Int) (x1377 A)) 
                                                       (= 
                                                           (MS1 x1376 x1377 x1375) 
                                                           (exists ((i70 Int)) 
                                                               (and 
                                                                   (<= 1 i70) 
                                                                   (forall ((x1378 Int)) 
                                                                       (=> 
                                                                           (length p11 x1378) 
                                                                           (<= i70 x1378))) 
                                                                   (= x1376 i70) 
                                                                   (exists ((x1379 Int)) 
                                                                       (and 
                                                                           (forall ((x1380 Int)) 
                                                                               (=> 
                                                                                   (length p11 x1380) 
                                                                                   (= x1379 (+ (- x1380 i70) 1)))) 
                                                                           (MS1 x1379 x1377 p11))))))) 
                                                   (length x1375 x1373)))) 
                                       (= x1372 (+ (- x1374 x1373) 1)))) 
                               (MS1 x1372 x1323 p11))) 
                       (forall ((i71 Int)) 
                           (=> 
                               (and 
                                   (<= 1 i71) 
                                   (forall ((x1381 Int)) 
                                       (=> 
                                           (exists ((x1382 PZA)) 
                                               (and 
                                                   (forall ((x1383 Int) (x1384 A)) 
                                                       (= 
                                                           (MS1 x1383 x1384 x1382) 
                                                           (exists ((i72 Int)) 
                                                               (and 
                                                                   (<= 1 i72) 
                                                                   (forall ((x1385 Int)) 
                                                                       (=> 
                                                                           (length p11 x1385) 
                                                                           (<= i72 x1385))) 
                                                                   (= x1383 i72) 
                                                                   (exists ((x1386 Int)) 
                                                                       (and 
                                                                           (forall ((x1387 Int)) 
                                                                               (=> 
                                                                                   (length p11 x1387) 
                                                                                   (= x1386 (+ (- x1387 i72) 1)))) 
                                                                           (MS1 x1386 x1384 p11))))))) 
                                                   (length x1382 x1381))) 
                                           (<= i71 (- x1381 1))))) 
                               (exists ((x1388 A) (x1389 A)) 
                                   (and 
                                       (exists ((x1390 Int)) 
                                           (and 
                                               (forall ((x1391 Int)) 
                                                   (=> 
                                                       (length p11 x1391) 
                                                       (= x1390 (+ (- x1391 i71) 1)))) 
                                               (MS1 x1390 x1388 p11))) 
                                       (exists ((x1392 Int)) 
                                           (and 
                                               (forall ((x1393 Int)) 
                                                   (=> 
                                                       (length p11 x1393) 
                                                       (= x1392 (+ (- x1393 (+ i71 1)) 1)))) 
                                               (MS1 x1392 x1389 p11))) 
                                       (MS x1388 x1389 r))))))))
         :named hyp83))
(assert (! (not 
               (exists ((x1394 Int)) 
                   (dist y x x1394)))
         :named goal))
(check-sat)
(exit)

