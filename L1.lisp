;) a) Write twice the n-th element of a linear list. Example: for (10 20 30 40 50) and n=3 will produce (10
; 20 30 30 40 50).

; Mathematical model:
;   writeTwice(l1l2..ln,k) = 
;        () , if n = 0
;        l1 v l1 v writeTwice(l2l3...ln,k-1), if k=1
;        l1 v writeTwice(l2l3..ln,k-1), otherwise
(defun writeTwice(L K)
  (cond
   ((equal L NIL) L)
   ((equal K 1) (cons (car L) (cons (car L) (writeTwice (cdr L) (- K 1) ))))
   (t(cons (car L) (writeTwice (cdr L) (- K 1))))
)
)

; b) Write a function to return an association list with the two lists given as parameters.
;  Example: (A B C) (X Y Z) --> ((A.X) (B.Y) (C.Z)).

; Mathematical model:
;   associate(l1l2..ln,p1p2..pm) = 
;         NIL , if n = 0 and m=0
;        (NIL.p1) v associate(l1l2..ln,p2p3..pm), if n=0
;        (l1.NIL) v associate(l2l3..ln,p1p2..pm), if m=0
;        (l1.p1) v writeTwice(l2l3...ln,p2p3..pm), otherwise
(defun associate(L P)
  (cond
   ((and (equal L NIL) (equal P NIL)) NIL)
   ((equal L NIL) (cons (cons NIL (CAR P)) (associate L (cdr P))))
   ((equal P NIL) (cons (cons (CAR L) NIL) (associate (cdr L) P)))
   (t(cons (cons (CAR L) (CAR P)) (associate (cdr L) (cdr P))))
  )
)


;c) Write a function to determine the number of all sublists of a given list, on any level.
; A sublist is either the list itself, or any element that is a list, at any level. Example:
;(1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 lists:
;(list itself, (3 ...), (4 5), (6 7), (9 10)).

; Mathematical model:
;   subList(l1l2..ln) = 
;        1 , if n = 0
;        subList(l2l3..ln), if l1-atom
;        1 + (subList(l1) - 1) + subList(l2l3..ln), otherwise
(defun subList(L)
  (cond
   ((equal L NIL) 1)
   ((atom (car L)) (subList (cdr L))) 
   ((not (atom (car L))) (+ 1 (+ (- (subList (car L)) 1) (subList (cdr L)))))
  )
)

; d) Write a function to return the number of all numerical atoms in a list at superficial level.

; Mathematical model:
;   noNumericalAtoms(l1l2..ln) = 
;        0 , if n = 0
;        1 + noNumericalAtoms(l2l3..ln), if l1-numerical atom
;        noNumericalAtoms(l2l3..ln), otherwise
(defun noNumericalAtoms(L)
  (cond 
    ((equal L NIL) 0)
    ((numberp (car L)) (+ (* 1 (car L)) (noNumericalAtoms(cdr L))))
    (t(noNumericalAtoms (cdr L)) )
  )
)

