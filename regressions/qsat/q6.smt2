
(declare-sort  S)
(define-sort Prop () (Array S Bool))
(declare-const P Prop)
(declare-const R Prop)
(declare-const x S)
(declare-const y S)

(push)
(assert (exists ((Q Prop)) (forall ((z S)) 
	(and (=> (select P z) (select Q z)) (=> (select Q z) (= x z))))))
(apply epr_qe)
(pop)
(exit)

(push)
(assert (exists ((u S)) (forall ((z S)) (=> (select P z) (= u z)))))
(apply epr_qe)
(pop)
(exit)

(push)
(assert (forall ((z S)) (=> (select P z) (= x z))))
(apply epr_qe)
(pop)
(exit)



(push)
(assert (exists ((Q Prop)) (forall ((z S)) (and (=> (select Q z) (= x z)) (select Q y)))))
(apply epr_qe)
(pop)


(push)
(assert (exists ((Q Prop)) (forall ((z S)) (and (=> (select P z) (select Q z)) (=> (select Q z) (select R z))))))
(apply epr_qe)
(pop)



(push)




