(set-logic QF_UFLIAFS)
(declare-fun listContent!16 () (FiniteSet Int))

(assert 
(and (=> (distinct (set.size listContent!16) 0)
              (= listContent!16 (as emptyset (FiniteSet Int))))
     (=> (= listContent!16 (as emptyset (FiniteSet Int)))
              (distinct (set.size listContent!16) 0)))
)
(check-sat)