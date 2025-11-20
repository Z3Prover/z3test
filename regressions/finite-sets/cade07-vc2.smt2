(set-logic QF_UFLIAFS)

(declare-fun listContent!17 () (FiniteSet Int))
(declare-fun x!16 () Int)

(assert
(and (not (member x!16 listContent!17))
     (distinct (set.size (set.union listContent!17 (set.singleton x!16)))
               (+ (set.size listContent!17) 1)))
)
(check-sat)
