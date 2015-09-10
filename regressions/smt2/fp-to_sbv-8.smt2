(set-info :status unsat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

(declare-const X (_ BitVec 8))

; 1.9921875p6 == 127.5 -> (_ fp.to_sbv_unspecified 8) because of RTP; #x00 is the "hardware interpretation"
(assert (= X ((_ fp.to_sbv 8) RTP (fp #b0 #b10101 #b1111111000))))
(assert (not (= X #x00)))

(check-sat)
(exit)
