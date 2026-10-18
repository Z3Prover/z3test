(set-info :smt-lib-version 2.6)
(set-logic QF_AX)
(set-info :source |
Benchmarks used in the followin paper:
Big proof engines as little proof engines: new results on rewrite-based satisfiability procedure
Alessandro Armando, Maria Paola Bonacina, Silvio Ranise, Stephan Schulz. 
PDPAR'05
http://www.ai.dist.unige.it/pdpar05/


|)
(set-info :category "crafted")
(set-info :status unsat)
(declare-sort Index 0)
(declare-sort Element 0)
(declare-fun a1 () (Array Index Element))
(declare-fun i0 () Index)
(declare-fun i1 () Index)
(declare-fun i3 () Index)
(declare-fun i4 () Index)
(declare-fun i5 () Index)
(assert (let ((?v_0 (select a1 i1))) (let ((?v_1 (store (store a1 i1 ?v_0) i1 ?v_0))) (let ((?v_2 (store (store ?v_1 i3 (select ?v_1 i5)) i5 (select ?v_1 i3)))) (let ((?v_3 (store (store ?v_2 i5 (select ?v_2 i0)) i0 (select ?v_2 i5)))) (let ((?v_6 (select ?v_3 i1)) (?v_7 (select ?v_3 i5))) (let ((?v_4 (store (store ?v_3 i1 ?v_7) i5 ?v_6))) (let ((?v_5 (store (store ?v_4 i5 (select ?v_4 i1)) i1 (select ?v_4 i5))) (?v_8 (store (store ?v_3 i5 ?v_6) i1 ?v_7))) (let ((?v_9 (store (store ?v_8 i5 (select ?v_8 i1)) i1 (select ?v_8 i5)))) (not (= (store (store ?v_5 i4 (select ?v_5 i5)) i5 (select ?v_5 i4)) (store (store ?v_9 i5 (select ?v_9 i4)) i4 (select ?v_9 i5)))))))))))))
(check-sat)
(exit)
