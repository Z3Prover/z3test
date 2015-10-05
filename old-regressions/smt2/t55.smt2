
; Copyright (c) 2015 Microsoft Corporation


(define-sort W () (_ BitVec 16))
(declare-const c1 W)

(simplify (bvudiv c1 #x0002))
(simplify (bvudiv c1 #x0001))
(simplify (bvudiv c1 #x0008))
(simplify (bvudiv c1 #x0009))

(define-sort DW () (_ BitVec 128))
(declare-const c2 DW)
(simplify (bvudiv c2 #x00000000000000000001000000000000))
(simplify (bvudiv c2 #x00000000000000001000000000000000))
(simplify (bvudiv c2 #x00000000000000010000000000000000))
(simplify (bvudiv c2 #x00000000000000100000000000000000))
(simplify (bvudiv c2 #x00000000000010000000000000000000))
(simplify (bvudiv c2 #x00000000000010000000000010000000))

(simplify (bvurem c1 #x0002))
(simplify (bvurem c1 #x0001))
(simplify (bvurem c1 #x0008))
(simplify (bvurem c1 #x0009))

(simplify (bvurem c2 #x00000000000000000001000000000000))
(simplify (bvurem c2 #x00000000000000001000000000000000))
(simplify (bvurem c2 #x00000000000000010000000000000000))
(simplify (bvurem c2 #x00000000000000100000000000000000))
(simplify (bvurem c2 #x00000000000010000000000000000000))
(simplify (bvurem c2 #x00000000000010000000000010000000))


(simplify (bvurem #x0000 c1)
          :hi-div0 false)
(simplify (bvurem #x0000 c1)     
          :hi-div0 true)

(simplify (bvurem (bvsub c1 #x0001) c1)
          :hi-div0 false)
(simplify (bvurem (bvsub c1 #x0001) c1)
          :hi-div0 true)

(simplify (bvsrem c1 #x0001))
(simplify (bvsrem c1 #x0002))
(simplify (bvsmod c1 #x0001))
(simplify (bvsrem c1 #x0000)
          :hi-div0 false)
(simplify (bvsrem c1 #x0000)
          :hi-div0 true)
(simplify (bvurem c1 #x0000)
          :hi-div0 true)
(simplify (bvsmod c1 #x0000)
          :hi-div0 true)
(simplify (bvsdiv c1 #x0000)
          :hi-div0 true)
(simplify (bvsdiv c1 #x0000)
          :hi-div0 false)
(simplify (bvudiv c1 #x0000)
          :hi-div0 true)
(simplify (bvudiv c1 #x0000)
          :hi-div0 false)

