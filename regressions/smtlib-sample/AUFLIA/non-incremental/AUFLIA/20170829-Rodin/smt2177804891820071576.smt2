(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort PZ 0)
(declare-sort PZZ 0)
(declare-fun MS (Int PZ) Bool)
(declare-fun MS0 (Int Int PZZ) Bool)
(declare-fun i (Int Int PZ) Bool)
(declare-fun N () PZ)
(declare-fun a () PZZ)
(declare-fun n () PZZ)
(declare-fun w () Int)
(declare-fun x () Int)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x59 Int)) 
            (exists ((X PZ)) 
                (and 
                    (MS x59 X) 
                    (forall ((y0 Int)) 
                        (=> 
                            (MS y0 X) 
                            (= y0 x59)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x60 Int) (x61 Int)) 
            (exists ((X0 PZZ)) 
                (and 
                    (MS0 x60 x61 X0) 
                    (forall ((y1 Int) (y2 Int)) 
                        (=> 
                            (MS0 y1 y2 X0) 
                            (and 
                                (= y1 x60) 
                                (= y2 x61))))))))
(assert (! (forall ((x0 Int)) 
               (=> 
                   (MS x0 N) 
                   (<= 0 x0)))
         :named hyp1))
(assert (! (forall ((a0 Int)) 
               (exists ((b Int) (f PZZ)) 
                   (and 
                       (forall ((x1 Int) (x2 Int)) 
                           (=> 
                               (MS0 x1 x2 f) 
                               (and 
                                   (MS x1 N) 
                                   (<= a0 x2) 
                                   (<= x2 b)))) 
                       (forall ((x3 Int) (x4 Int) (x5 Int)) 
                           (=> 
                               (and 
                                   (MS0 x3 x4 f) 
                                   (MS0 x3 x5 f)) 
                               (= x4 x5))) 
                       (forall ((x6 Int)) 
                           (=> 
                               (MS x6 N) 
                               (exists ((x7 Int)) 
                                   (MS0 x6 x7 f)))) 
                       (forall ((x8 Int) (x9 Int) (x10 Int)) 
                           (=> 
                               (and 
                                   (MS0 x9 x8 f) 
                                   (MS0 x10 x8 f)) 
                               (= x9 x10))))))
         :named hyp2))
(assert (! (exists ((b0 Int)) 
               (forall ((x11 Int)) 
                   (=> 
                       (MS x11 N) 
                       (<= x11 b0))))
         :named hyp3))
(assert (! (and 
               (forall ((x12 Int) (x13 Int)) 
                   (=> 
                       (MS0 x12 x13 n) 
                       (and 
                           (MS x12 N) 
                           (MS x13 N)))) 
               (forall ((x14 Int) (x15 Int) (x16 Int)) 
                   (=> 
                       (and 
                           (MS0 x14 x15 n) 
                           (MS0 x14 x16 n)) 
                       (= x15 x16))) 
               (forall ((x17 Int)) 
                   (=> 
                       (MS x17 N) 
                       (exists ((x18 Int)) 
                           (MS0 x17 x18 n)))) 
               (forall ((x19 Int)) 
                   (=> 
                       (MS x19 N) 
                       (exists ((x20 Int)) 
                           (MS0 x20 x19 n)))) 
               (forall ((x21 Int) (x22 Int) (x23 Int)) 
                   (=> 
                       (and 
                           (MS0 x22 x21 n) 
                           (MS0 x23 x21 n)) 
                       (= x22 x23))))
         :named hyp4))
(assert (! (and 
               (forall ((x24 Int) (x25 Int) (x26 PZ)) 
                   (=> 
                       (i x24 x25 x26) 
                       (and 
                           (MS x24 N) 
                           (MS x25 N) 
                           (forall ((x27 Int)) 
                               (=> 
                                   (MS x27 x26) 
                                   (MS x27 N)))))) 
               (forall ((x28 Int) (x29 Int) (x30 PZ) (x31 PZ)) 
                   (=> 
                       (and 
                           (i x28 x29 x30) 
                           (i x28 x29 x31)) 
                       (forall ((x32 Int)) 
                           (= 
                               (MS x32 x30) 
                               (MS x32 x31))))) 
               (forall ((x33 Int) (x34 Int)) 
                   (=> 
                       (and 
                           (MS x33 N) 
                           (MS x34 N)) 
                       (exists ((x35 PZ)) 
                           (i x33 x34 x35)))))
         :named hyp5))
(assert (! (forall ((x36 Int)) 
               (=> 
                   (MS x36 N) 
                   (exists ((x37 PZ)) 
                       (and 
                           (forall ((x38 Int)) 
                               (= 
                                   (MS x38 x37) 
                                   (= x38 x36))) 
                           (i x36 x36 x37)))))
         :named hyp6))
(assert (! (forall ((x39 Int)) 
               (=> 
                   (MS x39 N) 
                   (exists ((x40 Int)) 
                       (and 
                           (MS0 x40 x39 n) 
                           (i x39 x40 N)))))
         :named hyp7))
(assert (! (MS w N)
         :named hyp8))
(assert (! (and 
               (forall ((x41 Int) (x42 Int)) 
                   (=> 
                       (MS0 x41 x42 a) 
                       (and 
                           (MS x41 N) 
                           (MS x42 N)))) 
               (forall ((x43 Int) (x44 Int) (x45 Int)) 
                   (=> 
                       (and 
                           (MS0 x43 x44 a) 
                           (MS0 x43 x45 a)) 
                       (= x44 x45))))
         :named hyp9))
(assert (! (exists ((x46 Int) (x47 Int)) 
               (and 
                   (MS x47 N) 
                   (forall ((x48 Int)) 
                       (=> 
                           (MS x48 N) 
                           (<= x48 x47))) 
                   (MS0 x47 x46 a)))
         :named hyp10))
(assert (! (not 
               (forall ((x49 Int)) 
                   (not 
                       (MS x49 N))))
         :named hyp11))
(assert (! (forall ((x50 Int) (y Int)) 
               (=> 
                   (and 
                       (MS x50 N) 
                       (MS y N) 
                       (not 
                           (= x50 y))) 
                   (exists ((x51 PZ)) 
                       (and 
                           (forall ((x52 Int)) 
                               (= 
                                   (MS x52 x51) 
                                   (or 
                                       (= x52 y) 
                                       (exists ((x53 PZ)) 
                                           (and 
                                               (exists ((x54 Int)) 
                                                   (and 
                                                       (MS0 x54 y n) 
                                                       (i x50 x54 x53))) 
                                               (MS x52 x53)))))) 
                           (i x50 y x51)))))
         :named hyp12))
(assert (! (exists ((x55 Int)) 
               (MS0 x x55 a))
         :named hyp13))
(assert (! (not 
               (exists ((x56 PZ) (x57 Int)) 
                   (and 
                       (exists ((x58 Int)) 
                           (and 
                               (MS0 x x58 a) 
                               (MS0 x57 x58 n))) 
                       (i x x57 x56))))
         :named goal))
(check-sat)
(exit)

