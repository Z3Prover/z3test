
; Copyright (c) 2015 Microsoft Corporation


(declare-const a Real)
(declare-const b Real)

(assert (>= (* 2.0 a) (+ (* 3.0 b) 5.0)))

(apply (when (> num-arith-consts 2) (! simplify :arith-lhs true)))
(apply (when (= num-arith-consts 2) (! simplify :arith-lhs true)))