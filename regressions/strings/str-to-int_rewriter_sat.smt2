(set-info :status sat)

(assert (= 3 (str.to-int "3")))
(check-sat)