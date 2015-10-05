
; Copyright (c) 2015 Microsoft Corporation
(declare-const a Int)
(declare-fun   f (Int Int) Int)
(declare-fun   g (Int) Int)

(set-option :pp-min-alias-size 1)
(set-option :pp.max-depth 1)

(display (let ((x1 (f (g a) (g a))))
         (let ((x2 (f x1 x1)))
         (let ((x3 (f x1 x2)))
         (let ((x4 (f x2 x1)))
         (f x3 x4))))))
