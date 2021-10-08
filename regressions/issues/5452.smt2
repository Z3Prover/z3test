(set-option :model_validate true)

(set-option :rewriter.flat false)
(declare-fun b () Real)
(declare-fun a () Real)
(assert (and (> a b) (< 0.0 (- 1 b b))))
(check-sat-using (then qfnia))
(exit)

(check-sat)

(declare-fun x () Bool)
(declare-fun y () Bool)
(assert (and y (= x y)))
(assert (= x x))
(check-sat-using (then nnf pb-preprocess))
;(exit)
(check-sat)
(reset)


(assert (exists ((x Bool)) x))
(check-sat-using (then nnf pb-preprocess))
(reset)


