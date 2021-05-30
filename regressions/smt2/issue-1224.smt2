
(set-option :unicode false)
(declare-fun X () String)  
(assert (not (str.in.re X (re.* (re.range "\u{0}" "\u{FF}")))))
(check-sat)

(reset)
(set-option :unicode true)
(declare-fun X () String)  
(assert (not (str.in.re X (re.* (re.range "\u{0}" "\u{2FFFF}")))))
(check-sat)
