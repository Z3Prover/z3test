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
(declare-fun a2 () (Array Index Element))
(declare-fun i1 () Index)
(declare-fun i2 () Index)
(declare-fun i3 () Index)
(declare-fun i4 () Index)
(assert (let ((?v_0 (store a2 i1 (select a1 i1))) (?v_1 (store a1 i1 (select a2 i1)))) (let ((?v_3 (store ?v_1 i2 (select ?v_0 i2))) (?v_2 (store ?v_0 i2 (select ?v_1 i2)))) (let ((?v_4 (store ?v_2 i3 (select ?v_3 i3))) (?v_5 (store ?v_3 i3 (select ?v_2 i3)))) (= (store ?v_5 i4 (select ?v_4 i4)) (store ?v_4 i4 (select ?v_5 i4)))))))
(assert (not (= a1 a2)))
(check-sat)
(exit)
