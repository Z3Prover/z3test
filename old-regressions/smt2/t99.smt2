


(declare-const x (_ BitVec 8))

(simplify (bvor x #b00110111))

(simplify (bvor #b00110111 x))

(simplify (bvor #b00111111 x))

(simplify (bvor #b00111000 x))

(declare-const b Bool)
(declare-const y (_ BitVec 8))

(simplify (bvor #b00111000 (ite b x y)))

(simplify (bvor #b11111000 x))

(simplify (bvor #b10101010 x))

(simplify (bvor #b01010101 x))

(simplify (bvand #b01010101 x))
