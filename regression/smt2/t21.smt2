

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

(dbg-bool-rewriter (and p1 p2 p1))
(dbg-bool-rewriter (and p1 true p2))
(dbg-bool-rewriter (and p1 false p2))
(dbg-bool-rewriter (and false p2))
(dbg-bool-rewriter (and p1 true true p2))
(dbg-bool-rewriter (and p1 p2 p2 (not p1)))
(dbg-bool-rewriter (and p1 (and p2 p1) p1))
(dbg-bool-flat-rewriter (and p1 (and p2 p1) p1))

(dbg-bool-rewriter (or p1 p2 p1))
(dbg-bool-rewriter (or p1 true p2))
(dbg-bool-rewriter (or p1 false p2))
(dbg-bool-rewriter (or false p2))
(dbg-bool-rewriter (or p1 true true p2))
(dbg-bool-rewriter (or p1 false p2 false))
(dbg-bool-rewriter (or p1 p2 p2 (not p1)))
(dbg-bool-rewriter (or p1 (or p2 p1) p1))
(dbg-bool-flat-rewriter (or p1 (or p2 p1) p1))






