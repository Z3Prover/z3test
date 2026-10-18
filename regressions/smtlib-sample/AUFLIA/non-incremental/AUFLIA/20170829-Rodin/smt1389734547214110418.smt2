(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-fun f (Int Int) Bool)
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
(assert (! (not 
               (forall ((x9 Int) (x10 Int)) 
                   (=> 
                       (f x9 x10) 
                       (and 
                           (<= 0 x9) 
                           (<= 0 x10)))))
         :named goal))
(check-sat)
(exit)

