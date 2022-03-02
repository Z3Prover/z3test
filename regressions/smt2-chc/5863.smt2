(set-logic HORN)

(set-option :fp.xform.inline_eager false)

(declare-fun P (Int  Int  Int) Bool)
(declare-fun Q (Int  Int  Int  Int) Bool)

(assert (forall ((a Int) (b Int) (c Int) (d Int))
  (=> (and (Q a b c d)
           (<= (+ 1 d) a)
           (<= (+ 1 c) b))
      (P a b c))))

(assert (forall ((a Int) (b Int) (c Int) (d Int))
  (=> (>= a 1) (Q a b c d))))

(exit)
