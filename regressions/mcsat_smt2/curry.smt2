
; Copyright (c) 2015 Microsoft Corporation


(declare-fun f (Int Real Bool) Int)

(display ((_ curry 1) (_ as-array f)))
(dbg-sort ((_ curry 0) (_ as-array f)))
(dbg-sort ((_ curry 1) (_ as-array f)))
(dbg-sort ((_ curry 2) (_ as-array f)))
(dbg-sort ((_ curry 3) (_ as-array f)))
(dbg-sort (uncurry ((_ curry 1) (_ as-array f))))
(dbg-sort (uncurry ((_ curry 2) (_ as-array f))))
(display (select ((_ curry 2) (_ as-array f)) 10))
(dbg-sort (select ((_ curry 2) (_ as-array f)) 10))
(display (select ((_ curry 1) (_ as-array f)) 10 2.0))
(dbg-sort (select ((_ curry 1) (_ as-array f)) 10 2.0))
(dbg-sort ((_ curry 1) ((_ curry 1) (_ as-array f))))
