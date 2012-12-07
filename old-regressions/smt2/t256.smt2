
(declare-const a Real)
(dbg-translator (+ a a))
(dbg-translator (+ a 2.0))
(dbg-translator (+ a (/ 1.0 2.0)))

(declare-const A (Array Int Int))
(dbg-translator (select (store A 0 20) 10))
(dbg-translator ((as const (Array Int Int)) 10))
(dbg-translator ((_ map (+ (Int Int) Int)) A A))

(declare-sort S 0)
(declare-const s1 S)
(declare-const s2 S)
(dbg-translator (= s1 s2))

(declare-datatypes (T) ((LispList nil (cons (car T) (cdr LispList)))))
(declare-const x (LispList Int))
(dbg-translator (cons 20 (cons 10 nil)))

(display (root-obj (- (^ x 2.0) 2.0) 1))
(dbg-translator (root-obj (- (^ x 2.0) 2.0) 1))

(set-option :pp.decimal true)
(display (root-obj (- (^ x 2.0) 2.0) 1))

(dbg-translator (root-obj (- (^ x 2.0) 2.0) 1))

(define-sort Double () (_ FP 11 53))
(declare-const a Double)

(dbg-translator (as NaN Double))
