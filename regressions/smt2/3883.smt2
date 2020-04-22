(set-option :smt.seq.validate true)
(declare-const Str10 String)
(assert (str.< Str10 ""))
(check-sat)