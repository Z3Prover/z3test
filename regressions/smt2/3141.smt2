(set-logic ALL)
(set-option :model_validate true)
;(set-option :model true)
;(set-option :unsat_core false)
;(set-option :smt.theory_aware_branching true)
(declare-const v0 Bool)
(declare-const v1 Bool)
(declare-const v2 Bool)
(declare-const v3 Bool)
(declare-const v4 Bool)
(declare-const v5 Bool)
(declare-const v6 Bool)
(declare-const v7 Bool)
(declare-const v8 Bool)
(declare-const v9 Bool)
(declare-const i2 Int)
(declare-const i3 Int)
(declare-const i4 Int)
(declare-const i5 Int)
(declare-const i8 Int)
(declare-const i11 Int)
(declare-const r0 Real)
(declare-const r2 Real)
(declare-const r4 Real)
(declare-const r5 Real)
(declare-const r10 Real)
(declare-const r12 Real)
(declare-const r13 Real)
(declare-const r15 Real)
(declare-const arr-1996520390728504824_1996520390728504824-0 (Array Bool Bool))
(declare-const v10 Bool)
(declare-const arr--7099485333722415760_-1547625209928716131-0 (Array Int (Array Bool Bool)))
(declare-sort S0 0)
(declare-const v11 Bool)
(push 1)
(declare-sort S1 0)
(pop 1)
(declare-const i12 Int)
(declare-const r17 Real)
(push 1)
(declare-sort S1 0)
(declare-const v12 Bool)
(declare-const bv_25-0 (_ BitVec 25))
(declare-const arr-1996520390728504824_1190381865979966698-0 (Array Bool Real))
;(assert (exists ((q0 (_ BitVec 8))) (not (distinct q0 q0 q0))))
(declare-const r18 Real)
(declare-const i13 Int)
(declare-const arr--2352755033331349534_-8220145375476597474-0 (Array (Array Int (Array Bool Bool)) (_ BitVec 25)))
(pop 1)
(declare-sort S1 0)
(declare-const arr--7099485333722415760_-1547625209928716131-1 (Array Int (Array Bool Bool)))
(declare-const v13 Bool)
(declare-const arr-1925767826277737639_-8220145375495000399-0 (Array S0 (_ BitVec 8)))
(declare-const i14 Int)
(declare-const arr--2352755033331349534_-8220145375495000399-0 (Array (Array Int (Array Bool Bool)) (_ BitVec 8)))
(declare-const v14 Bool)
(declare-const r19 Real)
(declare-const v15 Bool)
(declare-const arr-1996520390728504824_1190381865979966698-0 (Array Bool Real))
(declare-const bv_20-0 (_ BitVec 20))
(declare-const bv_30-0 (_ BitVec 30))
(declare-const v16 Bool)
(declare-const arr--3007404063141946853_-8220145375484175149-0 (Array (Array Bool Real) (_ BitVec 30)))
(declare-const i15 Int)
(declare-const r20 Real)
(declare-const v17 Bool)
(declare-const arr--8220145375490670299_1925767826278820164-0 (Array (_ BitVec 20) S1))
;(assert (exists ((q1 (Array (Array Bool Real) (_ BitVec 30)))) (not (select arr--3007404063141946853_-8220145375484175149-0 arr-1996520390728504824_1190381865979966698-0))))
(declare-const bv_18-0 (_ BitVec 18))
(declare-const v18 Bool)
(declare-const r21 Real)
(declare-const arr--8220145375484175149_1190381865979966698-0 (Array (_ BitVec 30) Real))
(declare-const bv_1-0 (_ BitVec 1))
;(assert (forall ((q2 Int) (q3 (Array Bool Real)) (q4 (Array S0 (_ BitVec 8))) (q5 (_ BitVec 30))) (and (bvult (select arr--3007404063141946853_-8220145375484175149-0 arr-1996520390728504824_1190381865979966698-0) q5) (= 87 961) (= arr-1925767826277737639_-8220145375495000399-0 q4) (select arr-1996520390728504824_1190381865979966698-0 (and (= v1 v1 v3 v8 v7) (< (to_int r12) 87))))))
(declare-const arr--3007404063141946853_-2352755033331349534-0 (Array (Array Bool Real) (Array Int (Array Bool Bool))))
(declare-const r22 Real)
(declare-const arr-1996520390728504824_-1168801741865661284-0 (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool)))))
(push 1)
(declare-const v19 Bool)
(declare-const arr--8220145375495000399_263824771818311416-0 (Array (_ BitVec 8) (Array (Array Int (Array Bool Bool)) (_ BitVec 8))))
(pop 1)
(declare-const S0-0 S0)
(declare-const v20 Bool)
(declare-const r23 Real)
(declare-const v21 Bool)
(declare-const S0-1 S0)
(declare-const v22 Bool)
(declare-const i16 Int)
(declare-const i17 Int)
(declare-const arr--8220145375488505249_-3729653758189880671-0 (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool))))))
(declare-const v23 Bool)
(declare-const arr-263824771818311416_-7058828223844812935-0 (Array (Array (Array Int (Array Bool Bool)) (_ BitVec 8)) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool)))))))
(declare-const arr--8220145375484175149_-8220145375483092624-0 (Array (_ BitVec 30) (_ BitVec 31)))
(declare-sort S2 0)
(declare-const r24 Real)
(declare-const bv_9-0 (_ BitVec 9))
(declare-const arr-2816330192453088019_-8220145375496082924-0 (Array (Array (Array Bool Real) (_ BitVec 30)) (_ BitVec 11)))
(declare-const v24 Bool)
(push 1)
(declare-const i18 Int)
(declare-const bv_26-0 (_ BitVec 26))
(declare-const arr--2352755033331349534_-419069301980379242-0 (Array (Array Int (Array Bool Bool)) (Array (_ BitVec 30) (_ BitVec 31))))
(declare-const arr--8220145375488505249_1934058462646417425-0 (Array (_ BitVec 18) (Array S0 (_ BitVec 8))))
(declare-const v25 Bool)
(declare-const v26 Bool)
(declare-const bv_20-2 (_ BitVec 20))
(push 1)
(declare-const bv_30-2 (_ BitVec 30))
(declare-const v27 Bool)
(pop 1)
(declare-const arr--8220145375484175149_-8220145375495000399-0 (Array (_ BitVec 30) (_ BitVec 8)))
(declare-const i19 Int)
(declare-const arr-1934058462646417425_1190381865979966698-0 (Array (Array S0 (_ BitVec 8)) Real))
(declare-const v28 Bool)
(declare-const i20 Int)
(push 1)
(pop 1)
(declare-const S1-1 S1)
(declare-const bv_19-0 (_ BitVec 19))
(declare-const S0-2 S0)
(declare-const arr-263824771818311416_1925767826278820164-0 (Array (Array (Array Int (Array Bool Bool)) (_ BitVec 8)) S1))
(pop 1)
(push 1)
(declare-const v29 Bool)
(declare-const i21 Int)
(declare-const arr--8220145375507990699_-1168801741865661284-0 (Array (_ BitVec 4) (Array (Array Bool Real) (Array Int (Array Bool Bool)))))
(declare-const v30 Bool)
(declare-const arr--8220145375502578074_263824771818311416-0 (Array (_ BitVec 1) (Array (Array Int (Array Bool Bool)) (_ BitVec 8))))
(declare-const S1-1 S1)
(declare-const i22 Int)
(declare-const bv_14-0 (_ BitVec 14))
(declare-const arr--8220145375502578074_-3952250941708253364-0 (Array (_ BitVec 1) (Array (_ BitVec 4) (Array (Array Bool Real) (Array Int (Array Bool Bool))))))
(declare-const arr--5304926045490663589_-7058828223844812935-0 (Array (Array (_ BitVec 1) (Array (Array Int (Array Bool Bool)) (_ BitVec 8))) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool)))))))
;(assert (forall ((q6 (Array (Array Bool Real) (_ BitVec 30))) (q7 (Array (_ BitVec 1) (Array (_ BitVec 4) (Array (Array Bool Real) (Array Int (Array Bool Bool))))))) (=> (select arr--8220145375502578074_-3952250941708253364-0 ((_ rotate_left 6) bv_1-0)) (select q6 (store arr-1996520390728504824_1190381865979966698-0 (<= 115 90) (- (- r0) r10 94426 r10 940525))))))
(declare-const i23 Int)
(declare-const r25 Real)
(declare-const arr--2661747087131045276_-8743500017710223082-0 (Array (Array (_ BitVec 20) S1) (Array (Array (Array Int (Array Bool Bool)) (_ BitVec 8)) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool))))))))
;(assert (exists ((q8 (Array (Array Bool Real) (Array Int (Array Bool Bool))))) (is_int (- 66846))))
(pop 1)
(declare-const r26 Real)
(declare-const arr--8220145375488505249_-8220145375495000399-0 (Array (_ BitVec 18) (_ BitVec 8)))
(declare-const bv_10-0 (_ BitVec 10))
(declare-sort S3 0)
(declare-const i24 Int)
(declare-const arr--7099485333722415760_1925767826280985214-0 (Array Int S3))
(declare-const v31 Bool)
(declare-const bv_13-0 (_ BitVec 13))
(declare-const arr--8220145375488505249_-7058828223844812935-0 (Array (_ BitVec 18) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool)))))))
(declare-const v32 Bool)
(declare-sort S4 0)
(declare-const v33 Bool)
(declare-const arr--3408477231055031543_1934058462646417425-0 (Array (Array (_ BitVec 18) (_ BitVec 8)) (Array S0 (_ BitVec 8))))
(declare-const v34 Bool)
(declare-const arr--7099485333722415760_-8220145375443039199-0 (Array Int (_ BitVec 120)))
(push 1)
(declare-const S1-1 S1)
(declare-const r27 Real)
(pop 1)
(declare-const v35 Bool)
(declare-const arr--2352755033331349534_-8220145375443039199-0 (Array (Array Int (Array Bool Bool)) (_ BitVec 120)))
(declare-const i25 Int)
(declare-const bv_12-1 (_ BitVec 12))
(declare-const arr--8220145375646553899_-8220145375499330499-0 (Array (_ BitVec 132) (_ BitVec 12)))
(push 1)
(declare-const r28 Real)
(declare-const r29 Real)
(declare-const arr-1925767826277737639_1190381865979966698-0 (Array S0 Real))
(declare-const v36 Bool)
(pop 1)
(declare-const i26 Int)
(declare-const v37 Bool)
(declare-const v38 Bool)
(declare-const arr--5668413476439548031_-6957921984554037133-0 (Array (Array (_ BitVec 18) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool)))))) (Array (_ BitVec 132) (_ BitVec 12))))
;(assert (exists ((q9 (Array (_ BitVec 30) Real)) (q10 (_ BitVec 9))) v20))
(declare-const v39 Bool)
(declare-const v40 Bool)
(declare-const i27 Int)
(declare-const arr--3007404063141946853_263824771818311416-0 (Array (Array Bool Real) (Array (Array Int (Array Bool Bool)) (_ BitVec 8))))
(push 1)
(declare-const v41 Bool)
(declare-const v42 Bool)
(push 1)
(declare-const v43 Bool)
(declare-const arr-1925767826280985214_-6957921984554037133-0 (Array S3 (Array (_ BitVec 132) (_ BitVec 12))))
;(assert (exists ((q11 (Array (_ BitVec 18) (_ BitVec 8)))) (not (= q11 arr--8220145375488505249_-8220145375495000399-0))))
(declare-const v44 Bool)
(pop 1)
(pop 1)
(declare-const v45 Bool)
(declare-const arr--1168801741865661284_-1168801741865661284-0 (Array (Array (Array Bool Real) (Array Int (Array Bool Bool))) (Array (Array Bool Real) (Array Int (Array Bool Bool)))))
(declare-const arr--8220145375497165449_-8220145375646553899-0 (Array (_ BitVec 10) (_ BitVec 132)))
;(assert (forall ((q12 S0) (q13 (Array (Array (Array Int (Array Bool Bool)) (_ BitVec 8)) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool))))))) (q14 (Array Int (_ BitVec 120)))) (=> (= q12 q12 S0-1 q12 q12) (select arr-263824771818311416_-7058828223844812935-0 (store arr--2352755033331349534_-8220145375495000399-0 (store arr--7099485333722415760_-1547625209928716131-0 410 (store (store arr-1996520390728504824_1996520390728504824-0 (= (>= 66846 r4 r2 r2) (= arr-1996520390728504824_1996520390728504824-0 arr-1996520390728504824_1996520390728504824-0) (select arr-1996520390728504824_1996520390728504824-0 v1) v4 (distinct (_ bv192 8) #x57 #x57 (_ bv192 8) (_ bv192 8)) (and v4 (and v5 v3 v5 (= v1 v1 v3 v8 v7) v7 v1 (< i8 i8) v7) (<= 115 90) (distinct (_ bv192 8) #x57 #x57 (_ bv192 8) (_ bv192 8)) v1 (= v1 v1 v3 v8 v7) v3 (= arr-1996520390728504824_1996520390728504824-0 arr-1996520390728504824_1996520390728504824-0)) v10 (= (bvsrem (_ bv192 8) #x57) #x57 #x57 (bvsrem (_ bv192 8) #x57)) v3) v7) v2 (<= 115 90))) (bvnot (bvsrem (_ bv192 8) #x57)))))))
(declare-const v46 Bool)
(declare-const i28 Int)
(declare-const arr--3408477231055031543_5454484268347472218-0 (Array (Array (_ BitVec 18) (_ BitVec 8)) (Array (Array (Array Bool Real) (_ BitVec 30)) (_ BitVec 11))))
(declare-const v47 Bool)
(declare-const arr--3408477231055031543_-8220145375498247974-0 (Array (Array (_ BitVec 18) (_ BitVec 8)) (_ BitVec 13)))
(declare-const v48 Bool)
(declare-const v49 Bool)
(declare-const arr--419069301980379242_-3889815075637174682-0 (Array (Array (_ BitVec 30) (_ BitVec 31)) (Array (Array (_ BitVec 18) (_ BitVec 8)) (_ BitVec 13))))
(declare-const S2-0 S2)
(declare-const r30 Real)
(declare-const r31 Real)
(push 1)
(declare-const v50 Bool)
(declare-const i29 Int)
(declare-const r32 Real)
(pop 1)
(declare-const v51 Bool)
(declare-const r33 Real)
(declare-const v52 Bool)
(declare-const r34 Real)
(declare-const arr--8220145375499330499_-8220145375443039199-0 (Array (_ BitVec 12) (_ BitVec 120)))
(push 1)
(declare-const v53 Bool)
(declare-const v54 Bool)
(push 1)
(declare-const v55 Bool)
(pop 1)
(declare-const v56 Bool)
(declare-const r35 Real)
(pop 1)
(declare-const v57 Bool)
(declare-const v58 Bool)
(declare-const i30 Int)
(declare-const v59 Bool)
(declare-const arr--3889815075637174682_-8220145375502578074-0 (Array (Array (Array (_ BitVec 18) (_ BitVec 8)) (_ BitVec 13)) (_ BitVec 1)))
;(assert (forall ((q15 (_ BitVec 31)) (q16 (Array (_ BitVec 30) Real))) (>= 961 (- 38 109 (- i11)))))
(declare-const v60 Bool)
(push 1)
(declare-const i31 Int)
(push 1)
(declare-const S2-1 S2)
(declare-const i32 Int)
(declare-const bv_2-0 (_ BitVec 2))
(declare-const arr-1925767826278820164_-8220145375640058749-0 (Array S1 (_ BitVec 142)))
(declare-const v61 Bool)
(declare-const r36 Real)
(pop 1)
(declare-const arr-1925767826273407539_5716083258966237849-0 (Array S4 (Array (Array (_ BitVec 30) (_ BitVec 31)) (Array (Array (_ BitVec 18) (_ BitVec 8)) (_ BitVec 13)))))
(declare-const v62 Bool)
(declare-const i33 Int)
(declare-const arr-2565859076727198044_1925767826278820164-0 (Array (Array (_ BitVec 30) Real) S1))
(declare-const r37 Real)
(pop 1)
(declare-const v63 Bool)
(declare-const v64 Bool)
(declare-const v65 Bool)
(declare-const i34 Int)
(push 1)
(pop 1)
(declare-const arr-7209768540354080093_-8220145375498247974-0 (Array (Array (_ BitVec 10) (_ BitVec 132)) (_ BitVec 13)))
(declare-const arr-1934058462646417425_5716083258966237849-0 (Array (Array S0 (_ BitVec 8)) (Array (Array (_ BitVec 30) (_ BitVec 31)) (Array (Array (_ BitVec 18) (_ BitVec 8)) (_ BitVec 13)))))
(declare-const i35 Int)
(declare-const arr--8220145375483092624_1925767826278820164-0 (Array (_ BitVec 31) S1))
(declare-const r38 Real)
(declare-const arr--8220145375510155749_1925767826278820164-0 (Array (_ BitVec 6) S1))
(declare-const r39 Real)
(declare-const arr--5668413476439548031_-8220145375499330499-0 (Array (Array (_ BitVec 18) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool)))))) (_ BitVec 12)))
(declare-const v66 Bool)
(declare-const arr--2352755033331349534_1190381865979966698-0 (Array (Array Int (Array Bool Bool)) Real))
(declare-const v67 Bool)
(declare-const r40 Real)
(declare-const arr--8220145375643306324_-7795628073975852314-0 (Array (_ BitVec 131) (Array (Array (_ BitVec 18) (_ BitVec 8)) (Array (Array (Array Bool Real) (_ BitVec 30)) (_ BitVec 11)))))
(declare-const r41 Real)
(push 1)
(declare-const v68 Bool)
(declare-const bv_27-0 (_ BitVec 27))
(declare-const v69 Bool)
(declare-const v70 Bool)
(pop 1)
(declare-const arr--8220145375497165449_-7058828223844812935-0 (Array (_ BitVec 10) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool)))))))
(declare-const arr--7099485333722415760_-8220145375497165449-0 (Array Int (_ BitVec 10)))
(declare-const i36 Int)
(declare-const r42 Real)
(declare-const v71 Bool)
(declare-const r43 Real)
(declare-const arr--3408477231055031543_-1547625209928716131-0 (Array (Array (_ BitVec 18) (_ BitVec 8)) (Array Bool Bool)))
(declare-const arr--3358920912354880609_263730028486446344-0 (Array (Array (Array (_ BitVec 18) (_ BitVec 8)) (Array Bool Bool)) (Array (Array Int (Array Bool Bool)) (_ BitVec 120))))
(declare-const r44 Real)
(declare-const arr--6957921984554037133_-8220145375498247974-0 (Array (Array (_ BitVec 132) (_ BitVec 12)) (_ BitVec 13)))
(declare-const arr--7795628073975852314_-8220145375496082924-0 (Array (Array (Array (_ BitVec 18) (_ BitVec 8)) (Array (Array (Array Bool Real) (_ BitVec 30)) (_ BitVec 11))) (_ BitVec 11)))
(declare-const v72 Bool)
(declare-const arr--8494878984347914617_4654344839287094695-0 (Array (Array (Array (_ BitVec 18) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool)))))) (_ BitVec 12)) (Array (Array (Array (_ BitVec 18) (_ BitVec 8)) (Array (Array (Array Bool Real) (_ BitVec 30)) (_ BitVec 11))) (_ BitVec 11))))
(push 1)
(declare-const v73 Bool)
;(assert (exists ((q17 (_ BitVec 120))) (not (distinct (select arr--2352755033331349534_-8220145375443039199-0 (select arr--3007404063141946853_-2352755033331349534-0 arr-1996520390728504824_1190381865979966698-0)) ((_ repeat 6) bv_20-0) (select arr--2352755033331349534_-8220145375443039199-0 (select arr--3007404063141946853_-2352755033331349534-0 arr-1996520390728504824_1190381865979966698-0))))))
(declare-const r45 Real)
(declare-const r46 Real)
(push 1)
(declare-const v74 Bool)
(declare-const arr--8494878984347914617_-8220145375488505249-0 (Array (Array (Array (_ BitVec 18) (Array (_ BitVec 18) (Array Bool (Array (Array Bool Real) (Array Int (Array Bool Bool)))))) (_ BitVec 12)) (_ BitVec 18)))
(pop 1)
(declare-const v75 Bool)
(declare-const r47 Real)
(declare-const r48 Real)
;(assert (or (= 90 898) (= i27 87) (< 109 (- i11))))
;(assert (or (> i11 (* (to_int r20) (abs 528) 270)) (< 109 (- i11)) (>= (- i11) (to_int r19))))
;(assert (or (< 109 (- i11)) (= i27 87) (> 90 i17)))
;(assert (or (> i4 90) (> 90 i17) (= 90 898)))
;(assert (or (= 90 898) (> i4 90) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3)))))
;(assert (or (< 109 (- i11)) (>= (- i11) (to_int r19)) (= 90 898)))
;(assert (or (= i27 87) (>= (- i11) (to_int r19)) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3)))))
;(assert (or (> i11 (* (to_int r20) (abs 528) 270)) (is_int 940525) (> i4 90)))
;(assert (or (not v0) (> i4 90) (is_int 940525)))
;(assert (or (> i4 90) (= i27 87) (> i11 (* (to_int r20) (abs 528) 270))))
;(assert (or (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (> i12 (div i26 79)) (>= (- i11) (to_int r19))))
;(assert (or (> i12 (div i26 79)) (= 90 898) (< 109 (- i11))))
;(assert (or (= 90 898) (= i27 87) (= 90 898)))
;(assert (or (< 109 (- i11)) (> i4 90) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3)))))
;(assert (or (< 109 (- i11)) (> 90 i17) (< 109 (- i11))))
;(assert (or (> i11 (* (to_int r20) (abs 528) 270)) (= i27 87) (is_int 940525)))
;(assert (or (= i27 87) (>= (- i11) (to_int r19)) (> 90 i17)))
;(assert (or (= 90 898) (= 90 898) (>= (- i11) (to_int r19))))
;(assert (or (> i11 (* (to_int r20) (abs 528) 270)) (is_int 940525) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3)))))
;(assert (or (= arr--3007404063141946853_-2352755033331349534-0 (store arr--3007404063141946853_-2352755033331349534-0 arr-1996520390728504824_1190381865979966698-0 arr--7099485333722415760_-1547625209928716131-0) arr--3007404063141946853_-2352755033331349534-0) (< 109 (- i11)) (= 90 898)))
(assert (or (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (not v0) (is_int 940525)))
;(assert (or (is_int 940525) (= 90 898) (= i27 87)))
;(assert (or (> 90 i17) (is_int 940525) (>= (- i11) (to_int r19))))
;(assert (or (not v0) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (not v0)))
;(assert (or (< 109 (- i11)) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3)))))
;(assert (or (= i27 87) (< 109 (- i11)) (= i27 87)))
;(assert (or (>= (- i11) (to_int r19)) (< 109 (- i11)) (> i4 90)))
;(assert (or (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (> i11 (* (to_int r20) (abs 528) 270)) (>= (- i11) (to_int r19))))
;(assert (or (> i4 90) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (= i27 87)))
;(assert (or (> i11 (* (to_int r20) (abs 528) 270)) (is_int 940525) (> i12 (div i26 79))))
;(assert (or (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (> i11 (* (to_int r20) (abs 528) 270)) (= 90 898)))
;(assert (or (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (>= (- i11) (to_int r19)) (is_int 940525)))
;(assert (or (> i11 (* (to_int r20) (abs 528) 270)) (= i27 87) (= arr--3007404063141946853_-2352755033331349534-0 (store arr--3007404063141946853_-2352755033331349534-0 arr-1996520390728504824_1190381865979966698-0 arr--7099485333722415760_-1547625209928716131-0) arr--3007404063141946853_-2352755033331349534-0)))
;(assert (or (> i12 (div i26 79)) (> i4 90) (not v0)))
;(assert (or (= i27 87) (< 109 (- i11)) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3)))))
;(assert (or (is_int 940525) (= 90 898) (> i12 (div i26 79))))
;(assert (or (not v0) (= i27 87) (is_int 940525)))
;(assert (or (>= (- i11) (to_int r19)) (> i12 (div i26 79)) (> 90 i17)))
;(assert (or (>= (- i11) (to_int r19)) (= 90 898) (> i11 (* (to_int r20) (abs 528) 270))))
;(assert (or (< 109 (- i11)) (= i27 87) (= arr--3007404063141946853_-2352755033331349534-0 (store arr--3007404063141946853_-2352755033331349534-0 arr-1996520390728504824_1190381865979966698-0 arr--7099485333722415760_-1547625209928716131-0) arr--3007404063141946853_-2352755033331349534-0)))
;(assert (or (not v0) (> i11 (* (to_int r20) (abs 528) 270)) (>= (- i11) (to_int r19))))
;(assert (or (not v0) (> i12 (div i26 79)) (> i4 90)))
;(assert (or (>= (- i11) (to_int r19)) (< 109 (- i11)) (> i11 (* (to_int r20) (abs 528) 270))))
;(assert (or (= 90 898) (< 109 (- i11)) (is_int 940525)))
;(assert (or (not v0) (> 90 i17) (< 109 (- i11))))
;(assert (or (> i4 90) (< 109 (- i11)) (= i27 87)))
;(assert (or (>= (- i11) (to_int r19)) (not v0) (is_int 940525)))
;(assert (or (< 109 (- i11)) (not v0) (= i27 87)))
;(assert (or (= 90 898) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (< 109 (- i11))))
;(assert (or (= 90 898) (> i4 90) (> i11 (* (to_int r20) (abs 528) 270))))
(assert (or (= 90 898) (= arr--3007404063141946853_-2352755033331349534-0 (store arr--3007404063141946853_-2352755033331349534-0 arr-1996520390728504824_1190381865979966698-0 arr--7099485333722415760_-1547625209928716131-0) arr--3007404063141946853_-2352755033331349534-0) (< 109 (- i11))))
(assert (or (= i27 87) (not v0) (> i12 (div i26 79))))
(assert (or (> i4 90) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (> 90 i17)))
(assert (or (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3))) (>= (- i11) (to_int r19)) (= arr--3007404063141946853_-2352755033331349534-0 (store arr--3007404063141946853_-2352755033331349534-0 arr-1996520390728504824_1190381865979966698-0 arr--7099485333722415760_-1547625209928716131-0) arr--3007404063141946853_-2352755033331349534-0)))
;(assert (or (> i11 (* (to_int r20) (abs 528) 270)) (= 90 898) (>= (- i11) (to_int r19))))
;(assert (or (= i27 87) (not v0) (> i12 (div i26 79))))
(assert (or (> i12 (div i26 79)) (>= (- i11) (to_int r19)) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3)))))
(assert (or (= 90 898) (>= (- i11) (to_int r19)) (>= (- i11) (to_int r19))))
(assert (or (>= (- i11) (to_int r19)) (= 90 898) (is_int 940525)))
;(assert (or (= i27 87) (not v0) (> (- 66846) (+ (- (- r0)) (to_real (abs i3)) 3) r22 r2 (to_real (abs i3)))))
(check-sat)
(exit)
