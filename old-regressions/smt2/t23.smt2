
; Copyright (c) 2015 Microsoft Corporation


(declare-fun p1 () Bool)
(declare-fun p2 () Bool)
(declare-fun p3 () Bool)
(declare-fun p4 () Bool)


(dbg-elim-and (and p1 p2 p1))
(dbg-elim-and (not (and (not p1) true p2)))
(dbg-elim-and (and p1 false p2))
(dbg-elim-and (and false p2))
(dbg-elim-and (not (and p1 true true p2)))
(dbg-elim-and (and p1 p2 p2 (not p1)))
(dbg-elim-and (and p1 (and (not p2) p1) p1))
(dbg-elim-and (and p1 (and p2 p1) p1))
