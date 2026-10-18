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
(declare-fun ko () K)
(declare-fun n () K)
(declare-fun ok () K)
(declare-fun p () N)
(declare-fun t () N)

(assert (! (forall ((x N)) 
               (=> 
                   (exists ((x0 N)) 
                       (and 
                           (b x0) 
                           (not 
                               (or 
                                   (exists ((x1 N)) 
                                       (f x0 x1)) 
                                   (= x0 t))) 
                           (g x0 x))) 
                   (b x)))
         :named hyp1))
(assert (! (= n ko)
         :named hyp2))
(assert (! (forall ((x2 N)) 
               (=> 
                   (exists ((x3 N)) 
                       (and 
                           (= x3 p) 
                           (g x3 x2))) 
                   (b x2)))
         :named hyp3))
(assert (! (forall ((x4 N)) 
               (= 
                   (or 
                       (exists ((x5 N)) 
                           (f x4 x5)) 
                       (= x4 t)) 
                   (or 
                       (exists ((x6 N)) 
                           (f x6 x4)) 
                       (= x4 p))))
         :named hyp4))
(assert (! (and 
               (forall ((x7 N) (x8 N)) 
                   (=> 
                       (f x7 x8) 
                       (and 
                           (b x7) 
                           (not 
                               (= x7 t)) 
                           (b x8) 
                           (not 
                               (= x8 p))))) 
               (forall ((x9 N) (x10 N) (x11 N)) 
                   (=> 
                       (and 
                           (f x9 x10) 
                           (f x9 x11)) 
                       (= x10 x11))) 
               (forall ((x12 N) (x13 N) (x14 N)) 
                   (=> 
                       (and 
                           (f x13 x12) 
                           (f x14 x12)) 
                       (= x13 x14))))
         :named hyp5))
(assert (! (b p)
         :named hyp6))
(assert (! (forall ((x15 K)) 
               (or 
                   (= x15 ok) 
                   (= x15 ko)))
         :named hyp7))
(assert (! (not 
               (= ok ko))
         :named hyp8))
(assert (! (not 
               (= p t))
         :named hyp9))
(assert (! (exists ((x16 N)) 
               (f p x16))
         :named hyp10))
(assert (! (=> 
               (f p t) 
               (forall ((x17 N) (x18 N)) 
                   (= 
                       (f x17 x18) 
                       (and 
                           (= x17 p) 
                           (= x18 t)))))
         :named hyp11))
(assert (! (forall ((x19 N) (x20 N) (x21 N)) 
               (=> 
                   (and 
                       (f x19 x20) 
                       (f x19 x21)) 
                   (= x20 x21)))
         :named hyp12))
(assert (! (not 
               (forall ((x22 N) (x23 N)) 
                   (not 
                       (f x22 x23))))
         :named hyp13))
(assert (! (not 
               (forall ((x24 N)) 
                   (=> 
                       (exists ((x25 N)) 
                           (and 
                               (b x25) 
                               (not 
                                   (or 
                                       (and 
                                           (exists ((x26 N)) 
                                               (f x25 x26)) 
                                           (not 
                                               (= x25 p))) 
                                       (= x25 t))) 
                               (g x25 x24))) 
                       (b x24))))
         :named goal))
(check-sat)
(exit)

