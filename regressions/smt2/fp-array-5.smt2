;; Copyright (c) 2015 Microsoft Corporation

(set-info :source |Handcrafted by Christoph M. Wintersteiger (cwinter@microsoft.com).|)
(set-info :status sat)
(set-option :model_validate true)
(set-option :smt.relevancy 0)
(set-option :rewriter.hi_fp_unspecified false)

(declare-fun A () (Array (_ FloatingPoint 8 24) (_ FloatingPoint 11 53)))

(assert (fp.eq
            (select A (_ +oo 8 24))
            (select A (_ -oo 8 24))))

(assert (not (= (select A (_ +oo 8 24)) (_ +zero 11 53))))

(declare-fun B () (Array Int (_ FloatingPoint 11 53)))
(assert (not (= (select B 0) (select B 1))))

(declare-fun C () (Array (_ FloatingPoint 11 53) Int))
(assert (not (= (select C (_ +oo 11 53)) 2)))
(assert (not (= (select C (_ -oo 11 53)) 2)))

(check-sat-using (then simplify fpa2bv smt))
(get-model)
(get-value ((select A (_ +oo 8 24))))
(get-value ((select B 0)))
(get-value ((select B 1)))
(get-value (C))

(check-sat-using smt)
(get-model)
(get-value ((select A (_ +oo 8 24))))
(get-value ((select B 0)))
(get-value ((select B 1)))
(get-value (C))

(exit)
 
