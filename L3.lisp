; Solve the following problem using MAP functions
; 4) Write a function that returns the product of numeric atoms in a list, at any level


; Mathematical model:
;    productNumericAtoms(L) = 
;                  L , if L - is a number
;                  1 , if L - is an atom
;                  productNumericAtoms(l1) * producNumericAtoms(l2) * ... * productNumericAtoms(ln) , if L - is a list of size n
(defun productNumericAtoms(L)
  (cond
     ((numberp L) L)
     ((atom L) 1)
     (t(apply '* (mapcar #'productNumericAtoms L) )) 
  )
)

