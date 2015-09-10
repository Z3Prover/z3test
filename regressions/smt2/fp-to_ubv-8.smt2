(set-info :status sat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

; 2^8 = 256 -> (_ fp.to_ubv_unspecified 8); #x00 is the "hardware interpretation"
(assert (= #x00 ((_ fp.to_ubv 8) RTP (fp #b0 #b10111 #b0000000000)))) 

(check-sat)
(exit)
