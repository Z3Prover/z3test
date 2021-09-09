
(set-option :encoding ascii)
(declare-fun X () String)  
(assert (not (str.in.re X (re.* (re.range "\u{0}" "\u{FF}")))))
(check-sat)

(reset)
(set-option :encoding unicode)
(declare-fun X () String)  
(assert (not (str.in.re X (re.* (re.range "\u{0}" "\u{2FFFF}")))))
(check-sat)
