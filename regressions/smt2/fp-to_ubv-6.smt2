(set-info :status sat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

; +oo -> (_ fp.to_ubv_unspecified 8); #x00 is the "hardware interpretation"
(assert (= #x00 ((_ fp.to_ubv 8) RTP (_ +oo 5 11)))) 

(check-sat)
(exit)
