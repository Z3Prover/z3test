(set-option :model_validate true)
(set-option :rewriter.flat false) ;; ok without

(declare-const a (_ FloatingPoint 11  53))
(declare-const b (_ FloatingPoint 11  53))
(assert (fp.eq (fp.max b b) (fp.fma RTZ b b b)))
(check-sat)