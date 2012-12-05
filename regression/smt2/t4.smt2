(set-option :produce-models false) ;; Models are now enabled by default

(declare-const l1 (List Int))
(declare-const l2 (List Int))

(assert (= l1 (insert 10 l2)))
(check-sat)
(get-model)

(set-option :produce-models true)
(get-model)

(check-sat)
(get-model)
(assert (is-insert l2))
(check-sat)
(get-model)
(assert (> (head l2) 100))
(check-sat)
(get-model)
