
; Copyright (c) 2015 Microsoft Corporation
(set-logic QF_FP)
;; (set-info :status unsat)

(define-sort FPN () (_ FloatingPoint 11 53))
(declare-const x FPN)
(declare-const y FPN)
(declare-const z FPN)
(declare-const r FPN)
(declare-const q FPN)
(declare-const mpfx FPN)

;; (assert (= mpfx ((_ to_fp 11 53) roundNearestTiesToEven 1.829929380787749249037688059615902602672576904296875 (- 427))))

(assert (= x ((_ to_fp 11 53) roundNearestTiesToEven (- 1.6463449040516400234679394998238421976566314697265625) (- 857))))
(assert (= y ((_ to_fp 11 53) roundNearestTiesToEven (- 1.0255047247166533264106647038715891540050506591796875) (- 922))))
(assert (= z (_ +zero 11 53))) ;;  FIXME: (assert (= z (_ -zero 11 53)))
(assert (= r (_ +zero 11 53)))

;; X = (fp #b1 #b00010100110 #b1010010101110110110111000001000011010110100010101001) = -0X1.A576DC10D68A9P-857 class: Neg. norm. non-zero
;; Y = (fp #b1 #b00001100101 #b0000011010000111011110100100011010001101001011111011) = -0X1.06877A468D2FBP-922 class: Neg. norm. non-zero
;; Z = (fp #b1 #b00000000000 #b0000000000000000000000000000000000000000000000000000) = -0X0.0000000000000P+0 class: -0.0
;; R = (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) = +0X0.0000000000000P+0 class: +0.0

(assert (= q (fp.fma roundNearestTiesToEven x y z)))

(assert (not (= q r)))

(check-sat)
(check-sat-using smt)
