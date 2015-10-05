
; Copyright (c) 2015 Microsoft Corporation
(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

(assert (or (and p q) (and q r)))

(apply tseitin-cnf-core)
(apply tseitin-cnf)
(apply (then tseitin-cnf propagate-values))

(reset)

(declare-const p Bool)
(declare-const x Int)

(assert (= x (if p 0 1)))

(apply tseitin-cnf-core)
(apply tseitin-cnf)

(reset)
(declare-const p Bool)
(declare-const q Bool)
(declare-const r Bool)

(push)
(assert (implies p q))
(apply tseitin-cnf-core)
(apply tseitin-cnf)
(pop)
(assert (xor p q))
(apply tseitin-cnf-core)
(apply tseitin-cnf)



