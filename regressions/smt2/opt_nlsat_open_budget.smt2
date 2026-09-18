; With certification disabled or its budget exhausted, report a sound interval.
; A sufficient budget certifies the open bound on the same optimizer.
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

; Adding x<=1 must replace the previous sqrt(2)-epsilon bound with the
; attained maximum 1, without retaining the old algebraic value or epsilon.
(push)
(assert (<= x 1.0))
(check-sat)
(get-objectives)
; Removing the cap must restore the open sqrt(2)-epsilon bound.
(pop)
(check-sat)
(get-objectives)
