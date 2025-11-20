(set-logic QF_UFLIAFS)

(declare-fun listRoot!16 () Int)
(declare-fun list!17 () (Set Int))
(declare-fun listContent!18 () (Set Int))
(declare-fun objectAlloc!19 () (Set Int))
(declare-fun x!20 () Int)
(declare-fun objct!21 () (Set Int))

(assert
(and (member listRoot!16 list!17)
     (subset listContent!18 objectAlloc!19)
     (member x!20 objct!21)
     (member x!20 objectAlloc!19)
     (distinct (card (union listContent!18 (singleton x!20)))
               (+ (card listContent!18) 1)))
)
(check-sat)
