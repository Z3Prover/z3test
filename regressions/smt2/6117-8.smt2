(set-option :model_validate true)
(set-info :status unsat) 

(assert (= (fp (_ bv1 1) (_ bv2047 11) (_ bv0 52)) (fp.fma RTP (fp (_ bv0 1) #b11100001000 (_ bv0 52)) (fp (_ bv1 1) #b11101101011 (_ bv0 52)) (fp (_ bv0 1) (_ bv0 11) (_ bv0 52)))))
(check-sat)
