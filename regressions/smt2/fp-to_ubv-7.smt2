;; Copyright (c) 2015 Microsoft Corporation
(set-info :status unsat)
(set-info :source "Handcrafted by C.M. Wintersteiger")
(set-option :rewriter.hi_fp_unspecified true)

(set-option :rewriter.hi_fp_unspecified true)

; 2^15 = 32768 -> (_ fp.to_ubv_unspecified 8); #x00 is the "hardware interpretation"
(assert (not (= #x00 ((_ fp.to_ubv 8) RTP (fp #b0 #b11110 #b0000000000)))))

(check-sat)
(check-sat-using smt)
(exit)
