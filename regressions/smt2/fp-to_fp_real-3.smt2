(set-info :status unsat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

(declare-const X (_ FloatingPoint 5 11))
(declare-const R Real)

(assert (= X ((_ to_fp 5 11) RTZ R)))
(assert (= R (fp.to_real X)))

(check-sat)
(exit)
