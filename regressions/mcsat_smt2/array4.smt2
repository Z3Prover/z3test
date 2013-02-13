

(define-sort S () (Array Int (Array Bool Int (Array Int Int Int Real))))
(declare-const A1 S)
(declare-const A2 S)
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const B (Array Int Int Int Real))

(set-option :pp.max-depth 100)

(assert (= A1 (store A1 a (store (select A2 b) true c B))))

(apply (then simplify elim_array simplify) :print-model-converter true)

