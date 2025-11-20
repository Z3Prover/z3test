(set-logic QF_UFLIAFS)

(declare-fun listRoot!16 () Int)
(declare-fun list!17 () (Set Int))
(declare-fun x!18 () Int)
(declare-fun listContent!19 () (Set Int))
(declare-fun objectAlloc!20 () (Set Int))
(declare-fun objct!21 () (Set Int))

(assert
(and (member listRoot!16 list!17)
     (not (member x!18 listContent!19))
     (subset listContent!19 objectAlloc!20)
     (member x!18 objct!21)
     (member x!18 objectAlloc!20)
     (distinct (card (union listContent!19 (singleton x!18)))
               (+ (card listContent!19) 1)))
)
(check-sat)
