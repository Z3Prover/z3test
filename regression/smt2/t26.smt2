

(declare-fun a () (Array Int Int))
(declare-fun i () Int)
(declare-fun j () Int)
(declare-fun v () Int)
(declare-fun f (Int Int) Int)
(declare-fun s () (Array Int Bool))
(declare-fun p () Bool)
(declare-fun p1 () Bool)
(declare-fun p2 () Bool)
(declare-fun p3 () Bool)
(declare-fun s1 () (Array Int Bool))
(declare-fun s2 () (Array Int Bool))
(declare-fun s3 () (Array Int Bool))
(declare-fun i1 () Int)
(declare-fun i2 () Int)

(simplify ((_ map not) (store (store s i false) j true)))


(simplify ((_ map not) ((as const (Array Int Bool)) (not p))))

(simplify ((_ map and) (store s1 i p1) (store s2 i p2)))
(simplify ((_ map and) (store s1 i p1) (store s2 j p2)))


(declare-fun r1 () (Array Int Int Bool))
(declare-fun r2 () (Array Int Int Bool))

(simplify ((_ map and) (store r1 i j p1) (store r2 i j p2)))
(simplify ((_ map and) (store r1 i j p1) (store r2 i i p2)))
(simplify ((_ map and) (store r1 i j p1) (store r2 j i p2)))

(simplify ((_ map and) ((as const (Array Int Bool)) (and p1 p2))
                              ((as const (Array Int Bool)) p3)))

(simplify ((_ map and) 
                  ((as const (Array Int Bool)) (and p1 p2))
                  (store s1 i p1)))

