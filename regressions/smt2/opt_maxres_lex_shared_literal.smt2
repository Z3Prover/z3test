; The first objective commits (not x3). The second objective has the soft
; literals x3 and (not x3); its optimum is 2, with x2 false.
(set-option :opt.priority lex)
(declare-const x2 Bool)
(declare-const x3 Bool)
(assert-soft (not x3) :weight 2 :id o0)
(assert-soft (or (not x2) x3) :weight 2 :id o1)
(assert-soft x3 :weight 2 :id o1)
(assert-soft (not x3) :weight 3 :id o1)
(check-sat)
(get-objectives)
(eval x2)
