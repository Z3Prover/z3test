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
(declare-fun r () Int)
(declare-fun w () Int)

(assert (! (and 
               (forall ((x Int) (x0 Int)) 
                   (=> 
                       (f x x0) 
                       (and 
                           (<= 1 x) 
                           (<= x r) 
                           (<= 1 x0) 
                           (<= x0 w)))) 
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
                           (<= x4 r)) 
                       (exists ((x5 Int)) 
                           (f x4 x5)))))
         :named hyp1))
(assert (! (< 0 w)
         :named hyp2))
(assert (! (< 0 r)
         :named hyp3))
(assert (! (and 
               (forall ((x6 Int) (x7 D)) 
                   (=> 
                       (wt x6 x7) 
                       (and 
                           (<= 1 x6) 
                           (<= x6 w)))) 
               (forall ((x8 Int) (x9 D) (x10 D)) 
                   (=> 
                       (and 
                           (wt x8 x9) 
                           (wt x8 x10)) 
                       (= x9 x10))) 
               (forall ((x11 Int)) 
                   (=> 
                       (and 
                           (<= 1 x11) 
                           (<= x11 w)) 
                       (exists ((x12 D)) 
                           (wt x11 x12)))))
         :named hyp4))
(assert (! (and 
               (forall ((x13 Int) (x14 D)) 
                   (=> 
                       (rd x13 x14) 
                       (and 
                           (<= 1 x13) 
                           (<= x13 r)))) 
               (forall ((x15 Int) (x16 D) (x17 D)) 
                   (=> 
                       (and 
                           (rd x15 x16) 
                           (rd x15 x17)) 
                       (= x16 x17))) 
               (forall ((x18 Int)) 
                   (=> 
                       (and 
                           (<= 1 x18) 
                           (<= x18 r)) 
                       (exists ((x19 D)) 
                           (rd x18 x19)))))
         :named hyp5))
(assert (! (and 
               (forall ((x20 Int) (x21 Int)) 
                   (=> 
                       (g x20 x21) 
                       (and 
                           (<= 1 x20) 
                           (<= x20 r) 
                           (<= 1 x21) 
                           (<= x21 w)))) 
               (forall ((x22 Int) (x23 Int) (x24 Int)) 
                   (=> 
                       (and 
                           (g x22 x23) 
                           (g x22 x24)) 
                       (= x23 x24))) 
               (forall ((x25 Int)) 
                   (=> 
                       (and 
                           (<= 1 x25) 
                           (<= x25 r)) 
                       (exists ((x26 Int)) 
                           (g x25 x26)))))
         :named hyp6))
(assert (! (forall ((x27 Int) (x28 D)) 
               (= 
                   (rd x27 x28) 
                   (exists ((x29 Int)) 
                       (and 
                           (f x27 x29) 
                           (wt x29 x28)))))
         :named hyp7))
(assert (! (forall ((i Int)) 
               (=> 
                   (and 
                       (<= 1 i) 
                       (<= i r)) 
                   (forall ((x30 Int) (x31 Int)) 
                       (=> 
                           (and 
                               (f i x31) 
                               (g i x30)) 
                           (<= x31 x30)))))
         :named hyp8))
(assert (! (forall ((i0 Int)) 
               (=> 
                   (and 
                       (<= 1 i0) 
                       (<= i0 (- r 1))) 
                   (forall ((x32 Int) (x33 Int)) 
                       (=> 
                           (and 
                               (g i0 x33) 
                               (exists ((x34 Int)) 
                                   (and 
                                       (= x34 (+ i0 1)) 
                                       (f x34 x32)))) 
                           (<= x33 x32)))))
         :named hyp9))
(assert (! (not 
               (and 
                   (forall ((x35 Int) (x36 Int)) 
                       (=> 
                           (f x35 x36) 
                           (and 
                               (<= 1 x35) 
                               (<= x35 r) 
                               (<= 1 x36) 
                               (<= x36 (+ w 1))))) 
                   (forall ((x37 Int) (x38 Int) (x39 Int)) 
                       (=> 
                           (and 
                               (f x37 x38) 
                               (f x37 x39)) 
                           (= x38 x39))) 
                   (forall ((x40 Int)) 
                       (=> 
                           (and 
                               (<= 1 x40) 
                               (<= x40 r)) 
                           (exists ((x41 Int)) 
                               (f x40 x41))))))
         :named goal))
(check-sat)
(exit)

