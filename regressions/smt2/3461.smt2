(set-option :proof true)
(set-option :solver.enforce_model_conversion true)
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
(declare-const v10 Bool)
(declare-const v11 Bool)
(declare-const v12 Bool)
(declare-const v13 Bool)
(declare-const v14 Bool)
(declare-const v15 Bool)
(declare-const v16 Bool)
(declare-const v17 Bool)
(declare-const r2 Real)
(declare-const r5 Real)
(declare-const r6 Real)
(declare-const r7 Real)
(declare-const r11 Real)
(declare-const r13 Real)
(declare-const r15 Real)
(assert (= v17 v3 v17))
(declare-const v18 Bool)
(declare-const v19 Bool)
(assert v2)
(declare-const v20 Bool)
(assert (=> v16 v20))
(check-sat)
(assert (exists ((q0 Bool) (q1 Real)) (not (< q1 r11))))
(assert v1)
(assert (xor v17 v2 v6 (= r13 3.0)))
(declare-const v21 Bool)
(assert (not (exists ((q2 Real) (q3 Real)) (xor v17 v2 v6 (= r13 3.0)))))
(assert (or (forall ((q2 Real) (q3 Real)) (< 40901.05 896238.0 r6 r7 40901.05)) (exists ((q2 Real) (q3 Real)) (< 40901.05 896238.0 r6 r7 40901.05))))
(assert (not (exists ((q4 Real) (q5 Real)) (not (>= q4 q4 q5 0.53 r7)))))
(assert (and v9 v15 (= v17 v3 v17) v15 v16 v1 v13 v2 v3 (= v17 v3 v17)))
(declare-const v22 Bool)
(assert (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5))
(assert (xor v17 v2 v7 (xor v17 v2 v6 (= r13 3.0)) v4 (= v17 v3 v17) v19))
(assert (not (forall ((q6 Real) (q7 Real) (q8 Bool) (q9 Bool)) (or v5 (< 40901.05 896238.0 r6 r7 40901.05) v20 v0 (= v17 v3 v17) (xor v17 v2 v6 (= r13 3.0)) v8 v1 (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8) v17 (distinct (= r13 3.0) v8 v4 v2 v20)))))
(assert (and v19 v9 v12 v12 (< (- 9229543.0) r2 9229543.0 3.0 r15) v1 v3 v21))
(declare-const v23 Bool)
(assert (xor v22 v3 v18 (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8) (=> v16 v20) (distinct (= r13 3.0) v8 v4 v2 v20) v23))
(assert v13)
(assert (not v8))
(assert (not (exists ((q10 Bool) (q11 Real) (q12 Bool) (q13 Bool)) (=> (= (=> v16 v20) q10 q10 q13) (<= (- 9229543.0) q11 q11 q11)))))
(declare-const r16 Real)
(assert (not (exists ((q14 Real) (q15 Bool)) (=> (or v22 v16 q15 q15 v7 q15 v11 q15 q15) (<= q14 q14 (- r7))))))
(assert (or v7 (xor v22 v3 v18 (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8) (=> v16 v20) (distinct (= r13 3.0) v8 v4 v2 v20) v23) v20 v1 v2))
(assert (not (exists ((q16 Bool) (q17 Bool) (q18 Bool) (q19 Real)) (=> (=> v5 (not v9)) (< q19 (* 896238.0 8300058162.0 3.0 (- 2.90)) r7 r6 q19)))))
(declare-const v24 Bool)
(assert (and (>= 896238.0 (- r11) (/ r13 2969087.0)) v15 (< (- 9229543.0) r2 9229543.0 3.0 r15) (not v9)))
(assert (or v24 v11 v14 v16 v21 (>= 896238.0 (- r11) (/ r13 2969087.0)) v8 (and (>= 896238.0 (- r11) (/ r13 2969087.0)) v15 (< (- 9229543.0) r2 9229543.0 3.0 r15) (not v9)) v13 v19 (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5)))
(declare-const r17 Real)
(assert (not (forall ((q20 Bool) (q21 Bool) (q22 Bool)) (not (= (xor v3 v0 v6 (= v17 v3 v17) v1 v0 v14 v4) q20 q22)))))
(assert (distinct (xor v17 v2 v6 (= r13 3.0)) v1 (< (- 9229543.0) r2 9229543.0 3.0 r15) (or v24 v11 v14 v16 v21 (>= 896238.0 (- r11) (/ r13 2969087.0)) v8 (and (>= 896238.0 (- r11) (/ r13 2969087.0)) v15 (< (- 9229543.0) r2 9229543.0 3.0 r15) (not v9)) v13 v19 (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5)) (>= 896238.0 (- r11) (/ r13 2969087.0))))
(push 1)
(declare-const v25 Bool)
(declare-const v26 Bool)
(assert (not (exists ((q23 Bool) (q24 Bool) (q25 Bool)) (not (xor (>= 896238.0 (- r11) (/ r13 2969087.0)) v3 q23 v14 q23 q24 q24 (not v9) (< 40901.05 896238.0 r6 r7 40901.05))))))
(declare-const r18 Real)
(declare-const v27 Bool)
(assert v10)
(declare-const v28 Bool)
(assert (distinct v13 v1 (or v5 (< 40901.05 896238.0 r6 r7 40901.05) v20 v0 (= v17 v3 v17) (xor v17 v2 v6 (= r13 3.0)) v8 v1 (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8) v17 (distinct (= r13 3.0) v8 v4 v2 v20)) v24))
(assert (not (forall ((q26 Real)) (not (<= r5 3550.2237 (- 9229543.0))))))
(assert v16)
(declare-const v29 Bool)
(assert (not (exists ((q27 Real) (q28 Real)) v6)))
(check-sat)
(pop 1)
(push 1)
(assert (forall ((q29 Bool) (q30 Real) (q31 Bool) (q32 Real)) v14))
(assert (or (exists ((q29 Bool) (q30 Real) (q31 Bool) (q32 Real)) (=> (<= q30 q30) (distinct q29 (not v9) q29 q29 v19))) (exists ((q29 Bool) (q30 Real) (q31 Bool) (q32 Real)) (=> (xor q29 q29 v12 q29 q31 q31 q29 (<= r5 3550.2237 (- 9229543.0)) q31 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0))) (< 0.1 r6 q30)))))
(assert (or (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5) v13))
(declare-const v30 Bool)
(pop 1)
(push 1)
(assert (not (forall ((q33 Bool)) (not (=> q33 q33)))))
(declare-const v31 Bool)
(declare-const r19 Real)
(assert (exists ((q34 Bool)) (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8)))
(pop 1)
(assert v4)
(assert (not (exists ((q35 Bool) (q36 Bool) (q37 Bool) (q38 Bool)) (not (= q36 v22 q36 v7 (>= 896238.0 (- r11) (/ r13 2969087.0)) q37)))))
(assert (=> v24 v1))
(declare-const r20 Real)
(assert (xor v3 v0 v6 (= v17 v3 v17) v1 v0 v14 v4))
(declare-const v32 Bool)
(push 1)
(declare-const v33 Bool)
(assert (not (forall ((q39 Bool)) (not (=> q39 q39)))))
(assert (or (forall ((q39 Bool)) (not (=> q39 q39))) (exists ((q39 Bool)) (not (and q39 v32 (or v5 (< 40901.05 896238.0 r6 r7 40901.05) v20 v0 (= v17 v3 v17) (xor v17 v2 v6 (= r13 3.0)) v8 v1 (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8) v17 (distinct (= r13 3.0) v8 v4 v2 v20)) q39 q39 q39 q39 (< 40901.05 896238.0 r6 r7 40901.05) v11 q39 (not v9))))))
(assert (xor (<= r5 3550.2237 (- 9229543.0)) v2 (=> v24 v1) (xor v17 v2 v7 (xor v17 v2 v6 (= r13 3.0)) v4 (= v17 v3 v17) v19) (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5) (and v1 (=> (xor v17 v2 v7 (xor v17 v2 v6 (= r13 3.0)) v4 (= v17 v3 v17) v19) (not v9)) (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5) (xor v17 v2 v7 (xor v17 v2 v6 (= r13 3.0)) v4 (= v17 v3 v17) v19) v14 (not v9) v22 (< (- r11) 53559053.0) (and (>= 896238.0 (- r11) (/ r13 2969087.0)) v15 (< (- 9229543.0) r2 9229543.0 3.0 r15) (not v9)) v12) v10))
(assert (forall ((q40 Bool) (q41 Real) (q42 Bool)) (not (or v17 q42 v19 q40 q42 q40 (=> v24 v1) v0 v33))))
(assert (forall ((q43 Bool)) (not (or (distinct (distinct (xor v17 v2 v6 (= r13 3.0)) v1 (< (- 9229543.0) r2 9229543.0 3.0 r15) (or v24 v11 v14 v16 v21 (>= 896238.0 (- r11) (/ r13 2969087.0)) v8 (and (>= 896238.0 (- r11) (/ r13 2969087.0)) v15 (< (- 9229543.0) r2 9229543.0 3.0 r15) (not v9)) v13 v19 (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5)) (>= 896238.0 (- r11) (/ r13 2969087.0))) (xor v22 v3 v18 (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8) (=> v16 v20) (distinct (= r13 3.0) v8 v4 v2 v20) v23) (or v7 (xor v22 v3 v18 (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8) (=> v16 v20) (distinct (= r13 3.0) v8 v4 v2 v20) v23) v20 v1 v2) v1 (and v9 v15 (= v17 v3 v17) v15 v16 v1 v13 v2 v3 (= v17 v3 v17))) v9 (not v8) q43 (=> (xor v17 v2 v7 (xor v17 v2 v6 (= r13 3.0)) v4 (= v17 v3 v17) v19) (not v9)) q43 q43 (and v9 v15 (= v17 v3 v17) v15 v16 v1 v13 v2 v3 (= v17 v3 v17)) (and v1 (=> (xor v17 v2 v7 (xor v17 v2 v6 (= r13 3.0)) v4 (= v17 v3 v17) v19) (not v9)) (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5) (xor v17 v2 v7 (xor v17 v2 v6 (= r13 3.0)) v4 (= v17 v3 v17) v19) v14 (not v9) v22 (< (- r11) 53559053.0) (and (>= 896238.0 (- r11) (/ r13 2969087.0)) v15 (< (- 9229543.0) r2 9229543.0 3.0 r15) (not v9)) v12) (not (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)))))))
(pop 1)
(declare-const v34 Bool)
(declare-const v35 Bool)
(assert (or (or v7 (xor v22 v3 v18 (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8) (=> v16 v20) (distinct (= r13 3.0) v8 v4 v2 v20) v23) v20 v1 v2) v21 (and (>= 896238.0 (- r11) (/ r13 2969087.0)) v15 (< (- 9229543.0) r2 9229543.0 3.0 r15) (not v9)) (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5) (< (- 9229543.0) r2 9229543.0 3.0 r15)))
(declare-const v36 Bool)
(assert (=> v32 (< 40901.05 896238.0 r6 r7 40901.05)))
(declare-const r21 Real)
(declare-const v37 Bool)
(assert (exists ((q44 Real) (q45 Bool)) v14))
(assert (or (forall ((q44 Real) (q45 Bool)) v4) (exists ((q44 Real) (q45 Bool)) (not (= v18 v20 (xor v4 (< 40901.05 896238.0 r6 r7 40901.05) v0 (< 40901.05 896238.0 r6 r7 40901.05) v1 v1 v7 (<= r5 3550.2237 (- 9229543.0)) v8) q45 v13 q45 v37 q45)))))
(assert (= (distinct (= r13 3.0) v8 v4 v2 v20) (not (and v9 v15 (= v17 v3 v17) v15 v16 v1 v13 v2 v3 (= v17 v3 v17))) v12 (=> v16 v20) v32))
(declare-const r22 Real)
(assert (not (exists ((q46 Real) (q47 Real) (q48 Bool)) (not (>= q47 q46 q47 q47)))))
(assert (or v21 (xor (>= (- r11) (/ (- r11) 7994.0)) (>= (- r11) (/ (- r11) 7994.0)) (and v9 v15 (= v17 v3 v17) v15 v16 v1 v13 v2 v3 (= v17 v3 v17)) v1 (not v8)) (=> v24 v1) (distinct (- r11) 3.0 (/ r13 2969087.0) 2.90) (and v19 v9 v12 v12 (< (- 9229543.0) r2 9229543.0 3.0 r15) v1 v3 v21) (or v24 v11 v14 v16 v21 (>= 896238.0 (- r11) (/ r13 2969087.0)) v8 (and (>= 896238.0 (- r11) (/ r13 2969087.0)) v15 (< (- 9229543.0) r2 9229543.0 3.0 r15) (not v9)) v13 v19 (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5))))
(declare-const v38 Bool)
(declare-const v39 Bool)
(assert v34)
(assert (not (exists ((q49 Real) (q50 Bool) (q51 Bool) (q52 Bool)) (not (> r22 (/ 2969087.0 40901.05) 7994.0 q49 (- 9229543.0))))))
(declare-const r23 Real)
(assert (not (forall ((q53 Bool) (q54 Real)) (=> (distinct (=> (xor v17 v2 v7 (xor v17 v2 v6 (= r13 3.0)) v4 (= v17 v3 v17) v19) (not v9)) q53 v17 q53 q53 (not v9) q53 (and v19 v9 v12 v12 (< (- 9229543.0) r2 9229543.0 3.0 r15) v1 v3 v21) q53 q53 (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5)) (= q54 r21 r23)))))
(assert (exists ((q55 Bool)) (not (distinct (< (- r11) 53559053.0) q55 q55 (not v38) v22 v6 q55 q55 (not v38) (xor v17 v2 v6 (= r13 3.0))))))
(assert (not (distinct (xor v17 v2 v6 (= r13 3.0)) v1 (< (- 9229543.0) r2 9229543.0 3.0 r15) (or v24 v11 v14 v16 v21 (>= 896238.0 (- r11) (/ r13 2969087.0)) v8 (and (>= 896238.0 (- r11) (/ r13 2969087.0)) v15 (< (- 9229543.0) r2 9229543.0 3.0 r15) (not v9)) v13 v19 (and v16 v14 v8 v19 v8 v15 v15 v6 v21 (<= 3550.2237 (/ r2 (/ r13 2969087.0)) (/ r13 2969087.0)) v5)) (>= 896238.0 (- r11) (/ r13 2969087.0)))))
(declare-const v40 Bool)
(assert (=> v11 v9))
(assert (forall ((q56 Bool) (q57 Real)) (not (distinct (- 9881.0) r6 (/ (* 896238.0 8300058162.0 3.0 (- 2.90)) (- r11)) r21 q57))))
(assert v2)
(check-sat-using (then purify-arith qe_rec))
