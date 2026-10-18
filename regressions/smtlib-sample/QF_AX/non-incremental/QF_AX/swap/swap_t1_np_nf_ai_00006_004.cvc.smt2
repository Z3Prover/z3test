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
(declare-fun i1 () Index)
(declare-fun i2 () Index)
(declare-fun i3 () Index)
(declare-fun i4 () Index)
(declare-fun i5 () Index)
(assert (let ((?v_7 (select a1 i1)) (?v_8 (select a1 i4))) (let ((?v_0 (store (store a1 i1 ?v_8) i4 ?v_7))) (let ((?v_1 (store (store ?v_0 i3 (select ?v_0 i1)) i1 (select ?v_0 i3)))) (let ((?v_2 (store (store ?v_1 i1 (select ?v_1 i4)) i4 (select ?v_1 i1)))) (let ((?v_3 (select ?v_2 i2))) (let ((?v_4 (store (store ?v_2 i2 ?v_3) i2 ?v_3))) (let ((?v_5 (store (store ?v_4 i3 (select ?v_4 i5)) i5 (select ?v_4 i3)))) (let ((?v_6 (select ?v_5 i4)) (?v_9 (store (store a1 i4 ?v_7) i1 ?v_8))) (let ((?v_10 (store (store ?v_9 i3 (select ?v_9 i1)) i1 (select ?v_9 i3)))) (let ((?v_11 (store (store ?v_10 i1 (select ?v_10 i4)) i4 (select ?v_10 i1)))) (let ((?v_12 (select ?v_11 i2))) (let ((?v_13 (store (store ?v_11 i2 ?v_12) i2 ?v_12))) (let ((?v_14 (store (store ?v_13 i5 (select ?v_13 i3)) i3 (select ?v_13 i5)))) (let ((?v_15 (select ?v_14 i4))) (not (= (store (store ?v_5 i4 ?v_6) i4 ?v_6) (store (store ?v_14 i4 ?v_15) i4 ?v_15))))))))))))))))))
(check-sat)
(exit)
