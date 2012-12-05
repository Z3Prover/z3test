

(set-option :produce-models true)
(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)

(assert (or a (and b c)))

(apply (and-then (! simplify :elim-and true) tseitin-cnf))
(echo "----")

(assert (or (and a b) (and a c) (and b c)))

(apply (and-then (! simplify :elim-and true) tseitin-cnf))

(reset)
(echo "----")

(set-option :produce-models true)
(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(declare-const d Bool)

(assert (ite c 
             (ite d (or a (and b c))
                  a)
             b))

(apply (and-then (! simplify :elim-and true) tseitin-cnf) :print-model-converter true)

(reset)
(echo "----")
(set-option :produce-models true)
(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(declare-const d Bool)
(assert (= a (or (and b c) (and a c) (and a d))))
(apply (and-then (! simplify :elim-and true) tseitin-cnf) :print-model-converter true)

(reset)
(echo "----")
(set-option :produce-models true)
(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(declare-const d Bool)

(assert (or d (xor a b c)))
(apply (and-then (! simplify :elim-and true) tseitin-cnf) :print-model-converter true)







