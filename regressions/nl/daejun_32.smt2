; 2^32
(define-fun pow32 () Int 4294967296)

; modulo 2^32
(define-fun chop ((x Int)) Int (mod x pow32))

; arithemetic modulo 2^32
(define-fun add ((x Int) (y Int)) Int (chop (+ x y)))
(define-fun mul ((x Int) (y Int)) Int (chop (* x y)))

; a 32-bit unsigned integer
(declare-fun a () Int)
(assert (and (<= 0 a) (< a pow32)))

; byte-array of `a`
(declare-fun a03 () Int) ; MSB (byte) of `a`
(declare-fun a02 () Int)
(declare-fun a01 () Int)
(declare-fun a00 () Int) ; LSB (byte) of `a`

(declare-fun b03 () Int)
(declare-fun b02 () Int)
(declare-fun b01 () Int)
(declare-fun b00 () Int)

(assert (= b00 a))
(assert (= b01 (div b00 256)))
(assert (= b02 (div b01 256)))
(assert (= b03 (div b02 256)))

(assert (= a00 (mod b00 256)))
(assert (= a01 (mod b01 256)))
(assert (= a02 (mod b02 256)))
(assert (= a03 (mod b03 256)))

; reconstruction of `a` from its byte-array, `a03`...`a00`
(declare-fun aprime () Int)
(assert (= aprime
  (add (mul
  (add (mul
  (add (mul a03  256)
            a02) 256)
            a01) 256)
            a00)
))

; a = a'
(assert (not (= a aprime)))
(check-sat)
;(get-model)
