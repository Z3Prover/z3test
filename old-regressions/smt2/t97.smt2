
; Copyright (c) 2015 Microsoft Corporation
(declare-fun T4_16 () (_ BitVec 32))
(declare-fun T1_19 () (_ BitVec 8))
(declare-fun T1_18 () (_ BitVec 8))
(declare-fun T1_17 () (_ BitVec 8))
(declare-fun T1_16 () (_ BitVec 8))

(simplify (and
           (= T4_16
              (bvor (concat (bvor (concat (bvor (concat T1_19 #x00) (concat #x00 T1_18))
                                          #x00)
                                  (concat #x0000 T1_17))
                            #x00)
                    (concat #x000000 T1_16))) 
           (not (= T4_16 #x00000044))
           (= #x000000c0 T4_16))
          :split-concat-eq true)

(assert (and
         (= T4_16
            (bvor (concat (bvor (concat (bvor (concat T1_19 #x00) (concat #x00 T1_18))
                                        #x00)
                                (concat #x0000 T1_17))
                          #x00)
                  (concat #x000000 T1_16))) 
         (not (= T4_16 #x00000044))
         (= #x000000c0 T4_16)))

(apply propagate-values)
         