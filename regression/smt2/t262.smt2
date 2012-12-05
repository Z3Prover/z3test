(declare-sort Obj)
(set-option :produce-models true)
(define-sort ObjSet () (Array Obj Bool))

(declare-const emptyObjSet ObjSet)
(define-fun member-of ((e Obj) (x ObjSet)) Bool (select x e))
(declare-fun card (ObjSet) Int)
(assert (forall ((x ObjSet)) (! (iff (= x emptyObjSet) (= (card x) 0)) :pattern (card x)) ))
  
(declare-const Object_alloc      ObjSet)
(declare-const Thread_t          Obj)

(assert
  (forall ((x Obj))
    (implies (not (member-of x Object_alloc)) (and
      (not (= Thread_t x))
    ))
  )
)

(check-sat)
(get-info :reason-unknown)
(get-model)
