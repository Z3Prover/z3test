
(set-option :auto-config true)
(declare-const a Real)
(declare-const b Real)

;; This is a corner case.
;; nlsat is currently creating a fresh variable for each division instead of using the uninterpreted functions.
;; The problem is that nlsat currently does not support uninterpreted functions. This will be fixed when
;; we integrate it in the main core.
;; So, this query must be marked back to unsat after we fix that.
(assert (not (= (/ a b) (/ a 0.))))
(assert (<= b 0.))
(assert (>= b 0.))

(check-sat)

(reset)
(set-option :auto-config false)
(declare-const a Real)
(declare-const b Real)

(assert (not (= (/ a b) (/ a 0.))))
(assert (<= b 0.))
(assert (>= b 0.))

(check-sat)
