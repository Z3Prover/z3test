
(declare-sort Value 0)

(declare-fun p () Bool)
(declare-fun q () Bool)
(declare-fun s () Bool)
(declare-fun r () Bool)

(assert (or (not (ite p q s)) r))

(apply (then simplify tseitin-cnf))

