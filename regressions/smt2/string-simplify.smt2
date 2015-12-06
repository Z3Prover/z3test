(simplify (str.++ "a" "b"""))        ; "a""b"
(simplify (str.prefixof "a" "b"))      ; false
(simplify (str.prefixof "ab" "abc"))   ; true
(simplify (str.suffixof "ab" "abc"))   ; false
(simplify (str.suffixof "bc" "abc"))   ; true
(simplify (str.suffixof "abc" "abc"))  ; true
(simplify (str.prefixof "" ""))        ; true
(simplify (str.prefixof "" "a"))       ; true
(simplify (str.len ""))              ; 0
(simplify (str.len "a"))             ; 1
(simplify (str.len "ab"))            ; 2
(simplify (str.substr "abc" 1 1))    ; "b"
(simplify (str.substr "abc" 1 2))    ; "bc"
(simplify (str.substr "abc" 1 3))    ; "bc"
(simplify (str.substr "abc" 2 1))    ; "c"
(simplify (str.substr "abc" 3 1))    ; ""
(simplify (str.substr "abc" 4 1))    ; (str.substr "abc" 4 1)
(simplify (str.contains "ab" "abc"))   ; true
(simplify (str.contains "bc" "abc"))   ; true
(simplify (str.contains "abc" "abc"))  ; true
(simplify (str.contains "" ""))        ; true
(simplify (str.contains "a" ""))       ; false
(simplify (str.at "abc" 0))   ; "a"
(simplify (str.at "abc" 1))   ; "b"
(simplify (str.at "abc" 2))   ; "c"
(simplify (str.at "abc" 3))   ; (str.charat "abc" 3)
(simplify (str.replace   "abc" "b" "c")) ; "acc"
(simplify (int.to.str 1))           ; "1"
(simplify (int.to.str 100))         ; "100"
(simplify (str.to.int "1"))         ; 1
(simplify (str.to.int "a"))         ; (str.stoi "a")
(simplify (str.indexof "aabbcc" "b" 1)) ; 1
(simplify (str.indexof "aabbcc" "b" 2)) ; 0
(simplify (str.indexof "aabbcc" "bc" 2)) ; 1
(simplify (str.indexof "aabbcc" "d" 0)) ; (- 1)



