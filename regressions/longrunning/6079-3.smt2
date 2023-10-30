(set-option :model_validate true)

(declare-const a (_ FloatingPoint 11  53))
(declare-const b (_ FloatingPoint 11  53))
(assert (fp.eq (fp.max b b) (fp.fma RTZ b a b)))
(check-sat)