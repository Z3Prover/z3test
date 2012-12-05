

(declare-const X Real)
(declare-const K Real)
(declare-const W Real)
(declare-const Z Real)

(poly/factor
(+ (* X (* X (* X X)))
(+ (* (- 2.) (* K (* X (* X X))))
(+ (* (* K K) (* X X))
(+ (* 6. (* W (* X (* X X))))
(+ (* (- 6.) (* W (* K (* X X))))
(+ (* 9. (* (* W W) (* X X)))
(+ (* (- 4.) (* Z (* X (* X X))))
(+ (* 4. (* Z (* K (* X X))))
(+ (* (- 12.) (* Z (* W (* X X))))
(* 4. (* (* Z Z) (* X X)))))))))))))
