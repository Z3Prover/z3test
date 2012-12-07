
(declare-const a (_ BitVec 32))
(declare-const a (_ BitVec 16))
;; (declare-const a (_ FP 11 53))

;; (display (as a (_ BitVec 16)))
;; (display (as a (_ FP 11 53)))

;; (simplify ((_ asFloat 11 53) roundNearestTiesToEven 0.5))
;; (simplify ((_ asFloat 11 53) roundNearestTiesToEven 0.5 2))
;; (simplify ((_ asFloat 11 53) roundNearestTiesToEven 0.5 0))
(simplify ((_ asFloat 11 53) roundNearestTiesToEven 2.0 0))
(simplify ((_ asFloat 11 53) roundNearestTiesToEven 1.1 (- 2)))
