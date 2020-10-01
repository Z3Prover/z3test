(echo "====== regex solving checks ======")

(echo "==== simple cases ====")

(echo "== 1 (trivial sat, no unfolding needed) ==")
(push)
(declare-fun s () String)
(assert (str.in_re s (re.* (str.to_re "a"))))
(check-sat)
(pop)

(echo "== 2 (sat with many right-derivatives) ==")
(push)
(declare-fun s () String)
(assert (str.in_re (str.++ s "aaaaabbbbbcccccaaaaa") (re.++ (re.* (str.to_re "a")) (re.+ (str.to_re "b")) (str.to_re "ccccc") (re.* (str.to_re "a")))))
(check-sat)
(pop)

(echo "== 3 (sat with counting) ==")
(push)
(declare-const x String)
(assert (str.in_re x ((_ re.^ 5) (str.to_re "bazz"))))
(check-sat)
(pop)

(echo "== 4 (sat, example adapted from 4478) ==")
(push)
(declare-fun s () String)
(assert (str.in_re s (re.++ (re.* (str.to_re "a")) (str.to_re "bbbbbbbbbbbbbbbbbbbb"))))
(check-sat)
(pop)

(echo "==== intersection examples ====")

(echo "== 1 (unsat intersection) ==")
(push)
(declare-const x String)
(assert (str.in_re x
    (re.inter
        (re.* (str.to_re "ab"))
        (re.++ (str.to_re "a") (re.* (str.to_re "ba")))
)))
(check-sat)
(pop)

(echo "== 2 (unsat intersection) ==")
(push)
(declare-const x String)
(assert (str.in_re x
    (re.inter
        (re.* (str.to_re "aaa"))
        (re.++ (str.to_re "a") (re.* (str.to_re "aaa")))
)))
(check-sat)
(pop)

(echo "== 3 (unsat intersection, with equality) ==")
(push)
(assert (not (=
    re.none
    (re.inter
        (re.++ re.all (str.to_re "a"))
        (re.+ (str.to_re "b"))
    )
)))
(check-sat)
(pop)

(echo "== 4 (unsat intersection) ==")
(push)
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.++ (re.++ (re.* (str.to_re "b")) (str.to_re "a")) (re.* (str.to_re "b"))) (re.++ (re.++ (re.++ (re.++ re.all (str.to_re "b")) re.all) (str.to_re "b")) re.all)) (re.* (str.to_re "ab")))))
(check-sat)
(pop)

(echo "== 5 (unsat example from Zelkova FMCAD18 paper) ==")
(push)
;---
; .NET regular expressions restricted to 7-bit characters
; membership in
; (?(ab.*b.*b.*b)(?(a.*b.*b.*b)[0-[0]]|.*)|[0-[0]])
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (str.to_re "ab") re.all) (str.to_re "b")) re.all) (str.to_re "b")) re.all) (str.to_re "b")) (re.union (re.inter (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (str.to_re "a") re.all) (str.to_re "b")) re.all) (str.to_re "b")) re.all) (str.to_re "b")) re.none) (re.inter (re.comp (re.++ (re.++ (re.++ (re.++ (re.++ (re.++ (str.to_re "a") re.all) (str.to_re "b")) re.all) (str.to_re "b")) re.all) (str.to_re "b"))) re.all)))))
(check-sat)
(pop)

(echo "==== complement examples ====")

(echo "== nonemptiness (trivial sat) ==")
(push)
(declare-const x String)
(assert (str.in_re x (re.comp (re.++ (re.++ re.all (str.to_re "a")) ((_ re.^ 8) re.allchar)))))
(check-sat)
(pop)

(echo "== inclusion (sat) ==")
(push)
(assert (= re.empty (re.diff ((_ re.^ 7) re.allchar) (re.comp (re.++ (re.++ re.all (str.to_re "a")) ((_ re.^ 7) re.allchar))))))
(check-sat)
(pop)

(echo "== inclusion (unsat) ==")
(push)
(assert (= re.empty (re.diff ((_ re.^ 9) re.allchar) (re.comp (re.++ (re.++ re.all (str.to_re "a")) ((_ re.^ 8) re.allchar))))))
(check-sat)
(pop)

(echo "== inclusion (sat) ==")
(push)
(declare-const x String)
(assert(str.in_re x (re.diff (re.++ (re.+ (re.union (re.union (re.union (re.range "0" "9") (re.range "A" "Z")) (str.to_re "_")) (re.range "a" "z"))) (re.+ (re.range "0" "9"))) (re.++ (re.+ (re.range "0" "9")) (re.+ (re.union (re.union (re.union (re.range "0" "9") (re.range "A" "Z")) (str.to_re "_")) (re.range "a" "z")))))))
(check-sat)
(pop)

(echo "== nested complements (unsat) ==")
(push)
(declare-const x String)
(assert (str.in_re x (re.comp (re.* (re.comp (str.to_re "cab"))))))
(check-sat)
(pop)

(echo "==== examples hard for deterministic blowup ====")

(echo "== 1 (unsat) ==")
(push)
(declare-const x String)
(assert (str.in_re x (re.inter
    (re.++ re.all (str.to_re "a") ((_ re.^ 10) re.allchar))
    (re.++ re.all (str.to_re "b") ((_ re.^ 10) re.allchar))
)))
(check-sat)
(pop)

(echo "== 2 (sat) ==")
(push)
(declare-const x String)
(assert (str.in_re x
    (re.+ (re.++ re.all (str.to_re "a") ((_ re.^ 100) re.allchar)))
))
(check-sat)
(pop)

(echo "== 3 (unsat) ==")
(push)
;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*\d.{20}
; .*[^\d].{20}
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.++ (re.++ re.all (re.range "0" "9")) ((_ re.^ 20) re.allchar)) (re.++ (re.++ re.all (re.union (re.range (_ char #x0) "/") (re.range ":" (_ char #x7F)))) ((_ re.^ 20) re.allchar)))))
(check-sat)
(pop)

(echo "==== cases with string expression in RE ====")

(echo "== 1 (unsat) ==")
(push)
(declare-fun a () String)
(declare-fun b () String)
(assert (str.in_re (str.++ a "A" b) (re.* (str.to_re "B"))))
(check-sat)
(pop)

(echo "== 2 (unsat) ==")
(push)
(declare-fun a () String)
(declare-fun b () String)
(declare-fun f () Bool)
(assert (str.in_re (str.++ a (ite f "A" "CC") b) (re.* (str.to_re "B"))))
(check-sat)
(pop)

(echo "==== symbolic cases: string or regex variable ====")

(echo "== symbolic 1 (string var, sat) ==")
(push)
(declare-const x String)
(assert (str.in_re x (re.+ (str.to_re x))))
(check-sat)
(pop)

(echo "== symbolic 2 (regex var, sat) ==")
(push)
(declare-const x String)
(declare-const r (RegEx String))
(assert (str.in_re x r))
(check-sat)
(pop)

(echo "== symbolic 3 (regex var, unsat, simple substitution) ==")
(push)
(declare-const x String)
(declare-const R (RegEx String))
(assert (= R re.none))
(assert (str.in_re x R))
(check-sat)
(pop)

(echo "==== password constraint examples ====")

(echo "== 1 (sat) ==")
(push)
;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .*[0-9].*
; .*[A-Z].*
; .{8,20}
; (?(.*0.*O.*)[0-[0]]|.*)
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ (re.++ re.all (re.range "0" "9")) re.all)) (re.++ (re.++ re.all (re.range "A" "Z")) re.all)) ((_ re.loop 8 20) re.allchar)) (re.union (re.inter (re.++ (re.++ (re.++ (re.++ re.all (str.to_re "0")) re.all) (str.to_re "O")) re.all) re.none) (re.inter (re.comp (re.++ (re.++ (re.++ (re.++ re.all (str.to_re "0")) re.all) (str.to_re "O")) re.all)) re.all)))))
(check-sat)
(pop)

(echo "== 2 (sat) ==")
(push)
;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .*[0-9].*
; .*[A-Z].*
; .{8,20}
; (?(mypass1)[0-[0]]|.*) ; COMMENT: complement(mypass1)
; (?(mypass2)[0-[0]]|.*) ; COMMENT: complement(mypass2)
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.inter (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ (re.++ re.all (re.range "0" "9")) re.all)) (re.++ (re.++ re.all (re.range "A" "Z")) re.all)) ((_ re.loop 8 20) re.allchar)) (re.union (re.inter (str.to_re "mypass1") re.none) (re.inter (re.comp (str.to_re "mypass1")) re.all))) (re.union (re.inter (str.to_re "mypass2") re.none) (re.inter (re.comp (str.to_re "mypass2")) re.all)))))
(check-sat)
(pop)

(echo "== 3 (unsat) ==")
(push)
;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .{8-10}
; .{11-20}
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ re.allchar (str.to_re "{8-10}"))) (re.++ re.allchar (str.to_re "{11-20}")))))
(check-sat)
(pop)

(echo "== 4 (unsat) ==")
(push)
;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; .*[a-z].*
; .*[0-9].*[0-9].*
; .*[A-Z].*
; .*[$!@#%^&*()].*
; .{1,4}
;---
(declare-const x String)
(assert (str.in_re x (re.inter (re.inter (re.inter (re.inter (re.++ (re.++ re.all (re.range "a" "z")) re.all) (re.++ (re.++ (re.++ (re.++ re.all (re.range "0" "9")) re.all) (re.range "0" "9")) re.all)) (re.++ (re.++ re.all (re.range "A" "Z")) re.all)) (re.++ (re.++ re.all (re.union (re.union (re.union (re.union (str.to_re "!") (re.range "#" "&")) (re.range "(" "*")) (str.to_re "@")) (str.to_re "^"))) re.all)) ((_ re.loop 1 4) re.allchar))))
(check-sat)
(pop)

(echo "==== date constraint examples ====")

(echo "== minimal jan/feb/jul (sat) ==")
(push)
;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; [0-3][0-9]-[a-zA-Z]{3}-[0-9]{4}
; (.*(jan|feb|jul).*)
; complement([012].*feb.*)
;---
(declare-const x String)
(assert (str.in_re x (re.inter
    (re.++
        (re.range "0" "3")
        (re.range "0" "9")
        (str.to_re "-")
        ((_ re.^ 3) (re.union (re.range "A" "Z") (re.range "a" "z")))
        (str.to_re "-")
        ((_ re.^ 4) (re.range "0" "9")))
    (re.++
        re.all
        (re.union (str.to_re "jan") (str.to_re "feb") (str.to_re "jul"))
        re.all)
    (re.complement
        (re.++
            (str.to_re "3")
            re.all
            (str.to_re "feb")
            re.all))
)))
(check-sat)
(pop)

(push)
(echo "== minimal jan/feb/jul (unsat) ==")
;---
; .NET regular expressions restricted to 7-bit characters
; membership in intersection of
; [0-3][0-9]-[a-zA-Z]{3}-[0-9]{4}
; (.*(jan|feb|jul).*)
; complement([012].*feb.*)
;
; concatenated with a+, then intersected with .{11}b*
; to keep roughly the same state space, but unsat
;---
(declare-const x String)
(assert (str.in_re x (re.inter
    (re.++
        (re.inter
            (re.++
                (re.range "0" "3")
                (re.range "0" "9")
                (str.to_re "-")
                ((_ re.^ 3) (re.union (re.range "A" "Z") (re.range "a" "z")))
                (str.to_re "-")
                ((_ re.^ 4) (re.range "0" "9")))
            (re.++
                re.all
                (re.union (str.to_re "jan") (str.to_re "feb") (str.to_re "jul"))
                re.all)
            (re.complement
                (re.++
                    (str.to_re "3")
                    re.all
                    (str.to_re "feb")
                    re.all))
        ) (re.+ (str.to_re "a")))
    (re.++ ((_ re.^ 11) re.allchar) (re.* (str.to_re "b")))
)))
(check-sat)
(pop)
