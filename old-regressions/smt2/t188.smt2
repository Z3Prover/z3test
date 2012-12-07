
(set-option :pp.max-depth 100)
(declare-fun p (Int) Bool)
(declare-fun f (Int Real) Bool)
(declare-fun q (Int Bool) Bool)

(push)
(assert (= (= (p 0) (p 1)) (forall ((x Int)) (= (p x) (q x true)))))
(apply snf)
(echo "---")
(apply (! snf :nnf-mode quantifiers))
(echo "---")
(apply (! snf :nnf-mode full))
(echo "---")
(apply nnf) ;; nnf is a syntax sugar for (! snf :nnf-mode full)
(pop)

