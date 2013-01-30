
; (set-option :model.compact true)
(declare-fun r (Int Int) Bool)
(declare-fun x () Int)
(declare-fun b () Bool)

(simplify (<= (ite (<= x 60) x 60) 3) :pull-cheap-ite true)


(assert (forall ((z Int) (u Int)) (=> (and (> z 22) (< z 25) (> (* 3 u) x) (< u 11)) (r u z))) )
(assert (< x 26))
;; (assert (not (r 4 23)))
;; (assert (not (r 5 23)))
(apply (then (! simplify :arith-lhs true) nnf (! expand_bounded_quantifiers :domain 3)))

(check-sat-using (then (! simplify :arith-lhs true) nnf (! expand_bounded_quantifiers :domain 3) smt))

(get-model)
;; (check-sat)
;; (get-model)