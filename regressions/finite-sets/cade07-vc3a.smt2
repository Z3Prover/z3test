(set-logic QF_UFLIAFS)

(declare-fun listContent!16 () (FiniteSet Int))
(declare-fun alloc!17 () (FiniteSet Int))
(declare-fun a!18 () Int)
(declare-fun b!19 () Int)
(declare-fun x!20 () Int)

(assert
(and (subset listContent!16 alloc!17)
     (set.in a!18 alloc!17)
     (set.in b!19 alloc!17)
     (> (set.size (set.union listContent!16 (set.singleton x!20)))
        (+ (set.size listContent!16) 1)))
)
(check-sat)
