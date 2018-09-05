; 2^256
(define-fun pow256 () Int 115792089237316195423570985008687907853269984665640564039457584007913129639936)

; modulo 2^256
(define-fun chop ((x Int)) Int (mod x pow256))

; arithemetic modulo 2^256
(define-fun add ((x Int) (y Int)) Int (chop (+ x y)))
(define-fun mul ((x Int) (y Int)) Int (chop (* x y)))

; a 256-bit unsigned integer
(declare-fun a () Int)
(assert (and (<= 0 a) (< a pow256)))

; byte-array of `a`
(declare-fun a31 () Int) ; MSB (byte) of `a`
(declare-fun a30 () Int)
(declare-fun a29 () Int)
(declare-fun a28 () Int)
(declare-fun a27 () Int)
(declare-fun a26 () Int)
(declare-fun a25 () Int)
(declare-fun a24 () Int)
(declare-fun a23 () Int)
(declare-fun a22 () Int)
(declare-fun a21 () Int)
(declare-fun a20 () Int)
(declare-fun a19 () Int)
(declare-fun a18 () Int)
(declare-fun a17 () Int)
(declare-fun a16 () Int)
(declare-fun a15 () Int)
(declare-fun a14 () Int)
(declare-fun a13 () Int)
(declare-fun a12 () Int)
(declare-fun a11 () Int)
(declare-fun a10 () Int)
(declare-fun a09 () Int)
(declare-fun a08 () Int)
(declare-fun a07 () Int)
(declare-fun a06 () Int)
(declare-fun a05 () Int)
(declare-fun a04 () Int)
(declare-fun a03 () Int)
(declare-fun a02 () Int)
(declare-fun a01 () Int)
(declare-fun a00 () Int) ; LSB (byte) of `a`

(declare-fun b31 () Int)
(declare-fun b30 () Int)
(declare-fun b29 () Int)
(declare-fun b28 () Int)
(declare-fun b27 () Int)
(declare-fun b26 () Int)
(declare-fun b25 () Int)
(declare-fun b24 () Int)
(declare-fun b23 () Int)
(declare-fun b22 () Int)
(declare-fun b21 () Int)
(declare-fun b20 () Int)
(declare-fun b19 () Int)
(declare-fun b18 () Int)
(declare-fun b17 () Int)
(declare-fun b16 () Int)
(declare-fun b15 () Int)
(declare-fun b14 () Int)
(declare-fun b13 () Int)
(declare-fun b12 () Int)
(declare-fun b11 () Int)
(declare-fun b10 () Int)
(declare-fun b09 () Int)
(declare-fun b08 () Int)
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
(assert (= b08 (div b07 256)))
(assert (= b09 (div b08 256)))
(assert (= b10 (div b09 256)))
(assert (= b11 (div b10 256)))
(assert (= b12 (div b11 256)))
(assert (= b13 (div b12 256)))
(assert (= b14 (div b13 256)))
(assert (= b15 (div b14 256)))
(assert (= b16 (div b15 256)))
(assert (= b17 (div b16 256)))
(assert (= b18 (div b17 256)))
(assert (= b19 (div b18 256)))
(assert (= b20 (div b19 256)))
(assert (= b21 (div b20 256)))
(assert (= b22 (div b21 256)))
(assert (= b23 (div b22 256)))
(assert (= b24 (div b23 256)))
(assert (= b25 (div b24 256)))
(assert (= b26 (div b25 256)))
(assert (= b27 (div b26 256)))
(assert (= b28 (div b27 256)))
(assert (= b29 (div b28 256)))
(assert (= b30 (div b29 256)))
(assert (= b31 (div b30 256)))

(assert (= a00 (mod b00 256)))
(assert (= a01 (mod b01 256)))
(assert (= a02 (mod b02 256)))
(assert (= a03 (mod b03 256)))
(assert (= a04 (mod b04 256)))
(assert (= a05 (mod b05 256)))
(assert (= a06 (mod b06 256)))
(assert (= a07 (mod b07 256)))
(assert (= a08 (mod b08 256)))
(assert (= a09 (mod b09 256)))
(assert (= a10 (mod b10 256)))
(assert (= a11 (mod b11 256)))
(assert (= a12 (mod b12 256)))
(assert (= a13 (mod b13 256)))
(assert (= a14 (mod b14 256)))
(assert (= a15 (mod b15 256)))
(assert (= a16 (mod b16 256)))
(assert (= a17 (mod b17 256)))
(assert (= a18 (mod b18 256)))
(assert (= a19 (mod b19 256)))
(assert (= a20 (mod b20 256)))
(assert (= a21 (mod b21 256)))
(assert (= a22 (mod b22 256)))
(assert (= a23 (mod b23 256)))
(assert (= a24 (mod b24 256)))
(assert (= a25 (mod b25 256)))
(assert (= a26 (mod b26 256)))
(assert (= a27 (mod b27 256)))
(assert (= a28 (mod b28 256)))
(assert (= a29 (mod b29 256)))
(assert (= a30 (mod b30 256)))
(assert (= a31 (mod b31 256)))

; reconstruction of `a` from its byte-array, `a31`...`a00`
(declare-fun aprime () Int)
(assert (= aprime
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul
  (add (mul a31  256)
            a30) 256)
            a29) 256)
            a28) 256)
            a27) 256)
            a26) 256)
            a25) 256)
            a24) 256)
            a23) 256)
            a22) 256)
            a21) 256)
            a20) 256)
            a19) 256)
            a18) 256)
            a17) 256)
            a16) 256)
            a15) 256)
            a14) 256)
            a13) 256)
            a12) 256)
            a11) 256)
            a10) 256)
            a09) 256)
            a08) 256)
            a07) 256)
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
