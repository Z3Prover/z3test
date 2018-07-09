; 2^64
(define-fun pow64 () Int 18446744073709551616)

; modulo 2^64
(define-fun chop ((x Int)) Int (mod x pow64))

; arithemetic modulo 2^64
(define-fun add ((x Int) (y Int)) Int (chop (+ x y)))
(define-fun mul ((x Int) (y Int)) Int (chop (* x y)))

; a 64-bit unsigned integer
(declare-fun a () Int)
(assert (and (<= 0 a) (< a pow64)))

; byte-array of `a`
(declare-fun a07 () Int) ; MSB (byte) of `a`
(declare-fun a06 () Int)
(declare-fun a05 () Int)
(declare-fun a04 () Int)
(declare-fun a03 () Int)
(declare-fun a02 () Int)
(declare-fun a01 () Int)
(declare-fun a00 () Int) ; LSB (byte) of `a`

(declare-fun b07 () Int)
(declare-fun b06 () Int)
(declare-fun b05 () Int)
(declare-fun b04 () Int)
(declare-fun b03 () Int)
(declare-fun b02 () Int)
(declare-fun b01 () Int)
(declare-fun b00 () Int)

(assert (= b00 a))
(assert (= b01 (div b00 256)))
(assert (= b02 (div b01 256)))
(assert (= b03 (div b02 256)))
(assert (= b04 (div b03 256)))
(assert (= b05 (div b04 256)))
(assert (= b06 (div b05 256)))
(assert (= b07 (div b06 256)))

(assert (= a00 (mod b00 256)))
(assert (= a01 (mod b01 256)))
(assert (= a02 (mod b02 256)))
(assert (= a03 (mod b03 256)))
(assert (= a04 (mod b04 256)))
(assert (= a05 (mod b05 256)))
(assert (= a06 (mod b06 256)))
(assert (= a07 (mod b07 256)))

; reconstruction of `a` from its byte-array, `a07`...`a00`
(declare-fun aprime () Int)
(assert (= aprime
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul a07  256)
            a06) 256)
            a05) 256)
            a04) 256)
            a03) 256)
            a02) 256)
            a01) 256)
            a00)
))

; a = a'
(assert (not (= a aprime)))
(check-sat)
;(get-model)
