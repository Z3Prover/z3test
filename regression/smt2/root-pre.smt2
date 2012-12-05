(set-option :auto-config true)

(assert (not (= (* (^ 0.375 (/ 1.0 4.0)) (^ 0.375 (/ 1.0 4.0)))
		(^ (* 0.375 0.375) (/ 1.0 4.0)))))
(check-sat)


