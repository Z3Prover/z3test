
; Copyright (c) 2015 Microsoft Corporation


(define-sort Word () (_ BitVec 32))
(declare-fun Sel (Word Word) Word)

(simplify
 (forall ((f Word) (x Word))
         (!
          (=> (bvsgt f (_ bv0 32)) (bvsgt (Sel x f) (_ bv100000 32)))
          :pattern (Sel x f)
          :qid axiom_1_1)))

(simplify
 (forall ((f Word) (x Word))
         (!
          (=> (bvsgt f (_ bv0 32)) (bvsgt (Sel x f) (_ bv100000 32)))
          :qid axiom_1_1
          :pattern (Sel x f)
          ))) 

(simplify
 (forall ((f Word) (x Word))
         (!
          (=> (bvsgt f (_ bv0 32)) (bvsgt (Sel x f) (_ bv100000 32)))
          :qid axiom_1_1
          :skolemid foo
          :pattern (Sel x f)
          ))) 

(simplify
 (forall ((f Word) (x Word))
         (!
          (=> (bvsgt f (_ bv0 32)) (bvsgt (Sel x f) (_ bv100000 32)))
          :qid axiom_1_1
          :pattern (Sel x (Sel x f))
          :skolemid foo
          :pattern (Sel x f)
          ))) 

