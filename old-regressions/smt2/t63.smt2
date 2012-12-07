(define-sort C () (_ BitVec 8))
(declare-const a1 C)
(declare-const a2 C)


(simplify (= (bvadd (bvmul #x02 a1) a2 #x02) 
             (bvadd a1 #x03)))

