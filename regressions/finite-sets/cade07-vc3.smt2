(set-logic QF_UFLIAFS)
(declare-fun listContent!16 () (FiniteSet Int))
(declare-fun x!17 () Int)

(assert
(> (set.size (set.union listContent!16 (set.singleton x!17)))
   (+ (set.size listContent!16) 1))
)
(check-sat)
