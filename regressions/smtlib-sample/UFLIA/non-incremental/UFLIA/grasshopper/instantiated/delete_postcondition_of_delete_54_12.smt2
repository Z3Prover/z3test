(set-info :smt-lib-version 2.6)
(set-logic UFLIA)
(set-info :source |
  GRASShopper benchmarks.
  Authors: Ruzica Piskac, Thomas Wies, and Damien Zufferey
  URL: http://cs.nyu.edu/wies/software/grasshopper
  See also: GRASShopper - Complete Heap Verification with Mixed Specifications. In TACAS 2014, pages 124-139.

  If this benchmark is satisfiable, GRASShopper reports the following error message:
  tests/spl/sl_sorted_set/delete.spl:54:12-23:A postcondition of procedure delete might not hold at this return point
  tests/spl/sl_sorted_set/delete.spl:27:10-52:Related location: This is the postcondition that might not hold
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
(declare-fun write$0 (FldLoc Loc Loc) FldLoc)
(declare-fun ep$0 (FldLoc SetLoc Loc) Loc)
(declare-fun emptyset$0 () SetInt)
(declare-fun emptyset$1 () SetLoc)
(declare-fun setenum$0 (Loc) SetLoc)
(declare-fun setenum$1 (Int) SetInt)
(declare-fun union$0 (SetLoc SetLoc) SetLoc)
(declare-fun union$1 (SetInt SetInt) SetInt)
(declare-fun intersection$0 (SetLoc SetLoc) SetLoc)
(declare-fun setminus$0 (SetLoc SetLoc) SetLoc)
(declare-fun setminus$1 (SetInt SetInt) SetInt)
(declare-fun Btwn$0 (FldLoc Loc Loc Loc) Bool)
(declare-fun Frame$0 (SetLoc SetLoc FldInt FldInt) Bool)
(declare-fun Frame$1 (SetLoc SetLoc FldLoc FldLoc) Bool)
(declare-fun in$0 (Int SetInt) Bool)
(declare-fun in$1 (Loc SetLoc) Bool)
(declare-fun Alloc$0 () SetLoc)
(declare-fun Alloc_1$0 () SetLoc)
(declare-fun Axiom_18$0 () Bool)
(declare-fun Axiom_19$0 () Bool)
(declare-fun Axiom_20$0 () Bool)
(declare-fun Axiom_21$0 () Bool)
(declare-fun Axiom_22$0 () Bool)
(declare-fun Axiom_23$0 () Bool)
(declare-fun FP$0 () SetLoc)
(declare-fun FP_1$0 () SetLoc)
(declare-fun FP_2$0 () SetLoc)
(declare-fun FP_3$0 () SetLoc)
(declare-fun FP_Caller$0 () SetLoc)
(declare-fun FP_Caller_1$0 () SetLoc)
(declare-fun FP_Caller_final_3$0 () SetLoc)
(declare-fun c1_2$0 () SetInt)
(declare-fun c1_3$0 () SetInt)
(declare-fun c2_2$0 () SetInt)
(declare-fun c2_3$0 () SetInt)
(declare-fun content$0 () SetInt)
(declare-fun content_1$0 () SetInt)
(declare-fun curr_2$0 () Loc)
(declare-fun curr_3$0 () Loc)
(declare-fun curr_4$0 () Loc)
(declare-fun data$0 () FldInt)
(declare-fun lst$0 () Loc)
(declare-fun lst_1$0 () Loc)
(declare-fun n_2$0 () Loc)
(declare-fun next$0 () FldLoc)
(declare-fun next_1$0 () FldLoc)
(declare-fun prev_2$0 () Loc)
(declare-fun prev_3$0 () Loc)
(declare-fun res_3$0 () Loc)
(declare-fun sk_?X_60$0 () SetLoc)
(declare-fun sk_?X_61$0 () SetLoc)
(declare-fun sk_?X_62$0 () SetLoc)
(declare-fun sk_?X_63$0 () SetLoc)
(declare-fun sk_?X_64$0 () SetLoc)
(declare-fun sk_?X_65$0 () SetLoc)
(declare-fun sk_?X_66$0 () SetLoc)
(declare-fun sk_?X_67$0 () SetLoc)
(declare-fun sk_?X_68$0 () SetLoc)
(declare-fun sk_?X_69$0 () SetLoc)
(declare-fun sk_?X_70$0 () SetLoc)
(declare-fun sk_?X_71$0 () SetLoc)
(declare-fun sk_?X_72$0 () SetLoc)
(declare-fun sk_?X_73$0 () SetLoc)
(declare-fun sk_?X_74$0 () SetLoc)
(declare-fun sk_?X_75$0 () SetLoc)
(declare-fun sk_?X_76$0 () SetLoc)
(declare-fun sk_?X_77$0 () SetLoc)
(declare-fun sk_?e_2$0 () Int)
(declare-fun sk_l1_2$0 () Loc)
(declare-fun sk_l2_2$0 () Loc)
(declare-fun sorted_set_c$0 (FldInt FldLoc Loc Loc) SetInt)
(declare-fun sorted_set_domain$0 (FldInt FldLoc Loc Loc) SetLoc)
(declare-fun sorted_set_struct$0 (SetLoc FldInt FldLoc Loc Loc SetInt) Bool)
(declare-fun val$0 () Int)
(declare-fun val_1$0 () Int)
(declare-fun witness$0 (FldInt Int SetInt) Loc)

(assert (forall ((?y Loc))
        (or (not (Btwn$0 next$0 null$0 ?y ?y)) (= null$0 ?y)
            (Btwn$0 next$0 null$0 (read$1 next$0 null$0) ?y))))

(assert (forall ((?y Loc))
        (or (not (Btwn$0 next$0 prev_3$0 ?y ?y)) (= prev_3$0 ?y)
            (Btwn$0 next$0 prev_3$0 (read$1 next$0 prev_3$0) ?y))))

(assert (forall ((?y Loc))
        (or (not (Btwn$0 next$0 curr_3$0 ?y ?y)) (= curr_3$0 ?y)
            (Btwn$0 next$0 curr_3$0 (read$1 next$0 curr_3$0) ?y))))

(assert (forall ((?y Loc))
        (or (not (= (read$1 next$0 null$0) null$0))
            (not (Btwn$0 next$0 null$0 ?y ?y)) (= null$0 ?y))))

(assert (forall ((?y Loc))
        (or (not (= (read$1 next$0 prev_3$0) prev_3$0))
            (not (Btwn$0 next$0 prev_3$0 ?y ?y)) (= prev_3$0 ?y))))

(assert (forall ((?y Loc))
        (or (not (= (read$1 next$0 curr_3$0) curr_3$0))
            (not (Btwn$0 next$0 curr_3$0 ?y ?y)) (= curr_3$0 ?y))))

(assert (Btwn$0 next$0 null$0 (read$1 next$0 null$0) (read$1 next$0 null$0)))

(assert (Btwn$0 next$0 prev_3$0 (read$1 next$0 prev_3$0) (read$1 next$0 prev_3$0)))

(assert (Btwn$0 next$0 curr_3$0 (read$1 next$0 curr_3$0) (read$1 next$0 curr_3$0)))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (in$1
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (in$1
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 null$0))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 null$0))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 null$0))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 null$0))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 null$0))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 null$0))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 null$0))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      null$0)
    (in$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))

(assert (or
    (=
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      null$0)
    (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      null$0)
    (in$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      null$0)
    (in$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      null$0)
    (in$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      null$0)
    (in$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))

(assert (or
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      null$0)
    (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      null$0)
    (in$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 null$0))))

(assert (or
    (= (witness$0 data$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      null$0)
    (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      null$0)
    (in$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      null$0)
    (in$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 lst$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      null$0)
    (in$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      null$0)
    (in$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 lst$0 null$0))
      null$0)
    (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      null$0)
    (in$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      null$0)
    (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      null$0)
    (in$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      null$0)
    (in$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      null$0)
    (in$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      null$0)
    (in$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      null$0)
    (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))

(assert (or
    (= (read$0 data$0 curr_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= val_1$0
      (read$0 data$0
        (witness$0 data$0 val_1$0
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= (read$0 data$0 prev_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= (read$0 data$0 prev_3$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= (read$0 data$0 sk_l1_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= (read$0 data$0 sk_l2_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= sk_?e_2$0
      (read$0 data$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= (read$0 data$0 curr_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 null$0))))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= val_1$0
      (read$0 data$0
        (witness$0 data$0 val_1$0
          (sorted_set_c$0 data$0 next$0 lst$0 null$0))))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= (read$0 data$0 prev_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 null$0))))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= (read$0 data$0 prev_3$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 lst$0 null$0))))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= (read$0 data$0 sk_l1_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 null$0))))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= (read$0 data$0 sk_l2_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 null$0))))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= sk_?e_2$0
      (read$0 data$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 lst$0 null$0))))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= (read$0 data$0 curr_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= val_1$0
      (read$0 data$0
        (witness$0 data$0 val_1$0
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= (read$0 data$0 prev_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= (read$0 data$0 prev_3$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= (read$0 data$0 sk_l1_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= (read$0 data$0 sk_l2_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= sk_?e_2$0
      (read$0 data$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (forall ((l1 Loc))
        (or
            (in$0 (read$0 data$0 l1)
              (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
            (not
                 (in$1 l1
                   (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0))))))

(assert (forall ((l1 Loc))
        (or
            (in$0 (read$0 data$0 l1)
              (sorted_set_c$0 data$0 next$0 lst$0 null$0))
            (not (in$1 l1 (sorted_set_domain$0 data$0 next$0 lst$0 null$0))))))

(assert (forall ((l1 Loc))
        (or
            (in$0 (read$0 data$0 l1)
              (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
            (not
                 (in$1 l1
                   (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0))))))

(assert (or
    (= lst$0
      (witness$0 data$0 (read$0 data$0 lst$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
    (not (in$1 lst$0 (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= curr_3$0
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
    (not
         (in$1 curr_3$0 (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= null$0
      (witness$0 data$0 (read$0 data$0 null$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
    (not (in$1 null$0 (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= prev_3$0
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
    (not
         (in$1 prev_3$0 (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= sk_l1_2$0
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
    (not
         (in$1 sk_l1_2$0
           (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= sk_l2_2$0
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
    (not
         (in$1 sk_l2_2$0
           (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (or
    (= lst$0
      (witness$0 data$0 (read$0 data$0 lst$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0)))
    (not (in$1 lst$0 (sorted_set_domain$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= curr_3$0
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0)))
    (not (in$1 curr_3$0 (sorted_set_domain$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= null$0
      (witness$0 data$0 (read$0 data$0 null$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0)))
    (not (in$1 null$0 (sorted_set_domain$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= prev_3$0
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0)))
    (not (in$1 prev_3$0 (sorted_set_domain$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= sk_l1_2$0
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0)))
    (not (in$1 sk_l1_2$0 (sorted_set_domain$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= sk_l2_2$0
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 null$0)))
    (not (in$1 sk_l2_2$0 (sorted_set_domain$0 data$0 next$0 lst$0 null$0)))))

(assert (or
    (= lst$0
      (witness$0 data$0 (read$0 data$0 lst$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
    (not (in$1 lst$0 (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= curr_3$0
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
    (not (in$1 curr_3$0 (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= null$0
      (witness$0 data$0 (read$0 data$0 null$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
    (not (in$1 null$0 (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= prev_3$0
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
    (not (in$1 prev_3$0 (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= sk_l1_2$0
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
    (not
         (in$1 sk_l1_2$0 (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0)))))

(assert (or
    (= sk_l2_2$0
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
    (not
         (in$1 sk_l2_2$0 (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0)))))

(assert (forall ((l1 Loc) (l2 Loc))
        (or (not Axiom_22$0)
            (or (= l1 l2) (< (read$0 data$0 l1) (read$0 data$0 l2))
                (not (Btwn$0 next$0 l1 l2 curr_3$0))
                (not (in$1 l1 sk_?X_60$0)) (not (in$1 l2 sk_?X_60$0))))))

(assert (forall ((l1 Loc) (l2 Loc))
        (or (not Axiom_20$0)
            (or (= l1 l2) (< (read$0 data$0 l1) (read$0 data$0 l2))
                (not (Btwn$0 next$0 l1 l2 null$0)) (not (in$1 l1 sk_?X_76$0))
                (not (in$1 l2 sk_?X_76$0))))))

(assert (forall ((l1 Loc) (l2 Loc))
        (or (not Axiom_18$0)
            (or (= l1 l2) (< (read$0 data$0 l1) (read$0 data$0 l2))
                (not (Btwn$0 next$0 l1 l2 null$0)) (not (in$1 l1 sk_?X_73$0))
                (not (in$1 l2 sk_?X_73$0))))))

(assert (forall ((?y Loc))
        (or (Btwn$0 next$0 null$0 (ep$0 next$0 FP_1$0 null$0) ?y)
            (not (Btwn$0 next$0 null$0 ?y ?y)) (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or (Btwn$0 next$0 lst$0 (ep$0 next$0 FP_1$0 lst$0) ?y)
            (not (Btwn$0 next$0 lst$0 ?y ?y)) (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or (Btwn$0 next$0 curr_3$0 (ep$0 next$0 FP_1$0 curr_3$0) ?y)
            (not (Btwn$0 next$0 curr_3$0 ?y ?y)) (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or (Btwn$0 next$0 sk_l1_2$0 (ep$0 next$0 FP_1$0 sk_l1_2$0) ?y)
            (not (Btwn$0 next$0 sk_l1_2$0 ?y ?y)) (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or (Btwn$0 next$0 sk_l2_2$0 (ep$0 next$0 FP_1$0 sk_l2_2$0) ?y)
            (not (Btwn$0 next$0 sk_l2_2$0 ?y ?y)) (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_2$0)
                (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_2$0)
                  (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_2$0)
                     (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_2$0)
                (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_2$0)
                  (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_2$0)
                     (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_2$0)
                (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_2$0)
                  (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_2$0)
                     (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_2$0)
                (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_2$0)
                  (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_2$0)
                     (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_2$0)
                (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_2$0)
                  (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_2$0)
                     (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_3$0)
                (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_3$0)
                  (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_3$0)
                     (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_3$0)
                (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_3$0)
                  (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_3$0)
                     (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_3$0)
                (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_3$0)
                  (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_3$0)
                     (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_3$0)
                (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_3$0)
                  (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_3$0)
                     (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 curr_3$0)
                (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 curr_3$0)
                  (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 curr_3$0)
                     (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_2$0)
                (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_2$0)
                  (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_2$0)
                     (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_2$0)
                (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_2$0)
                  (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_2$0)
                     (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_2$0)
                (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_2$0)
                  (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_2$0)
                     (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_2$0)
                (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_2$0)
                  (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_2$0)
                     (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_2$0)
                (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_2$0)
                  (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_2$0)
                     (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_3$0)
                (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_3$0)
                  (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_3$0)
                     (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_3$0)
                (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_3$0)
                  (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_3$0)
                     (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_3$0)
                (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_3$0)
                  (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_3$0)
                     (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_3$0)
                (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_3$0)
                  (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_3$0)
                     (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 prev_3$0)
                (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 prev_3$0)
                  (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 prev_3$0)
                     (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                  (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                     (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                  (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                     (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                  (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                     (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                  (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                     (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                  (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
                     (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                  (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                     (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                  (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                     (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                  (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                     (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                  (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                     (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                  (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
                     (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 sk_?e_2$0
                (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 sk_?e_2$0
                  (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 sk_?e_2$0
                     (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 sk_?e_2$0
                (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 sk_?e_2$0
                  (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 sk_?e_2$0
                     (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 sk_?e_2$0
                (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 sk_?e_2$0
                  (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 sk_?e_2$0
                     (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 sk_?e_2$0
                (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 sk_?e_2$0
                  (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 sk_?e_2$0
                     (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (forall ((?y Loc))
        (or
            (Btwn$0 next$0
              (witness$0 data$0 sk_?e_2$0
                (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
              (ep$0 next$0 FP_1$0
                (witness$0 data$0 sk_?e_2$0
                  (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
              ?y)
            (not
                 (Btwn$0 next$0
                   (witness$0 data$0 sk_?e_2$0
                     (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
                   ?y ?y))
            (not (in$1 ?y FP_1$0)))))

(assert (or (in$1 (ep$0 next$0 FP_1$0 null$0) FP_1$0)
    (= null$0 (ep$0 next$0 FP_1$0 null$0))))

(assert (or (in$1 (ep$0 next$0 FP_1$0 lst$0) FP_1$0)
    (= lst$0 (ep$0 next$0 FP_1$0 lst$0))))

(assert (or (in$1 (ep$0 next$0 FP_1$0 curr_3$0) FP_1$0)
    (= curr_3$0 (ep$0 next$0 FP_1$0 curr_3$0))))

(assert (or (in$1 (ep$0 next$0 FP_1$0 sk_l1_2$0) FP_1$0)
    (= sk_l1_2$0 (ep$0 next$0 FP_1$0 sk_l1_2$0))))

(assert (or (in$1 (ep$0 next$0 FP_1$0 sk_l2_2$0) FP_1$0)
    (= sk_l2_2$0 (ep$0 next$0 FP_1$0 sk_l2_2$0))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 curr_3$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
      FP_1$0)
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
      FP_1$0)
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))))))

(assert (or
    (in$1
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
      FP_1$0)
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (ep$0 next$0 FP_1$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))))

(assert (Btwn$0 next$0 null$0 (ep$0 next$0 FP_1$0 null$0)
  (ep$0 next$0 FP_1$0 null$0)))

(assert (Btwn$0 next$0 lst$0 (ep$0 next$0 FP_1$0 lst$0) (ep$0 next$0 FP_1$0 lst$0)))

(assert (Btwn$0 next$0 curr_3$0 (ep$0 next$0 FP_1$0 curr_3$0)
  (ep$0 next$0 FP_1$0 curr_3$0)))

(assert (Btwn$0 next$0 sk_l1_2$0 (ep$0 next$0 FP_1$0 sk_l1_2$0)
  (ep$0 next$0 FP_1$0 sk_l1_2$0)))

(assert (Btwn$0 next$0 sk_l2_2$0 (ep$0 next$0 FP_1$0 sk_l2_2$0)
  (ep$0 next$0 FP_1$0 sk_l2_2$0)))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_2$0)
    (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_2$0)
    (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_2$0)
    (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_2$0)
    (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_2$0)
    (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_3$0)
    (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_3$0)
    (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_3$0)
    (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_3$0)
    (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 curr_3$0)
    (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 curr_3$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_2$0)
    (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_2$0)
    (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_2$0)
    (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_2$0)
    (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_2$0)
    (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_3$0)
    (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_3$0)
    (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_3$0)
    (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_3$0)
    (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 prev_3$0)
    (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
    (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
    (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
    (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
    (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
    (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
    (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
    (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
    (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
    (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
    (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next$0 curr_2$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 sk_?e_2$0
    (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0)))))

(assert (Btwn$0 next$0
  (witness$0 data$0 sk_?e_2$0
    (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
  (ep$0 next$0 FP_1$0
    (witness$0 data$0 sk_?e_2$0
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (in$1
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (in$1
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (in$1
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      null$0)
    (in$0 val_1$0 (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
      null$0)
    (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      null$0)
    (in$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))

(assert (or
    (=
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      null$0)
    (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      null$0)
    (in$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      null$0)
    (in$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      null$0)
    (in$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      null$0)
    (in$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))

(assert (or
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
      null$0)
    (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 curr_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 curr_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 val_1$0
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      null$0)
    (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 prev_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 prev_3$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 sk_l1_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      null$0)
    (in$0 (read$0 data$0 sk_l2_2$0)
      (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))

(assert (or
    (=
      (witness$0 data$0 sk_?e_2$0
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
      null$0)
    (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))

(assert (or
    (= (read$0 data$0 curr_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= val_1$0
      (read$0 data$0
        (witness$0 data$0 val_1$0
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= (read$0 data$0 prev_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= (read$0 data$0 prev_3$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= (read$0 data$0 sk_l1_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= (read$0 data$0 sk_l2_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= sk_?e_2$0
      (read$0 data$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= (read$0 data$0 curr_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= val_1$0
      (read$0 data$0
        (witness$0 data$0 val_1$0
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= (read$0 data$0 prev_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= (read$0 data$0 prev_3$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= (read$0 data$0 sk_l1_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= (read$0 data$0 sk_l2_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= sk_?e_2$0
      (read$0 data$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= (read$0 data$0 curr_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 curr_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 curr_2$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= val_1$0
      (read$0 data$0
        (witness$0 data$0 val_1$0
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))
    (not (in$0 val_1$0 (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= (read$0 data$0 prev_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 prev_2$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= (read$0 data$0 prev_3$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 prev_3$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 prev_3$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= (read$0 data$0 sk_l1_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 sk_l1_2$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= (read$0 data$0 sk_l2_2$0)
      (read$0 data$0
        (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))
    (not
         (in$0 (read$0 data$0 sk_l2_2$0)
           (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= sk_?e_2$0
      (read$0 data$0
        (witness$0 data$0 sk_?e_2$0
          (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))))
    (not (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))))

(assert (forall ((l1 Loc))
        (or
            (in$0 (read$0 data$0 l1)
              (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
            (not
                 (in$1 l1
                   (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))))))

(assert (forall ((l1 Loc))
        (or
            (in$0 (read$0 data$0 l1)
              (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
            (not
                 (in$1 l1 (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0))))))

(assert (forall ((l1 Loc))
        (or
            (in$0 (read$0 data$0 l1)
              (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
            (not
                 (in$1 l1
                   (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0))))))

(assert (or
    (= lst$0
      (witness$0 data$0 (read$0 data$0 lst$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
    (not (in$1 lst$0 (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= curr_3$0
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
    (not
         (in$1 curr_3$0 (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= null$0
      (witness$0 data$0 (read$0 data$0 null$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
    (not (in$1 null$0 (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= prev_3$0
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
    (not
         (in$1 prev_3$0 (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= sk_l1_2$0
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
    (not
         (in$1 sk_l1_2$0
           (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= sk_l2_2$0
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0)))
    (not
         (in$1 sk_l2_2$0
           (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0)))))

(assert (or
    (= lst$0
      (witness$0 data$0 (read$0 data$0 lst$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
    (not (in$1 lst$0 (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= curr_3$0
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
    (not (in$1 curr_3$0 (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= null$0
      (witness$0 data$0 (read$0 data$0 null$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
    (not (in$1 null$0 (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= prev_3$0
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
    (not (in$1 prev_3$0 (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= sk_l1_2$0
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
    (not (in$1 sk_l1_2$0 (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= sk_l2_2$0
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0)))
    (not (in$1 sk_l2_2$0 (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0)))))

(assert (or
    (= lst$0
      (witness$0 data$0 (read$0 data$0 lst$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
    (not (in$1 lst$0 (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= curr_3$0
      (witness$0 data$0 (read$0 data$0 curr_3$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
    (not (in$1 curr_3$0 (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= null$0
      (witness$0 data$0 (read$0 data$0 null$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
    (not (in$1 null$0 (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= prev_3$0
      (witness$0 data$0 (read$0 data$0 prev_3$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
    (not (in$1 prev_3$0 (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= sk_l1_2$0
      (witness$0 data$0 (read$0 data$0 sk_l1_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
    (not
         (in$1 sk_l1_2$0 (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0)))))

(assert (or
    (= sk_l2_2$0
      (witness$0 data$0 (read$0 data$0 sk_l2_2$0)
        (sorted_set_c$0 data$0 next$0 curr_3$0 null$0)))
    (not
         (in$1 sk_l2_2$0 (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0)))))

(assert (forall ((l1 Loc) (l2 Loc))
        (or (not Axiom_23$0)
            (or (= l1 l2) (< (read$0 data$0 l1) (read$0 data$0 l2))
                (not (Btwn$0 next_1$0 l1 l2 null$0))
                (not (in$1 l1 sk_?X_77$0)) (not (in$1 l2 sk_?X_77$0))))))

(assert (forall ((l1 Loc) (l2 Loc))
        (or (not Axiom_21$0)
            (or (= l1 l2) (< (read$0 data$0 l1) (read$0 data$0 l2))
                (not (Btwn$0 next$0 l1 l2 curr_2$0))
                (not (in$1 l1 sk_?X_75$0)) (not (in$1 l2 sk_?X_75$0))))))

(assert (forall ((l1 Loc) (l2 Loc))
        (or (not Axiom_19$0)
            (or (= l1 l2) (< (read$0 data$0 l1) (read$0 data$0 l2))
                (not (Btwn$0 next$0 l1 l2 null$0)) (not (in$1 l1 sk_?X_62$0))
                (not (in$1 l2 sk_?X_62$0))))))

(assert (forall ((x Int))
        (or
            (and (in$0 x (union$1 content$0 c2_2$0))
                 (or (in$0 x content$0) (in$0 x c2_2$0)))
            (and (not (in$0 x content$0)) (not (in$0 x c2_2$0))
                 (not (in$0 x (union$1 content$0 c2_2$0)))))))

(assert (forall ((x Int))
        (or
            (and (in$0 x (union$1 c1_3$0 c2_3$0))
                 (or (in$0 x c1_3$0) (in$0 x c2_3$0)))
            (and (not (in$0 x c1_3$0)) (not (in$0 x c2_3$0))
                 (not (in$0 x (union$1 c1_3$0 c2_3$0)))))))

(assert (forall ((x Int))
        (or
            (and (in$0 x content$0)
                 (in$0 x (setminus$1 content$0 (setenum$1 val$0)))
                 (not (in$0 x (setenum$1 val$0))))
            (and (or (in$0 x (setenum$1 val$0)) (not (in$0 x content$0)))
                 (not (in$0 x (setminus$1 content$0 (setenum$1 val$0))))))))

(assert (forall ((x Int))
        (or (and (= x val_1$0) (in$0 x (setenum$1 val_1$0)))
            (and (not (= x val_1$0)) (not (in$0 x (setenum$1 val_1$0)))))))

(assert (forall ((x Loc))
        (or
            (and
                 (in$1 x
                   (union$0 (intersection$0 Alloc$0 FP_1$0)
                     (setminus$0 Alloc$0 Alloc$0)))
                 (or (in$1 x (intersection$0 Alloc$0 FP_1$0))
                     (in$1 x (setminus$0 Alloc$0 Alloc$0))))
            (and (not (in$1 x (intersection$0 Alloc$0 FP_1$0)))
                 (not (in$1 x (setminus$0 Alloc$0 Alloc$0)))
                 (not
                      (in$1 x
                        (union$0 (intersection$0 Alloc$0 FP_1$0)
                          (setminus$0 Alloc$0 Alloc$0))))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x (union$0 FP_Caller$0 Alloc$0))
                 (or (in$1 x FP_Caller$0) (in$1 x Alloc$0)))
            (and (not (in$1 x FP_Caller$0)) (not (in$1 x Alloc$0))
                 (not (in$1 x (union$0 FP_Caller$0 Alloc$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x (union$0 FP_2$0 Alloc$0))
                 (or (in$1 x FP_2$0) (in$1 x Alloc$0)))
            (and (not (in$1 x FP_2$0)) (not (in$1 x Alloc$0))
                 (not (in$1 x (union$0 FP_2$0 Alloc$0)))))))

(assert (forall ((x Loc))
        (or
            (and
                 (in$1 x
                   (union$0 (setminus$0 FP$0 FP_1$0)
                     (union$0 (intersection$0 Alloc$0 FP_1$0)
                       (setminus$0 Alloc$0 Alloc$0))))
                 (or (in$1 x (setminus$0 FP$0 FP_1$0))
                     (in$1 x
                       (union$0 (intersection$0 Alloc$0 FP_1$0)
                         (setminus$0 Alloc$0 Alloc$0)))))
            (and (not (in$1 x (setminus$0 FP$0 FP_1$0)))
                 (not
                      (in$1 x
                        (union$0 (intersection$0 Alloc$0 FP_1$0)
                          (setminus$0 Alloc$0 Alloc$0))))
                 (not
                      (in$1 x
                        (union$0 (setminus$0 FP$0 FP_1$0)
                          (union$0 (intersection$0 Alloc$0 FP_1$0)
                            (setminus$0 Alloc$0 Alloc$0)))))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x (union$0 sk_?X_76$0 FP_Caller$0))
                 (or (in$1 x sk_?X_76$0) (in$1 x FP_Caller$0)))
            (and (not (in$1 x sk_?X_76$0)) (not (in$1 x FP_Caller$0))
                 (not (in$1 x (union$0 sk_?X_76$0 FP_Caller$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x (union$0 FP_Caller_1$0 FP_3$0))
                 (or (in$1 x FP_Caller_1$0) (in$1 x FP_3$0)))
            (and (not (in$1 x FP_Caller_1$0)) (not (in$1 x FP_3$0))
                 (not (in$1 x (union$0 FP_Caller_1$0 FP_3$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x (union$0 sk_?X_61$0 sk_?X_62$0))
                 (or (in$1 x sk_?X_61$0) (in$1 x sk_?X_62$0)))
            (and (not (in$1 x sk_?X_61$0)) (not (in$1 x sk_?X_62$0))
                 (not (in$1 x (union$0 sk_?X_61$0 sk_?X_62$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x (union$0 sk_?X_74$0 sk_?X_76$0))
                 (or (in$1 x sk_?X_74$0) (in$1 x sk_?X_76$0)))
            (and (not (in$1 x sk_?X_74$0)) (not (in$1 x sk_?X_76$0))
                 (not (in$1 x (union$0 sk_?X_74$0 sk_?X_76$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x (union$0 FP_1$0 sk_?X_76$0))
                 (or (in$1 x FP_1$0) (in$1 x sk_?X_76$0)))
            (and (not (in$1 x FP_1$0)) (not (in$1 x sk_?X_76$0))
                 (not (in$1 x (union$0 FP_1$0 sk_?X_76$0)))))))

(assert (forall ((x Loc))
        (or
            (and
                 (in$1 x
                   (union$0 (intersection$0 Alloc_1$0 FP$0)
                     (setminus$0 Alloc_1$0 Alloc$0)))
                 (or (in$1 x (intersection$0 Alloc_1$0 FP$0))
                     (in$1 x (setminus$0 Alloc_1$0 Alloc$0))))
            (and (not (in$1 x (intersection$0 Alloc_1$0 FP$0)))
                 (not (in$1 x (setminus$0 Alloc_1$0 Alloc$0)))
                 (not
                      (in$1 x
                        (union$0 (intersection$0 Alloc_1$0 FP$0)
                          (setminus$0 Alloc_1$0 Alloc$0))))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x Alloc$0) (in$1 x FP_1$0)
                 (in$1 x (intersection$0 Alloc$0 FP_1$0)))
            (and (or (not (in$1 x Alloc$0)) (not (in$1 x FP_1$0)))
                 (not (in$1 x (intersection$0 Alloc$0 FP_1$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x Alloc_1$0) (in$1 x sk_?X_76$0)
                 (in$1 x (intersection$0 Alloc_1$0 sk_?X_76$0)))
            (and (or (not (in$1 x Alloc_1$0)) (not (in$1 x sk_?X_76$0)))
                 (not (in$1 x (intersection$0 Alloc_1$0 sk_?X_76$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x sk_?X_61$0) (in$1 x sk_?X_62$0)
                 (in$1 x (intersection$0 sk_?X_61$0 sk_?X_62$0)))
            (and (or (not (in$1 x sk_?X_61$0)) (not (in$1 x sk_?X_62$0)))
                 (not (in$1 x (intersection$0 sk_?X_61$0 sk_?X_62$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x sk_?X_74$0) (in$1 x sk_?X_76$0)
                 (in$1 x (intersection$0 sk_?X_74$0 sk_?X_76$0)))
            (and (or (not (in$1 x sk_?X_74$0)) (not (in$1 x sk_?X_76$0)))
                 (not (in$1 x (intersection$0 sk_?X_74$0 sk_?X_76$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x Alloc$0) (in$1 x (setminus$0 Alloc$0 Alloc$0))
                 (not (in$1 x Alloc$0)))
            (and (or (in$1 x Alloc$0) (not (in$1 x Alloc$0)))
                 (not (in$1 x (setminus$0 Alloc$0 Alloc$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x Alloc_1$0) (in$1 x (setminus$0 Alloc_1$0 Alloc$0))
                 (not (in$1 x Alloc$0)))
            (and (or (in$1 x Alloc$0) (not (in$1 x Alloc_1$0)))
                 (not (in$1 x (setminus$0 Alloc_1$0 Alloc$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x sk_?X_76$0) (in$1 x (setminus$0 sk_?X_76$0 FP_1$0))
                 (not (in$1 x FP_1$0)))
            (and (or (in$1 x FP_1$0) (not (in$1 x sk_?X_76$0)))
                 (not (in$1 x (setminus$0 sk_?X_76$0 FP_1$0)))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x Alloc$0)
                 (in$1 x (setminus$0 Alloc$0 (setenum$0 n_2$0)))
                 (not (in$1 x (setenum$0 n_2$0))))
            (and (or (in$1 x (setenum$0 n_2$0)) (not (in$1 x Alloc$0)))
                 (not (in$1 x (setminus$0 Alloc$0 (setenum$0 n_2$0))))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x FP_2$0)
                 (in$1 x (setminus$0 FP_2$0 (setenum$0 n_2$0)))
                 (not (in$1 x (setenum$0 n_2$0))))
            (and (or (in$1 x (setenum$0 n_2$0)) (not (in$1 x FP_2$0)))
                 (not (in$1 x (setminus$0 FP_2$0 (setenum$0 n_2$0))))))))

(assert (forall ((x Loc))
        (or
            (and (in$1 x FP_Caller$0)
                 (in$1 x (setminus$0 FP_Caller$0 sk_?X_76$0))
                 (not (in$1 x sk_?X_76$0)))
            (and (or (in$1 x sk_?X_76$0) (not (in$1 x FP_Caller$0)))
                 (not (in$1 x (setminus$0 FP_Caller$0 sk_?X_76$0)))))))

(assert (forall ((y Loc) (x Loc))
        (or (and (= x y) (in$1 x (setenum$0 y)))
            (and (not (= x y)) (not (in$1 x (setenum$0 y)))))))

(assert (= (read$1 (write$0 next$0 prev_3$0 curr_4$0) prev_3$0) curr_4$0))

(assert (or (= null$0 prev_3$0)
    (= (read$1 next$0 null$0)
      (read$1 (write$0 next$0 prev_3$0 curr_4$0) null$0))))

(assert (or (= prev_3$0 prev_3$0)
    (= (read$1 next$0 prev_3$0)
      (read$1 (write$0 next$0 prev_3$0 curr_4$0) prev_3$0))))

(assert (or (= curr_3$0 prev_3$0)
    (= (read$1 next$0 curr_3$0)
      (read$1 (write$0 next$0 prev_3$0 curr_4$0) curr_3$0))))

(assert (= (read$1 next$0 null$0) null$0))

(assert (= (read$1 next_1$0 null$0) null$0))

(assert (forall ((x Loc)) (not (in$1 x emptyset$1))))

(assert (forall ((x Int)) (not (in$0 x emptyset$0))))

(assert (or (and (Btwn$0 next$0 curr_2$0 null$0 null$0) Axiom_18$0)
    (not
         (sorted_set_struct$0 sk_?X_73$0 data$0 next$0 curr_2$0 null$0
           c1_2$0))))

(assert (or (and (Btwn$0 next$0 lst$0 null$0 null$0) Axiom_20$0)
    (not
         (sorted_set_struct$0 sk_?X_76$0 data$0 next$0 lst$0 null$0
           content$0))))

(assert (or (and (Btwn$0 next$0 lst_1$0 curr_3$0 curr_3$0) Axiom_22$0)
    (not
         (sorted_set_struct$0 sk_?X_60$0 data$0 next$0 lst_1$0 curr_3$0
           c2_3$0))))

(assert (= (read$0 data$0 curr_3$0) val_1$0))

(assert (= FP_2$0
  (union$0 (setminus$0 FP$0 FP_1$0)
    (union$0 (intersection$0 Alloc$0 FP_1$0) (setminus$0 Alloc$0 Alloc$0)))))

(assert (= FP_Caller_1$0 (setminus$0 FP_Caller$0 FP$0)))

(assert (= c1_2$0 content$0))

(assert (= content_1$0 content$0))

(assert (= curr_4$0 (read$1 next$0 curr_3$0)))

(assert (= n_2$0 curr_3$0))

(assert (= prev_2$0 null$0))

(assert (= val_1$0 val$0))

(assert (Frame$1 FP_1$0 Alloc$0 next$0 next$0))

(assert (= Alloc$0 (union$0 FP_Caller$0 Alloc$0)))

(assert (= sk_?X_76$0 FP$0))

(assert (= FP_Caller$0 (union$0 FP$0 FP_Caller$0)))

(assert (= sk_?X_60$0 (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0)))

(assert (= sk_?X_62$0 (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0)))

(assert (= sk_?X_64$0 (union$0 sk_?X_61$0 sk_?X_63$0)))

(assert (= sk_?X_66$0 sk_?X_64$0))

(assert (or
    (and (= (read$1 next$0 prev_3$0) curr_3$0) (= emptyset$1 emptyset$1)
         (= emptyset$1 (intersection$0 sk_?X_61$0 sk_?X_63$0))
         (= c1_3$0 (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
         (= c2_3$0 (sorted_set_c$0 data$0 next$0 lst_1$0 curr_3$0))
         (= content_1$0 (union$1 c1_3$0 c2_3$0))
         (= sk_?X_66$0
           (union$0 (intersection$0 Alloc$0 FP_1$0)
             (setminus$0 Alloc$0 Alloc$0)))
         (> val_1$0 (read$0 data$0 prev_3$0))
         (Btwn$0 next$0 lst_1$0 prev_3$0 curr_3$0)
         (sorted_set_struct$0 sk_?X_60$0 data$0 next$0 lst_1$0 curr_3$0
           c2_3$0)
         (sorted_set_struct$0 sk_?X_62$0 data$0 next$0 curr_3$0 null$0
           c1_3$0)
         (or (= curr_3$0 null$0) (= prev_3$0 null$0)
             (< (read$0 data$0 prev_3$0) (read$0 data$0 curr_3$0)))
         (not (= prev_3$0 curr_3$0)))
    (and (= emptyset$1 emptyset$1)
         (= c1_3$0 (sorted_set_c$0 data$0 next$0 curr_3$0 null$0))
         (= c2_3$0 emptyset$0) (= content_1$0 (union$1 c1_3$0 c2_3$0))
         (= curr_3$0 lst_1$0) (= prev_3$0 null$0)
         (= sk_?X_67$0
           (union$0 (intersection$0 Alloc$0 FP_1$0)
             (setminus$0 Alloc$0 Alloc$0)))
         (sorted_set_struct$0 sk_?X_62$0 data$0 next$0 curr_3$0 null$0
           c1_3$0)
         (or (= curr_3$0 null$0) (= prev_3$0 null$0)
             (< (read$0 data$0 prev_3$0) (read$0 data$0 curr_3$0))))))

(assert (= sk_?X_69$0 sk_?X_71$0))

(assert (= sk_?X_71$0 (union$0 sk_?X_74$0 sk_?X_72$0)))

(assert (= sk_?X_73$0 (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0)))

(assert (= sk_?X_75$0 (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0)))

(assert (or
    (and (= (read$1 next$0 prev_2$0) curr_2$0) (= emptyset$1 emptyset$1)
         (= emptyset$1 (intersection$0 sk_?X_74$0 sk_?X_72$0))
         (= c1_2$0 (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
         (= c2_2$0 (sorted_set_c$0 data$0 next$0 lst$0 curr_2$0))
         (= content$0 (union$1 c1_2$0 c2_2$0)) (= sk_?X_69$0 FP_1$0)
         (> val$0 (read$0 data$0 prev_2$0))
         (Btwn$0 next$0 lst$0 prev_2$0 curr_2$0)
         (sorted_set_struct$0 sk_?X_73$0 data$0 next$0 curr_2$0 null$0
           c1_2$0)
         (sorted_set_struct$0 sk_?X_75$0 data$0 next$0 lst$0 curr_2$0 c2_2$0)
         (or (= curr_2$0 null$0) (= prev_2$0 null$0)
             (< (read$0 data$0 prev_2$0) (read$0 data$0 curr_2$0)))
         (not (= prev_2$0 curr_2$0)))
    (and (= emptyset$1 emptyset$1)
         (= c1_2$0 (sorted_set_c$0 data$0 next$0 curr_2$0 null$0))
         (= c2_2$0 emptyset$0) (= content$0 (union$1 c1_2$0 c2_2$0))
         (= curr_2$0 lst$0) (= prev_2$0 null$0) (= sk_?X_68$0 FP_1$0)
         (sorted_set_struct$0 sk_?X_73$0 data$0 next$0 curr_2$0 null$0
           c1_2$0)
         (or (= curr_2$0 null$0) (= prev_2$0 null$0)
             (< (read$0 data$0 prev_2$0) (read$0 data$0 curr_2$0))))))

(assert (or
    (and (in$0 sk_?e_2$0 (setminus$1 content$0 (setenum$1 val$0)))
         (not
              (in$0 sk_?e_2$0
                (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))))
    (and (in$0 sk_?e_2$0 (sorted_set_c$0 data$0 next_1$0 res_3$0 null$0))
         (not (in$0 sk_?e_2$0 (setminus$1 content$0 (setenum$1 val$0)))))
    (and (in$1 sk_l2_2$0 sk_?X_77$0)
         (not
              (in$1 sk_l2_2$0
                (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))))
    (and
         (in$1 sk_l2_2$0
           (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))
         (not (in$1 sk_l2_2$0 sk_?X_77$0)))
    (not (Btwn$0 next_1$0 res_3$0 null$0 null$0))
    (and (Btwn$0 next_1$0 sk_l1_2$0 sk_l2_2$0 null$0)
         (in$1 sk_l1_2$0 sk_?X_77$0) (in$1 sk_l2_2$0 sk_?X_77$0)
         (not (= sk_l1_2$0 sk_l2_2$0))
         (not (< (read$0 data$0 sk_l1_2$0) (read$0 data$0 sk_l2_2$0))))))

(assert (not (= prev_3$0 null$0)))

(assert (not (in$1 null$0 Alloc$0)))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 curr_3$0 l1 null$0)
                 (in$1 l1
                   (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0))
                 (not (= l1 null$0)))
            (and (or (= l1 null$0) (not (Btwn$0 next$0 curr_3$0 l1 null$0)))
                 (not
                      (in$1 l1
                        (sorted_set_domain$0 data$0 next$0 curr_3$0 null$0)))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 lst$0 l1 curr_2$0)
                 (in$1 l1 (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0))
                 (not (= l1 curr_2$0)))
            (and (or (= l1 curr_2$0) (not (Btwn$0 next$0 lst$0 l1 curr_2$0)))
                 (not
                      (in$1 l1
                        (sorted_set_domain$0 data$0 next$0 lst$0 curr_2$0)))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next_1$0 res_3$0 l1 null$0)
                 (in$1 l1
                   (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0))
                 (not (= l1 null$0)))
            (and (or (= l1 null$0) (not (Btwn$0 next_1$0 res_3$0 l1 null$0)))
                 (not
                      (in$1 l1
                        (sorted_set_domain$0 data$0 next_1$0 res_3$0 null$0)))))))

(assert (or (= curr_3$0 null$0) (not (< (read$0 data$0 curr_3$0) val_1$0))))

(assert (or (and (Btwn$0 next$0 curr_3$0 null$0 null$0) Axiom_19$0)
    (not
         (sorted_set_struct$0 sk_?X_62$0 data$0 next$0 curr_3$0 null$0
           c1_3$0))))

(assert (or (and (Btwn$0 next$0 lst$0 curr_2$0 curr_2$0) Axiom_21$0)
    (not
         (sorted_set_struct$0 sk_?X_75$0 data$0 next$0 lst$0 curr_2$0 c2_2$0))))

(assert (or (and (Btwn$0 next_1$0 res_3$0 null$0 null$0) Axiom_23$0)
    (not
         (sorted_set_struct$0 sk_?X_77$0 data$0 next_1$0 res_3$0 null$0
           (setminus$1 content$0 (setenum$1 val$0))))))

(assert (= Alloc_1$0 (setminus$0 Alloc$0 (setenum$0 n_2$0))))

(assert (= FP_3$0 (setminus$0 FP_2$0 (setenum$0 n_2$0))))

(assert (= FP_Caller_final_3$0 (union$0 FP_Caller_1$0 FP_3$0)))

(assert (= c2_2$0 emptyset$0))

(assert (= curr_2$0 lst$0))

(assert (= lst_1$0 lst$0))

(assert (= next_1$0 (write$0 next$0 prev_3$0 curr_4$0)))

(assert (= res_3$0 lst_1$0))

(assert (Frame$0 FP_1$0 Alloc$0 data$0 data$0))

(assert (= Alloc$0 (union$0 FP_2$0 Alloc$0)))

(assert (= content$0 (sorted_set_c$0 data$0 next$0 lst$0 null$0)))

(assert (= sk_?X_76$0 (sorted_set_domain$0 data$0 next$0 lst$0 null$0)))

(assert (sorted_set_struct$0 sk_?X_76$0 data$0 next$0 lst$0 null$0 content$0))

(assert (= sk_?X_61$0 sk_?X_60$0))

(assert (= sk_?X_63$0 sk_?X_62$0))

(assert (= sk_?X_65$0 sk_?X_63$0))

(assert (= sk_?X_67$0 sk_?X_65$0))

(assert (= sk_?X_68$0 sk_?X_70$0))

(assert (= sk_?X_70$0 sk_?X_72$0))

(assert (= sk_?X_72$0 sk_?X_73$0))

(assert (= sk_?X_74$0 sk_?X_75$0))

(assert (= FP$0 (union$0 FP_1$0 FP$0)))

(assert (= sk_?X_77$0
  (union$0 (intersection$0 Alloc_1$0 FP$0) (setminus$0 Alloc_1$0 Alloc$0))))

(assert (not (= curr_3$0 null$0)))

(assert (not (in$1 null$0 Alloc$0)))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 curr_2$0 l1 null$0)
                 (in$1 l1
                   (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0))
                 (not (= l1 null$0)))
            (and (or (= l1 null$0) (not (Btwn$0 next$0 curr_2$0 l1 null$0)))
                 (not
                      (in$1 l1
                        (sorted_set_domain$0 data$0 next$0 curr_2$0 null$0)))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 lst$0 l1 null$0)
                 (in$1 l1 (sorted_set_domain$0 data$0 next$0 lst$0 null$0))
                 (not (= l1 null$0)))
            (and (or (= l1 null$0) (not (Btwn$0 next$0 lst$0 l1 null$0)))
                 (not
                      (in$1 l1
                        (sorted_set_domain$0 data$0 next$0 lst$0 null$0)))))))

(assert (forall ((l1 Loc))
        (or
            (and (Btwn$0 next$0 lst_1$0 l1 curr_3$0)
                 (in$1 l1
                   (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0))
                 (not (= l1 curr_3$0)))
            (and
                 (or (= l1 curr_3$0)
                     (not (Btwn$0 next$0 lst_1$0 l1 curr_3$0)))
                 (not
                      (in$1 l1
                        (sorted_set_domain$0 data$0 next$0 lst_1$0 curr_3$0)))))))

(assert (forall ((?u Loc) (?v Loc) (?z Loc))
        (and
             (or (Btwn$0 (write$0 next$0 prev_3$0 curr_4$0) ?z ?u ?v)
                 (not
                      (or
                          (and (Btwn$0 next$0 ?z ?u ?v)
                               (or (Btwn$0 next$0 ?z ?v prev_3$0)
                                   (and (Btwn$0 next$0 ?z ?v ?v)
                                        (not
                                             (Btwn$0 next$0 ?z prev_3$0
                                               prev_3$0)))))
                          (and (not (= prev_3$0 ?v))
                               (or (Btwn$0 next$0 ?z prev_3$0 ?v)
                                   (and (Btwn$0 next$0 ?z prev_3$0 prev_3$0)
                                        (not (Btwn$0 next$0 ?z ?v ?v))))
                               (Btwn$0 next$0 ?z ?u prev_3$0)
                               (or (Btwn$0 next$0 curr_4$0 ?v prev_3$0)
                                   (and (Btwn$0 next$0 curr_4$0 ?v ?v)
                                        (not
                                             (Btwn$0 next$0 curr_4$0 prev_3$0
                                               prev_3$0)))))
                          (and (not (= prev_3$0 ?v))
                               (or (Btwn$0 next$0 ?z prev_3$0 ?v)
                                   (and (Btwn$0 next$0 ?z prev_3$0 prev_3$0)
                                        (not (Btwn$0 next$0 ?z ?v ?v))))
                               (Btwn$0 next$0 curr_4$0 ?u ?v)
                               (or (Btwn$0 next$0 curr_4$0 ?v prev_3$0)
                                   (and (Btwn$0 next$0 curr_4$0 ?v ?v)
                                        (not
                                             (Btwn$0 next$0 curr_4$0 prev_3$0
                                               prev_3$0))))))))
             (or
                 (and (Btwn$0 next$0 ?z ?u ?v)
                      (or (Btwn$0 next$0 ?z ?v prev_3$0)
                          (and (Btwn$0 next$0 ?z ?v ?v)
                               (not (Btwn$0 next$0 ?z prev_3$0 prev_3$0)))))
                 (and (not (= prev_3$0 ?v))
                      (or (Btwn$0 next$0 ?z prev_3$0 ?v)
                          (and (Btwn$0 next$0 ?z prev_3$0 prev_3$0)
                               (not (Btwn$0 next$0 ?z ?v ?v))))
                      (Btwn$0 next$0 ?z ?u prev_3$0)
                      (or (Btwn$0 next$0 curr_4$0 ?v prev_3$0)
                          (and (Btwn$0 next$0 curr_4$0 ?v ?v)
                               (not
                                    (Btwn$0 next$0 curr_4$0 prev_3$0
                                      prev_3$0)))))
                 (and (not (= prev_3$0 ?v))
                      (or (Btwn$0 next$0 ?z prev_3$0 ?v)
                          (and (Btwn$0 next$0 ?z prev_3$0 prev_3$0)
                               (not (Btwn$0 next$0 ?z ?v ?v))))
                      (Btwn$0 next$0 curr_4$0 ?u ?v)
                      (or (Btwn$0 next$0 curr_4$0 ?v prev_3$0)
                          (and (Btwn$0 next$0 curr_4$0 ?v ?v)
                               (not
                                    (Btwn$0 next$0 curr_4$0 prev_3$0
                                      prev_3$0)))))
                 (not (Btwn$0 (write$0 next$0 prev_3$0 curr_4$0) ?z ?u ?v))))))

(assert (forall ((?x Loc)) (Btwn$0 next$0 ?x ?x ?x)))

(assert (forall ((?x Loc) (?y Loc)) (or (not (Btwn$0 next$0 ?x ?y ?x)) (= ?x ?y))))

(assert (forall ((?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 next$0 ?x ?y ?y)) (not (Btwn$0 next$0 ?x ?z ?z))
            (Btwn$0 next$0 ?x ?y ?z) (Btwn$0 next$0 ?x ?z ?y))))

(assert (forall ((?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 next$0 ?x ?y ?z))
            (and (Btwn$0 next$0 ?x ?y ?y) (Btwn$0 next$0 ?y ?z ?z)))))

(assert (forall ((?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 next$0 ?x ?y ?y)) (not (Btwn$0 next$0 ?y ?z ?z))
            (Btwn$0 next$0 ?x ?z ?z))))

(assert (forall ((?u Loc) (?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 next$0 ?x ?y ?z)) (not (Btwn$0 next$0 ?y ?u ?z))
            (and (Btwn$0 next$0 ?x ?y ?u) (Btwn$0 next$0 ?x ?u ?z)))))

(assert (forall ((?u Loc) (?x Loc) (?y Loc) (?z Loc))
        (or (not (Btwn$0 next$0 ?x ?y ?z)) (not (Btwn$0 next$0 ?x ?u ?y))
            (and (Btwn$0 next$0 ?x ?u ?z) (Btwn$0 next$0 ?u ?y ?z)))))

(check-sat)
(exit)
