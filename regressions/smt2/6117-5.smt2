(set-option :model_validate true)
(set-info :status unsat) 

(assert (distinct (fp (_ bv0 1) #b11111111110 #b1111111111111111111111111111111111111111111111111111)
         (fp.fma RTN (fp (_ bv1 1) #b11101011010 (_ bv0 52))
          (fp (_ bv1 1) #b11101011010 (_ bv0 52))
          (fp (_ bv0 1) (_ bv0 11) (_ bv0 52)))))
(check-sat)
