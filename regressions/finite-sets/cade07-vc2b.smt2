(set-logic QF_UFLIAFS)

(declare-fun listRoot!16 () Int)
(declare-fun list!17 () (FiniteSet Int))
(declare-fun listContent!18 () (FiniteSet Int))
(declare-fun objectAlloc!19 () (FiniteSet Int))
(declare-fun x!20 () Int)
(declare-fun objct!21 () (FiniteSet Int))

(assert
(and (set.in listRoot!16 list!17)
     (subset listContent!18 objectAlloc!19)
     (set.in x!20 objct!21)
     (set.in x!20 objectAlloc!19)
     (distinct (set.size (set.union listContent!18 (set.singleton x!20)))
               (+ (set.size listContent!18) 1)))
)
(check-sat)
