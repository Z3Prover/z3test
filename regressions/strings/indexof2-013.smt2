(set-logic QF_S)
(set-info :status sat)
(declare-const aPosition Int)
(declare-const secondPos Int)
(declare-const aURL String)

(assert (= "http://www.tizag.com/www.html" aURL) )
(assert (= secondPos (Indexof2  aURL  "www" (- 0 10) ) ) )


(check-sat)
(get-model)
