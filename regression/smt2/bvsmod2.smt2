(set-option :auto-config true)

;; Example demonstrating that the rewriting rule
;; (bvsmod a #b01) -> (ite (bvslt a #b00) #b01 #b00)
;; is incorrect

;; The correct rule is 
;; (bvsmod a #b01) -> #b00

(define-fun bvsmod_def ((s (_ BitVec 2)) (t (_ BitVec 2))) (_ BitVec 2)
      (let ((msb_s ((_ extract 1 1) s))
            (msb_t ((_ extract 1 1) t)))
        (let ((abs_s (ite (= msb_s #b0) s (bvneg s)))
              (abs_t (ite (= msb_t #b0) t (bvneg t))))
          (let ((u (bvurem abs_s abs_t)))
            (ite (= u (_ bv0 2))
                 u
            (ite (and (= msb_s #b0) (= msb_t #b0))
                 u
            (ite (and (= msb_s #b1) (= msb_t #b0))
                 (bvadd (bvneg u) t)
            (ite (and (= msb_s #b0) (= msb_t #b1))
                 (bvadd u t)
                 (bvneg u)))))))))
(declare-const a (_ BitVec 2))
(push)
(assert 
 (not (= 
       (bvsmod_def a #b01)
       (ite (bvslt a #b00) #b01 #b00)
       )))
(check-sat)
(get-model)
(pop)
(assert 
 (not (= 
       (bvsmod_def a #b01)
       #b00
       )))
(check-sat)
