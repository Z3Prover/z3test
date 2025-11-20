(set-logic QF_UFLIAFS)
(declare-fun content!16 () (Set Int))
(declare-fun alloc!17 () (Set Int))
(declare-fun x1!18 () Int)
(declare-fun x2!19 () Int)
(declare-fun x3!20 () Int)
(assert
(and (subset content!16 alloc!17)
     (not (member x1!18 alloc!17))
     (not (member x2!19 alloc!17))
     (not (member x3!20
                       (union alloc!17
                              (union (singleton x1!18) (singleton x2!19)))))
     (distinct (card (union content!16
                                   (union (union (singleton x1!18)
                                                 (singleton x2!19))
                                          (singleton x3!20))))
               (+ (card content!16) 3)))
)
(check-sat)
