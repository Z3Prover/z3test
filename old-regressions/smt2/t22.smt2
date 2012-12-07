
(declare-fun p1 () Bool)
(declare-fun p2 () Bool)
(declare-fun p3 () Bool)
(declare-fun p4 () Bool)
(declare-fun a () Int)
(declare-fun b () Int)
(declare-fun c () Int)
(declare-fun d () Int)
(declare-fun e () Int)

(set-option :pp.flat-assoc false)

(simplify (implies p1 (implies p2 p3)))
(simplify (implies p3 (implies p2 p1)))

(simplify (ite p1 (ite (and (not p1) p2) a b) b) :ite-extra-rules true)
(simplify (ite p1 (ite p2 (and p1 p2) p3) p3) :ite-extra-rules true)





