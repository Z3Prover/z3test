; Box mode returns independent feasible models for two unattained limits.
; Selecting another model must not overwrite either certified bound.
(set-option :opt.priority box)
(declare-const x Real)
(assert (< (* x x) 2.0))
(maximize x)
(minimize x)
(check-sat)
(get-objectives)
(check-sat)
(get-objectives)
(check-sat)
