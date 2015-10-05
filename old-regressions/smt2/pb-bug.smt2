
; Copyright (c) 2015 Microsoft Corporation
(set-option :auto-config true)
(set-logic QF_LIA)

; initial variable declarations

(declare-fun var1 () Int)
(assert     (and
      (>= var1 0)
      (<= var1 7)
    ))
(declare-fun var1_post () Int)
(assert     (and
      (>= var1_post 0)
      (<= var1_post 7)
    ))
(declare-fun var2 () Int)
(assert     (and
      (>= var2 0)
      (<= var2 4)
    ))
(declare-fun var2_post () Int)
(assert     (and
      (>= var2_post 0)
      (<= var2_post 4)
    ))
(declare-fun var3 () Int)
(assert     (and
      (>= var3 0)
      (<= var3 4)
    ))
(declare-fun var3_post () Int)
(assert     (and
      (>= var3_post 0)
      (<= var3_post 4)
    ))
(declare-fun var4 () Int)
(assert     (and
      (>= var4 0)
      (<= var4 1)
    ))
(declare-fun var4_post () Int)
(assert     (and
      (>= var4_post 0)
      (<= var4_post 1)
    ))

(assert (not
(and
  (=
    var1
    7
  )
  (=
    var2
    0
  )
  (=
    var1_post
    2
  )
  (=
    var4_post
    1
  )
  (=
    var2_post
      var2
  )
  (=
    var3_post
      var3
  )
)
))

(assert
  (and
    (=
      var1
      0
    )
    (=
	var2
      0
    ) 
    (=
      var1_post
      2
    )
    (=
      var4_post
      1
    )
    (=
      var2_post
	var2
    )
    (=
      var3_post
	var3
    )

  )
)

; start check
(check-sat)
(get-model)
(eval     (and
      (>= var1 0)
      (<= var1 7)
    ))
(eval     (and
      (>= var1_post 0)
      (<= var1_post 7)
    ))
(eval     (and
      (>= var2 0)
      (<= var2 4)
    ))
(eval     (and
      (>= var2_post 0)
      (<= var2_post 4)
    ))
(eval     (and
      (>= var3 0)
      (<= var3 4)
    ))
(eval     (and
      (>= var3_post 0)
      (<= var3_post 4)
    ))
(eval     (and
      (>= var4 0)
      (<= var4 1)
    ))
(eval     (and
      (>= var4_post 0)
      (<= var4_post 1)
    ))

(eval (not
(and
  (=
    var1
    7
  )
  (=
    var2
    0
  )
  (=
    var1_post
    2
  )
  (=
    var4_post
    1
  )
  (=
    var2_post
      var2
  )
  (=
    var3_post
      var3
  )
)
))


(eval 
  (and
    (=
      var1
      0
    )
    (=
	var2
      0
    ) 
    (=
      var1_post
      2
    )
    (=
      var4_post
      1
    )
    (=
      var2_post
	var2
    )
    (=
      var3_post
	var3
    )

  )
)


