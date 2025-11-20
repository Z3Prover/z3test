(set-logic QF_UFLIAFS)
(declare-fun listContent!16 () (Set Int))
(declare-fun x!17 () Int)

(assert
(> (card (union listContent!16 (singleton x!17)))
   (+ (card listContent!16) 1))
)
(check-sat)
