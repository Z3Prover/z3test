(set-logic QF_UFLIAFS)
(declare-fun listContent!16 () (Set Int))

(assert 
(and (=> (distinct (card listContent!16) 0)
              (= listContent!16 (as emptyset (Set Int))))
     (=> (= listContent!16 (as emptyset (Set Int)))
              (distinct (card listContent!16) 0)))
)
(check-sat)