
; Copyright (c) 2015 Microsoft Corporation


(simplify (+ (^ 2.0 (/ 1.0 101.0))
             (^ 2.0 (/ 1.0 102.0)))
          :max-degree 1000
          :timeout 200)

(simplify (+ (^ 2.0 (/ 1.0 5.0))
             (^ 2.0 (/ 1.0 7.0)))
          :max-degree 1000)

(simplify (+ 2.0 3.0))
