(set-logic QF_UFLIAFS)

(declare-fun listContent!16 () (Set Int))
(declare-fun alloc!17 () (Set Int))
(declare-fun a!18 () Int)
(declare-fun b!19 () Int)
(declare-fun x!20 () Int)

(assert
(and (subset listContent!16 alloc!17)
     (member a!18 alloc!17)
     (member b!19 alloc!17)
     (distinct (card (union listContent!16 (singleton x!20)))
               (+ (card listContent!16) 1)))
)
(check-sat)
