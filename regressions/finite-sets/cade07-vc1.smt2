(set-logic QF_UFLIAFS)
(declare-fun listContent!16 () (FiniteSet Int))

(assert 
(and (=> (distinct (set.size listContent!16) 0)
              (= listContent!16 (as set.empty (FiniteSet Int))))
     (=> (= listContent!16 (as set.empty (FiniteSet Int)))
              (distinct (set.size listContent!16) 0)))
)
(check-sat)