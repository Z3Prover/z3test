
(set-option :pp.flat-assoc false)

(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(declare-const d Bool)
(declare-fun p (Bool Bool Bool) Bool)

(simplify (or a b (ite c (not a) (or b d)))
          :local-ctx true)

