(set-option :auto-config true)
(set-option :produce-models true)
(declare-fun my_function (Int Int) Int)
(declare-fun my_array () (Array Int Int))

(assert
  (=
    (select my_array (my_function 0 1))
    (select my_array (my_function 1 0))
  )
)


(check-sat)  
(get-model)
(get-value ((select my_array (my_function 0 1))))
(get-value ((my_function 0 1)))
