
; Copyright (c) 2015 Microsoft Corporation
(set-info :status unsat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

(set-option :rewriter.hi_fp_unspecified true)

; 1.9990234375p7 = 255.875 -> (_ fp.to_ubv_unspecified 8); #x00 is the "hardware interpretation"
(assert (not (= #x00 ((_ fp.to_ubv 8) RTP (fp #b0 #b10110 #b1111111111)))))

(check-sat)
(check-sat-using smt)
(exit)
