(set-option :model_validate true)

(set-option :rewriter.elim_and true) ;; invalid model
;; (set-option :rewriter.flat false) ;; but this ok?

(declare-const a (_ FloatingPoint 11  53))
(declare-const b (_ FloatingPoint 11  53))
(assert (fp.eq (fp.max b a) (fp.fma RTN a b
(fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))
(check-sat)