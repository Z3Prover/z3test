(set-option :model_validate true)
(set-info :status sat) 

(declare-fun a () Float64)
(declare-fun b () Float64)
(assert (= a (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
(assert (= b (fp #b0 #b11111100001 #b0111011111011101010111011000011011101111111110010010)))
(assert (= (fp.fma RTN b b a) a))
(check-sat)
