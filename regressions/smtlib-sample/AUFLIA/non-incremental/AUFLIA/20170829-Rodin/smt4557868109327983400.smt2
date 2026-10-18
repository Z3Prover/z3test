(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort D 0)
(declare-sort L 0)
(declare-sort P 0)
(declare-fun BLR (D) Bool)
(declare-fun GRN (D) Bool)
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
(declare-fun org (D L) Bool)
(declare-fun red (D) Bool)
(declare-fun sit (P L) Bool)
(declare-fun d () D)

(assert (! (forall ((x D)) 
               (= 
                   (red x) 
                   (or 
                       (mRefuse x) 
                       (mOff_red x))))
         :named hyp1))
(assert (! (RED d)
         :named hyp2))
(assert (! (and 
               (forall ((x0 D) (x1 L) (x2 L)) 
                   (=> 
                       (and 
                           (org x0 x1) 
                           (org x0 x2)) 
                       (= x1 x2))) 
               (forall ((x3 D)) 
                   (exists ((x4 L)) 
                       (org x3 x4))))
         :named hyp3))
(assert (! (and 
               (forall ((x5 D) (x6 L) (x7 L)) 
                   (=> 
                       (and 
                           (dst x5 x6) 
                           (dst x5 x7)) 
                       (= x6 x7))) 
               (forall ((x8 D)) 
                   (exists ((x9 L)) 
                       (dst x8 x9))))
         :named hyp4))
(assert (! (forall ((x10 L) (x11 L)) 
               (= 
                   (com x10 x11) 
                   (exists ((x12 D)) 
                       (and 
                           (org x12 x10) 
                           (dst x12 x11)))))
         :named hyp5))
(assert (! (and 
               (forall ((x13 P) (x14 D) (x15 D)) 
                   (=> 
                       (and 
                           (dap x13 x14) 
                           (dap x13 x15)) 
                       (= x14 x15))) 
               (forall ((x16 D) (x17 P) (x18 P)) 
                   (=> 
                       (and 
                           (dap x17 x16) 
                           (dap x18 x16)) 
                       (= x17 x18))))
         :named hyp6))
(assert (! (forall ((x19 P) (x20 L)) 
               (=> 
                   (exists ((x21 D)) 
                       (and 
                           (dap x19 x21) 
                           (org x21 x20))) 
                   (sit x19 x20)))
         :named hyp7))
(assert (! (forall ((x22 P) (x23 L)) 
               (=> 
                   (exists ((x24 D)) 
                       (and 
                           (dap x22 x24) 
                           (dst x24 x23))) 
                   (aut x22 x23)))
         :named hyp8))
(assert (! (forall ((x25 D)) 
               (not 
                   (and 
                       (red x25) 
                       (exists ((x26 P)) 
                           (dap x26 x25)))))
         :named hyp9))
(assert (! (forall ((x27 D) (x28 P) (x29 P)) 
               (=> 
                   (and 
                       (mCard x27 x28) 
                       (mCard x27 x29)) 
                   (= x28 x29)))
         :named hyp10))
(assert (! (forall ((x30 D)) 
               (= 
                   (BLR x30) 
                   (or 
                       (exists ((x31 P)) 
                           (mCard x30 x31)) 
                       (exists ((x32 P)) 
                           (dap x32 x30)) 
                       (red x30) 
                       (mAckn x30))))
         :named hyp11))
(assert (! (forall ((x33 D)) 
               (not 
                   (and 
                       (exists ((x34 P)) 
                           (mCard x33 x34)) 
                       (or 
                           (exists ((x35 P)) 
                               (dap x35 x33)) 
                           (red x33) 
                           (mAckn x33)))))
         :named hyp12))
(assert (! (forall ((x36 D)) 
               (not 
                   (and 
                       (mAckn x36) 
                       (or 
                           (exists ((x37 P)) 
                               (dap x37 x36)) 
                           (red x36)))))
         :named hyp13))
(assert (! (forall ((x38 D)) 
               (= 
                   (exists ((x39 P)) 
                       (dap x39 x38)) 
                   (or 
                       (mAccept x38) 
                       (mPass x38) 
                       (mOff_grn x38))))
         :named hyp14))
(assert (! (forall ((x40 D)) 
               (not 
                   (and 
                       (mAccept x40) 
                       (or 
                           (mPass x40) 
                           (mOff_grn x40)))))
         :named hyp15))
(assert (! (forall ((x41 D)) 
               (not 
                   (and 
                       (mPass x41) 
                       (mOff_grn x41))))
         :named hyp16))
(assert (! (forall ((x42 D)) 
               (not 
                   (and 
                       (mRefuse x42) 
                       (mOff_red x42))))
         :named hyp17))
(assert (! (forall ((x43 D)) 
               (=> 
                   (GRN x43) 
                   (mAccept x43)))
         :named hyp18))
(assert (! (forall ((x44 D)) 
               (=> 
                   (RED x44) 
                   (mRefuse x44)))
         :named hyp19))
(assert (! (not 
               (forall ((x45 D)) 
                   (= 
                       (or 
                           (mRefuse x45) 
                           (mOff_red x45)) 
                       (or 
                           (and 
                               (mRefuse x45) 
                               (not 
                                   (= x45 d))) 
                           (mOff_red x45) 
                           (= x45 d)))))
         :named goal))
(check-sat)
(exit)

