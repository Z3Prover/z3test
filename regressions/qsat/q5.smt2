(declare-datatypes () ((list (nil) (cons (head Int) (tail list)))))
(declare-const l1 list)
(declare-const l2 list)
(declare-const i1 Int)
(declare-const i2 Int)

(assert (exists ((x Int)) 
        (and (= l1 (cons x l2)) (not (= l1 (cons x nil))))))
(apply qe2)
(exit)
(apply qe2)
(reset)


(declare-datatypes () ((list (nil) (cons (head Int) (tail list)))))
(declare-const l1 list)
(declare-const l2 list)
(declare-const i1 Int)
(declare-const i2 Int)

(assert (exists ((x Int) (l list)) 
        (and (= l1 (cons x l2)) (not (= l1 (cons x nil))))))
(apply qe2)
(exit)
(apply qe2)
(reset)




(declare-datatypes () ((list (nil) (cons (head Int) (tail list)))))
(assert 
(forall ((l list)) 
  (or (= l nil) (exists ((x Int) (ll list)) (= l (cons x ll)))))
)

(apply qe)
(apply qe2)
(reset)

(declare-datatypes () ((list (nil) (cons (head Int) (tail list)))))
(declare-const l1 list)
(declare-const l2 list)
(declare-const i1 Int)
(declare-const i2 Int)

(assert (exists ((x Int) (l list)) (= l1 (cons x l))))
(apply qe)
(apply qe2)
(reset)

(declare-datatypes () ((list (nil) (cons (head Int) (tail list)))))
(declare-const l1 list)
(declare-const l2 list)
(declare-const i1 Int)
(declare-const i2 Int)

(assert (exists ((x Int) (l list)) (not (= l1 (cons x l)))))
(apply qe)
(apply qe2)
(reset)

