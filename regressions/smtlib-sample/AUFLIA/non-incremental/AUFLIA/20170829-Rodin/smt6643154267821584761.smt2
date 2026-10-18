(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-fun f (Int Int) Bool)
(declare-fun g (Int Int) Bool)
(declare-fun j () Int)
(declare-fun k () Int)
(declare-fun l () Int)
(declare-fun n () Int)

(assert (! (< 0 n)
         :named hyp1))
(assert (! (and 
               (forall ((x Int) (x0 Int)) 
                   (=> 
                       (f x x0) 
                       (and 
                           (<= 1 x) 
                           (<= x n) 
                           (<= 0 x0)))) 
               (forall ((x1 Int) (x2 Int) (x3 Int)) 
                   (=> 
                       (and 
                           (f x1 x2) 
                           (f x1 x3)) 
                       (= x2 x3))) 
               (forall ((x4 Int)) 
                   (=> 
                       (and 
                           (<= 1 x4) 
                           (<= x4 n)) 
                       (exists ((x5 Int)) 
                           (f x4 x5)))) 
               (forall ((x6 Int) (x7 Int) (x8 Int)) 
                   (=> 
                       (and 
                           (f x7 x6) 
                           (f x8 x6)) 
                       (= x7 x8))))
         :named hyp2))
(assert (! (forall ((x9 Int) (x10 Int)) 
               (=> 
                   (g x9 x10) 
                   (and 
                       (<= 0 x9) 
                       (<= 0 x10))))
         :named hyp3))
(assert (! (and 
               (forall ((x11 Int) (x12 Int)) 
                   (=> 
                       (g x11 x12) 
                       (and 
                           (<= 1 x11) 
                           (<= x11 n) 
                           (<= 0 x12)))) 
               (forall ((x13 Int) (x14 Int) (x15 Int)) 
                   (=> 
                       (and 
                           (g x13 x14) 
                           (g x13 x15)) 
                       (= x14 x15))) 
               (forall ((x16 Int)) 
                   (=> 
                       (and 
                           (<= 1 x16) 
                           (<= x16 n)) 
                       (exists ((x17 Int)) 
                           (g x16 x17)))) 
               (forall ((x18 Int) (x19 Int) (x20 Int)) 
                   (=> 
                       (and 
                           (g x19 x18) 
                           (g x20 x18)) 
                       (= x19 x20))))
         :named hyp4))
(assert (! (forall ((x21 Int)) 
               (= 
                   (exists ((x22 Int)) 
                       (g x22 x21)) 
                   (exists ((x23 Int)) 
                       (f x23 x21))))
         :named hyp5))
(assert (! (and 
               (<= 1 k) 
               (<= k n))
         :named hyp6))
(assert (! (forall ((i Int) (j0 Int)) 
               (=> 
                   (and 
                       (<= 1 i) 
                       (<= i (- k 1)) 
                       (<= (+ i 1) j0) 
                       (<= j0 n)) 
                   (forall ((x24 Int) (x25 Int)) 
                       (=> 
                           (and 
                               (g i x25) 
                               (g j0 x24)) 
                           (< x25 x24)))))
         :named hyp7))
(assert (! (<= 0 l)
         :named hyp8))
(assert (! (and 
               (<= k j) 
               (<= j n))
         :named hyp9))
(assert (! (and 
               (<= k l) 
               (<= l j))
         :named hyp10))
(assert (! (exists ((x26 Int)) 
               (and 
                   (exists ((x27 Int)) 
                       (and 
                           (<= k x27) 
                           (<= x27 j) 
                           (g x27 x26))) 
                   (forall ((x28 Int)) 
                       (=> 
                           (exists ((x29 Int)) 
                               (and 
                                   (<= k x29) 
                                   (<= x29 j) 
                                   (g x29 x28))) 
                           (<= x26 x28))) 
                   (g l x26)))
         :named hyp11))
(assert (! (exists ((x30 Int)) 
               (g l x30))
         :named hyp12))
(assert (! (forall ((x31 Int) (x32 Int) (x33 Int)) 
               (=> 
                   (and 
                       (g x31 x32) 
                       (g x31 x33)) 
                   (= x32 x33)))
         :named hyp13))
(assert (! (exists ((b Int)) 
               (forall ((x34 Int)) 
                   (=> 
                       (exists ((x35 Int)) 
                           (and 
                               (<= k x35) 
                               (<= x35 j) 
                               (g x35 x34))) 
                       (<= b x34))))
         :named hyp14))
(assert (! (forall ((x36 Int) (x37 Int)) 
               (=> 
                   (and 
                       (exists ((x38 Int)) 
                           (and 
                               (= x38 (+ j 1)) 
                               (g x38 x37))) 
                       (g l x36)) 
                   (< x37 x36)))
         :named hyp15))
(assert (! (exists ((x39 Int) (x40 Int)) 
               (and 
                   (= x40 (+ j 1)) 
                   (g x40 x39)))
         :named hyp16))
(assert (! (forall ((a Int) (b0 Int)) 
               (=> 
                   (and 
                       (<= 1 a) 
                       (<= a n) 
                       (<= 1 b0) 
                       (<= b0 n) 
                       (not 
                           (= a b0))) 
                   (forall ((x41 Int) (x42 Int)) 
                       (= 
                           (or 
                               (and 
                                   (g x41 x42) 
                                   (not 
                                       (or 
                                           (exists ((x43 Int)) 
                                               (and 
                                                   (= x41 a) 
                                                   (g b0 x43))) 
                                           (exists ((x44 Int)) 
                                               (and 
                                                   (= x41 b0) 
                                                   (g a x44)))))) 
                               (and 
                                   (= x41 a) 
                                   (g b0 x42) 
                                   (not 
                                       (exists ((x45 Int)) 
                                           (and 
                                               (= x41 b0) 
                                               (g a x45))))) 
                               (and 
                                   (= x41 b0) 
                                   (g a x42))) 
                           (or 
                               (and 
                                   (g x41 x42) 
                                   (not 
                                       (or 
                                           (= x41 a) 
                                           (= x41 b0)))) 
                               (and 
                                   (= x41 a) 
                                   (g b0 x42)) 
                               (and 
                                   (= x41 b0) 
                                   (g a x42)))))))
         :named hyp17))
(assert (! (forall ((a0 Int) (b1 Int)) 
               (=> 
                   (and 
                       (<= 1 a0) 
                       (<= a0 n) 
                       (<= 1 b1) 
                       (<= b1 n) 
                       (not 
                           (= a0 b1))) 
                   (and 
                       (forall ((x46 Int) (x47 Int)) 
                           (=> 
                               (or 
                                   (and 
                                       (= x46 a0) 
                                       (g b1 x47)) 
                                   (and 
                                       (= x46 b1) 
                                       (g a0 x47))) 
                               (and 
                                   (<= 1 x46) 
                                   (<= x46 n) 
                                   (<= 0 x47)))) 
                       (forall ((x48 Int) (x49 Int) (x50 Int)) 
                           (=> 
                               (and 
                                   (or 
                                       (and 
                                           (= x48 a0) 
                                           (g b1 x49)) 
                                       (and 
                                           (= x48 b1) 
                                           (g a0 x49))) 
                                   (or 
                                       (and 
                                           (= x48 a0) 
                                           (g b1 x50)) 
                                       (and 
                                           (= x48 b1) 
                                           (g a0 x50)))) 
                               (= x49 x50))) 
                       (forall ((x51 Int) (x52 Int) (x53 Int)) 
                           (=> 
                               (and 
                                   (or 
                                       (and 
                                           (= x52 a0) 
                                           (g b1 x51)) 
                                       (and 
                                           (= x52 b1) 
                                           (g a0 x51))) 
                                   (or 
                                       (and 
                                           (= x53 a0) 
                                           (g b1 x51)) 
                                       (and 
                                           (= x53 b1) 
                                           (g a0 x51)))) 
                               (= x52 x53))))))
         :named hyp18))
(assert (! (forall ((a1 Int) (b2 Int)) 
               (=> 
                   (and 
                       (<= 1 a1) 
                       (<= a1 n) 
                       (<= 1 b2) 
                       (<= b2 n) 
                       (not 
                           (= a1 b2))) 
                   (and 
                       (forall ((x54 Int) (x55 Int)) 
                           (=> 
                               (and 
                                   (g x54 x55) 
                                   (not 
                                       (or 
                                           (= x54 a1) 
                                           (= x54 b2)))) 
                               (and 
                                   (<= 1 x54) 
                                   (<= x54 n) 
                                   (<= 0 x55)))) 
                       (forall ((x56 Int) (x57 Int) (x58 Int)) 
                           (=> 
                               (and 
                                   (g x56 x57) 
                                   (not 
                                       (or 
                                           (= x56 a1) 
                                           (= x56 b2))) 
                                   (g x56 x58)) 
                               (= x57 x58))) 
                       (forall ((x59 Int) (x60 Int) (x61 Int)) 
                           (=> 
                               (and 
                                   (g x60 x59) 
                                   (not 
                                       (or 
                                           (= x60 a1) 
                                           (= x60 b2))) 
                                   (g x61 x59) 
                                   (not 
                                       (or 
                                           (= x61 a1) 
                                           (= x61 b2)))) 
                               (= x60 x61))))))
         :named hyp19))
(assert (! (forall ((a2 Int) (b3 Int)) 
               (=> 
                   (and 
                       (<= 1 a2) 
                       (<= a2 n) 
                       (<= 1 b3) 
                       (<= b3 n) 
                       (not 
                           (= a2 b3))) 
                   (forall ((x62 Int)) 
                       (= 
                           (or 
                               (exists ((x63 Int)) 
                                   (and 
                                       (g x62 x63) 
                                       (not 
                                           (or 
                                               (= x62 a2) 
                                               (= x62 b3))))) 
                               (exists ((x64 Int)) 
                                   (and 
                                       (= x62 a2) 
                                       (g b3 x64))) 
                               (exists ((x65 Int)) 
                                   (and 
                                       (= x62 b3) 
                                       (g a2 x65)))) 
                           (and 
                               (<= 1 x62) 
                               (<= x62 n))))))
         :named hyp20))
(assert (! (forall ((a3 Int) (b4 Int)) 
               (=> 
                   (and 
                       (<= 1 a3) 
                       (<= a3 n) 
                       (<= 1 b4) 
                       (<= b4 n) 
                       (not 
                           (= a3 b4))) 
                   (forall ((x66 Int)) 
                       (not 
                           (and 
                               (exists ((x67 Int)) 
                                   (and 
                                       (g x67 x66) 
                                       (not 
                                           (or 
                                               (= x67 a3) 
                                               (= x67 b4))))) 
                               (or 
                                   (g b4 x66) 
                                   (g a3 x66)))))))
         :named hyp21))
(assert (! (not 
               (forall ((x68 Int)) 
                   (not 
                       (and 
                           (exists ((x69 Int)) 
                               (g x68 x69)) 
                           (<= k x68) 
                           (<= x68 j)))))
         :named hyp22))
(assert (! (not 
               (= k n))
         :named hyp23))
(assert (! (not 
               (= j n))
         :named hyp24))
(assert (! (not 
               (and 
                   (<= k (+ j 1)) 
                   (<= (+ j 1) (+ j 1))))
         :named goal))
(check-sat)
(exit)

