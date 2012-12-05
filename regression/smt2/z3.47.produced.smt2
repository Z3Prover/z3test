sat
(model 
  (define-fun p () Int
    2)
  (define-fun x2!0 () Int
    1)
  (define-fun a () Int
    1)
  (define-fun n () Int
    1)
  (define-fun x1!1 () Int
    0)
  (define-fun p0 () Int
    8)
  (define-fun f!3 ((x!1 Int)) Int
    (ite (= x!1 1) 5
      2))
  (define-fun h ((x!1 Int)) Int
    0)
  (define-fun new-h ((x!1 Int)) Int
    (ite (= x!1 2) 1
    (ite (= x!1 5) 0
      (h x!1))))
  (define-fun k!2 ((x!1 Int)) Int
    (ite (>= x!1 1) 1 0))
  (define-fun f ((x!1 Int)) Int
    (f!3 (k!2 x!1)))
)
If p0 = p, then the problem is unsatisfiable. Why?
unsat
