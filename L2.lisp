
; Mathematical model:
;     add(l1l2...ln,p1,k) = 
;             l1l2...ln ,          if p = NIL
;             ((p1)) ,             if l = NIL
;             (p1) v l1l2..ln,     if k = 0
;             (p1 v until_nthElementList(l1l2..ln,k)),    if after_nthElementList(l1l2..ln,k) = NIL
;             (p1 V until_nthElementList(lnln-1...l1)) v rev(after_nthElementList(lnln-1..l1,k)),   otherwise
(defun add(L P N)
  (cond 
    ((equal P NIL) L)
    ((equal L NIL ) (list (list P)))
    ((equal N 0)(cons (list P) L))
    ((equal (after_nthElementList L N) NIL ) (list (append (list P) (until_nthElementList L N))))
    (t(append (list (append (list P) (until_nthElementList (rev L) N) )) (rev (after_nthElementList (rev L) N ))))

  )
)

; Mathematical model:
;   until_nthElementList(l1l2..ln,k) = 
;        NIL , if n = 0
;       (l1), if k = 1
;       (l1) + until_nthElementList(l2l3..ln,k-1), otherwise
(defun until_nthElementList(L N)
 (cond
  ((equal L NIL) NIL)
  ((equal N 1) (list (car L)))
  (t(append (list (car L)) (until_nthElementList (cdr L) (- N 1))))  
 )
)



; Mathematical model:
;  after_nthElementList (l1l2..ln, k) = 
;       NIL, if n = 0
;       l2l3...ln , if k = 1
;       after_nthElementList(l2l3...ln,k-1), otherwise
(defun after_nthElementList(L N)
 (cond 
   ((equal L NIL) NIL)
   ((equal N 1) (cdr L))
   (t(after_nthElementList (cdr L) (- N 1)))
 )
 )



; Mathematical model:
;  rev(l1l2..ln) = 
;      () , if n = 0
;      rev(l2..ln) + (l1), otherwise
(defun rev(L)
 (cond
   ((equal L NIL) '())
   (T(append (rev (cdr L)) (list (car l))))
 )
)


; Mathematical model:
;  changeType(l1l2...ln, k , p1p2..pm)
;   p1,                                         if n = 0
;   changeType(lnln-1..l1, 1 ,()),                if k = 0
;   changeType(ln-2ln-3..l1,1,add(P,l2,l1))),   if l1 - numerical atom
(defun changeType(L V P)
  (cond
    ((equal L NIL) (car P))
    ((equal V 0) (changeType (rev L) '1 '()))
    ((numberp (car L)) (changeType (cdr (cdr L)) '1 (add P (car (cdr L)) (car L)))) 
  )
)


