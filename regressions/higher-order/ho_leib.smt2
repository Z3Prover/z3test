C:\Users\nbjorner\.copilot\session-state\788ef8ed-b371-4309-a7ea-0a2fcf9b7b3d\files>type *.smt2

leibniz_default.smt2


; Leibniz equality symmetry, lambdas as arrays. Negation of LCL579^1.
(declare-sort I 0)
(declare-const x I)
(declare-const y I)
(declare-const q (Array I Bool))
; hypothesis: forall P. P@x => P@y
(assert (forall ((P (Array I Bool))) (=> (select P x) (select P y))))
; negated conclusion witness q: q@y and not q@x
(assert (select q y))
(assert (not (select q x)))
(check-sat)

(reset)


(declare-sort I 0)
(declare-const x I)
(declare-const y I)
(declare-const q (Array I Bool))
(assert (forall ((P (Array I Bool))) (! (=> (select P x) (select P y)) :pattern ((select P x)))))
(assert (select q y))
(assert (not (select q x)))
; the missing higher-order witness, supplied as a ground array term:
(declare-const w (Array I Bool))
(assert (forall ((z I)) (= (select w z) (=> (select q z) (select q x)))))
(check-sat)