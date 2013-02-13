
(define-sort S () (Array (Array Int Bool) (Array Bool Int)))
(declare-const A1 S)
(declare-const A2 S)
(declare-const B (Array Int Bool))
(declare-const C (Array Bool Int))
(declare-const p Bool)

(set-option :pp.max-depth 100)
(assert (= A1 A2))
(assert (= (select A1 (store B 10 p)) C))


(apply (then simplify elim_array simplify) :print-model-converter true)
