(set-logic QF_S)
(set-info :status sat)
(declare-const aPosition Int)
(declare-const secondPos Int)
(declare-const aURL String)


; var aURL = "http://www.tizag.com/www.html";
; var aPosition = aURL.indexOf("www");
; var secondPos = aURL.indexOf("www", aPosition + 1);

(assert (= "http://www.tizag.com/www.html" aURL) )
(assert (= aPosition (str.indexof  aURL  "www") ) )
(assert (= secondPos (Indexof2  aURL  "www" (+ aPosition 1) ) ) )


(check-sat)
(get-model)
