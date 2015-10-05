
; Copyright (c) 2015 Microsoft Corporation
(set-logic QF_LIA)
(set-option :auto-config true)
(declare-fun |c@1| () Bool)
(declare-fun |a@1| () Bool)
(declare-fun |c@0| () Bool)
(declare-fun |a@0| () Bool)
(declare-fun |xxx_init@0| () Bool)
(declare-fun |fresh_2@0| () Int)
(assert (let ((|xxx_init@1| false)) (let ((|top_0_pre_y@0| (ite 
|xxx_init@0| 0 |fresh_2@0|))) (let ((|top_0_y@0| (ite |c@0| 0 (ite (and 
|a@0| (< |top_0_pre_y@0| 6)) (+ |top_0_pre_y@0| 1) |top_0_pre_y@0|))))
(let ((|fresh_2@1| |top_0_y@0|)) (let ((|top_0_pre_y@1| (ite 
|xxx_init@1| 0 |fresh_2@1|))) (let ((|top_0_y@1| (ite |c@1| 0 (ite (and 
|a@1| (< |top_0_pre_y@1| 6)) (+ |top_0_pre_y@1| 1) |top_0_pre_y@1|))))
(let ((|top_0_ok@1| (< |top_0_y@1| 6))) (let ((|top_0_ok@0| (< 
|top_0_y@0| 6))) (and (and (not |xxx_init@0|) (> (* (- 1) |fresh_2@0|)
(- 2)) |a@0| (>= (* 1 |fresh_2@0|) 1) (not |c@0|)) (and (not 
|xxx_init@1|) (>= (* 1 |fresh_2@1|) 2) (> (* (- 1) |fresh_2@1|) (- 3)) 
|a@1| (not |c@1|))))))))))))
(check-sat)
(get-model)
(eval (let ((|xxx_init@1| false)) (let ((|top_0_pre_y@0| (ite 
|xxx_init@0| 0 |fresh_2@0|))) (let ((|top_0_y@0| (ite |c@0| 0 (ite (and 
|a@0| (< |top_0_pre_y@0| 6)) (+ |top_0_pre_y@0| 1) |top_0_pre_y@0|))))
(let ((|fresh_2@1| |top_0_y@0|)) (let ((|top_0_pre_y@1| (ite 
|xxx_init@1| 0 |fresh_2@1|))) (let ((|top_0_y@1| (ite |c@1| 0 (ite (and 
|a@1| (< |top_0_pre_y@1| 6)) (+ |top_0_pre_y@1| 1) |top_0_pre_y@1|))))
(let ((|top_0_ok@1| (< |top_0_y@1| 6))) (let ((|top_0_ok@0| (< 
|top_0_y@0| 6))) (and (and (not |xxx_init@0|) (> (* (- 1) |fresh_2@0|)
(- 2)) |a@0| (>= (* 1 |fresh_2@0|) 1) (not |c@0|)) (and (not 
|xxx_init@1|) (>= (* 1 |fresh_2@1|) 2) (> (* (- 1) |fresh_2@1|) (- 3)) 
|a@1| (not |c@1|))))))))))))