(set-info :status sat)

(assert (= "42" (str.from-int 42)))
(check-sat)

