
; Copyright (c) 2015 Microsoft Corporation
(set-info :status sat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

; -oo -> (_ fp.to_sbv_unspecified 8); #x00 is the "hardware interpretation"
(assert (= #x00 ((_ fp.to_sbv 8) RTP (_ -oo 5 11)))) 

(check-sat)
(get-model)
(exit)
