; opt.optsmt_nlsat=false disables the nlsat-cell engine: the irrational optimum
; sqrt(2) is only bracketed by bisection (8 rounds)
(set-option :opt.optsmt_nlsat false)
(set-option :opt.optsmt_bisect_rounds 8)
(declare-const x Real)
(assert (<= (* x x) 2.0))
(maximize x)
(check-sat)
(get-objectives)
