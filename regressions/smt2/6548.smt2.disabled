(set-option :model_validate true)
(set-info :status sat)

(set-logic ALL)
(set-option :produce-models true)
(declare-fun r () Real)
(declare-fun f () (_ FloatingPoint 8 24))
(assert (fp.gt f ((_ to_fp 8 24) roundNearestTiesToEven r)))
(check-sat)