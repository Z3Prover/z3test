; NUM638_1.smt2


; Auto-generated from TPTP input: C:\TPTP-v9.2.1\Problems\NUM\NUM638^1.p
(set-logic ALL)
(declare-sort nat 0)
(declare-fun n_1 () nat)
(declare-fun x () nat)
(declare-fun suc () (Array nat nat))
(declare-fun some () (Array (Array nat Bool) Bool))
(assert (not (= x n_1)))
(assert (forall ((Xx nat) (Xy nat))
          (! (=> (= (select suc Xx) (select suc Xy)) (= Xx Xy)) :weight 0)))
(assert (forall ((Xx nat))
          (! (let ((a!1 (select some (lambda ((Xu nat)) (= Xx (select suc Xu))))))
               (=> (not (= Xx n_1)) a!1))
             :weight 0)))
(assert (let ((a!1 (forall ((Xx_0 nat) (Xy nat))
                     (! (=> (= x (select suc Xx_0))
                            (=> (= x (select suc Xy)) (= Xx_0 Xy)))
                        :weight 0)))
              (a!2 (select some (lambda ((Xu nat)) (= x (select suc Xu))))))
          (not (not (=> a!1 (not a!2))))))
(check-sat)
; (get-info :reason-unknown)


(reset)
;(exit)

; SEU934_5.smt2
; Auto-generated from TPTP input: C:\TPTP-v9.2.1\Problems\SEU\SEU934^5.p
(set-logic ALL)
(declare-sort U 0)
(declare-const Xx U)
(declare-const Xy U)
(assert (= (lambda ((Y U)) (= Y Xx)) (lambda ((Y U)) (= Y Xy))))
(assert (not (= Xx Xy)))
(check-sat)
(reset)

; SET616_5.smt2
; Auto-generated from TPTP input: C:\TPTP-v9.2.1\Problems\SET\SET616^5.p
(set-logic ALL)
(declare-sort a 0)
(declare-const X (-> a Bool))
(declare-const Y (-> a Bool))

(define-const lhs (-> a Bool) (lambda ((Xx a)) (and (select X Xx) (not (select Y Xx)))))
(define-const rhs (-> a Bool) (lambda ((Xx a)) (and (select Y Xx) (not (select X Xx)))))
(assert (= lhs rhs))
;(assert (forall ((x a)) (= (lhs x) (rhs x))))

(assert (not (= X Y)))
(check-sat)
(get-model)
;(exit)
(reset)





; SET724_4.smt2



; Auto-generated from TPTP input: C:\TPTP-v9.2.1\Problems\SET\SET724^4.p
(set-logic ALL)
(declare-sort U 0)
(declare-fun fun_image
             ()
             (Array (Array U U) (Array (Array U Bool) (Array U Bool))))
(declare-fun fun_composition
             ()
             (Array (Array U U) (Array (Array U U) (Array U U))))
(declare-fun fun_inv_image
             ()
             (Array (Array U U) (Array (Array U Bool) (Array U Bool))))
(declare-fun fun_injective () (Array (Array U U) Bool))
(declare-fun fun_surjective () (Array (Array U U) Bool))
(declare-fun fun_bijective () (Array (Array U U) Bool))
(declare-fun fun_decreasing
             ()
             (Array (Array U U) (Array (Array U (Array U Bool)) Bool)))
(declare-fun fun_increasing
             ()
             (Array (Array U U) (Array (Array U (Array U Bool)) Bool)))
(assert (let ((a!1 (lambda ((F (Array U U)))
                     (lambda ((A (Array U Bool)))
                       (lambda ((Y U))
                         (exists ((X U))
                           (! (and (select A X) (= Y (select F X))) :weight 0)))))))
          (= fun_image a!1)))
(assert (let ((a!1 (lambda ((F (Array U U)))
                     (lambda ((G (Array U U)))
                       (lambda ((X U)) (select G (select F X)))))))
          (= fun_composition a!1)))
(assert (let ((a!1 (lambda ((F (Array U U)))
                     (lambda ((B (Array U Bool)))
                       (lambda ((X U))
                         (exists ((Y U))
                           (! (and (select B Y) (= Y (select F X))) :weight 0)))))))
          (= fun_inv_image a!1)))
(assert (let ((a!1 (lambda ((F (Array U U)))
                     (forall ((X U) (Y U))
                       (! (=> (= (select F X) (select F Y)) (= X Y)) :weight 0)))))
          (= fun_injective a!1)))
(assert (let ((a!1 (lambda ((F (Array U U)))
                     (forall ((Y U))
                       (! (exists ((X U)) (! (= Y (select F X)) :weight 0))
                          :weight 0)))))
          (= fun_surjective a!1)))
(assert (= fun_bijective
           (lambda ((F (Array U U)))
             (and (select fun_injective F) (select fun_surjective F)))))
(assert (let ((a!1 (lambda ((F (Array U U)))
                     (lambda ((SMALLER (Array U (Array U Bool))))
                       (forall ((X U) (Y U))
                         (! (=> (select (select SMALLER X) Y)
                                (select (select SMALLER (select F Y))
                                        (select F X)))
                            :weight 0))))))
          (= fun_decreasing a!1)))
(assert (let ((a!1 (lambda ((F (Array U U)))
                     (lambda ((SMALLER (Array U (Array U Bool))))
                       (forall ((X U) (Y U))
                         (! (=> (select (select SMALLER X) Y)
                                (select (select SMALLER (select F X))
                                        (select F Y)))
                            :weight 0))))))
          (= fun_increasing a!1)))
(assert (not (forall ((F (Array U U)) (G (Array U U)) (H (Array U U)))
               (! (let ((a!1 (and (= (select (select fun_composition F) G)
                                     (select (select fun_composition F) H))
                                  (select fun_surjective F))))
                    (=> a!1 (= G H)))
                  :weight 0))))
(check-sat)
(get-info :all-statistics)

; SEU925_5.smt2


(reset)

; Auto-generated from TPTP input: C:\TPTP-v9.2.1\Problems\SEU\SEU925^5.p
(set-logic ALL)
(declare-sort U 0)
(assert (let ((a!1 (forall ((Xx U) (Xy U))
                     (! (=> (= (lambda ((Xy0 U)) (= Xx Xy0))
                               (lambda ((Xy_2 U)) (= Xy Xy_2)))
                            (= Xx Xy))
                        :weight 0))))
          (not a!1)))
(check-sat)



(reset)



; SEU956_5.smt2



; Auto-generated from TPTP input: C:\TPTP-v9.2.1\Problems\SEU\SEU956^5.p
(set-logic ALL)
(declare-sort U 0)
(assert (let ((a!1 (forall ((R (Array U Bool)) (S (Array U Bool)))
                     (! (=> (= R S)
                            (forall ((X U))
                              (! (=> (select S X) (select R X)) :weight 0)))
                        :weight 0)))
              (a!2 (forall ((Xx U) (Xy U))
                     (! (=> (= (lambda ((Y U)) (= Xx Y))
                               (lambda ((Y U)) (= Xy Y)))
                            (= Xx Xy))
                        :weight 0))))
          (not (=> a!1 a!2))))
(check-sat)

; SEV389_5.smt2

(reset)

; Auto-generated from TPTP input: C:\TPTP-v9.2.1\Problems\SEV\SEV389^5.p
(set-logic ALL)
(declare-sort U 0)
(declare-fun cS () (Array U Bool))
(declare-fun cR () (Array U Bool))
(assert (let ((a!1 (= cR (lambda ((Xx U)) (and (select cR Xx) (select cS Xx))))))
        (let ((a!2 (=> a!1
                       (forall ((Xx U))
                         (! (=> (select cR Xx) (select cS Xx)) :weight 0)))))
          (not a!2))))
(check-sat)

; SEV392_5.smt2

(reset)

; Auto-generated from TPTP input: C:\TPTP-v9.2.1\Problems\SEV\SEV392^5.p
(set-logic ALL)
(declare-sort U 0)
(declare-fun cS () (Array U Bool))
(declare-fun cR () (Array U Bool))
(assert (let ((a!1 (= (lambda ((Xx U)) (and (select cR Xx) (select cS Xx)))
                      (lambda ((Xz U)) (or (select cR Xz) (select cS Xz))))))
        (let ((a!2 (=> a!1
                       (forall ((Xx U))
                         (! (=> (select cR Xx) (select cS Xx)) :weight 0)))))
          (not a!2))))
(check-sat)

; SEV408_5.smt2

(reset)

; Auto-generated from TPTP input: C:\TPTP-v9.2.1\Problems\SEV\SEV408^5.p
(set-logic ALL)
(declare-sort U 0)
(declare-fun cF () (Array (Array U Bool) Bool))
(assert (let ((a!1 (exists ((G (Array (Array U Bool) Bool)))
                     (! (forall ((A (Array U Bool)))
                          (! (let ((a!1 (exists ((B (Array U Bool)))
                                          (! (and (select cF B)
                                                  (forall ((Xx U))
                                                    (! (=> (select A Xx)
                                                           (select B Xx))
                                                       :weight 0)))
                                             :weight 0))))
                               (=> (select G A) a!1))
                             :weight 0))
                        :weight 0))))
          (not a!1)))
(check-sat)
