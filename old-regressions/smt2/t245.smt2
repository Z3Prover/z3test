
; Copyright (c) 2015 Microsoft Corporation

(declare-const X Real)
(declare-const K Real)
(declare-const W Real)
(declare-const Z Real)

(define-fun grant-poly () Real
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

(push)
(assert (> grant-poly 0.0))
(apply factor)
(pop) 

(push)
(assert (>= grant-poly 0.0))
(apply factor)
(pop) 

(push)
(assert (<= grant-poly 0.0))
(apply factor)
(pop) 

(push)
(assert (< grant-poly 0.0))
(apply factor)
(pop) 
