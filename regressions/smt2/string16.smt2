; noissue
; acknowledgements: Yunhui Zheng from IBM research

(set-option :smt.string_solver seq)
(declare-const s1 String)
(declare-const i1 Int)
(define-fun byte_2_int ((s String)) Int
  (ite (= s "\xF0") 240
  (ite (= s "\xF1") 241
  (ite (= s "\xF2") 242
  (ite (= s "\xF3") 243
  256
  )))))
(assert (= i1 (byte_2_int s1) ) )
(assert (= 1 (str.len s1)))
(assert (> i1 255) )
(assert (or (= s1 "\xF0") (= s1 "\xf1") (= s1 "\xF2") (= s1 "\xF3")))
(check-sat)
(reset)

(set-option :smt.string_solver z3str3)
(declare-const s1 String)
(declare-const i1 Int)
(define-fun byte_2_int ((s String)) Int
  (ite (= s "\xF0") 240
  (ite (= s "\xF1") 241
  (ite (= s "\xF2") 242
  (ite (= s "\xF3") 243
  256
  )))))
(assert (= i1 (byte_2_int s1) ) )
(assert (= 1 (str.len s1)))
(assert (> i1 255) )
(assert (or (= s1 "\xF0") (= s1 "\xf1") (= s1 "\xF2") (= s1 "\xF3")))
(check-sat)