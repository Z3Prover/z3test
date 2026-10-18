(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort D 0)
(declare-sort L 0)
(declare-sort P 0)
(declare-sort PL 0)
(declare-fun BLR (D) Bool)
(declare-fun GRN (D) Bool)
(declare-fun MS (L PL) Bool)
(declare-fun RED (D) Bool)
(declare-fun aut (P L) Bool)
(declare-fun com (L L) Bool)
(declare-fun dap (P D) Bool)
(declare-fun dst (D L) Bool)
(declare-fun mAccept (D) Bool)
(declare-fun mAckn (D) Bool)
(declare-fun mCard (D P) Bool)
(declare-fun mOff_grn (D) Bool)
(declare-fun mOff_red (D) Bool)
(declare-fun mPass (D) Bool)
(declare-fun mRefuse (D) Bool)
(declare-fun np (L L) Bool)
(declare-fun org (D L) Bool)
(declare-fun red (D) Bool)
(declare-fun sit (P L) Bool)
(declare-fun d () D)
(declare-fun outside () L)
(declare-fun p () P)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x91 L)) 
            (exists ((X PL)) 
                (and 
                    (MS x91 X) 
                    (forall ((y L)) 
                        (=> 
                            (MS y X) 
                            (= y x91)))))))
(assert (! (forall ((x P) (x0 L)) 
               (=> 
                   (= x0 outside) 
                   (aut x x0)))
         :named hyp1))
(assert (! (exists ((l L)) 
               (and 
                   (not 
                       (= l outside)) 
                   (forall ((x1 P) (x2 L)) 
                       (=> 
                           (= x2 l) 
                           (aut x1 x2)))))
         :named hyp2))
(assert (! (and 
               (forall ((x3 L) (x4 L)) 
                   (=> 
                       (np x3 x4) 
                       (not 
                           (= x3 outside)))) 
               (forall ((x5 L) (x6 L) (x7 L)) 
                   (=> 
                       (and 
                           (np x5 x6) 
                           (np x5 x7)) 
                       (= x6 x7))) 
               (forall ((x8 L)) 
                   (=> 
                       (not 
                           (= x8 outside)) 
                       (exists ((x9 L)) 
                           (np x8 x9)))))
         :named hyp3))
(assert (! (forall ((x10 L) (x11 L)) 
               (=> 
                   (np x10 x11) 
                   (com x10 x11)))
         :named hyp4))
(assert (! (forall ((s PL)) 
               (=> 
                   (forall ((x12 L)) 
                       (=> 
                           (MS x12 s) 
                           (exists ((x13 L)) 
                               (and 
                                   (MS x13 s) 
                                   (np x12 x13))))) 
                   (forall ((x14 L)) 
                       (not 
                           (MS x14 s)))))
         :named hyp5))
(assert (! (forall ((x15 P) (x16 L)) 
               (=> 
                   (and 
                       (aut x15 x16) 
                       (not 
                           (= x16 outside))) 
                   (exists ((x17 L)) 
                       (and 
                           (aut x15 x17) 
                           (np x16 x17)))))
         :named hyp6))
(assert (! (exists ((l0 L)) 
               (and 
                   (not 
                       (= l0 outside)) 
                   (com outside l0) 
                   (forall ((x18 P) (x19 L)) 
                       (=> 
                           (= x19 l0) 
                           (aut x18 x19)))))
         :named hyp7))
(assert (! (and 
               (forall ((x20 D) (x21 L) (x22 L)) 
                   (=> 
                       (and 
                           (org x20 x21) 
                           (org x20 x22)) 
                       (= x21 x22))) 
               (forall ((x23 D)) 
                   (exists ((x24 L)) 
                       (org x23 x24))))
         :named hyp8))
(assert (! (and 
               (forall ((x25 D) (x26 L) (x27 L)) 
                   (=> 
                       (and 
                           (dst x25 x26) 
                           (dst x25 x27)) 
                       (= x26 x27))) 
               (forall ((x28 D)) 
                   (exists ((x29 L)) 
                       (dst x28 x29))))
         :named hyp9))
(assert (! (forall ((x30 L) (x31 L)) 
               (= 
                   (com x30 x31) 
                   (exists ((x32 D)) 
                       (and 
                           (org x32 x30) 
                           (dst x32 x31)))))
         :named hyp10))
(assert (! (and 
               (forall ((x33 P) (x34 L) (x35 L)) 
                   (=> 
                       (and 
                           (sit x33 x34) 
                           (sit x33 x35)) 
                       (= x34 x35))) 
               (forall ((x36 P)) 
                   (exists ((x37 L)) 
                       (sit x36 x37))))
         :named hyp11))
(assert (! (forall ((x38 P) (x39 L)) 
               (=> 
                   (sit x38 x39) 
                   (aut x38 x39)))
         :named hyp12))
(assert (! (and 
               (forall ((x40 P) (x41 D) (x42 D)) 
                   (=> 
                       (and 
                           (dap x40 x41) 
                           (dap x40 x42)) 
                       (= x41 x42))) 
               (forall ((x43 D) (x44 P) (x45 P)) 
                   (=> 
                       (and 
                           (dap x44 x43) 
                           (dap x45 x43)) 
                       (= x44 x45))))
         :named hyp13))
(assert (! (forall ((x46 P) (x47 L)) 
               (=> 
                   (exists ((x48 D)) 
                       (and 
                           (dap x46 x48) 
                           (org x48 x47))) 
                   (sit x46 x47)))
         :named hyp14))
(assert (! (forall ((x49 P) (x50 L)) 
               (=> 
                   (exists ((x51 D)) 
                       (and 
                           (dap x49 x51) 
                           (dst x51 x50))) 
                   (aut x49 x50)))
         :named hyp15))
(assert (! (forall ((x52 D)) 
               (not 
                   (and 
                       (red x52) 
                       (exists ((x53 P)) 
                           (dap x53 x52)))))
         :named hyp16))
(assert (! (forall ((x54 D) (x55 P) (x56 P)) 
               (=> 
                   (and 
                       (mCard x54 x55) 
                       (mCard x54 x56)) 
                   (= x55 x56)))
         :named hyp17))
(assert (! (forall ((x57 D)) 
               (= 
                   (BLR x57) 
                   (or 
                       (exists ((x58 P)) 
                           (mCard x57 x58)) 
                       (exists ((x59 P)) 
                           (dap x59 x57)) 
                       (red x57) 
                       (mAckn x57))))
         :named hyp18))
(assert (! (forall ((x60 D)) 
               (not 
                   (and 
                       (exists ((x61 P)) 
                           (mCard x60 x61)) 
                       (or 
                           (exists ((x62 P)) 
                               (dap x62 x60)) 
                           (red x60) 
                           (mAckn x60)))))
         :named hyp19))
(assert (! (forall ((x63 D)) 
               (not 
                   (and 
                       (mAckn x63) 
                       (or 
                           (exists ((x64 P)) 
                               (dap x64 x63)) 
                           (red x63)))))
         :named hyp20))
(assert (! (forall ((x65 D)) 
               (= 
                   (exists ((x66 P)) 
                       (dap x66 x65)) 
                   (or 
                       (mAccept x65) 
                       (mPass x65) 
                       (mOff_grn x65))))
         :named hyp21))
(assert (! (forall ((x67 D)) 
               (not 
                   (and 
                       (mAccept x67) 
                       (or 
                           (mPass x67) 
                           (mOff_grn x67)))))
         :named hyp22))
(assert (! (forall ((x68 D)) 
               (not 
                   (and 
                       (mPass x68) 
                       (mOff_grn x68))))
         :named hyp23))
(assert (! (forall ((x69 D)) 
               (= 
                   (red x69) 
                   (or 
                       (mRefuse x69) 
                       (mOff_red x69))))
         :named hyp24))
(assert (! (forall ((x70 D)) 
               (not 
                   (and 
                       (mRefuse x70) 
                       (mOff_red x70))))
         :named hyp25))
(assert (! (forall ((x71 D)) 
               (=> 
                   (GRN x71) 
                   (mAccept x71)))
         :named hyp26))
(assert (! (forall ((x72 D)) 
               (=> 
                   (RED x72) 
                   (mRefuse x72)))
         :named hyp27))
(assert (! (mCard d p)
         :named hyp28))
(assert (! (exists ((x73 L)) 
               (and 
                   (org d x73) 
                   (sit p x73)))
         :named hyp29))
(assert (! (exists ((x74 L)) 
               (sit p x74))
         :named hyp30))
(assert (! (forall ((x75 P) (x76 L) (x77 L)) 
               (=> 
                   (and 
                       (sit x75 x76) 
                       (sit x75 x77)) 
                   (= x76 x77)))
         :named hyp31))
(assert (! (exists ((x78 L)) 
               (org d x78))
         :named hyp32))
(assert (! (forall ((x79 D) (x80 L) (x81 L)) 
               (=> 
                   (and 
                       (org x79 x80) 
                       (org x79 x81)) 
                   (= x80 x81)))
         :named hyp33))
(assert (! (exists ((x82 L)) 
               (and 
                   (dst d x82) 
                   (aut p x82)))
         :named hyp34))
(assert (! (exists ((x83 L)) 
               (dst d x83))
         :named hyp35))
(assert (! (forall ((x84 D) (x85 L) (x86 L)) 
               (=> 
                   (and 
                       (dst x84 x85) 
                       (dst x84 x86)) 
                   (= x85 x86)))
         :named hyp36))
(assert (! (forall ((x87 L) (x88 L)) 
               (not 
                   (and 
                       (com x87 x88) 
                       (= x87 x88))))
         :named hyp37))
(assert (! (not 
               (exists ((x89 D)) 
                   (dap p x89)))
         :named hyp38))
(assert (! (not 
               (forall ((x90 D)) 
                   (not 
                       (and 
                           (or 
                               (mAccept x90) 
                               (= x90 d)) 
                           (or 
                               (mPass x90) 
                               (mOff_grn x90))))))
         :named goal))
(check-sat)
(exit)

