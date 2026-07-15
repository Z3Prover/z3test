(declare-sort U)
(declare-const f (-> U Bool))
(declare-const p (-> (-> U Bool) Bool))
 
(assert (select p f))

(assert (not (select p (lambda ((X U)) (select f X)))))
(check-sat)
(get-model)
