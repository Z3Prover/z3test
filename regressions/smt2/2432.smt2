(set-option :produce-models true)
(set-logic ALL)
(declare-fun s0 () (Array Int Bool))
(declare-fun s1 () (Array Int Bool))
(declare-fun s2 () (Array Int Bool))
(define-fun s3 () Bool (distinct s0 s1 s2))
(assert s3)
(check-sat)
;(get-model)
(eval (= s0 s1))
(eval (= s1 s2))
(eval (= s2 s0))
