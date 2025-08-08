; Copyright (c) 2017 Microsoft Corporation
; Issue #874 
(set-option :smt.string_solver seq)
(declare-const s String)
(declare-const s2 String)
(declare-const i Int)
(assert (= (str.len s) 1))
(assert (= (str.indexof "a" s) i))
(assert (or (and (= s s2) (< i 0)) (and (= (str.at "A" i) s2) (>= i 0))))
(assert (= s2 "a"))
(check-sat)
