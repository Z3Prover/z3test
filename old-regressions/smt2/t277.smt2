
; Copyright (c) 2015 Microsoft Corporation


(set-option :pp.max-depth 100)
(set-option :diagnostic-output-channel "stdout")

(declare-fun skoY () Real)
(declare-fun skoX () Real)
(declare-fun Pi () Real)
(assert (and (not (<= (* skoX 2000.) skoY)) (and (not (<= (* skoY (+ (* skoX (* skoX (* skoX (/ 1. 6.)))) (* skoY (+ (/ (- 1.) 2000.) (* skoY (+ (* skoX (/ (- 1.) 6.)) (* skoY (+ (/ 1. 12000.) (* skoY (+ (* skoX (/ 1. 120.)) (* skoY (+ (/ (- 1.) 240000.) (* skoY (+ (* skoX (/ (- 1.) 5040.)) (* skoY (+ (/ 1. 10080000.) (* skoY (+ (* skoX (/ 1. 362880.)) (* skoY (/ (- 1.) 725760000.)))))))))))))))))))) 0.)) (and (not (<= (* skoY (+ (/ (- 1.) 2000.) (* skoY (+ (* skoX (/ (- 1.) 6.)) (* skoY (+ (/ 1. 12000.) (* skoY (+ (* skoX (/ 1. 120.)) (* skoY (/ (- 1.) 240000.)))))))))) (* skoX (* skoX (* skoX (+ (/ (- 1.) 6.) (* skoX (* skoX (+ (/ 1. 120.) (* skoX (* skoX (/ (- 1.) 5040.)))))))))))) (and (not (<= (* skoY (+ (* skoX (* skoX (* skoX (/ 1. 6.)))) (* skoY (+ (/ (- 1.) 2000.) (* skoY (+ (* skoX (/ (- 1.) 6.)) (* skoY (+ (/ 1. 12000.) (* skoY (+ (* skoX (/ 1. 120.)) (* skoY (/ (- 1.) 240000.)))))))))))) 0.)) (and (not (<= Pi (/ 15707963. 5000000.))) (and (not (<= (/ 31415927. 10000000.) Pi)) (and (not (<= (* Pi (/ 1. 2.)) skoY)) (and (not (<= skoX 0.)) (and (not (<= skoY skoX)) (or (not (<= (* skoX 2000.) skoY)) (not (<= skoY (* skoX 2000.))))))))))))))

(apply (and-then simplify
                 (echo ":max-deg " arith-max-deg " :avg-deg " arith-avg-deg " :max-bw " arith-max-bw))
       :print false)

(reset)

(assert (> 1 0))

(apply (echo ":max-deg " arith-max-deg " :avg-deg " arith-avg-deg " :max-bw " arith-max-bw)
       :print false)

(reset)
(declare-const p Bool)
(assert p)

(apply (echo ":max-deg " arith-max-deg " :avg-deg " arith-avg-deg " :max-bw " arith-max-bw)
       :print false)
