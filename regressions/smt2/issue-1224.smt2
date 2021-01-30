(declare-fun X () String)  
(assert (not (str.in.re X (re.* (re.range "\u{0}" "\u{FF}")))))
(check-sat)
