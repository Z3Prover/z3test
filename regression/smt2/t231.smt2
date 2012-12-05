
(set-option :produce-models true)

(declare-const x Real)
(declare-const y Real)

(assert (= (+ (^ x 2.) (^ y 3.)) 4.))
(assert (>= (^ x 2.) 1.))
(assert (>= (^ y 3.) 1.))

(check-sat-using (and-then degree-shift (! simplify :expand-power true) smt))
(get-model)

(reset)

(set-option :produce-models true)
(set-option :pp.decimal true)

(declare-const x Real)
(declare-const y Real)

(assert (= (+ (^ x 2.) (^ y 3.)) 4.))
(assert (>= (^ x 2.) 1.))
(assert (>= (^ y 3.) 1.))

(check-sat-using (and-then degree-shift (! simplify :expand-power true) smt))
(get-model)