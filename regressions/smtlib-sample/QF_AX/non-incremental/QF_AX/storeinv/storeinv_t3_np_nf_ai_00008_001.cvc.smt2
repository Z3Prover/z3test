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
(declare-fun i5 () Index)
(declare-fun i6 () Index)
(declare-fun i7 () Index)
(declare-fun i8 () Index)
(assert (let ((?v_0 (store a2 i1 (select a1 i1))) (?v_1 (store a1 i1 (select a2 i1)))) (let ((?v_3 (store ?v_1 i2 (select ?v_0 i2))) (?v_2 (store ?v_0 i2 (select ?v_1 i2)))) (let ((?v_4 (store ?v_2 i3 (select ?v_3 i3))) (?v_5 (store ?v_3 i3 (select ?v_2 i3)))) (let ((?v_7 (store ?v_5 i4 (select ?v_4 i4))) (?v_6 (store ?v_4 i4 (select ?v_5 i4)))) (let ((?v_8 (store ?v_6 i5 (select ?v_7 i5))) (?v_9 (store ?v_7 i5 (select ?v_6 i5)))) (let ((?v_11 (store ?v_9 i6 (select ?v_8 i6))) (?v_10 (store ?v_8 i6 (select ?v_9 i6)))) (let ((?v_12 (store ?v_10 i7 (select ?v_11 i7))) (?v_13 (store ?v_11 i7 (select ?v_10 i7)))) (= (store ?v_13 i8 (select ?v_12 i8)) (store ?v_12 i8 (select ?v_13 i8)))))))))))
(assert (not (= a1 a2)))
(check-sat)
(exit)
