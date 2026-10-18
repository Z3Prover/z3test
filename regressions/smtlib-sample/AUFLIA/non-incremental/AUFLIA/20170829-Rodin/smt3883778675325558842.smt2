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
(declare-fun length (PZA Int) Bool)
(declare-fun path (A A PZA) Bool)
(declare-fun seq (PZA) Bool)
(declare-fun a () PA)
(declare-fun c () PAA)
(declare-fun candidate () PA)
(declare-fun i () Int)
(declare-fun r () PAA)
(declare-fun s1 () PZA)
(declare-fun s2 () PZA)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x762 A) (x763 A)) 
            (exists ((X PAA)) 
                (and 
                    (MS x762 x763 X) 
                    (forall ((y3 A) (y4 A)) 
                        (=> 
                            (MS y3 y4 X) 
                            (and 
                                (= y3 x762) 
                                (= y4 x763))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x764 A)) 
            (exists ((X0 PA)) 
                (and 
                    (MS0 x764 X0) 
                    (forall ((y5 A)) 
                        (=> 
                            (MS0 y5 X0) 
                            (= y5 x764)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x765 Int)) 
            (exists ((X1 PZ)) 
                (and 
                    (MS2 x765 X1) 
                    (forall ((y6 Int)) 
                        (=> 
                            (MS2 y6 X1) 
                            (= y6 x765)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x766 Int) (x767 A)) 
            (exists ((X2 PZA)) 
                (and 
                    (MS1 x766 x767 X2) 
                    (forall ((y7 Int) (y8 A)) 
                        (=> 
                            (MS1 y7 y8 X2) 
                            (and 
                                (= y7 x766) 
                                (= y8 x767))))))))
(assert (! (forall ((x A) (x0 A)) 
               (=> 
                   (MS x x0 r) 
                   (and 
                       (MS0 x a) 
                       (MS0 x0 a))))
         :named hyp1))
(assert (! (not 
               (forall ((x1 A) (x2 A)) 
                   (not 
                       (MS x1 x2 r))))
         :named hyp2))
(assert (! (forall ((x3 A) (x4 A)) 
               (=> 
                   (MS x3 x4 c) 
                   (and 
                       (MS0 x3 a) 
                       (MS0 x4 a))))
         :named hyp3))
(assert (! (forall ((x5 A) (x6 A)) 
               (=> 
                   (MS x5 x6 r) 
                   (MS x5 x6 c)))
         :named hyp4))
(assert (! (forall ((x7 A) (x8 A)) 
               (=> 
                   (exists ((x9 A)) 
                       (and 
                           (MS x7 x9 c) 
                           (MS x9 x8 r))) 
                   (MS x7 x8 c)))
         :named hyp5))
(assert (! (forall ((s PAA)) 
               (=> 
                   (and 
                       (forall ((x10 A) (x11 A)) 
                           (=> 
                               (MS x10 x11 s) 
                               (and 
                                   (MS0 x10 a) 
                                   (MS0 x11 a)))) 
                       (forall ((x12 A) (x13 A)) 
                           (=> 
                               (MS x12 x13 r) 
                               (MS x12 x13 s))) 
                       (forall ((x14 A) (x15 A)) 
                           (=> 
                               (exists ((x16 A)) 
                                   (and 
                                       (MS x14 x16 s) 
                                       (MS x16 x15 r))) 
                               (MS x14 x15 s)))) 
                   (forall ((x17 A) (x18 A)) 
                       (=> 
                           (MS x17 x18 c) 
                           (MS x17 x18 s)))))
         :named hyp6))
(assert (! (forall ((x19 A)) 
               (= 
                   (exists ((x20 A)) 
                       (MS x19 x20 r)) 
                   (MS0 x19 a)))
         :named hyp7))
(assert (! (forall ((x21 A)) 
               (= 
                   (exists ((x22 A)) 
                       (MS x21 x22 c)) 
                   (MS0 x21 a)))
         :named hyp8))
(assert (! (forall ((x23 A)) 
               (=> 
                   (exists ((x24 A)) 
                       (MS x23 x24 r)) 
                   (exists ((x25 A)) 
                       (MS x23 x25 c))))
         :named hyp9))
(assert (! (forall ((x26 A) (x27 A)) 
               (= 
                   (MS x26 x27 c) 
                   (or 
                       (MS x26 x27 r) 
                       (exists ((x28 A)) 
                           (and 
                               (MS x26 x28 c) 
                               (MS x28 x27 r))))))
         :named hyp10))
(assert (! (forall ((x29 A) (y A)) 
               (=> 
                   (and 
                       (MS0 x29 a) 
                       (MS0 y a)) 
                   (forall ((s0 PZA) (n Int)) 
                       (=> 
                           (and 
                               (<= 0 n) 
                               (< 1 n) 
                               (forall ((x30 Int) (x31 A)) 
                                   (=> 
                                       (MS1 x30 x31 s0) 
                                       (and 
                                           (<= 1 x30) 
                                           (<= x30 n) 
                                           (MS0 x31 a)))) 
                               (forall ((x32 Int) (x33 A) (x34 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x32 x33 s0) 
                                           (MS1 x32 x34 s0)) 
                                       (= x33 x34))) 
                               (forall ((x35 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x35) 
                                           (<= x35 n)) 
                                       (exists ((x36 A)) 
                                           (MS1 x35 x36 s0))))) 
                           (and 
                               (exists ((x37 A) (x38 Int)) 
                                   (and 
                                       (= x38 1) 
                                       (MS1 x38 x37 s0))) 
                               (forall ((x39 Int) (x40 A) (x41 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x39 x40 s0) 
                                           (MS1 x39 x41 s0)) 
                                       (= x40 x41))) 
                               (=> 
                                   (exists ((x42 Int)) 
                                       (and 
                                           (= x42 1) 
                                           (MS1 x42 x29 s0))) 
                                   (and 
                                       (exists ((x43 A)) 
                                           (MS1 n x43 s0)) 
                                       (=> 
                                           (MS1 n y s0) 
                                           (forall ((i0 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i0) 
                                                       (<= i0 (- n 1))) 
                                                   (and 
                                                       (exists ((x44 A)) 
                                                           (MS1 i0 x44 s0)) 
                                                       (exists ((x45 A) (x46 Int)) 
                                                           (and 
                                                               (= x46 (+ i0 1)) 
                                                               (MS1 x46 x45 s0))))))))))))))
         :named hyp11))
(assert (! (forall ((s3 PZ) (n0 Int)) 
               (=> 
                   (and 
                       (< 1 n0) 
                       (forall ((x47 Int)) 
                           (=> 
                               (MS2 x47 s3) 
                               (and 
                                   (<= 2 x47) 
                                   (<= x47 n0)))) 
                       (exists ((x48 Int)) 
                           (and 
                               (= x48 2) 
                               (MS2 x48 s3))) 
                       (forall ((i1 Int)) 
                           (=> 
                               (and 
                                   (<= 2 i1) 
                                   (<= i1 (- n0 1)) 
                                   (MS2 i1 s3)) 
                               (exists ((x49 Int)) 
                                   (and 
                                       (= x49 (+ i1 1)) 
                                       (MS2 x49 s3)))))) 
                   (forall ((x50 Int)) 
                       (=> 
                           (and 
                               (<= 2 x50) 
                               (<= x50 n0)) 
                           (MS2 x50 s3)))))
         :named hyp12))
(assert (! (forall ((x51 A) (x52 A)) 
               (=> 
                   (exists ((x53 PZA)) 
                       (path x51 x52 x53)) 
                   (MS x51 x52 c)))
         :named hyp13))
(assert (! (forall ((x54 A) (x55 A)) 
               (=> 
                   (MS x54 x55 c) 
                   (exists ((x56 PZA)) 
                       (path x54 x55 x56))))
         :named hyp14))
(assert (! (forall ((x57 A) (x58 A)) 
               (=> 
                   (and 
                       (MS0 x57 a) 
                       (MS0 x58 a)) 
                   (exists ((x59 PZA)) 
                       (path x57 x58 x59))))
         :named hyp15))
(assert (! (forall ((x60 PZA)) 
               (= 
                   (seq x60) 
                   (exists ((s4 PZA)) 
                       (and 
                           (exists ((n1 Int)) 
                               (and 
                                   (<= 0 n1) 
                                   (forall ((x61 Int) (x62 A)) 
                                       (=> 
                                           (MS1 x61 x62 s4) 
                                           (and 
                                               (<= 1 x61) 
                                               (<= x61 n1)))) 
                                   (forall ((x63 Int) (x64 A) (x65 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x63 x64 s4) 
                                               (MS1 x63 x65 s4)) 
                                           (= x64 x65))) 
                                   (forall ((x66 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x66) 
                                               (<= x66 n1)) 
                                           (exists ((x67 A)) 
                                               (MS1 x66 x67 s4)))))) 
                           (forall ((x68 Int) (x69 A)) 
                               (= 
                                   (MS1 x68 x69 x60) 
                                   (MS1 x68 x69 s4)))))))
         :named hyp16))
(assert (! (forall ((n2 Int) (s5 PZA)) 
               (=> 
                   (and 
                       (<= 0 n2) 
                       (forall ((x70 Int) (x71 A)) 
                           (=> 
                               (MS1 x70 x71 s5) 
                               (and 
                                   (<= 1 x70) 
                                   (<= x70 n2)))) 
                       (forall ((x72 Int) (x73 A) (x74 A)) 
                           (=> 
                               (and 
                                   (MS1 x72 x73 s5) 
                                   (MS1 x72 x74 s5)) 
                               (= x73 x74))) 
                       (forall ((x75 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x75) 
                                   (<= x75 n2)) 
                               (exists ((x76 A)) 
                                   (MS1 x75 x76 s5))))) 
                   (seq s5)))
         :named hyp17))
(assert (! (and 
               (forall ((x77 PZA) (x78 Int)) 
                   (=> 
                       (length x77 x78) 
                       (and 
                           (seq x77) 
                           (<= 0 x78)))) 
               (forall ((x79 PZA) (x80 Int) (x81 Int)) 
                   (=> 
                       (and 
                           (length x79 x80) 
                           (length x79 x81)) 
                       (= x80 x81))) 
               (forall ((x82 PZA)) 
                   (=> 
                       (seq x82) 
                       (exists ((x83 Int)) 
                           (length x82 x83)))))
         :named hyp18))
(assert (! (forall ((n3 Int) (s6 PZA)) 
               (=> 
                   (and 
                       (<= 0 n3) 
                       (forall ((x84 Int) (x85 A)) 
                           (=> 
                               (MS1 x84 x85 s6) 
                               (and 
                                   (<= 1 x84) 
                                   (<= x84 n3)))) 
                       (forall ((x86 Int) (x87 A) (x88 A)) 
                           (=> 
                               (and 
                                   (MS1 x86 x87 s6) 
                                   (MS1 x86 x88 s6)) 
                               (= x87 x88))) 
                       (forall ((x89 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x89) 
                                   (<= x89 n3)) 
                               (exists ((x90 A)) 
                                   (MS1 x89 x90 s6))))) 
                   (length s6 n3)))
         :named hyp19))
(assert (! (forall ((s7 PZA)) 
               (=> 
                   (seq s7) 
                   (and 
                       (forall ((x91 Int) (x92 A)) 
                           (=> 
                               (MS1 x91 x92 s7) 
                               (and 
                                   (<= 1 x91) 
                                   (forall ((x93 Int)) 
                                       (=> 
                                           (length s7 x93) 
                                           (<= x91 x93)))))) 
                       (forall ((x94 Int) (x95 A) (x96 A)) 
                           (=> 
                               (and 
                                   (MS1 x94 x95 s7) 
                                   (MS1 x94 x96 s7)) 
                               (= x95 x96))) 
                       (forall ((x97 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x97) 
                                   (forall ((x98 Int)) 
                                       (=> 
                                           (length s7 x98) 
                                           (<= x97 x98)))) 
                               (exists ((x99 A)) 
                                   (MS1 x97 x99 s7)))))))
         :named hyp20))
(assert (! (forall ((x100 PZA) (x101 PZA) (x102 PZA)) 
               (= 
                   (cnc x100 x101 x102) 
                   (exists ((s10 PZA) (s20 PZA)) 
                       (and 
                           (seq s10) 
                           (seq s20) 
                           (forall ((x103 Int) (x104 A)) 
                               (= 
                                   (MS1 x103 x104 x100) 
                                   (MS1 x103 x104 s10))) 
                           (forall ((x105 Int) (x106 A)) 
                               (= 
                                   (MS1 x105 x106 x101) 
                                   (MS1 x105 x106 s20))) 
                           (forall ((x107 Int) (x108 A)) 
                               (= 
                                   (MS1 x107 x108 x102) 
                                   (or 
                                       (exists ((i2 Int)) 
                                           (and 
                                               (<= 1 i2) 
                                               (forall ((x109 Int)) 
                                                   (=> 
                                                       (length s10 x109) 
                                                       (<= i2 x109))) 
                                               (= x107 i2) 
                                               (MS1 i2 x108 s10))) 
                                       (exists ((i3 Int)) 
                                           (and 
                                               (forall ((x110 Int)) 
                                                   (=> 
                                                       (length s10 x110) 
                                                       (<= (+ x110 1) i3))) 
                                               (forall ((x111 Int) (x112 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s10 x112) 
                                                           (length s20 x111)) 
                                                       (<= i3 (+ x112 x111)))) 
                                               (= x107 i3) 
                                               (exists ((x113 Int)) 
                                                   (and 
                                                       (forall ((x114 Int)) 
                                                           (=> 
                                                               (length s10 x114) 
                                                               (= x113 (- i3 x114)))) 
                                                       (MS1 x113 x108 s20))))))))))))
         :named hyp21))
(assert (! (and 
               (forall ((x115 PZA) (x116 PZA) (x117 PZA)) 
                   (=> 
                       (cnc x115 x116 x117) 
                       (and 
                           (seq x115) 
                           (seq x116) 
                           (seq x117)))) 
               (forall ((x118 PZA) (x119 PZA) (x120 PZA) (x121 PZA)) 
                   (=> 
                       (and 
                           (cnc x118 x119 x120) 
                           (cnc x118 x119 x121)) 
                       (forall ((x122 Int) (x123 A)) 
                           (= 
                               (MS1 x122 x123 x120) 
                               (MS1 x122 x123 x121))))) 
               (forall ((x124 PZA) (x125 PZA)) 
                   (=> 
                       (and 
                           (seq x124) 
                           (seq x125)) 
                       (exists ((x126 PZA)) 
                           (cnc x124 x125 x126)))))
         :named hyp22))
(assert (! (forall ((s11 PZA) (s21 PZA)) 
               (=> 
                   (and 
                       (seq s11) 
                       (seq s21)) 
                   (exists ((x127 PZA) (x128 Int)) 
                       (and 
                           (cnc s11 s21 x127) 
                           (forall ((x129 Int) (x130 Int)) 
                               (=> 
                                   (and 
                                       (length s11 x130) 
                                       (length s21 x129)) 
                                   (= x128 (+ x130 x129)))) 
                           (length x127 x128)))))
         :named hyp23))
(assert (! (forall ((s12 PZA) (s22 PZA)) 
               (=> 
                   (and 
                       (seq s12) 
                       (seq s22)) 
                   (forall ((x131 Int)) 
                       (= 
                           (exists ((x132 A) (x133 PZA)) 
                               (and 
                                   (cnc s12 s22 x133) 
                                   (MS1 x131 x132 x133))) 
                           (and 
                               (<= 1 x131) 
                               (forall ((x134 Int) (x135 Int)) 
                                   (=> 
                                       (and 
                                           (length s12 x135) 
                                           (length s22 x134)) 
                                       (<= x131 (+ x135 x134)))))))))
         :named hyp24))
(assert (! (forall ((s13 PZA) (s23 PZA)) 
               (=> 
                   (and 
                       (seq s13) 
                       (seq s23)) 
                   (forall ((x136 A)) 
                       (= 
                           (exists ((x137 Int) (x138 PZA)) 
                               (and 
                                   (cnc s13 s23 x138) 
                                   (MS1 x137 x136 x138))) 
                           (or 
                               (exists ((x139 Int)) 
                                   (MS1 x139 x136 s13)) 
                               (exists ((x140 Int)) 
                                   (MS1 x140 x136 s23)))))))
         :named hyp25))
(assert (! (forall ((x141 A) (x142 A) (x143 PZA)) 
               (= 
                   (path x141 x142 x143) 
                   (exists ((x144 A) (y0 A) (p PZA)) 
                       (and 
                           (MS0 x144 a) 
                           (MS0 y0 a) 
                           (exists ((n4 Int)) 
                               (and 
                                   (<= 0 n4) 
                                   (< 1 n4) 
                                   (forall ((x145 Int) (x146 A)) 
                                       (=> 
                                           (MS1 x145 x146 p) 
                                           (and 
                                               (<= 1 x145) 
                                               (<= x145 n4) 
                                               (MS0 x146 a)))) 
                                   (forall ((x147 Int) (x148 A) (x149 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x147 x148 p) 
                                               (MS1 x147 x149 p)) 
                                           (= x148 x149))) 
                                   (forall ((x150 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x150) 
                                               (<= x150 n4)) 
                                           (exists ((x151 A)) 
                                               (MS1 x150 x151 p)))) 
                                   (exists ((x152 Int)) 
                                       (and 
                                           (= x152 1) 
                                           (MS1 x152 x144 p))) 
                                   (MS1 n4 y0 p) 
                                   (forall ((i4 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 i4) 
                                               (<= i4 (- n4 1))) 
                                           (exists ((x153 A) (x154 A)) 
                                               (and 
                                                   (MS1 i4 x153 p) 
                                                   (exists ((x155 Int)) 
                                                       (and 
                                                           (= x155 (+ i4 1)) 
                                                           (MS1 x155 x154 p))) 
                                                   (MS x153 x154 r))))))) 
                           (= x141 x144) 
                           (= x142 y0) 
                           (forall ((x156 Int) (x157 A)) 
                               (= 
                                   (MS1 x156 x157 x143) 
                                   (MS1 x156 x157 p)))))))
         :named hyp26))
(assert (! (forall ((x158 A)) 
               (= 
                   (MS0 x158 candidate) 
                   (exists ((z A)) 
                       (and 
                           (MS0 z a) 
                           (forall ((x159 A) (y1 A)) 
                               (=> 
                                   (and 
                                       (MS0 x159 a) 
                                       (not 
                                           (= x159 z)) 
                                       (MS0 y1 a) 
                                       (not 
                                           (= y1 z)) 
                                       (not 
                                           (= x159 y1))) 
                                   (exists ((p0 PZA)) 
                                       (and 
                                           (exists ((x160 A) (x161 A)) 
                                               (and 
                                                   (= x160 x159) 
                                                   (= x161 y1) 
                                                   (path x160 x161 p0))) 
                                           (not 
                                               (exists ((x162 Int)) 
                                                   (MS1 x162 z p0))))))) 
                           (= x158 z)))))
         :named hyp27))
(assert (! (forall ((u A)) 
               (=> 
                   (MS0 u candidate) 
                   (forall ((x163 A) (x164 A)) 
                       (=> 
                           (and 
                               (MS0 x163 a) 
                               (not 
                                   (= x163 u)) 
                               (MS0 x164 a) 
                               (not 
                                   (= x164 u)) 
                               (not 
                                   (= x163 x164))) 
                           (exists ((x165 A) (y2 A) (p1 PZA)) 
                               (and 
                                   (MS0 x165 a) 
                                   (not 
                                       (= x165 u)) 
                                   (MS0 y2 a) 
                                   (not 
                                       (= y2 u)) 
                                   (not 
                                       (= x165 y2)) 
                                   (exists ((n5 Int)) 
                                       (and 
                                           (<= 0 n5) 
                                           (< 1 n5) 
                                           (forall ((x166 Int) (x167 A)) 
                                               (=> 
                                                   (MS1 x166 x167 p1) 
                                                   (and 
                                                       (<= 1 x166) 
                                                       (<= x166 n5) 
                                                       (MS0 x167 a) 
                                                       (not 
                                                           (= x167 u))))) 
                                           (forall ((x168 Int) (x169 A) (x170 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x168 x169 p1) 
                                                       (MS1 x168 x170 p1)) 
                                                   (= x169 x170))) 
                                           (forall ((x171 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x171) 
                                                       (<= x171 n5)) 
                                                   (exists ((x172 A)) 
                                                       (MS1 x171 x172 p1)))) 
                                           (exists ((x173 Int)) 
                                               (and 
                                                   (= x173 1) 
                                                   (MS1 x173 x165 p1))) 
                                           (MS1 n5 y2 p1) 
                                           (forall ((i5 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i5) 
                                                       (<= i5 (- n5 1))) 
                                                   (exists ((x174 A) (x175 A)) 
                                                       (and 
                                                           (MS1 i5 x174 p1) 
                                                           (exists ((x176 Int)) 
                                                               (and 
                                                                   (= x176 (+ i5 1)) 
                                                                   (MS1 x176 x175 p1))) 
                                                           (MS x174 x175 r))))))) 
                                   (= x163 x165) 
                                   (= x164 y2)))))))
         :named hyp28))
(assert (! (forall ((s14 PZA) (s24 PZA)) 
               (=> 
                   (and 
                       (seq s14) 
                       (seq s24)) 
                   (and 
                       (exists ((x177 Int)) 
                           (length s14 x177)) 
                       (forall ((x178 PZA) (x179 Int) (x180 Int)) 
                           (=> 
                               (and 
                                   (length x178 x179) 
                                   (length x178 x180)) 
                               (= x179 x180))) 
                       (forall ((i6 Int)) 
                           (=> 
                               (and 
                                   (<= 1 i6) 
                                   (forall ((x181 Int)) 
                                       (=> 
                                           (length s14 x181) 
                                           (<= i6 x181)))) 
                               (and 
                                   (exists ((x182 A)) 
                                       (MS1 i6 x182 s14)) 
                                   (forall ((x183 Int) (x184 A) (x185 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x183 x184 s14) 
                                               (MS1 x183 x185 s14)) 
                                           (= x184 x185)))))) 
                       (exists ((x186 Int)) 
                           (length s24 x186)) 
                       (forall ((i7 Int)) 
                           (=> 
                               (and 
                                   (forall ((x187 Int)) 
                                       (=> 
                                           (length s14 x187) 
                                           (<= (+ x187 1) i7))) 
                                   (forall ((x188 Int) (x189 Int)) 
                                       (=> 
                                           (and 
                                               (length s14 x189) 
                                               (length s24 x188)) 
                                           (<= i7 (+ x189 x188))))) 
                               (and 
                                   (exists ((x190 A) (x191 Int)) 
                                       (and 
                                           (forall ((x192 Int)) 
                                               (=> 
                                                   (length s14 x192) 
                                                   (= x191 (- i7 x192)))) 
                                           (MS1 x191 x190 s24))) 
                                   (forall ((x193 Int) (x194 A) (x195 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x193 x194 s24) 
                                               (MS1 x193 x195 s24)) 
                                           (= x194 x195)))))))))
         :named hyp29))
(assert (! (forall ((x196 A) (x197 A)) 
               (=> 
                   (and 
                       (MS0 x196 a) 
                       (MS0 x197 a)) 
                   (MS x196 x197 c)))
         :named hyp30))
(assert (! (not 
               (forall ((x198 A)) 
                   (MS0 x198 a)))
         :named hyp31))
(assert (! (forall ((s15 PZA) (s25 PZA) (b PA)) 
               (=> 
                   (and 
                       (seq s15) 
                       (seq s25) 
                       (forall ((x199 A)) 
                           (=> 
                               (exists ((x200 Int)) 
                                   (MS1 x200 x199 s15)) 
                               (MS0 x199 b))) 
                       (forall ((x201 A)) 
                           (=> 
                               (exists ((x202 Int)) 
                                   (MS1 x202 x201 s25)) 
                               (MS0 x201 b)))) 
                   (and 
                       (forall ((x203 Int) (x204 A)) 
                           (=> 
                               (exists ((x205 PZA)) 
                                   (and 
                                       (cnc s15 s25 x205) 
                                       (MS1 x203 x204 x205))) 
                               (and 
                                   (<= 1 x203) 
                                   (forall ((x206 Int) (x207 Int)) 
                                       (=> 
                                           (and 
                                               (length s15 x207) 
                                               (length s25 x206)) 
                                           (<= x203 (+ x207 x206)))) 
                                   (MS0 x204 b)))) 
                       (forall ((x208 Int) (x209 A) (x210 A)) 
                           (=> 
                               (and 
                                   (exists ((x211 PZA)) 
                                       (and 
                                           (cnc s15 s25 x211) 
                                           (MS1 x208 x209 x211))) 
                                   (exists ((x212 PZA)) 
                                       (and 
                                           (cnc s15 s25 x212) 
                                           (MS1 x208 x210 x212)))) 
                               (= x209 x210))) 
                       (forall ((x213 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x213) 
                                   (forall ((x214 Int) (x215 Int)) 
                                       (=> 
                                           (and 
                                               (length s15 x215) 
                                               (length s25 x214)) 
                                           (<= x213 (+ x215 x214))))) 
                               (exists ((x216 A) (x217 PZA)) 
                                   (and 
                                       (cnc s15 s25 x217) 
                                       (MS1 x213 x216 x217))))))))
         :named hyp32))
(assert (! (seq s1)
         :named hyp33))
(assert (! (seq s2)
         :named hyp34))
(assert (! (and 
               (<= 1 i) 
               (forall ((x218 Int)) 
                   (=> 
                       (length s1 x218) 
                       (<= i x218))))
         :named hyp35))
(assert (! (and 
               (forall ((x219 PZA) (x220 Int)) 
                   (=> 
                       (length x219 x220) 
                       (and 
                           (exists ((s8 PZA)) 
                               (and 
                                   (exists ((n6 Int)) 
                                       (and 
                                           (<= 0 n6) 
                                           (forall ((x221 Int) (x222 A)) 
                                               (=> 
                                                   (MS1 x221 x222 s8) 
                                                   (and 
                                                       (<= 1 x221) 
                                                       (<= x221 n6)))) 
                                           (forall ((x223 Int) (x224 A) (x225 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x223 x224 s8) 
                                                       (MS1 x223 x225 s8)) 
                                                   (= x224 x225))) 
                                           (forall ((x226 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x226) 
                                                       (<= x226 n6)) 
                                                   (exists ((x227 A)) 
                                                       (MS1 x226 x227 s8)))))) 
                                   (forall ((x228 Int) (x229 A)) 
                                       (= 
                                           (MS1 x228 x229 x219) 
                                           (MS1 x228 x229 s8))))) 
                           (<= 0 x220)))) 
               (forall ((x230 PZA) (x231 Int) (x232 Int)) 
                   (=> 
                       (and 
                           (length x230 x231) 
                           (length x230 x232)) 
                       (= x231 x232))) 
               (forall ((x233 PZA)) 
                   (=> 
                       (exists ((s9 PZA)) 
                           (and 
                               (exists ((n7 Int)) 
                                   (and 
                                       (<= 0 n7) 
                                       (forall ((x234 Int) (x235 A)) 
                                           (=> 
                                               (MS1 x234 x235 s9) 
                                               (and 
                                                   (<= 1 x234) 
                                                   (<= x234 n7)))) 
                                       (forall ((x236 Int) (x237 A) (x238 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x236 x237 s9) 
                                                   (MS1 x236 x238 s9)) 
                                               (= x237 x238))) 
                                       (forall ((x239 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x239) 
                                                   (<= x239 n7)) 
                                               (exists ((x240 A)) 
                                                   (MS1 x239 x240 s9)))))) 
                               (forall ((x241 Int) (x242 A)) 
                                   (= 
                                       (MS1 x241 x242 x233) 
                                       (MS1 x241 x242 s9))))) 
                       (exists ((x243 Int)) 
                           (length x233 x243)))))
         :named hyp36))
(assert (! (and 
               (forall ((x244 PZA) (x245 PZA) (x246 PZA)) 
                   (=> 
                       (cnc x244 x245 x246) 
                       (and 
                           (exists ((s16 PZA)) 
                               (and 
                                   (exists ((n8 Int)) 
                                       (and 
                                           (<= 0 n8) 
                                           (forall ((x247 Int) (x248 A)) 
                                               (=> 
                                                   (MS1 x247 x248 s16) 
                                                   (and 
                                                       (<= 1 x247) 
                                                       (<= x247 n8)))) 
                                           (forall ((x249 Int) (x250 A) (x251 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x249 x250 s16) 
                                                       (MS1 x249 x251 s16)) 
                                                   (= x250 x251))) 
                                           (forall ((x252 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x252) 
                                                       (<= x252 n8)) 
                                                   (exists ((x253 A)) 
                                                       (MS1 x252 x253 s16)))))) 
                                   (forall ((x254 Int) (x255 A)) 
                                       (= 
                                           (MS1 x254 x255 x244) 
                                           (MS1 x254 x255 s16))))) 
                           (exists ((s17 PZA)) 
                               (and 
                                   (exists ((n9 Int)) 
                                       (and 
                                           (<= 0 n9) 
                                           (forall ((x256 Int) (x257 A)) 
                                               (=> 
                                                   (MS1 x256 x257 s17) 
                                                   (and 
                                                       (<= 1 x256) 
                                                       (<= x256 n9)))) 
                                           (forall ((x258 Int) (x259 A) (x260 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x258 x259 s17) 
                                                       (MS1 x258 x260 s17)) 
                                                   (= x259 x260))) 
                                           (forall ((x261 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x261) 
                                                       (<= x261 n9)) 
                                                   (exists ((x262 A)) 
                                                       (MS1 x261 x262 s17)))))) 
                                   (forall ((x263 Int) (x264 A)) 
                                       (= 
                                           (MS1 x263 x264 x245) 
                                           (MS1 x263 x264 s17))))) 
                           (exists ((s18 PZA)) 
                               (and 
                                   (exists ((n10 Int)) 
                                       (and 
                                           (<= 0 n10) 
                                           (forall ((x265 Int) (x266 A)) 
                                               (=> 
                                                   (MS1 x265 x266 s18) 
                                                   (and 
                                                       (<= 1 x265) 
                                                       (<= x265 n10)))) 
                                           (forall ((x267 Int) (x268 A) (x269 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x267 x268 s18) 
                                                       (MS1 x267 x269 s18)) 
                                                   (= x268 x269))) 
                                           (forall ((x270 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x270) 
                                                       (<= x270 n10)) 
                                                   (exists ((x271 A)) 
                                                       (MS1 x270 x271 s18)))))) 
                                   (forall ((x272 Int) (x273 A)) 
                                       (= 
                                           (MS1 x272 x273 x246) 
                                           (MS1 x272 x273 s18)))))))) 
               (forall ((x274 PZA) (x275 PZA) (x276 PZA) (x277 PZA)) 
                   (=> 
                       (and 
                           (cnc x274 x275 x276) 
                           (cnc x274 x275 x277)) 
                       (forall ((x278 Int) (x279 A)) 
                           (= 
                               (MS1 x278 x279 x276) 
                               (MS1 x278 x279 x277))))) 
               (forall ((x280 PZA) (x281 PZA)) 
                   (=> 
                       (and 
                           (exists ((s19 PZA)) 
                               (and 
                                   (exists ((n11 Int)) 
                                       (and 
                                           (<= 0 n11) 
                                           (forall ((x282 Int) (x283 A)) 
                                               (=> 
                                                   (MS1 x282 x283 s19) 
                                                   (and 
                                                       (<= 1 x282) 
                                                       (<= x282 n11)))) 
                                           (forall ((x284 Int) (x285 A) (x286 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x284 x285 s19) 
                                                       (MS1 x284 x286 s19)) 
                                                   (= x285 x286))) 
                                           (forall ((x287 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x287) 
                                                       (<= x287 n11)) 
                                                   (exists ((x288 A)) 
                                                       (MS1 x287 x288 s19)))))) 
                                   (forall ((x289 Int) (x290 A)) 
                                       (= 
                                           (MS1 x289 x290 x280) 
                                           (MS1 x289 x290 s19))))) 
                           (exists ((s26 PZA)) 
                               (and 
                                   (exists ((n12 Int)) 
                                       (and 
                                           (<= 0 n12) 
                                           (forall ((x291 Int) (x292 A)) 
                                               (=> 
                                                   (MS1 x291 x292 s26) 
                                                   (and 
                                                       (<= 1 x291) 
                                                       (<= x291 n12)))) 
                                           (forall ((x293 Int) (x294 A) (x295 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x293 x294 s26) 
                                                       (MS1 x293 x295 s26)) 
                                                   (= x294 x295))) 
                                           (forall ((x296 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x296) 
                                                       (<= x296 n12)) 
                                                   (exists ((x297 A)) 
                                                       (MS1 x296 x297 s26)))))) 
                                   (forall ((x298 Int) (x299 A)) 
                                       (= 
                                           (MS1 x298 x299 x281) 
                                           (MS1 x298 x299 s26)))))) 
                       (exists ((x300 PZA)) 
                           (cnc x280 x281 x300)))))
         :named hyp37))
(assert (! (forall ((n13 Int) (s27 PZA)) 
               (=> 
                   (and 
                       (<= 0 n13) 
                       (forall ((x301 Int) (x302 A)) 
                           (=> 
                               (MS1 x301 x302 s27) 
                               (and 
                                   (<= 1 x301) 
                                   (<= x301 n13)))) 
                       (forall ((x303 Int) (x304 A) (x305 A)) 
                           (=> 
                               (and 
                                   (MS1 x303 x304 s27) 
                                   (MS1 x303 x305 s27)) 
                               (= x304 x305))) 
                       (forall ((x306 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x306) 
                                   (<= x306 n13)) 
                               (exists ((x307 A)) 
                                   (MS1 x306 x307 s27))))) 
                   (exists ((n14 Int)) 
                       (and 
                           (<= 0 n14) 
                           (forall ((x308 Int) (x309 A)) 
                               (=> 
                                   (MS1 x308 x309 s27) 
                                   (and 
                                       (<= 1 x308) 
                                       (<= x308 n14)))) 
                           (forall ((x310 Int) (x311 A) (x312 A)) 
                               (=> 
                                   (and 
                                       (MS1 x310 x311 s27) 
                                       (MS1 x310 x312 s27)) 
                                   (= x311 x312))) 
                           (forall ((x313 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x313) 
                                       (<= x313 n14)) 
                                   (exists ((x314 A)) 
                                       (MS1 x313 x314 s27))))))))
         :named hyp38))
(assert (! (forall ((s28 PZA)) 
               (=> 
                   (exists ((n15 Int)) 
                       (and 
                           (<= 0 n15) 
                           (forall ((x315 Int) (x316 A)) 
                               (=> 
                                   (MS1 x315 x316 s28) 
                                   (and 
                                       (<= 1 x315) 
                                       (<= x315 n15)))) 
                           (forall ((x317 Int) (x318 A) (x319 A)) 
                               (=> 
                                   (and 
                                       (MS1 x317 x318 s28) 
                                       (MS1 x317 x319 s28)) 
                                   (= x318 x319))) 
                           (forall ((x320 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 x320) 
                                       (<= x320 n15)) 
                                   (exists ((x321 A)) 
                                       (MS1 x320 x321 s28)))))) 
                   (and 
                       (forall ((x322 Int) (x323 A)) 
                           (=> 
                               (MS1 x322 x323 s28) 
                               (and 
                                   (<= 1 x322) 
                                   (forall ((x324 Int)) 
                                       (=> 
                                           (length s28 x324) 
                                           (<= x322 x324)))))) 
                       (forall ((x325 Int) (x326 A) (x327 A)) 
                           (=> 
                               (and 
                                   (MS1 x325 x326 s28) 
                                   (MS1 x325 x327 s28)) 
                               (= x326 x327))) 
                       (forall ((x328 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x328) 
                                   (forall ((x329 Int)) 
                                       (=> 
                                           (length s28 x329) 
                                           (<= x328 x329)))) 
                               (exists ((x330 A)) 
                                   (MS1 x328 x330 s28)))))))
         :named hyp39))
(assert (! (forall ((x331 PZA) (x332 PZA) (x333 PZA)) 
               (= 
                   (cnc x331 x332 x333) 
                   (exists ((s110 PZA) (s29 PZA)) 
                       (and 
                           (exists ((n16 Int)) 
                               (and 
                                   (<= 0 n16) 
                                   (forall ((x334 Int) (x335 A)) 
                                       (=> 
                                           (MS1 x334 x335 s110) 
                                           (and 
                                               (<= 1 x334) 
                                               (<= x334 n16)))) 
                                   (forall ((x336 Int) (x337 A) (x338 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x336 x337 s110) 
                                               (MS1 x336 x338 s110)) 
                                           (= x337 x338))) 
                                   (forall ((x339 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x339) 
                                               (<= x339 n16)) 
                                           (exists ((x340 A)) 
                                               (MS1 x339 x340 s110)))))) 
                           (exists ((n17 Int)) 
                               (and 
                                   (<= 0 n17) 
                                   (forall ((x341 Int) (x342 A)) 
                                       (=> 
                                           (MS1 x341 x342 s29) 
                                           (and 
                                               (<= 1 x341) 
                                               (<= x341 n17)))) 
                                   (forall ((x343 Int) (x344 A) (x345 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x343 x344 s29) 
                                               (MS1 x343 x345 s29)) 
                                           (= x344 x345))) 
                                   (forall ((x346 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x346) 
                                               (<= x346 n17)) 
                                           (exists ((x347 A)) 
                                               (MS1 x346 x347 s29)))))) 
                           (forall ((x348 Int) (x349 A)) 
                               (= 
                                   (MS1 x348 x349 x331) 
                                   (MS1 x348 x349 s110))) 
                           (forall ((x350 Int) (x351 A)) 
                               (= 
                                   (MS1 x350 x351 x332) 
                                   (MS1 x350 x351 s29))) 
                           (forall ((x352 Int) (x353 A)) 
                               (= 
                                   (MS1 x352 x353 x333) 
                                   (or 
                                       (exists ((i8 Int)) 
                                           (and 
                                               (<= 1 i8) 
                                               (forall ((x354 Int)) 
                                                   (=> 
                                                       (length s110 x354) 
                                                       (<= i8 x354))) 
                                               (= x352 i8) 
                                               (MS1 i8 x353 s110))) 
                                       (exists ((i9 Int)) 
                                           (and 
                                               (forall ((x355 Int)) 
                                                   (=> 
                                                       (length s110 x355) 
                                                       (<= (+ x355 1) i9))) 
                                               (forall ((x356 Int) (x357 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s110 x357) 
                                                           (length s29 x356)) 
                                                       (<= i9 (+ x357 x356)))) 
                                               (= x352 i9) 
                                               (exists ((x358 Int)) 
                                                   (and 
                                                       (forall ((x359 Int)) 
                                                           (=> 
                                                               (length s110 x359) 
                                                               (= x358 (- i9 x359)))) 
                                                       (MS1 x358 x353 s29))))))))))))
         :named hyp40))
(assert (! (forall ((s111 PZA) (s210 PZA)) 
               (=> 
                   (and 
                       (exists ((n18 Int)) 
                           (and 
                               (<= 0 n18) 
                               (forall ((x360 Int) (x361 A)) 
                                   (=> 
                                       (MS1 x360 x361 s111) 
                                       (and 
                                           (<= 1 x360) 
                                           (<= x360 n18)))) 
                               (forall ((x362 Int) (x363 A) (x364 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x362 x363 s111) 
                                           (MS1 x362 x364 s111)) 
                                       (= x363 x364))) 
                               (forall ((x365 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x365) 
                                           (<= x365 n18)) 
                                       (exists ((x366 A)) 
                                           (MS1 x365 x366 s111)))))) 
                       (exists ((n19 Int)) 
                           (and 
                               (<= 0 n19) 
                               (forall ((x367 Int) (x368 A)) 
                                   (=> 
                                       (MS1 x367 x368 s210) 
                                       (and 
                                           (<= 1 x367) 
                                           (<= x367 n19)))) 
                               (forall ((x369 Int) (x370 A) (x371 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x369 x370 s210) 
                                           (MS1 x369 x371 s210)) 
                                       (= x370 x371))) 
                               (forall ((x372 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x372) 
                                           (<= x372 n19)) 
                                       (exists ((x373 A)) 
                                           (MS1 x372 x373 s210))))))) 
                   (exists ((x374 PZA) (x375 Int)) 
                       (and 
                           (cnc s111 s210 x374) 
                           (forall ((x376 Int) (x377 Int)) 
                               (=> 
                                   (and 
                                       (length s111 x377) 
                                       (length s210 x376)) 
                                   (= x375 (+ x377 x376)))) 
                           (length x374 x375)))))
         :named hyp41))
(assert (! (forall ((s112 PZA) (s211 PZA)) 
               (=> 
                   (and 
                       (exists ((n20 Int)) 
                           (and 
                               (<= 0 n20) 
                               (forall ((x378 Int) (x379 A)) 
                                   (=> 
                                       (MS1 x378 x379 s112) 
                                       (and 
                                           (<= 1 x378) 
                                           (<= x378 n20)))) 
                               (forall ((x380 Int) (x381 A) (x382 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x380 x381 s112) 
                                           (MS1 x380 x382 s112)) 
                                       (= x381 x382))) 
                               (forall ((x383 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x383) 
                                           (<= x383 n20)) 
                                       (exists ((x384 A)) 
                                           (MS1 x383 x384 s112)))))) 
                       (exists ((n21 Int)) 
                           (and 
                               (<= 0 n21) 
                               (forall ((x385 Int) (x386 A)) 
                                   (=> 
                                       (MS1 x385 x386 s211) 
                                       (and 
                                           (<= 1 x385) 
                                           (<= x385 n21)))) 
                               (forall ((x387 Int) (x388 A) (x389 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x387 x388 s211) 
                                           (MS1 x387 x389 s211)) 
                                       (= x388 x389))) 
                               (forall ((x390 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x390) 
                                           (<= x390 n21)) 
                                       (exists ((x391 A)) 
                                           (MS1 x390 x391 s211))))))) 
                   (forall ((x392 Int)) 
                       (= 
                           (exists ((x393 A) (x394 PZA)) 
                               (and 
                                   (cnc s112 s211 x394) 
                                   (MS1 x392 x393 x394))) 
                           (and 
                               (<= 1 x392) 
                               (forall ((x395 Int) (x396 Int)) 
                                   (=> 
                                       (and 
                                           (length s112 x396) 
                                           (length s211 x395)) 
                                       (<= x392 (+ x396 x395)))))))))
         :named hyp42))
(assert (! (forall ((s113 PZA) (s212 PZA)) 
               (=> 
                   (and 
                       (exists ((n22 Int)) 
                           (and 
                               (<= 0 n22) 
                               (forall ((x397 Int) (x398 A)) 
                                   (=> 
                                       (MS1 x397 x398 s113) 
                                       (and 
                                           (<= 1 x397) 
                                           (<= x397 n22)))) 
                               (forall ((x399 Int) (x400 A) (x401 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x399 x400 s113) 
                                           (MS1 x399 x401 s113)) 
                                       (= x400 x401))) 
                               (forall ((x402 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x402) 
                                           (<= x402 n22)) 
                                       (exists ((x403 A)) 
                                           (MS1 x402 x403 s113)))))) 
                       (exists ((n23 Int)) 
                           (and 
                               (<= 0 n23) 
                               (forall ((x404 Int) (x405 A)) 
                                   (=> 
                                       (MS1 x404 x405 s212) 
                                       (and 
                                           (<= 1 x404) 
                                           (<= x404 n23)))) 
                               (forall ((x406 Int) (x407 A) (x408 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x406 x407 s212) 
                                           (MS1 x406 x408 s212)) 
                                       (= x407 x408))) 
                               (forall ((x409 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x409) 
                                           (<= x409 n23)) 
                                       (exists ((x410 A)) 
                                           (MS1 x409 x410 s212))))))) 
                   (forall ((x411 A)) 
                       (= 
                           (exists ((x412 Int) (x413 PZA)) 
                               (and 
                                   (cnc s113 s212 x413) 
                                   (MS1 x412 x411 x413))) 
                           (or 
                               (exists ((x414 Int)) 
                                   (MS1 x414 x411 s113)) 
                               (exists ((x415 Int)) 
                                   (MS1 x415 x411 s212)))))))
         :named hyp43))
(assert (! (forall ((s114 PZA) (s213 PZA) (b0 PA)) 
               (=> 
                   (and 
                       (exists ((n24 Int)) 
                           (and 
                               (<= 0 n24) 
                               (forall ((x416 Int) (x417 A)) 
                                   (=> 
                                       (MS1 x416 x417 s114) 
                                       (and 
                                           (<= 1 x416) 
                                           (<= x416 n24)))) 
                               (forall ((x418 Int) (x419 A) (x420 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x418 x419 s114) 
                                           (MS1 x418 x420 s114)) 
                                       (= x419 x420))) 
                               (forall ((x421 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x421) 
                                           (<= x421 n24)) 
                                       (exists ((x422 A)) 
                                           (MS1 x421 x422 s114)))))) 
                       (exists ((n25 Int)) 
                           (and 
                               (<= 0 n25) 
                               (forall ((x423 Int) (x424 A)) 
                                   (=> 
                                       (MS1 x423 x424 s213) 
                                       (and 
                                           (<= 1 x423) 
                                           (<= x423 n25)))) 
                               (forall ((x425 Int) (x426 A) (x427 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x425 x426 s213) 
                                           (MS1 x425 x427 s213)) 
                                       (= x426 x427))) 
                               (forall ((x428 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x428) 
                                           (<= x428 n25)) 
                                       (exists ((x429 A)) 
                                           (MS1 x428 x429 s213)))))) 
                       (forall ((x430 A)) 
                           (=> 
                               (exists ((x431 Int)) 
                                   (MS1 x431 x430 s114)) 
                               (MS0 x430 b0))) 
                       (forall ((x432 A)) 
                           (=> 
                               (exists ((x433 Int)) 
                                   (MS1 x433 x432 s213)) 
                               (MS0 x432 b0)))) 
                   (and 
                       (forall ((x434 Int) (x435 A)) 
                           (=> 
                               (exists ((x436 PZA)) 
                                   (and 
                                       (cnc s114 s213 x436) 
                                       (MS1 x434 x435 x436))) 
                               (and 
                                   (<= 1 x434) 
                                   (forall ((x437 Int) (x438 Int)) 
                                       (=> 
                                           (and 
                                               (length s114 x438) 
                                               (length s213 x437)) 
                                           (<= x434 (+ x438 x437)))) 
                                   (MS0 x435 b0)))) 
                       (forall ((x439 Int) (x440 A) (x441 A)) 
                           (=> 
                               (and 
                                   (exists ((x442 PZA)) 
                                       (and 
                                           (cnc s114 s213 x442) 
                                           (MS1 x439 x440 x442))) 
                                   (exists ((x443 PZA)) 
                                       (and 
                                           (cnc s114 s213 x443) 
                                           (MS1 x439 x441 x443)))) 
                               (= x440 x441))) 
                       (forall ((x444 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x444) 
                                   (forall ((x445 Int) (x446 Int)) 
                                       (=> 
                                           (and 
                                               (length s114 x446) 
                                               (length s213 x445)) 
                                           (<= x444 (+ x446 x445))))) 
                               (exists ((x447 A) (x448 PZA)) 
                                   (and 
                                       (cnc s114 s213 x448) 
                                       (MS1 x444 x447 x448))))))))
         :named hyp44))
(assert (! (exists ((n26 Int)) 
               (and 
                   (<= 0 n26) 
                   (forall ((x449 Int) (x450 A)) 
                       (=> 
                           (MS1 x449 x450 s1) 
                           (and 
                               (<= 1 x449) 
                               (<= x449 n26)))) 
                   (forall ((x451 Int) (x452 A) (x453 A)) 
                       (=> 
                           (and 
                               (MS1 x451 x452 s1) 
                               (MS1 x451 x453 s1)) 
                           (= x452 x453))) 
                   (forall ((x454 Int)) 
                       (=> 
                           (and 
                               (<= 1 x454) 
                               (<= x454 n26)) 
                           (exists ((x455 A)) 
                               (MS1 x454 x455 s1))))))
         :named hyp45))
(assert (! (exists ((n27 Int)) 
               (and 
                   (<= 0 n27) 
                   (forall ((x456 Int) (x457 A)) 
                       (=> 
                           (MS1 x456 x457 s2) 
                           (and 
                               (<= 1 x456) 
                               (<= x456 n27)))) 
                   (forall ((x458 Int) (x459 A) (x460 A)) 
                       (=> 
                           (and 
                               (MS1 x458 x459 s2) 
                               (MS1 x458 x460 s2)) 
                           (= x459 x460))) 
                   (forall ((x461 Int)) 
                       (=> 
                           (and 
                               (<= 1 x461) 
                               (<= x461 n27)) 
                           (exists ((x462 A)) 
                               (MS1 x461 x462 s2))))))
         :named hyp46))
(assert (! (and 
               (forall ((x463 PZA) (x464 PZA) (x465 PZA)) 
                   (=> 
                       (exists ((s115 PZA) (s214 PZA)) 
                           (and 
                               (exists ((n28 Int)) 
                                   (and 
                                       (<= 0 n28) 
                                       (forall ((x466 Int) (x467 A)) 
                                           (=> 
                                               (MS1 x466 x467 s115) 
                                               (and 
                                                   (<= 1 x466) 
                                                   (<= x466 n28)))) 
                                       (forall ((x468 Int) (x469 A) (x470 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x468 x469 s115) 
                                                   (MS1 x468 x470 s115)) 
                                               (= x469 x470))) 
                                       (forall ((x471 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x471) 
                                                   (<= x471 n28)) 
                                               (exists ((x472 A)) 
                                                   (MS1 x471 x472 s115)))))) 
                               (exists ((n29 Int)) 
                                   (and 
                                       (<= 0 n29) 
                                       (forall ((x473 Int) (x474 A)) 
                                           (=> 
                                               (MS1 x473 x474 s214) 
                                               (and 
                                                   (<= 1 x473) 
                                                   (<= x473 n29)))) 
                                       (forall ((x475 Int) (x476 A) (x477 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x475 x476 s214) 
                                                   (MS1 x475 x477 s214)) 
                                               (= x476 x477))) 
                                       (forall ((x478 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x478) 
                                                   (<= x478 n29)) 
                                               (exists ((x479 A)) 
                                                   (MS1 x478 x479 s214)))))) 
                               (forall ((x480 Int) (x481 A)) 
                                   (= 
                                       (MS1 x480 x481 x463) 
                                       (MS1 x480 x481 s115))) 
                               (forall ((x482 Int) (x483 A)) 
                                   (= 
                                       (MS1 x482 x483 x464) 
                                       (MS1 x482 x483 s214))) 
                               (forall ((x484 Int) (x485 A)) 
                                   (= 
                                       (MS1 x484 x485 x465) 
                                       (or 
                                           (exists ((i10 Int)) 
                                               (and 
                                                   (<= 1 i10) 
                                                   (forall ((x486 Int)) 
                                                       (=> 
                                                           (length s115 x486) 
                                                           (<= i10 x486))) 
                                                   (= x484 i10) 
                                                   (MS1 i10 x485 s115))) 
                                           (exists ((i11 Int)) 
                                               (and 
                                                   (forall ((x487 Int)) 
                                                       (=> 
                                                           (length s115 x487) 
                                                           (<= (+ x487 1) i11))) 
                                                   (forall ((x488 Int) (x489 Int)) 
                                                       (=> 
                                                           (and 
                                                               (length s115 x489) 
                                                               (length s214 x488)) 
                                                           (<= i11 (+ x489 x488)))) 
                                                   (= x484 i11) 
                                                   (exists ((x490 Int)) 
                                                       (and 
                                                           (forall ((x491 Int)) 
                                                               (=> 
                                                                   (length s115 x491) 
                                                                   (= x490 (- i11 x491)))) 
                                                           (MS1 x490 x485 s214)))))))))) 
                       (and 
                           (exists ((s30 PZA)) 
                               (and 
                                   (exists ((n30 Int)) 
                                       (and 
                                           (<= 0 n30) 
                                           (forall ((x492 Int) (x493 A)) 
                                               (=> 
                                                   (MS1 x492 x493 s30) 
                                                   (and 
                                                       (<= 1 x492) 
                                                       (<= x492 n30)))) 
                                           (forall ((x494 Int) (x495 A) (x496 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x494 x495 s30) 
                                                       (MS1 x494 x496 s30)) 
                                                   (= x495 x496))) 
                                           (forall ((x497 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x497) 
                                                       (<= x497 n30)) 
                                                   (exists ((x498 A)) 
                                                       (MS1 x497 x498 s30)))))) 
                                   (forall ((x499 Int) (x500 A)) 
                                       (= 
                                           (MS1 x499 x500 x463) 
                                           (MS1 x499 x500 s30))))) 
                           (exists ((s31 PZA)) 
                               (and 
                                   (exists ((n31 Int)) 
                                       (and 
                                           (<= 0 n31) 
                                           (forall ((x501 Int) (x502 A)) 
                                               (=> 
                                                   (MS1 x501 x502 s31) 
                                                   (and 
                                                       (<= 1 x501) 
                                                       (<= x501 n31)))) 
                                           (forall ((x503 Int) (x504 A) (x505 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x503 x504 s31) 
                                                       (MS1 x503 x505 s31)) 
                                                   (= x504 x505))) 
                                           (forall ((x506 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x506) 
                                                       (<= x506 n31)) 
                                                   (exists ((x507 A)) 
                                                       (MS1 x506 x507 s31)))))) 
                                   (forall ((x508 Int) (x509 A)) 
                                       (= 
                                           (MS1 x508 x509 x464) 
                                           (MS1 x508 x509 s31))))) 
                           (exists ((s32 PZA)) 
                               (and 
                                   (exists ((n32 Int)) 
                                       (and 
                                           (<= 0 n32) 
                                           (forall ((x510 Int) (x511 A)) 
                                               (=> 
                                                   (MS1 x510 x511 s32) 
                                                   (and 
                                                       (<= 1 x510) 
                                                       (<= x510 n32)))) 
                                           (forall ((x512 Int) (x513 A) (x514 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x512 x513 s32) 
                                                       (MS1 x512 x514 s32)) 
                                                   (= x513 x514))) 
                                           (forall ((x515 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x515) 
                                                       (<= x515 n32)) 
                                                   (exists ((x516 A)) 
                                                       (MS1 x515 x516 s32)))))) 
                                   (forall ((x517 Int) (x518 A)) 
                                       (= 
                                           (MS1 x517 x518 x465) 
                                           (MS1 x517 x518 s32)))))))) 
               (forall ((x519 PZA) (x520 PZA) (x521 PZA) (x522 PZA)) 
                   (=> 
                       (and 
                           (exists ((s116 PZA) (s215 PZA)) 
                               (and 
                                   (exists ((n33 Int)) 
                                       (and 
                                           (<= 0 n33) 
                                           (forall ((x523 Int) (x524 A)) 
                                               (=> 
                                                   (MS1 x523 x524 s116) 
                                                   (and 
                                                       (<= 1 x523) 
                                                       (<= x523 n33)))) 
                                           (forall ((x525 Int) (x526 A) (x527 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x525 x526 s116) 
                                                       (MS1 x525 x527 s116)) 
                                                   (= x526 x527))) 
                                           (forall ((x528 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x528) 
                                                       (<= x528 n33)) 
                                                   (exists ((x529 A)) 
                                                       (MS1 x528 x529 s116)))))) 
                                   (exists ((n34 Int)) 
                                       (and 
                                           (<= 0 n34) 
                                           (forall ((x530 Int) (x531 A)) 
                                               (=> 
                                                   (MS1 x530 x531 s215) 
                                                   (and 
                                                       (<= 1 x530) 
                                                       (<= x530 n34)))) 
                                           (forall ((x532 Int) (x533 A) (x534 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x532 x533 s215) 
                                                       (MS1 x532 x534 s215)) 
                                                   (= x533 x534))) 
                                           (forall ((x535 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x535) 
                                                       (<= x535 n34)) 
                                                   (exists ((x536 A)) 
                                                       (MS1 x535 x536 s215)))))) 
                                   (forall ((x537 Int) (x538 A)) 
                                       (= 
                                           (MS1 x537 x538 x519) 
                                           (MS1 x537 x538 s116))) 
                                   (forall ((x539 Int) (x540 A)) 
                                       (= 
                                           (MS1 x539 x540 x520) 
                                           (MS1 x539 x540 s215))) 
                                   (forall ((x541 Int) (x542 A)) 
                                       (= 
                                           (MS1 x541 x542 x521) 
                                           (or 
                                               (exists ((i12 Int)) 
                                                   (and 
                                                       (<= 1 i12) 
                                                       (forall ((x543 Int)) 
                                                           (=> 
                                                               (length s116 x543) 
                                                               (<= i12 x543))) 
                                                       (= x541 i12) 
                                                       (MS1 i12 x542 s116))) 
                                               (exists ((i13 Int)) 
                                                   (and 
                                                       (forall ((x544 Int)) 
                                                           (=> 
                                                               (length s116 x544) 
                                                               (<= (+ x544 1) i13))) 
                                                       (forall ((x545 Int) (x546 Int)) 
                                                           (=> 
                                                               (and 
                                                                   (length s116 x546) 
                                                                   (length s215 x545)) 
                                                               (<= i13 (+ x546 x545)))) 
                                                       (= x541 i13) 
                                                       (exists ((x547 Int)) 
                                                           (and 
                                                               (forall ((x548 Int)) 
                                                                   (=> 
                                                                       (length s116 x548) 
                                                                       (= x547 (- i13 x548)))) 
                                                               (MS1 x547 x542 s215)))))))))) 
                           (exists ((s117 PZA) (s216 PZA)) 
                               (and 
                                   (exists ((n35 Int)) 
                                       (and 
                                           (<= 0 n35) 
                                           (forall ((x549 Int) (x550 A)) 
                                               (=> 
                                                   (MS1 x549 x550 s117) 
                                                   (and 
                                                       (<= 1 x549) 
                                                       (<= x549 n35)))) 
                                           (forall ((x551 Int) (x552 A) (x553 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x551 x552 s117) 
                                                       (MS1 x551 x553 s117)) 
                                                   (= x552 x553))) 
                                           (forall ((x554 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x554) 
                                                       (<= x554 n35)) 
                                                   (exists ((x555 A)) 
                                                       (MS1 x554 x555 s117)))))) 
                                   (exists ((n36 Int)) 
                                       (and 
                                           (<= 0 n36) 
                                           (forall ((x556 Int) (x557 A)) 
                                               (=> 
                                                   (MS1 x556 x557 s216) 
                                                   (and 
                                                       (<= 1 x556) 
                                                       (<= x556 n36)))) 
                                           (forall ((x558 Int) (x559 A) (x560 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x558 x559 s216) 
                                                       (MS1 x558 x560 s216)) 
                                                   (= x559 x560))) 
                                           (forall ((x561 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x561) 
                                                       (<= x561 n36)) 
                                                   (exists ((x562 A)) 
                                                       (MS1 x561 x562 s216)))))) 
                                   (forall ((x563 Int) (x564 A)) 
                                       (= 
                                           (MS1 x563 x564 x519) 
                                           (MS1 x563 x564 s117))) 
                                   (forall ((x565 Int) (x566 A)) 
                                       (= 
                                           (MS1 x565 x566 x520) 
                                           (MS1 x565 x566 s216))) 
                                   (forall ((x567 Int) (x568 A)) 
                                       (= 
                                           (MS1 x567 x568 x522) 
                                           (or 
                                               (exists ((i14 Int)) 
                                                   (and 
                                                       (<= 1 i14) 
                                                       (forall ((x569 Int)) 
                                                           (=> 
                                                               (length s117 x569) 
                                                               (<= i14 x569))) 
                                                       (= x567 i14) 
                                                       (MS1 i14 x568 s117))) 
                                               (exists ((i15 Int)) 
                                                   (and 
                                                       (forall ((x570 Int)) 
                                                           (=> 
                                                               (length s117 x570) 
                                                               (<= (+ x570 1) i15))) 
                                                       (forall ((x571 Int) (x572 Int)) 
                                                           (=> 
                                                               (and 
                                                                   (length s117 x572) 
                                                                   (length s216 x571)) 
                                                               (<= i15 (+ x572 x571)))) 
                                                       (= x567 i15) 
                                                       (exists ((x573 Int)) 
                                                           (and 
                                                               (forall ((x574 Int)) 
                                                                   (=> 
                                                                       (length s117 x574) 
                                                                       (= x573 (- i15 x574)))) 
                                                               (MS1 x573 x568 s216))))))))))) 
                       (forall ((x575 Int) (x576 A)) 
                           (= 
                               (MS1 x575 x576 x521) 
                               (MS1 x575 x576 x522))))) 
               (forall ((x577 PZA) (x578 PZA)) 
                   (=> 
                       (and 
                           (exists ((s33 PZA)) 
                               (and 
                                   (exists ((n37 Int)) 
                                       (and 
                                           (<= 0 n37) 
                                           (forall ((x579 Int) (x580 A)) 
                                               (=> 
                                                   (MS1 x579 x580 s33) 
                                                   (and 
                                                       (<= 1 x579) 
                                                       (<= x579 n37)))) 
                                           (forall ((x581 Int) (x582 A) (x583 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x581 x582 s33) 
                                                       (MS1 x581 x583 s33)) 
                                                   (= x582 x583))) 
                                           (forall ((x584 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x584) 
                                                       (<= x584 n37)) 
                                                   (exists ((x585 A)) 
                                                       (MS1 x584 x585 s33)))))) 
                                   (forall ((x586 Int) (x587 A)) 
                                       (= 
                                           (MS1 x586 x587 x577) 
                                           (MS1 x586 x587 s33))))) 
                           (exists ((s34 PZA)) 
                               (and 
                                   (exists ((n38 Int)) 
                                       (and 
                                           (<= 0 n38) 
                                           (forall ((x588 Int) (x589 A)) 
                                               (=> 
                                                   (MS1 x588 x589 s34) 
                                                   (and 
                                                       (<= 1 x588) 
                                                       (<= x588 n38)))) 
                                           (forall ((x590 Int) (x591 A) (x592 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x590 x591 s34) 
                                                       (MS1 x590 x592 s34)) 
                                                   (= x591 x592))) 
                                           (forall ((x593 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x593) 
                                                       (<= x593 n38)) 
                                                   (exists ((x594 A)) 
                                                       (MS1 x593 x594 s34)))))) 
                                   (forall ((x595 Int) (x596 A)) 
                                       (= 
                                           (MS1 x595 x596 x578) 
                                           (MS1 x595 x596 s34)))))) 
                       (exists ((x597 PZA) (s118 PZA) (s217 PZA)) 
                           (and 
                               (exists ((n39 Int)) 
                                   (and 
                                       (<= 0 n39) 
                                       (forall ((x598 Int) (x599 A)) 
                                           (=> 
                                               (MS1 x598 x599 s118) 
                                               (and 
                                                   (<= 1 x598) 
                                                   (<= x598 n39)))) 
                                       (forall ((x600 Int) (x601 A) (x602 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x600 x601 s118) 
                                                   (MS1 x600 x602 s118)) 
                                               (= x601 x602))) 
                                       (forall ((x603 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x603) 
                                                   (<= x603 n39)) 
                                               (exists ((x604 A)) 
                                                   (MS1 x603 x604 s118)))))) 
                               (exists ((n40 Int)) 
                                   (and 
                                       (<= 0 n40) 
                                       (forall ((x605 Int) (x606 A)) 
                                           (=> 
                                               (MS1 x605 x606 s217) 
                                               (and 
                                                   (<= 1 x605) 
                                                   (<= x605 n40)))) 
                                       (forall ((x607 Int) (x608 A) (x609 A)) 
                                           (=> 
                                               (and 
                                                   (MS1 x607 x608 s217) 
                                                   (MS1 x607 x609 s217)) 
                                               (= x608 x609))) 
                                       (forall ((x610 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 1 x610) 
                                                   (<= x610 n40)) 
                                               (exists ((x611 A)) 
                                                   (MS1 x610 x611 s217)))))) 
                               (forall ((x612 Int) (x613 A)) 
                                   (= 
                                       (MS1 x612 x613 x577) 
                                       (MS1 x612 x613 s118))) 
                               (forall ((x614 Int) (x615 A)) 
                                   (= 
                                       (MS1 x614 x615 x578) 
                                       (MS1 x614 x615 s217))) 
                               (forall ((x616 Int) (x617 A)) 
                                   (= 
                                       (MS1 x616 x617 x597) 
                                       (or 
                                           (exists ((i16 Int)) 
                                               (and 
                                                   (<= 1 i16) 
                                                   (forall ((x618 Int)) 
                                                       (=> 
                                                           (length s118 x618) 
                                                           (<= i16 x618))) 
                                                   (= x616 i16) 
                                                   (MS1 i16 x617 s118))) 
                                           (exists ((i17 Int)) 
                                               (and 
                                                   (forall ((x619 Int)) 
                                                       (=> 
                                                           (length s118 x619) 
                                                           (<= (+ x619 1) i17))) 
                                                   (forall ((x620 Int) (x621 Int)) 
                                                       (=> 
                                                           (and 
                                                               (length s118 x621) 
                                                               (length s217 x620)) 
                                                           (<= i17 (+ x621 x620)))) 
                                                   (= x616 i17) 
                                                   (exists ((x622 Int)) 
                                                       (and 
                                                           (forall ((x623 Int)) 
                                                               (=> 
                                                                   (length s118 x623) 
                                                                   (= x622 (- i17 x623)))) 
                                                           (MS1 x622 x617 s217)))))))))))))
         :named hyp47))
(assert (! (forall ((s119 PZA) (s218 PZA)) 
               (=> 
                   (and 
                       (exists ((n41 Int)) 
                           (and 
                               (<= 0 n41) 
                               (forall ((x624 Int) (x625 A)) 
                                   (=> 
                                       (MS1 x624 x625 s119) 
                                       (and 
                                           (<= 1 x624) 
                                           (<= x624 n41)))) 
                               (forall ((x626 Int) (x627 A) (x628 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x626 x627 s119) 
                                           (MS1 x626 x628 s119)) 
                                       (= x627 x628))) 
                               (forall ((x629 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x629) 
                                           (<= x629 n41)) 
                                       (exists ((x630 A)) 
                                           (MS1 x629 x630 s119)))))) 
                       (exists ((n42 Int)) 
                           (and 
                               (<= 0 n42) 
                               (forall ((x631 Int) (x632 A)) 
                                   (=> 
                                       (MS1 x631 x632 s218) 
                                       (and 
                                           (<= 1 x631) 
                                           (<= x631 n42)))) 
                               (forall ((x633 Int) (x634 A) (x635 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x633 x634 s218) 
                                           (MS1 x633 x635 s218)) 
                                       (= x634 x635))) 
                               (forall ((x636 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x636) 
                                           (<= x636 n42)) 
                                       (exists ((x637 A)) 
                                           (MS1 x636 x637 s218))))))) 
                   (exists ((x638 PZA) (x639 Int)) 
                       (and 
                           (forall ((x640 Int) (x641 A)) 
                               (= 
                                   (MS1 x640 x641 x638) 
                                   (or 
                                       (exists ((i18 Int)) 
                                           (and 
                                               (<= 1 i18) 
                                               (forall ((x642 Int)) 
                                                   (=> 
                                                       (length s119 x642) 
                                                       (<= i18 x642))) 
                                               (= x640 i18) 
                                               (MS1 i18 x641 s119))) 
                                       (exists ((i19 Int)) 
                                           (and 
                                               (forall ((x643 Int)) 
                                                   (=> 
                                                       (length s119 x643) 
                                                       (<= (+ x643 1) i19))) 
                                               (forall ((x644 Int) (x645 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s119 x645) 
                                                           (length s218 x644)) 
                                                       (<= i19 (+ x645 x644)))) 
                                               (= x640 i19) 
                                               (exists ((x646 Int)) 
                                                   (and 
                                                       (forall ((x647 Int)) 
                                                           (=> 
                                                               (length s119 x647) 
                                                               (= x646 (- i19 x647)))) 
                                                       (MS1 x646 x641 s218)))))))) 
                           (forall ((x648 Int) (x649 Int)) 
                               (=> 
                                   (and 
                                       (length s119 x649) 
                                       (length s218 x648)) 
                                   (= x639 (+ x649 x648)))) 
                           (length x638 x639)))))
         :named hyp48))
(assert (! (forall ((s120 PZA) (s219 PZA)) 
               (=> 
                   (and 
                       (exists ((n43 Int)) 
                           (and 
                               (<= 0 n43) 
                               (forall ((x650 Int) (x651 A)) 
                                   (=> 
                                       (MS1 x650 x651 s120) 
                                       (and 
                                           (<= 1 x650) 
                                           (<= x650 n43)))) 
                               (forall ((x652 Int) (x653 A) (x654 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x652 x653 s120) 
                                           (MS1 x652 x654 s120)) 
                                       (= x653 x654))) 
                               (forall ((x655 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x655) 
                                           (<= x655 n43)) 
                                       (exists ((x656 A)) 
                                           (MS1 x655 x656 s120)))))) 
                       (exists ((n44 Int)) 
                           (and 
                               (<= 0 n44) 
                               (forall ((x657 Int) (x658 A)) 
                                   (=> 
                                       (MS1 x657 x658 s219) 
                                       (and 
                                           (<= 1 x657) 
                                           (<= x657 n44)))) 
                               (forall ((x659 Int) (x660 A) (x661 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x659 x660 s219) 
                                           (MS1 x659 x661 s219)) 
                                       (= x660 x661))) 
                               (forall ((x662 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x662) 
                                           (<= x662 n44)) 
                                       (exists ((x663 A)) 
                                           (MS1 x662 x663 s219))))))) 
                   (forall ((x664 Int)) 
                       (= 
                           (or 
                               (exists ((x665 A)) 
                                   (exists ((i20 Int)) 
                                       (and 
                                           (<= 1 i20) 
                                           (forall ((x666 Int)) 
                                               (=> 
                                                   (length s120 x666) 
                                                   (<= i20 x666))) 
                                           (= x664 i20) 
                                           (MS1 i20 x665 s120)))) 
                               (exists ((x667 A)) 
                                   (exists ((i21 Int)) 
                                       (and 
                                           (forall ((x668 Int)) 
                                               (=> 
                                                   (length s120 x668) 
                                                   (<= (+ x668 1) i21))) 
                                           (forall ((x669 Int) (x670 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s120 x670) 
                                                       (length s219 x669)) 
                                                   (<= i21 (+ x670 x669)))) 
                                           (= x664 i21) 
                                           (exists ((x671 Int)) 
                                               (and 
                                                   (forall ((x672 Int)) 
                                                       (=> 
                                                           (length s120 x672) 
                                                           (= x671 (- i21 x672)))) 
                                                   (MS1 x671 x667 s219))))))) 
                           (and 
                               (<= 1 x664) 
                               (forall ((x673 Int) (x674 Int)) 
                                   (=> 
                                       (and 
                                           (length s120 x674) 
                                           (length s219 x673)) 
                                       (<= x664 (+ x674 x673)))))))))
         :named hyp49))
(assert (! (forall ((s121 PZA) (s220 PZA)) 
               (=> 
                   (and 
                       (exists ((n45 Int)) 
                           (and 
                               (<= 0 n45) 
                               (forall ((x675 Int) (x676 A)) 
                                   (=> 
                                       (MS1 x675 x676 s121) 
                                       (and 
                                           (<= 1 x675) 
                                           (<= x675 n45)))) 
                               (forall ((x677 Int) (x678 A) (x679 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x677 x678 s121) 
                                           (MS1 x677 x679 s121)) 
                                       (= x678 x679))) 
                               (forall ((x680 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x680) 
                                           (<= x680 n45)) 
                                       (exists ((x681 A)) 
                                           (MS1 x680 x681 s121)))))) 
                       (exists ((n46 Int)) 
                           (and 
                               (<= 0 n46) 
                               (forall ((x682 Int) (x683 A)) 
                                   (=> 
                                       (MS1 x682 x683 s220) 
                                       (and 
                                           (<= 1 x682) 
                                           (<= x682 n46)))) 
                               (forall ((x684 Int) (x685 A) (x686 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x684 x685 s220) 
                                           (MS1 x684 x686 s220)) 
                                       (= x685 x686))) 
                               (forall ((x687 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x687) 
                                           (<= x687 n46)) 
                                       (exists ((x688 A)) 
                                           (MS1 x687 x688 s220))))))) 
                   (forall ((x689 A)) 
                       (= 
                           (or 
                               (exists ((x690 Int)) 
                                   (exists ((i22 Int)) 
                                       (and 
                                           (<= 1 i22) 
                                           (forall ((x691 Int)) 
                                               (=> 
                                                   (length s121 x691) 
                                                   (<= i22 x691))) 
                                           (= x690 i22) 
                                           (MS1 i22 x689 s121)))) 
                               (exists ((x692 Int)) 
                                   (exists ((i23 Int)) 
                                       (and 
                                           (forall ((x693 Int)) 
                                               (=> 
                                                   (length s121 x693) 
                                                   (<= (+ x693 1) i23))) 
                                           (forall ((x694 Int) (x695 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s121 x695) 
                                                       (length s220 x694)) 
                                                   (<= i23 (+ x695 x694)))) 
                                           (= x692 i23) 
                                           (exists ((x696 Int)) 
                                               (and 
                                                   (forall ((x697 Int)) 
                                                       (=> 
                                                           (length s121 x697) 
                                                           (= x696 (- i23 x697)))) 
                                                   (MS1 x696 x689 s220))))))) 
                           (or 
                               (exists ((x698 Int)) 
                                   (MS1 x698 x689 s121)) 
                               (exists ((x699 Int)) 
                                   (MS1 x699 x689 s220)))))))
         :named hyp50))
(assert (! (forall ((s122 PZA) (s221 PZA) (b1 PA)) 
               (=> 
                   (and 
                       (exists ((n47 Int)) 
                           (and 
                               (<= 0 n47) 
                               (forall ((x700 Int) (x701 A)) 
                                   (=> 
                                       (MS1 x700 x701 s122) 
                                       (and 
                                           (<= 1 x700) 
                                           (<= x700 n47)))) 
                               (forall ((x702 Int) (x703 A) (x704 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x702 x703 s122) 
                                           (MS1 x702 x704 s122)) 
                                       (= x703 x704))) 
                               (forall ((x705 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x705) 
                                           (<= x705 n47)) 
                                       (exists ((x706 A)) 
                                           (MS1 x705 x706 s122)))))) 
                       (exists ((n48 Int)) 
                           (and 
                               (<= 0 n48) 
                               (forall ((x707 Int) (x708 A)) 
                                   (=> 
                                       (MS1 x707 x708 s221) 
                                       (and 
                                           (<= 1 x707) 
                                           (<= x707 n48)))) 
                               (forall ((x709 Int) (x710 A) (x711 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x709 x710 s221) 
                                           (MS1 x709 x711 s221)) 
                                       (= x710 x711))) 
                               (forall ((x712 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x712) 
                                           (<= x712 n48)) 
                                       (exists ((x713 A)) 
                                           (MS1 x712 x713 s221)))))) 
                       (forall ((x714 A)) 
                           (=> 
                               (exists ((x715 Int)) 
                                   (MS1 x715 x714 s122)) 
                               (MS0 x714 b1))) 
                       (forall ((x716 A)) 
                           (=> 
                               (exists ((x717 Int)) 
                                   (MS1 x717 x716 s221)) 
                               (MS0 x716 b1)))) 
                   (and 
                       (forall ((x718 Int) (x719 A)) 
                           (=> 
                               (or 
                                   (exists ((i24 Int)) 
                                       (and 
                                           (<= 1 i24) 
                                           (forall ((x720 Int)) 
                                               (=> 
                                                   (length s122 x720) 
                                                   (<= i24 x720))) 
                                           (= x718 i24) 
                                           (MS1 i24 x719 s122))) 
                                   (exists ((i25 Int)) 
                                       (and 
                                           (forall ((x721 Int)) 
                                               (=> 
                                                   (length s122 x721) 
                                                   (<= (+ x721 1) i25))) 
                                           (forall ((x722 Int) (x723 Int)) 
                                               (=> 
                                                   (and 
                                                       (length s122 x723) 
                                                       (length s221 x722)) 
                                                   (<= i25 (+ x723 x722)))) 
                                           (= x718 i25) 
                                           (exists ((x724 Int)) 
                                               (and 
                                                   (forall ((x725 Int)) 
                                                       (=> 
                                                           (length s122 x725) 
                                                           (= x724 (- i25 x725)))) 
                                                   (MS1 x724 x719 s221)))))) 
                               (and 
                                   (<= 1 x718) 
                                   (forall ((x726 Int) (x727 Int)) 
                                       (=> 
                                           (and 
                                               (length s122 x727) 
                                               (length s221 x726)) 
                                           (<= x718 (+ x727 x726)))) 
                                   (MS0 x719 b1)))) 
                       (forall ((x728 Int) (x729 A) (x730 A)) 
                           (=> 
                               (and 
                                   (or 
                                       (exists ((i26 Int)) 
                                           (and 
                                               (<= 1 i26) 
                                               (forall ((x731 Int)) 
                                                   (=> 
                                                       (length s122 x731) 
                                                       (<= i26 x731))) 
                                               (= x728 i26) 
                                               (MS1 i26 x729 s122))) 
                                       (exists ((i27 Int)) 
                                           (and 
                                               (forall ((x732 Int)) 
                                                   (=> 
                                                       (length s122 x732) 
                                                       (<= (+ x732 1) i27))) 
                                               (forall ((x733 Int) (x734 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s122 x734) 
                                                           (length s221 x733)) 
                                                       (<= i27 (+ x734 x733)))) 
                                               (= x728 i27) 
                                               (exists ((x735 Int)) 
                                                   (and 
                                                       (forall ((x736 Int)) 
                                                           (=> 
                                                               (length s122 x736) 
                                                               (= x735 (- i27 x736)))) 
                                                       (MS1 x735 x729 s221)))))) 
                                   (or 
                                       (exists ((i28 Int)) 
                                           (and 
                                               (<= 1 i28) 
                                               (forall ((x737 Int)) 
                                                   (=> 
                                                       (length s122 x737) 
                                                       (<= i28 x737))) 
                                               (= x728 i28) 
                                               (MS1 i28 x730 s122))) 
                                       (exists ((i29 Int)) 
                                           (and 
                                               (forall ((x738 Int)) 
                                                   (=> 
                                                       (length s122 x738) 
                                                       (<= (+ x738 1) i29))) 
                                               (forall ((x739 Int) (x740 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s122 x740) 
                                                           (length s221 x739)) 
                                                       (<= i29 (+ x740 x739)))) 
                                               (= x728 i29) 
                                               (exists ((x741 Int)) 
                                                   (and 
                                                       (forall ((x742 Int)) 
                                                           (=> 
                                                               (length s122 x742) 
                                                               (= x741 (- i29 x742)))) 
                                                       (MS1 x741 x730 s221))))))) 
                               (= x729 x730))) 
                       (forall ((x743 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x743) 
                                   (forall ((x744 Int) (x745 Int)) 
                                       (=> 
                                           (and 
                                               (length s122 x745) 
                                               (length s221 x744)) 
                                           (<= x743 (+ x745 x744))))) 
                               (or 
                                   (exists ((x746 A)) 
                                       (exists ((i30 Int)) 
                                           (and 
                                               (<= 1 i30) 
                                               (forall ((x747 Int)) 
                                                   (=> 
                                                       (length s122 x747) 
                                                       (<= i30 x747))) 
                                               (= x743 i30) 
                                               (MS1 i30 x746 s122)))) 
                                   (exists ((x748 A)) 
                                       (exists ((i31 Int)) 
                                           (and 
                                               (forall ((x749 Int)) 
                                                   (=> 
                                                       (length s122 x749) 
                                                       (<= (+ x749 1) i31))) 
                                               (forall ((x750 Int) (x751 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s122 x751) 
                                                           (length s221 x750)) 
                                                       (<= i31 (+ x751 x750)))) 
                                               (= x743 i31) 
                                               (exists ((x752 Int)) 
                                                   (and 
                                                       (forall ((x753 Int)) 
                                                           (=> 
                                                               (length s122 x753) 
                                                               (= x752 (- i31 x753)))) 
                                                       (MS1 x752 x748 s221))))))))))))
         :named hyp51))
(assert (! (not 
               (or 
                   (exists ((i32 Int)) 
                       (and 
                           (<= 1 i32) 
                           (forall ((x754 Int)) 
                               (=> 
                                   (length s1 x754) 
                                   (<= i32 x754))) 
                           (= i i32) 
                           (exists ((x755 A)) 
                               (and 
                                   (MS1 i32 x755 s1) 
                                   (MS1 i x755 s1))))) 
                   (exists ((i33 Int)) 
                       (and 
                           (forall ((x756 Int)) 
                               (=> 
                                   (length s1 x756) 
                                   (<= (+ x756 1) i33))) 
                           (forall ((x757 Int) (x758 Int)) 
                               (=> 
                                   (and 
                                       (length s1 x758) 
                                       (length s2 x757)) 
                                   (<= i33 (+ x758 x757)))) 
                           (= i i33) 
                           (exists ((x759 A)) 
                               (and 
                                   (exists ((x760 Int)) 
                                       (and 
                                           (forall ((x761 Int)) 
                                               (=> 
                                                   (length s1 x761) 
                                                   (= x760 (- i33 x761)))) 
                                           (MS1 x760 x759 s2))) 
                                   (MS1 i x759 s1)))))))
         :named goal))
(check-sat)
(exit)

