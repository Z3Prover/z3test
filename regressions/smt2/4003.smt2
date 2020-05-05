(set-option :proof true)
(set-option :smt.arith.random_initial_value true)
(set-option :rewriter.eq2ineq true)
(set-option :smt.random_seed 1)
(set-option :smt.arith.solver 2)
(declare-const v0 Bool)
(declare-const v1 Bool)
(declare-const v2 Bool)
(declare-const i1 Int)
(declare-const i2 Int)
(declare-const Str2 String)
(declare-const Str7 String)
(declare-const Str8 String)
(declare-const Str11 String)
(declare-const Str16 String)
(declare-const v10 Bool)
(assert (>= (str.len Str7) i2))
(check-sat-assuming ((! (or (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (= Str16 Str2 Str11) (and (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) v2 v1 v10 (xor v10 v1 true) v0 (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (xor v10 v1 true))) :named IP_330) (! (or (and (and (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) v2 v1 v10 (xor v10 v1 true) v0 (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (xor v10 v1 true)) (and (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) v2 v1 v10 (xor v10 v1 true) v0 (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (xor v10 v1 true)) (xor v10 v1 true) v10 (= "" Str8 "") v10) (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (<= 0 0)) :named IP_394)))
(check-sat-assuming ((! (or (and v0 (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (= "" Str8 "") (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) true) v10 (and v0 (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (= "" Str8 "") (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) true)) :named IP_71) (! (or (and v0 (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (= "" Str8 "") (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) true) v10 (xor v10 v1 true)) :named IP_219)))
(check-sat-assuming ((! (or v1 v10 (and (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) v2 v1 v10 (xor v10 v1 true) v0 (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (xor v10 v1 true))) :named IP_54) (! (or (<= 0 0) (<= 0 0) (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2))) :named IP_310)))
(check-sat-assuming ((! (or (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) v1 (distinct (+ 0 i2 47 i1 47) 47)) :named IP_20) (! (or v1 (and (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) v2 v1 v10 (xor v10 v1 true) v0 (>= (+ 0 i2 47 i1 47) (div (+ 0 i2 47 i1 47) i2)) (xor v10 v1 true)) (<= 0 0)) :named IP_387)))
(check-sat)