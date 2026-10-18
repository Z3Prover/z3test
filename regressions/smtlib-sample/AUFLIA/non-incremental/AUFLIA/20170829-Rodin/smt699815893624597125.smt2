(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort K 0)
(declare-sort N 0)
(declare-fun b (N) Bool)
(declare-fun f (N N) Bool)
(declare-fun g (N N) Bool)
(declare-fun h (N N) Bool)
(declare-fun lft (N) Bool)
(declare-fun lt (N N) Bool)
(declare-fun rht (N) Bool)
(declare-fun rt (N N) Bool)
(declare-fun ult (N N) Bool)
(declare-fun urt (N N) Bool)
(declare-fun ko () K)
(declare-fun n () K)
(declare-fun ok () K)
(declare-fun p () N)
(declare-fun t () N)

(assert (! (= n ko)
         :named hyp1))
(assert (! (forall ((x N) (x0 N)) 
               (= 
                   (g x x0) 
                   (or 
                       (lt x x0) 
                       (rt x x0))))
         :named hyp2))
(assert (! (forall ((x1 N) (x2 N)) 
               (= 
                   (ult x1 x2) 
                   (or 
                       (and 
                           (lt x1 x2) 
                           (not 
                               (lft x1))) 
                       (and 
                           (f x1 x2) 
                           (lft x1)))))
         :named hyp3))
(assert (! (forall ((x3 N) (x4 N)) 
               (= 
                   (urt x3 x4) 
                   (or 
                       (and 
                           (rt x3 x4) 
                           (not 
                               (rht x3))) 
                       (and 
                           (f x3 x4) 
                           (rht x3)))))
         :named hyp4))
(assert (! (forall ((x5 N) (x6 N)) 
               (= 
                   (h x5 x6) 
                   (and 
                       (f x5 x6) 
                       (= x5 p))))
         :named hyp5))
(assert (! (forall ((x7 K)) 
               (or 
                   (= x7 ok) 
                   (= x7 ko)))
         :named hyp6))
(assert (! (not 
               (= ok ko))
         :named hyp7))
(assert (! (not 
               (lft p))
         :named hyp8))
(assert (! (not 
               (rht p))
         :named hyp9))
(assert (! (not 
               (= p t))
         :named hyp10))
(assert (! (exists ((x8 N)) 
               (f p x8))
         :named hyp11))
(assert (! (=> 
               (f p t) 
               (forall ((x9 N) (x10 N)) 
                   (= 
                       (f x9 x10) 
                       (and 
                           (= x9 p) 
                           (= x10 t)))))
         :named hyp12))
(assert (! (forall ((x11 N) (x12 N) (x13 N)) 
               (=> 
                   (and 
                       (f x11 x12) 
                       (f x11 x13)) 
                   (= x12 x13)))
         :named hyp13))
(assert (! (not 
               (forall ((x14 N) (x15 N)) 
                   (not 
                       (f x14 x15))))
         :named hyp14))
(assert (! (or 
               (not 
                   (forall ((x16 N)) 
                       (=> 
                           (exists ((x17 N)) 
                               (and 
                                   (= x17 p) 
                                   (lt x17 x16))) 
                           (b x16)))) 
               (and 
                   (forall ((x18 N)) 
                       (=> 
                           (exists ((x19 N)) 
                               (and 
                                   (= x19 p) 
                                   (lt x19 x18))) 
                           (b x18))) 
                   (not 
                       (forall ((x20 N)) 
                           (=> 
                               (exists ((x21 N)) 
                                   (and 
                                       (= x21 p) 
                                       (rt x21 x20))) 
                               (b x20))))) 
               (and 
                   (forall ((x22 N)) 
                       (=> 
                           (exists ((x23 N)) 
                               (and 
                                   (= x23 p) 
                                   (lt x23 x22))) 
                           (b x22))) 
                   (forall ((x24 N)) 
                       (=> 
                           (exists ((x25 N)) 
                               (and 
                                   (= x25 p) 
                                   (rt x25 x24))) 
                           (b x24)))))
         :named hyp15))
(assert (! (exists ((y N)) 
               (and 
                   (or 
                       (lt p y) 
                       (rt p y)) 
                   (not 
                       (b y))))
         :named hyp16))
(assert (! (forall ((x26 N)) 
               (=> 
                   (exists ((x27 N)) 
                       (and 
                           (= x27 p) 
                           (or 
                               (and 
                                   (lt x27 x26) 
                                   (not 
                                       (lft x27))) 
                               (and 
                                   (f x27 x26) 
                                   (lft x27)) 
                               (and 
                                   (rt x27 x26) 
                                   (not 
                                       (rht x27))) 
                               (and 
                                   (f x27 x26) 
                                   (rht x27))))) 
                   (b x26)))
         :named hyp17))
(assert (! (forall ((x28 N) (x29 N) (x30 N)) 
               (=> 
                   (and 
                       (f x28 x29) 
                       (= x28 p) 
                       (f x28 x30)) 
                   (= x29 x30)))
         :named hyp18))
(assert (! (exists ((x31 N)) 
               (and 
                   (f p x31) 
                   (lft x31)))
         :named hyp19))
(assert (! (or 
               (exists ((x32 N)) 
                   (and 
                       (f p x32) 
                       (lft x32))) 
               (exists ((x33 N)) 
                   (and 
                       (f p x33) 
                       (rht x33))))
         :named hyp20))
(assert (! (or 
               (not 
                   (forall ((x34 N)) 
                       (=> 
                           (exists ((x35 N)) 
                               (and 
                                   (= x35 p) 
                                   (lt x35 x34))) 
                           (b x34)))) 
               (and 
                   (forall ((x36 N)) 
                       (=> 
                           (exists ((x37 N)) 
                               (and 
                                   (= x37 p) 
                                   (lt x37 x36))) 
                           (b x36))) 
                   (not 
                       (forall ((x38 N)) 
                           (=> 
                               (exists ((x39 N)) 
                                   (and 
                                       (= x39 p) 
                                       (rt x39 x38))) 
                               (b x38))))) 
               (and 
                   (forall ((x40 N)) 
                       (=> 
                           (exists ((x41 N)) 
                               (and 
                                   (= x41 p) 
                                   (lt x41 x40))) 
                           (b x40))) 
                   (forall ((x42 N)) 
                       (=> 
                           (exists ((x43 N)) 
                               (and 
                                   (= x43 p) 
                                   (rt x43 x42))) 
                           (b x42)))) 
               (and 
                   (forall ((x44 N)) 
                       (=> 
                           (exists ((x45 N)) 
                               (and 
                                   (= x45 p) 
                                   (lt x45 x44))) 
                           (b x44))) 
                   (forall ((x46 N)) 
                       (=> 
                           (exists ((x47 N)) 
                               (and 
                                   (= x47 p) 
                                   (rt x47 x46))) 
                           (b x46))) 
                   (exists ((x48 N)) 
                       (and 
                           (f p x48) 
                           (rht x48)))))
         :named hyp21))
(assert (! (or 
               (not 
                   (forall ((x49 N)) 
                       (=> 
                           (exists ((x50 N)) 
                               (and 
                                   (= x50 p) 
                                   (or 
                                       (and 
                                           (lt x50 x49) 
                                           (not 
                                               (lft x50))) 
                                       (and 
                                           (f x50 x49) 
                                           (lft x50))))) 
                           (b x49)))) 
               (and 
                   (forall ((x51 N)) 
                       (=> 
                           (exists ((x52 N)) 
                               (and 
                                   (= x52 p) 
                                   (or 
                                       (and 
                                           (lt x52 x51) 
                                           (not 
                                               (lft x52))) 
                                       (and 
                                           (f x52 x51) 
                                           (lft x52))))) 
                           (b x51))) 
                   (not 
                       (forall ((x53 N)) 
                           (=> 
                               (exists ((x54 N)) 
                                   (and 
                                       (= x54 p) 
                                       (urt x54 x53))) 
                               (b x53))))) 
               (and 
                   (forall ((x55 N)) 
                       (=> 
                           (exists ((x56 N)) 
                               (and 
                                   (= x56 p) 
                                   (or 
                                       (and 
                                           (lt x56 x55) 
                                           (not 
                                               (lft x56))) 
                                       (and 
                                           (f x56 x55) 
                                           (lft x56))))) 
                           (b x55))) 
                   (forall ((x57 N)) 
                       (=> 
                           (exists ((x58 N)) 
                               (and 
                                   (= x58 p) 
                                   (urt x58 x57))) 
                           (b x57)))) 
               (and 
                   (forall ((x59 N)) 
                       (=> 
                           (exists ((x60 N)) 
                               (and 
                                   (= x60 p) 
                                   (or 
                                       (and 
                                           (lt x60 x59) 
                                           (not 
                                               (lft x60))) 
                                       (and 
                                           (f x60 x59) 
                                           (lft x60))))) 
                           (b x59))) 
                   (forall ((x61 N)) 
                       (=> 
                           (exists ((x62 N)) 
                               (and 
                                   (= x62 p) 
                                   (urt x62 x61))) 
                           (b x61))) 
                   (exists ((x63 N)) 
                       (and 
                           (f p x63) 
                           (rht x63)))))
         :named hyp22))
(assert (! (or 
               (not 
                   (forall ((x64 N)) 
                       (=> 
                           (exists ((x65 N)) 
                               (and 
                                   (= x65 p) 
                                   (or 
                                       (and 
                                           (lt x65 x64) 
                                           (not 
                                               (lft x65))) 
                                       (and 
                                           (f x65 x64) 
                                           (lft x65))))) 
                           (b x64)))) 
               (and 
                   (forall ((x66 N)) 
                       (=> 
                           (exists ((x67 N)) 
                               (and 
                                   (= x67 p) 
                                   (or 
                                       (and 
                                           (lt x67 x66) 
                                           (not 
                                               (lft x67))) 
                                       (and 
                                           (f x67 x66) 
                                           (lft x67))))) 
                           (b x66))) 
                   (not 
                       (forall ((x68 N)) 
                           (=> 
                               (exists ((x69 N)) 
                                   (and 
                                       (= x69 p) 
                                       (or 
                                           (and 
                                               (rt x69 x68) 
                                               (not 
                                                   (rht x69))) 
                                           (and 
                                               (f x69 x68) 
                                               (rht x69))))) 
                               (b x68))))) 
               (and 
                   (forall ((x70 N)) 
                       (=> 
                           (exists ((x71 N)) 
                               (and 
                                   (= x71 p) 
                                   (or 
                                       (and 
                                           (lt x71 x70) 
                                           (not 
                                               (lft x71))) 
                                       (and 
                                           (f x71 x70) 
                                           (lft x71))))) 
                           (b x70))) 
                   (forall ((x72 N)) 
                       (=> 
                           (exists ((x73 N)) 
                               (and 
                                   (= x73 p) 
                                   (or 
                                       (and 
                                           (rt x73 x72) 
                                           (not 
                                               (rht x73))) 
                                       (and 
                                           (f x73 x72) 
                                           (rht x73))))) 
                           (b x72)))) 
               (and 
                   (forall ((x74 N)) 
                       (=> 
                           (exists ((x75 N)) 
                               (and 
                                   (= x75 p) 
                                   (or 
                                       (and 
                                           (lt x75 x74) 
                                           (not 
                                               (lft x75))) 
                                       (and 
                                           (f x75 x74) 
                                           (lft x75))))) 
                           (b x74))) 
                   (forall ((x76 N)) 
                       (=> 
                           (exists ((x77 N)) 
                               (and 
                                   (= x77 p) 
                                   (or 
                                       (and 
                                           (rt x77 x76) 
                                           (not 
                                               (rht x77))) 
                                       (and 
                                           (f x77 x76) 
                                           (rht x77))))) 
                           (b x76))) 
                   (exists ((x78 N)) 
                       (and 
                           (f p x78) 
                           (rht x78)))))
         :named hyp23))
(assert (! (or 
               (not 
                   (forall ((x79 N)) 
                       (=> 
                           (exists ((x80 N)) 
                               (and 
                                   (= x80 p) 
                                   (ult x80 x79))) 
                           (b x79)))) 
               (and 
                   (forall ((x81 N)) 
                       (=> 
                           (exists ((x82 N)) 
                               (and 
                                   (= x82 p) 
                                   (ult x82 x81))) 
                           (b x81))) 
                   (not 
                       (forall ((x83 N)) 
                           (=> 
                               (exists ((x84 N)) 
                                   (and 
                                       (= x84 p) 
                                       (or 
                                           (and 
                                               (rt x84 x83) 
                                               (not 
                                                   (rht x84))) 
                                           (and 
                                               (f x84 x83) 
                                               (rht x84))))) 
                               (b x83))))) 
               (and 
                   (forall ((x85 N)) 
                       (=> 
                           (exists ((x86 N)) 
                               (and 
                                   (= x86 p) 
                                   (ult x86 x85))) 
                           (b x85))) 
                   (forall ((x87 N)) 
                       (=> 
                           (exists ((x88 N)) 
                               (and 
                                   (= x88 p) 
                                   (or 
                                       (and 
                                           (rt x88 x87) 
                                           (not 
                                               (rht x88))) 
                                       (and 
                                           (f x88 x87) 
                                           (rht x88))))) 
                           (b x87)))) 
               (and 
                   (forall ((x89 N)) 
                       (=> 
                           (exists ((x90 N)) 
                               (and 
                                   (= x90 p) 
                                   (ult x90 x89))) 
                           (b x89))) 
                   (forall ((x91 N)) 
                       (=> 
                           (exists ((x92 N)) 
                               (and 
                                   (= x92 p) 
                                   (or 
                                       (and 
                                           (rt x92 x91) 
                                           (not 
                                               (rht x92))) 
                                       (and 
                                           (f x92 x91) 
                                           (rht x92))))) 
                           (b x91))) 
                   (exists ((x93 N)) 
                       (and 
                           (f p x93) 
                           (rht x93)))))
         :named hyp24))
(assert (! (not 
               (forall ((x94 N)) 
                   (=> 
                       (exists ((x95 N)) 
                           (and 
                               (= x95 p) 
                               (or 
                                   (lt x95 x94) 
                                   (rt x95 x94)))) 
                       (b x94))))
         :named goal))
(check-sat)
(exit)

