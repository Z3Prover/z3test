(set-option :produce-models true)
(set-logic ALL)
(declare-fun s0 () Int)
(define-fun s2 () Bool (<= 0 s0))
(define-fun s4 () Bool (< s0 256))
(define-fun s5 () Bool (and s2 s4))
(define-fun s6 () Bool (not s5))
(define-fun s7 () (_ BitVec 8) (let ((__a (mod s0 256))) (let ((__a0 (ite (= (mod __a 2) 0) #b0 #b1)) (__a1 (ite (= (mod (div __a 2) 2) 0) #b0 #b1)) (__a2 (ite (= (mod (div __a 4) 2) 0) #b0 #b1)) (__a3 (ite (= (mod (div __a 8) 2) 0) #b0 #b1)) (__a4 (ite (= (mod (div __a 16) 2) 0) #b0 #b1)) (__a5 (ite (= (mod (div __a 32) 2) 0) #b0 #b1)) (__a6 (ite (= (mod (div __a 64) 2) 0) #b0 #b1)) (__a7 (ite (= (mod (div __a 128) 2) 0) #b0 #b1))) (concat __a7 (concat __a6 (concat __a5 (concat __a4 (concat __a3 (concat __a2 (concat __a1 __a0))))))))))
(define-fun s8 () Int (+ (ite (= ((_ extract 0 0) s7) #b1) 1 0) (ite (= ((_ extract 1 1) s7) #b1) 2 0) (ite (= ((_ extract 2 2) s7) #b1) 4 0) (ite (= ((_ extract 3 3) s7) #b1) 8 0) (ite (= ((_ extract 4 4) s7) #b1) 16 0) (ite (= ((_ extract 5 5) s7) #b1) 32 0) (ite (= ((_ extract 6 6) s7) #b1) 64 0) (ite (= ((_ extract 7 7) s7) #b1) 128 0)))
(define-fun s9 () Bool (= s0 s8))
(define-fun s10 () Bool (or s6 s9))
(assert (not s10))
(check-sat)