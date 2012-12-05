

(set-option :produce-unsat-cores true)

(declare-fun p (Int) Bool)

(assert (! (or (and (p 0) (p 1) (p 2)) (and (p 3) (p 4) (p 5))) :named a1))
(assert (! (iff (p 6) (and (p 8) (p 9))) :named a2))
(assert (! (or (and (p 0) (p 1) (p 2)) (p 10)) :named a3))
(assert (or (p 11) (p 12) (p 13)))
(assert (or (and (p 20) (p 21) (p 22)) (and (p 23) (p 24) (p 25))))
(apply (and-then (! simplify :elim-and true) solve-eqs tseitin-cnf) :print-dependencies true)
(apply (and-then (! simplify :elim-and true) solve-eqs (! tseitin-cnf :distributivity false)) :print-dependencies true)
