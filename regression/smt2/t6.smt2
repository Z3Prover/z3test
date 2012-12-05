

(set-option :print-success 1)
(set-option :print-success true)
(set-option :print-success foo)
(set-option :print-success "true")

(declare-const x (Array))
(declare-const x Array)
(declare-const x (Array Int Int))

(define-sort Set (T) (Array T))
(define-sort Alias (T) Set)
(declare-const x (Set Int))

(declare-const a (_))
(declare-const a (_ BitVec))
(declare-const a (_ BitVec 10 20))
(declare-const a (_ BitVec 10))

(display #b0101)
(display #b01010)
(display (_ bv10 32))

(declare-const b (_ BitVec 10 foo))
(declare-const b (_ BitVec 10000000000000000000000))

(define-sort Aux (T1 T2) (Array (_)))
(define-sort Aux (T1 T2) )

(declare_datatypes T)

(declare-datatypes ((tuple (mk-tuple (first Int) (second Real)))))
(declare-datatypes (T1 T2) ((Pair (mk-pair (first T1) (second T2)))))

(declare-const p1 (Pair Int Bool))
(declare-const p2 (Pair Int Real))
(declare-const p3 (Pair Int Bool))
(assert (= (first p1) 10))
(assert (= (second p1) (second p3)))
(assert (= (first p2) (first p3)))
(assert (distinct(first p1) (first p3)))
(assert (> (first p2) 100))
(set-option :produce-models true)
(check-sat)
(get-model)
