; Disabled and exhausted certificate budgets retain the old sound interval.
; Increasing the budget on the same optimizer allows an exact open bound.
(set-option :opt.optsmt_bisect_rounds 8)
(set-option :opt.optsmt_nlsat_supremum_rlimit 0)
(declare-const x Real)
(assert (< (* x x) 2.0))
(maximize x)
(check-sat)
(get-objectives)
(set-option :opt.optsmt_nlsat_supremum_rlimit 1)
(check-sat)
(get-objectives)
(set-option :opt.optsmt_nlsat_supremum_rlimit 100000)
(check-sat)
(get-objectives)

; A new rational cap must clear both the algebraic value and its epsilon.
(push)
(assert (<= x 1.0))
(check-sat)
(get-objectives)
(pop)
(check-sat)
(get-objectives)
