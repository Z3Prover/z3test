
; Copyright (c) 2015 Microsoft Corporation


(set-option :produce-unsat-cores true)

(declare-fun f (Int) Int)

(assert (! (>= (f 0) 0) :named |a (b)|))
(assert (! (>= (f 0) 1) :named c))
(assert (! (< (f 0) 0) :named d))
(check-sat)
(get-unsat-core)
