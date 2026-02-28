; Disclaimer: this is a mostly AI generated test file used for near fuzzing purposes.

; Comprehensive test combining various interesting subterm scenarios

; First, let's define a few different datatypes to test various structures

; Simple natural numbers
(declare-datatype Nat
  ((zero)
   (succ (prev Nat)))
  :subterm is-nat-subterm)

; Binary trees
(declare-datatype Tree
  (empty
   (node (value Int) (nleft Tree) (nright Tree)))
  :subterm is-tree-subterm)

; Expressions
(declare-datatype Expr
  ((constant (val Int))
   (add_e (aleft Expr) (aright Expr))
   (mult_e (mleft Expr) (mright Expr)))
  :subterm is-expr-subterm)

; Declare constants for all types
(declare-const n0 Nat)
(declare-const n1 Nat)
(declare-const n2 Nat)

(declare-const t0 Tree)
(declare-const t1 Tree)
(declare-const t2 Tree)
(declare-const t3 Tree)

(declare-const e0 Expr)
(declare-const e1 Expr)
(declare-const e2 Expr)
(declare-const e3 Expr)
(push)


; TEST SET 1: NATURAL NUMBERS
; Test 1.1: Basic subterm chain in Nat
(assert (= n2 (succ (succ (succ zero)))))
(assert (is-nat-subterm n1 n2))
(assert (is-nat-subterm n0 n1))

(assert (distinct n0 n1 n2))  ; All different
(check-sat)
(get-model)

(pop)
(push)

; Test 1.2: All possible subterms of a Nat
(assert (= n2 (succ (succ zero))))
(assert (is-nat-subterm n1 n2))
(assert (not (= n1 n2)))  ; Proper subterm

; n1 should be either (succ zero) or zero
(assert (or (= n1 (succ zero)) (= n1 zero)))
(check-sat)
(get-model)


; TEST SET 2: TREES
(pop)
(push)

; Test 2.1: Complex tree with various subterm relationships
(assert (= t3 
         (node 10
               (node 5 
                     (node 3 empty empty)
                     (node 7 empty empty))
               (node 15
                     empty
                     (node 20 empty empty)))))

; Find multiple different subterms
(assert (is-tree-subterm t0 t3))
(assert (is-tree-subterm t1 t3))
(assert (is-tree-subterm t2 t3))

(assert (distinct t0 t1 t2))
(assert (not (= t0 t3)))
(assert (not (= t1 t3)))
(assert (not (= t2 t3)))

(check-sat)
(get-model)

(pop)
(push)

; Test 2.2: Nested subterm relationships in trees
(assert (= t3 
         (node 100
               (node 50 empty empty)
               (node 200 empty empty))))

(assert (is-tree-subterm t1 t3))
(assert (is-tree-subterm t2 t1))

; t2 should be a subterm of a subterm of t3
(assert (distinct t1 t2 t3))
(check-sat)
(get-model)


; TEST SET 3: EXPRESSIONS
(pop)
(push)

; Test 3.1: Arithmetic expression trees
(assert (= e3 (add_e (mult_e (constant 2) (constant 3)) (add_e (constant 4) (constant 5)))))

; Find a chain of subterms
(assert (is-expr-subterm e1 e3))
(assert (is-expr-subterm e2 e1))

(assert (distinct e1 e2 e3))
(check-sat)
(get-model)

(pop)
(push)

; Test 3.2: Finding leaf subterms (constants) in expressions
(assert (= e3 (mult_e (add_e (constant 10) (constant 20)) (constant 30))))
(assert (is-expr-subterm e0 e3))

; Try to match e0 to one of the leaf constants
(assert (or 
    (= e0 (constant 10))
    (= e0 (constant 20)) 
    (= e0 (constant 30))
    (= e0 (add_e (constant 10) (constant 20)))
    (= e0 (mult_e (add_e (constant 10) (constant 20)) (constant 30)))))

(check-sat)
(get-model)


; TEST SET 4: CROSS-DATATYPE CONSTRAINT INTERACTIONS (checking independence)
(pop)
(push)

; Test that constraints on different datatypes are independent
(assert (= n1 (succ (succ zero))))
(assert (= t1 (node 42 empty empty)))
(assert (= e1 (add_e (constant 1) (constant 2))))

(assert (is-nat-subterm n0 n1))
(assert (is-tree-subterm t0 t1))
(assert (is-expr-subterm e0 e1))

; Verify they work independently
(assert (not (= n0 n1)))
(assert (not (= t0 t1)))  
(assert (not (= e0 e1)))

(check-sat)
(get-model)


; TEST SET 5: LOGICAL COMBINATIONS
(pop)
(push)

; Test 5.1: Complex combination with existential constraints
(declare-const big_expr Expr)
(declare-const sub_expr1 Expr)
(declare-const sub_expr2 Expr)
(declare-const sub_expr3 Expr)

(assert (= big_expr 
         (mult_e 
           (add_e (constant 1) (constant 2))
           (mult_e (constant 3) (add_e (constant 4) (constant 5))))))

; Find three distinct subterms that are not the root
(assert (is-expr-subterm sub_expr1 big_expr))
(assert (is-expr-subterm sub_expr2 big_expr))
(assert (is-expr-subterm sub_expr3 big_expr))

(assert (distinct sub_expr1 sub_expr2 sub_expr3))
(assert (not (= sub_expr1 big_expr)))
(assert (not (= sub_expr2 big_expr)))
(assert (not (= sub_expr3 big_expr)))

(check-sat)
(get-model)

(pop)
(push)

; Test 5.2: Transitivity verification
(declare-const x1 Expr)
(declare-const x2 Expr)
(declare-const x3 Expr)

(assert (is-expr-subterm x1 x2))
(assert (is-expr-subterm x2 x3))
; Should verify x1 is subterm of x3
(assert (not (is-expr-subterm x1 x3)))
; Expected: UNSAT
(check-sat)
(get-model)

(pop)
(push)

; Test 5.3: Acyclicity verification  
(declare-const y1 Expr)
(declare-const y2 Expr)

(assert (is-expr-subterm y1 y2))
(assert (is-expr-subterm y2 y1))
; Expected: UNSAT
(check-sat)
(get-model)

(pop)
(push)

; Test 5.4: Subterm of leaf/atomic element
(declare-const leaf1 Expr)
(declare-const leaf2 Expr)

(assert (= leaf1 (constant 42)))
(assert (is-expr-subterm leaf2 leaf1))
; leaf2 should equal leaf1 since constants have no proper subterms
(assert (not (= leaf2 leaf1)))
; Expected: UNSAT
(check-sat)

; FINAL TEST: Performance/Complexity test with a large structure
(pop)
(push)

(declare-const huge_tree Tree)
(declare-const sub_huge1 Tree)
(declare-const sub_huge2 Tree)

; Create a moderately complex tree
(assert (= huge_tree
         (node 1
           (node 2 
             (node 3 
               (node 4 empty empty)
               (node 5 empty empty))
             (node 6 
               (node 7 empty empty)
               (node 8 empty empty)))
           (node 9
             (node 10
               (node 11 empty empty)
               (node 12 empty empty))
             (node 13 
               (node 14 empty empty)
               (node 15 empty empty))))))

(assert (is-tree-subterm sub_huge1 huge_tree))
(assert (is-tree-subterm sub_huge2 sub_huge1))
(assert (distinct sub_huge1 sub_huge2 huge_tree))

(check-sat)
(get-model)