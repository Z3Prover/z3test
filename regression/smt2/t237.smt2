

(declare-const a Real)
(declare-const b Real)
(declare-fun p (Real) Bool)

(simplify (^ a 0.))

(set-option :pp.max-depth 1000)
(assert (= (^ a 0.) 2.))
(assert (forall ((x Real)) (=> (p (/ x a)) (exists ((y Real)) (p (^ y 0.))))))
(assert (p (^ b 0.)))

(apply purify-arith)

(apply (! purify-arith :complete false))
