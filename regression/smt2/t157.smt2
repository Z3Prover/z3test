

(set-option :auto-config false)
(set-option :produce-models true)
(declare-const a Int)
(declare-const l (List Int))
(dbg-set-next-id 10000)
(define-fun c1 () Int a)
(dbg-set-next-id 10)
(define-fun c2 () Int (* 2 a))
(assert (= (insert c1 nil) l))
(assert (= l (insert c2 nil)))
(check-sat)
(get-model)
