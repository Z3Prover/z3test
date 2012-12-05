
;; vsubst does not generate models. 
(set-option :produce-models false) 

(declare-const a Real)
(declare-const b Real)

(assert (= (+ (* a a) (* b b)) 1.0))
(assert (> a 0.0))

(check-sat-using vsubst)

(assert (> a 1.0))

(check-sat-using vsubst)
