(set-logic QF_UFLIAFS)

(declare-fun content!16 () (FiniteSet Int))
(declare-fun alloc!17 () (FiniteSet Int))
(declare-fun x1!18 () Int)
(declare-fun x2!19 () Int)
(declare-fun x3!20 () Int)

(assert
(and (set.subset content!16 alloc!17)
     (not (set.in x1!18 alloc!17))
     (not (set.in x2!19 (set.union alloc!17 (set.singleton x1!18))))
     (not (set.in x3!20
                       (set.union alloc!17
                              (set.union (set.singleton x1!18) (set.singleton x2!19)))))
     (distinct (set.size (set.union content!16
                                   (set.union (set.union (set.singleton x1!18)
                                                 (set.singleton x2!19))
                                          (set.singleton x3!20))))
               (+ (set.size content!16) 3)))
)
(check-sat)
