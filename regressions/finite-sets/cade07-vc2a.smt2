(set-logic QF_UFLIAFS)

(declare-fun listRoot!16 () Int)
(declare-fun list!17 () (FiniteSet Int))
(declare-fun x!18 () Int)
(declare-fun listContent!19 () (FiniteSet Int))
(declare-fun objectAlloc!20 () (FiniteSet Int))
(declare-fun objct!21 () (FiniteSet Int))

(assert
(and (member listRoot!16 list!17)
     (not (member x!18 listContent!19))
     (subset listContent!19 objectAlloc!20)
     (member x!18 objct!21)
     (member x!18 objectAlloc!20)
     (distinct (set.size (set.union listContent!19 (set.singleton x!18)))
               (+ (set.size listContent!19) 1)))
)
(check-sat)
