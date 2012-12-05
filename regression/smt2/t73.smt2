(dbg-some-value Bool)
(dbg-some-value Int)
(dbg-some-value Real)
(dbg-some-value (_ BitVec 32))
(dbg-some-value (List Int))
(dbg-some-value (Array Int (Array Int (List Int))))

(declare-datatypes (T1 T2) ((Tuple (mk-tuple (first T1) (second T2)))))

(dbg-some-value (Tuple Int Real))

(dbg-some-value (Tuple Int (Array Int (Tuple Bool (_ BitVec 16)))))



