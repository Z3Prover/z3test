(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort D 0)
(declare-fun f (Int Int) Bool)
(declare-fun g (Int Int) Bool)
(declare-fun rd (Int D) Bool)
(declare-fun wt (Int D) Bool)
(declare-fun wtp (Int D) Bool)
(declare-fun adr_r () Int)
(declare-fun adr_w () Int)
(declare-fun r () Int)
(declare-fun w () Int)
(declare-fun y () D)

(assert (! (forall ((x Int) (x0 D)) 
               (=> 
                   (wt x x0) 
                   (wtp x x0)))
         :named hyp1))
(assert (! (= adr_w 4)
         :named hyp2))
(assert (! (< 0 w)
         :named hyp3))
(assert (! (and 
               (forall ((x1 Int) (x2 D)) 
                   (=> 
                       (wt x1 x2) 
                       (and 
                           (<= 1 x1) 
                           (<= x1 w)))) 
               (forall ((x3 Int) (x4 D) (x5 D)) 
                   (=> 
                       (and 
                           (wt x3 x4) 
                           (wt x3 x5)) 
                       (= x4 x5))) 
               (forall ((x6 Int)) 
                   (=> 
                       (and 
                           (<= 1 x6) 
                           (<= x6 w)) 
                       (exists ((x7 D)) 
                           (wt x6 x7)))))
         :named hyp4))
(assert (! (and 
               (forall ((x8 Int) (x9 D)) 
                   (=> 
                       (rd x8 x9) 
                       (and 
                           (<= 1 x8) 
                           (<= x8 r)))) 
               (forall ((x10 Int) (x11 D) (x12 D)) 
                   (=> 
                       (and 
                           (rd x10 x11) 
                           (rd x10 x12)) 
                       (= x11 x12))) 
               (forall ((x13 Int)) 
                   (=> 
                       (and 
                           (<= 1 x13) 
                           (<= x13 r)) 
                       (exists ((x14 D)) 
                           (rd x13 x14)))))
         :named hyp5))
(assert (! (and 
               (forall ((x15 Int) (x16 Int)) 
                   (=> 
                       (f x15 x16) 
                       (and 
                           (<= 1 x15) 
                           (<= x15 r) 
                           (<= 1 x16) 
                           (<= x16 w)))) 
               (forall ((x17 Int) (x18 Int) (x19 Int)) 
                   (=> 
                       (and 
                           (f x17 x18) 
                           (f x17 x19)) 
                       (= x18 x19))) 
               (forall ((x20 Int)) 
                   (=> 
                       (and 
                           (<= 1 x20) 
                           (<= x20 r)) 
                       (exists ((x21 Int)) 
                           (f x20 x21)))))
         :named hyp6))
(assert (! (and 
               (forall ((x22 Int) (x23 Int)) 
                   (=> 
                       (g x22 x23) 
                       (and 
                           (<= 1 x22) 
                           (<= x22 r) 
                           (<= 1 x23) 
                           (<= x23 w)))) 
               (forall ((x24 Int) (x25 Int) (x26 Int)) 
                   (=> 
                       (and 
                           (g x24 x25) 
                           (g x24 x26)) 
                       (= x25 x26))) 
               (forall ((x27 Int)) 
                   (=> 
                       (and 
                           (<= 1 x27) 
                           (<= x27 r)) 
                       (exists ((x28 Int)) 
                           (g x27 x28)))))
         :named hyp7))
(assert (! (forall ((x29 Int) (x30 D)) 
               (= 
                   (rd x29 x30) 
                   (exists ((x31 Int)) 
                       (and 
                           (f x29 x31) 
                           (wt x31 x30)))))
         :named hyp8))
(assert (! (or 
               (= adr_w 1) 
               (= adr_w 2) 
               (= adr_w 3) 
               (= adr_w 4) 
               (= adr_w 5))
         :named hyp9))
(assert (! (and 
               (forall ((x32 Int) (x33 D)) 
                   (=> 
                       (wtp x32 x33) 
                       (< 0 x32))) 
               (forall ((x34 Int) (x35 D) (x36 D)) 
                   (=> 
                       (and 
                           (wtp x34 x35) 
                           (wtp x34 x36)) 
                       (= x35 x36))))
         :named hyp10))
(assert (! (=> 
               (= adr_r 1) 
               (rd r y))
         :named hyp11))
(assert (! (=> 
               (= adr_r 1) 
               (and 
                   (exists ((x37 D)) 
                       (rd r x37)) 
                   (forall ((x38 Int) (x39 D) (x40 D)) 
                       (=> 
                           (and 
                               (rd x38 x39) 
                               (rd x38 x40)) 
                           (= x39 x40)))))
         :named hyp12))
(assert (! (=> 
               (= adr_w 1) 
               (forall ((x41 Int)) 
                   (= 
                       (exists ((x42 D)) 
                           (wtp x41 x42)) 
                       (and 
                           (<= 1 x41) 
                           (<= x41 w)))))
         :named hyp13))
(assert (! (=> 
               (or 
                   (= adr_w 2) 
                   (= adr_w 3) 
                   (= adr_w 4)) 
               (forall ((x43 Int)) 
                   (= 
                       (exists ((x44 D)) 
                           (wtp x43 x44)) 
                       (and 
                           (<= 1 x43) 
                           (<= x43 (+ w 1))))))
         :named hyp14))
(assert (! (=> 
               (= adr_w 5) 
               (or 
                   (forall ((x45 Int)) 
                       (= 
                           (exists ((x46 D)) 
                               (wtp x45 x46)) 
                           (and 
                               (<= 1 x45) 
                               (<= x45 w)))) 
                   (forall ((x47 Int)) 
                       (= 
                           (exists ((x48 D)) 
                               (wtp x47 x48)) 
                           (and 
                               (<= 1 x47) 
                               (<= x47 (+ w 1)))))))
         :named hyp15))
(assert (! (exists ((x49 D) (x50 Int)) 
               (and 
                   (= x50 (+ w 1)) 
                   (wtp x50 x49)))
         :named hyp16))
(assert (! (forall ((x51 Int) (x52 D) (x53 D)) 
               (=> 
                   (and 
                       (wtp x51 x52) 
                       (wtp x51 x53)) 
                   (= x52 x53)))
         :named hyp17))
(assert (! (not 
               (forall ((x54 Int) (x55 D)) 
                   (=> 
                       (or 
                           (and 
                               (wt x54 x55) 
                               (not 
                                   (exists ((x56 D)) 
                                       (and 
                                           (= x54 (+ w 1)) 
                                           (exists ((x57 Int)) 
                                               (and 
                                                   (= x57 (+ w 1)) 
                                                   (wtp x57 x56))))))) 
                           (and 
                               (= x54 (+ w 1)) 
                               (exists ((x58 Int)) 
                                   (and 
                                       (= x58 (+ w 1)) 
                                       (wtp x58 x55))))) 
                       (wtp x54 x55))))
         :named goal))
(check-sat)
(exit)

