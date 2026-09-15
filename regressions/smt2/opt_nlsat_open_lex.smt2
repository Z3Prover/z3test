; Fixing x to sqrt(2) would violate x^2<2. Do not falsely report an
; optimal lexicographic model when a later objective still needs solving.
(declare-const x Real)
(declare-const y Real)
(assert (< (* x x) 2.0))
(assert (<= y 3.0))
(maximize x)
(maximize y)
(check-sat)
(get-info :reason-unknown)
(get-objectives)

(reset)
; The last lex objective can have an open limit: no later commitment is needed.
(declare-const x Real)
(declare-const y Real)
(assert (< (* x x) 2.0))
(assert (<= y 3.0))
(maximize y)
(maximize x)
(check-sat)
(get-objectives)

(reset)
; Keep an attained algebraic first objective, then certify the open second limit.
(set-option :opt.optsmt_nlsat_supremum_rlimit 1000000)
(declare-const x Real)
(declare-const y Real)
(assert (<= (* x x) 2.0))
(assert (< (+ (* x x) (* y y)) 4.0))
(maximize x)
(maximize y)
(check-sat)
(get-objectives)
