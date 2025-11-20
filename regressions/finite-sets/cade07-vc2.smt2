(set-logic QF_UFLIAFS)

(declare-fun listContent!17 () (Set Int))
(declare-fun x!16 () Int)

(assert
(and (not (member x!16 listContent!17))
     (distinct (card (union listContent!17 (singleton x!16)))
               (+ (card listContent!17) 1)))
)
(check-sat)
