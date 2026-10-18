(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort B 0)
(declare-sort PB0 0)
(declare-sort PBB 0)
(declare-sort R 0)
(declare-fun MS (B B PBB) Bool)
(declare-fun MS0 (B PB0) Bool)
(declare-fun fst (R B) Bool)
(declare-fun lst (R B) Bool)
(declare-fun nxt (R PBB) Bool)
(declare-fun resrt (R) Bool)
(declare-fun rsrtbl (B R) Bool)
(declare-fun rtbl (B R) Bool)
(declare-fun OCC () PB0)
(declare-fun b () B)
(declare-fun n () PBB)
(declare-fun resbl () PB0)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x129 B)) 
            (exists ((X PB0)) 
                (and 
                    (MS0 x129 X) 
                    (forall ((y B)) 
                        (=> 
                            (MS0 y X) 
                            (= y x129)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x130 B) (x131 B)) 
            (exists ((X0 PBB)) 
                (and 
                    (MS x130 x131 X0) 
                    (forall ((y0 B) (y1 B)) 
                        (=> 
                            (MS y0 y1 X0) 
                            (and 
                                (= y0 x130) 
                                (= y1 x131))))))))
(assert (! (forall ((x B)) 
               (exists ((x0 R)) 
                   (rtbl x x0)))
         :named hyp1))
(assert (! (forall ((x1 R)) 
               (exists ((x2 B)) 
                   (rtbl x2 x1)))
         :named hyp2))
(assert (! (and 
               (forall ((x3 R) (x4 PBB)) 
                   (=> 
                       (nxt x3 x4) 
                       (and 
                           (forall ((x5 B) (x6 B) (x7 B)) 
                               (=> 
                                   (and 
                                       (MS x5 x6 x4) 
                                       (MS x5 x7 x4)) 
                                   (= x6 x7))) 
                           (forall ((x8 B) (x9 B) (x10 B)) 
                               (=> 
                                   (and 
                                       (MS x9 x8 x4) 
                                       (MS x10 x8 x4)) 
                                   (= x9 x10)))))) 
               (forall ((x11 R) (x12 PBB) (x13 PBB)) 
                   (=> 
                       (and 
                           (nxt x11 x12) 
                           (nxt x11 x13)) 
                       (forall ((x14 B) (x15 B)) 
                           (= 
                               (MS x14 x15 x12) 
                               (MS x14 x15 x13))))) 
               (forall ((x16 R)) 
                   (exists ((x17 PBB)) 
                       (nxt x16 x17))))
         :named hyp3))
(assert (! (and 
               (forall ((x18 R) (x19 B) (x20 B)) 
                   (=> 
                       (and 
                           (fst x18 x19) 
                           (fst x18 x20)) 
                       (= x19 x20))) 
               (forall ((x21 R)) 
                   (exists ((x22 B)) 
                       (fst x21 x22))))
         :named hyp4))
(assert (! (and 
               (forall ((x23 R) (x24 B) (x25 B)) 
                   (=> 
                       (and 
                           (lst x23 x24) 
                           (lst x23 x25)) 
                       (= x24 x25))) 
               (forall ((x26 R)) 
                   (exists ((x27 B)) 
                       (lst x26 x27))))
         :named hyp5))
(assert (! (forall ((x28 B) (x29 R)) 
               (=> 
                   (fst x29 x28) 
                   (rtbl x28 x29)))
         :named hyp6))
(assert (! (forall ((x30 B) (x31 R)) 
               (=> 
                   (lst x31 x30) 
                   (rtbl x30 x31)))
         :named hyp7))
(assert (! (and 
               (forall ((x32 B) (x33 R)) 
                   (=> 
                       (rsrtbl x32 x33) 
                       (and 
                           (MS0 x32 resbl) 
                           (resrt x33)))) 
               (forall ((x34 B) (x35 R) (x36 R)) 
                   (=> 
                       (and 
                           (rsrtbl x34 x35) 
                           (rsrtbl x34 x36)) 
                       (= x35 x36))) 
               (forall ((x37 B)) 
                   (=> 
                       (MS0 x37 resbl) 
                       (exists ((x38 R)) 
                           (rsrtbl x37 x38)))))
         :named hyp8))
(assert (! (forall ((x39 B) (x40 R)) 
               (=> 
                   (rsrtbl x39 x40) 
                   (rtbl x39 x40)))
         :named hyp9))
(assert (! (forall ((x41 B)) 
               (=> 
                   (MS0 x41 OCC) 
                   (MS0 x41 resbl)))
         :named hyp10))
(assert (! (MS0 b OCC)
         :named hyp11))
(assert (! (exists ((x42 R)) 
               (and 
                   (rsrtbl b x42) 
                   (nxt x42 n)))
         :named hyp12))
(assert (! (exists ((x43 R)) 
               (rsrtbl b x43))
         :named hyp13))
(assert (! (forall ((x44 B) (x45 R) (x46 R)) 
               (=> 
                   (and 
                       (rsrtbl x44 x45) 
                       (rsrtbl x44 x46)) 
                   (= x45 x46)))
         :named hyp14))
(assert (! (exists ((x47 PBB) (x48 R)) 
               (and 
                   (rsrtbl b x48) 
                   (nxt x48 x47)))
         :named hyp15))
(assert (! (forall ((x49 R) (x50 PBB) (x51 PBB)) 
               (=> 
                   (and 
                       (nxt x49 x50) 
                       (nxt x49 x51)) 
                   (forall ((x52 B) (x53 B)) 
                       (= 
                           (MS x52 x53 x50) 
                           (MS x52 x53 x51)))))
         :named hyp16))
(assert (! (=> 
               (exists ((x54 B)) 
                   (MS b x54 n)) 
               (exists ((x55 B)) 
                   (and 
                       (MS b x55 n) 
                       (MS0 x55 OCC))))
         :named hyp17))
(assert (! (=> 
               (exists ((x56 B)) 
                   (MS b x56 n)) 
               (forall ((x57 B) (x58 B) (x59 B)) 
                   (=> 
                       (and 
                           (MS x57 x58 n) 
                           (MS x57 x59 n)) 
                       (= x58 x59))))
         :named hyp18))
(assert (! (forall ((r R) (S PB0)) 
               (=> 
                   (forall ((x60 B)) 
                       (=> 
                           (MS0 x60 S) 
                           (exists ((x61 B)) 
                               (and 
                                   (MS0 x61 S) 
                                   (exists ((x62 PBB)) 
                                       (and 
                                           (nxt r x62) 
                                           (MS x61 x60 x62))))))) 
                   (forall ((x63 B)) 
                       (not 
                           (MS0 x63 S)))))
         :named hyp19))
(assert (! (and 
               (forall ((r0 R)) 
                   (forall ((x64 B) (x65 B)) 
                       (=> 
                           (exists ((x66 PBB)) 
                               (and 
                                   (nxt r0 x66) 
                                   (MS x64 x65 x66))) 
                           (and 
                               (exists ((x67 R)) 
                                   (and 
                                       (= x67 r0) 
                                       (rtbl x64 x67))) 
                               (not 
                                   (lst r0 x64)) 
                               (exists ((x68 R)) 
                                   (and 
                                       (= x68 r0) 
                                       (rtbl x65 x68))) 
                               (not 
                                   (fst r0 x65)))))) 
               (forall ((r1 R)) 
                   (forall ((x69 B) (x70 B) (x71 B)) 
                       (=> 
                           (and 
                               (exists ((x72 PBB)) 
                                   (and 
                                       (nxt r1 x72) 
                                       (MS x69 x70 x72))) 
                               (exists ((x73 PBB)) 
                                   (and 
                                       (nxt r1 x73) 
                                       (MS x69 x71 x73)))) 
                           (= x70 x71)))) 
               (forall ((r2 R)) 
                   (forall ((x74 B)) 
                       (=> 
                           (and 
                               (exists ((x75 R)) 
                                   (and 
                                       (= x75 r2) 
                                       (rtbl x74 x75))) 
                               (not 
                                   (lst r2 x74))) 
                           (exists ((x76 B) (x77 PBB)) 
                               (and 
                                   (nxt r2 x77) 
                                   (MS x74 x76 x77)))))) 
               (forall ((r3 R)) 
                   (forall ((x78 B)) 
                       (=> 
                           (and 
                               (exists ((x79 R)) 
                                   (and 
                                       (= x79 r3) 
                                       (rtbl x78 x79))) 
                               (not 
                                   (fst r3 x78))) 
                           (exists ((x80 B) (x81 PBB)) 
                               (and 
                                   (nxt r3 x81) 
                                   (MS x80 x78 x81)))))) 
               (forall ((r4 R)) 
                   (forall ((x82 B) (x83 B) (x84 B)) 
                       (=> 
                           (and 
                               (exists ((x85 PBB)) 
                                   (and 
                                       (nxt r4 x85) 
                                       (MS x83 x82 x85))) 
                               (exists ((x86 PBB)) 
                                   (and 
                                       (nxt r4 x86) 
                                       (MS x84 x82 x86)))) 
                           (= x83 x84)))))
         :named hyp20))
(assert (! (forall ((r5 R) (x87 B)) 
               (=> 
                   (exists ((x88 B)) 
                       (and 
                           (exists ((x89 R)) 
                               (and 
                                   (= x89 r5) 
                                   (rsrtbl x88 x89))) 
                           (exists ((x90 PBB)) 
                               (and 
                                   (nxt r5 x90) 
                                   (MS x88 x87 x90))))) 
                   (exists ((x91 R)) 
                       (and 
                           (= x91 r5) 
                           (rsrtbl x87 x91)))))
         :named hyp21))
(assert (! (forall ((r6 R) (x92 B)) 
               (=> 
                   (exists ((x93 B)) 
                       (and 
                           (exists ((x94 R)) 
                               (and 
                                   (= x94 r6) 
                                   (rsrtbl x93 x94))) 
                           (not 
                               (MS0 x93 OCC)) 
                           (exists ((x95 PBB)) 
                               (and 
                                   (nxt r6 x95) 
                                   (MS x93 x92 x95))))) 
                   (and 
                       (exists ((x96 R)) 
                           (and 
                               (= x96 r6) 
                               (rsrtbl x92 x96))) 
                       (not 
                           (MS0 x92 OCC)))))
         :named hyp22))
(assert (! (forall ((r7 R)) 
               (not 
                   (exists ((x97 B)) 
                       (and 
                           (lst r7 x97) 
                           (fst r7 x97)))))
         :named hyp23))
(assert (! (forall ((r8 R) (s R)) 
               (=> 
                   (not 
                       (= r8 s)) 
                   (not 
                       (and 
                           (exists ((x98 R)) 
                               (and 
                                   (= x98 s) 
                                   (exists ((x99 B)) 
                                       (and 
                                           (fst r8 x99) 
                                           (rtbl x99 x98))))) 
                           (not 
                               (or 
                                   (exists ((x100 B)) 
                                       (and 
                                           (fst s x100) 
                                           (fst r8 x100))) 
                                   (exists ((x101 B)) 
                                       (and 
                                           (lst s x101) 
                                           (fst r8 x101)))))))))
         :named hyp24))
(assert (! (forall ((r9 R) (s0 R)) 
               (=> 
                   (not 
                       (= r9 s0)) 
                   (not 
                       (and 
                           (exists ((x102 R)) 
                               (and 
                                   (= x102 s0) 
                                   (exists ((x103 B)) 
                                       (and 
                                           (lst r9 x103) 
                                           (rtbl x103 x102))))) 
                           (not 
                               (or 
                                   (exists ((x104 B)) 
                                       (and 
                                           (fst s0 x104) 
                                           (lst r9 x104))) 
                                   (exists ((x105 B)) 
                                       (and 
                                           (lst s0 x105) 
                                           (lst r9 x105)))))))))
         :named hyp25))
(assert (! (forall ((r10 R) (x106 B)) 
               (=> 
                   (and 
                       (exists ((x107 B)) 
                           (and 
                               (exists ((x108 R)) 
                                   (and 
                                       (= x108 r10) 
                                       (rtbl x107 x108))) 
                               (not 
                                   (exists ((x109 R)) 
                                       (and 
                                           (= x109 r10) 
                                           (rsrtbl x107 x109)))) 
                               (exists ((x110 PBB)) 
                                   (and 
                                       (nxt r10 x110) 
                                       (MS x107 x106 x110))))) 
                       (exists ((x111 R)) 
                           (and 
                               (= x111 r10) 
                               (rsrtbl x106 x111)))) 
                   (MS0 x106 OCC)))
         :named hyp26))
(assert (! (exists ((x112 B)) 
               (MS x112 b n))
         :named hyp27))
(assert (! (=> 
               (exists ((x113 B) (x114 PBB)) 
                   (and 
                       (exists ((x115 R)) 
                           (and 
                               (rsrtbl b x115) 
                               (nxt x115 x114))) 
                       (MS b x113 x114))) 
               (exists ((x116 B)) 
                   (and 
                       (exists ((x117 PBB)) 
                           (and 
                               (exists ((x118 R)) 
                                   (and 
                                       (rsrtbl b x118) 
                                       (nxt x118 x117))) 
                               (MS b x116 x117))) 
                       (MS0 x116 OCC))))
         :named hyp28))
(assert (! (exists ((x119 B) (x120 PBB)) 
               (and 
                   (exists ((x121 R)) 
                       (and 
                           (rsrtbl b x121) 
                           (nxt x121 x120))) 
                   (MS x119 b x120)))
         :named hyp29))
(assert (! (not 
               (forall ((x122 B) (x123 B) (x124 B)) 
                   (=> 
                       (and 
                           (exists ((x125 PBB)) 
                               (and 
                                   (exists ((x126 R)) 
                                       (and 
                                           (rsrtbl b x126) 
                                           (nxt x126 x125))) 
                                   (MS x123 x122 x125))) 
                           (exists ((x127 PBB)) 
                               (and 
                                   (exists ((x128 R)) 
                                       (and 
                                           (rsrtbl b x128) 
                                           (nxt x128 x127))) 
                                   (MS x124 x122 x127)))) 
                       (= x123 x124))))
         :named goal))
(check-sat)
(exit)

