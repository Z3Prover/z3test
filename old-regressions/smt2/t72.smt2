

(set-option :pp.flat-assoc false)
(set-option :pp.max-depth 100)

(declare-const p1 Bool)
(declare-const p2 Bool)
(declare-const p3 Bool)
(declare-const p4 Bool)

(simplify (or p1 (and p2 p1))
          :elim-and true
          :local-ctx true)

(simplify (or p1 (and p2 p1) p3)
          :elim-and true
          :local-ctx true)

(simplify (or p1 (and p2 p1) (and p3 p2) p3)
          :elim-and true
          :local-ctx true)

(simplify (or p1 (and p2 p1) (and p3 p2) p3 p4) 
          :elim-and true
          :local-ctx true)

(simplify (or p1 (and (or p2 p3) (not p1)))
          :elim-and true
          :local-ctx true)


(simplify (or p1 p2 (and (not p1) (not p2)))
          :elim-and true
          :local-ctx true)

(simplify (or p1 p2 (and (not p1) (not p2) p3))
          :elim-and true
          :local-ctx true)

(simplify (or p1 p2 (and (not p1) (not p2) p3) (and p1 p2))
          :elim-and true
          :local-ctx true)

(simplify (or (not p1) (and p1 p2))
          :elim-and true
          :local-ctx true)

(simplify (or (not p1) (and (not p1) p2))
          :elim-and true
          :local-ctx true)

(simplify (or (not p1) (and (not p1) p2) (and p3 (not p1)))
          :elim-and true
          :local-ctx true)

(simplify (or (not p1) (and (not p1) p2) (and p3 (not p1)) (and p1 p2))
          :elim-and true
          :local-ctx true)

(simplify (or p1 (and (or p2 p3 (and (not p1) p4)) (not p1)))
          :elim-and true
          :local-ctx true)
