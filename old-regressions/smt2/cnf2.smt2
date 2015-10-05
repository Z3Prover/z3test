
; Copyright (c) 2015 Microsoft Corporation

(declare-sort Value 0)

(declare-fun p () Bool)
(declare-fun q () Bool)
(declare-fun s () Bool)
(declare-fun r () Bool)

(assert (not (=> (not (ite p q s)) r)))

(apply (then (! simplify :elim-and true) tseitin-cnf))
