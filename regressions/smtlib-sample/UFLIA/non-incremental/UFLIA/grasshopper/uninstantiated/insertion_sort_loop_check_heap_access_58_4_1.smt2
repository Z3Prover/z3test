(set-info :smt-lib-version 2.6)
(set-logic UFLIA)
(set-info :source |
  GRASShopper benchmarks.
  Authors: Ruzica Piskac, Thomas Wies, and Damien Zufferey
  URL: http://cs.nyu.edu/wies/software/grasshopper
  See also: GRASShopper - Complete Heap Verification with Mixed Specifications. In TACAS 2014, pages 124-139.

  If this benchmark is satisfiable, GRASShopper reports the following error message:
  tests/spl/sls/sls_insertion_sort.spl:58:4-25:Possible heap access through null or dangling reference
  |)
(set-info :category "crafted")
(set-info :status unsat)

(declare-sort Loc 0)
(declare-sort SetLoc 0)
(declare-sort SetInt 0)
(declare-sort FldBool 0)
(declare-sort FldLoc 0)
(declare-sort FldInt 0)
(declare-fun null$0 () Loc)
(declare-fun read$0 (FldInt Loc) Int)
(declare-fun read$1 (FldLoc Loc) Loc)
(declare-fun ep$0 (FldLoc SetLoc Loc) Loc)
(declare-fun emptyset$0 () SetLoc)
(declare-fun setenum$0 (Loc) SetLoc)
(declare-fun union$0 (SetLoc SetLoc) SetLoc)
(declare-fun intersection$0 (SetLoc SetLoc) SetLoc)
(declare-fun setminus$0 (SetLoc SetLoc) SetLoc)
(declare-fun Btwn$0 (FldLoc Loc Loc Loc) Bool)
(declare-fun Frame$0 (SetLoc SetLoc FldLoc FldLoc) Bool)
(declare-fun Frame$1 (SetLoc SetLoc FldInt FldInt) Bool)
(declare-fun in$0 (Loc SetLoc) Bool)
(declare-fun Alloc$0 () SetLoc)
(declare-fun Axiom_38$0 () Bool)
(declare-fun Axiom_39$0 () Bool)
(declare-fun Axiom_40$0 () Bool)
(declare-fun Axiom_41$0 () Bool)
(declare-fun Axiom_42$0 () Bool)
(declare-fun Axiom_43$0 () Bool)
(declare-fun Axiom_44$0 () Bool)
(declare-fun Axiom_45$0 () Bool)
(declare-fun Axiom_46$0 () Bool)
(declare-fun FP$0 () SetLoc)
(declare-fun FP_3$0 () SetLoc)
(declare-fun FP_4$0 () SetLoc)
(declare-fun FP_Caller$0 () SetLoc)
(declare-fun FP_Caller_2$0 () SetLoc)
(declare-fun curr_2$0 () Loc)
(declare-fun curr_4$0 () Loc)
(declare-fun curr_5$0 () Loc)
(declare-fun curr_init$0 () Loc)
(declare-fun data$0 () FldInt)
(declare-fun lseg_domain$0 (FldLoc Loc Loc) SetLoc)
(declare-fun lseg_struct$0 (SetLoc FldLoc Loc Loc) Bool)
(declare-fun lslseg_domain$0 (FldInt FldLoc Loc Loc Int) SetLoc)
(declare-fun lslseg_struct$0 (SetLoc FldInt FldLoc Loc Loc Int) Bool)
(declare-fun lst_2$0 () Loc)
(declare-fun lst_init$0 () Loc)
(declare-fun min_2$0 () Loc)
(declare-fun min_4$0 () Loc)
(declare-fun min_5$0 () Loc)
(declare-fun min_init$0 () Loc)
(declare-fun next$0 () FldLoc)
(declare-fun prv_4$0 () Loc)
(declare-fun prv_5$0 () Loc)
(declare-fun prv_init$0 () Loc)
(declare-fun sk_?X_126$0 () SetLoc)
(declare-fun sk_?X_127$0 () SetLoc)
(declare-fun sk_?X_128$0 () SetLoc)
(declare-fun sk_?X_129$0 () SetLoc)
(declare-fun sk_?X_130$0 () SetLoc)
(declare-fun sk_?X_131$0 () SetLoc)
(declare-fun sk_?X_132$0 () SetLoc)
(declare-fun sk_?X_133$0 () SetLoc)
(declare-fun sk_?X_134$0 () SetLoc)
(declare-fun sk_?X_135$0 () SetLoc)
(declare-fun sk_?X_136$0 () SetLoc)
(declare-fun sk_?X_137$0 () SetLoc)
(declare-fun sk_?X_138$0 () SetLoc)
(declare-fun sk_?X_139$0 () SetLoc)
(declare-fun sk_?X_140$0 () SetLoc)
(declare-fun sk_?X_141$0 () SetLoc)
(declare-fun sk_?X_142$0 () SetLoc)
(declare-fun sk_?X_143$0 () SetLoc)
(declare-fun sk_?X_144$0 () SetLoc)
(declare-fun sk_?X_145$0 () SetLoc)
(declare-fun sk_?X_146$0 () SetLoc)
(declare-fun sk_?X_147$0 () SetLoc)
(declare-fun sk_?X_148$0 () SetLoc)
(declare-fun sk_?X_149$0 () SetLoc)
(declare-fun sk_?X_150$0 () SetLoc)
(declare-fun sk_?X_151$0 () SetLoc)
(declare-fun sk_?X_152$0 () SetLoc)
(declare-fun sk_?X_153$0 () SetLoc)
(declare-fun sk_?X_154$0 () SetLoc)
(declare-fun sk_?X_155$0 () SetLoc)
(declare-fun sk_?X_156$0 () SetLoc)
(declare-fun sk_?X_157$0 () SetLoc)
(declare-fun sk_?X_158$0 () SetLoc)
(declare-fun srt_4$0 () Loc)
(declare-fun srt_5$0 () Loc)
(declare-fun srt_init$0 () Loc)
(declare-fun t_29$0 () Loc)
(declare-fun t_30$0 () Loc)
(declare-fun t_31$0 () Loc)
(declare-fun t_32$0 () Loc)
(declare-fun t_33$0 () Loc)
(declare-fun t_34$0 () Loc)
(declare-fun t_35$0 () Loc)
(declare-fun t_36$0 () Loc)
(declare-fun t_37$0 () Loc)
(declare-fun tmp_2$0 () Int)
(declare-fun tmp_4$0 () Int)
(declare-fun tmp_init$0 () Int)
(declare-fun ulseg_domain$0 (FldInt FldLoc Loc Loc Int) SetLoc)
(declare-fun ulseg_struct$0 (SetLoc FldInt FldLoc Loc Loc Int) Bool)

(assert (= (ep$0 next$0 FP_3$0 srt_init$0) t_37$0))

(assert (= (ep$0 next$0 FP_3$0 srt_5$0) t_36$0))

(assert (= (ep$0 next$0 FP_3$0 srt_4$0) t_35$0))

(assert (= (ep$0 next$0 FP_3$0 min_5$0) t_34$0))

(assert (= (ep$0 next$0 FP_3$0 min_4$0) t_33$0))

(assert (= (ep$0 next$0 FP_3$0 lst_init$0) t_32$0))

(assert (= (ep$0 next$0 FP_3$0 curr_5$0) t_31$0))

(assert (= (ep$0 next$0 FP_3$0 curr_4$0) t_30$0))

(assert (= (ep$0 next$0 FP_3$0 null$0) t_29$0))

(assert (forall ((?f FldLoc)) (= (read$1 ?f null$0) null$0)))

(assert (forall ((x Loc) (y Loc))
        (or (and (= x y) (in$0 x (setenum$0 y)))
            (and (not (= x y)) (not (in$0 x (setenum$0 y)))))))

(assert (forall ((X SetLoc) (Y SetLoc) (x Loc))
        (or (and (in$0 x X) (in$0 x (setminus$0 X Y)) (not (in$0 x Y)))
            (and (or (in$0 x Y) (not (in$0 x X)))
                 (not (in$0 x (setminus$0 X Y)))))))

(assert (forall ((X SetLoc) (Y SetLoc) (x Loc))
        (or (and (in$0 x X) (in$0 x Y) (in$0 x (intersection$0 X Y)))
            (and (or (not (in$0 x X)) (not (in$0 x Y)))
                 (not (in$0 x (intersection$0 X Y)))))))

(assert (forall ((X SetLoc) (Y SetLoc) (x Loc))
        (or (and (in$0 x (union$0 X Y)) (or (in$0 x X) (in$0 x Y)))
            (and (not (in$0 x X)) (not (in$0 x Y))
                 (not (in$0 x (union$0 X Y)))))))

(assert (forall ((x Loc)) (not (in$0 x emptyset$0))))

(assert (or (Btwn$0 next$0 curr_5$0 null$0 null$0)
    (not (lseg_struct$0 sk_?X_126$0 next$0 curr_5$0 null$0))))

(assert (or (and (Btwn$0 next$0 curr_4$0 null$0 null$0) Axiom_38$0)
    (not
         (ulseg_struct$0 sk_?X_147$0 data$0 next$0 curr_4$0 null$0
           (read$0 data$0 prv_4$0)))))

(assert (or (not Axiom_39$0)
    (forall ((l1 Loc))
            (or (<= (read$0 data$0 prv_5$0) (read$0 data$0 l1))
                (not (in$0 l1 sk_?X_128$0))))))

(assert (or
    (and (Btwn$0 next$0 lst_init$0 prv_init$0 prv_init$0) Axiom_41$0
         Axiom_40$0)
    (not
         (lslseg_struct$0 sk_?X_155$0 data$0 next$0 lst_init$0 prv_init$0
           (read$0 data$0 prv_init$0)))))

(assert (or (not Axiom_42$0)
    (forall ((l1 Loc))
            (or (<= (read$0 data$0 min_4$0) (read$0 data$0 l1))
                (not (in$0 l1 sk_?X_142$0))))))

(assert (or (and (Btwn$0 next$0 min_5$0 curr_5$0 curr_5$0) Axiom_43$0)
    (not
         (ulseg_struct$0 sk_?X_133$0 data$0 next$0 min_5$0 curr_5$0
           (read$0 data$0 min_5$0)))))

(assert (or (not Axiom_44$0)
    (forall ((l1 Loc))
            (or (<= (read$0 data$0 min_4$0) (read$0 data$0 l1))
                (not (in$0 l1 sk_?X_145$0))))))

(assert (or (and (Btwn$0 next$0 srt_5$0 min_5$0 min_5$0) Axiom_45$0)
    (not
         (ulseg_struct$0 sk_?X_130$0 data$0 next$0 srt_5$0 min_5$0
           (read$0 data$0 min_5$0)))))

(assert (or (not Axiom_46$0)
    (forall ((l1 Loc))
            (or (<= (read$0 data$0 prv_init$0) (read$0 data$0 l1))
                (not (in$0 l1 sk_?X_151$0))))))

(assert (= FP_4$0
  (union$0 (setminus$0 FP$0 FP_3$0)
    (union$0 (intersection$0 Alloc$0 FP_3$0) (setminus$0 Alloc$0 Alloc$0)))))

(assert (= curr_2$0 curr_init$0))

(assert (= curr_5$0 null$0))

(assert (= min_2$0 min_init$0))

(assert (= prv_4$0 prv_init$0))

(assert (= srt_4$0 srt_init$0))

(assert (= tmp_2$0 tmp_init$0))

(assert (Frame$1 FP_3$0 Alloc$0 data$0 data$0))

(assert (= Alloc$0 (union$0 FP_4$0 Alloc$0)))

(assert (= sk_?X_126$0 (lseg_domain$0 next$0 curr_5$0 null$0)))

(assert (= sk_?X_128$0
  (ulseg_domain$0 data$0 next$0 curr_5$0 null$0 (read$0 data$0 prv_5$0))))

(assert (= sk_?X_130$0
  (ulseg_domain$0 data$0 next$0 srt_5$0 min_5$0 (read$0 data$0 min_5$0))))

(assert (= sk_?X_132$0 (union$0 sk_?X_127$0 sk_?X_130$0)))

(assert (= sk_?X_134$0 (union$0 sk_?X_131$0 sk_?X_133$0)))

(assert (= sk_?X_136$0 sk_?X_134$0))

(assert (or
    (and (= emptyset$0 emptyset$0)
         (= emptyset$0 (intersection$0 sk_?X_127$0 sk_?X_130$0))
         (= emptyset$0 (intersection$0 sk_?X_132$0 sk_?X_133$0))
         (= prv_5$0 null$0)
         (= sk_?X_137$0
           (union$0 (intersection$0 Alloc$0 FP_3$0)
             (setminus$0 Alloc$0 Alloc$0)))
         (lseg_struct$0 sk_?X_126$0 next$0 curr_5$0 null$0)
         (ulseg_struct$0 sk_?X_130$0 data$0 next$0 srt_5$0 min_5$0
           (read$0 data$0 min_5$0))
         (ulseg_struct$0 sk_?X_133$0 data$0 next$0 min_5$0 curr_5$0
           (read$0 data$0 min_5$0))
         (not (= min_5$0 null$0)))
    (and (= emptyset$0 emptyset$0)
         (= emptyset$0 (intersection$0 sk_?X_129$0 sk_?X_130$0))
         (= emptyset$0 (intersection$0 sk_?X_131$0 sk_?X_133$0))
         (= sk_?X_136$0
           (union$0 (intersection$0 Alloc$0 FP_3$0)
             (setminus$0 Alloc$0 Alloc$0)))
         (<= (read$0 data$0 prv_5$0) (read$0 data$0 min_5$0))
         (ulseg_struct$0 sk_?X_128$0 data$0 next$0 curr_5$0 null$0
           (read$0 data$0 prv_5$0))
         (ulseg_struct$0 sk_?X_130$0 data$0 next$0 srt_5$0 min_5$0
           (read$0 data$0 min_5$0))
         (ulseg_struct$0 sk_?X_133$0 data$0 next$0 min_5$0 curr_5$0
           (read$0 data$0 min_5$0))
         (not (= min_5$0 null$0)))))

(assert (= sk_?X_139$0 sk_?X_141$0))

(assert (= sk_?X_141$0 (union$0 sk_?X_144$0 sk_?X_142$0)))

(assert (= sk_?X_143$0 (union$0 sk_?X_148$0 sk_?X_145$0)))

(assert (= sk_?X_145$0
  (ulseg_domain$0 data$0 next$0 srt_4$0 min_4$0 (read$0 data$0 min_4$0))))

(assert (= sk_?X_147$0
  (ulseg_domain$0 data$0 next$0 curr_4$0 null$0 (read$0 data$0 prv_4$0))))

(assert (= sk_?X_149$0 (lseg_domain$0 next$0 curr_4$0 null$0)))

(assert (or
    (and (= emptyset$0 emptyset$0)
         (= emptyset$0 (intersection$0 sk_?X_143$0 sk_?X_142$0))
         (= emptyset$0 (intersection$0 sk_?X_148$0 sk_?X_145$0))
         (= prv_4$0 null$0) (= sk_?X_138$0 FP_3$0)
         (lseg_struct$0 sk_?X_149$0 next$0 curr_4$0 null$0)
         (ulseg_struct$0 sk_?X_142$0 data$0 next$0 min_4$0 curr_4$0
           (read$0 data$0 min_4$0))
         (ulseg_struct$0 sk_?X_145$0 data$0 next$0 srt_4$0 min_4$0
           (read$0 data$0 min_4$0))
         (not (= min_4$0 null$0)))
    (and (= emptyset$0 emptyset$0)
         (= emptyset$0 (intersection$0 sk_?X_144$0 sk_?X_142$0))
         (= emptyset$0 (intersection$0 sk_?X_146$0 sk_?X_145$0))
         (= sk_?X_139$0 FP_3$0)
         (<= (read$0 data$0 prv_4$0) (read$0 data$0 min_4$0))
         (ulseg_struct$0 sk_?X_142$0 data$0 next$0 min_4$0 curr_4$0
           (read$0 data$0 min_4$0))
         (ulseg_struct$0 sk_?X_145$0 data$0 next$0 srt_4$0 min_4$0
           (read$0 data$0 min_4$0))
         (ulseg_struct$0 sk_?X_147$0 data$0 next$0 curr_4$0 null$0
           (read$0 data$0 prv_4$0))
         (not (= min_4$0 null$0)))))

(assert (= sk_?X_151$0
  (ulseg_domain$0 data$0 next$0 srt_init$0 null$0 (read$0 data$0 prv_init$0))))

(assert (= sk_?X_153$0 sk_?X_154$0))

(assert (= sk_?X_155$0
  (lslseg_domain$0 data$0 next$0 lst_init$0 prv_init$0
    (read$0 data$0 prv_init$0))))

(assert (= sk_?X_157$0 (lseg_domain$0 next$0 lst_init$0 null$0)))

(assert (= FP_Caller$0 (union$0 FP$0 FP_Caller$0)))

(assert (not (= srt_4$0 null$0)))

(assert (not (in$0 null$0 Alloc$0)))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 curr_4$0 l1 null$0)
                 (in$0 l1 (lseg_domain$0 next$0 curr_4$0 null$0))
                 (not (= l1 null$0)))
            (and (or (= l1 null$0) (not (Btwn$0 next$0 curr_4$0 l1 null$0)))
                 (not (in$0 l1 (lseg_domain$0 next$0 curr_4$0 null$0)))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 curr_5$0 l1 null$0)
                 (in$0 l1 (lseg_domain$0 next$0 curr_5$0 null$0))
                 (not (= l1 null$0)))
            (and (or (= l1 null$0) (not (Btwn$0 next$0 curr_5$0 l1 null$0)))
                 (not (in$0 l1 (lseg_domain$0 next$0 curr_5$0 null$0)))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 lst_init$0 l1 null$0)
                 (in$0 l1 (lseg_domain$0 next$0 lst_init$0 null$0))
                 (not (= l1 null$0)))
            (and
                 (or (= l1 null$0)
                     (not (Btwn$0 next$0 lst_init$0 l1 null$0)))
                 (not (in$0 l1 (lseg_domain$0 next$0 lst_init$0 null$0)))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 min_4$0 l1 curr_4$0)
                 (in$0 l1
                   (ulseg_domain$0 data$0 next$0 min_4$0 curr_4$0
                     (read$0 data$0 min_4$0)))
                 (not (= l1 curr_4$0)))
            (and
                 (or (= l1 curr_4$0)
                     (not (Btwn$0 next$0 min_4$0 l1 curr_4$0)))
                 (not
                      (in$0 l1
                        (ulseg_domain$0 data$0 next$0 min_4$0 curr_4$0
                          (read$0 data$0 min_4$0))))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 srt_4$0 l1 min_4$0)
                 (in$0 l1
                   (ulseg_domain$0 data$0 next$0 srt_4$0 min_4$0
                     (read$0 data$0 min_4$0)))
                 (not (= l1 min_4$0)))
            (and (or (= l1 min_4$0) (not (Btwn$0 next$0 srt_4$0 l1 min_4$0)))
                 (not
                      (in$0 l1
                        (ulseg_domain$0 data$0 next$0 srt_4$0 min_4$0
                          (read$0 data$0 min_4$0))))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 srt_init$0 l1 null$0)
                 (in$0 l1
                   (ulseg_domain$0 data$0 next$0 srt_init$0 null$0
                     (read$0 data$0 prv_init$0)))
                 (not (= l1 null$0)))
            (and
                 (or (= l1 null$0)
                     (not (Btwn$0 next$0 srt_init$0 l1 null$0)))
                 (not
                      (in$0 l1
                        (ulseg_domain$0 data$0 next$0 srt_init$0 null$0
                          (read$0 data$0 prv_init$0))))))))

(assert (forall ((?X SetLoc) (?f FldLoc) (?x Loc))
        (or (in$0 (ep$0 ?f ?X ?x) ?X) (= ?x (ep$0 ?f ?X ?x)))))

(assert (forall ((?X SetLoc) (?f FldLoc) (?x Loc))
        (Btwn$0 ?f ?x (ep$0 ?f ?X ?x) (ep$0 ?f ?X ?x))))

(assert (or (Btwn$0 next$0 curr_4$0 null$0 null$0)
    (not (lseg_struct$0 sk_?X_149$0 next$0 curr_4$0 null$0))))

(assert (or (Btwn$0 next$0 lst_init$0 null$0 null$0)
    (not (lseg_struct$0 sk_?X_157$0 next$0 lst_init$0 null$0))))

(assert (or (not Axiom_38$0)
    (forall ((l1 Loc))
            (or (<= (read$0 data$0 prv_4$0) (read$0 data$0 l1))
                (not (in$0 l1 sk_?X_147$0))))))

(assert (or (and (Btwn$0 next$0 curr_5$0 null$0 null$0) Axiom_39$0)
    (not
         (ulseg_struct$0 sk_?X_128$0 data$0 next$0 curr_5$0 null$0
           (read$0 data$0 prv_5$0)))))

(assert (or (not Axiom_40$0)
    (forall ((l1 Loc) (l2 Loc))
            (or (<= (read$0 data$0 l1) (read$0 data$0 l2))
                (not (Btwn$0 next$0 l1 l2 prv_init$0))
                (not (in$0 l1 sk_?X_155$0)) (not (in$0 l2 sk_?X_155$0))))))

(assert (or (not Axiom_41$0)
    (forall ((l1 Loc))
            (or (<= (read$0 data$0 l1) (read$0 data$0 prv_init$0))
                (not (in$0 l1 sk_?X_155$0))))))

(assert (or (and (Btwn$0 next$0 min_4$0 curr_4$0 curr_4$0) Axiom_42$0)
    (not
         (ulseg_struct$0 sk_?X_142$0 data$0 next$0 min_4$0 curr_4$0
           (read$0 data$0 min_4$0)))))

(assert (or (not Axiom_43$0)
    (forall ((l1 Loc))
            (or (<= (read$0 data$0 min_5$0) (read$0 data$0 l1))
                (not (in$0 l1 sk_?X_133$0))))))

(assert (or (and (Btwn$0 next$0 srt_4$0 min_4$0 min_4$0) Axiom_44$0)
    (not
         (ulseg_struct$0 sk_?X_145$0 data$0 next$0 srt_4$0 min_4$0
           (read$0 data$0 min_4$0)))))

(assert (or (not Axiom_45$0)
    (forall ((l1 Loc))
            (or (<= (read$0 data$0 min_5$0) (read$0 data$0 l1))
                (not (in$0 l1 sk_?X_130$0))))))

(assert (or (and (Btwn$0 next$0 srt_init$0 null$0 null$0) Axiom_46$0)
    (not
         (ulseg_struct$0 sk_?X_151$0 data$0 next$0 srt_init$0 null$0
           (read$0 data$0 prv_init$0)))))

(assert (= FP_Caller_2$0 (setminus$0 FP_Caller$0 FP$0)))

(assert (= curr_4$0 (read$1 next$0 srt_4$0)))

(assert (= lst_2$0 lst_init$0))

(assert (= min_4$0 srt_4$0))

(assert (= prv_5$0 prv_4$0))

(assert (= srt_5$0 srt_4$0))

(assert (= tmp_4$0 (read$0 data$0 min_5$0)))

(assert (Frame$0 FP_3$0 Alloc$0 next$0 next$0))

(assert (= Alloc$0 (union$0 FP_Caller$0 Alloc$0)))

(assert (= sk_?X_127$0 sk_?X_126$0))

(assert (= sk_?X_129$0 sk_?X_128$0))

(assert (= sk_?X_131$0 (union$0 sk_?X_129$0 sk_?X_130$0)))

(assert (= sk_?X_133$0
  (ulseg_domain$0 data$0 next$0 min_5$0 curr_5$0 (read$0 data$0 min_5$0))))

(assert (= sk_?X_135$0 (union$0 sk_?X_132$0 sk_?X_133$0)))

(assert (= sk_?X_137$0 sk_?X_135$0))

(assert (= sk_?X_138$0 sk_?X_140$0))

(assert (= sk_?X_140$0 (union$0 sk_?X_143$0 sk_?X_142$0)))

(assert (= sk_?X_142$0
  (ulseg_domain$0 data$0 next$0 min_4$0 curr_4$0 (read$0 data$0 min_4$0))))

(assert (= sk_?X_144$0 (union$0 sk_?X_146$0 sk_?X_145$0)))

(assert (= sk_?X_146$0 sk_?X_147$0))

(assert (= sk_?X_148$0 sk_?X_149$0))

(assert (= FP$0 (union$0 FP_3$0 FP$0)))

(assert (= sk_?X_150$0 (union$0 sk_?X_152$0 sk_?X_151$0)))

(assert (= sk_?X_152$0 (union$0 sk_?X_155$0 sk_?X_153$0)))

(assert (= sk_?X_154$0 (setenum$0 prv_init$0)))

(assert (= sk_?X_156$0 (union$0 sk_?X_158$0 sk_?X_157$0)))

(assert (= sk_?X_158$0 emptyset$0))

(assert (or
    (and (= (read$1 next$0 prv_init$0) srt_init$0) (= emptyset$0 emptyset$0)
         (= emptyset$0 (intersection$0 sk_?X_152$0 sk_?X_151$0))
         (= emptyset$0 (intersection$0 sk_?X_155$0 sk_?X_153$0))
         (= sk_?X_150$0 FP$0)
         (lslseg_struct$0 sk_?X_155$0 data$0 next$0 lst_init$0 prv_init$0
           (read$0 data$0 prv_init$0))
         (ulseg_struct$0 sk_?X_151$0 data$0 next$0 srt_init$0 null$0
           (read$0 data$0 prv_init$0)))
    (and (= emptyset$0 emptyset$0)
         (= emptyset$0 (intersection$0 sk_?X_158$0 sk_?X_157$0))
         (= prv_init$0 null$0) (= sk_?X_156$0 FP$0) (= srt_init$0 lst_init$0)
         (lseg_struct$0 sk_?X_157$0 next$0 lst_init$0 null$0))))

(assert (not (in$0 null$0 Alloc$0)))

(assert (not (in$0 min_5$0 FP_4$0)))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 curr_4$0 l1 null$0)
                 (in$0 l1
                   (ulseg_domain$0 data$0 next$0 curr_4$0 null$0
                     (read$0 data$0 prv_4$0)))
                 (not (= l1 null$0)))
            (and (or (= l1 null$0) (not (Btwn$0 next$0 curr_4$0 l1 null$0)))
                 (not
                      (in$0 l1
                        (ulseg_domain$0 data$0 next$0 curr_4$0 null$0
                          (read$0 data$0 prv_4$0))))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 curr_5$0 l1 null$0)
                 (in$0 l1
                   (ulseg_domain$0 data$0 next$0 curr_5$0 null$0
                     (read$0 data$0 prv_5$0)))
                 (not (= l1 null$0)))
            (and (or (= l1 null$0) (not (Btwn$0 next$0 curr_5$0 l1 null$0)))
                 (not
                      (in$0 l1
                        (ulseg_domain$0 data$0 next$0 curr_5$0 null$0
                          (read$0 data$0 prv_5$0))))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 lst_init$0 l1 prv_init$0)
                 (in$0 l1
                   (lslseg_domain$0 data$0 next$0 lst_init$0 prv_init$0
                     (read$0 data$0 prv_init$0)))
                 (not (= l1 prv_init$0)))
            (and
                 (or (= l1 prv_init$0)
                     (not (Btwn$0 next$0 lst_init$0 l1 prv_init$0)))
                 (not
                      (in$0 l1
                        (lslseg_domain$0 data$0 next$0 lst_init$0 prv_init$0
                          (read$0 data$0 prv_init$0))))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 min_5$0 l1 curr_5$0)
                 (in$0 l1
                   (ulseg_domain$0 data$0 next$0 min_5$0 curr_5$0
                     (read$0 data$0 min_5$0)))
                 (not (= l1 curr_5$0)))
            (and
                 (or (= l1 curr_5$0)
                     (not (Btwn$0 next$0 min_5$0 l1 curr_5$0)))
                 (not
                      (in$0 l1
                        (ulseg_domain$0 data$0 next$0 min_5$0 curr_5$0
                          (read$0 data$0 min_5$0))))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 srt_5$0 l1 min_5$0)
                 (in$0 l1
                   (ulseg_domain$0 data$0 next$0 srt_5$0 min_5$0
                     (read$0 data$0 min_5$0)))
                 (not (= l1 min_5$0)))
            (and (or (= l1 min_5$0) (not (Btwn$0 next$0 srt_5$0 l1 min_5$0)))
                 (not
                      (in$0 l1
                        (ulseg_domain$0 data$0 next$0 srt_5$0 min_5$0
                          (read$0 data$0 min_5$0))))))))

(assert (forall ((?X SetLoc) (?f FldLoc) (?x Loc) (?y Loc))
        (or (Btwn$0 ?f ?x (ep$0 ?f ?X ?x) ?y) (not (Btwn$0 ?f ?x ?y ?y))
            (not (in$0 ?y ?X)))))

(assert (forall ((?X SetLoc) (?f FldLoc) (?x Loc) (?y Loc))
        (or (not (Btwn$0 ?f ?x ?y ?y)) (not (in$0 ?y ?X))
            (in$0 (ep$0 ?f ?X ?x) ?X))))

(assert (forall ((?f FldLoc) (?u Loc) (?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 ?f ?x ?y ?z)) (not (Btwn$0 ?f ?x ?u ?y))
            (and (Btwn$0 ?f ?x ?u ?z) (Btwn$0 ?f ?u ?y ?z)))))

(assert (forall ((?f FldLoc) (?u Loc) (?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 ?f ?x ?y ?z)) (not (Btwn$0 ?f ?y ?u ?z))
            (and (Btwn$0 ?f ?x ?y ?u) (Btwn$0 ?f ?x ?u ?z)))))

(assert (forall ((?f FldLoc) (?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 ?f ?x ?y ?y)) (not (Btwn$0 ?f ?y ?z ?z))
            (Btwn$0 ?f ?x ?z ?z))))

(assert (forall ((?f FldLoc) (?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 ?f ?x ?y ?z))
            (and (Btwn$0 ?f ?x ?y ?y) (Btwn$0 ?f ?y ?z ?z)))))

(assert (forall ((?f FldLoc) (?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 ?f ?x ?y ?y)) (not (Btwn$0 ?f ?x ?z ?z))
            (Btwn$0 ?f ?x ?y ?z) (Btwn$0 ?f ?x ?z ?y))))

(assert (forall ((?f FldLoc) (?x Loc) (?y Loc))
        (or (not (Btwn$0 ?f ?x ?y ?x)) (= ?x ?y))))

(assert (forall ((?f FldLoc) (?x Loc) (?y Loc))
        (or (not (Btwn$0 ?f ?x ?y ?y)) (= ?x ?y)
            (Btwn$0 ?f ?x (read$1 ?f ?x) ?y))))

(assert (forall ((?f FldLoc) (?x Loc) (?y Loc))
        (or (not (= (read$1 ?f ?x) ?x)) (not (Btwn$0 ?f ?x ?y ?y)) (= ?x ?y))))

(assert (forall ((?f FldLoc) (?x Loc)) (Btwn$0 ?f ?x (read$1 ?f ?x) (read$1 ?f ?x))))

(assert (forall ((?f FldLoc) (?x Loc)) (Btwn$0 ?f ?x ?x ?x)))

(check-sat)
(exit)
