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
(declare-fun MS (A PA) Bool)
(declare-fun MS0 (A A PAA) Bool)
(declare-fun MS1 (Int A PZA) Bool)
(declare-fun cnc (PZA PZA PZA) Bool)
(declare-fun dist (A A Int) Bool)
(declare-fun length (PZA Int) Bool)
(declare-fun path (A A PZA) Bool)
(declare-fun reverse (PZA PZA) Bool)
(declare-fun seq (PZA) Bool)
(declare-fun shpath (A A PZA) Bool)
(declare-fun a () PA)
(declare-fun c () PAA)
(declare-fun candidate () PA)
(declare-fun r () PAA)
(declare-fun t () A)
(declare-fun x () A)
(declare-fun y1 () A)
(declare-fun z () A)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x414 A) (x415 A)) 
            (exists ((X PAA)) 
                (and 
                    (MS0 x414 x415 X) 
                    (forall ((y28 A) (y29 A)) 
                        (=> 
                            (MS0 y28 y29 X) 
                            (and 
                                (= y28 x414) 
                                (= y29 x415))))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x416 A)) 
            (exists ((X0 PA)) 
                (and 
                    (MS x416 X0) 
                    (forall ((y30 A)) 
                        (=> 
                            (MS y30 X0) 
                            (= y30 x416)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x417 Int) (x418 A)) 
            (exists ((X1 PZA)) 
                (and 
                    (MS1 x417 x418 X1) 
                    (forall ((y31 Int) (y32 A)) 
                        (=> 
                            (MS1 y31 y32 X1) 
                            (and 
                                (= y31 x417) 
                                (= y32 x418))))))))
(assert (! (forall ((x0 A) (y10 A) (y2 A) (z0 A) (q PZA)) 
               (=> 
                   (and 
                       (MS x0 a) 
                       (MS y10 a) 
                       (MS z0 a) 
                       (not 
                           (= z0 x0)) 
                       (not 
                           (= z0 y10)) 
                       (forall ((t0 A)) 
                           (=> 
                               (and 
                                   (MS t0 a) 
                                   (MS0 z0 t0 r)) 
                               (forall ((x1 Int) (x2 Int)) 
                                   (=> 
                                       (and 
                                           (dist x0 t0 x2) 
                                           (dist x0 z0 x1)) 
                                       (<= x2 x1))))) 
                       (path x0 y10 q) 
                       (not 
                           (exists ((x3 Int)) 
                               (MS1 x3 z0 q))) 
                       (MS y2 a) 
                       (not 
                           (= y2 y10)) 
                       (not 
                           (= z0 y2)) 
                       (exists ((x4 Int)) 
                           (MS1 x4 y2 q))) 
                   (exists ((p PZA)) 
                       (and 
                           (path y10 y2 p) 
                           (not 
                               (exists ((x5 Int)) 
                                   (MS1 x5 z0 p)))))))
         :named hyp1))
(assert (! (forall ((x6 A) (y11 A) (y20 A) (z1 A) (q0 PZA)) 
               (=> 
                   (and 
                       (MS x6 a) 
                       (MS y11 a) 
                       (MS z1 a) 
                       (not 
                           (= z1 x6)) 
                       (not 
                           (= z1 y11)) 
                       (forall ((t1 A)) 
                           (=> 
                               (and 
                                   (MS t1 a) 
                                   (MS0 z1 t1 r)) 
                               (forall ((x7 Int) (x8 Int)) 
                                   (=> 
                                       (and 
                                           (dist x6 t1 x8) 
                                           (dist x6 z1 x7)) 
                                       (<= x8 x7))))) 
                       (path x6 y11 q0) 
                       (not 
                           (exists ((x9 Int)) 
                               (MS1 x9 z1 q0))) 
                       (MS y20 a) 
                       (not 
                           (= y20 y11)) 
                       (not 
                           (= z1 y20)) 
                       (not 
                           (exists ((x10 Int)) 
                               (MS1 x10 y20 q0))) 
                       (MS0 y20 x6 r)) 
                   (exists ((p0 PZA)) 
                       (and 
                           (path y11 y20 p0) 
                           (not 
                               (exists ((x11 Int)) 
                                   (MS1 x11 z1 p0)))))))
         :named hyp2))
(assert (! (forall ((x12 A) (y12 A) (y21 A) (z2 A) (q1 PZA) (p1 PZA)) 
               (=> 
                   (and 
                       (MS x12 a) 
                       (MS y12 a) 
                       (MS z2 a) 
                       (not 
                           (= z2 x12)) 
                       (not 
                           (= z2 y12)) 
                       (forall ((t2 A)) 
                           (=> 
                               (and 
                                   (MS t2 a) 
                                   (MS0 z2 t2 r)) 
                               (forall ((x13 Int) (x14 Int)) 
                                   (=> 
                                       (and 
                                           (dist x12 t2 x14) 
                                           (dist x12 z2 x13)) 
                                       (<= x14 x13))))) 
                       (path x12 y12 q1) 
                       (not 
                           (exists ((x15 Int)) 
                               (MS1 x15 z2 q1))) 
                       (path x12 y21 p1) 
                       (not 
                           (exists ((x16 Int)) 
                               (MS1 x16 z2 p1))) 
                       (MS y21 a) 
                       (not 
                           (= y21 y12)) 
                       (not 
                           (= z2 y21)) 
                       (not 
                           (exists ((x17 Int)) 
                               (MS1 x17 y21 q1))) 
                       (not 
                           (MS0 y21 x12 r))) 
                   (exists ((s PZA)) 
                       (and 
                           (path y12 y21 s) 
                           (not 
                               (exists ((x18 Int)) 
                                   (MS1 x18 z2 s)))))))
         :named hyp3))
(assert (! (MS x a)
         :named hyp4))
(assert (! (MS y1 a)
         :named hyp5))
(assert (! (MS z a)
         :named hyp6))
(assert (! (not 
               (= z x))
         :named hyp7))
(assert (! (not 
               (= z y1))
         :named hyp8))
(assert (! (MS t a)
         :named hyp9))
(assert (! (MS0 z t r)
         :named hyp10))
(assert (! (forall ((x19 A) (x20 A)) 
               (=> 
                   (MS0 x19 x20 r) 
                   (and 
                       (MS x19 a) 
                       (MS x20 a))))
         :named hyp11))
(assert (! (not 
               (forall ((x21 A) (x22 A)) 
                   (not 
                       (MS0 x21 x22 r))))
         :named hyp12))
(assert (! (forall ((x23 A) (x24 A)) 
               (=> 
                   (MS0 x23 x24 c) 
                   (and 
                       (MS x23 a) 
                       (MS x24 a))))
         :named hyp13))
(assert (! (forall ((x25 A) (x26 A)) 
               (=> 
                   (MS0 x25 x26 r) 
                   (MS0 x25 x26 c)))
         :named hyp14))
(assert (! (forall ((x27 A) (x28 A)) 
               (=> 
                   (exists ((x29 A)) 
                       (and 
                           (MS0 x27 x29 c) 
                           (MS0 x29 x28 r))) 
                   (MS0 x27 x28 c)))
         :named hyp15))
(assert (! (forall ((s0 PAA)) 
               (=> 
                   (and 
                       (forall ((x30 A) (x31 A)) 
                           (=> 
                               (MS0 x30 x31 s0) 
                               (and 
                                   (MS x30 a) 
                                   (MS x31 a)))) 
                       (forall ((x32 A) (x33 A)) 
                           (=> 
                               (MS0 x32 x33 r) 
                               (MS0 x32 x33 s0))) 
                       (forall ((x34 A) (x35 A)) 
                           (=> 
                               (exists ((x36 A)) 
                                   (and 
                                       (MS0 x34 x36 s0) 
                                       (MS0 x36 x35 r))) 
                               (MS0 x34 x35 s0)))) 
                   (forall ((x37 A) (x38 A)) 
                       (=> 
                           (MS0 x37 x38 c) 
                           (MS0 x37 x38 s0)))))
         :named hyp16))
(assert (! (forall ((x39 A)) 
               (= 
                   (exists ((x40 A)) 
                       (MS0 x39 x40 r)) 
                   (MS x39 a)))
         :named hyp17))
(assert (! (forall ((x41 A)) 
               (= 
                   (exists ((x42 A)) 
                       (MS0 x41 x42 c)) 
                   (MS x41 a)))
         :named hyp18))
(assert (! (forall ((x43 A)) 
               (=> 
                   (exists ((x44 A)) 
                       (MS0 x43 x44 r)) 
                   (exists ((x45 A)) 
                       (MS0 x43 x45 c))))
         :named hyp19))
(assert (! (forall ((x46 A) (x47 A)) 
               (= 
                   (MS0 x46 x47 c) 
                   (or 
                       (MS0 x46 x47 r) 
                       (exists ((x48 A)) 
                           (and 
                               (MS0 x46 x48 c) 
                               (MS0 x48 x47 r))))))
         :named hyp20))
(assert (! (forall ((x49 A) (y A)) 
               (=> 
                   (and 
                       (MS x49 a) 
                       (MS y a)) 
                   (forall ((s1 PZA) (n Int)) 
                       (=> 
                           (and 
                               (<= 0 n) 
                               (< 1 n) 
                               (forall ((x50 Int) (x51 A)) 
                                   (=> 
                                       (MS1 x50 x51 s1) 
                                       (and 
                                           (<= 1 x50) 
                                           (<= x50 n) 
                                           (MS x51 a)))) 
                               (forall ((x52 Int) (x53 A) (x54 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x52 x53 s1) 
                                           (MS1 x52 x54 s1)) 
                                       (= x53 x54))) 
                               (forall ((x55 Int)) 
                                   (=> 
                                       (and 
                                           (<= 1 x55) 
                                           (<= x55 n)) 
                                       (exists ((x56 A)) 
                                           (MS1 x55 x56 s1))))) 
                           (and 
                               (exists ((x57 A) (x58 Int)) 
                                   (and 
                                       (= x58 1) 
                                       (MS1 x58 x57 s1))) 
                               (forall ((x59 Int) (x60 A) (x61 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x59 x60 s1) 
                                           (MS1 x59 x61 s1)) 
                                       (= x60 x61))) 
                               (=> 
                                   (exists ((x62 Int)) 
                                       (and 
                                           (= x62 1) 
                                           (MS1 x62 x49 s1))) 
                                   (and 
                                       (exists ((x63 A)) 
                                           (MS1 n x63 s1)) 
                                       (=> 
                                           (MS1 n y s1) 
                                           (forall ((i Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i) 
                                                       (<= i (- n 1))) 
                                                   (and 
                                                       (exists ((x64 A)) 
                                                           (MS1 i x64 s1)) 
                                                       (exists ((x65 A) (x66 Int)) 
                                                           (and 
                                                               (= x66 (+ i 1)) 
                                                               (MS1 x66 x65 s1))))))))))))))
         :named hyp21))
(assert (! (forall ((x67 A) (x68 A)) 
               (=> 
                   (exists ((x69 PZA)) 
                       (path x67 x68 x69)) 
                   (MS0 x67 x68 c)))
         :named hyp22))
(assert (! (forall ((x70 A) (x71 A)) 
               (=> 
                   (MS0 x70 x71 c) 
                   (exists ((x72 PZA)) 
                       (path x70 x71 x72))))
         :named hyp23))
(assert (! (forall ((x73 A) (x74 A)) 
               (=> 
                   (and 
                       (MS x73 a) 
                       (MS x74 a)) 
                   (exists ((x75 PZA)) 
                       (path x73 x74 x75))))
         :named hyp24))
(assert (! (forall ((x76 PZA)) 
               (= 
                   (seq x76) 
                   (exists ((s2 PZA)) 
                       (and 
                           (exists ((n0 Int)) 
                               (and 
                                   (<= 0 n0) 
                                   (forall ((x77 Int) (x78 A)) 
                                       (=> 
                                           (MS1 x77 x78 s2) 
                                           (and 
                                               (<= 1 x77) 
                                               (<= x77 n0)))) 
                                   (forall ((x79 Int) (x80 A) (x81 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x79 x80 s2) 
                                               (MS1 x79 x81 s2)) 
                                           (= x80 x81))) 
                                   (forall ((x82 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x82) 
                                               (<= x82 n0)) 
                                           (exists ((x83 A)) 
                                               (MS1 x82 x83 s2)))))) 
                           (forall ((x84 Int) (x85 A)) 
                               (= 
                                   (MS1 x84 x85 x76) 
                                   (MS1 x84 x85 s2)))))))
         :named hyp25))
(assert (! (forall ((n1 Int) (s3 PZA)) 
               (=> 
                   (and 
                       (<= 0 n1) 
                       (forall ((x86 Int) (x87 A)) 
                           (=> 
                               (MS1 x86 x87 s3) 
                               (and 
                                   (<= 1 x86) 
                                   (<= x86 n1)))) 
                       (forall ((x88 Int) (x89 A) (x90 A)) 
                           (=> 
                               (and 
                                   (MS1 x88 x89 s3) 
                                   (MS1 x88 x90 s3)) 
                               (= x89 x90))) 
                       (forall ((x91 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x91) 
                                   (<= x91 n1)) 
                               (exists ((x92 A)) 
                                   (MS1 x91 x92 s3))))) 
                   (seq s3)))
         :named hyp26))
(assert (! (and 
               (forall ((x93 PZA) (x94 Int)) 
                   (=> 
                       (length x93 x94) 
                       (and 
                           (seq x93) 
                           (<= 0 x94)))) 
               (forall ((x95 PZA) (x96 Int) (x97 Int)) 
                   (=> 
                       (and 
                           (length x95 x96) 
                           (length x95 x97)) 
                       (= x96 x97))) 
               (forall ((x98 PZA)) 
                   (=> 
                       (seq x98) 
                       (exists ((x99 Int)) 
                           (length x98 x99)))))
         :named hyp27))
(assert (! (forall ((n2 Int) (s4 PZA)) 
               (=> 
                   (and 
                       (<= 0 n2) 
                       (forall ((x100 Int) (x101 A)) 
                           (=> 
                               (MS1 x100 x101 s4) 
                               (and 
                                   (<= 1 x100) 
                                   (<= x100 n2)))) 
                       (forall ((x102 Int) (x103 A) (x104 A)) 
                           (=> 
                               (and 
                                   (MS1 x102 x103 s4) 
                                   (MS1 x102 x104 s4)) 
                               (= x103 x104))) 
                       (forall ((x105 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x105) 
                                   (<= x105 n2)) 
                               (exists ((x106 A)) 
                                   (MS1 x105 x106 s4))))) 
                   (length s4 n2)))
         :named hyp28))
(assert (! (forall ((s5 PZA)) 
               (=> 
                   (seq s5) 
                   (and 
                       (forall ((x107 Int) (x108 A)) 
                           (=> 
                               (MS1 x107 x108 s5) 
                               (and 
                                   (<= 1 x107) 
                                   (forall ((x109 Int)) 
                                       (=> 
                                           (length s5 x109) 
                                           (<= x107 x109)))))) 
                       (forall ((x110 Int) (x111 A) (x112 A)) 
                           (=> 
                               (and 
                                   (MS1 x110 x111 s5) 
                                   (MS1 x110 x112 s5)) 
                               (= x111 x112))) 
                       (forall ((x113 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x113) 
                                   (forall ((x114 Int)) 
                                       (=> 
                                           (length s5 x114) 
                                           (<= x113 x114)))) 
                               (exists ((x115 A)) 
                                   (MS1 x113 x115 s5)))))))
         :named hyp29))
(assert (! (forall ((x116 PZA) (x117 PZA) (x118 PZA)) 
               (= 
                   (cnc x116 x117 x118) 
                   (exists ((s10 PZA) (s20 PZA)) 
                       (and 
                           (seq s10) 
                           (seq s20) 
                           (forall ((x119 Int) (x120 A)) 
                               (= 
                                   (MS1 x119 x120 x116) 
                                   (MS1 x119 x120 s10))) 
                           (forall ((x121 Int) (x122 A)) 
                               (= 
                                   (MS1 x121 x122 x117) 
                                   (MS1 x121 x122 s20))) 
                           (forall ((x123 Int) (x124 A)) 
                               (= 
                                   (MS1 x123 x124 x118) 
                                   (or 
                                       (exists ((i0 Int)) 
                                           (and 
                                               (<= 1 i0) 
                                               (forall ((x125 Int)) 
                                                   (=> 
                                                       (length s10 x125) 
                                                       (<= i0 x125))) 
                                               (= x123 i0) 
                                               (MS1 i0 x124 s10))) 
                                       (exists ((i1 Int)) 
                                           (and 
                                               (forall ((x126 Int)) 
                                                   (=> 
                                                       (length s10 x126) 
                                                       (<= (+ x126 1) i1))) 
                                               (forall ((x127 Int) (x128 Int)) 
                                                   (=> 
                                                       (and 
                                                           (length s10 x128) 
                                                           (length s20 x127)) 
                                                       (<= i1 (+ x128 x127)))) 
                                               (= x123 i1) 
                                               (exists ((x129 Int)) 
                                                   (and 
                                                       (forall ((x130 Int)) 
                                                           (=> 
                                                               (length s10 x130) 
                                                               (= x129 (- i1 x130)))) 
                                                       (MS1 x129 x124 s20))))))))))))
         :named hyp30))
(assert (! (and 
               (forall ((x131 PZA) (x132 PZA) (x133 PZA)) 
                   (=> 
                       (cnc x131 x132 x133) 
                       (and 
                           (seq x131) 
                           (seq x132) 
                           (seq x133)))) 
               (forall ((x134 PZA) (x135 PZA) (x136 PZA) (x137 PZA)) 
                   (=> 
                       (and 
                           (cnc x134 x135 x136) 
                           (cnc x134 x135 x137)) 
                       (forall ((x138 Int) (x139 A)) 
                           (= 
                               (MS1 x138 x139 x136) 
                               (MS1 x138 x139 x137))))) 
               (forall ((x140 PZA) (x141 PZA)) 
                   (=> 
                       (and 
                           (seq x140) 
                           (seq x141)) 
                       (exists ((x142 PZA)) 
                           (cnc x140 x141 x142)))))
         :named hyp31))
(assert (! (forall ((s11 PZA) (s21 PZA)) 
               (=> 
                   (and 
                       (seq s11) 
                       (seq s21)) 
                   (exists ((x143 PZA) (x144 Int)) 
                       (and 
                           (cnc s11 s21 x143) 
                           (forall ((x145 Int) (x146 Int)) 
                               (=> 
                                   (and 
                                       (length s11 x146) 
                                       (length s21 x145)) 
                                   (= x144 (+ x146 x145)))) 
                           (length x143 x144)))))
         :named hyp32))
(assert (! (forall ((s12 PZA) (s22 PZA)) 
               (=> 
                   (and 
                       (seq s12) 
                       (seq s22)) 
                   (forall ((x147 Int)) 
                       (= 
                           (exists ((x148 A) (x149 PZA)) 
                               (and 
                                   (cnc s12 s22 x149) 
                                   (MS1 x147 x148 x149))) 
                           (and 
                               (<= 1 x147) 
                               (forall ((x150 Int) (x151 Int)) 
                                   (=> 
                                       (and 
                                           (length s12 x151) 
                                           (length s22 x150)) 
                                       (<= x147 (+ x151 x150)))))))))
         :named hyp33))
(assert (! (forall ((s13 PZA) (s23 PZA)) 
               (=> 
                   (and 
                       (seq s13) 
                       (seq s23)) 
                   (forall ((x152 A)) 
                       (= 
                           (exists ((x153 Int) (x154 PZA)) 
                               (and 
                                   (cnc s13 s23 x154) 
                                   (MS1 x153 x152 x154))) 
                           (or 
                               (exists ((x155 Int)) 
                                   (MS1 x155 x152 s13)) 
                               (exists ((x156 Int)) 
                                   (MS1 x156 x152 s23)))))))
         :named hyp34))
(assert (! (forall ((s14 PZA) (s24 PZA) (i2 Int)) 
               (=> 
                   (and 
                       (seq s14) 
                       (seq s24) 
                       (<= 1 i2) 
                       (forall ((x157 Int)) 
                           (=> 
                               (length s14 x157) 
                               (<= i2 x157)))) 
                   (exists ((x158 PZA)) 
                       (and 
                           (cnc s14 s24 x158) 
                           (exists ((x159 A)) 
                               (and 
                                   (MS1 i2 x159 s14) 
                                   (MS1 i2 x159 x158)))))))
         :named hyp35))
(assert (! (forall ((s15 PZA) (s25 PZA) (i3 Int)) 
               (=> 
                   (and 
                       (seq s15) 
                       (seq s25) 
                       (forall ((x160 Int)) 
                           (=> 
                               (length s15 x160) 
                               (<= (+ x160 1) i3))) 
                       (forall ((x161 Int) (x162 Int)) 
                           (=> 
                               (and 
                                   (length s15 x162) 
                                   (length s25 x161)) 
                               (<= i3 (+ x162 x161))))) 
                   (exists ((x163 PZA)) 
                       (and 
                           (cnc s15 s25 x163) 
                           (exists ((x164 A)) 
                               (and 
                                   (exists ((x165 Int)) 
                                       (and 
                                           (forall ((x166 Int)) 
                                               (=> 
                                                   (length s15 x166) 
                                                   (= x165 (- i3 x166)))) 
                                           (MS1 x165 x164 s25))) 
                                   (MS1 i3 x164 x163)))))))
         :named hyp36))
(assert (! (forall ((x167 A) (x168 A)) 
               (not 
                   (and 
                       (MS0 x167 x168 r) 
                       (= x167 x168))))
         :named hyp37))
(assert (! (and 
               (forall ((x169 A) (x170 A) (x171 Int)) 
                   (=> 
                       (dist x169 x170 x171) 
                       (and 
                           (MS x169 a) 
                           (MS x170 a) 
                           (<= 0 x171)))) 
               (forall ((x172 A) (x173 A) (x174 Int) (x175 Int)) 
                   (=> 
                       (and 
                           (dist x172 x173 x174) 
                           (dist x172 x173 x175)) 
                       (= x174 x175))) 
               (forall ((x176 A) (x177 A)) 
                   (=> 
                       (and 
                           (MS x176 a) 
                           (MS x177 a)) 
                       (exists ((x178 Int)) 
                           (dist x176 x177 x178)))))
         :named hyp38))
(assert (! (forall ((x179 A) (y0 A)) 
               (=> 
                   (and 
                       (MS x179 a) 
                       (MS y0 a)) 
                   (exists ((x180 Int)) 
                       (and 
                           (exists ((x181 PZA)) 
                               (and 
                                   (exists ((x182 A) (x183 A)) 
                                       (and 
                                           (= x182 x179) 
                                           (= x183 y0) 
                                           (path x182 x183 x181))) 
                                   (length x181 x180))) 
                           (forall ((x184 Int)) 
                               (=> 
                                   (exists ((x185 PZA)) 
                                       (and 
                                           (exists ((x186 A) (x187 A)) 
                                               (and 
                                                   (= x186 x179) 
                                                   (= x187 y0) 
                                                   (path x186 x187 x185))) 
                                           (length x185 x184))) 
                                   (<= x180 x184))) 
                           (dist x179 y0 x180)))))
         :named hyp39))
(assert (! (forall ((x188 PZA) (x189 PZA)) 
               (= 
                   (reverse x188 x189) 
                   (exists ((s6 PZA)) 
                       (and 
                           (seq s6) 
                           (forall ((x190 Int) (x191 A)) 
                               (= 
                                   (MS1 x190 x191 x188) 
                                   (MS1 x190 x191 s6))) 
                           (forall ((x192 Int) (x193 A)) 
                               (= 
                                   (MS1 x192 x193 x189) 
                                   (exists ((i4 Int)) 
                                       (and 
                                           (<= 1 i4) 
                                           (forall ((x194 Int)) 
                                               (=> 
                                                   (length s6 x194) 
                                                   (<= i4 x194))) 
                                           (= x192 i4) 
                                           (exists ((x195 Int)) 
                                               (and 
                                                   (forall ((x196 Int)) 
                                                       (=> 
                                                           (length s6 x196) 
                                                           (= x195 (+ (- x196 i4) 1)))) 
                                                   (MS1 x195 x193 s6)))))))))))
         :named hyp40))
(assert (! (and 
               (forall ((x197 PZA) (x198 PZA)) 
                   (=> 
                       (reverse x197 x198) 
                       (and 
                           (seq x197) 
                           (seq x198)))) 
               (forall ((x199 PZA) (x200 PZA) (x201 PZA)) 
                   (=> 
                       (and 
                           (reverse x199 x200) 
                           (reverse x199 x201)) 
                       (forall ((x202 Int) (x203 A)) 
                           (= 
                               (MS1 x202 x203 x200) 
                               (MS1 x202 x203 x201))))) 
               (forall ((x204 PZA)) 
                   (=> 
                       (seq x204) 
                       (exists ((x205 PZA)) 
                           (reverse x204 x205)))))
         :named hyp41))
(assert (! (forall ((s7 PZA)) 
               (=> 
                   (seq s7) 
                   (exists ((x206 PZA) (x207 Int)) 
                       (and 
                           (reverse s7 x206) 
                           (length s7 x207) 
                           (length x206 x207)))))
         :named hyp42))
(assert (! (forall ((s8 PZA)) 
               (=> 
                   (seq s8) 
                   (forall ((x208 A)) 
                       (= 
                           (exists ((x209 Int) (x210 PZA)) 
                               (and 
                                   (reverse s8 x210) 
                                   (MS1 x209 x208 x210))) 
                           (exists ((x211 Int)) 
                               (MS1 x211 x208 s8))))))
         :named hyp43))
(assert (! (forall ((s9 PZA)) 
               (=> 
                   (seq s9) 
                   (exists ((x212 PZA)) 
                       (and 
                           (reverse s9 x212) 
                           (reverse x212 s9)))))
         :named hyp44))
(assert (! (forall ((x213 A) (x214 A)) 
               (=> 
                   (MS0 x213 x214 r) 
                   (MS0 x214 x213 r)))
         :named hyp45))
(assert (! (forall ((x215 A) (y3 A) (p2 PZA)) 
               (=> 
                   (path x215 y3 p2) 
                   (exists ((x216 PZA)) 
                       (and 
                           (reverse p2 x216) 
                           (path y3 x215 x216)))))
         :named hyp46))
(assert (! (forall ((x217 A) (y4 A)) 
               (=> 
                   (and 
                       (MS x217 a) 
                       (MS y4 a)) 
                   (forall ((x218 PZA)) 
                       (= 
                           (exists ((x219 A) (x220 A)) 
                               (and 
                                   (= x219 y4) 
                                   (= x220 x217) 
                                   (path x219 x220 x218))) 
                           (exists ((x221 PZA)) 
                               (and 
                                   (exists ((x222 A) (x223 A)) 
                                       (and 
                                           (= x222 x217) 
                                           (= x223 y4) 
                                           (path x222 x223 x221))) 
                                   (reverse x221 x218)))))))
         :named hyp47))
(assert (! (forall ((x224 A) (y5 A)) 
               (=> 
                   (and 
                       (MS x224 a) 
                       (MS y5 a)) 
                   (exists ((x225 Int)) 
                       (and 
                           (dist y5 x224 x225) 
                           (dist x224 y5 x225)))))
         :named hyp48))
(assert (! (forall ((x226 A) (x227 A) (x228 PZA)) 
               (= 
                   (shpath x226 x227 x228) 
                   (exists ((x229 A) (y6 A) (p3 PZA)) 
                       (and 
                           (path x229 y6 p3) 
                           (exists ((x230 Int)) 
                               (and 
                                   (length p3 x230) 
                                   (dist x229 y6 x230))) 
                           (= x226 x229) 
                           (= x227 y6) 
                           (forall ((x231 Int) (x232 A)) 
                               (= 
                                   (MS1 x231 x232 x228) 
                                   (MS1 x231 x232 p3)))))))
         :named hyp49))
(assert (! (forall ((x233 A) (y7 A) (p4 PZA)) 
               (=> 
                   (path x233 y7 p4) 
                   (and 
                       (exists ((x234 Int)) 
                           (dist x233 y7 x234)) 
                       (forall ((x235 A) (x236 A) (x237 Int) (x238 Int)) 
                           (=> 
                               (and 
                                   (dist x235 x236 x237) 
                                   (dist x235 x236 x238)) 
                               (= x237 x238))) 
                       (exists ((x239 Int)) 
                           (length p4 x239)) 
                       (forall ((x240 PZA) (x241 Int) (x242 Int)) 
                           (=> 
                               (and 
                                   (length x240 x241) 
                                   (length x240 x242)) 
                               (= x241 x242))))))
         :named hyp50))
(assert (! (forall ((x243 A) (y8 A)) 
               (=> 
                   (and 
                       (MS x243 a) 
                       (MS y8 a)) 
                   (exists ((x244 PZA)) 
                       (shpath x243 y8 x244))))
         :named hyp51))
(assert (! (forall ((y13 A) (y22 A) (x245 A) (x1100 A) (p5 PZA) (q2 PZA)) 
               (=> 
                   (and 
                       (MS y13 a) 
                       (MS y22 a) 
                       (MS x245 a) 
                       (MS x1100 a) 
                       (path x245 y13 q2) 
                       (path y22 x1100 p5) 
                       (MS0 x1100 x245 r)) 
                   (exists ((x246 PZA)) 
                       (and 
                           (cnc p5 q2 x246) 
                           (path y22 y13 x246)))))
         :named hyp52))
(assert (! (forall ((x247 A) (y9 A) (p6 PZA) (i5 Int)) 
               (=> 
                   (and 
                       (MS x247 a) 
                       (MS y9 a) 
                       (path x247 y9 p6) 
                       (<= 2 i5) 
                       (forall ((x248 Int)) 
                           (=> 
                               (length p6 x248) 
                               (<= i5 (- x248 1))))) 
                   (exists ((x249 A) (x250 PZA)) 
                       (and 
                           (MS1 i5 x249 p6) 
                           (forall ((x251 Int) (x252 A)) 
                               (= 
                                   (MS1 x251 x252 x250) 
                                   (and 
                                       (MS1 x251 x252 p6) 
                                       (<= 1 x251) 
                                       (<= x251 i5)))) 
                           (path x247 x249 x250)))))
         :named hyp53))
(assert (! (forall ((x253 A) (y23 A) (p7 PZA)) 
               (=> 
                   (and 
                       (MS x253 a) 
                       (MS y23 a) 
                       (path x253 y23 p7) 
                       (forall ((x254 Int)) 
                           (=> 
                               (length p7 x254) 
                               (<= 3 x254)))) 
                   (exists ((x255 A) (x256 PZA)) 
                       (and 
                           (exists ((x257 PZA)) 
                               (and 
                                   (reverse p7 x257) 
                                   (exists ((x258 Int)) 
                                       (and 
                                           (forall ((x259 Int)) 
                                               (=> 
                                                   (length p7 x259) 
                                                   (= x258 (- x259 1)))) 
                                           (MS1 x258 x255 x257))))) 
                           (forall ((x260 Int) (x261 A)) 
                               (= 
                                   (MS1 x260 x261 x256) 
                                   (and 
                                       (exists ((x262 PZA)) 
                                           (and 
                                               (reverse p7 x262) 
                                               (MS1 x260 x261 x262))) 
                                       (<= 1 x260) 
                                       (forall ((x263 Int)) 
                                           (=> 
                                               (length p7 x263) 
                                               (<= x260 (- x263 1))))))) 
                           (path y23 x255 x256)))))
         :named hyp54))
(assert (! (forall ((x264 A) (y14 A) (p8 PZA)) 
               (=> 
                   (shpath x264 y14 p8) 
                   (exists ((x265 PZA)) 
                       (and 
                           (reverse p8 x265) 
                           (shpath y14 x264 x265)))))
         :named hyp55))
(assert (! (forall ((x266 A) (x267 A) (x268 PZA)) 
               (= 
                   (path x266 x267 x268) 
                   (exists ((x269 A) (y15 A) (p9 PZA)) 
                       (and 
                           (MS x269 a) 
                           (MS y15 a) 
                           (exists ((n3 Int)) 
                               (and 
                                   (<= 0 n3) 
                                   (< 1 n3) 
                                   (forall ((x270 Int) (x271 A)) 
                                       (=> 
                                           (MS1 x270 x271 p9) 
                                           (and 
                                               (<= 1 x270) 
                                               (<= x270 n3) 
                                               (MS x271 a)))) 
                                   (forall ((x272 Int) (x273 A) (x274 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x272 x273 p9) 
                                               (MS1 x272 x274 p9)) 
                                           (= x273 x274))) 
                                   (forall ((x275 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 x275) 
                                               (<= x275 n3)) 
                                           (exists ((x276 A)) 
                                               (MS1 x275 x276 p9)))) 
                                   (exists ((x277 Int)) 
                                       (and 
                                           (= x277 1) 
                                           (MS1 x277 x269 p9))) 
                                   (MS1 n3 y15 p9) 
                                   (forall ((i6 Int)) 
                                       (=> 
                                           (and 
                                               (<= 1 i6) 
                                               (<= i6 (- n3 1))) 
                                           (exists ((x278 A) (x279 A)) 
                                               (and 
                                                   (MS1 i6 x278 p9) 
                                                   (exists ((x280 Int)) 
                                                       (and 
                                                           (= x280 (+ i6 1)) 
                                                           (MS1 x280 x279 p9))) 
                                                   (MS0 x278 x279 r))))))) 
                           (= x266 x269) 
                           (= x267 y15) 
                           (forall ((x281 Int) (x282 A)) 
                               (= 
                                   (MS1 x281 x282 x268) 
                                   (MS1 x281 x282 p9)))))))
         :named hyp56))
(assert (! (forall ((x283 A)) 
               (= 
                   (MS x283 candidate) 
                   (exists ((z3 A)) 
                       (and 
                           (MS z3 a) 
                           (forall ((x284 A) (y16 A)) 
                               (=> 
                                   (and 
                                       (MS x284 a) 
                                       (not 
                                           (= x284 z3)) 
                                       (MS y16 a) 
                                       (not 
                                           (= y16 z3)) 
                                       (not 
                                           (= x284 y16))) 
                                   (exists ((p10 PZA)) 
                                       (and 
                                           (exists ((x285 A) (x286 A)) 
                                               (and 
                                                   (= x285 x284) 
                                                   (= x286 y16) 
                                                   (path x285 x286 p10))) 
                                           (not 
                                               (exists ((x287 Int)) 
                                                   (MS1 x287 z3 p10))))))) 
                           (= x283 z3)))))
         :named hyp57))
(assert (! (forall ((u A)) 
               (=> 
                   (MS u candidate) 
                   (forall ((x288 A) (x289 A)) 
                       (=> 
                           (and 
                               (MS x288 a) 
                               (not 
                                   (= x288 u)) 
                               (MS x289 a) 
                               (not 
                                   (= x289 u)) 
                               (not 
                                   (= x288 x289))) 
                           (exists ((x290 A) (y17 A) (p11 PZA)) 
                               (and 
                                   (MS x290 a) 
                                   (not 
                                       (= x290 u)) 
                                   (MS y17 a) 
                                   (not 
                                       (= y17 u)) 
                                   (not 
                                       (= x290 y17)) 
                                   (exists ((n4 Int)) 
                                       (and 
                                           (<= 0 n4) 
                                           (< 1 n4) 
                                           (forall ((x291 Int) (x292 A)) 
                                               (=> 
                                                   (MS1 x291 x292 p11) 
                                                   (and 
                                                       (<= 1 x291) 
                                                       (<= x291 n4) 
                                                       (MS x292 a) 
                                                       (not 
                                                           (= x292 u))))) 
                                           (forall ((x293 Int) (x294 A) (x295 A)) 
                                               (=> 
                                                   (and 
                                                       (MS1 x293 x294 p11) 
                                                       (MS1 x293 x295 p11)) 
                                                   (= x294 x295))) 
                                           (forall ((x296 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 x296) 
                                                       (<= x296 n4)) 
                                                   (exists ((x297 A)) 
                                                       (MS1 x296 x297 p11)))) 
                                           (exists ((x298 Int)) 
                                               (and 
                                                   (= x298 1) 
                                                   (MS1 x298 x290 p11))) 
                                           (MS1 n4 y17 p11) 
                                           (forall ((i7 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i7) 
                                                       (<= i7 (- n4 1))) 
                                                   (exists ((x299 A) (x300 A)) 
                                                       (and 
                                                           (MS1 i7 x299 p11) 
                                                           (exists ((x301 Int)) 
                                                               (and 
                                                                   (= x301 (+ i7 1)) 
                                                                   (MS1 x301 x300 p11))) 
                                                           (MS0 x299 x300 r))))))) 
                                   (= x288 x290) 
                                   (= x289 y17)))))))
         :named hyp58))
(assert (! (forall ((s16 PZA) (s26 PZA)) 
               (=> 
                   (and 
                       (seq s16) 
                       (seq s26)) 
                   (and 
                       (exists ((x302 Int)) 
                           (length s16 x302)) 
                       (forall ((x303 PZA) (x304 Int) (x305 Int)) 
                           (=> 
                               (and 
                                   (length x303 x304) 
                                   (length x303 x305)) 
                               (= x304 x305))) 
                       (forall ((i8 Int)) 
                           (=> 
                               (and 
                                   (<= 1 i8) 
                                   (forall ((x306 Int)) 
                                       (=> 
                                           (length s16 x306) 
                                           (<= i8 x306)))) 
                               (and 
                                   (exists ((x307 A)) 
                                       (MS1 i8 x307 s16)) 
                                   (forall ((x308 Int) (x309 A) (x310 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x308 x309 s16) 
                                               (MS1 x308 x310 s16)) 
                                           (= x309 x310)))))) 
                       (exists ((x311 Int)) 
                           (length s26 x311)) 
                       (forall ((i9 Int)) 
                           (=> 
                               (and 
                                   (forall ((x312 Int)) 
                                       (=> 
                                           (length s16 x312) 
                                           (<= (+ x312 1) i9))) 
                                   (forall ((x313 Int) (x314 Int)) 
                                       (=> 
                                           (and 
                                               (length s16 x314) 
                                               (length s26 x313)) 
                                           (<= i9 (+ x314 x313))))) 
                               (and 
                                   (exists ((x315 A) (x316 Int)) 
                                       (and 
                                           (forall ((x317 Int)) 
                                               (=> 
                                                   (length s16 x317) 
                                                   (= x316 (- i9 x317)))) 
                                           (MS1 x316 x315 s26))) 
                                   (forall ((x318 Int) (x319 A) (x320 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x318 x319 s26) 
                                               (MS1 x318 x320 s26)) 
                                           (= x319 x320)))))))))
         :named hyp59))
(assert (! (forall ((s17 PZA)) 
               (=> 
                   (seq s17) 
                   (and 
                       (exists ((x321 Int)) 
                           (length s17 x321)) 
                       (forall ((x322 PZA) (x323 Int) (x324 Int)) 
                           (=> 
                               (and 
                                   (length x322 x323) 
                                   (length x322 x324)) 
                               (= x323 x324))) 
                       (forall ((i10 Int)) 
                           (=> 
                               (and 
                                   (<= 1 i10) 
                                   (forall ((x325 Int)) 
                                       (=> 
                                           (length s17 x325) 
                                           (<= i10 x325)))) 
                               (and 
                                   (exists ((x326 A) (x327 Int)) 
                                       (and 
                                           (forall ((x328 Int)) 
                                               (=> 
                                                   (length s17 x328) 
                                                   (= x327 (+ (- x328 i10) 1)))) 
                                           (MS1 x327 x326 s17))) 
                                   (forall ((x329 Int) (x330 A) (x331 A)) 
                                       (=> 
                                           (and 
                                               (MS1 x329 x330 s17) 
                                               (MS1 x329 x331 s17)) 
                                           (= x330 x331)))))))))
         :named hyp60))
(assert (! (forall ((x332 A) (y18 A) (p12 PZA) (i11 Int)) 
               (=> 
                   (and 
                       (MS x332 a) 
                       (MS y18 a) 
                       (seq p12) 
                       (shpath x332 y18 p12) 
                       (exists ((x333 A)) 
                           (MS1 i11 x333 p12)) 
                       (not 
                           (= i11 1)) 
                       (not 
                           (length p12 i11))) 
                   (exists ((x334 A) (x335 PZA)) 
                       (and 
                           (MS1 i11 x334 p12) 
                           (forall ((x336 Int) (x337 A)) 
                               (= 
                                   (MS1 x336 x337 x335) 
                                   (and 
                                       (MS1 x336 x337 p12) 
                                       (<= 1 x336) 
                                       (<= x336 i11)))) 
                           (shpath x332 x334 x335)))))
         :named hyp61))
(assert (! (forall ((x338 A) (y19 A) (p13 PZA) (i12 Int)) 
               (=> 
                   (and 
                       (MS x338 a) 
                       (MS y19 a) 
                       (seq p13) 
                       (shpath x338 y19 p13) 
                       (exists ((x339 A)) 
                           (MS1 i12 x339 p13)) 
                       (not 
                           (= i12 1)) 
                       (not 
                           (length p13 i12))) 
                   (and 
                       (exists ((x340 A)) 
                           (and 
                               (MS1 i12 x340 p13) 
                               (dist x338 x340 i12))) 
                       (exists ((x341 A) (x342 Int)) 
                           (and 
                               (exists ((x343 Int)) 
                                   (and 
                                       (= x343 (+ i12 1)) 
                                       (MS1 x343 x341 p13))) 
                               (= x342 (+ i12 1)) 
                               (dist x338 x341 x342))) 
                       (exists ((x344 A) (x345 A)) 
                           (and 
                               (MS1 i12 x344 p13) 
                               (exists ((x346 Int)) 
                                   (and 
                                       (= x346 (+ i12 1)) 
                                       (MS1 x346 x345 p13))) 
                               (MS0 x344 x345 r))))))
         :named hyp62))
(assert (! (forall ((x347 A) (y24 A) (p14 PZA) (z4 A)) 
               (=> 
                   (and 
                       (MS x347 a) 
                       (MS y24 a) 
                       (seq p14) 
                       (shpath x347 y24 p14) 
                       (exists ((x348 Int)) 
                           (MS1 x348 z4 p14)) 
                       (not 
                           (= z4 x347)) 
                       (not 
                           (= z4 y24))) 
                   (exists ((t3 A)) 
                       (and 
                           (MS t3 a) 
                           (forall ((x349 Int) (x350 Int)) 
                               (=> 
                                   (and 
                                       (dist x347 z4 x350) 
                                       (dist x347 t3 x349)) 
                                   (< x350 x349))) 
                           (MS0 z4 t3 r)))))
         :named hyp63))
(assert (! (forall ((x351 A) (y25 A) (z5 A)) 
               (=> 
                   (and 
                       (MS x351 a) 
                       (MS y25 a) 
                       (MS z5 a) 
                       (not 
                           (= z5 x351)) 
                       (not 
                           (= z5 y25)) 
                       (forall ((t4 A)) 
                           (=> 
                               (and 
                                   (MS t4 a) 
                                   (MS0 z5 t4 r)) 
                               (forall ((x352 Int) (x353 Int)) 
                                   (=> 
                                       (and 
                                           (dist x351 t4 x353) 
                                           (dist x351 z5 x352)) 
                                       (<= x353 x352)))))) 
                   (exists ((q3 PZA)) 
                       (and 
                           (path x351 y25 q3) 
                           (not 
                               (exists ((x354 Int)) 
                                   (MS1 x354 z5 q3)))))))
         :named hyp64))
(assert (! (forall ((x355 A) (x356 A)) 
               (=> 
                   (and 
                       (MS x355 a) 
                       (MS x356 a)) 
                   (MS0 x355 x356 c)))
         :named hyp65))
(assert (! (not 
               (forall ((x357 A)) 
                   (MS x357 a)))
         :named hyp66))
(assert (! (forall ((s18 PZA) (s27 PZA) (b PA)) 
               (=> 
                   (and 
                       (seq s18) 
                       (seq s27) 
                       (forall ((x358 A)) 
                           (=> 
                               (exists ((x359 Int)) 
                                   (MS1 x359 x358 s18)) 
                               (MS x358 b))) 
                       (forall ((x360 A)) 
                           (=> 
                               (exists ((x361 Int)) 
                                   (MS1 x361 x360 s27)) 
                               (MS x360 b)))) 
                   (and 
                       (forall ((x362 Int) (x363 A)) 
                           (=> 
                               (exists ((x364 PZA)) 
                                   (and 
                                       (cnc s18 s27 x364) 
                                       (MS1 x362 x363 x364))) 
                               (and 
                                   (<= 1 x362) 
                                   (forall ((x365 Int) (x366 Int)) 
                                       (=> 
                                           (and 
                                               (length s18 x366) 
                                               (length s27 x365)) 
                                           (<= x362 (+ x366 x365)))) 
                                   (MS x363 b)))) 
                       (forall ((x367 Int) (x368 A) (x369 A)) 
                           (=> 
                               (and 
                                   (exists ((x370 PZA)) 
                                       (and 
                                           (cnc s18 s27 x370) 
                                           (MS1 x367 x368 x370))) 
                                   (exists ((x371 PZA)) 
                                       (and 
                                           (cnc s18 s27 x371) 
                                           (MS1 x367 x369 x371)))) 
                               (= x368 x369))) 
                       (forall ((x372 Int)) 
                           (=> 
                               (and 
                                   (<= 1 x372) 
                                   (forall ((x373 Int) (x374 Int)) 
                                       (=> 
                                           (and 
                                               (length s18 x374) 
                                               (length s27 x373)) 
                                           (<= x372 (+ x374 x373))))) 
                               (exists ((x375 A) (x376 PZA)) 
                                   (and 
                                       (cnc s18 s27 x376) 
                                       (MS1 x372 x375 x376))))))))
         :named hyp67))
(assert (! (forall ((x377 A) (x378 A) (x379 PZA)) 
               (= 
                   (path x377 x378 x379) 
                   (exists ((x380 A) (y26 A) (p15 PZA)) 
                       (and 
                           (seq p15) 
                           (forall ((x381 A)) 
                               (=> 
                                   (exists ((x382 Int)) 
                                       (MS1 x382 x381 p15)) 
                                   (MS x381 a))) 
                           (forall ((x383 Int)) 
                               (=> 
                                   (length p15 x383) 
                                   (< 1 x383))) 
                           (exists ((x384 Int)) 
                               (and 
                                   (= x384 1) 
                                   (MS1 x384 x380 p15))) 
                           (exists ((x385 Int)) 
                               (and 
                                   (length p15 x385) 
                                   (MS1 x385 y26 p15))) 
                           (forall ((i13 Int)) 
                               (=> 
                                   (and 
                                       (<= 1 i13) 
                                       (forall ((x386 Int)) 
                                           (=> 
                                               (length p15 x386) 
                                               (<= i13 (- x386 1))))) 
                                   (exists ((x387 A) (x388 A)) 
                                       (and 
                                           (MS1 i13 x387 p15) 
                                           (exists ((x389 Int)) 
                                               (and 
                                                   (= x389 (+ i13 1)) 
                                                   (MS1 x389 x388 p15))) 
                                           (MS0 x387 x388 r))))) 
                           (= x377 x380) 
                           (= x378 y26) 
                           (forall ((x390 Int) (x391 A)) 
                               (= 
                                   (MS1 x390 x391 x379) 
                                   (MS1 x390 x391 p15)))))))
         :named hyp68))
(assert (! (forall ((x392 A) (y27 A) (p16 PZA)) 
               (=> 
                   (and 
                       (seq p16) 
                       (forall ((x393 A)) 
                           (=> 
                               (exists ((x394 Int)) 
                                   (MS1 x394 x393 p16)) 
                               (MS x393 a)))) 
                   (and 
                       (exists ((x395 Int)) 
                           (length p16 x395)) 
                       (forall ((x396 PZA) (x397 Int) (x398 Int)) 
                           (=> 
                               (and 
                                   (length x396 x397) 
                                   (length x396 x398)) 
                               (= x397 x398))) 
                       (=> 
                           (forall ((x399 Int)) 
                               (=> 
                                   (length p16 x399) 
                                   (< 1 x399))) 
                           (and 
                               (exists ((x400 A) (x401 Int)) 
                                   (and 
                                       (= x401 1) 
                                       (MS1 x401 x400 p16))) 
                               (forall ((x402 Int) (x403 A) (x404 A)) 
                                   (=> 
                                       (and 
                                           (MS1 x402 x403 p16) 
                                           (MS1 x402 x404 p16)) 
                                       (= x403 x404))) 
                               (=> 
                                   (exists ((x405 Int)) 
                                       (and 
                                           (= x405 1) 
                                           (MS1 x405 x392 p16))) 
                                   (and 
                                       (exists ((x406 A) (x407 Int)) 
                                           (and 
                                               (length p16 x407) 
                                               (MS1 x407 x406 p16))) 
                                       (=> 
                                           (exists ((x408 Int)) 
                                               (and 
                                                   (length p16 x408) 
                                                   (MS1 x408 y27 p16))) 
                                           (forall ((i14 Int)) 
                                               (=> 
                                                   (and 
                                                       (<= 1 i14) 
                                                       (forall ((x409 Int)) 
                                                           (=> 
                                                               (length p16 x409) 
                                                               (<= i14 (- x409 1))))) 
                                                   (and 
                                                       (exists ((x410 A)) 
                                                           (MS1 i14 x410 p16)) 
                                                       (exists ((x411 A) (x412 Int)) 
                                                           (and 
                                                               (= x412 (+ i14 1)) 
                                                               (MS1 x412 x411 p16))))))))))))))
         :named hyp69))
(assert (! (not 
               (exists ((x413 Int)) 
                   (dist x t x413)))
         :named goal))
(check-sat)
(exit)

